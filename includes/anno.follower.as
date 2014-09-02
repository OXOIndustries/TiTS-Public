import classes.Util.InCollection;

// Anno has been recruited and is currently on the players ship.
function annoIsCrew():Boolean
{
	if (flags["ANNO_CREWMEMBER"] == 1) return true;
	return false;
}

// Annos recruitment process hasn't yet been completed
function annoNotRecruited():Boolean
{
	if (flags["ANNO_CREWMEMBER"] == undefined) return true;
	return false;
}

// Anno has been recruited but isn't currently on the players ship
function annoNotCrew():Boolean
{
	if (flags["ANNO_CREWMEMBER"] == 2) return true;
	return false;
}

function annoFollowerHeader():void
{
	author("Savin");
	showBust("ANNO");
	showName("\nANNO");
}

// Hook this into Tarkus' ship hangar room
function returnToShipAfterRecruitingAnno():Boolean
{
	if (flags["ANNO_CREWMEMBER"] == 1 && flags["ANNO_CREWMEMBER_INITIALSCENE"] == undefined)
	{
		flags["ANNO_CREWMEMBER_INITIALSCENE"] = 1;

		clearOutput();
		annoFollowerHeader();

		// AnnoQuest variant
		if (flags["TARKUS_DESTROYED"] == undefined)
		{
			output("“<i>Hey, boss!</i>” Anno shouts over the commotion of the bustling landing strip, waving a hand over the sea of raskvel milling about around her. You wade through them over to your ship and wrap Anno up in a tight hug when you reach her. She giggles and nuzzles her cheek against your shoulder, tail going ninety miles an hour behind her. ");

			output("\n\nYou bring down the crew ramp and spend the next few minutes helping Anno get her things aboard: she packed anything but light, that’s for sure. Weapon cases, boxes of spare parts, and more datapads and computers than you can shake a hard drive at. “<i>For the company,</i>” she explains as she’s helping you move a particularly heavy box aboard. “<i>Part of the agreement is that I set up a roving kiosk on board. Where you go, I move product. Which, of course, means that </i>you<i> have easy access to the company’s inventory. Convenient, huh?</i>”");

			output("\n\n“<i>Nice,</i>” you say, dropping the box on the bed in what you’ve determined to be Anno’s quarters. ");

			output("\n\n“<i>Yep! Just gimme a poke if you need anything,</i>” she says, grinning as she pulls out a very large, rounded metal casing from the box. “<i>They even set me up with some limited fabrication tech, so we shouldn’t have to stop for new inventory too often. This baby’ll turn a brick of raw material into a rifle or a shield belt in the blink of an eye. Assuming it works better than the one they sent me back on Tarkus, anyway. Stupid thing choked on a carbon brick the first day.</i>”");
		}
		// Planet dun assplode
		else
		{
			output("“<i>Hey, boss!</i>” Anno shouts over the commotion of the bustling landing strip, waving a hand over the sea of raskvel milling about around her. You wade through them over to your ship, wrapping Anno up in a tight hug when you reach her. She giggles and nuzzles her cheek against your shoulder, tail going ninety miles an hour behind her. ");

			output("\n\n“<i>I put in my resignation while I was waiting. Corporate said they’re sad to see me go, don’t let the door hit me on the way out, all that. Fuckers.</i>”");

			output("\n\nAnno sighs, and for the first time you notice she’s changed outfits since you last saw her: the black and yellow company uniform is gone, replaced with a simple shirt and jeans. Her belongings amount to not much more than a backpack and a duffel bag slung over one shoulder. At least she travels light. You pull down the boarding ramp and escort Anno aboard, leading her into one of the spare quarters on your ship. ");

			output("\n\n“<i>God, I can’t wait to get out of here,</i>” she says, dropping her bag on her new bed. “<i>Fuck Tarkus, fuck Novahome, and fuck Steele Tech. For now, anyway.</i>”");

			output("\n\nAnno flops down on the bed and kicks her shoes off with a heavy sigh. “<i>You’re the best, [pc.name]. Thanks again for getting me out of here.</i>”");

			output("\n\n“<i>No problem,</i>” you say, sitting down on the bed beside her and patting her thigh. ");

			output("\n\n“<i>Oh, hey,</i>” Anno says, sitting back up and grabbing her bag. “<i>I managed to take a lot of my personal inventory and research material with me. I’ve still got some of my gray goo samples, some of the questionably-legal things folks sold me at the store, that sort of thing. And I was thinking: if you want me to stick around on the crew... I’ve still got some friends at Akkadi, plus I know a few guys from the good ol’ days who’ve got some pretty sweet connections. If you want, I can try and get ahold of some of them. I could keep a pretty good stock on the ship for you");
			if (crew(true) > 1) output(" and the crew");
			output(". Wouldn’t charge you over my cost, cross my heart.</i>”");

			output("\n\nNow that could be useful...");
		}

		// Combine
		if (!celiseIsCrew())
		{
			output("\n\n“<i>Alright, I think I’ve got everything aboard. Just give me a little bit to settle in and I’ll be good to go.</i>”");

			output("\n\nYou nod and, sneaking in one last quick kiss, leave Anno to unpack her belongings.");
		}
		else
		{
			output("\n\n“<i>As you’re finishing up with Anno, you hear a wet, squirming sound from the corridor outside. You turn around just in time to see a familiar green blob worming its way under the door.");
			
			output("\n\n“<i>ANNO!</i>” Celise cheers, grinning from ear to ear when she lays eyes on the ausar.");
			
			output("\n\n“<i>Holy crap... Celise? What’re you doing here?</i>” Anno asks, happily accepting a hug from the jubilant goo-girl.");

			output("\n\n");
			if (silly) output("“<i>Tricky ");
			output("Vic left me on the ship for [pc.him],</i>” she answers, shifting over to put an arm around your shoulder. “<i>I think Mr. Steele didn't want [pc.him] to get lonely.</i>”");

			output("\n\nAnno chuckles. “<i>Aww, that’s sweet. Gosh, it’s been ages, Cel. We’ve got a lot of catching up to do!</i>”");

			output("\n\nCelise nods eagerly. You pat the girls on the shoulders and leave them to catch up from since... whenever it is they met.");
		}

		currentLocation = "SHIP INTERIOR";
		flags["ANNO_CREWMEMBER_INITIALSCENE"] = 1;

		processTime(5+rand(3));

		clearMenu();
		addButton(0, "Next", mainGameMenu);

		return true;
	}
	return false;
}

