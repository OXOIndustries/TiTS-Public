/*
BIZZY_PORN_STUDIO 	0/undefined, untouched state
					-1 refused to buy her out, further access disabled
					>= 1 Studio Stage

BIZZY_PORN_STUDIO_TIMER 	undef/zero available
							> 1 time entry will be available again

BIZZY_SEEN_NAKED	0/undefined nope
					1 Yep

BIZZY_MAIL_PAYMENT_DAY 	undef unset
						>= 0 The first day number the PC receives a pay out

BIZZY_SLAVER_CHOICE		undef/0 none
						1 Tat
						2 collar
						3 both
*/

public function bizzyCamgirlInitialMail():String
{
	var ret:String = "Hello [pc.Mr] Steele,";
	ret += "\n\nThis is a real shot in the dark, but you always miss the ones you don’t take right. I have an. Lets call it an investment opportunity. Ive read a lot about you, and people who know you say its the sort of thing youd be interested in. Hint hint.";
	ret += "\n\nI have a place on Tavros res deck, north walk, 156. Ten mins is all I ask for, Im not a scam artist I swear. Attaching a pic of me.";
	ret += "\n\nSincerely, Bizzy";

	ret += "\n\n<i>There is indeed a picture attached. It’s a top down selfie of a young, white-furred kaithrit, doing a kissy face at the camera. She has a cute upturned nose, bright green eyes, pointy ears... and is flat as a board. Given the race she belongs to, it’s impossible to tell from this shot if she’s male or female.</i>";

	return doParse(ret);
}

public function bizzyCamgirlPaymentMail():String
{
	var ret:String = "You should be getting some money from me every month now. You own all the rights to the stuff I do so the ad rev etc goes to you.";
	ret += "\n\nThx so much for supporting me, [pc.Mr] Steele. This has been a dream come true so far. I cant wait to see you again so I can thank you in person, if you get what I mean.";
	ret += "\n\nSee you soon.";

	ret += "\n\nBizzy <3";

	ret += "\n\n<i>The busty kaithrit has attached a little film of herself. In it she grins at the cam, before opening her mouth, unfurling her flat tongue and gently flicking the tip, fellating the empty air. She keeps her emerald eyes locked with the cam as she does it, making them appear wide, needy and aroused.</i>";

	return doParse(ret);
}

public function processBizzyCamgirlPayments(deltaT:int, doOut:Boolean, totalDays:int):void
{
	if (flags["BIZZY_PORN_STUDIO"] == undefined || flags["BIZZY_PORN_STUDIO"] < 3)
	{
		return;
	}

	var bizzyMailPay:Boolean = false;
	// Init the day offset we use from the first time update after the mail is read
	if (flags["BIZZY_MAIL_PAYMENT_DAY"] == undefined && MailManager.isEntryViewed("bizzy_camgirl_profits"))
	{
		flags["BIZZY_MAIL_PAYMENT_DAY"] = days;
		bizzyMailPay = true;
	}

	// Also check for the first day so we can push a payment through along with the mail
	if (bizzyMailPay || (flags["BIZZY_MAIL_PAYMENT_DAY"] != undefined && ((days - flags["BIZZY_MAIL_PAYMENT_DAY"]) + totalDays) >= 30))
	{
		var numPays:int = Math.max(1, (((days - flags["BIZZY_MAIL_PAYMENT_DAY"]) + totalDays) / 30));

		flags["BIZZY_MAIL_PAYMENT_DAY"] = (days + totalDays);

		var payAmounts:Array = [300, 2000, 2000]; // This should handle the payments not working, I forgot we go up to stage 5 at the very end without touching the payments

		// The player should never be able to change the stage (and thus per month payout level)
		// Whilst also passing more than 1 payment period so we can just assume payouts across
		// 2 or more periods (if it ever happens) will have to be at the current stage.
		var actualPay:int = (payAmounts[Math.min(flags["BIZZY_PORN_STUDIO"] - 3, 2)] * numPays);
		pc.credits += actualPay;

		AddLogEvent("Your codex makes a chiming sound, <b>informing you that you have received " + actualPay + " credits</b>. That’ll be what Bizzy has earned for you " + (numPays == 1 ? "this month" : "the last few months") +".", "good", deltaT);
	}
}

public function showBizzyBust(isNude:Boolean = false):void
{
	author("Nonesuch");
	showBust(bizzyBustDisplay(isNude));
	showName("\nBIZZY");
}
public function bizzyBustDisplay(isNude:Boolean = false):String
{
	var sBust:String = "BIZZY";
	
	
	// Stage 1: flat-chested
	if(flags["BIZZY_PORN_STUDIO"] == undefined || flags["BIZZY_PORN_STUDIO"] <= 1) {}
	// Stage 2: C-cup breasts
	else if(flags["BIZZY_PORN_STUDIO"] <= 2) sBust += "_2";
	// Stage 3: DD cups
	else if(flags["BIZZY_PORN_STUDIO"] <= 3) sBust += "_3";
	// Stage 4: J cups
	else if(flags["BIZZY_PORN_STUDIO"] <= 4) sBust += "_4";
	// Stage 5: J cups, optional collar
	else {
		sBust += "_4";
		if(bizzySlaveCollar()) sBust += "_COLLAR"; // neck
		//if(bizzySlaveTat()) sBust += "_TATTOO"; // butt
	}
	
	if(isNude) sBust += "_NUDE";
	
	return sBust;
}

public function get pornStudioName():String
{
	return flags["BIZZY_PORN_STUDIO"] == undefined ? "Smutosaur.us" : flags["BIZZY_PORN_STUDIO_NAME"];
}

public function bizzySlaveCollar():Boolean
{
	if(bizzySlaveNeither()) return false;
	if(bizzySlaveBoth()) return true;
	return flags["BIZZY_SLAVER_CHOICE"] == 2;
}
public function bizzySlaveTat():Boolean
{
	if(bizzySlaveNeither()) return false;
	if(bizzySlaveBoth()) return true;
	return flags["BIZZY_SLAVER_CHOICE"] == 1;
}
public function bizzySlaveBoth():Boolean
{
	return flags["BIZZY_SLAVER_CHOICE"] == 3;
}
public function bizzySlaveEither():Boolean
{
	return flags["BIZZY_SLAVER_CHOICE"] >= 1;
}
public function bizzySlaveNeither():Boolean
{
	return flags["BIZZY_SLAVER_CHOICE"] == 0;
}

public function bizzyApartmentHandler(btnSlot:int):void
{
	flags["NAV_DISABLED"] |= NAV_NORTH_DISABLE;

	if (!MailManager.isEntryViewed("bizzy_camgirl_initiate"))
	{
		addDisabledButton(btnSlot, "KnockNorth", "Knock North", "You don’t know anybody up through this part of the Resential deck...");
		return;
	}
	if (flags["BIZZY_FIRST_TIME_MEET"] == undefined)
	{
		if(pc.credits < 40000)
		{
			output(" You get the impression whoever sent the message assumed you had plenty of cash ready to go. Perhaps it would be wise to return when that was actually the case...");
			addDisabledButton(btnSlot, "KnockNorth", "Knock North", "You get the impression whoever sent the message assumed you had plenty of cash. Maybe you should have some more on you before meeting them.");
		}
		else
		{
			output(" You could go see about what this ‘Bizzy’ has in mind.");
			addButton(btnSlot, "KnockNorth", bizzyDoorKnock, undefined, "Knock North", "Knock on Bizzy’s door and introduce yourself.");
		}
		return;
	}
	if (flags["BIZZY_PORN_STUDIO"] == -1)
	{
		output(" You should probably avoid Bizzy after turning her down.");
		addDisabledButton(btnSlot, "KnockNorth", "Knock North", "You should probably avoid Bizzy after turning her down.");
		return;
	}
	if (flags["BIZZY_PORN_STUDIO"] == undefined || flags["BIZZY_PORN_STUDIO"] < 5)
	{
		if(GetGameTimestamp() < flags["BIZZY_PORN_STUDIO_TIMER"])
		{
			output(" Bizzy’s probably a bit busy still in the wake of your entrepreneurship.");
			addDisabledButton(btnSlot, "KnockNorth", "Knock North", "Bizzy will be hard at work, setting up her equipment, a camwhore profile and producing some material. You should come back in a day or so - maybe with some Tittyblossom.");
		}
		else
		{
			output(" Bizzy is probably prepped and ready to get this show on the road, should be about time to drop in on her and see how she’s doing.");
			addButton(btnSlot, "KnockNorth", bizzyDoorKnock, undefined, "Knock North", "Drop in on Bizzy, see how your pet cam-girl is doing.");
		}
		return;
	}
	if (flags["BIZZY_PORN_STUDIO"] == 5)
	{
		if(GetGameTimestamp() < flags["BIZZY_PORN_STUDIO_TIMER"])
		{
			output(" Utility drones and a couple of helmeted engineers are at work in and around apartments 155-157. Sparks fly within, and stacks of material are ferried up the grav-lifts. It’ll be a while before they’re finished constructing the [pornStudioName] studio.");
			addDisabledButton(btnSlot, "KnockNorth", "Knock North", "Giving the place a wide-berth whilst the work-crews are still hard at it would be advisable.");
		}
		else
		{
			if (flags["BIZZY_CONSTRUCTION_COMPLETE"] == undefined) output(" Looks like the drones are finally done renovating your new studio. Time to go check out the digs.");
			else output(" Although they look as dull and innocuous from the outside as ever, numbers 155-157 contain "+ pornStudioName +", your smutty production company. You could drop in and see how it and Bizzy are doing.");
			addButton(btnSlot, "KnockNorth", bizzyDoorKnock, undefined, "Knock North", "Drop in on Bizzy, see how your pet cam-girl is doing with your new studio.");
		}
		return;
	}
	
	output(" Although they look as dull and innocuous from the outside as ever, numbers 155-157 contain "+ pornStudioName +", your smutty production company. You could drop in and see how it and Bizzy are doing.");
	
	addButton(btnSlot, "KnockNorth", bizzyDoorKnock, undefined, "Knock North", "Knock on Bizzy’s door.");
}

public function bizzyDoorKnock():void
{
	if (flags["BIZZY_PORN_STUDIO"] == undefined)
	{
		bizzyFirstTimeMeeting();
	}
	else if (flags["BIZZY_PORN_STUDIO"] == 1)
	{
		bizzyStage1();
	}
	else if (flags["BIZZY_PORN_STUDIO"] == 2)
	{
		bizzyStage2();
	}
	else if (flags["BIZZY_PORN_STUDIO"] == 3)
	{
		bizzyStage3();
	}
	else if (flags["BIZZY_PORN_STUDIO"] == 4)
	{
		bizzyStage4();
	}
	else if (flags["BIZZY_PORN_STUDIO"] == 5)
	{
		bizzyStage5();
	}
}

public function bizzyMenu():void
{
	switch (flags["BIZZY_PORN_STUDIO"])
	{
		default:
		case undefined:
		case 0:
			throw new Error("This shouldn’t ever be called!");
			break;
		case 1: bizzyStage1Menu(); break;
		case 2: bizzyStage2Menu(); break;
		case 3: bizzyStage3Menu(); break;
		case 4: bizzyStage4Menu(); break;
		case 5: bizzyStage5Menu(); break;
	}
}

public function bizzyGoLeave():void
{
	switch (flags["BIZZY_PORN_STUDIO"])
	{
		default:
		case undefined:
		case 0:
			throw new Error("This shouldn’t ever be called!");
			break;
		case 1: bizzyStage1Leave(); break;
		case 2: bizzyStage1Leave(); break;
		case 3: bizzyStage2Leave(); break;
		case 4: bizzyStage3Leave(); break;
		case 5: bizzyStage4Leave(); break;
	}
}

public function bizzySexMenu(fromItem:Boolean = false):void
{
	clearOutput();
	showBizzyBust();

	output("What do you want to do with your pet kaithrit?");

	//[Vaginal] [Booby Rubs] [Oral] [Titfuck]
	clearMenu();
	
	var btnSlot:int = 0;

	if (pc.lust() >= 33 && pc.hasCock()) addButton(btnSlot++, "Vaginal", bizzySexVaginal, fromItem, "Vaginal", "Bend her over the couch.");
	else if (pc.lust() < 33) addDisabledButton(btnSlot++, "Vaginal", "Vaginal", "You’re not turned on enough for this.");
	else addDisabledButton(btnSlot++, "Vaginal", "Vaginal", "You need a cock to give her a good seeing to.");

	if (pc.biggestTitSize() >= 3 && pc.lust() >= 33) addButton(btnSlot++, "BoobyRubs", bizzyBoobyRubs, fromItem, "Booby Rubs", "Aren’t boobs nice? Compare yours with hers.");
	else if (pc.lust() < 33) addDisabledButton(btnSlot++, "BoobyRubs", "Booby Rubs", "You’re not turned on enough for this.");
	else addDisabledButton(btnSlot++, "BoobyRubs", "Booby Rubs", "You need to be rockin’ a rack of your own to get down with some fat tiddy pillow squishing.");

	if (pc.hasCock())
	{
		if (pc.lust() < 33) addDisabledButton(btnSlot++, (pc.hasVagina() ? "Oral (M)" : "Oral"), (pc.hasVagina() ? "Oral (Cock)" : "Oral"), "You’re not turned on enough for this.");
		else addButton(btnSlot++, (pc.hasVagina() ? "Oral (M)" : "Oral"), bizzySexOral, [false, fromItem], (pc.hasVagina() ? "Oral (Cock)" : "Oral"), "Why own a camwhore if you can’t get a sloppy blowjob whenever you wish?");
	}
	if (pc.hasVagina())
	{
		if (pc.lust() < 33) addDisabledButton(btnSlot++, (pc.hasCock() ? "Oral (F)" : "Oral"), (pc.hasCock() ? "Oral (Vag)" : "Oral"), "You’re not turned on enough for this.");
		else addButton(btnSlot++, (pc.hasCock() ? "Oral (F)" : "Oral"), bizzySexOral, [true, fromItem], (pc.hasCock() ? "Oral (Vag)" : "Oral"), "Cats are good at licking.");
	}

	if (flags["BIZZY_PORN_STUDIO"] >= 2)
	{
		if (pc.hasCock() && pc.lust() >= 33) addButton(btnSlot++, "Titfuck", bizzyTittyFuck, fromItem, "Tittyfuck", "Use her new anatomy in the best way possible.");
		else if (pc.lust() < 33) addDisabledButton(btnSlot++, "Titfuck", "Tittyfuck", "You’re not turned on enough for this.");
		else addDisabledButton(btnSlot++, "Titfuck", "Tittyfuck", "You need a cock to slide between her succulent tits.");
	}

	if (fromItem)
	{
		addButton(14, "Leave", bizzyGoLeave);
	}
	else
	{
		addButton(14, "Back", bizzyMenu);
	}
}

