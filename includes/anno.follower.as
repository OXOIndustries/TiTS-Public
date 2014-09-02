function annoIsCrew():Boolean
{
	if (flags["ANNO_CREWMEMBER"] == 1) return true;
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

	if (hours >= 6 && hours <= 11 || hours >= 14 && hours <= 20) crewMessages += output("You give a light rap on Anno’s door, and are quickly let in. “<i>Hey, boss!</i>” she says with a smile, ushering you in. ")
	else if (hours >= 12 || hours <= 13)
	{
		output("“<i>[pc.name]!</i>” she shouts over the din of a loud pop jam blaring from her computer, “<i>I didn’t see you there. I hope you didn’t mind my singing. It's a new one from " + RandomInCollection("Touch Fluffy Tail", "The Beagles", "Playing Poker", "Buried Treasure") + " that I haven’t been able to get out of my head.</i>”");
		output("\n\nShe gives you an apologetic grin as she flips the music off.");
	}
	else output("You give a light rap on Anno’s door, which rocks back on its hinges, unlocked. Anno's sleeping face-down on her desk. You give her a little poke, which quickly has her jerking her head up and rubbing the sleep from her eyes. “<i>Oh, shit. What time is it?</i>”");

	if (!haveSexedAnno()) output("\n\n“<i>So what’s up? You need anything?</i>”");
	else
	{
		output("\n\nAnno plops down on the side of her bed, arms spread back to support her... which has the added bonus of thrusting her chest out against");
		if (anno.armor is AnnosCatsuit) output(" the half-zipped front of her catsuit");
		else output(" the low-cut neck of her blouse");
		output(". “<i>Did you need something, babe?");
		if (pc.lust() >= pc.lustMax() * 0.8) output(" Maybe a little stress relief?");
		output("</i>”");
	}

	annoFollowerMenu();
}

function annoFollowerMenu():void
{
	clearMenu();
	addButton(0, "Buy");
	addButton(1, "Sell");
	addButton(2, "Special Gear");

	addButton(5, "Talk");
	addButton(6, "EarScritch");
	addButton(7, "Sex");
	if (flags["ANNO_SLEEPWITH_INTRODUCED"] != undefined)
	{
		if (haveSexedAnno())
		{
			if (flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") addButton(8, "No Sleep W.", annoSleepToggleOff, "Don't Sleep With", "Tell Anno you'd like to sleep without her for now.");
			else addButton(8, "Sleep With", AnnoSleepToggleOn, "Sleep With", "Tell Anno you'd like her to sleep with you in the evenings.");
		}
		else
		{
			addDisabledButton(8, "Sleep With", "Sleep With", "You could probably get a cuddly ausar bed-buddy if you had sex with her.");
		}
	}
	addDisabledButton(8, "Sleep With", "Sleep With", "A nice rest sounds good... maybe Anno might pay you a vist of her own accord in the process.");
	
	addButton(10, "Appearance");
	addButton(13, "Evict");
	addButton(14, "Back", crew);
}

function annoSleepWithIntroduce():void
{
	clearOutput();
	annoFollowerHeader();

	output("Just as you’re getting ready for bed, you hear a knock on your cabin door. When you tell your visitor to enter, the door slides open and Anno steps through. She’s ditched her usual outfit, and is instead wrapped up in a loose white bathrobe that her hair seamlessly blends into. ");

	output("\n\n“<i>Hey, boss,</i>” she says, the corner of her mouth turning up into a slight grin. Even then, you can’t ignore the touch of nervousness in her voice. “<i>So I was thinking... you know, we’ve, uh, we’ve done the deed. And now we’re basically living on the same ship. So, you know, I thought maybe... maybe you and I could share a bed?</i>”");

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

	// Anno's wake-up scene only accounts for players with a cock, so just skip the event (for now)
	if (pc.hasCock()) flags["ANNO_SLEEPWITH_DOMORNING"] = 1;

	clearMenu();
	addButton(0, "Next", sleep, false);
}

function annoMorningRouter():void
{
	flags["ANNO_SLEEPWITH_DOMORNING"] = undefined;

	if (pc.hasCock()) annoMorningHandy();
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

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}