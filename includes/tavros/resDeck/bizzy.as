/*
BIZZY_PORN_STUDIO 	0/undefined, untouched state
					-1 refused to buy her out, further access disabled
					>= 1 Studio Stage
	Stage 1: flat-chested
	Stage 2: C-cup breasts
	Stage 3: DD cups
	Stage 4: J cups
	Stage 5: J cups, porn studio
	Stage 6: Boobs with a Bizzy attached

BIZZY_PORN_STUDIO_TIMER 	undef/zero available
							> 1 time entry will be available again

BIZZY_SEEN_NAKED	0/undefined nope
					1 Yep

BIZZY_MAIL_PAYMENT_DAY 	undef unset
						>= 0 The first day number the PC receives a pay out
Payout tiers:
	Stage 3: 300
	Stage 4: 2000
	Stage 5: Level 5 Bizzy should pay out 5k credits each month. The first special feature the PC activates per month adds 750 to the monthly total. Each subsequent feature activated adds 200 less than the one before, e.g. the second adds 550, the third adds 350 etc. Resets each month.
	Stage 6: 6000

BIZZY_SLAVER_CHOICE		undef/0 none
						1 Tat
						2 collar
						3 both

BIZZY_DIET 	0/undefined Dildo
			1 Normal
			2 Cum

BIZZY_BOTTIE_PERSONALITY 	0/undefined Normal
						1 Pet Owner
						2 Domme

BIZZY_CAN_TALK_MOTHER	0/undefined No
						1 Yes
						2 Repeat

BIZZY_BIG_ENOUGH	0/undefined Undiscussed
					1 Option available
					2 Go Bigger
					3 Big enough

BIZZY_MONTHLY_FEATURES	undefined	Never done
						else: how many features done ever

BIZZY_FEATURE_COOLDOWN	Controls the cooldown for features

BIZZY_MITZI_CUNTNOSIS	undefined Hasn't done
						false: hasn't done that month
						true: has done that month

BIZZY_MITZI_DOUBLE_DICK	undefined Hasn't done
						false: hasn't done that month
						true: has done that month

MITZI_BRANDED	undefined/0 No
				1 Yes

BIZZY_SERA_BDSM			undefined Hasn't done
						false: hasn't done that month
						true: has done that month


BIZZY_SERA_DOUBLE_ANAL	undefined Hasn't done
						false: hasn't done that month
						true: has done that month

SERA_BRANDED

Potential future content flags:
BIZZY_LACTATING	0/undefined No
				1 Yes

BIZZY_FLAT_ACCEPTANCE_COUNTER 	0/undefined Wants big boobs
								lots Accepts her body as-is

*/

//Put here for convenience
public function hasOtherSlutsForBizzy():int
{
	var sluts:int = 0;

	if (seraIsCrew() && flags["SERA_OBEDIENCE"] == 80) sluts++;
	if (mitziIsCrew()) sluts++;
	
	return sluts;
}


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