function annoFollowerApproach():void
{
	clearOutput();
	annoFollowerHeader();

	if (hours >= 6 && hours <= 11 || hours >= 14 && hours <= 20) output("You give a light rap on Anno’s door, and are quickly let in. “<i>Hey, boss!</i>” she says with a smile, ushering you in. ")
	else if (hours >= 12 || hours <= 13)
	{
		output("“<i>[pc.name]!</i>” she shouts over the din of a loud pop jam blaring from her computer, “<i>I didn’t see you there. I hope you didn’t mind my singing. It's a new one from " + RandomInCollection("Touch Fluffy Tail", "The Beagles", "Playing Poker", "Buried Treasure") + " that I haven’t been able to get out of my head.</i>”");
		output("\n\nShe gives you an apologetic grin as she flips the music off.");
	}
	else output("You give a light rap on Anno’s door, which rocks back on its hinges, unlocked. Anno's sleeping face-down on her desk. You give her a little poke, which quickly has her jerking her head up and rubbing the sleep from her eyes. “<i>Oh, shit. What time is it?</i>”");

	if (!haveFuckedAnno()) output("\n\n“<i>So what’s up? You need anything?</i>”");
	else
	{
		output("\n\nAnno plops down on the side of her bed, arms spread back to support her... which has the added bonus of thrusting her chest out against");
		if (anno.armor is AnnosCatsuit) output(" the half-zipped front of her catsuit");
		else output(" the low-cut neck of her blouse");
		output(". “<i>Did you need something, babe?");
		if (pc.lust() >= pc.lustMax() * 0.8) output(" Maybe a little stress relief?");
		output("</i>”");
	}

	processTime(2);

	annoFollowerMenu();
}

