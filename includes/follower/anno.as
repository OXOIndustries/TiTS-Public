import classes.Creature;
import classes.GameData.CombatManager;
import classes.Items.Apparel.SteeleTechSuit;
import classes.Items.Apparel.AnnosBlouse;
import classes.Items.Apparel.AnnosCatsuit;
import classes.Items.Guns.Goovolver;
import classes.Items.Miscellaneous.AusarTreats;
import classes.Items.Protection.JoyCoPremiumShield;
import classes.ItemSlotClass;
import classes.TiTS;
import classes.Util.InCollection;

/* 
FLAG SHIT:-

ANNO_CREWMEMBER - 0/Undefined : Not Recruited, 1 : Is Crewmember, 2 : Recruited but kicked off the ship

CREWMEMBER_SLEEP_WITH : String, "name" of the character that the PC currently has set as their bedbuddy. -> "ANNO". Undefined = None.

ANNOxKAEDE_LAST_DAY : The last day number that a kaede/anno 3some possibility happened. If flag < days - 7 is true, the option can (potentially) appear based on a rand check.

ANNO_MISSION_OFFER : State of Annoquest. 3 == Completed. If not 3, Anno must have been recruited via Tarkus assploding. This is the better check to figure out how she was recruited - you can do her quest and then blow tarkus up after the fact.

ANNOxSYRI_WINCEST : For when Syri (eventually) gets written and added.

ANNOxKAEDE_INTRODUCED : PC has been introduced by Anno to Kaede

ANNO_MAID_OUTFIT : Anno bought a maid outfit so her special maid scene can proc. 1 if she got it in Tavros (go to Tavros first with Anno as crew), 2 if she got it in Uveto (go to Uveto first with Anno as crew).

ANNO_MAID_SEX : How many times you fucked her with her feather duster.
 */