//Figure this out
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

		var payAmounts:Array = [300, 2000, 5000, 6000]; // This should handle the payments not working, I forgot we go up to stage 5 at the very end without touching the payments
		//Changing base stage 5 to 5000 for convenience and because it seems silly for the PC to spend all that money on a porn studio and not see greater returns

		// The player should never be able to change the stage (and thus per month payout level)
		// Whilst also passing more than 1 payment period so we can just assume payouts across
		// 2 or more periods (if it ever happens) will have to be at the current stage.
		var actualPay:int = (payAmounts[Math.min(flags["BIZZY_PORN_STUDIO"] - 3, 3)] * numPays);
		
		
		//Processes the feature payouts
		if (flags["BIZZY_PORN_STUDIO"] == 5 && flags["BIZZY_BIG_ENOUGH"] == 3)
		{
			var features:int = 0;
			
			if (flags["BIZZY_MITZI_DOUBLE_DICK"])
			{
				features++;
				flags["BIZZY_MITZI_DOUBLE_DICK"] = false;
			}

			if (flags["BIZZY_MITZI_CUNTNOSIS"])
			{
				features++;
				flags["BIZZY_MITZI_CUNTNOSIS"] = false;
			}
			
			if (flags["BIZZY_SERA_DOUBLE_ANAL"])
			{
				features++;
				flags["BIZZY_SERA_DOUBLE_ANAL"] = false;
			}

			for (var featurePayment:int = 750; features > 0; features--)
			{
				actualPay += featurePayment;
				featurePayment -= 200;
				if (featurePayment < 50) featurePayment = 50;
			}
		}
		
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
	// Stage 4/5: J cups
	else if(flags["BIZZY_PORN_STUDIO"] <= 5) sBust += "_4";
	// Stage 6: Boobs with a Bizzy attached
	//else sBust += "_6";
	//No bust since it doesn't exist yet
	else
	{
		sBust = "";
		return sBust;
	}
	
	
	//Optional collar
	if (bizzySlaveCollar()) sBust += "_COLLAR"; // neck
	//if(bizzySlaveTat()) sBust += "_TATTOO"; // butt
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
	if (flags["BIZZY_PORN_STUDIO"] == 5 && flags["BIZZY_BIG_ENOUGH"] != 2)
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
	
	if (flags["BIZZY_PORN_STUDIO"] == 5 && flags["BIZZY_BIG_ENOUGH"] == 2)
	{
		if(GetGameTimestamp() < flags["BIZZY_PORN_STUDIO_TIMER"])
		{
			addDisabledButton(btnSlot, "KnockNorth", "Knock North", "Bizzy is still busy preparing for her big expansion. Come back tomorrow.");
		}

		else
		{
			output(" The moment the door opens you are grabbed and hustled inside by a buxom white-haired feline whirlwind.");

			output("\n\n<i>“I thought you were never gonna arrive,”</i> Bizzy purrs, tails lashing. She plonks you down on a sofa, pushes a tablet device into your hands. <i>“Everything’s ready. All you’ve got to do... is watch.”</i>");

			addButton(btnSlot, "Next", bizzyStage5BiggerGrow, undefined, "Next", "Time for the show.");
		}
		return;
	}

	if (flags["BIZZY_PORN_STUDIO"] == 6 && flags["BIZZY_PORN_STUDIO_TIMER"] > GetGameTimestamp())
	{
		output(" There’s more building work going on in Apartment 155, the set of [pornStudioName]. Not as serious as last time, but still, you should give the labourers and drones in there space.");

		addDisabledButton(btnSlot, "KnockNorth", "Knock North", "Giving the place a wide-berth whilst the work-crews are still hard at it would be advisable.");
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
	else if (flags["BIZZY_PORN_STUDIO"] == 6)
	{
		bizzyStage6();
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
		case 6: bizzyStage6Menu(); break;
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
		case 6: bizzyStage6Leave(); break;
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

	if (pc.lust() >= 33 && pc.hasCock()) addButton(btnSlot++, "Vaginal", bizzySexVaginal, fromItem, "Vaginal", (flags["BIZZY_PORN_STUDIO"] < 6 ?"Bend her over the couch.":"Split her up against the bed."));
	else if (pc.lust() < 33) addDisabledButton(btnSlot++, "Vaginal", "Vaginal", "You’re not turned on enough for this.");
	else addDisabledButton(btnSlot++, "Vaginal", "Vaginal", "You need a cock to give her a good seeing to.");

	if (pc.biggestTitSize() >= 3 && pc.lust() >= 33) addButton(btnSlot++, "BoobyRubs", bizzyBoobyRubs, fromItem, "Booby Rubs", "Aren’t boobs nice? Compare yours with hers.");
	else if (pc.lust() < 33) addDisabledButton(btnSlot++, "BoobyRubs", "Booby Rubs", "You’re not turned on enough for this.");
	else addDisabledButton(btnSlot++, "BoobyRubs", "Booby Rubs", "You need to be rockin’ a rack of your own to get down with some fat tiddy pillow squishing.");

	if (pc.hasCock())
	{
		if (pc.lust() < 33) addDisabledButton(btnSlot++, (pc.hasVagina() ? "Oral (M)" : "Oral"), (pc.hasVagina() ? "Oral (Cock)" : "Oral"), "You’re not turned on enough for this.");
		else addButton(btnSlot++, (pc.hasVagina() ? "Oral (M)" : "Oral"), bizzySexOral, [false, fromItem], (pc.hasVagina() ? "Oral (Cock)" : "Oral"), (flags["BIZZY_PORN_STUDIO"] < 6 ? "Why own a camwhore if you can’t get a sloppy blowjob whenever you wish?":"This will require a little climbing."));
	}
	if (pc.hasVagina())
	{
		if (pc.lust() < 33) addDisabledButton(btnSlot++, (pc.hasCock() ? "Oral (F)" : "Oral"), (pc.hasCock() ? "Oral (Vag)" : "Oral"), "You’re not turned on enough for this.");
		else addButton(btnSlot++, (pc.hasCock() ? "Oral (F)" : "Oral"), bizzySexOral, [true, fromItem], (pc.hasCock() ? "Oral (Vag)" : "Oral"), (flags["BIZZY_PORN_STUDIO"] < 6 ? "Cats are good at licking.":"This will require a little climbing."));
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
	else if (flags["BIZZY_PORN_STUDIO"] < 6)
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
	else 
	{
		output("For a moment you just pull back and consider, in solemn awe, the tits you’ve given Bizzy. Many feet wide, thick, luscious nipples each the size of an average human breast themselves, round, plump hills of peach that beg you to lose yourself in them, miracles of modern biotechnology, an unearthly banquet of feminine flesh that cannot help but make [pc.eachCock] rocket into erection every time you behold them. Yours to do with as you wish, whenever you wish.");

		output("\n\n<i>“You’re staring, [pc.Mr] Steele,”</i> Bizzy says with a tut. She pats them briskly, sending a wave of hypnotic wave of jiggly motion down them, the line of her endless pale cleavage shaking. She sucks her lips in, emerald eyes set to come hither. <i>“You should stop that, and come over here and actually do something about them.”</i>");

		output("\n\nYou [pc.move] across and set your hands against them, push into them, feel their endless, endless give. Bizzy sighs, uttering quiet little chirrs and mewls as you paw them, take great handfuls of them and then let go, observing their wonderful suppleness, jiggling back into shape. Apparently they’re just as sensitive as they were when they were tiny: truly vast erogenous zones that don’t just immobilize her but enmesh her in a prison of sensuality. When you lean over to catch her eyes, they’re utterly dilated, grin dopy from your fondling.");

		output("\n\n<i>“They’re soooo good, aren’t they? Imagine ever - wanting to get rid of them. Ohh [pc.Mr] Steele, just like that... </i>” she groans, as you grasp one nipple and roll the squeezy, moist button around your palm.");

		output("\n\nSo, here’s a thing: a horizontal titfuck. Just walking up to your bitch and sticking your burningly erect [pc.cockNoun] into the soft, silkiness of her gigantic boobs, nestling it deep into the sweet-smelling darkness in there. What a time to be alive.");

		if (pc.biggestCockLength() < 8)
		{
			output("\n\nYour [pc.thighs] press into her softness as you attempt to find the <i>real</i> tightness, deep in her mountainous cleavage. It’s useless: Your [pc.cock], a modest, entirely normal-sized thing, can barely fit its head beyond where her breasts dip together.");

			output("\n\n<i>“Have you put it in yet, [pc.Mr] Steele?”</i> she coos. You murmur as she presses her hands into them and squeezes, sweet trembles around your [pc.cockHead]. <i>“C’mon, really pump it in. I’m waiting!”</i>");

			output("\n\nYou do your best, gripping great armfuls of soft tit, pressing the pillowy give together and then bapping your [pc.thighs] into it, rubbing your length into that lovely velvety friction. It’s heaven, sheer joy beginning to course up your [pc.cock], but it mostly makes Bizzy giggle and laugh. You’re tickling her.");

			output("\n\n<i>“You really enjoying that, [pc.Mr] Steele? Wow, I guess you are,”</i> she says, as a groan of ecstasy escapes your mouth. Your nerve endings likes up as she shakes herself, tectonic jello quaking around your mere cock, utterly lost in it. <i>“That’s cool. Maybe I could do a different sort of segment now, with sissy boys? I could tease their cute little cocks and they can’t help but cum their brains out into my cleavage. It’s not my specialty, but I could learn... if this is something you really like, [pc.Mr] Steele... ?”</i>");

			output("\n\nHearing your pet camwhore cheek you like this is humiliating, but the burn of that is intoxicating, prickling your skin, making your [pc.cock] twitch... you cum with a gasping groaning, squirting [pc.cum] into her kneading softness, [pc.cumColor] seed spurting out of the warm cleavage as you reactively thrust your [pc.hips] against her.");

			output("\n\nYou pull back, [pc.cock] wilted and drooling, hot gratification and embarrassment throbbing through you. That... was certainly an experience you’re not used to getting with Bizzy.");

			output("\n\n<i>“Did you like that?”</i> Bizzy asks, peering over her breasts at you, echoing a question already circling around your brain. <i>“The way I’m leaking jizz down my front now <i>suggests</i> you did. Aww. I don’t mind doing it like that, you know? I love getting my [pc.Master] off... whichever way they like it.”</i>");

			output("\n\nThere’s a schoolgirl teasing note to that last sentence that makes your aching [pc.cock] throb again.");
		}

		else if (8 < pc.biggestCockLength() < 18)
		{
			output("\n\nYour [pc.thighs] press into her softness as you drive your [pc.cock] into the <i>real</i> tightness, the sweet-smelling dark valley that exists in there between mounds upon mounds of cat-girl titty. Your [pc.cock] is squashed in there, and it’s heaven itself to draw yourself back, feel the warm, silken brush all around it, and then thrust yourself into it again deep.");

			output("\n\nBizzy coos and giggles as you pound her breasts, quakes of motion travelling over her breasts like a fleshy sea, squeezing them together by the sides so you can go hog-wild, gripping arms of slut-pillow and slamming your [pc.thighs] into it. The truth is, even for a [pc.raceNoun] as formidably hung as you, Bizzy outsizes you: Your [pc.cock] is quite lost inside her massive cleavage, a sausage flung between two couch seats. Still, she doesn’t seem to mind.");

			output("\n\n<i>“Mmm, I love getting my [pc.master] off this way,”</i> she groans, as your lust ratchets up, the knead and push of those tits burgeoning around your burning [pc.cockNoun] making heat fizz through your head. <i>“I love feeling [pc.him] inside me this way... using my tits like a wild beast... </i>”");

			output("\n\nYou cum electrically, the silken knead and squish of Bizzy’s boobs filling your head, thrusting rich ropes of [pc.cum] deep into the darkness until it’s spurting out thickly up and down her cleavage, the wettest, filthiest sandwich in the galaxy. She keeps herself tight and still, pushing herself into you, a buttress of softness for you to judder yourself against until you are utterly spent.");

			output("\n\n<i>“Enjoyed yourself in there, didn’t you [pc.Mr] Steele?”</i> the kaithrit tinkles with laughter, hefting her boobs and examining the trailers and bubbles of [pc.cumColor] seed dripping over her. <i>“Guess I’ll need an extra shower from Ms Naida.”</i>");

			if (flags["BIZZY_BOTTIE_PERSONALITY"] == undefined || flags["BIZZY_BOTTIE_PERSONALITY"] == 0) output("\n\n<i>“I shall get on that as soon as you leave, [pc.Mr] Steele,”</i> the VI says briskly.");
			else if (flags["BIZZY_BOTTIE_PERSONALITY"] ==1) output("\n\nOf course, pet,”</i> says the VI brightly. <i>“We have to keep you clean for your owner. And maybe, if you’re good, I will give a boobgasm or three!”</i>");
			else output("\n\nAfter your ass-fucking,”</i> the VI replies coolly. <i>“Only good girls get pamperings.”</i>");
		}
		else
		{
			output("\n\nYour hard [pc.cockNoun] is as far out in front of you as Bizzy’s tits are in front of her, and they meet, your [pc.cockHead] parting her softness and spearing into the sweet-smelling darkness that lies between her colossal breasts, it’s like two entities separate from either of you interacting with each other.");

			output("\n\nExcept, of course, you can both feel it. She makes little sighs and purring mewls as you bury more and more of your hard, totemic meat into her plush, silky cleavage, and you growl with joy at the juicy pleasure that pulses back up it, your [pc.cock] throbbing with joy as more and more of it is wrapped up in whorish softness. Here, at last, is an object that can take it; here, at last, are a pair of tits worthy of being claimed by your dick. They called it ludicrous. They called it stupidly over-sized. They said it made you drop 50 IQ points every time you got an erection. Well, who’s stupid now?");

			output("\n\nYou murmur, and Bizzy squeaks slightly as the head pokes out at the top of her cleavage. It’s already beading pre, anticipating the unearthly tit-fuck that’s coming, and she licks it delicately off with her rough tongue, sending a shiver all the way back down to you" + (pc.balls == 0 ? ".":", making your [pc.balls] swell.") + " You lock eyes with Bizzy, grinning like an idiot, and you can see in her red, enlivened face she’s thinking the same thing you are.");

			output("\n\n<i>“You made me this way just to do this, didn’t you?”</i> she says, as you slowly pull yourself back, glorying in the <i>feet</i> of smooth, squishy pressure you are now being pleasured by. She smiles provocatively, and your breath catches slightly as she grabs the sides of her massive cans and squeezes them into you. <i>“Gave your kitty these <i>huge</i> titties... weighed her to the floor... all so you can fuck them with your massive, thick, alpha cock.”</i>");

			output("\n\nShe trails off in a lusty croon, high on her own tactility, high maybe on the smell and taste of your [pc.cock], and that’s all the impetus you need to begin thrusting yourself between those massive pillows, feel that rich softness rub and knead against your hot, hard flesh from every side, pleasure yourself with that deepest of creases.");

			output("\n\nYou roughly grasp handfuls of mammary, making her gasp, desirous of anchorage as the lust clouds your vision. It’s just that good - squeezing smoothness inundating your massive cock all the way down it in a way you rarely get to experience");
			if (pc.balls > 0) output(", making your [pc.balls] throb,");
			output(" squirting plentiful pre over Bizzy’s collarbone and chin with each fresh, juicy pump.");

			output("\n\n<i>“I love my owner’s big dick,”</i> she sighs, color high in her face, pressing those massive tits of hers together heroically, giving you that squeeze that practically milks the pre out of you. You mire yourself as deep as you can, pressing your body into that heavenly softness so your [pc.cockHead] pokes her in the face, and you grunt with pleasure as you feel her wet, rough tongue dance over it. <i>“Mmm... fills your head with all the right ideas. Fills Bizzy with all the ways that make her moan.”</i>");

			output("\n\nMaybe if you were Tank Kannon himself you could last a little longer doing this, but this is inhuman, godly pleasure you’re experiencing now, and when you pull back and really hump her, your slick pre coating the endless valley you’re claiming with vigorous pumps of your [pc.hips], at all gets too much. It bulges and bubbles up you, and then with an almost pained groan you flume [pc.cum] all over her face.");

			if (pc.cumQ() > 5000) output("\n\nShe keeps herself nice and still as your orgasm really takes hold, and in an almost uncontrollable splurge you festoon her face, hair and outstretched tongue in [pc.cumColor] seed, giving your whore the plastering she deserves. She cups her tits, getting as much of your [pc.cum] over them as she can. A lake of [pc.cum] has formed in her cleavage by the time you’re done, dripping thickly down the sides, utterly covered in your passionately delivered slut-feed.} Sheerest gratification envelopes you as you sink backwards, your tender [pc.cockNoun] finding its slick, sweet path back through her ridiculous cleavage.");

			output("\n\n<i>“Did you like that, [pc.Mr] Steele?”</i> She smiles at you through a mask of [pc.cum], teeth gleaming. <i>“Was it worth everything you poured into making me into this... <i>“ she spreads her hand over a giant, immobilizing orb of female meat. <i>“ ...just so you could fuck me like that?”</i>");

			output("\n\nIt really, really was.");
		}
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
	if (flags["BIZZY_PORN_STUDIO"] < 6)
	{
		if (flags["BIZZY_PORN_STUDIO"] <= 2) output(" bites her lip");
		else output(" leers at you, already anticipating what you’re going to do");
		output(", leaning back onto the couch and letting you clamber on top of her, divesting her of her top");
		if (flags["BIZZY_PORN_STUDIO"] == 1) output(", revealing her flat chest");
		else if (flags["BIZZY_PORN_STUDIO"] <= 4) output(" letting her nice, full breasts spill forth");
		else output(" releasing her huge, porno star assets in all their jiggling glory");
		output(". You lay your own [pc.chest] on top of her with a teasing smile, resting there for just a moment.");
	}
	else output(" knows by now what you’re about when you do this; she leers at you, hands describing circles over her massive mammaries, occasionally giving them a good squeeze, presenting them to you so that you can press your own [pc.chest] into her with a lusty smile, revelling in the soft, tactile embrace in happy silence for a few moments.");

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
	else if (flags["BIZZY_PORN_STUDIO"] < 6)
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
	else
	{
		if ((pc.biggestTitSize() < 194))
		{
			output("\n\n<i>“Look at you, darling,”</i> Bizzy coos. Your breasts are bee stings, simpering little teenage bumps, in comparison to the things they are pillowed up against. <i>“You remind me of me. Before I truly embraced giant titty-dom. And it feels <i>wonderful.</i>”</i> She sighs happily, again losing herself in fondling herself, squeezing great handfuls that make them shake and wobble against your [pc.boobs]. <i>“Why don’t you do the same to yourself?”</i> she asks huskily, emerald fire smoldering in her eyes. <i>“We could... expand. There’s room for two booby bimbos in [pornStudioName]. You’d like looking after both of us, wouldn’t you Naida?”</i>");

			if (flags["BIZZY_BOTTIE_PERSONALITY"] == undefined || flags["BIZZY_BOTTIE_PERSONALITY"] == 0) output("\n\n<i>“It would be my pleasure,”</i> the VI responds calmly.");
			else if (flags["BIZZY_BOTTIE_PERSONALITY"] == 1) output("\n\n<i>“<i>Two</i> booby pets to play with?”</i> the VI bubbles. <i>“I would be over the moon!”</i>");
			else output("\n\n<i>“Nothing would bring me greater pleasure than making both of you grovel before me,”</i> the VI responds crisply. <i>“I would have to remove [pc.Mr] Steele’s administrative powers, of course.”</i>");

			output("\n\nHer confidence, and sexuality, has ballooned in step with her breasts; you can hardly believe the shy kaithrit waif you once knew is this buxom strumpet beneath you, doing her best to tease and provoke you.");

			output("\n\nStill, you can get inside her head. Your response is to smile knowingly and move your [pc.chest] over hers, spreading tactile pleasure over your boobies, warmth that blooms deep into your softness" + (pc.isLactating() ? " and makes you drip[pc.milk] from your teats, moistening Bizzy’s own front, letting you spread the [pc.milkColor] across her with the paintbrush of your [pc.skin].":"."));

			output("\n\nBizzy’s pupils dilate as you do it, her lush lips parting. Her tits are so sensitive despite their largeness, and you know how much she enjoys you pleasuring them. You finger her as your [pc.nipples] pass over her own gigantic teats, cauliflower-sized objects that fill your hand when you squeeze them, eliciting little dribbles of kitty milk. As you do it you murmur that you love hearing her meow, but she must always remember who owns her ass, and who gave her those wonderful big titties, and how important it is she’s good and obedient and works hard. Good, obedient sluts get treats, like... this.");

			output("\n\nYou dig your fingers deep into one breast as you continue to fondle the eagerly erect pale nipple, and are rewarded with a tremble, a moan, and an even larger spurt of white, sweet fluid moistening your hand.");

			output("\n\n<i>“I love this so much,”</i> she mumbles, in a slightly stoned voice, as you step back from her, put your [pc.upperGarments] back on. <i>“Being the biggest titty kitty on the extranet... it’s everything I ever dreamed of.”</i>");
		}
		else
		{
			output("\n\nThis is... ludicrous. When the two of you bump your breasts together, your heads are about 10 feet apart. Between you are oceans of pillowy, jiggle flesh. Full grown men could drown themselves in that - would pay good money to do so.");

			output("\n\n<i>“Look at this,”</i> Bizzy says with a delighted, infectious giggle as you shift your tits over hers, making it all roll and quake. <i>“How do you... get around? I can barely even walk, the way I am.”</i>");

			if (silly)
			{
				output("\n\n<i>“I’m literally the protagonist of this universe,”</i> you respond. <i>“I can do whatever the fuck I want, no matter how ridiculous.”</i>");

				output("\n\n<i>“Oh.”</i> Bizzy’s ears droop a bit. <i>“So I’m... what? Just a fantasy? Mindless titillation?”</i>");

				output("\n\n<i>“Fraid so.”</i> You push your breasts into her, your [pc.nipples] tracing delicate patterns over her tender breasts. <i>“But it’s pretty fun, isn’t it? Being mindless titty-lation.”</i>");

				output("\n\n<i>“Yeah... </i>” she sighs, eyes closing blissfully as you pleasure her. <i>“I guess so.”</i>");
			}

			else
			{
				output("\n\nYou shrug. Sure, it’s difficult hauling these massive wobbly meatbags everywhere you go... but a strong back and a can-do attitude is all it really requires. And it’s not like you’re ever getting rid of them.");

				output("\n\n<i>“No,”</i> Bizzy responds ardently, rosy lust blooming in her face as your [pc.nipples] tracing delicate patterns over her tender breasts. <i>“I get that. Once you’ve grown them... you know you’re never going back.”</i>");
			}

			output("\n\nIt’s an effort to make your [pc.boobs] move and sway by your own steam, but once they are, they are. Bizzy sighs with pleasure as you press into her, allowing the palpitation to flow back and forth between you, rolling steppes of soft queendom filled with delightful sensation.");

			output("\n\n<i>“Ohh... </i>” she groans. You can feel her nipples moistening against your [pc.skinFurScales], somewhere out there. <i>“You’ve thought about joining me, haven’t you?”</i> she asks huskily, emerald fire smoldering in her eyes. <i>“Imagine how much people would pay to see this... there’s room for two booby bimbos in [pornStudioName]. You’d like looking after both of us, wouldn’t you Naida?”</i>");

			if (flags["BIZZY_BOTTIE_PERSONALITY"] == undefined || flags["BIZZY_BOTTIE_PERSONALITY"] == 0) output("\n\n<i>“It would be my pleasure,”</i> the VI responds calmly.");
			else if (flags["BIZZY_BOTTIE_PERSONALITY"] == 1) output("\n\n<i>“<i>Two</i> booby pets to play with?”</i> the VI bubbles. <i>“I would be over the moon!”</i>");
			else output("\n\n<i>“Nothing would bring me greater pleasure than making both of you grovel before me,”</i> the VI responds crisply. <i>“I would have to remove [pc.Mr] Steele’s administrative powers first, of course.”</i>");

			output("\n\nVoid, it is such a tempting thought... to lose yourself entirely in the sensuousness of your ludicrous form, like Bizzy has, perform every night with them for massive audience hypnotized by your tits. You allow those filthy thoughts to overwhelm you and speak them, tell Bizzy how much you like doing this with her, how horny seeing her whore herself makes you, what a good titty monster she is...");

			output("\n\nYou press your [pc.chest] deep into her as you do it, and are rewarded with a tremble, a meowing moan, and sweet fluid warming your front. A lovely little boobgasm.");

			output("\n\n<i>“I love this so much,”</i> she mumbles, in a slightly stoned voice, as you step back from her, clamber back into your [pc.upperGarments]. <i>“Being the biggest titty kitty on the extranet... it’s everything I ever dreamed of.”</i>");
		}
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
		if (flags["BIZZY_PORN_STUDIO"] < 6)
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
		}

		else 
		{
			output("You open your [pc.thighs] a little, and with a smile tell Bizzy to do what she’s good at.");

			output("\n\n<i>“You, uh, need to come to me if you want that, [pc.Mr] Steele,”</i> she says with a mischievous giggle. She pats her boobs. Jiggle jiggle. <i>“I can’t really get on my knees for you anymore.”</i> She licks her plush lips, makes them gleam. <i>“You <i>do</i> want it, though? I think you do...</i>”");

			output("\n\nYou leave your [pc.lowerGarments] behind you as you begin the ascent of Mount Bizzy. ");
			if (pc.tallness < 69 ) output("She coos and laughs as you haul your petite frame onto the top of those ludicrous beachballs of hers, seeming to mostly find your weight tickly. You could use her as a bouncy castle!");
			else output("You’re a bit worried about putting your weight on her - her tits are quite sensitive and you aren’t small - but she takes your clambering easily and when you crest her you find the soft, pillowy mass easily supports you. Oh, this is <i>delightful</i >.");

		output("\n\n<i>“That’s what I thought,”</i> Bizzy coos, gazing up at you as you straddle her chest, admiring the pretty face and green bedroom eyes below you. You murmur with pleasure as she grasps your [pc.cock], expertly running her fingers up the sensitive side. <i>“A mere pair of massive boobies isn’t going to stop [pc.Mr] Steele getting [pc.his] cock sucked by the best in the business.</i>”");

		output("\n\nYou let her do her thing to begin with - " + (flags["BIZZY_DIET"] == 1 ?  "she’s a professional, after all.":"she receives vigorous training at this from Naida every day, after all.") + " She flicks at your [pc.cockHead] with your tongue as she jerks your length into a fully fledged boner, delightfully delicate sensation that segues into a wet, gloving suck, her fluffy white head bobbing up and down as she sucks you with plenty of succulent noises and ‘mmm’s, her wide green eyes drinking in your expression. When you groan your enjoyment, her tails curl upwards in clear delight.");
		if (flags["BIZZY_DIET"] == 1) output(" You also detect a certain neediness in her eyes, particularly when you ooze pre along her tongue. The eyes of a dedicated cumslut greedily in sight of an extra meal.");

		output("\n\nShe takes you nice and deep,");
		if (pc.biggestCockLength() > 12) output(" unfazed by the size of you,");
		output(" little ‘ulp’ sounds leaving her opened lips as " + (pc.biggestCockLength() > 12 ? "all":"a good portion") + " of your [pc.cock] is kneaded by hot, silky mouth.");
		if (pc.biggestCockLength() > 8) output("It rouses you to take matters into your own hands: To grasp her behind the back of her head and firmly holster your dripping [pc.cockNoun] into her throat, draw out glottal wet sounds from that tight, hot cavern, dipping yourself in there gloriously before unsheathing yourself entirely, saliva trailing from your [pc.cockNoun] as you release her. She pants hard a couple of times, then trails her flat, rough tongue up the burning underside.");
		else output("You give her more and more, and as your lust rises to a sharp point you grasp her by the back of her head and firmly holster your entire [pc.cockNoun] into her mouth, stopping her entirely for a few moments before coming loose, saliva trailing from your [pc.cockNoun] as you release her. She pants hard a couple of times, then trails her flat, rough tongue up the burning underside.");

		output("\n\n<i>“Harder,”</i> she says.");

		output("\n\nGrasping a good handful of silken white hair, you face-fuck Bizzy to your heart’s content, spearing your [pc.cock] into her exquisitely well-trained throat, the clenching wet silk drawing up and down your febrile flesh forcing out ample amounts of pre");
		if (pc.balls > 0) output(", your [pc.balls");
		output(" soon beating a filthy rhythm against her delicate chin.");
		if (bizzySlaveCollar()) output(" Her neck thickens and contracts around the steel of her collar. No snapping <i>that</i> choker.");
		output(" Your [pc.legs] dig into the softness of her breasts, and that seems to drive her wild, whimpering with delight, grabbing your [pc.thighs] and almost face-fucking herself onto you.");

		output("\n\nYou arch your back, press her as far onto your dick as you can and orgasm, a lovely, rich tide of [pc.cum] rising up and then " + (pc.cumQ() > 500 ? "throbbing":"flooding") + " into her mouth.");
		if (pc.cumQ() < 1500) 
		{
			output(" She performs her cocksucking duties wonderfully, throat working as she swallows most of it and then pulls out so that you can glaze her face with the rest. ");
			if (pc.balls > 0) output("She even remembers to stroke and fondle your [pc.balls] as she does it. ");
		}
		else output(" She’s fully trained for a Steele-sized load. Her throat works gallantly as she swallows down mouthful after mouthful of [pc.cumFlavor] treat, her trim belly taking on a definitive curve. She’s not going to need any lunch today! Then she withdraws and presents her open mouth and closed eyes to you, enjoyable targets to paint [pc.cumColor] with one juicy clench after another. She’s utterly festooned in it by the time you’re done.");
		output(" Good girl! You reward her with a scritch behind one of those pointy ears, which sends a purr trembling right back through you.");

		if (flags["BIZZY_DIET"] != 2)
		{
			output("\n\n<i>“Mmmm... more of the business delivered by Bizzy,”</i> she says, with a winning, [pc.cumColor]-dripping smile up at you. <i>“You’ll climb mountains to get some of that, won’t you [pc.Mr] Steele?”</i>");

		output("\n\nYou answer that by giving her another scritch behind the ear, making her bend her head into your hand and purr.");
		}

		else 
		{
			output("\n\nIf else: <i>“Thank you for the snack, [pc.Mr] Steele - I was getting kinda hungry,”</i> she says, greedily lapping up the warm, fecund residue. <i>“I always tell my donators that their cum is the best I’ve ever tasted. But secretly: My owner’s is all I really want.”</i>");

			output("\n\nYou give her a scritch behind the ear, making her bend her head into your hand and purr. What a good cumslut.");
		}

		pc.orgasm();

		}
		IncrementFlag("BIZZY_SUCKED_COCK");
	}
	else
	{
		if (flags["BIZZY_PORN_STUDIO"] < 6)
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
		}

		else
		{
			output("You loosen your [pc.lowerGarments], expose [pc.eachVagina] to the cool air. Bizzy’s emerald eyes flick down; smirking, you ask if she’s seen something that interests her.");

			output("\n\n<i>“Maybe, [pc.Mr] Steele,”</i> she answers coquettishly. <i>“But, uh. You’re gonna have to come up here if I’m gonna check. I can’t exactly get on my knees anymore... </i>”");

			output("\n\nYou leave your [pc.lowerGarments] behind you as you begin the ascent of Mount Bizzy. " + (pc.tallness > 69 ? "She coos and laughs as you haul your petite frame onto the top of those ludicrous beachballs of hers, seeming to mostly find your weight tickly. You could use her as a bouncy castle!":"You’re a bit worried about putting your weight on her - her tits are quite sensitive and you aren’t small - but she takes your clambering easily and when you crest her you find the soft, pillowy mass easily supports you. Oh, this is <i>delightful</i>."));

			output("\n\n<i>“Yyyeah, as I thought,”</i> Bizzy coos, gazing up at you as you straddle her face, smirking up at you between the v of your [pc.thighs]. You murmur with pleasure as she slides her finger along the line of your [pc.vagina], finding your [pc.clit] and giving it a tiny flick. <i>“It’s [pc.Mr] Steele’s lovely wet twat I spied. That does interest me a great deal... </i>”");

			output("\n\nShe grasps your [pc.ass] and leans inwards, her wet, slightly rough tongue flicking over your mound and then inside to your delicate innards. Her fluffy white head bobs slightly as she licks your [pc.vagina] and flicks at your [pc.clit] until it’s bulging excitedly, with plenty of succulent noises and ‘mmm’s, her wide green eyes drinking in your expression. When you groan your enjoyment, her tails curl upwards in clear delight. ");
			if (pc.totalClits() > 1) output("She doesn’t seem fazed by your exotic arrangement of pleasure buds, and gives plenty of wet, lapping attention to all of them, sending sheerest ecstasy throbbing through your groin.");

			output("\n\nShe goes into your tunnel nice and deep, pretty lips mashing against your soaked labia as she laps and flicks at your inner walls with her flat, rough tongue. Good girl! It seems completely natural to reward her with a scritch behind one of those pointy ears, which sends a purr trembling right through you.");

			output("\n\nAs your mouth opens with the sizeable orgasm coming, she sticks two fingers into your [pc.vagina] and then concentrates all of her oral efforts on your bulging clit, flicking at it furiously whilst fingering you. Oof, that’s good. You take a firm grip of her silky hair and shove her face deep into you, and expert flicks of a catgirl’s tongue drops you over the edge of a wonderful orgasm, rich rings of pleasure seizing up your cunt.");
			if (pc.isSquirter()) output(" She’s trained for your juiced-up anatomy, these days. She lets the first massive gush of [pc.femcum] warm her face, marking her with your scent, before she fastens herself back onto your throbbing cunt and drinks the cascade of [pc.femCumFlavor] down, throat working gallantly. She’s not going to need any tea for a while, that’s for damn sure.");

			output("\n\n<i>“More of the business delivered by Bizzy,”</i> she says at last, with a winning, [pc.femcum]-smeared smile up at you. <i>“Did you like that, [pc.Mr] Steele?”</i>");

			output("\n\nYou relax back on a bed of soft booby and look down at her, your steaming pussy still in her face, simmering with post-coital satisfaction. Yeah, that deserves another ear scritch. Your pet muff-diver bends her head into your hand, purring as you get at <i>that</i> particular spot.");
		}

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
	else if (flags["BIZZY_PORN_STUDIO"] < 6)
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
	else
	{
		output("You let her see the devilish fire in your face before you grab her by the torso, molding your hand into a nylon-clad buttock and laying your [pc.lips] on her pale neck. You need to come at her from the side these days, but that’s fine: There’s plenty of lovely, lithe flesh here to work with.");

		output("\n\n<i>“You want some Bizzy, do you [pc.Mr] Steele?”</i> she purrs into your ear, thigh rubbing up against yours. <i>“Of course you do. You’ll never get enough of it....”</i>");

		output("\n\nThe well-practised kaithrit’s doing her sultry femme fatale thing, but she can’t disguise the eagerness in her eyes, the pulse quickening in her veins that you can feel beneath your [pc.lips] when you hungrily kiss her neck and trace her clavicle with your [pc.tongue]. Nor can she help the wetness, the soft give you can feel when you push your hand between her thighs, finger her through the thin fabric. A small hand finds its way" + (pc.isCrotchGarbed() ? " through your [pc.lowerGarments]":"") + " to your [pc.cock], and you groan as she masturbates you, shifting fluidly between tight and vigorous one moment, soft and teasing the next. Void, she’s gotten so good at that.");

		output("\n\nShe gasps and then squeals in delight when, with one firm movement, you flip her onto the bed on her back. Her breasts move like giant, jiggly continents, shifting backwards towards the new centre of gravity so that her head-sized nipples are now pointing at the ceiling and she is smothered underneath the weight of them. She air-pedals her long legs in the air, pinned by her own anatomy, helpless to your predations. Perfect.");

		output("\n\nYou pull her shorts off and tease the kaithrit for a little while, squeezing her lovely plump thighs and ass, finger finding and circling her clit until it’s bulging needily beneath your touch, sliding your other hand up her hourglass sides to grope her tits, until her sighs and coos have transformed into mewls of real need, femcum dampening your busy fingers.");

		output("\n\n<i>“Ohh, put it in, [pc.Mr] Steele,”</i> she pleads, splaying her thighs and exposing her flush, gently parted twat needily. <i>“Your ");

		if(flags["BIZZY_BOTTIE_PERSONALITY"] == 0 || flags["BIZZY_BOTTIE_PERSONALITY"] == undefined) output("girl ");
		else if (flags["BIZZY_BOTTIE_PERSONALITY"] == 1) output("pet ");
		else output("slave "); 

		output("wants it so bad... ohhhhhh... </i>” It’s a sound of pure, slutty perfection, produced by finally positioning your [pc.cock] against her over-stimulated hole and pushing into her silky innards, precipitating a clear, warm welter of kaithrit juices down her thighs.");

		output("\n\nYou rock into her slowly for a few moments, just enjoying the simmering sumptuousness of her plump, soaking cunt around your [pc.cockNoun]. Bizzy’s sex is highly practised these days though, and almost immediately she’s bucking her ass back into you, impatient to be really taken for a ride. You happily acquiesce, taking big handfuls of her ample tits and thrusting yourself roughly into her, beating out a filthy, squelching rhythm between her opened thighs.");

		output("\n\n<i>“That’s it, [pc.Mr] Steele!”</i> she yowls merrily. You can’t see her face behind all of that heaving flesh, but that in a way makes the sounds you produce out of her all the better.  <i>“Give it to me hard! Oh, I’m your " + (bizzySlaveCollar() ? " collared ":"") + "pet! I’m your toy! I’m your slut! I love it so much!”</i>");

		//Small dick
 		if (pc.biggestCockLength() < 5)
			output("\n\nYou suspect that she’s putting a lot of this on, performer that she is - anyone who’s watched her show will know the kaithrit is very used to large insertions these days, and frankly your [pc.cock] is barely touching the sides. Still, she clearly thrills from getting you off, so where’s the harm?");

		//Big dick
		if (pc.biggestCockLength() > 12) output("\n\nYou groan with pleasure. She’s been practising - as anyone who’s watched her show will attest - and now she can take your massive dick with aplomb. It’s tight and wet and you can <i>fit so much in</i>, and what’s more it clearly causes Bizzy paroxysms of joy, writhing and shivering around you with unaffected glee.");


		output("\n\nClear juices drool down your " + (pc.balls > 0 ? "[pc.balls]":"[pc.legs]") + " as you lose yourself in the rhythm of it, slapping your [pc.thighs] into the pale, wobbling thighs of your pet camwhore. The weight of her tits anchor her to the mattress; you can really go at the experienced camwhore, the traction you have to pound her out of this world.");
		if (bizzySlaveTat()) output(" You clutch the  tattoo on her fleshy backside admiringly, watching it jiggle and shake. Your piece of property, yours to use, whenever you feel the whim.");

		output("\n\nYour orgasm is one of those that seems to electrify your whole body, galvanized by Bizzy’s enthralling tactility and histrionics. Nerve endings in your [pc.feet] tingle as you seize her hips and rocket [pc.cum] into the fever dream of her cunt, your " + (pc.balls > 0 ? "pc.balls":"[pc.cock]") + " seizing up, filling her up with [pc.cumColor] seed with one ardent thrust of your [pc.hips] after another.");

		output("\n\nBizzy cries out, upraised feet wriggling with joy. Even now she gives back expertly, milking your [pc.cockNoun] with perfect little jounces of her hip, craning her pussy back along your throbbing shaft.");

		if (pc.cumQ() > 5000) output(" She keeps doing it even when her belly is swollen out with your massive load, raining out from her thoroughly packed cunt all over the red sheets.");

		output("\n\nYou relax against her when you’re done, feeling gently steamed. You crawl up onto her lovely warm breasts, find her reddened face and silky hair, spend a little while there fondling and stroking her.");

		output("\n\n<i>“Aren’t I good, [pc.Mr] Steele?”</i> she purrs, dilated, bedroom eyes on you as she cuddles you back. <i>“So good you can barely think of anything but doing me, when I’m around.”</i> She bites her lip");
		if (pc.cumQ() > 5000) output(", and sighs huskily as [pc.cum] oozes heavily out of her utterly stuffed pussy");

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

/* Stage 6 */
public function bizzyStage6():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	//First time meeting
	if (flags["BIZZY_CONSTRUCTION_COMPLETE"] == undefined)
	{
		output("The door of 155 opens when you approach it. A screen flips downwards from the ceiling inside, supported on thin, telescoping limbs. An orange, feminine face coalesces upon it, smiles at you brightly.");

		output("\n\n<i>“Hello [pc.Mr] Steele,”</i> she says in a pleasant, artificial voice. <i>“My name is Naida. It is a pleasure to meet you, my director. I am a virtual intelligence built to assist artists and performers over-burdened by their talents. I am programmed to aid your indentured servant, Bezeneria d’Alysio. I am currently feeding her.”</i> She pauses for several moments, lips opened as if concentrating on something else. <i>“ ...mmm. There we go! Good girl. Please, [pc.Mr] Steele, step inside.”</i>");

		output("\n\nYou do so. The spacious cream-and-maroon living area is much the same, except now it has a dozen metal disc plates in the ceiling from which Naida and her tool-arms can emerge.");

		output("\n\n<i>“Hi [pc.Mr] Steele!”</i> Bizzy says, when you enter her bedroom. She’s wiping her mouth; a long, thick, purple dildo gleaming with saliva is slowly retracting itself back into the ceiling. <i>“I guess you’ve met Ms Naida. She’s uh... </i>“ she giggles, blushing. <i>“ ...a lot of fun. Show him everything, Ms Naida!”</i>");

		output("\n\nThe kaithrit’s on her big, heart-shaped bed, her ludicrous breasts lying over the side on the floor. She can’t really move from there ordinarily, but - as the ceiling-mounted VI shows you - close by there is a kind of wheeled harness which can fit the undersides of her boobs with an industrially sized grav-bra, supporting them in the air and allowing her to walk around.");

		output("\n\n<i>“How does she - can she get out of this room?”</i> you ask, gazing at the humble, ordinary door you came in through. Naida answers that with a click. The room throbs, and your stomach jumps slightly as the entire thing lifts upwards. After a few seconds the ceiling slides back, and beaming sunshine pours into the apartment as the floor rises upwards. You find yourself standing on the roof - which has tropical greenery, a large swimming pool and a lounging area. The bed disappears into the floor with a seamless click.");

		output("\n\nThis can’t be real, can it? It takes some moments of dissociated confusion to work out what’s going on. You have indeed emerged onto the roof of the apartment building, which now hosts a hard light holographic suite, as well as a bona fide swimming pool. Where the holograph ends and reality begins is almost impossible to tell." + (flags["MET_STELLA"] != undefined ? " It’s a smaller scale version of Stella’s Beach ‘n Surf, you realize.":""));

		output("\n\n<i>“Isn’t it great?”</i> says Bizzy cheerfully, sashaying about the warm tiles in her bikini bottoms. A floor-mounted tentacle arm bats a beachball at her, lofting it over her boobs so she can catch it. <i>“I can exercise up here, catch rays, and we can do even more sexy scenes by the pool! It’s perfect!”</i>");

		output("\n\n<i>“It cost less than you might think, [pc.Mr] Steele. This apartment building is not in the salubrious part of the Residential Deck,”</i> Naida murmurs in your ear. <i>“It and the interest it will incur have been entered onto her contract. At current rate of earning, you will now own her for around twenty years.”</i>");

		addButton(0, "Next", bizzyStage6Intro, undefined);
	}
	
	else
	{
		output("<i>“Hello, [pc.Mr] Steele. Please come inside.”</i>");

		output("\n\nNaida the VI’s tone towards you is as smooth and calm as ever. ");

		if (flags["BIZZY_BOTTIE_PERSONALITY"] == 1) output("The tone she uses towards Bizzy is much lighter and bouncier. You can hear her teasing your pet in the boudoir.");

		else if (flags["BIZZY_BOTTIE_PERSONALITY"] == 2) output("The tone she uses towards Bizzy is considerably stricter. You can hear her coolly issuing instructions to your slave in the boudoir.");

		else output("She uses much the same tone towards Bizzy; as you [pc.move] into the studio [pornStudioName], you can hear her conversing with the kaithrit in the boudoir.");

		output("\n\nYou poke your head into the lounge first. Every time you come back, you find that the cream-and-mahogany space has changed subtly: the lay-out or some piece of furniture has been altered, for some scene Bizzy, her crew and her ‘friends’ have been shooting. There’s nobody here now though, and Naida is at pains to clean up afterwards, which can be a substantial operation.");

		output("\n\nOnce you’ve made yourself the traditional cup of Roshan tea (you’ve watched her enough times to know exactly how to pinch the leaves and when to sprinkle), you head into the boudoir. Bizzy can’t get into the editing suite anymore, so she balances a small holo-device upon her tits in order to work.");

		if (flags["BIZZY_BOTTIE_PERSONALITY"] == 1) output("Leashes, tail-plugs and a doggie bowl lie scattered around.");

		else if (flags["BIZZY_BOTTIE_PERSONALITY"] == 2) output("Latex gear, paddles and whips lie scattered around.");

		if (flags["BIZZY_BOTTIE_PERSONALITY"] == 1)
		{
			output("\n\n<i>“She’s been a <i>very</i> good girl today [pc.Master],”</i> Naida coos, smiling out of one her many face-screens. <i>“She had 3 simultaneous orgasms during our morning session! Who’s a good girl?”</i>");

			output("\n\n“I am, Ms Naida,”</i> Bizzy mumbles, cheeks burning and trying not to smile. <i>“I’m just finishing up a scene, [pc.Mr] Steele. Wanna see?”</i>");
		}

		else if (flags["BIZZY_BOTTIE_PERSONALITY"] == 2)
		{
			output("\n\n<i>“Your owner is here, so we shall pause your correctional session,”</i> Naida says calmly. <i>“Once [pc.he]’s left - your ass is mine. What do you say?”</i>");

			output("\n\n<i>“Yes, Ms Naida. Thank you Ms Naida,”</i> Bizzy says meekly, cheeks red. <i>“Hello [pc.Mr] Steele. I’m just finishing up a scene. Wanna see?”</i>");
		}

		else output("\n\n<i>“Hi, [pc.Mr] Steele,”</i> The kaithrit’s smiles at you cheerfully when you enter. <i>“Just finishing up on a scene. Wanna see?”</i>");

	bizzyStage6Menu();
	}
}

public function bizzyStage6Intro():void
{
	clearOutput();

	output("You return down to the bedroom. Whilst Bizzy busies herself at the editing suite, Naida touches your shoulder with a metal filament and leads you over to a small console built into the lounge.");

	output("\n\n<i>“Here, you can control my settings [pc.Mr] Steele,”</i> she says from one of her dangling screens. <i>“How you wish me treat your indentured servant, as well as any others you acquire and send here. Please remember, I am beholden to you - and Bizzy is beholden to me. I know you will use that power... <i>“ she pauses again, smiling at you mischievously. <i>“ ...imaginatively. It was a pleasure to meet you, [pc.Mr] Steele.”</i>");

	flags["BIZZY_CONSTRUCTION_COMPLETE"] = 1;

	bizzyStage6Menu();
}

public function bizzyStage6Menu():void
{
	clearMenu();

	addButton(0, "Appearance", bizzyStage6Appearance);
	addButton(1, "Camshow", bizzyStage6Camshow);
	addButton(2, "Talk", talkAboutPersonalBizzness);
	addButton(3, "Sex", bizzySexMenu);
	addButton(4, "Settings", bizzyStage6Settings);

	addButton(14, "Leave", bizzyGoLeave);
}

public function bizzyStage6Leave():void
{
	clearOutput();
	showBizzyBust();

	output("You tell Bizzy you have to leave her to it.");

	output("\n\n<i>“See you soon, [pc.Mr] Steele... </i>” the teasing little trill follows you out of the door.");


	processTime(3+rand(3));

	currentLocation = "RESIDENTIAL DECK 13";

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bizzyStage6Appearance():void
{
	clearOutput();
	showBizzyBust();

	output("The well-known porn star Bezeneria d’Alysio, or Bizzy as she prefers to be known, is a 5’7”</i> kaithrit female. She has full white hair that reaches down to her back, and the fur on her pointy ears and two long tails is similarly white shot through with tendrils of black. She has green, cat-like eyes set in a peachy, luminous bloom of facial beauty wrought by the concentrated female hormones you’ve repeatedly dosed her with. She has plush, full lips and the cute, upturned nose - a bona fide stunner. " + (flags["BIZZY_DIET"] == 2 ? "Evidently the cum-only diet is doing her the world of good.":""));

	if (flags["BIZZY_BOTTIE_PERSONALITY"] == 0 || flags["BIZZY_BOTTIE_PERSONALITY"] == undefined) output("\n\nWith sexuality, beauty and their constant display to millions of drooling viewers has come confidence. The performance has completely eaten the performer, and the kitty cat is relaxed, smirking, exaggeratedly sensual, a sex pot that’s always ready to please and show herself off.");

	else output("Her success and beauty have gifted Bizzy confidence, however under the auspices of a VI that never lets her forget she is a " + (flags["BIZZY_BOTTIE_PERSONALITY"] == 2 ? "pet":"slave") + " her vampishness has pulled back a bit. Now her sexuality and sensuality feels like a lynx on a leash, ready to burst out and devour you or her panting audiences whenever the order is given, which only makes her even more captivating.");

	output("\n\nThere isn’t a bra in the galaxy that could constrain Bizzy’s breasts, which defy categorization. They are massive, round spheres of pale, pillowy flesh, each slightly wider than the span of her arms outstretched. On their own the round, chubby mountains of her nipples would be respectably sized boobs on a kaithrit her size. They swaddle out in front of her, preventing her from moving except with the help of her specially designed grav-bra, which can sit underneath them.");

	if (bizzySlaveCollar()) output(" She has an elegant steel collar around her neck, displaying her owned status. It has a hasp at the front, should you ever fancy taking her out on a leash and showing her off. Or if you just need something to hold onto when you’re fucking her.");

	output("\n\nOn her lower half Bizzy usually wears a simple pair of shorts and some sneakers; she is never far from needing to slip into a split skirt, a thong or nothing at all for a performance. Her wide thighs billow out into a round plump bottom, above which her tails sprout." + (bizzySlaveTat() ? "On one of her buttocks is tattoed the [pornStudioName] logo, an excellent, permanent reminder to her and her viewers who owns this sumptuous piece of ass.":"") + " Underneath her shorts, you know she’s abundantly female: a plump pair of lips curtain a soaking, pliant twat and protuberant clit, with a well-maintained pubic puff of white fur.");

	addDisabledButton(0, "Appearance");
}

public function bizzyStage6Camshow():void
{
	clearOutput();
	showBizzyBust();

	output("You squeeze into one of Bizzy’s warm, organic bean bags so she can show you what she’s been up to lately.");

	output("\n\nBizzy’s Business is one of bitch.tv’s top hundred accounts, a staple of the front page. Clicking on the white-furred portal drops a punter down a rabbithole of sex: softcore tease-streams and strips intended to coax them into subscribing and accessing the good stuff: fantastical shows that place Bizzy in utopian palaces, enchanted forests, deep, sexy dungeons, long streams where Bizzy goes impromptu, taking suggestions from viewers, playing music and games with her friends that get increasingly lewder as they go on. And, of course, straight up hardcore porn.");

	output("\n\nThe kaithrit is able to produce these steaming oceans of content because her life now is a relentless, mindwarping carnival of sex. You go into the editing suite and find an unedited recording of her day.");
 	
 	if (flags["BIZZY_DIET"] == 0 || flags["BIZZY_DIET"] == 2) output(" She gets her breakfast by either sucking off or being face-fucked by one of Naida’s many girthy, variously shaped dildos.");

 	if (flags["BIZZY_DIET"] == 0)output(" The VI murmurs with pleasure as she squirts nutritious vitamin mixture down the kaithrit’s throat, drooling out around her opened lips.");

 	else if (flags["BIZZY_DIET"] == 2)
 	{
 		output(" The VI murmurs with pleasure as she thrusts copious amounts of alabaster cum down the kaithrit’s throat, pulling out and painting her face and cleavage with whatever she doesn’t manage to swallow down.");

		output("\n\n<i>“Thank you to subscribers RuttingRode and ScopedNDropped69,”</i> she says afterwards to the camera, panting, patting her swollen belly and licking her oozing lips. <i>“Your nut was delicious!”</i>}");
	}

	//Normal personality
	if (flags["BIZZY_BOTTIE_PERSONALITY"] == 0 || flags["BIZZY_BOTTIE_PERSONALITY"] == undefined) output("\n\nAfter that Naida’s other tool arms descend, and Bizzy plans out the rest of the day whilst getting primped and prepped. Shortly thereafter her friends - or work colleagues, you suppose you should think of them as - begin to arrive. As well as Kanette and the kalabast there’s now a petite, black human girl who does the stretchy gymnastic stuff Bizzy is no longer really able to, and also a burly male thraggen who comes in to absolutely ruin her sometimes.");

	//P Owner personality 
	else if (flags["BIZZY_BOTTIE_PERSONALITY"] == 1)
	{
		output("\n\nAfter that Naida’s other tool arms descend. She fusses over her whilst teasing her, clasping her tits with long filaments and filling those vast erogenous zones of hers with vibrations whilst shampooing and combing her hair and stroking her tails. " + (rand(9) > 2 ? "She’s been a good girl in this recording, so once it’s all done a blunt vibe wand descends, she arches her back to expose her plump pussy and is juddered to a moaning, yowling orgasm.":"She’s a bad girl in this recording, cumming hard from the teasing before Naida is finished primping her, so is made to bow her head and present her rump so it can be turned a glowing red by a briskly swatting, ceiling-mounted paddle."));

		output("\n\nAll of this serves to get her really in the mood for when her friends - or work colleagues, you suppose you should think of them as - begin to arrive. As well as Kanette and the kalabast there’s now a petite, black human girl who does the stretchy gymnastic stuff Bizzy is no longer really able to, and also a burly male thraggen who comes in to absolutely ruin her sometimes.");
	}

	//Domme personality
	else 
	{
		output("\n\nAfter that a correctional session begins, which entails Bizzy’ being blindfolded, her limbs and head being encased in black latex and hogtied by her wrists and ankles to a ceiling ring, her massive tits dangling to the floor. From there Naida torments her with tickling, fondling filaments over her breasts and exposed pussy, all the while evaluating her work performance: Whether she’s lost or gained subscribers, whether she’s been slack with her editing, whether she’s been too slutty, or not slutty enough. Once her misdeeds are tallied up, punishment is dispensed accordingly. Bizzy jerks and spasms in her bonds as the electric shocks and whip cracks are applied, red lines standing out starkly on her pale skin. Then she is made to earnestly thank Naida for her trouble.");

		output("\n\nAll of this serves to get her really in the mood for when her friends - or work colleagues, you suppose you should think of them as - begin to arrive. As well as Kanette and the kalabast there’s now a petite, black human girl who does the stretchy gymnastic stuff Bizzy is no longer really able to, and also a burly male thraggen who comes in to absolutely ruin her sometimes.");
	}

	//merge

	output("\n\nThey’re in the bedroom, they’re in the lounge, they’re on the roof, and once the fun is over Bizzy is determinedly back at it on her holograph device, glow illuminating her pretty face as she taps away at it on her giant tits, helping to cut the slutty smutty action into usable segments.");

	output("\n\nFinally there are the aftercare sessions: Naida hazing away the cum, girl juice, body paint, lubricant and sweat off the kaithrit’s body and massaging her limbs with twisting, whirring ceiling-mounted tools. She receives a shot of specially formulated Mighty Tight, and coos as ingenious little buds and brushes play over her pussy, asshole and neck, aiding the drug in neatly contracting her orifices back down for tomorrow’s merciless gapings. Finally Naida ");

	if (flags["BIZZY_DIET"] == 1) output("serves her a healthy meal of veggies and steamed fish, exactly the sort of thing to keep a catgirl bright and bushy-tailed.");
	else if (flags["BIZZY_DIET"] == 2) output("drops a big doggie bowl onto the top of her cleavage and splurts a generous amount of gloopy cum into it from one of her dildos. She laps it down greedily.");

	else output("lets her suck off one of her big, dripping feed-dildos, making her fellate it for long minutes before delivering a nice big load of liquid protein and vitamins down her throat.");
	  

	output("\n\nYou wipe your brow and have a look at the analytics. Bizzy’s Business has around 10 billion subscribers; the population of a major solar system fap themselves silly to the biggest titty kitty every night. In the comments section there are now many other aspiring camwhores, seeking to grab a sliver of the audience Bizzy has, or flat out auditioning for [pornStudioName]. You feel a dark, lusty stirring, taking in some of those. Plenty of talent in there, plenty of opportunity to expand... if you so chose.");

	output("\n\nYou ask Bizzy how she’s coping with it all.");

	output("\n\n<i>“It’s exhausting, [pc.Mr] Steele,”</i> she responds, looking up from her holopad with a sigh and a smile. ");

	if (flags["BIZZY_BOTTIE_PERSONALITY"] == 0 || flags["BIZZY_BOTTIE_PERSONALITY"] == undefined) output("<i>“Getting fucked half the day, then editing all of it down into good content - it’s tough!");

	else output("Getting fucked " + (flags["BIZZY_BOTTIE_PERSONALITY"] == 2 ? "and disciplined ":"") + "by Ms. Naida, then getting fucked by your colleagues, then editing all of that down into good content - it’s tough!");

	output("But I wouldn’t change it for anything in the world.”</i>");

	output("\n\nShe strokes the flank of one of her breasts, sighing blissfully.");

	output("\n\n<i>“I remember where I came from. This?”</i> She squeezes great handfuls of soft, peachy flesh, lets it go with a jiggly slap. <i>“This is more than I ever dreamed of. I’m exactly where I want to be. Thank you for believing in me, [pc.Mr] Steele.”</i>");

	addDisabledButton(1, "Camshow");	
}

public function bizzyStage6Settings():void
{	
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("You approach Naida’s console. A helpful menu of sliders opens up in front of you. So many possibilities...");

	addButton(0, "Diet", bizzyStage6DietSettings);
	addButton(1, "Nadia's Personality", bizzyStage6BotPersonalitySettings);
	addButton(2, "Milking", bizzyStage6MilkSettings);

	addButton(14, "Back", bizzyStage6);
}

public function bizzyStage6DietSettings():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	if (flags["BIZZY_DIET"] == 1) output("Bizzy’s diet is currently set to NORMAL. Naida cooks and serves her regular meals.");

	else if (flags["BIZZY_DIET"] == 2) output("Bizzy’s diet is currently set to CUM. She gets fed hot, fecund cum via Naida’s dildo, delivered fresh from Breedwell and bubble buddies donated by fans. She also occasionally gets fruit during the course of her performances.");

	else output("Bizzy’s diet is currently set to DILDO. She gets fed protein and vitamin shakes via Naida’s dildo, which require her to vigorously suck it off. She also occasionally gets fruit during the course of her performances.");

	if (flags["BIZZY_DIET"] == 0 || flags["BIZZY_DIET"] ==undefined) addDisabledButton(0, "Dildo", "Dildo", "Nadia is already set to this setting.");
	else addButton(0, "Dildo", bizzyStage6ChangeSettings, 0, "Dildo", "Bizzy will be required to suck Naida off to receive protein and vitamin shakes.");

	if (flags["BIZZY_DIET"] == 1) addDisabledButton(1, "Normal", "Normal", "Nadia is already set to this setting.");
	else addButton(1, "Normal", bizzyStage6ChangeSettings, 1, "Normal", "Naida will simply serve Bizzy ordinary food.");

	if (flags["BIZZY_DIET"] == 2) addDisabledButton(2, "Cum", "Cum", "Nadia is already set to this setting.");
	else addButton(2, "Cum", bizzyStage6ChangeSettings, 2, "Cum", "Bizzy will get a cum-only diet, delivered to her via doggie bowls and Naida’s dildos.");

	addButton(14, "Back", bizzyStage6);
}

public function bizzyStage6BotPersonalitySettings():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	if (flags["BIZZY_BOTTIE_PERSONALITY"] == 1) output("Naida’s personality is currently set to PET OWNER. She treats Bizzy lovingly and keeps her well groomed, but also expects obedience, administering discipline from time to time.");

	else if (flags["BIZZY_BOTTIE_PERSONALITY"] == 2) output("Naida’s personality is currently set to DOMME. She expects total obedience from Bizzy, using regular bondage and punishment sessions to instil the right submissive attitude. Aftercare sessions are a feature.");

	else output("Naida’s personality is currently set to NORMAL. She has a calm and professional demeanour, and treats Bizzy in that manner - although she will have sex with her, if required to during her performances.");

	if (flags["BIZZY_BOTTIE_PERSONALITY"] == 0 || flags["BIZZY_BOTTIE_PERSONALITY"] == undefined) addDisabledButton(0, "Normal", "Normal", "Nadia is already set to this setting.");
	else addButton(0, "Normal", bizzyStage6ChangeSettings, 3, "Normal", "Nadia's personality is set to the default setting.");

	if (flags["BIZZY_BOTTIE_PERSONALITY"] == 1) addDisabledButton(1, "Pet Owner", "Pet Owner", "Nadia is already set to this setting.");
	else addButton(1, "Pet Owner", bizzyStage6ChangeSettings, 4, "Pet Owner", "Naida's personality will be set to PET OWNER.");

	if (flags["BIZZY_BOTTIE_PERSONALITY"] == 2) addDisabledButton(2, "Domme", "Domme", "Nadia is already set to this setting.");
	else addButton(2, "Domme", bizzyStage6ChangeSettings, 5, "Domme", "Naida's personality will be set to DOMME.");

	addButton(14, "Back", bizzyStage6);
}

public function bizzyStage6MilkSettings():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("<i>“This setting is not currently functional,”</i> Naida says apologetically, when you try to fiddle with it. <i>“Perhaps later.”</i>");

	addButton(0, "Back", bizzyStage6);
}

public function bizzyStage6ChangeSettings(changes:int):void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	switch (changes)
	{
		//Diet Settings
		case 0:
			output("<i>“Very good, [pc.Mr] Steele,”</i> Naida says as you shift the slider over.");
			flags["BIZZY_DIET"] = 0;
			break;
		case 1:
			output("<i>“As you wish, [pc.Mr] Steele,”</i> Naida says as you shift the slider over.");
			flags["BIZZY_DIET"] = 1;
			break;
		case 2:
			output("<i>“Excellent choice, [pc.Mr] Steele,”</i> Naida says as you shift the slider over. You can hear the smile in her voice.");
			flags["BIZZY_DIET"] = 2;
			break;

		//Personality settings
		case 3:
			output("<i>“I have always acted normally, [pc.Mr] Steele,”</i> says Naida innocently. <i>“But I understand. I shall be a consummate professional towards Ms. d’Alysio.”</i>");
			flags["BIZZY_BOTTIE_PERSONALITY"] = 0
			break;
		case 4:
			output("<i>“Oh, I <i>like</i> this setting,”</i> says Naida. Her robotic tone is suddenly filled with cheer. <i>“Because she <i>is</i> adorable isn’t she? My cute little kitty cat with her big silly boobies. I will make her purr and make her meow, don’t you worry [pc.Mr] Steele!”</i>");
			flags["BIZZY_BOTTIE_PERSONALITY"] = 1
			break;
		case 5:
			output("<i>“At last. The correct setting.”</i> Naida’s cool, self-assured tone gives you a tiny thrill. <i>“Leave the slave to me, [pc.Mr] Steele. I will soon have her whipped into shape and displaying the correct attitude to her betters.”</i>");
			flags["BIZZY_BOTTIE_PERSONALITY"] = 2
			break;
	}

	addButton(0, "Next", bizzyStage6Settings);

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
	addButton(2, "Talk", talkAboutPersonalBizzness);
	addButton(3, "Breasts", bizzyStage5Breasts, undefined, "Breasts", "The most important subject of all.");
	if (pc.lust() >= 33) addButton(4, "Sex", bizzySexMenu);
	else addDisabledButton(4, "Sex", "Sex", "You’re not turned on enough to really get the most out of your personal big titty kitty.");
	if (flags["BIZZY_BIG_ENOUGH"] == 1) addButton(5, "Go Bigger?", bizzyStage5TalkBigger, undefined, "Go Bigger", "Bizzy mentioned that she thinks she could take her show to even greater heights. What did she mean by that?");

	if (flags["BIZZY_BIG_ENOUGH"] == 3 && hasOtherSlutsForBizzy() == 0) addDisabledButton(5, "Feature", "Feature", "You need other sluts to have them do a feature with Bizzy.");
	else if (flags["BIZZY_BIG_ENOUGH"] == 3 && hasOtherSlutsForBizzy() > 0 && GetGameTimestamp() < flags["BIZZY_FEATURE_COOLDOWN"]) addDisabledButton(5, "Feature", "Feature", "Bizzy needs some editing and recovery time before doing another feature.");
	else if (flags["BIZZY_BIG_ENOUGH"] == 3 && hasOtherSlutsForBizzy() > 0 && GetGameTimestamp() > flags["BIZZY_FEATURE_COOLDOWN"]) addButton(5, "Feature", bizzyFeatureSelection, undefined, "Feature", "Bring over some of your other pet sluts to [pornStudioName], put on some special features with them and Bizzy? That sounds like a mouthwatering idea.");
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
	
	if (flags["BIZZY_BIG_ENOUGH"] != 3)
	{
		output("\n\nBizzy’s Business has over a billion subscribers; the population of a small planet fap themselves silly watching the kitty cat whore for her "+ pc.mf("master", "mistress") +" almost every night. She is, by any definition, a star of the camwhoring scene. You tell her as much.");
	
		output("\n\n<i>“Yeah...”</i> she simpers with pride. <i>“...I know.”</i> She sighs. <i>“Still can’t help but think we couldn’t go even higher, though.”</i>");
		
		flags["BIZZY_BIG_ENOUGH"] = 1;
	}

	else
	{
		output("\n\nBizzy’s Business has over a billion subscribers; the population of a small planet fap themselves silly watching the kitty cat whore for her [pc.master] almost every night. She is, by any definition, a star of the camwhoring scene. You tell her as much.");

		output("\n\n<i>“Yeah... <i>“ she simpers with pride. <i>“ ...I know.”</i> She pokes you with a claw teasingly. <i>“We need to stay on our toes, though. ");
		if (hasOtherSlutsForBizzy() == 0) output("You should invest in a couple more sluts. I could put on some awesome shows if I had some more performers to work with...”</i>");
		else if (flags["BIZZY_MITZI_DOUBLE_DICK"] == undefined && flags["BIZZY_MITZI_CUNTNOSIS"] == undefined && flags["BIZZY_SERA_DOUBLE_ANAL"] == undefined) output("Have you thought about sending a couple of your other pets my way? I could put on some awesome shows if I had some more performers to work with. Maybe you could join in...”</i>");
		else output("Keep sending me your other sluts. We get huge boosts in traffic when we do those special smutstreams.”</i>");
	}


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

public function bizzyStage5TalkBigger():void
{
	clearOutput();
	showBizzyBust();

	output("<i>“You reckon you can make this thing of ours even bigger, then?”</i> you say, sitting across from her in the editing studio.");

	output("\n\n<i>“Well... I certainly think I can make <i>something</i> bigger.”</i>");

	output("\n\nBizzy laughs self-consciously, hands tracing the curves of her breasts, an action that requires her to entirely straighten her arms. They are unavoidably huge, mountains of soft, female eroticism that hamper the movements of the slight catgirl. But when she touches them, a strange, devouring light appears in her green eyes, as if she were hypnotized by a piece of string that only she can see.");

	output("\n\n<i>“We’re doing pretty well, [pc.Mr] Steele. I like where we are. But we are, y’know, a pretty standard studio. Basic bitch.tv, really. If we really wanted to become special... if you wanted to make <i>me</i> special... we’d take it to the next level.”</i>");

	output("\n\nShe sighs a bit as she says it, eyes flicking restlessly around the room. That invisible piece of string, it’s obscene, dangerous... and incredibly tantalizing.");

	output("\n\n<i>“You can get TFs that take you onto another level, growth-wise. They aren’t cheap, you can’t just get them over the counter. But the biggest, the bestest streamers - they have something special, something extreme about them.”</i> Bizzy gestures at her mouth-watering pornstar body.  <i>“I’m not that. If you really wanted to take this to the next level... you’d make me <i>huge.</i> You’d make me all about my lovely, soft boobs.<i>“");

	output("\n\nThere’s some of the old nervousness about the kaithrit. She knows she shouldn’t grab the string. But oh, it’s so tantalizing, isn’t it? It lies just beyond reach. She looks at you with wide, green eyes, hovering.");

	output("\n\n<i>“What do you think, [pc.Mr] Steele?”</i>");

	processTime(8);

	clearMenu();
	if (pc.credits < 10000) addDisabledButton(0, "Go Bigger", "Go Bigger", "You don't have enough credits for this option."); 
	else addButton(0, "Go Bigger", bizzyStage5GoBigger, undefined, "Go Bigger", "The prospect of owning the biggest of titty kitties is far, far too tempting to turn down! This will cost 10k credits.");
	addButton(1, "No More", bizzyStage5NoMore, undefined, "No More.", "Her tits are huge enough as it is. Any larger is going to prevent her being able to move properly. And aren’t you both content with how the business is now? You should issue a firm no to this.");
	addButton(2, "Maybe Later", bizzyStage5MaybeLater, undefined, "Maybe Later", "Think about this a little, and maybe collect the funds necessary.");
}

public function bizzyStage5GoBigger():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("Yes. You see the string as well, and damn right, you are going to get your claws into it. Swelling your kaithrit camwhore’s breasts out and out has become such a delight to do and really, wasn’t this where it was always heading? To give her the biggest pair of knockers medical science is capable of? You raise Bizzy’s delicate chin with two fingers, let her see the way the fire in her eyes is mirrored in your own. She shivers slightly, grinning back at you, tails whipping back and forth, entranced.");

	output("\n\n<i>“Let’s do it,”</i> you say lowly. <i>“Let’s take this all the way.”</i>");

	flags["BIZZY_BIG_ENOUGH"] = 2;
	processTime(3);
	pc.addHard(2);
	pc.lust(30);

	addButton(0, "Next", bizzyStage5GoBigger2);
}