public function bizzyTittyFuck(fromItem:Boolean = false):void
{
	clearOutput();
	showBizzyBust(true);

	if (flags["BIZZY_PORN_STUDIO"] == 2)
	{
		output("The sight of Bizzy’s pretty new breasts has got impatient heat coursing into your [pc.cock], the wolfish desire to have that alabaster softness plastered around your dick energizing you.");
		
		output("\n\nYou sit on the couch, open your [pc.thighs] and have the waifish kaithrit take off her clothes and sit between them. Her lips, ears and brow twitch, unsure what to think but happy to follow [pc.Mr]. Steele’s direction. She squeaks and starts when your tumescent [pc.cockNoun] slaps down on her collarbone.");
		
		output("\n\n<i>“Oh! You - you want me to do it like this?”</i>");
		
		output("\n\nShe smiles up at you shyly as she cups her pert, white boobs around your length. You murmur encouragement as you feel that lovely, soft give sandwich around your [pc.cock].");
		
		output("\n\n<i>“I’ve seen other - performers doing this,”</i> she offers. <i>“I guess I’ll - just hold them like this?”</i> She obediently holds her rack steady as you begin to pump yourself between, using the tender, plump friction to harden yourself up and then thrust yourself between those two pretty little boobs with greater and greater gusto.");
		
		output("\n\nBizzy doesn’t really know what she’s doing - either entranced by the movement or unsure of herself, she just cranes forward, cupping herself and letting you get on with it.");
		if (pc.biggestCockLength() >= 10)
		{
			output(" Her tits aren’t really big enough to do this, either: she can’t wrap her softness around you oaken, burning girth, and frankly it feels like half-assed masturbation. Still, it’s lovely to take the cute cat-girl knelt");
			if (pc.isBiped()) output(" between your legs");
			else output(" before you");
			output(" in as you do this.");
		}
		else if (pc.biggestCockLength() >= 5)
		{
			output(" Her tits aren’t quite big enough to do this properly, either: her softness doesn’t quite reach around your burning girth, and if feels a bit like sloppy masturbation. Still, it’s lovely to take the cute cat-girl knelt");
			if (pc.isBiped()) output(" between your legs");
			else output(" before you");
			output(" in as you do this.");
		}
		else
		{
			output(" Her small tits are perfect for your own modest erection though, smothering them in a wonderful sleeve of softness. Shame she doesn’t give back, but you quickly find yourself lost in the velvety rhythm of it.");
		}
		
		output("\n\nHer wide eyes travel up your [pc.chest] to your face, and you let your arousal and approval shine there. It makes her simper, tails curl up and a little shiver of delight squirm through her petite frame. Hero worship, a naturally subby nature, a succulent combination of both - whatever, she’s the perfect girl to be doing this with.");
		
		output("\n\nIt’s an expression that makes you tense up at last,");
		if (pc.balls > 0) output(" [pc.balls] throbbing,");
		output(" pump your shaft ardently between the silky give of her handfuls as you pass the point of no return, and then make her start and squeak again by spurting a lovely big load of [pc.cum] all over her face.");
		if (pc.cumQ() <= 1500) output(" You give her a nice [pc.cumColor] necklace with the next juicy clenches, then slither your spent self back down that lovely, silky valley.");
		else output("\n\n<i>“Oh - oh my,”</i> she cries, as your fruitful orgasm goes on and on, giving her entire face a good caking in [pc.cumColor] joy, before you draw back and clench out more all over the cute little fuck-pillows themselves.");
		
		output("\n\n<i>“Did you like that?”</i> Bizzy asks, hands on your [pc.legs] and looking up with a genuinely curious look on her cum-spattered face. <i>“I - I know they’re not very big, and I don’t really know how to make the most of them yet. Maybe if we keep doing it...”</i>");
		
		output("\n\nYou have to laugh, and then curl your hand around one of her pointy ears, quelling your poor, over-nervous slut’s nonsense into happy purrs. She did just fine.");
	}
	else if (flags["BIZZY_PORN_STUDIO"] == 3)
	{
		output("The sight of Bizzy’s bigger, more brazen breasts has got impatient heat coursing into your [pc.cock], the wolfish desire to have all that alabaster goodness plastered around your dick energizing you.");
		
		output("\n\nYou sit on the couch, open your [pc.thighs] and have the kaithrit take off her clothes and sit between them.");
		
		output("\n\n<i>“You want to do it - this way, do you? Of course you do,”</i> she sighs with affected exasperation, as you slap your [pc.cock] down on her collarbone. She cups her full, jiggling breasts, giving you ample opportunity to slide yourself into that lovely, soft give.");
		
		output("\n\n<i>“Do you like that?”</i> she asks, big grin on her face as you begin to pump yourself between her tits, using the tender, plump friction to harden yourself up and then thrust yourself between those two pretty little boobs with greater and greater gusto. You groan as she squeezes them together, tightness that makes you leak pre onto her white skin in appreciation.");
		
		output("\n\n<i>“You should. You got them for me, you weighed me down with all this sluttiness, all this softness, that my viewers can’t get enough of...”</i> Bizzy emphasizes her words with a lovely jiggle, her erect nipples swinging to and fro. <i>“...they belong to you. You should use them as much as you can!”</i>");
		
		output("\n\n");
		if (pc.biggestCockLength() >= 10)
		{
			output("They still aren’t quite big enough to do this though: her softness doesn’t quite reach around your burning girth, and if feels a bit like sloppy masturbation. Still, it’s lovely to take the cute cat-girl knelt");
			if (pc.isBiped()) output(" between your legs");
			else output(" before you");
			output(" in as you do this.");
		}
		else if (pc.biggestCockLength() >= 5) output("They truly are perfect for this now, smothering your [pc.cockNoun] in a wonderful sleeve of softness. Shame she doesn’t give back, but you quickly find yourself lost in the velvety rhythm of it.");
		else output("Honestly, your cute prick is lost in all of that pillowy softness, barely even poking out of her generous valley. It makes you incredibly, helplessly aroused, that sense of disappearing deep into the kaithrit’s burgeoning sexiness, and you groan as your [pc.cockNoun] shivers and tightens.");
		
		output("\n\nHer wide eyes travel up your [pc.chest] to your face, and you let your arousal and approval shine there. It makes her simper, tails curl up and a little shiver of delight squirm through her petite frame. Hero worship, a naturally subby nature, a succulent combination of both - whatever, she’s the perfect girl to be doing this with.");
		
		output("\n\nIt’s an expression that makes you tense up at last,");
		if (pc.balls > 0) output(" [pc.balls] throbbing,");
		output(" pump your shaft ardently between the silky give of her breasts as you pass the point of no return, and then make her start and squeak again by spurting a lovely big load of [pc.cum] all over her face.");
		if (pc.cumQ() <= 1500) output(" You give her a nice [pc.cumColor] necklace with the next juicy clenches, then slither your spent self back down that lovely, silky valley.");
		else output("\n\n<i>“Oh - oh my,”</i> she cries, as your fruitful orgasm goes on and on, giving her entire face a good caking in [pc.cumColor] joy, before you draw back and clench out more all over the cute little fuck-pillows themselves.");
		
		output("\n\n<i>“Did you like that?”</i> Bizzy coos, hands on your [pc.legs] and looking up with a genuinely curious look on her cum-spattered face. <i>“I’m still getting used to doing it that way. Maybe if I was little bigger...”</i> she trails off teasingly, catching a trailer of [pc.cum] off her brow and sucking her fingers dry.");
		
		output("\n\nYou curl your hand around one of her pointy ears, making happy purrs throb between your [pc.legs]. Such a good slut.");
	}
	else
	{
		output("Void, those tits... those huge, luscious melons you’ve grown out on your kept camwhore. Their bounce, their give, their plump nipples rubbing at the material of her top captivate envious, drooling thousands every single night, and they’re yours to do with as you wish. To fondle, to grab... to fuck. The thought already has you uncomfortably hard, your [pc.cock] throbbing");
		if (pc.isCrotchGarbed()) output(" in your [pc.lowerGarment] and straining for release, ");
		else output("and ");
		output("demanding action.");
		
		output("\n\n<i>“You want these, [pc.Mr]. Steele?”</i> Bizzy grins at you knowingly as she traces her curves with long sweeps of her hands, squeezing the vast softness upwards whilst poking her tongue out. <i>“You want some of this, wrapped around your cock?”</i>");
		
		output("\n\nYou are unresisting as she pushes you down onto the couch and then sinks down between your [pc.legs]");
		if (pc.isCrotchGarbed()) output(", nimble fingers undoing your [pc.lowerGarments]");
		output(". She sighs as she grips your [pc.cock], running her masterful grip up and down it. Her tits press into the bottom of the couch, presenting you with a seemingly endless, pale valley.");
		
		output("\n\n<i>“Of course you doooo,”</i> she croons, feline eyes half-lidded. <i>“Now you’ve given your kitty these huge titties... these heavy, bouncy things that feel so good... you can’t get enough of them. Who can blame you?”</i>");
		
		output("\n\nShe reaches out and lays a single rough, wet lick on the crown of your [pc.cockNoun], sending a paroxysm of joy shooting into your groin.");
		
		output("\n\n<i>“You just sit back,”</i> she whispers. She cups her tits, straightens her back and sandwiches your urgently erect cock in soft, silken magic. <i>“Let your titty kitty Bizzy take care of her sugar "+pc.mf("daddy", "momma") +", the way she knows how.”</i>");
		
		output("\n\nYou do so, leaning back and enjoying the sumptuous sight of Bizzy laying her breasts on top of your [pc.thighs] and around your [pc.cock], bouncing herself up and down, surrounding it in a velvety sleeve of shifting, boob-flesh. She knows exactly what she’s doing: picking up the pace, squeezing her plumpness inwards to make it incredibly tight, fast enough that you become giddy with the sensation... then relaxing, gently rubbing you up and down as she reaches below to fondle your");
		if (pc.balls > 0) output(" [pc.balls]");
		else output(" [pc.knot]");
		output(", a Cheshire grin plastered on her face all the while.");
		
		if (pc.biggestCockLength() >= 12)
		{
			output("\n\nYou’ve ballooned her out to be perfectly suited for your massive dick now, and it’s pleasure itself to thrust it into that deep, deep crease and feel that whorish softness completely surround you, fondle you all the way down and up.");
		
			output("\n\n<i>“Mmm...”</i> you pause for a moment, watch as she laps at the [pc.cockHead] rising out of her cleavage, slathering in worshipful attention. <i>“I love my owner’s big dick,”</i> she sighs, eyeing you as she presses her check into its veiny hardness. <i>“Fills your head with all the right ideas. Fills Bizzy with all the ways that make her moan.”</i>");
		}
		else
		{
			output("\n\nShe’s capable of completely burying your dick in herself now, your strainingly erect sex lost in the rub of her bimbo-ish cleavage, not even poking out the top.");

			output("\n\n<i>“Look at your sweet little guy...”</i> she leers at you knowingly, stopping momentarily to grasp it and give it a long lick, right up to the [pc.cockHead]. You groan and arch your back, helpless to your arousal, almost cumming right there and then in her hand. Her teasing words fill your head. <i>“The guys on my stream send me plenty of dick pics way bigger than this. I wonder what they’d think, knowing my owner packs like");
			output(pc.mf((pc.kaithritScore() >= 6 ? " a cute little kaithrit boi?" : " the cute little boi he is?"), " the cute little girl she is?"));
			output("”</i> she lowers her voice to a whisper, as she suffocates it in boob again. <i>“It’ll be our little secret.”</i>");
		}

		output("\n\nYou thrust back into her reactively as your lust climbs, [pc.cockNoun] darkening as you pump into her own heavy, jiggling bounces. She locks eyes with you, opening her mouth and extending her tongue, and fuck you can’t help but orgasm right there and then, seizing up in her cleavage and rocketing a big load of [pc.cum] all over that wonderful, slutty visage.");
		if (pc.cumQ() <= 1500) output(" You give her a nice [pc.cumColor] necklace with the next juicy clenches, then collapse back into the couch, feeling like a thoroughly wrung rag.");
		else
		{
			output("\n\nShe keeps herself nice and still as your orgasm really takes hold, and in an almost uncontrollable splurge you festoon her face, hair and outstretched tongue in [pc.cumColor] seed, giving your whore the plastering she deserves. She cups her tits, getting as much of your [pc.cum] over them as she can, and when you’ve finally throbbed your last she takes hold of your tingling, torrid prick and cleans the drooling end with luscious movements of her flat tongue and plump lips. Clean cock, cum-covered");
			if (bizzySlaveCollar()) output(" collared");
			output(" slut: the way it should be.");
		}

		output("\n\n<i>“Mmm...”</i> Bizzy trails a finger through the mess you’ve left all over her breasts, sucking it clean with a pop of her lips. <i>“I love seeing to [pc.Mr]. Steele’s");
		if (pc.biggestCockLength() < 12) output(" little");
		else output(" big");
		output("... throbbing... problems. Makes me think it’s the main reason [pc.he] visits me... the main reason [pc.he] gave me these.”</i> She sinks her hands into the endless give of her J cups.");

		output("\n\nOf course it was. You curl your hand around one of her pointy ears, get at that particular spot which almost makes her get on her side and arch her back to it. What a perfect, jiggly fuck pet she’s transformed into.");
	}

	IncrementFlag("BIZZY_TITTYFUCKED");

	processTime(25+rand(7));
	pc.orgasm();

	clearMenu();
	
	if (!fromItem)
	{
		addButton(0, "Next", bizzyMenu);
	}
	else
	{
		addButton(0, "Next", bizzyGoLeave);
	}
}

public function bizzyBoobyRubs(fromItem:Boolean = false):void
{
	clearOutput();
	showBizzyBust(true);

	output("Bizzy watches, green marble eyes shifting from your face to your [pc.chest], as you ");
	if (pc.isChestCovered()) output(" take off your [pc.upperGarments] with deliberate slowness, giving your jumper bunnies ample opportunity to shift and heave and finally come loose.");
	else output(" shift your hands up to your bare breasts, cupping them with a happy sigh.");

	output("\n\nThe kaithrit");
	if (flags["BIZZY_PORN_STUDIO"] <= 2) output(" bites her lip");
	else output(" leers at you, already anticipating what you’re going to do");
	output(", leaning back onto the couch and letting you clamber on top of her, divesting her of her top");
	if (flags["BIZZY_PORN_STUDIO"] == 1) output(", revealing her flat chest");
	else if (flags["BIZZY_PORN_STUDIO"] <= 4) output(" letting her nice, full breasts spill forth");
	else output(" releasing her huge, porno star assets in all their jiggling glory");
	output(". You lay your own [pc.chest] on top of her with a teasing smile, resting there for just a moment.");

	if (flags["BIZZY_PORN_STUDIO"] == 1)
	{
		output("\n\n<i>“They’re sooo pretty!”</i> Bizzy bursts out. She blushes hotly, but carries on a moment later, avaricious eyes glued to your boobs. <i>“You must get so much attention. Not that you need it, when you’re so rich, and glamorous, and hot anyway... I </i>hate<i> being mistaken for a boy,”</i> she finishes in a resentful mumble.");
		
		output("\n\nYou lay a soothing kiss on her cheek, then cup your [pc.boobs] and rub them back and forth across her mosquito bites. Your [pc.nipples] brush over her own small nips, quickly making them erect. The pale kaithrit breathes shallowly, entranced by the sensual movement.");
		
		output("\n\n<i>“Maybe I’ll rub some of my magic into you, hmm?”</i> you say, in a sultry voice. Mmm... pleasure is spreading over your boobies, warmth that blooms deep into your softness");
		if (pc.canLactate())
		{
			output(" and makes you drip [pc.milk] from your teats, moistening Bizzy’s own front, letting you spread the [pc.milkColor] across her with the paintbrush of your [pc.skin]");
		}
		output(". <i>“Maybe if you’re really good, and want it hard enough... and be extra slutty on camera for Momma Steele... you’ll grow breasts that are even bigger.”</i>");
		
			output("\n\n<i>“I want that,”</i> Bizzy says in a low, stoned voice. She groans, long and droning, as you smush your [pc.chest] into her, dominating her thin front with your feminine plushness. <i>“I want that soooo bad.”</i>");
			if (pc.hasLipples()) output(" Your tender nipple lips catch and suck at her tiny nipples of their own accord, making her writhe with pleasure.");
		
			output("\n\nYou play with the kaithrit for a little while longer, enjoying the subspace spell you’ve set on her with the hypnotic power of your [pc.chest], murmuring how important it is that she’s obedient and works her ass hard for you, all the treats that will be hers if she does. A probing hand downstairs reveals she’s extremely wet. You finger her a little as you continue to pleasure your breasts on top of her.");
		
		output("\n\n<i>“Ohh...”</i> she moans, an ecstatic squirm making her start a little out of her trance. Her hands find your [pc.chest], squeeze you enviously. <i>“You’ll get me some boob enhancers soon right, [pc.Mr]. Steele? I want... I want to be just like you!”</i>");
		
		output("\n\nYou bring your damp fingers up, make her lick her own excitement off them, before releasing her from your suffocating softness. Maybe. If she’s <i>good</i>.");
	}
	else if (flags["BIZZY_PORN_STUDIO"] == 2)
	{
		output("\n\nBizzy is in love with her new accoutrements, and she blushes with sheer delight when you mold your own [pc.chest] into hers, playing with them, pleasuring them by sweeping them over and into each other. Her cute little nipples, painfully erect, dig into your plushness.");
		
		output("\n\n");
		if (pc.biggestTitSize() < 5) output("<i>“They’re the same size,”</i> Bizzy observes, holding hers steady so you can go to town on them. Greed, green and monstrous, flares in her eyes. <i>“I want mine to be bigger. I’m the porn star, after all...”</i>");
		else output("<i>“Yours are way better than mine,”</i> she mumbles, holding her pretty C cups steady so you can go to town on them. <i>“No question who would be getting all the attention, if we went out together.”</i> Lusty, green greed flares in her eyes, glued to your [pc.chest]. <i>“I want mine to be the same size. I want to be just like you!”</i>");

		output("\n\nListen to your pussy cat mew! You shush her with your assured, soothing voice, telling her if she’s good you’ll make her tits even bigger. She just has to be a good, obedient slut... put it all out there for you... shake that ass and make plenty of money for Momma Steele... you rub your boobs back and forth over hers all the while, entrancing her with the sensual movement");
		if (pc.isLactating()) output(", made even more juicy as [pc.milk] beads from your [pc.nipples] and oils your soft, conjoined flesh");
		output(".");
		
		output("\n\n<i>“I want that,”</i> Bizzy says in a low, stoned voice. She groans, long and droning, as you smush your [pc.chest] into her, dominating her with your own feminine plushness. <i>“I want that soooo bad.”</i>");
		if (pc.hasLipples()) output(" Your tender nipple lips catch and suck at her tiny nipples of their own accord, making her writhe with pleasure.");
		
		output("\n\nYou play with the kaithrit for a little while longer, enjoying the subspace you’ve put her into with the hypnotic power of your [pc.chest], murmuring how important it is that she’s obedient and works hard for you, all the treats that will be hers if she does. A probing hand downstairs reveals she’s extremely wet. You finger her a little as you continue to pleasure your breasts on top of her.");
		
		output("\n\n<i>“Ohh...”</i> she moans, a spasm of ecstasy making her start a little out of her trance. Her hands find your [pc.chest], squeeze you enviously. <i>“You’ll get me some more boob enhancers soon right, [pc.Mr]. Steele? I want... I want to be");
		if (pc.biggestTitSize() > 7) output(" just like you");
		else output(" sooo much bigger");
		output("!”</i>");
		
		output("\n\nYou bring your damp fingers up, make her lick her own excitement off them, before releasing her from your suffocating softness. Maybe. If she’s <i>good</i>.");
	}
	else 
	{
		if (flags["BIZZY_PORN_STUDIO"] == 3)
		{
			if (pc.biggestTitSize() < 5)
			{
				output("<i>“You’re so petite, darling,”</i> Bizzy coos, gripping her larger breasts and swaddling you in their incredibly plush give. <i>“Are you hoping some of the Bizzy magic rubs back on you?”</i> she smirks, emerald fire smoldering in her eyes. <i>“Are you hoping you might get a wonderful pair of knockers like this just by feeling them?”</i>");
			}
			else
			{
				output("<i>“Look at this,”</i> Bizzy says with a delighted, infectious giggle as you shift your tits over hers. It is pretty ridiculous: there’s acres and acres of plush, quaking boob-flesh, a rolling queendom of softness, when the pair of you are smushed together like this. <i>“Imagine how much people would pay to see this happen! You ever think about that?”</i> Her hand has found its way between your [pc.thighs],");
				if (pc.hasCock()) output(" curling along the underside of your [pc.cock]");
				else output(" sinking into your mound to flick at your [pc.clit]");
				output(". <i>“Do a little double feature on the show sometime? My patrons would kill to see [pc.name] Steele getting in on the action...”</i>");
			}
		}
		else if (pc.biggestTitSize() < 25)
		{
			output("<i>“You’re so petite, darling,”</i> Bizzy coos, gripping her larger breasts and swaddling you in their incredibly plush give. <i>“Are you hoping some of the Bizzy magic rubs back on you?”</i> she smirks, emerald fire smoldering in her eyes. <i>“Are you hoping you might get a wonderful pair of knockers like this just by feeling them?”</i>");
		}
		else
		{
			output("<i>“Look at this,”</i> Bizzy says with a delighted, infectious giggle as you shift your tits over hers. It is pretty ridiculous: there’s acres and acres of plush, quaking boob-flesh, a rolling queendom of softness, when the pair of you are smushed together like this. <i>“Imagine how much people would pay to see this happen! You ever think about that?”</i> Her hand has found its way between your [pc.thighs],");
			if (pc.hasCock()) output(" curling along the underside of your [pc.cock]");
			else output(" sinking into your mound to flick at your [pc.clit]");
			output(". <i>“Do a little double feature on the show sometime? My patrons would kill to see [pc.name] Steele getting in on the action...”</i>");
		}

		output("\n\nHer confidence, and sexuality, has ballooned in step with her breasts; you can hardly believe the shy kaithrit waif you once knew is this buxom strumpet beneath you, doing her best to tease and provoke you.");
		
		output("\n\nStill, you can get inside her head. Your response is to smile knowingly and move your [pc.chest] over hers, spreading tactile pleasure over your boobies, warmth that blooms deep into your softness");
		if (pc.isLactating()) output(" and makes you drip [pc.milk] from your teats, moistening Bizzy’s own front, letting you spread the [pc.milkColor] across her with the paintbrush of your [pc.skin]");
		output(".");
		
		output("\n\nBizzy’s pupils dilate as you do it, her lush lips parting. Her tits are so sensitive despite their largeness, and you know how much she enjoys you pleasuring them. You finger her as your [pc.nipples] pass over her own large, thick teats, miring your fingers deep into her soaked tunnel, and you murmur that you love hearing her meow, but she must always remember who owns her ass, and who gave her those wonderful big titties, and how important it is she’s good and obedient and works hard. Good, obedient sluts get treats, like... this.");
		
		output("\n\nYou flick your fingers into that particular spot, and she moans and trembles deliciously in orgasm, boob-flesh quaking into you.");
		
		output("\n\n<i>“You’re gonna make them bigger, right?”</i> she mumbles, in a slightly stoned voice, watching you slowly disentangle yourself from her. <i>“I want to be the biggest... the best titty kitty on the extranet.”</i>");
		
		output("\n\nIt’s a very tempting thought.");

	}

	pc.lust(45);

	IncrementFlag("BIZZY_BOOBY_RUBBED");

	clearMenu();
	
	if (!fromItem)
	{
		addButton(0, "Next", bizzyMenu);
	}
	else
	{
		addButton(0, "Next", bizzyGoLeave);
	}
}