// Anno has been recruited and is currently on the players ship.
public function annoIsCrew():Boolean
{
	if (flags["ANNO_CREWMEMBER"] == 1) return true;
	return false;
}
public function annoRecruited():Boolean
{
	if (flags["ANNO_CREWMEMBER"] != undefined) return true;
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

public function annoFollowerHeader(nude:Boolean = false):void
{
	showAnno(nude);
	author("Savin");
}

public function annoThreeWayed():Boolean
{
	if(flags["UVETO_HUSKAR_FOURSOME"] == 1) return true;
	if(flags["ANNO_X_KAEDE_THREESOMED"] != undefined) return true;
	return false;
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
			output("Vic left me on the ship for [pc.him],”</i> she answers, shifting over to put an arm around your shoulder. <i>“I think Mr. Steele didn’t want [pc.himHer] to get lonely.”</i>");

			output("\n\nAnno chuckles. <i>“Aww, that’s sweet. Gosh, it’s been ages, Cel. We’ve got a lot of catching up to do!”</i>");

			output("\n\nCelise nods eagerly. You pat the girls on the shoulders and leave them to catch up from since... whenever it is they met.");
		}
		
		output("\n\n(<b>Anno has joined your crew!</b>)");

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
		output("<i>“[pc.name]!”</i> she shouts over the din of a loud pop jam blaring from her computer, <i>“I didn’t see you there. I hope you didn’t mind my singing. It’s a new one from " + RandomInCollection("Touch Fluffy Tail", "The Beagles", "Playing Poker", "Buried Treasure") + " that I haven’t been able to get out of my head.”</i>");
		output("\n\nShe gives you an apologetic grin as she flips the music off.");
	}
	else output("You give a light rap on Anno’s door, which rocks back on its hinges, unlocked. Anno’s sleeping face-down on her desk. You give her a little poke, which quickly has her jerking her head up and rubbing the sleep from her eyes. <i>“Oh, shit. What time is it?”</i>");

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
	addButton(0, "Buy", annoFollowerBuyMenu, undefined, "Buy", "See what Anno has for sale.");
	addButton(1, "Sell", annoFollowerSellMenu, undefined, "Sell", "See if you can sell any of your carried items to Anno.");
	addButton(2, "Talk", annoFollowerTalkMenu, undefined, "Talk", "Talk to Anno about a variety of topics.");
	addButton(3, "EarScritch", annoFollowerEarScritches, undefined, "Ear Scritches", "Give Anno an affectionate little pet.");
	
	addButton(5, "Appearance", annoFollowerAppearance, undefined, "Appearance", "Review what Anno’s entire body looks like.");
	if (pcHasJunkPrize() && flags["ANNO_SCRAP_DISABLED"] == undefined) addButton(6, "Sell Prize", tryToSellAnnoSomeRaskScrapGuv, undefined, "Sell Prize", "Try to sell off the sweet loot you bought from the gang of raskvel males.");
	else addDisabledButton(6, "Sell Prize", "Sell Prize", "This merchant isn’t interested in whatever you’re considering to be a prize.");
	
	if (pc.lust() >= 33) addButton(8, "Sex", annoFollowerSexMenu, undefined, "Sex","Have some sexy fun with Anno.");
	else addDisabledButton(8, "Sex", "Sex", "Gotta get fired up before you can approach the snowy ausar for some ‘entertainment’.")
	
	if (flags["ANNO_SLEEPWITH_INTRODUCED"] != undefined)
	{
		if (haveFuckedAnno())
		{
			if (flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") addButton(7, "No Sleep W.", annoSleepToggleOff, undefined, "Don’t Sleep With", "Tell Anno you’d like to sleep without her for now.");
			else addButton(7, "Sleep With", annoSleepToggleOn, undefined, "Sleep With", "Tell Anno you’d like her to sleep with you in the evenings.");
		}
		else
		{
			addDisabledButton(7, "Sleep With", "Sleep With", "You could probably get a cuddly ausar bed-buddy if you had sex with her.");
		}
	}
	else addDisabledButton(7, "Sleep With", "Sleep With", "A nice rest sounds good... maybe Anno might pay you a vist of her own accord in the process.");
	
	
	if (InCollection(shipLocation, "TAVROS HANGAR", "SHIP HANGAR", "201", "500")) addButton(13, "Evict", annoFollowerBootOff, undefined, "Evict from Ship", "Tell Anno to get off the ship. You might break her heart a little, but you’ll probably be able to pick her up again later.");
	else addDisabledButton(13, "Evict", "Evict from Ship", "You can’t bring yourself to kick Anno off your ship here. Head back to a mainline planet or station first.");

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
	pc.shower();

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

	output("You sleepily toss and turn in your bed, but you can’t quite shake the feeling that something is missing. It takes a few minutes for your brain to actually kick back in to gear, slowly beginning to wake up, but you can’t quite figure out what it is that’s wrong. You keep trying to wrap your arm around something that just isn’t there, trying to snuggle in against a body that, for some reason, you expect to be tucked up against your [pc.chest].");

	output("\n\nYou shoot upright when you realize somebody’s missing - an empty spot on your mattress, still warm from the heat of a body recently occupying it.");

	output("\n\n<i>“Oh hey [pc.name],”</i> echoes a greeting from your side. You turn to look and find Anno having just stepped out of your shower. She’s stood in the doorway to your bathroom, a towel wrapped around her body and another balled up around her hair. <i>“Sorry, I’m kind of an early riser - you don’t mind me using your shower right?”</i>");

	output("\n\nShe takes a step out into your quarters, the towel wrapped around her body parting down the side of her leg to frame a view of glistening ausar thigh, and you can’t muster anything other than an appreciative grunt. You certainly don’t mind her using your shower; especially if one of the perks is getting to wake up to this kind of view.");

	output("\n\n<i>“Down " + pc.mf("boy", "girl") + "!”</i> she responds whilst quickly stepping back into the bathroom, closing the door behind her. She keeps talking loud enough for you to hear her clearly, <i>“I’ve only just got myself dry - do you know how hard it is to dry fur? I’m not getting all sweaty and messy right after I’ve </i>just<i> got clean.”</i>");

	output("\n\nYou fall back down onto the mattress, still half asleep and now a little warm under the collar thanks to Anno’s impromptu skin-show. You must have drifted back to sleep, as it seems like only seconds later the telltale hiss of door hydraulics signals the white-haired ausar’s departure from the bathroom, this time clad in her");
	if (anno.armor is AnnosCatsuit) output(" deliciously tight catsuit");
	else output(" regular clothes");
	output(" rather than one of your towels.");

	output("\n\n<i>“All yours, Steele!”</i> she says, before bounding towards the main door to your quarters. <i>“See you later, yeah?”</i>");

	output("\n\nDid - did she blow you a kiss on her way out? The tease....")

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
	
	output("\n\nShe bites her lip and lets out a pitiful little whine. <i>“Never mind. It’s fine. I’ll, uh,");
	if (shipLocation != "TAVROS HANGAR") output(" I’ll hitch a ride to");
	else output(" stay here on");
	output(" Tavros, then. Kaede’s got a place up on the higher rings; I can just crash there for a while.”</i>");
	
	output("\n\nYou nod, and watch as Anno hurriedly collects her belongings. You get the distinct sense she’s trying not to cry as she scurries off your ship.");

	flags["ANNO_CREWMEMBER"] = 2;
	if (flags["CREWMEMBER_SLEEP_WITH"] == "ANNO") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	
	output("\n\n(<b>Anno is no longer on your crew. You can find her again in Tavros Station.</b>)");

	processTime(15);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoAtAnonsAddendum(slot:int = 8):void
{
	if (pc.hasStatusEffect("Anno Bar Busy")) return;
	
	// Recruited but booted off da ship
	if (flags["ANNO_CREWMEMBER"] == 2)
	{
		output("\n\nAnno is sitting at the bar, nursing a whiskey and working on a glowing datapad.");
		addButton(slot, "Anno", annoFindingALostPooch, undefined, "Anno", "See how the ausar recruit is doing.");
	}
	// Is an active crewmember - see if we can proc the Kaede event.
	else if (flags["ANNO_CREWMEMBER"] == 1)
	{
		if (flags["ANNOxKAEDE_LAST_DAY"] == undefined) flags["ANNOxKAEDE_LAST_DAY"] = days - 8;

		if (haveFuckedAnno() && flags["ANNOxKAEDE_LAST_DAY"] < days - 7)
		{
			if (rand(3) == 0 || pc.hasStatusEffect("Anno x Kaede Bar"))
			{
				output("\n\nAnno is drinking and conversing with " + (hasMetKaede() ? "Kaede" : "a red-headed friend") + " at the bar.");
				pc.createStatusEffect("Anno x Kaede Bar", 0, 0, 0, 0, true, "", "", false, 15);
				addButton(slot, "Anno", annoxKaedeFollowerMeeting, undefined, ("Anno & " + (hasMetKaede() ? "Kaede" : "Friend")), "Catch up with the two.");
			}
		}
	}
}

public function annoFindingALostPooch():void
{
	if (flags["ANNOxKAEDE_LAST_DAY"] == undefined) flags["ANNOxKAEDE_LAST_DAY"] = days - 8;

	if (haveFuckedAnno() && flags["ANNOxKAEDE_LAST_DAY"] < days - 7)
	{
		if (rand(3) == 0 || pc.hasStatusEffect("Anno x Kaede Bar"))
		{
			annoxKaedeFollowerMeeting();
			return;
		}
	}

	clearOutput();
	annoFollowerHeader();
	
	output("<i>“Hey, you,”</i> you say, planting a hand on Anno’s head. She spins around on her barstool, all but shrieking when you grab her. When she sees whom it is, though, her cry turns into one of barely contained excitement. She leaps up into your arms, squeezing you so tightly that you think you hear something crack.");

	output("\n\n<i>“Boss! You came back!”</i> she squeals, still hugging you. <i>“What’s the plan, [pc.name]?”</i> she adds hopefully.");

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

	output("\n\n<i>“Oh. Yeah, sure. No worries,”</i> she says, rubbing at her neck. <i>“I’m actually making good progress on my book, so no rush. Plenty of stuff to do around here.”</i>");

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

	output("\n\nA quick trip to her girlfriend’s apartment to collect her things, and you’re ready to go. Hand in hand, you guide Anno back aboard your ship. She settles in like she’d never been gone.");

	output("\n\n(<b>Anno has rejoined your crew!</b>)");
	
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
	if (flags["ANNO_MISSION_OFFER"] == 3) anno.keeperBuy += " Steele Tech’s still supplying us with top-tier equipment, and plenty of it.";
	else anno.keeperBuy += "My contacts might be a </i>little<i> more seedy these days, but the equipment they’re hooking me up with isn’t too far behind Steele Tech’s gear.";
	anno.keeperBuy += "”</i>\n";
	buyItem();
}

// Updates and configures Annos inventory depending on how she ended up on the players ship
public function annoFollowerInventoryCheck():void
{
	// MISSION_OFFER tracks the quest, 3 is complete. The only way she can be a follower and have a mission offer status of 3 is if she's still employed by Steeletech.
	if (flags["ANNO_MISSION_OFFER"] == 3)
	{
		// Check for the presence of a unique item, if not there, add all
		if (!anno.hasItemByClass(SteeleTechSuit))
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
		if(pc.level >= 5)
		{
			if(!anno.hasItemByClass(ZhouLingRifle)) anno.inventory.push(new ZhouLingRifle());
		}

		// Buy/Sell markups
		anno.sellMarkup = 1.1;
		anno.buyMarkdown = 0.85;
	}
	else
	// Unemployed by Steeletech
	{
		if (!anno.hasItemByClass(JoyCoPremiumShield))
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
	anno.keeperSell += "”</i>\n";
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
		if (flags["ANNO_NOVA_UPDATE"] != 2) addButton(11, "Nova Update", annoNovaUpdate, true, "Nova Update", "Ask Anno if there’s been any further developments regarding the Nova.");
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
		addDisabledButton(8, "Contacts", "Shady Contacts", "Anno doesn’t have need of her shady black market contacts whilst still employed by Steele Tech.");
	}
	
	if(flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined)
	{
		if(flags["ANNO_STRAPON_MODS_ENABLED"] == undefined) addButton(9,"Strapon Mods",annoStraponMods,undefined,"Strapon Mods","Check with Anno to see if she’s modified her strapon at all.");
		else addDisabledButton(9,"Strapon Mods","Strapon Mods","Anno has already tweaked her hardlight strapon. Good job!");
	}
	else addDisabledButton(9,"Strapon Mods","Strapon Mods","Anno needs to own a hardlight strapon before it can be modified. Maybe you could take her to Tavros and look for a store that sells them.");
	
	addButton(10, "Special Gear", annoFollowerSpecialGear, undefined, "Special Equipment", "Talk to Anno about any special equipment she might be able to build or buy for you.");
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
	
	output("\n\n<i>“First step: micro-ize the tech. There’s no reason for the Gates to be so damn big, right? Maybe a thousand years ago we needed capital-ship sized platforms for the tech, but nowadays it’s all about microchips so small you can’t even see them, plus holo and hardlight mechanisms. So we spent about a year working to miniaturize the Gates, with a little help from the Joint Ausar Fleet’s R&D, who immediately saw the potential for transmat on the individual scale: imagine being able to invade a planet from orbit, but completely bypassing the planet’s air-to-ground defenses. You just truck into orbit and warp your troops and material behind enemy lines. It could have revolutionized warfare, much less personal travel and planetary transportation. God, imagine standing on Ausaril, then just stepping through a door frame and onto Terra? We could have changed the </i>galaxy!<i>”</i>");
	
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
	
	output("\n\nShe chuckles to herself. <i>“Let’s see... uh... man, why do you have to ask hard questions? Come on, ask me about warp theory or quantum mechanics or light drives - pitch me an easy question, [pc.name].”</i> When you decline, she groans in exasperation and slides down into her chair, legs crossed. <i>“God damn, I’m uninteresting. Well, uh, I watch a lot of TV I guess. Especially </i>Steph Irson<i>, James Farmer’s </i>Forty-Eight Hours<i> - oh, and </i>Magical Space Princess Lyota<i>.”</i>");
	
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
	if (pc.lust() >= 33) addButton(0, "Sex", annoFollowerEarScritchesSex, undefined, "Sex","Follow that scratch up with some sex.");
	else addDisabledButton(0, "Sex", "Sex", "You’re not horny enough for that...")
	addButton(1, "Tease", annoFollowerEarScritchesTease);
}

public function annoFollowerEarScritchesSex():void
{
	clearOutput();
	annoFollowerHeader();

	output("With Anno panting happily in your arms and her tail wagging freely behind her, you figure the perky little ausar’s in for a special treat.");

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
		
		if (pc.cockThatFits(anno.vaginalCapacity() + 2000) != -1) addButton(1, "Suck&Fuck", annoFollowerSuckAndFuckSex, undefined, "Suck & Fuck", "Have Anno blow you, then give her a rough fucking to top it off.");
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
		addButton(3, "SixtyNine", annoFollowerSixtyNineSex, undefined, "SixtyNine", "Crawl into bed with Anno and give each others’ feminine parts some oral attention.");
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
	
	if(flags["ANNO_TRIBERATOR_USED"] == undefined) addButton(8,"Vibrator",annosTriberatorGatorMatorHater,undefined,"Vibrator","Is that an ausar vibrator over there? Maybe you can use it on her.");
	else addButton(8,"Vibrator",annosTriberatorGatorMatorHater,undefined,"Vibrator","Use Anno’s vibrator on her again.");

	if (pc.cockThatFits(anno.analCapacity()) != -1 && pc.hasTailCock() && pc.hasParasiteTail()) addButton(9, "Tailfuck", annoFollowerTailcockSex, undefined, "Tailfuck", "Pitch Anno a little tail-cock loving.");
	else addDisabledButton(9, "Tailfuck", "Tailfuck", "You need an appropriately-sized penis and a parasitic tailcock for this.");

	if(pc.hasVagina() || (pc.hasCock() && pc.cockThatFits(anno.vaginalCapacity(0)) >= 0))
	{
		if(!leavePlanetOK()) addDisabledButton(10,"PetPlay","Pet Play","You are unable to fly to Tavros Station to try this.");
		else addButton(10,"PetPlay",annoPupperPlay,undefined,"Pet Play","See if Anno’s willing to spend some time on the business end of a leash.");
	}
	else if(pc.hasCock() && pc.smallestCockVolume() > anno.vaginalCapacity(0)) addDisabledButton(10,"PetPlay","Pet Play","You’re too big to fit inside her when you do this.");
	else addDisabledButton(10,"PetPlay","Pet Play","You need a penis that fits inside her in order to do this.");

	addButton(14, "Back", annoFollowerMenu);
}

public function annoFollowerTailjobSex():void
{
	clearOutput();
	annoFollowerHeader(true);

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
	
	output("\n\nYou gently stroke her tail one last time before clenching around the tip and locking it in your fist. Anno coos, a little moan escaping her lips as you start to curl the slender bit of flesh at the fluff-ball’s center around the diamond-hard length of your [pc.cock]. Once, twice, almost three times you loop her tail around your prick, pulling it tight at the end until you both gasp with pleasure and pain at the tightness. ");
	
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
	
	output("\n\nThough one hand’s occupied keeping your ausar cock-sheath wrapped tight around you, the other slips down to Anno’s wide hip to gently caress the curves of her body and gently guide her forward once again. The ausar gives a husky moan as you shift her forward and back again, every motion of her cloth-straining ass moving her tail with it and dragging your cock through the sinfully soft loops of her tightly held tail. Oh, that’s good.... You urge Anno on faster, steadily increasing the tempo of her body-rocking movements and keeping a constant cavalcade of sensation centered around your squirming, desperate [pc.cock]. You won’t last long like this, and frankly that’s all right. Anno’s doing this just for your pleasure, after all: no need to keep a girl waiting, is there? With a contented sigh, you let yourself go by relaxing all of your sexual safeguards and resistances and utterly submitting to the pleasure of Anno’s tail caressing your dick.");
	
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
	annoFollowerHeader(true);

	var selCock:int = pc.cockThatFits(anno.vaginalCapacity());
	if(selCock < 0) selCock = pc.smallestCockIndex();
	
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
	
	output("\n\nYou thought she was moaning before... Her voice breaks into a high-pitched whine as her fingers delve into her sex, her cries only stifled when your [pc.cock] is occupying her throat. You fuck faster, hips hammering to the beat of her wrist’s movements, reciprocating her every movement with one of your own. Soon, your voice joins hers, quiet moans turning into bestial grunts as your hips batter her face, her oh-so-skilled tongue, mouth, and throat working in concert to milk every inch of cockflesh that comes their way. ");
	
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
	annoFollowerHeader(true);
	
	var selCock:int = pc.cockThatFits(anno.vaginalCapacity());
	if(selCock < 0) selCock = pc.smallestCockIndex();

	output("<i>“I think I can manage that,”</i> you grin, slipping up onto the bed and taking hold of Anno’s flared hips, fingers digging into the");
	if (anno.armor is AnnosCatsuit) output(" elastic material of her sheer, flesh-hugging catsuit");
	else output(" thick denim of her jeans");
	output(". Before you can get carried away, Anno’s fluffy tail reaches up, its tip tickling your nose as its owner looks over her shoulder expectantly. ");
	
	output("\n\nYou mock rolling your eyes as you take hold of the wriggling appendage, stroking it gently as you guide it out of the way. Anno visibly shudders at the sensation, clearly enjoying a little affection on her canid parts. You give the tail a little push back through the hole in her");
	if (anno.armor is AnnosCatsuit) output(" catsuit’s");
	else output(" jeans’");
	output(" rear end before pulling the whole outfit down in one easy stroke, letting it ball around your ausar lover’s spread legs and leaving her nice and bare for you. She gives a happy moan as the last of her clothing falls free, wiggling her butt back into your bare, cum-slathered groin. You answer with a quick slap on one of her rounded cheeks, eliciting a startled squeak from her as her flesh jiggles in response.");
	
	output("\n\n<i>“Not yet,”</i> you tease, pulling your crotch back from her ample ass. You slide down to your [pc.knees], hands running up and down Anno’s toned legs and big, squishy butt as you go, feeling up every inch of bare ausar flesh, fingers running through the furred lower halves of her legs, all the way down to her cute, clawed feet. Slowly, sensually, you work your way back up to your goal: the soft, pliant flesh of her ass; at your touch, her cheeks quiver and quake as Anno’s excitement makes itself known with a vigorous tail-wag that batters at your face. Again you move the troublesome tail out of the way as your hands spread her cheeks wide, revealing the flushed red lips of her sex. Anno tries and fails to suppress an anxious whimper as your breath comes hot on her naked slit, fingers holding her cheeks wide open, just enough to give her the slightest hint of a gape. ");
	
	output("\n\n<i>“Mmmm. What’re you...”</i> Anno moans, her voice trailing off as you lean in, tongue darting out to lap at the sweet ambrosia glazing the lips of her sex. She gasps and fidgets, feet clawing at the ground in response to the sudden, pleasurable touch. You give one of her full cheeks a squeeze to calm her twitching leg, letting you concentrate on the pair of eager holes at hand. Your tongue probes in, gently parting the veil of her cunny only to be instantly greeted with an almost overpowering scent of sex and need as a trail of slime rolls out onto your delving [pc.tongue]. You shudder at the sweet taste of your lover’s want, eagerly lapping up the sweet juices.");
	
	output("\n\nAnno shudders, moaning quietly as you start to eat her out. To your delight, you’re soon joined by one of Anno’s own hands as she reaches back between her legs to spread her lips wide for you, giving you unimpeded access to her honeypot. You reward the eager slut with a kiss right to the pleasure-buzzer, giving her another ecstatic shock that nearly ends with you getting a faceful of tail before you can bury yourself back between her cheeks. You can hear your lover moan and sigh as you start to really work your way into her, but your vision is completely blotted out by the two half-moons of ass in front of you, leaving you to navigate in darkness as your tongue probes deep into her womanhood, caressing the convulsing walls and lapping up her free-flowing juices as fast as you can. No matter how fast you slurp up her nectar, though, there’s always more escaping by you, beading on your cheeks and chin until you feel like you’ve just dunked your head. Well, that’s an ausar for you - you’re soon nose-deep in a glistening delta of slime and excitement as her body reacts to your touches, preparing itself for a knotty ausar cock to spear her sex wide open");
	if (pc.hasKnot(selCock)) output(" and that’s exactly what you’re going to give it");
	output(".");
	
	output("\n\nSatisfied that your pooch’s pussy is nice and ready for you, you rise back up and take hold of your [pc.cock " + selCock + "], dropping it into the spread hind cleavage of Anno’s ass. Her breath catches when she feels your man-meat slap against her slick skin. You can feel her positively shiver with excitement, looking back at you over her shoulder with bated breath, awaiting your next move. You flash her a grin and rock your hips back, sliding your prick lengthwise through the lips of her cunt, barely suppressing a shudder as the slimy, wet slit reaches out to kiss your cock, smearing it with her ample juices. A few thrusts through that channel, and your [pc.cock " + selCock + "] is coated with a nice sheen of fem-lube, glistening in the dim light of Anno’s store as you bring the [pc.cockHead " + selCock + "] to rest just barely parting the veil of her [anno.cunt].");
	
	if (flags["ANNO_FUCKNSUCK"] == undefined) output("\n\nAnno looks back at you with a smile as she breathily intones, <i>“Don’t worry about cumming inside. I’m on Sterilex. No heat, no pups, and all the creampies I want!”</i> When she’s finished, Anno smiles appreciatively over her shoulder, wiggling her ass teasingly. <i>“Come on then... I’m ready for you,”</i> she breathes, her white tail raising invitingly as your schlong slowly slides forward.");
	else output("\n\nAnno flashes you a lustily smile over her shoulder and wiggles her ass invitingly, raising her tail and spreading her cheeks. <i>“Come on, [pc.name]. I’m wet and ready for you!”</i> she breathily moans.");
	
	output("\n\nAnno bites her lip, muffling a girlish whimper as your [pc.hips] rock forward, inching your [pc.cock " + selCock + "] into her sodden quim. You nearly join her as you feel your cock submerging into the sultry hole, surrounded by hot, wet, squirming walls as Anno’s pussy clenches around your intruding member. You push forward despite her body’s resistance, the ausar’s incredibly wet sex making it unnaturally easy to spread her walls wide. Anno moans as you plunge deep into her sex, fingers digging into the lip of her desk, tail flicking madly as you bottom out inside her");
	if (pc.cockVolume(selCock) >= (chars["ANNO"].vaginalCapacity() + 200)) output(", your tremendous cock stretching her out almost painfully wide, distending her gut against the bed");
	output(".");
	pc.cockChange(true, false);
	
	output("\n\n");
	if (pc.balls > 0) output("Balls");
	else output("Hilt");
	output(" deep inside your bent-over lover, you give her a two-pronged slap on the butt, both hands digging into the pert assflesh on display. Anno yelps playfully, and her vaginal muscles contract hard around your member, wringing tight enough that you can feel her quickening heartbeat through the grinding walls of her pussy. With a firm grip on Anno’s hind-end, you drag yourself out of her slick slit");
	if(pc.hasSheath(selCock)) output(", pleased to see your sheath slathered with her juices, so covered that it starts to drip onto the floor, pooling " + (pc.isBiped() ? "between" : "at") + " your [pc.knees] - and with your cock withdrawn to the crown, even more of");
	else output(" and watch as");
	output(" her fem-slime drools out of her pussy, a constant trickle down her thighs onto the bed.");
	if (pc.isAss()) output(" Maybe you’ll have to make her clean up after herself after you’re done with her...");
	
	output("\n\nFaster this time, you thrust back into Anno’s still-gaping pussy. She gives a sharp moan as your [pc.hips] slap into her, leaving her ass bouncing with the impact and your [pc.cock " + selCock + "] buried back into that wonderful hole of hers, surrounded by spasming muscles as she recovers from the potent thrust. Again and again you thrust into her, working yourself up to a steady rhythm of pussy-pounding, occasionally punctuating your peaks with a sharp slap on Anno’s jiggling butt or reaching up to cup one of her bouncing breasts, squeezing her stiff nips until she’s screaming for more. ");
	
	output("\n\nThanks to your recent orgasm and the minutes of pussy-eating that preceded your penetration, you’re soon greeted by the howling cries of Anno’s impending climax. You grin, slapping her cheeks and burying yourself deep inside your lover as she screams her pleasure, echoing in through the room; her pussy clenches down hard, milking your [pc.cock " + selCock + "] for all it’s worth as she cums and cums, going crazy around your thrusting cock.");
	
	if (pc.hasKnot(selCock))
	{
		output("\n\nWhile she’s at the peak of her pleasure, you decide it’s time for the main course. With one last, mighty thrust of your hips, you slam the turgid ball of your [pc.knot " + selCock + "] into the sodden delta of Anno’s drooling, orgasming sex. Her cries of pleasure crescendo into a high-pitched scream of shock and mind-wracking ecstasy as her cooch is forced open by your thick " + (pc.cocks[selCock].cType == GLOBAL.TYPE_CANINE ? "canid" : "knotted") + " member. Your thrust pins Anno to the bed, spreading her legs and sex apart as you sink yourself into her, tying the two of you together.");
	}
	
	output("\n\nThanks to the wild, milking motions of Anno’s cunt, you can feel your own orgasm rushing up to follow hers. You push your prick as deep inside your lover as you can, letting her still-spasming muscles do the work for you, squeezing and caressing your cock, slathering it with hot juices trapped inside her wanton hole by the thick cock spearing her, unable to escape. Your orgasm hits you like a hammer, giving you just enough time to let loose a feral roar of pleasure as a thick wad of cum surges up your [pc.cock " + selCock + "], blasting into the ausar’s clenching pussy. You grunt and groan with the spasms, hips bucking against Anno’s red-flushed ass as your load works itself out, eased along by Anno’s own squirming walls.");
	
	output("\n\nChest heaving from exertion, you sigh heavily as your orgasm passes,");
	if (!pc.hasKnot()) output(" feeling your [pc.cum] trickle out around your shaft");
	else output(" your knot trapping every drop of your [pc.cum] in your lover");
	if (pc.cumQ() >= 750) output(" as your huge load stretches Anno wide from the inside");
	output(". For a moment, you let yourself lean forward, resting against Anno’s back as the last shockwaves of pleasure pass through you");
	if (pc.biggestTitSize() >= 1) output(", pressing your tits against her back and letting her feel your every tiny motion against her sweat-sheened skin");
	output(". With a soft moan, Anno leans back and kisses you, letting you taste your last orgasm still clinging to her lips as she locks tongues with you. You reach under her, cupping her heaving bosom until she squeals with over-sensitivity. Slowly, you roll both of your bodies over and under the cum-stained sheets, arms wrapping tight around her. ");
	
	output("\n\n<i>“Now </i>that<i> was a treat,”</i> Anno purrs, nuzzling back against you. <i>“Mmm... how about we stay like this for a little while, huh? I want to feel you go soft inside me.”</i>");
	
	output("\n\nWell, that’s one request you can’t refuse...");

	processTime(20+rand(10));
	annoSexed(1);
	anno.loadInCunt(pc, 0);
	pc.orgasm();
	anno.orgasm();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerAnalSex():void
{
	clearOutput();
	annoFollowerHeader(true);

	var selCock:int = pc.cockThatFits(anno.analCapacity());
	if(selCock < 0) selCock = pc.smallestCockIndex();
	
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

	output("\n\nYou strip yourself out of your [pc.gear], letting your [pc.cock " + selCock + "] flop free into the crack of her ass, the crown just pressing into the base of her tail. Anno gives you a lusty grin over her shoulder and clenches down, momentarily trapping your prick between the taut cheeks. You answer with a sharp slap on her ass, enough to make her yelp and let you go. Once you’ve regained control of your prick, you spend the next few moments slathering it in the readily-available juices on your fingers, only stopping to refresh your supplies in the rivers running down Anno’s thighs. ");

	output("\n\nSatisfied your [pc.cock " + selCock + "] is nice and wet, you move in toward your dark little prize, rubbing a few pussy-soaked fingers through the cleft of Anno’s sex and up to the clenched ring of her ass.");

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
	
	output("\n\n");
	if(chars["ANNO"].analVirgin) output("To your surprise, ");
	output("Anno glances over her shoulder at you and gives a nervous half-smile, saying, <i>“Go on already... stop teasing me and put it in.");
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
	annoFollowerHeader(true);
	
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
	annoFollowerHeader(true);

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

	if (flags["ANNO_ANALSEXED"] == undefined) flags["ANNO_ANALSEXED"] = 0;
	flags["ANNO_ANALSEXED"]++;
	
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
	annoFollowerHeader(true);

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

	pc.girlCumInMouth(chars["ANNO"]);
	anno.orgasm();
	pc.lust(15);
	annoSexed(1);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerSixtyNineSex():void
{
	clearOutput();
	annoFollowerHeader(true);

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
	
	output("\n\nYou surrender to your pleasure, mindlessly suckling the nectar deep in your lover’s pussy as she brings you to climax. You moan out a stuttering, <i>“c-cumming!”</i> when you do, voice breaking into a squeal as your [pc.cunt] spasms around Anno’s probing tongue. Your world explodes in pleasure as you cum, raining femspunk onto Anno’s face as your [pc.legOrLegs] clench around her, muscles recoiling from the overwhelming sensation. Still, your tongue is ceaseless in its pursuit of your partner’s pleasure even in the face of your own, and before you’ve calmed down, it’s Anno’s turn to scream out her climax, voice echoing down the corridors as her pussy goes wild around your tongue buried to the hilt inside her. And she’s a squirter, no doubt about it: you manage to pull back just in time to avoid a faceful of ausar girl-spunk as Anno cums, splattering the bed with her thick, aromatic love juice.");
	
	output("\n\nPanting with exhaustion and staggered by errant bursts of ecstasy in the afterglow of your lovemaking, you slump down, resting your head in the soft, wet valley of Anno’s thighs, trying to catch your breath. You can’t stop a smile, though, as you see Anno’s tail wagging happily, especially as you reach out and stroke the soft white appendage, sending another shiver of bliss through your lover as you rest in each other’s arms.");

	pc.orgasm();
	pc.girlCumInMouth(chars["ANNO"]);
	anno.orgasm();
	annoSexed(1);

	processTime(30+rand(10));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerShowerSex():void
{
	clearOutput();
	annoFollowerHeader(true);

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

	output(" Breathless, Anno desperately pulls your [pc.gear] before giving you a push through the bathroom door.");
	
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
		output(" helplessly at Anno’s touch, ready to give at the slightest sexual stimulation. With a wolfish grin, Anno locks eyes with you and gives you a knowing wink before letting her tongue do the talking. A shock of pleasure surges through your body when Anno’s tongue finally gives you what you want - what you need - gliding across the full swell of your [pc.clit]. You can’t hold in a low, husky moan, squirming at the sensation of her oral assault; she answers with more licks across your blood-swollen buzzer.");
		
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
	
	output("\n\n<i>“Ah... I think we’re going to need </i>another<i> shower after this,”</i> Anno remarks with a grin, rocking her hips back against you and giving you a faceful of wet ass on top of everything. You give her big cheeks a playful squeeze, holding her back before you drown in her slippery backside. Anno coos happily as the new angle brings you deeper inside her, and even more so when you let one of your hands slip from her behind to venture up between her legs and tease your fingertips across the bud of her stiff little clitty. Now <i>that</i> gets her going: a few minutes of that and her moans are reaching an ever-higher pitch. The movements of her hips become more desperate, frantic for your every touch. Her juices practically pour across your [pc.tongue] as her body prepares for a thick, knotty ausar cock that isn’t coming. You lap up every drop you can, sending waves of palpable pleasure through Anno’s quivering body until she’s practically a puddle of fuck on the shower floor that’s barely able to keep herself upright. ");

	anno.orgasm();
	
	output("\n\n<i>“Just a... just a little more, boss,”</i> Anno whines, slumping against the stall wall and cupping a breast while trying to wring out every bit of stimulation she can before she utterly succumbs to you. It isn’t long until she does: a few more moments pass before a sudden shiver takes her, starting with a vicious clamp around your tongue as her muscles contract and continuing with a hard squeeze once the first waves of orgasm pass through her. You keep licking all through it, giving the ausar a steady stream of consistent motions to ground herself on as she rides though a wet, hot climax that ends with her panting and gasping for breath, giggling all the while as you tease at her most sensitive spots. ");
	
	output("\n\nThe next few minutes are spent in quiet afterglow. The two of you help each other wash away the sweat and scent of sex. You take turns scrubbing all those hard-to-reach spots for each other, though that only ends with Anno pressed against the wall, your lips on hers as you blindly search for the shower handle. The water finally abates to leave you in a cloud of mist that clings to your bodies, keeping you nice and hot as you enjoy each other for a last few moments. ");
	
	output("\n\nFinally, though, you step out of the shower and towel down. When you’re done, Anno wraps hers around her hair and ears, leaving herself bare and on full display for you. <i>“Thanks, boss. I needed that,”</i> she says with a wink, leaning in to give you a peck on the cheek.");

	processTime(30+rand(20));
	pc.lust(10);
	pc.shower();

	annoSexed(1);

	clearMenu();
	addButton(0, "Next", showerExit);
}

public function annoFollowerSpecialGear():void
{
	annoFollowerHeader();
	
	clearMenu();

	// Merc/Smuggler + Quest Done
	if ((pc.characterClass == GLOBAL.CLASS_SMUGGLER || pc.characterClass == GLOBAL.CLASS_MERCENARY) && flags["ANNO_MISSION_OFFER"] == 3 && !anno.hasItemByClass(HoldoutHP))
	{
		addButton(0, "Her Gun", annoFollowerSpecialGearHerGun, undefined, "Her Gun", "Ask Anno about her personal gun. That didn’t seem like a stock model.")
	}
	else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) addDisabledButton(0, "Her Gun", "Her Gun", "Her gun is an old-style powder-blaster. You couldn’t imagine a less interesting firearm.");
	else addDisabledButton(0, "Her Gun", "Her Gun", "You’ve already asked her about her gun.");

	if (pc.hasItemByClass(GrayMicrobots) && !pc.hasKeyItem("Goozooka"))
	{
		addButton(1, "Gray Goo", annoFollowerSpecialGearGrayGoo, undefined, "Gray Microbots", "Ask Anno about the samples of Gray Microbots.");
	}
	else
	{
		if (!pc.hasItemByClass(GrayMicrobots)) addDisabledButton(1, "Gray Goo", "Gray Microbots", "You need to have a sample of Gray Microbots to hand.");
		if (pc.hasKeyItem("Goozooka")) addDisabledButton(1, "Gray Goo", "Gray Microbots", "You’ve already wrangled an upgraded version of the Goovolver out of Anno.");
	}

	addButton(14, "Back", annoFollowerTalkMenu, false);
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

	if (!anno.hasItemByClass(HoldoutHP))
	{
		anno.inventory.push(new HoldoutHP());
	}
	
	annoFollowerSpecialGear();
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
	
	output("\n\nShe shrugs. <i>“Oh. Well... let me think. Uh, I guess I could try and refactor a goo-launcher to shoot gray goo. Would need to build a custom AI-reset in, something to reprogram the sample into crawling up something’s cooch when you fire it. Plus I’d have to rebuild the barrel, or just kajigger it to fire right from the vial. Tell you what, boss: gimme a goo-gun - I sell them, but can’t give it to you for free, sorry - and a thousand credits for spare parts and I could probably whip something together.");

	processTime(1);

	clearMenu();

	var pGoovolver:Goovolver = new Goovolver();
	
	if (pc.hasItemByClass(Goovolver) || pc.rangedWeapon is Goovolver)
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
	
	addButton(1, "Nope", annoFollowerTalkMenu, false);
}

public function annoFollowerSpecialGearGoozooka(buyGoovolverToo:Boolean = false):void
{
	clearOutput();
	annoFollowerHeader();

	output("<i>“Alright! Now we’re in business!”</i> Anno grins as you hand over the goo-slinging revolver and the spare credits. <i>“Just gimme a few minutes to do the work, alright?”</i>");
	
	output("\n\nYou nod and wander back out to the common room. Soon, you can hear the clanking and buzzing of her at work in her quarters, though the minutes begin to drag on and on before she finally returns, carting what might once have been a goovolver. Now, though, it looks more like a grenade launcher with a hugely oversized barrel and a break-action rather than a cylinder. A flickering computer has been bolted onto the side of the gun next to the trigger, with several flashing LED screens allowing you to program your gooey projectiles. ");
	
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
		if (pc.hasItemByClass(Goovolver)) pc.destroyItemByClass(Goovolver, 1);
		else if (pc.rangedWeapon is Goovolver) pc.rangedWeapon = new Rock();
	}
	else
	{
		var pGooCost:int = pGoovolver.basePrice * anno.sellMarkup * pc.buyMarkdown;
		pc.credits -= (pGooCost + 1000);
	}
	
	pc.destroyItemByClass(GrayMicrobots);

	pc.createKeyItem("Goozooka", 0, 0, 0, 0, "This modified Goovolver was built by the ausar tech specialist Anno Dorna for you. Rather than normal galotians, this heavy cannon fires vials of gray goo at your enemies, re-programmed to go straight for an enemy’s most sensitive spots. Consumes a vial of gray goo per shot!");
	output("\n\n<b>(Key Item Gained: Goozooka -</b> This modified Goovolver was built by the ausar tech specialist Anno Dorna for you. Rather than normal galotians, this heavy cannon fires vials of gray goo at your enemies, re-programmed to go straight for an enemy’s most sensitive spots. Consumes a vial of gray goo per shot!<b>)</b>");
	
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
	output(" top, and is still trying to get out of her bottom when you <i>see</i> the blob of a googirl squirming around her hip and into her pussy. There’s a momentary pause before Anno goes cross-eyed and flops down onto the bed, helpless but to moan and wiggle her hips as the goo takes advantage of her. ");

	pc.lust(10);

	processTime(2);
	
	output("\n\nOh yeah. This is gonna be fun. ");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoFollowerFirstTimeOnMhenga():void
{
	clearOutput();
	//annoFollowerHeader();
	showName("\nANNO");
	showBust(annoBustDisplay(), syriBustDisplay());

	output("As you dock at Mhen’ga, you feel a pair of familiar, fluffy arms wrap around your neck and shoulders as a big pair of");
	if (anno.armor is AnnosCatsuit) output(" latex");
	else output(" cloth");
	output("-clad tits press into your back. <i>“Hey, isn’t this... yeah, Mhen’ga!”</i> Anno says, watching the jungle sprawl out through your viewscreen before slowly giving way to the town of Esbeth. ");
	
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
	//annoFollowerHeader();
	showName("ANNO &\nSYRI");
	showBust(annoBustDisplay(), syriBustDisplay());

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
		
		flags["MET_SYRI"] = 1;
	}
	
	output("\n\n<i>“God damn, it’s been ages,”</i> Syri says after a long swig of her beer. <i>“How’ve you been, Anno?”</i>");
	
	output("\n\n<i>“Was touch-and-go for a little bit,”</i> Anno says with a laugh, opening her drink. <i>“But thanks to [pc.name] here, I’m a </i>lot<i> better now.”</i>");
	if (haveFuckedAnno())
	{
		output(" Anno leans against you, her fluffy tail batting against your [pc.butt].");
		if (flags["FUCKED_SYRI_COUNT"] != undefined)
		{
			output(" Syri’s eyes widen noticeably as she realizes what’s going on.");
			output("\n\nShe recovers quickly, saying, ");
		}
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

	pc.imbibeAlcohol(35);
	processTime(120+rand(30));

	// Booze!
	if(pc.hasStatusEffect("Crabbst")) {
		if(pc.statusEffectv2("Crabbst") < 5) {
			pc.addStatusValue("Crabbst",2,1);
			pc.physiqueMod++;
			pc.reflexesMod--;
			pc.aimMod--;
			pc.intelligenceMod--;
			pc.willpowerMod--;
			pc.lust(5);
		}
		//else output("\n\nYou’ve gotten everything from Crabbst you’re going to get.");
	}
	else {
		pc.createStatusEffect("Crabbst",0,1,0,0,false,"Icon_DizzyDrunk","Makes you stronger but at what cost?",false,180);
		pc.physiqueMod++;
		pc.reflexesMod--;
		pc.aimMod--;
		pc.intelligenceMod--;
		pc.willpowerMod--;
		pc.lust(5);
	}

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
	
	if(annoSexed() > 0)
	{
		//annoFollowerHeader(true);
		output("\n\nAnno has a pair of full DD-cup breasts, big and bouncy and oh so soft, each tipped with a big, sensitive nipple that’s perfect to tug and squeeze.");
		output("\n\nBetween her legs, Anno has a tight little pussy. Naturally stretchier and so much wetter than a human’s, her sex is perfect for taking thick knots and great big cocks with ease. It’s topped with a trimmed landing strip of downy white fuzz. Opposite that, she has a nice, inviting little asshole between her firm cheeks, right where it belongs.");
	}
	//else annoFollowerHeader();

	addDisabledButton(5, "Appearance");
}

public function annoxKaedeFollowerMeeting():void
{
	clearOutput();
	author("Savin");
	showName("ANNO &\nKAEDE");
	showBust(annoBustDisplay(), "KAEDE");

	// {First Time}
	if (!hasMetKaede())
	{
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
	
	IncrementFlag("ANNOxKAEDE_INTRODUCED");
	
	annoxKaedeAnonsBarMenu();
}

public function annoxKaedeAnonsBarMenu():void
{
	clearMenu();
	if (pc.hasCock() && (pc.cockThatFits(370) >= 0) && (pc.cockThatFits(anno.vaginalCapacity()) >= 0)) addButton(0, "Fuck Them", annoxKaedeFuckThem, false);
	else if(pc.hasCock()) addDisabledButton(0, "Fuck Them", "Fuck Them", "Your penis is too big for that!");
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
	annoFollowerHeader(true);
	//if PC is wearing any kind of clothes/armor over the strap:
	if(pc.armor.shortName != "")
	{
		output("You flash Anno a cheeky grin and drop your ");
		output("[pc.armor], revealing your [pc.lowerUndergarment]. Your ausar lover’s eyes go wide... and double again in size when you press the little button on the side. A beam of light bursts forth from your crotch, coalescing into a dick-shaped holographic projection that bobs over your crotch.");
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
	output(". You sate your urges - for now - by giving Anno’s spankable behind what it deserves, a sharp swat that makes her squeal... and makes her pussy do wonderful things to your hardlight shaft, squeezing and squirming around the unyielding hardness projecting from your crotch. She takes the full length of your light-dick, groaning along every inch until her ass is pressed into your crotch. Her tail wiggles up to your [pc.chest], teasing at one of your [pc.nipples] until you suck in a pleasured breath and bat it away. Anno shoots you a wink over her shoulder, and her tail goes right back to teasing you, tickling your nose when she can’t get at your [pc.chest] again.");
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
	showBust(annoBustDisplay(), alissBustDisplay());
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

	output("\n\n<i>“Great!”</i> Aliss grins, <i>“Let me slip out of these, and I’ll box up a fresh pair for you, Miss Dorna.”</i>");
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
	annoFollowerHeader(true);
	var annoDick:CockClass = new CockClass();
	annoDick.cType = annoDickType;
	output("<i>“I knew it,”</i> Anno teases, flicking the power on her panties. The tiny projectors on her panties flicker to life, and a radiant yellow shaft begins to grow from her groin. The light coalesces into a ");

	if(annoDickType == 0) output("thick, footlong human cock");
	else if(annoDickType == GLOBAL.TYPE_EQUINE) output("monolithic horsecock, as thick around as her arm and near as long as her leg, turning Anno into a veritable tripod. <i>“You like ‘em big, huh?”</i> she adds, licking her lips");
	else if(annoDickType == GLOBAL.TYPE_CANINE) output("thick, pointed dog-pecker, complete with a bulbous bitch-breaker mounted on its hilt, just above Anno’s own crotch");
	else output("long, thick kitten-cock, complete with ridges of bumpy bristles, perfect for stimulating every inch of your [pc.vagOrAss]");
	output(".");

	output("\n\nAnno grins at you, stroking her big hardlight cock and leaning back onto her workbench. Eyeing you up and down, your lover spreads her legs around her glowing appendage and beckons you forward. <i>“Why don’t you go ahead and lube this bad boy up with your mouth, huh?”</i> ");

	output("\n\nShe pats her thigh invitingly, and you quickly find yourself crawling up between Anno’s legs, hands reaching towards her lightdick. A moan escapes her lips as your fingers brush her undercarriage, caressing the " + chars["ANNO"].cockHeadGetName(annoDickType) + " and cupping her shaft toward your [pc.lips]. She coos with delight as your cock-pillows wrap around the " + chars["ANNO"].cockHeadGetName(annoDickType) + " of her " + chars["ANNO"].cockNoun2(annoDick, false) + ", back arching slightly as your [pc.tongue] caresses her hardlight penis. <i>“Oh, I like this sensation... I can see ");
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
	output(" cock into your mouth as she can. Her voice twists into a scream of pleasure, and her legs shoot out, wrapping around your shoulders and holding you in an ausar death grip as she pistons her hips into your mouth. You gag and cough, choking on her hardlight dick, unable to tell her - beg her - to back off. Instead, you’re left to be used as a cockholster as Anno rides out her orally-induced orgasm. When she comes down from her heady high, your lover merely slumps back, breathing hard, letting her " + chars["ANNO"].cockNoun2(annoDick, true) + " flop out of your well-fucked mouth.");

	output("\n\n<i>“I don’t know if I’m ever going to get used to that,”</i> Anno breathes, flopping back on her desk. Her cock stands upright like a flagpole, drooling with sweat and simulated rivulets of semen. Still, her legs remain tightly locked around your shoulders, holding you close as she recovers. After a few moments, she sits back up and grins down at you. <i>“Now for the fun part. Why don’t we switch places, babe?”</i>");

	output("\n\nShe strokes her slick hardlight cock for emphasis, and you quickly agree. She slips up off the bench, and gives you a playful push onto it, getting you to grab the edge");
	if(pc.hasLegs()) output(" and spread your [pc.legOrLegs] for her");
	output(". She shifts behind you, and you give a little gasp as her fingers dig into your [pc.butt], giving you a little slap on the backside. You relax yourself as best you can in your lover’s arms, feeling the tingle of hardlight energy flopping into the crack of your [pc.butt]. Anno caresses your ass and hips, easing you into things as her strapon nears the clenched ");
	if(!pc.hasVagina()) output("ring");
	else output("lips");
	output(" of your [pc.vagOrAss].");

	output("\n\n<i>“Ready?”</i> Anno teases, the " + chars["ANNO"].cockHeadGetName(annoDickType) + " of her " + chars["ANNO"].cockNoun2(annoDick, false) + " pressing flush against your hole. You bite your lip and clutch the edge of the desk, waiting for Anno to act.");

	output("\n\nShe doesn’t keep you waiting long.");

	output("\n\nYou grit your teeth as Anno starts shifting her hips forward, slowly pressing her " + chars["ANNO"].cockNoun2(annoDick, true) + " into your [pc.vagOrAss]. Your fingers claw into the edge of the table, desperately trying to keep you steady as you feel the thick, lengthy shaft of her strapon spreading your hole wide. Her " + chars["ANNO"].cockNoun2(annoDick, false) + " sends shocks of tingling pleasure through your ");
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
	if(pc.hasCock() && !pc.hasVagina()) output("Her motions put an incredible amount of pressure on your stretched ass, sending trembling waves of pleasure through you - especially when her " + chars["ANNO"].cockNoun2(annoDick, true) + " rubs and presses against your backdoor’s most sensitive spot, making your [pc.cocks] jump in response. <i>“Oh, you like that, do you?”</i> Anno teases, reaching around to grab [pc.oneCock] and give it a tender stroke. Even her slightest touch makes you shiver in response, and your body instinctively bends to her will, your cock shuddering out a thick trickle of pre onto Anno’s fingers. She giggles as you stain her snowy fur with [pc.cumColor], and she starts to move her wrist faster, jacking you off to the same beat of her ass-fucking.\n\n");
	//if PC has a cock AND vag:
	else if(pc.hasCock() && pc.hasVagina())
	{
		output("Your [pc.vagina] writhes around her thrusting hardlight cock, muscles shocked into action by the electric pleasure radiating through your cunny - and into your [pc.cock]. <i>“Oh, you like that, do you?”</i> Anno teases, reaching around to grab your [pc.cock] and give it a tender stroke. Even her slightest touch makes you shiver in response, and your body instinctively bends to her will, your cock shuddering out a thick trickle of pre onto Anno’s fingers. She giggles as you stain her snowy fur with [pc.cumColor] and she starts to move her wrist faster, jacking you off to the same beat of her strapon fucking.\n\n");
	}
	else output(" Your [pc.vagOrAss] squirms and writhes around the hardlight shaft thrusting into it. You’re soon moaning and groaning like a whore as Anno fucks you, hard and fast. ");
	//{Combine, same pg.}
	output("You can feel Anno’s breath hot and heavy on the back of your neck as she leans over it, pounding away at you and clearly getting more than she bargained for from her over-sensitive cock. <i>“Oh, I love the feeling of your [pc.vagOrAss],”</i> Anno breathes into your ear, barely audible over your own moans");
	if(pc.hasCock()) output(", which grow louder and more desperate as Anno works your [pc.cock] from both ends, bringing you so close to orgasm that you can taste it");
	output(". <i>“I’m gonna fuck it ");
	if(!pc.hasCock()) output("until we both cum");
	else output("until you baste my hand in cum");
	output(".”</i>");

	output("\n\nShe sounds like she’s as close to the edge as you are, her voice breathy and tinged with gasps and moans as it is. You can’t help yourself but to try and pull her over with you, moving your [pc.hips] back to meet her " + chars["ANNO"].cockNoun2(annoDick, false) + " at every thrust, taking her rod deeper than ever before, feeling it stretch your [pc.vagOrAss].");
	if(pc.hasCock()) output(" Her hand on your [pc.cock] increases its pace in equal measure, milking you for thicker drops of pre. You soon feel your own need rising to irresistible levels and cum starts welling up inside you, ready to burst forth.");
	output(" With a final cry of primal exultation, Anno digs her fingers into your [pc.hips] and slams herself into you, as hard and as deep as she can");
	if(annoDickType == GLOBAL.TYPE_CANINE) output(", the knot at the end of her canid cock ramming into your [pc.vagOrAss] and tying you together");
	output(". You cum instantly, the surge of ");
	if(pc.hasVagina()) output("cunt");
	else output("ass");
	output("-stretching pleasure driving you straight over the edge. You scream your climax to the heavens, your hole writhing wildly around Anno’s tingling hardlight dick lodged deep up your [pc.vagOrAss].");
	if(pc.hasCock()) output(" [pc.CumNoun] rushes through your [pc.cocks] and, just as Anno commanded, sprays out and across her waiting fingers. She lets out a sated sigh as your orgasm slathers her digits in [pc.cum], using your fluid as lube to continue jacking you until you’ve blown every drop of your load onto her desk.");

	output("\n\nYou give a shuddered gasp, all your weight hard on the desk as you ride out your orgasm. Anno’s hips move ever so slightly, slight thrusts in and out of you as she milks herself through the sensory feedback running through her hardlight panties. She rests against you after a few long moments, her hips pressed into your [pc.butt] as she deactivates the strap. You feel a sudden emptiness as the cock inside you flashes out of existence, but that feeling is replaced by warmth and comfort as Anno’s hands slip around you, holding you close. She presses flush against your back, hands playing across your body, especially your [pc.chest], slipping between you and the table.");

	output("\n\n<i>“That was nice,”</i> she purrs, nibbling on one of your [pc.ears]. <i>“I could get used to the feeling of my " + chars["ANNO"].cockNoun2(annoDick, true) + " deep inside that ");
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
	annoFollowerHeader();
	output("<i>“Oh, hey, check this out,”</i> Anno says, waving you over to her work bench. Amid a clutter of broken-down guns, tools, and electrical equipment sits, of all things, the pair of lacy orange panties she bought from <i>Mi Amour</i>. <i>“Remember these?”</i> ");
	output("\n\nYou nod, and your lover continues. <i>“Well, I’ve been tweaking ‘em a little. I mean, a hardlight cock is cool and all, but we can do better than that, right? I totally voided the warranty on these, but check it out!”</i>");
	output("\n\nAnno picks her modified panties up and slips them on over her plain undies. After a moment of adjusting, she keys the little button hidden on her hip, and the hardlight projectors spring to life. Rather than the hefty human cock that Aliss showed off at the shop, Anno’s crotch erupts into a gargantuan equine cock, thicker around than her arm and near as long as her leg. The over-sized horsecock throbs and flops down under its own imagined weight, hanging menacingly between Anno’s legs.");
	output("\n\nSeeing the look in your eyes, Anno giggles and grabs her hardlight erection, stroking it tenderly as she speaks. <i>“I did a little modding on this bad boy. Enhanced batteries, stronger projection filters, and a whole slew of new cock shapes and sizes. And no, I totally don’t have penis envy, why do you ask?”</i>");
	output("\n\nShe flicks another, new dial under the power button, and the gargantuan horsedick flickers out of existence, replaced by a much more reasonably-sized canid cock, complete with a butt-busting bitch-breaker at the hilt. Anno grins, rubbing the knot with her thumb until she shivers with pleasure. Another turn of the dial, and her doggydick is replaced by a bristly kittycock, complete with rings of sensitive little bumps and nodules along the crown. She runs a finger along the bristles, arching her back and moaning as the tactile feedback sends waves of pleasure through her.");
	output("\n\nAnno takes a step closer, giving you a lascivious wink. <i>“What do you say, next time I give you a good fucking you help me... alpha test these new mods? I promise, it’ll be the most fun QA you’ve ever done.”</i>");
	output("\n\nHow could you say no?");
	flags["ANNO_STRAPON_MODS_ENABLED"] = 1;
	processTime(7);
	pc.lust(4);
	clearMenu();
	addButton(0,"Next",annoFollowerMenu);
}

//Anno 'Tribrator' Sex Scene
//Commissioned by Grip & Written by JimThermic

/*Current Anno Approaches
Current Anno Approaches
// Sex Menu Text (Non-Follower)
With Anno panting happily, bent over the counter with her ass in the air and tail wagging freely behind her, you figure the perky little ausar’s in for a special treat.
// Sex Menu Text (Follower)
You give a light rap on Anno’s door, and are quickly let in. “Hey, boss!” she says with a smile, ushering you in. 
Anno plops down on the side of her bed, arms spread back to support her... which has the added bonus of thrusting her chest out against the low-cut neck of her blouse. “Did you need something, babe?”
*/

// Conditionals:
// No PC Sex Requirement

public function annosTriberatorGatorMatorHater():void
{
	clearOutput();
	annoFollowerHeader(true);
	author("JimThermic");
	//First Time:
	if(flags["ANNO_TRIBERATOR_USED"] == undefined)
	{
		output("Out of the corner of your eye, you notice something large, red, and obviously phallic lying on ");
		if(annoIsCrew()) output("her side table");
		else output("the bench");
		output(". What <i>is</i> that?");

		output("\n\nYou pick it up and gawk at it. You’re holding a vibrator shaped like 12 inches of synthetic canine cock. It has a large handle - though nowhere as large as the impressive phallus - with quite a few buttons on it.");

		output("\n\nRaising an eyebrow at Anno, you playfully wave it about in your hand. <i>“Pretty big for ");
		if(pc.tallness >= 84) output("such a small girl");
		else output("an ausar girl");
		output("! Did you build it yourself?”</i>");

		output("\n\nAnno is not the least bit embarrassed - rather, she looks excited, like you’re waving her favorite ‘bone’ in front of her. <i>“Oh, that! Yeah, I made that myself. A girl can never have too many toys, right?”</i>");

		output("\n\n<i>“There’s quite a few buttons on here,”</i> you observe, running your finger along the handle, <i>“A deflate and inflate button, three speed settings, a cum button, and something marked ‘special’?”</i>");

		output("\n\n<i>“Oh yeah, it’s an all-in-one doggie dick, all right! It’s got a knot built in the base, though it’s rather smooth now. If you hit ‘cum’, it’ll knot and spray artificial cum from the tip. Pretty neat, huh?”</i> Her snowy white ears are all perked and her tail is wagging. <i>“...What the ‘Special’ button does is a secret - you’ll have to try it out if you want to know what it does!”</i>");

		output("\n\n<i>“There’s one problem with it, though,”</i> Anno pouts and her wolfy ears flatten back. <i>“...I made a mistake when I built it. It’s meant to be a solo product, but I packed in so many bells and whistles that you can’t use it on yourself. The handle’s too long, you know?”</i>");
		output("\n\n<i>“...I haven’t even tested it yet, since I can’t masturbate with it.”</i>");
		output("\n\nWell, that’s not really a problem, is it? You touch the tip of the doggy dildo and sensuously suggest <i>you</i> test it out on her.");
		if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output(" As a fellow tech-head, you’d be remiss if you didn’t help her try out her new device, right?");
	}
	else //(Repeat encounter)
	{
		output("You pick up the multi-purpose vibrator lying on Anno’s ");
		if(annoIsCrew()) output("desk");
		else output("bench");
		output(" and playfully wave it in the air. As soon as you do, Anno straightens up, pushing out her bourgeoning breasts. Her snowy ears perk up and her tail excitedly swishes back and forth.");
		output("\n\n<i>“Oh-OH! Are you going to use it-?”</i> The canine girl bites her lower lip, looking at you with big, blue eyes. It seems she <i>really</i> wants you to use the toy on her.");
		output("\n\n<i>“Are you going to be a good girl and do as I say...?”</i> you ask, leading her on. She happily nods, so you tell her you will be using it today. She’s over the moons about it.");
	}
	// MERGE
	//Anno BlouseNShit:
	if(anno.armor is AnnosBlouse)
	{
		output("\n\n");
		if(flags["ANNO_TRIBERATOR_USED"] == undefined) output("<i>“Oh really? I’d love a helping hand...”</i>");
		else output("<i>“Fantastic! Let’s get </i>these<i> out of the way then...”</i>");
		output(" she grins. Standing up, she begins to slowly unbutton her fine blouse. Her brazenly formed breasts are slowly exposed, starting with her considerable cleavage. It’s even more impressive considering she’s not even wearing a bra!");
		output("\n\nWhen the last button comes undone, her plump tits spill free of their confines and jiggle deliciously before your eyes. It’s hard to ever get sick of those dusky areolae and big, sensitive nipples. She tosses away the flimsy top and bends over to strip off her tight-fitting jeans. As the smoking hot ausar slides them down, she wildly wiggles her shapely hips, soon revealing her utter disregard for <i>any</i> kind of underwear.");
	}
	//Else (Anno Catsuit):
	else
	{
		output("\n\n");
		if(flags["ANNO_TRIBERATOR_USED"] == undefined) output("<i>“Oh really? I’d love a helping hand...”</i>");
		else output("<i>“Fantastic! Let’s get </i>this<i> out of the way then...”</i>");
		output(" she grins. Standing up, she begins to slowly unzip her snugly fitting catsuit, and you watch the mouthwatering sight. Her brazenly formed breasts are slowly exposed, starting with her considerable cleavage. It’s even more impressive considering she’s not even wearing a bra!");
		output("\n\nWhen the zip reaches her waist, her plump tits spill free of their confines and jiggle deliciously before your eyes. It’s hard to ever get sick of those dusky areolae and big, sensitive nipples. She finishes unzipping and then begins sliding off the suit. As the snowy-haired ausar bends over to slide them down, she wildly wiggles her shapely hips, soon revealing her utter disregard for <i>any</i> kind of underwear.");
	}
	output("\n\nNow she’s butt-naked, you order Anno to get on ");
	if(annoIsCrew()) output("the bed");
	else output("the ground");
	output(" and on all fours, just like a dog. She excitedly does as she’s told, ");
	if(annoIsCrew()) output("climbing onto the springy satin fabric and crawling across it on her hands and knees.");
	else output("dropping to her hands and knees and turning around.");
	output(" She cheekily pokes out her round rump at you. Her flushing pussy lips, are brazenly exposed, her snowy landing strip practically guiding the way.");

	output("\n\nWhen you approach her glistening canine snatch, Anno teasingly drapes her big bushy tail over it. <i>“...Mmm, what makes you think I’m that easy?”</i> She giggles, peering over her shoulder. You click your tongue, turning the doggie vibrator ‘on’, and press it pointedly against one of her bouncy buttocks. Her big, bushy tail twitches at first, then spasmically swishes about! <i>“S-s-stooooop, I’m ticklish there - no fair!!”</i>");

	output("\n\nWith her vulnerable little pussy exposed, you slide the whirring canine cock between her round thighs. Teasing her with the tapered tip, Anno lets out a shivering moan, trembling as you deliciously drag it along and part her glistening slit. <i>“Mmmm, I’m going to melt...”</i>");
	output("\n\nBending over and lifting her tail, Anno lewdly parts the folds of her pink, velvety pussy to you. You press the throbbing tip against her hooded clit. She groans and spasmically clenches her slippery fuschia flower. It wantonly winks at you, aching to be filled.");
	output("\n\n<i>“Do you want it?”</i> You tease her, rubbing the buzzing toy against her love button. Her snowy tail waggles madly at your teasing words.");
	output("\n\n<i>“Yes! Yes yes yes! Pleeease give it to me-!”</i> Anno moans and presses her plush ass back, carnally grinding her snatch against the phallic vibrator. Paying her back for earlier, you hotdog her with the whirring dick toy. When you press it between her fleshy buttocks, she needily clenches and milks it just like a real cock. <i>“Mmmm... lower, insiiide my pussy-!”</i>");
	output("\n\nDeciding you’ve teased her enough, you give her what she desperately wants, pressing the curved tip against her parted folds. Anno needily arches her hips and you sheathe the quivering dildo in her quim. She gasps and ");
	if(annoIsCrew()) output("clenches at the sheets");
	else output("wiggles on the store floor");
	output(" as it bottoms out inside of her. Her tiny pussy is obscenely stretched around the knotted base.");

	output("\n\n<i>“It-it feels so much bigger than it looks!”</i> she breathily exclaims. Finding her pussy is incredibly tight as well, you begin moving the ten inches of vibrating ausar cock back and forth, occasionally twisting it with no small amount of skill. Anno trembles and pants, her bushy tail lifted high in the air.");

	output("\n\nYou click the vibration up. The handle quivers in your hand and Anno bites back a moan. For a while you thrust away more, before pulling it out of her soppy snatch with a loud ‘plop’. She whines at the sudden emptiness, until you press the tapered tip against her clit, turning her protests into pleasured cries.");

	output("\n\nOnce you re-sheathe the vibrator inside of her snowy-haired snatch, you click the special button, and two little arms emerge from the handle - they’re vibrating stimulators! One shoots up to her vulnerable clit while the other presses against and slips into her starry pucker. This drives Anno wild, who ");
	if(annoIsCrew()) output("groans and bites her pillow. She clenches it hard as you");
	else output("falls forward with her butt in the air as you lustily");
	output(" tease her twitching holes and love-bud with the tribrator.");

	output("\n\nMeanwhile, watching her wiggle and needily rock her rump against the vibrator is getting you seriously worked up. Your ");
	if(pc.hasCock())
	{
		output("[pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" deliciously straining ");
		if(pc.isCrotchGarbed()) output("against your [pc.lowerGarment]");
		else output("and rock hard");
	}
	if(pc.hasCock() && pc.hasVagina())
	{
		output(", and your ");
	}
	if(pc.hasVagina())
	{
		output("[pc.pussies] ");
		if(pc.totalVaginas() > 1) output("are");
		else output("is");
		output(" damp and your [pc.clits] ");
		if(pc.totalClits() == 1) output("is");
		else output("are");
		output(" pulsing with pleasure");
	}
	//PcIsADamnNeuter: 
	if(!pc.hasVagina() && !pc.hasCock()) output("lower belly is pooling with pleasure and your bare loins needily ache");
	output(". The more horny you get, the more wild you are with the vibrator - it’s a chain reaction of pleasure that will only end in one of you getting off!");

	output("\n\nGrabbing her fluffy tail, you tug at the end. At the same time, you thrust the toy deep inside of her snatch and anus - turning the speed up to max - and Anno ecstatically cries out. Her drooling cunny and pucker clench around the whirring toy, her whole body quaking with pleasure. Her white, wolf-like ears are pressed back flat and she’s panting wildly. By her trembling thighs, she’s seconds away from creaming herself!");
	output("\n\nBeating Anno to the punch, you plunge the whirring ausar cock into her slick netherlips and click the ‘cum’ button’. Suddenly the artificial knot begins to rapidly inflate and bulge out inside of her tight tunnel. From the tapered tip, it spastically fires thick, gooey ropes of artificial ausar cum which splash wildly inside of her warm, wet insides.");

	output("\n\nAnno whimpers and moans as her mating instincts take over, bucking wildly and insistently against the knotted cock. She collapses forward, bushy tail in the air, letting her snow-capped cunt be filled with spurt after glorious spurt of dripping dick juice. Even as her eyes roll back, and she drools with delight, she instinctively presses her hips back, bucking against it like a bitch in heat. The curved canine tip rubs hotly against her cervix and fills her fertile womb with synthetic seed.");

	output("\n\nAs Anno wildly cums around the tribrator, you tug the knotted toy back, and she lets out an orgasmic yelp. Pushing it back in, she groans long and low, the stimulating arms still churning around inside of her bowels and caressing her clit. Perhaps because it’s an ausar cock, she cums for an <i>incredibly</i> long time, remaining firmly fastened to the swollen cock. When you pull it out, a river of fake cum pours out of her stretched lips, and streams down her sweaty thighs. She twitches there ");
	if(annoIsCrew()) output("on the bed, thoroughly staining her sheets.");
	else output("on the floor in an truly happy puppy puddle.");

	output("\n\nTurning the toy off, you relish in the sight of the utterly despoiled Anno, her plush breasts pressed against the ground and her bubbly butt in the air. Her snowy tail is hanging down over her sex, which you lift up softly. Leaning forward, you give her soaked snatch a little licking. You’re surprised to find out the artificial cum tastes like strawberries and cream! At the same time, the ausar girl trembles with delight, still sensitive from her incredibly long and intense orgasm. Even the slightest brush of your [pc.tongue] causes her cum-soaked thighs to quiver and quake.");

	output("\n\nSince Anno’s hardly coherent, you grab some blankets and wrap up the trembling puppy. Scooping her in your arms, you cradle her on the ");
	if(annoIsCrew()) output("bed");
	else output("couch");
	output(", and scritch behind her soft, fluffy ears. Even as she’s half-concious, the ausar girl loves a good ear scritching, and she instinctively nuzzles into your chest. Her big, bushy tail is waggling slowly. Every so often she shivers and shakes as another orgasmic aftershock racks her body, causing her to moan and sigh in half-delirious delight.");

	output("\n\n<i>“Mmmm... that was... just WOW,”</i> Anno dreamily murmurs. She’s so happy and comfortable that she falls asleep against you. With a long yawn, you wrap your arms around the bundle of cute snoozing ausar, finding her sleepiness contagious. Your eyelids get heavier and heavier, until you finally join her in slumber, both of you snuggled up on her ");
	if(annoIsCrew()) output("bed");
	else output("couch");
	output(".");
	// Add some big lusts to PC from watching Anno get tribrator fucked.
	pc.lust(33);
	processTime(44+rand(3));
	clearMenu();
	
	if (flags["ANNO_TRIBERATOR_USED"] == undefined) flags["ANNO_TRIBERATOR_USED"] = 0;
	flags["ANNO_TRIBERATOR_USED"]++;
	
	addButton(0,"Next",mainGameMenu);
}

public function annoNovaUpdate(asFollower:Boolean = true):void
{
	clearOutput();
	annoFollowerHeader();
	
	output("<i>“So, has R&D figured out anything useful from the </i>Nova<i>?”</i> you ask, casting a glance to some displays on her work bench. Several holographic images of bouncy, buxom goo-girls are on display, not all of them gray.");
	output("\n\nAnno grins. <i>“They’ve been tearing the ‘ghost deck’ up since we cleared it out");
	if(flags["TARKUS_DESTROYED"] != undefined && flags["DECK13_SHIELDS_ON"] != 1) output("... or at least what’s left of it");
	output(". We’re working on dissecting the tech on the </i>Nova<i> the crew was using to mass-produce the goo, but we’re a couple years out from actually producing our own, looks like. We’re dealing with tech several centuries out of date - nobody knows how to use it, all the ports and cables and chips are unavailable and, even if we </i>could<i> get them, they’re woefully inefficient. R&D’s basically having to start from scratch on building their prototypes. Once we get up and running, though, oh man, we’re gonna be able to churn the little bimbos out like you wouldn’t believe. Some of the egg-heads are already talking about branding them as ‘silver galotians.’”</i>");
	output("\n\nThat’s good, though you were hoping for something a little bit more immediate. Anno shrugs apologetically. <i>“Well, we’re looking into the actual goo itself, too. Trying to reverse-engineer their network A.I., figure out ways to make them do things other than suck dick. I mean, giving JoyCo a run for their money on pleasure droids alone is pretty valuable, but the thing about gray goo - the really exciting part about them - is that they’re both chassis and intelligence rolled together. They just form up to whatever configuration you need ‘em in, as long as you have enough goo. I really wanna see if we can make, say, a giant elephant goo, or turn them into mini-leithans. And that’s not even scratching the surface of their applications. Bell-Isle/Grunmann didn’t know what they were sitting on - or didn’t know how to take advantage of it, anyway. Corporate couldn’t be happier with our work.”</i>");
	
	if(flags["ANNO_NOVA_UPDATE"] == undefined)
	{
		output("\n\nShe smiles proudly, tail wagging behind her. <i>“Oh! We do have one very, very, very early working prototype... here, lemme pull it off my drive,”</i> she adds, pushing a few keys on her holoscreen. After a moment’s work, she pulls a small thumb drive out and hands it to you. <i>“Someone from our military contracts group got ahold of my notes on the goo. We got to talking, and that sort of snowballed into something we’re PRETTY SURE works, though since we’re having trouble fabricating goo back at Corporate, I can’t one-hundred percent vouch for it. Probably works, though. Maybe.”</i>");
		output("\n\nYou turn the thumb drive over in your hand, looking it over. <i>“So what’s it do?”</i>");
		output("\n\n<i>“Oh! Right. It’s a primitive combat routine. Should teach a gray goo how to do what she does best - clinging to people and giving ‘em big, squishy boob-hugs - but in battle. Specifically, it should teach the goo to envelop an opponent and molest them into submission. Next generation less-than-lethal goonology.”</i>");
		output("\n\nNeat. <i>“So, just plug it into a gray goo and I’m good to go?”</i>");
		output("\n\nAnno shrugs. <i>“Weeeell, I dunno if you’d want to just stick it in any gray goo you find");
		if (flags["TARKUS_DESTROYED"] == undefined) output(" on Tarkus");
		else output(", assuming you can even find one. Because, you know, planet go asplode and all");
		output(". It’s a modification program, not an overwrite. If the goo’s already got it into her head to go around attacking people willy-nilly, she’ll just keep doing that. Except now you have to file paperwork to get her onto planets because now she’s a class-seventy assault droid. With a dick. Made of goo. Anyway, uh... I’d suggest getting a new goo if you can.");
		if(flags["TARKUS_DESTROYED"] != undefined && flags["DECK13_SHIELDS_ON"] != 1)
		{
			output(" Since Deck 13 was wiped out in the blast when Tarkus exploded, it might be harder to find one in the wild... I mean, it’s not like you can find one walking into in a bar or anything, right?");
		}
		else
		{
			output(" Head");
			if (shipLocation != "201") output(" on back");
			else output(" outside");
			output(" to the </i>Nova<i> and shovel some goo out of the canister on Deck 13. R&D left one dispenser active there just in case.");
		}
		output("”</i>");
		output("\n\nYou pocket the drive and tell Anno you’ll look into it.");
		output("\n\n<i>“Great! Lemme know how it works out. I think I’ve got some QA forms around here somewhere...”</i>");
		
		flags["ANNO_NOVA_UPDATE"] = 1;
	}
	
	CodexManager.unlockEntry("BI/G");
	
	if (asFollower)
	{
		annoFollowerTalkMenu(false);
		addDisabledButton(11, "Nova Update");
	}
	else
	{
		annoTalkMenu();
		addDisabledButton(7, "Nova Update");
	}
	
	processTime(5+rand(3));
}

//Coded by Savin
public function annoFollowerTailcockSex(asFollower:Boolean = true):void
{
	clearOutput();
	annoFollowerHeader(true);
	author("Archangel");

	output("You look Anno up and down, a lecherous smirk spreading across your face as you decide what to do with the sexy, snowy ausar in front of you. <i>“Gonna keep undressing me with your eyes or actually do something with me?”</i> she says, giggling, her tail wagging.");

	if(pc.isBro()) output("\n\n<i>“Bend over, bitch. I’m going to fuck you senseless with this!”</i> you say, bringing your [pc.tailCock] around and tapping her jaw with it.");
	else if(pc.isBimbo()) output("\n\n<i>“Look, Anno! I got us a new toy to play with! This is going to be suuuper fun!”</i> you say, turning around and bending over so Anno can get a good look at your [pc.tailCock].");
	else if(pc.isNice()) output("\n\n<i>“You wanna try this on for size?”</i> you ask, your [pc.tailCock] making an appearance between your legs, right below your [pc.cocks].");
	else if(pc.isMischievous()) output("\n\n<i>“Oh, I was just wondering how loudly you would moan when I stuff you with this!”</i> you say, bringing your [pc.tailCock] around and wagging it in front of her.");
	else if(pc.isAss()) output("\n\n<i>“I’m going to stuff this up what ever hole I please, and you’re going to like it,”</i> you say, grinning evilly and grabbing your [pc.tailCock] below the head and holding it up to her face.");

	output(" Anno’s eyes widen when she sees the parasite attached to the base of your spine.");

	output("\n\n<i>“Uh... As much as I like trying out new things, I’m not sure I want a parasite anywhere inside me, Boss...”</i> she says, casting a worried glance at your [pc.tailCock].");

	if(pc.isBimbo()) output("\n\n<i>“Wha-? W- why not? Like I said, it’s going to be loads of fun!”</i> you bubble, your foggy mind unable to wrap around the idea that someone could pass up something so fun and sexually gratifying.");
	else if(pc.isBro()) output("\n\n<i>“I don’t recall giving you a choice, puppyslut. Now bend over!”</i> you growl.");
	else if(pc.isNice()) output("\n\n<i>“Oh come on! Just try it out! I promise, you won’t be infected with any tiny parasite babies! Cross my heart and hope to die!”</i> you say, grinning.");
	else if(pc.isMischievous()) output("\n\n<i>“Oh come on! Just try it out! I promise, you won’t be infected with any tiny parasite babies! Cross my heart and hope to die!”</i> you say, grinning.");
	else if(pc.isAss()) output("\n\n<i>“I don’t recall giving you a choice, puppyslut. Now bend over!”</i> you growl.");

	output("\n\nAnno scrunches her face up and scratches her chin for a few seconds before sighing. <i>“Alright, Boss. I’ll... give it a shot. But if I get infected with anything, your ass is going to meet my knotty ausar dildo!”</i> she says, before turning around and starting to take off her catsuit. You quietly do a victory fistpump behind her before setting your mind to the task at hand.");

	if (anno.armor is AnnosCatsuit) output("\n\nAnno pulls the zipper of the catsuit down, letting her prodigious breasts pop out. She then pulls the rest of her outfit down, wiggling her booty and giving you a front row view of her already dripping pussy and the winking star of her asshole. Stepping out of the suit, she kicks it to the side and turns to face you.");
	else output("\n\nAnno unbuttons her blouse, letting her prodigious breasts pop out. She gives her shoulders a little shake before turning and yanking her pants down. She wiggles her booty, giving you a front row view of her already dripping pussy and the winking star of her asshole. Stepping out of her pants, she kicks them aside and lets her shirt fall from her shoulders, turning back to face you.");

	output("\n\n<i>“So, what’s the plan?”</i> she asks, a coy look on her face. You smile and push her back down onto the bed, telling her to spread her legs as she does so. Anno does as you ask, and you kneel down in front of her sopping wet pussy. Her musky scent is getting you really horny now; your [pc.cock] is painfully hard. Without wasting any more time, you dig in.");

	output("\n\nAnno gasps and moans as she feels your tongue penetrate her slick folds, relishing in the feeling of your [pc.tongue] searching out her every vulnerable spot. She throws her head back and moans louder, almost cumming when your tongue brushes her G-spot. She grabs your [pc.hair] and pulls your head closer, trying to get your tongue deeper into her.");

	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your [pc.tongue] swirls deeper into her love tunnel, brushing her cervix. Anno goes crazy when you do so, moaning, bucking and thrusting her pussy into your face.");
	else output(" Unfortunately, you can only reach so far.");

	output(" You reach up with one hand and start teasing her prominent clit with your thumb, which sets off another chorus of moans. With your other hand, you grope at her buxom chest and pinch a nipple. Anno squeals loudly and cums, spraying your face with her musky fluids. You wait till she comes down off her orgasmic high before standing up and wiping your face off.");

	output("\n\n<i>“Time for the main course,”</i> you say, grinning. You take off your [pc.gear] and toss it to the side, letting your [pc.cocks] flop free on Anno’s thigh.");

	output("\n\n<i>“Oh wait. Hold on, Boss,”</i> Anno says before reaching over to her bedside table drawer, opening it, rummaging around for a few seconds and taking out a condom. <i>“Don’t wanna get pregnant yet,”</i> she chuckles. Scooching over to the edge of the bed, she rips open the condom packet and throws it into the dustbin. She places the condom in her mouth, and then lowers her head to your [pc.cocks]. You groan as you feel the dual sensations of the latex and Anno’s wet, warm mouth wrapping around your [pc.cock] . She starts fellating you, her tongue teasing the glans and tip of your cock, sending electric waves of pleasure to your brain.");

	if(pc.cockTotal() > 1) output(" She reaches down and wraps her soft-furred fingers around your second cock, jacking you off.");
	output(" You start panting, your mind hazed with lust and your heart racing, reveling in the pleasure Anno is inflicting on you. Feeling your loins start to throb, you push her off before you can cum.");

	output("\n\n<i>“Ah- ah! Not that fast, girl!”</i> you say, wagging a finger at her. Anno grins and bats your thigh with her fluffy tail. You hold your index finger up in the air and revolve it. Obediantly, Anno turns around and presents her ass to you, wiggling it slightly. Slapping her ass, you ask if she happens to have any lube lying around. She jerks up and gasps when you slap her ass, then reaches over to the same drawer, pulling it open and tossing a bottle of clear lube back to you. You make sure to apply a liberal coating of lube to your [pc.tailCock] ");

	if(pc.cockTotal() >= 1) output("and your [pc.cock] ");
	output("before squirting some right onto Anno’s dark star. She gasps and shivers, knowing what’s to come. You press a finger against her asshole, which only gives a token resistance before yielding.");

	output("\n\nYou slowly finger-fuck her tight bum, her moans increasing when you add a second finger.");

	if(pc.cockTotal() == 1) {
		output(" Spreading her cheeks wide to ease your entrance, you let your [pc.tailCock] press against her sphincter. It slides in with hardly any resistance, although there was so much lube you couldn’t really tell if Anno was squeezing down or not. Anno on the other hand, arches her back and whines when she feels your [pc.tailCock] ravaging her tight colon. You press your hips forwards, your [pc.cock] parting her wet folds and sinking to the hilt in her tight pussy. Anno moans and whines in equal measure, trying to get used to the sensation of having both her holes so utterly filled with thick, throbbing cockflesh.");
		output("\n\nYou give her a few minutes to adjust before languidly withdrawing both tailcock and penis. The synchronous jackhammer thrusts of your [pc.cock] and [pc.tailCock] has Anno cumming in less than a minute, whimpering and spraying her femcum all over your [pc.lowerBody]. You laugh and slap her ass for her bad manners, which has the added effect of making her asshole tighten around your [pc.tailCock] and her pussy clench just a little harder around your [pc.cock]. With all the earlier teasing, it’s no surprise you feel your [pc.balls] tensing up, ready to discharge your seed into a wet, waiting hole. You groan and finally let go, feeling your [pc.cumType] rush up your shafts.");

		output("\n\nYour [pc.tailCock] swells momentarily before blasting into Anno’s rectum, painting her inner walls [pc.cumColor]. Your [pc.cock] blasts [pc.cumType] into her pussy, bloating the condom out inside her.");
	}
	else {
		output(" Spreading her cheeks wide to ease your entrance, you let your [pc.cocks] penetrate her. Anno arches her back and whines when she feels your [pc.cocks] spread her asshole and pussy wide, ravaging her depths. You give her a few minutes to adjust before languidly withdrawing both cocks at the same time until just the tips are spreading her open, then roughly slamming back in. Anno lets loose a combination of a moan and howl.\n\nYour [pc.tailCock] seizes the opportunity to give Anno a bone. Fast as lightning, it fills her mouth. Anno’s eyes widen, trying to adjust to the girth filling her mouth. The tentacle doesn’t give her any rest, continuing to thrust into her mouth. In the end, she just gives up and lets her jaw hang open, the parasite plundering her throat with wild abandon. Anno moans and whines in equal measure, trying to get used to the sensation of having all her holes so utterly filled with thick, throbbing cockflesh. The triple penetration has Anno cumming again in less than a minute, whimpering and squirting her femcum all over her thighs.");

		output("\n\nYou laugh and slap her ass for her bad manners, which has the added effect of making her asshole and pussy tighten around your [pc.cocks]. With all the earlier teasing, it’s no surprise you feel your [pc.balls] tensing up in response, ready to discharge their contents into a wet, waiting hole. You groan and finally let go, feeling your [pc.cumType] rush up your shafts.");

		output("\n\nYour [pc.tailCock] swells momentarily before blasting into Anno’s throat, filling her stomach with [pc.cumType]. Your [pc.cocks] aren’t far behind, [pc.cock] blowing its load into her bowels, and [pc.cock] filling up the condom with [pc.cumType].");
	}

	output("\n\nAnno whines and scratches at the bedcovers, feeling the condom bloat inside her pussy. Carefully, she reaches back and grasps the sheath at the base of the inflation, cutting off the backwards flow of [pc.cumType]. You pull your dick");
	if(pc.cockTotal() >= 1) output("s");
	output(" out and tie a knot before pulling the inflated condom out of her pussy.");

	if (pc.cumQ() >= 3000) output(" The feeling of the overly-inflated condom stretching out her pussy sets off another orgasm, and she sprays your [pc.lowerBody] again.");

	output(" Anno simply flops to the side and passes out, too exhausted to do much else. You smile, toss the cum-blob into the trash, then get into bed and pull the covers over your passed out ausar and yourself before drifting off to sleep.");

	if (flags["ANNO_ANALSEXED"] == undefined) flags["ANNO_ANALSEXED"] = 0;
	flags["ANNO_ANALSEXED"]++;
	
	processTime(30+rand(20));
	anno.loadInAss(pc);
	anno.orgasm();
	pc.orgasm();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// Anno-Huskar Foursome
public function uvetoStationLoungeHuskarBimboActive():Boolean
{
	return (flags["UVETO_HUSKAR_FOURSOME"] != undefined && flags["UVETO_HUSKAR_FOURSOME"] == 1 && hours >= 12 && hours <= 15 && annoIsCrew() && flags["ANNO_MISSION_OFFER"] != undefined && flags["ANNO_MISSION_OFFER"] >= 3 && flags["UVETO_HUSKAR_LAST_DAY"] != undefined && flags["UVETO_HUSKAR_LAST_DAY"] < days);
}

public function annoUvetoHuskarFoursome():void
{
	showBust("ANNO", "MARINA", "GALINA");
	showName("ANNO &\nFRIENDS");
	author("Savin");
	
	rooms["UVS B7"].addFlag(GLOBAL.NPC);
	currentLocation = "UVS B7";
	generateMap();

	output("\n\nAs you step off the elevator and back into the familiar, sterile atmosphere of Uveto Station, the normal quiet bustle of the station center is broken by a chorus of bubbly, girlish laughter. You glance around, vaguely thinking that at least one of those voices sounds familiar, and find your attention drawn to the open cafe just down the way.");
	
	output("\n\nSure enough, a certain snowy-haired ausar babe is sitting at the nearest table, eagerly chatting away with a pair of husky huskar... aren’t those the two who “greeted” you before you first went moon-side? One in a Steele Tech jumpsuit just like Anno’s, if a bit more plus-sized, and the other in a sleek blue Akkadi uniform. Now that you’ve got a look at them from a distance, though, the change in clothes is about the only thing distinguishing one from the other: they’ve got the same voluptuously hourglass figure, the same long silver hair and manes of fluff around the neck... even the same mirthful blue eyes. Either those two are twins, or they’ve got some awesome tandem mod-work done.");
	
	output("\n\nWithout really thinking, you wander over and plant a hand on Anno’s shoulder and say hello. She gasps and giggles the moment you announce yourself, swatting your [pc.legOrLegs] non-stop with the bushy white tail sticking out the back of her chair. <i>“Hey, boss! We were just sitting down to eat!");
	if (pc.isTaur()) output(" Plant your pony butt over here and join us!");
	else output(" Pull up a chair!");
	output(" I’m buying.”</i>");
	
	output("\n\n<i>“Yeah, <b>boss</b>, join us!”</i> the ausar in the Steele Tech uniform teases, pushing out a chair with a leg. The one in the Akkadi suit just rests her chin in her hands and gives you an unabashedly flirtatious smile and lull of her eyelashes.");
	
	output("\n\nWell... it would be rude to turn down a free meal. You take a seat across from Anno and introduce yourself again, though if last time was any indication, these two are well aware of who you are.");
	
	output("\n\n<i>“I’m Galina!”</i> <i>“I’m Marina!”</i> they say in such perfect unison that you can’t quite tell which said which. Your confusion must be obvious, because the both cover their mouths and start giggling.");
	
	output("\n\n<i>“Don’t feel bad,”</i> Anno says, giving them both a playful poke to settle them down. <i>“They did it to me, too.”</i>");
	
	output("\n\nShe reaches up and scratches the span of hair between the Steele-uniformed ausar’s ears. <i>“This one’s Galina,”</i> your companion says, making the fluffy husky wiggle before doing the same to the Akkadi-uniformed one. <i>“And this is Marina.”</i>");
	
	output("\n\n<i>“Hi!”</i> they both smile, contentedly wiggling their ears around Anno’s hands. After a moment, Galina adds with a warm smile, <i>“Pleasure to make your acquaintance, soon-to-be C.E.O. "+ pc.mf("mister", "miss") +" Steele.”</i>");
	
	output("\n\n<i>“Oooh, that’s a nice title,”</i> the other purrs, sweeping her tail across the deck.");
	
	output("\n\nAnno rolls her eyes and turns her petting into a brief knuckle-dig on Marina’s head. <i>“Jeez, keep it in your pants, girls! [pc.HeShe]’s barely sat down.”</i>");
	
	output("\n\nThey make half-hearted fussing noises back at Anno, insisting they’re only teasing - just trying to be friendly. <i>“So,”</i> you interject, before the three puppies can start squabbling over you. <i>“How do the three of you know each other?”</i>");
	
	output("\n\n<i>“Well, Galina here is one of Steele Tech’s top geologists,”</i> Anno answers. <i>“We might be in different divisions, but all us top brains are part of a shared extranet message hub. For bouncing ideas off each other and sharing data, that sort of thing. Easy to get to know each other.”</i>");
	
	output("\n\n<i>“Plus we were totally part of the same sorority!”</i> Galina adds, pressing herself up against Anno. <i>“Go, go, Esper Thii!”</i>");
	
	output("\n\n<i>“That too. Different schools, though,”</i> Anno chuckles, putting an arm around the bubbly huskar. Her hand, you note, rests dangerously close to one of Galina’s mammoth breasts, straining so hard against the front of her jump suit that you can practically see every little pebble of flesh around her areola. Anno’s thumb idly brushes through the underside of a boob, like it’s the most natural thing in the world. The gesture either goes unnoticed, or is so normalized to the over-sexed scientists that it doesn’t bear mention save for a slight stiffening of Galina’s nipples underneath the flesh-hugging material.");
	
	output("\n\nThe other huskar, apparently feeling left out, scooches a little closer to you. <i>“Enough about us! Anno was just about to tell us all about your super heroic adventures!”</i>");
	
	output("\n\n<i>“Uh-huh!”</i> her sister adds. <i>“");
	if (completedStellarTetherGood() || nyreaDungeonFinished() || completedKQ2Good())
	{
		if (completedStellarTetherGood())
		{
			output("About how you wrecked those nasty evil pirates that wanted to blow up a whole planet!");
		}
		if (nyreaDungeonFinished())
		{
			if (completedStellarTetherGood()) output(" And how");
			else output("How");
			output(" you took on a whole palace full of amazon bug warrior people just to save your cousin!");
		}
		if (completedKQ2Good())
		{
			if (completedStellarTetherGood() || nyreaDungeonFinished()) output(" Or how");
			else output("That");
			output(" you took on a whole base of pirates all by yourself!");
		}
	}
	else
	{
		output("All about your sexy, awesome stories together.");
	}
	output("”</i>");
	
	output("\n\nThe way she’s talking, you think Anno might have been stretching the truth about your journey a bit... but if it’s got these two beauties all but slavering over you, well, is that so bad? Marina’s edged so close to you now that one of her tits is pressing against your arm, letting you feel just how immeasurably soft and squishy she is. Like her sister, Marina’s jumpsuit is stretched so tight across her thick frame that even if she wanted to, there’s no way she could hide the stiff peaks of her nipples rubbing against your shoulder, or the egregious camel toe riding between her splayed legs.");
	
	output("\n\n<i>“You must be so brave and strong,”</i> Galina murmurs huskily.");
	
	output("\n\n<i>“If only I could be a dashing space buccaneer like you,”</i> Marina giggles. <i>“I bet you’re just drowning in hotties all day long.”</i>");
	
	output("\n\n<i>“[pc.HeShe]’s pretty great,”</i> Anno agrees, giving you a playful smile. <i>“Tell you what. Why don’t I go get our food, and you two can get better acquainted with my captain here.”</i>");
	
	output("\n\nAnno gives you a wink and slips out of her chair, leaving you with a cheery huskar on either side begging for you to share some of your thrilling adventures...");

	//[Next]
	//Pass one hour

	processTime(60);
	clearMenu();
	addButton(0, "Next", annoUvetoHuskarFoursomeII);
}

public function annoUvetoHuskarFoursomeII():void
{
	clearOutput();
	showBust("ANNO", "MARINA", "GALINA");
	showName("ANNO &\nFRIENDS");
	author("Savin");
	
	output("Your meal passes in what feels like a blink of the eye, spent between three giggling, tail-wagging ausar geniuses. When they’re all together, gleefully flirting and hanging on your every word, you’d never know the three were all top mega-corporate scientists. Even Anno gets in on the fun, letting her normally playful demeanor go into overdrive alongside her jolly husky friends. You’re half sure you feel her fluffy foot brushing against your [pc.leg] more than once, coquettishly close to your loins.");
	
	output("\n\nInevitably, though, the food runs out - shortly followed by your repository of adventures to regale your busty companions with. That doesn’t seem to bother them, though... it just opens up another line of conversation:");
	
	output("\n\n<i>“So Galina found the most amazing thing down on the planet,”</i> her sister says, turning to Anno for once. <i>“A <b>super</b> rare find of savicite, she says. Once in a lifetime! She was going to take me back to her office to see it, but since you’re here...”</i>");
	
	output("\n\n<i>“You and your sexy captain should come, too,”</i> Galina giggles, sharing a conspiratory look with her sister. <i>“It’s really something! You’ve got to see it with your own eyes.”</i>");
	
	output("\n\nMarina leans over the table towards you. <i>“Pretty please?”</i>");
	
	output("\n\nSomething tells you getting into a private, confined space with three oversexed puppy-girls is only going to end one way...");

	processTime(30);
	pc.energy(30);

	clearMenu();
	addButton(0, "No Thanks", annoUvetoHuskarFoursomeNoThanks, undefined, "No Thanks", "You’ll take a pass on this one.");
	addButton(1, "Sure!", annoUvetoHuskarFoursomeSure, undefined, "Sure!", "Join the ausar trio and take a look at this rare mineral... and whatever else they have planned for you.")
}

public function annoUvetoHuskarFoursomeNoThanks():void
{
	clearOutput();
	showBust("ANNO", "MARINA", "GALINA");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("<i>“Sorry,”</i> you say, standing. <i>“Maybe next time.”</i>");
	
	output("\n\n<i>“Aww,”</i> the husky twins whine, giving you pouty lips and puppy-dog eyes. <i>“Really?”</i>");
	
	output("\n\nAnno shushes them and turns to you. <i>“Gonna miss out, boss. I think Galina’s made a real... interesting... discovery, I’m told. By professionals.”</i>");
	
	output("\n\nHer eyes being locked onto her co-worker’s tits doesn’t exactly help her argument, and so you excuse yourself. She shrugs, <i>“Okay... suit yourself. More, uh, ‘science’ for me.”</i>");
	
	output("\n\nAnno gives you a little wink and saunters off with the huskar pair, and arm around either’s waist and headed for the Steele Tech branch. You turn your attentions back to the task at hand.");

	flags["UVETO_HUSKAR_FOURSOME"] = -1;

	processTime(10);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoUvetoHuskarFoursomeSure():void
{
	clearOutput();
	showBust("ANNO_NUDE", "MARINA_NUDE", "GALINA_NUDE");
	showName("ANNO &\nFRIENDS");
	author("Savin");
	
	// 9999 - Move to Steele Tech branch?
	//currentLocation = "";
	//generateMap();
	
	output("<i>“Lead the way,”</i> you tell the pair, standing. They both grin and hop up, each taking one of your arms and angling you towards the Steele Tech branch. You feel Anno’s hand on your waist, loyally following along at the back of a trail of eagerly wagging tails and giggling husky-girls.");
	
	output("\n\nThe station’s small enough that walking from the cafe to the office block is a matter of moments, and soon your troupe is bustling into a brightly lit office bearing the name <i>“Dr. Galina Avorne, P.h.D.”</i> followed by several ausari intellectual titles. The suite is relatively cramped once the four of you are inside, crowding around a shiny metal desk dominated by a triple-screen holoprojector, a bowl of lolipops, and several sealed containers of minerals all about the size of your pinky. The walls are covered in various Steele-themed travel advertisements, mostly of pretty core-ward planets and space vistas. More than one have small holos imbedded, making stars zip around or showing a repeating galaxyrise over an alien vista.");
	
	output("\n\nSomeone’s got a little galactic wanderlust, by the looks of things!");
	
	output("\n\nYour musing is cut off when Marina snaps the office door closed behind you. A button press dims the window so dark that only vague shadows can be seen through it, hazy and indistinct. There’s no other breach of privacy in the office you can see, leaving the four of you utterly alone with each other - though that’s what you wanted, isn’t it? It’s certainly what the puppy threesome are after, if the way their bushy white tails are revving behind them like they’re driven by tiny, overcharged LightDrives.");
	
	output("\n\n<i>“Okay! Ready to see this!?”</i> Galina purrs, sashaying around her desk and planting both hands on the center drawer. <i>“It’s, like, the best thing I’ve ever found on Uveto. Hands down!”</i>");
	
	output("\n\n<i>“Stop teasing already,”</i> Anno faux-huffs, hands on her hips. <i>“Let’s see the goods, skank.”</i>");
	
	output("\n\nGalina pouts. <i>“Rude. Buuuuut, you convinced me!”</i> She gives the room a playful smirk, takes a deep breath, and whisks a wrapped bundle out of the desk. It’s almost as long as her forearm, though not quite so thick, and even at a glance and under a bulky cloth you can tell its clearly cylindrical in shape... more or less.");
	
	output("\n\nWait, is it seriously...");
	
	output("\n\n<i>“Viola!”</i> Galina beams, flicking away the cloth to reveal a solid, slightly bent pillar of gossamer green stone. It’s faintly soft-looking, almost fuzzy like shag carpet on the outer layer, but seems solid enough to hold its decidedly phallic shape. Indeed, one end of the viridian obelisk has been smoothed down to a rounded half-sphered, perfectly smooth and polished to a glassy shine the stone otherwise lacks.");
	
	output("\n\nMarina giggles. Anno just stares, her tail falling flaccid behind her.");
	
	output("\n\n<i>“I know, right?”</i> Galina says, bouncing on the spot. The motion does mesmerizing things to her juicy curves, even restrained as they are by the company jumpsuit. <i>“Isn’t it amazing?”</i>");
	
	output("\n\n<i>“It’s a giant dick, Gally,”</i> Anno says flatly, still staring. <i>“It’s a giant, ten-thousand credit dick.”</i>");
	
	output("\n\nThe mineralogist-puppy laughs, <i>“Oh, twenty thousand, easy. Maybe thirty. But! That’s nothing compared to the </i>archaeological<i> significance. If the natives have been using a psychically-conductive material in some sort of fertility rite, like the shape suggests-”</i>");
	
	output("\n\n<i>“They fucked themselves into being psionic!”</i> her sister titters, clapping her hands to her mouth.");
	
	output("\n\nGlancing between the three scientists and the turgid alien dildo Galina’s parading in front of you, you have to ask: that’s not dangerous, is it?");
	
	output("\n\n<i>“Oh, gosh no,”</i> Galina answers, flicking it in her wrist and licking the tip for emphasis. <i>“Savicite’s totally safe to handle, and it’s been flash-scrubbed by decontamination on the way up. Totally harmless... and safe to use. Especially since savicite does this,”</i> she adds with a visible shudder as she draws the crown of the carven toy across her cheek. The mere contact turns her skin dark red with rushing blood, leaving her gasping when it nears her neck.");
	
	output("\n\nAnno snickers. <i>“You weren’t kidding when you said ‘get reamed by science’ in that email, were you?”</i>");
	
	output("\n\n<i>“Well,”</i> Galina smirks, slipping out around the desk. As she does so, she keeps tracing the smooth green head across her body, rubbing it against her shoulder, then down one of the flat slopes along the top of a jiggling G-cup, right up until it’s pressing against a nipple. Her knees quake, breath catching - and one of her hands grabs at your shoulder, pulling you close. <i>“This is company property, technically... but you’re practically the C.E.O. I technically should catalogue this and send it to be broken down, but if you found a more important use for it... say, nestled between three sets of ausar tits while you take advantage of their owners one after the other...”</i>");
	
	output("\n\n<i>“Oh, what a shame that would be,”</i> her sister purrs, and suddenly you feel her identically huge rack pressing into your back. Her arms slink lower, fingers tracing tantalizingly close to your thighs. <i>“We’d be positively powerless to stop you!”</i>");
	
	output("\n\n<i>“You don’t even work for Steele Tech,”</i> Anno teases, stepping in front of you and grabbing Marina’s ass all the way around both your waists - no mean feat, and one that leaves her chest mashed firmly against your");
	if (pc.tallness <= 60) output(" face");
	else output("s.");
	output(" Anno’s heartbeat is racing, pounding through her heaving chest under her black catsuit. <i>“Not that I disagree or anything... I mean, who’re we to tell [pc.name] Steele what to do with company property?”</i>");
	
	output("\n\nGalina sits back against her desk, rubbing the crown of the viridian cock between the cleft of her breasts in one hand and starting to massage the swampy gulf between her legs with the other. She keeps eye contact firmly on you, smiling lustily as her sister and colleague grind against you from either side, practically bathing you in the smell of randy ausar-babe and the feeling of soft, feminine flesh through tissue-thin latex.");
	
	output("\n\n<i>“What do you say, </i>boss<i>,”</i> she murmurs with every bit of enticing, sultry desire she can inflect. <i>“Wanna see what a savicite dildo feels like... or how three super-horny sluts feel when you fuck us silly with it?");
	if (pc.hasCock()) output(" Not to mention that yummy-looking boner getting ready to pop all over Anno’s thighs...");
	output("”</i>");

	flags["UVETO_HUSKAR_FOURSOME"] = 1;

	annoUvetoHuskarFoursomeMenu();
}

public function annoUvetoHuskarFoursomeMenu():void
{
	clearMenu();
	addButton(0, "Mount Up", annoUvetoHuskarFoursomeMountUp, undefined, "Mount Up", "Have the scientist puppies put that giant alien donger to use on you. No doubt there’s going to be an awful lot of oral action surrounding that whole affair... especially if Anno works them from behind while the twins tend to your [pc.vagOrAss]!");
	if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(1, "PoundPuppies", annoUvetoHuskarFoursomePoundPuppies, undefined, "Pound Puppies", "They’re practically begging for it at this point. Bend the twins over one after the other, maybe even at the same time if Anno can put that huge alien prick to use alongside you. She’s totally loose enough to take that blunt end and use it like a strapon of her own.");
	else addDisabledButton(1, "PoundPuppies", "Pound Puppies", "You’d need a dick of some description to pound these puppies.");
}

public function annoUvetoHuskarFoursomeMountUp():void
{
	clearOutput();
	showBust("ANNO_NUDE", "MARINA_NUDE", "GALINA_NUDE");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("You feel Anno’s hands pulling incessantly at your [pc.gear], pulling your kit away until you’re bared to the world - or at least, to the three snowy scientists slavering for your attention. Marina, behind you, squeals with delight and grabs your [pc.butt] in both hands, squeezing you hard enough to make your");
	if (pc.hasCock()) output(" cock jump to attention, slapping against Anno’s inner thigh");
	else if (pc.hasVagina()) output(" [pc.cunt] clench - a reaction Anno’s quick to take advantage of with a probing digit");
	else output(" [pc.asshole] clench, especially when Marina’s hands spread you apart and run a thumb across your puckered ring");
	output(".");
	
	output("\n\n<i>“I think [pc.heShe] wants it,”</i> Anno coos, brushing your crotch with her latex-wrapped hand. <i>“What do you say, [pc.name]? Want the first go on that big green bastard?”</i>");
	
	output("\n\nOh, you most certainly do. You lean back in Marina’s arms and let Anno’s roaming hands gently spread you" + (pc.hasLegs() ? "r [pc.legs]" : " apart") + ". The huskar behind you guides you down into one of the chairs facing Galina’s desk, pushing you into it and leaning in so that her massive breasts all but envelop your head from behind. She wiggles her shoulders, making them jiggle against your [pc.ears] while Anno slips onto her knees and flicks her tongue across your thigh and");
	if (pc.tallness > 76) output(" up");
	else output(" down");
	output(" to your [pc.vagOrAss]. A shiver of sensation runs through you as her wet tongue teases your hole, but that’s all your lover does: tease you. You moan softly while she works her tongue around your hole, groping and squeezing with her hands to keep your senses split all across your lower body - while Marina");
	if (pc.biggestTitSize() >= 2) output(" grabs your tits and");
	output(" pinches your nipples, giving you something nice and soft to squirm against while the lustful pack of ausar work.");
	
	output("\n\n<i>“Gosh, you look hot like that,”</i> Galina titters. For the first time, you notice that while Anno and Marina have been tending to you, the leader of the group has been pulling her catsuit’s zipper down, letting the latex pool around her hips. Her G-cups are laid bare, rising evenly high on her chest. Her pink areola are stiff and pebbly, especially around where she’s been tracing the green crown of the alien toy.");
	
	output("\n\nShe gives you a wink and plants the toy in the wide valley of her cleavage, using her shoulders to press her plump rack together and hold it in place. So secured, she saunters up from her perch, moaning with every step until she’s standing over Anno with her crotch all but planted in the back of your companion’s head.");
	
	output("\n\n<i>“Hey,”</i> she purrs, reaching down and stroking Anno’s shoulders. <i>“Pull me down, sweet cheeks?”</i>");
	
	output("\n\nAnno gives an exaggerated roll of her eyes, but does as she’s asked, twisting around on her knees and slipping Galina’s suit down to her ankles. Thick thighs, juicy quim, and furred lower legs all come into focus one after the other... though Anno claims the best of the huskar goods almost as soon as she’s revealed it, locking her hands around the husky slut’s hips and driving her tongue deep into Galina’s soaking quim.");
	
	output("\n\n<i>“Oooh!”</i> Galina giggles, planting her hands both on Anno’s head, still using her shoulders to keep the thick shaft clenched in her cleavage. <i>“Easy girl!”</i>");
	
	output("\n\nYou’re fairly sure you hear Anno giggle, but its mostly drowned out into a wet, slurping noise. Galina shivers with delight, making her voluptuous form jiggle in all the right places. After a moment, though, she gives an exasperated sigh and murmurs, <i>“Not that I’m complaining, but I’ve got a date with [pc.name]’s [pc.vagOrAss], sweetie. Move!”</i>");

	pc.lust(30);
	processTime(10);
	clearMenu();
	addButton(0, "Next", annoUvetoHuskarFoursomeMountUpII);
}

public function annoUvetoHuskarFoursomeMountUpII():void
{
	clearOutput();
	showBust("ANNO_NUDE", "MARINA_NUDE", "GALINA_NUDE");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	var cIdx:int = pc.hasCock() ? pc.biggestCockIndex() : -1;

	output("Anno moves alright, but not entirely out of the way. She squeezes Galina’s hips and uses her as leverage to swing downwards onto her back, splaying out between Galina’s legs. The bigger huskar grins and takes the hint, crawling down to assume Anno’s old place, and planting her muff squarely on her face. If the accompanying gasp of pleasure is any indication, Anno resumes her rug-munching with gusto the moment she’s got a juicy pussy back in reach.");
	
	output("\n\n<i>“She’s insatiable!”</i> Marina giggles behind you, sashaying around to join her sister.");
	
	output("\n\nOn the way, she hooks a claw through her zipper and gives it a yank down, letting it bunch at her hips before bending over and presenting her plush behind almost directly into your [pc.face]. You take the hint, grabbing the blue latex of her Akkadi uniform and sliding it down. Inch after inch, you unleash an ass like none but a huskar could pack into a suit that tight; when you finally have her clothes free, her butt bounces free with a wag of her tail, spreading on its own to reveal a lush pink gash already drooling with her unabashed arousal.");
	
	output("\n\nHer tail flicks across your face, making you sputter and laugh while she grabs two handfuls of her own ass, spreading herself wide open for you. Guess you’re not not getting out of tail-hell until you give her a reason to stop! Your hands return inexorably towards the huskar’s hips, pulling her back against your face and giving her the same treatment her sister’s receiving from Anno: a deep, thorough tongue-fucking that makes her giggle and squeal, bucking her breeder’s hips back in your hands until your face is completely swallowed in husky ass.");
	
	output("\n\nNow that both huskar sisters are getting properly taken care of, Galina decides it’s time to get on with the show. Though you’re all but blinded in her sister’s jiggling posterior, you know the exact moment when Gal decides she’s ready: you feel something firm yet soft against your thigh, followed immediately by a soft, spreading heat that transitions into almost orgasmic pleasure the more pressure the wolfish girl puts on your [pc.skinFurScales]. Somehow, it feels like your [pc.leg] is about to cum, spasming with pleasure that makes your breath catch in your chest and your heart hammer with unbidden excitement. What the...?");
	
	output("\n\n<i>“Oooh, I think it works even better on you!”</i> the playful puppy-girl giggles, circling her exotic toy around your thigh... and slowly drawing its rounded crown inexorably towards your waiting hole.");
	
	output("\n\nYour fingers twitch, clenching instinctively around Marina’s broad hips as her sister teases her way towards your loins. The sister you’ve got your mouth all over moans, grinding her butt back against your face and driving your [pc.tongue] deeper and deeper into her ambrosial depths. She’s so wet and ready that you practically fall into her juicy quim, sliding every inch of tongue inside and then some, practically kissing her depths");
	if (pc.hasMuzzle()) output(" until your snout is lodged right inside her!");
	else output(" until the sheer breadth of your face is all that’s preventing you going deeper!");
	output(" Marina shudders and wiggles, gasping every time your probing muscle finds some tender place or stretches her just a little bit wider.");
	if (cIdx > -1 && pc.biggestCockLength() >= 12)
	{
		output(" Maybe you fucked up getting on bottom here: your [pc.cock "+cIdx+"] throbs with the very thought of feeling this stretchy slut taking every inch of tumescent cockmeat you can offer... and you’ve got a feeling a puss like this really could!");
	
		output("\n\nYou lap up Marina’s twat-juices, giving yourself something concrete to focus on while that nebulous haze of pleasure works up and up your thighs.");
		if (cIdx > -1 && pc.balls > 0) output(" Suddenly, that sensation erupts into a supernova of white-hot ecstasy. One errant stroke brushes the crown of the xeno-toy against your [pc.balls], just enough to feel like a lover’s playful caress, but it’s more than enough to send a rush of seed barreling through your [pc.cock "+cIdx+"] and into a geyser that spreads across Galina’s face.");
	
		output("\n\nThe huskar yelps in shock, then laughs as your accidental cum-shot rains down on her. <i>“Whoops! Haha, woah, this thing is powerful!”</i>");
	
		output("\n\nYou babble your agreement into her sister’s pussy, sinking your fingers into plush hips and quaking from head to foot. The pleasure erupting from your churning sack is just too much to bear, so overwhelming that you can do little more than lick and cum and shiver with delight. After licking her lips clean of your seed, though, the cock rock’s owner continues unabated. No respite for you!");
	
		output("\n\n");
	}
	output(" Galina giggles and runs her hand along your thigh, murmuring while rubbing the head of the dildo towards your [pc.vagOrAss], using her fluffy fingers to spread your");
	if (pc.hasVagina()) output(" lips");
	else output(" cheeks");
	output(" apart. You shiver as the toy brushes the very cleft of your quivering");
	if (pc.hasVagina()) output(" quim");
	else output(" asshole");
	output(", not quite entering you but letting you feel the crown teasing you open.");
	
	output("\n\nOh, stars, that’s good! Your whole body clenches at the faintest touch, and your muscles go haywire, spasming uncontrollably. Fuckfuckfuck!");
	
	output("\n\n<i>“Eeek! Marina, hold [pc.himHer] down!”</i> Galina laughs, recoiling when your [pc.hips] start jackhammering at her, responding to the electric shocks of ecstasy her toy’s putting out. You never imagined it would be this intense - how could a <i>rock</i> be doing this!?");
	
	output("\n\nMarina does as she’s asked, all right. She pops off your face and swings around, grabbing your " + (pc.hasLegs() ? "[pc.legs]" : "[pc.lowerBody]") + " to steady you. For your part, you gasp with the sudden rush of light and fresh air. Your face is definitely slathered in fem-cum, plastering your cheeks with warm wetness even after Marina’s busied herself between your " + (pc.hasLegs() ? "[pc.legs]" : "[pc.thighs]") + ". Like her sister, the giggly huskar brushes and teases your thighs, but puts much of her weight into pushing you back against your seat so there’s no escape from the throbbing, burning pleasure radiating from the xeno-toy.");

	processTime(20);
	clearMenu();
	addButton(0, "Next", annoUvetoHuskarFoursomeMountUpIII);
}

public function annoUvetoHuskarFoursomeMountUpIII():void
{
	clearOutput();
	showBust("ANNO_NUDE", "MARINA_NUDE", "GALINA_NUDE");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("<i>“Here we go!”</i> Galina grins, pushing ever so gently forward with the rigid savicite rod. <i>“Try not to cum, like, </i>right<i> away, okay?”</i>");
	
	output("\n\n<i>“No promises,”</i> you manage to squeak out as the first embers of ecstasy buzz through your [pc.vagOrAss]. Your muscles clench outright, spasming in wild contractions around the first inch of green cock-rock sliding inside you. Both huskar use their fingers and mouths to ease its entry, teasing you just that much more until the second inch is inside, then a third, and then you’re cumming and bucking your hips and trying not to scream to the heavens.");
	
	output("\n\nThe pleasure is mind-blowing - almost literally, wiping away every conscious thought but that of gasping climax and searing arousal. The girls giggle as your");
	if (!pc.hasVagina()) output(" ass clenches wildly");
	else output(" pussy squirts all over them");
	output(", completely unable to hide even an iota of the sensation you’re being put through. The inside of your [pc.vagOrAss] erupts in starbusts of pleasure with every little motion, every short thrust and wiggle, Galina sends through the toy. And she isn’t even really <i>fucking</i> you yet!");
	
	output("\n\nBefore they can, though, you hear Marina gasp and Galina make an awkward, breathy grunt. The Steele-affiliated sister wiggles around, eyes going wide a moment as something happens underneath her. You can’t quite see what’s going on, other than pleasured looks spreading across the sisters’ cheeks and a white-furred hand reaching up to grab one of Marina’s tits. A moment later and Anno pulls herself up from underneath wherever it was she’s been lodged - like you, her face is slathered in pussy-juice, and if the way she’s left Galina’s thighs quivering, you think it might just be a shower of fem-cum that’s dislodged her.");

	output("\n\nThe snowy ausar takes a deep, gasping breath like a woman half-drowned, and flashes you a wet smile. <i>“How ya doing, boss?”</i> she asks, grabbing a handful of huskar ass on either side of herself. <i>“Sounds like you’re having fun.”</i>");
	
	output("\n\nThat’s one way to put it!");
	
	output("\n\nShe bites a lip and gives you a playful look - and both sisters gasps when her arms move a little further down. <i>“Don’t worry, I’ll make sure these two sluts get as good as they get. You just worry about cumming your brains out for us, kay?”</i>");
	
	output("\n\nLike you’ve got much of a choice! Galina and Marina giggle and squeal, rocking forward as Anno’s hands explore their inner depths. Of course, Anno’s ministrations aren’t enough to distract them from you completely: not by a long shot. The glistening green shaft rides deeper and deeper inside you, so smooth");
	if (pc.hasVagina()) output(" and slicked up by pussy-juices");
	output(" that it glides through your clenching muscles, going so deep that you’re sure your stomach must be bulging with the sheer mass of alien cock.");

	output("\n\nAgain and again, Galina thrusts the toy into your [pc.vagOrAss], stirring it around before drawing it out almost to the tip. Your");
	if (!pc.hasVagina()) output(" anal ring throbs");
	else output(" pussylips throb");
	output(" with need even when the toy is still, but every motion leaves you reeling and moaning like the ");
	if (!pc.hasVagina()) output("anal-");
	output("whore you are.");
	
	output("\n\nYou lose track of how many times you cum, throbbing need pulsating through your body in cascading waves again and again, leaving you breathless in your seat. Their attentions leave you reeling, gasping for breath between rapid-fire");
	if (pc.hasCock()) output(" cum-shots, splattering the pair’s face with your [pc.cumNoun]");
	else output(" orgasms");
	output(". No matter how many times you blow your load, though, they’re nothing if not insistent: and your body seems infinitely capable of responding!");
	
	output("\n\n<i>“Oh my, [pc.heShe]’s loving it!”</i> Galina giggles, rocking her hips back against Anno’s sodden fingers.");
	
	output("\n\n<i>“Totally!”</i> her sister murmurs, wrapping the blunt end of the toy in her voluminous rack and jiggling it around. <i>“Soooo hot.”</i>");
	
	output("\n\nYou tremble as the sisters exchange a lustful glance, and the dildo starts driving just that much harder into you.");

	//[Next]
	processTime(15);
	pc.libido(-2);
	for (var i:int = 0; i < 20; i++) pc.orgasm();

	clearMenu();
	addButton(0, "Next", annoUvetoHuskarFoursomeMountUpIV);
}

public function annoUvetoHuskarFoursomeMountUpIV():void
{
	clearOutput();
	showBust("ANNO_NUDE", "MARINA_NUDE", "GALINA_NUDE");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("<b>Many, many orgasms later...</b>");
	
	output("\n\nWith a final gasp, you flop back into your chair, shuddering from head to");
	if (pc.hasToes()) output(" toe");
	else output(" the tip of your tail");
	output(". The huskar twins are resting heavily against you, one on either thigh, with their tongues lolled out and breasts swaying hypnotically. Anno’s still going to town on them from behind, thrusting her fingers into their sloppy boxes until they coo and moan. The dildo finally slips out of you, dropping from Galina’s exhausted hand to the deck in a puddle of cum and ausar-drool.");
	
	output("\n\n<i>“Oh, wow,”</i> Marina purrs, flicking her tongue across the gaping hole where the dildo was. Compared to that sensation, her lick is nothing but a dull pressure, barely worth noting. <i>“Look at that gape...”</i>");
	
	output("\n\nHer sister snickers, gasps, and cums around Anno’s fingers. <i>“Ooohhh! Ooh. That was... yeah. Wow.”</i>");
	
	output("\n\nAnno gives you a sly grin and withdraws her hands, putting one sopping-wet paw on each girl’s plush behind. <i>“You okay, boss? Look like you just ran a marathon!”</i>");
	
	output("\n\nYou make a sound somewhere between a groan and a whimper");
	if (pc.hasVagina()) output(", feeling [pc.femCum] drooling out of your abused honeypot");
	output(". With a great deal of effort, you manage to lift your hands up and plop them back on the sisters’ heads, giving them scratches between the ears and earning happy little moans in return. The three of you are much too exhausted from the endeavour to do much more than enjoy each others’ company - and the occasional grope and tender caress.");
	
	output("\n\nFinally, after a few minutes’ quiet recovery, you figure you need to go. Preferably before one of the huskars catches a sexual second wind.");
	
	output("\n\n<i>“Yeah, I think I could use a nap,”</i> Anno says, unsteadily rising to her feet. <i>“You girls be good and put that big meaty... artifact... somewhere we can get at it again, mkay?”</i>");
	
	output("\n\n<i>“Kay...”</i> Galina murmurs, letting her sister heft her up off your lap. <i>“Long as you come back and let us use it on you next time!”</i>");
	
	output("\n\nYou feel yourself being hefted up to your [pc.feet], pulled up by your trusty science officer. She helps you");
	if (!pc.isNude()) output(" redress");
	else output(" collect your gear");
	output(" and hooks an arm around you, helping you walk. Your [pc.legOrLegs] feel");
	if (pc.legCount <= 1) output("s");
	output(" like jelly, quaking when you try to move. The pair of you turn more than a few heads walking back out of the office, but... well, who really cares? Worth it.");

	IncrementFlag("UVETO_HUSKAR_FOURSOME_MOUNTUP");
	flags["UVETO_HUSKAR_LAST_DAY"] = days;
	
	processTime(15);
	clearMenu();
	
	addButton(0, "Next", mainGameMenu);
}

public function annoUvetoHuskarFoursomePoundPuppies():void
{
	clearOutput();
	showBust("ANNO_NUDE", "MARINA_NUDE", "GALINA_NUDE");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("As awesome as you");
	if (flags["UVETO_HUSKAR_FOURSOME_MOUNTUP"] != undefined) output(" you know");
	else output("’re sure");
	output(" that alien dildo is, you’ve got some equipment of your own you’d like to test out on your puppy-sluts. Galina makes an excited little squeal and all but rips her suit’s zipper down to the crotch, swishing her tail excitedly across her desk until she’s shoved everything not bolted down to the sides. Behind you, her sister makes a throaty little growl and nips at your shoulder, whispering, <i>“Fuck her good, [pc.name]!”</i>");
	
	output("\n\nAnno gives your [pc.cockOrStrapon] a playful tug towards the eager sister");
	if (!pc.hasCock()) output(", activating the hardlight shaft");
	output(". In the blink of an eye, your gear is scattered across the ground and a pair of huskar are grabbing at you from either side - Marina’s pressing against your back, pushing you forward while Galina grabs at you from ahead, spreading her legs around your [pc.hips] and sprawling back over her desk. Artifacts and high-tech toys go scattering helter-skelter in the husky beauty’s wake, and her ample flesh jiggles when your [pc.cockOrStrapon] slaps weightily against her thigh.");
	
	output("\n\nAnno’s fingers are still wrapped around your shaft, guiding your pulsating crown towards the juicy slit between Galina’s legs. Its owner coos excitedly, thumping her tail against the desk and using her legs to draw you in and in. Behind you, Marina’s hands grope at your [pc.butt] and [pc.chest], pinching at your nipples to give those extra little shocks of pleasure you need to get absolutely diamond hard for her sister.");
	
	output("\n\nAll three eager ausar work together to get you ready and guide you where you need to go: deep into Galina’s wet-and-ready pussy. Your");
	if (!pc.hasCock()) output(" digital crown");
	else output(" [pc.cockHead]");
	output(" brushes through the gulf of her thick lips, feeling the slick, hot flesh peel apart around your steady advance, only to hug and squeeze the shaft that follows. Galina moans, clutching at her mammoth breasts and kneading them between her fingers. The action does wonderful things to her pillowy tit-flesh, squeezing it between the gaps in her digits and making her puffy pink teats stiffen to diamond points for you. Her back arches into your waiting hands as your [pc.cockOrStrapon] glides inside her sultry slit’s embrace.");
	
	output("\n\nHer pussy squeezes tight around your thrusting prick, making you work for every inch. But three lusty ausar-girls working together are more than enough to ensure you have all the motivation you need, pushing and pulling and caressing your body until your");
	if (pc.balls > 0) output(" [pc.balls]");
	else output(" hips");
	output(" slap against Galina’s plump ass, and the chubby huskar is left panting and moaning, drooling feminine excitement down her thighs. Your hands settle on her breeder’s hips, sinking into jiggly ausar-flesh and pulling her right to the edge of the desk. You hilt deep inside her eager slit");
	if (pc.hasCock() && pc.biggestCockLength() >= 12) output(", watching with glee as her plump belly distends around the sheer volume of cockflesh being stuffed inside her");
	else output(" shivering as your entire [pc.cockOrStrapon] is consumed by the hungry slut’s pussy");
	output(".");

	output("\n\n<i>“How is [pc.heShe]?”</i> Marina titters over your shoulder, playing her hands across your [pc.chest].");
	
	output("\n\nHer sister can only answer with a husky moan, eyes closed and chest heaving.");
	
	output("\n\n<i>“Someone’s having a good time,”</i> Anno giggles, reaching down and prying the glistening green toy out of Galina’s hand. <i>“But I think [pc.name] knows what to do now. How ‘bout I get you ready, huh?”</i>");
	
	output("\n\nYou hear a slap of flesh and a high-pitched cry of pleasure in your [pc.ear], and then Marina’s off your back, sashaying over to the desk with her sister. Giving you and Anno a grin over her shoulder, the second sister stretches out ass-up over the desk itself, lifting her tail invitingly to show off the puffy puss and winking tail-hole underneath. Anno brushes a fluffy paw over your [pc.butt] before following her, wiggling down onto her hips and spreading Marina’s mountainous backside wide open. Her face all but disappears into ausar-ass a moment later, kicking up a new cascade of moans and gasps to fill the air.");
	
	output("\n\nNot one to be outdone, you sink your fingers into Galina’s jiggly flesh and start to rock your [pc.hips], sawing in and out of your lover’s sodden quim. The first inch or two is easy going, teasing the underside of her clit and the thick lips that grip your [pc.cockOrStrapon]. It’s when you try and move out more that things get rough: Galina knows how to <i>grip</i>, crushing down to make you fight for every extra inch... an exquisitely pleasurable fight that you’re happy to lose, sliding back in harder and faster than before.");
	
	output("\n\nYou lose yourself in mindless repetition, hammering Gal’s pussy like a beast in rut. It’s only a sudden shriek of pleasure that snaps your attention back. Glancing over, you see Marina’s pussy quivering and squirting around the thick green shaft Anno’s drilling into her. Your snowy lover gives you a little wink, simultaneously jackhammering the green rock into the huskar’s quim and diddling her clit with the other hand. You can see Marina’s claws scouring the top of the desk, scrabbling for purchase on the smooth surface until her sister grabs her hand, holding it tight.");
	
	output("\n\nTeasing them about how cute they are, you give Galina’s jiggly butt a smack and hilt yourself again - hard enough to make her shriek and clench so hard that stars shoot through your vision. She cums hard, arching her back and squirting a heady spray of femcum across your [pc.lowerBody]. Her orgasmic cries echo off the walls, carrying on until you’re half-tempted to switch to face-fucking her.");
	
	output("\n\nInstead, though, Anno grabs your attention with a");
	if (pc.tailCount > 0) output(" tug on your [pc.tail]");
	else output(" slap on the ass");
	output(", pointing towards the sodden gulf between the other huskar’s spread legs. She’s left the green cock-rock planted almost to the hilt in Marina’s pussy, letting the psionic stone stimulate her all on its own. Giving you a wink, Anno scoots out of the way. <i>“This one’s got another hole free, Boss. All nice and ready for you. Don’t leave her waiting.”</i>");
	
	output("\n\nWell, if Anno’s got her wet and ready, who could say no? You trade off with Anno, letting her get busy slurping up one girl’s juices while you get ready to make the other cum her brains out. Your [pc.cockOrStrapon] slaps wetly into Marina’s rump, gliding through the well-lubricated gulf between her meaty cheeks. Your " + (pc.hasCock() ? "[pc.cockHead]" : "lewd, hardlight tip") + " comes to rest naturally against the tight ring of her ass, and the hole merely winks at you, offering no resistance at your slow, steady intrusion.");

	processTime(30);
	clearMenu();
	addButton(0, "Next", annoUvetoHuskarFoursomePoundPuppiesII);
}

public function annoUvetoHuskarFoursomePoundPuppiesII():void
{
	clearOutput();
	showBust("ANNO_NUDE", "MARINA_NUDE", "GALINA_NUDE");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("Anno did a fine job getting her ready! Marina’s ass opens for you, already nice and wet from Anno’s oral attentions. Slow and steady, you sink yourself in inch by inch, loving the way she squeezes and kneads your meat. Rather than fighting, it feels like her asshole’s trying to draw you in, desperate for more. That toy in her twat must be driving her wild, the way she’s panting and gasping and shaking her hips for you already.");
	
	output("\n\nYour crotch butts up against the flat head of the toy on the in-thrust, and the moment you do, a shockwave of pleasure hits you like a truck. Before you can blink, you cum, jerking your hips forward and pumping a load of [pc.cum] into the ausar’s waiting rectum. Marina yelps when she feels your seed painting her walls [pc.cumColor], and you’re sure you’ve set off another orgasm in the cock-stuffed slut. Femcum drools down her thighs, squirting around the thick shaft, and her ass clenches around your [pc.cockOrStrapon] until you’ve got no choice but to keep still, just rocking your hips against her plush behind.");
	
	output("\n\nThe waves of shuddering pleasure radiating from the toy’s merest touch don’t let up. You almost end up doubling over on Marina’s back, squirting more cum than you’d thought possible from a single load. It takes a concentrated force of will to pull back, pulling out of her behind with a wet <i>pop!</i> You stagger back, almost falling over from a sudden crushing fatigue. Blinking, you catch yourself on something fluffy and soft, and get a yelp of pleasure in response. A look shows you that Anno’s behind you, wet and randy and flushed a dark pink. Galina’s propped up on her shoulders, a musky smear of fem-cum splattered on her cheeks - guess Anno’s been going for a ride while you were distracted.");
	
	output("\n\n<i>“Ooh, does that mean I’m next?”</i> Anno giggles, brushing your hand off her breast... and down to the sodden gash of her sex. <i>“You’re just a machine, aren’t ya [pc.name]?”</i>");

	output("\n\nYou groan,");
	if (pc.libido() >= 66) output(" already feeling the flames of arousal stirring again");
	else output(" still reeling from your orgasm");
	output(". With big puppy-dog eyes like those staring you down, there’s no way you can disappoint your lover here. Slipping a pair of fingers into her stretchy channel, you give her a little tug towards the desk and push her down - right over Marina’s back, leaving them ass-to-ass and giggling. Before you can act, though, Anno reaches up and grabs the green rod still stuffed into Mari’s twat, pops it out with aplomb, and skewers herself on it with one fluid motion. A silent cry of pleasure strains her lips open, just as the green shaft splits her pussylips and lets loose rivers of feminine excitement that patter down onto Marina’s ass.");
	
	output("\n\n<i>“Oooooh, fuck!”</i> she finally manages to squeal, clawing at the desk with her toes - and still driving the dildo deeper. <i>“Oh that’s good! Why does it-”</i>");
	
	output("\n\n<i>“I know, right?”</i> Marina whines, reaching under herself to finger her gaping quim. <i>“");
	if (silly) output("Shit’s magic, yo.");
	else output("It feels like magic!");
	output("”</i>");
	
	output("\n\nOne touch made you blow your load - imagine having that crammed inside you, rubbing against your every most-tender nerve. How Anno isn’t just cumming her brains out on the spot, you’ve got no idea.");
	
	output("\n\nThen again, the way she’s leaking and squirting, maybe she’s just locked in one constant, unending climax.");
	
	output("\n\nDeciding to give yourself a few moments to recover from your own orgasm, you slink down onto your [pc.knees] and plant your hands on Anno’s thighs, spreading her out so you can get a good look at her juicy sex. Her pretty pink lips are clinging to the smooth green shaft, twitching arhythmically. Grinning, you gingerly wrap your fingers around the broad, flat base of the toy and start to move it, drawing an inch or two out of Anno’s cunt until she’s squirming and thrusting her hips at you. Pushing it back in elicites an orgasmic cry from the snowy slut, one that carries on until you’ve fully sheathed the dildo in her clenching quim. A little bulge forms in her belly, straining around the sheer mass of cock-rock stuffed inside her.");
	
	output("\n\n<i>“Wow, that thing’s really tearing ‘em up,”</i> Galina giggles, rolling over and grabbing a handful of Anno’s boob. <i>“Mm, how about you let me take a ride with your pup, [pc.name]?”</i>");
	
	output("\n\nYou give her a questioning look, and Gal flashes you a grin. She crawls up onto the desk, straddling Anno’s crotch, and twists the dildo out enough that she’s able to rub the base between her own puffy pussy-lips. She shivers and grabs her tits in both hands, biting her lip to stifle a lustful moan. Still, her hips start moving, grinding on the rounded shaft - which has the added side effect of making it wiggle around inside Anno.");
	
	output("\n\nWatching to two ausar share the green cock-rock - all the while squishing a third cum-slathered slut underneath them - finishes what the stone’s touch started. Your [pc.cockOrStrapon] " + (pc.hasCock() ? "throbs" : "hums") + " with resumed desire, and with the girls all stacked on top of each other and sharing that dildo between them, you’re going to have to find somewhere better to slake your lusts.");
	
	output("\n\nAnd you know just where to go...");

	processTime(20);
	clearMenu();
	addButton(0, "Next", annoUvetoHuskarFoursomePoundPuppiesIII);
}

public function annoUvetoHuskarFoursomePoundPuppiesIII():void
{
	clearOutput();
	showBust("ANNO_NUDE", "MARINA_NUDE", "GALINA_NUDE");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("Running a hand along soft feminine flesh as you go, you circle around the desk and present your");
	if (pc.cocks.length > 1) output(" [pc.multiCocks]");
	else output(" [pc.cockOrStrapon]");
	output(" to Anno and Marina. The girls’ mouths are already open, panting with lust and pleasure; it takes no effort to sheath your cock right in");
	if (pc.cocks.length > 1) output(" their mouths");
	else output(" Anno’s waiting mouth");
	output(", shivering as your cockflesh is slurped up by wet ausar tongue. Anno moans around your manhood, fluttering her big blue eyes up at you. You grin and give her a scratch between the ears, which is all the encouragement she needs to really start sucking.");
	if (pc.cocks.length > 1) output(" Marina, meanwhile, has nothing to distract her from gobbling cock, and she’s taking your shaft deep down her throat without prompting.");
	
	output("\n\nYou’re treated to a view of two snowy tails swishing behind Gal’s jiggling ass as she bounces; her tail flicks across your [pc.face], ticking your nose until your grab it and give her a rough pull - none of that! She squeals, giving you a pouty look over her shoulder that lasts only until you reach up and slap her behind, pushing her forward so you can get a good look at her rump while she rides. Since you’ve still got a hand free, you might as well put it to use.... You reach forward and slip a few fingers in between the rocky toy and Galina’s quim, thrusting knuckle-deep into her well-fucked slit.");
	
	output("\n\nBetween thrusting your hips into Anno’s face and digging your digits into Gal’s sodden quim, you’re getting quite the workout - not to mention keeping the puppy-sluts nice and busy. Only Marina isn’t getting pleasured, and her sister soon remedies that, reaching down and giving her sister a little manual attention.");
	if (pc.cocks.length > 1) output(" You can tell the exact moment she starts, too: Marina’s mouth acts like a vacuum on your second cock, sucking hard and fast when her sister’s furry paws get inside her. After the first shock, though, Mari’s tongue goes to work instead, wrapping around your cockhead and flicking across your glans.");
	
	output("\n\nWith this kind of treatment, it’s only a matter of time before you feel that familiar pressure thrumming in your [pc.balls]. More than eager to give these lusty huskies a proper treat, you keep your [pc.hips] moving, thrusting in and out of the mouth");
	if (pc.cocks.length > 1) output("s");
	output(" working your " + (pc.hasCock() ? "[pc.multiCocks]" : "hardlight strapon") + ".");
	if (pc.cocks.length <= 1) output(" Seeing what’s about to happen, Marina greedily reaches up as best she can, licking at the base of your [pc.cockOrStrapon] and starting to pump it with her hands, adding on to the pleasure Anno’s already giving you.");
	output(" Not long now...");
	
	output("\n\nThere’s no point in holding back, so when you feel your edge coming, you just thrust deep into");
	if (pc.cocks.length > 1) output(" the girls’");
	else output(" Anno’s");
	output(" throat");
	if (pc.cocks.length > 1) output("s");
	output(" and let");
	if (pc.cocks.length > 1) output(" them");
	else output(" her");
	output(" take care of the rest. Squeezing wetness around every inch of " + (pc.hasCock() ? "cockflesh" : "hardlight") + " is enough to send you roaring into climax.");
	if (pc.hasCock())
	{
		output(" Your [pc.multiCocks] throb");
		if (pc.cocks.length == 1) output("s");
		output(" and cums, flooding");
		if (pc.cocks.length > 1) output(" the sluts’ throats");
		else output(" Anno’s throat");
		output(" with a torrent of pent-up [pc.cumNoun].");

		if (pc.cocks.length == 1 && pc.cumQ() >= 1000) output(" Spunk bloats her cheeks, making Anno’s eyes go wide as she tries and fails to swallow your gargantuan load. Eventually you overwhelm her completely, and [pc.cumColor] seed squirts out Anno’s nose and around your [pc.cock].");
		else
		{
			if (pc.cocks.length == 1) output(" Anno works");
			else output(" The girls work");
			output(" to swallow every drop, sucking down your cummy deposit until you’re squirting watery aftershoots and the two slut-puppies are mewling happily, cleaning the mess of each others’ lips while you stumble back, trying to catch your breath.");
		}
	}

	output("\n\nBefore you can recover, Marina’s shoved you against the wall and has your [pc.cockOrStrapon] in her hand. <i>“No way you’re done yet! We’re just getting started!”</i>");

	output("\n\nOh, boy...");

	pc.libido(-2);
	for (var i:int = 0; i < 10; i++) pc.orgasm();

	clearMenu();
	addButton(0, "Next", annoUvetoHuskarFoursomePoundPuppiesIV);
}

public function annoUvetoHuskarFoursomePoundPuppiesIV():void
{
	clearOutput();
	showBust("ANNO_NUDE", "MARINA_NUDE", "GALINA_NUDE");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("<b>Many, many orgasms later...</b>");
	
	output("\n\nWith a final gasp, you flop back into your chair, shuddering from head to");
	if (pc.hasToes()) output(" toe");
	else output(" the tip of your tail");
	output(". The huskar twins are resting heavily against you, one on either thigh, with their tongues lolled out and breasts swaying hypnotically. Anno’s still going to town on Marina from behind, thrusting the alien dildo into the twin you’re not busy filling with " + (pc.hasCock() ? "cream" : "your strap-on") + ". When she’s done, the dildo finally slides out of Mari’s abused pussy, dropping to the floor in a wash of your cum, her excitement, and an awful lot of lube.");
	
	output("\n\n<i>“Oh, wow,”</i> Galina purrs, flicking her tongue across the gaping hole where the dildo was.");
	//output(" Compared to that sensation, her lick is nothing but a dull pressure, barely worth noting.");
	output(" <i>“Look at that gape...”</i>");
	
	output("\n\nHer sister snickers, gasps, and cums around Anno’s fingers one last time. <i>“Ooohhh! Ooh. That was... yeah. Wow.”</i>");
	
	output("\n\nAnno gives you a sly grin and withdraws her hands, putting one sopping-wet paw on each girl’s plush behind. <i>“You okay, boss? Look like you just ran a marathon!”</i>");
	
	output("\n\nYou make a sound somewhere between a groan and a whimper, drooling the last vestiges of your seed into Galina’s pussy.");
	
	output("\n\nWith a great deal of effort, you manage to lift your hands up and plop them back on the sisters’ heads, giving them scratches between the ears and earning happy little moans in return. The three of you are much too exhausted from the endeavour to do much more than enjoy each others’ company - and the occasional grope and tender caress.");
	
	output("\n\nFinally, after a few minutes’ quiet recovery, you figure you need to go. Preferably before one of the huskars catches a sexual second wind. You don’t have " + (pc.hasCock() ? "a single drop of cum left for them to suck" : "enough energy for them to ride") + " out at this point!");
	
	output("\n\n<i>“Yeah, I think I could use a nap,”</i> Anno says, unsteadily rising to her feet. <i>“You girls be good and put that big meaty... artifact... somewhere we can get at it again, mkay?”</i>");
	
	output("\n\n<i>“Kay...”</i> Galina murmurs, letting her sister heft her up off your lap. <i>“Long as you come back and let us use it on you next time!”</i>");
	
	output("\n\nYou feel yourself being hefted up to your [pc.feet], pulled up by your trusty science officer. She helps you");
	if (!pc.isNude()) output(" redress");
	else output(" collect your gear");
	output(" and hooks an arm around you, helping you walk. Your [pc.legOrLegs] feel");
	if (pc.legCount == 1) output("s");
	output(" like jelly, quaking when you try to move. The pair of you turn more than a few heads walking back out of the office, but... well, who really cares? Worth it.");

	IncrementFlag("UVETO_HUSKAR_FOURSOME_POUNDPUPPIES");
	flags["UVETO_HUSKAR_LAST_DAY"] = days;

	processTime(15);
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoUvetoHuskarFoursomeRepeat():void
{
	if (pc.lust() < pc.lustMax() * 0.33)
	{
		// Set lust to either 1/3rd or min, whichever is highest.
		pc.lust((pc.lustMin() > pc.lustMax() * 0.33 ? pc.lustMin() : pc.lustMax() * 0.33), true);
	}

	clearOutput();
	showBust("ANNO", "MARINA", "GALINA");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("<i>“Heyya, [pc.name]!”</i> the twins beam in their uncanny unison, watching you saunter up with wagging tails.");
	
	output("\n\n<i>“How’re you doing?”</i>");
	if (rand(2) == 0) output(" Galina");
	else output(" Marina");
	output(" asks, offering you a seat between the pair. When you take it, you’ve instantly got a pair of husky babes pressing in on either side, shamelessly letting their meaty chests squish against your shoulders and their flicking tails brush your [pc.legOrLegs].");
	
	output("\n\nThe other sister darts in and plants a peck on your cheek while you’re distracted with the first. When you twist to face <i>her</i>, the first repeats the affectionate sneak attack. They both giggle and hug you playfully. Clearly subtlety isn’t in their job descriptions!");
	
	output("\n\n<i>“So!”</i>");
	if (rand(2) == 0) output(" Galina");
	else output(" Marina");
	output(" murmurs once they’ve settled down, rubbing happily against you. <i>“We’re on break, if you and our favorite warp-field theorist have some free time...”</i>");
	
	output("\n\nWith a smile, Galina adds, <i>“I’ve still got that lovely little savicite crystal somewhere in the office. Just say the word...”</i>");

	processTime(5+rand(5));

	clearMenu();
	addButton(0, "Foursome", annoUvetoHuskarRepeatSure, undefined, "Foursome", "Well, if they insist...");
	addButton(1, "Laters", annoUvetoHuskarRepeatLater);
}

public function annoUvetoHuskarRepeatLater():void
{
	clearOutput();
	showBust("ANNO", "MARINA", "GALINA");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	pc.lust(pc.lustMax() * 0.33);

	output("<i>“Aww,”</i>");
	if (rand(2) == 0) output(" Galina");
	else output(" Marina");
	output(" pouts, shifting in her seat so that she’s practically crawling into your lap. <i>“You sure, [pc.name]? We haven’t stopped talking about that little adventure since the first time...”</i>");
	
	output("\n\nHer sister just sighs and gives her a little pull backwards. <i>“Don’t pressure [pc.himHer]. You and I can find something to occupy ourselves if [pc.heShe] doesn’t wanna play... though the offer stands, lover!”</i>");
	
	output("\n\nYou grin and step back, leaving the amorous ausar pair to work their sudden lust spike out themselves.");

	processTime(3+rand(3));

	flags["UVETO_HUSKAR_LAST_DAY"] = days;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function annoUvetoHuskarRepeatSure():void
{
	clearOutput();
	showBust("ANNO", "MARINA", "GALINA");
	showName("ANNO &\nFRIENDS");
	author("Savin");

	output("One quick email and a few moments’ wait later, and you spot Anno making a brisk pace down from the docking arm. She’s all smiles and fresh perfume, exchanging a tight hug with the one sister, you, then the other amid jubilant greetings and wiggling, lifting tail that invites a quick butt-grope from");
	if (rand(2) == 0) output(" Galina");
	else output(" Marina");
	output(" before she can sit down.");
	
	output("\n\n<i>“Hey, lovers. My boutique of babes. Confederation of cuties!”</i> she grins, planting her chin in her hands and giving you a cheery smile. <i>“I heard there was booty!”</i>");
	
	output("\n\n<i>“That’s why we summoned our favorite interplanetary booty-call!”</i>");
	if (rand(2) == 0) output(" Galina");
	else output(" Marina");
	output(" giggles.");
	
	output("\n\nHer sister makes a wiggling hand gesture and adds, <i>“I cast </i>Summon Slut-Puppy<i> at level six!”</i>");
	
	output("\n\n<i>“Ohmygod, you nerd,”</i> Anno groans, burying her face. <i>“Also hey, I am at least a level eight summon.”</i>");
	
	output("\n\nBefore the three of them can descend into a <i>Perils in Perdition</i> rules debate, you gently suggest that the twins balance their tab and show you and Anno off somewhere more private. The offer’s tempting enough to get even Anno to drop her complaints with a lusty sigh and a playful grope at a jiggling G-cup when one of the sisters passes by her. While the twins are up at the counter settling up, she gives you a playful wink and a whispered thanks for the invitation.");
	
	output("\n\nJust wouldn’t have been the same without her, you say, giving the perky pup a quick kiss before the lascivious twins saunter back, all wiggling tails and flirty smiles, and suggest you follow them back to Galina’s office. You and Anno fall in line, eagerly following the scientist babes across the station promenade and through the Steele Tech offices to the privacy of Galina’s digi-curtained office. One of the sisters locks the door and darkens the window, leaving the four of you clustered around the desk, letting the lights slowly darken to a sultry glow.");
	
	output("\n\nYou feel arms sliding around your [pc.hips], playing along your thighs and groin. Their owner presses against your back, squishing huge breasts and jiggling ausar-flesh between you. Anno grins and leans in, leaving you pinned between two randy babes who can’t keep their hands off you, tugging at your gear");
	if (pc.hasCock()) output(" and your [pc.cock]");
	output(" while they lavish you with kisses and gropes. While they keep you distracted, Galina slips around her desk and recovers the alien-wrought pleasure-shaft from the lubed-up cloth wrap she’s been keeping it in.");
	
	output("\n\nShe gives it a lusty kiss right on the crown the moment she has it out, moaning softly as the soft savicite rubs against her full lips. Her company bodysuit is so tight around her thick figure that the stiffening of her nipples takes in a little bit of fabric -- on top of that, a twitch in her quim gives her a sudden, wet camel toe. Good to see the dildo still has its arousing psionic effect... and that just handling it is almost enough to reduce the ausar scientist to a panting wanton who can’t help but start touching herself, running her fingers through the cleft of her cunt and groping at her breasts.");
	
	output("\n\nWith a little shudder of pleasure, Galina sits back against her desk and rubs away, watching her sister and their slighter friend go to town on you. She keeps eye contact firmly on you, smiling lustily as her sister and colleague grind against you from either side, practically bathing you in the smell of randy ausar-babe and the feeling of soft, feminine flesh through tissue-thin latex.");
	
	output("\n\n<i>“What do you say, </i>boss<i>,”</i> she murmurs with every bit of enticing, sultry desire she can inflect. <i>“Wanna see how three super-horny sluts feel when you fuck us silly with it?");
	if (pc.hasCock()) output(" Not to mention that yummy-looking boner getting ready to pop all over Anno’s thighs...");
	output("”</i>");

	processTime(15+rand(5));

	annoUvetoHuskarFoursomeMenu();
}

//Random Bar Scenes
//Very small chance to add [Anno] to any bar the player visits while Anno is an active crewman. Overridden by her Tavros Kaede threeway scene if need be. Clicking the button generates a random scene.

//Room Descript Add.
public function annoRandoBarBonus(button:int = 0):void
{
	output("\n\nYou spy Anno sprawled out against the bar, sipping on a bubbly, colorful drink. She’s rocking a sexy little blouse and miniskirt outfit, showing plenty of her ample cleavage and letting her snowy tail thump freely against her seat. She seems to be enjoying herself.");
	addButton(button,"Anno",annoBarEncounterRouter,undefined,"Anno","Anno is here. You could see what she’s up to.");
}

public function annoBarEncounterRouter():void
{
	var funcList:Array = [];
	
	funcList.push(annoShootsAGuyDownnnn);
	funcList.push(annoGonnaGitIt);
	funcList.push(annoGonnaGitDragonBOOOTAYYYYY);
	if(syriAtBurts() && currentLocation != "BURT'S MAIN HALL") funcList.push(annoPupAtWork);
	
	if(funcList.length > 0) funcList[rand(funcList.length)]();
	
	return;
}
//Anno Shoots a Guy Down
public function annoShootsAGuyDownnnn():void
{
	clearOutput();
	showAnno();
	author("Savin");
	output("Deciding to check in on your science pup, you make your way over to where Anno’s sitting... just a moment too late, as a tall ausar man saunters up to her. He’s packing way more cologne than any reasonable fellow ought to, radiating off a designer-torn leather jacket and greased-back black hair that screams <i>“pretty rich boy.”</i> He leans confidently against the bar next to Anno and wiggles his towering jackal-ears, flashing her a big, toothy smile.");
	output("\n\nBy the time you get over to them, Anno’s lips are twisted in an unbecoming grimace. The ausar stud keeps on with his wanna-be charming grin, talking just softly enough that you can’t make out exactly what he’s saying. Not that he’s being subtle about his intentions, if his gaze being locked raptly to Anno’s chest with a firm package tenting his jeans is any indication. By the time you get close enough to hear him saying something about how he and Anno would <i>“make some fuckin’ hot pups, y’know babe?”</i> you can see Anno’s had exactly enough of the oh-so-suave playboy.");
	output("\n\nWith a disgusted grunt, Anno tosses her bubbly drink into the ausar boy’s face. He yelps, tucks his tail, and staggers back. <i>“What the fuck, bitch!?”</i>");
	output("\n\n<i>“Grow up, pup,”</i> Anno scowls, setting her glass aside and planting her hands on her hips. <i>“What are you, sixteen?”</i>");
	output("\n\n<i>“");
	if(pc.isAss()) output("Leave her alone, punk,");
	else if(pc.isBro()) output("Mine. Fuck off,");
	else if(pc.isBimbo()) output("Like, wow, rude,");
	else output("Back off,");
	output("”</i> you say, finally within range to give the spurred doggie-boy a firm push away from Anno. He gives you both a scowl, but thinks better of making a scene and stomps off towards the men’s room. A few other customers giggle and jeer as he goes.");

	output("\n\nAnno sighs and swipes her credit chit over a scanner at the bar. <i>“Ugh. Well, it </i>was<i> a nice ");
	if(hours >= 5 && hours <= 19) output("day");
	else output("evening");
	output(". Think I’m gonna head back to the ship, Boss. Thanks for the backup, though.”</i>");

	output("\n\nShe plants a kiss on your cheek and sashays out. This time, the other patrons give a few catcalls - and get a happy wiggle out of Anno’s tail for their trouble.");
	pc.createStatusEffect("Anno Bar Busy",0,0,0,0,true,"","",false,65);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anno Goan Git It
public function annoGonnaGitIt():void
{
	clearOutput();
	showAnno();
	author("Savin");
	output("Seeing Anno out and about catches your attention, and you decide to head on over. Before you’ve taken three steps, though, a huge, burly green thraggen man arrives at Anno’s side with a drink and a tusky grin.");
	output("\n\nShe giggles and wiggles her ears at him, nuzzling up into the towering brute’s chest. He laughs at something she murmurs to him and plants a hand around her shoulder, pulling her tight against him - and grabbing a handful of boob when he thinks nobody else is looking. Anno’s clearly happy with the attentions, wagging her tail a hundred miles an hour. Looks like someone’s having fun without you!");
	output("\n\nBy the time you’ve made it over, both of them have knocked back their drinks and are making with the bedroom eyes. Anno leans up on her tippy-toes and whispers something in the thraggen’s ear, and the next thing you know she’s squealing and kicking her legs, getting tossed onto his shoulder like an oversexed bag of potatoes. The big bruiser locks a hand on her butt to keep her steady and starts marching for the door with his prize.");
	output("\n\n<i>“Hi-bye, boss!”</i> Anno cheers over the guy’s back as they pass you, waving energetically. <i>“Don’t wait up!”</i>");
	output("\n\nHer booty call gives a thumb’s up back in your general direction and carries Anno off to parts unknown, and activities obvious.");
	output("\n\nBye...?");
	processTime(2);
	pc.createStatusEffect("Anno Bar Busy",0,0,0,0,true,"","",false,135);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anno Loves Her dat Dragon Booty
public function annoGonnaGitDragonBOOOTAYYYYY():void //Hi geddy
{
	clearOutput();
	showBust(annoBustDisplay(), "GRYVAIN");
	showName("ANNO &\nGRYVAIN");
	author("Savin");
	output("You figure you might as well check in with Anno while you’re both here, and start heading over. You get to her at the same time as another woman does - a tall, sensuously curvy gryvain with dark green scales and wings, and horns growing from her brow decorated with jeweled silver chains.");
	output("\n\n<i>“Oh, hey boss,”</i> Anno grins as you wander up. <i>“What’s up?”</i>");
	output("\n\nYou shrug, saying you’d just come over to chat. You didn’t realize she was here with someone.");
	output("\n\n<i>“Ah, yeah,”</i> she laughs, passing a drink along the bar to the gryvain woman, who takes it with an appreciative nod. <i>“Just so happened to find myself a date out here!”</i>");
	output("\n\n<i>“This is your boss, Anno?”</i> her dragon-like companion asks, raising a flame-colored eyebrow at you. <i>“I’d have thought a big corporate C.E.O. would be... older. Definitely not a cutie.”</i>");
	output("\n\nYou suddenly find your eyes drawn to the pair of grav-ball sized breasts straining the woman’s strapless, cleavage-heavy dress... and the slight bulge of a hermaphroditic masculinity just barely puffing out against one of her long, scaly legs.");
	output("\n\nAnno giggles into her drink. <i>“Yeah, [pc.heShe]’s pretty great.”</i>");
	output("\n\n");
	//if PC hasn’t done any Anno threeway: 
	if(!annoThreeWayed())
	{
		output("After a moment, Anno gives you a questioning look, as if to say <i>“it’s time to go.”</i> You figure you’ve interfered in her date enough if that’s the case and excuse yourself.");
		pc.createStatusEffect("Anno Bar Busy",0,0,0,0,true,"","",false,135);
	}
	else
	{
		output("Lowering her eyes playfully, Anno adds, <i>“And [pc.heShe]’s usually up for a fun time. Aren’t you, babe?”</i>");
		output("\n\n<i>“Babe?”</i> the gryvain echoes. <i>“O-ho, I see...”</i>");
		output("\n\nAnno gives her a grin. <i>“My profile said-”</i>");
		output("\n\n<i>“I know!”</i> the other woman chuckles, leaning back against the bar. <i>“Didn’t say I had a problem. Quite the opposite, actually.”</i>");
		processTime(4);
		pc.lust(10);
		//[Excuse Yourself] [Play Along]
		clearMenu();
		addButton(0,"Nah",annoCanDoShitSolo,undefined,"ExcuseYourself","Anno’s gonna have to play this one solo.");
		addButton(1,"Play Along",playAlongWithAnnoThreesome,undefined,"Play Along","Anno’s none too subtle about wanting you to get in on this action. If you don’t mind risking some dragon-girl cock in you by night’s end, you could play along and see where things go...");
		return;
	}
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Excuse Yourself]
//Anno’s gonna have to play this one solo.
public function annoCanDoShitSolo():void
{
	clearOutput();
	showBust(annoBustDisplay(), "GRYVAIN");
	author("Savin");
	output("You smile and nod, but mention that you’ve actually got places to be.");
	output("\n\n<i>“Aw,”</i> Anno sighs, sipping on her drink. <i>“Well, see you around, boss. As for you...”</i> she adds, turning and slipping a hand around the gryvain’s shoulder. <i>“Where were we...”</i>");
	processTime(1);
	pc.createStatusEffect("Anno Bar Busy",0,0,0,0,true,"","",false,135);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Play Along]
//Anno’s none too subtle about wanting you to get in on this action. If you don’t mind risking some dragon-girl cock in you by night’s end, you could play along and see where things go...
//Add minimum level intoxication to PC.
public function playAlongWithAnnoThreesome():void
{
	clearOutput();
	showBust(annoBustDisplay(), "GRYVAIN");
	author("Savin");
	output("<i>“Yeah,”</i> you answer after a moment’s consideration, eyeing the two buxom beast-babes with growing lust. You signal to the bartender to get you a drink, all the while saying that you’re generally available for some fun.");
	output("\n\nThe gryvain girl smiles and turns to you in a way that makes her ample curves stand out under her slinky black dress. <i>“Excellent. I’ve always wanted to chat with a brilliant scientist and a famous adventurer-magnate.”</i>");
	output("\n\nYour drink comes quickly, and you’re soon swept up into the two girls’ flirtatious chatting. Of course, Anno’s made it pretty darn clear that none of you are really here for small talk. Getting a little tipsy and comfortable with each other is just step one on the short road between extranet dating and finding yourself in bed between a pair of smoking hot babes. Which, between your winning charm and Anno’s playful sluttiness, isn’t a hard sell at all. An hour and several emptied drinks later, and you’ve found that Anno’s getting properly gropey and giggly, and her date’s hand hasn’t left your [pc.butt] for the longest time... and that bulge she’s sporting is only getting bigger.");
	output("\n\nFinishing off a final drink, you slip an arm around each of their waists and suggest you make your way back to your ship for a little more intimate entertainment. The stiff nipples and rock-hard dragon-cock that soon present themselves through sheer fabric is all the answer you need, and you’re quickly making your way back to the dock as quick as your inebriated [pc.feet] can take you.");
	pc.imbibeAlcohol(30);
	processTime(5);
	pc.lust(40+rand(10));
	clearMenu();
	addButton(0,"Next",dragonGurlAnnoThreesome);
}

public function dragonGurlAnnoThreesome():void
{
	//MOVE TO SHIP
	currentLocation = "SHIP INTERIOR";
	generateMap();
	clearOutput();
	showBust(annoBustDisplay(true), "GRYVAIN_NUDE");
	author("Savin");
	output("A few minutes later and you’re ");
	if(!pc.isNude() && !pc.isCrotchExposed()) output("spilling out of your [pc.clothes] and onto the bed");
	else output("tumbling into bed");
	output(", groping at Anno’s breasts and feeling a pair of clawed hands sinking into your [pc.butt]. The gryvain girl growls low in her throat, and soon you’re gasping and moaning as her slender tongue ");
	if(pc.hasCock()) output("wraps around your [pc.cock]");
	else output("thrusts deep into your [pc.vagOrAss]");
	output(".");

	output("\n\n<i>“Ooh, she’s hungry for it!”</i> Anno giggles, even as she’s presenting her own bare pussy to you. You dig in with the same gusto as her date, spearing her on your [pc.tongue] and lapping up all the sweet ausar juices that are soon smearing her pretty pink lips and tender thighs. She arches her back and moans like, well, an ausar bitch in heat as you slurp up her puss, pushing your head deeper into her cooch until you’re practically swimming in her excitement.");
	var x:int = pc.cockThatFits(anno.vaginalCapacity(0));
	if(pc.hasCock() && x >= 0)
	{
		if(x < 0) x = pc.smallestCockIndex();
		output("\n\nWhen you’re satisfied with your preparations, you surge up and grab Anno by the waist, hoisting her up onto your [pc.cock " + x + "]. She squeals happily as you ram yourself hilt-deep in her quim, leaving her on her knees and straddling you reverse-cowgirl. It doesn’t exactly take much prompting for the gryvain to crawl up, push Anno onto your [pc.chest], and thrust into her pussy right along with you. Anno’s eyes go wide as she’s stretched to the limit, filled to the brim with [pc.cock " + x + "] and viridian dragon-cock.");
		pc.cockChange();
		output("\n\nBetween Anno’s rapidly-contracting cunt and the alien cock grinding against your own, you’re quickly lost in a sea of pleasure. You happily grope Anno’s succulent chest, exchanging kisses and nips along her neck, thrusting your hips in staccato rhythm with the draconic dick-girl. Before you can completely lose yourself, though, the gryvain babe grabs your ");
		if(pc.cockTotal() > 1) output("second cock, pumping it to tumescence");
		else output("[pc.cock " + x + "], tugging it out of Anno’s slit and hoisting it straight up");
		output(". Flashing you a grin, she shifts her hips up and mounts you, still buried knot-deep in Anno. Suddenly, you’re immersed in a squeezing vice of a thousand tiny, hot nubs all gliding wetly around your prick, massaging you like the most exquisite onahole from crown to [pc.knot " + x + "].");
	}
	else
	{
		output("\n\nA minute later and you’re back-to-back with Anno, grinding your asses together around a throbbing shaft of drake-cock. The gryvain girl bucks her hips against you, sprawled out on her wings and groping at her breasts. She can’t take it for long; with a feral roar, she grabs you and Anno and shoves you both ass-up into the bed, and you feel a rock-hard cock slamming into your spit-lubed hole. She takes turns switching between you and your lover, grinding your groins together so she can easily switch from packing Anno’s pussy to stretching your [pc.vagOrAss] around her bulbous member.");
		if(pc.hasVagina()) pc.cuntChange(0,100);
		else pc.buttChange(100);
	}
	output("\n\nYour orgasm is as inevitable as it is intense, caught between bucking dragon-girl and the slutty, panting ausar clinging to you as she rides out her own climax - the latest of several, if the blissed-out look on Anno’s face is any indication. That, and the musky swamp of fem-cum spreading between her thighs, mixing with the gryvain-girl’s seed when she pulls out and blasts a creamy load across Anno’s up-turned asscheeks.");
	if(pc.hasCock())
	{
		output(" You join her a moment later, pumping a thick wad of your own seed into the dragoness’s pussy");
		if(pc.cumQ() > 25) output(" and a second straight upwards, " + (x >= 0 ? "popping out and letting your ausar-milked" : "letting your") + " load splatter across the gryvain’s hefty rack, and rain back down over Anno’s back");
		output(".");
	}
	output("\n\nWith a contented sigh, Anno flops down bonelessly on top of you, tracing kisses along your [pc.chest] until the gryvain girl snuggles up against you, drooling cum and breathing hard. You scoop her up in an arm and pull her close, enjoying the feeling of two busty, sultry ladies cuddling up. The smells of sex and sweat hang heavy in the air as you let exhaustion and contentment take you, drifting off to sleep in their arms...");

	processTime(20);
	pc.orgasm();
	applyCumSoaked(pc);
	clearMenu();
	addButton(0,"Next",annoXGedanThreesomeEpilogue);
}

public function annoXGedanThreesomeEpilogue():void
{
	clearOutput();
	author("Savin");
	showAnno();
	//Pass 6-10 hours. Move PC back to ship.
	showLocationName();
	output("When you come to, the green gryvain babe is nowhere to be seen. Anno’s lying face-down against you, covered in cool cum and snoring into your armpit. Graceful. You yawn, roll your lover off, and hit the shower.");
	output("\n\nBy the time you’re out, Anno’s woken up enough to stagger up and ");
	if(celiseIsCrew()) output("drag Celise into your quarters. She’s dumped the giggly goo onto the bed and is sat on the side of it, letting your resident cum-vacuum clean the spoogy mess up.");
	else output("strip the spunk-soaked bed for cleaning.");
	output("\n\n<i>“What do you say, Boss?”</i> she grins when you get out, looking back to eye your naked body. <i>“Think I should give her a ‘would date again’ on ExtraMeet?”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("Like, t");
	else output("T");
	output("otally.");
	processTime(600+rand(400));
	sleepHeal();
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Puppers At Work
public function annoPupAtWork():void
{
	clearOutput();
	showAnno();
	author("Savin");
	output("You head on over to Anno, hoping to catch a few peaceful minutes with your companion. She smiles as you take a seat beside her, but points to a small holoband clipped to one of her perky ears and then puts a finger on your lips: be quiet, got it. Anno gives you a little wink and turns back to the Codex propped up on the bar, surrounded by empty peanut packets and a drink glass so soaked in ice-sweat that it’s practically swimming.");
	output("\n\n<i>“Yeah, no, I’ve run this through the computer ten times already. The math doesn’t add up!”</i> she says into the Codex, tapping at the screen. <i>“Every time I run the simulation, the device explodes. Badly.... no, I know it’s not a <b>perfect</b> simulation, but... No! Nobody’s going to fund... Ugh! Fine, one more time. Here, let me share my screen with you; you check the math.”</i>");

	output("\n\nAnno sighs and types something out. When she’s done, she jabs a big green <i>“SIMULATE”</i> button on her screen and turns to you with an exaggerated eye-roll. She makes a circling gesture around one of her ears, sighs again, and takes a long swig of her drink. You watch as a progress bar fills up on her screen, eventually replacing itself with a big green check-mark and a digital chirp, <i>“Simulation complete! Project success ratio: ninety-seven percent.”</i>");
	output("\n\nAnno blinks. <i>“W-what. Why... but... what do you mean I carried a number wrong? I haven’t done math by hand in years! It was the computer doing it! I’ve been using this program for years and I’ve never had problems. I - okay, miss ego, yeah yeah, I’d have never done it without you. You’re amazing and I love you and I’ll give you a special credit when I publish this. Happy? Uh-huh. Seriously though, you’re the best. Mkay. Talk to you later, Syri.”</i>");
	output("\n\nShe flips off the Codex and turns to you with a big, dopey grin. <i>“My sister just solved one of the most complex physics equations I’ve ever worked with. By hand. Ugh, I feel so stupid next to her sometimes!”</i>");
	if(flags["MET_SYRI"] != undefined) 
	{
		output("\n\nWait... Syri? Really? You didn’t exactly picture her as an astrophysicist in disguise.");
		output("\n\n<i>“I know, right!?”</i> Anno huffs. <i>“So much wasted potential! All she does is sit around jerking it to video games or whatever - if she just applied herself half as much as she does to slacking off, she could run laps around Akkadi and Steele’s entire R&D departments. Ugh!”</i>");
	}
	else output("\n\nWell, you guess genius just runs in the Dorna family. Anno chuckles and finishes off her drink, closing her eyes and relishing the taste. <i>“Maybe. Now if only motivation did, Syri might actually make something of herself. It’s so frustrating! She’s easily as smart as I am, probably <b>smarter</b>, but all she ever wants to do is the bare minimum to get by, and then waste all her time playing video games and getting hammered.”</i>");
	output("\n\nShaking her head to herself, Anno calls the bartender over and orders you both a drink.");
	output("\n\n<i>“To my twin sister, who once again secures me a big, fat research grant.”</i>");
	output("\n\n<i>“To Syri,”</i> you laugh, clinking your glass to hers.");
	output("\n\nYou spend a few minutes tipping back your drink and chatting with Anno, but unfortunately she soon says she needs to head back to the ship and start filling out paperwork for her grant. She leaves you with a big hug and a paid-for tab before sashaying out the door.");
	processTime(20);
	pc.createStatusEffect("Anno Bar Busy",0,0,0,0,true,"","",false,135);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[PetPlay] See if Anno’s willing to spend some time on the business end of a leash. 
//Requires cock that fits or vagina. 
//Accessible when Anno is a crew member.
public function annoIsPet():Boolean
{
	return (flags["TAKEN_ANNO_AROUND_AS_A_PET"] != undefined || flags["ANNO_PETPLAYED"] != undefined);
}
public function annoTimesWalked():Number
{
	var timesWalked:Number = 0;
	if(flags["TAKEN_ANNO_AROUND_AS_A_PET"] != undefined) timesWalked += flags["TAKEN_ANNO_AROUND_AS_A_PET"];
	if(flags["ANNO_PETPLAYED"] != undefined) timesWalked += flags["ANNO_PETPLAYED"];
	return timesWalked;
}
public function annoPupperPlay():void
{
	clearOutput();
	showAnno();
	author("HugsAlright");
	output("You give Anno a grin and slowly bring a [pc.hand] to the tip-top of her head, right between her big, fluffy ears. She coos happily as your hand begins to scritch and scratch at those aural organs of hers, gently nuzzling her head against your caressing palm, making sure your fingers hit all her sweet spots. Watching the ausar’s eyes flutter shut in bliss, you bring your [pc.lips] close to one of her twitching [anno.ears] and whisper: <i>“Who’s a good puppy?”</i>");
	output("\n\nAnno lets out a shuddering little <i>“I am.”</i>");
	output("\n\nYou smile at her, ");
	if(pc.isAss() || pc.isMischievous()) output("<i>“Then how about we put that pretty little ass of yours in a collar so I can treat you like one?”</i>");
	else output("<i>“Then how’d you like to be treated like one for a bit?”</i>");

	output("\n\n<i>“That...”</i> she begins to respond, her breath catching as your fingers scritch at a particularly sensitive spot, <i>“That sounds just about perfect.”</i> Anno manages to break herself from her petting-induced trance and smiles up at you, <i>“And I think I’ve got just the thing you’re looking for.”</i> Your hand drops from her head as she leans away, reaches for a nearby drawer, opens it, and produces a black leather collar complete with leash. Grinning, she hands the collar to you and brushes [anno.hair] away from her neck.");

	output("\n\n");
	//ifFirstTime:
	if(flags["ANNO_PETPLAYED"] == undefined) output("You don’t find it </i>too</i> surprising that Anno owns a collar, though it still feels a bit... jarring.");
	else output("You think you could get pretty used to sexy ausar girls handing you collars like this.");
	output(" Regardless, you shake creeping thoughts from your mind and focus on your puppy-to-be. She rests herself on her hands and leans back, thrusting out her impressive bust as you bring yourself closer to her, [anno.tail] swaying oh-so gently. Slowly, you bring the collar around her nape and close its buckle, locking it in place. Anno’s tail begins to wag faster as you pull yourself back. The smile on her face grows wider as you return a hand to her head, cooing another <i>“Good girl.”</i>");

	output("\n\n<i>“There’s just one problem,”</i> you whisper, gently nudging Anno onto her back, <i>“I don’t let any of my puppies wear clothes.”</i> ");
	//annoCatsuit:
	if(anno.armor is AnnosCatsuit) output("The puppy in question beams up at you as you straddle her, grabbing hold of the zipper keeping her own pair of puppies contained. You pull it down painfully slow, her tail moving back and forth with anticipation until her uniform parts around her [anno.breasts], eliciting a sigh of relief from the puppy as her breasts are finally freed from their confines. No use trying to resist the pull of those hypnotic double-D’s. You reach down, groping a full orb and teasing the nipple of another with a finger and a thumb. Anno starts to whimper under the weight of your tender touch before too long; girlish, needy whimpers: music to your ears. Can’t give her what she wants just yet, though, not before you get the rest of her suit off. You grab hold of the little bit of catsuit still clinging to Anno’s sultry body and pull down; your puppy is happy to assist, helping her tail make its exodus from her uniform and wiggling her way out until her furry feet pop free.");
	//annoBlouse:
	else output("The puppy in question beams up at you as you straddle her, grabbing at the buttons keeping her own pair of puppies contained. You undo them quickly, but not too quick; no, you want to watch her squirm with anticipation, and you do just that until her shirt parts around her [anno.breasts], eliciting a sigh of relief from the puppy as her breasts are finally freed from their confines. No use trying to resist the pull of those hypnotic double-D’s. You reach down, groping a full orb and teasing the nipple of another with a finger and thumb. Anno starts to whimper under the weight of your tender touch before too long; girlish, needy whimpers: music to your ears. Can’t give her what she wants just yet, though, not before you get into those pants. You grab hold of her jeans and start to pull them off; your puppy is happy to assist, helping her tail make its exodus from her pants and wiggling her way out until her boots come off with the rest of her clothes.");
	output(" A leash-bound Anno bare before you, now there’s a sight you could get used to. <i>“That’s more like it,”</i> you say, giving her a scratch between the ears.");

	output("\n\nWithout too much thought you reach your free hand down between Anno’s thighs. The ausar takes notice, her tail wagging expectantly as your hand nears her drooling sex. She whimpers as you make contact with her [anno.vagina], the naughty digit working its way along the edge of her nether lips until her mewls become soft little moans. Rather unfortunately for Anno, you pull your hand back, a single finger glistening with fem-lube as your puppy whines with woe. <i>“Can’t give you a treat yet, girl,”</i> you tell her, <i>“Not until you’ve had your exercise.”</i> You reach a hand down and give her [anno.hair] a little tussle, returning a smile to her face.");

	output("\n\nGrabbing Anno’s leash, you give it a little pull and stand up straight again. The ausar takes the initiative and makes her way to the ground on all fours, like a well trained pet. You grin at her silent eagerness.");
	
	var onTavros:Boolean = (getPlanetName() == "Tavros Station");
	
	//notOnTavros:
	if(!onTavros)
	{
		output("\n\n<i>“I know just the place where I can take you for a walk,”</i> you announce, walking towards your ship’s cockpit, puppy in tow. You take a seat in your captain’s chair and punch some coordinates into your holo-console before your ship takes off towards your perfect walkies location. In the meantime, you decide that it’d be a good idea to spoil your new pet a little, lavishing affection on all her canid parts as she nuzzles against you, crawling around on all fours like a good girl. Once you finally dock at your destination, you pick yourself up and give Anno’s tether a tug, leading her to the airlock. With a devious grin you open the hatch of your ship, giving the two of you a good look at your mystery destination: Tavros.");
		//firstTime:
		if(flags["ANNO_PETPLAYED"] == undefined) output(" Anno’s tail tucks in a bit at the realization that she’s about to be paraded around the crowded space station.");
	}
	else
	{
		output("\n\n<i>“C’mon girl, time for walkies,”</i> you announce, walking towards the airlock.");
		//firstTime:
		if(flags["ANNO_PETPLAYED"] == undefined) output(" Anno seems a little hesitant, though, most likely due to the fact she’s going to be paraded about naked on one of the galaxy’s most heavily populated space stations.");
	}
	if(flags["ANNO_PETPLAYED"] == undefined)
	{
		output("\n\nIt takes a good pull of her leash, but Anno finally follows you out of your ship");
		if(onTavros) output(", and into the crowded corridors of Tavros");
		output(".");
	}
	else
	{
		output("\n\nAnno isn’t nearly as tentative this time and follows you out");
		if(onTavros) output(" into the crowded corridors of Tavros");
		output(".");
	}
	output(" You don’t doubt that a naked ausar babe will draw some attention here, and she most certainly does: plenty of people comment on your pet - mostly on her choice of wardrobe - others stop to give her a little pet or two. A few braver specimens grope Anno outright, usually resulting in an unsettlingly-canine yelp from the grope-e. She doesn’t seem too upset by any of it, though; in fact, she seems to be getting wetter, her ausar snatch leaking beads of girlcum onto the floor as she crawls along it. Damn, she’s really getting off on this, isn’t she? Her tail’s definitely happy with what’s going on, standing straight up in the air where it wiggles gleefully, treating everyone you walk by to a nice view of [anno.butt].");
	output("\n\nThings are getting to the point where Anno’s panting like she’s in heat, and for all you know, she might be. Maybe you should walk her back to your ship before things get out of hand.");
	
	if(!onTavros) 
	{
		shipLocation = "TAVROS HANGAR";
		currentLocation = "SHIP INTERIOR";
		showLocationName();
		generateMap();
		processTime(600 + rand(30));
	}
	processTime(15);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",annoWalkiesPartDuesEx);
}

public function annoWalkiesPartDuesEx():void
{
	clearOutput();
	showAnno(true);
	author("HugsAlright");
	output("Your puppy’s been loyal to the leash so far, and she is on the way back too, although she ends up stopping a few times to receive more pets from passersby; a good tug of her leash is enough to make her heel again. Barring any further petting pit-stops, you successfully lead Anno back to your ship, breathing a happy sigh of relief as the airlock closes behind you. Your ausar companion, on the other hand, is still squirming with impatience, tail wagging uncontrollably and batting against your legs. You reach an appreciative hand down and give Anno a pat between her [anno.ears] and tell her, <i>“I think it’s time for your treat, girl.”</i> In response to your words, your pet’s tail begins to move at a pace you estimate to be somewhere near the speed of light as she grins up at you, nothing but yearning in her big, blue puppy-dog eyes.");
	output("\n\nKeeping a tight grip on Anno’s leash, you walk over to a nearby chair and sit yourself down. Before you can say or do anything else, your ausar pet is already on top of you. Her fuzzy arms wrap around your waist, nuzzling her head into your midsection as she tries to climb her way onto your lap, clamoring for a good fucking, and you have no intention to not give her one.");
	if(!pc.isCrotchExposed()) output(" Though you still need to get ready. With a steady hand you give Anno a soft push off you, issuing her an order of <i>“Down, girl.”</i> She whines softly, but brings herself back down to rest on her knees, lip quivering comically with disappointment, fluffy ears drooping in an amusing display of puppy-like sorrow. You roll your eyes, stand up, and tell her, <i>“Just wait a second, girl,”</i> as you start to strip yourself of your [pc.lowerGarments] in front of her, making her frown turn to a lusty smile.");

	//Cock takes priority to vagina.
	if(pc.hasCock())
	{
		var x:int = pc.cockThatFits(anno.vaginalCapacity(0));
		if(x < 0) x = pc.smallestCockIndex();
		output("\n\n");
		if(!pc.isCrotchExposed()) output("Once you’re good and nude you sit back down, but before ");
		else output("Before");
		output(" you can even say <i>“fetch”</i> Anno’s all over you");
		if(!pc.isCrotchExposed()) output(" again");
		output(", gobbling up your half-hard cock, [anno.tongue] playing across your stiffening shaft. You reach a hand down to her perky, white wolf-ears and let your fingers play across them until she starts to whimper and moan onto your penis, sending shivers of pleasure up your spine. <i>“Good girl,”</i> you coo once more, thanking your puppy for her oral affections. With your [pc.cock " + x + "] fully erect and sheathed in Anno’s mouth, you start to pull down on her leash, drawing her further down your root until your [pc.cockHead " + x + "] brushes against the back of her throat");
		if(pc.hasKnot(x)) output(" and your knot meets her lips");
		output(".");

		output("\n\nDespite the puddle of Anno-lube forming between your puppy’s knees, it doesn’t seem like she’s intent on doing anything other than blowing you, happily bobbing her head up and down your [pc.cock " + x + "] as her [anno.hands] grip your thighs. As much as you don’t want to, you grab Anno’s leash and give it a yank, pulling her off your saliva-coated shaft. She gives a sad, little whimper as your cock pops free, sitting there on her knees, tongue hanging out as she waits patiently for her next order. You think she’ll enjoy this next part; <i>“Over on the bed, girl, I’ve got another treat for you there.”</i> Anno licks her cock-coating lips and grins at your proposition.");
		output("\n\nYour puppy walks over to the nearby cot on her hands and knees, and you stand up to follow her as she reaches the end of her leash. Anno climbs onto the bed, crawling along the mattress and spreading her legs enticingly before she looks back at you, biting her lip. Wrapping her leash around your hand, you follow the ausar girl onto the bed, keeping her tether nice and taut as you kneel behind her. You give her [anno.butt] a firm double-pronged slap, making Anno yelp and her ass jiggle while you line your lovingly-polished cockhead up with her lube-leaking hole. Taking hold of Anno’s hips, you start to push forward, spit-slick shaft entering her with almost no resistance, easily spreading the lips of her sodden quim. She moans louder than you think she ever has as you slide yourself into her; looks like she really needs this after her adventure around Tavros.");
		output("\n\n<i>“How’s that feel, girl?”</i> you ask, continuing to push your way into her. Anno can only moan in response as your ");
		if(pc.hasKnot(x)) output("[pc.knot " + x + "] reaches her velvety folds");
		else output("[pc.cock " + x + "] bottoms out inside her");
		output(". You smile at her pleasured noises and pull yourself out again, leaving the pretty puppy whimpering and moaning until your glans meet the lips of her sex. You don’t keep your [pc.cock " + x + "] there for long, though, and push your [pc.hips] forward, sending your cock right back into Anno. She cries out in delight as she’s filled with your schlong again, panting heavily.");
		output("\n\nYour pet seems pretty close to the edge, not all that surprising considering her earlier escapades. No time to waste, then: you start to roll your hips and quicken your pace, sliding your [pc.cock " + x + "] in and out of Anno’s [anno.vagina], letting her screams of pleasure push you onwards. Despite the ease with which your [pc.cockNoun " + x + "] was able to enter it, Anno’s pussy is still hugging your dong tightly and lovingly, making you groan in bliss, wonders of the ausar anatomy and all that. Not too long after you’ve begun, Anno’s already about to finish, her body tensing up in your grasp as her moaning turns to babbling. [anno.Vagina] spasms around your cock; its wild motions make you feel like your [pc.cock " + x + "] is being milked, bringing you closer to your own orgasm. Before you can get ahead of yourself, you push Anno forward and pull out of her quim as it sprays girlcum all over the bed. You hastily pump your pole, keeping a firm grip on your puppyslut’s butt until you feel your climax build, letting loose a grunt that trails off into a moan while you finish all over Anno’s back and paint her [anno.butt] [pc.cumColor].");
		output("\n\nAs your orgasm ebbs, your cum-covered ausar manages to look back at you, giving you a smile only a pleased puppy can make, her [anno.chest] heaving. You reach forward and give the pooch a quick pet between the ears and another <i>“Good girl.”</i> With a slap on the ass, you tell Anno the two of you should probably get cleaned up before you go anywhere else.");
	}
	//hasVagina:
	else
	{
		output("\n\n");
		//notNude:
		if(!pc.isCrotchExposed()) output("Once you’re good and nude you sit back down, but before ");
		else output("Before ");
		output("you can even say <i>“dig in”</i> Anno’s all over you");
		if(!pc.isCrotchExposed()) output(" again");
		output(", her [anno.tongue] forcing its way into your [pc.vagina], making you release a few needy whimpers as she probes your depths. You reach a hand down to her perky, white wolf-ears and let your fingers play across them until she starts to mewl and moan, the sounds of her satisfaction sending shivers of pleasure up your spine. <i>“Good girl,”</i> you coo once more, thanking your puppy for her oral affections. With Anno’s tongue exploring your [pc.vagina], you let yourself sink back into your seat while your puppy happily laps up your [pc.girlCum], even as a puddle of her own arousal forms betweens her knees.");
		output("\n\nYou’re almost worried Anno might be too focused on her master to take care of her own sodden hole. That is, of course, <i>before</i> you spot a pair of furry fingers make their way down to her waiting quim. Almost immediately, Anno’s fingers disappear inside her with a little whimper before she starts to move them again. Each movement of the ausar’s fuzzy digits makes her falter slightly, tongue jumping in your [pc.vagina] while she grabs one of your [pc.thighs] to regain her balance, moaning all the while. [pc.GirlCum] runs down your happy pet’s face while she pleasure herself, [anno.tongue] delving deep into you to reach all your sensitive spots while a [pc.hand] plays along her twitching ears.");
		output("\n\nWith the onslaught of oral pleasure you’re receiving, you fear you won’t last much longer, and looking at your pooch, you don’t think she’ll last too long either; ");
		//firstTime: 
		if(flags["ANNO_PETPLAYED"] == undefined) output("the walkies really have her going");
		else output("her walkies really get her going");
		output(". Your estimations aren’t wrong, a feeling of heat and pleasure building in your loins until you cry out in delight and pull down on Anno’s leash, burying her face in your muff. Your puppy is, unsurprisingly, not too far behind you, letting out a long, muffled moan as your [pc.vagina] spasms around her tongue, [pc.girlCum] dribbling down her chin while her own orgasm begins. Anno’s [anno.vagina] tightens around her fingers, spraying slick ausar fem-lube all over the floor of your ship as she moans and moans between your legs.");
		output("\n\nAs your orgasm ebbs, your cum-soaked ausar looks up at you with a smile only a pleased puppy could make, her [anno.chest] heaving. You reach down and give the pooch a quick pet between the ears and give her another <i>“Good girl.”</i> Watching her lick her lube-soaked lips, you tell Anno the two of you should probably get cleaned up before you go anywhere else.");
	}
	processTime(45);
	IncrementFlag("ANNO_PETPLAYED");
	pc.orgasm();
	clearMenu();
	//Returns the player to their ship, docked in Tavros.
	addButton(0,"Next",mainGameMenu);
}

public function annoFrenchMaid():void
{
	pc.createStatusEffect("The Lusty Ausar Maid",0,0,0,0,true,"","",false,60*24);
	
	clearOutput();
	showAnno();
	author("HugsAlright");
	clearMenu();
	
	output("You draw in a little closer to the ausar, her velvety white tail and barely covered behind swinging almost in sync as she works an old-fashioned feather duster on the nooks and crannies of your ship. The frilly black-and-white outfit looks good on her; more than good, you reconsider. The pure-white thighhighs around her shapely legs quickly draw attention to her nearly see-through-panty clad booty, which happily wiggles back and forth as she works. The frill-lined skirt of the outfit seems purposely short, barely doing anything to cover her. Upon closer inspection it seems that Anno isn't wearing anything under the getup, making it hug her curves just right, and accentuating the swell of her big, soft breasts. An oversized white ribbon rests on the back of the outfit. It seems completely decorative, much like the headpiece sitting between her two perky wolf ears.");
	output("\n\nWhile managing to keep yourself from drooling at the sight of the skimpy Ausar you let your eyes take in their fill of the scene before a familiar voice breaks your focus.");
	output("\n\n<i>“Oh, hey boss,”</i> Anno says, looking over her shoulder at you, flashing you those baby blues of hers.");
	output("\n\nTurning back around she bends over to reach behind some furniture, giving you a perfect view of her gropable, spankable butt.");
	output("\n\nThat little tease.");
	output("\n\n<i>“I found this little number while we were docked at " + (flags["ANNO_MAID_OUTFIT"] == 1 ? "Tavros" : "Uveto") + ", thought you might like it,”</i> she says, looking over her shoulder at you again, giving you a wink and a lusty smile. <i>“How's it look?”</i> ");
	output("\n\nYou try to say something but nothing comes out. You're at a loss for words.");
	if (pc.isNice()) output("\n\nPulling yourself together you manage to blurt out: <i>“G-good!”</i> ");
	else if (pc.isMischievous()) {
		output("\n\nLeaning back slightly you pull yourself together, and with a smirk on your face you bring a finger and thumb up to stroke your chin.");
		output("\n\nWith a shrug you say, “It’s alright,” the sarcasm in your voice almost palpable.");
	}
	else {
		output("\n\nManaging to compose yourself you cross your arms and lean back slightly.");
		output("\n\nYou smile at her, “Pretty good from where I’m standing.”");
	}
	output("\n\n<i>“Aww, thanks boss!”</i> the lusty ausar responds. She turns around once more, bending over a little bit further, her squishy, tempting butt straining against her panties. She spreads her legs just a bit before giving her behind a wiggle, tail waving back and forth.");
	output("\n\nOh, she is asking for it.");
	
	addButton(0, "FuckHerGood", annoFrenchMaidGimme, undefined, "Fuck Her Good", "Give Anno what she’s looking for.");
	addButton(1, "Resist", annoFrenchMaidIDontWantCuteMaidButt, undefined, "Resist", "Resist the seductions of the maid-clad temptress.");
}

public function annoFrenchMaidIDontWantCuteMaidButt():void
{
	clearOutput();
	showAnno();
	author("HugsAlright");
	clearMenu();
	
	output("Wait a second, you know exactly what's going on here, and you're not about to fall for Anno's little games. You've got a fortune to chase! You take a deep breath, puff out your chest, and begin to walk towards the door. Anno looks over her shoulder at you, <i>“Leaving so soon, babe?”</i> ");
	output("\n\nYou grab the doorframe to stop yourself and look back at her. Giving her a half-hearted shrug you tell her: “Sorry, business before pleasure.” She sticks her tongue out at you as you leave.");
	
	addButton(0, "Next", mainGameMenu);
}

public function annoFrenchMaidGimme():void
{
	var x:int = pc.cockThatFits(anno.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	
	clearOutput();
	showAnno(true);
	author("HugsAlright");
	clearMenu();
	
	pc.lust(pc.lustMax() - pc.lust());
	
	output("You’re not one to sit by while a sexy, sexy maid teases you mercilessly. " + (!pc.isNude() ? "You start to remove your [pc.gear], and although the little tease isn't looking at you, Anno’s ears perk up at the sound of clothing falling to the ground, a grin forming on her face. " : "") + "You saunter your way up to the girl, still hard at work with her feather duster. You give your [pc.cock " + x + "] a few strokes, already half-hard from her little show, a predatory grin growing on your face, eyes fixed on your goal. You stop and watch your new maid’s tail wag back and forth for a moment before you lunge forward, bending yourself over Anno to bring your face close beside hers and bring one hand to rest on a flared hip, the other between her big white wolf-ears. She doesn't seem surprised by your pounce but instead settles into your grasp, nuzzling against the hand perched between her ears, her tail batting against your midsection.");
	output("\n\n<i>“Mmmmmm,”</i> the perky puppy coos, <i>“Knew you wouldn't let a girl work without some company.”</i> ");
	output("\n\nGrinning, you put your highest hand to work scritching the maid's ears, running your digits through her snow-white mane. She shudders as your hand works itself all over her sensitive spots. Your fingers trace along the bottom of her fluffy, fluffy ears, drawing forth a little whimper from your lover. She manages to compose herself and continues dusting and cleaning the ship. You crack a smile at her determination. Your other hand doesn’t stay idle for long, as soon you're sliding your hand off Anno’s hip before giving one of the ausar beauty’s lower cheeks a nice firm squeeze, setting her snowy, downy tail into overdrive. She releases little whimpers of pleasure as you knead her ass in one hand and continue to scritch at those perky wolf ears of hers with the other. Still, the maid tries to continue her work, faltering slightly with each squeeze of her ass.");
	output("\n\nWith a lusty smile you slyly glide your hand along the smooth skin of Anno's ass towards her juicy, lube-leaking slit. She shudders as your fingers brush up against the silky folds of her sex; her panties are soaked. You pull yourself upright and take a step back, a bit surprised she’s already this wet. Anno looks over her shoulder at you, <i>“Leaving so soon, babe?”</i> You smile down at her and hike up her frilly skirt.");
	output("\n\n<i>“I wouldn't even think of it.”</i> ");
	output("\n\nWith that said you grab her panties and pull them down, baring her pretty pink ausar pussy to you as she steps out of the lube-soaked undergarments. You're quick to bend yourself over her again, your bare [pc.chest] pressing into Anno's back as you settle in and your hand returning to its work between her ears. Meanwhile one of your more devious fingers starts to trace the ausar's lube-leaking slit up and down, making her moan oh-so softly, fuzzy white tail tickling you slightly as it wags as fast as it can between your bodies. It isn't long before your digit delves into Anno's sodden box, followed by another finger, and another. She moans loudly and arches her back as she's penetrated by your probing digits, causing her to almost drop her duster.");
	output("\n\nSurprisingly, Anno continues to work as your fingers slide in and out of her sodden cunt, moaning as she does so. Eventually you feel her moving on her own, slowly grinding her hips against your hand so your probing digits hit all the right places. You’re hardly focused on anything but Anno’s ceaseless moaning when you feel your stiffening shaft brush up against her pale thigh; she takes notices aswell, her ears quickly perking up.");
	output("\n\nShe turns her head towards you, <i>“Think I'm doing a good job with this whole maid thing, captain?”</i> she says, smile on her face.");
	output("\n\n<i>“You're doing perfect.”</i> You lean in closer to one of her huge white wolf ears, <i>“Think you can keep going with a [pc.cock " + x + "] inside you?”</i> ");
	output("\n\nShe shudders at your words, her whole body quivering for a moment. The ausar smirks, <i>“Why don't we find out?”</i> ");
	output("\n\nThat's all the invitation your horny ass needs. Bringing yourself upright you withdraw your fingers from your lovers' lube-leaking cunt, leaving her sex slightly agape. You grip your cock with femcum-covered fingers and quickly coat your tool in liquid arousal; with a grab of Anno's flared hips you line your [pc.cock " + x + "] up with with her drooling slit. The canid-maid bites her lip and looks back at you, anticipation in her gaze. Deciding to take it slow, you gently push your [pc.cockHead " + x + "] into her velvety folds. She whimpers as your glans press into her, your tool easily entering Anno's lubed-up pussy. Her inner walls hug at your cockflesh, making you groan in bliss with each inch you work into her until you bury your dick to the hilt " + (pc.hasKnot(x) ? "with your knot teasing her leaky, stretchy cunt" : "") + ", leaving the bent-over ausar panting, and you with a smile on your face. You give Anno a quick swat on the butt, making her ausar pussy clench down around your [pc.cock " + x + "] and drawing a rather lewd moan from her.");
	output("\n\nYou don't stay still for long though and begin to pull back from your pleasingly slow penetration. Anno groans as your [pc.cock " + x + "] makes its exodus from her sodden box, only stopping your retreat as your glans meet the silky folds of her sex, making her whimper needily as you stay in that position for a moment, leaving her wet, gaping hole agonizingly empty. You're quick to give the cock-craving ausar what she wants and ram your [pc.hips] into hers, setting her gropeable booty jiggling. Her moans fill the common area as your [pc.cock " + x + "] fills her nether lips once more. You begin to move your hips at a steady pace, trying to let Anno continue her work, but it seems she might be close to caving in, her motions becoming shaking, almost collapsing with pleasure each time your hips connect.");
	output("\n\nThe lusty ausar can't seem to control herself anymore; she drops her duster and clutches at the piece of furniture she's bent over, moaning away, tail wagging faster and faster, its fluffy tip brushing across your chin with each wave. She puts a furry foot up on your [pc.thigh] to brace herself, helping each exit your [pc.cock " + x + "] makes by pushing back. You decide now's as good a time as any to pick up the pace. Your grip on Anno's wide hips tightens, forcefully pushing and pulling her back onto your turgid shaft with each thrust. She doesn't last much longer under the weight of your vigorous pussy-pounding before she releases an ear-pleasing cry of pleasure. Her arms and legs lock as her back arches steadily. Ausar snatch clenches down around your cock as Anno’s climax ensues, girlcum spilling out around your turgid cock, your lover awash with orgasmic delight. The sensation of spasming pussy around your [pc.cock " + x + "] makes it feel like you’re being milked for all the cum you’re worth. In time her clenching canal becomes all too much for you, and with one last hearty thrust you bury your member inside your canid-lover. Grunting, you grab her sides and hold her down on your spasming [pc.cockNoun " + x + "] as it empties its load, setting Anno moaning while your warm seed fills her, an excess of [pc.cumNoun] spilling out of her cunt. She keeps her place happily speared on your cum-leaking cock as you finish into her. ");
	output("\n\nBoth of your climaxes begin to ebb, leaving the two of you panting happily in post-coital bliss, letting the warmth of your orgasms fade. You reluctantly pull your [pc.cock " + x + "] from your lover’s gaping pussy with a sigh, drawing a quivering moan from her as your seed spills onto the floor.");
	if (pc.hasKnot(x)) output("\n\nUnfortunately it doesn't seem you were quick enough to make use of your [pc.knot " + x + "].");
	output("\n\nAnno picks herself up and spins around to look at you, <i>“Thanks boss,”</i> the ausar breathes, <i>“You sure know how to make a girl work for her keep.”</i> Her ears perk up as she lets out an overly girly giggle.");
	
	processTime(15 + rand(10));
	
	addButton(0, "Next", annoFrenchMaidGimmeMore, x);
}

public function annoFrenchMaidGimmeMore(x:int):void
{
	clearOutput();
	showAnno(true);
	author("HugsAlright");
	clearMenu();
	
	output("Your lover looks down at you cum-soaked cock. She grins, her snow-hued tail beginning to wag to and fro again, <i>“Aww, but now this is all dirty.”</i> One of Anno's velveteen hands reaches down and grabs your tender [pc.cockNoun " + x + "], making you wince as her other hand reaches around to grope your [pc.butt]. The eager ausar buries her head in the nape of your neck.");
	output("\n\n<i>“Guess my job's not done yet,”</i> she whispers, sending a shiver down your spine.");
	output("\n\nYou find yourself falling into a freshly-dusted chair, Anno on top of you, lovingly stroking your soft cock until it starts to stiffen in her velveteen grasp, making you groan into a perky white wolf ear. She pulls herself back to look at you, still recovering from your last orgasm. She smiles and brings herself to kneel on the ground, and grabbing your knees, Anno spreads your legs wide enough so she can shimmy in between them. ");
	output("\n\nYour half-hard cock falls onto the bridge of Anno’s nose as she leans forwards. She lets her flat ausar tongue loll out of her mouth to lap up the [pc.cum] at the base of your [pc.cock " + x + "].");
	if (pc.hasKnot(x)) output("\n\nYou throw your head back and groan as Anno begins to tease at the sensitive flesh of your [pc.knot " + x + "], her agile tongue bathing your knot in warm saliva. You whimper, Anno smiling up at you as you squirm under the weight of her oral affections.");
	output("\n\nThe lusty ausar begins to drag her tongue up your cock, soaking up all the [pc.cum] and fem-lube coating your tool along the way, stopping as her tongue flicks across your [pc.cockHead " + x + "]. Anno straightens herself, brushing back locks of snowy hair before bringing her lips down to the head of your [pc.cock " + x + "] and wrapping a furry finger and thumb around its base, leaving you in agonizing anticipation for a moment. Your lover begins to work her hand to jerk you off as her mouth descends onto your waiting member. You groan as her lips wrap around your glans, her tongue playing across your cockhead. Reaching down you rest your hands between a pair of fluffy ears, gently guiding your ausar maid down your length. In turn she reaches up, her white-furred hands playing along your [pc.thighs]. She stops her descent onto your [pc.cock " + x + "] as your [pc.cockHead " + x + "] brushes the back of her throat. The canid-girl gives one of your thighs a slap, causing you to yelp and your cock to jump, depositing a thick wad of pre into her mouth followed by a muffled chuckle from the cock-hungry canine.");
	output("\n\nYou roll your eyes at the maid and let your head fall back, content to allow her warm mouth to work its magic on your [pc.cockNoun " + x + "]. With her head bobbing up and down on your tool, and a furry hand still stroking your lower shaft, Anno makes sure not an inch of your cock is uncovered.");
	if (pc.hasKnot(x)) output("\n\nYour lover's lips kiss at the top of your [pc.knot " + x + "], her tongue occasionally falling out of her mouth to play along the bulb of sensitive cockflesh.");
	output("\n\nDrops of pre leak out of your [pc.cock " + x + "], eliciting tender, pleased moans from Anno as your [pc.cum] makes its way down her throat. You groan as her flat ausar-tongue plays across your shaft, continuously coating your dick in slick spit. You push down harder on the ausar girl's head, forcing your dong further down her throat. She whines a bit but takes your cock willingly. As you feel pressure building in [pc.cockNoun " + x + "], " + (silly ? "y-your hips are moving on their own " : "your hips begin to move of their own volition") + ", bucking into Anno's mouth, your pre-leaking shaft twitching on the verge of orgasm.");
	output("\n\nThen Anno pulls off your turgid tool just as you're ready to blow. You whimper as the maid leaves your wet cock in the cold without the warm hold of her mouth. You're painfully hard, cock still twitching as you come down from your near-climax.");
	output("\n\n<i>“All clean,”</i> she says, trying to catch her breath after the throat-fucking you just gave her.");
	output("\n\nYou ask Anno if she plans to do anything about your throbbing erection.");
	output("\n\nThe ausar smiles, <i>“Now what kind of employee would I be if I left a job unfinished?”</i>");
	output("\n\nAnno climbs on top of you once more, straddling your [pc.hips] with her lube-leaking snatch hovering just above your stiff member. She smiles down at you briefly before she spears herself on your cock without warning, burying your length inside her. You moan as loud as Anno does when you find your [pc.cock " + x + "] sheathed inside her, the warm walls of her canal hugging your tool. Anno pants, her hot breath hitting your face, tail wagging at the speed of sound behind her as she catches her breath from her rapid descent. It isn't long before the maid starts moving again, her hips grinding against yours, tight, juicy cunt caressing your warm cockflesh as she moves. Anno cries out, grabbing at your shoulders to steady herself. You're quick to grab the girl's hips to help guide her up and down your shaft. The ausar atop you gradually starts to pick up the pace, sliding up and down your [pc.cock " + x + "] eagerly, the happy pup panting as she hammers her flared hips into yours with each downstroke.");
	output("\n\nAnno is practically bouncing in your lap at this point, her tail becoming an intangible white blur. Her furry hands drift off your shoulders to cup her own breasts, squeezing and kneading them through her maid outfit, making her moan into your [pc.ear]. You feel your [pc.cock " + x + "] begin to swell with cum and let out a groan as it start to spasm. You tighten your grip on Anno's hips and hold her down as pleasure radiates through your body, pumping the slutty maid full of [pc.cumNoun], painting her love tunnel [pc.cumColor]. Your cum filling her is enough to make your lover join you in orgasm as she throws her head back, crying out in pleasure, her lower lips tightening around your [pc.cock " + x + "] as you fill her with your seed. Anno moans as girlcum sprays out onto your [pc.thighs] and all over the once-clean chair. You give a few final jerky thrusts into your slut-puppy before your orgasm finally comes to an end, [pc.cum] steadily leaking out of Anno's cunt, its owner whimpering as she feels your heat inside her.");
	output("\n\nYou're left with your [pc.chest] heaving, and a happy puppy still on top of you. You lean back and sink into the chair, letting yourself go limp as Anno pulls herself off of you, still-warm [pc.cumNoun] spilling out onto the chair now soaked in your combined fluids. It seems Anno isn't done yet, though; she kneels down between your legs again, looking up at you with a devious grin before she gives your soft, cum-covered cock a long lick up its side.");
	output("\n\n<i>“Quite the vicious cycle, huh boss?”</i>");
	output("\n\nLooking down at the ausar, you give her a tired and slightly worried smile. You rest a hand between her fluffy, twitching pupper ears, scritching and scratching until her tail starts wagging again. Anno brings her lips to kiss your tender [pc.cockHead " + x + "] while you lean your head back and let the maid continue with her <i>“duties”</i> a pleasurable calm overtaking your body.");
	
	processTime(15 + rand(10));
	
	addButton(0, "Next", annoFrenchMaidGimmeMoreMore, x);
}

public function annoFrenchMaidGimmeMoreMore(x:int):void
{
	clearOutput();
	showAnno(true);
	author("HugsAlright");
	clearMenu();
	
	output("<b>An untold amount of vicious cycles later...</b>");
	if (!pc.hasKnot(x))
	{
		output("\n\nAnno pushes herself down on your [pc.cock " + x + "] for the who-knows-how-manyeth time. She lets out a muffled cry of pleasure as her snatch spasms around your tired manhood, pussy-juice spraying onto the now cum-soaked chair. She stays on your turgid length for a moment as she comes down from her orgasm, panting, tail still waving to and fro. Anno pulls herself off your softening [pc.cockNoun " + x + "], an abundance of [pc.cum] leaking from her now-gaping cunt. The canid-girl can barely hold herself upright, her arms and legs quivering until she falls forward onto you, her chin resting on your shoulder. Anno throws her arms around your neck to secure herself, panting happily into your ear.");
		output("\n\nBetween pants the tired puppy manages to string some words together. <i>“Sorry... boss... ”</i> she takes in a deep breath, <i>“I don't think I have another round in me.”</i> ");
		output("\n\nYou pat the ausar maid on the the ass and tell her that's just fine, though you think the ship might need some more work. Anno manages to chuckle.");
		output("\n\n<i>“Think it'd be okay if we stay like this for a while?”</i> your spent lover whispers into your ear, <i>“I don't think I could move right now.”</i>");
		output("\n\nYou breathe deep and give the girl another pat on the ass.");
		output("\n\n<i>“" + (pc.isNice() ? "Sounds good to me" : " I guess I can give you a little break") + ",”</i> you say, not feeling like you could move yourself.");
		output("\n\nThere you sit, sleepy maid-clad ausar atop your heaving chest, your legs and crotch aching pleasantly while [pc.cum] and slick ausar girlcum spills out onto the chair and floor. You throw your arms around Anno's back and let yourself drift off to sleep until your puppyslut is ready to move again.");
	}
	else
	{
		output("\n\nAnno pushes down on your [pc.cock " + x + "], forcing herself down harder than the past who-knows-how-many times, allowing your turgid [pc.knotNoun " + x + "] to slip into her. She lets out a muffled cry of pleasure as her snatch spasms around your tired cock, pussy-juice spraying onto the now cum-soaked chair. You're not too far behind the ausar and join her in orgasm, knot expanding as your breeding-rod sprays what little [pc.cum] it has left into Anno's waiting cunt. She stays in her spot for a moment as she comes down from her orgasm, panting, tail still waving to and fro. She pulls herself back to look at you, but the canid-girl can barely hold herself upright, her arms and legs quivering until she falls forward onto you, with her chin resting on your shoulder. Anno throws her arms around your neck to secure herself, panting happily into your ear.");
		output("\n\nBetween pants the tired puppy manages to string some words together. <i>“Sorry... boss... ”</i> she takes in a deep breath, <i>“I think... we might be stuck here for... a while.”</i> ");
		output("\n\nYou pat the ausar maid on the ass and tell her that you're fine with that. ");
		output("\n\nShe coos happily and nuzzles her head into the nape of your neck, <i>“That's good. I don't think I could move right now anyway.”</i>");
		output("\n\nHonestly, you don't feel like you could move yourself. You wrap your arms around Anno's back and pull your knotted maid close, her double-D's pressing into your [pc.chest], radiating heat through the soft, thin fabrics of her now cum-soaked maid outfit.");
		output("\n\nThe ausar babe settles in atop you, knot held securely inside her. She manages to wrap her shapely, furred legs around your back to make herself more comfortable, and pulls you a little closer to herself in the process. You find yourself bathed in warmth and bliss, the gentle breathing of your spent lover in your ear drawing attention away from the pleasant ache of your legs, no doubt caused by the eager-to-please puppy-slut.");
		output("\n\nYou feel your eyelids grow heavy, the warmth of Anno's embrace and her breath on your cheek slowly carrying you away to sleep. You let your eyes close as you and your well-knotted lover drift into unconsciousness to wait it out.");
	}
	output("\n\n<b>Sometime later...</b>");
	if (!pc.hasKnot(x))
	{
		output("\n\nYou awaken only to find Anno still on top of you. You squirm a bit under her, and that seems enough to rouse the ausar. The spunk-covered maid stretches and yawns softly before she tries to nuzzle her head back into your shoulder. <i>“Morning boss...”</i> is all you get out of her.");
		output("\n\nOpening your mouth, you're only able to release a halfhearted sigh. " + (pc.isAss() ? "You know you need to get moving, but can't with your maid-puppy in the way" : "As much as you want to let your maid-puppy rest, you need to get moving") + ", and you " + (!pc.isAss() ? "reluctantly" : "") + " tell her so. Anno groans and picks herself up off of you, displeasure clear in her tired noises.");
		output("\n\nYou wiggle yourself out from under her and stand up, your legs still a bit sore. Turning around you see Anno curling up on the chair, ready to go back to her nap. You crack a smile and reach a hand down to give her a quick appreciative scratch between her ears. She smiles, her tail batting against the chair. You gather your gear from the floor. Luckily it seems like it's avoided most of yours and Anno's cum. You give yourself a great big stretch " + (!pc.isNude() ? "as you put on the last of your [pc.armor] " : "") + "and take a quick look back at your maid, still asleep.");
	}
	else
	{
		output("\n\nYou awaken only to find Anno still on top of you. You squirm a bit under her, and that seems enough to rouse the ausar. The spunk-covered maid stretches and yawns softly before she tries to nuzzle her head back into your shoulder. <i>“Morning boss...”</i> is all you get out of her.");
		output("\n\nOpening your mouth, you're only able to release a halfhearted sigh. " + (pc.isAss() ? "You know you need to get moving, but can't with your maid-puppy in the way" : "As much as you want to let your maid-puppy rest, you need to get moving") + ", and you " + (!pc.isAss() ? "reluctantly " : "") + "tell her so. Anno groans and picks herself up off you, displeasure clear in her tired noises. She lifts herself off of your soft [pc.cockNoun " + x + "], multiple orgasms worth of [pc.cum] leaking out from her slightly-agape sex as your [pc.knot " + x + "] is freed.");
		output("\n\nYou wiggle yourself out from under her and stand up, your legs still a bit sore. Turning around you see Anno curling up on the chair, ready to go back to her nap. You crack a smile and reach a hand down to give her a quick appreciative scratch between her ears. She smiles, her tail batting against the chair. You gather your gear from the floor. Luckily it seems like it's avoided most of yours and Anno's cum. You give yourself a great big stretch " + (!pc.isNude() ? "as you put on the last of your [pc.armor] " : "") + "and take a quick look back at your maid, still asleep. ");
	}
	
	annoSexed(1);
	IncrementFlag("ANNO_MAID_SEX");
	
	processTime(75 + rand(30));
	
	pc.orgasm();
	
	addButton(0, "Next", mainGameMenu);
}