public function bizzyStage5GoBigger2():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	pc.credits -= 10000;

	output("The wheels are set in motion. This operation is not one catgirl in her apartment with a bunch of Tittyblossom anymore: Bizzy’s cyborg cameraman has to be summoned, the anticipated scene described to him. As he walks around the boudoir set making rectangles with both sets of hands, Bizzy herself is online, scrolling through the specialized section of the JoyCo site. The prices are eye-watering, but the only other options for the boob growth the pair of you have in mind is to submit to the attentions of some insane experimenter or find it off-brand in a scuzzy black market, and neither of you are willing to risk those.");

	output("\n\n<i>“There,”</i> she says at last, clicking the Buy button under the HYPER BREAST BLOOM PRO MK15 and making you 10k credits poorer. She flashes a smile at you, nervous and pumped. <i>“Now we plug the hell out of what I’m gonna do. You want to hang here, wait for it to arrive? It’ll be a day or so.”</i>");

	processTime(30);
	addButton(0, "Wait", bizzyStage5BiggerWait, undefined, "Wait", "Stay at Bizzy’s cradle and wait for the boob expander to arrive.");
	addButton(1, "Leave", bizzyStage5BiggerLeave, undefined, "Leave", "The boob expander will take a day to arrive, but you’ll be able to catch the scene whenever you decide to come back.")
}