public function bizzySexOral(opts:Array):void
{
	var isVag:Boolean = opts[0];
	var fromItem:Boolean = opts[1];
	
	clearOutput();
	showBizzyBust(true);

	if (isVag == false)
	{
		output("You open your [pc.thighs] a little, and with a smile tell Bizzy to do what she’s good at.");

		output("\n\n<i>“I’m good at a lot of things, [pc.Mr]. Steele,”</i> the kaithrit murmurs, emerald eyes flicking down to your crotch. <i>“You’re gonna have to be more specific.”</i>");
		
		output("\n\nAbout thirty seconds later you’re leaning back into the couch");
		if (pc.isCrotchGarbed()) output(", [pc.lowerGarments] loosened");
		output(", a warm hand wrapped around the base of your [pc.cock] and a lovely, warm, wet mouth around the top.");
		
		output("\n\nBizzy’s fluffy white head bobs up and down as she sucks you with plenty of succulent noises and <i>‘mmm’</i>s, her wide green eyes drinking in your expression. When you groan your enjoyment, her tails curl upwards in clear delight.");
		if (pc.biggestCockLength() >= 12 || flags["BIZZY_PORN_STUDIO"] >= 4) output(" She doesn’t seem fazed by the size of you, her mouth stretched wide open around your hot, veiny girth and taking it to the tonsils like a champ, clearly determined to please you.");
		
		output("\n\nShe takes you nice and deep, little <i>‘ulp’</i> sounds leaving her opened lips as");
		if (pc.biggestCockLength() <= 12) output(" all");
		else output(" a good portion");
		output(" of your [pc.cock] is kneaded by hot, silky mouth.");
		if (pc.balls > 0 && flags["BIZZY_PORN_STUDIO"] >= 3) output(" She even remembers to stroke and fondle your [pc.balls] as she does it.");
		output(" Good girl! You reward her with a scritch behind one of those pointy ears, which sends a purr trembling right back through you.");
		
		var cumQ:Number = pc.cumQ();
		output("\n\nYou grasp handfuls of couch and orgasm wonderfully, a lovely, rich tide of [pc.cum] rising up and then");
		if (cumQ <= 1500) output(" throbbing");
		else output(" flooding");
		output(" into her mouth.");
		if (cumQ <= 1500) output(" She performs her cocksucking duties wonderfully, throat working as she swallows most of it and then pulls out so that you can glaze her face with the rest.");
		else
		{
			if (flags["BIZZY_PORN_STUDIO"] <= 2) output(" Her cheeks bulge and then she coughs and splutters a lot of it onto the floor, clearly not anticipating a Steele-sized load. Still, she does her best, quickly fastening herself back onto your throbbing cock and swallowing down some of it, before pulling out and letting you glaze her face and hair with the rest.");
			else output(" She’s fully trained for a Steele-sized load. Her throat works gallantly as she swallows down mouthful after mouthful of [pc.cumFlavor] treat, her trim belly taking on a definitive curve. She’s not going to need any lunch today! Then she withdraws and presents her ample tits, open mouth and closed eyes to you, presenting you with plenty of enjoyable targets to paint [pc.cumColor] with one juicy clench after another. She’s utterly festooned in it by the time you’re done.");
		}
		
		output("\n\n<i>“More of the business delivered by Bizzy,”</i> she says, with a winning, [pc.cumColor]-dripping smile up at you. <i>“Did you like that, [pc.Mr]. Steele?”</i>");
		
		output("\n\nYou answer that by giving her another scritch behind the ear, making her bend her head into your hand and purr.");

		IncrementFlag("BIZZY_SUCKED_COCK");
	}
	else
	{
		output("You loosen your [pc.lowerGarments], expose [pc.eachVagina] to the cool air. Bizzy’s emerald eyes flick down; smirking, you ask if she’s seen something that interests her.");
		
		output("\n\n<i>“I think I might have, [pc.Mr]. Steele,”</i> she answers coquettishly. <i>“Mind if I go down there and check?”</i>");
		
		output("\n\nAbout thirty seconds later you’re leaning back into the couch");
		if (pc.isCrotchGarbed()) output(", [pc.lowerGarments] loosened");
		output(", a pair of arms wrapped around your [pc.thighs] and a lovely, wet, rough tongue hard at work between them.");
		
		output("\n\nBizzy’s fluffy white head bobs slightly as she licks your [pc.vagina] and flicks at your [pc.clit] until it’s bulging excitedly, with plenty of succulent noises and <i>‘mmm’</i>s, her wide green eyes drinking in your expression. When you groan your enjoyment, her tails curl upwards in clear delight.");
		if (pc.totalClits() > 1) output(" She doesn’t seem fazed by your exotic arrangement of pleasure buds, and gives plenty of wet, lapping attention to all of them, sending sheerest ecstasy throbbing through your groin.");
		
		output("\n\nShe goes into your tunnel nice and deep, pretty lips mashing against your soaked labia as she laps and flicks at your inner walls with her flat, rough tongue. Good girl! It seems completely natural to reward her with a scritch behind one of those pointy ears, which sends a purr trembling right through you.");
		
		output("\n\nAs your mouth opens with the sizeable orgasm coming, she sticks two fingers into your [pc.vagina] and then concentrates all of her oral efforts on your bulging clit, flicking at it furiously whilst fingering you. Oof, that’s good. You grasp handfuls of couch and oh wonderfully, rich rings of pleasure seizing up your cunt.");
		if (!pc.isSquirter() || pc.wetness() <= 3)
		{
			output(" She performs her muff-diving duties wonderfully, thirstily lapping up the [pc.femcum] which trickles out between your lavish lips, shining them clean.");
		}
		else if (flags["BIZZY_PORN_STUDIO"] <= 2)
		{
			output(" She’s clearly not anticipating a Steele-sized orgasm, spluttering as she gets a massive gush of [pc.femcum] up her nose. Still, she does her best, quickly fastening herself back onto your cunt and drinking down some of it, before pulling back and letting you drool the rest of it over her face.");
		}
		else
		{
			output(" She’s trained for your juiced-up anatomy, these days. She lets the first massive gush of [pc.femcum] warm her face, marking her with your scent, before she fastens herself back onto your throbbing cunt and drinks the cascade of [pc.femCumFlavor] down, throat working gallantly. She’s not going to need any tea for a while, that’s for damn sure.");
		}
		
		output("\n\n<i>“More of the business delivered by Bizzy,”</i> she says at last, with a winning, [pc.femcum]-smeared smile up at you. <i>“Did you like that, [pc.Mr]. Steele?”</i>");
		
		output("\n\nYou look down at her, your steaming pussy still in her face, simmering with post-coital satisfaction. Yeah, that deserves another ear scritch. Your pet muff-diver bends her head into your hand, purring as you get at <i>that</i> particular spot.");

		IncrementFlag("BIZZY_ATE_PUSSY");
	}

	processTime(15+rand(3));
	pc.orgasm();

	clearMenu();
	
	if (!fromItem)
	{
		addButton(0, "Next", bizzyMenu);
	}
	else
	{
		addButton(0, "Next", bizzyGoLeave);
	}
}

public function bizzySexVaginal(fromItem:Boolean = false):void
{
	clearOutput();
	showBizzyBust(true);

	var cumQ:Number = pc.cumQ();
	
	if (flags["BIZZY_PORN_STUDIO"] <= 2)
	{
		output("You let her see the devilish fire in your face before you grab her, molding your hand into a denim-clad buttock and laying your [pc.lips] on her pale neck.");

		output("\n\n<i>“Oo-ooh, [pc.Mr]. Steele!”</i> the kaithrit quavers, responding a moment later by quickly shucking off her faded jeans so that you can better explore and fondle her lithe, feminine form, tracing the line of her pussy through her plain white panties. The soft give of it, the alluring wetness you can feel through the thin fabric, sends urge pulsing urgently down to your [pc.groin]");
		if (pc.isCrotchGarbed()) output(", and you quickly rid yourself of your [pc.lowerGarments] yourself");
		output(". A small hand wraps itself around your [pc.cock], and you growl encouragement as it shifts up and down, concentrating that urge into hard, red-hot purpose.");

		output("\n\nBizzy shivers under your touch, her wide green eyes fixed on your face, lips gently parted, seemingly enthralled by you. It’s clear she expects the great, dauntless entrepreneur [pc.Mr]. Steele to take charge here - so that’s exactly what you do. She gasps and squeals as you flip her over, bending her over the couch so her");
		if (flags["BIZZY_PORN_STUDIO"] == 1) output(" flat front bumps");
		else output(" perky breasts pool");
		output(" onto the cushions and her butt sticks up into the air. You take a few moments to admire it, stroking her soft curves as you line your [pc.cock] up with her wet, slightly parted cooch. It’s a lovely, cute, bubble-shape ass, made for exactly this purpose: a cushion for you to give it to her royally from behind.");

		output("\n\n<i>“You like that, [pc.Mr]. Steele?”</i> she purrs, tails curling into the air. <i>“My fans sure doo-ooo...”</i> she trails off into a meowing moan as you thrust your [pc.cock] into her, pushing her trim lips aside so that you can spear into her wet, warm innards. It’s wonderfully spry and eager, practically sucking at your [pc.cockHead] as you mire yourself in deeper.");
		if (pc.biggestCockLength() < 10) output(" You’re the perfect size for a fairly petite pussy cat like her, and soon you are smoothly boring your way in and out, groaning softly at the wonderful, silken pull.");
		else if (pc.biggestCockLength() >= 10)
		{
			output(" The petite pussy cat hisses as you stretch her out with your massive cock, ears flattening and claws sinking into the couch, and you halt, worried about hurting her."); 

			output("\n\n<i>“No,”</i> she groans urgently. <i>“I gotta get used to - big i-insertions. For my show and - for you...”</i>");

			output("\n\nBizzy bucks back into you, urging you on, and you do so slowly, keeping a tight grip on your urge as you gently rock against her, making sure she can take you before sinking in another hot, girthy inch. She’s gloving a fair amount of you by the end, yowling her pride at the ceiling, arching her back to the intense sensation.");
		}

		output("\n\nClear juices drool down your");
		if (pc.balls > 0) output(" [pc.balls]");
		else output(" [pc.legs]");
		output(" as you become lost in the sumptuous rhythm of it, slapping your [pc.thighs] against the pale, gently shaking butt of your pet camwhore. Lust fizzes up your [pc.cockNoun] as you make her orgasm, arching her slim back and meowing your name, the name of her owner as her cunt trembles and juices itself around you.");

		output("\n\nYou seize the jubilance of the moment to bull rush orgasm yourself, your");
		if (pc.balls > 0) output(" [pc.balls]");
		else output(" [pc.cock]");
		output(" seizing up and then pulsing thick surges of cum into her, delivering by one ardent thrust of your [pc.hips] after another. Bizzy coos with joy, mouth open and savoring it, as you");
		if (cumQ <= 1500) output(" fill her with [pc.cum]");
		else output(" plump out her belly with another hefty delivery of [pc.cum], soon spurting and spewing out from her thoroughly packed cunt all over the couch");
		output(".");

		output("\n\nYou relax against her when you’re done, feeling gently steamed, stroking her silky hair and fondling her");
		if (flags["BIZZY_PORN_STUDIO"] == 1) output(" flat chest");
		else output(" pert C cups");
		output(".");

		output("\n\n<i>“I - I love it when you do me like that, [pc.Mr]. Steele,”</i> she says, turning dilated, bedroom eyes on you as she shifts herself around. <i>“So </i>forceful<i>.”</i>");
		if (cumQ > 1500) output(" You share a laugh as a tide of [pc.cum] oozes out of her creamed pussy. <i>“I knew it was a good idea to get furniture that was easy wipe.”</i>");
	}
	else
	{
		output("You let her see the devilish fire in your face before you grab her, molding your hand into a");
		if (flags["BIZZY_PORN_STUDIO"] < 4) output(" denim-clad");
		else output(" nylon-clad");
		output(" buttock and laying your [pc.lips] on her pale neck.");

		output("\n\n<i>“You want some Bizzy, do you [pc.Mr]. Steele?”</i> she purrs into your ear, thigh rubbing up against yours, breasts swelling into your [pc.chest]. <i>“Of course you do. You can’t get enough of it....”</i>");

		output("\n\nThe well-practised kaithrit’s doing her sultry femme fatale thing, but she can’t disguise the eagerness in her eyes, the pulse quickening in her veins that you can feel beneath your [pc.lips] when you hungrily kiss her neck and trace her clavicle with your [pc.tongue]. Nor can she help the wetness, the soft give you can feel when you push your hand between her thighs, finger her through the thin fabric. A small hand finds its way");
		if (pc.isCrotchGarbed()) output(" through your [pc.lowerGarments");
		output(" to your [pc.cock], and you groan as she masturbates you, shifting fluidly between tight and vigorous one moment, soft and teasing the next. Void, she’s gotten so good at that.");

		output("\n\nShe squeals in delight when you flip her over, bending that lovely pale behind of hers over the couch. It’s the perfect way of doing the feline whore - not only you can you admire her lovely fat ass, grown wide, soft and wonderfully round from the concentrated female hormones you’ve pumped into her");
		if (bizzySlaveTat()) output(" with your tattoo prominently planted on one cheek");
		output(", but it causes her boobs to pool onto the cushions, ready for you to grab and use as handholds.");
		if (flags["BIZZY_PORN_STUDIO"] >= 4) output(" They’re so big she can rest on top of them, hands on their soft crests and head turned, giving you the eyes.");

		output("\n\nYou tease Bizzy for a little while, finger finding and circling her clit until it’s bulging needily beneath your touch, sliding your other hand up her hourglass sides to fondle her tits, knitting your hand into hers and using her own petite fingers to pull at her");
		if (flags["BIZZY_PORN_STUDIO"] < 4) output(" plump");
		else output(" huge");
		output(" nipples, until her sighs and coos have transformed into mewls of real need, femcum dampening your busy fingers.");

		output("\n\n<i>“Ohh, put it in, [pc.Mr]. Steele,”</i> she pleads, arching her back,");
		if (bizzySlaveCollar()) output(" displaying her collar just so,");
		output(" breasts heaving wonderfully. <i>“Your pet wants it so bad... ohhhhhh...”</i> It’s a sound of pure, slutty perfection, produced by finally positioning your [pc.cock] against her over-stimulated hole and pushing into her silky innards, precipitating a clear, warm welter of kaithrit juices down her thighs.");
		
		output("\n\nYou rock into her slowly for a few moments, just enjoying the simmering sumptuousness of her plump, soaking cunt around your [pc.cockNoun]. Bizzy’s sex is highly practised these days though, and almost immediately she’s bucking her ass back into you, impatient to be really taken for a ride. You happily acquiesce, gripping her by her ample tits and thrusting yourself roughly into her, beating out a filthy, squelching rhythm against her wobbling backside.");
		
		output("\n\n<i>“That’s it, [pc.Mr]. Steele!”</i> she yowls merrily. <i>“Give it to me hard! Oh, I’m your");
		if (bizzySlaveCollar()) output(" collared");
		output(" pet! I’m your toy! I’m your slut! I love it so much!”</i>");

		if (pc.biggestCockLength() < 10) output("\n\nYou suspect that she’s putting a lot of this on, performer that she is - anyone who’s watched her show will know the kaithrit is very used to large insertions these days, and frankly your [pc.cock] is barely touching the sides. Still, she clearly thrills from getting you off, so where’s the harm?");
		else output("\n\nYou groan with pleasure. She’s been practising - as anyone who’s watched her show will attest - and now she can take your massive dick with aplomb. It’s tight and wet and you can <i>fit so much in</i>, and what’s more it clearly causes Bizzy paroxysms of joy, writhing and shivering around you with unaffected glee.");

		output("\n\nClear juices drool down your");
		if (pc.balls > 0) output(" [pc.balls]");
		else output(" [pc.legs]");
		output(" as you lose yourself in the rhythm of it, slapping your [pc.thighs] against the pale, wobbling butt of your pet camwhore.");
		if (bizzySlaveTat()) output(" That tattoo is such a tempting target. The fleshy sound coupled with the cooing meow you draw out of her by giving it a hefty smack is so delicious, you can’t help but do it again. It looks even better with your reddened handprint over it.");
		
		output("\n\nYour orgasm is one of those that seems to electrify your whole body, galvanized by Bizzy’s enthralling tactility and histrionics. Nerve endings in your [pc.feet] tingle as you seize her hips and rocket [pc.cum] into the fever dream of her cunt, your");
		if (pc.balls > 0) output(" [pc.balls]");
		else output(" [pc.cock]");
		output(" seizing up, filling her up with [pc.cumColor] seed with one ardent thrust of your [pc.hips] after another.");
		
		output("\n\nEven now Bizzy gives back expertly, milking your [pc.cockNoun] with perfect little jounces of her hip, craning her pussy back along your throbbing shaft.");
		if(cumQ > 1500) output(" She keeps doing it even when her belly is swollen out with your massive load, raining out from her thoroughly packed cunt all over the couch.");
		
		output("\n\nYou relax against her when you’re done, feeling gently steamed, stroking her silky hair and fondling her");
		if (flags["BIZZY_PORN_STUDIO"] < 4) output(" double Ds");
		else output(" massive, pillowy boobs");
		output(".");
		
		output("\n\n<i>“Aren’t I good, [pc.Mr]. Steele?”</i> she purrs, dilated, bedroom eyes on you as she fondles you back. <i>“So good you can barely think of anything but doing me, when I’m around.”</i> She bites her lip");
		if (cumQ > 1500) output(", and sighs huskily as [pc.cum] oozes heavily out of her utterly stuffed pussy");
		output(". <i>“Just the way I want it.”</i>");
	}
	
	IncrementFlag("BIZZY_VAG_FUCKED");
	flags["BIZZY_SEEN_NAKED"] = 1;

	processTime(20+rand(7));
	pc.orgasm();

	clearMenu();
	
	if (!fromItem)
	{
		addButton(0, "Next", bizzyMenu);
	}
	else
	{
		addButton(0, "Next", bizzyGoLeave);
	}
}

/* Stage 5 */
public function bizzyStage5():void
{
	clearOutput();
	showBizzyBust();

	if (flags["BIZZY_CONSTRUCTION_COMPLETE"] == undefined)
	{
		output("The construction work is finished. Apartment 156 looks pretty much the same as it always did - except its synth plastic frontage, as well as the two on the other side, have been given a clean and polish. Once you head up there, you find there’s also plaque above the door that reads ‘[pornStudioName]’. DO NOT DISTURB. Inquiries to extrasite’.");
		
		output("\n\nTwo claw-tipped hands grab hold of your arm and haul you inside as soon as you press the bell.");
		
		output("\n\n<i>“I’ve been waiting for you, [pc.Mr]. Steele,”</i> grins Bizzy, as if that wasn’t abundantly obvious. <i>“Lemme show you around!”</i>");
		
		output("\n\nThe space has been transformed. The living area has been expanded out into 155 to become a wide, open space filled with tasteful (but easily cleaned) furniture, all in the black and cream color scheme Bizzy has maintained from the beginning. She shows you how some of the furniture is modular and modifiable by VI, so an armchair can become a desk can become a table with an order. This deliberately plain, lighting-friendly space can quickly transform into many different types of setting imaginable, in other words.");
		
		output("\n\nBizzy’s former bedroom has been turned into an editing suite, with all of her screens and processing units spread across two desks. Her bedroom is now pretty much the entirety of 157, and... wow.");
		
		output("\n\nYou wander around the woozy space, with its many small beam lights, ready to create any atmosphere or capture any angle you’d care to think of. There’s a small sauna, bubbling away in one corner. Understated wardrobes roll open to reveal a glittering array of costumes and toys. Bizzy hurls herself on the huge, round, crimson-sheeted bed and clicks a remote. Immediately the walls and floor transform; you are now in the middle of a jungle, steaming, green and close. You carefully move your [pc.feet] through the plants, admiring the work of the holograph generators.");
		
		output("\n\n<i>“Not bad, right?”</i> the big-boobed kaithrit grins, switching the illusion off and putting the house lights on.");
		if (bizzySlaveCollar()) output(" The bright light catches her new steel collar, slim and tight about her neck with a tempting little leash-hasp at the front. Seeing you look, she toys with it.");
		output(" <i>“We’ve got everything we need to make [pornStudioName] a success. We’ve got a studio engineer lined up, and Kanette’s gonna be coming in soon, and - I’ve already got some great stuff laid down!”</i> she giggles. <i>“So to speak.”</i>");
		
		output("\n\nShe walks her fingers along the sheets.");
		
		output("\n\n<i>“Nobody here right now, though. Want your titty kitty slave to properly thank you for everything you’ve done for her?”</i> She licks her lips. <i>“She wants to. Badly.”</i>");

		flags["BIZZY_CONSTRUCTION_COMPLETE"] = 1;
	}
	else
	{
		output("<i>“Hiiiiiiiii,”</i> coos Bizzy as she lets you in. <i>“Make yourself at home. I’m just finishing up some editing.”</i>");
		
		output("\n\nThe white-haired vision clacks off on her six inch high heels towards the editing suite whilst you head into the spacious living area. Every time you’re in the cream-and-mahogany space it’s changed subtly: the lay-out or some piece of furniture has been altered, for some scene Bizzy, her crew and her ‘friends’ have been shooting. There’s nobody here now though, and Bizzy is at pains to clean up afterwards, which can be a substantial operation.");
		
		output("\n\nOnce you’ve made yourself the traditional cup of Roshan tea (you’ve watched her enough times to know exactly how to pinch the leaves and when to sprinkle), you head into the editing suite, the nerve centre of [pornStudioName]. Bizzy’s tapping away at an interface, manipulating a shot of her taking a heavy load of cum to her upturned, open-mouthed face so that it almost looks like a thing of art.");
		
		output("\n\n<i>“Getting ideas?”</i> she smiles mischievously, turning the screen off when she sees you standing there. <i>“Is that what’s brought you down to [pornStudioName] today, [pc.Mr]. Steele?”</i>");
	}
	
	moveTo("BIZZY STUDIO ROOM");

	bizzyStage5Menu();
}

public function bizzyStage5Menu():void
{
	clearMenu();
	addButton(0, "Appearance", bizzyStage5Appearance);
	addButton(1, "Camshow", bizzyStage5Camshow);
	addDisabledButton(2, "Talk");
	addButton(3, "Breasts", bizzyStage5Breasts, undefined, "Breasts", "The most important subject of all.");
	if (pc.lust() >= 33) addButton(4, "Sex", bizzySexMenu);
	else addDisabledButton(4, "Sex", "Sex", "You’re not turned on enough to really get the most out of your personal big titty kitty.");
	addButton(14, "Leave", bizzyGoLeave);
}