function annoFollowerMenu():void
{
	clearMenu();
	addButton(0, "Buy", annoFollowerBuyMenu);
	addButton(1, "Sell", annoFollowerSellMenu);
	addButton(2, "Special Gear");

	addButton(5, "Talk");
	addButton(6, "EarScritch");
	addButton(7, "Sex");

	if (flags["ANNO_SLEEPWITH_INTRODUCED"] != undefined)
	{
		if (haveFuckedAnno())
		{
			if (flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") addButton(8, "No Sleep W.", annoSleepToggleOff, "Don't Sleep With", "Tell Anno you'd like to sleep without her for now.");
			else addButton(8, "Sleep With", annoSleepToggleOn, "Sleep With", "Tell Anno you'd like her to sleep with you in the evenings.");
		}
		else
		{
			addDisabledButton(8, "Sleep With", "Sleep With", "You could probably get a cuddly ausar bed-buddy if you had sex with her.");
		}
	}
	addDisabledButton(8, "Sleep With", "Sleep With", "A nice rest sounds good... maybe Anno might pay you a vist of her own accord in the process.");
	
	addButton(10, "Appearance");
	
	if (InCollection(shipLocation, "TAVROS HANGAR", "SHIP HANGAR", "201", "500")) addButton(13, "Evict", annoFollowerBootOff, "Evict from Ship", "Tell Anno to get off the ship. You might break her heart a little, but you'll probably be able to pick her up again later.");
	else addDisabledButton(13, "Evict", "Evict from Ship", "You can't bring yourself to kick Anno off your ship here. Head back to a mainline planet or station first.");

	addButton(14, "Back", crew);
}

function annoSleepWithIntroduce():void
{
	clearOutput();
	annoFollowerHeader();

	output("Just as you’re getting ready for bed, you hear a knock on your cabin door. When you tell your visitor to enter, the door slides open and Anno steps through. She’s ditched her usual outfit, and is instead wrapped up in a loose white bathrobe that her hair seamlessly blends into. ");

	output("\n\n“<i>Hey, boss,</i>” she says, the corner of her mouth turning up into a slight grin. Even then, you can’t ignore the touch of nervousness in her voice. “<i>So I was thinking... you know, we’ve, uh, we’ve done the deed. And now we’re basically living on the same ship. So, you know, I thought maybe... maybe you and I could share a bed?</i>”");

	processTime(2);

	clearMenu();
	addButton(0, "Yes", annoSleepWithSureICanDealWithDogslootFurAllInMyMouthInTheMorning);
	addButton(1, "No", annoSleepWithPlsNoDogslootsInMyBedIDontWantDogslootFurAllUpInMyShit);
}

function annoSleepWithPlsNoDogslootsInMyBedIDontWantDogslootFurAllUpInMyShit():void
{
	clearOutput();
	annoFollowerHeader();

	output("You shake your head. ");

	output("\n\n“<i>Ah,</i>” Anno says simply, shoulders slumping under her robe. “<i>Well, uh, never hurts to ask, right? Lemme know if you change your mind.</i>” ");

	output("\n\nWith that, she quickly retreats from your cabin, letting you get to bed.");

	processTime(2);

	clearMenu();
	addButton(0, "Next", sleep)
}

function annoSleepWithSureICanDealWithDogslootFurAllInMyMouthInTheMorning():void
{
	clearOutput();
	annoFollowerHeader();

	output("You smile at her, get up to step closer and slip your arms around her waist. “<i>I’d like that.</i>” ");
	
	output("\n\nShe grins. “<i>I was hoping you’d say that,</i>” she whispers, pulling at the tie on her bathrobe and letting the simple garment slip off her shoulders. Underneath, your ausar lover’s wearing a sinfully sheer babydoll in a bright orange hue that accentuates the snowy fur on her limbs, as well as the little strip around her glistening sex. Her hands guide yours down to her pantiless waist, then to the full swells of her ass. She gasps a little as you grope her, all but melting in your arms. ");
	
	output("\n\n“<i>What’re we waiting for?</i>” she mewls before gently pushing you towards the bed.");
	
	output("\n\nSmiling all the way, you pull your lover into your bed. ");

	flags["CREWMEMBER_SLEEP_WITH"] = "ANNO";

	processTime(2);

	clearMenu();
	addButton(0, "Next", sleep);
}

function annoSleepToggleOn():void
{
	clearOutput();
	annoFollowerHeader();
	
	output("“<i>Hey,</i>” you say, pulling Anno in close. “<i>What do you say you come to my cabin this evening...</i>”");
	
	output("\n\nAnno’s eyes go wide. “<i>You... you mean it?</i>” ");
	
	output("\n\nYou nod, and Anno squeals with delight. “<i>Awesome! I mean, uh, yeah. I’d like that, [pc.name].</i>”");

	flags["CREWMEMBER_SLEEP_WITH"] = "ANNO";

	processTime(2);

	clearMenu();
	addButton(0, "Next", annoFollowerMenu);
}

function annoSleepToggleOff():void
{
	clearOutput();
	annoFollowerHeader();

	if (!pc.isAss()) output("“<i>Think you could manage on your own tonight?</i>” you ask.");
	else output("“<i>Stay in your own bed tonight.</i>”");

	output("\n\n“<i>Oh,</i>” Anno says, ears tucking down. “<i>Uh, yeah, sure boss. Whatever you want. I was thinking of pulling an all-nighter anyway...</i>”");

	processTime(2);

	clearMenu();
	addButton(0, "Next", annoFollowerMenu);
}

function annoSleepSexyTimes():void
{
	clearOutput();
	annoFollowerHeader();

	output("Anno slips into your quarters just as you’re getting ready to hit the hay. She lets her bathrobe slip down from over her sheer nightie and onto the floor. She slides under the covers and props herself up on an elbow, watching you");
	if (!pc.isNude()) output(" undress");
	else output(" put the last of your [pc.gear]");
	output(" away with interest until you join her.");

	output("\n\n“<i>Hey,</i>” she murmurs as you climb into bed beside her. ");

	output("\n\n“<i>Hey");
	if (pc.isMischievous()) output(" yourself");
	output(",</i>” you answer, slipping an arm around Anno’s shoulders and pulling her close. Her tail wiggles happily as she snuggles up, head resting on your [pc.chest]. You softly stroke your lover’s perky ears and long, silky smooth hair as she nuzzles up to you, settling in after a few playful minutes.");

	flags["ANNO_SLEEPWITH_DOMORNING"] = 1;

	processTime(3);

	clearMenu();
	addButton(0, "Next", sleep, false);
}

function annoMorningRouter():void
{
	flags["ANNO_SLEEPWITH_DOMORNING"] = undefined;

	if (pc.hasCock() && rand(2) == 0) annoMorningHandy();
	annoMorningShower();
}

function annoMorningHandy():void
{
	clearOutput();
	annoFollowerHeader();

	output("<b>Your sleep is disturbed by vivid dreams</b> of sexual stimulation as the night draws out. Your mind conjures a field of well-endowed women who surround your naked form, fawning over your [pc.multiCocks] and eagerly worshipping your manhood. Their hands are soft, almost velveteen on your cock");
	if (pc.cocks.length > 1) output("s");
	output(", rubbing and stroking and cupping all along your cockflesh. Your erection grows almost painfully stiff, responding to their tender ministrations by offering ever more length for the gathering of women to explore.");
	
	output("\n\nYou wake with a gasp as your dream self is on the verge of orgasm, ready to blow [pc.hisHer] seed across the faces of a dozen busty women gathered around [pc.hisHer] cock. But the incredible sensation of velvety fingers caressing [pc.eachCock] doesn’t abate as your eyes flutter open. You cast a look down between your [pc.legs], and find a");
	if (pc.biggestCockLength() <= 7) output(" noticeable");
	else if (pc.biggestcockLength() <= 12) output(" sizable");
	else output(" massive");
	output(" tentpole under your sheets, a stain of pre-cum darkening the material immediately over your cockhead.");
	
	output("\n\n“<i>Morning, lover,</i>” you hear from beside you. You finally notice Anno up on an elbow and watching you with a cheeky smile on her lips. You lean over to kiss your companion good morning, and quickly find yourself interrupted by a world-rocking shudder of pleasure tearing through your body. Your just-waking mind finally realizes exactly what’s going on as Anno pulls the sheets aside, revealing her snowy-furred fingers wrapped tight around your turgid morning wood. ");
	
	output("\n\n“<i>... You’re one hell of an alarm clock, Anno,</i>” you breathe with a sigh before relaxing in your lover’s grasp as she jerks you off. She gives you a wink and finishes the kiss you tried and failed to start, her lips pressing against yours for the briefest moment. Anno moves to nuzzle her face against your shoulder and then rest on your [pc.chest]. You wrap an arm around her, stroking her soft hair almost to the beat of her wrist’s motions; both of you are firmly fixated on your [pc.cock]. You’re not sure how long Anno was working at it before you woke up, but you’re damn close to the edge now... all you can do is lie back and let her finish you off. With a smile, Anno looks up at you and winks, whispering sweet nothings in your [pc.ear] as she finishes you off. ");
	
	output("\n\nYou give a little grunt, arching your back off the bed as your orgasm hits. At the last possible second, Anno angles your cock down to aim the [pc.cockHead] at your [pc.belly] as you let loose. Your cum spurts out in a thick, hot wave; the gushing streaks of [pc.cumColor] splatter across your [pc.belly]");
	if (pc.cumQ() >= 1000) output(" and even reach up to your [pc.chest], covering your whole torso with a thick coating of your seed");
	output(".");
	
	output("\n\nWith a contented sigh, you collapse back onto the bed. Cum continues to trickle from your spent rod, dripping onto your [pc.belly] in hot, sticky droplets. ");
	
	if (pc.isMischievous()) output("\n\n“<i>Good morning to you too,</i>” you murmur.");
	
	output("\n\n“<i>Aww, you made me breakfast in bed!</i>” Anno coos, her blues eyes locked onto your still-twitching cock. She quickly slips down the length of your body, and her flat tongue traces along");
	if (pc.tone >= 70 && pc.thickness <= 30) output(" the hard lines of your muscles");
	else if (pc.tone >= 70) output(" the soft surface of your body");
	else if (pc.tone < 70 && pc.thickness <= 60 && pc.femininity >= 50) output(" the delicate curves of your body");
	else if (pc.tone < 50 && pc.thickness > 60 && pc.femininity >= 50) output(" the ample curves of your body");
	else output(" your [pc.skinFurScales]");
	output(", lapping up your orgasmic fluids as she goes. The next few minutes pass in bliss as your lover cleans up her mess, slurping up every drop of [pc.cumType] until you feel like you just stepped out of a warm, if slightly sticky, shower. ");
	
	output("\n\nYou give Anno a scratch between the ears when she finishes, thanking your favorite alarm ausar for starting your day off right.");

	pc.orgasm();

	processTime(20);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function annoMorningShower():void
{
	clearOutput();
	annoFollowerHeader();

	// What the fuck is this? WHAT THE FUCK IS THIS
	author("Gedan");

	output("You sleepily toss and turn in your bed, but you can't quite shake the feeling that something is missing. It takes a few minutes for your brain to actually kick back in to gear, slowly beginning to wake up, but you can't quite figure out what it is that’s wrong. You keep trying to wrap your arm around something that just isn't there, trying to snuggle in against a body that, for some reason, you expect to be tucked up against your [pc.chest].");

	output("\n\nYou shoot upright when you realise somebody’s missing - an empty spot on your mattress, still warm from the heat of a body recently occupying it.");

	output("\n\n“<i>Oh hey [pc.name],</i>” echos a greeting from your side. You turn to look and find Anno having just stepped out of your shower. She’s stood in the doorway to your bathroom, a towel wrapped around her body and another balled up around her hair. “<i>Sorry, I'm kind of an early riser - you don't mind me using your shower right?</i>”");

	output("\n\nShe takes a step out into your quarters, the towel wrapped around her body parting down the side of her leg to frame a view of glistening ausar thigh, and you can’t muster anything other than an appreciative grunt. You certainly don't mind her using your shower; especially if one of the perks is getting to wake up to this kind of view.");

	output("\n\n“<i>Down " + pc.mf("boy", "girl") + "!</i>” she responds whilst quickly stepping back into the bathroom, closing the door behind her. She keeps talking loud enough for you to hear her clearly, “<i>I've only just got myself dry - do you know how hard it is to dry fur? I'm not getting all sweaty and messy right after I've </i>just<i> got clean.</i>”");

	output("\n\nYou fall back down onto the mattress, still half asleep and now a little warm under the collar thanks to Anno’s impromptu skin-show. You must have drifted back to sleep, as it seems like only seconds later the telltale hiss of door hydraulics signals the white-haired ausar’s departure from the bathroom, this time clad in her");
	if (anno.armor is AnnosCatsuit) output(" deliciously tight catsuit");
	else output(" regular clothes");
	output(" rather than one of your towels.");

	output("\n\n“<i>All yours, Steele!</i>” she says, before bounding towards the main door to your quarters. “<i>See you later, yeah?</i>”");

	output("\n\nDid- did she blow you a kiss on her way out? The tease....")

	pc.lust(10);

	processTime(15);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function annoFollowerBootOff():void
{
	clearOutput();
	annoFollowerHeader();

	output("Looking at the eager-eyed ausar, you slowly spell out that you don’t want her on the ship anymore. It’s time to pack up and head out. ");
	
	output("\n\n“<i>But... what?</i>” Anno says, dumbfounded. She stares at you with wide eyes, her ears and tail curling close to her body as you tell her to leave. “<i>But I... but why? What’d I do wrong? I thought we were doing great...</i>”");
	
	output("\n\nShe bites her lip and lets out a pitiful little whine. “<i>Nevermind. It’s fine. I’ll, uh,");
	if (shipLocation != "TAVROS HANGAR") output(" I’ll hitch a ride to");
	else output(" stay here on");
	output(" Tavros, then. Kaede’s got a place up on the higher rings; I can just crash there for a while.</i>”");
	
	output("\n\nYou nod, and watch as Anno hurriedly collects her belongings. You get the distinct sense she’s trying not to cry as she scurries off your ship.");

	flags["ANNO_CREWMEMBER"] = 2;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") flags["CREWMEMBER_SLEEP_WITH"] = undefined;

	processTime(15);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function annoAtAnonsAddendum():void
{
	output("\n\nAnno is sitting at the bar, nursing a whiskey and working on a glowing datapad.");
	addButton(8, "Anno", annoFindingALostPooch);
}

function annoFindingALostPooch():void
{
	clearOutput();
	annoFollowerHeader();
	
	output("“<i>Hey, you,</i>” you say, planting a hand on Anno’s head. She spins around on her barstool, all but shrieking when you grab her. When she sees whom it is, though, her cry turns into one of barely contained excitement. She leaps up into your arms, squeezing you so tightly that you think you hear something crack.");

	output("\n\n“<i>Boss! You came back!</i>” she squeals, still hugging you. “<i>What's the plan, [pc.name]?</i>” she adds hopefully.");

	processTime(2);
	
	//[Come Aboard] [Not Now]
	clearMenu();
	addButton(0, "Come Aboard", annoFollowerLetThePoochShitUpYourShowerWithFurAgain);
	addButton(1, "Not Now", annoFollowerNoThanksIActuallyQuiteLikeMyShowerNotBeingFullOfDogfur);
}

function annoFollowerNoThanksIActuallyQuiteLikeMyShowerNotBeingFullOfDogfur():void
{
	clearOutput();
	annoFollowerHeader();
	
	output("Patting Anno on the head, you tell the eager puppy that you’re not quite ready for her to rejoin your crew. Her excitement bleeds off immediately.");

	output("\n\n“<i>Oh. Yeah, sure. No worries,</i>” she says, rubbing at her neck. “<i>I'm actually making good progress on my book, so no rush. Plenty of stuff to do around here.</i>”");

	output("\n\nYou give the girl a final scratch between the ears as she returns to her drink.");
	
	processTime(2);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function annoFollowerLetThePoochShitUpYourShowerWithFurAgain():void
{
	clearOutput();
	annoFollowerHeader();
	
	output("“<i>Ready to come home?</i>” you ask, scratching her between the ears.");

	output("\n\nShe grins, “<i>You know it. I missed you, boss.</i>”");

	output("\n\nA quick trip to her girlfriend’s apartment to collect her things, and you’re ready to go. Hand in hand, you guide Anno back aboard your ship. She settles in like she'd never been gone.");

	output("\n\n<b>Anno has joined your crew!</b>");
	
	currentLocation = "SHIP INTERIOR";
	
	processTime(30);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function annoFollowerBuyMenu():void
{
	clearOutput();
	annoFollowerHeader();

	//Note to Fen/Geddy: Anno has three Inventory tiers: Tarkus, Steele Tech, and Black Market. She'll always have access to the Tarkus inventory; Steele Tech or Black Market depends on whether or not you completed AnnoQuest or not.

	annoFollowerInventoryCheck();

	shopKeep = anno;
	anno.keeperBuy = "“<i>Want something from my stock, boss?</i>” Anno asks, picking up a datapad and handing it over to you. “<i>Here’s what’s in inventory at the moment.";
	if (flags["ANNO_MISSION_OFFER"] == 3) anno.keeperBuy += " Steele Tech’s still supplying us with top-tier equipment, and plenty of it.</i>”";
	else anno.keeperBuy += "My contacts might be a </i>little<i> more seedy these days, but the equipment they’re hooking me up with isn’t too far behind Steele Tech’s gear.</i>”";
	buyItem();
}

// Updates and configures Annos inventory depending on how she ended up on the players ship
function annoFollowerInventoryCheck():void
{
	if (flags["ANNO_MISSION_OFFER"] == 3)
	{
		// Check for the presence of a unique item, if not there, add all
		if (!anno.hasItem(new LaserCarbine()))
		{
			anno.inventory.push(new LaserCarbine());
			anno.inventory.push(new EMPGrenade());
			anno.inventory.push(new NovaRifle());
			anno.inventory.push(new NovaPistol());
			anno.inventory.push(new SteeletechSuit());
		}

		// Buy/Sell markups
		anno.sellMarkup = 0.85;
		anno.buyMarkdown = 1.0;
	}
	else
	{
		if (!anno.hasItem(new HammerCarbine()))
		{
			anno.inventory.push(new HammerCarbine());
			anno.inventory.push(new FlashGrenade());
			anno.inventory.push(new JoyCoPremiumShield());
			anno.inventory.push(new SteeletechSuit());
		}

		anno.sellMarkup = 1.1;
		annm.buyMarkdown = 0.85;
	}

	// Set her up so she can buy/sell everything
	anno.typesBought = [GLOBAL.ALL];
}

function annoFollowerSellMenu():void
{
	clearOutput();
	annoFollowerHeader();

	annoFollowerInventoryCheck();

	shopKeep = anno;
	anno.keeperSell = "“<i>Got something weighing you down, boss? I can";
	if (flags["ANNO_MISSION_OFFER"] == 3) anno.keeperSell += " send just about anything back to Steele Tech for a good profit. Perks of being a field merchant!";
	else anno.keeperSell += " fence just about anything through my friends. Just give me the word!";
	sellItem();
}

function annoFollowerTalkMenu(doOut:Boolean = true):void
{
	if (doOut)
	{
		clearOutput();
		annoFollowerHeader();

		output("“<i>Got a few minutes to chat?</i>” you ask before leaning against Anno’s desk.");
		
		output("\n\nShe smiles. “<i>Sure, boss. What’s on your mind?</i>”");
	}

	clearMenu();
	addButton(0, "Akkadi R&D", annoFollowerTalkAkkadi, undefined, "Akkadi Research & Development", "Ask Anno about her work before joining Steele Tech.");
	addButton(1, "Family", annoFollowerTalkFamily, undefined, "Annos Family", "Ask Anno about her family.");
	addButton(2, "Victor", annoFollowerTalkVictor, undefined, "Victor Steele", "Ask Anno about your father.");
	addButton(3, "Studies", annoFollowerTalkStudies, undefined, "Annos Studies", "Ask Anno about her education.");
	addButton(4, "Relationships", annoFollowerTalkRelationships, undefined, "Relationships", "Ask Anno about her love life.");
	addButton(5, "Steele Tech", annoFollowerTalkSteeleTech, undefined, "Steele Tech", "Ask Anno about her career at Steele Tech.");
	addButton(6, "Entertainment", annoFollowerTalkEntertainment, undefined, "Entertainment", "Ask Anno about her tastes in entertainment.");
	
	if (flags["ANNO_MISSION_OFFER"] == 3)
	{
		if (anno.armor is AnnosCatsuit) addButton(7, "Uniform", annoFollowerRemoveUniform, undefined, "Steele Tech Uniform", "Tell Anno she doesn’t need to wear her uniform all the time.");
		else addButton(7, "Uniform", annoFollowerWearUniform, undefined, "Steele Tech Uniform", "Tell Anno she should put her uniform back on. It’s pretty sexy looking, after all.");
	}
	else
	{
		addDisabledButton(7, "Uniform", "Steele Tech Uniform", "Anno would need to have her uniform still to change into it!");
	}

	if (flags["ANNO_MISSION_OFFER"] != 3)
	{
		addButton(8, "Contacts", annoFollowerTalkContacts, undefined, "Shady Contacts", "Ask Anno about her shady contacts in the black market.");
	}
	else
	{
		addDisabledButton(8, "Contacts", "Shady Contacts", "Anno doesn't have need of her shady black market contacts whilst still employed by Steele Tech.");
	}
}

function annoFollowerTalkAkkadi():void
{
	clearOutput();
	annoFollowerHeader();

	output("“<i>Mind telling me a little about your old job?</i>”");
	
	output("\n\nAnno’s lips purse in thought. “<i>You mean Akkadi - the Warp Gates and all that? Sure, if you don’t mind a bit of a lecture. I may get carried away on the topic. I’ve written books on it, you know.</i>”");
	
	output("\n\nYou urge her to continue. ");
	
	output("\n\n“<i>Alright, so you know the ausar invented the Warp Gates. Took us centuries of slow-boating between the star-kingdoms to finally get it working, and may or may not have invented interstellar war immediately afterwards. But it was still a huge breakthrough, no matter how much we abused it. I’m proud to say that one of my ancestors, Cyreon Dorna, was one of the project leaders at Akkadi when the Gates were created. Science runs strong in the Dorna family. Or at least being a nerd does, if you believe my sister.</i>”");
	
	output("\n\nAnno chuckles, leaning against the bulkhead as she talks. “<i>So yeah. After that, Akkadi became THE ausar science group, and has been ever since. Thanks to the family name, I got fast-tracked into Akkadi Research and Development during college, before I even had my doctorate.</i>” She shrugs, her smile fading somewhat. “<i>I can’t say I’m proud of the why of getting my job there, but you don’t turn down a job in the galaxy’s biggest technology firm, especially when your invitation comes from the desk of the king of Ausaril.</i>”");
	
	output("\n\n“<i>So I ended up working at Akkadi at the tender age of twenty two. I got pushed into the FutureTech group pretty quickly, and from there to working on military projects. Advanced shield generators for starships, the next generation hover-tank for the army, even reverse-engineering some primitive powered exoskeleton prototypes. But my real passion was the Warp Gates: I published my doctoral thesis from inside Akkadi, all about advancing Gate tech. That got somebody’s attention, and pretty soon I had my own lab and team to work with.</i>”");
	
	output("\n\nAnno grins at that. “<i>Fun times. Definitely made my folks proud. Anyway, did you know that Gate tech’s basically been static for the last fifteen hundred years? Once we got them working, that was pretty much it for Gate tech. Sure, we make the casings that float around in space sturdier, update the software from time to time, but the amazing fucking technology that shoots you across the galaxy in the blink of an eye? Nah, it works, let’s leave it alone. Hell, the gates in the core are basically running off computers and hardware that haven’t been updated in a millennium -- you better hope to God if they break, somebody in-system knows how to fix it.</i>” She chuckles, shaking her head at the thought. “<i>So, anyway, I rustled some feathers with my paper about starting to update and expand on the core tech powering the Gates. ");
	
	output("\n\n“<i>First step: micro-ize the tech. There’s no reason for the Gates to be so damn big, right? Maybe a thousand years ago we needed capital-ship sized platforms for the tech, but nowadays it’s all about microchips so small you can’t even see them, plus holo and hardlight mechanisms. So we spent about a year working to miniaturize the Gates, with a little help from the Joint Ausar Fleet’s R&D, who immediately saw the potential for transmat on the individual scale: imagine being able to invade a planet from orbit, but completely bypassing the planet’s air-to-ground defenses. You just truck into orbit and warp your troops and material behind enemy lines. It could have revolutionized warfare, much less personal travel and planetary transportation. God, imagine standing on Ausaril, then just stepping through a door frame and onto Terra? We could have changed the </i>galaxy!<i>.</i>”");
	
	output("\n\nWow. “<i>What happened?</i>” you ask.");
	
	output("\n\nShe shrugs and sighs. “<i>We done fucked up. The Fleet pushed us to biological testing too quickly, before we had a complete sample pool. My team got bullied into trying a field test way before we were ready to go: tried to warp a special forces squad into a hostage scenario. One of the King’s kids had been taken by religious fanatics pissed that she’d ditched her dying body for cyberware. Threatening to execute her on live extranet feed. You might have seen it on the news, maybe four years ago? We tried to put six operators in, ended up getting two on the ground, both fucked up pretty badly. No idea where the other four even went. Probably dead.");
	
	output("\n\n“<i>At least the princess managed to get out in the confusion. Scared the shit out of the bastards, bought a few seconds -- enough time for our ground team to kick the door in and put them down.");
	
	if (syriFriendsWithBenefits())
	{
		output("</i>”");

		output("\n\n“<i>That’s... not what Syri told me.</i>”");
	
		output("\n\n“<i>Syri wasn’t involved until after. Some son of a bitch in the Admiralty thought we’d sort the problem out in a hurry if it was my sister going through next time. Turns out that no, science doesn’t work that way. Assholes. At least she </i>survived<i>, unlike the other guy that went through in the second test.</i>” Anno rubs her temples, sighing. “<i>I got out right after that.");
	}

	output(" Your dad helped me out of a tough spot after that... I was in a pretty bad place. Gave me a chance to come work for his company, to work without... </i>that<i> hanging over me, without brass breathing down my neck about my projects.</i>”");

	annoFollowerTalkMenu(false);
	removeButton(0);
	processTime(10+rand(5));
}

function annoFollowerTalkFamily():void
{
	clearOutput();
	annoFollowerHeader();

	output("“<i>My family?</i>” Anno asks when you broach the topic. “<i>Well, there’s me, my sister, and our parents. I’ve got a pretty big extended family, too, especially on my dad’s side. More cousins, aunts, and uncles than I can count. But they’re not who you’re asking about, are they?</i>”");
	
	output("\n\nShe chuckles at that. “<i>Right, so uh, my dad’s big into business. Holds a lot of shares in Akkadi, JoyCo, even Steele Tech. You know the type, I’m sure: wealthy socialite, throws the annual charity ball at year’s end for all the other wealthy socialites. He might not be the bad-ass adventurer your dad was, but mine’s still a good guy. Kind, always telling us how proud he is. The kind of man who spends more time thinking up ways to give things away then being a ruthless businessman. Pretty much the opposite of my mom: she’s the business hound of the family. Pulled herself up by the bootstraps. Definitely the one Syri took after. Tough as nails, always pushing us to do better. Pushed </i>hard<i> to get me into a good school, then Akkadi.");
	
	output("\n\n“<i>You’d like them,</i>” she adds with a smile. “<i>I couldn’t have asked for better parents.</i>”");
	
	output("\n\nShe lets out a long breath and leans back, resting her head in her hands. “<i>And then you have my sister, Syri. There’s a good Terran expression for her... black sheep! I can’t imagine her turning out any more... not how our parents wanted. She got the same full ride to the Ausaril School of Technology that I did, and she immediately threw it in their faces and enlisted in the Fleet.</i>” Anno shakes her head, exasperated. “<i>You know, I can see where she was coming from. I still don’t know how I feel about letting the family name carry me through school and all, but didn’t exactly feel the need to tell my folks to get fucked, either.");
	
	output("\n\n“<i>But that’s Syri for you. She gets so worked up about things. ‘Passionate,’ dad called her,</i>” Anno says with a laugh. “<i>For twins, we really couldn’t be more different. She’s a scary, angry marine lady; I’m a laid-back desk jockey... but I love her to pieces.");
	if (syriIsCrew()) output(" I’m glad we’ve had a chance to get closer here on the ship. I’ve missed her the last couple of years");
	else output("“<i>I wish we hadn’t grown apart so much the last couple of years. But that’s what you get for working on different sides of the galaxy, I guess");
	output(".</i>”");

	annoFollowerTalkMenu(false);
	removeButton(1);
	processTime(5+rand(3));
}

function annoFollowerTalkVictor():void
{
	clearOutput();
	annoFollowerHeader();
	
	output("“<i>Think you could tell me a little about my Dad?</i>” you ask, remembering Anno’s... experience with your father.");
	
	output("\n\nShe grins. “<i>Sure, [pc.name]. I didn’t know him </i>that<i> well, though. Mostly through work, to be honest, though he kept close tabs on me while I was getting settled in at Steele Tech R&D. He was a good guy... you could see the kindness in his eyes. And the age. Have you ever looked an elephant in the eye? Your dad had that same look, like he’d seen eternity and just smiled as it passed him by.</i>” ");
	
	output("\n\nAnno smiles, sliding her hand over yours. “<i>You know, he helped me out in a pretty bad time in my life. I was between jobs, basically living off convention speeches and my folks putting me up. He listened to one lecture I gave, not half an hour in a smoky hotel con room with maybe half a dozen washed-up eggheads in it, altogether. I guess he saw something in me. Or my work, anyway. Bought me a drink after my speech and, by night’s end, I had a ship ticket and a job waiting for me on Verdure at the R&D labs. I didn’t even realize until my first day on the job whom the hell I’d met.</i>” ");
	
	output("\n\n{if PC is Kind: “<i>You’re a lot like him, you know. You have that same kindness in your eyes.</i>” elseif Mischievous: “<i>He always had this amazing humor. That cunning way he’d talk, always circling around you, weaving words around you like a duelist feints.</i>” if Hard: “<i>He was a good man. I’ll never forget that. But he always had this hardness to him, like he was made of iron beneath that smile of his. You always had this impression it wouldn’t make him break a sweat to completely destroy you.</i>”}");
	
	output("\n\nAnno shrugs and smiles, slipping a comforting arm around your waist. “<i>I miss him too, [pc.name].</i>”");

	annoFollowerTalkMenu(false);
	removeButton(2);
	processTime(5+rand(3));
}

function annoFollowerTalkStudies():void
{
	clearOutput();
	annoFollowerHeader();

	output("“<i>So, where’d you go to school?</i>” you ask.");
	
	output("\n\nAnno beams. “<i>Ausaril Tech. Go Jackals, whooo!</i>” she cheers, half sarcastically. “<i>It was the best school for science on the homeworld, so that’s where I went. I was lucky enough to get into the military-sponsored program... kind of like the Terran-Space Coalition’s ‘officer candidate school,’ though it didn’t end up with me doing a tour of duty or anything. Mostly just reservist training, and helped get me military-grade clearance for later when I went to work at Akkadi.</i>”");
	
	output("\n\nShe takes a moment to flex her arm muscles in a mock bodybuilder’s pose. “<i>Also helped me get in shape, too. I was a pudgy little shit before, and now look at me -- I cut a pretty impressive figure, if I do say so myself!</i>” She gives you a playful wink before she resumes. ");
	
	output("\n\n“<i>Anyway, school. We ausar have always valued technology. Comes from living on a shitty desert planet that’s always trying to kill us. Tech made it possible for us to beat Mother Nature. Or at least escape her and find planets that sucked less. Ausaril Tech was the biggest and best technology academy, and I worked my ass off while I was there. Had my bachelor’s before I was twenty, ended up teaching a few lower-level theory courses a couple of years later.</i>”");
	
	output("\n\nShe smiles, her eyes faraway and reminiscing. “<i>That’s where I met my girlfriend, too. She was a cute little thing, fresh off the galactic rim, just looking to get her pilot’s license and having the damnedest time with all the high-level math. ‘I have computers for all this,’ she was always saying. Good thing I wanted some extra spending money and ended up tutoring on the side. That’s how we actually got together, me and Kaede. Man, I was a real party girl back then, too, always dragging her to games and frat shit. I don’t know how I had time to do any studying, much less </i>work<i>... actually, I do know: by not sleeping ever. I was pretty much a walking pharmacy of stims and caffeine by the time I turned in my last bits of doctoral work. Ended up fainting right in the professor’s office. Plop! Down I went the second I handed it off.</i>”");
	
	output("\n\nAnno laughs at herself: a good, hearty laugh from the gut. “<i>I had fun, though. Kind of miss it, honestly... I wouldn’t mind teaching again");
	if (flags["ANNO_MISSION_OFFER"] == 3) output(" if I ever get tired of working for you, boss... not that that’ll ever happen,</i>” she giggles, giving you a knowing wink.");
	else output(" now that I’m between jobs again. Steele Tech was nice and all, but maybe I’m not cut out for the whole research thing after all. I’ve done more than enough, you know?");
	output("</i>”");

	annoFollowerTalkMenu(false);
	removeButton(3);
	processTime(5+rand(3));
}

function annoFollowerTalkRelationships():void
{
	clearOutput();
	annoFollowerHeader();

	if (!haveFuckedAnno()) output("“<i>That’s a bit personal,</i>” Anno says, eyeing you suspiciously... before breaking out into a little grin. “<i>But for you, I guess I can spill the beans. Think you can keep a girl’s secrets?");
	else output("“<i>As long as you’re not the jealous type, boss, I don’t mind sharing!");
	output(" After all, I’m pretty invested in the whole polyamory idea, which necessitates a certain measure of sexual openness, doesn’t it?</i>”");

	output("\n\nShe grins. “<i>For the sake of conciseness, let’s just say I like having multiple relationships at once. A lot of my love life happens long-distance, you know, and it gets sooo lonely,</i>” she teases, pressing herself up against you. Giggling, she continues, “<i>But seriously, I don’t want to make a big deal out of it. I just... like a lot of people, and it’s impossible to pick just one that I want to be with. A lot of ausar work like I do, when it comes to love. We have a hard time with the whole monogamy thing, I guess - just too much love to go around!");

	output("\n\n“<i>So let’s see,</i>” Anno says, pulling herself up onto her desk and dangling her legs over the edge. “<i>Just before you showed up on Tarkus, I got back in touch with my college sweetheart, and we’ve sort of started up again. Kaede’s a great big sweetie when you get to know her, but she’s shy as all get-out. I have to drag her out of her comfort zone sometimes, you know? I swear she’d just sit in her cockpit playing vidya and eating ice cream if I didn’t make her go out and do things.</i>”");

	output("\n\nAnno pauses to think for a moment. “<i>Kaede’s my only really steady lover right now");
	if (haveFuckedAnno()) output(", aside from you, of course");
	output(". Doesn’t mean I’m not gonna try and find a date whenever we pull into port, but aside from");
	if (!haveFuckedAnno()) output(" her");
	else output(" you two");
	output(", I haven’t had much luck lately. Not like college, where I could pick up girls with a smile and a wink,</i>” she giggles.");

	if (flags["ANNOxSYRI_WINCEST"] != undefined)
	{
		output("\n\nAnno sighs, then gives a wry little chuckle. “<i>Then there’s this whole thing with Syri we’ve got going on now. I don’t </i>even<i> know what to feel about that. I love her with all my heart, but... I don’t know, it almost feels like masturbating, you know? She’s my twin sister, for fuck’s sake. What am I even going to tell our </i>parents<i>? They’re going to have a fit if they find out.</i>”");

		output("\n\nShe rubs her temples, groaning with frustration. After a moment, though, she manages a little grin and adds, “<i>Wouldn’t trade it for the world, though.</i>”");
	}

	annoFollowerTalkMenu(false);
	removeButton(4);
	processTime(5+rand(3));
}

function annoFollowerTalkSteeleTech():void
{
	clearOutput();
	annoFollowerHeader();

	output("“<i>So, care to tell me a little bit about your");
	if (flags["ANNO_MISSION_OFFER"] != 3) output(" old");
	output(" job?</i>”");
	
	output("\n\nAnno’s ears perk up. “<i>You mean at Steele Tech? Sure, boss,</i>” she says, hopping up onto her desk and letting her long legs dangle. ");
	
	output("\n\n“<i>So you know your dad hired me, of course. Picked me up himself after a convention speech, gave me a job working in Steele Tech’s R&D at corporate headquarters. It was an amazing job, you know: all the resources and expertise of my government-sponsored lab at Akkadi, but half the regulations and red-tape, not to mention no government spooks breathing down my neck. Of course I couldn’t work on warp tech like I’d wanted to -- Steele doesn’t have any of the contracts or patents related to the Gates -- but it was still an awesome gig.</i>”");
	
	output("\n\nShe smiles a bit, her gaze wandering far away. “<i>Especially when Vic gave me my own lab and team right out of the gate. Even Akkadi didn’t do that. I always got the feeling that he trusted me... had faith in me. I don’t know why; I mean, all he had to go on was one shitty lecture I gave and talking over drinks after.</i>” Anno’s smile grows, though it takes on an unmistakably sad quality as she speaks. “<i>While I worked there, I could have sworn... I was certain he was grooming me to take over R&D. I only worked there a couple years, but Vic still gave me more and more responsibility, more teams to oversee, more important projects, entire labs even. Honestly, I’d figured that by now that I would be the head of Applied Sciences or one of the other big divisions.</i>”");
	
	output("\n\nAnno chuckles, “<i>Who’d have thought your dad’s last project for me would be tossing me out of R&D and to some fucking planetary branch post. I mean, what the hell? Let’s just take one of our best scientists and put her in the middle of bumfuck nowhere to run a store. That makes sense, doesn’t it?</i>” She runs a hand through her snowy hair and sighs. “<i>I still don’t know what I did to deserve that. I MUST have fucked up somewhere, I just... I just can’t see where.");
	
	output("\n\n“<i>Oh well,</i>” Anno says with a shrug. “<i>I’m out of there now, so I guess I shouldn’t complain. I do miss my lab, though. It had the most amazing view of the forests of Verdure...</i>”");

	annoFollowerTalkMenu(false);
	removeButton(5);
	processTime(5+rand(3));
}

function annoFollowerTalkEntertainment():void
{
	clearOutput();
	annoFollowerHeader();

	output("“<i>So, what do you do for fun?</i>” ");
	
	if (haveFuckedAnno())
	{
		output("\n\n“<i>I think you know,</i>” Anno teases, reaching around to grab your [pc.butt].");
	
		output("\n\n“<i>Aside from that,</i>” you say, mock-rolling your eyes.");
	}
	
	output("\n\nAnno grins at you, saying, “<i>Well, I’m not exactly the party girl I used to be, but I’d like to think I still know how to have fun. If you think reading technical manuals and scientific journals is fun. Uh, alright, maybe not that fun, but that’s what I burn most of my free time doing these days. I don’t really have any hobbies outside of my field, you know? I do a little gunsmithing on the side, though: I’ve always liked messing around with weapons, custom designing them for myself. Figure if I ever get tired of blinding bitches with science, I could just open up a gun store. Heh, my sister would love that.</i>”");
	
	output("\n\nShe chuckles to herself. “<i>Let’s see... uh... man, why do you have to ask hard questions. Come on, ask me about warp theory or quantum mechanics or light drives - pitch me an easy question, [pc.name].</i>” When you decline, she groans in exasperation and slides down into her chair, legs crossed. “<i>God damn, I’m uninteresting. Well, uh, I watch a lot of TV I guess. Especially </i>Steph Irson<i>, James Farmer’s </i>Forty-Eight Hours<i> - oh, and </i>Magical Space Princess Lyota<i>.</i>”");
	
	output("\n\n“Magical Space Princess Lyota<i>...?</i>”");
	
	output("\n\nAnno blinks. “<i>What? It’s a great show!</i>” she says, a little too defensively. “<i>Any, uh, anyway. I’m pretty into music, I guess. Mostly rock and metal from the homeworlds, though I guess");
	if (pc.isHuman()) output(" you");
	output(" humans have some pretty decent jams, too. Tend to be a little heavier on the screams and growls than I like, but nothing beats a Terran death metal group if you just want to bang your head around and punch something.");
	
	output("\n\n“<i>You know, I actually used to play the bass way back,</i>” Anno adds, a hint of pride in her voice. “<i>I wasn’t </i>great<i> or anything, but it’s the fucking bass guitar, right? Used to play with some of the other rockers back at Akkadi after work, but nobody wanted to hang out at Steele Tech. Probably because I was their boss. That’d be a hell of a thing: ‘Oh, you missed practice last night? Well you can miss work today, too! Bwahaha I’m so evil hahaha.’ Not that I would actually do that or anything.</i>”");

	annoFollowerTalkMenu(false);
	removeButton(6);
	processTime(5+rand(3));
}

function annoFollowerRemoveUniform():void
{
	clearOutput();
	annoFollowerHeader();

	output("“<i>Hey, you know you don’t have to wear that uniform, right?</i>” you say, indicating Anno’s skin-tight company catsuit.");
	
	output("\n\nShe cocks an eyebrow at you. “<i>Huh? Oh, this old thing,</i>” she chuckles, poking at the tight material stretched over her thigh. “<i>I’ve been wearing it so long... I barely even notice it anymore. It’s practically a part of me.</i>”");
	
	output("\n\n“<i>Still,</i>” you say, “<i>I run a casual ship. You don’t have to wear it.</i>”");
	
	output("\n\nAnno shrugs at that and gives you a slight grin. “<i>Well, if you put it that way... I guess it wouldn’t hurt to wear something that breathes a little better. At least while I’m not planetside moving product.</i>”");
	
	output("\n\nAnno pulls down her zipper and shrugs out of the catsuit, making a little show of shimmying out of her sleeves and pants. She bends way over as she removes her suit to give you an unobstructed view of her big, squishy butt - that’s an opportunity you can’t help but take advantage of, and you give the shameless ausar a little smack for her trouble. She answers with a girlish squeal and a wiggle of her hips... before balling up her catsuit and tossing it in your face, giving you an almost-overpowering whiff of her musk as she scampers out of your grasp and into her wardrobe.");
	
	output("\n\nBy the time you disentangle yourself from the catsuit, Anno’s slipped on a button-up shirt from her dresser and is halfway through buttoning it up. She winks and sticks her tongue out at you in playful retaliation for your spank, though her bare tail is wagging happily behind her and her still-bare slit is glistening with the beginnings of her arousal. You watch with appreciation as your lover dresses, finishing with her shirt before finding a pair of jeans and boots to go with it. By the time she’s finished, you’d barely recognize Anno on the street: without her catsuit, she looks like a whole new woman.");
	
	output("\n\nSeeing you eyeing her, Anno sashays over to you and presses herself tightly against you. “<i>Like what you see, babe? Good... now, how’s about you tear these off me?</i>”");

	processTime(5+rand(3));
	anno.armor = new AnnosBlouse();

	//{sex menu}
	annoFollowerSexMenu();
}

function annoFollowerWearUniform():void
{
	clearOutput();
	annoFollowerHeader();

	output("“<i>So, any chance of you putting that sexy catsuit back on?</i>”");
	
	output("\n\nAnno grins");
	if (pc.tallness > anno.tallness + 6) output(" up");
	else if (pc.tallness < anno.tallness - 6) output(" down");
	output(" at you. “<i>Maaaaaybe,</i>” she teases, already starting to work the buttons on her shirt. “<i>To be honest, I kind of missed it. I always felt so... so </i>sexy<i> in it. I just loved the way it hugged all my curves.</i>”");
	
	output("\n\nYou gulp as Anno slides out of her shirt to reveal the full swells of her double-D cups. She indicates the dresser behind you, and you quickly pull out one of several neatly folded catsuits tucked into the top drawer. When you turn back to her, she’s already bare naked, standing on a pile of her jeans and shirt with her hands on her hips. You hand over the catsuit, so that your lover can make a bit of a show of stepping into it and drawing the sheer, skin-hugging suit up around her waist and zipping up its front. She pauses as she nears her bust, giving a little gasp as her tits are slowly drawn into the tight embrace of her uniform, finally disappearing beneath the black and yellow material. ");
	
	output("\n\nFinally, you’ve got your good old Anno back, complete with her skin-hugging suit that does the most wonderful things for her figure... ");
	
	output("\n\nSeeing you eyeing her, Anno sashays over to you, pressing herself tight against you. “<i>Like what you see, babe? Good... now, how’s about you tear this off me?</i>”");

	processTime(5+rand(3));
	anno.armor = new AnnosCatsuit();

	//{sex menu}
	annoFollowerSexMenu();
}

function annoFollowerTalkContacts():void
{
	clearOutput();
	annoFollowerHeader();

	output("“<i>What can you tell me about these... contacts of yours,</i>” you ask, nodding towards the small stockpile of weapons and equipment sitting around Anno’s quarters. ");
	
	output("\n\n“<i>Well,</i>” she drawls playfully, resting her chin on a fingertip, “<i>I can’t give you any specifics - for everyone’s sake, you know. But I’ve got a lot of friends in the Joint Ausar Fleet, some who </i>were<i> in the J.A.F. and now do some private contracting work, plus plenty of people in Akkadi and Steele Tech willing to pass me a little this-and-that. Perks of being friendly, I guess! I can get a lot of excess inventory from a lot of places for just a smile and a consignment contract. Doesn’t help anybody if all this junk’s sitting in some corporate warehouse, or shelved by the Fleet because it’s point-two watts underpowered than the normal model. You’d amazed how much stuff big corps and the like just leave sitting around that nobody misses when it goes missing.</i>”");
	
	output("\n\nAnno gives you a conspiratorial wink as she says those last few words, but refuses to elaborate further on her contacts or their... less than legal methods of supplying her. “<i>Still,</i>” she adds, “<i>at least I’ve got an income this way. Shady as it may be. Would I rather be blinding bitches with science? Sure. But this isn’t bad, and since you move around so much, I’ve always got new inventory coming and going, and new customers getting in contact with me. I could do a lot worse, you know?</i>”");
	
	output("\n\nThat, at least, is good to hear.");

	annoFollowerTalkMenu(false);
	removeButton(7);
	processTime(5+rand(3));
}