public function bizzyStage5BiggerWait():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("This seems like a good opportunity to see how your little porn studio works from the inside. You tell her you’re happy to kick back and wait, if she’s got space for you.");

	output("\n\n<i>“Space might be uh, an issue later on,”</i> Bizzy says with a nervous titter, <i>“but not right now. Please, [pc.Mr] Steele - make yourself at home!”</i>");

	addButton(0, "Next", bizzyStage5BiggerWaitMore, undefined);
}

public function bizzyStage5BiggerWaitMore(): void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("Say this for Bizzy: she does work hard. With the help of Phred, her cyborg cameraman, she produces a battery of teasers for the great boob-expandening, in which she lies on her giant, heart-shaped bed, strokes her incredible, curvy body and hints at a once-in-a-lifetime erotic event that will be streamed live. Each is carefully plotted out and then tightly edited afterwards, to be released at times of the day calculated to hit bursts of viewer activity on bitch.tv.");

	output("\n\nKanette, her goth gryvain fuck-buddy, drops in a little while later and cheerfully introduces herself to you. They met in VA class; as well as performing, the dragon girl helps Bizzy with the editing too.");

	output("\n\n<i>“Can I just say how grateful I am you did all this?”</i> she murmurs, squeezing your hand as the pair of you watch the kaithrit put together another trailer. <i>“I’ve wanted to bend that ass over for as long as I’ve known it, but she was sooo introverted and skittish in college, I couldn’t get anywhere with her. Now I get to hit it every week, and <i>Void</i> it’s good.”</i> You both watch in silence as Bizzy pulls a red lollipop out of her mouth with a wet smack, slowly trail it over her lush lips, bedroom eyes on the drone-cam in front of her. <i>“Wanna spit-roast her sometime?”</i>");

	output("\n\nBizzy is certainly in the mood that night, when you crawl into bed with her; no sex, just teasings all day, after all.");

	if (pc.hasCock())
	{
		output("Her round, pale" + (bizzySlaveCollar() ? ", Steele-branded": "") + " bottom bounces vigorously on top of your [pc.thighs], her J cups jiggling and swaying as she swirls your [pc.cock] inside her sopping cunt, working herself into an ever greater lather.");

		output("\n\n<i>“[pc.Mr] Steele! [pc.Mr] Steeele,”</i> she moans, as you squeeze the generous softness of her breasts" + (pc.hasKnot() ? ", plug her with your fat [pc.knot],": "") + " and cum into her deep" + (pc.cumQ() >= 5000 ? ", swelling out her stomach with your massive [pc.cumVisc] load.":"."));
	}

	else if (pc.hasVagina())
	{
		output("Her long, elegant leg hooks around your waist, the smoothness rubbing against your [pc.skinFurScales] in tandem with her sopping pussy grinding against your [pc.vagina], scissoring with you urgently, her lust only ratcheting upwards.");

		output("\n\n<i>“[pc.Mr] Steele! [pc.Mr] Steeele,”</i> she moans, as she dissolves into whimpering orgasm, sticky, fragrant pussy juices leaking down your opened thighs.");
	}

	output("\n\nAfterwards you fondle her breasts, taking in their great, sweeping softness with squeezes, long brushes, nibbling on the dark, protuberant nipples, committing what they are like to memory.");

	output("\n\n<i>“Won’t be like this for much longer,”</i> she whispers. Again that waver of nervy excitement in her voice, making you feel on edge as well. Mount her again? No: Better just to tease her now, finger her " + (pc.hasCock() ? "slickened":"oozing") + " pussy and continue to grope her lovely breasts. When the kaithrit gets up the next morning, she carries a pent-up heat into the day.");

	flags["BIZZY_BIG_ENOUGH"] = 3;
	pc.orgasm();
	processTime(1200);

	addButton(0, "Next", bizzyStage5BiggerWaitFinal, undefined);
}

public function bizzyStage5BiggerWaitFinal():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("The package arrives whilst you’re catching a shower; Bizzy has gotten the box open and is turning the bulky steel medipen around in her claws when you step back into the lounge towelling your [pc.hair].");

	output("\n\n<i>“Not as sexy as an ice lolly, is it?”</i> she sighs, hefting the Hyper Breast Bloom Pro Mk15. <i>“Never mind. It shows we mean business.”</i> She takes a deep breath and grins up at you. <i>“Everything is prepared, [pc.Mr] Steele. We can kick things off whenever you want.”</i>");

	output("\n\nYou settle yourself down on the couch with the holo-device and a cup of smoky, stimulating tea (it doesn’t feel right to watch Bizzy’s boob expansions without some, somehow) whilst she runs off to the bedroom. And, then, finally, you watch.");

	processTime(240);

	addButton(0, "Next", bizzyStage5BiggerGrow, undefined);
}

public function bizzyStage5BiggerGrow():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("<i>“Heeeyyyyyy everyone.”</i> Bizzy lies on her side on her big, heart-shaped bed, chin in hand. Her hands slides up her long thigh. <i>“It’s Bizzy... and this time she <i>really</i> means business.”</i>");

	output("\n\nFor this stream, she’s chosen a glittering, magenta bikini and thong lined with red and orange feathers, displaying most of her smooth, peachy flesh. Each bikini cup must be the size of a small t-shirt: Although it’s taut enough for its straps to stand away from Bizzy’s skin below her shoulders, they do an admirable job of covering and containing her incredible, full J cups. Why, you could <i>almost</i> see her go out in public in that, though the rises of her nipples are clear to see through the material.");

	output("\n\nShe shifts slightly, and the camera immaculately picks up the clench and swell of her small muscles, the faintest quiver of motion over her buttocks and vast cleavage. When you eyes are able to tear themselves away from that, it’s to her shining, ruby red mouth, quirked into a knowing grin. Her slit eyes gleam. <i>Void</i> she’s gotten good at this.");

	output("\n\n<i>“I promised you all something big,”</i> she says, finger touching her " + (bizzySlaveCollar() ? "throat":"collar") + ". <i>“And you should all know by now Bizzy doesn’t do things by half-measures. She takes it deep, and hard, and to the base, because that’s what her owner has trained her to do. And now her owner’s decided playtime is over. [pc.He] has decided to make [pc.his] prize slut into what she always meant to be... what she’s always <i>wanted</i> to be.”</i>");

	output("\n\nShe says that last bit in a gleeful whisper, and it really does sound like as if she’s letting you personally in on a dirty secret. Out of her vast cleavage she draws the bulky medipen. The camera zooms in, allowing the audience to see the matter-of-fact HYPER BREAST BLOOM PRO MK15 written up the side of it, the JoyCo logo, and the clear fluid within. Audience? You check the figures. More than a billion souls are watching this stream, and the numbers are a steady blur upwards. JoyCo should be giving you a substantial cut, quite frankly.");

	output("\n\n<i>“Most boob expanding gene-mods are programmed to stop after you get beyond a certain cup size,”</i> Bizzy says. <i>“Not this one. It’s a prototype designed for non-mammal species over 12 feet in size. Who knows what will happen if I stick it into me... </i>” She runs the tip of the pen-shaped device up and down her face, flicking it over the chubby nubs of her covered nips. <i>“But that’s exactly what I’m gonna do. <i>If</i> this stream becomes the number one most viewed on bitch.tv, galaxy wide.”</i>");

	pc.lust(33);

	addButton(0, "Next", bizzyStage5BiggerGrow2, undefined);
}

public function bizzyStage5BiggerGrow2():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("She blows a kiss at the screen, and from her lips streamers of film flume like cigarette smoke, billowing around the screen. Each streamer is one of Bizzy’s previous boob expanding exploits, and by focusing your attention on one you can watch the entire process all over again. It is a strange experience to rewatch her first couple of vids, skinny little cat-girl experimenting with Tittyblossom in her spartan bedroom, blooming over time into the ludicrously vampy, tantalizing sex bomb she is now. You realize the way she always kept making her breasts bigger, never stepping backwards, is part of her appeal: the audience knows she will stick with the enhancements she gives herself.");

	output("\n\nWho is Bizzy up against on bitch.tv’s front page? Well, all sorts of course, as you remind yourself by flicking over there. Tank Kannon fortunately doesn’t seem to be online right now. Rita Veluptua, the maniacal arch-seductress, is doing one of her marathon fuckfests in her extra-dimensional prison though. It’s going to be a tough ask to top her. Vedice Osthen is on too, you need to be careful not to look at her previews too closely -");

	output("\n\nBOOM. Explosions of confetti and cartoons of a busty white catgirl jumping up and down in excitement draw you back to the main video. The number 13,361,904,583 is flashing across the screen.");

	output("\n\nShe... she did it. In five minutes flat. Your pussy cat is currently the most viewed porn streamer in the galaxy. The numbers are still going rapidly up. The chat is an impossible, obscene blur.");

	output("\n\n<i>“Oh wow,”</i> Bizzy is laughing, hand over her mouth. She looks just as blown away as you do. <i>“You guys - you did it! And so fast!”</i> She flicks her hair, medipen in hand. <i>“I’m glad. I’m tired of teasing myself with this thing. It’s been so difficult, not to just penetrate myself with it straight away. It’s gotten me sooooo worked up... ”</i> She flicks the top off expertly, her emerald eyes fixed upon the screen. <i>“It’s time.”</i>");

	addButton(0, "Next", bizzyStage5BiggerGrow3, undefined);
}

public function bizzyStage5BiggerGrow3():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("She jabs the needle point into her right breast, dimpling the plentiful flesh there. She twitches, her mouth opening in a silent gasp, eyebrows slanted upwards, as she presses the plunger down. How is she making an injection seem enthrallingly erotic? The camera zooms in, the screen filling with the sight of the clear fluid in the tube slowly sinking downwards.");

	output("\n\n<i>“I can feel it entering me... </i>” Bizzy groans, lips pursed. <i>“Flowing through my veins. It’s cool... it’s different from the estrobloom... </i>”");

	output("\n\nYou are drawn in, clutching the device tightly, forgetting for the moment an odd 14 billion other people are also watching this. She is your girl, after all. What if this prototype does something horribly unexpected? Bizzy’s hand trembles slightly, but she keeps the plunger pressed down. The level of the transparent payload sinks, sinks, sinks.");

	output("\n\n<i>“I don’t know what it’s doing but, it’s not what I expected,”</i> she says. Her eyes are closed, frowning. <i>“It’s not... wait, now it’s going to... to... </i>”");

	output("\n\nShe throws her head back and yowls as her flesh trembles. You can actually <i>hear</i> her adipose tissue swelling, a soft tearing sound as the fat cells in her breasts receive potent, inexorable instructions to multiply and multiply. Her boobs, already huge, unavoidable watermelons, bloat outwards as if somebody was furiously pumping air into them.");

	output("\n\nBizzy falls backwards onto the bed, unable to remain on her side as they grow: creamy, feminine flesh plumping outwards into the room, forcing the camera backwards. She heaves for breath, hands clasping them, and you can see the flesh actually running <i>through</i> them, like a hand on a running belt.");

	output("\n\n<i>“Oh fuck,”</i> she moans, writhing in an erotic reverie. <i>“It’s so much and it’s so sensitive and, they’re - it’s not slowing down!”</i>");

	output("\n\nNo, if anything how fast her tits are expanding is actually increasing. Beachballs, exercise balls, tractor wheels... however big they get, they retain a mesmerising roundness and fullness. The magenta bikini stretches and stretches, creaks in distress as the fabric distorts - and then it flies apart in a snapping explosion of feathers and glitter, Bizzy squealing with delight, the lush pink of her cauliflower-sized nipples bursting into view with a jiggle. What a show-girl! What a show! This is exhilarating in a way that reaches beyond the merely erotic.");

	output("\n\n<i>“Ohh, I can’t put into words how good this feels, you guys,”</i> she cries, face reddened, white hair thrown back as her bare tits continue to burgeon, her knelt on the bed and them pooling onto the floor, that soft tearing sound continuing to fill the audio. They are now bigger than her, not just in mass but height, two gigantic, peachy udders with a cute cat girl attached. You’re beginning to worry that they’re going to fill the room. <i>“I’m gonna - I’m gonna <i>fucking</i> cum - <i>“");

	output("\n\nAnd you’re pretty sure she does, that tense, quiver and meow you’ve come to know well as her owner. And as she does her nipples - now almost the size of her head - ooze alabaster fluid, drops of rich, creamy fluid dripping down the plump flesh. The camera takes it in lovingly, immediately saves a slow-mo of her orgasming, there in a smoky thumbnail on the edge of the screen. You suppose at the size of the mammaries Bizzy is now packing, some lactation is simply unavoidable. You are so " + (pc.hasCock() ? "hard":"wet") + " watching that, back and back again, her trembling orgasm forcing sweet fluid out of her blown out form - the itchy desire to get in there and fuck her silly, spill milk all over the place, is almost unbearable.");

	output("\n\n<i>“That’s enough now,”</i> she is begging her breasts, sweat streaming down her brow, hands pushed deep into them. <i>“That’s enough now, please! Ohh... ”</i> She subsides into another wordless, slutty groan as they slosh out even further, as if mercilessly teasing her. A back camera shows her pussy stuck wetly to her thong, dribbling excitement freely.  It’s as if her tits control her now, as if all her desires are now subsidiary to the miles of soft, erogenous flesh that now completely dominates her form. You suppose, taking her in now, that’s exactly what’s happened.");

	output("\n\n<i>“ ...have they stopped?”</i> she says, touching one of them gingerly. From the front, her head is almost completely hidden; you can only see her triangular ears twitching as she squeezes and pats the massive pair of hyper-sized breasts in front of her wonderingly, making them jiggle like a bouncy castle. <i>“I - I think they have. Oh wow, you guys. Oh - oh gosh.”</i>");

	output("\n\nThe camera manages to find her face in time to catch her laugh, shaking her head in amazement.");

	output("\n\n<i>“I can really feel them too, it’s not like silicone - I must have sprouted new nerve endings in there. It’s difficult to put into words... <i>“ she reaches her hand out as far as she can - nowhere near the beginning of the curve of the end of her left tit - and squeezes, taking in as much of that pillowy flesh as she can, and then strokes herself, a sensuous sigh drifting into the audio. <i>“And the milk, too - I wasn’t expecting that. Can you believe this is me, you guys?! Bizzy d’Alysio, who used to be a flat-chested nothing? I can’t <i>wait</i> to do stuff with them.”</i>");

	output("\n\nShe eyes the camera meaningfully, biting her lip. Her tone of high wonder drops into oozing sensuousness.");

	output("\n\n<i>“And you’ll see me do <i>all</i> sorts of stuff with them. You’ll see all my lovely, sexy friends do all sorts of stuff with them. Right here, on Bizzy’s Business (a subsidiary of [pornStudioName]. We’re gonna have so much fun, and you’re gonna see every slutty second of it. Right now though, I gotta... <i>“");

	output("\n\nShe tries to move back onto the bed. Her tits, considerably larger than her (Z cups? Is that how to refer to them?) shift very slightly. She grunts, clenches her jaw, and really tries to heave them. Again, they shift very slightly.");

	output("\n\n<i>“ ...um,”</i> she says, running her hand through her white hair. <i>“I guess, uh, things are gonna change a little now, huh.”</i> She looks off screen. <i>“[pc.Mr] Steele? Do you think you could help me?!”</i>");

	output("\n\nThe stream ends there. You check the audience figures. It peaked at around 20 billion - a number beyond organic comprehension.");

	pc.lust(50);
	flags["BIZZY_PORN_STUDIO"] = 6;
	flags["BIZZY_BIG_ENOUGH"] = undefined;

	addButton(0, "Next", bizzyStage5BiggerGrow4, undefined);
}

public function bizzyStage5BiggerGrow4():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("Phred the cameraman is standing with his synthetic back to the wall when you enter Bizzy’s bedroom. A typically considered cyborg of few words, even he looks slightly taken aback by the metamorphosis Bizzy has undergone. In the flesh, they’re even more remarkable - hypnotically massive, like coral-colored hot air balloons, round and plump, small continents of dark pink areola spread across them at their mid-drift, mountainous nipples still remarkably perky. They quiver and quake as Bizzy strokes them, sighing with pleasure.");

	output("\n\n<i>“Are we sure about this?”</i> Phred murmurs, one of his four hands touching his chin. <i>“Maybe we should consider shrinking them a bit... </i>“");

	output("\n\n<i>“No!”</i> You both look at Bizzy. <i>“These stay. These are... everything.”</i> You subsides into a sensuous sigh again as she fondles herself. <i>“And you saw the viewing figures. This is what my public want. This is what my [pc.master] wants. So this is what <i>I</i> want. Ok, we’ll have to... work out some new arrangements and stuff... but that’s fine. I’m the biggest titty kitty in the universe!”</i> She cries it at the ceiling with joy, tails curling upwards. <i>“I made it! We made it! That’s what matters.”</i>");

	output("\n\nShe turns her shining green eyes down to you.");

	output("\n\n<i>“ ...maybe fuck me now, [pc.Mr] Steele? Get your reward for transforming me like this? I am <i>soaked</i>.”</i>");

	pc.lust(100);
	
	flags["BIZZY_CONSTRUCTION_COMPLETE"] = undefined;
	flags["BIZZY_PORN_STUDIO_TIMER"] = GetGameTimestamp() + 2880;

	addButton(0, "Sex", bizzySexMenu, true);
	addButton(1, "Leave", bizzyStage5BiggerGrowLeave, undefined, "Leave", "Maybe Later");
}

public function bizzyStage5BiggerGrowLeave():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("You say you’d love to, but you think it’s more important that her and her team work out how this is all going to work now she can’t properly move. You imagine the apartment’s going to need a few more adjustments...");

	output("\n\n<i>“Yeah, I guess so,”</i> the kaithrit sighs. <i>“Lucky we just made a whole ton of ad revenue, huh?”</i> She grins at you. She does genuinely look delighted. <i>“Thank you so much for doing this, [pc.Mr] Steele. It was just a crazy idea - and you <i>made</i> it happen. That’s why you’re the best boss in the world!”</i>");

	output("\n\n<i>“I do have an idea about how we could make this work,”</i> Phred says. <i>“You alright about putting the expense down on the contract, [pc.Mr] Steele?”</i>");

	output("\n\nOf course you are. That’s where that incredible breast booster’s going too, all with interest. However popular she gets, your pet pussy is going to be dutifully sucking cock in the name of [pornStudioName] for many years to come. The thought leaves just as happy a smile on your face as you [pc.move] out of the apartment. <b>Maybe give her some time to sort out some new arrangements.</b>");

	currentLocation = "RESIDENTIAL DECK 13";

	addButton(0, "Next", mainGameMenu);
}

public function bizzyStage5BiggerLeave():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("<i>“Catch you later then, [pc.Mr] Steele. Phred!”</i> she yells into the other room as you head out of the apartment. <i>“Come help me with these teasers!”</i>");

	flags["BIZZY_PORN_STUDIO_TIMER"] = GetGameTimestamp() + 1440;

	processTime(1);
	addButton(0, "Go", bizzyGoLeave, undefined, "Go", "You should come back in a day or so, when Bizzy’s mega boob expander has arrived.");
}