public function bizzyStage5Camshow():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“You want a look behind the scenes at [pornStudioName], do you? Well... I dunno,”</i> Bizzy teases. <i>“We usually ask a little extra for that.”</i>");
	
	output("\n\nShe’s dying to show you how they’ve been doing, really. Bizzy’s Business is now one of Bitch.tv’s thousand most viewed accounts, regularly featuring on the front page. Squeezing herself into your side with a laptop, the feline seductress herself takes you through the white-furred portal and shows you around: The stripteases and holo-enhanced dances designed to entice the casual viewer into subscribing and accessing the good stuff. The fantastical shows that place Bizzy in utopian palaces, enchanted forests, deep, sexy dungeons. The long streams where Bizzy goes impromptu, taking suggestions from viewers, playing music and games with her friends that get increasingly lewder as they go on. The straight up, hardcore porn.");
	
	output("\n\n<i>“Heeey everyone,”</i> says Kanette, her gothic gryvain friend on the most recent show. The camera is focused on her pretty, black-and-white face, slowly zooming out. <i>“Welcome to Bizzy’s Business. Bizzy’d be here to welcome you herself, but she’s - uh - busy.”</i>");
	
	output("\n\nShe bites her lips and sighs as the camera zooms out further, revealing her naked front, her pear-shaped, black-nippled D cups, trembling ever so slightly.");
	
	output("\n\n<i>“I just came in you see and Bizzy - being the kind of girl she is - couldn’t help herself. Could you, girl?”</i>");
	
	output("\n\nThere’s a slurp and a <i>‘mmm’</i>. The camera crests over Bizzy’s big, pale backside, in the air");
	if (bizzySlaveTat()) output(" with your tattoo wonderfully prominent");
	output(", her white-haired head bobbing busily over Kanette’s crotch.");
	
	output("\n\n<i>“Poor thing’s just addicted to choking on dragon dick,”</i> the gryvain says, hand around Bizzy’s head, giving the camera dry, exasperated smirk. <i>“What can I say? Stick around though, we’ve - uff - got a great show lined up for you.”</i>");
	
	output("\n\nAlthough she stars in everything and has her own part-timing producer these days, Bizzy clearly has a hand in the editing and the camera work. As you watch the video, getting uncomfortably");
	if (!pc.hasCock()) output(" wet");
	else if (!pc.hasVagina()) output(" hard");
	else output(" wet and hard");
	output(" as it gets hotter and heavier, ropes and vibes and oil and a lithe, big-dicked kalabast becoming energetically involved, Bizzy is at pains to point out all the little tricks and techniques she’s used so that everything is caught at <i>just</i> the right light and angle, what might have been a fairly standard piece of porn elevated into something incredibly alluring by the time she’s put into programming her drones and instructing her droid cameraman.");
	
	output("\n\nYou proverbially hold your nose and check the comments section. There are those, of course, who are upset she’s no longer the adorable amateur she once was. That she has, quite literally, sold herself out to a porn producer");
	if (bizzySlaveEither())
	{
		output("( - the evidence is right there");
		if (!bizzySlaveTat()) output(" around her neck");
		else if (!bizzySlaveCollar()) output(" on her butt");
		else output(" around her neck and on her butt");
		output(")");
	}
	output(". Those voices are heavily outnumbered by the ones telling her just how many times they’ve cummed to her videos, how sexy she is, the other pornstars she should collaborate with, the money and bits they’re throwing at her to keep her shows going as long as possible.");
	
	output("\n\nBizzy’s Business has over a billion subscribers; the population of a small planet fap themselves silly watching the kitty cat whore for her "+ pc.mf("master", "mistress") +" almost every night. She is, by any definition, a star of the camwhoring scene. You tell her as much.");
	
	output("\n\n<i>“Yeah...”</i> she simpers with pride. <i>“...I know.”</i> She sighs. <i>“Still can’t help but think we couldn’t go even higher, though.”</i>");

	bizzyStage5Menu();
	addDisabledButton(1, "Camshow");

}

public function bizzyStage5Appearance():void
{
	clearOutput();
	showBizzyBust();

	output("The well-known porn star Bezeneria d’Alysio, or Bizzy as she prefers to be known, is a 5\' 7\" kaithrit female. She has full white hair that reaches down to her back, and the fur on her pointy ears and two long tails is similarly white shot through with tendrils of black. She has green, cat-like eyes set in a peachy, luminous bloom of facial beauty wrought by the concentrated female hormones you’ve repeatedly dosed her with. She has plush, full lips and the cute, upturned nose - a bona fide stunner.");
	
	output("\n\nWith sexuality, beauty and their constant display to millions of drooling viewers has come confidence. The performance has completely eaten the performer, and the kitty cat is relaxed, smirking, exaggeratedly sensual, a sex pot that’s always ready to please and show herself off.");
	
	output("\n\nShe’s gotten herself a tight, thigh-length skirt, whorish six-inch heels and a low-cut black top with short, puffy sleeves, all to show off her assets to their best advantage. Her breasts are J cups at a guess, huge, swollen mountains of soft, pale flesh that completely dominate her form.");
	if (bizzySlaveCollar()) output(" She has an elegant steel collar around her neck, displaying her owned status. It has a hasp at the front, should you ever fancy taking her out on a leash and showing her off. Or if you just need something to hold onto when you’re fucking her.");
	
	output("\n\nHer nipples are thumb-sized, standing clear to see underneath her top when she’s aroused - which is usually. Her wide thighs billow out into a round plump bottom, above which her tails sprout. Her heels and top-heaviness force her to walk in a slow, swaying, sensual fashion, something she clearly delights in.");
	if (bizzySlaveTat()) output(" On one of her buttocks is tattoed the [pornStudioName] logo, an excellent, permanent reminder to her and her viewers who owns this sumptuous piece of ass.");
	
	if (flags["BIZZY_SEEN_NAKED"] != undefined) output("\n\nUnderneath her skirt, you know she’s also abundantly female: a plump pair of lips curtain a soaking, pliant twat and protuberant clit, with a well-maintained pubic puff of white fur.");

	bizzyStage5Menu();
	addDisabledButton(0, "Appearance");
}

public function bizzyStage5Breasts():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“You want to have a feel, [pc.Mr]. Steele?”</i> She smiles, leaning forward, letting the gratuitous objects swell outwards. <i>“Of course you do. All of your hard investment... you can’t take your eyes off your lovely titty kitty, can you? Or your hands.”</i>");

	processTime(1);

	//[Fondle] [Back]
	clearMenu();
	addButton(0, "Fondle", bizzyStage5Fondle, undefined, "Fondle", "It’s your property, after all.");
	addButton(14, "Back", bizzyStage5Menu);
}

public function bizzyStage5Fondle():void
{
	clearOutput();
	showBizzyBust();

	output("She loosens her top and tent-like bra, and her breasts burst forth as if impatient with captivity. They’re massive things, watermelon-sized but chubbier and rounder still. There’s so much to take in here, so you take your time doing it - weighing them in your hands, squeezing huge handfuls, tracing her valley-like cleavage, feeling for yourself their heavenly softness and springiness. You grope her, roaming fingers finding her large nipples and gently pulling at them until they’re as thick as thumbs.");
	
	output("\n\n<i>“They’re wonderful, aren’t they,”</i> she says, happy warmth in her cheeks and eyes. <i>“Troublesome, sometimes - I do miss seeing my feet - but.... Ooh, that’s lovely, [pc.Mr]. Steele... when I feel them bounce, and play with them, and see how turned on they make my fans, I know I wouldn’t trade them for anything.”</i>");
	
	output("\n\nThey’re unmistakeable, that’s for sure, clearly marking her out as a pet bimbo, a porn star, or both");
	if (bizzySlaveCollar()) output(" - if her collar, stern and silver, didn’t already make that abundantly obvious");
	output(". You spend a little while just feeling her, rolling her cute nipples between your fingers enjoying the little sighs and mewls of pleasure you work out of your pet pussy. She’s grinning at you dopily, as if she’s just received a hefty dose of Nepeta, when you finally let her go.");

	processTime(5+rand(3));
	pc.lust(33);

	addDisabledButton(0, "Fondle");
}

/* Stage 4 */
public function bizzyStage4():void
{
	clearOutput();
	showBizzyBust();

	output("Bizzy’s smiles coyly when she opens the door to her small apartment.");
	
	output("\n\n<i>“Heeeeyyyyy,”</i> she coos, sliding her hand through her long white hair and giving you the eyes. <i>“Come to check on lil ol’ me, have you?”</i>");
	
	output("\n\nShe’s taken to wearing strappy heels and a thigh-length skirt, all the better to show off the incredible, curvy ass and massive breasts you’ve given her as she leads you into the living room.");
	
	output("\n\nThe living room has been spruced up - it’s now painted and decorated in mahogany and cream, with a fashionable but sturdy glass table and huge couch. Sensual, alluring ornaments and pictures decorate it, and you understand looking around that this is a living space that occasionally doubles as a porn set.");
	
	output("\n\nThe bedroom is now a professional set. No more bedsheets - Bizzy has purchased actual screens, and VI-controlled lamps that can swoop around and provide the best lighting at their own behest. The drones have been upgraded, sleek, tiny things that capture the best angles in definition that makes the eye ache. There’s a small studio built into one corner, four different screens all equipped for state-of-the-art editing. And there’s entire glass-fronted cabinet’s worth of sex toys now, lurid little parades of dildos, vibes, oils and exotic toys waiting to be used. It’s a very cramped space, with a clear need for more room.");
	
	output("\n\nBizzy sits you back down in her living room with a cup of Roshan tea, smoky and mildly stimulating. She lays herself down on the couch opposite, leisured, happy cat in the presence of her owner.");
	
	moveTo("BIZZY STUDIO ROOM");

	processTime(10+rand(5));

	bizzyStage4Menu();
}

public function bizzyStage4Menu():void
{
	clearMenu();
	addButton(0, "Appearance", bizzyStage4Appearance);
	addButton(1, "Camshow", bizzyStage4Camshow);
	addDisabledButton(2, "Talk");
	addButton(3, "Breasts", bizzyStage4Breasts, undefined, "Breasts", "The most important subject of all.");
	
	if (pc.lust() >= 33) addButton(4, "Sex", bizzySexMenu);
	else addDisabledButton(4, "Sex", "Sex", "You’re not turned on enough to really get the most out of your personal big titty kitty.");

	if (flags["BIZZY_SHOW_PLAN"] != undefined && flags["BIZZY_SHOW_PLAN"] == 1)
	{
		addButton(5, "Plan?", bizzyStage4TalkPlan, undefined, "Plan?", "She seems to have ideas about how to make her show even more popular. Ambitious ones.");
	}
	
	addButton(14, "Leave", bizzyGoLeave);
}

public function bizzyStage4TalkPlan():void
{
	clearOutput();
	showBizzyBust();

	output("It seems Bizzy has taken her streaming career as far as it can go, in its current set-up anyway. It’s also clear that that frustrates her. Having tasted meteoric rise, being cramped by her situation has made for a sour meal.");
	
	output("\n\n<i>“And what if my fans get bored?”</i> she says, looking at you with the wide eyes of a cat who’s not seen the foodbowl for at <i>least</i> an hour. <i>“I mean, I do my best, keeping it fresh in every way I can, but... eventually, somebody new is going to hit the scene, and this moment we’ve built to will be over.”</i>");
	
	output("\n\nAgain that insight into the quiet desperation that all professional entertainers must know. You ask her what she has in mind. Off comes the lid.");
	
	output("\n\n<i>“You buy the apartments either side of mine,”</i> she explains excitedly, striding back and forth, boobs jiggling enthrallingly. <i>“We knock them through... boom, we’ve got an actual studio! We’ll have the space to do all sort of stuff... we hire a couple of crew to help me with editing and filming... we commission some other performers to come work with us, my friend Kanette is </i>dying<i> to be taken on, she already features in my streams and is a big hit...”</i>");
	
	output("\n\n<i>“Hang on a minute, slow down,”</i> you say, passing your hand over your brow. <i>“How are we paying for all this?”</i>");
	
	output("\n\n<i>“Well, you do, of course. My sugar "+ pc.mf("daddy", "mommy") +",”</i> Bizzy coos. She clambers her warm weight onto your lap, pushing you back into the couch with the airbags that are her breasts. Her finger lands on the tip of your nose, twists there pleadingly. <i>“You’ll have to form a proper, uh, adult entertainment studio - but that’s not a problem, is it? You can make it a sub-thingy of your dad’s company. I’ve proven I’m a worthwhile investment, haven’t I? You know I’m a hard-working piece of ass, don’t you?”</i>");
	
	output("\n\n<i>“And anyway...”</i> the cat-girl shifts her curvy, skirt-clad butt over your [pc.groin]. <i>“...you can just transfer it into more debt for me to work off. So even if it all comes crashing down somehow (it won’t, [pc.Mr]. Steele! I know it won’t!) it’ll be me carrying the can for it. And you’ll get to, uh... keep the can.”</i> Rub rub, go her buttocks. <i>“This is what I want to do, [pc.name],”</i> she says, looking you dead in the eye. She seems deadly serious. <i>“This has been a dream come true for me, and I want to go on living it. You’ll let me, won’t you?”</i>");
	
	output("\n\n<i>“How much?”</i>");
	
	output("\n\n<i>“200 grand,”</i> she replies immediately. <i>“I talked to the moth guys on the comm deck again - they could sort everything out.”</i>");

	processTime(5+rand(5));

	clearMenu();
	if (pc.credits < 200000) addDisabledButton(0, "Hell Yeah", "Hell Yeah", "You’ll need 200,000 credits in order to take this step.");
	else addButton(0, "Hell Yeah", bizzyStage4PlanYeah, undefined, "Hell Yeah", "Your own porn studio starring your pet camwhore? This is the stuff dreams are made of!");
	addButton(1, "Think First", bizzyStage4PlanThink, undefined, "Think About it First", "200K bones is a lot. Enough to maybe step back and think about this before committing.");
}

public function bizzyStage4PlanYeah():void
{
	clearOutput();
	showBizzyBust();

	output("You agonize Bizzy a little bit, stroking your chin and eyeing her body, enjoying the nervous tension in her lithe limbs and tail.");

	output("\n\n<i>“Oh... what the hell,”</i> you say at last. <i>“But!”</i> you carry on, as she squeals and pulls you into a tight, booby hug, <i>“you’re gonna be working hard, alright? No slacking off now you’ll have other people working for you. I’ll be checking to make sure you’re still being as creative and slutty as you have been so far. Otherwise you’ll be paying off your debt on my ship");
	if (reahaRecruited() || seraRecruited()) output(", with all my other whores");
	output(". Understand?”</i>");
	
	output("\n\n<i>“Yes! Yes - of course, [pc.Mr]. Steele. You can count on me!”</i> The kaithrit salutes firmly, and then laughs, shaking her head. <i>“I - I can’t believe this is gonna happen. I’ve been fantasizing about it for so long... I’ll message the middle moths. There’s so much to sort out!”</i>");

	flags["BIZZY_SHOW_PLAN"] = 2;

	pc.credits -= 200000;
	processTime(55+rand(11));

	clearMenu();
	addButton(0, "Next", bizzyStage4PlanYeahII);
}

public function bizzyStage4PlanYeahII():void
{
	clearOutput();
	showBizzyBust();

	output("Attica and Teron of Sentient Acquisitions arrive at Bizzy’s apartment within the hour, all smiles, spidery handshakes and professional bonhomie. The tarratch have a lot of paperwork for you prepared - purchasing orders on the two apartments either side of Bizzy’s, application to create an adult entertainment studio subsidiary to Steele Tech, and of course a gratuitous extension on the indenturehood Bizzy signed with you previously. It’s <i>almost</i> as if Bizzy already sounded these guys out, and they had everything typed out and ready to go.");

	output("\n\nThe kaithrit barely looks at it before signing with a flourish. Teron takes you to one side whilst his sister vid-conferences Steele Tech to table the application.");

	output("\n\n<i>“May I first congratulate you?”</i> the sharply-dressed androgyne says. <i>“How you maneuvered this talented young rue collar into becoming your personal performing concubine on a permanent basis - with no drugs, or foul play of any kind...”</i>");
	if (silly) output(" *chefkiss*");
	else output(" He kisses his long fingers.");
	output(" <i>“That was right collar work, truly.”</i>");

	output("\n\nUh... sure. She really did everything herself, though.");

	// Split this up a little so I can ensure the text entry element stays near-ish the top of the screen and maintains enough space below it to show errors and such
	output("\n\n<i>“Of course she did!”</i> Teron slaps your shoulder knowingly. <i>“Now, whilst Attica is guiding the paperwork through the hoops, let’s go over a few extra details. You are the proud owner of a new adult entertainment studio now, of course. It needs an name....”</i>");

	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", bizzyStage4PlanYeahIII);
}

public function bizzyStage4PlanYeahIII():void
{
	clearOutput();
	showBizzyBust();

	output("He hands you a form, with a blank entry field above ‘Subsidiary of Steele Tech’.");

	displayInput();
	userInterface.textInput.text = "Smutosaur.us";
	userInterface.textInput.maxChars = 33;

	output("\n\n\n");

	clearMenu();
	addButton(0, "Next", bizzyStage4PlanYeahIV);
}

public function bizzyStage4PlanYeahIV():void
{
	if (userInterface.textInput.text == "")
	{
		bizzyStage4PlanYeahIII();
		output("<b>You must input a name.</b>");
		return;
	}

	flags["BIZZY_PORN_STUDIO_NAME"] = userInterface.textInput.text;

	if (stage.contains(userInterface.textInput)) removeInput();

	clearOutput();
	showBizzyBust();

	output("<i>“"+pornStudioName+" it is! Very imaginative.”</i>");

	output("\n\nTeron takes away the form and directs your attention to Bizzy, who’s happily messaging an alert to her fans, hinting at big news.");

	output("\n\n<i>“Onto considering some painless extras for your freshly re-indentured property. She is now an asset of the newly minted [pornStudioName]. Might I suggest a tattoo of the company’s logo on her buttock? An excellent reminder to viewers of whom they should be grateful to for such first class entertainment. And perhaps a steel collar? Nothing too heavyweight, slim and pretty without any add-ons. But it’s always good to keep high profile entertainers reminded of who they belong to. And...”</i> he chuckles urbanely. <i>“Steel, you see?”</i>");

	processTime(10+rand(5));

	//[Tattoo] [Collar] [Both] [Neither]
	clearMenu();
	addButton(0, "Tattoo", bizzyStudioSetupSlavers, 1);
	addButton(1, "Collar", bizzyStudioSetupSlavers, 2);
	addButton(2, "Both", bizzyStudioSetupSlavers, 3);
	addButton(4, "Neither", bizzyStudioSetupSlavers, 0);
}

