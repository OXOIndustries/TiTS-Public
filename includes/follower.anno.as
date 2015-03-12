import classes.Items.Apparel.SteeleTechSuit;
import classes.Items.Guns.Goovolver;
import classes.Items.Miscellaneous.AusarTreats;
import classes.Items.Protection.JoyCoPremiumShield;
import classes.Util.InCollection;

/* 
FLAG SHIT:-

ANNO_CREWMEMBER - 0/Undefined : Not Recruited, 1 : Is Crewmember, 2 : Recruited but kicked off the ship

CREWMEMBER_SLEEP_WITH : String, "name" of the character that the PC currently has set as their bedbuddy. -> "ANNO". Undefined = None.

ANNOxKAEDE_LAST_DAY : The last day number that a kaede/anno 3some possibility happened. If flag < days - 7 is true, the option can (potentially) appear based on a rand check.

ANNO_MISSION_OFFER : State of Annoquest. 3 == Completed. If not 3, Anno must have been recruited via Tarkus assploding. This is the better check to figure out how she was recruited - you can do her quest and then blow tarkus up after the fact.

ANNOxSYRI_WINCEST : For when Syri (eventually) gets written and added.

ANNOxKAEDE_INTRODUCED : PC has been introduced by Anno to Kaede
 */

// Anno has been recruited and is currently on the players ship.
public function annoIsCrew():Boolean
{
	if (flags["ANNO_CREWMEMBER"] == 1) return true;
	return false;
}

// Annos recruitment process hasn't yet been completed
public function annoNotRecruited():Boolean
{
	if (flags["ANNO_CREWMEMBER"] == undefined) return true;
	return false;
}

// Anno has been recruited but isn't currently on the players ship
public function annoNotCrew():Boolean
{
	if (flags["ANNO_CREWMEMBER"] == 2) return true;
	return false;
}

public function annoFollowerHeader():void
{
	author("Savin");
	showBust("ANNO");
	showName("\nANNO");
}