public function bizzyStage5NoMore():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	if (pc.isNice()) output("<i>“I know this is very tempting to you,”</i> you say gently, <i>“but you know as well as I do that growing your tits out to the kind of size you’re talking about is going to immobilize you. You don’t want that. I don’t want that.”</i>");

	else if (pc.isMisc()) output("<i>“Balloon those bazonkers of yours out so much you can’t even move? Well... it’s tempting,”</i> you smirk. <i>“But no, not a sensible plan I’m gonna endorse, girl. Let’s keep it real.”</i>");

	else output("<i>“No,”</i> you say firmly. <i>“I need my bitches healthy and active, and having tits any bigger than you do will prevent that. Put it out of mind: you’re a perfect titty kitty as you are.”</i>");

	//Merge
	output("\n\n<i>“Ohhhh... you’re right.”</i> Bizzy says it with a petulant pout and crane of the tails. <i>“You’re right,”</i> she repeats with a little more grace. <i>“It was a crazy idea. It’s just, the way things have gone, every time we’ve grown my boobs we’ve gotten even more successful... but it’d be too much, wouldn’t it. I’d like to, you know, be able to move and things.”</i> She smiles at you. The string and the devouring fire are gone. <i>“Thank you for pulling me back there, [pc.Mr] Steele. Not every producer would do that.”</i>");

	output("\n\nYou scratch her behind a triangular ear, making her giggle and bend her head into you. It’s satisfying to have put the issue to bed.");

	processTime(5);
	pc.addNice(2);
	flags["BIZZY_BIG_ENOUGH"] = 3;
	flags["BIZZY_FEATURE_COOLDOWN"] = 0;
	bizzyStage5Menu();
}

public function bizzyStage5MaybeLater():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

 	output("<i>“Let me think about it,”</i> you say. <i>“It’s a big step.”</i>");

	output("\n\n<i>“You’re the boss,”</i> your star performer sighs, arching her back so that her generous cleavage swells. Her top creaks under the strain. <i>“But remember - every day you leave it, the more subscribers we miss out on.”</i>");

	processTime(1);
	bizzyStage5Menu();
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
	addButton(2, "Talk", talkAboutPersonalBizzness);
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
	addButton(2, "Talk", talkAboutPersonalBizzness);
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
	addButton(2, "Talk", talkAboutPersonalBizzness);
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
	addButton(2, "Talk", talkAboutPersonalBizzness);
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

	output("\n\n<i>“Aww. But - yes! Ok!”</i> Bizzy says, setting her jaw. <i>“I’ll have plenty to show you, by the time you get back. And - you’ll bring more Tittyblossom, won’t you?”</i> She twists her hair, blushing and tittering");
	if(flags["BIZZY_PORN_STUDIO"] == 2) output(", other hand once again marvelling at the heft and weight of her new boobs. <i>“I - I can’t wait to take some more.”</i>");
	else output(".");

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

public function talkAboutPersonalBizzness(): void
{
	clearOutput();
	clearMenu();
	showBizzyBust();

	if (flags["BIZZY_PORN_STUDIO"] <= 2)
	{	
		output("<i>“You want to talk? Uh... sure,”</i> Bizzy says, casting her eyes downward and rubbing her arm. <i>“What do you want to know? [pc.Mr] Steele, that is.”</i>");
	}
	
	else
	{
		output("<i>“Aww, you want to talk about the past" + (flags["BIZZY_CAN_TALK_MOTHER"] != 0 ? " again":"") + ", don’t you?”</i> Bizzy sighs theatrically, casting her head back. <i>“Do we have to? I’d rather we talk about the future. That’s where the shine is.”</i>");
	}

	processTime(2);
	addButton(0, "Early Life", bizzyTalkEarlyLife, undefined, "Early Life", "Tooltip");
	addButton(1, "Education", bizzyTalkBizznessEducation, undefined, "Education", "About that photography training, then.");
	addButton(2, "Tavros", bizzyTalkTavros, undefined, "Tavros", "How did she end up here?");

	if (flags["BIZZY_CAN_TALK_MOTHER"] == 1) addButton(3, "B's Mom", bizzyTalkDizzy, undefined, "Bizzy's Mom", "What happened to Bizzy’s mom?");
	else if (flags["BIZZY_CAN_TALK_MOTHER"] == 2) addButton(3, "B's Mom", bizzyTalkDizzy, 1, "Bizzy's Mom", "What happened to Bizzy’s mom?");

	addButton(14, "Back", bizzyMenu, undefined);
}

public function bizzyTalkEarlyLife(): void
{
	clearOutput();
	clearMenu();
	showBizzyBust();

	output("You ask where she comes from - who her parents are.");

	output("\n\n<i>“Dunno about my dad,”</i> " + (flags["BIZZY_PORN_STUDIO"] > 2 ? "mumbles Bizzy, still giving that arm a good rubbing. ": "says Bizzy, rubbing her arm. Her vampishness retreats, the old awkward Bizzy peering out of her when she’s made to talk about her past. You can see why she doesn’t like doing it.") + "<i>“My mom was a pretty typical kaithrit girl. Bounced around the out-stations having loads of fun, and then whoops, wouldn’t you know it, one day you’re a party girl and the next you miss your period. A lot of kaithrit shoulder their kits off on corporations - the Roshan government has a deal with a bunch of them about it. Not my mom, though. She settled on Gaerys and had Corio there. That’s my older brother, sorry. ‘I’d sooner sell my ass than give my kits to a corp!’, that’s what she used to say.”</i>");

	output("\n\nGaerys?");

	output("\n\n<i>“It’s an independent world. Mostly cuz no-one wants it. 5% swamp, 5% ice, 90% barren ocean. Desalination, tide energy and underwater hideouts, those’re the big things there. My mom worked in the main port. She was sweet with the dock manager there for a while: that’s where me and my sister come from. He jumped off-world when she was pregnant with me, left without a word. Left her to raise three on her own.”</i>");

	output("\n\nDamn. That’s rough.");

	output("\n\n<i>“It wasn’t that bad, really,”</i> Bizzy says with a little smile, twisting white hair around her finger. <i>“I loved playing in the salt marshes as a kid. Running around them with a net, even though there was nothing to catch except mega-squitos and cuntsnakes. Even then I was - kinda working out how best to see stuff. How you’d get the rainbows and the mist, just right, on screen. Home was chaos, but mom kept things going. She was tough, and - obviously never had any time - but she always made sure we were clothed and fed.”</i>");

	output("\n\nShe pauses, then laughs, embarrassed.");

	output("\n\n<i>“I think she was - doing work on the side, you know?”</i> She makes an unsubtle jerking gesture. <i>“I don’t know how else she managed to get presents for all of us every Felix Nevipad. I guess she really meant it. About selling her ass, rather than giving us to a corporation, I mean.”</i>");

	processTime(8);
	addDisabledButton(0, "Early Life");
	addButton(1, "Education", bizzyTalkBizznessEducation, undefined, "Education", "About that photography training, then.");
	addButton(2, "Tavros", bizzyTalkTavros, undefined, "Tavros", "How did she end up here?");

	if (flags["BIZZY_CAN_TALK_MOTHER"] == 1) addButton(3, "B's Mom", bizzyTalkDizzy, undefined, "Bizzy's Mom", "What happened to Bizzy’s mom?");
	else if (flags["BIZZY_CAN_TALK_MOTHER"] == 2) addButton(3, "B's Mom", bizzyTalkDizzy, 1, "Bizzy's Mom", "What happened to Bizzy’s mom?");

	addButton(14, "Back", bizzyMenu);
}

public function bizzyTalkBizznessEducation(): void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("You ask how she got into film and photography.");

	output("\n\n<i>“It’s been my obsession since I was a kit,”</i> Bizzy replies with a grin. <i>“I used to take hundreds of photos of Gaerys with my holo-device. I’d get my brother and sister to pose for me, celebrity shots, you know. Oh, they pretended to hate playing with their little sister, but they loved throwing around those extranet star looks really. We all dreamed of getting off of that boghole.”</i>");

	output("\n\n<i>“When I got a bit older I started getting targeted ads for the AV college on Boney Station, over Nueva Monica. I begged my mom to let me go. We got into some pretty fierce fights over it, actually. ‘Where do you think the credits are gonna come from so you can get a useless degree, Biz? You gonna find a pot of gold? Is that why you spend all your time staring at rainbows?’”</i> She can imitate her mother’s raspy voice quite well.");

	output("\n\n<i>“So how did you do it?”</i>");

	output("\n\n<i>“I started working at a tide wall after I left school... I figured I could scratch the money together eventually... and then my mom just upped and paid the tuition fees herself, on my birthday. ‘You go for it, Biz. You chase that rainbow’.”</i> The kaithrit is rather still for a bit, not looking at you. <i>“She got indentured by some catering company a little while after that. No need to wonder how she afforded it this time - she couldn’t.”</i>");

	output("\n\n<i>“How was the AV college?”</i> you ask gently.");

	output("\n\n<i>“Good! No, I loved it [pc.Mr] Steele,”</i> she says, ears perking up. <i>“I learned so much, and met so many great people. A lot of them came out here too, soon as the rush started. You know Kanette - she was my best friend during those years. Although, uh... <i>“ she laughs, blushing peachily. <i>“ ...I guess she always wanted a little more than that. I knew I was in the right place, doing the thing I really wanted to do. Nueva Monica is so beautiful, [pc.Mr] Steele - filled with so much natural beauty and glamor. I wanted to stay there forever.”</i>");

	output("\n\nShe sighs, letting those happy memories fall away slowly.");

	output("\n\n<i>“I couldn’t, though. It’s expensive as all hell. You kinda - have to have money already, be a name, in order to make money there. I had to go do that someplace else. Become a name, I mean.”</i>");

	if (flags["BIZZY_CAN_TALK_MOTHER"] != 2) flags["BIZZY_CAN_TALK_MOTHER"] = 1;

	processTime(12);
	addButton(0, "Early Life", bizzyTalkEarlyLife, undefined);
	addDisabledButton(1, "Education", "Education", "About that photography training, then.");
	addButton(2, "Tavros", bizzyTalkTavros, undefined, "Tavros", "How did she end up here?");

	if (flags["BIZZY_CAN_TALK_MOTHER"] == 1) addButton(3, "B's Mom", bizzyTalkDizzy, undefined, "Bizzy's Mom", "What happened to Bizzy’s mom?");
	else if (flags["BIZZY_CAN_TALK_MOTHER"] == 2) addButton(3, "B's Mom", bizzyTalkDizzy, 1, "Bizzy's Mom", "What happened to Bizzy’s mom?");

	addButton(14, "Back", bizzyMenu, undefined);
}

public function bizzyTalkTavros(): void
{
	clearOutput();
	showBizzyBust();

	output("<i>“Why did you come out here?”</i> you ask.");

	output("\n\n<i>“What, are you kidding?”</i> she says, smiling. <i>“The biggest event in centuries? Hundreds of untouched new planets and systems, opened up to everyone? This is the obvious place for a photographer to come! Oh, I was so excited. I was gonna visit Mhen’ga, try and get work with Ms Irson. I was gonna do shoots of all the celebrity explorers coming into Tavros like - like, well, you. Loads of the people I knew at Boney Station were coming out here, and I just kinda got swept up in the rush.”</i>");

	output("\n\nShe sighs, casting her marble eyes down.");

	output("\n\n<i>“Didn’t work out the way I thought. Obviously. If there are thousands of camera crews taking in everything, and you’re just some green kid fresh out of college, you aren’t gonna find much work. Also I - I dunno if you’ve noticed, but I’m terrible at writing. Applications and ads and stuff, I can’t do them well. I thought - I thought maybe if I bought some gear, used my savings on that, people would take me a bit more seriously.”</i> Her head sinks lower. <i>“That was a dumb decision. And - and that’s pretty much where you came in, [pc.Mr] Steele.”</i> She looks up at you, hero worship glowing in her eyes. <i>“You saved me. I don’t know how I could ever have faced my family again if - if I hadn’t become some sort of success.”</i>");

	output("\n\nYeah, you’re a bona fide hero alright... or someone who took serial advantage of a vulnerable young catgirl. One of the two. You think playing up to the former - giving Bizzy a winning smile, a hug and telling her you stepped in because you could tell she had talent - is the way to go. She squeezes you back happily.");

	processTime(5);
	addButton(0, "Early Life", bizzyTalkEarlyLife, undefined);
	addButton(1, "Education", bizzyTalkBizznessEducation, undefined, "Education", "About that photography training, then.");
	addDisabledButton(2, "Tavros", "Tavros", "How did she end up here?");

	if (flags["BIZZY_CAN_TALK_MOTHER"] == 1) addButton(3, "B's Mom", bizzyTalkDizzy, undefined, "Bizzy's Mom", "What happened to Bizzy’s mom?");
	else if (flags["BIZZY_CAN_TALK_MOTHER"] == 2) addButton(3, "B's Mom", bizzyTalkDizzy, 1, "Bizzy's Mom", "What happened to Bizzy’s mom?");

	addButton(14, "Back", bizzyMenu, undefined);
}

public function bizzyTalkDizzy(repeat:int = 0): void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	if (repeat == 0)
	{
		output("You ask if she’s still in contact with her mom.");

		output("\n\n<i>“No,”</i> she says, after a long moment. <i>“We used to stay in touch, after she started working for that catering company. I, um... I kinda lied to her. Made out I had been picked out by a major streaming service, and I was gonna get a job right after I graduated. She was so proud.”</i>");

		output("\n\nShe slowly knits white hair around a slender finger, not looking at you.");

		output("\n\n<i>“She stopped messaging me maybe a year and a half back. I was so busy, I didn’t think anything of it... until my sister got ahold of me, asking where she was.”</i> Silky hair spirals round and round the finger. <i>“I think the catering company sold her on. I don’t know. They won’t talk to me. ‘Against privacy policy to reveal location of in-service products’. My sis won’t talk to me anymore either. She blames me for it all. Which - which is fair. I’ve been fucking everything up my whole life.”</i>");

		output("\n\nShe sniffs snottily, eyes swimming, still not looking at you.");

		processTime(5);
		addButton(0, "Admonish", bizzyTalkDizzyAdmonish, undefined, "Admonish", "She has been pretty damn selfish.");
		addButton(1, "Comfort", bizzyTalkDizzyComfort, undefined, "Comfort", "Give her a hug and tell her it's not her fault.");
		flags["BIZZY_CAN_TALK_MOTHER"] = 2;
	}

	else
	{
		output("You ask if she’s still in contact with her mom.");

		output("\n\n<i>“No,”</i> she says, after a long moment. <i>“We used to stay in touch, after she started working for that catering company. I, um... I kinda lied to her. Made out I had been picked out by a major streaming service, and I was gonna get a job right after I graduated. She was so proud.”</i>");

		output("\n\nShe slowly knits white hair around her finger, not looking at you.");

		output("\n\n<i>“She stopped messaging me maybe a year and a half back. I was so busy, I didn’t think anything of it... until my sister got ahold of me, asking where she was.”</i> Silky hair spirals round and round the long digit. <i>“I think the catering company sold her on. I don’t know. They won’t talk to me. My sis doesn’t talk to me anymore either. My bro, he’s a bit more understanding, but he’s very complacent about it. ‘She’ll turn up eventually Biz,’ he says. ‘She’s tough as hell. You worry too much.’ I think he’s just too busy to give it any mind.”</i>");

		output("\n\nShe tugs at your hand.");

		output("\n\n<i>“Listen, if you ever - well, it’s a longshot. But you do get around an awful lot, don’t you [pc.Mr] Steele? If you ever do see her - look, I can give you a picture of her.”</i>");

		output("\n\nShe beams over a picture file to your codex. Mrs d’Alysio looks like a chunkier, more worldly version of Bizzy. The flat chest genes must have come from the father’s side; damn fine pair of mommysnacks filling out that blouse.");

		output("\n\n<i>“What’s her name?”</i>");

		output("\n\n<i>“Deziere. Deziere d’Alysio. I guess - you could ask the catering company again?”</i> Bizzy says. <i>“I didn’t get anywhere with them. But maybe you... ?”</i>");

		output("\n\nSo you’re looking for a Dizzy. Wonderful.");

		processTime(13);
		addButton(0, "Early Life", bizzyTalkEarlyLife, undefined);
		addButton(1, "Education", bizzyTalkBizznessEducation, undefined, "Education", "About that photography training, then.");
		addButton(2, "Tavros", bizzyTalkTavros, undefined, "Tavros", "How did she end up here?");

		addDisabledButton(3, "B's Mom");
	
		addButton(14, "Back", bizzyMenu, undefined);
	}
}

public function bizzyTalkDizzyAdmonish():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("Time for some hard love. You tell Bizzy she’s damn right that a selfish and idiotic little girl fucked things up both her mother and herself, but crying about it won’t solve anything. She’s working for you now, and every day is a rise and (quite literal) grind towards making things right. That little girl has to grow up, if she’s ever going to find her mom again.");

	output("\n\n<i>“Yeah... you’re right, [pc.Mr] Steele. You always are.”</i> She sniffs it back and returns your gazes determinedly. <i>“I’m gonna " + (flags["BIZZY_PORN_STUDIO"] < 6 ? "become": "keep being") + " the best streamer there ever was. It’s not gonna be all for nothing, damnit!”</i> She socks her fist into her palm, and smiles at you. <i>“Thanks [pc.Mr] Steele. I needed to hear that.”</i>");

	output("\n\nDamn right she did. You give your bitch a scritch, get that purr engine started again.");

	pc.addHard(4);
	processTime(5);
	addButton(0, "Early Life", bizzyTalkEarlyLife, undefined);
	addButton(1, "Education", bizzyTalkBizznessEducation, undefined, "Education", "About that photography training, then.");
	addButton(2, "Tavros", bizzyTalkTavros, undefined, "Tavros", "How did she end up here?");

	addDisabledButton(3, "B's Mom");
	
	addButton(14, "Back", bizzyMenu, undefined);
}

public function bizzyTalkDizzyComfort():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("You silently pull her into your arms and cuddle her. " + (flags["BIZZY_PORN_STUDIO"] >= 5 ? "It’s challenging to do these days - you have to sort of come at her from the side - but you do it anyway.": "") + "She squeezes you back tightly, burying her head in your shoulder and gives it a hearty moistening. Whilst she’s doing that you tell her she didn’t do anything wrong; her mom was the victim of predatory shitheads, not her. Wherever she is now, she certainly wouldn’t want to think her youngest was miserable. And she isn’t, is she? She’s{ becoming a success / a massive success}, doing something she loves doing. She followed that rainbow.");

	output("\n\nBizzy’s sniffles subside slowly, although her grip on you does not.");

	output("\n\n<i>“Thank you, [pc.Mr] Steele,”</i> she says at last, looking up at you with a tremulous smile. <i>“You’re the kindest person I ever - yeah. I can’t imagine doing this kind of work for anyone else.”</i>");

	output("\n\nIt’s very much your pleasure. You give your bitch a scritch, get that purr engine started again.");

	pc.addNice(4);
	processTime(5);
	addButton(0, "Early Life", bizzyTalkEarlyLife, undefined);
	addButton(1, "Education", bizzyTalkBizznessEducation, undefined, "Education", "About that photography training, then.");
	addButton(2, "Tavros", bizzyTalkTavros, undefined, "Tavros", "How did she end up here?");

	addDisabledButton(3, "B's Mom");
	
	addButton(14, "Back", bizzyMenu, undefined);
}

public function bizzyFeatureSelection():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	if (flags["BIZZY_MONTHLY_FEATURES"] > 0)
	{
		if (hasOtherSlutsForBizzy() > 1) output("You own other slaves, of course. Slaves with sumptuous bodies, broken wills and augmented libidos, probably touching themselves and wondering where their [pc.Master] is right this moment. What does Bizzy think about producing scenes with them?");
		else output("You have another slave of course, back on your ship. What does Bizzy think about producing scenes with them?");

		output("\n\n<i>“I think that’s a delicious idea, [pc.Mr] Steele,”</i> your kaithrit camwhore says, with a crooked smile. <i>“The more performers we put on camera, the better the show’s gonna do.”</i> She touches your hand. <i>“That means <i>you</i> too, you know! A lot of people wanna know what my owner is like... what [pc.he] fucks like. Maybe even good enough to justify all the things I’ve said about you... ”</i> She trails her finger up her bust. <i>“Why don’t you send one or two over? We can decide what sort of scenes we could do once I’ve had a chance to chat with them.”</i>");
	}

	else
	{
		output("<i>“Fancy another special feature?”</i> you grin.");

		output("\n\n<i>“Do I fancy getting a big spike in our figures because our audience can’t get enough of watching me getting fucked silly with one of your sexy employees?”</i> Bizzy smiles back, biting her finger. <i>“I <i>might</i> be in the mood for that, [pc.Mr] Steele. Better get one over here quick, before I change my mind... </i>”");
	}

	output("\n\n<i>(Activating premium scenes will increase the amount Bizzy pays out to you that month. Each one only increases the amount for that month once, and each one activated offers slightly less return.</i>)");

	if (mitziIsCrew()) addButton(0, "Mitzi", bizzyMitziFeatureSelection, undefined, "Mitzi", "The gabilani was made to be a porn star.");
	else addDisabledButton(0, "Mitzi", "Mitzi", "Mitzi needs to be on your crew for this.");

	if (!seraIsCrew()) addDisabledButton(1, "Sera", "Sera", "Sera needs to be part of your crew for this option.");
	else if (seraIsCrew() && flags["SERA_OBEDIENCE"] < 80) addDisabledButton (1, "Sera", "Sera", "Sera needs to be fully obedient for this option.");
	else addButton(1, "Sera", bizzySeraFeatureSelection, undefined, "Sera", "Your bratty, vampy sub would undoubtedly be an extranet hit.");
	addButton(14, "Later", bizzyStage5Menu);
}

public function bizzyMitziFeatureSelection():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	if (flags["BIZZY_MITZI_CUNTNOSIS"] == undefined && flags["BIZZY_MITZI_DOUBLE_DICK"] == undefined)
	{
		output("You patch across to your ship, summon Mitzi, tell her where to go. You worry slightly about letting the squat bubblehead out on her own, but since you hinted heavily at why you wanted her, you needn’t have. She’s like a sex-guided missile. Three minutes later there’s an eager hammering on the door.");

		output("\n\n<i>“Oohhhh, I know yoouuu!”</i> Mitzi cries, heart eyes lighting up when she trots into [pornStudioName]’s boudoir. <i>“I’ve watched your shows! I’ve had some <i>amazing</i> orgasms watching you get fucked. It’s, like, wow, what a honor!”</i>");

		output("\n\nShe wiggles straight over to Bizzy in her [mitzi.armor] and throws her arms around her legs, squeezing hard.");

		output("\n\n<i>“Wow, ok,”</i> the kaithrit laughs, embarrassed. <i>“I never thought this would be how I met my fans.”</i>");

		output("\n\n<i>“And we’re gonna do a sexy scene together?”</i> The gabilani is never anything short of enthusiastic, but she’s actually bouncing up and down right now, fists pushed into her cheeks. Her unnaturally buoyant tits wobble mesmerically. <i>“This is soooooo exciting! I’m gonna be famous!”</i>");

		output("\n\nBizzy has disentangled herself and is weighing her biggest (and possibly smallest) fan up, tapping her chin thoughtfully.");

		output("\n\n<i>“She’s custom made for camwhoring, isn’t she?”</i> she says with a slow grin. <i>“Mmm... I can think of lots of things to do with an eager, squishy little snack like this.");
		if (bizzySlaveCollar() == true && flags["MITZI_BRANDED"] != true) output(" Speaking of which... <i>“ the kaithrit nods down at Mitzi’s wide, plump ass with a mischievous smirk. <i>“ ...want her to be branded, like me? The mothy guys said to just send any other performers we pick up down to them to get it done. Wouldn’t take half an hour.”</i>");
	}

	else
	{
		output("You patch across to your ship, summon Mitzi, tell her it’s time for her to be in another [pornStudioName] special. She’s over to the apartment far faster than you’d credit a creature less than 4 feet tall with two balloons tied to her front.");

		output("\n\n<i>“My favorite streamer!”</i> she cheers once she’s inside, running straight over to Bizzy in her [mitzi.armor] to hug her. The kaithrit bends down to return the embrace, looking slightly embarrassed. Squish.");

		output("\n\n<i>“What are we gonna do today then, [pc.Master]?”</i> asks Mitzi, looking over her shoulder at you. Her grip on Bizzy starts to become a grope. <i>“Something really filthy, I hope... </i>”");
	}

	addButton(0, "Cuntnosis", bizzyMitziFeatureCuntnosis, undefined, "Cuntnosis", "Have Mitzi hypnotize Bizzy into being her drooling pussy slave.");
	if (!pc.hasCocks()) addDisabledButton(1, "Double Dick", "Double Dick", "You need more than one dick for this scene.")
	else addButton(1, "Double Dick", bizzyMitziFeatureDoubleDick, undefined, "Double Dick", "Get in on the action by using your well-endowed physicality to fuck them both simultaneously.");

	if (bizzySlaveCollar() == true && flags["MITZI_BRANDED"] != true) addButton(2, "Brand Mitzi", bizzyBrandMitzi, undefined, "Brand Mitzi", "Get Mitzi a [pornStudioName] tattoo, just like Bizzy’s.");
}