public function bizzyStudioSetupSlavers(slaveSelect:int):void
{
	clearOutput();

	if (slaveSelect > 0)
	{
		output("<i>“Excellent choice. We’ll have that sorted out for you by the next time you visit.”</i> Teron notes it down on his holopad. <i>“How are we doing over there, Attica?”</i>");
	}
	else
	{
		output("<i>“The natural look, eh? Suit yourself.”</i> Teron raises his voice. <i>“How are we doing over there, Attica?”</i>");
	}

	output("\n\nThe female tarratch responds with an ‘ok’ gesture. The Steele Tech suits are bemused by the request, but a demonstration of Bizzy’s rise and rise in the world of adult streaming, and the fact all of the financial risk is impacted on you and her, has convinced them it’s no skin off their noses.");
	
	output("\n\n<i>“We’ll sort out the apartments next. Bring in the builders and decorators,”</i> she says, rising and laying a hand on Bizzy’s shoulder. <i>“Liaise with your servant, of course, so it exactly fits her requirements.”</i>");
	
	output("\n\n<i>“I can’t wait.”</i> The kaithrit is still in a state of nervous excitement, glancing this way and that around her humble abode, already imagining the extra space. <i>“This is gonna be so cool, [pc.Mr]. Steele!”</i>");
	
	output("\n\n<i>“Come back in about a week,”</i> Teron advises. <i>“[pornStudioName] should be on its feet and ready to go by then.”</i>");
	
	output("\n\nYou find yourself shepherded outside. Like Bizzy, you’re slightly blown away by how quickly this has happened - how rapidly 200k winged its way out of your pocket. But it <i>is</i> tremendously exciting. Your own porn studio, headed by your pet camwhore! Nobody could’ve turned that kind of opportunity down.");

	//Kick PC to North Walkway. Bizzy to Stage 5
	processTime(10+rand(5));

	flags["BIZZY_PORN_STUDIO"] = 5;
	flags["BIZZY_PORN_STUDIO_TIMER"] = GetGameTimestamp() + (1440 * 7);
	flags["BIZZY_SLAVER_CHOICE"] = slaveSelect;
	currentLocation = "RESIDENTIAL DECK 13";
	
	showBizzyBust();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bizzyStage4PlanThink():void
{
	clearOutput();
	showBizzyBust();

	output("It’s always hard to decide against sugaring your pet kitty. The way she pouts! The way she flounces! But this is a lot of money she’s asking for, and she knows it. You pat her on the rump and tell her as sincerely as possible you’ll think it through carefully.");
	
	output("\n\n<i>“Awwww...”</i> Bizzy sighs. <i>“...alright. But you know it’s what you want to do. More me... more of my sexy vids...”</i> she eyes you slyly. <i>“Better decide fast, before I decide to take all of this business elsewhere...”</i>");
	
	output("\n\nBut you know she wouldn’t do that, even if she wasn’t indentured to you. She’s yours to play with, as you see fit.");

	bizzyStage4Menu();
}

public function bizzyStage4Breasts():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“You want to have a feel, [pc.Mr]. Steele?”</i> She smiles, leaning forward, letting the gratuitous objects swell outwards. <i>“Of course you do. All of your hard investment... you can’t take your eyes off your lovely titty kitty, can you? Or your hands.”</i>");

	processTime(2);

	// [Fondle] [Give] [Back]
	clearMenu();
	addButton(0, "Fondle", bizzyStage4Fondle, undefined, "Fondle", "It’s your property after all.");

	if (pc.hasItemByClass(Tittyblossom)) addButton(1, "Give", bizzyStage4GiveItem, undefined, "Give Item", "Will she take another dose of Tittyblossom?");
	else addDisabledButton(1, "Give", "Give Item", "You’d need something appropriate to give to her!");

	addButton(14, "Back", bizzyStage4Menu);
}

public function bizzyStage4GiveItem():void
{
	clearOutput();
	showBizzyBust();

	output("Bizzy’s triangular ears straighten as you bring out the purple popsicle... and then she politely bats it away.");

	output("\n\n<i>“No,”</i> she says. <i>“It’s really tempting, [pc.Mr]. Steele - I love those things - but they won’t do anything more for me. If we’re gonna take things to another level, we’re gonna have to talk... investment. Again.”</i>");

	processTime(2);

	//Add [Plan?] to main menu if not there already
	if (flags["BIZZY_SHOW_PLAN"] == undefined) flags["BIZZY_SHOW_PLAN"] = 1;

	addDisabledButton(1, "Give");
}

public function bizzyStage4Fondle():void
{
	clearOutput();
	showBizzyBust();

	output("She loosens her top and tent-like bra, and her breasts burst forth as if impatient with captivity. They’re massive things, watermelon-sized but chubbier and rounder still. There’s so much to take in here, so you take your time doing it - weighing them in your hands, squeezing huge handfuls, tracing her valley-like cleavage, feeling for yourself their heavenly softness and springiness. You grope her, roaming fingers finding her large nipples and gently pulling at them until they’re as thick as thumbs.");
	
	output("\n\n<i>“They’re wonderful, aren’t they,”</i> she says, happy warmth in her cheeks and eyes. <i>“Troublesome, sometimes - I do miss seeing my feet - but.... Ooh, that’s lovely, [pc.Mr]. Steele... when I feel them bounce, and play with them, and see how turned on they make my fans, I know I wouldn’t trade them for anything.”</i>");
	
	output("\n\nThey’re unmistakeable, that’s for sure, clearly marking her out as a pet bimbo, a porn star, or both. You spend a little while just feeling her, rolling her cute nipples between your fingers enjoying the little sighs and mewls of pleasure you work out of your pet pussy. She’s grinning at you dopily, as if she’s just received a hefty dose of Nepeta, when you finally let her go.");

	pc.lust(15);
	processTime(5+rand(5));

	addDisabledButton(0, "Fondle");
}

public function bizzyStage4Camshow():void
{
	clearOutput();
	showBizzyBust();

	output("Her coy expression darkens a bit when you ask her how business has been doing.");
	
	output("\n\n<i>“Oh... fine. Here, I’ll show you.”</i>");
	
	output("\n\nHer warm, soft weight presses into you as she fetches her laptop and shows you her Bitch.tv account. She now has a professionally animated opening sequence for each of her videos, in which the words ‘Bizzy’s Business’ run onto the screen and bunch together before a cartoon version of herself climbs on top, giving the viewer a jiggle and a foxy little wink. The show is popular enough for it to intermittently appear on Bitch.tv’s front page.");
	
	output("\n\nAs for the videos themselves: she now has different tiers, all of them designed to hook the casual viewer and lead them further and further into her lewd little universe. Part of Bizzy’s appeal is that she continues to demonstrate that natural eagerness to display herself for her audience, and do more and more imaginative things with herself and the show. Her massive bajonkas help, of course. Here are teasers and simple dance movies; here are stripteases and vidchats; here are the exotic graphically enhanced shows, and straight up, hardcore porn. She’s found a pretty gryvain friend with a goth aesthetic and an eight inch dragon cock who enthusiastically takes part in the latter. Oof - you’d no idea Bizzy was that flexible.");
	
	output("\n\nShe has a subscriber count in the low millions now. It’s an incredibly impressive achievement for an operation which started and continues to run in someone’s apartment, and you tell her that.");
	
	output("\n\n<i>“It’s not enough,”</i> the white-haired kaithrit pouts. <i>“I have ideas that could put me - us - into orbit. Become one of the galactic superstars of streaming! Ride this wave all the way to the top!”</i> Her slit eyes gleam, reflecting starlight. <i>“But I can’t do anything more in - this.”</i> She waves in frustration at her bedroom, cramped now with recording gear and an armory of sexual favors. <i>“I’m still just one person, in one apartment.”</i>");
	
	output("\n\n<i>“If you’re interested though, [pc.Mr]. Steele...”</i> her finger lands on your forearm, twisting back and forth. <i>“...if you really have faith in your busty Bizzy, and wanna push her all the way... I do have a plan.”</i>");

	flags["BIZZY_SHOW_PLAN"] = 1;

	processTime(10+rand(5));
	pc.lust(15);

	bizzyStage4Menu();
	addDisabledButton(1, "Camshow");
}

public function bizzyStage4Appearance():void
{
	clearOutput();
	showBizzyBust();

	output("Bezeneria d’Alysio, or Bizzy as she prefers to be known, is a 5\' 7\" kaithrit female. She has full white hair that reaches down to her back, and the fur on her pointy ears and two long tails is similarly white shot through with tendrils of black. She has green, cat-like eyes set in a peachy, luminous bloom of facial beauty wrought by the concentrated female hormones you’ve repeatedly dosed her with. She has plush, full lips and the cute, upturned nose - a bona fide stunner.");
	
	output("\n\nWith sexuality, beauty and their constant displayal has come confidence. The performance has completely eaten the performer, and the kitty cat is relaxed, smirking, exaggeratedly sensual, a sex pot that’s always ready to please and show herself off.");
	
	output("\n\nShe’s gotten herself a tight, thigh-length skirt, strappy heels and a low-cut black top with short, puffy sleeves, all to show off her assets to their best advantage. Her breasts are J cups at a guess, huge, swollen mountains of soft, pale flesh that completely dominate her form.");
	
	output("\n\nHer nipples are thumb-sized, standing clear to see underneath her top when she’s aroused - which is usually. Her wide thighs billow out into a round plump bottom, above which her tails sprout. Her heels and top-heaviness force her to walk in a slow, swaying, sensual fashion, something she clearly delights in.");
	
	if (flags["BIZZY_SEEN_NAKED"] != undefined) output("\n\nUnderneath her skirt, you know she’s also abundantly female: a plump pair of lips curtain a soaking, pliant twat and protuberant clit, with a well-maintained pubic puff of white fur.");

	addDisabledButton(0, "Appearance");
}

public function bizzyStage3():void
{
	clearOutput();
	showBizzyBust();

	output("Bizzy’s smiles coyly when she opens the door to her small apartment.");
	
	output("\n\n<i>“Heeeeyyyyy,”</i> she coos, sliding her hand through her long white hair and giving you the eyes. <i>“Come to check on lil ol’ me, have you?”</i>");
	
	output("\n\nThe living room has been spruced up - it’s now painted and decorated in mahogany and cream, with a fashionable but sturdy glass table and huge couch. Sensual, alluring ornaments and pictures decorate it, and you understand looking around that this is a living area that occasionally doubles as a porn set.");
	
	output("\n\nThe bedroom remains much the same. With careful application of sheets and light sources, Bizzy has made it into an intimate, well-lit space with an atmosphere of quiet potential, centred around her laptop and crimson-sheeted double bed. A little row of sex toys stand to attention on a bedside table. You notice she’s added a selection of body paints, aphros and other little sexual treats behind them. On one wall is a little collection of photos - scenes from her greatest hits, as well as specific shout-outs to her most generous patrons.");
	
	output("\n\nBizzy sits you back down in her living room with a cup of Roshan tea, smoky and mildly stimulating. She lays herself down on the couch opposite, leisured cat in the presence of her owner.");
	
	moveTo("BIZZY STUDIO ROOM");

	bizzyStage3Menu();
}

public function bizzyStage3Menu():void
{
	clearMenu();
	addButton(0, "Appearance", bizzyStage3Appearance);
	addButton(1, "Camshow", bizzyStage3Camshow);
	addDisabledButton(2, "Talk");
	addButton(3, "Breasts", bizzyStage3Breasts, undefined, "Her Breasts", "The most important subject of all.");
	
	if (pc.lust() >= 33) addButton(4, "Sex", bizzySexMenu);
	else addDisabledButton(4, "Sex", "Sex", "You’re not turned on enough to really get the most out of your personal big titty kitty.");
	
	addButton(14, "Leave", bizzyGoLeave);
}

public function bizzyStage3Breasts():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“Do you bring some Tittyblossom?”</i> she asks immediately, straightening up like a cat that’s just seen the kibble bowl hover into view, when you bring the subject up. <i>“Remember - <b>I need three doses, this time.</b> I’ve gotta do something </i>spectacular<i>.”</i>");

	//[Fondle] [Give] [Back]
	clearMenu();
	addButton(0, "Fondle", bizzyStage3Fondle, undefined, "Fondle", "It’s your property after all.");

	// I'm not doing a selectable menu for this, just pushing toward right or not automatically because there is only one "right" answer, there isn't much of a choice to be had.
	if (!pc.hasItemByClass(Tittyblossom, 3)) addDisabledButton(1, "Give", "Give Item", "She’s gonna need a <b>big</b> dose this time.");
	else addButton(1, "Give", bizzyStage3GiveItem, undefined, "Give Item", "Give her the big dose of Tittyblossom she’s requested");

	addButton(14, "Back", bizzyStage3Menu);
}

public function bizzyStage3GiveItem():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“Oh wow.”</i>");
	
	output("\n\nThe white-haired kaithrit stares at the 3 purple ice lollies you place one after the other on the table. Her hand reflexively goes up to her breasts - already big, swollen things that dominate her frame - and for a moment you see the old Bizzy, nervous and gawky and unsure. Then a determined frown creases her brow.");
	
	output("\n\n<i>“Yes,”</i> she says, mostly to herself. <i>“This is what I want to be. This is what I want to do.”</i> She smiles at you almost in relief. <i>“This is gonna be a </i>great<i> show, [pc.Mr]. Steele. I know you’re gonna love it!”</i>");
	
	output("\n\nThe kaithrit bounds off into the bedroom. You pick up the holo device left on the couch and settle yourself down to watch the livestream.");
	
	output("\n\n<i>“Heeeeyyyy,”</i> purrs the cute, white-haired cat-girl, after the opening animation and tune has played. <i>“It’s Bizzy back with all her business again. Hope you haven’t been too sad in my absence...”</i> she stretches languorously, her breasts stretching her black top tight. <i>“... but I </i>do<i> hope you’ve gotten nice and frustrated. All pent-up and ready for me to take care of aaalll that business.”</i>");
	
	output("\n\nShe blows a kiss at the camera, and the drone zooms in as she whispers conspiratorially.");
	
	output("\n\n<i>“Cuz I’ve got another slutty livestream coming up. My owner... [pc.he]’s given me an </i>incredible<i> treat. Bizzy had to be </i>so<i> good to get it... such an obedient, hard-working piece of ass. But now I’ve got it, and you are all gonna see me take it.”</i>");
	
	output("\n\nShe traces the generous, curving line of her breasts, and giggles.");
	
	output("\n\n<i>“If I reach a million views.”</i>");
	
	output("\n\nThe viewer count rises, explosively at first, then more steadily. It seems, for a time, that she might level off in the 800,000s. But Bizzy knows how to work a crowd. She throws in steady teasers for what’s coming whilst getting viewers to send in dick pics. The lucky pricks that hit a particular total she uses her software to generate holographically, pretending to suck or ride on them with the number reached tattooed upon them.");
	
	output("\n\n<i>“Mmm...”</i> she sighs, after taking yet another artificial cum load to the face. <i>“I wish I had all your dicks in here with me. So I could give each and every one of them the release they deserve.”</i>");
	
	output("\n\nShe is, indeed, a hard-working piece of ass, and it’s a constant temptation for you to throw the holopad aside, go in there and");
	if (pc.hasCock()) output(" fuck her senseless");
	else output(" ride her face silly");
	output(". You manage to stifle your throbbing urges though, and are rewarded ten minutes later when, with bursts of holographic confetti and champagne corks, she reaches the one million mark.");
	
	output("\n\n<i>“Yaaaaayyyy!”</i> Bizzy cheers, bouncing up and down as the chat explodes. <i>“Oh I’m so pleased, you guys! You have no idea what a temptation these things are.”</i>");
	
	output("\n\nShe draws them out, doing it deliberately slowly, placing one icy, sticky shaft of Tittyblossom next to the other on a platter. Next, she takes her top off, letting her lovely full breasts spill out from their silky confines.");
	
	output("\n\n<i>“Now,”</i> she smiles at the drone, stroking her softness. <i>“How should I take them?”</i>");
	
	output("\n\nA hundred suggestions flood the chat log. One gains traction above all the others.");
	
	output("\n\n<i>“Ooh, I’m not sure about this,”</i> Bizzy laughs. She’s managed to afix one of the popsicles onto a floating drone in front of her, purple phallus pointing into the sky. She squats above it, thighs and neat, wet pussy splayed, another popsicle clutched in each fist. <i>“But you guys have asked, and I must... ooooooh!”</i>");
	
	output("\n\nShe squeals, eyes crossing as she bears down, pushing the thick, icy sugar into her twat. The lips twitch noticeably.");
	
	output("\n\n<i>“Ohh, it’s sooo cold,”</i> she groans. She sinks down on it, and then with a heave draws herself back up. You cough slightly as you watch her diddle herself with it, staining her pussy lips purple. That’s genuinely impressive.");
	
	output("\n\n<i>“But I can feel it melting...”</i> the kaithrit arches her back, breathing raggedly, her boobs bouncing together. <i>“I can feel it sinking into me... changing me... fuuuuck yes!”</i>");
	
	output("\n\nShe shoves the other two popsicles into her mouth simultaneously, fucking her face with them. Obscene sounds echo off the walls as she descends once again on the icy, dripping phallus, a sound of total abandon leaving her stuffed, stretched mouth.");

	pc.lust(20);
	processTime(5);

	pc.destroyItemByClass(Tittyblossom, 3);
	flags["BIZZY_PORN_STUDIO"] = 4;
	
	clearMenu();
	addButton(0, "Next", bizzyStage3GiveItemNext);
}

public function bizzyStage3GiveItemNext():void
{
	clearOutput();
	showBizzyBust(true);
	
	output("Her bare breasts bounce as she shudders and jolts... and they do so with increasingly more heft, more weight, as her body absorbs the sugar rush of booby, feminizing delight. Oh good <i>Void</i>, look at what it’s doing to her. You can practically hear the fat expanding explosively, her tits swelling out and out, huge round mountains of glorious soft flesh that grow, and grow, and grow. Her nipples engorge and grow with them, luridly thick brown mounds now with taps the size of fingers pointing accusations at the screen.");
	
	output("\n\nThe kaithrit moans again as she feels it happening, slurping and gulping away at the double dose of Tittyblossom she’s face-fucking herself with, and when she slips off the gooey purple she’s tormenting her pussy with you think she actually orgasms, muscles in her legs clenching up, a wave of ecstatic motion travelling up her body, making her massive breasts waggle. Purple drops spatter all over them, dripping down into the achingly large cleavage.");
	
	output("\n\nYou");
	if (pc.hasCock()) output(" have your [pc.cock] in your hand, jerking yourself furiously");
	else output(" have your hand rammed into your [pc.vagina], flicking yourself furiously");
	output(" as you watch, barely even aware of what you’re doing. You almost forget about the other camera angles, and it’s by clicking on the one to the side of Bizzy that you see that the gene-mod is doing more than growing her boobs. The pale swell of her ass is growing out too, taking on a rounder, more noticeable shape, her hips widening as well, womanly curvature. Maybe just as well, given the extra weight they will now be bearing everywhere.");
	
	output("\n\n<i>“Oh my tails,”</i> moans Bizzy, hands full of the rich, soft flesh that now hangs off of her chest. She spattered with sticky purple, as if a bunch of juice boxes just bukkake’d her. She’s managed to smear about as much Tittyblossom over her as she actually embibed, but that’s ok - she took more than enough. Her tits are considerably bigger than her head now, massive, blimp-like things that you’d hazard as being J cups.");
	
	output("\n\nWhen she finally stands she does so with a grunt, heaving those babies into the air a genuine effort. Mmm - they’ve retained a certain pertness, her engorged nipples poking into the middle distance. Bizzy swings them about, takes big handfuls and squeezes them, brushes her hands over the nips way out in front of her, shock turning into awe, seeming to forget all about the audience staring at her. You have, too. You gaze down at the livestream viewer count, and do a double take. It crested over 2 million.");
	
	output("\n\n<i>“This is... incredible,”</i> the kaithrit says finally, turning a big beam to the camera. <i>“Look at me! Oooohhhh, I can’t wait for my owner to play with me... and to play with them for all of you. The things I could do with these... that could be done to me...”</i> she loses herself in an erotic reverie, eyes closed as she pulls at her nipples, turning them into those incredible, finger-sized, fawn erections again. <i>“I cannot wait. Thank you to everyone for watching - I hope you got many, many orgasms out of watching me becoming a monster titty kitty. Until next time, guys... this has been the Business with Bizzy.”</i>");

	pc.lust(30);
	processTime(10+rand(5));

	clearMenu();
	addButton(0, "Next", bizzyStage3GiveItemGo)
}

public function bizzyStage3GiveItemGo():void
{
	clearOutput();
	showBizzyBust(true);

	output("A few seconds later Bizzy is back into the living room. Face lively with excitement, she tries to give you a hug - and winds up socking you in the face with her blimp-like breasts. She giggles, embarrassed. Good One, in the flesh they somehow seem even bigger.");
	
	output("\n\n<i>“That was amazing,”</i> she enthuses. She seizes her breasts, squeezes and jiggles them for you. The fact they seriously impede her movement and block her view downwards doesn’t seem to trouble her at all. In fact, she seems to delight in their bustle and ponderousness. <i>“THESE are amazing. I can’t get over how good it feels when the gene-mod takes over... how happy and warm it feels... and all of those eyes on me when I do it!”</i>");
	
	output("\n\nShe again seems to lose herself in an erotic reverie, transported by her own tactile glory and exhibitionism. When she opens her eyes again, they are shot through with heat and need.");
	
	output("\n\n<i>“You’re going to take your pet titty kitty for a test ride now, right?”</i> She clambers onto the couch and turns, laughs as she sees for the first time how her backside has grown, fuller and rounder. Modest, in comparison to what’s happened to her chest, but still mouthwatering.");
	
	output("\n\n<i>“You see that?”</i> she purrs, raising her tails and arching her back. <i>“See what you’ve done to your good little pet, [pc.Mr]. Steele? Don’t you want to taste it, feel for yourself the lovely body you’ve made her grow... make her meow and say your name...”<i>");

	processTime(5+rand(2));

	flags["BIZZY_PORN_STUDIO_TIMER"] = GetGameTimestamp() + 1440;

	clearMenu();
	addButton(0, "Sex", bizzySexMenu, true);
	addButton(1, "Leave", bizzyGoLeave, undefined, "Leave", "You have to go.");
}