// Hook this into Tarkus' ship hangar room
public function returnToShipAfterRecruitingAnno():Boolean
{
	// Fixup missed flags.
	// Not doing it as a save updater. Basically, tell people to go back to Tarkus if Anno is missing, and it should trigger the stuff that they've missed appropriately.
	// Incidently, this is something I would like to move out of flags, and into the Creature objects as it's more relevent to Anno than it is to general gameplay- and then also do things like have "GLOBALS" for various things, that again, can be part of the creature objects.
	// f.ex anno.crewState == Anno.Undefined, Anno.OnCrew, Anno.KickedOffCrew or whatever.
	if (flags["ANNO_SHOP_CLOSED"] != undefined && flags["ANNO_CREWMEMBER"] == undefined)
	{
		flags["ANNO_CREWMEMBER"] = 1;
	}
			
	if (flags["ANNO_CREWMEMBER"] == 1 && flags["ANNO_CREWMEMBER_INITIALSCENE"] == undefined)
	{
		flags["ANNO_CREWMEMBER_INITIALSCENE"] = 1;

		clearOutput();
		annoFollowerHeader();

		// AnnoQuest variant
		if (flags["ANNO_MISSION_OFFER"] == 3)
		{
			output("<i>“Hey, boss!”</i> Anno shouts over the commotion of the bustling landing strip, waving a hand over the sea of raskvel milling about around her. You wade through them over to your ship and wrap Anno up in a tight hug when you reach her. She giggles and nuzzles her cheek against your shoulder, tail going ninety miles an hour behind her. ");

			output("\n\nYou bring down the crew ramp and spend the next few minutes helping Anno get her things aboard: she packed anything but light, that’s for sure. Weapon cases, boxes of spare parts, and more datapads and computers than you can shake a hard drive at. <i>“For the company,”</i> she explains as she’s helping you move a particularly heavy box aboard. <i>“Part of the agreement is that I set up a roving kiosk on board. Where you go, I move product. Which, of course, means that </i>you<i> have easy access to the company’s inventory. Convenient, huh?”</i>");

			output("\n\n<i>“Nice,”</i> you say, dropping the box on the bed in what you’ve determined to be Anno’s quarters. ");

			output("\n\n<i>“Yep! Just gimme a poke if you need anything,”</i> she says, grinning as she pulls out a very large, rounded metal casing from the box. <i>“They even set me up with some limited fabrication tech, so we shouldn’t have to stop for new inventory too often. This baby’ll turn a brick of raw material into a rifle or a shield belt in the blink of an eye. Assuming it works better than the one they sent me back on Tarkus, anyway. Stupid thing choked on a carbon brick the first day.”</i>");
		}
		// Planet dun assplode
		else
		{
			output("<i>“Hey, boss!”</i> Anno shouts over the commotion of the bustling landing strip, waving a hand over the sea of raskvel milling about around her. You wade through them over to your ship, wrapping Anno up in a tight hug when you reach her. She giggles and nuzzles her cheek against your shoulder, tail going ninety miles an hour behind her. ");

			output("\n\n<i>“I put in my resignation while I was waiting. Corporate said they’re sad to see me go, don’t let the door hit me on the way out, all that. Fuckers.”</i>");

			output("\n\nAnno sighs, and for the first time you notice she’s changed outfits since you last saw her: the black and yellow company uniform is gone, replaced with a simple shirt and jeans. Her belongings amount to not much more than a backpack and a duffel bag slung over one shoulder. At least she travels light. You pull down the boarding ramp and escort Anno aboard, leading her into one of the spare quarters on your ship. ");

			output("\n\n<i>“God, I can’t wait to get out of here,”</i> she says, dropping her bag on her new bed. <i>“Fuck Tarkus, fuck Novahome, and fuck Steele Tech. For now, anyway.”</i>");

			output("\n\nAnno flops down on the bed and kicks her shoes off with a heavy sigh. <i>“You’re the best, [pc.name]. Thanks again for getting me out of here.”</i>");

			output("\n\n<i>“No problem,”</i> you say, sitting down on the bed beside her and patting her thigh. ");

			output("\n\n<i>“Oh, hey,”</i> Anno says, sitting back up and grabbing her bag. <i>“I managed to take a lot of my personal inventory and research material with me. I’ve still got some of my gray goo samples, some of the questionably-legal things folks sold me at the store, that sort of thing. And I was thinking: if you want me to stick around on the crew... I’ve still got some friends at Akkadi, plus I know a few guys from the good ol’ days who’ve got some pretty sweet connections. If you want, I can try and get ahold of some of them. I could keep a pretty good stock on the ship for you");
			if (crew(true) > 1) output(" and the crew");
			output(". Wouldn’t charge you over my cost, cross my heart.”</i>");

			output("\n\nNow that could be useful...");
		}

		// Combine
		if (!celiseIsCrew())
		{
			output("\n\n<i>“Alright, I think I’ve got everything aboard. Just give me a little bit to settle in and I’ll be good to go.”</i>");

			output("\n\nYou nod and, sneaking in one last quick kiss, leave Anno to unpack her belongings.");
		}
		else
		{
			output("\n\nAs you’re finishing up with Anno, you hear a wet, squirming sound from the corridor outside. You turn around just in time to see a familiar green blob worming its way under the door.");
			
			output("\n\n<i>“ANNO!”</i> Celise cheers, grinning from ear to ear when she lays eyes on the ausar.");
			
			output("\n\n<i>“Holy crap... Celise? What’re you doing here?”</i> Anno asks, happily accepting a hug from the jubilant goo-girl.");

			output("\n\n<i>“");
			if (silly) output("Tricky ");
			output("Vic left me on the ship for [pc.him],”</i> she answers, shifting over to put an arm around your shoulder. <i>“I think Mr. Steele didn't want [pc.himHer] to get lonely.”</i>");

			output("\n\nAnno chuckles. <i>“Aww, that’s sweet. Gosh, it’s been ages, Cel. We’ve got a lot of catching up to do!”</i>");

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

public function annoFollowerApproach():void
{
	clearOutput();
	annoFollowerHeader();

	if (hours >= 6 && hours <= 11 || hours >= 14 && hours <= 20) output("You give a light rap on Anno’s door, and are quickly let in. <i>“Hey, boss!”</i> she says with a smile, ushering you in. ")
	else if (hours >= 12 || hours <= 13)
	{
		output("<i>“[pc.name]!”</i> she shouts over the din of a loud pop jam blaring from her computer, <i>“I didn’t see you there. I hope you didn’t mind my singing. It's a new one from " + RandomInCollection("Touch Fluffy Tail", "The Beagles", "Playing Poker", "Buried Treasure") + " that I haven’t been able to get out of my head.”</i>");
		output("\n\nShe gives you an apologetic grin as she flips the music off.");
	}
	else output("You give a light rap on Anno’s door, which rocks back on its hinges, unlocked. Anno's sleeping face-down on her desk. You give her a little poke, which quickly has her jerking her head up and rubbing the sleep from her eyes. <i>“Oh, shit. What time is it?”</i>");

	if (!haveFuckedAnno()) output("\n\n<i>“So what’s up? You need anything?”</i>");
	else
	{
		output("\n\nAnno plops down on the side of her bed, arms spread back to support her... which has the added bonus of thrusting her chest out against");
		if (anno.armor is AnnosCatsuit) output(" the half-zipped front of her catsuit");
		else output(" the low-cut neck of her blouse");
		output(". <i>“Did you need something, babe?");
		if (pc.lust() >= pc.lustMax() * 0.8) output(" Maybe a little stress relief?");
		output("”</i>");
	}

	processTime(2);

	annoFollowerMenu();
}

public function annoFollowerMenu():void
{
	annoFollowerHeader();
	
	clearMenu();
	addButton(0, "Buy", annoFollowerBuyMenu);
	addButton(1, "Sell", annoFollowerSellMenu);
	addButton(2, "Special Gear", annoFollowerSpecialGear, undefined, "Special Equipment", "Talk to Anno about any special equipment she might be able to build or buy for you.");

	addButton(5, "Talk", annoFollowerTalkMenu);
	addButton(6, "EarScritch", annoFollowerEarScritches, undefined, "Ear Scritches", "Give Anno an affectionate little pet.");
	if (pc.lust() >= 33) addButton(7, "Sex", annoFollowerSexMenu);
	else addDisabledButton(7, "Sex", "Sex", "Gotta get fired up before you can approach the snowy ausar for some 'entertainment'.")

	if (flags["ANNO_SLEEPWITH_INTRODUCED"] != undefined)
	{
		if (haveFuckedAnno())
		{
			if (flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") addButton(8, "No Sleep W.", annoSleepToggleOff, undefined, "Don't Sleep With", "Tell Anno you'd like to sleep without her for now.");
			else addButton(8, "Sleep With", annoSleepToggleOn, undefined, "Sleep With", "Tell Anno you'd like her to sleep with you in the evenings.");
		}
		else
		{
			addDisabledButton(8, "Sleep With", "Sleep With", "You could probably get a cuddly ausar bed-buddy if you had sex with her.");
		}
	}
	else addDisabledButton(8, "Sleep With", "Sleep With", "A nice rest sounds good... maybe Anno might pay you a vist of her own accord in the process.");
	
	if (haveFuckedAnno()) addButton(10, "Appearance", annoFollowerAppearance);
	
	if (InCollection(shipLocation, "TAVROS HANGAR", "SHIP HANGAR", "201", "500")) addButton(13, "Evict", annoFollowerBootOff, undefined, "Evict from Ship", "Tell Anno to get off the ship. You might break her heart a little, but you'll probably be able to pick her up again later.");
	else addDisabledButton(13, "Evict", "Evict from Ship", "You can't bring yourself to kick Anno off your ship here. Head back to a mainline planet or station first.");

	addButton(14, "Back", crew);
}

public function annoSleepWithIntroduce():void
{
	clearOutput();
	annoFollowerHeader();
	
	flags["ANNO_SLEEPWITH_INTRODUCED"] = 1;

	output("Just as you’re getting ready for bed, you hear a knock on your cabin door. When you tell your visitor to enter, the door slides open and Anno steps through. She’s ditched her usual outfit, and is instead wrapped up in a loose white bathrobe that her hair seamlessly blends into. ");

	output("\n\n<i>“Hey, boss,”</i> she says, the corner of her mouth turning up into a slight grin. Even then, you can’t ignore the touch of nervousness in her voice. <i>“So I was thinking... you know, we’ve, uh, we’ve done the deed. And now we’re basically living on the same ship. So, you know, I thought maybe... maybe you and I could share a bed?”</i>");

	processTime(2);

	clearMenu();
	addButton(0, "Yes", annoSleepWithSureICanDealWithDogslootFurAllInMyMouthInTheMorning);
	addButton(1, "No", annoSleepWithPlsNoDogslootsInMyBedIDontWantDogslootFurAllUpInMyShit);
}

public function annoSleepWithPlsNoDogslootsInMyBedIDontWantDogslootFurAllUpInMyShit():void
{
	clearOutput();
	annoFollowerHeader();

	output("You shake your head. ");

	output("\n\n<i>“Ah,”</i> Anno says simply, shoulders slumping under her robe. <i>“Well, uh, never hurts to ask, right? Lemme know if you change your mind.”</i> ");

	output("\n\nWith that, she quickly retreats from your cabin, letting you get to bed.");

	processTime(2);

	clearMenu();
	addButton(0, "Next", sleep)
}

public function annoSleepWithSureICanDealWithDogslootFurAllInMyMouthInTheMorning():void
{
	clearOutput();
	annoFollowerHeader();

	output("You smile at her, get up to step closer and slip your arms around her waist. <i>“I’d like that.”</i> ");
	
	output("\n\nShe grins. <i>“I was hoping you’d say that,”</i> she whispers, pulling at the tie on her bathrobe and letting the simple garment slip off her shoulders. Underneath, your ausar lover’s wearing a sinfully sheer babydoll in a bright orange hue that accentuates the snowy fur on her limbs, as well as the little strip around her glistening sex. Her hands guide yours down to her pantiless waist, then to the full swells of her ass. She gasps a little as you grope her, all but melting in your arms. ");
	
	output("\n\n<i>“What’re we waiting for?”</i> she mewls before gently pushing you towards the bed.");
	
	output("\n\nSmiling all the way, you pull your lover into your bed. ");

	flags["CREWMEMBER_SLEEP_WITH"] = "ANNO";

	processTime(2);

	clearMenu();
	addButton(0, "Next", sleep);
}

public function annoSleepToggleOn():void
{
	clearOutput();
	annoFollowerHeader();
	
	output("<i>“Hey,”</i> you say, pulling Anno in close. <i>“What do you say you come to my cabin this evening...”</i>");
	
	output("\n\nAnno’s eyes go wide. <i>“You... you mean it?”</i> ");
	
	output("\n\nYou nod, and Anno squeals with delight. <i>“Awesome! I mean, uh, yeah. I’d like that, [pc.name].”</i>");

	flags["CREWMEMBER_SLEEP_WITH"] = "ANNO";

	processTime(2);

	clearMenu();
	addButton(0, "Next", annoFollowerMenu);
}

public function annoSleepToggleOff():void
{
	clearOutput();
	annoFollowerHeader();

	if (!pc.isAss()) output("<i>“Think you could manage on your own tonight?”</i> you ask.");
	else output("<i>“Stay in your own bed tonight.”</i>");

	output("\n\n<i>“Oh,”</i> Anno says, ears tucking down. <i>“Uh, yeah, sure boss. Whatever you want. I was thinking of pulling an all-nighter anyway...”</i>");
	
	flags["CREWMEMBER_SLEEP_WITH"] = undefined;

	processTime(2);

	clearMenu();
	addButton(0, "Next", annoFollowerMenu);
}

public function annoSleepSexyTimes():void
{
	clearOutput();
	annoFollowerHeader();

	output("Anno slips into your quarters just as you’re getting ready to hit the hay. She lets her bathrobe slip down from over her sheer nightie and onto the floor. She slides under the covers and props herself up on an elbow, watching you");
	if (!pc.isNude()) output(" undress");
	else output(" put the last of your [pc.gear]");
	output(" away with interest until you join her.");

	output("\n\n<i>“Hey,”</i> she murmurs as you climb into bed beside her. ");

	output("\n\n<i>“Hey");
	if (pc.isMischievous()) output(" yourself");
	output(",”</i> you answer, slipping an arm around Anno’s shoulders and pulling her close. Her tail wiggles happily as she snuggles up, head resting on your [pc.chest]. You softly stroke your lover’s perky ears and long, silky smooth hair as she nuzzles up to you, settling in after a few playful minutes.");

	flags["ANNO_SLEEPWITH_DOMORNING"] = 1;

	processTime(3);

	clearMenu();
	sleep(false);
}

public function annoMorningRouter():void
{
	flags["ANNO_SLEEPWITH_DOMORNING"] = undefined;

	if (pc.hasCock() && rand(2) == 0) annoMorningHandy();
	else annoMorningShower();
}

public function annoMorningHandy():void
{
	clearOutput();
	annoFollowerHeader();

	output("<b>Your sleep is disturbed by vivid dreams</b> of sexual stimulation as the night draws out. Your mind conjures a field of well-endowed women who surround your naked form, fawning over your [pc.multiCocks] and eagerly worshipping your manhood. Their hands are soft, almost velveteen on your cock");
	if (pc.cocks.length > 1) output("s");
	output(", rubbing and stroking and cupping all along your cockflesh. Your erection grows almost painfully stiff, responding to their tender ministrations by offering ever more length for the gathering of women to explore.");
	
	output("\n\nYou wake with a gasp as your dream self is on the verge of orgasm, ready to blow [pc.hisHer] seed across the faces of a dozen busty women gathered around [pc.hisHer] cock. But the incredible sensation of velvety fingers caressing [pc.eachCock] doesn’t abate as your eyes flutter open. You cast a look down");
	if (pc.legCount > 1) output(" between");
	output(" your [pc.legOrLegs], and find a");
	if (pc.biggestCockLength() <= 7) output(" noticeable");
	else if (pc.biggestCockLength() <= 12) output(" sizable");
	else output(" massive");
	output(" tentpole under your sheets, a stain of pre-cum darkening the material immediately over your cockhead.");
	
	output("\n\n<i>“Morning, lover,”</i> you hear from beside you. You finally notice Anno up on an elbow and watching you with a cheeky smile on her lips. You lean over to kiss your companion good morning, and quickly find yourself interrupted by a world-rocking shudder of pleasure tearing through your body. Your just-waking mind finally realizes exactly what’s going on as Anno pulls the sheets aside, revealing her snowy-furred fingers wrapped tight around your turgid morning wood. ");
	
	output("\n\n<i>“... You’re one hell of an alarm clock, Anno,”</i> you breathe with a sigh before relaxing in your lover’s grasp as she jerks you off. She gives you a wink and finishes the kiss you tried and failed to start, her lips pressing against yours for the briefest moment. Anno moves to nuzzle her face against your shoulder and then rest on your [pc.chest]. You wrap an arm around her, stroking her soft hair almost to the beat of her wrist’s motions; both of you are firmly fixated on your [pc.cock]. You’re not sure how long Anno was working at it before you woke up, but you’re damn close to the edge now... all you can do is lie back and let her finish you off. With a smile, Anno looks up at you and winks, whispering sweet nothings in your [pc.ear] as she finishes you off. ");
	
	output("\n\nYou give a little grunt, arching your back off the bed as your orgasm hits. At the last possible second, Anno angles your cock down to aim the [pc.cockHead] at your [pc.belly] as you let loose. Your cum spurts out in a thick, hot wave; the gushing streaks of [pc.cumColor] splatter across your [pc.belly]");
	if (pc.cumQ() >= 1000) output(" and even reach up to your [pc.chest], covering your whole torso with a thick coating of your seed");
	output(".");
	
	output("\n\nWith a contented sigh, you collapse back onto the bed. Cum continues to trickle from your spent rod, dripping onto your [pc.belly] in hot, sticky droplets. ");
	
	if (pc.isMischievous()) output("\n\n<i>“Good morning to you too,”</i> you murmur.");
	
	output("\n\n<i>“Aww, you made me breakfast in bed!”</i> Anno coos, her blue eyes locked onto your still-twitching cock. She quickly slips down the length of your body, and her flat tongue traces along");
	if (pc.tone >= 70 && pc.thickness <= 30) output(" the hard lines of your muscles");
	else if (pc.tone >= 70) output(" the soft surface of your body");
	else if (pc.tone < 70 && pc.thickness <= 60 && pc.femininity >= 50) output(" the delicate curves of your body");
	else if (pc.tone < 50 && pc.thickness > 60 && pc.femininity >= 50) output(" the ample curves of your body");
	else output(" your [pc.skinFurScales]");
	output(", lapping up your orgasmic fluids as she goes. The next few minutes pass in bliss as your lover cleans up her mess, slurping up every drop of [pc.cum] until you feel like you just stepped out of a warm, if slightly sticky, shower. ");
	
	output("\n\nYou give Anno a scratch between the ears when she finishes, thanking your favorite alarm ausar for starting your day off right.");

	pc.orgasm();

	processTime(20);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoMorningShower():void
{
	clearOutput();
	annoFollowerHeader();

	// What the fuck is this? WHAT THE FUCK IS THIS
	author("Gedan");

	output("You sleepily toss and turn in your bed, but you can't quite shake the feeling that something is missing. It takes a few minutes for your brain to actually kick back in to gear, slowly beginning to wake up, but you can't quite figure out what it is that’s wrong. You keep trying to wrap your arm around something that just isn't there, trying to snuggle in against a body that, for some reason, you expect to be tucked up against your [pc.chest].");

	output("\n\nYou shoot upright when you realise somebody’s missing - an empty spot on your mattress, still warm from the heat of a body recently occupying it.");

	output("\n\n<i>“Oh hey [pc.name],”</i> echos a greeting from your side. You turn to look and find Anno having just stepped out of your shower. She’s stood in the doorway to your bathroom, a towel wrapped around her body and another balled up around her hair. <i>“Sorry, I'm kind of an early riser - you don't mind me using your shower right?”</i>");

	output("\n\nShe takes a step out into your quarters, the towel wrapped around her body parting down the side of her leg to frame a view of glistening ausar thigh, and you can’t muster anything other than an appreciative grunt. You certainly don't mind her using your shower; especially if one of the perks is getting to wake up to this kind of view.");

	output("\n\n<i>“Down " + pc.mf("boy", "girl") + "!”</i> she responds whilst quickly stepping back into the bathroom, closing the door behind her. She keeps talking loud enough for you to hear her clearly, <i>“I've only just got myself dry - do you know how hard it is to dry fur? I'm not getting all sweaty and messy right after I've </i>just<i> got clean.”</i>");

	output("\n\nYou fall back down onto the mattress, still half asleep and now a little warm under the collar thanks to Anno’s impromptu skin-show. You must have drifted back to sleep, as it seems like only seconds later the telltale hiss of door hydraulics signals the white-haired ausar’s departure from the bathroom, this time clad in her");
	if (anno.armor is AnnosCatsuit) output(" deliciously tight catsuit");
	else output(" regular clothes");
	output(" rather than one of your towels.");

	output("\n\n<i>“All yours, Steele!”</i> she says, before bounding towards the main door to your quarters. <i>“See you later, yeah?”</i>");

	output("\n\nDid- did she blow you a kiss on her way out? The tease....")

	pc.lust(10);

	processTime(15);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerBootOff():void
{
	clearOutput();
	annoFollowerHeader();

	output("Looking at the eager-eyed ausar, you slowly spell out that you don’t want her on the ship anymore. It’s time to pack up and head out. ");
	
	output("\n\n<i>“But... what?”</i> Anno says, dumbfounded. She stares at you with wide eyes, her ears and tail curling close to her body as you tell her to leave. <i>“But I... but why? What’d I do wrong? I thought we were doing great...”</i>");
	
	output("\n\nShe bites her lip and lets out a pitiful little whine. <i>“Nevermind. It’s fine. I’ll, uh,");
	if (shipLocation != "TAVROS HANGAR") output(" I’ll hitch a ride to");
	else output(" stay here on");
	output(" Tavros, then. Kaede’s got a place up on the higher rings; I can just crash there for a while.”</i>");
	
	output("\n\nYou nod, and watch as Anno hurriedly collects her belongings. You get the distinct sense she’s trying not to cry as she scurries off your ship.");

	flags["ANNO_CREWMEMBER"] = 2;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") flags["CREWMEMBER_SLEEP_WITH"] = undefined;

	processTime(15);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoAtAnonsAddendum():void
{
	// Recruited but booted off da ship
	if (flags["ANNO_CREWMEMBER"] == 2)
	{
		output("\n\nAnno is sitting at the bar, nursing a whiskey and working on a glowing datapad.");
		addButton(8, "Anno", annoFindingALostPooch);
	}
	// Is an active crewmember - see if we can proc the Kaede event.
	else if (flags["ANNO_CREWMEMBER"] == 1)
	{
		if (flags["ANNOxKAEDE_LAST_DAY"] == undefined) flags["ANNOxKAEDE_LAST_DAY"] = days - 8;

		if (haveFuckedAnno() && flags["ANNOxKAEDE_LAST_DAY"] < days - 7)
		{
			if (rand(3) == 0)
			{
				addButton(8, "Anno", annoxKaedeFollowerMeeting);
			}
		}
	}
}

public function annoFindingALostPooch():void
{
	if (flags["ANNOxKAEDE_LAST_DAY"] == undefined) flags["ANNOxKAEDE_LAST_DAY"] = days - 8;

	if (haveFuckedAnno() && flags["ANNOxKAEDE_LAST_DAY"] < days - 7)
	{
		if (rand(3) == 0)
		{
			annoxKaedeFollowerMeeting();
			return;
		}
	}

	clearOutput();
	annoFollowerHeader();
	
	output("<i>“Hey, you,”</i> you say, planting a hand on Anno’s head. She spins around on her barstool, all but shrieking when you grab her. When she sees whom it is, though, her cry turns into one of barely contained excitement. She leaps up into your arms, squeezing you so tightly that you think you hear something crack.");

	output("\n\n<i>“Boss! You came back!”</i> she squeals, still hugging you. <i>“What's the plan, [pc.name]?”</i> she adds hopefully.");

	processTime(2);
	
	//[Come Aboard] [Not Now]
	clearMenu();
	addButton(0, "Come Aboard", annoFollowerLetThePoochShitUpYourShowerWithFurAgain);
	addButton(1, "Not Now", annoFollowerNoThanksIActuallyQuiteLikeMyShowerNotBeingFullOfDogfur);
}

public function annoFollowerNoThanksIActuallyQuiteLikeMyShowerNotBeingFullOfDogfur():void
{
	clearOutput();
	annoFollowerHeader();
	
	output("Patting Anno on the head, you tell the eager puppy that you’re not quite ready for her to rejoin your crew. Her excitement bleeds off immediately.");

	output("\n\n<i>“Oh. Yeah, sure. No worries,”</i> she says, rubbing at her neck. <i>“I'm actually making good progress on my book, so no rush. Plenty of stuff to do around here.”</i>");

	output("\n\nYou give the girl a final scratch between the ears as she returns to her drink.");
	
	processTime(2);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerLetThePoochShitUpYourShowerWithFurAgain():void
{
	clearOutput();
	annoFollowerHeader();
	
	output("<i>“Ready to come home?”</i> you ask, scratching her between the ears.");

	output("\n\nShe grins, <i>“You know it. I missed you, boss.”</i>");

	output("\n\nA quick trip to her girlfriend’s apartment to collect her things, and you’re ready to go. Hand in hand, you guide Anno back aboard your ship. She settles in like she'd never been gone.");

	output("\n\n<b>Anno has joined your crew!</b>");
	
	currentLocation = "SHIP INTERIOR";
	flags["ANNO_CREWMEMBER"] = 1;
	
	processTime(30);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerBuyMenu():void
{
	clearOutput();
	annoFollowerHeader();

	//Note to Fen/Geddy: Anno has three Inventory tiers: Tarkus, Steele Tech, and Black Market. She'll always have access to the Tarkus inventory; Steele Tech or Black Market depends on whether or not you completed AnnoQuest or not.

	annoFollowerInventoryCheck();

	shopkeep = anno;
	anno.keeperBuy = "<i>“Want something from my stock, boss?”</i> Anno asks, picking up a datapad and handing it over to you. <i>“Here’s what’s in inventory at the moment.";
	if (flags["ANNO_MISSION_OFFER"] == 3) anno.keeperBuy += " Steele Tech’s still supplying us with top-tier equipment, and plenty of it.”</i>";
	else anno.keeperBuy += "My contacts might be a </i>little<i> more seedy these days, but the equipment they’re hooking me up with isn’t too far behind Steele Tech’s gear.”</i>";
	buyItem();
}

// Updates and configures Annos inventory depending on how she ended up on the players ship
public function annoFollowerInventoryCheck():void
{
	// MISSION_OFFER tracks the quest, 3 is complete. The only way she can be a follower and have a mission offer status of 3 is if she's still employed by Steeletech.
	if (flags["ANNO_MISSION_OFFER"] == 3)
	{
		// Check for the presence of a unique item, if not there, add all
		if (!anno.hasItem(new SteeleTechSuit()))
		{
			anno.inventory = new Array();
			
			anno.inventory.push(new GrayMicrobots());
			anno.inventory.push(new AusarTreats());
			anno.inventory.push(new LaserCarbine());
			anno.inventory.push(new EMPGrenade());
			anno.inventory.push(new Goovolver());
			anno.inventory.push(new NovaRifle());
			anno.inventory.push(new NovaPistol());
			anno.inventory.push(new SteeleTechSuit());
			anno.inventory.push(new ACock());
			anno.inventory.push(new AHCock());
			anno.inventory.push(new ADCock());
		}

		// Buy/Sell markups
		anno.sellMarkup = 1.1;
		anno.buyMarkdown = 0.85;
	}
	else
	// Unemployed by Steeletech
	{
		if (!anno.hasItem(new JoyCoPremiumShield()))
		{
			anno.inventory = new Array();
			
			anno.inventory.push(new GrayMicrobots());
			anno.inventory.push(new AusarTreats());
			anno.inventory.push(new HammerCarbine());
			anno.inventory.push(new FlashGrenade());
			anno.inventory.push(new JoyCoPremiumShield());
			anno.inventory.push(new ACock());
			anno.inventory.push(new AHCock());
			anno.inventory.push(new ADCock());
		}

		anno.sellMarkup = 1.2;
		anno.buyMarkdown = 0.8;
	}

	// Set her up so she can buy/sell everything
	anno.typesBought = [GLOBAL.ALL];
}

public function annoFollowerSellMenu():void
{
	clearOutput();
	annoFollowerHeader();

	annoFollowerInventoryCheck();

	shopkeep = anno;
	anno.keeperSell = "<i>“Got something weighing you down, boss? I can";
	if (flags["ANNO_MISSION_OFFER"] == 3) anno.keeperSell += " send just about anything back to Steele Tech for a good profit. Perks of being a field merchant!";
	else anno.keeperSell += " fence just about anything through my friends. Just give me the word!";
	sellItem();
}

public function annoFollowerTalkMenu(doOut:Boolean = true):void
{
	if (doOut)
	{
		clearOutput();
		annoFollowerHeader();

		output("<i>“Got a few minutes to chat?”</i> you ask before leaning against Anno’s desk.");
		
		output("\n\nShe smiles. <i>“Sure, boss. What’s on your mind?”</i>");
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
	if(flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined)
	{
		if(flags["ANNO_STRAPON_MODS_ENABLED"] == undefined) addButton(9,"Strapon Mods",annoStraponMods,undefined,"Strapon Mods","Check with Anno to see if she's modified her strapon at all.");
		else addDisabledButton(9,"Strapon Mods","Strapon Mods","Anno has already tweaked her hardlight strapon. Good job!");
	}
	else addDisabledButton(9,"Strapon Mods","Strapon Mods","Anno needs to own a hardlight strapon before it can be modified. Maybe you could take her to Tavros and look for a store that sells them.");
	addButton(14, "Back", annoFollowerMenu);
}

public function annoFollowerTalkAkkadi():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“Mind telling me a little about your old job?”</i>");
	
	output("\n\nAnno’s lips purse in thought. <i>“You mean Akkadi - the Warp Gates and all that? Sure, if you don’t mind a bit of a lecture. I may get carried away on the topic. I’ve written books on it, you know.”</i>");
	
	output("\n\nYou urge her to continue. ");
	
	output("\n\n<i>“Alright, so you know the ausar invented the Warp Gates. Took us centuries of slow-boating between the star-kingdoms to finally get it working, and may or may not have invented interstellar war immediately afterwards. But it was still a huge breakthrough, no matter how much we abused it. I’m proud to say that one of my ancestors, Cyreon Dorna, was one of the project leaders at Akkadi when the Gates were created. Science runs strong in the Dorna family. Or at least being a nerd does, if you believe my sister.”</i>");
	
	output("\n\nAnno chuckles, leaning against the bulkhead as she talks. <i>“So yeah. After that, Akkadi became THE ausar science group, and has been ever since. Thanks to the family name, I got fast-tracked into Akkadi Research and Development during college, before I even had my doctorate.”</i> She shrugs, her smile fading somewhat. <i>“I can’t say I’m proud of the why of getting my job there, but you don’t turn down a job in the galaxy’s biggest technology firm, especially when your invitation comes from the desk of the king of Ausaril.”</i>");
	
	output("\n\n<i>“So I ended up working at Akkadi at the tender age of twenty two. I got pushed into the FutureTech group pretty quickly, and from there to working on military projects. Advanced shield generators for starships, the next generation hover-tank for the army, even reverse-engineering some primitive powered exoskeleton prototypes. But my real passion was the Warp Gates: I published my doctoral thesis from inside Akkadi, all about advancing Gate tech. That got somebody’s attention, and pretty soon I had my own lab and team to work with.”</i>");
	
	output("\n\nAnno grins at that. <i>“Fun times. Definitely made my folks proud. Anyway, did you know that Gate tech’s basically been static for the last fifteen hundred years? Once we got them working, that was pretty much it for Gate tech. Sure, we make the casings that float around in space sturdier, update the software from time to time, but the amazing fucking technology that shoots you across the galaxy in the blink of an eye? Nah, it works, let’s leave it alone. Hell, the gates in the core are basically running off computers and hardware that haven’t been updated in a millennium - you better hope to God if they break, somebody in-system knows how to fix it.”</i> She chuckles, shaking her head at the thought. <i>“So, anyway, I " + ((silly) ? "rustled some jimmies" : "ruffled some feathers") + " with my paper about starting to update and expand on the core tech powering the Gates.”</i>");
	
	output("\n\n<i>“First step: micro-ize the tech. There’s no reason for the Gates to be so damn big, right? Maybe a thousand years ago we needed capital-ship sized platforms for the tech, but nowadays it’s all about microchips so small you can’t even see them, plus holo and hardlight mechanisms. So we spent about a year working to miniaturize the Gates, with a little help from the Joint Ausar Fleet’s R&D, who immediately saw the potential for transmat on the individual scale: imagine being able to invade a planet from orbit, but completely bypassing the planet’s air-to-ground defenses. You just truck into orbit and warp your troops and material behind enemy lines. It could have revolutionized warfare, much less personal travel and planetary transportation. God, imagine standing on Ausaril, then just stepping through a door frame and onto Terra? We could have changed the </i>galaxy!<i>.”</i>");
	
	output("\n\nWow. <i>“What happened?”</i> you ask.");
	
	output("\n\nShe shrugs and sighs. <i>“We done fucked up. The Fleet pushed us to biological testing too quickly, before we had a complete sample pool. My team got bullied into trying a field test way before we were ready to go: tried to warp a special forces squad into a hostage scenario. One of the King’s kids had been taken by religious fanatics pissed that she’d ditched her dying body for cyberware. Threatening to execute her on live extranet feed. You might have seen it on the news, maybe four years ago? We tried to put six operators in, ended up getting two on the ground, both fucked up pretty badly. No idea where the other four even went. Probably dead.");
	
	output("\n\n<i>“At least the princess managed to get out in the confusion. Scared the shit out of the bastards, bought a few seconds - enough time for our ground team to kick the door in and put them down.");
	
	if (syriFriendsWithBenefits())
	{
		output("”</i>");

		output("\n\n<i>“That’s... not what Syri told me.”</i>");
	
		output("\n\n<i>“Syri wasn’t involved until after. Some son of a bitch in the Admiralty thought we’d sort the problem out in a hurry if it was my sister going through next time. Turns out that no, science doesn’t work that way. Assholes. At least she </i>survived<i>, unlike the other guy that went through in the second test.”</i> Anno rubs her temples, sighing. <i>“I got out right after that.");
	}

	output(" Your dad helped me out of a tough spot after that... I was in a pretty bad place. Gave me a chance to come work for his company, to work without... </i>that<i> hanging over me, without brass breathing down my neck about my projects.”</i>");

	annoFollowerTalkMenu(false);
	addDisabledButton(0, "Akkadi R&D");
	processTime(10+rand(5));
}

public function annoFollowerTalkFamily():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“My family?”</i> Anno asks when you broach the topic. <i>“Well, there’s me, my sister, and our parents. I’ve got a pretty big extended family, too, especially on my dad’s side. More cousins, aunts, and uncles than I can count. But they’re not who you’re asking about, are they?”</i>");
	
	output("\n\nShe chuckles at that, <i>“Right, so uh, my dad’s big into business. Holds a lot of shares in Akkadi, JoyCo, even Steele Tech. You know the type, I’m sure: wealthy socialite, throws the annual charity ball at year’s end for all the other wealthy socialites. He might not be the bad-ass adventurer your dad was, but mine’s still a good guy. Kind, always telling us how proud he is. The kind of man who spends more time thinking up ways to give things away then being a ruthless businessman. Pretty much the opposite of my mom: she’s the business hound of the family. Pulled herself up by the bootstraps. Definitely the one Syri took after. Tough as nails, always pushing us to do better. Pushed </i>hard<i> to get me into a good school, then Akkadi.”</i>");
	
	output("\n\n<i>“You’d like them,”</i> she adds with a smile. <i>“I couldn’t have asked for better parents.”</i>");
	
	output("\n\nShe lets out a long breath and leans back, resting her head in her hands. <i>“And then you have my sister, Syri. There’s a good Terran expression for her... black sheep! I can’t imagine her turning out any more... not how our parents wanted. She got the same full ride to the Ausaril School of Technology that I did, and she immediately threw it in their faces and enlisted in the Fleet.”</i> Anno shakes her head, exasperated. <i>“You know, I can see where she was coming from. I still don’t know how I feel about letting the family name carry me through school and all, but didn’t exactly feel the need to tell my folks to get fucked, either.");
	
	output("\n\n<i>“But that’s Syri for you. She gets so worked up about things. ‘Passionate,’ dad called her,”</i> Anno says with a laugh. <i>“For twins, we really couldn’t be more different. She’s a scary, angry marine lady; I’m a laid-back desk jockey... but I love her to pieces.");
	if (syriIsCrew()) output(" I’m glad we’ve had a chance to get closer here on the ship. I’ve missed her the last couple of years");
	else output("<i>“I wish we hadn’t grown apart so much the last couple of years. But that’s what you get for working on different sides of the galaxy, I guess");
	output(".”</i>");

	annoFollowerTalkMenu(false);
	addDisabledButton(1, "Family");
	processTime(5+rand(3));
}

public function annoFollowerTalkVictor():void
{
	clearOutput();
	annoFollowerHeader();
	
	output("<i>“Think you could tell me a little about my Dad?”</i> you ask, remembering Anno’s... experience with your father.");
	
	output("\n\nShe grins. <i>“Sure, [pc.name]. I didn’t know him </i>that<i> well, though. Mostly through work, to be honest, though he kept close tabs on me while I was getting settled in at Steele Tech R&D. He was a good guy... you could see the kindness in his eyes. And the age. Have you ever looked an elephant in the eye? Your dad had that same look, like he’d seen eternity and just smiled as it passed him by.”</i> ");
	
	output("\n\nAnno smiles, sliding her hand over yours. <i>“You know, he helped me out in a pretty bad time in my life. I was between jobs, basically living off convention speeches and my folks putting me up. He listened to one lecture I gave, not half an hour in a smoky hotel con room with maybe half a dozen washed-up eggheads in it, altogether. I guess he saw something in me. Or my work, anyway. Bought me a drink after my speech and, by night’s end, I had a ship ticket and a job waiting for me on Verdure at the R&D labs. I didn’t even realize until my first day on the job whom the hell I’d met.”</i> ");
	
	output("\n\n");
	if (pc.isNice()) output("<i>“You’re a lot like him, you know. You have that same kindness in your eyes,”</i> you say.");
	else if (pc.isMischievous()) output("<i>“He always had this amazing humor. That cunning way he’d talk, always circling around you, weaving words around you like a duelist feints,”</i> you say.");
	else output("<i>“He was a good man. I’ll never forget that. But he always had this hardness to him, like he was made of iron beneath that smile of his. You always had this impression it wouldn’t make him break a sweat to completely destroy you,”</i> you say.");
	
	output("\n\nAnno shrugs and smiles, slipping a comforting arm around your waist. <i>“I miss him too, [pc.name].”</i>");

	annoFollowerTalkMenu(false);
	addDisabledButton(2, "Victor");
	processTime(5+rand(3));
}

public function annoFollowerTalkStudies():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“So, where’d you go to school?”</i> you ask.");
	
	output("\n\nAnno beams. <i>“Ausaril Tech. Go Jackals, whooo!”</i> she cheers, half sarcastically. <i>“It was the best school for science on the homeworld, so that’s where I went. I was lucky enough to get into the military-sponsored program... kind of like the Terran-Space Coalition’s ‘officer candidate school,’ though it didn’t end up with me doing a tour of duty or anything. Mostly just reservist training, and helped get me military-grade clearance for later when I went to work at Akkadi.”</i>");
	
	output("\n\nShe takes a moment to flex her arm muscles in a mock bodybuilder’s pose. <i>“Also helped me get in shape, too. I was a pudgy little shit before, and now look at me - I cut a pretty impressive figure, if I do say so myself!”</i> She gives you a playful wink before she resumes. ");
	
	output("\n\n<i>“Anyway, school. We ausar have always valued technology. Comes from living on a shitty desert planet that’s always trying to kill us. Tech made it possible for us to beat Mother Nature. Or at least escape her and find planets that sucked less. Ausaril Tech was the biggest and best technology academy, and I worked my ass off while I was there. Had my bachelor’s before I was twenty, ended up teaching a few lower-level theory courses a couple of years later.”</i>");
	
	output("\n\nShe smiles, her eyes faraway and reminiscing. <i>“That’s where I met my girlfriend, too. She was a cute little thing, fresh off the galactic rim, just looking to get her pilot’s license and having the damnedest time with all the high-level math. ‘I have computers for all this,’ she was always saying. Good thing I wanted some extra spending money and ended up tutoring on the side. That’s how we actually got together, me and Kaede. Man, I was a real party girl back then, too, always dragging her to games and frat shit. I don’t know how I had time to do any studying, much less </i>work<i>... actually, I do know: by not sleeping ever. I was pretty much a walking pharmacy of stims and caffeine by the time I turned in my last bits of doctoral work. Ended up fainting right in the professor’s office. Plop! Down I went the second I handed it off.”</i>");
	
	output("\n\nAnno laughs at herself: a good, hearty laugh from the gut. <i>“I had fun, though. Kind of miss it, honestly... I wouldn’t mind teaching again");
	if (flags["ANNO_MISSION_OFFER"] == 3) output(" if I ever get tired of working for you, boss... not that that’ll ever happen,”</i> she giggles, giving you a knowing wink.");
	else output(" now that I’m between jobs again. Steele Tech was nice and all, but maybe I’m not cut out for the whole research thing after all. I’ve done more than enough, you know?”</i>");

	annoFollowerTalkMenu(false);
	addDisabledButton(3, "Studies");
	processTime(5+rand(3));
}

public function annoFollowerTalkRelationships():void
{
	clearOutput();
	annoFollowerHeader();

	if (!haveFuckedAnno()) output("<i>“That’s a bit personal,”</i> Anno says, eyeing you suspiciously... before breaking out into a little grin. <i>“But for you, I guess I can spill the beans. Think you can keep a girl’s secrets?");
	else output("<i>“As long as you’re not the jealous type, boss, I don’t mind sharing!");
	output(" After all, I’m pretty invested in the whole polyamory idea, which necessitates a certain measure of sexual openness, doesn’t it?”</i>");

	output("\n\nShe grins. <i>“For the sake of conciseness, let’s just say I like having multiple relationships at once. A lot of my love life happens long-distance, you know, and it gets sooo lonely,”</i> she teases, pressing herself up against you. Giggling, she continues, <i>“But seriously, I don’t want to make a big deal out of it. I just... like a lot of people, and it’s impossible to pick just one that I want to be with. A lot of ausar work like I do, when it comes to love. We have a hard time with the whole monogamy thing, I guess - just too much love to go around!");

	output("\n\n<i>“So let’s see,”</i> Anno says, pulling herself up onto her desk and dangling her legs over the edge. <i>“Just before you showed up on Tarkus, I got back in touch with my college sweetheart, and we’ve sort of started up again. Kaede’s a great big sweetie when you get to know her, but she’s shy as all get-out. I have to drag her out of her comfort zone sometimes, you know? I swear she’d just sit in her cockpit playing vidya and eating ice cream if I didn’t make her go out and do things.”</i>");

	output("\n\nAnno pauses to think for a moment. <i>“Kaede’s my only really steady lover right now");
	if (haveFuckedAnno()) output(", aside from you, of course");
	output(". Doesn’t mean I’m not gonna try and find a date whenever we pull into port, but aside from");
	if (!haveFuckedAnno()) output(" her");
	else output(" you two");
	output(", I haven’t had much luck lately. Not like college, where I could pick up girls with a smile and a wink,”</i> she giggles.");

	if (flags["ANNOxSYRI_WINCEST"] != undefined)
	{
		output("\n\nAnno sighs, then gives a wry little chuckle. <i>“Then there’s this whole thing with Syri we’ve got going on now. I don’t </i>even<i> know what to feel about that. I love her with all my heart, but... I don’t know, it almost feels like masturbating, you know? She’s my twin sister, for fuck’s sake. What am I even going to tell our </i>parents<i>? They’re going to have a fit if they find out.”</i>");

		output("\n\nShe rubs her temples, groaning with frustration. After a moment, though, she manages a little grin and adds, <i>“Wouldn’t trade it for the world, though.”</i>");
	}

	annoFollowerTalkMenu(false);
	addDisabledButton(4, "Relationships");
	processTime(5+rand(3));
}

public function annoFollowerTalkSteeleTech():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“So, care to tell me a little bit about your");
	if (flags["ANNO_MISSION_OFFER"] != 3) output(" old");
	output(" job?”</i>");
	
	output("\n\nAnno’s ears perk up. <i>“You mean at Steele Tech? Sure, boss,”</i> she says, hopping up onto her desk and letting her long legs dangle. ");
	
	output("\n\n<i>“So you know your dad hired me, of course. Picked me up himself after a convention speech, gave me a job working in Steele Tech’s R&D at corporate headquarters. It was an amazing job, you know: all the resources and expertise of my government-sponsored lab at Akkadi, but half the regulations and red-tape, not to mention no government spooks breathing down my neck. Of course I couldn’t work on warp tech like I’d wanted to - Steele doesn’t have any of the contracts or patents related to the Gates - but it was still an awesome gig.”</i>");
	
	output("\n\nShe smiles a bit, her gaze wandering far away. <i>“Especially when Vic gave me my own lab and team right out of the gate. Even Akkadi didn’t do that. I always got the feeling that he trusted me... had faith in me. I don’t know why; I mean, all he had to go on was one shitty lecture I gave and talking over drinks after.”</i> Anno’s smile grows, though it takes on an unmistakably sad quality as she speaks. <i>“While I worked there, I could have sworn... I was certain he was grooming me to take over R&D. I only worked there a couple years, but Vic still gave me more and more responsibility, more teams to oversee, more important projects, entire labs even. Honestly, I’d figured that by now that I would be the head of Applied Sciences or one of the other big divisions.”</i>");
	
	output("\n\nAnno chuckles, <i>“Who’d have thought your dad’s last project for me would be tossing me out of R&D and to some fucking planetary branch post. I mean, what the hell? Let’s just take one of our best scientists and put her in the middle of bumfuck nowhere to run a store. That makes sense, doesn’t it?”</i> She runs a hand through her snowy hair and sighs. <i>“I still don’t know what I did to deserve that. I MUST have fucked up somewhere, I just... I just can’t see where.");
	
	output("\n\n<i>“Oh well,”</i> Anno says with a shrug. <i>“I’m out of there now, so I guess I shouldn’t complain. I do miss my lab, though. It had the most amazing view of the forests of Verdure...”</i>");

	annoFollowerTalkMenu(false);
	addDisabledButton(5, "Steele Tech");
	processTime(5+rand(3));
}

public function annoFollowerTalkEntertainment():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“So, what do you do for fun?”</i> ");
	
	if (haveFuckedAnno())
	{
		output("\n\n<i>“I think you know,”</i> Anno teases, reaching around to grab your [pc.butt].");
	
		output("\n\n<i>“Aside from that,”</i> you say, mock-rolling your eyes.");
	}
	
	output("\n\nAnno grins at you, saying, <i>“Well, I’m not exactly the party girl I used to be, but I’d like to think I still know how to have fun. If you think reading technical manuals and scientific journals is fun. Uh, alright, maybe not that fun, but that’s what I burn most of my free time doing these days. I don’t really have any hobbies outside of my field, you know? I do a little gunsmithing on the side, though: I’ve always liked messing around with weapons, custom designing them for myself. Figure if I ever get tired of blinding bitches with science, I could just open up a gun store. Heh, my sister would love that.”</i>");
	
	output("\n\nShe chuckles to herself. <i>“Let’s see... uh... man, why do you have to ask hard questions. Come on, ask me about warp theory or quantum mechanics or light drives - pitch me an easy question, [pc.name].”</i> When you decline, she groans in exasperation and slides down into her chair, legs crossed. <i>“God damn, I’m uninteresting. Well, uh, I watch a lot of TV I guess. Especially </i>Steph Irson<i>, James Farmer’s </i>Forty-Eight Hours<i> - oh, and </i>Magical Space Princess Lyota<i>.”</i>");
	
	output("\n\n<i>“Magical Space Princess Lyota...?”</i>");
	
	output("\n\nAnno blinks. <i>“What? It’s a great show!”</i> she says, a little too defensively. <i>“Any, uh, anyway. I’m pretty into music, I guess. Mostly rock and metal from the homeworlds, though I guess");
	if (pc.isHuman()) output(" you");
	output(" humans have some pretty decent jams, too. Tend to be a little heavier on the screams and growls than I like, but nothing beats a Terran death metal group if you just want to bang your head around and punch something.");
	
	output("\n\n<i>“You know, I actually used to play the bass way back,”</i> Anno adds, a hint of pride in her voice. <i>“I wasn’t </i>great<i> or anything, but it’s the fucking bass guitar, right? Used to play with some of the other rockers back at Akkadi after work, but nobody wanted to hang out at Steele Tech. Probably because I was their boss. That’d be a hell of a thing: ‘Oh, you missed practice last night? Well you can miss work today, too! Bwahaha I’m so evil hahaha.’ Not that I would actually do that or anything.”</i>");

	annoFollowerTalkMenu(false);
	addDisabledButton(6, "Entertainment");
	processTime(5+rand(3));
}

public function annoFollowerRemoveUniform():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“Hey, you know you don’t have to wear that uniform, right?”</i> you say, indicating Anno’s skin-tight company catsuit.");
	
	output("\n\nShe cocks an eyebrow at you. <i>“Huh? Oh, this old thing,”</i> she chuckles, poking at the tight material stretched over her thigh. <i>“I’ve been wearing it so long... I barely even notice it anymore. It’s practically a part of me.”</i>");
	
	output("\n\n<i>“Still,”</i> you say, <i>“I run a casual ship. You don’t have to wear it.”</i>");
	
	output("\n\nAnno shrugs at that and gives you a slight grin. <i>“Well, if you put it that way... I guess it wouldn’t hurt to wear something that breathes a little better. At least while I’m not planetside moving product.”</i>");
	
	output("\n\nAnno pulls down her zipper and shrugs out of the catsuit, making a little show of shimmying out of her sleeves and pants. She bends way over as she removes her suit to give you an unobstructed view of her big, squishy butt - that’s an opportunity you can’t help but take advantage of, and you give the shameless ausar a little smack for her trouble. She answers with a girlish squeal and a wiggle of her hips... before balling up her catsuit and tossing it in your face, giving you an almost-overpowering whiff of her musk as she scampers out of your grasp and into her wardrobe.");
	
	output("\n\nBy the time you disentangle yourself from the catsuit, Anno’s slipped on a button-up shirt from her dresser and is halfway through buttoning it up. She winks and sticks her tongue out at you in playful retaliation for your spank, though her bare tail is wagging happily behind her and her still-bare slit is glistening with the beginnings of her arousal. You watch with appreciation as your lover dresses, finishing with her shirt before finding a pair of jeans and boots to go with it. By the time she’s finished, you’d barely recognize Anno on the street: without her catsuit, she looks like a whole new woman.");
	
	output("\n\nSeeing you eyeing her, Anno sashays over to you and presses herself tightly against you. <i>“Like what you see, babe? Good... now, how’s about you tear these off me?”</i>");

	processTime(5+rand(3));
	anno.armor = new AnnosBlouse();

	//{sex menu}
	annoFollowerSexMenu();
}

public function annoFollowerWearUniform():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“So, any chance of you putting that sexy catsuit back on?”</i>");
	
	output("\n\nAnno grins");
	if (pc.tallness > anno.tallness + 6) output(" up");
	else if (pc.tallness < anno.tallness - 6) output(" down");
	output(" at you. <i>“Maaaaaybe,”</i> she teases, already starting to work the buttons on her shirt. <i>“To be honest, I kind of missed it. I always felt so... so </i>sexy<i> in it. I just loved the way it hugged all my curves.”</i>");
	
	output("\n\nYou gulp as Anno slides out of her shirt to reveal the full swells of her double-D cups. She indicates the dresser behind you, and you quickly pull out one of several neatly folded catsuits tucked into the top drawer. When you turn back to her, she’s already bare naked, standing on a pile of her jeans and shirt with her hands on her hips. You hand over the catsuit, so that your lover can make a bit of a show of stepping into it and drawing the sheer, skin-hugging suit up around her waist and zipping up its front. She pauses as she nears her bust, giving a little gasp as her tits are slowly drawn into the tight embrace of her uniform, finally disappearing beneath the black and yellow material. ");
	
	output("\n\nFinally, you’ve got your good old Anno back, complete with her skin-hugging suit that does the most wonderful things for her figure... ");
	
	output("\n\nSeeing you eyeing her, Anno sashays over to you, pressing herself tight against you. <i>“Like what you see, babe? Good... now, how’s about you tear this off me?”</i>");

	processTime(5+rand(3));
	anno.armor = new AnnosCatsuit();

	//{sex menu}
	annoFollowerSexMenu();
}

public function annoFollowerTalkContacts():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“What can you tell me about these... contacts of yours,”</i> you ask, nodding towards the small stockpile of weapons and equipment sitting around Anno’s quarters. ");
	
	output("\n\n<i>“Well,”</i> she drawls playfully, resting her chin on a fingertip, <i>“I can’t give you any specifics - for everyone’s sake, you know. But I’ve got a lot of friends in the Joint Ausar Fleet, some who </i>were<i> in the J.A.F. and now do some private contracting work, plus plenty of people in Akkadi and Steele Tech willing to pass me a little this-and-that. Perks of being friendly, I guess! I can get a lot of excess inventory from a lot of places for just a smile and a consignment contract. Doesn’t help anybody if all this junk’s sitting in some corporate warehouse, or shelved by the Fleet because it’s point-two watts underpowered than the normal model. You’d amazed how much stuff big corps and the like just leave sitting around that nobody misses when it goes missing.”</i>");
	
	output("\n\nAnno gives you a conspiratorial wink as she says those last few words, but refuses to elaborate further on her contacts or their... less than legal methods of supplying her. <i>“Still,”</i> she adds, <i>“at least I’ve got an income this way. Shady as it may be. Would I rather be blinding bitches with science? Sure. But this isn’t bad, and since you move around so much, I’ve always got new inventory coming and going, and new customers getting in contact with me. I could do a lot worse, you know?”</i>");
	
	output("\n\nThat, at least, is good to hear.");

	annoFollowerTalkMenu(false);
	removeButton(7);
	processTime(5+rand(3));
}

public function annoFollowerEarScritches():void
{
	clearOutput();
	annoFollowerHeader();

	output("You reach over and plant a hand right between Anno’s big, perky ears. She instinctively nuzzles up against your palm, eyes fluttering closed as you gently tease the bases of her fluffy white ears. Grinning, you let your hand wander and your fingers run freely through her snowy hair. Your companion’s tensions melt away in an instant as you give");
	if (!silly) output(" her a playful scratch");
	else output(" give that bitch a scratch. Bitches love scratches");
	output(". Anno groans happily. Her arms easily slip around your waist as you lavish her ears with affection, your fingers slowly moving up and down the two prominent peaks. You switch around to the fleshy insides of her perky ears, thumb teasing the bushy tufts of hair at their bases and making the ausar girl visibly shudder with pleasure.");
	
	output("\n\n<i>“Mmmm, right there...”</i> she moans, breath quickening as you tease her big, fluffy ears. Behind the ausar woman, her bushy tail swishes back and forth at ninety miles an hour, wagging uncontrollably as she melts in your grasp. <i>“Riiiight there....”</i>");

	processTime(4+rand(2));
	//[Sex][Tease]
	clearMenu();
	addButton(0, "Sex", annoFollowerEarScritchesSex);
	addButton(1, "Tease", annoFollowerEarScritchesTease);
}

public function annoFollowerEarScritchesSex():void
{
	clearOutput();
	annoFollowerHeader();

	output("With Anno panting happily in your arms and her tail wagging freely behind her, you figure the perky little ausar's in for a special treat.");

	annoFollowerSexMenu();
}

public function annoFollowerEarScritchesTease():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“Who’s a good puppy?”</i> you ask with a ruffle of her hair. <i>“Who’s a good girl?”</i>");
	
	output("\n\n<i>“I am...”</i> Anno moans with surety before nuzzling up against your hand. ");
	
	output("\n\n<i>“That’s right...”</i> you tease, stopping your scratches a few moments later to give her a final pat on the head.");
	
	output("\n\nAnno murmurs happily and rests her head against you, tail still wagging happily. <i>“Mmm. Do that again and I might just make you use those fingers somewhere else, "+ pc.mf("handsome", "cutie") +"!”</i>");
	
	output("\n\n... And some people wonder why ausars and humans get on so well. ");

	processTime(5+rand(3));

	clearMenu();
	addButton(0, "Next", annoFollowerMenu);
}

public function annoFollowerSexMenu():void
{
	clearMenu();

	if (pc.hasCock())
	{
		addButton(0, "Tailjob", annoFollowerTailjobSex, undefined, "Tailjob", "Have Anno use her fluffy tail to get you off. Warning: May cause fur matting.");
		
		if (pc.cockThatFits(anno.vaginalCapacity()) != -1) addButton(1, "Suck&Fuck", annoFollowerSuckAndFuckSex, undefined, "Suck & Fuck", "Have Anno blow you, then give her a rough fucking to top it off.");
		else addDisabledButton(1, "Suck&Fuck", "Suck & Fuck", "Requires an appropriately sized penis.");
		
		if (pc.cockThatFits(anno.analCapacity()) != -1) addButton(2, "Anal", annoFollowerAnalSex, undefined, "Anal", "Take Anno on a backdoor adventure.");
		else addDisabledButton(2, "Anal", "Anal", "Requires an appropriately sized penis.");
	}
	else
	{
		addDisabledButton(0, "Tailjob", "Tailjob", "Gotta have a penis for the white-haired ausar to introduce her tail to it.");
		addDisabledButton(1, "Suck&Fuck", "Suck & Fuck", "Gotta have a penis for the white-haired ausar to suckle it appropriately.");
		addDisabledButton(2, "Anal", "Anal", "Gotta have a penis to do buttstuff with the white-haired ausar sloot.");
	}

	if (pc.hasVagina())
	{
		addButton(3, "SixtyNine", annoFollowerSixtyNineSex, undefined, "SixtyNine", "Crawl into bed with Anno and give each others' feminine parts some oral attention.");
	}
	else
	{
		addDisabledButton(3, "SixtyNine", "Sixty Nine", "Gotta have a vajayjay to engage in some hot oral mouth-to-cunt action.");
	}

	if (pc.hasCock() || pc.hasVagina()) addButton(4, "ShowerSex", annoFollowerShowerSex, undefined, "Shower Sex", "Get clean when you get dirty. Take Anno to the showers for some slippery fun.");
	else addDisabledButton(4, "ShowerSex", "Show Sex", "You need some form of genitalia to properly enjoy a shower with the snowy ausar slut.");

	addButton(5, "Eat Her Out", annoFollowerEatDatDogslootOut, undefined, "Eat Her Out", "Give Anno some oral loving.");

	//In Soviet Ausaril, Science Fucks YOU
	//Anno owns a strapon. Add [Take Strapon] to her sex menu.
	if(flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined) addButton(6,"Take Strapon",getFuckedByAnnoStraponsSavinYouSlut,undefined,"Take Strapon","Have Anno use her strapon on you.");
	//Fuck Anno WITH SCIENCE
	//PC must be wearing a Hardlight Strapon. Add [Pitch Strapon] to sex menu
	if(pc.lowerUndergarment.hardLightEquipped) addButton(7,"Pitch Strapon",fuckAnnoWithScienceYoFukkinLadyBoi,undefined,"Pitch Strapon","Use your hardlight strapon on Anno.");
	else addDisabledButton(7,"Pitch Strapon","Pitch Strapon","You need a pair of strapon-equipped undergarments to do this.");
	
	addButton(14, "Back", annoFollowerMenu);
}

public function annoFollowerTailjobSex():void
{
	clearOutput();
	annoFollowerHeader();
	showBust("ANNO_NUDE");

	output("You pull the snowy-haired ausar close, your hands running up her slender arms and waist, and enjoy the feeling of her big, soft, hot breasts pressing against your own [pc.chest] and straining against the sheer fabric of her");
	if (anno.armor is AnnosCatsuit) output(" catsuit");
	else output(" blouse");
	output(". You give a little gasp as her soft-furred fingers brush along your [pc.butt]");
	if (!pc.isNude()) output(", slipping into your [pc.gear]");
	output(", the sharp nails on each of her long fingers gently scoring your bare [pc.skinFurScales] just hard enough to make you wince while your lover enjoys your body. ");
	
	output("\n\nYou return the favor by reaching behind the eager ausar to get a handful of her squeezable ass, but find your hand rebuffed by an errant swish of Anno’s fluffy tail. The ausar gives you a little wink as you try again, only to meet the same fate. <i>“What’re you going to do about it?”</i> she giggles, flicking her tail around her waist to brush against your [pc.hip].");
	
	output("\n\nOh, is that how she wants to play? You reach around the lusty alien and grab her snowy tail by the base, giving it just enough of a tug to make her breath catch in her throat. Anno moans as you gently stroke the long length of fluff, fingers running through her silky fur until she’s positively shivering, breasts pressing hard against you with every one of her shuddering breaths. Her eyes flutter when you finally release her soft tail again, and with just that, she’s putty in your hands. You spin her around, leaving her ass pressed into your groin where she can feel the rising girth of your [pc.cock] pressing into her pants. Her swishing tail brushes over your [pc.cockHead], just enough to make you shiver with sensation. ");
	
	output("\n\n<i>“I think I know what you want, dirty "+ pc.mf("boy", "girl") +",”</i> Anno teases, just as the tip of her tail curls");
	if(pc.legCount > 1) output(" between");
	else output(" around");
	output(" your [pc.legOrLegs] and brushes against your thigh");
	if (pc.legCount > 1) output("s");
	output(". <i>“Do you really like it that much? I always think it just gets in the way...”</i>");
	
	output("\n\nYou answer by taking her tail back in hand, gently guiding the bushy length around your [pc.cock]");
	if (!pc.isNude()) output(", your other hand working feverishly to free yourself from your [pc.gear], stripping yourself bare");
	output(". Though she doesn’t have the same kind of fine control over her tail as");
	if (StatTracking.getStat("characters/Saendra/orgasms") > 0) output(" Saendra");
	else output(" a kaithrit");
	output(", she still manages to do exactly what you wanted, brushing your bare cockflesh with the tip of her thick, fluffy tail, sending a shockwave of pleasure through you that nearly knocks you off your [pc.feet]. You try your hardest not to let on how much of an effect it’s having, but Anno’s perceptive enough to feel what’s happening, even if she can’t see it.");
	
	output("\n\n<i>“You </i>do<i> like it!”</i> she grins, wiggling her hips against your stiff prick to rub her ass cheeks across your turgid crown. ");
	
	output("\n\nYou brace for more stimulation, but to your surprise, Anno frees herself from your embrace and, giving an inviting wink over her shoulder, crawls onto her bed, arms and knees braced and spread on the mattress. Her tail curls up, beckoning you closer like a crooked finger. You slip up behind the inviting slut, letting your cock flop onto her upturned backside as you grab her wagging tail. Anno gasps at your boldness, but her hips wiggle happily when your fingers brush through her fluffy tail, and she easily relaxes, leaving you to do as you wish with her willing body. ");
	
	output("\n\nYou gently stroke her tail one last time before clenching around the tip and locking it in your fist. Anno coos, a little moan escaping her lips as you start to curl the slender bit of flesh at the fluff-ball’s center around the diamond-hard shaft of your [pc.cock]. Once, twice, almost three times you loop her tail around your prick, pulling it tight at the end until you both gasp with pleasure and pain at the tightness. ");
	
	output("\n\n<i>“Think you can hold it there?”</i> you ask, tentatively releasing the fluffy appendage. Anno actually grunts with effort, and you can see her struggling to keep her tail-muscles locked... and failing miserably. ");
	
	output("\n\n<i>“Ah, sorry boss,”</i> she whines, <i>“wasn’t really meant for this kind of thing... think you can keep a hold of it? I promise I’ll make it up to you...”</i>");
	
	output("\n\nYou tsk your tongue but take hold of Anno’s tail again - doesn’t look like there’s any other way to get what you want. You draw her soft, velvety tail back tight around your [pc.cock], shivering at the feeling of her delicate fur tracing across the bare length of your member. Soon,");
	if (pc.biggestCockLength() >= 15) output(" you’ve wrapped as much of your mammoth cockflesh in tail-fluff as you possibly can");
	else output(" your prick is utterly sheathed in the wrapped rings of tail-fluff");
	output(", just tightly enough to draw forth a tiny bead of [pc.cumColor] pre from your [pc.cockHead], which quickly drools down to stain Anno’s fluff a darker hue. ");
	
	output("\n\nBefore you can do anything with your new fluffy cocksleeve, though, Anno leans back, looking at you over her shoulder and reaching back to grab one of her ample cheeks, fingers digging in even through the");
	if (anno.armor is AnnosCatsuit) output(" sheer material of her catsuit");
	else output(" thick denim of her jeans");
	output(".");
	
	output("\n\n<i>“Just hold onto the tip, [pc.name],”</i> Anno coos, starting to slowly rock her hips forward. The velvety loops around your [pc.cock] move with her, sliding along your rigid length and brushing like a feather’s kiss across your sensitive skin. A shuddering sigh escapes your lips as Anno moves, your exhalation turning into a low, primal moan when she pushes back to slide her soft loops of fur back around your wang. Her plush ass turns up to rub against your drooling cockhead, catching another thick rivulet of masculine excitement from your engorged rod.");
	
	output("\n\nThough one hand’s occupied keeping your ausar cock-sheath wrapped tight around you, the other slips down to Anno’s wide hip to gently caress the curves of her body and gently guide her forward once again. The ausar gives a husky moan as you shift her forward and back again, every motion of her cloth-straining ass moving her tail with it and dragging your cock through the sinfully soft loops of her tightly held tail. Oh, that’s good.... You urge Anno on faster, steadily increasing the tempo of her body-rocking movements and keeping a constant cavalcade of sensation centered around your squirming, desperate [pc.cock]. You won’t last long like this, and frankly that’s alright. Anno’s doing this just for your pleasure, after all: no need to keep a girl waiting, is there? With a contented sigh, you let yourself go by relaxing all of your sexual safeguards and resistances and utterly submitting to the pleasure of Anno’s tail caressing your dick.");
	
	output("\n\nShe eases you over the edge with a gentle squeeze of her tail-muscles, rings of fur contracting around your desperate tool. You dig your one free hand into Anno’s ample ass, fingers pulling her against you as the climax comes, angling her back right under the arc of your ejaculation. She gives a high gasp as a hot, thick wad of [pc.cumColor] spunk spurts across her back, a few errant drops reaching up into her long hair. You grunt, hips pistoning against the tight, fluffy cocksheath as you spray your load across the ausar slut’s");
	if (anno.armor is AnnosCatsuit) output(" catsuit");
	else output(" blouse");
	output(" until she reeks of your scent.");
	
	output("\n\nWith a final, feral groan, you let loose the last of your orgasm. The final trickles run down through the fluff immediately around your crown. You pull out of your fluffy onahole and slump back against the bed to catch your breath for a moment. Anno’s tail, when you release it, curls up over her ass and wiggles happily, the tip brushing at some of the bigger cumstains on your lover’s back. ");
	
	output("\n\n<i>“Could have given me a heads-up there, lover,”</i> Anno remarks with a grin over her shoulder, peeling her top off as she pulls herself up off the bed. <i>“Now I’m gonna have to do laundry.”</i> ");
	
	output("\n\nYou chuckle and ruffle Anno’s cum-slathered hair, giving her a little push towards the ship’s autocleaner as you gear up.");

	pc.orgasm();
	processTime(15+rand(5));

	annoSexed(1);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerSuckAndFuckSex():void
{
	clearOutput();
	annoFollowerHeader();
	showBust("ANNO_NUDE");

	var selCock:int = pc.cockThatFits(anno.vaginalCapacity());
	
	output("You");
	if (!(pc.armor is EmptySlot)) output(" start pulling yourself out of your [pc.armor] and");
	output(" grab [pc.oneCock], the rapidly hardening member");
	if (pc.cocks.length > 1) output("s");
	output(" mere inches from Anno’s bliss-etched face. Grinning with anticipation, Anno slinks back onto her bed and twists around to watch you, her head resting in her hands. You let your dong drop onto her cheek: "+ String(Math.round(pc.cocks[selCock].cLength())) +" inches of hard, hot meat suddenly caressing her cheek is enough to make Anno’s breath catch. Her big, blue eyes flutter open, wandering over your naked form.");
	
	if (!haveFuckedAnno())
	{
		output("\n\nFlashing you a grin, the ausar whispers, <i>“You could have bought me dinner first.”</i> She nuzzles against [pc.oneCock], licking her lips");
		if (pc.balls > 0) output(" and reaching back to cup your [pc.balls], feeling the heft of them as she goes");
		output(". ");
	}
	else output("\n\n");
	output("You give your canine friend a little push, just enough to roll her over as you bark the command aloud; she giggles and complies, flipping onto her back with her head hanging over the edge of the bed at just the perfect angle to give you easy access to her throat.");
	
	output("\n\n<i>“Think you deserve a treat?”</i> you tease, scratching at one of her perky white ears. ");
	
	output("\n\nAnno giggles, answering <i>“Maaaaybeeee?”</i> as she reaches back to stroke your thigh, a soft, furred pair of hands slipping between them to");
	if (pc.balls > 0) output(" cup and caress your [pc.balls], squeezing just enough to make you shiver with pleasure");
	else if (pc.hasVagina()) output(" stroke the base of your manhood before gliding downward, paying a visit to the slick slit of your sex, teasing at the edges of your clitoral hood");
	else output(" caress the base of [pc.cock " + selCock + "], stroking the shaft ever so gently");
	output(" as you guide your [pc.hips] forward toward the welcoming warmth of Anno’s mouth.");
	
	output("\n\nShe opens wide for you, tongue guiding your [pc.cockHead " + selCock + "] in with a quiet slurp, cheeks bulging as your member slides into her inviting hole. Hot and humid breath courses around your [pc.cock " + selCock + "] as it enters her, finding a nice, hot holster that conforms to your prick’s girth and length with aplomb, tight where it needs to be, but loose enough that you don’t have much trouble pushing in enough dick meat to have your");
	if (pc.cocks[selCock].cLength() >= 8) output(" cock start distending her throat, which proves to be quite elastic as it stretches around your hefty member. This girl’s got some mastery over her gag reflexes!");
	else
	{
		if (pc.balls > 0) output(" balls");
		else output(" groin");
		output(" touch her brow.");
	}
	output(" Sated with your first foray between Anno’s lips, you take a moment to enjoy the tight, wet feeling of your new favorite cock-cozy around your member, the muscles of her mouth");
	if (pc.biggestCockLength() >= 5) output(" and throat");
	output(" rhythmically contracting and shifting around your dick with the precisions you’d expect from a well-fucked whore. For her part, the dog-slut beams up at you from beneath your throbbing cock");
	if (pc.cocks.length > 1) output("s");
	output(", clearly enjoying herself.");
	
	output("\n\nAnno’s head bobs slightly, reaching up to plant her lips on your base before withdrawing the few inches her neck can reach from her bent-back position on the bed. You’re going to need a little bit more than that if you want to get off, and a quick look between the two of you gains your lover’s assent. You lean in, grabbing the edge of the bed for balance as you shift most of your weight over Anno. At this new angle, it’s a simple matter to pull your hips back, withdrawing your prick from her mouth until your crown is all that’s left, Anno’s lips planted on it like a lover’s kiss, before you push back. ");
	
	output("\n\nYou go slow at first, easing yourself into her, giving her a chance to adjust to the new position. A few steady strokes, and you feel her throat relaxing around your shaft, her gag reflex utterly suppressed, leaving her mouth open and defenseless against your invading manhood. An opportunity you’d be a fool to waste. You move faster, hips bucking into her face as you slam your prick home into the welcoming embrace of your lover’s lips. She lets out a soft, strained moan as you pick up the pace, breathing coming quicker, more shallow, as she’s forcefully face-fucked into the mattress. ");
	
	output("\n\nBetween your powerful thrusts, Anno works her hands up the");
	if (anno.armor is AnnosCatsuit) output(" sheer surface of her catsuit uniform");
	else output(" sheer fabric of her blouse");
	output(", white-furred fingers tugging at the");
	if (anno.armor is AnnosCatsuit) output(" zipper");
	else output(" buttons");
	output(". She");
	if (anno.armor is AnnosCatsuit) output(" pulls it down");
	else output(" unbuttons her way down");
	output(" around her ample pair of sweater-puppies, letting them free from their confines to taste the musky air, her nipples both as hard as rocks. You shift your hands to grab her breasts, squeezing them roughly; they’re putty in your hands, so soft and forgiving, flesh flowing around your fingers until you can barely resist the urge to turn this into a titfucking.");
	
	output("\n\nBut the feeling of your cock pounding their owners’ face, her chest heaving with every thrust, dissuades you. Content to fondle and squeeze, you let your thumbs run across the stiff, pink peaks of her nipples, rolling their rounded points under your digits in slow, wide circles, one full rotation for every half-dozen pumps of your [pc.cock " + selCock + "]. Anno moans, her back arching at your touch as her breath catches between mouthfuls of cock. Still, her fingers travel down, pulling open her");
	if (anno.armor is AnnosCatsuit) output(" uniform straight down her belly to the crotch");
	else output(" fly");
	output(", where her hand quickly disappears.");
	
	output("\n\nYou thought she was moaning before... Her voice breaks into a high-pitched whine as her fingers delve her sex, her cries only stifled when your [pc.cock] is occupying her throat. You fuck faster, hips hammering to the beat of her wrist’s movements, reciprocating her every movement with one of your own. Soon, your voice joins hers, quiet moans turning into bestial grunts as your hips batter her face, her oh-so-skilled tongue, mouth, and throat working in concert to milk every inch of cockflesh that comes their way. ");
	
	output("\n\nBetween the lewd show of your lover jilling off and your own oral-induced pleasure, you find yourself hurtling toward climax. You have just enough time to warn Anno before, with a grunt and a");
	if (pc.balls > 0) output(" balls");
	else output(" groin");
	output("-deep thrust, you flood her mouth with [pc.cumColor] spunk. Anno gasps, eyes widening as your hot load goes straight down her throat. Your [pc.hips] piston forward again and again, using her throat like a cockmilker to squeeze out every last drop your can, thrusting and cumming until");
	if (pc.balls > 0 && pc.cumQ() < 100) output(" your balls feel dry");
	else if (pc.cumQ() <= 1000) output(" creamy seed is drooling down her cheeks");
	else output(" she looks several months pregnant, belly bloated with your spunk");
	output(".");
	
	output("\n\nFinally, you stumble back, catching yourself on a junk-laden shelf as your prick pops wetly out of Anno’s mouth, trailing trickles of seed across her cheek and onto the deck. She coughs and flops back onto her belly, spitting up a thick wad of [pc.cumColor] spunk onto the floor as she does so. She gives a deep, husky sigh, tail swaying happily as she beams at you, cum still dripping down her chin. ");
	
	output("\n\n<i>“That sure was a treat, boss... but how about you throw me a bone, huh?”</i> she says with a wolfish grin, her bushy white tail raising invitingly over her arched back.");

	processTime(15+rand(10));
	annoSexed(1);
	anno.loadInMouth(pc);
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", annoFollowerSuckAndFuckSexPartII);
}

public function annoFollowerSuckAndFuckSexPartII():void
{
	clearOutput();
	annoFollowerHeader();
	showBust("ANNO_NUDE");
	
	var selCock:int = pc.cockThatFits(anno.vaginalCapacity());

	output("<i>“I think I can manage that,”</i> you grin, slipping up onto the bed and taking hold of Anno’s flared hips, fingers digging into the");
	if (anno.armor is AnnosCatsuit) output(" elastic material of her sheer, flesh-hugging catsuit");
	else output(" thick denim of her jeans");
	output(". Before you can get carried away, Anno’s fluffy tail reaches up, its tip tickling your nose as its owner looks over her shoulder expectantly. ");
	
	output("\n\nYou mock rolling your eyes as you take hold of the wriggling appendage, stroking it gently as you guide it out of the way. Anno visibly shudders at the sensation, clearly enjoying a little affection on her canid parts. You give the tail a little push back through the hole in her");
	if (anno.armor is AnnosCatsuit) output(" catsuit’s");
	else output(" jeans’");
	output(" rear end before pulling the whole outfit down in one easy stroke, letting it ball around your ausar lover’s spread legs and leaving her nice and bare for you. She gives a happy moan as the last of her clothing falls free, wiggling her butt back into your bare, cum-slathered groin. You answer with a quick slap on one of her rounded cheeks, eliciting a startled squeak from her as her flesh jiggles in response.");
	
	output("\n\n<i>“Not yet,”</i> you tease, pulling your crotch back from her ample ass. You slide down to your [pc.knees], hands running up and down Anno’s toned legs and big, squishy butt as you go, feeling up every inch of bare ausar flesh, fingers running through the furred lowers halves of her legs, all the way down to her cute, clawed feet. Slowly, sensually, you work your way back up to your goal: the soft, pliant flesh of her ass; at your touch, her cheeks quiver and quake as Anno’s excitement makes itself known with a vigorous tail-wag that batters at your face. Again you move the troublesome tail out of the way as your hands spread her cheeks wide, revealing the flushed red lips of her sex. Anno tries and fails to suppress an anxious whimper as your breath comes hot on her naked slit, fingers holding her cheeks wide open, just enough to give her the slightest hint of a gape. ");
	
	output("\n\n<i>“Mmmm. What’re you...”</i> Anno moans, her voice trailing off as you lean in, tongue darting out to lap at the sweet ambrosia glazing the lips of her sex. She gasps and fidgets, feet clawing at the ground in response to the sudden, pleasurable touch. You give one of her full cheeks a squeeze to calm her twitching leg, letting you concentrate on the pair of eager holes at hand. Your tongue probes in, gently parting the veil of her cunny only to be instantly greeted with an almost overpowering scent of sex and need as a trail of slime rolls out onto your delving [pc.tongue]. You shudder at the sweet taste of your lover’s want, eagerly lapping up the sweet juices.");
	
	output("\n\nAnno shudders, moaning quietly as you start to eat her out. To your delight, you’re soon joined by one of Anno’s own hands as she reaches back between her legs to spread her lips wide for you, giving you unimpeded access to her honeypot. You reward the eager slut with a kiss right to the pleasure-buzzer, giving her another ecstatic shock that nearly ends with you getting a faceful of tail before you can bury yourself back between her cheeks. You can hear your lover moan and sigh as you start to really work your way into her, but your vision is completely blotted out by the two half-moons of ass in front of you, leaving you to navigate in darkness as your tongue probes deep into her womanhood, caressing the convulsing walls and lapping up her free-flowing juices as fast as you can. No matter how fast you slurp up her nectar, though, there’s always more escaping by you, beading on your cheeks and chin until you feel like you’ve just dunked your head. Well, that’s an ausar for you - you’re soon nose-deep in a glistening delta of slime and excitement as her body reacts to your touches, preparing itself for a knotty ausar cock to spear her sex wide open");
	if (pc.hasKnot(selCock)) output(" and that’s exactly what you’re going to give it");
	output(".");
	
	output("\n\nSatisfied that your pooch’s pussy is nice and ready for you, you rise back up and take hold of your [pc.cock " + selCock + "], dropping it into the spread hind cleavage of Anno’s ass. Her breath catches when she feels your man-meat slap against her slick skin. You can feel her positively shiver with excitement, looking back at you over her shoulder with bated breath, awaiting your next move. You flash her a grin and rock your hips back, sliding your prick lengthwise through the lips of her cunt, barely suppressing a shudder as the slimy, wet slit reaches out to kiss your cock, smearing it with her ample juices. A few thrusts through that channel, and your [pc.cock " + selCock + "] is coated with a nice sheen of fem-lube, glistening in the dim light of Anno’s store as you bring the [pc.cockHead " + selCock + "] to rest just barely parting the veil of her [anno.cunt].");
	
	output("\n\n<i>“H-hold on,”</i> Anno moans, leaning out of your embrace. You give her a questioning look, until she reaches under the bed and pulls out a sealed condom wrapper. With an understanding nod, you take the nanofiber sheath from its packaging and");
	if (pc.cockVolume(selCock) < 400) output(" slide it easily over your [pc.cock " + selCock + "].");
	else if (pc.cockVolume(selCock) < 900) output(" spend a moment stretching the tight condom out over your oversized dong.");
	else output(" spend a minute struggling to just encase the head of your massive prick in the human-sized sheath. Good enough!");
	
	output("\n\nWhen you’re finished, Anno smiles appreciatively over her shoulder, wiggling her ass into the underside of your wrapped wang. <i>“Come on then... I’m ready for you,”</i> she breathes, her white tail raising invitingly as your sheathed schlong slowly slides forward. ");
	
	output("\n\nAnno bites her lip, muffling a girlish whimper as your [pc.hips] rock forward, inching your [pc.cock " + selCock + "] into her sodden quim. You nearly join her as you feel your cock submerging into the sultry hole, surrounded by hot, wet, squirming walls as Anno’s pussy clenches around your intruding member. You push forward despite her body’s resistance, the ausar’s incredibly wet sex making it unnaturally easy to spread her walls wide. Anno moans as you plunge deep into her sex, fingers digging into the lip of her desk, tail flicking madly as you bottom out inside her");
	if (pc.cockVolume(selCock) >= 500) output(", your tremendous cock stretching her out almost painfully wide, distending her gut against the bed");
	output(".");
	
	output("\n\n");
	if (pc.balls > 0) output("Balls");
	else output("Hilt");
	output(" deep inside your bent-over lover, you give her a two-pronged slap on the butt, both hands digging into the pert assflesh on display. Anno yelps playfully, and her vaginal muscles contract hard around your member, wringing tight enough that you can feel her quickening heartbeat through the grinding walls of her pussy. With a firm grip on Anno’s hind-end, you drag yourself out of her slick slit, pleased to see your sheath slathered with her juices, so covered that it starts to drip onto the floor, pooling between your [pc.knees] - and with your cock withdrawn to the crown, even more of her fem-slime drools out of her pussy, a constant trickle down her thighs onto the bed.");
	if (pc.isAss()) output(" Maybe you’ll have to make her clean up after herself after you’re done with her...");
	
	output("\n\nFaster this time, you thrust back into Anno’s still-gaping pussy. She gives a sharp moan as your [pc.hips] slap into her, leaving her ass bouncing with the impact and your [pc.cock " + selCock + "] buried back into that wonderful hole of hers, surrounded by spasming muscles as she recovers from the potent thrust. Again and again you thrust into her, working yourself up to a steady rhythm of pussy-pounding, occasionally punctuating your peaks with a sharp slap on Anno’s jiggling butt or reaching up to cup one of her bouncing breasts, squeezing her stiff nips until she’s screaming for more. ");
	
	output("\n\nThanks to your recent orgasm and the minutes of pussy-eating that preceded your penetration, you’re soon greeted by the howling cries of Anno’s impending climax. You grin, slapping her cheeks and burying yourself deep inside your lover as she screams her pleasure, echoing in through the room; her pussy clenches down hard, milking your [pc.cock " + selCock + "] for all its worth as she cums and cums, going crazy around your thrusting cock. ");
	
	if (pc.hasKnot(pc.biggestCockIndex()))
	{
		output("\n\nWhile she’s at the peak of her pleasure, you decide its time for the main course. With one last, mighty thrust of your hips, you slam the turgid ball of your [pc.knot " + selCock + "] into the sodden delta of Anno’s drooling, orgasming sex. Her cries of pleasure crescendo into a high-pitched scream of shock and mind-wracking ecstasy as her cooch is forced open by your thick canid member. Your thrust pins Anno to the bed, spreading her legs and sex apart as you sink yourself into her, tying the two of you together.");
	}
	
	output("\n\nThanks to the wild, milking motions of Anno’s cunt, you can feel your own orgasm rushing up to follow hers. You push your prick as deep inside your lover as you can, letting her still-spasming muscles do the work for you, squeezing and caressing your cock, slathering it with hot juices trapped inside her wanton hole by the thick cock spearing her, unable to escape. Your orgasm hits you like a hammer, giving you just enough time to let loose a feral roar of pleasure as a thick wad of cum surges up your [pc.cock " + selCock + "], blasting into the trap of the tightly bound sheath around it. You grunt and groan with the spasms, hips bucking against Anno’s red-flushed ass as your load works itself out, eased along by Anno’s own squirming walls. ");
	
	output("\n\nChest heaving from exertion, you sigh heavily as your orgasm passes, contained in a now-bloated condom");
	if (pc.cumQ() >= 750) output(" that feels like a grapefruit stretching Anno wide from the inside");
	output(". For a moment, you let yourself lean forward, resting against Anno’s back as the last shockwaves of pleasure pass through you");
	if (pc.biggestTitSize() >= 1) output(", pressing your tits against her back and letting her feel your every tiny motion against her sweat-sheened skin");
	output(". With a soft moan, Anno leans back and kisses you, letting you taste your last orgasm still clinging to her lips as she locks tongues with you. You reach under her, cupping her heaving bosom until she squeals with over-sensitivity. Slowly, you roll both of your bodies over and under the cum-stained sheets, arms wrapping tight around her. ");
	
	output("\n\n<i>“Now </i>that<i> was a treat,”</i> Anno purrs, nuzzling back against you. <i>“Mmm... how about we stay like this for a little while, huh? I want to feel you go soft inside me.”</i>");
	
	output("\n\nWell, that’s one request you can’t refuse...");

	processTime(20+rand(10));
	annoSexed(1);
	anno.loadInCunt(pc);
	pc.orgasm();
	anno.orgasm();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerAnalSex():void
{
	clearOutput();
	annoFollowerHeader();
	showBust("ANNO_NUDE");

	var selCock:int = pc.cockThatFits(anno.analCapacity());
	
	output("You grin at the eager ausar and twirl a finger around, indicating for her to turn. She does so, shimmying onto the bed and resting on her knees, hands braced on the bulkhead beside it. Anno flicks her tail up, giving you a good view of her [anno.butt], the");
	if (anno.armor is AnnosCatsuit) output(" sheer material of her uniform");
	else output(" backside of her jeans");
	output(" stretched taut across her big, squishy cheeks. You step up and give one of those supple butt-cheeks a slap and squeeze, watching Anno’s flesh jiggle at your touch; its owner gives a little hiss of pain when you spank her, but settles in with a little wag of her tail as you start to grope and knead her backside, clearly not minding a little attention on her hind-end. Indeed, she’s outright moaning by the time you’ve worked your way to the other cheek, spreading them as far apart as her");
	if (anno.armor is AnnosCatsuit) output(" catsuit-uniform");
	else output(" jeans");
	output(" will allow.");

	output("\n\nWith a whimper of pleasure, Anno settles down atop the bed, ass in the air and wiggling happily as you feel up that perfect round ass. You can feel your [pc.cocksLight] jumping to attention as you move directly behind your ausar lover, your crotch dangerously close to her rear end... if only it weren’t for those troublesome clothes. With a little grin, you lean over her, your [pc.chest] pressing tight into Anno’s back as your hands run up her sides, playing across her ribs and the ample curves of her bust. Anno moans lightly as your hands tease their way around her tits, her tail wagging hard");
	if(pc.legCount > 1) output(" between");
	else output(" on");
	output(" your [pc.legOrLegs]; she gasps when you finally find the");
	if (anno.armor is AnnosCatsuit) output(" zipper hidden in her collar and give it a little tug, your hand drawing the pull-tab slowly down until her suit’s barely holding Anno’s [anno.boobs] back");
	else output(" first button near her collar and undo it. You slowly undo her blouse’s buttons one by one, teasing your hand in and cupping one of her tits when you have the chance");
	output(". Finally, with a short, final tug, the ausar’s breasts pop free of their constraints - and right into your waiting hands. Anno only just stifles a moan as your fingers squeeze her ample mounds, working her pert nipples between your fingers until you can feel a sudden surge of wetness soaking through Anno’s");
	if (anno.armor is AnnosCatsuit) output(" catsuit");
	else output(" jeans");
	output(" and into your crotch. Oh, she likes that...");

	output("\n\nYou work the zipper");
	if (!(anno.armor is AnnosCatsuit)) output(" on her jeans, until you’re able to pull them straight down her legs, letting them bunch into a pile between her fur-clad feet.");
	else output(" further down, until you’re able to peel the leggings of her skin-tight catsuit straight down her legs, letting the entire ensemble bunch into a pile between her fur-clad feet.");
	output(" Anno gives a little gasp as you yank her clothes off, but her ass manages to ratchet higher in the air, her fluffy tail teasing at your nose, curling invitingly downwards. You let a hand reach back, following it down to the gap between her thick ass-cheeks. Your fingers easily find their way to her sodden quim, rubbing along the glistening expanse of her pussy. It isn’t long before your digits are soaked in Anno’s slick juices, coated with the thick, sweet excitement of your ausar lover. She groans as your fingers slip inside her, teasing the entrance to her womanhood, even the hood of her [anno.clit], making sure to slather yourself up with as much of her juices as you can scrounge up - which has the added effect of getting the horny ausar slut nice and ready, breath coming ragged as she’s fingered deep, clearly expecting a nice cock to follow your fingers’ course. ");

	output("\n\nYou strip yourself out of your [pc.gear], letting your [pc.cock " + selCock + "] flop free into the crack of her ass, the crown just pressing into the base of her tail. Anno gives you a lusty grin over her shoulder and clenches down, momentarily trapping your prick between the taut cheeks. You answer with a sharp slap on her ass, enough to make her yelp and let you go. Once you've regained control of your prick, you spend the next few moments slathering it in the readily-available juices on your fingers, only stopping to refresh your supplies in the rivers running down Anno's thighs. ");

	output("\n\nSatisfied your [pc.cock " + selCock + "] is nice and wet, you move in toward your dark little prize, rubbing a few pussy-soaked fingers through the cleft of Anno's sex and up to the clenched ring of her ass.");

	if (flags["ANNO_ANALSEXED"] == undefined)
	{
		output("\n\nAnno shrieks in alarm as one of your fingers presses in on her hole, almost achieving entry. <i>“H-hey! What’re you doing!?”</i> she barks, voice breaking as you put a little more pressure on her ass, just enough to slide the first knuckle in.");

		output("\n\n<i>“Stopstopstop,”</i> she whines, her sharp nails digging into the wall, sphincter clenching tight on the intruding digit. <i>“Wrong hooooole.”</i>");

		output("\n\n");
		if (pc.isNice()) output("<i>“Come on... you’ll like it,”</i>");
		else if (pc.isMischievous()) output("<i>“Just bite the pillow,”</i>");
		else output("<i>“Deal with it,”</i>");
		output(" you say, pushing your finger in a little more, stretching her out as best you can. ");
	}
	else
	{
		output("\n\n<i>“You want </i>that<i> again?”</i> Anno whines, groaning as you slowly push one of your fingers into her. Unlike the first time you used your lover’s ass, she’s experienced enough to relax a bit around you, though she visibly stiffens as you manage to push past her sphincter, biting her lip and digging her nails into the bed. ");

		output("\n\nYou give her a reassuring pat on the butt.");
		if (pc.isNice()) output(" <i>“Come on... it’s not that bad, is it?,”</i>");
		else if (pc.isMischievous()) output(" <i>“I like big butts, and I cannot lie,”</i>");
		else output(" <i>“Don’t pretend you don’t like it,”</i>");
		output(" you say, managing to get your finger in to the hilt.");

		output("\n\n<i>“Fiiiiine,”</i> Anno groans, reaching back to grab one of her cheeks. <i>“Just be gentle, okay?</i>");
	}

	output("\n\nAnno whines, tail tucking in until you can’t see what you’re doing anymore. With an exasperated sigh, you lift her snowy tail back out of the way and spread her legs a bit wider, giving you room to work. For her part, Anno shudders as you push another finger in, but makes no further move to stop your impending assfuck beyond clenching tight around your fingers. ");
	
	output("\n\nSlowly, you start to move your fingers in and out, making sure to coat every inch of her tight passage with a nice, thick coating of fem-lube. You try to stretch her out, but just a little bit: gotta keep this hole nice and tight for the main event. ");
	
	output("\n\nTo your surprise, Anno glances over her shoulder at you and gives a nervous half-smile, saying, <i>“Go on already... stop teasing me and put it in.");
	if (flags["ANNO_ANALSEXED"] == undefined)
	{
		output(" Just be gentle... okay? It’s... I’ve never had anything back there before...”</i>");
	
		output("\n\nWoah, what? Anno’s never had anal before?");
		if (flags["FUCKED_SYRI_COUNT"] != undefined) output(" Hard to believe, considering her sister’s a galactic buttslut of the highest order!");
		output(" Well, you suppose you can take it easy on her this time....");
	}
	else output("”</i>");
		
	output("\n\nYou give Anno a reassuring nod, glad to see she’s at least somewhat on board with the idea, and withdraw your fingers. Her ass is left ever-so-slightly agape after your fingering, just enough to leave a little black hole winking at you as her body recovers. Before it can close, you bring your lube-slathered prick to bear, pressing the [pc.cockHead " + selCock + "] into the gaping well of her [anno.asshole].");
	pc.cockChange();
	anno.buttChange(pc.cockVolume(selCock), false, false, false);
	
	output("\n\nAnno gives a quiet, mewling cry of mixed pleasure and pain as you gently press your [pc.hips] forward. Her back arches steeply, and you can see her nails digging trenches in the bedspread as you slowly press your [pc.cock " + selCock + "] in. It’s hard going at first, no matter how much lube you’ve applied: Anno’s just so <i>tight</i> and is clamping down hard besides, slowing your entry to a crawl that seems little better than an inch per minute. Still, that at least gives you time to savor the sensation: the feeling of her tight, clenching ring squeezing down on you, parting against its will as your cock demands entry, is divine. You grip her ass firmly, fingers sinking into her pliant flesh as you spread her cheeks as wide as you can; Anno even wiggles her legs wider, stretching the pants bundled at her legs, doing everything she can to ease your entry. ");

	output("\n\nFinally, you find yourself");
	if (pc.cocks[selCock].cLength() >= 10) output(" unable to progress, your oversized prick as deep in Anno’s tight hole as you can force it");
	else output(" pressing your crotch to Anno’s backside, your cock fully sheathed inside her tight little asshole");
	output(". You stop yourself, giving Anno a few moments to adjust to your girth. While you do, you take a little pity on the trembling ausar, letting your hands roam across her sweat-slick body, cupping breasts and caressing curves. She slowly relaxes at your affectionate, comforting touches, even managing to let her tail wag hesitantly in the momentary calm. You lean in again, [pc.chest] against her back, and are welcomed with a brief kiss as Anno smiles at you over her shoulder. ");
	
	output("\n\n<i>“It feels weird,”</i> she groans, even as one of her hands disappears between her legs. <i>“It doesn’t hurt much, though. I think... I think I’m okay if you start moving.”</i> ");
	
	output("\n\nMusic to your ears. You plant your hands on Anno’s wide hips, holding your ausar lover steady as you slowly withdraw your [pc.cock " + selCock + "] from her bowels. You’re greeted with another whine from her, but this time you’re certain it’s a sound of pleasure as she fingers herself, back arching and tail raising at the dual sensations vexing her twin holes. A little faster this time, you push back into her, reveling in the tightness and heat of her hole as it welcomes you back in, reforming to the shape of your intruding cock. At the peak of your thrust, Anno’s tail shoots straight up and a low, guttural moan tears itself from her lips, a feral sound of pleasure. ");
	
	output("\n\nTaking a chance, you give Anno a relatively tame smack on the ass, just enough to get her big cheeks wobbling... and nearly find yourself cumming as she clenches down impossibly tight, her every muscle going wild in response to your sudden assault. It takes every ounce of willpower to keep Anno from milking the cum right out of you, and even then you’re left gasping for breath after the vice-like pressure relents from your [pc.cock " + selCock + "].");
	
	output("\n\n<i>“Oooh, that felt good,”</i> Anno purrs, tail flicking up to brush the tip of your nose. You catch the very tip in your teeth, giving it a playful shake - and feeling the ramifications in your cock as her ass jiggles in response. Shooting you a grin over her shoulder, Anno reaches back and grabs one of her own cheeks, holding herself open and inviting for you. <i>“Keep it coming, boss. I’m starting to enjoy this...”</i>");
	
	output("\n\nYou nod, and start to move again, pulling out and thrusting in again. You keep it slow at first, watching with marked interest while Anno’s face contorts as you hilt her, only for her tongue to roll out in a lusty pant once she’s left empty again. Another swat on the ass has her howling, at first a sharp cry of pain that quickly turns into a long, husky moan of sexual thrill. She clamps down on you again, but you’ve got her stretched out enough that even her crushing grip can’t stop you; indeed, you start to piston your hips faster, moving up to a brisk pace that soon has Anno locked in an endless moan of bliss, barely able to support herself under the overwhelming sensation of your assfucking. The desire to cum is almost too much to bear. ");

	// [Cum] [Anno on Top]
	clearMenu();
	addButton(0, "Cum", annoFollowerAnalSexCum, selCock);
	addButton(1, "Anno On Top", annoFollowerAnalSexAnnoOnTop, selCock);
}

// Buttchange in the core function that leads to this could result in an unintentional target-cock switch at this point if we don't pass the index along
public function annoFollowerAnalSexCum(selCock:int):void
{
	clearOutput();
	annoFollowerHeader();
	showBust("ANNO_NUDE");
	
	output("No reason to hold back the inevitable. You give Anno one last slap on the ass and slam yourself deep inside, just in time to get the full effect of her muscles going wild around your cock, milking you for all you’re worth. You don’t try to resist your body’s urges as Anno works you, instead reveling in the tightness of her quivering passage, savoring the warmth and wetness and exhilarating in the feeling of your cum rushing up through your [pc.cock " + selCock + "], hurtling into the dark embrace of Anno’s bowels. Your whole body lurches forward when the first orgasmic wave of bliss hits you, nearly throwing you over as your own excitement is left to run rampant. ");
	
	output("\n\nYour [pc.cock " + selCock + "] spasms as a thick load of [pc.cum] blasts out and into Anno’s ass. She yelps at the sudden");
	if (flags["ANNO_ANALSEXED"] == undefined) output(", unfamiliar sensation as she takes her very first load of spunk up the ass");
	else output(" sensation");
	output(", and her ass clenches even harder - you’re practically seeing stars as your cum-nozzle pumps her ass full of spooge. By the time you’re done, you are gasping for breath, barely able to feel your dick, while Anno is stretched out over the bed, fingering herself as you recover.");
	
	output("\n\n<i>“That wasn’t so bad,”</i> she admits as you withdraw from her, leaving a tiny trickle of seed drooling from her abused hole. ");
	
	output("\n\n<i>“I don’t think I’d mind doing this again, boss,”</i> Anno adds with a wink as you stagger off, collecting your [pc.gear] and leaving her to clean herself up.");

	if (flags["ANNO_ANALSEXED"] == undefined) flags["ANNO_ANALSEXED"] = 0;
	flags["ANNO_ANALSEXED"]++;

	annoSexed(1);

	anno.loadInAss(pc);
	pc.orgasm();
	anno.orgasm();

	processTime(30+rand(10));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerAnalSexAnnoOnTop(selCock:int):void
{
	clearOutput();
	annoFollowerHeader();
	showBust("ANNO_NUDE");

	output("Time for a change of pace. Between hilt-deep thrusts into your ausar lover’s spasming ass, you catch her attention with a gentle hair-pull and whisper into one of her towering canid ears, <i>“What do you think about getting on top for a bit?”</i>");
	
	output("\n\nAnno gives you a quizzical look before a small grin plays across her lips. <i>“I can try,”</i> she says, her voice trailing off into a little moan as you pull yourself out of her and roll onto your back, head resting on her pillow. Slowly, Anno rises to her knees, taking her time to look over her shoulders at her backside, even reaching back to spread her cheeks - clearly for your benefit. ");
	
	output("\n\n<i>“God, I feel </i>loose<i> now...”</i> she teases, turning about and squirming out of her bunched-up clothes. Another turn and a little bending gives you a faceful of ass, her big cheeks practically enveloping your [pc.face]. She gives her hips a wiggle, and you’re immediately drawn into a reverse-motorboat as her cheeks rumble around you, blacking out your world in a haze of jiggling ass-flesh. You grab the ausar’s big hips, trying to stop her, but only earn yourself a faceful of fem-lube from her overeager pussy as it grinds back against your face. ");
	
	output("\n\nAnno only stops when she’s good and ready - and you’re good and filthy. Casting a wink over her shoulder, the snowy-haired babe shimmies back down to her knees, planting herself just over your diamond-hard member, trapping the [pc.cockHead " + selCock + "] of your [pc.cock " + selCock + "] between the cheeks of her ass, kissing the rim of her still-open hole. ");
	
	output("\n\n<i>“Hold onto me,”</i> Anno says, leaning forward and bracing her hands against your [pc.feet]. You do as she asks, locking your hands back on her hips and holding her steady as she slowly starts to descend onto your dick. A small groan escapes your lips as your cock compresses, squeezed smaller by the sheer grip of your lover’s ass as she takes you. Anno moans, biting her lip as she tries to slide down your slick rod, but the going is slow again. Still, she’s suddenly picked up a little motivation in the change of positions, and makes an effort to wiggle her hips for you, actively clenching and unclenching her muscles as she goes down, making it a truly pleasurable trip until you’re buried as deep as you’ll go into that sweet ausar ass. ");
	
	output("\n\nAnno gives a groan, grinding her ass into your lap as she settles in, readjusting to your size inside her. You give her a moment, but before long find yourself pushing up against her full cheeks, urging her to start herself moving. <i>“Okay, okay,”</i> she says, steeling herself as she begins to rise, slowly dragging inch after inch of your member back through the wringing ring of her ass. Now it’s your turn to wail, crying out as Anno slowly begins to bounce on your cock: with her taking the lead, lifting herself up and down all with her legs, her ass is almost painfully snug, making her work for every inch of cockflesh she gets. To ease her journey, you reach around the turgid length of your [pc.cock " + selCock + "] and slip a few fingers into the sodden slit of her sex, easily parting her pussy’s lips to slide into the channel of her cunt. Anno lets out a surprised growl, clenching hard until you push another set of knuckles through her, firmly lodging your hand in her cunt. This time when she comes down on your rod, she’s also getting a pussy-full of fist, stretching both her holes out until you can feel your hand almost caressing your cock, separated by only a thin wall of flesh. You’re quickly rewarded by a fresh trickle of her feminine juices, flowing around your hand. ");
	
	output("\n\nAnno flashes you a grin, and starts to move faster. With something to take her mind off the incessant pressure on her poor");
	if (flags["ANNO_ANALSEXED"] == undefined) output(", virginal");
	output(" asshole, her movements becomes steadier, more confident, until it feels like she’s finally hit her stride, riding you like a champ. Now, though, that familiar need begins to rise again in your loins, the nearly-averted orgasm from before coming back with a vengeance. You don’t know if you can hold out again, but perhaps you don’t need to for long: you can hear Anno’s pleasured pants and gasps, her breath and heartbeat quickening as she gets truly into the quasi-double-penetration going on. Just a little more, and you might not be the only one who cums.");
	
	output("\n\nYou urge Anno faster, using your free hand to help lift her hind-end at the bottom of every bounce. Together, you’re making a chorus of sexy groans and low, sensual moans, rising toward the inevitable crescendo as your orgasms both approach inexorably, rushing forward to the point of no return. With a final cry of pleasure, Anno slams herself down on your rod, taking you to the hilt and wrist at once");
	if (pc.hasKnot(selCock)) output(", the thick ball of your knot thrusting into her eager behind");
	output(", and that’s all she wrote: you cum the moment you feel her cheeks press into your [pc.crotch], blasting her bowels with a double load of held-back cum; her muscles go wild when she climaxes moments later, milking your cock for every last drop as her pussy tries to swallow your fist, trapping you in her spasming channel as she unleashes a torrent of fem-cum that leaves a puddle spreading");
	if(pc.legCount > 1) output(" between");
	else output(" around");
	output(" your [pc.legOrLegs].");
	
	output("\n\nBreathing a sigh of relief, Anno collapses back into your arms, finally releasing your hand from the vice-like grip of her pussy. You wrap your arms around her, holding the");
	if (flags["ANNO_ANALSEXED"] == undefined) output(" anally-deflowered");
	output(" ausar tight as she recovers from her ordeal. She leans back and plants a little kiss on your cheek, even as she reaches down and gives your wilting [pc.cock " + selCock + "] a tug, just enough to pull you out of her abused anus... and let a trickle of spunk drool back out of her gaping ring, splattering onto the floor. ");
	
	output("\n\n<i>“That wasn’t so bad after all...”</i> Anno murmurs, snuggling back against you.");

	processTime(30+rand(20));
	anno.loadInAss(pc);
	anno.orgasm();
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerEatDatDogslootOut():void
{
	clearOutput();
	annoFollowerHeader();
	showBust("ANNO_NUDE");

	output("<i>“What do you say about helping me relieve some tension?”</i> Anno coos, slowly stepping around you, slipping behind your back. You give a slight shudder of excitement, feeling her ample chest tight against your back, stiff nipples poking through her");
	if (anno.armor is AnnosCatsuit) output(" sheer uniform");
	else output(" thin blouse");
	output(" to rub against you. Stroking a hand over your [pc.hair], Anno gives you a push down onto your [pc.knees] and slips back around you and onto the bed, deftly positioning her legs around your kneeling head. ");
	
	output("\n\nGrinning at you, Anno’s hands make a slow, sensuous trip up her body. Slowly, she starts to remove her top, taking her time to reveal the heavy mounds of her bust. With a shake of her shoulders, her perky tits bounce free of their confines, already flushed red with lust. ");
	
	output("\n\nYou make to grab one, but quickly find yourself trapped in a prison of");
	if (anno.armor is AnnosCatsuit) output(" latex");
	else output(" denim");
	output("-clad ausar-leg, tightly clasped around your shoulders and holding your head level with her crotch. <i>“I need you down there, lover,”</i> she coos. Anno emphasizes her point by wrapping both tits in her hands, shuddering happily as her fingers find her teats, pinching them just enough to get them diamond-stiff. As she does so, you start to become aware of a thick, earthy scent wafting up around you, utterly enveloping you in a rising cloud of ausar-musk. ");
	
	output("\n\nYou could hardly call the smell unpleasant, doubly so as Anno finally draws the zipper down past her groin, letting you have a front-row seat to the wet and ready slit within, crowned with a little tuft of downy white hair and surrounded by juicy rivulets of feminine excitement. Finally, Anno relaxes her legs from around you, using her feet to gently urge you into the gulf between her thighs. ");
	
	output("\n\n<i>“Dig in,”</i> Anno playfully commands,")
	if (!(anno.armor is AnnosCatsuit)) output(" unbuttoning her blouse and letting it slip from her shoulders,"); 
	else output(" shrugging out of the parts of her uniform still clinging to her,");
	output(" leaving her bare from the groin up. With her feet still on your back, gently pulling you in, there’s little to do but assent to her demand and bury your face in her sodden box. The musk of sex and need is almost overpowering down here, making your mouth water and");
	if (pc.hasCock()) output(" cock");
	if (pc.cocks.length > 1) output("s");
	if (pc.hasCock()) output(" jump to attention as");
	output(" lust hits you like a ton of bricks. You let a hand wander down to your own needy [pc.crotch], tugging at your gear as your [pc.tongue] makes its first tentative venture from your [pc.lips]. Your breath catches as your tongue makes contact with one of the wet lust-stains on your ausar lover’s thigh - and it has an impact on Anno, too, as her legs clench involuntarily around your head, pinning into your groin. You hold still, denying Anno the touch she craves until she relents, relaxing her vice-like grip on you. Though by now, your face is utterly drenched in her aromatic, sticky juices, well and truly plastered across your face.");
	
	output("\n\n<i>“Oh, you look good like that,”</i> Anno grins, using a finger to wipe a bit of girl-slime off your face, which she proceeds to lick off her fingers. <i>“The best part of us ausar girls: how </i>wet<i> we get... gotta be able to take those big, thick knots, you know.”</i> She sounds positively dreamy, already lost to fantasy.");
	
	output("\n\nWell then. You plant your hands on Anno’s hips and dive in. Your tongue slurps along the route between her leg and sex until you feel the rise of her mons, and are immediately rewarded by a little gasp from your lover, and a gentle trickle of excitement that nearly turns into a squirt as you trace your way up the hill and brush against the lip of her labia. Anno groans, back arching as you slide into her sex. A hand plants itself on your head,");
	if (pc.hairLength > 0) output(" fingers digging into your [pc.hair]");
	else output(" fingers wrapping around the back of your skull")
	output(", urging you on as your [pc.tongue] slithers past her folds and into the smooth passage of her [anno.cunt]. ");
	
	// if PC has some kinda bigass tongue
	if (pc.tongueType != GLOBAL.TYPE_HUMAN || pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nAnno only just holds back a scream as your inhuman tongue rolls out, slithering into her open passage, spreading her nice and wide as you eat her out.");
	// else has a normalish tongue
	else output("\n\nAnno gasps as your tongue slips into her, circling the spread lips of her cunt before slipping into her channel, spreading her out as you dig into her pussy.");
	output(" Again her legs clamp and squeeze around your head, muscles on auto-pilot as she stifles little gasps and moans of pleasure. You respond with faster movements, deeper inside her, swirling around in her spasming sex until you can taste the trickles of fem-slime beading around your probing [pc.tongue]. The taste is divine, sweet and just a little bitter, and utterly alien. You barely notice your own heavy breathing as the taste and smell of Anno’s growing excitement threaten to overwhelm you");
	if (pc.isCrotchGarbed())
	{
		if (pc.hasCock())
		{
			output("; your [pc.cocks] strain");
			if (pc.cocks.length == 1) output("s");
			output(" painfully under your [pc.gear]");
		}
		if (pc.hasVagina() && !pc.hasCock())
		{
			output(" your [pc.cunts] drool");
			if (pc.vaginas.length == 1) output("s");
			output(" obscenely, smearing your [pc.gear] with a mix of your and Anno’s sexual juices");
		}
	}
	output(". Your own arousal is almost painful, and yet denied the slightest hint of relief from the orally-fixated ausar. ");
	
	output("\n\nAmid thoughts of her cheating, groping ways, your [pc.tongue] finds its way out of her slick passage and upwards, to the flushed-red bud of her clit. Anno has just enough time to yelp, <i>“Not there!”</i> before her voice breaks into a shriek of pleasure, thighs clamping down around your head until you see stars - but your oral assault is undeterred, lapping up from the inside of her cooch until you’re probing the inside of her clit’s little hood, driving your puppy-slut wild with pleasure. ");
	
	output("\n\nWith a shuddering moan, Anno flops back atop the crate, legs nearly limp as you suck her clit up between your lips, rolling it between them until she’s panting and gasping, only able to articulate little yelps and moans. With a slight grin, you shift your grip up to the tops of her legs, hiking them up over your shoulders as you move in for a better angle on her now wide and ready pussy, completely defenseless against your onslaught.");
	
	output("\n\nAs your tongue goes in for another taste of Anno’s quivering quim, you feel a powerful twitch beside your ear as Anno’s leg moves, knocking limply against your back. You lick again, and feel the same motion, twice now. As you continue to lick and slurp at Anno’s cunt, you cast a glance aside, watching her leg start to spasm to the beat of your oral ministrations. You lick faster, suckling on her clit and probing deep into her pussy, working the poor, lust-addled ausar up into a leg-shaking frenzy. ");
	
	output("\n\nOh, she’s <i>panting</i> now! You grin as you feel her chest heaving, body going wild as you tease her most sensitive spots with unrelenting oral force, lapping up her sweet honey until it’s running down your chin, pooling ");
	if(pc.legCount > 1) output(" between");
	else output(" around");
	output(" your [pc.knees] as you feast. Good lord, she wasn’t kidding about how wet she’d get. But that only gets <i>you</i>");
	if (pc.hasCock()) output(" harder");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" wetter");
	if (!pc.hasCock() && !pc.hasVagina()) output(" more excited");
	output(", compelling you onwards as your lover gets closer and closer to the breaking point, losing control of herself until she’s a panting, gasping, moaning mess of a dog-slut.");
	
	output("\n\nWhen Anno cums after a few minutes of that, she certainly lets you know. Her back arches, clawed hands threatening to tear the bed to shreds, and her thighs clamp around your head, twitching and spasming as her [anno.cunt] contracts around your [pc.tongue], milking your probing appendage like it’s a cock, squeezing until you’re trapped inside her vice-like cunt, forced to yelp open-mouthed as her pussy contracts and squirts, a geyser of fem-cum splattering across your face and into your mouth.");
	
	output("\n\nYou recoil as Anno’s grip on your tongue finally relaxes, stumbling back from your [pc.knees] and wiping fem-cum from your face. With a heavy sigh, Anno drags herself into a sitting position, still breathing hard, tits heaving on her chest as she tries to catch her breath. <i>“Holy shit, boss... that was... I’m gonna have to you get you down there more often.”</i>");
	
	output("\n\nShe gives you a wink, and a come-hither crook of her finger. You stand and come to her,");
	if (pc.tallness <= 84 && !pc.isTaur() && !pc.isDrider()) output(" crawling up into her lap");
	else output(" parking yourself between her still-spread, sopping-wet thighs");
	output(". With a lascivious grin, Anno slips her arms around you, pulling you close into a... a wet tongue. You shudder as she slurps up along your cheek, lapping up the cunt-juice still smeared on your face. Still, you submit to the ausar’s affectionate grooming, letting her clean you up - and clearly enjoy the taste of herself all over you. ");
	
	output("\n\nWhen she’s finished, Anno sends you on your way with a sharp slap on the [pc.butt], whispering,");
	if (pc.hasCock()) output(" <i>“You keep that up, and maybe I’ll show you what an ausar can do with a big, hard bone...”</i>");
	else output(" <i>“If you’re lucky, maybe next time I’ll return the favor.”</i>");
	
	output("\n\nYou leave Anno to get cleaned up.");

	processTime(20+rand(10));

	anno.orgasm();
	pc.lust(15);
	annoSexed(1);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerSixtyNineSex():void
{
	clearOutput();
	annoFollowerMenu();
	showBust("ANNO_NUDE");

	output("With one sure motion, you pull Anno down into the bed, hands slowly moving down from her perky wolf-ears and starting to work at her shoulders and the base of her neck, massaging the taut skin underneath her");
	if (anno.armor is AnnosCatsuit) output(" slick catsuit of a uniform");
	else output(" blouse");
	output(". Anno’s voice curls into a murmur of curiosity, but once she feels your fingers going to work on her tense muscles, her tail resumes wagging happily, and she slowly relaxes in your grip.");
	
	output("\n\n<i>“Oh yeah... you’ve got some magic fingers there, boss,”</i> she sighs, resting her head in her arms. You shift up to straddle her back, fingers digging into the tense muscles around your lover’s neck <i>“Keep that up and I might have to put them to some real use.”</i>");
	
	output("\n\n<i>“I’m counting on it,”</i> you answer. Now that she’s laid out across the bed, you start to make your way downward, massaging down her back, occasionally stopping to stroke her long, snowy hair. She moans, a tiny little whine of pleasure as you find a sensitive spot on her back and dig into it, working your way along her sides and ribs, then to the swells of her breasts trapped between her and the mattress.");
	
	output("\n\nHer breath catches as your fingers brush the sides of her ample bust. To your delight, though, she recovers quickly, saying, <i>“Isn’t it traditional for a massage to happen... without the clothes in the way?”</i>");
	
	output("\n\nNow she’s talking. You nod and ease up, letting the ausar slip from your grasp - though she does nothing to keep your wandering hands from playing across her breasts as she stands up and takes hold of the");
	if (anno.armor is AnnosCatsuit) output(" zipper hidden in her collar");
	else output(" button near her neckline");
	output(". She puffs her chest out, making her big double-Ds strain against the material of her top as she slowly, sensually");
	if (anno.armor is AnnosCatsuit) output(" slides the zipper down");
	else output(" starts to undo her buttons");
	output(". It takes the better part of half a minute");
	if (anno.armor is AnnosCatsuit) output(" for the little metal clip");
	output(" to reach her chest, but the reward is well worth the wait as the pale tops of her tits come into sight, struggling to break free of their captivity. You can just see the faintest hint of a nipple poking through, the pink areola sliding out of");
	if (anno.armor is AnnosCatsuit) output(" the suit");
	else output(" her shirt");
	output(", when Anno wraps an arm around her chest in mock modesty, grinning at you.");
	
	output("\n\n<i>“Oops, almost embarrassed myself,”</i> she teases, turning on a heel to put her back to you.");
	if (flags["ANNO_MISSION_OFFER"] == 3) output(" <i>“How unprofessional of me... boss,”</i>");
	else output(" <i>“Good thing I don’t work for the company anymore. I might have gotten in some serious trouble”</i>");
	output(" she adds, emphasizing the last word with a shuddering hiss as she");
	if (anno.armor is AnnosCatsuit) output(" pulls the zipper");
	else output(" works the buttons");
	output(" down past her navel, shrugging out of the sleeves and leaving herself totally topless.");
	
	output("\n\nNot done yet, Anno plants a hand on the wall behind her bed, hooking the other through her belt. You watch appreciatively as she starts to pull her pants down, hips and tail both swishing gaily as she slowly pulls her waistline half way down the swells of her butt cheeks, letting her floofy white appendage pop free. It rises invitingly as she’s forced to bend over to remove the rest of her clothes, legs spread just enough to give you a glance at the glistening delta joining them, and a pair of heavy, full breasts hanging down from her chest as she pulls");
	if (anno.armor is AnnosCatsuit) output(" the suit");
	else output(" her jeans");
	output(" down to her feet and slips out of");
	if (anno.armor is AnnosCatsuit) output(" it");
	else output(" them");
	output(", leaving herself bare but for the fur coating her lower limbs and the aura of need and desire practically radiating off her.");
	
	output("\n\nBare as an ausar can be, Anno sashays back to the counter and leans over it, finally revealing her bosom to you as it’s all but in your face. She grins at you, watching your face as it’s overcome with desire, eyes drawn to the luscious curves, the rises and falls of her breasts. <i>“I think I know where that massage should start back up,”</i> she hints, sliding up onto the bed and rolling onto her back, giving you easy access to her chest. With a pat on the sheets beside her, she invites you in - and you’re quick to oblige. ");
	
	output("\n\nJoining her in bed, you straddle Anno’s flared hips, resting your hands on the tops of her [anno.chest]. She moans softly, hands locking behind her head as she closes her eyes and surrenders utterly to you, willing you to act out your desires upon her vulnerable body. You don’t need more than that to get you started, and soon your hands are wandering around the mountains of her breasts, rubbing and kneading and squeezing the bounty of boobflesh on display. ");
	
	output("\n\nAs you start to hit the sensitive spots, working up towards her perky nipples or caressing the tender undersides of her chest, Anno twitches and squirms under your wandering hands, gasping and moaning as you roll a nipple between your thumb and forefinger, taking the other into your mouth. Her back arches at that, breath catching as your tongue rolls out across her stiff teat, suckling ever so gently. ");
	
	output("\n\n<i>“Don’t stop...”</i> Anno begs as you kiss your way down from her nipple, into the valley of her cleavage. With a heavy heart, you ignore her pleas, slowly working your way down her body. With a flick of your [pc.leg], you’re facing downwards on her body, her splayed legs and bare pussy in easy reach. You brush your fingers through the downy patch of white fuzz sitting proudly atop Anno’s slit, and are immediately rewarded with a moan of pleasure, her hands reaching up to grab your [pc.butt]. ");
	
	output("\n\nYou look over your shoulder, smiling playfully at her. <i>“What was that about not stopping?”</i> you tease, wiggling your [pc.butt] over her face, close enough to brush her nose with your [pc.crotch]. She whimpers at that touch, and you see her tail stick straight out, alert and eager. Something in your mind ticks over <i>Ausar sense of smell...</i> just as you feel Anno’s fingers dig into your [pc.gear], pulling it off with a gusto. Now it’s your turn to gasp and shudder as you’re suddenly left bare to the world, soft-furred hands playing excitedly up your body. ");
	
	output("\n\nIt doesn’t take long, though for her probing digits to find");
	if(pc.legCount > 1) output(" the gash between your [pc.legOrLegs]");
	else output(" what they were looking for..");
	output(". You stifle a moan as one of her fingers traces along the lip of your [pc.cunt], only narrowly missing the bud of your [pc.clit]. She puts just enough force on that digit to urge you back, until your [pc.cunt] is situated directly above her face, close enough that the tip of her cute little nose is nearly pressed between the folds of your sex. ");
	
	output("\n\nAnno takes a deep breath, and sighs happily. <i>“You smell amazing, boss,”</i> she says, half-muffled in your muff. <i>“Positively delicious...”</i> ");
	
	output("\n\nThat last <i>“s”</i> turns into a long, languid slurp through the channel of your [pc.cunt], her long, flat tongue reaching out to probe in past your lips, slipping past your defenses. You hold back a whimper of pleasure, back arching as you feel the ausar’s tongue exploring you, teasing your sensitive slit’s deepest recesses. Spurred on by her alien senses and instincts, Anno grabs your hips, pulling you straight down onto her face. Finally your barriers break down, and you find yourself moaning and");
	if (pc.biggestTitSize() >= 1) output(" cupping your [pc.chest]");
	else output(" pinching your [pc.nipples]");
	output(", starting to rock your [pc.hips] over Anno’s probing tongue, helping her wriggle it in ever deeper. Your moans turn a pitch higher as her fingers enter the picture again, a pair of digits finding easy access behind her tongue, spreading your walls wide.");
	
	output("\n\nYou’d almost forgotten what you were doing, thanks to Anno’s expert oral skill. But the massage you promised isn’t finished without a happy ending for your tail-lifting slut of a lover. You plant your hands on her thighs, giving her enough of a nudge to tell Anno to spread ‘em wide. She answers with a slight moan and compliance, spreading wide enough that her cunt is ever-so-slightly agape before you even get to it. She’s wearing her excitement on her thighs already, her pussy glistening with fem-lube as her body prepares for the fucking it expects. You lean down, getting a nice whiff of the potent sex aroma coming from her cunt, and almost immediately feel your mouth watering, eager for a taste of her sweet juices. ");
	
	output("\n\nYou let your tongue play out, licking down the crest of Anno’s thigh, getting your first taste of ausar pussy. Your tongue tingles at her taste, kissing up the little rivulets running across her leg toward her slit, making your way up until your lips brush hers, all but kissing Anno’s cunt. Getting it straight from the source is too much to resist: before you know it, you’re burying your face between your lover’s legs, slurping away at the sweet sex. She moans, gasping as you brush your fingers across her clit, sending a visible shudder of pleasure up her quaking body. She answers with a deep thrust of her fingers into your own [pc.cunt], ramming them in to the knuckles as you tease her pleasure buzzer. ");
	
	output("\n\nFingers, lips, and tongues working into each other, you and Anno settle into a comfortable pattern of kisses and pussy-spreading probes, eating each other out until Anno’s face feels drenched with your mounting excitement, and she’s sitting with her ass in a growing pool of femslime. You feel your chest heaving, diamond-hard [pc.nipples] dragged across the slick skin of Anno’s belly with every breath, making even that simple act overwhelm you with pleasure. Your loins are a never-ending cavalcade of sensation as fingers plunge into you, a tongue slurps and slides along the lips of your [pc.cunt], and Anno’s full lips suckle on your sensitive [pc.clit], making you shiver and groan, clenching down hard on her delving digits.");
	
	output("\n\nJust a little more.... You moan as Anno slides");
	if (pc.vaginas[0].looseness() <= 1) output(" a third digit into your tight pussy");
	else output(" the full length of her fist into your stretched-out, well-used cunt");
	output(", stretching you nice and wide with a few even strokes, punctuating each with a long lick across your labia and clit, again and again until your [pc.hips] are shaking on their own, whole body shuddering as you feel the budding hints of orgasm welling up from your well-fucked crotch.");
	
	output("\n\nYou surrender to your pleasure, mindlessly suckling the nectar deep in your lover’s pussy as she brings you to climax. Your moan out a stuttering, <i>“c-cumming!”</i> when you do, voice breaking into a squeal as your [pc.cunt] spasms around Anno’s probing tongue. Your world explodes in pleasure as you cum, raining femspunk onto Anno’s face as your [pc.legOrLegs] clench around her, muscles recoiling from the overwhelming sensation. Still, your tongue is ceaseless in its pursuit of your partner’s pleasure even in the face of your own, and before you’ve calmed down, it’s Anno’s turn to scream out her climax, voice echoing down the corridors as her pussy goes wild around your tongue buried to the hilt inside her. And she’s a squirter, no doubt about it: you manage to pull back just in time to avoid a faceful of ausar girl-spunk as Anno cums, splattering the bed with her thick, aromatic love juice.");
	
	output("\n\nPanting with exhaustion and staggered by errant bursts of ecstasy in the afterglow of your lovemaking, you slump down, resting your head in in the soft, wet valley of Anno’s thighs, trying to catch your breath. You can’t stop a smile, though, as you see Anno’s tail wagging happily, especially as you reach out and stroke the soft white appendage, sending another shiver of bliss through your lover as you rest in each other’s arms.");

	pc.orgasm();
	anno.orgasm();
	annoSexed(1);

	processTime(30+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerShowerSex():void
{
	clearOutput();
	annoFollowerHeader();
	showBust("ANNO_NUDE");

	output("<i>“You know, I was just going to hit the shower, boss,”</i> Anno says, slowly");
	if (anno.armor is AnnosCatsuit) output(" drawing the zipper on her catsuit down");
	else output(" unbuttoning her blouse");
	output(". <i>“Care to join me?”</i>");
	
	output("\n\n<i>“Wouldn’t miss it,”</i> you say with a grin,");
	if (pc.tallness >= 5 * 12) output(" sweeping Anno up off her feet and carrying the giggling, tail-wagging bundle of horny ausar toward the bathroom");
	else output(" rushing after the snowy ausar and grabbing a handful of her ass as you walk. She swishes her tail playfully across your face, letting it drape around your shoulders, holding you close as you make your way to the showers");
	output(".");
	
	output("\n\nThe two of you stumble the rest of the way, hands and lips all over each other. Anno’s back meets a bulkhead just beside her bathroom and her legs wrap around you. Meeting her desire, you kiss your way down her neck and then the full mounds of her tits to bring your lips around one of her stiffening teats. The canine-like girl moans, back arching when your [pc.tongue] laps over the pebbly ring of her areola. You pause there, slowly circling her nipple and lavishing it with your tongue until the little point is diamond-hard. Your hand drifts down her side, fingers teasing across the sensitive flesh of her inner thigh until her breath catches; Anno bites her lip, trying not to cry out. One hand grip slips between her legs to the sodden gulf of her sex, already slick with her excitement. Your fingers brush along her lower lips, sending a shiver up the horny ausar’s body. A low, husky moan reaches your ears, and Anno’s arms wrap around you to pull you tightly against her. You let go of her breast in acceptance of a tongue-filled kiss, punctuated by one of your fingers penetrating her sex and sliding into the wet channel of Anno’s pussy. ");
	
	output("\n\n<i>“Slow... slow down,”</i> she moans with fluttering eyelashes. Probing into her, you tease the tender inner walls of her cunt. Her muted protests are practically an invitation: you push another finger in and spread ‘em wide, letting the natural juice dribble down into the palm of your hand. Anno blushes and squirms as you tease her, leaving her neck open for you to kiss and nibble on. You drink deeply of her scent while you do; the heady mix of sex and sweat and her sweet, lavender hair leaves you breathless, desperate for more.");
	if (pc.hasCock())
	{
		if (pc.isCrotchGarbed())
		{
			output(" Your [pc.cocks] pull");
			if (pc.cocks.length == 1) output("s");
			output(" desperately against your [pc.armor], swelling with your own mounting need. One of Anno’s hands brushes across it, gently cupping your turgid bulge and starting to tug you out of your gear.");
		}
		else
		{
			output(" Your unclad [pc.cocks] swell");
			if (pc.cocks.length == 1) output("s");
			output(" with your own mounting need, hard and hot against Anno’s bare thigh, so close to penetration you can almost feel the heat welling off of her sultry sex. One of her hands wraps around [pc.oneCock] turgid member, gently stroking it as she pulls your [pc.gear] away.")
		}
	}
	else if (pc.hasVagina())
	{
		output(" Your own [pc.cunts]");
		if (pc.vaginas.length == 1) output(" is");
		else output(" are");
		output(" boiling with need, running slick with excitement as you drink in your lover’s scent. You give a little moan as Anno finally returns the favor, one of her white-clad hands brushing aside your [pc.gear] and tracing across the lips of your [pc.cunt].");
	}

	output(" Breathless, Anno desperately pulls your [pc.gear] off to let it clatter to the floor before giving you a push through the bathroom door.");
	
	output("\n\nYou all but tumble into the shower stall, and a blind, snow-furred hand clumsily reaches out towards the dial, cranking the water on around you. You gasp as the first gout of hot water splashes over you, only to find yourself shoved up against the wall of the stall as Anno frees herself from your grasp and takes charge, slipping down to her knees and");
	if(pc.legCount > 1) output(" spreading your [pc.legs] apart.");
	else output(" moving in on your [pc.leg].");
	
	// Cockwielder Variant
	if (!pc.hasVagina() || (pc.hasCock() && rand(2) == 0))
	{
		output("\n\nYou can’t suppress a groan as Anno’s fingers wrap around your dripping member, using the flowing water as lube to quickly pump up and down your swelling length and jacking your [pc.cock] until it’s nice and hard. Her cheek nuzzles against your [pc.crotch] while her tongue reaches out to caress");
		if (pc.balls > 0) output(" your [pc.balls]");
		else output(" the [pc.sheath] of [pc.oneCock]");
		output(", one long lick carrying her along the long shaft of your cock and straight to the crown. Anno looks up and shoots you a grin before wrapping her lips around your cockhead");
		if (pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_FELINE) output(", brushing her tongue across the bumps and ridges of your feline member");
		else if (pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_EQUINE) output(" , her jaw straining to encompass your flared equine girth");
		output(". One of your hands settles atop Anno’s head, stroking the mat of wet hair between her perky ears as she teases your crown, gently urging her onwards.");
		
		output("\n\nShe resists for a long, obstinate moment, content to merely suckle from your turgid member and lavish its tip with her tongue. Her hand continues to pump your length, too, moving with such speed and skill that it isn’t long before Anno gets a nice, thick drop of pre right on her waiting tongue. She pulls herself off you, licking her lips as water cascades down over her face, and she cups the full mounds of her tits toward the shower head to let it get them nice and soaked. Winking at you, the ausar reaches up and grabs the little bar of soap from the dish and, squeezing her breasts together with her shoulders, starts to wash them down, scrubbing every inch of supple titflesh until they’re covered in suds and bubbles. As she works, her lips lock back around your crown, sliding down your slippery shaft; she’s not going to let you go soft while she gets ready! You’re treated to a spectacular view of Anno on her knees: her big blue eyes lock with yours as she sucks you off, her tits glistening beneath your length as she rubs them down. ");
		
		output("\n\nFinally satisfied that her chest is as slippery as can be, Anno gives you a sultry wink and leans up, dropping your [pc.cock] from her lips to her cleavage in one smooth motion. Her hands lock around her perfect mounds, squeezing them tightly around your wet-and-ready cock. <i>“Like it?”</i> she asks with a grin, not waiting for an answer before rocking her shoulders back and forth and letting your member slide through the slippery grasp of her cleavage. It nearly pops out but for her quick-acting fingers, which keep you nice and trapped in her heaving bosom. Her kneeling legs start to power her motions as she slowly rises and falls back, taking your cock with her as she moves, guiding it through every inch of her slippery, hot, soapy rack: your crown pokes out between them one moment, just long enough for her to kiss and lick your [pc.cockHead], before vanishing back into her sudsy tits again the next. ");
		
		output("\n\n<i>“The best thing about shower sex: the mess is self cleaning,”</i> she says, more than a hint of suggestion in her voice. She’s moving faster now, all but bouncing on her knees. Her eyes never leave yours, totally focused on you even as she starts moaning and panting, working hard to get you off. Trapped as you are between two hot, slick mounds of sexy ausar tit, you soon feel the rising heat of impending and inescapable pleasure welling in your loins. Anno sees it in your eyes and redoubles her efforts, pumping away at your desperately clenching [pc.cock] until you can’t hold back anymore. ");
		
		output("\n\n<i>“Come on, boss. Make a mess,”</i> Anno urges, leaving her mouth wide-open at that last syllable, just as you let loose the first jet of jizz through the gap between her boobs. That first ribbon of [pc.cumColor] doesn’t quite hit her mouth, instead splattering over her cheek - and vanishing a moment later as the hot, still-liquid load is washed away by the powerful spray of the showerhead. Another jet of spunk sprays over her chin, then the next is caught between her tits, filling the valley of Anno’s cleavage with your hot, creamy seed as she continues to pump you, still moving all through your orgasm and using her tits to milk every last drop from you. ");

		pc.orgasm();
		
		output("\n\nWhen your climax passes, you’re left slumped against the shower stall’s wall and trying to catch your breath. Anno licks an errant bit of cum from her cheek as she stands, letting the water clear the rest for her. With a little wiggle of her hips, Anno makes her way to the front of the stall and plants her hands on the ceramic tiles, shifting her legs wide apart and raising her tail invitingly to give you a good look at the still-slightly parted lips of her sex. ");
	}
	// Cuntcommander Variant
	else
	{
		output("\n\nAnno breathes out while she shimmies down, her chest rocking with an exhalation that lands hot and humid across your bare sex. You shiver with delight when the rush of warm air brushes across the water-slick lips of [pc.oneCunt]. Slowly, she brings her cheek in to rest against your thigh, hands resting on your [pc.hips] to steady your body. You need it, too: you only notice how you’re shivering in anticipation when you’re suddenly stopped and forced to hold still in Anno’s firm grasp. ");
	
		output("\n\nWith tantalizing slowness, Anno lets her tongue loll out, the tip just grazing your thigh before making its way across the mound of your vulva and brushing along to just the crest of your clit before breaking off and starting again: damn tease! You stifle a moan as she does it again, this time just flicking across the lip of your buzzer’s hood to send an electric shock of pleasure through you that sets every nerve afire with desire. Your hand drifts instinctively to the wet mess of snowy hair atop Anno’s head, trying to guide her in; she resists for now, instead content to tickle and tease your thigh and lips while never quite making full contact. ");
		
		output("\n\nYou’re soon approaching your limit: your [pc.legOrLegs] are trembling, feeling like");
		if (pc.legCount == 1) output(" a mass of jelly that quivers");
		else output(" masses of jelly that quiver");
		output(" helplessly at Anno’s touch, ready to give at the slightest sexual stimulation. With a wolfish grin, Anno locks eyes with you and gives you a knowing wink before letting her tongue do the talking. A shock of pleasure surges through your body when Anno’s tongue finally gives you want you want - what you need - gliding across the full swell of your [pc.clit]. You can’t hold in a low, husky moan, squirming at the sensation of her oral assault; she answers with more licks across your blood-swollen buzzer.");
		
		output("\n\nWithout Anno and the wall supporting you, you’re sure you’d collapse under the overwhelming pleasure. Despite that, the hand planted between Anno’s ears instinctively pulls her inward, mashing the ausar’s face against your [pc.cunt] to try getting more and more from her probing tongue. Gigging, Anno gives it to you: she traces her tongue from your clit down into the folds of your pussy, parting your lips and slipping in. Your head rolls back, eyes squeezed shut as Anno explores your [pc.cunt], licking across your tender walls, letting your muscles squeeze around her, happily lapping up your flowing excitement as she works. She’s relentless, slurping and lapping minute after minute, never giving you a moment’s respite. Her fingers dig into your [pc.hips], holding you fast as she delves into your sex with a long tongue that tastes your deepest recesses. Your free hand drifts upwards,");
		if (pc.biggestTitSize() >= 1) output(" cupping one of your [pc.breasts]");
		else output(" caressing your flat chest");
		output(" and pinching the [pc.nipple] there with a squeeze on the tender mound that’s just forceful enough that you can’t help but cry out. You’re desperate for pleasure now, hips bucking on Anno’s tongue. If she doesn’t back off soon, you won’t be able to stop yourself from cumming....");
		
		output("\n\nThat seems to be Anno’s plan. You’re moaning like a bitch in heat now while your juices mix with the running water of the shower");
		if(pc.legCount > 1) output(" between");
		else output(" along");
		output(" your [pc.legOrLegs], trickling hot down your thigh");
		if (pc.legCount > 1) output("s");
		output(" between Anno’s rhythmical licks and kisses across your sex. You’re soon reaching your limit, voice breaking higher and higher into lusty moans and cries, even begging Anno for release. She’s eager to grant it, barely acknowledging your cries but for one look up at you to lock eyes with you and hold your gaze firmly, making you watch as she brings you to the brink of orgasm.");
		
		output("\n\nFinally, you can take no more. With a shrill cry of feminine pleasure, you let your ausar lover bring you over the edge. Sexual bliss overtakes your every nerve, your body afire with desire while Anno feverishly eats you out with a tongue that moves faster and faster as you surrender to ecstasy. Shudders and shakes rock your body, their force nearly enough to make you go limp with exhaustion by the time your orgasm passes. Your prolonged moment of passion leaves Anno’s face awash with your juices - which quickly wash away as the downpour continues from the shower head. With a little wiggle of her hips, Anno makes her way to the front of the stall and plants her hands on the ceramic tiles, shifting her legs wide apart and raising her tail invitingly to give you a good look at the still-slightly parted lips of her sex. ");

		pc.orgasm();
	}
	
	// Combine for Great Ausar Rugmunching
	output("\n\nHer intent is clear, and as the aftershocks of your climax pass, you figure you owe the lusty slut a reward for her efforts. You step after her, one short stride putting you right behind the drenched, dripping curl of her up-raised tail. You let your hands wander across her body: they start at her shoulders and slide slowly down, making sure to sensuously rub at the right spots as they go. Your fingers slip around her ribs and up her chest to cup the slippery mounds of her tits, giving them an affectionate little squeeze. Anno moans at this, her back arching and her hips squirming back against your [pc.crotch] while you massage her big breasts, letting your fingers sink into her soft, pliant flesh. Her nipples stiffen between your digits, and you feel your lover being wracked by a full-body shudder as you roll the twin points between your fingertips. Teasing and squeezing, you keep up the pressure on Anno’s breasts until her breath is coming out in shuddering gasps and her sodden figure is trembling at your every touch. You can only imagine the sultry gulf forming between her legs by now as the ausar’s plentiful excitement mixes with the hot water of the shower into a glistening, inviting delta. ");
	
	output("\n\nYou’re on your [pc.knees] before you know it, and hands reach out to grope an altogether different pair of soft mounds. You spread her cheeks apart, trying to ignore the flick of her tail across the bridge of your nose. With a squeeze of her ass, you earn a moan and a tail-wiggle from the ausar babe, ending with her back-end perched atop your head like a hat, finally giving you unimpeded access to her ample rear. More importantly, you’ve now got a straight shot to the slick slit of her sex and are able to see the glistening lips of Anno’s pussy beading with a mixture of water and her own ample juices. ");
	
	output("\n\n<i>“Fuuuck,”</i> Anno moans, voice low as you draw a pair of fingers along the lip of her cunt, only just stopping yourself from penetrating her again. You watch with glee as a thin trickle of lubricant runs from her hole and drools across your fingertips in answer to your constant teasing. You snatch the little bead up, acting before the shower can wash it away, and lick it from your fingertips. Your breath catches at the potent, sweet taste of your lover’s passion. That does it - that one taste kicks your instincts into high gear and drives away the last of your restraint. You bury yourself between Anno’s plush cheeks to thrust your [pc.tongue] deep between her parted lips, desperate for more of that wonderful sweetness. ");
	
	output("\n\nAnno gasps and moans as you tongue-fuck your way into her, worming your way through her lips and into the slick, eager passage beyond them. Her walls squeeze around you, instinctively repelling you at first, but then seeming to urge you in deeper as you drive against them. You give the lusty slut everything you have to give, pushing in deep and lavishing her squirming walls with oral affection. You’re rewarded with Anno’s cute moans and an ever-increasing flow of her sweet nectar, beads of it rolling across your tongue and nose only to vanish into the running water. As you lick through the valley of her womanhood, Anno’s back slowly begins to arch. Her whole body slinks down the slick wall of the stall, bending over to let you delve ever deeper into her sex. ");
	
	output("\n\n<i>“Ah... I think we’re going to need </i>another<i> shower after this,”</i> Anno remarks with a grin, rocking her hips back against you and giving you a facefull of wet ass on top of everything. You give her big cheeks a playful squeeze, holding her back before you drown in her slippery backside. Anno coos happily as the new angle brings you deeper inside her, and even moreso when you let one of your hands slip from her behind to venture up between her legs and tease your fingertips across the bud of her stiff little clitty. Now <i>that</i> gets her going: a few minutes of that and her moans are reaching an ever-higher pitch. The movements of her hips become more desperate, frantic for your every touch. Her juices practically pour across your [pc.tongue] as her body prepares for a thick, knotty ausar cock that isn’t coming. You lap up every drop you can, sending waves of palpable pleasure through Anno’s quivering body until she’s practically a puddle of fuck on the shower floor that’s barely able to keep herself upright. ");

	anno.orgasm();
	
	output("\n\n<i>“Just a... just a little more, boss,”</i> Anno whines, slumping against the stall wall and cupping a breast while trying to wring out every bit of stimulation she can before she utterly succumbs to you. It isn’t long until she does: a few more moments pass before a sudden shiver takes her, starting with a vicious clamp around your tongue as her muscles contract and continuing with a hard squeeze once the first waves of orgasm pass through her. You keep licking all through it, giving the ausar a steady stream of consistent motions to ground herself on as she rides though a wet, hot climax that ends with her panting and gasping for breath, giggling all the while as you tease at her most sensitive spots. ");
	
	output("\n\nThe next few minutes are spent in quiet afterglow. The two of you help each other wash away the sweat and scent of sex. You take turns scrubbing all those hard-to-reach spots for each other, though that only ends with Anno pressed against the wall, your lips on hers as you blindly search for the shower handle. The water finally abates to leave you in a cloud of mist that clings to your bodies, keeping you nice and hot as you enjoy each other for a last few moments. ");
	
	output("\n\nFinally, though, you step out of the shower and towel down. When you’re done, Anno wraps hers around her hair and ears, leaving herself bare and on full display for you. <i>“Thanks, boss. I needed that,”</i> she says with a wink, leaning in to give you a peck on the cheek.");

	processTime(30+rand(20));
	pc.lust(10);

	annoSexed(1);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerSpecialGear():void
{
	annoFollowerHeader();
	
	clearMenu();

	// Merc/Smuggler + Quest Done
	if ((pc.characterClass == GLOBAL.CLASS_SMUGGLER || pc.characterClass == GLOBAL.CLASS_MERCENARY) && flags["ANNO_MISSION_OFFER"] == 3 && !anno.hasItem(new HoldoutHP()))
	{
		addButton(0, "Her Gun", annoFollowerSpecialGearHerGun, undefined, "Her Gun", "Ask Anno about her personal gun. That didn't seem like a stock model.")
	}

	if (pc.hasItem(new GrayMicrobots()) && !pc.hasKeyItem("Goozooka"))
	{
		addButton(1, "Gray Goo", annoFollowerSpecialGearGrayGoo, undefined, "Gray Microbots", "Ask Anno about the samples of Gray Microbots.");
	}
	else
	{
		if (!pc.hasItem(new GrayMicrobots())) addDisabledButton(1, "Gray Goo", "Gray Microbots", "You need to have a sample of Gray Microbots to hand.");
		if (pc.hasKeyItem("Goozooka")) addDisabledButton(1, "Gray Goo", "Gray Microbots", "You've already wrangled an upgraded version of the Goovolver out of Anno.");
	}

	addButton(14, "Back", annoFollowerMenu);
}

public function annoFollowerSpecialGearHerGun():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“That’s a pretty awesome gun you’ve got there,”</i> you say, nodding to Anno’s belt. Since your adventure on Deck 13, her handgun’s migrated from her boot to a holster on the back of her belt, tucked almost invisibly under the base of her tail. ");
	
	output("\n\n<i>“Like it?”</i> she asks, drawing it and setting it on her desk. <i>“I custom built it, actually. I know, I know, ‘Anno, how do you have so many varied and awesome skills?’ Well, gunsmithing got a lot easier with 3D replication tech, let met tell you. I took your standard holdout rig, pulled in an integrated silencer pattern for the barrel I might have stolen from a German, plus redesigned the feed for a new bullet Steele Tech was working on. Ended up canning the project, but I snagged the replication code for ‘em, so I can fabricate my own rounds. ");
	
	output("\n\n<i>“For a little gun, it’s as quiet as the click of the hammer, and punches clear through most armor. I originally made it to fend off pesky security bots after one went rogue in a lab I was working in. Drilled a couple scientists before we could throw enough acid on it to shut it down. Turns out it’s pretty good against armored people and cyborgs, too. All-around handy little package.”</i> ");
	
	output("\n\n<i>“Where do I get one?”</i> you ask, admiring the little ass-kicker.");
	
	output("\n\nAnno chuckles. <i>“It’s a one-and-only, but... toss a couple thousand credits my way, and I might be able to find those replication codes somewhere.”</i>");

	if (!anno.hasItem(new HoldoutHP()))
	{
		anno.inventory.push(new HoldoutHP());
	}
}

public function annoFollowerSpecialGearGrayGoo():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“Hey, you’re pretty techie, right?”</i> you say by way of opening as you dig into your pack.");
	
	output("\n\nAnno shrugs. <i>“Literal rocket scientist here, so... kinda? Whatcha need?”</i>");
	
	output("\n\nYou pull out the vial of gray goo extracted from one of the lusty mecha-babes and hand it over to Anno. <i>“Think you could do something with this?”</i>");
	
	output("\n\n<i>“Gray goo?”</i> she asks quizzically, looking the sample over. <i>“Uh... I can toss it in my cold storage for you. I’ve got enough of them stowed away to last me forever.");
	if (flags["ANNO_MISSION_OFFER"] == 3) output(" Especially since Steele Tech’s starting to mass-produce them now.");
	output("”</i>");
	
	output("\n\n<i>“Something </i>useful<i>,”</i> you correct, planting a defensive hand on the sample before she can toss it in the freezer. ");
	
	output("\n\nShe shrugs. <i>“Oh. Well... let me think. Uh, I guess I could try and refactor a goo-launcher to shoot grey goo. Would need to build a custom AI-reset in, something to reprogram the sample into crawling up something’s cooch when you fire it. Plus I’d have to rebuild the barrel, or just kajigger it to fire right from the vial. Tell you what, boss: gimme a goo-gun - I sell them, but can’t give it to you for free, sorry - and a thousand credits for spare parts and I could probably whip something together.");

	processTime(1);

	clearMenu();

	var pGoovolver:Goovolver = new Goovolver();
	
	if (pc.hasItem(pGoovolver) || pc.rangedWeapon is Goovolver)
	{
		if (pc.credits >= 1000)
		{
			addButton(0, "Upgrade", annoFollowerSpecialGearGoozooka, false, "Upgrade", "Pay 1000 credits to upgrade your Goovolver into a Goozooka.");
		}
		else
		{
			addDisabledButton(0, "Upgrade", "Upgrade", "You need at least a thousand credits to upgrade your Goovolver.");
		}
	}
	else
	{
		var pGooCost:int = pGoovolver.basePrice * anno.sellMarkup * pc.buyMarkdown;
		
		if (pc.credits >= pGooCost + 1000)
		{
			addButton(0, "Upgrade", annoFollowerSpecialGearGoozooka, true, "Upgrade", "Pay " + String(pGooCost + 1000) + " credits to buy a Goovolver and pay for the parts Anno needs to upgrade it.");
		}
		else
		{
			addDisabledButton(0, "Upgrade", "Upgrade", "You need " + String(pGooCost + 1000) + " credits to buy a Goovolver and pay for the parts Anno needs to upgrade it.");
		}
	}
	
	addButton(1, "Nope", annoFollowerMenu);
}

public function annoFollowerSpecialGearGoozooka(buyGoovolverToo:Boolean = false):void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“Alright! Now we’re in business!”</i> Anno grins as you hand over the goo-slinging revolver and the spare credits. <i>“Just gimme a few minutes to do the work, alright?”</i>");
	
	output("\n\nYou nod and wander back out to the common room. Soon, you can hear the clanking and buzzing of her at work in her quarters, though the minutes begin to drag on and on before she finally returns, carting what might, once, have been a goovolver. Now, though, it looks more like a grenade launcher with a hugely oversized barrel and a break-action rather than a cylinder. A flickering computer has been bolted onto the side of the gun next to the trigger, with several flashing LED screens allowing you to program your gooey projectiles. ");
	
	output("\n\n<i>“Try this on for size,”</i> Anno smirks, handing the heavy weapon over. <i>“Just make sure you actually have enough gray goo canisters, boss. This thing can’t shoot galotian charges anymore.");
	
	if (silly)
	{
		output("\n\n<i>“Where did the ones already loaded in there go?”</i> she asks, pre-empting your question. <i>“Don’t ask questions.”</i>");

		output("\n\n<i>“Shh. No questions now. Only dreams.”</i>");
	}

	// [Try on Anno] [Leave]
	var pGoovolver:Goovolver = new Goovolver();
	
	if (buyGoovolverToo == false)
	{
		pc.credits -= 1000;
		if (pc.hasItem(pGoovolver)) pc.destroyItem(pGoovolver, 1);
		else if (pc.rangedWeapon is Goovolver) pc.rangedWeapon = new Rock();
	}
	else
	{
		var pGooCost:int = pGoovolver.basePrice * anno.sellMarkup * pc.buyMarkdown;
		pc.credits -= (pGooCost + 1000);
	}
	
	pc.destroyItem(new GrayMicrobots());

	pc.createKeyItem("Goozooka", 0, 0, 0, 0, "This modified Goovolver was built by the ausar tech specialist Anno Dorna for you. Rather than normal galotians, this heavy cannon fires vials of gray goo at your enemies, re-programmed to go straight for an enemy's most sensitive spots. Consumes a vial of gray goo per shot!");
	output("\n\n<b>(Key Item Gained: Goozooka -</b> This modified Goovolver was built by the ausar tech specialist Anno Dorna for you. Rather than normal galotians, this heavy cannon fires vials of gray goo at your enemies, re-programmed to go straight for an enemy's most sensitive spots. Consumes a vial of gray goo per shot!<b>)</b>");
	
	processTime(15);
	
	//[Try on Anno] [Leave]
	clearMenu();
	
	// I'm implying that Anno left the sample you gave her loaded into the thing
	addButton(0, "Try on Anno", annoFollowerGoozookaTesting);
	addButton(1, "Leave", mainGameMenu);
}

public function annoFollowerGoozookaTesting():void
{
	clearOutput();
	annoFollowerHeader();

	pc.addMischievous(1);

	output("When Anno turns to get back to work, you quietly break open the back of your new goo-launcher and slot in the vial of goo. With a mischievous grin, you level the cannon at Anno’s hind end and flick the button on the computer beside the trigger.");
	
	output("\n\nHearing the little <i>“click”</i>, Anno turns to look at you... just in time to see you pull the trigger. There’s a loud pneumatic hiss as the gun discharges, sending a big gray blob straight at Anno’s ass. She shrieks as she’s slammed up against the wall by the impact, and then again as a tiny gray googirl coalesces right on the little bubble of her butt sticking back through her");
	if (anno.armor is AnnosCatsuit) output(" catsuit");
	else output(" jeans");
	output(".");
	
	output("\n\nA tiny voice cheers, <i>“Oooh! You’re cute... wanna fuck?”</i> before the gray goo drills her way through the ass of Anno’s pants and vanishes from sight. Anno immediately goes rigid, eyes wide and tail sticking straight out as the little goo finds something sensitive under");
	if (anno.armor is AnnosCatsuit) output(" that suit of hers");
	else output(" her pants");
	output(" and gets to work. You lean back and enjoy the show as Anno desperately wiggles her way out of her");
	if (anno.armor is AnnosCatsuit) output(" uniform’s");
	output(" top, and is still trying to get out of her bottom when you  <i>see</i> the blob of a googirl squirming around her hip and into her pussy. There’s a momentary pause before Anno goes cross-eyed and flops down onto the bed, helpless but to moan and wiggle her hips as the goo takes advantage of her. ");

	pc.lust(10);

	processTime(2);
	
	output("\n\nOh yeah. This is gonna be fun. ");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerFirstTimeOnMhenga():void
{
	clearOutput();
	annoFollowerHeader();
	showBust("ANNO", "SYRI");

	output("As you dock at Mhen’ga, you feel a pair of familiar, fluffy arms wrap around your neck and shoulders as a big pair of");
	if (anno.armor is AnnosCatsuit) output(" latex");
	else output(" cloth");
	output("-clad tits pressing into your back. <i>“Hey, isn’t this... yeah, Mhen’ga!”</i> Anno says, watching the jungle sprawl out through your viewscreen before slowly giving way to the town of Esbeth. ");
	
	if (flags["TOLD_TO_ANNO_ABOUT_SYRI_RELATIONSHIP"] == undefined)
	{
		output("\n\n<i>“You know, my sister works here,”</i> Anno says, taking her arms off you to flip on her wrist computer. <i>“Let me see if I can give her a call. Might as well say hi while I’m here, right? God, it’s been AGES since I talked to Syri...”</i> ");
	}
	else
	{
		output("\n\n<i>“Hey, while we’re here I should see about catching up with my sister,”</i> Anno says, taking her arms off you to flip up her wrist computer. <i>“Let me see if I can give her a call. Might as well say hi while I’m here, right? God, it’s been AGES since I talked to Syri...”</i>");
	}
	
	output("\n\nShe pushes a holographic button hovering over her wrist and the display vanishes. It’s replaced by a hovering 3D photo of");
	if (flags["MET_SYRI"] != undefined) output(" Syri");
	else output(" a dark-haired ausar girl in what looks like a military-issue long coat");
	output(". A ringing sound comes from the computer for a few moments before giving way to a gruff feminine voice as her sister answers. The 3D photo shimmers out, replaced with a living model of the same figure, dressed exactly the same.");
	
	output("\n\n<i>“Anno!?”</i>");
	if (flags["MET_SYRI"] == undefined) output(" the figure");
	else output(" Syri");
	output(" says, visibly surprised. <i>“Holy shit, sis, what’re you doing here?”</i>");
	
	output("\n\nAnno giggles, <i>“Glad to see you too, Syri! Victor’s "+ pc.mf("son", "daughter") +" and I just landed on planet. I thought you and I could get together and-”</i>");
	
	if (flags["MET_SYRI"] != undefined)
	{
		output("\n\n<i>“Steele!?”</i> Syri says, trying to look past Anno on the holo-cam. <i>“Hey! How’s it going, Steele?”</i>");
		
		output("\n\n<i>“Could be worse,”</i> you say, stepping into frame. <i>“How’re you?”</i>");
		
		output("\n\nShe grins. <i>“Good! Long time no see. Yeah, you two should definitely come by the bar. I’ve got some free time right now, if you want.”</i>");
	}
	else
	{
		output("\n\n<i>“Vic’s kid? Seriously, Anno... man, that’s fucked up. I know he just passed away, but...”</i>");
	
		output("\n\n<i>“But [pc.heShe]’s right here,”</i> Anno says, cutting her sister off. <i>“Do you want us to stop by or don’t you?”</i>");
	
		output("\n\nSyri shrugs. <i>“Sure, I guess. I’m hanging out at the bar right now - it’s just a couple of blocks east of the spaceport; you can’t miss it.”</i>");
	}
	
	output("\n\n<i>“Sounds good,”</i> Anno says, beaming at her sister. <i>“See you in a few, sis!”</i>");
	
	output("\n\nAnno cuts the call off and breathes a little sigh. <i>“That went better than expected. The last time we talked face-to-face was... well, anyway, you coming?”</i> she asks, offering you her arm.");
	
	output("\n\nYou take it, and follow Anno down towards the bar.");

	processTime(5+rand(2));

	clearMenu();
	addButton(0, "Next", annoFollowerFirstTimeOnMhengaPartII);
}

public function annoFollowerFirstTimeOnMhengaPartII():void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“Hey! Over here!”</i> you hear, just as soon as you and Anno walk into <i>“Burt’s Badass Meadhall.”</i> Syri’s sitting at the bar next to two empty stools and three beers, a great big grin on her face. ");
	
	if (flags["MET_SYRI"] != undefined)
	{
		output("\n\n<i>“Hey! Sis, Steele!”</i> she barks, grabbing you both into a fierce hug. Anno giggles as her powerfully strong sister squeezes the both of you tight before ushering you into the stools beside her own.");
	}
	else
	{
		output("\n\n<i>“Hey, Sis!”</i> Syri says, grabbing Anno and pulling her sister into a fierce hug. They might be the same size, but Syri seems to tower over her slighter sister, wrapping the nerdy scientist in her muscular arms. ");
	
		output("\n\nShe turns to you with a wolfish grin that shows off her pointed teeth. <i>“So you’re the one who pulled my sister off that rust bucket on Tarkus, huh? Name’s Syri,”</i> she says, giving you a vigorous handshake.");
	
		output("\n\n<i>“Steele. [pc.name] Steele,”</i> you answer, returning it before she ushers you and Anno into the empty seats.");
	}
	
	output("\n\n<i>“God damn, it’s been ages,”</i> Syri says after a long swig of her beer. <i>“How’ve you been, Anno?”</i>");
	
	output("\n\n<i>“Was touch-and-go for a little bit,”</i> Anno says with a laugh, opening her drink. <i>“But thanks to [pc.name] here, I’m a </i>lot<i> better now.”</i>");
	if (haveFuckedAnno())
	{
		output(" Anno leans against you, her fluffy tail batting against your [pc.butt].");
		if (flags["FUCKED_SYRI_COUNT"] != undefined) output(" Syri’s eyes widen noticeably as she realizes what’s going on.");
	
		output("\n\nShe recovers quickly, saying, ");
	}
	else output("\n\n");
	output("<i>“Good to hear. I’ve been worried about you,");
	if (flags["TARKUS_DESTROYED"] == undefined) output(" all the way off on Tarkus. Frontier’s no place for a squishy lil’ scientist.”</i>");
	else output(" especially when you</i> didn’t write after the whole fucking planet blew itself up.”");
	
	output("\n\n<i>“Hey,”</i> Anno protests, scowling at her sister. <i>“I can take care of myself, you know.”</i>");
	
	output("\n\nSyri shrugs.");
	if (flags["TARKUS_DESTROYED"] != undefined) output(" <i>“You could have at least written to say you’re okay, you know.”</i>");
	else output(" <i>“Yeah, yeah, I know. Doesn’t mean I don’t worry about ya, though.”</i>");
	output(" She sighs and takes another drink. ");
	
	output("\n\n<i>“Anyway, Steele,”</i> Syri says,");
	if (flags["MET_SYRI"] != undefined) output(" <i>“you guys sticking around for a while? Not saying I miss ya or anything, but... you know. Would be nice to hang out with you and Anno for a while.”</i>");
	else output(" <i>“if you’re sticking around on Mhen’ga here, you should stop by the bar sometime later. I’m here most afternoons over on that console next to the screen. If you’re into hologames, you should definitely check it out.”</i>");
	
	output("\n\nYou nod, and tell the ravenette ausar you’ll think about it. She grins, and buys you both another round. The next couple hours go by pleasantly, with Anno and Syri regaling you with the misadventures of their youth, their various petty rivalries and in-jokes. Finally, several beers later, a slightly-inebriated, companionable silence falls over the trio of you. You excuse yourself then, leaving the two ausars to privately catch up.");

	processTime(120+rand(30));

	// Booze!
	pc.createStatusEffect("Crabbst",0,5,0,0,false,"Icon_DizzyDrunk","Makes you stronger but at what cost?",false,180);
		pc.physiqueMod += 5;
		pc.reflexesMod -= 5;
		pc.aimMod -= 5;
		pc.intelligenceMod -= 5;
		pc.willpowerMod -= 5;
		pc.lust(25);

	currentLocation = "BURT'S MAIN HALL";

	flags["ANNOxSYRI_EVENT"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerAppearance():void
{
	clearOutput();
	annoFollowerHeader();

	output("Anno Dorna is a six-foot-tall ausar girl with long, snow-white hair and a pair of huge, perky wolf ears perched atop her head. Though she is distinctly humanoid in face and form, the silky fur on her arms and legs, along with the swishing, bushy tail, give her a playfully alien appearance, more like a perky little puppy than a fearsome predator. She’s wearing");
	if (anno.armor is AnnosCatsuit) output(" the distinctive Steele Tech field uniform: an ultra-sheer black and yellow catsuit that hugs her frame and accentuates her curves in all the right places, supporting her ample bust so that it looks almost impossibly perky for its size.");
	else output(" a civilian outfit, relatively simple compared to her usual slick catsuit: she’s got a pair of jeans, a button-up blouse, and a pair of tall work boots on. She’s not wearing a bra that you can see, which means you can get a nice look at her ample titflesh through the sheet fabric of her shirt.");
	output(" Thanks to the")
	if (anno.armor is AnnosCatsuit) output(" catsuit");
	else output(" tight, curve-hugging outfit she’s wearing");
	output(", you can see the full expanse of her fleshy body: a big, bouncy butt only barely hidden by her tail, a sizable rack, and a pair of long, toned legs. ");
	
	output("\n\nAnno has a pair of full DD-cup breasts, big and bouncy and oh so soft, each tipped with a big, sensitive nipple that’s perfect to tug and squeeze.");
	
	output("\n\nBetween her legs, Anno has a tight little pussy. Naturally stretchier and so much wetter than a human’s, her sex is perfect for taking thick knots and great big cocks with ease. It’s topped with a trimmed landing strip of downy white fuzz. Opposite that, she has a nice, inviting little asshole between her firm cheeks, right where it belongs.");

	addDisabledButton(10, "Appearance");
}

public function annoxKaedeFollowerMeeting():void
{
	clearOutput();
	author("Savin");
	showName("ANNO &\nKAEDE");
	showBust("ANNO", "KAEDE");

	// {First Time}
	if (flags["ANNOxKAEDE_INTRODUCED"] == undefined)
	{
		flags["ANNOxKAEDE_INTRODUCED"] = 1;

		output("Over the din of dozens of murmuring voices in Anon’s, you hear a loud, <i>“HEY! [pc.name], over here!”</i> ");
	
		output("\n\nLooking over the bar, you see Anno sitting in a booth with another ausar - a red-headed girl wearing a black leather jacket. The other woman turns in the booth, big blue eyes regarding you as your lover waves you over. ");
		
		output("\n\n<i>“Hey, boss,”</i> Anno beams when you make you way over to them. <i>“Guess who this foxy babe is!”</i> she adds, pointing to her companion.");
		
		output("\n\nThe redhead rolls her eyes and extends a hand to you - a hand lacking the iconic fur sleeve of her race. A half-ausar, then. <i>“Hey there, I’m Kaede. Anno’s-”</i>");
		
		output("\n\n<i>“Girlfriend,”</i> the snowy-haired ausar finishes for her, reaching across the table to take the other girl’s hand in hers. <i>“I’ve told you about Kaede, right? ‘Course I have! Hey, come on, sit down,”</i> she says, scooting over to give you room to sit beside her. ");
		
		output("\n\nYou do so, and Anno promptly rests her head on your shoulder, an arm slipping around your waist. <i>“So, I was just telling Kaede here some of our misadventures");
		if (flags["ANNO_MISSION_OFFER"] == 3) output(" - both with the gray goo and under the sheets");
		output(",”</i> she says, flashing you a wolfish grin, <i>“and we were just thinking about heading back to my rent-by-the-hour down the way when you wandered in. Fancy that.”</i>");
		
		output("\n\nYou can all but feel the sexuality dripping out of Anno’s voice now. <i>“So you know, Kaede and I like to keep things pretty open. You just got to when you’re as long distance as we are... I think we’d both go nutty without a good hard");
		if (pc.hasCock()) output(" dicking");
		else output(" fucking");
		output(" from time to time.”</i>");
		
		output("\n\nKaede blushes, but hardly refutes her girlfriend’s claim on the matter. <i>“In fact,”</i> Anno adds, nuzzling up against you. <i>“I was just mentioning how sweet it would be if we had a certain number three with us when we slink off... I don’t suppose you’re free for a little, boss?”</i>");
	}
	else
	{
		output("<i>“Hey, boss!”</i> Anno beams as you approach. <i>“Take a load off - Kaede and I were just finishing drinks.”</i>");
		
		output("\n\nYou slide into the booth beside your ausar lovers, and quickly find a shot glass of a strong-smelling green ausar drink in front of you. You knock it back as the pair of wolf-eared babes giggle and tease at each other - and at least one fluffy tail starts caressing your [pc.leg]. You spend a few pleasant minutes conversing with the couple, but it isn’t long before you feel the weight of lusty eyes wandering over you. Anno’s arm slips around your waist, and she nuzzles up against your shoulder.");
		
		output("\n\n<i>“What do you say we get out of here, huh boss? I’ve got a rent-by-the-hour down the way... and a cute little piece of ass to split between us.”</i>");
	}

	annoxKaedeAnonsBarMenu();
}

public function annoxKaedeAnonsBarMenu():void
{
	clearMenu();
	if (pc.hasCock() && (pc.cockThatFits(370) >= 0) && (pc.cockThatFits(anno.vaginalCapacity()) >= 0)) addButton(0, "Fuck Them", annoxKaedeFuckThem, false);
	else addDisabledButton(0, "Fuck Them", "Fuck Them", "Requires a penis.");
	addButton(1, "Service Kaede", annoxKaedeService, false);
	addButton(2, "Watch", annoxKaedeWatch, false)
	addButton(14, "Leave", annoxKaedeLeave, false);
}


//Fuck Anno WITH SCIENCE
//PC must be wearing a Hardlight Strapon. Add [Pitch Strapon] to sex menu
public function fuckAnnoWithScienceYoFukkinLadyBoi():void
{
	clearOutput();
	author("Savin");
	showName("\nANNO");
	showBust("ANNO");
	//if PC is wearing any kind of clothes/armor over the strap:
	if(pc.armor.shortName != "")
	{
		output("You flash Anno a cheeky grin and drop your ");
		output("[pc.armor], revealing your [pc.lowerUnderGarment]. Your ausar lover’s eyes go wide... and double again in size when you press the little button on the side. A beam of light bursts forth from your crotch, coalescing into a dick-shaped holographic projection that bobs over your crotch.");
		output("\n\n<i>“Bend over, girl,”</i> you say, reaching down to stroke the length of your hardlight erection. The neural net built into it kicks in instantly, sending a shiver of pleasure through your loins as you stroke your strapon. Giggling eagerly at your command, Anno spins on a heel and plants herself on her bed, ass invitingly in the air.");
	}
	//PC isn’t wearing anything over the strap:
	else
	{
		output("You step up to your ausar lover, close enough for your skin to touch her - nearly, anyway, through Anno’s ");
		if (anno.armor is AnnosCatsuit) output("slick catsuit");
		else output("thick jeans");
		output(". She giggles happily as you approach, all but melting into your arms. With a grin, you key the little button on your [pc.lowerGarments], and are rewarded with a gasp of surprise from Anno as a beam of light bursts forth from your crotch, coalescing into a dick-shaped holographic projection that bobs over your crotch, pressing into her thigh. The neural net built in kicks in, letting you feel the sensation of fabric against your suddenly-sensitive loins.");
		output("\n\n<i>“Down, [pc.boy],”</i> Anno teases, trying to pull away from you. Instead, her half-hearted attempt at escape sends her tumbling into her bed, ass invitingly in the air.");
	}
	//{Combine}
	output("\n\nYou give the snowy ausar a playful smack on the rump; she moans and wiggles her hips, grinding her butt back against your glowing crotch. She finds the shaft of your energy-wang and pushes back against it, rubbing up along its length until her ass is flush against your groin, making it all too easy for you to grab Anno’s hips and dig into that big, squeezable ass of hers.");
	output("\n\n<i>“Come on, boss,”</i> Anno coos, hooking her thumbs through her belt and shimmying out of her bottom. Your hardlight cock flops eagerly into the bared crack of her ass, fitting so snugly into it that you could swear Aliss’s strapons were made just for fucking big ol’ ausar butts. Anno gives a low, throaty moan as she feels the shimmering lightdick fill her crack, and one of her white-furred hands quickly makes its way down to the lips of her sex. She spreads herself wide open, thumb teasing across the mound of her clit as her fingers open her pussy up invitingly.");
	output("\n\nIt’s a slight shift of your [pc.hips] to draw the glowing lightdick through the crack of Anno’s deliciously soft behind until the crown is pressed to the wide-open lips of her cunt. You shiver at the sensation stemming from your hardlight cock, and the wonderful neural connectors in it. <i>“Oooh, it tingles!”</i> Anno giggles, wiggling her behind back against the tip until it slips into her, eliciting a little gasp from your lover. You dig your fingers into her rump, squeezing tight enough to turn that gasp into another happy moan before you pull Anno back, making her come to you. She does so eagerly, rocking back on her knees to slide down the shimmering shaft of your strapon.");
	output("\n\nYou might have paid a lot for this, but it’s worth every credit watching - and feeling! - Anno spear herself on your thick, turgid band of light.");
	output("\n\nAnno takes her time taking your strapon, slowly making her way down the lightdick’s length with muted gasps of pleasure and sultry moans that drive your own excitement into overdrive");
	if(pc.hasCock()) 
	{
		output(", your own cock");
		if(pc.cockTotal() > 1) output("s");
		output(" swelling full, begging to be let loose to fuck her instead");
	}
	output(". You sate your urges - for now - by giving Anno’s spankable behind what it deserves, a sharp swat that makes her squeal... and makes her pussy do wonderful things to your hardlight shaft, squeezing and squirming around the unyielding hardness projecting from your crotch. She takes the full length of your lighdick, groaning along every inch until her ass is pressed into your crotch. Her tail wiggles up to your [pc.chest], teasing at one of your [pc.nipples] until you suck in a pleasured breath and bat it away. Anno shoots you a wink over her shoulder, and her tail goes right back to teasing you, tickling your nose when she can’t get at your [pc.chest] again.");
	output("\n\nWith an annoyed grunt, you finally reach down and grab the fluffy white menace, giving it just enough tug to make Anno yelp. Though by the look she gives you after, it’s the same kind of cry she might give after a good, hard spanking. You lick your lips and give her another rough tug, punctuating her next cry with a shifting of your [pc.hips] that brings your hardlight dick in and out of her a few inches, thrusting back hard enough to make her whole backside jiggle with the impact. You start to move after that, starting off nice and slow for Anno’s sake, enjoying the tactile-feedback feeling of her wet slit’s walls gliding across your cock.");
	output("\n\nThe slow thing doesn’t work out too long, though, before Anno groans <i>“Come on, boss... fucking pound me already!”</i>");
	output("\n\nWell, if she wants it! You grab ahold of Anno’s flared hips and thrust faster. Before long, the bed is creaking and shaking with the force of your motions. Anno’s backside quivers and quakes as your crotch slaps against it, her whole body shuddering with the impacts as you drive your hardlight cock deep into her. With every thrust, you’re rewarded with an ever-increasing flow of ausar juices splattering back against your thighs as Anno’s excitement mounts, driving her body into overdrive with your cunt-stretching lightdick. The more you stir her up, the wetter she - and you, and her sheets - get, and the louder her voice climbs as she moans and screams in pleasure. Her fingers shift away from her gaping lips to the bud of her clit, rubbing at it with abandon as she rapidly nears her limit.");
	output("\n\n<i>“Harder! Harder!”</i> she screams, biting the bedsheets to stifle a scream as you smack her ass and bury yourself hilt-deep in her slavering cunt. No matter how hard she tries to contain it, though, Anno’s screams of pleasure bleed through as you fuck her to orgasm. The wetness you were feeling triples as she cums, slathering your sensitive hardlight cock in a musky, sultry sea of fem-cum. Her muscles, lubed so slickly that you can’t help but glide across them, go wild around you. They squeeze and wring your lightdick, milking it for a load of cum that won’t come");
	if(pc.balls > 0 && pc.hasCock()) output(", or at least, not inside her - you can already feel your own need welling up inside your [pc.balls]");
	output(". Her writhing cunt’s mad motions only draw you deeper into her, moving faster as the feedback coming from your strapon tells your lust-addled brain one thing: cum.");

	//If PC doesn’t have a dick: 
	if(!pc.hasCock()) output("\n\nYour phantom cock overwhelms your conscious mind with waves of incredible, alien pleasure. You slam yourself into Anno, grabbing her ass and hips, pulling her as close as you can as your body shudders through a strapon-induced orgasm.");
	//If PC has a dick+:
	else 
	{
		output("\n\nYour hardlight cock sends waves of feedback into your real wang");
		if(pc.cockTotal() > 1) output("s");
		output(", and suddenly you find yourself coming. Your whole body shudders as you bust a nut in your [pc.lowerGarment], soaking through them and splattering Anno’s up-turned backside with [pc.cumNoun].");
	}
	output(" She gives you a happy, contented groan as you bury yourself back in her and cum your brains out, all too happy to let your hands squeeze her behind as you find your own release. After a few breathy moments, though, she reaches back to you. One of her snowy fingers finds the release on your [pc.lowerGarment], and your hardlight cock flickers out of existence, leaving you slumped against your lover, her well-fucked pussy rubbing against your crotch.");
	output("\n\nTo your surprise, the normally subby puppy takes the initiative after that, giving you enough of a pull with her legs that you topple onto the bed beside her. She rolls and straddles you, her cum-soaked thighs resting on your [pc.hips]. <i>“Now </i>that<i> was a fucking, babe,”</i> she purrs, planting her hands on your [pc.chest], thumbs caressing your still-stiff nipples.");
	if(flags["ANNO_EVER_STRAPONED"] == undefined)
	{
		output(" She lets a hand wander down to caress your [pc.lowerGarment], adding, <i>“I’ve never seen anything like that before. I might just have to get one...”</i>");
	}
	output("\n\nAnno leans down, pressing her breasts into your own chest. She sniffs all along you, planting a few kisses across your shoulders and neck. ");
	if(flags["ANNO_OWNS_LIGHT_STRAPON"] == undefined) 
	{
		//if Anno doesn’t own a strapon AND PC is feminine: 
		if(pc.mf("","Bluh") == "Bluh") output("<i>“Next time we’re at Tavros, what do you say you show me where you got that, and I’ll see about returning the favor?”</i>");
		// elseif no strapon, masculine PC:
		else output("<i>“You’ll do that to me again, right? A little variety is nice sometimes, boss...”</i>");
	}
	//elseif has strapon:
	else output("<i>“What do you say you take a minute, and then spread that cute little ass of yours so I can take a crack at it with mine,”</i> she teases, her tail twitching to the pair of hardlight panties flopped on the floor with her discarded clothes.");

	flags["ANNO_EVER_STRAPONED"] = 1;
	annoSexed(1);
	processTime(20+rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anno Buys a Strapon
//PC visits Aliss’s shop while Anno’s on the crew. Anno doesn’t already own a strapon. Anno’s been sex’d.
public function takeOverAlisssShopForPuppySlootPeanutButterStrapons():void
{
	author("Savin");
	showBust("ANNO","ALISS");
	showName("ANNO &\nALISS");
	output("\n\nAs you make your way into the busy clothing shop, you notice a familiar white-maned ausar girl sitting inside. ");
	if(flags["MET_ALICE"] != undefined) output("Aliss");
	else output("A purple-scaled reptilian-looking woman");
	output(" is strutting her stuff for Anno, ");
	if(flags["MET_ALICE"] == undefined) output("dolled up in a pair of ");
	else output("wearing her usual ");
	output("lacey panties, garter, and fishnets. You wander over, though Anno’s back is turned to you as you approach.");

	output("\n\n<i>“I dunno,”</i> Anno says, attention focused on ");
	if(flags["MET_ALICE"] != undefined) output("Aliss");
	else output("the nearly-nude woman");
	output(". <i>“I love the way those stockings look, but I’m not sure about them with all this fur.”</i> She pulls up the leg of her ");
	if (anno.armor is AnnosCatsuit) output("catsuit");
	else output("jeans");
	output(" for emphasis, letting out a mess of white fluff. <i>“Normal socks are a pain to get into as it is.”</i>");

	output("\n\n<i>“Not to worry, </i>mi amour<i>. You’re not the only ausar to have that issue. I’ve got some specialty-made zip-up stockings in the back, if you’d like to try them on for size.”</i>");
	output("\n\nAnno grins. <i>“I don’t know, I rather like your modelling...”</i>");

	output("\n\n");
	if(flags["MET_ALICE"] != undefined) output("Aliss");
	else output("The woman");
	output(" giggles - and doubly so when you reach out and grab Anno’s butt, making her yelp and spin into your arms.");

	output("\n\n<i>“Gah! Don’t scare me like that, [pc.name]!”</i> Anno whines, ears tucking. <i>“Can’t a girl go shopping in peace?”</i>");

	output("\n\nThe purple girl chuckles, <i>“You’d be surprised how many couples come in together. It makes a wonderfully... intimate experience.”</i>");
	if(flags["MET_ALICE"] == undefined)
	{
		output(" She extends a hand to you. <i>“I’m Aliss, by the way. Owner of </i>Mi Amour<i>.”</i>");
		flags["MET_ALICE"] = 1;
	}
	output("\n\n<i>“So,”</i> Aliss says, turning back to Anno with a mischievous glint in her eyes. <i>“Would you like me to show off the zip-version for you and [pc.name]?”</i>");
	output("\n\nAnno looks to you, and receives an encouraging nod. <i>“That’d be perfect.”</i>");

	output("\n\nShe nods happily, saying, <i>“Of course, </i>mi amour<i>! You just wait right here and I’ll be back in a flash.”</i> With that, she turns and makes her way towards the changing rooms, giving her rump a tantalizing little shake before disappearing. When she goes, Anno pulls you down onto one of the cushiony seats nearby and nuzzles up against you. Her hand locks onto yours.");

	output("\n\nAliss returns a short while later, sporting the ausar-spec stockings. A thin leather strip on the inner thighs sports a zipper, making them much easier to don without uncomfortable fur-rustling. They cling to her purple skin tightly, but look to be comfortable enough. The tightness of the fit definitely leaves little to the imagination. <i>“Looks good, don’t they?”</i> she asks, giving a quick spin so you can see it from every angle. <i>“Like all our undergarments, it includes intelligent ultralastic so your tail will fit just perfectly. We really do live in an amazing time, huh?”</i>");

	output("\n\n<i>“Do we ever,”</i> Anno says, eyes clearly not on the stockings. Then again, neither are yours... Aliss certainly cuts an impressive figure, especially in her silky little outfit. <i>“What do you think, boss? Think I’d look good in that?”</i>");
	//if Nice: 
	if(pc.isNice()) output("\n\n<i>“You’d look good in anything,”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Good? Try sexy as hell,”</i>");
	else output("\n\n<i>“Good in it. Better out of it,”</i>");
	output(" you answer.");

	output("\n\nShe flashes you a grin. <i>“Alright. I’ll take it!”</i>");

	output("\n\nAliss smiles. <i>“Great! ");
	//if PC is feminine:
	if(pc.mf("","f") == "f")
	{
		output("Since you two cuties are together, maybe you’d like to see </i>Mi Amour<i> undergarments’ most exciting feature before you go?");
	}
	//if PC is masculine:
	else
	{
		output("Before you check out, would you like to see </i>Mi Amour<i> undergarments’ most exciting feature?");
	}
	output("”</i>");

	output("\n\n<i>“Sure,”</i> Anno says.");
	if(flags["ANNO_EVER_STRAPONED"] != undefined) output(" <i>“Is it that hardlight strapon thing? Oh man please be that.”</i>");

	output("\n\nAliss’s grin spreads as she flicks a tiny, almost imperceptible button on the side of her panties. Light flickers around her crotch, and an impressively large terran cock materializes from her groin, flopping in the breeze.");

	output("\n\n<i>“It’s my personal favorite feature,”</i> Aliss giggles. <i>“We’re one of the first shops to offer this, and it certainly has been popular. See, by incorporating miniaturized hardlight projectors across the outside of the fabric, we can set it up so that it will project a holographic, fully corporeal strap-on. No need for complicated straps, and no worries about potentially addictive or harmful drugs, you can simply wear these panties and be good to go, whenever, wherever. It will even interface with your own nervous system and give you a real time tactile feedback! And it should be noted, these projectors are so miniscule and well hidden you’d never even know they were there.”</i>");

	output("\n\n<i>“Sold,”</i> Anno says, fumbling for her credit chits. <i>“Just... ");
	if(silly) output("shut up and take my money!");
	else output("just take my money already.");
	output("”</i>");

	output("\n\n<i>“Great!”</i> Aliss grins, <i>“Let me slip out of these, and I’ll box up a fresh pair for you, miss Dorna.”</i>");
	output("\n\nYou follow Anno up to the register, and she eagerly pays for the <i>“enhanced”</i> negligee. She’s practically giddy by the time you leave <i>Mi Amour</i>, murmuring to herself how she’s going to get a kick out of showing them to her girlfriend");
	if(pc.mf("","f") == "f") output(", not to mention what she’s going to do to you when she gets back to the ship");
	output(".");
	processTime(9);
	flags["ANNO_OWNS_LIGHT_STRAPON"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//In Soviet Ausaril, Science Fucks YOU
//Anno owns a strapon. Add [Take Strapon] to her sex menu. 
public function getFuckedByAnnoStraponsSavinYouSlut():void
{
	clearOutput();
	output("You take a step up to Anno and rest a hand on her hip. <i>“What do you say you slip on those panties of yours, huh?”</i>");
	output("\n\nAnno grins, <i>“I bet I know which pair you mean, boss... I’d be delighted. Turn around, babe, and I’ll change.”</i>");
	output("\n\nYou do as she commends, turning away from her. Behind you, you hear a zipper zipping and fabric rustling as Anno changes into something sexier. When she bids you turn around, Anno’s wearing her panties and garter from Aliss’s, orange fabric clinging to her pale skin and tracing through her snowy fur. She takes a step forward, her long, fishnet-clad legs bringing her tantalizingly close to you.");
	output("\n\n<i>“Like what you see, lover?”</i> she purrs, strutting her stuff for you, taking a spin and bending over to give you a full view of her rump. Her tail swishes excitedly, rising out of the way when you close the distance and give her big, soft ass a squeeze. <i>“I think you do...”</i>");
	output("\n\nShe presses back against you, grinding her panty-clad butt against your groin. You suddenly become aware of your own mounting excitement, ");
	if(pc.hasCock())
	{
		output("and your cock straining against ");
		if(pc.isCrotchGarbed()) output("your [pc.underGarment]");
		else output("Anno’s orange panties");
		output(", a fire spreading through your loins at Anno’s touch");
	}
	output(". She straightens up, leaning back against you, letting you wrap your arms around her waist. She moans breathily as you start to pull your [pc.gear] off, laying bare skin free to breathe, to touch. After a moment, though, she slips from your grasp and turns to face you, a hungry glint in her eye.");

	output("\n\n<i>“What do you say, boss?”</i> she purrs, a finger reaching for her panties’ switch.");

	processTime(4);

	//if talked about mods:
	if(flags["ANNO_STRAPON_MODS_ENABLED"] != undefined) 
	{
		output(" <i>“How do you want me to take you?”</i>");
		clearMenu();
		//[Normal] [Hyper Horsie] [Knotty Doggie] [Bristly Kitty]
		//Above sets Anno’s [anno.cock] for the following scene between:
		//>12 inch human cock
		addButton(0,"Normal",annoPegsYouWivStraponsPtII,GLOBAL.TYPE_HUMAN,"Normal","Get fucked by a normal, if 12\" long, terran cock.");
		//>24 inch horsecock
		addButton(1,"Huge Horse",annoPegsYouWivStraponsPtII,GLOBAL.TYPE_EQUINE,"Horse Horse","Get fucked by a 24\" horse phallus.");
		//>12 inch knotted dog cock, 3 inch knot
		addButton(2,"Knotty Dog",annoPegsYouWivStraponsPtII,GLOBAL.TYPE_CANINE,"Knotty Dog","Get fucked by a 12\" dog-cock with a big knot.");
		//>12 inch kitty cock.
		addButton(3,"Big Cat",annoPegsYouWivStraponsPtII,GLOBAL.TYPE_FELINE,"Big Cat","Get fucked by a 12\" cat-cock.");
	}
	else
	{
		clearMenu();
		addButton(0,"Next",annoPegsYouWivStraponsPtII,GLOBAL.TYPE_HUMAN);
	}

}

//{Combine}
public function annoPegsYouWivStraponsPtII(annoDickType:int = 0):void
{
	clearOutput();
	author("Savin");
	showName("\nANNO");
	showBust("ANNO");
	output("<i>“I knew it,”</i> Anno teases, flicking the power on her panties. The tiny projectors on her panties flicker to life, and a radiant yellow shaft begins to grow from her groin. The light coalesces into a ");

	if(annoDickType == 0) output("thick, footlong human cock");
	else if(annoDickType == GLOBAL.TYPE_EQUINE) output("monolithic horsecock, as thick around as her arm and near as long as her leg, turning Anno into a veritable tripod. <i>“You like ‘em big, huh?”</i> she adds, licking her lips");
	else if(annoDickType == GLOBAL.TYPE_CANINE) output("thick, pointed dog-pecker, complete with a bulbous bitch-breaker mounted on its hilt, just above Anno’s own crotch");
	else output("long, thick kitten-cock, complete with ridges of bumpy bristles, perfect for stimulating every inch of your [pc.vagOrAss].");

	output("\n\nAnno grins at you, stroking her big hardlight cock and leaning back onto her workbench. Eyeing you up and down, your lover spreads her legs around her glowing appendage and beckons you forward. <i>“Why don’t you go ahead and lube this bad boy up with your mouth, huh?”</i> ");

	output("\n\nShe pats her thigh invitingly, and you quickly find yourself crawling up between Anno’s legs, hands reaching towards her lightdick. A moan escapes her lips as your fingers brush her undercarriage, caressing the " + chars["ANNO"].cockHeadGetName(annoDickType) + " and cupping her shaft toward your [pc.lips]. She coos with delight as your cock-pillows wrap around the " + chars["ANNO"].cockHeadGetName(annoDickType) + " of her " + chars["ANNO"].cockNoun(annoDickType, false) + ", back arching slightly as your [pc.tongue] caresses her hardlight penis. <i>“Oh, I like this sensation... I can see ");
	//if meeting w/ Anno/Syri is done:
	if(flags["ANNOxSYRI_WINCEST"] != undefined) output("why Syri keeps her dick");
	else output("how you could get addicted to it");
	output(".”</i>");

	output("\n\nOne of Anno’s hands reaches down to stroke your [pc.hair], ever so gently urging you onwards. You open wide");
	if(annoDickType == GLOBAL.TYPE_EQUINE) output(", jaw straining");
	output(" to take her strapon’s girth, and slowly start sliding down her pole. The first few inches go easily enough, though they leave a tingling sensation on your [pc.tongue]. However, there’s seemingly no end to Anno’s larger-than-life projection of a cock, and you soon feel its head bumping against the back of your throat, straining your mastery of your gag reflexes as it refuses to bend into your throat.");

	output("\n\n<i>“Just... just keep doing that...”</i> Anno groans, reaching up and cupping one of her breasts through her bra. <i>“Just like that...”</i>");

	output("\n\nYou figure you can oblige your lover for a bit longer and suppress your reflexes as best you can, focusing on fellating her glowing cock. As you move, you note Anno’s breath quickening, her tail twitching and curling in ever more erratic ways. You give her a quizzical look, and sheepishly your lover admits, <i>“I might have tweaked the... with the sensitivity settings. Maybe a-maybe alot ohgodfuckyes!”</i>");

	output("\n\nAnno grabs your [pc.hair] and pulls you down, thrusting as much of her thick, throbbing");
	if(annoDickType == GLOBAL.TYPE_EQUINE) output(" horse");
	else if(annoDickType == GLOBAL.TYPE_CANINE) output(" dog");
	else if(annoDickType == GLOBAL.TYPE_FELINE) output(" kitty");
	output(" cock into your mouth as she can. Her voice twists into a scream of pleasure, and her legs shoot out, wrapping around your shoulders and holding you in an ausar death grip as she pistons her hips into your mouth. You gag and cough, choking on her hardlight dick, unable to tell her - beg her - to back off. Instead, you’re left to be used as a cockholster as Anno rides out her orally-induced orgasm. When she comes down from her heady high, your lover merely slumps back, breathing hard, letting her " + chars["ANNO"].cockNoun(annoDickType, true) + " flop out of your well-fucked mouth.");

	output("\n\n<i>“I don’t know if I’m ever going to get used to that,”</i> Anno breathes, flopping back on her desk. Her cock stands upright like a flagpole, drooling with sweat and simulated rivulets of semen. Still, her legs remain tightly locked around your shoulders, holding you close as she recovers. After a few moments, she sits back up and grins down at you. <i>“Now for the fun part. Why don’t we switch places, babe?”</i>");

	output("\n\nShe strokes her slick hardlight cock for emphasis, and you quickly agree. She slips up off the bench, and gives you a playful push onto it, getting you to grab the edge and spread your [pc.legOrLegs] for her. She shifts behind you, and you give a little gasp as her fingers dig into your [pc.butt], giving you a little slap on the backside. You relax yourself as best you can in your lover’s arms, feeling the tingle of hardlight energy flopping into the crack of your [pc.butt]. Anno caresses your ass and hips, easing you into things as her strapon nears the clenched ");
	if(!pc.hasVagina()) output("ring");
	else output("lips");
	output(" of your [pc.vagOrAss].");

	output("\n\n<i>“Ready?”</i> Anno teases, the " + chars["ANNO"].cockHeadGetName(annoDickType) + " of her " + chars["ANNO"].cockNoun(annoDickType, false) + " pressing flush against your hole. You bite your lip and clutch the edge of the desk, waiting for Anno to act.");

	output("\n\nShe doesn’t keep you waiting long.");

	output("\n\nYou grit your teeth as Anno starts shifting her hips forward, slowly pressing her " + chars["ANNO"].cockNoun(annoDickType, true) + " into your [pc.vagOrAss]. Your fingers claw into the edge of the table, desperately trying to keep you steady as you feel the thick, lengthy shaft of her strapon spreading your hole wide. Her " + chars["ANNO"].cockNoun(annoDickType, false) + " sends shocks of tingling pleasure through your ");
	if(!pc.hasVagina()) output("clenching ass");
	else output("quivering cunt");
	output(", an electric sensation that sets your hair on end. You groan, back arching as you take inch after inch of rigid energy-dick. Anno plants a hand in the small of your back, gently urging you to lay flat on your chest");
	if(pc.biggestTitSize() >= 10) output(", or as flat as you can given your enormous bosom");
	output(". Her hands slip down once you’re situated, furry fingers digging into your [pc.hips] as she starts to move her hips faster.");
	//STRETCHIN'
	if(annoDickType == GLOBAL.TYPE_EQUINE)
	{
		if(pc.hasVagina()) pc.cuntChange(0,200,true,true,false);
		else pc.buttChange(200,true,true,false);
	}
	else
	{
		if(pc.hasVagina()) pc.cuntChange(0,40,true,true,false);
		else pc.buttChange(40,true,true,false);
	}

	output("\n\nAnno keeps a steadily rising pace, every thrust taking her as close to balls deep as she can get ");
	if(annoDickType == GLOBAL.TYPE_EQUINE) output("considering the bestial size of her shaft, straining your [pc.vagOrAss] to the breaking point around her girth");
	else output("considering her holographic cock lacks balls");
	output(".");

	output("\n\n");
	//if PC has a cock, no vag:
	if(pc.hasCock() && !pc.hasVagina()) output("Her motions put an incredible amount of pressure on your stretched ass, sending trembling waves of pleasure through you - especially when her " + chars["ANNO"].cockNoun(annoDickType, true) + " rubs and presses against your backdoor’s most sensitive spot, making your [pc.cocks] jump in response. <i>“Oh, you like that, do you?”</i> Anno teases, reaching around to grab [pc.oneCock] and give it a tender stroke. Even her slightest touch makes you shiver in response, and your body instinctively bends to her will, your cock shuddering out a thick trickle of pre onto Anno’s fingers. She giggles as you stain her snowy fur with [pc.cumColor], and she starts to move her wrist faster, jacking you off to the same beat of her ass-fucking.\n\n");
	//if PC has a cock AND vag:
	else if(pc.hasCock() && pc.hasVagina())
	{
		output("Your [pc.vagina] writhes around her thrusting hardlight cock, muscles shocked into action by the electric pleasure radiating through your cunny - and into your [pc.cock]. <i>“Oh, you like that, do you?”</i> Anno teases, reaching around to grab your [pc.cock] and give it a tender stroke. Even her slightest touch makes you shiver in response, and your body instinctively bends to her will, your cock shuddering out a thick trickle of pre onto Anno’s fingers. She giggles as you stain her snowy fur with [pc.cumColor] and she starts to move her wrist faster, jacking you off to the same beat of her strapon fucking.\n\n");
	}
	else output(" Your [pc.vagOrAss] squirms and writhes around the hardlight shaft thrusting into it. You’re soon moaning and groaning like a whore as Anno fucks you, hard and fast. ");
	//{Combine, same pg.}
	output("You can feel Anno’s breath hot and heavy on the back of your neck as she leans over it, pounding away at you and clearly getting more than she bargained for from her over-sensitive cock. <i>“Oh, I love the feeling of your [pc.vagOrAss],”</i> Anno breathes into your ear, barely audible over your own moans");
	if(pc.hasCock()) output(", which grow louder and more desperate as Anno works your [pc.cock] from both ends, bringing your so close to orgasm that you can taste it");
	output(". <i>“I’m gonna fuck it ");
	if(!pc.hasCock()) output("until we both cum");
	else output("until you baste my hand in cum");
	output(".”</i>");

	output("\n\nShe sounds like she’s as close to the edge as you are, her voice breathy and tinged with gasps and moans as it is. You can’t help yourself but to try and pull her over with you, moving your [pc.hips] back to meet her " + chars["ANNO"].cockNoun(annoDickType, false) + " at every thrust, taking her rod deeper than ever before, feeling it stretch your [pc.vagOrAss].");
	if(pc.hasCock()) output(" Her hand on your [pc.cock] increases its pace in equal measure, milking you for thicker drops of pre. You soon feel your own need rising to irresistible levels and cum starts welling up inside you, ready to burst forth.");
	output(" With a final cry of primal exultation, Anno digs her fingers into your [pc.hips] and slams herself into you, as hard and as deep as she can");
	if(annoDickType == GLOBAL.TYPE_CANINE) output(", the knot at the end of her canid cock ramming into your [pc.vagOrAss] and tying you together");
	output(". You cum instantly, the surge of ");
	if(pc.hasVagina()) output("cunt");
	else output("ass");
	output("-stretching pleasure driving you straight over the edge. You scream your climax to the heavens, your hole writhing wildly around Anno’s tingling hardlight dick lodged deep up your [pc.vagOrAss].");
	if(pc.hasCock()) output(" [pc.cumNoun] rushes through your [pc.cocks] and, just as Anno commanded, sprays out and across her waiting fingers. She lets out a sated sigh as your orgasm slathers her digits in [pc.cum], using your fluid as lube to continue jacking you until you’ve blown every drop of your load onto her desk.");

	output("\n\nYou give a shuddered gasp, all your weight hard on the desk as you ride out your orgasm. Anno’s hips move ever so slightly, slight thrusts in and out of you as she milks herself through the sensory feedback running through her hardlight panties. She rests against you after a few long moments, her hips pressed into your [pc.butt] as she deactivates the strap. You feel a sudden emptiness as the cock inside you flashes out of existence, but that feeling is replaced by warmth and comfort as Anno’s hands slip around you, holding you close. She presses flush against your back, hands playing across your body, especially your [pc.chest], slipping between you and the table.");

	output("\n\n<i>“That was nice,”</i> she purrs, nibbling on one of your [pc.ears]. <i>“I could get used to the feeling of my " + chars["ANNO"].cockNoun(annoDickType, true) + " deep inside that ");
	if(pc.hasVagina()) output("pussy");
	else output("asshole");
	output(" of yours.”</i>");

	output("\n\nYou murmur your agreement as Anno stands up, gives you a playful spank, and reaches for her clothes.");

	flags["ANNO_EVER_STRAPONED"] = 1;
	annoSexed(1);

	processTime(27);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Strapon Modification
//Anno owns a strapon. Add [Strapon Mods] to her menu.
public function annoStraponMods():void
{
	clearOutput();
	author("Savin");
	showName("\nANNO");
	showBust("ANNO");
	output("<i>“Oh, hey, check this out,”</i> Anno says, waving you over to her work bench. Amid a clutter of broken-down guns, tools, and electrical equipment sits, of all things, the pair of lacy orange panties she bought from <i>Mi Amour</i>. <i>“Remember these?”</i> ");
	output("\n\nYou nod, and your lover continues. <i>“Well, I’ve been tweaking ‘em a little. I mean, a hardlight cock is cool and all, but we can do better than that, right? I totally voided the warranty on these, but check it out!”</i>");
	output("\n\nAnno picks her panties up and slips them on over her [anno.lowerGarment]. After a moment of adjusting, she keys the little button hidden on her hip, and the hardlight projectors spring to life. Rather than the hefty human cock that Aliss showed off at the shop, Anno’s crotch erupts into a gargantuan equine cock, thicker around than her arm and near as long as her leg. The over-sized horsecock throbs and flops down under its own imagined weight, hanging menacingly between Anno’s legs.");
	output("\n\nSeeing the look in your eyes, Anno giggles and grabs her hardlight erection, stroking it tenderly as she speaks. <i>“I did a little modding on this bad boy. Enhanced batteries, stronger projection filters, and a whole slew of new cock shapes and sizes. And no, I totally don’t have penis envy, why do you ask?”</i>");
	output("\n\nShe flicks another, new dial under the power button, and the gargantuan horsedick flickers out of existence, replaced by a much more reasonably-sized canid cock, complete with a butt-busting bitch-breaker at the hilt. Anno grins, rubbing the knot with her thumb until she shivers with pleasure. Another turn of the dial, and her doggydick is replaced by a bristly kittycock, complete with rings of sensitive little bumps and nodules along the crown. She runs a finger along the bristles, arching her back and moaning as the tactile feedback sends waves of pleasure through her.");
	output("\n\nAnno takes a step closer, giving you a lascivious wink. <i>“What do you say, next time I give you a good fucking you help me... alpha test these new mods? I promise, it’ll be the most fun QA you’ve ever done.”</i>");
	output("\n\nHow could you say no?");
	flags["ANNO_STRAPON_MODS_ENABLED"] = 1;
	processTime(7);
	pc.lust(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