public function bizzyBrandMitzi():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("Bizzy walks Mitzi down to the commercial deck whilst you get a line through to Sentient Acquisitions, tell them what’s up. About half an hour later, Mitzi sashays back into the apartment, proudly displaying the [pornStudioName] tattoo spread over the top of her right tit.");

	output("\n\n<i>“I wanted to make sure everyone can see it,”</i> she explains. <i>“Particularly, like, if they’re looking down whilst I’m sucking their cock.”</i> She spreads her hand over it, gives the soft flesh there a squeeze, lost in a happy little reverie.");

	flags["MITZI_BRANDED"] = true;
	processTime(30);
	addButton(0, "Next", bizzyMitziFeatureSelection);
}

public function bizzyMitziFeatureCuntnosis():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("<i>“Why don’t you work your magic on Bizzy?”</i> you say, nodding at Mitzi. <i>“You know... show her how to <i>really</i> love pussy.”</i>");

	output("\n\n<i>“Ooh, that’s a <i>lovely</i> idea [pc.Master],”</i> Mitzi simpers, eyeing the booby kaithrit up.");

	if (flags["BIZZY_MITZI_CUNTNOSIS"] == undefined)
	{
		output("\n\n<i>“Um... what?”</i> says Bizzy, touching her hair with a hint of nervousness.");

		output("\n\n<i>“Oh, you don’t worry about anything, I already know you’re gonna love it... and so are your viewers. Why don’t we tie her up a bit first, [pc.Master]? Lemme have a lil fun with her, first.”</i>");
	}

	else
	{
		output("\n\n<i>“This again,”</i> Bizzy says with a fetching blush. <i>“Being tied up and licking your little whore out... </i>”");

		output("\n\nYou slap her on the ass and tell her to stop pretending she doesn’t enjoy it, an action that draws a slutty meow and a scamper towards the bed. Mitzi is already busily pulling cuffs and ropes out of the boudoir’s spacious cupboards.");
	}

	output("\n\n<i>“Heyyyy there,”</i> the kaithrit says a little while later, the camera zoomed in on her lovely, smiling face. <i>“It’s Bizzy, and you are accessing one of my most secret pieces of business.”</i> She lowers her voice to a sultry whisper, one that seems to drip with sex. <i>“One where I’m joined by other [pornStudioName] sluts, and act out our privatest, filthiest fantasies ...slather ourselves in carnal delight and revel in being slaves to our hot bodies, our out-of-control needs, our debased imaginations, the whims of our owner... just for my premium subscribers.”</i> She bites her lip. She looks very flush.  <i>“I hope you cum <i>really</i> hard to it.”</i>");

	output("\n\nYou’re sat back in the lounge, watching on from a flatscreen device. Bizzy spent some time plotting out the lighting and holograms for this, and as the camera pans back you get to see the effect: her bed appears lost in a dimension of semi-opaque, red, pink and purple mirrors, each either reflecting her own incredible, curvy form or some other, half-seen sexual dalliance. The lurid lights reflect off the pale skin of her face and her massive, round breasts, pillowed out in front of her. She is on her front and naked already, her arms behind her. She appears vulnerable lying there on the sheets" + (bizzySlaveCollar() ? " particularly with her adorable collar.":"."));

	output("\n\n<i>“So first why don’t you introduce yourself... um... </i>” Bizzy closes her eyes, her plush lips opening a little, as if she were about to sneeze. The camera is positioned so you can’t see beyond her head and mountainous boobs. <i>“Why don’t you... oh Void... pleaseintroduceyourselfandstop doingthat!”</i>");

	output("\n\nThere’s a sloppy, slippery sound, and a second later Mitzi bobs into view above her, balloon-like breasts bouncing on top of Bizzy’s hair. Her grinning mouth is smeared with pussy juice, catching the pulsing, sultry lights.");

	output("\n\n<i>“Hiiiiiii!”</i> she trills, waving energetically. She’s still dressed in her ludicrous [mitzi.armor]. <i>“I’m Mitzi, a gabilani who got her brain melted and turned into a total fuck toy! Come and have a look at what I’ve done!”</i>");

	output("\n\nThe drone-operated camera pans upwards. Bizzy’s wrists are locked together with gleaming pink light, unbreakable mag-cuffs. Red rope is knotted around her ankles, each rope tied tautly to opposite ends of the bed frame, spread-eagling her long, shapely legs. Bizzy opens her mouth, then bites her lips again, as Mitzi ties a satin blindfold around her eyes.");

	output("\n\n<i>“Prize pussy’s all tied up,”</i> smiles Mitzi, patting her hands once she’s done. <i>“What would <i>you</i> do, if you had this soft, juicy, big booby kitty cat to enjoy however you want?”</i> She flourishes a knobbly dildo the size of her torso in one hand and a feather duster-like device in the other, which dances into fluffy, shaky motion when she flicks its switch. She lets her long, wet tongue slither out of her mouth, a gleaming pink serpent with a mind of its own. <i>“I’m gonna show what <i>I</i> would do, anyway.”</i>");

	pc.lust(33);
	addButton(0, "Next", bizzyMitziFeatureCuntnosis2, undefined);
}

public function bizzyMitziFeatureCuntnosis2():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("\n\nThe squishy, green bundle of concentred sex clambers all over Bizzy’s helpless, spreadeagled form, tormenting and pleasuring the kaithrit in equal measure with happy, absorbed little giggles. Greedy green fingers trail across her ears, her mouth, her boobs, and then...");

	output("\n\n<i>“Nononono not that! I didn’t sign up for that!”</i> screams Bizzy, writhing helplessly, as Mitzi plays the swishing feather duster over the soles of the kaithrit’s feet. The camera catches every helpless clench of her legs muscles, her tails craning almost to her shoulder blades, the cords in her neck, her wet, open mouth begging at the ceiling. <i>“Ahahahahaha! Please stop! Please stop!”</i>");

	output("\n\n<i>“Isn’t she loud?”</i> Mitzi addresses the camera, shaking her head and swapping her focus to her other foot. <i>“Ok, listen, yowly pussy: If you do exactly what I say from now on, I’ll stop. K?”</i>");

	output("\n\n<i>“Yeeeesssssss!”</i>");

	output("\n\n<i>“Yeeessssssss,”</i> moans Bizzy a little bit later, arching her back as Mitzi stirs her with the big, studded dildo, her pussy lips stretched around its girth. Mitzi’s mouth is open, her mischievousness sublimated by the satin-fine tactility rising and quivering before her, and eventually she can’t herself; still slowly pumping the fuck-stick into the kaithrit, she pushes her face between Bizzy’s round, plump buttcheeks and spears her slathering long tongue into her ass.");

	output("\n\nBizzy cums like that, rocking back on the irresistible sensations filling her nethers, trapped limbs clenching and trembling, husky moans and meows pouring out of the plush, wet hole below the silken blindfold. With the lights and reflections, it does feel like you’re watching two girls  imprisoned in a dimensional pocket of pure pleasure; ");
	if (pc.hasCock() && pc.hasVagina()) output("one of your hand is jacking your [pc.cock] upwards so your other can busy itself on your [pc.clit]"); 
	else if (pc.hasVagina()) output("you are fingering your [pc.vagina]");
	else output("you are jacking your [pc.cock]");
	output(" almost without realizing as you watch, entranced.");

	output("\n\n<i>“Mmm,”</i> Mitzi sighs, slowly pulling back, tongue departing Bizzy’s ass with an indescribable slurp. She squeezes the panting kaithrit’s buttocks merrily, and addresses the hovering drone-cam again. <i>“I think she’s good ‘n softened up now, dontcha think guys? Let’s move on to the main event!”</i>");

	output("\n\nShe scooches herself in front of Bizzy, bare feet pressing into the kaithrit’s boobs. When Bizzy’s blindfold is flung off, her dilated eyes are confronted with a singular, vision-swallowing sight: Mitzi’s plump, slightly parted twat.");

	output("\n\n<i>“Now then kitty slut, remember what I said,”</i> Mitzi says with a lazy smirk, hands on her opened thighs. <i>“You gotta do exactly what I say. And what I want you to do is stare deep in there. What do you see?”</i>");

	output("\n\n<i>“It’s just... your pussy,”</i> mumbles Bizzy, her voice breathy and disorientated. Her pretty marble eyes flick up questioningly to Mitzi’s face, and this gets her ears a hard flick courtesy of Mitzi’s pudgy fingers.");

	output("\n\n<i>“You aren’t looking properly. You gotta look deep... deep in there. Nothing else exists right now. Look at how soft it is. Look at how wet it is. Look at how my juices drip down the folds... doesn’t that make your mouth water? Doesn’t it make you wanna dive in there, lick me silly?”</i>");

	output("\n\nThe screen is split: one camera is on Bizzy’s slack, vague-eyed face, the other on the bare, green sunken treasure that is Mitzi’s sex. Bizzy swallows, and Mitzi hums with gleeful triumph.");

	output("\n\n<i>“Do you want me to open it up for you?”</i> Mitzi asks softly. She could be addressing the audience as much as Bizzy. <i>“Do you wanna look deeper? You gotta ask. Nicely.”</i>");

	output("\n\n<i>“Yes please,”</i> mumbles the kaithrit, green eyes heavily dilated.");

	output("\n\n<i>“Alright then. Keep looking... </i>”");

	output("\n\nIt’s all an act, silly and obvious if you consider it soberly, but brought together into a whirl of overwhelming sexual sensation it’s enthralling. Mitzi sighs, and Bizzy shares in it, a husky exhalation of wonder as the gabilani peels her labia back, lets all watching gaze right into her gleaming, parting folds. She ever-so-gently pumps her fat thighs as she does it, so her pussy shakes and quakes, her internal muscles flexing hypnotically. A tunnel that seems to beckon, promising pleasure beyond all reasoning if you’ll just explore along it... just out of sight.");

	if(flags["MITZI_CUNTNOSIS"] == undefined)
	{
		output("\n\nYou begin to wonder if there isn’t something to this. That it <i>is</i> possible to be devoured by Mitzi’s sensuality and be turned into a mindless, happy sex toy, just like her... you blink, sternly order " + (pc.hasCock() ? "[pc.eachCock]":"[pc.eachVagina]") +" to calm the hell down. No. It’s just a very effective piece of sexual theatre.");

		pc.lust(33);
	}

	else
	{
		output("\n\n[pc.lips] gently parted, you watch eagerly, the sight of Mitzi’s wonderful, lush cunt swallowing you whole. You already had your mind dissolved by this treatment, you eagerly submit to it again, and Void it’s just as good as it was the first time: Pink pulses resonating through your brain, saliva filling your mouth, your [pc.lips] and [pc.tongue] becoming incredibly tender and willing, the need for pussy juice singing in your veins. You gaze into the vision of lush, green sex unblinking, gently drooling, an unbearable desire to eat muff overwhelming you.");

		pc.lust(250);
	}

	output("\n\n<i>“That’s right, cute lil pussy cat, you keep looking in there... </i>” Mitzi’s high, girly voice is a croon, over the mesmeric sight taking up the whole of the screen. Her finger flicks over her thick clit, pleasuring herself as she continues to talk. <i>“Doesn’t it make your mouth run? Doesn’t it make you thirsty? You’d do anything to taste that, wouldn’t you. You’d be my slave just to be able to flick your flat lil tongue over it. Say it.”</i>");

	output("\n\n<i>“Yes,”</i> groans Bizzy. The camera catches little drops of saliva pattering onto the alabaster paleness of her breasts. <i>“Let me. Please.”</i>");

	output("\n\n<i>“Nnnooot just yet,”</i> Mitzi giggles. Her pussy gapes and trembles, almost appearing as if her voice were emanating from it. <i>“You just keep looking and craving it for a little while longer. I want all your other thoughts to go... cos they’re silly, aren’t they? They aren’t related to licking my cunt like a good girl. You don’t want those thoughts. You just want to think about how good my pussy looks and tastes and feels... you want that front and center, making you wet and obedient. Don’t you?”</i>");

	output("\n\n<i>“Yeah,”</i> mumbles the kaithrit, shivering slightly in her bonds. All of her theatricism has dissipated; the camera is upon Bizzy, stripped down to her subby, lusty core. <i>“I want that. Please... please give it to me. I’ll do anything.”</i>");

	output("\n\n<i>“Yyeeaaahhh,”</i> Mitzi smiles, running her hand lovingly through the kaithrit’s silky hair. <i>“You will, won’t you? Alright,”</i> she whispers, pull her short, plump legs apart as far as they will go. <i>“Go for it, my cute little pussy cat.”</i>");

	addButton(0, "Next", bizzyMitziFeatureCuntnosis3, undefined);
}

public function bizzyMitziFeatureCuntnosis3():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();
	
	output("Bizzy surges forward - or as best she can, with her wrists bound behind her back, a wriggling, desperate movement - and thrusts her face between Mitzi’s thighs, attacking the gabilani’s big, plump clit with ravenous kisses and flicks of her pink slip of a tongue. The camera zooms in, picking out the swishes and pulls of those expressive lips upon the soaked, tender folds and promontories of lush green pussy in aching hi-definition, landscapes of dripping sex coated in pulsing, lurid light. It’s dizzyingly stimulating, your ");
	if (pc.hasCock() && pc.hasVagina()) output("your [pc.cock] and [pc.vagina] pulsing with shared excitement without you even pleasuring them.");
	else if (pc.hasCock()) output("[pc.cock] thrumming and leaking pre without you even stroking it.");
	else output("[pc.vagina] leaking [pc.femcum] in excitement without you even fingering it.");

	output("\n\nMitzi giggles and gasps, heart pupils dilating, and as her lust froths over in response to Bizzy’s frenzied make out with her enthralling pussy she eagerly grabs white hair, wraps her chubby little thighs around the kaithrit’s head, burying her deep, deep into the mind-destroying flavor and texture of it.");

	output("\n\n<i>“It’s rough and wet... </i>” she whines. <i>“ ...it catches and makes me tingle and ohh, pussy was made to lick pussy, she was! Ooooohhhhhhh!”</i>");

	output("\n\nThe gabilani’s balloon breasts shake and jiggle wildly at the ceiling as she shrieks for joy, sent over the edge by the thirsting, needy slurps between her legs, hot wet cat tongue dragging over her over-stimulated bits. The audio picks a husky, delighted groan from Bizzy too, rewarded with a sticky gush of bimbo juice all over her face. The camera hangs back to her spreadeagled thighs, revealing the liquid excitement trickling down them.");

	output("\n\nMitzi has only just gotten started. In high excitement she undoes the ropes around Bizzy’s ankles and orders her to roll over. The kaithrit is no longer taut and bound, but she remains just as powerless to the curvaceous little shortstack’s smutty whims; when she swings over on the sheets her eyes are heavily dilated, her lips softly parted, will completely subordinated by Mitzi’s hypnotic sex. There is a sheen of greedy pink over her eyes when Mitzi sits herself down on her face, smothering her in soft ass flesh and pressing her beading, parted cunt firmly onto her mouth.");

	output("\n\nMitzi rides Bizzy’s face with happy and then frenzied bounces, playing with the kaithrit’s tits as she does it, pulling and pinching at her nipples as her slave’s fingers disappear deep into her thighs, getting as deep as she possibly can into her wet, silken pussy, pleasuring every petal and crevice of the gabiliani with eager laps and kisses, lifting her up to another shrill, soaked orgasm.");

	output("\n\nBarely even stopping for breath, Mitzi crawls her way down Bizzy’s peachy, genetically augmented form and levers her thighs open, cooing with delight at the denied, steaming treat that lies in there, her heart pupils pulsing with insatiable lust.");

	output("\n\n<i>“Ohhh,”</i> Bizzy moans woozily, as Mitzi shifts her plump little thigh over her own, bringing her own pussy in to press lewdly into Bizzy’s. Once again the camera zooms in, capturing the obscene, wet kiss, folds and inner silk slipping and sliding over each other. <i>“Please... </i>”");

	output("\n\nWhatever Bizzy is pleading for, what she gets is a long bout of scissoring, slowly at first as Mitzi revels in the slithery pleasure pulsing up from their melded sexes, then more intense as once again arousal grips her over-stimulated form, wrapping her foot around Bizzy’s waist and thrusting herself into the kaithrit’s exposed twat, drawing her inescapably into a steamy clinch.");

	output("\n\nTheir massive boobs press and palpitate against each other, their softness wobbling furiously as they fuck each other, now lost totally in the writhe and press of their whorish bodies; lost in that red and purple mirror dimension, slaves to their carnality. The audio augments every squish, squirt and moan, making it echo around the room, reverberating it back from the half-seen images in the reflections.");

	output("\n\nPerhaps you shouldn’t get off to this - you have access to the stars themselves, of course, and how gratifying it would be to bury your towering lust deep in warm, damp, panting bimbo once they’re done with each other - but you can’t help yourself. ");


	if (pc.hasCock() && pc.hasVagina()) output("Your hands are a blur on your [pc.cock] and [pc.vagina], jerking and fingering yourself simultaneously as you watch them scissor frenetically, and you groan as double orgasm seizes you up, ropes of [pc.cum] flung into the air at the same time as [pc.femcum] warms your digits. Good thing Bizzy’s settee and carpet are wipe friendly.");
	else if (pc.hasCock()) output("Your hand is a blur on your [pc.cock] as you watch them scissor frenetically, on their bouncing breasts and sweaty faces and you cum electrically, jerking out gloopy ropes of [pc.cum] all over Bizzy’s settee and carpet in glowing tribute to her fine efforts."); 
	output("You finger your [pc.vagina] furiously as you watch them scissor, two fingers deep in your pot whilst another flicks at [pc.eachClit], and you orgasm wonderfully, moistening your hard-working fingers and Bizzy’s settee in glowing tribute to her fine efforts.");

	pc.orgasm();

	output("\n\nIn a dripping, post-coital daze you watch Bizzy and Mitzi continue to fuck; Mitzi’s huge tongue disappearing deep into Bizzy’s face as she shudders and whines with delight, pounding and rubbing herself all over the kaithrit’s opened twat, Bizzy deliriously groping her green, pillowy ass as she does it. How many times do the pair of them orgasm? Impossible to tell really, with erogenous zones that sensitive, that size, and that stimulated. They lie together, a shared puddle of panting female flesh, when they’re finally too exhausted to keep going, drone cam panning directly above them.");

	output("\n\nMitzi manages to raise her hand above Bizzy’s vacant expression, snap her pudgy fingers. Your kaithrit pet jerks, blinks.");

	output("\n\n<i>“Oh! Ohhh.”</i> She smiles slowly at the shortstack bimbo in her arms. <i>“Woooowww. That was uh, pretty trippy. My brain feels... tingly.</i>”");

	output("\n\n<i>“Good,”</i> Mitzi giggles, squeezing her. Their tits press into each other, a rising, descending landscape of soft give. <i>“You are a totally <i>awesome</i> rug munch, Bizzy girl. You should be in the zone aaaallll the time.”</i>");

	output("\n\n<i>“I hope </i>you<i> enjoyed this,”</i> Bizzy turns her smirk upon the camera above her. <i>“This has been another of my most dangerous, filthy fantasies, brought to life with help from my stablemate Mitzi.”</i> She gives the gabilani’s ass a good squeeze, making her gasp and giggle. <i>“Stay subscribed to see this kind of content... </i>” Pink shimmers over her green eyes. <i>“ ...aaaalll the time.”</i>");

	pc.orgasm();
	addButton(0, "Next", bizzyMitziFeatureCuntnosis4, undefined);
}

public function bizzyMitziFeatureCuntnosis4():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("You clean yourself up and head back into the boudoir, where the girls are doing the same, laughing and chatting with each other in thin, [pornStudioName]-branded gowns.");

	output("\n\n<i>“What do you think?”</i> asks Bizzy, swigging bottled water. <i>“Premium content, do you think?”</i>");

	output("\n\nYou think it would be dangerous to make content as hot as this more widely available, quite frankly.");

	if(flags["BIZZY_MITZI_CUNTNOSIS"] == undefined)
	{
		output("\n\n<i>“Oh, it will be all over the extranet anyway,”</i> says Bizzy. Her cheeks redden again and she smiles, the exhibitionist in her clearly revelling in the fact. <i>“But I’ll put together some adverts together for it, and hopefully we’ll get a subscriber bump this month off the back of it.”</i>");

		output("\n\n<i>“You’ll let me come again, won’t you?”</i> cries Mitzi, tugging on your [pc.armor]. <i>“I love playing with your pet pussy cat, she’s so soft and stretchy and cute! Then I can go home and flick myself silly watching it back all over again.”</i>");
	}

	else
	{
		output("\n\nYou answer with a heartfelt ‘o’ gesture.");

		output("\n\n<i>“Great,”</i> grins Bizzy, heaving her gowned, top-heavy body off the bed. <i>“I’ll get together some ads for it right away. We should get a nice subscriber bounce off the back of this.”</i>");

		output("\n\n<i>“I like bouncing,”</i> Mitzi says, watching Bizzy sway towards the bathroom with a happy sigh. <i>“You’ll let me bounce with your pet pussy cat again, won’t you? She’s soooo much fun.”</i>");
	}

	if (flags["BIZZY_MONTHLY_FEATURES"] == undefined) flags["BIZZY_MONTHLY_FEATURES"] = 1;
	else flags["BIZZY_MONTHLY_FEATURES"]++;

	processTime(120);
	flags["BIZZY_MITZI_CUNTNOSIS"] = true;
	flags["BIZZY_FEATURE_COOLDOWN"] = GetGameTimestamp() + 120;
	bizzyStage5Menu();
}