public function bizzyStage3Leave():void
{
	clearOutput();
	showBizzyBust(true);

	output("It is with great regret and serious complaints registered from your [pc.groin] that you get up and tell her you can’t hang around. But she’s to keep working that business of hers, and you’ll be back soon enough to see how she’s doing.");
	
	output("\n\n<i>“Yes.”</i> Bizzy says it with a surprisingly firm set of the jaw. <i>“We’re definitely gonna have to, um - talk, next time. This -”</i> she moves her hand, trying to indicate the room but instead hits her tit. She sighs, and tries again. <i>“We need to expand, if we’re gonna ride this wave and take Bizzy’s Business to the top.”</i> She grins at you, giving you another little shake. <i>“You’ve made your kitty bigger. Isn’t it time to think bigger, too?”</i>");
	
	output("\n\nThe transformation you have wrought are clearly not just confined to her body. This is an entirely different kaithrit talking to the one that once opened her door to you and practically wet herself. You find yourself shaking your head in bemusement as you make your way back out of Bizzy’s apartment.");

	currentLocation = "RESIDENTIAL DECK 13";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bizzyStage3Fondle():void
{
	clearOutput();
	showBizzyBust(true);

	output("<i>“You want to have a feel?”</i> Bizzy scooches into you on the couch with a coy little smile. <i>“They do belong to you, [pc.Mr]. Steele...”</i>");
	
	output("\n\nWhen you loosen her top and bra, her breasts burst forth as if impatient with captivity. They’re hefty, melon-sized things, overflowing in your hands when you squeeze them, feeling for yourself their heavenly softness and springiness. You grope her, roaming fingers finding her large nipples and gently pulling at them until they’re wonderfully erect.");
	
	output("\n\n<i>“Aren’t they lovely?”</i> she says, happy warmth in her cheeks and eyes. <i>“Every morning I wake up and am slightly surprised by them. I like to.... Ooh, that’s lovely, [pc.Mr]. Steele... bounce around the apartment, just so I can feel them jiggle.”</i>");
	
	output("\n\nYou can understand that - they’re a temptation, from whichever angle you approach them. And they’re a good size, for a camwhore. You spend a little while just feeling her, rolling her cute nipples between your fingers enjoying the little sighs and mewls of pleasure you work out of your pet pussy. She’s grinning at you dopily, as if she’s just received a hefty dose of Nepeta, when you finally let her go.");

	pc.lust(15);
	processTime(5);

	addDisabledButton(0, "Fondle");
}

public function bizzyStage3Camshow():void
{
	clearOutput();
	showBizzyBust(true);

	output("Her coy expression darkens a bit when you ask her how business has been doing.");
	
	output("\n\n<i>“Oh... fine. Here, I’ll show you.”</i>");
	
	output("\n\nHer warm, soft weight presses into you as she fetches her laptop and shows you her Bitch.tv account. She now has a professionally animated opening sequence for each of her videos, in which the words ‘Bizzy’s Business’ run onto the screen and bunch together and a cartoon version of herself climbs on top, giving the viewer a big wink and a foxy little wink.");
	
	output("\n\nAs for the videos themselves, well, they’re much the same. She has simple striptease and dancing videos for the average punter, and then more hardcore videos where she enthusiastically uses her various toys on herself. You can’t help but notice she’s been getting lewder and more exotic as time has gone on; in her latest exclusive video, she’s somehow managed to bind herself up in red rope, and has floating drones tease and torment her breasts and pussy with vibrations and little electric shocks. She also still does the high effort graphical trickery from time to time, placing herself in all sorts of exotic locales and then doing long video chats with those who pay to see her in the enchanted forest, the dungeon, the rose meadow, the floating steel palace.");
	
	output("\n\nShe has a subscriber count in the hundreds of thousands now, which seems pretty damn good. You put that to her.");
	
	output("\n\n<i>“Yeeaaaahhhh...”</i> she sighs. <i>“It’s alright. It’s been slowing down a lot recently. I’m trying a bunch of new things and it’s not really pushing me any higher.”</i>");
	
	output("\n\nYou spend a little time browsing Bitch.tv and sort of see why. Bizzy is no longer cutely amateur, but is also not the heavy duty pros who have crews, extreme bodies, situations and money to work with. There probably needs to be a serious commitment made if she’s going to join the real stars of camwhoring.");

	pc.lust(10);
	processTime(10+rand(5));

	bizzyStage3Menu();
	addDisabledButton(1, "Camshow");
}


public function bizzyStage3Appearance():void
{
	clearOutput();
	showBizzyBust();

	output("\n\nBezeneria d’Alysio, or Bizzy as she prefers to be known, is a 5\' 7\" kaithrit female. She has full white hair that reaches down to her back, and the fur on her pointy ears and two long tails is similarly white shot through with tendrils of black. That, combined with her green, cat-like eyes and peachy skin, give the impression of very early spring in lithe, graceful form.");
	
	output("\n\nThe regimen of female hormones you’ve been dosing her with have wrought changes elsewhere: her lips are plusher than they were, and her face now glows with soft beauty, no longer quite the approachable girl-next-door that she was. She is no longer nervous and edgy around you, either. The performance is eating the performer, and the kitty cat is relaxed, smirking, exaggeratedly sensual, a sex pot that’s always ready to please and display.");
	
	output("\n\nShe’s gotten herself a black top with short, puffy sleeves, low cut to show off her assets to their best advantage. Her breasts are DD cups, heavy, generous melons that stretch the material out and quiver enthrallingly when she walks. Her nipples are cherry-sized, clearly visible underneath the top. Her long thighs bloom into a lovely round bottom, above which her tails sprout.");
	
	if (flags["BIZZY_SEEN_NAKED"] != undefined) output("\n\nUnderneath her jeans, you know she’s pure female kaithrit: a neat pair of lips curtain a lovely, pliant twat and protuberant clit, with a well-maintained pubic puff of white fur.");

	bizzyStage3Menu();
	addDisabledButton(0, "Appearance");
}

public function bizzyStage2():void
{
	clearOutput();
	showBizzyBust();

	output("Bizzy’s face flares up with delight when she opens the door to her small apartment.");

	output("\n\n<i>“Hey yoooouuuu,”</i> she coos, sliding her hand through her long white hair and giving you the eyes. <i>“Come to check on lil ol’ me, have you?”</i>");
	
	output("\n\nThe living room and kitchenette are as sparse and shabby as always. However, as the kaithrit shows you, she’s transformed her bedroom: With careful application of sheets and light sources, she’s made it into an intimate, well-lit space with an atmosphere of quiet potential, centred around her laptop and crimson-sheeted double bed. A little row of sex toys stand to attention on a bedside table. You notice she’s added a selection of body paints, aphros and other little sexual treats behind them. It’s reasonably impressive, given she’s working with very little.");
	
	output("\n\nBizzy sits you back down in her living room with a cup of Roshan tea, smoky and mildly stimulating. She sits opposite with her green eyes glued to you, wringing her hands, awaiting her owner’s instructions.");
	
	moveTo("BIZZY STUDIO ROOM");

	bizzyStage2Menu();
}

public function bizzyStage2Menu():void
{
	clearMenu();
	addButton(0, "Appearance", bizzyStage2Apperance);
	addButton(1, "Camshow", bizzyStage2Camshow, undefined, "Camshow", "Ask her how the business is doing. Can you see one of her shows?");
	addDisabledButton(2, "Talk");
	addButton(3, "Breasts", bizzyStage2Breasts, undefined, "Breasts", "The most important subject of all.");
	
	if (pc.lust() >= 33) addButton(4, "Sex", bizzySexMenu);
	else addDisabledButton(4, "Sex", "Sex", "You’re not turned on enough to really get the most out of your personal big titty kitty.");
	
	addButton(14, "Leave", bizzyGoLeave);
}

public function bizzyStage2Breasts():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“Do you bring some Tittyblossom?”</i> she asks immediately, straightening up like a cat that’s just seen the kibble bowl hover into view, when you bring the subject up.");

	clearMenu();
	addButton(0, "Fondle", bizzyStage2Fondle, undefined, "Fondle", "It’s your property, after all.");

	// I'm not doing a selectable menu for this, just pushing toward right or not automatically because there is only one "right" answer, there isn't much of a choice to be had.
	if (!pc.hasItemByClass(Tittyblossom)) addDisabledButton(1, "Give", "Give Item", "You need something appropriate to try and give her in your inventory!");
	else addButton(1, "Give", bizzyBreastsGiveItemStage2, undefined, "Give Item", "Give her a boob-expanding TF.");
	
	addButton(14, "Back", bizzyStage2Menu);
}

public function bizzyBreastsGiveItemStage2():void
{
	clearOutput();
	showBizzyBust(true);

	output("<i>“You brought some? Oh thank you, [pc.Mr]. Steele!”</i> Bizzy actually bounces in her seat in excitement, and she practically snatches the gene-mod out of your hand. <i>“Tittyblossom! Yesssss!”</i>");
	
	output("\n\nThe kaithrit becomes a blur of motion, running backward and forward from the living room to the bedroom with recording equipment.");
	
	output("\n\n<i>“The same as before,”</i> she says, handing you a holo device. <i>“I’m gonna livestream me taking it. Wish me luck!”</i>");
	
	output("\n\nYou make yourself another cup of tea before settling yourself down to watch with the device.");
	
	output("\n\n<i>“Heeeeyyyy everyone,”</i> purrs the cute, white-haired cat-girl on the screen. Her languorous screen persona is back in place, but her excitement remains clear to see, cheeks glowing naturally. <i>“It’s Bizzy back with all her business again. Wouldn’t you know it? I’ve pleased my owner with how slutty I’ve been recently... enough that [pc.he]’s given me a lovely, sweet treat. Can you guess what it is?”</i>");
	
	output("\n\nShe giggles, brushing a finger over her lips... and then over her breasts, dimpling the softness there.");
	
	output("\n\n<i>“If we get to a 100k today... maybe you’ll get to see me take it.”</i>");
	
	output("\n\nBoom. Within a few minutes of Bizzy going live and advertising a ‘treat day’ the viewer count soars, the server struggling to keep up with the number of people piling in to watch her simper and play with herself. There must be a few bots keeping an eye on her, notifying message boards and perverts across the galaxy that are determined not to miss the kaithrit’s events. Within twenty minutes, she zooms past 100,000 viewers.");
	
	output("\n\n<i>“Wooooowww,”</i> the white-haired exhibitonist says, laughing softly, cheeks flushed. She clearly thought it was a much tougher goal than it was. <i>“You guys really wanna see this, huh? Well... alright, then.”</i>");
	
	output("\n\nFirst she spends a couple of minutes teasingly pulling out her perky, pretty breasts, pleasuring them with sweeps of her hands, tweaking her nipples until they’re as hard and erect as pencil rubbers. Then she draws out the popsicle-shaped gene-mod into view, slowly unwraps it, brushes the gleaming ice against her lips.");
	
	output("\n\n<i>“I love these things,”</i> she groans, eyes almost closed, her lips turning ruby red as the wet cold slides over them. <i>“They’re so sweet, and then I take it, and the sweetness goes inside, filling me, changing me... making me more sexy, more slutty... ohh. I can’t help it. I want it inside of me!”</i>");
	
	output("\n\nShe draws it back until the blunt tip is pressed against her pursed lips, then pushes it inside, cheeks hollowing, spearing it back and forth into her mouth, pleasuring the thing. She moans as she does it, a little drool of purple making its way down her pale chin. Fucking... Void. No wonder the viewer count is still escalating rapidly.");
	
	pc.lust(10);
	processTime(5);
	
	pc.destroyItemByClass(Tittyblossom);
	flags["BIZZY_PORN_STUDIO"] = 3;
	
	clearMenu();
	addButton(0, "Next", bizzyBreastsGiveItemStage2Next);
}

public function bizzyBreastsGiveItemStage2Next():void
{
	clearOutput();
	showBizzyBust(true);
	
	output("She does it with increasing forcefulness, face-fucking herself with the gleaming popsicle, hard enough that her breasts jiggle briskly. And, once again, they expand. She’s got several different cameras set up now, each capturing a different angle of her shaking frame, and with your privileged access you can flick to any with a simple movement of your eyes.");
	
	output("\n\nSo as her boobs grow, wonderful supple fatness blooming outwards, you can watch them from the side, from above, or directly in front, as if you were being smothered by them. They swell outwards into plentiful pear shapes, ever-so-slightly pendulous, dominating her front, in your face and impossible to ignore. As it happens Bizzy’s face burns, and she thrusts the gene-mod into her face all the harder, sucking that slutty sweetness down, transfixed by the erotic transformation.");
	
	output("\n\n<i>“Ohh my word,”</i> she groans woozily, gazing down when she’s finally sucking slivers off the stick. <i>“Look at me!”</i>");
	
	output("\n\nThey are jugs. No other word does them justice. Melon-sized pear-shapes, they swell way out in front of her, each tipped by a thick, fat nipple swaddled in fawn areola, begging to be licked and nibbled. Void, it makes your mouth water just looking at those hanging off your pretty kitty cat, as you’re sure it does for every one of the 130k people currently gazing at her, as she squeezes them, bounces them, plays with her nipples, sighing with delight. The difference is, of course, <i>you</i> have the right to fondle and play with them whenever you wish.");
	
	output("\n\n<i>“Titty kitty.”</i> She reads the most frequently used phrase in the chat log, and laughs. <i>“Yeah... I guess I am, aren’t I? A titty kitty.”</i> She strokes her DD-cups, with a bite of her lip. <i>“But they could be bigger, couldn’t they? Why should we stop here? I am what I am... a titty kitty. And it feels so gooooood...”</i> she tails off into a croon, her twin tails curling as she pinches her nipples, making them stand out like cherries. <i>“...well, we’ll see. If I keep doing the business for my owner. If I keep getting subscribers. Until next time, guys... you’ve been watching the Business with Bizzy.”</i>");

	pc.lust(50);
	processTime(15);

	clearMenu();
	addButton(0, "Next", bizzyBreastsGiveItemStage2II);
}

public function bizzyBreastsGiveItemStage2II():void
{
	clearOutput();
	showBizzyBust(true);

	output("A few seconds later Bizzy is back into the living room. She theatrically jiggles her new boobies about theatrically, laughing again with delight as she sits her round bottom down on your lap.");

	output("\n\n<i>“Thank you so much for doing this, [pc.Mr]. Steele,”</i> she purrs. <i>“I feel so good! So many people were watching me... I wish I’d gotten into this way sooner.”</i> She gazes into your eyes, dilated and pleased. <i>“It was good, right? You enjoyed watching? How do I look?”</i>");
	
	output("\n\nShe leans back on her knees, so you can admire her bazonkas, big, natural tits that bestride her lithe form. She flushes with pleasure when you tell her she looks great.");
	
	output("\n\n<i>“Thank you,”</i> she coos, deeper arousal colors her expression. <i>“Those viewer figures... we HAVE to do it again. How about next time, <b>you get me three doses</b>, and I take them all at the same time?”</i> She bites her lip, transported by the idea. She rocks her booty backwards and forwards on you, soft, warm pressure on your [pc.groin].");
	
	output("\n\n<i>“You’ll let your pet titty kitty see to you now, won’t you? She did so good for you today, and... she wants to thank you, for everything you’ve done for her...”</i>");

	processTime(5+rand(5));

	flags["BIZZY_PORN_STUDIO_TIMER"] = GetGameTimestamp() + 1440;

	clearMenu();
	addButton(0, "Sex", bizzySexMenu, true);
	addButton(1, "Leave", bizzyGoLeave, undefined, "Leave", "You have to go.");
}