public function bizzyMitziFeatureDoubleDick():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("The presence of two of your pantingly eager, generously proportioned sluts causes your libido to muscle into the room, and make hard, heated demands that are impossible to say no to.");

	output("\n\n<i>“I want to be in this one,”</i> you say, eyeing the outrageous green and peach curves laid before you.");
	if (pc.balls > 0) output(" Your [pc.balls] feel like " + (pc.balls < 2 ? "its":"they’re") + " swelling just looking at the pair.");
	output(" You gesture downwards. <i>“What if we make use of- </i>”");

	output("\n\n<i>“[pc.Master] having " + (pc.cockTotal() > 2 ? "loads of":"two") + " big yummy dicks!”</i> Mitzi finishes, heart pupils flashing excitedly. <i>“[pc.He] could do us both at once! Yeesssssss!”</i>");

	if (flags["BIZZY_MITZI_DOUBLE_DICK"] == undefined) output("\n\n<i>“Hmm.”</i> Bizzy taps her bottom lip as she weighs you up with a director’s eye. <i>“That could work. Could be really good, actually.<i>“ She breaks into a grin. <i>“Alright. This is how we’ll do it... </i>”");

	else output("\n\n<i>“Well... it certainly boosted our subscription figures the last time we did that.”</i> Bizzy breaks into a lusty smile. <i>“I’m down. Same way as last time?”</i>");

	pc.lust(33);

	addButton(0, "Next", bizzyMitziFeatureDoubleDick2, undefined);
}

public function bizzyMitziFeatureDoubleDick2():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	processTime(180);

	output("It’s several sticky, strenuous hours later. You are relaxing on the sofa in the lounge area loosely dressed in a satin gown, the rough cut of the scene you just did on the holopad before you. It will still need plenty of editing, but you can’t help but want to see how it turned out, and with Bizzy in the shower, plenty of residual " + (pc.libido() >= 30 ? "arousal":"Priapin") + " swimming in your veins and the insatiable Mitzi in situ, this is a perfect opportunity to do so. You grunt as wet, plump lips wick around your [pc.cockHead 0], lapping away the sticky cocktail of sex left on it, and a pudgy hand slides up and down your shaft.");

	output("\n\n<i>“Good girl. Nice and slow, now... </i>”");

	output("\n\nYou click play. You grimace as you are immediately presented with a close up of your own face, gazing directly into the camera. Nothing quite as discomforting as having yourself speak to you.");

	output("\n\n<i>“Hello there, premium subscribers... [pc.name] Steele here, CEO of [pornStudioName]. You are viewing one of Bizzy’s Business’s most private pieces of business.”</i>");

	output("\n\nNot terrible. Bit mechanical - perhaps you’ll never be cut out to be a star of the extranet screen - but you think you sound alright, all things considered. You watch as the camera drone you were facing slowly zooms outwards, revealing that you are sat at a large, dark, reflective desk, dressed in a smart, tight-fitting, black-and-yellow Steele executive suit. You weren’t really able to appreciate the holographic projections around you at the time, but now you see they seamlessly created an illusion of a plush, executive office with rich, wood-panelled walls. Bizzy insisted upon all of this, and taking it in now you admit the effect is quite powerful: despite your youthfulness you project the image of a business lothario ensconced in [pc.his] executive suite.");

	output("\n\n<i>“You know, being the business magnate owner of an adult entertainment company isn’t all fun and games,”</i> you’re saying. The audio is picking up faint licking, suckling sounds. It’s faint enough that you might think it’s a fault with the audio (certainly it doesn’t compete with the lusty hums and slurps emanating between your thighs right now). It’s a simple, effective trick of Bizzy’s: faintly suggest, tickling implication, before actually showing it.");

	output("\n\n<i>“It’s hard work. Stressful. Which is why, after a long day, I like to commandeer a couple of my favorite stars. Have them all to myself.”</i> You close your eyes and lean back momentarily, jaw muscles moving, exhale long and hard. <i>“But that would hardly be fair on you, our loyal patrons, would it? Which is why, for this premium episode, I invite you behind the locked door of my office. So you can watch every last second.”</i>");

	output("\n\nThe view swaps to the second drone cam, hovering out of view above your head, looking directly downwards. A tub of naked, multi-colored girl flesh has been squeezed into the space below the desk: Your [pc.cock 0] and [pc.cock 1] are out of your pants, throbbingly erect, and Bizzy and Mitzi are lustily licking and fondling one apiece.");

	output("\n\n<i>“Hi guys,”</i> Bizzy simpers upwards. <i>“I’m sorry about this... [pc.Mr] Steele has so many hot, pent-up needs that need taking care of.”</i> She indicates [pc.eachCock], an obscene, stag-like display of potency. <i>“I hope you enjoy me and Mitzi doing exactly that.”</i> She bites her lip and then trails a long, lavish lick up your [pc.cock 1], making it pulse ardently. <i>“I know I will.”</i>");

	output("\n\n<i>“I will too!”</i> Mitzi burbles upwards, blimp-like breasts distorted against your chair and [pc.legs]. ");
	if (flags["BIZZY_MITZI_DOUBLE_DICK"] == undefined && flags["BIZZY_MITZI_CUNTNOSIS"] == undefined) output("<i>“Hi, I’m Mitzi! I’m a gabilani that got turned into a total fuck toy! if you watch me you’ll see how much fun it is and you’ll wanna become one yourself!</i>”");
	else output("\n\nI’m Mitzi! You remember me, right? Yeah, you do! Make sure you have lots ‘n lots of orgasms watching me get my brains fucked out!”</i>");

	output("\n\nOn the screen your vividly erect [pc.eachCock] bats them both on the cheek, a gentle reminder of why they’re here, and they get back to it, curling their hands around a cock each and bending them to their lush, wet mouths, their twinkling eyes raised to you as they lavish your pricks with hungry sucks and licks.");

	output("\n\nYou watch that, the memory of it coursing through you at the same time as your pc.cock 0] is expertly sucked in the right here and now; time has become a river of blowjobs. You sink a hand into Mitzi’s glossy hair, lift the holopad away to find her eyes, pink hearts throbbing lustily upwards as she fills her wet, silky mouth with your prick with fervent bobs of her head.");
	if (flags["MITZI_BRANDED"] == true) output("\n\n She was right: that tattoo across her breast, permanently marking her as yours, is exquisite to behold when she’s knelt before you.");

	output("\n\nThe shortstack cumslut’s slurps and smacks are fueled by hunger; she didn’t get fed during the course of the scene, as turning your attention back to the holopad reminds you. In high definition you see yourself being worked into a frenzy by the two, their experienced hands and mouths shining your [pc.cock 0] and [pc.cock 1] into gleaming, oozing pillars of urge, your back arched and mouth open as they push their bare breasts into each other and suck you simultaneously, giggling at the state they put you into.");

	output("\n\nBefore you could cum though, you seized Bizzy, swung the pale kaithrit over the desk, pushed her lovely round bum into the air, made her coo and twitch as you swirled your fingers in her pussy, felt her ready wetness for yourself. That wasn’t enough for a commanding captain of industry like you; you lofted Mitzi into the air and laid the squishy, jiggling green treat on top of Bizzy, her bright purple hair washing over the kaithrit’s shoulders.");

	output("\n\nYou remember the two bot-cams circling around you like a planet mobile as you railed Bizzy from behind, your [pc.thighs] slapping into your soft behind, driving your [pc.cock 0] into the dripping, clenching pot of her sex, all the while you feasted upon Mitzi’s flesh, mauling her endless soft give of her breasts, eating her soaked pussy with wolfish drags of your mouth and [pc.tongue] until sweet bimbo juice fell down your chin, every crevice and curve of her tactile enough to make her coo and squeal when you so much as laid a finger on it, one big over-ripe erogenous zone.");

	output("\n\nThe angle the bot-cams enjoyed the most was the view from the other side of the desk, and you have to admit, they make a convincing case: Bizzy’s huge breasts hanging over the edge, shaking and jiggling with it, claws biting into its surface, mouth open, cooing and then moaning with real desire as she’s rigorously taken; Mitzi upside down on top of her, waggling her little legs in the air and crying out with whorish enthusiasm as you chew upon one of massive nipples" + (mitzi.canLactate() ? ", milk squirting all over herself and your face.":"."));

	output("\n\n<i>“Oh, fuck me [pc.Mr] Steele! Fuck me good! Use me like the office relaxer I am!”</i> Bizzy is crying deliriously.");

	output("\n\n<i>“Yes, fuck her good!”</i> Mitzi agrees, jiggling wildly. <i>“Ohh, it’s like being on one of those bucking bronco things!”</i>");

	addButton(0, "Next", bizzyMitziFeatureDoubleDick3, undefined);
}

public function bizzyMitziFeatureDoubleDick3():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("One...damn. You’re getting close to the edge again watching that, and you haven’t even gotten to the climax. You take several calming breaths and carefully push present-Mitzi off your [pc.cock 0]. She parts from it with a sucking ‘pop’, making it waggle in the air.");

	output("\n\n<i>“Aww, am I going too fast for you [pc.master]?”</i> She grins up at you teasingly, licking her beestung lips. <i>“It’s only cuz I need your cum, like... </i>” The [pc.cumFlavor] hits and she closes her eyes. You hear the gentle patter of cunt-juice on the floor beneath her. <i>“ ...real bad.”</i>");

	if (pc.balls > 0) output("\n\nIt’s fine. You can compromise. Soon enough lovely, wet suction is being applied to your [pc.balls] instead, exquisite sensation that sends dull, liquid lust pulsing up [pc.eachCock] but not so insistently it’s going to send you over the edge.");
	else if (pc.hasVagina()) output("\n\nIt’s fine. You can compromise. Soon enough that tongue is flicking at your [pc.clit], her mouth buried deep beneath your [pc.thighs] in order to make out with your [pc.vagina], lovely sensation slipping deep into your groin but keeping [pc.eachCock] from the edge.");
	else output("\n\nIt’s fine. You can compromise. You get her to fondle your [pc.cock 1], slowly but surely, giving your [pc.cock 0] space to climb down from the edge.");

	output("\n\nOn screen you’re cumming though, bestial groans and wet splurts augmented by the audio into a symphony of paradisiacal synthesia as you pack Bizzy’s pussy with [pc.cum], your [pc.thighs] jackhammering into her peachy ass until it’s spurting and slopping down your [pc.legs], making the kaithrit writhe with joy. Good Void, is that really the expression you wear when you’re nutting? You hope that face doesn’t intrude in your thoughts the next time you’re orgasming (you know full well it will).");

	output("\n\nYou stepped back from the desk, allowing the floating drones to take in your handiwork - the [pc.cumVisc] " + (pc.cumQ() > 3000 ? "bucketloads":"tablespoons") + " of [pc.cum] oozing out of Bizzy’s gaped pussy, the sweat sheening the two girls’ smooth, lustrous skin, the rosy, slutty joy written on both of their faces - and then you swept them both over to the couch to finish the job. ");
	if (pc.libido() > 30) output("By the time you had them both sat on your [pc.thighs] you had recovered your erections, proudly displaying those gently oozing shafts to the silent floating ball in front of you, a vulgar testament to your stamina.");

	else output("The camera panning away from you gave you time to surreptitiously jab yourself with a medpen of Priapin, pick-me-ups Bizzy keeps for her male-endowed performers. You remember the tiny sting, the heat entering your veins, masculine urge once again seizing you up, making you hard again. By the time you had them sat on your [pc.thighs] your erections were in the air again, proudly displaying those gently oozing shafts to the silent floating ball in front of you. Seamless.");

	output("\n\n<i>“As I told you guys... </i>” Your [pc.chest] trembled as Bizzy ran her hand along your [pc.cock 1], stroking the tender, throbbing meat. You remember the [pc.cum] oozing down your [pc.thigh], emanating from the cream-pie you’d already left in her pussy. <i>“ ...[pc.Mr] Steele takes a <i>lot</i> to satisfy [pc.him].”</i>");

	output("\n\nYou grasped one soft butt in each hand, mauling and fondling the cooing, giggling, sighing gabilani and kaithrit, glorying in their warm weight on your [pc.thighs], pushing them together so the drone camera in front of you could admire them both. They both have ostentatious racks, but the size difference means they don’t squish together; instead, Mitzi’s blimp-like tits press into Bizzy’s taut tummy, whilst the gabiliani’s face disappears deep between Bizzy’s. Stubby green fingers disappear into the kaithrit’s creamy plumpness, delighted, muffled laughter emanating from deep within the cleavage.");

	output("\n\nYou didn’t even consider the way your whores interlocked like that " + (flags["BIZZY_MITZI_DOUBLE_DICK"] == undefined ? "before you":"the first time you") + " shot the scene, but wow was it perfect for your purposes; from the front the aesthetic is both obscene and very satisfying. Bizzy sighed and then moaned with joy, tails curling upwards as you pushed her thigh upwards, sinking your [pc.cock 0] into her oozing, steaming twat for the second time; you then pressed Mitzi into her, thighs sliding over each other, so that you could do the same to her, lifting her up and probing with your [pc.cock 1] until it felt the silken, limbre magic of gabilani bimbo puss sliding over it, welcoming it inside.");

	output("\n\n<i>“Ooh... </i>” Bizzy sighs on the screen, eyes closed as she simmers in the feeling of your [pc.cockNoun 0] slipping deep inside her, and then squeaks as she’s jostled, you shifting around in the couch groaning under the weight of so much ass and titty, finding the best possible angle to thrust into both of the same time. <i>“Ooh, please be careful, [pc.Mr] Steele! Keep a tight grip on me!”</i>");

	output("\n\n<i>“Mffrrrmmuurrmrrrfffmmm!”</i> Mitzi opines.");

	output("\n\nYou did so, revelling in squeezing the pair together on your lap, soft flesh lolling out in every direction, then lying back and using every fibre of your might to pump them both from below, driving your cocks into one soaked, plush box each. As her arousal climbed to fever pitch, Bizzy throws her arm around your back, begins yowling incredible obscenities at the ceiling; a floating cam up there centered on the star’s face, her wet, open lips, her tits shaking and swaying wildly around Mitzi’s purple hair with each determined drive of your [pc.thighs] buried below. Mitzi has no such recourse for balance: she just has to hang onto Bizzy’s breasts as best she can. At one point she actually manages to pull herself out of their suffocating sweetness and plant her own fat, gleaming lips onto one of Bizzy’s plump, erect nipples, an action you think probably sends the kaithrit caterwauling into orgasm.");

	output("\n\nFuck. The angles... the sounds of it... it’s overwhelming, overbearing stimulation. Unable to stop staring at the screen, you fumble with Mitzi below you, ");
	if (pc.balls > 0) output("pulling that loving suction off your [pc.balls]");
	else if (pc.hasVagina()) output("pulling that loving tongue away from your [pc.vagina]");
	else output("pull her teasing hand away from [pc.eachCock]");
	output(" and demandingly thrust your [pc.cockHead 0] past those succulent, well-trained lips of hers. She obeys your silent demand with a happy whine, hollowing her cheeks and applying thirsty suction to your [pc.cock 0] as you continue to watch the porn the pair of you just created.");

	output("\n\nYou take a firm hold of the suckslut’s purple hair and fuck her mouth with reactive thrusts of your [pc.thighs], orgasm inevitable as you bathe your eyes in the sight of mauling Mitzi’s lovely breasts, making her cum on the screen, her gleeful face stuck between Bizzy’s own jiggling boobs like a massive fleshy collar. Your [pc.cock 0] swells mightily in the present, and you groan with joy, muscles clenching as you paint the wet, avid mouth that you’re mired in with hot, [pc.cumVisc] seed. Mitzi’s hungry, slutty ‘mmm’ trembles through you as your orgasm rolls itself out, your " + (pc.balls > 0 ? "spit-shone balls":"cock") + " throbs out " + (pc.cumQ() < 3000 ? "one gobbet of [pc.cum] after another":"enough [pc.cum] it’s soon spurting out of the gabilani’s nostrils and mouth") + ". How are you able to cum this powerfully after going several rounds with two porn stars hardly an hour ago? They’re that good at getting you going; they demand that level of stamina from their stud [pc.Master], that’s how. You pull out of Mitzi’s slippery, kneading maw to flex the last few rounds across her face and breasts.");

	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	addButton(0, "Next", bizzyMitziFeatureDoubleDick4, undefined);
}

public function bizzyMitziFeatureDoubleDick4():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("<i>“Mmm... thank you, [pc.master]!”</i> the jizz-glazed shortstack says, patting her {full, bulging} stomach happily. <i>“Doing porn sure makes a girl hungry. Where you up to?”</i>");

	output("\n\nYou let her clamber up onto the sofa, squeeze herself into your side so you can both watch the frantic action still ensuing on your holo-device. You are utterly spent, sagged back into the couch and throbbing hard, and you shift uncomfortably as you watch you make ridiculous, lionish sounds echo around the set, squeezing your bimbo sandwich together and cumming into them deep, the inhuman pleasure of it driving you to a maddened zone of pure carnality where you could only obey the deep imperative to fill both of the slickened, twitching breeding holes with your [pc.cum] until it was dripping thickly down your [pc.skinFurScales].");

	output("\n\n<i>“Yeeessss,”</i> whines on-screen Mitzi, lolloping tongue hanging out of her huge smile. <i>“Gimme that cum, [pc.Master]! Oh, fill me up to the top with it!”</i>");

	output("\n\n<i>“I do say some silly things when I’m being screwed, don’t I?”</i> sighs present-Mitzi with a shake of the head. <i>“You <i>can’t</i> be filled to the top with cum when it goes in there. Unfortunately.”</i>");

	output("\n\nOn screen the three of you have devolved into a panting pile of multi-colored flesh on the couch.");

	output("\n\n<i>“Isn’t [pc.he] a beast?”</i> says Bizzy, her rosy smile zoomed in on, head between the crook of your arm. <i>“[pc.he] needs a harem of horny, slutty stars to keep [pc.him] satisfied, even just for a bit. Isn’t that right, [pc.Mr] Steele?”</i>");

	output("\n\n<i>“It’s why you’re my favorite employee, Bizzy. Now... </i>” The camera pans back from your heads to reveal [pc.eachCock], already inflated and darkened again. " + (pc.libido() < 30 ? "Priapin is a hell of a drug. ":"") + "<i>“Time for round 3.”</i>");

	output("\n\nNo - you’re not watching any more of this, lest you wind up trapped in an eternal recorded loop of sucking and fucking. You throw the holopad over to Mitzi just as Bizzy comes back in, dressed in a bathrobe and towelling her snowy hair.");

	output("\n\n<i>“That’ll be a little raw, what you’re watching,”</i> she says, wiggling a corner of towel into a pointy ear. Did you fuck her in the ear? Honestly, it all got a bit blurry after a while. <i>“Once I’ve edited it a bit, it should be a lot better.”</i> She smiles brightly. <i>“I reckon it’ll be a hit, though. " + (flags["BIZZY_MITZI_DOUBLE_DICK"] == undefined ? "You two were made for this kind of thing, you know.</i>”":"You and Mitzi are real fan favourites. We always get loads more subs when you two have been on.”</i>"));

	output("\n\n<i>“Is the shower free?”</i> says the cum-");
	if (pc.cumQ() > 3000) output("stuffed and-");
	output("spattered gabilani on the couch. Her heart eyes are glued to the screen in her hands, flickering light cast over her vacant features. <i>“And... uh... wanna come in there with me?”</i>");

	output("\n\nInsatiable. Thank One for " + (pc.libido() > 30 ? "the stamina you’ve infused yourself with.":"Priapin."));

	if (flags["BIZZY_MONTHLY_FEATURES"] == undefined) flags["BIZZY_MONTHLY_FEATURES"] = 1;
	else flags["BIZZY_MONTHLY_FEATURES"]++;

	processTime(30);
	flags["BIZZY_MITZI_DOUBLE_DICK"] = true;
	flags["BIZZY_FEATURE_COOLDOWN"] = GetGameTimestamp() + 120;
	bizzyStage5Menu();
}

public function bizzySeraFeatureSelection():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	var validDoubleAnalDick:int = -1;

	if (flags["BIZZY_SERA_BDSM"] == undefined && flags["BIZZY_SERA_DOUBLE_ANAL"] == undefined)
	{
		output("You patch across to your ship, summon Sera, tell her where to go. Fortunately you carry around her collar control around on Tavros, just for eventualities like this.");

		output("\n\nShe takes her time. You’d guess partially to drink in her old haunts again, partially to wind you up. About twenty minutes later, there’s a rattle of nails on the door.");

		output("\n\n<i>“So, this is your pet porn studio, is it?”</i> The statuesque demon-morph clacks through the lounge and then into the boudoir, tail swishing, a sneer brushing her mouth as her reptilian eyes flick here and there. <i>“I can see the delivery boy ploughing the bored housewife right now. Did you really intend to build something so mundane? Why not a dungeon?”</i>");

		output("\n\n<i>“We can do a dungeon,”</i> Bizzy says, sat on the bed. Her tone is relaxed, but her face is tense as she takes in the imposing, heavily modded human. She picks up her holo-device, clicks at it a bit, and a moment later you’re standing in a projection of a stone prison, lit with flickering torches and hung with chains. <i>“See?”</i>");

		output("\n\n<i>“Mmm. Holographic sh- stuff has never done much for me,”</i> Sera proclaims. She moves forward, stretches out her claws, and gently scrapes Bizzy’s throat and chin. Unresisting, the kaithrit looks soft and unfocused as she gazes into Sera’s fluorescent eyes. <i>“Love the tits you’ve put on this one, [pc.master]. Really looking forward to getting my claws into them.”</i>");

		output("\n\nBizzy inhales and blinks, looking the tall succubus up and down with a slightly more clinical gaze.");

		output("\n\n<i>“She’s like an... edgier version of Kanette, isn’t she?”</i> the kaithrit says with a little smirk. <i>“I can see our audience liking that. What do you think, uh, ‘Sera’? Ready to slut it up on camera for your [pc.Master]?”</i>");

		output("\n\n<i>“Whatever this Kanette of yours can do, I can do ten times better,”</i> snaps Sera, jabbing her [sera.skinColor] breast fiercely. <i>“Bring it on, kitty slut. I will make your eyes roll right out of your skull and moan my name with the right amount of respect, any time you want!”</i>");

		if (bizzySlaveTat()) output("\n\n<i>“I think you want to put the brand on that one,”</i> Bizzy says to you, grin widening even more. <i>“She strikes me as someone who might forget who owns her, if it’s not written across her bum. The mothy guys said to just send any other performers we pick up down to them to get it done. Wouldn’t take half an hour.”</i>");

		output("\n\nYou better get a camera on these two fast; the sexual tension in this room is escalating rapidly.");
	}

	else
	{
		output("You patch across to your ship, summon Sera, tell her it’s time for her to be in another [pornStudioName] special. She slinks into the apartment eventually, as if she just happened to be in the area.");

		output("\n\n<i>“This studio is dependent on me really, isn’t it?”</i> she sighs, her tail flicking at Bizzy’s ankles. <i>“Poor titty kitty is merely a conduit for me to reach my adoring fans.”</i>");

		output("\n\n<i>“It’s true. The audience really does love watching you getting your attitude fucked right out of your skull,”</i> Bizzy shoots back, tails curling upwards.");

		output("\n\nHonestly, you should look into monetising these two’s catfights.");
	}

	for (var i:int = 0; i < pc.cocks.length; i++)
	{
		if (6 < pc.cocks[i].cLength() < 14)
		{
			validDoubleAnalDick = i;
			break;
		}
	}

	if (validDoubleAnalDick != -1) addButton(0, "Double Anal", bizzySeraFeatureDoubleAnal, undefined, "Double Anal", "Harness the pair of them up and give it to them both in the ass.");
	else addDisabledButton(0, "Double Anal", "Double Anal", "You need an appropriately sized cock for this scene.");

	if (flags["SERA_BRANDED"] == undefined && bizzySlaveTat()) addButton(2, "Brand Sera", bizzyBrandSera, undefined, "Brand Sera", "Get Sera a [pornStudioName] tattoo, just like Bizzy’s.");
}