public function bizzyStage4Leave():void
{
	clearOutput();
	showBizzyBust();

	output("\n\nWith some reluctance, you tear yourself away from Bizzy and head for the door.");

	output("\n\n<i>“Aww. But you’ll come back soon, won’t you?”</i> She twists her high-heeled toe in the carpet as she sees you out. <i>“There’s always some more business for you to be taking care of here...”</i>");

	processTime(3+rand(3));

	currentLocation = "RESIDENTIAL DECK 13";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bizzyStage2Leave():void
{
	clearOutput();
	showBizzyBust();

	output("You have to go.");
	
	output("\n\nWith some regret you plop Bizzy down on the couch next to you, and tell her you can’t hang around. But she’s to keep working that business of hers, and you’ll be back soon enough to see how she’s doing.");
	
	output("\n\n<i>“Aww. But - yes! Ok!”</i> Bizzy says, setting her jaw. <i>“I’ll have plenty to show you, by the time you get back. And - you’ll bring more Tittyblossom, won’t you?”</i> She twists her hair, blushing and tittering, other hand once again marvelling at the heft and weight of her new boobs. <i>“<b>Three doses, this time.</b> I - I can’t wait to take some more.”</i>");

	processTime(3+rand(3));

	currentLocation = "RESIDENTIAL DECK 13";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bizzyStage2Fondle():void
{
	clearOutput();
	showBizzyBust(true);

	output("<i>“Ooh... ok.”</i>");
	
	output("\n\nBizzy scooches over to you on the couch, slips the straps of her top off her shoulders. You undo her bra (newly bought) and let those grapefruit-sized jumper bunnies jounce free. Truly wonderful, how they seem perfectly shaped for your hand, how they perfectly suit her frame. You grope her slowly, enjoying the give and heft of them.");
	
	output("\n\n<i>“Aren’t they lovely?”</i> she says, happy warmth in her cheeks and eyes. <i>“Every morning I wake up and am slightly surprised by them. I like to.... Ooh, that’s lovely, [pc.Mr]. Steele... bounce around the apartment, just so I can feel them jiggle.”</i>");
	
	output("\n\nYou can understand that - they’re a temptation, from whichever angle you approach them. Still small for a porn actress, though. You spend a little while just feeling her, rolling her cute nipples between your fingers enjoying the little sighs and mewls of pleasure you work out of your pet pussy. She’s grinning at you dopily, as if she’s just received a hefty dose of Nepeta, when you finally let her go.");

	pc.lust(15);
	processTime(5);

	addDisabledButton(0, "Fondle");
}

public function bizzyStage2Camshow():void
{
	clearOutput();
	showBizzyBust(true);

	output("<i>“Yes! Let me show you!”</i>");
	
	output("\n\nBizzy practically leaps out of her seat to grab her laptop, scooch into your side and show you her Bitch.tv account.");
	
	output("\n\nSince you last checked in, Bizzy has been... busy. She’s clearly spent some time working out how to hold onto her audience, and keep them coming back for more. She has simple striptease and dancing videos for the average punter, and then more hardcore videos where she enthusiastically uses her various toys on herself. You can’t help but notice she’s been getting lewder and more exotic as time has gone on; in her latest exclusive video, you can see her deepthroating a huge fanfir dildo with vibes attached to her nipples.");
	
	output("\n\n<i>“Here,”</i> she says, picking out one of her more recent stream recordings. <i>“Let me show you this.”</i>");
	
	output("\n\n<i>“Heeeyyyy everyone, it’s Bizzy again,”</i> purrs the white-haired kaithrit on camera. She’s lying on her side... in what appears to be a forest glade. Giant blue fungus looms behind her, and there’s a distant sound of falling water. <i>“I’m lost deep in an enchanted forest today... banished there by the high priestesses, for being too much of a slut.”</i> She says the last word with a little, bashful giggle. <i>“It’s so scary and lonely in here,”</i> she continues dolefully, picking a flower and sniffing it. <i>“I wonder if you guys have any good ideas to cheer me up?”</i>");
	
	output("\n\n<i>“I’ve been experimenting with graphics,”</i> she says proudly, snuggled into your side. <i>“As long as you have plenty of white sheets, and decent cameras... you can do some pretty neat stuff.”</i>");
	
	output("\n\nBizzy’s Business has a subscriber count in the tens of thousands now. Still very much a lowballer, but she’s doing pretty well for someone who’s just emerged on the scene. She easily supports herself, at this point.");

	pc.lust(33);
	processTime(10+rand(6));

	bizzyStage2Menu();
	addDisabledButton(1, "Camshow");
}

public function bizzyStage2Apperance():void
{
	clearOutput();
	showBizzyBust();

	output("Bezeneria d’Alysio, or Bizzy as she prefers to be known, is a 5\' 7\" kaithrit female. She has full white hair that reaches down to her back, and the fur on her pointy ears and two long tails is similarly white shot through with tendrils of black. That, combined with her green, cat-like eyes and peachy skin, give the impression of very early spring in lithe, graceful form. She has pleasant, approachable looks with a cute, upturned nose.");
	
	output("\n\nVery early spring is dressed in worn jeans and a yellow strappy top though, and is rather twitchy and nervous, particularly around you. You’ve gotten her C-cup breasts, pert swells with cute nipples clearly visible underneath her top, that beg to have a hand curled around them. Her long thighs bloom into a lovely round bottom, above which her tails sprout, only serves to accentuate the spareness of her breasts.");
	
	if (flags["BIZZY_SEEN_NAKED"] != undefined)
	{
		output("\n\nUnderneath her jeans, you know she’s pure female kaithrit: a neat pair of lips curtain a lovely, pliant twat and protuberant clit, with a well-maintained pubic puff of white fur.");
	}

	bizzyStage2Menu();
	addDisabledButton(0, "Appearance");
}

public function bizzyStage1():void
{
	clearOutput();
	showBizzyBust();

	output("Bizzy’s face flares up with a mixture of shyness and delight when she opens the door to her small apartment.");

	output("\n\n<i>“[pc.Mr]. Steele! Hi!”</i> she says, sliding her hand through her long white hair. <i>“Uh... please come in.”</i>");

	output("\n\nThe living room and kitchenette are as sparse and shabby as always. However, as the kaithrit shows you, she’s transformed her bedroom: With careful application of sheets and light sources, she’s made it into an intimate, well-lit space with an atmosphere of quiet potential, centred around her laptop and crimson-sheeted double bed. A little row of sex toys stand to attention on a bedside table. It’s reasonably impressive, given she’s working with almost nothing.");

	output("\n\nBizzy sits you back down in her living room with a cup of Roshan tea, smoky and mildly stimulating. She sits opposite with her green eyes glued to you, wringing her hands, awaiting her owner’s instructions.");

	moveTo("BIZZY STUDIO ROOM");
	bizzyStage1Menu();
}

public function bizzyStage1Menu():void
{
	clearMenu();

	addButton(0, "Appearance", bizzyAppearance);

	addButton(1, "Camshow", bizzyStage1Camshow, undefined, "Camshow", "Ask her how the business is doing. Can you see one of her shows?");
	addDisabledButton(2, "Talk");
	addButton(3, "Breasts", bizzyStage1Breasts, undefined, "Breasts", "The most important subject of all.");
	
	if (pc.lust() >= 33) addButton(4, "Sex", bizzySexMenu);
	else addDisabledButton(4, "Sex", "Sex", "You’re not turned on enough to really get the most out of your personal titty kitty.");
	
	addButton(14, "Leave", bizzyGoLeave);
}

public function bizzyStage1Camshow():void
{
	clearOutput();
	showBizzyBust();

	output("You ask how the business is getting along.");
	
	output("\n\n<i>“Ok! Alright!”</i>");
	
	output("\n\nBizzy practically leaps out of her seat to grab her laptop, scooch into your side and show you her Bitch.tv account.");
	
	output("\n\nThis is a crowded genre, of course. Bitch.tv has tens of billions of accounts, all of them aimed at catching a horny viewer’s attention for a few precious minutes, long enough to beam some adverts directly into their cerebral cortex or persuade them to hit that all-important subscribe button. Your average camwhore is battling against such titans as Cadeus III, with that arch blend of striptease and drama of his that makes you want to headbutt and fuck him at the same time; Vedice Osthen, the literally hypnotic naga domme; or polyBius, who is something different but equally, enthrallingly erotic in every single broadcast. At the bottom of the screen an infinite strip of previews and live-feeds lurk, hundreds of come-hither eyes trying to catch yours and entice you away.");
	
	output("\n\nBizzy has a few things that raise her above a lot of the crowd, though. She’s lined her page in white silky fur, a nice graphical touch that isn’t too obnoxious. The fact she has actual training in film and photography is obvious from the advertizing shots she’s taken of herself; tasteful and teasing, showing just enough of her lithe body with smart lighting and angles. She also just has the perfect porn actress’s face: not stunningly beautiful, but attractive in a cheerful, easing, girl-next-door kind of way. A ‘You want to bust a nut down my throat? Sure! Why don’t we go get ice-cream afterwards?’ face.");
	
	output("\n\nYou see she’s already got a few streams recorded.");
	
	output("\n\n<i>“Noo, not that one,”</i> she says hastily, catching your hand as you make to click one. <i>“That - that’s my first, I don’t think I really - and I’m not happy about that one, the lighting wasn’t - here, watch this one.”</i>");
	
	output("\n\n<i>“Heeeyyyy everyone, Bizzy here,”</i> purrs the white-haired kaithrit on camera. She lying on her bed, head hanging over the edge, addressing the camera upside down. The light is low. <i>“Busy with myself, as usual.”</i>");
	
	output("\n\nThe drone languorously floats upwards, providing first a vista then a top down view of her body, dressed in her top and a frilly pair of panties, from heavy-lidded smile to gently curling toes.");
	
	output("\n\n<i>“I don’t have anyone to keep me company tonight,”</i> she pouts, now lying on her side, displaying the lush curve of her backside and her flat, lithe front. <i>“‘Cept for you guys. And... my little friends, over there.”</i> A toe artfully touches the colorful little selection of vibrators, dildos and plugs on her side table. <i>“Soooo... what do you think I should do? Throw some bytes at me if you have any ideas.”</i>");
	
	output("\n\nBizzy huddles into you, face red, as the broadcast continues. Showing you this was evidently a moment she’s both craved and dreaded. It’s really remarkable the difference in her screen persona and how she acts around you; all of her nervousness disappears once she’s in front of a camera. So far, she’s got a subscriber count in the... hundreds. As you watch, the number drops by 1. Then by 2. Then up by 1! Then down by 2. A small glimpse into the quiet desperation of being a professional streamer.");
	
	output("\n\n<i>“As - as I said, my - my problem kinda hurts me there,”</i> she says, when she sees where you’re looking. You take a look at the chat logs, further into her stream. As you’d expect, there’s plenty of pricks with nothing better to do in there relentlessly mocking her flat chest, reporting her as underage, throwing bytes at her to go scrunch up some toilet paper and such. Admirably though, she rolls with it.");

	output("\n\n<i>“What do you think?”</i> she asks, kneeling on the bed and pushing up her paper-stuffed bra. <i>“Better? You knooowwww... my owner’s promised that [pc.he]’ll get me some boob expanders, if I really work it hard and you guys give me a lot of support. I would livestream me taking them...”</i> She turns and waggles her lovely, round bum at the camera. Her view-count spikes, right there.");

	output("\n\n<i>“What do you think?”</i> Bizzy in the real world asks breathlessly, when you click out. <i>“Basic, right? It is basic, I- I know. But you gotta start somewhere, and I’ve got lots of plans, if it takes off.”</i>");

	output("\n\nBizzy’s Business is a nice little homemade channel, for sure. It’s certainly not going to be making you any money in its current state, though.");

	processTime(10);
	pc.lust(10);

	addDisabledButton(1, "Camshow");
}

public function bizzyStage1Breasts():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“Do you have some boob expanders?”</i> she asks immediately, straightening up like a cat that’s just seen the kibble bowl hover into view when you bring the subject up.");

	clearMenu();

	addButton(0, "Fondle", bizzyStage1Fondle, undefined, "Fondle", "It’s your property, after all.");

	var potentialMods:Array = [NaleenNip, ZilRation, Amazona, Bovinium, Gush, HuskarTreats, AusarTreats, Pandaneen, PandaPro, SirensBounty, UthraPlus, Clippex, Foxfire, OvirAce, GoldPill, OrangePill, Capraphorm, Catnip, DracoGuard, Holstaria, Illumorphene];

	var foundItem:Class = null;

	if (pc.hasItemByClass(Tittyblossom))
	{
		foundItem = Tittyblossom;
	}
	else
	{
		for (var i:int = 0; i < potentialMods.length; i++)
		{
			if (pc.hasItemByClass(potentialMods[i]))
			{
				foundItem = potentialMods[i];
				i = potentialMods.length; // Abort loop, already know we found a thing
			}
		}
	}

	// I'm not doing a selectable menu for this, just pushing toward right or not automatically because there is only one "right" answer, there isn't much of a choice to be had.
	if (foundItem == null) addDisabledButton(1, "Give", "Give Item", "You need something appropriate to try and give her in your inventory!");
	else addButton(1, "Give", bizzyBreastsGiveItemStage1, foundItem, "Give Item", "Give her a boob-expanding TF.");

	addButton(14, "Back", bizzyStage1Menu);
}

public function bizzyBreastsGiveItemStage1(foundItem:Class):void
{
	clearOutput();
	showBizzyBust();

	if (foundItem == Tittyblossom)
	{
		output("<i>“You brought some? Oh thank you, [pc.Mr]. Steele!”</i> Bizzy actually bounces in her seat in excitement, and she practically snatches the gene-mod out of your hand. Her face lights up like Christmas morning when she sees what it is. <i>“Tittyblossom! Yesssss!”</i>");

		output("\n\nThe kaithrit becomes a blur of motion, running backward and forward from the living room to the bedroom with recording equipment.");
		
		output("\n\n<i>“I’m gonna do a live stream of me taking it,”</i> she explains, handing you a holo device. <i>“This’ll give you an exclusive feed. Wish me luck!”</i>");
		
		output("\n\nYou make yourself another cup of tea and then settle down to watch with the device.");
		
		output("\n\n<i>“Heeeeyyyy everyone,”</i> purrs the cute, white-haired cat-girl on the screen. Her languorous screen persona is back in place, but her excitement is clear to see, cheeks glowing naturally. <i>“It’s Bizzy back with all of her business again. I’ve got a great treat for you guys today. If you’ve been following me, you might know what it is...”</i> she giggles, twisting hair around her finger. <i>“...and maybe, just maybe, if we get, ooh let’s say 10,000 viewers, I’ll get it out.”</i> She sighs. The camera zooms in on her pert lips as they form the next words. <i>“I reeeaaaally want you to make me get it out.”</i>");
		
		output("\n\nShe really knows what she’s doing. She teases and prevaricates for at least an hour, doing a little striptease focused on her lovely, peachy bum, uses a dildo on herself with the camera focused on her face, so the viewers can only see her reaction to pleasuring her pussy. All the while she keeps dropping hints about what she has in store. You can see her views and subscribe count from here, and they gradually climb from the low hundreds into the thousands, scraping at that 10k mark. Little explosions of confetti and emoji spam in the comments section go off when she finally gets there.");

		output("\n\n<i>“Ooh. You did it, you guys. You’re actually going to make me to do this,”</i> she says, with just the right amount of coquettish hesitancy. She slides the purple popsicle into view with a big smile. <i>“Bizzy’s owner was so pleased with her this week, [pc.he] got her a treat. She only had to beg a lil bit for it! And now...”</i> She takes the wrapper off, manipulating the camera so light gleams off the icy gene-mod. <i>“...Bizzy’s going to get some boobies. And you’re all gonna get to watch them come in.”</i>");

		processTime(5);
		pc.lust(10);
		
		pc.destroyItemByClass(Tittyblossom);

		clearMenu();
		addButton(0, "Next", bizzyBreastsGiveItemStage1Next);

	}
	else
	{
		output("<i>“You brought some? Oh thank you, [pc.Mr]. Steele!”</i> Bizzy actually bounces in her seat in excitement, and she practically snatches the gene-mod out of your hand. <i>“This’ll... oh. Uh.”</i>");
		
		output("\n\nHer froth dissipates as she frowningly reads the packaging.");
		
		output("\n\n<i>“I - I get why you got me this, [pc.Mr]. Steele,”</i> she says eventually, handing it back. <i>“I super don’t want to come across as ungrateful or anything. But this’ll do other things to me that I don’t want. I’m not into other transformations, I - I don’t think I could handle it. Do you know about Tittyblossom?”</i> She gets her laptop and shows you an advertisement for Estrobloom Plus. <i>“It gives you bigger breasts, with few other side effects. It’d be perfect for me, I’m certain. I think there’s someone on the comm deck who sells it, even.”</i>");
		
		output("\n\nShe says that last part with the deliberate casualness of someone who definitely, definitely hasn’t spent time staring wistfully through the Dark Chrysalis’s window.");

		addDisabledButton(1, "Give");
	}
}

public function bizzyBreastsGiveItemStage1Next():void
{
	clearOutput();
	showBizzyBust(true);
	
	output("She takes off her top slowly, revealing her soft, pale, flat chest, small nipples hard with excitement and nervousness. Then she closes her eyes and opens her lips with the blunt popsicle, sliding it sensuously into her mouth, cheeks hollowing around it, sliding it back and forth. You know every single person with a dick watching will be thinking about how much they wish that was them - and you feel a vicarious, prideful thrill that that action’s yours, any time you wish.");
	
	output("\n\n<i>“Mmm,”</i> she slurps, licking her lips. <i>“So sweet... so...”</i> she trails off in a little moan. For a moment you think you’re kidding yourself, but no: her chest is swelling before your very eyes, plumpness like rising bread. The camera drone swings slowly around, giving a side angle of pale softness expanding, taking on a lovely, round shapeliness.");
	
	output("\n\n<i>“It feels soooo good,”</i> Bizzy moans, lips stark red from the cold of the treat. It doesn’t look like she’s putting it on; she genuinely looks entranced with the feeling of flesh burgeoning on her chest. The views and subscribe continue to escalate as she begins to face-fuck herself with the remaining Tittyblossom greedily, purple juices dribbling down her chin, whilst her breasts burgeon and swell, her nipples thickening with the growth. It’s an utterly entrancing display of eroticism, and you find yourself");
	if (pc.hasCock()) output(" jacking your [pc.cock]");
	else output(" fingering your [pc.vagina");
	output(" almost reactively to what you’re watching.");

	output("\n\nBy the time Bizzy has finished slurping down the popsicle, she has a lovely, perky set of breasts, maybe C cups, perfect for her frame. Her enthusiasm for them is genuine and affecting: She plays with them, bounces them up and down, cheering with delight, never seeming to tire of feeling their soft weight in her hands.");

	output("\n\n<i>“I have boobies, you guys!”</i> she exclaims, one last time. She grins slyly. <i>“They could be a lil bigger though, don’t you think?”</i> She laughs at the explosion of comments in the feed this precipitates. <i>“Maybe I’ll put on another, even better show, sometime soon. I’ll need to get more subscribers if that’s gonna happen... prove to my owner it’s worth the effort. Well... see you guys. Thanks so much for watching. I’ve gotta go report to my owner. [pc.He]’s gonna want to, you know...”</i> she giggles, massaging her tits. <i>“...try me out.”</i>");
	
	processTime(10);
	pc.lust(25);
	
	flags["BIZZY_PORN_STUDIO"] = 2;
	
	addButton(0, "Next", bizzyBreastsGiveItemStage1II);
}

public function bizzyBreastsGiveItemStage1II():void
{
	clearOutput();
	showBizzyBust(true);

	output("The stream ends, having hit a high just short of 30,000 viewers. A few seconds later Bizzy bursts back into the living room, almost bowling you over the couch by grabbing you and planting a big, cold kiss on your forehead. Her new assets press into your [pc.chest].");

	output("\n\n<i>“Thank you so much for doing this, [pc.Mr]. Steele,”</i> she exclaims. <i>“I feel so good! So many people were watching and saying how good I looked! It feels like a weight’s fallen off me... or - or the opposite, I guess,”</i> she giggles, her natural meekness stealing back. <i>“It was good, right? You enjoyed watching? Do I - do I look good?”</i>");

	output("\n\nShe leans back on her knees, so you can admire her pert, grapefruit-sized breasts, her areolae - little splashes of fawn - with small, nubby nipples");
	output(". She flushes with pleasure when you tell her she looks great.");

	output("\n\n<i>“Thank you,”</i> she mumbles. Deeper arousal colors her expression. <i>“I wasn’t joking about doing it again, you know. Did you see how the figures spiked when we did the transformation? I want to make them bigger... become THE, um, booby expansion lady on there. That could be my thing! You’ll bring more Tittyblossom, right? I- if you want to, I mean.”</i>");

	output("\n\nYou think about the incredible erotic display she just put on. It’s an undeniably tempting thought. One that gets more tempting the more Bizzy’s hand works its way down your [pc.belly], towards your crotch.");

	output("\n\n<i>“I bet poor [pc.Mr]. Steele got pretty worked up, watching little ol’ me,”</i> she murmurs, wide green eyes dilated. <i>“It should be [pc.his] servant’s duty, to see to that...”</i>");

	processTime(5+rand(3));

	flags["BIZZY_PORN_STUDIO_TIMER"] = GetGameTimestamp() + 1440;

	//[Sex] [Leave]
	clearMenu();
	addButton(0, "Sex", bizzySexMenu, true);
	addButton(1, "Leave", bizzyGoLeave, undefined, "Leave", "You have to go.");
}

public function bizzyStage1Leave():void
{
	clearOutput();
	showBizzyBust(true);

	output("With some regret you plop Bizzy down on the couch next to you, and tell her you can’t hang around. But she’s to keep working that business of hers, and you’ll be back soon enough to see how she’s doing.");

	output("\n\n<i>“Aww. But - yes! Ok!”</i> Bizzy says, setting her jaw. <i>“I’ll have plenty to show you, by the time you get back. And - you’ll bring more Tittyblossom, won’t you?”</i> She twists her hair, blushing and tittering, other hand once again marvelling at the heft and weight of her new boobs. <i>“I - I can’t wait to take some more.”</i>");

	processTime(3+rand(3));

	currentLocation = "RESIDENTIAL DECK 13";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bizzyStage1Fondle():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“Oh... ok.”</i>");
	
	output("\n\nBizzy scooches over to you on the couch, slips the straps of her top off her shoulders. She smiles, eyes flicking over your face and [pc.chest] as you slip your hand into the warmth of her bra. You feel like you’re a teenager again: first base with a girl, fondling her barely-there tits as her tea-scented breath washes over your face.");
	
	output("\n\n<i>“They’re... ooh...”</i> she sighs as you gently tweak the small rise of a nipple, squeezing the small mound. <i>“...not great, are they? I’ve - I’ve always hated them, since puberty. The other girls used to bully me, pushing me into the boy’s bathroom and stuff.”</i>");
	
	output("\n\nYou don’t know; there’s something to be said for the understated, pretty elegance of an A cup, and certainly they’re nice and sensitive going off the kaithrit’s sighs and hums. Clearly though they’re the object of deep insecurity for her, and they’re not exactly what a porn actress needs.");

	pc.lust(15);
	processTime(5);

	addDisabledButton(0, "Fondle");
}

public function bizzyFirstTimeMeeting():void
{
	clearOutput();
	showBizzyBust();

	output("You hover up to a middle row of the cheap apartment block, find the steel door of number 156. This is the number the email directed you to, no different from any of the other humble residencies here. You knock, feeling a bit shabby chasing after this... but let it never be said that [pc.name] Steele ignored a request from a pretty face.");

	output("\n\n<i>“Hello-? Oh. Oh my word.”</i> The petite kaithrit that answers the door actually starts slightly when she sees you. She stares with wide green eyes for a long, awestruck moment. <i>“I really didn’t think you’d answer that email. Nobody else I sent even... uh... I’m Bezeneria. But please don’t call me that. It’s Bizzy. What am I doing? P-please come inside, [pc.Mr]. Steele.”</i>");

	processTime(2);
	flags["BIZZY_FIRST_TIME_MEET"] = 1;

	clearMenu();
	addButton(0, "Next", bizzyFirstTimeMeetingII);
}

public function bizzyFirstTimeMeetingII():void
{
	clearOutput();
	showBizzyBust();

	moveTo("BIZZY STUDIO ROOM");

	output("She seats you in her living room, then darts into her kitchenette to busy herself with drinks. The inside of her apartment is tidy but sparse, with most of the furnishings looking rather dog-eared. There’s also a fair bit of recording gear crowding the shelves and floor though - cameras, screens, drones, dot mics - and all of that appears carefully organized and maintained.");

	output("\n\n<i>“Here you go, [pc.Mr]. Steele... alright then. Wow.”</i> Bizzy sits opposite and grins at you, watching you sip the Roshan leaf tea as if you were performing a magic trick. It’s really rather weird being in the presence of someone as starstruck with you as this; you’re more used to being shot at.");
	
	output("\n\nIt gives you ample opportunity to consider the kaithrit herself. Of average height, she’s dressed in simple jeans and strappy top, white haired, with little stripes of black snaking through the fluffiness of her head and tails. She has approachable, girl-next-door looks with an upturned nose crying out for a booping.");
	if (pc.kaithritScore() >= 6 || pc.raceShort() == "feline")
	{
		output(" Although her chest is flat as a pancake, as a");
		if (pc.kaithritScore() >= 6) output(" kaithrit");
		else output(" cat morph");
		output(" yourself you instinctively know she’s female. Call it feline seventh sense.");
	}
	else output(" Her chest is almost flat, A cups if that, but a covert glance at her crotch suggests she is actually female, not one of those breathtakingly pretty kaithrit bois you see.");

	if (pc.isNice())
	{
		output("\n\n<i>“Relax,”</i> you say, with a friendly grin. <i>“I’m not going to bite your head off. Just tell me why you reached out to me.”</i>");
	}
	else if (pc.isMisc())
	{
		output("\n\n<i>“I know, I am pretty awesome,”</i> you say, meeting her awestruck gaze with a jokey grin. She blushes and giggles. <i>“The shine’s going to wear off soon though, and you’re going to find out I’m pretty ordinary. Why don’t you tell me why you brought me out here?”</i>");
	}
	else
	{
		output("\n\n<i>“Shoot,”</i> you say, simply and directly.");
	}

	output("\n\n<i>“Alright. Well,”</i> says Bizzy after taking a deep breath. <i>“I - have an ambition to get into photography. Had. It’s - not worked out so far. It’s a crowded field and you need, you know, contacts and money to get going. I’ve got the opposite of that.”</i>");
	
	output("\n\nShe gestures unhappily at the equipment around you. It doesn’t look secondhand: you’d guess there’s tens of thousands of credits sunk in all of that.");
	
	output("\n\n<i>“But. I have an idea of how to get around it. You see, I like sex. And, performing for people, that - that gets me going, quite a bit. I have the training, how to record a scene with nothing but drones, I think I’d be good at it. Porn, that is.”</i>");
	
	output("\n\nIt’s rather strange, listening to this heretofore nervous cat-girl talk so frankly about this. Kaithrit sensibilities, perhaps.");
	
	output("\n\n<i>“But. I have a problem. Can you see what it is?”</i> She straightens her back, displaying her flat breasts, and laughs bashfully. <i>“Most other kaithrit think I’m a guy. I - I really don’t like that. People who might pay to watch me, even less. So I’m kinda stuck.”</i>");

	processTime(5);

	clearMenu();
	addButton(0, "Next", bizzyFirstTimeIII);
}

public function bizzyFirstTimeIII():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“So you’re looking for me to pay for some boob implants?”</i> you ask.");
	
	output("\n\n<i>“No! Nooooo.”</i> Bizzy waves away the suggestion frantically. <i>“I don’t want you to just - just give me some money. No. What I’d like - want - ideally - is, is for you to take me on. My debt. Indentured. Then, once you had me on contract, you could invest in me all you wanted. I would - have some security. And, you’d know I’d have to pay you back. Which I want to do, properly.”</i>");
	
	output("\n\nShe smiles at you nervously over her cup brim.");
	
	output("\n\n<i>“What do you think? [pc.Mr]. Steele, that is.”</i>");

	processTime(3);

	bizzyFirstTimeMenu();
}