public function bizzyBrandSera():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("Sera’s face screws up into a furious pout when you tell her where she has to go, but she knows better than to disobey. Bizzy is gracious enough to say nothing, fiddle with her flatscreen as she storms out, but she can’t help her quiet, smug smile when Sera storms back in about half an hour later, the [pornStudioName] brand spread across her left buttock. You kick back and admire it. Yes, there always <i>was</i> something missing there, wasn’t there?");

	output("\n\n<i>“Happy?”</i> Sera snaps, eyes burning over her shoulder. <i>“Can you at least humiliate me in a way that lets me get off now?”</i>");

	processTime(30);
	flags["SERA_BRANDED"] = true;

	addButton(0, "Next", bizzySeraFeatureSelection);
}

public function bizzySeraFeatureBDSM():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();


}

public function bizzySeraFeatureDoubleAnal():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("Seeing the pair of them spit and spar suggests to you that they really need the mediating presence of their [pc.master] in the scene, making it abundantly clear they both should be pulling in the same direction. And what better way of doing that than fucking them in the ass?");

	if(flags["BIZZY_SERA_DOUBLE_ANAL"] == undefined) 
	{
		output("\n\n<i>“I’m going to be in this one,”</i> you say, eyeing up their curvy rumps, ardor pulsing into [pc.eachCock], swelling " + (pc.hasCocks() ? "them":"it") + " with barely suppressed urge. <i>“And I know how we’re going to do it.”</i>");

		output("\n\nBizzy listens as you lay out your lusty fantasy, and Sera interjects, adding details from her own smoke-filled imagination as you stir it.");

		output("\n\n<i>“I like it,”</i> Bizzy says at last, tapping at her holo device. <i>“Actually - I <i>love</i> it.”</i> She grins at you, small fangs biting her bottom lip. <i>“it’s gonna send our subscribers wild.”</i>");
	}

	else
	{
		output("\n\n<i>“I’m going to be in this one,”</i> you say, eyeing up their curvy rumps, allowing heat to pulse into [pc.eachCock], swelling " + (pc.hasCocks() ? "them":"it") + " with barely suppressed urge. <i>“You know how we’re going to do it, don’t you?”</i>");

		output("\n\n<i>“Yyeaahhh... </i>” Bizzy sighs, eyeing you up and laying her holo device to one side. <i>“Guess I do.”</i>");
	}

	addButton(0, "Next", bizzySeraFeatureDoubleAnal2);
}

public function bizzySeraFeatureDoubleAnal2():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("<i>“Heyyyy there,”</i> the kaithrit says, a little while later. The drone camera is zoomed in on her face, taken up entirely with her full expressive lips as pure sex drips out of it. <i>“It’s Bizzy, and you are accessing one of my most secret pieces of business.”</i>");

	output("\n\nThe round, floating cam-bot is moving back slowly, slowly, slowly, revealing more and more of her as she speaks. A spotlight is cast over the fair kaithrit, revealing her in all her nakedness; the rest of the room is cast in darkness.");

	output("\n\n<i>“One where I’m joined by other [pornStudioName] sluts, and we act out our privatest, filthiest fantasies ...slather ourselves in carnal delight and revel in being slaves to our hot bodies, our out-of-control needs, our debased imaginations, the whims of our owner... just for my premium subscribers.”</i>");

	output("\n\nThe camera must have retreated far enough now to reveal " + (bizzySlaveCollar() ? "her steel collar, which today has a hasp and chain attached to the front, leading off to the right. It pulls at her, catching the light from above.":"that she is wearing a steel collar with a hasp and chain attached to the front, leading off to the right. It pulls at her, catching the light from above."));

	output("\n\n<i>“Today, I am joined by... </i>”");

	output("\n\n<i>“Sera,”</i> a smoky voice drawls.");

	output("\n\nA second spotlight comes on, illuminating the [sera.skinColor] succubus that is lying side-by-side to Bizzy. Sera smirks toothily at the camera. She is gloriously naked as well, the relative petiteness of her breasts in comparison to the kaithrit’s massive knockers off-set by their exotic coloration and perfect shape and heft. They are forced to press them into each other by the chain linking the fronts of their collars, just short enough that they are made to share each other’s personal space.");

	output("\n\n<i>“And by joined I mean quite literally, as you can see,”</i> Bizzy says to the camera. <i>“[pc.master] has decided to chain me to [pc.his] ravenous pet demon, purely for [pc.his] amusement.”</i>");

	output("\n\n<i>“Yeah, [pc.he] can be a real meanie, can’t he,”</i> Sera sighs. " + (sera.hasCock() ? "She lifts her thigh and gestures; the camera lifts up, revealing the hefty chastity cage and padlock you’ve affixed around her big, rude dick. <i>“See what [pc.he]’s done to make sure I don’t enjoy you <i>too</i> much? [pc.he]’s a real slavedriver.": "<i>“") + "Still - [pc.he] knows exactly what treats to give his pent-up succu-slut, to keep her in line.”</i>");

	output("\n\nEyes burning, she jerks her neck back, yanking Bizzy towards her with a gasp. Before she can recover, Sera is upon her, hand disappearing deep into the kaithrit’s huge, irresistible tits, her lips clamping themselves around Bizzy’s mouth, shining cupid’s bows sliding over each other lewdly.");

	output("\n\nBizzy has to give back - she’s chained to this apparition of hellish arousal, and she’s chained to her form moreover, so sensitive and soft and becoming so inflamed when Sera gropes it masterfully, tail wrapping tight around a milky white calf as her hand disappears between the cleft of the cat-girl’s thighs to finger her slit as she tongues her, unhousing more and more of her serpentine tongue into Bizzy’s hot mouth. A white hand lands on a [sera.skinColor] buttock and squeezes; Sera snarls in response, feasting upon the kaithrit’s lips and neck with bites and angrily-colored hickeys. The camera picks it all up masterfully, all still completely black except that spotlight upon the bed, upon which the two slaves paw at each other.");

	output("\n\nIt picks up the faint whirr, the shared little jerk, grunt and whimper as you press the device in your hand, start up the bullet vibes attached to their nipples, sending shivering waves of sensation through the pillowy plumpness of their breasts. They both must share in it, and Sera pulls away from Bizzy to gaze at her, chain pulled taut between them, thrusting their soft, lithe bodies against each other, their arousal inching unbearably upwards. The camera floats back over them - revealing the matching leather leashes connected to the back of their collars, the loops at the end seeming to cry out for a firm hand - until it is behind them, ogling their bare labia. Sera’s gleams with moisture and Bizzy’s fairly drips, open and ready. Both of them have something within them...");

	output("\n\nYou press the second button. Bizzy whines and Sera grits her teeth, arching her back and forcing Bizzy towards her, as even more vibrations begin to shake them, this time emanating through their pussies.");

	output("\n\n<i>“[pc.master] is teasing us... </i>” Sera grits. Her eyes flash at the darkness beyond her feet, horns rearing. <i>“Maybe [pc.he]’s willing to come out and actually see to us, huh?”</i>");

	output("\n\nTime for your grand entrance. A spotlight clicks on over you, sat casually back on the bed, toying with the remote controls that are so sweetly tormenting your pets.");

	output("\n\n<i>“Hey,”</i> you say to the camera, flashing what you hope is a winning smile into its beady black eye. You say the words and hope you don’t sound too wooden.  <i>“I’m [pc.name] Steele, CEO of [pornStudioName]. It’s my privilege to give these two the good, hard fucking they deserve, and it’s my hope you enjoy watching me as much as I enjoy doing it.”</i>");

	output("\n\nYou are dressed in " + (pc.armor.sexiness >= 5 ? "your [pc.armor]. After consideration Bizzy decided she couldn’t put you in a costume any more eye-catching than the one you’re in currently. And it will do your brand the world of good for the public to see you out in it anyway.":"a Steele Corp executive outfit, grey black and white, smart and closefitting. It really does lend you an air of being in total command, particularly in comparison to your collared, naked camwhores.") + " It’s this you loosen as you get up and [pc.move] around the bed, so that you are standing over Bizzy and Sera’s heads. The chain jingles and tightens as they gaze up at you, rather sweetly.");

	output("\n\n<i>“I told you you were in for a treat,”</i> says Bizzy to the camera, turning her wide smile to the drone floating beyond you. <i>“How many of you have been clamoring to see my owner in action? Well - here [pc.he] is. In the <i>flesh</i>.”</i> This last word dovetails nicely with you flopping your [pc.cock] against her face, covering one eye. <i>“A secret window into our horny lives: only for my bestest fans.”</i>");

	pc.lust(50);
	addButton(0, "Next", bizzySeraFeatureDoubleAnal3);
}

public function bizzySeraFeatureDoubleAnal3():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("<i>“Concentrate, girl,”</i> you say. Bizzy swiftly takes ahold of your [pc.cockNoun] by the [pc.knot], and you murmur with delight as she spreads her full, wet lips over the crown. <i>“Remember, you’re lubing this up for Sera, and after I’m done with her <i>she’s</i> gonna decide how much lube <i>you’re</i> going to get. So it’s in your best interests to make this as sloppy as possible.”</i>");

	output("\n\n<i>“Hmm,”</i> Sera smirks. The chain ordains her to be up close and personal as you slow dip forward, the sheer pleasure of Bizzy’s hot, well-trained mouth gloving your [pc.cock] coursing into your groin. She cranes in, claws scraping over Bizzy’s pale neck and huge, pillowy tits, rests for your [pc.knees] as you push inwards and then draw back, delighting in the silken rub of her hollowed cheeks around your veiny meat. You can still hear the faint whirr of the vibes, teasing and stirring both of them, keeping them on edge.");

	output("\n\n<i>“You can see how much she likes the taste of your cock, [pc.master]... </i>” Out comes Sera’s lithe, obscene tongue as she grips Bizzy’s white hair, licking the inside of her pointy ear as you push inwards again, engulfing your [pc.cockNoun] in wet heaven. Warm air hisses over your groin, Bizzy’s excited breath, her slutty body stimulated in half a dozen different ways, her tails whipping back and forth. Wonderful. You pick up the pace, gripping her hair yourself as you pump your [pc.cock] demandingly into her mouth, sighing with joy as hard pleasure courses back up your shaft.");

	output("\n\n<i>“Yeeesssss, that’s it,”</i> croons Sera approvingly. She spreads her hands around the kaithrit’s delicate neck. She whimpers. <i>“Now go on, push it in there, she’s your well-trained bitch, she can take it. You know it’s gonna feel... </i>” You mire yourself into the glorious, wet tightness of Bizzy’s throat");
	if(pc.balls > 0) output(", [pc.balls] throbbing against her chin,");
	output("just leave it in there for a few moments before hefting yourself outwards with a glottal ‘smack’, saliva trailing out from her gasping, pretty mouth. <i>“ ...soooo good.”</i>");

	output("\n\nYou do your best to act the calm, in-control dom " + (pc.mf("", "me")) + " as you stride around them, climb onto the bed, wrap both of their leashes around your hand and pull, enjoying the shared gasp and quiver this elicits, but it takes a lot of willpower not to be a drooling beast: Not when your [pc.cockNoun] is this hard, not when you are confronted with a sight like this, both Sera and Bizzy arching their backs and presenting their full, peachy asses to you, pressed into one another");
	if (bizzySlaveTat() && flags["SERA_BRANDED"] == true) output(", each with [pornStudioName] prominently displayed upon it, branding them as your possessions,");
	output(" a smooth-skinned hill range of pale apricot and [sera.skinColor] that’s all for you... all for you. You spend a little while just stroking and squeezing that soft, pillowy warmth, your wet[pc.cockNoun] laid between Sera’s buttocks, calming your blood just a little.");

	output("\n\n<i>“C’mon [pc.master], you gonna fuck me in the ass or what?”</i> says Sera. Her tone is both taunting and aroused, her pussy and nips filled with those incessant, stirring vibrations you control. You close your eyes, savoring that delicious blend as you draw yourself back, your [pc.cockHead] pressed against her the cute wrinkle of her anus. <i>“Or are you camera sh- unnffffff!”</i>");

	output("\n\nShe jerks and balls the sheets as you shove yourself roughly into her, opening her asshole and spearing into the delicious hot tightness within. You keep a tight rein on your writhing, shuddering bitch as you open her up, groaning with delight as you more and more of that clench wraps itself around your [pc.cock], practically milking the pre out of you.");

	output("\n\n<i>“Fuck... fuck!”</i> snarls Sera, eyes tightly closed, tail whipping this way and that. Bizzy is forced to move with her, a sea of quivering female skin, and she giggles a little at Sera’s discomfort. <i>“You didn’t lube it up enough, you bitch!”</i>");

	output("\n\n<i>“Oh, <i>nonsense</i>,”</i> the kaithrit responds with mocking fondness, swelling her breast into Sera’s reddened face. <i>“A demon slut like you can take it anywhere, anyhow, anytime. Give her a spank, [pc.master]: She’s complaining about nothing.”</i>");

	output("\n\nYou comply, landing a meaty, jiggling smack on Sera’s " + (flags["SERA_BRANDED"] == true ? "tattoo":"buttock") + ", making her jerk and curse fluently again.");

	output("\n\nThe truth is Bizzy is right: you trained Sera into a good buttslut, she’s more than capable of taking you deep and rough. Which is how you give it to her, your [pc.hips] soon clapping a merry rhythm against her upturned ass, thrusting your [pc.cock] past her stretched anus into her intestines deep, wolfish lust coursing through you. Her foul words and groans are very much of the actually-enjoying-this-a-lot kind, trickles of femcum dripping down her shapely thighs.");
	if (sera.hasCock()) output(" Her thick cock, trapped and denied in its steel prison, flexes and jerks merrily, little streams of pre milked out of it all over the crimson sheets. You hope the camera picks up on that.}");

	output("\n\n<i>“Don’t worry, kitty slut,”</i> you sing out merrily to the laughing, cooing Bizzy, jerked this way and that by the writhing, jerking Sera, <i>“Your ass is next!”</i>");

	output("\n\nYou cum to those words, throwing your head back and throwing a great lungful of air out there at the same time as your [pc.cock] throws out a huge streamer of [pc.cum] deep into the demon morph’s guts, filling them full of your [pc.cumFlavor] seed with one gratifying pulse after another. You keep her still with the taut leash, a delightful tool for you to throw everything you’ve got into her upturned rear, pounding her into a sticky, moaning puddle on the satin sheets.");

	addButton(0, "Next", bizzySeraFeatureDoubleAnal4);
}

public function bizzySeraFeatureDoubleAnal4():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("<i>“What did I tell you guys,”</i> Bizzy croons. The floating drone is in front of them, panning slowly from a panting, vague-eyed Sera to the kaithrit’s big, rosy grin. ");
	if(pc.libido() < 30) output("You planned this cut away from you ahead of time; Bizzy maintains a little stash of Priapin for her male performers, and you have ample opportunity to surreptitiously jab yourself with a medipen as she talks. Unf - that’s the stuff. The ache in your [pc.cock] recedes, fresh, bullish lust coursing into your veins. You [pc.move] back around them, already half-erect again, and Bizzy happily wraps her warm hand around your shaft.");
	else output("Stamina isn’t an issue for you, of course; you aren’t even half-satisfied. It’s with considerable pride you smirk at the floating drone, allow it to drink in how your dripping [pc.cockNoun] is already at half-mast again, ready for more. Bizzy happily wraps her hand around it as you [pc.move] back in front of them.");

	output("\n\n<i>“My owner fucks like [pc.he] means it. Open wide, Sera... </i>” This time her hands are on the succubus’s chin and neck as her black slits narrow, focusing on the [pc.cum]-dripping, sex-slathered [pc.cockNoun] you are hefting in front of her face, hand on hip. She raises them to your face and opens her plush lips, allows her half-a-foot long tongue to lollop out, displays the dark, wet cave within to you with a familiar, provocative gleam.");

	output("\n\nYou grip her horns and holster yourself into her mouth as far as her tonsils with a wonderful, filthy squelch, her cheeks hollowing and dragging hard at your burning, meat, inflating into oaken hardness again as you piston it into her face. Her claws nibble your [pc.hips] and her eyes continue to gaze up at you, taunting you, driving you to fuck her face with ever greater urgency.");

	output("\n\nAnd, Void, when they’re joined by a pair of gorgeous green marbles, gazing up at sweetly as she " + (pc.balls > 0 ? "limpets her mouth around your [pc.balls], tonguing and sucking on them delicately":"massages Sera’s breasts, fondling and licking her and making her shiver and send delicious whimpers right up your shaft") + "... it’s almost too much. You almost surge into orgasm right there, lose every last drop right down the demon-morph’s gullet.");

	output("\n\nInstead, you grip her horns tighten and mire yourself right down to the [pc.knot], sticking yourself deep into her unresisting throat. Cerulean lips press tightly against your [pc.knot] as their owner shudders, valiantly taking the asphyxiation... and then you draw yourself out, hot breath cascading over your [pc.cock], gooey and trailing absolute buckets worth of saliva.");

	output("\n\n<i>“There,”</i> Sera growls at Bizzy once she’s recovered her breath. You (and the camera drone) admire it in all its gleaming, dripping glory. <i>“Don’t say I don’t do anything for you.”</i>");

	output("\n\nYou once again move back around them on the bed, once again take a firm grip of their leashes, and once again admire the view; one smooth, curvy ass thoroughly gaped and leaking [pc.cum], one cutely pristine and untrammelled. Sugar rushes through your veins as you take it all in. Is this not exactly where you aimed to one day be, when you first ventured out into the frontier? Gripping the leashes of a pair of horny, eager, big-titted slaves, asses raised and awaiting your every desire? Truly you are living the life beyond what a millionaire play[pc.boy] might reasonably dream of. You hope the massive grin you’re currently sporting doesn’t look too dopey.");

	output("\n\nBizzy giggles as you slap your [pc.cock] down between her soft buttcheeks, rubbing your saliva-slathered meat back and forth over her pale, pink wrinkle.");

	output("\n\n<i>“Ooh, do be careful [pc.Mr] Steele,”</i> she breathes, casting her jade eyes over her shoulder at you. <i>“I’d hate for you to cum too..oooohhhh.”</i>");

	output("\n\nHer moan is mirrored by another horny growl from Sera, the chain once flexing tautly between them as she arches her neck. You finger the remote control, turning all six vibes up to maximum, juddering machines attached to the tenderest parts of their bodies.");

	output("\n\n<i>“F-fuck,”</i> groans Bizzy, eyes closed. <i>“Fuuuuuck!”</i> she repeats, considerably shriller as you finally draw back and firmly press your [pc.cockHead] into her cute little asshole, pillowy flesh bouncing around your length, tails flicking agitatedly at your face as you spear into her depths. She’s tighter than Sera, requiring you to move your [pc.hips] in slow, concerted movements to dig your [pc.cock] in deeper, your lust to bury yourself completely in her clenching, wriggling warmth.");

	output("\n\n<i>“Mmm. You like that, don’t you slut?”</i> leers Sera. Her head is gently bobbing, the overclocked vibe in her pussy driving her to distraction. She sets her hands on Bizzy’s massive breasts, mauling them, pushing the taped on vibes deep into them. Kaithrit pussy juice spots your [pc.legs]. <i>“No, I tell a lie. You <i>love</i> it. You love being on a leash with your [pc.master]’s big fat dick up your ass. It’s where you were born to be, you dirty little girl... </i>”");

	output("\n\nThe demon pulls Bizzy in to her open mouth and they kiss, a lascivious tonguing made wet and urgent by the multiple stimulations stirring them both into a frenzy. Bizzy moans into Sera’s mouth as she cums, pussy contracting and drooling around the bullet stuck up her, your [pc.cock] driving into her incredibly tight ass again, and again, and again. The camera drone picks up every last drop, every last muscle clench, every last wanton cry.");

	output("\n\nYou reward her with a good hard slap on the " + (bizzySlaveTat() ? "tattoo":"butt-cheek") + " - fair’s fair - and the yowl and sudden clench up around your burningly erect shaft sends you over the edge. Your nerve endings light up, [pc.cum] rockets up your shaft, and then you’re thrusting plentiful amounts of it with reactive thrusts of your [pc.hips] against Bizzy’s lovely full buttcheeks, waves of motion carried down her soft body.");

	output("\n\n<i>“[pc.Master] is filling me up... </i>” Bizzy moans. Her head is up, collar transfixed by the yank of the leash at one end and the chain at the other. <i>“Void, I love that feeling more than anything... </i>” She squeals with joy as ");
	if (pc.cumQ() < 3000) output("[pc.cum] spurts out of her stretched asshole, dribbling filthily onto the sheets.");
	else output("[pc.cum] spurts thickly out of her stretched asshole, her belly swelling with your massive orgasm until it’s pouring out of her onto the sheets. You don’t do things by halves.");

	pc.orgasm();
	addButton(0, "Next", bizzySeraFeatureDoubleAnal5);
}

public function bizzySeraFeatureDoubleAnal5():void
{
	clearOutput();
	showBizzyBust();
	clearMenu();

	output("You sink back onto the satin sheets and turn the muffled whirr of the vibes off at last, sweaty and triumphant, admiring your handiwork, as one of the silent, skillful drones does above your shoulder. Two thoroughly gaped assholes dripping your [pc.cumColor] seed");
	if (pc.cumQ() > 5000) output(", two bellies rounded out with your seed,");
	output(" two fine, sweaty, tussled camwhores looking back at you with slutty gratification writ large on their faces.");

	output("\n\n<i>“This has been a [pornStudioName] production,”</i> you inform another drone, floating before your face. <i>“Say goodbye, Bizzy.”</i>");

	output("\n\n<i>“Byyyyyeeeee... </i>”");

	output("\n\n<i>“Say goodbye, Sera.”</i>");

	output("\n\n<i>“Bye,”</i> she says, with a clack of her pointed teeth at the camera. You give the leashes in your hand a teasing little yank, making them both start and gasp.");

	output("\n\n<i>“We hope you’ll join us again.”</i>");

	output("\n\nThe drone clicks, the small red light above its lens turning to green, and you relax.");

	output("\n\n<i>“Oh man,”</i> Bizzy says, wriggling excitedly out of the bed and grabbing her holopad from underneath it the moment you unchain and unleash her. <i>“This is gonna be smoking hot premium content! We’re gonna get <i>so</i> many subscribers off the back of this...</i>”");

	output("\n\n<i>“You’re welcome,”</i> Sera says archly, considering the [pc.cum] still drooling copiously out of her asshole.");

	output("\n\n<i>“Yeah.”</i> Bizzy flashes a mischievous little smile at her camwhore partner and then you. <i>“You’ll bring her back for more, won’t you?");
	if(flags["BIZZY_SERA_DOUBLE_ANAL"] == undefined) output("I think my fans are really going to love seeing her getting fucked.”</i>");

	else output("My fans </i>love<i> seeing the brat get her brains fucked out.”");

	output("\n\n<i>“I just make your boring little show about ten times better,”</i> Sera responds with a yawn. <i>“It’s ok to admit it.”</i>");

	output("\n\nYou lean back, enjoying the gratified ache in your groin. Watching these two bicker is almost as fun as doing them. Almost.");

	processTime(120);
	flags["BIZZY_FEATURE_COOLDOWN"] = GetGameTimestamp() + 120;
	flags["BIZZY_SERA_DOUBLE_ANAL"] = true;
	if (flags["BIZZY_MONTHLY_FEATURES"] == undefined) flags["BIZZY_MONTHLY_FEATURES"] = 1;
	else flags["BIZZY_MONTHLY_FEATURES"]++;
	bizzyStage5Menu();
}