public function bizzyFirstTimeMenu(opts:Object = null):void
{
	if (opts == null) opts = new Object();

	clearMenu();
	addButton(0, "Appearance", bizzyAppearance, opts);
	addButton(1, "How Much", bizzyHowMuchDebt, opts, "How Much?", "How much debt does she have?");
	addButton(2, "Talent", bizzyTalent, opts, "Talent", "There’s more to being a camwhore than having giant knockers. Is this stuttering, nervous little thing really cut out for it?");

	if (opts.showPay != undefined)
	{
		addButton(5, "Agree", bizzyAcceptTheDeal, opts, "Agree", "Owning your own pet camgirl sounds pretty damn sweet. <b>This will cost 40,000 credits.</b>");
		
		if (opts.hideJustPay != undefined) addDisabledButton(6, "Just Pay", "Just Pay It", "She’s made it clear she doesn’t want charity.");
		else addButton(6, "Just Pay", bizzyDebtJustPay, opts, "Just Pay It", "40k is no object to you. Why don’t you just pay it off and let her go on her merry way?");

		addButton(7, "Refuse", bizzyFirstTimeRefuse, opts, "Refuse", "Owning a camgirl isn’t your style.");
	}

	if (opts.showPleaseMe != undefined)
	{
		if (opts.hidePleaseMe != undefined) addDisabledButton(3, "Please Me", "Please Me", "She’s already given you a good showing of her talents!");
		else if (!pc.hasGenitals()) addDisabledButton(3, "Please Me", "Please Me", "You require genitals for this!");
		else addButton(3, "Please Me", bizzyFirstTimePleaseMe, opts, "Please Me", "Call it a job interview.");
	}
	
	//addButton(14, "Leave", ); // Force a choice the first time through without letting the player mull it over, either in or out.
}

public function bizzyAppearance(opts:Object = null):void
{
	clearOutput();
	showBizzyBust();

	output("Bezeneria d’Alysio, or Bizzy as she prefers to be known, is a 5\' 7\" kaithrit female. She has full white hair that reaches down to her back, and the fur on her pointy ears and two long tails is similarly white shot through with tendrils of black. That, combined with her green, cat-like eyes and peachy skin, give the impression of very early spring in lithe, graceful form. She has pleasant, approachable looks with a cute, upturned nose.");

	output("\n\nVery early spring is dressed in worn jeans and a yellow strappy top though, and is rather twitchy and nervous, particularly around you. Unusually for a kaithrit female, and perhaps explaining her shy demeanor, Bizzy is almost flat-chested: even wearing that thin top, it’s obvious that all that’s there are two mosquito bumps, more suited to a male of her species. The fact her long thighs bloom into a lovely round bottom, above which her tails sprout, only serves to accentuate the spareness of her breasts.");

	if (flags["BIZZY_SEEN_NAKED"] != undefined)
	{
		output("\n\nUnderneath her jeans, you know she’s pure female kaithrit: a neat pair of lips curtain a lovely, pliant twat and protuberant clit, with a well-maintained pubic puff of white fur.");
	}

	if (opts != null)
	{
		bizzyFirstTimeMenu(opts);
		addDisabledButton(0, "Appearance");
	}
	else
	{
		bizzyMenu();
		addDisabledButton(0, "Appearance");
	}
}

public function bizzyHowMuchDebt(opts:Object):void
{
	clearOutput();
	showBizzyBust();

	output("You ask how much it would cost to indenture her.");
	
	output("\n\n<i>“I looked into it,”</i> Bizzy says immediately, grabbing a holopad. <i>“There are these moth-y guys on the comm deck, they drew one up for me. A standard contract, with my debt - 40 grand.”</i> She fiddles with the pad nervously. <i>“Then you’d own me and everything I produce for 3 years. More, depending on - on mods, other things. And interest.”</i>");

	processTime(2);

	opts.showPay = true;
	bizzyFirstTimeMenu(opts);
}

public function bizzyDebtJustPay(opts:Object):void
{
	clearOutput();
	showBizzyBust();

	output("You shrug and say you’ll happily just pay off her debt. Let her get on with her real ambition.");
	
	output("\n\nThe white-haired kaithrit colors and looks down when you say this, and doesn’t say anything for a little while. You realize you’ve offended her.");
	
	output("\n\n<i>“I’m not a charity case, [pc.Mr]. Steele,”</i> she mumbles at last. <i>“I- I want to work for you. Get rid of my debt the right way. And - believe it or not, I do want to get into porn. I think I’d be good at it. It turns me on.”</i>");
	
	output("\n\nGreen eyes turn up to you hopefully.");

	processTime(3);

	opts.hideJustPay = true;
	bizzyFirstTimeMenu(opts);
}

public function bizzyTalent(opts:Object):void
{
	clearOutput();
	showBizzyBust();

	if (pc.isNice() || pc.isMisc()) output("As kindly as possible, you");
	else output("Time for some hard truths. You");
	output(" tell her you aren’t convinced this is a worthwhile endeavor. How do you know she’s cut out for porn?");

	output("\n\n<i>“Ok. So - first of all...”</i> Bizzy gets to her feet, points her thumbs behind her. <i>“Great ass. There’s no denying that, is there?”</i>");

	output("\n\nNot really. A lovely full bubble shape fills out her jeans, both owning and accentuating her long thighs. She hops onto the couch, straightens one leg and then the other sharply, letting you see the hypnotic scrunch and shift. She turns sideways to you, smiling, and runs her hand through her long white hair, letting a wave of sinuous, erotic motion carry up her supple frame, tails curling up.");

	output("\n\n<i>“And... I like pleasuring people,”</i> she says, lively heat in her face. She bounces back down, and looks at you frankly. <i>“Just knowing people are getting joy out of seeing my body, as I do stuff, or others do stuff to it... I really like that. It’s annoying, in a way, because kaithrit guys always have the same attitude. I want to please and serve and perform for someone, not the other way around.”</i>");

	output("\n\nIt is noticeable that once the subject turns to sex, all of the kaithrit’s awkwardness seems to evaporate.");

	processTime(5);
	pc.lust(10+rand(5));

	//[Please Me] added to options
	opts.showPleaseMe = true;
	bizzyFirstTimeMenu(opts);
}

public function bizzyFirstTimePleaseMe(opts:Object):void
{
	clearOutput();
	showBizzyBust();

	output("Watching the cat-girl bounce around, and talk frankly about her subbiness, has sent plenty of juice pulsing down to your [pc.groin]. With a rakish smile and a slight shift of your [pc.thighs], you say that’s all well and good, but how much experience does she have with");
	if (pc.hasCock()) output(" handling dick");
	else output(" eating muff");
	output("?");

	output("\n\n<i>“You know [pc.Mr]. Steele,”</i> Bizzy responds softly, <i>“I thought you were never going to ask.”</i>");

	processTime(2);

	clearMenu();
	if (pc.hasCock()) addButton(0, "Next", bizzyFirstTimePleaseCock, opts);
	else addButton(0, "Next", bizzyFirstTimePleaseMeVag, opts);
}

public function bizzyFirstTimePleaseMeVag(opts:Object):void
{
	clearOutput();
	showBizzyBust();

	output("About thirty seconds later you’re leaning back into the couch");
	if (pc.isCrotchGarbed()) output(", [pc.lowerGarments] loosened");
	output(", a pair of arms wrapped around your [pc.thighs] and a lovely, wet, rough tongue hard at work between them.");

	output("\n\nBizzy’s fluffy white head bobs slightly as she licks your [pc.vagina] and flicks at your [pc.clit] until it’s bulging excitedly, with plenty of succulent noises and <i>‘mmm’</i>s, her wide green eyes drinking in your expression. When you groan your enjoyment, her tails curl upwards in clear delight.");
	if (pc.totalClits() > 1) output(" She doesn’t seem fazed by your exotic arrangement of pleasure buds, and gives plenty of wet, lapping attention to all of them, sending sheerest ecstasy throbbing through your groin.");

	output("\n\nShe goes into your tunnel nice and deep, pretty lips mashing against your soaked labia as she laps and flicks at your inner walls with her flat, rough tongue. Good girl! It seems completely natural to reward her with a scritch behind one of those pointy ears, which sends a purr trembling right through you.");

	output("\n\nAs your mouth opens with the sizeable orgasm coming, she sticks two fingers into your [pc.vagina] and then concentrates all of her oral efforts on your bulging clit, flicking at it furiously whilst fingering you. Oof, that’s good. You grasp handfuls of couch and oh wonderfully, rich rings of pleasure seizing up your cunt.");
	if (!pc.isSquirter()) output(" She performs her muff-diving duties wonderfully, thirstily lapping up the [pc.femcum] which trickles out between your lavish lips, shining them clean.");
	else output(" She’s clearly not anticipating a Steele-sized orgasm, spluttering as she gets a massive gush of [pc.femcum] up her nose. Still, she does her best, quickly fastening herself back onto your cunt and drinking down some of it, before pulling back and letting you drool the rest of it over her face.");

	output("\n\n<i>“More of the business delivered by Bizzy,”</i> she says, with a winning, [pc.femcum]-smeared smile up at you. <i>“Has a ring, right?”</i>");

	output("\n\nYou look down at her, your steaming pussy still in her face, simmering with post-coital satisfaction. It might not have been the best oral you’ve ever received, but it was performed with admirable enthusiasm and a surprising amount of skill.");

	processTime(10+rand(3));
	pc.orgasm();
	IncrementFlag("BIZZY_ATE_PUSSY");

	opts.hidePleaseMe = true;
	bizzyFirstTimeMenu(opts);
}

public function bizzyFirstTimePleaseCock(opts:Object):void
{
	clearOutput();
	showBizzyBust();
	
	output("About thirty seconds later you’re leaning back into the couch");
	if (pc.isCrotchGarbed()) output(", [pc.lowerGarments] loosened");
	output(", a warm hand wrapped around the base of your [pc.cock] and a lovely, warm, wet mouth around the top.");

	output("\n\nBizzy’s fluffy white head bobs up and down as she sucks you with plenty of succulent noises and <i>‘mmm’</i>s, her wide green eyes drinking in your expression. When you groan your enjoyment, her tails curl upwards in clear delight.");
	if (pc.biggestCockLength() >= 12) output(" She doesn’t seem fazed by the size of you, her mouth stretched wide open around your hot, veiny girth and taking it to the tonsils like a champ, clearly determined to please you.");

	output("\n\nShe takes you nice and deep, little <i>‘ulp’</i> sounds leaving her opened lips as");
	if (pc.biggestCockLength() <= 16) output(" all");
	else output(" a good portion");
	output(" of your [pc.cock] is kneaded by hot, silky mouth.");
	if (pc.balls > 0) output(" She even remembers to stroke and fondle your [pc.balls] as she does it.");
	output(" Good girl! It seems completely natural to reward her with a scritch behind one of those pointy ears, which sends a purr trembling right back through you.");

	var cumQ:Number = pc.cumQ();
	output("\n\nYou grasp handfuls of couch and orgasm wonderfully, a lovely, rich tide of [pc.cum] rising up and then");
	if (cumQ <= 500) output(" throbbing");
	else output(" flooding");
	output(" into her mouth.");
	if (cumQ <= 1500) output(" She performs her cocksucking duties wonderfully, throat working as she swallows most of it and then pulls out so that you can glaze her face with the rest.");
	else output(" Her cheeks bulge and then she coughs and splutters a lot of it onto the floor, clearly not anticipating a Steele-sized load. Still, she does her best, quickly fastening herself back onto your throbbing cock and swallowing down some of it, before pulling out and letting you glaze her face and hair with the rest.");

	output("\n\n<i>“More of the business delivered by Bizzy,”</i> she says, with a winning, [pc.cumColor]-dripping smile up at you. <i>“Has a ring, right?”</i>");

	output("\n\nYou look down at her, with your [pc.cock] still flopped over her pretty face, simmering with post-coital satisfaction. It might not have been the best blowjob you’ve ever received, but it was performed with admirable enthusiasm and a surprising amount of skill.");

	processTime(10+rand(3));
	pc.orgasm();
	IncrementFlag("BIZZY_SUCKED_COCK");

	opts.hidePleaseMe = true;
	bizzyFirstTimeMenu(opts);
}

public function bizzyFirstTimeRefuse(opts:Object):void
{
	clearOutput();
	showBizzyBust();

	if (pc.isNice() || pc.isMisc()) output("You let her down as gently as you can. You don’t have the time to manage a camgirl... owning someone like that grosses you out a bit... it’s not you or your company’s expertise... you’re sure there’s someone better equipped out there to do what she wants... It doesn’t prevent Bizzy’s face falling about a thousand miles.");
	else
	{
		output("You do her the courtesy of being frank and up-front. You aren’t a porn production company, and you don’t know why she thought you were. There’s probably someone out there who’d be willing to take her up on her offer, but it’s certainly not you.");
		output("\n\nBizzy’s face falls about a thousand miles.");
	}
	output("\n\n<i>“Ok,”</i> she mumbles, trying for a brave smile and failing.");
	if (opts.hidePleaseMe != undefined) output(" You kind of wish you hadn’t gotten oral off her now. There’s little worse than someone covered in cum looking that miserable.");
	output(" <i>“W-well. You always miss the shots you don’t take, right? Thank you for my ten minutes, [pc.Mr]. Steele. Don’t worry - you won’t hear from me again.”</i>");

	output("\n\nShe sees you to the door, and you leave the apartment block quickly. Kaithrit weeping sounds diabolical.");

	processTime(5);
	pc.addHard(10);

	moveTo("RESIDENTIAL DECK 13");

	clearMenu();
	addButton(0, "Next", mainGameMenu);

	flags["BIZZY_PORN_STUDIO"] = -1;
}

public function bizzyAcceptTheDeal(opts:Object):void
{
	clearOutput();
	showBizzyBust();

	output("Sure, why not? You have the money, you’d be helping this girl out in the way she wants, and despite that the deal is heavily weighted in your favor.");

	output("\n\nBizzy’s white ears prick up when you say you’d be happy to indenture her, as long as she understands the risks.");

	output("\n\n<i>“Yeesssss!”</i> she cheers. She freezes and colors when a neighbor bangs angrily on the wall. <i>“Uh... don’t worry about that. I-I’ve got soundproofing. Oh [pc.Mr]. Steele, I can’t tell you how happy you’ve made me! And - and don’t worry. I’m gonna make this work. I have all the gear, you can see, and - any gene-mods you give me will go straight onto my contract. See?”</i>");

	output("\n\nYou give the Sentient Acquisitions holo-contract she hands you a careful read. It seems to be exactly as she’s laid out to you: For 40k credits, you will own her");
	if (seraRecruited() || reahaRecruited())
	{
		output(" like you own");
		if (!seraRecruited()) output(" Reaha");
		else if (!reahaRecruited()) output(" Sera");
		else output(" Reaha and Sera");
	}
	output(" as well as the rights to anything she makes for the next 3 years minimum. And there’s a clause which allows extra servitude to be added on, if you and her agree to modifications and treatments necessary for her work. At interest.");

	output("\n\nYou put your thumbprint in the box below Bizzy’s own signature, which puts you in contact with your bank. After a minute or so, the transfer is made and the contract is struck. <b>You now own Bizzy!</b>");

	output("\n\n<i>“Wow. That’s - this has all happened so fast,”</i> murmurs the kaithrit, staring at the completed form. She looks less like someone who’s just become a virtual sex slave and more like she’s been offered a fresh lease of life.");
	if (opts.hidePleaseMe != undefined)
	{
		output(" The fact she’s still");
		if (pc.hasCock()) output(" festooned in [pc.cum]");
		else output(" smeared with [pc.femcum]");
		output(" is mildly comical.");
	}
	output(" She squeezes your arm passionately. <i>“You won’t regret this, [pc.Mr]. Steele. I - really want to make this work. You’ll, uh - you’ll bring over some boob expanders soon, right?”</i> Her face flushes a little a thought, an eager smile climbing onto her face. <i>“I can’t wait to get the kind of rack that’ll really draw the paying punters in.”</i>");

	output("\n\nYou finish up your tea and head towards the door, promising to check in with your newly acquired camgirl in a week, sooner if you have the time to get her some Tittyblossom.");

	output("\n\n<i>“Please do come back soon,”</i> the slim kaithrit makes you promise. <i>“I can’t wait to show you some of the stuff I’ve got in mind. Or - or if you want to try out the goods.”</i> She flushes again at the thought and her boldness, almost laughing at herself, revelling in her new status as the Famous [pc.Mr]. Steele’s piece of property.");

	processTime(10+rand(5));
	pc.credits -= 40000;

	flags["BIZZY_PORN_STUDIO"] = 1;
	flags["BIZZY_PORN_STUDIO_TIMER"] = GetGameTimestamp() + 1440;
	moveTo("RESIDENTIAL DECK 13");

	currentLocation = "RESIDENTIAL DECK 13";
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

