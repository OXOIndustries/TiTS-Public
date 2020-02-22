import classes.Items.Armor.GooArmor;

/* Gray Goo Armor */

public function showGrayGooArmor(nude:Boolean = false, special:String = "none"):void
{
	showBust(novaBustDisplay(nude, special));
	if(flags["ANNO_NOVA_UPDATE"] >= 2) showName("\n" + goo.short.toUpperCase());
	else if(hasGooArmorOnSelf()) showName("GOO\nARMOR");
	else showName("\nGRAY GOO");
}
public function novaBustDisplay(nude:Boolean = false, special:String = "none"):String
{
	var bustName:String = "";
	
	switch(chars["GOO"].hairStyle)
	{
		case "ponytail": bustName = "GRAY_GOO_PRIME"; break;
		case "loose": bustName = "GRAY_GOO"; break;
		case "double": bustName = "SLUTGOO"; break;
		default:
			bustName = "NOVA";
			if(nude)
			{
				bustName += "_NUDE";
				switch(special)
				{
					case "tits": bustName += "_0"; break;
					case "cock": bustName += "_1"; break;
				}
			}
			break;
	}
	
	return bustName;
}

public function deck13MakeGoo():void
{
	clearOutput();
	author("Savin");
	showName("GOO\nCONTAINER");

	output("You step up to the one vat of gray goo remaining on the deck. It’s humming slightly, churning as it produces and maintains a little sea of goop. There’s a spigot about six feet off the deck, controlled by a dark computer monitor that looks like it belongs in a museum. You walk over and push the screen. Nothing happens.");
	
	output("\n\nPoke. Nothing again.");
	
	output("\n\nYou grumble and pull your Codex out, hoping your device can sync with the goo canister. You flip the Codex on and search for nearby networks. Again, nothing close enough to be the goo. Shit. You drop down");
	if (pc.hasKnees()) output(" to a [pc.knee]");
	output(" and start looking for an old-school data port. Sure enough, there’s one hidden underneath the console. You pull a universal cable from your Codex, and thankfully manage to slot it into the port. The Codex takes over from there, booting up the ancient computer and interfacing for you. The Bell-Isle/Grunmann logo appears, followed by a button-press command prompt, which the Codex translates onto its touch screen. That’s better. You tap through a few commands, instructing the machine to print you out a great big pile of gray goo.");
	
	output("\n\nThe device hums to life and starts working, squirting out goo like ice cream from its spigot. You watch as it squirts and thrums, depositing gallons of murky silvery goop onto the deck, looking more like a puddle than a person for now. A few seconds later, though, the vat shuts off, and the goo starts squirming and re-shaping itself. It only takes a moment for the big gray blob to turn into a big, bouncy gray girl. She looks just like the creatures");
	if (flags["TARKUS_DESTROYED"] != undefined) output(" once");
	output(" found outside of Novahome, with inhumanly exaggerated hips and ass and a pair of tits that look like silver-sheened watermelons standing impossibly perky on her chest. Her ample assets jiggle and bounce as she looks around, surveying her surroundings with wide eyes full of wonder.");
	
	output("\n\n<i>“Hi!”</i> the newly-made goo says, adopting a huge grin as you take a step toward her. <i>“Wow! You’re super");
	if (pc.isFeminine()) output(" pretty");
	else output(" handsome");
	output("! Are we going to be friends?”</i>");
	
	output("\n\nWell, that’s not exactly what you were expecting from the fuck-happy creatures that escaped the <i>Nova</i>. Still, you nod and say that you are. The gray goo swells up, making a high-pitch squealing sound and hugging herself. <i>“Yaaaaaay! Best friends forever and ever and ever!”</i> she giggles, beaming at you. <i>“Oh! I’m... uh... um... I need a name!”</i>");
	
	CodexManager.unlockEntry("BI/G");
	
	clearMenu();
	addButton(0, "Next", deck13MakeGooII);
}
public function deck13MakeGooII():void
{
	clearOutput();
	author("Savin");
	showBust(novaBustDisplay());
	showName("GOO\nCONTAINER");
	
	output("<b>Enter the Gray Goo’s name:</b>");
	this.displayInput();
	output("\n\n\n");

	clearMenu();
	addButton(0, "Next", nameThaGoo);
}

public function nameThaGoo():void
{
	if (userInterface.textInput.text.length == 0)
	{
		deck13MakeGooII();
		output("<b>You must enter a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if (hasIllegalInput(userInterface.textInput.text))
	{
		deck13MakeGooII();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if (userInterface.textInput.text.length > 14)
	{
		deck13MakeGooII();
		output("<b>You must enter a name no more than fourteen characters long.</b>");
		return;
	}

	goo.short = userInterface.textInput.text;
	this.removeInput();

	processTime(5+rand(3));
	flags["ANNO_NOVA_UPDATE"] = 2;

	nameThaGooII();
}
public function nameThaGooII():void
{
	clearOutput();
	author("Savin");
	showBust(novaBustDisplay());
	showName("GOO\nCONTAINER");

	output("<i>“[goo.name]?”</i> you suggest.");
	
	output("\n\n<i>“Wow! That’s awesome. I’m soooo " + indefiniteArticle(chars["GOO"].short) + ",”</i> [goo.name] announces, bouncing giddily. <i>“You’re the bestest friend in the whoooole wide universe. It’s the best name EVER!”</i>");
	
	output("\n\nShe lunges at you! For a moment, you’re afraid for your life (or at least, your sexual integrity)... but thankfully her arms settle around your shoulders, and [goo.name] pulls herself");
	if (pc.tallness > goo.tallness + 6) output(" up");
	else if (pc.tallness < goo.tallness - 6) output(" down");
	output(" into a tight hug, squeezing her massive tits against you. You chuckle nervously and pat the goo on the head, your fingers coming away slightly wet and sticky.");
	
	output("\n\nAfter a moment, she peels herself off of you and grins. <i>“So, um, what’s </i>your<i> name?”</i>");
	
	output("\n\n<i>“[pc.name]. [pc.name] Steele,”</i> you answer, extending a hand.");
	
	output("\n\nShe stares at your hand quizzically. Slowly, [goo.name] leans in and wraps her big cock-pillow lips around one of your fingers and sucks on it. The sensation is cool, wet, with just enough suckling pressure to send a shiver of pleasure through your arm. You gently push her off you, and instead offer her Anno’s thumb drive to suckle on.");
	
	output("\n\n<i>“What’s that?”</i> she coos, cocking her head to the side. You tell her it’s loaded with extra programming for her. <i>“No waaaay, is it going to make me super smart and stuff?”</i>");
	
	output("\n\nYou nod. <i>“It sure is.”</i>");
	
	output("\n\n<i>“Yaaaaaaaaaaaay!”</i> she cheers, plucking the drive out of your hand and swallowing it.");
	
	output("\n\nWell shit. [goo.name] beams at you, giggling to herself as you stare at her. Looks like that plan just went out the window.");
	
	output("\n\n<i>“I don’t feel any different,”</i> she pouts, absently cupping one of her huge breasts. <i>“Oh well! Hey, wanna... I dunno, wanna fuck?”</i>");
	
	output("\n\nTime to put this new gray goo to the test.");
	if (pc.libido() >= 66) output(" As much as you would like to see what she’s capable of, you need to make sure she’s not as forcefully amorous as her sisters.");
	output(" <i>“Not right now,”</i> you tell her.");
	
	output("\n\n[goo.name] shrugs. <i>“Kay! Um... what do you wanna do?”</i>");
	
	output("\n\nYou smile, relieved, and ask if [goo.name] would like to come with you back to your ship.");
	
	output("\n\n<i>“Oh wow! A SPACE SHIP!? That’s awesome. I wanna see. I wanna see!”</i>");
	
	output("\n\nLaughing, you take [goo.name]’s hand and lead her up toward the hangar.");

	currentLocation = shipLocation;
	
	processTime(45+rand(15));

	addButton(0, "Next", mainGameMenu);
}

public function grayGooAtBarSetup(slot:int = 8):void
{
	output("\n\nOf all the things, there’s a gray goo-girl bouncing around the bar, her eyes saucer-like and full of wonder as she stares at the myr and other aliens.");
	addButton(slot, "Gray Goo", grayGooAtBar);
}
public function grayGooAtBar():void
{
	clearOutput();
	author("Savin");
	showGrayGooArmor();

	output("<i>“Oh, hi!”</i> she says, perking up as you approach. <i>“Holy wow, it’s really you!”</i>");
	
	output("\n\nYou cock an eyebrow. <i>“Do I know you?”</i>");
	
	output("\n\n<i>“Sure you do! Um, well, maybe? You’ve totally </i>seen<i> me, anyway. I’m Nova!”</i> she grins, shifting her form momentarily to that of the tall, slender, handsome woman you met on Deck 13 of the <i>Nova</i>, dressed in a facsimile of an officer’s uniform. The goo squirms and shifts back to her normally buxom form and giggles playfully. <i>“Recognize me now?”</i>");
	
	output("\n\nWait, wasn’t she going to be getting a new cyber body?");
	
	output("\n\n<i>“</i>She<i> sure did,”</i> the goo-girl laughs, <i>“Captain what’s-her-butt and her crew are all off getting their fancy new bodies. Which means I got to wake up after she left! The nice people in lab coats said I should go find somebody to take care of me, sooooo I’m looking for someone really nice to be my friend! Oh! Do you want to be my friend? Pretty please? You were so nice to all my friends already...”</i>");

	processTime(5+rand(3));

	// [Sure] [Not now]
	clearMenu();
	addButton(0, "Sure", grayGooAtBarSure, undefined, "Sure", "Tell the goo-girl you’ll take her with you. Considering what she was able to do when you fought her, maybe you can get some use out of her in battle...");
	addButton(1, "Not Now", grayGooAtBarNotNow);
}
public function grayGooAtBarSure():void
{
	clearOutput();
	author("Savin");
	showGrayGooArmor();

	goo.short = "Nova";

	output("<i>“Sure. I’m [pc.name],”</i> you say, extending a hand to the goo.");
	
	output("\n\n<i>“Yaaaaaaaaay!”</i> she cheers, leaping onto you and giving you a huge, wet hug, pressing her massive tits against your chest. <i>“Bestest friends forever and ever and ever!”</i> ");
	
	output("\n\nYou chuckle and pat the goo on the head, your fingers coming away slightly wet and sticky. She slips back out of your grasp, going straight through your arm. <i>“You can call me Nova! I guess. I dunno, that’s what all the people that used to live in my head called me. Oh well! Hey, since we’re super best friends, wanna... I dunno, wanna fuck?”</i>");
	
	output("\n\n");
	if (pc.lust() >= pc.lustMax() * 0.75) output("As much as you really could use a little relief.... ");
	output("<i>“Not right now,”</i> you say. Might as well make sure she isn’t going to force herself on you.");
	
	output("\n\n[goo.name] shrugs. <i>“Kay! Um... what do best friends do other than fuck all the time?”</i>");
	
	output("\n\nYou smile, relieved, and ask if [goo.name] would like to come with you back to your ship.");
	
	output("\n\n<i>“Oh wow! A SPACE SHIP!? That’s awesome. I wanna see. I wanna see!”</i>");
	
	output("\n\nLaughing, you take [goo.name]’s hand and lead her up toward the hangar.");

	currentLocation = shipLocation;
	
	flags["ANNO_NOVA_UPDATE"] = 2;

	processTime(45+rand(15));
	
	refreshRoamingBarEncounter();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function grayGooAtBarNotNow():void
{
	clearOutput();
	author("Savin");
	showGrayGooArmor();
	
	output("<i>“Sorry,”</i> you say, taking a step back from the over-eager pile of goo.");
	
	output("\n\nShe visibly deflates. <i>“Aww. Nobody around here wants to be friends with me,”</i> the goo groans.");

	processTime(1);

	// {Back to bar menu}
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function grayGooArrivesAtShip():void
{
	clearOutput();
	author("Savin");
	showGrayGooArmor();
	
	output("<i>“So, [goo.name], think you can help me out with something?”</i> you ask as you make your way aboard. The gray girl’s eyes are wide with awe as she surveys your ship, squirming around and poking her head right up next to several of your computer systems, poking at the door mechanics, or bending way over to look at something on the floor. Or to show off her big, jiggling booty... hard to tell. You tap her on the back to get her attention, and repeat your request.");
	
	output("\n\n<i>“Oh! Sure, bestest buddy. Anything you want!”</i> she says with a grin, bouncing up uncomfortably close to you. She presents her tits to you and wiggles her behind, clearly expecting your desire to be entirely sexual.");
	
	output("\n\nNot quite. You ask her what she’d think about working with you on your quest. Specifically, coming with you when you’re out fighting. Maybe you could wear her as armor... gray goo is incredibly tough, after all.");
	
	output("\n\n<i>“Hehe, I knew you just wanted to get inside of me!”</i> [goo.name] teases, lunging at you and wrapping her arms around you. You shiver as the cool gray goo envelops you, squirming wetly around your body as [goo.name] conforms to your body. Goo drains around your [pc.face], plating your cheeks like a crash helmet with a pair of big, silver eyes planted just over your own. After a moment, you feel your [pc.gear] being pulled off of you, thrown to the ground as goo runs across your bare skin.");
	
	output("\n\n<i>“Is this okay?”</i> [goo.name] asks, squirming around you. <i>“It’s super comfy, huh?”</i>");
	
	output("\n\nYou have to admit, it actually <i>is</i> very comfortable. Nice and cool, and the goo flows around you like a full-body glove... that just happens to be hardened against weapons fire whenever you need it to be. You tell [goo.name] that this is going to work out just fine... especially if she’s as eager to help you between fights as well.");
	
	output("\n\n<i>“I was hoping you’d ask!”</i> she giggles, shifting herself around your [pc.crotch].");
	
	flags["ANNO_NOVA_UPDATE"] = 3;
	
	processTime(10+rand(5));
	
	output("\n\n" + gooArmorInventoryBlurb(new GooArmor(), "obtain"));
	
	clearMenu();
	if(pc.lust() >= 33)
	{
		addButton(0, "Goo Dicks", gooDickFap, undefined, "Goo Dicks", "Have [goo.name] fill all of your holes and fuck you.");
		if (pc.hasCock()) addButton(1, "GooSleeve", grayGooCockSleeve, undefined, "Goo Cocksleeve", "Have [goo.name] jack you off.");
		else addDisabledButton(1, "GooSleeve", "Goo Cocksleeve", "You don’t have the proper anatomy for that...");
	}
	else
	{
		addDisabledButton(0, "Goo Dicks", "Goo Dicks", "You’re not horny enough for that...\n\n<i>(You can access this later in the Masturbate menu while wearing [goo.name].)</i>")
		if (pc.hasCock()) addDisabledButton(1, "GooSleeve", "Goo Cocksleeve", "You’re not horny enough for that...\n\n<i>(You can access this later in the Masturbate menu while wearing [goo.name].)</i>")
		else addDisabledButton(1, "GooSleeve", "Goo Cocksleeve", "You don’t have the proper anatomy for that...")
	}
	addButton(2, "No Sex", gooFapNope, undefined, "No Sex", "You are not in the mood to sex [goo.name] at this time.");
}

public function grayGooArmorRoamingBonus(slot:int = 8):void
{
	output("\n\nThere’s a gray goo-girl bouncing around nearby, her eyes saucer-like and full of wonder and curiosity--that must be [goo.name]!");
	addButton(slot, chars["GOO"].short, grayGooArmorRoamingApproach, undefined, chars["GOO"].short, "Meet your silver friend.");
}
public function grayGooArmorRoamingApproach():void
{
	clearOutput();
	author("Jacques00");
	showGrayGooArmor();
	
	output("<i>“Oh, [pc.name]! Hi!”</i> [goo.name] says with glee, perking up as you approach. <i>“I can’t believe you’re here!”</i>");
	output("\n\nYou return her excitement with a");
	if(pc.isBimbo() || pc.isNice()) output(" smile");
	else if(pc.isBro() || pc.isMischievous()) output(" smirk");
	else output(" grimace");
	output(".");
	output("\n\n<i>“So, like, can I come back with you... pleasepleasepleaseplease... please?”</i> she asks, eyes wide and hands together in a pleading fashion.");
	output("\n\nLooks like you have a choice to make. Do you take the lonely goo-girl back with you?");
	
	processTime(1);
	
	clearMenu();
	addButton(0, "Sure", grayGooArmorRoamingTake, undefined, "Sure", "Tell the goo-girl you’ll take her with you.");
	addButton(1, "Not Now", grayGooAtBarNotNow, undefined, "Not Now", "Maybe next time...");
}
public function grayGooArmorRoamingTake():void
{
	clearOutput();
	author("Jacques00");
	showGrayGooArmor();
	
	output("<i>“Yay! You’re totally the bestest buddy in the whooole universe!”</i>");
	output("\n\nWith that, [goo.name] shamelessly launches herself towards you and engulfs your entire body, sensually teasing all your privates in the process.");
	
	processTime(3);
	
	output("\n\n" + gooArmorInventoryBlurb(goo.armor, "obtain"));
	
	refreshRoamingBarEncounter();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function gooFapNope():void
{
	clearOutput();
	showGrayGooArmor();
	
	output("With that, you");
	if(pc.isBimbo()) output(" giggle back and tell [goo.name] that you two will be the bestest of friends! You blurt, <i>“Like, we should <b>totally</b> get facials together, okay?”</i>");
	else if(pc.isBro()) output(" grunt and comment that [goo.name] is welcome to help you take a load off anytime she wants--that is, if she can handle you.");
	else if(pc.isMischievous()) output(" jokingly warn [goo.name] not to try anything funny.");
	else if(pc.isAss()) output(" sternly warn [goo.name] not to get all up in your personal business.");
	else output(" thank [goo.name] for being so cooperative.");
	// Extra goo notes for having goo followers!
	if(celiseIsCrew())
	{
		if(pc.isBimbo()) output(" And maybe you can invite another yummy goo-mate to join the party too!");
		else if(pc.isBro()) output(" But of course, if she needs help, you’re sure you can find another goo that could lend a hand too...");
		else if(pc.isMischievous()) output(" You then take a pause. Hm, you might be developing some kind of goo fetish here...");
		else if(pc.isAss()) output(" And as long as she doesn’t make trouble with the other goo, you guess it’ll be fine to have her around.");
		else output(" It would definitely be nice to have another goo-form around the place, you ponder.");
	}
	output("\n\n<i>“Mm-hm!”</i> she excitedly responds, though she is obviously too focused on your crotch to communicate with actual words at the moment.");
	
	pc.lust(5);
	if(pc.hasPerk("Inhuman Desire")) pc.lust(5);
	if(pc.hasPerk("Fuck Sense")) pc.lust(5);
	if(pc.isTreated()) pc.lust(5);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function gooDickFap(fromCrew:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showGrayGooArmor(true, "cock");
	
	output("You");
	if(!fromCrew)
	{
		if(pc.armor is GooArmor)
		{
			output(" pat your");
			if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) output(" own goo-coated");
			else output(" naked and exposed");
			output(" backside and");
		}
		else if(pc.hasItemByClass(GooArmor)) output(" open your inventory and");
		else if(InShipInterior() && pc.hasItemInStorageByClass(GooArmor)) output(" open your storage and");
	}
	output(" ask [goo.name] if she’s up for a little fun. Wordlessly, the goo surrounding you squirms and writhes across your [pc.skinFurScales], caressing your [pc.nipples] and [pc.crotch] in ways that make your [pc.knees] tremble.");
	if (!(pc.lowerUndergarment is EmptySlot) || !(pc.upperUndergarment is EmptySlot))
	{
		output(" Tendrils of goo peel off your");
		if (!(pc.lowerUndergarment is EmptySlot)) output(" [pc.lowerGarment]");
		if (!(pc.lowerUndergarment is EmptySlot) && !(pc.upperUndergarment is EmptySlot)) output(" and");
		if (!(pc.upperUndergarment is EmptySlot)) output(" [pc.upperGarment]");
		output(", taking time to");
		if (pc.hasCock() || pc.hasVagina())
		{
			if (pc.hasCock()) output(" envelop your [pc.cocks]");
			if (pc.hasCock() && pc.hasVagina()) output(" and");
			if (pc.hasVagina()) output(" tease the bud of your [pc.clit]");
		}
		else
		{
			output(" tease the pliant flesh of your asshole")
		}
	}
	else
	{
		output(" [goo.name] takes the time to");
		if (pc.hasCock() || pc.hasVagina())
		{
			if (pc.hasCock()) output(" envelop your [pc.cocks]");
			if (pc.hasVagina() && pc.hasCock()) output(" and");
			if (pc.hasVagina()) output(" tease the bud of your [pc.clit]");
		}
		else
		{
			output(" tease the pliant flesh of your asshole")
		}
	}
	output(", making you gasp and groan with pleasure. You shimmy down onto the ground, getting comfortable as [goo.name] massages you all over. You feel a slight pressure on your [pc.lips], and notice goo congregating around your mouth. She slips right between your lips and floods your mouth. You don’t have a choice in the matter, but have your mouth forced open as [goo.name] forms herself a big, thick cock for you to suck on. You give the playful goo-girl what she wants, and are instantly rewarded by a squirming all across your body as she clearly enjoys your gentle suckling. The goo-cock even starts to thrust before long!");
	
	output("\n\nBehind you, the gooey bodysuit shifts, and suddenly you feel a harsh <i>smack</i> right on your [pc.butt]. You yelp, but find your voice utterly muffled by the goo shoved in your gob. Looking back, you see that most of [goo.name] has sloughed off of you, forming a half-person shape behind you with her hand raised up to smack your ass. You take it, moaning as she playfully abuses your backside.");
	
	output("\n\n<i>“Like it when I’m rough?”</i> she teases, slipping a few fingers between your [pc.legs]");
	if (pc.hasVagina()) output(" and into your [pc.cunt]");
	else if (pc.hasCock()) output(" and wrap them around your half-hard [pc.cockBiggest]");
	if (pc.hasVagina() || pc.hasCock()) output(" and starts to tease her fingertips around your [pc.asshole], just short of penetration");
	else output(" and starts to probe around your [pc.asshole], just short of penetration");
	output(". Now that’s more like it... you push back against her hand, cooing as her long, wet digits explore your");
	if (pc.hasVagina() || pc.hasCock()) output(" sex");
	if (pc.hasVagina() && pc.hasCock()) output("es");
	if (!pc.hasVagina() && !pc.hasCock()) output(" ass");
	output(". <i>“You totally do, dontcha?”</i>");
	
	output("\n\nYou wink at her, wrapping your [pc.tongue] around her gooey prick. Her body quivers in delight, and");
	if (pc.hasVagina()) output(" her fingers reach deeper into you - far deeper than a human ever could, probing to the depths of your womb and back again, finding every sensitive spot along your inner walls and giving them just enough attention to make you squeal.");
	if (pc.hasCock() && !pc.hasVagina()) output(" s");
	if (pc.hasCock() && pc.hasVagina()) output(" S"); 
	if (pc.hasCock()) output("he starts to pump your shaft, wrapping your wang in a silken cocksheath of goo that squirms and writhes around your length.");
	output(" The finger pressing against your [pc.asshole] finally pops in, flooding into your bowels in a wave of cold wetness that has you moaning like a whore and arching your back against the gooey babe. The gooey anal-probe quickly expands once it’s secured a beach-head in your backside, stretching you wonderfully wide and filling you with so much of her chilly goo.");
	
	output("\n\nThe fingers lodged in your");
	if (pc.hasVagina()) output(" cunt and");
	output(" ass");
	output(" begin to expand and change shape, merging together into a");
	if (!pc.hasVagina()) output(" big, thick cock");
	else output(" pair of big, thick cocks");
	output(" to fuck you with. Your eyes go wide, mouth twisting into a silent scream of ecstasy, feeling the cock");
	if (pc.hasVagina()) output("s");
	output(" swelling up inside your straining hole");
	if (pc.hasVagina()) output("s");
	output(".");
	
	var tLooseness:Number;

	if (pc.hasVagina()) tLooseness = pc.gapestVaginaLooseness();
	if (pc.ass.looseness() > tLooseness) tLooseness = pc.ass.looseness();

	output("\n\n<i>“Mmm, you’re");
	if (tLooseness >= 4) output(" nice and loose for me!”</i> [goo.name] giggles, shifting her goo like a hand caressing your asscheeks. <i>“Been finding some big, fat cocks to sit on? Or are you just loosening up until I can fit, like, all the way inside you?”</i>");
	else if (tLooseness <= 1) output(" sooooo, like, tight and squeezy!”</i> the goo giggles, pumping her slick hips against your [pc.butt]. <i>“We’re gonna have to loosen you up a little!”</i>");
	else
	{
		output(" all kinds of amazing back here!”</i> [goo.name] grins, wiggling her dick");
		if (pc.hasVagina()) output("s");
		output(" inside you. <i>“Tight enough to be super squeezy, but loose enough to ram sooooo much in you!”</i>");
	}
	
	output("\n\n[goo.name] sure seems to be enjoying herself... as are you. The feeling of that much goo straining your body, opening you wide to her advances, keeps you gridlocked in moans and cries of desperate pleasure. Her facsimilie hips buck against your ass, pounding her swollen dick");
	if (pc.hasVagina()) output("s");
	output(" deeper and harder into you.");
	if (pc.hairLength >= 3) output(" Seeing you looking, [goo.name] grins and pulls your hair, making your back arch low to the ground.");
	output(" Now that’s the stuff...");
	
	output("\n\n<i>“Are you gonna cum for me?”</i> [goo.name] asks, slamming herself in to the hilt - and filling you with goo until your gut seems to grow like it’s");
	if (pc.isPregnant()) output(" even more");
	output(" pregnant. <i>“You totally are! Come on and");
	if (pc.hasCock()) output(" blow your load all over me!");
	else if (pc.hasVagina()) output(" squirt those pussyjuices all over me!");
	else output(" cum already!");
	output(" I am sooo ready for a snack.”</i>");
	
	output("\n\nThe way she’s treating you, the poor goo must be starving for ");
	if (!pc.hasCock()) output("fem-");
	output("cum!");
	
	output("\n\n[goo.name] leans forward, squeezing her big, squishy tits against your back and wrapping her arms around your [pc.chest] and holding you tight... and putting her in a better position to rapid-fire hammer your ass");
	if (pc.hasVagina()) output(" and pussy");
	output(", pounding you with fast, hard strokes. The gooey prick in your mouth begins to throb and sputter, drooling gray faux-spunk onto your [pc.tongue] in simulated orgasm - [goo.name]’s really going all out to give you the complete fucked-into-submission experience!");
	
	output("\n\nYou groan appreciatively around her twitching goo-cock, feeling your body approaching climax. With a final cry, surrendering to the pleasure, your [pc.asshole]");
	if (pc.hasVagina()) output(" and cunt");
	output(" contract");
	if (!pc.hasVagina()) output("s");
	output(" around [goo.name]’s gooey cock");
	if (pc.hasVagina()) output("s");
	if (pc.hasCock())
	{
		output(", and your [pc.cocks] erupt");
		if (pc.cocks.length == 1) output("s");
		output(" in a geyser of jizz within");
		if (pc.cocks.length == 1) output(" its");
		else output(" their");
		output(" gooy confines");
	}
	output(". Your eyes cross, body going limp as you’re fucked hard, filled with gooey jizz and forced to reciprocate in kind");
	if (pc.hasCock() && pc.hasVagina()) output(", feeding your amorous goo-girl with your ejaculate");
	output(".");
	
	output("\n\nBy the time she’s done with you, you’re nothing but an insensate mess on the ground, squirming and twitching as [goo.name] pounds you raw, screaming triumphantly as she brings you to climax.");
	
	output("\n\n<i>“Whoo! That was awesome!”</i> [goo.name] cheers, sliding out of you - and almost making you cum again from the sheer, alien pleasure of it. <i>“You are </i>such<i> a great fuck, [pc.name]! We gotta do this again and again and again!”</i>");
	
	output("\n\nYou might need to catch your breath first...");

	if(pc.hasVagina()) pc.loadInCunt(goo,0);
	pc.loadInAss(goo);
	processTime(20);

	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function grayGooCockSleeve(fromCrew:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showGrayGooArmor(true, "tits");

	output("You reach down to your pent-up [pc.cock] and give yourself a stroke through the gooey coating hugging your body. Grinning, you");
	if(!fromCrew)
	{
		if(pc.armor is GooArmor) { /* Fine here! */ }
		else if(pc.hasItemByClass(GooArmor)) output(" open your inventory and");
		else if(InShipInterior() && pc.hasItemInStorageByClass(GooArmor)) output(" open your storage and");
	}
	output(" ask [goo.name] if she’s up for a little fun.");
	
	output("\n\nThe answer comes as a squirming, writhing sensation of cool, wet goo around your [pc.cock]. You suck in a sharp breath, almost collapsing as your gooey bodysuit gives her response. When you hobble a little nearer to the ground, some of the goo starts to drain off of your upper body, splattering to the ground and congealing into a humanoid shape. [goo.name]’s face forms, overtop a pair of gigantic tits that would make a New Texan porn-star jealous, and wraps her hands around them with a couple of inviting pats.");
	
	output("\n\n<i>“I thought you’d never ask!”</i> [goo.name] giggles, jiggling her goopy tits at you. <i>“");
	if (flags["GOOARMOR_SLEEVE_FUCK"] != undefined) output("Well, again, anyway. ");
	output("I just knew you’d wanna play with my big ol’ tits! C’mon and put that [pc.cock] of yours right between ‘em and gimme some cum!”</i>");
	
	output("\n\nConsidering she’s already got your prick wrapped up in squirming goo, that seems like an odd request. Still, you start to move your [pc.hips] towards the wide, deep cleavage between [goo.name]’s tits and find that the gray sheathe around your [pc.cock] moves with you, running like cool lube around your schlong all the way. [goo.name] giggles as your dick slips in between her jiggling boobs, still encased in goo that blends seamlessly into [goo.name]’s chest. It looks like you’ve got a wet little goo-pussy open between her tits, ready for you to fuck. You slide in deeper, hips thrusting your prick down into her welcoming torso, and she giggles and wraps her tremendous tits around your shaft as you go, all the better to enhance your pleasure.");
	
	output("\n\nYou start to fuck the gooey cock-sleeve, hammering your [pc.hips] into [goo.name]’s cleavage. <i>“Ooh, yeah, fuck me </i>rough<i>!”</i> she cheers, clapping her hands together - which just makes a wet patting sound. [goo.name] gives you a toothy smile and wiggles her bubbly assets, making the goo encasing your dick slosh around. Fucking goo never gets old, such a strange and alien sensation, like thrusting into a sea of lube that’s just tight enough to try and milk the cum out of you.");
	
	output("\n\nWhile you’re busy fucking the hole between [goo.name]’s tits, the goo still hugging tight to your lower body shifts and squirms. You start to feel a very slight pressure welling up against your [pc.asshole], and your eyes quickly go wide. [goo.name] gives you a cheeky grin, moving her tits faster around your shaft as the pressure grows more and more urgent against your backside.");

	clearMenu();
	addButton(0, "Allow It", grayGooCockSleeveII, true);
	addButton(1, "Deny Her", grayGooCockSleeveII, false);
}
public function grayGooCockSleeveII(allowIt:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showGrayGooArmor(true, "tits");
	
	if (allowIt)
	{
		output("With a gasp, you feel the slender tendril of goo slip inside you. [goo.name] keeps it short and small, focusing more on control than just filling you with goo-cock. She hones in on the tiny little bulb of your prostate with unerring accuracy, putting just enough pressure on it to make your [pc.cock] leap and start to leak. The moment a drop of pre-cum pours into her, your gooey companion coos happily, licking her lips hungrily.");
	}
	else
	{
		output("You give [goo.name] a very stern look and tell her to <i>“Stop that!”</i>");
		
		output("\n\n<i>“Aww!”</i> she groans, easing the pressure off your behind. <i>“I guess I’ll just have to work harder on that [pc.cock] of yours!”</i>");
		
		output("\n\nAnd does she ever. Her tits start flying around your shaft, and her whole chest contorts around your thrusting cock. She’s like a vacuum sucking on you, ready to drain every drop from your [pc.balls]. It doesn’t take more than a moment for pre to start pouring out of your cock, heralding the inevitable. The moment the first droplet stains her gray body, your gooey companion coos happily, licking her lips hungrily.");
	}

	output("\n\nUnder this kind of treatment, you’re not going to last much longer. You clench down, trying to hold back, but [goo.name]’s sucking, writhing motions are as intense as an expert whore’s, purpose-built to suck every drop of cum from you. There’s not a lot you can do to keep it from happening - just to try and give as good as you get, making sure [goo.name] has every bit as much enjoyment from your lovemaking as you do. She squeals delightedly as you redouble your efforts, wiggling and moaning with every thrust.");
	
	output("\n\nA few moments later, and you reach your limit. With a grunt of effort, you feel your [pc.cock] swell for a moment, then unload into the goo-girl’s expectant hole. She shrieks in pleasure, smiling at you inhumanly wide as you pump her full of spunk, filling her gooey innards with [pc.cumNoun].");
	
	output("\n\nWith a heavy sigh, you roll off the sated goo-girl, watching as your spunk sinks away into the hungry gray goo.");
	
	output("\n\n<i>“Oooh, you’ve been saving that up for me, haven’t you?”</i> [goo.name] giggles, running a finger around her well-fucked chest pussy. <i>“Delicious!”</i>");
	
	output("\n\nYou give her a grin and");
	if(pc.armor is GooArmor) output(" extend an arm to her, inviting your gooey bodysuit to envelop you once again");
	else if(pc.hasItemByClass(GooArmor)) output(" open your inventory, inviting your gooey friend to return");
	else if(InShipInterior() && pc.hasItemInStorageByClass(GooArmor)) output(" open your storage, inviting your gooey friend to return");
	else output(" let your gooey friend on her way");
	output(". Back to business!");

	processTime(20);

	pc.orgasm();

	if (flags["GOOARMOR_SLEEVE_FUCK"] == undefined) flags["GOOARMOR_SLEEVE_FUCK"] = 0;
	flags["GOOARMOR_SLEEVE_FUCK"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function grayGooSpessSkype():void
{
	// Nova is not alive or does not have cybernetic body!
	if(flags["DECK13_GRAY_PRIME_DECISION"] != 1) return;
	
	if (hasGooArmor() && flags["ANNO_NOVA_UPDATE"] >= 3 && flags["GRAYGOO_SPESS_SKYPE"] == undefined && rand(5) == 0)
	{
		flags["GRAYGOO_SPESS_SKYPE"] = 1;
		eventQueue.push(grayGooSpessSkypeScene);
	}
}
public function grayGooSpessSkypeScene():void
{
	clearOutput();
	showName("\n" + goo.short.toUpperCase());
	showBust("GRAY_GOO_PRIME");
	
	output("The sound of talking beckons you awake. You blink your eyes open, and see that your cabin’s holoterminal is open, flashing brightly... and [goo.name] is parked in your chair, her body molded in an even more human form than normal. She looks like the old [goo.name] you encountered on Deck 13, complete with uniform and long hair pulled back in a ponytail, sitting on her legs and talking happily at the computer screen.");
	
	output("\n\n<i>“I’m having so much fun!”</i> she grins, jiggling excitedly at the screen. <i>“Space is amazing. There are so many cool people and weird places and adventures. So many adventures! I never thought I’d be, like, a real life adventurer. Well, kind of. [pc.name] is the real adventurer, but [pc.heShe]’s been nice enough to let me tag along.”</i>");
	
	output("\n\nYou hear a noble, reserved laugh from the screen, and a woman’s voice answer. <i>“That’s lovely, [goo.name]. I’m glad you’re being taken care of.”</i>");
	
	output("\n\n<i>“How’s the new body? Everything where it’s supposed to be?”</i> [goo.name] teases, making her big ol’ tits bounce.");
	
	output("\n\n<i>“I am... fully functional, yes,”</i> the voice says with another laugh. <i>“The new body’s quite nice, actually. I do admit, I miss the flexibility and convenience we used to have, but I shouldn’t complain. Sometimes I even forget that I’m not... me.”</i>");
	
	output("\n\n[goo.name] pouts. <i>“Aww, don’t be like that. You’re gonna make </i>me<i> sad. Oh, didn’t you get that super duper awesome job, anyway?”</i>");
	
	output("\n\n<i>“I did!”</i> the woman says, her tone changing immediately. <i>“Steele Tech offered me a captain’s post aboard one of their transports. They said I had sufficient ‘prior experience.’ Ha! Still, it’s something to do. Most of the crew is still in re-education classes to bring them up to speed on all the advances in the last few centuries.”</i>");
	
	output("\n\n[goo.name] beams. <i>“Super cool! I guess I can still call you ‘captain,’ then?”</i>");
	
	output("\n\n<i>“I suppose you can,”</i> the woman laughs. <i>“Ah, speaking of which, looks like my XO is at the door. I have to run, [goo.name]. I’ll call you back soon.”</i>");
	
	output("\n\n<i>“Aw. Okay! See you later, Captain Morrow. Love you. Bye.”</i>");
	
	output("\n\nThe screen flicks off to black, and like breathing a sigh, [goo.name] resumes her less-human gooey form. She scoots back over to where you’ve dumped your equipment and collapses into an amorphous pile, awaiting you. Smiling to yourself, you roll back over and go to sleep again...");
	
	addButton(0, "Next", mainGameMenu);
}

public function pcGooClone(attacker:Creature, target:Creature):void
{
	output("<i>“Go get ‘em, [goo.name]!”</i> you shout.");
	if(attacker.armor.defense <= 1)
	{
		output(" She hesitantly wriggles around you, uncertain whether she should leave you completely defenseless. It seems you won’t have enough armor if she leaves you now, so you might as well do the teasing yourself!");
	}
	else
	{
		output(" She cheers and leaps off of you, half her gooey mass plopping down beside you and reforming into a miniature, big-tittied dancing goo-girl. The mini-goo bounces around, showing off her tits or bending over, flashing her ass and crotch at " + target.a + target.short + ".");
		
		var defenseDown:Number = 5;
		if((attacker.armor.defense - defenseDown) < 1)
		{
			//output(" Unfortunately, due to the lack of material, this leaves your armor defenseless!");
			defenseDown = (attacker.armor.defense - 1);
		}
		
		target.changeLust(3 + rand(3));
		
		attacker.createStatusEffect("Reduced Goo", defenseDown, 0, 0, 0, false, "Icon_DefDown", chars["GOO"].short + " has split from your frame and is busy teasing your foes - but it’s reduced your defense!", true, 0);
		attacker.armor.defense -= attacker.statusEffectv1("Reduced Goo");
		target.createStatusEffect("Gray Goo Clone", 0, 0, 0, 0, false, "Icon_LustUp", chars["GOO"].short + " is busy distracting your foes!", true, 0);
	}
}
public function pcRecallGoo():void
{
	clearOutput();
	
	// Attacker will be the caster, target are going to basically be null-elements
	var foes:Array = CombatManager.getHostileActors();
	for (var i:uint = 0; i < foes.length; i++)
	{
		if (foes[i].hasStatusEffect("Gray Goo Clone"))
		{
			foes[i].removeStatusEffect("Gray Goo Clone");
			break;
		}
	}
	
	output("<i>“Come on back, [goo.name]!”</i> you shout. In the blink of an eye, your body is wrapped in a thick covering of gray goo, cool and wet and comforting.");
	pc.armor.defense += pc.statusEffectv1("Reduced Goo");
	pc.removeStatusEffect("Reduced Goo");
	
	CombatManager.processCombat();
}

public function gooArmorIsCrew():Boolean
{
	if(flags["GOO_ARMOR_ON_SHIP"] != undefined) return flags["GOO_ARMOR_ON_SHIP"];
	return false;
}
public function hasGooArmor(nearby:Boolean = false):Boolean
{
	if(pc.hasItemInStorageByClass(GooArmor) || gooArmorIsCrew()) return (nearby ? InShipInterior(): true);
	return hasGooArmorOnSelf();
}
public function hasGooArmorOnSelf():Boolean
{
	if(pc.armor is GooArmor || pc.hasItemByClass(GooArmor)) return true;
	return false;
}
public function hasGooArmorUpgrade(upgrade:String = "none", bInv:Boolean = true):Boolean
{
	var hasUpgrade:Boolean = false;
	if(pc.armor is GooArmor)
	{
		switch(upgrade)
		{
			case "ganrael": if (pc.armor.resistances.hasFlag(DamageFlag.MIRRORED)) hasUpgrade = true; break;
			case "janeria": if (flags["UVETO_DEEPSEALAB_NOVA_UPGRADE"] == 1) hasUpgrade = true; break;
		}
	}
	if(bInv)
	{
		for(var i:int = 0; i < pc.inventory.length; i++)
		{
			if(pc.inventory[i] is GooArmor)
			{
				switch(upgrade)
				{
					case "ganrael": if(pc.inventory[i].resistances.hasFlag(DamageFlag.MIRRORED)) hasUpgrade = true; break;
					case "janeria": if (flags["UVETO_DEEPSEALAB_NOVA_UPGRADE"] == 1) hasUpgrade = true; break;
				}
			}
		}
	}
	return hasUpgrade;
}
public function gooArmorDefense(def:Number = 0):Number
{
	var gooDef:int = 0;
	var i:int = 0;
	
	// Armor
	if(pc.armor is GooArmor)
	{
		if(def != 0) pc.armor.defense += def;
		gooDef = pc.armor.defense;
	}
	// Inventory
	for(i = 0; i < pc.inventory.length; i++)
	{
		if(pc.inventory[i] is GooArmor)
		{
			if(def != 0) pc.inventory[i].defense += def;
			gooDef = pc.inventory[i].defense;
		}
	}
	// Ship Storage
	for(i = 0; i < pc.ShipStorageInventory.length; i++)
	{
		if(pc.ShipStorageInventory[i] is GooArmor)
		{
			if(def != 0) pc.ShipStorageInventory[i].defense += def;
			gooDef = pc.ShipStorageInventory[i].defense;
		}
	}
	// Nova Armor
	if(goo.armor is GooArmor)
	{
		if(def != 0) goo.armor.defense += def;
		gooDef = goo.armor.defense;
	}
	
	return gooDef;
}
public function gooArmorInStorageBlurb(store:Boolean = true):String
{
	showBust(novaBustDisplay());
	
	var halp:Array = [];
	
	if(store)
	{
		halp.push("<i>“Heey! Who turned out the lights?”</i>");
		halp.push("<i>“Oof! What happened?”</i>");
		halp.push("<i>“Hey, it’s dark all of a sudden!”</i>");
		halp.push("<i>“Um... Hello...?”</i>");
	}
	else
	{
		halp.push("<i>“Phew, it was getting stuffy in there!”</i>");
		halp.push("<i>“[pc.name], it’s you!”</i>");
		halp.push("<i>“Ohmygosh--You came back!”</i>");
		halp.push("<i>“Surprise, it’s me again!”</i>");
	}
	
	return RandomInCollection(halp);
}
public function gooArmorInventoryBlurb(armorItem:ItemSlotClass, reaction:String = ""):String
{
	//showBust(novaBustDisplay());
	
	var msg:String = "";
	
	switch(reaction)
	{
		case "buy":
			msg += ParseText("<i>“Guess who’s baaack... It’s me, [goo.name]!”</i> Your gooey partner springs out and gives you a great big hug, excited about her return.");
			break;
		case "sell":
			msg += ParseText("<i>“O-oh... okay. I hope I was worth the price.”</i> [goo.name] looks at you with a wimper in her lips and watery eyes. When she notices your reaction, she tries to perk up before quickly disappearing with a final farewell, <i>“Goodbye now!”</i>");
			
			gooArmorInventoryRemove(armorItem);
			break;
		case "discard":
		case "drop":
			if(InShipInterior()) msg += ParseText("<i>“Well, if you don’t have any place for me, I’ll just pack my things and go...”</i> [goo.name] materializes a faux suitcase and fills it with various self-created items, closes it, and cartoonishly stuffs the case between her cleavage. <i>“Have a nice day!”</i> she finishes as she leaps into the nearest trash chute and ejects herself out of your ship.");
			else if(InPublicSpace()) msg += ParseText("<i>“Out here? With all these people?”</i> [goo.name] appears very overwhelmed. <i>“Maybe I should make some new friends? Do any of them like blowjobs? I wonder...”</i> She continues thinking out loud to herself and disappears into the distance.");
			else msg += ParseText("<i>“Out here? All alone? By myself?”</i> [goo.name] appears very scared at the thought. <i>“I-If you say so... I mean, I can make new friends... maybe?”</i> Saddened at losing a friend, she wanders off and disappears into the distance.");
			
			gooArmorInventoryRemove(armorItem);
			break;
		case "replace":
			msg += ParseText("<i>“No way! You wanna trade me for... for </i>that<i>?!”</i> [goo.name] exclaims. <i>“That’s like... like... argh!”</i> The goo is so flustered that she can barely come up with any more words. Giving up due to the futility of the situation, she just melts into a silver puddle and speeds off and away from you, never to be seen again.");
			
			gooArmorInventoryRemove(armorItem);
			break;
		case "wear":
			msg += "<i>“Alright, I’m ready for action!”</i>";
			break;
		case "collect":
			msg += "<i>“I’ll just be in here if you need me!”</i>";
			break;
		case "obtain":
			msg += "<b>You";
			if(!(pc.armor is EmptySlot))
			{
				msg += ParseText(" have swapped your [pc.armor] and");
				eventQueue.push(function():void {
					clearOutput();
					clearMenu();
					var oldArmor:ItemSlotClass = pc.armor;
					oldArmor.onRemove(pc);
					itemCollect([oldArmor]);
					pc.armor = armorItem;
					armorItem.onEquip(pc);
				});
			}
			else
			{
				pc.armor = armorItem;
				armorItem.onEquip(pc);
			}
			msg += ParseText(" are now wearing [goo.name] as armor!</b>");
			
			if(flags["GOO_ARMOR_AWAY"] != undefined)
			{
				goo.armor = new GooeyCoverings();
				goo.armor.quantity = 1;
				goo.armor.defense = 2;
				goo.armor.hasRandomProperties = true;
				
				gooArmorCheck(true);
				flags["GOO_ARMOR_AWAY"] = undefined;
			}
			break;
	}
	
	return msg;
}
public function gooArmorInventoryRemove(armorItem:ItemSlotClass):void
{
	goo.armor = armorItem;
	goo.armor.quantity = 1;
	flags["GOO_ARMOR_AWAY"] = 1;
}

// Retrofix for orphaned armor!
public function gooArmorOrphanedCheck(shopkeeper:Creature):void
{
	if(flags["ANNO_NOVA_UPDATE"] >= 3 && flags["GOO_ARMOR_AWAY"] == undefined && !hasGooArmor() && !shopkeeper.hasItemByClass(GooArmor))
	{
		shopkeeper.inventory.push((goo.armor is GooArmor) ? goo.armor : (new GooArmor()));
	}
}

// Menu Function Replacers
public function gooArmorClearOutput(fromCrew:Boolean = true):void
{
	//if(!fromCrew) clearOutput2();
	//else clearOutput();
	clearOutput();
}
public function gooArmorOutput(fromCrew:Boolean = true, msg:String = ""):void
{
	//if(!fromCrew) output2(msg);
	//else output(msg);
	output(msg);
}
public function gooArmorClearMenu(fromCrew:Boolean = true):void
{
	//if(!fromCrew) clearGhostMenu();
	//else clearMenu();
	clearMenu();
}
public function gooArmorAddButton(fromCrew:Boolean = true, slot:int = 0, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
{
	//if(!fromCrew) addGhostButton(slot, cap, func, arg, ttHeader, ttBody);
	//else addButton(slot, cap, func, arg, ttHeader, ttBody);
	addButton(slot, cap, func, arg, ttHeader, ttBody);
}
public function gooArmorAddDisabledButton(fromCrew:Boolean = true, slot:int = 0, cap:String = "", ttHeader:String = null, ttBody:String = null):void
{
	//if(!fromCrew) addDisabledGhostButton(slot, cap, ttHeader, ttBody);
	//else addDisabledButton(slot, cap, ttHeader, ttBody);
	addDisabledButton(slot, cap, ttHeader, ttBody);
}
public function gooArmorGoBack(arg:Array):void
{
	var fromCrew:Boolean = arg[0];
	var exitMain:Boolean = (arg.length > 1 ? arg[1] : false);
	
	if(exitMain) mainGameMenu();
	//else if(!fromCrew) backToAppearance(pc);
	else if(!fromCrew) itemInteractMenu();
	else crew();
}

// Crew Menu Text
public function gooArmorInteractBonus(btnSlot:int = 0):String
{
	return gooArmorOnSelfBonus(btnSlot, false);
}
public function gooArmorOnSelfBonus(btnSlot:int = 0, fromCrew:Boolean = true, showBlurb:Boolean = true):String
{
	var bonusText:String = "";
	
	if(gooArmorIsCrew())
	{
		bonusText += RandomInCollection([
			"\n\n[goo.name] can be found wandering around your ship, looking about with attentive curiousity.",
			"\n\nYou catch [goo.name] poking her head through some of the open cabinets and storage units, taking a peek at their contents.",
			"\n\nYou hear some light, sing-songy humming close-by and spot [goo.name] skipping about the ship quite happily.",
			"\n\nYou see [goo.name] standing at a nearby console, pressing some buttons and viewing the screen with great interest."
		]);
		gooArmorAddButton(fromCrew, btnSlot, chars["GOO"].short, approachGooArmorCrew, [true, fromCrew], chars["GOO"].short, "Interact with your silvery shape-shifting crew member.");
	}
	else if(hasGooArmorOnSelf())
	{
		if(pc.armor is GooArmor) bonusText += "\n\n[goo.name] wiggles around your body, making you aware of her presence.";
		else bonusText += "\n\nMuffled giggles can be heard near you. Glancing at your inventory, you find [goo.name] happily jiggling inside.";
		
		if(inCombat()) gooArmorAddDisabledButton(fromCrew, btnSlot, chars["GOO"].short, chars["GOO"].short, "You can’t right now--you’re in combat!");
		//else if(!fromCrew && !kGAMECLASS.canSaveAtCurrentLocation) gooArmorAddDisabledButton(fromCrew, btnSlot, chars["GOO"].short, chars["GOO"].short, "You can’t seem to do anything with her at the moment.");
		else gooArmorAddButton(fromCrew, btnSlot, chars["GOO"].short, approachGooArmorCrew, [true, fromCrew], chars["GOO"].short, "Interact with your silvery shape-shifting armor.");
	}
	else if(InShipInterior() && pc.hasItemInStorageByClass(GooArmor))
	{
		bonusText += RandomInCollection([
			"\n\nYou can try to fish [goo.name] from your storage if you want to do anything with her...",
			"\n\nYou can hear some mumbling coming from the storage room... is [goo.name] still in there?",
			"\n\nSome muffled chatter can be heard in the storage room nearby. Is [goo.name] talking to herself?"
		]);
		
		gooArmorAddDisabledButton(fromCrew, btnSlot, chars["GOO"].short, chars["GOO"].short, "You can’t do anything with her while she is stored away.");
	}
	
	return bonusText;
}

// Interactions w/ Goo Armor
public function approachGooArmorCrew(arg:Array):void
{
	var introText:Boolean = arg[0];
	var fromCrew:Boolean = arg[1];
	var txt:String = "";
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	showGrayGooArmor();
	
	if(introText)
	{
		if(gooArmorIsCrew())
		{
			txt += "You approach [goo.name] and attempt to get her attention.";
			if(pc.isBimbo()) txt += " <i>“How’s my totes-fave B.F.F. doing?”</i> you ask, giving her a big hug.";
			else if(pc.isNice()) txt += " <i>“Everything okay there, [goo.name]?”</i> you ask, waving.";
			else txt += " <i>“Hey, goo-face! How goes?”</i> you say, giving the girl a nudge.";
			txt += "\n\nShe turns to you. <i>“Oh hey, [pc.name]! Just super! And, like, how are you?”</i> she responds.";
		}
		else
		{
			if(pc.isBimbo()) txt += "<i>“Wakey, wakey, girlfriend!”</i> you squeal";
			else if(pc.isNice()) txt += "<i>“Are you awake, [goo.name]?”</i> you ask";
			else txt += "<i>“Up and at ‘em, goo-for-brains!”</i> you shout";
			if(pc.armor is GooArmor) txt += ", tugging on your steel gray outfit.";
			else txt += ", rustling through your inventory.";
			txt += "\n\nLike a natural reflex, your gooey companion";
			if(pc.armor is GooArmor) txt += " lifts herself from your torso just barely while staying firmly attached.";
			else
			{
				txt += " springs out from her compartment and forms herself right next to you.";
				if(InShipInterior())
				{
					txt += " She gives you an excited wave, then proceeds to wander about the ship";
					if((crew(true, true) - 1) > 0) txt += ", admiring the rest of your crew";
					txt += ".";
				}
			}
			if((pc.armor is GooArmor) || !InShipInterior()) txt += " <i>“Heya, [pc.name]! Like, what’s up?”</i> she responds.";
		}
		
		processTime(1);
	}
	else
	{
		if((pc.armor is GooArmor) || !InShipInterior()) txt += "[goo.name] tilts her head and gives you a bright smile, anticipating what you’ll do next.";
		else txt += "[goo.name] flashes you a bright smile and continues to wander around the ship with great interest.";
	}
	
	gooArmorOutput(fromCrew, txt);
	
	approachGooArmorCrewMenu(fromCrew);
	return;
}
public function approachGooArmorCrewMenu(fromCrew:Boolean = true):void
{
	// Options
	gooArmorClearMenu(fromCrew);
	gooArmorAddButton(fromCrew, 0, "Talk", gooArmorCrewOption, ["talk", fromCrew], "Talk", "Chat a bit with [goo.name].");
	if(flags["GOO_ARMOR_CUSTOMIZE"] == undefined) gooArmorAddDisabledButton(fromCrew, 1, "Locked", "Locked", "[goo.name] hasn’t learned how to do this yet..." + (pc.level < 3 ? " She may be more confident if you are a higher level." : " Maybe try" + ((pc.armor is GooArmor) ? " taking her off first, then" : "") + " talking to her" + (InShipInterior() ? "" : " while in your ship") + " for a bit?"));
	else gooArmorAddButton(fromCrew, 1, "Customize", gooArmorCrewOption, ["customize", fromCrew], "Customize " + ((pc.armor is GooArmor) ? "Suit" : "Appearance"), ((pc.armor is GooArmor) ? "See if [goo.name] can change how she looks on you." : "See if [goo.name] can change her form for you."));
	if(pc.lust() >= 33)
	{
		if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP)) gooArmorAddDisabledButton(fromCrew, 2, "Sex", "Sex", "Masturbating here would be impossible.");
		else if(rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL)) gooArmorAddDisabledButton(fromCrew, 2, "Sex", "Sex", "Public masturbation is illegal here. Trying to masturbate would almost certainly land you in jail.");
		else if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.exhibitionism() < 33 && pc.libido() < 70) gooArmorAddDisabledButton(fromCrew, 2, "Sex", "Sex", "You cannot have sex with [goo.name] at this time!");
		else gooArmorAddButton(fromCrew, 2, "Sex", gooArmorCrewOption, ["sex", fromCrew], "Sex", "Have some sexy fun-time with [goo.name].");
	}
	else gooArmorAddDisabledButton(fromCrew, 2, "Sex", "Sex", "You are not aroused enough for this.");
	
	if(flags["GOO_ARMOR_HEAL_LEVEL"] == undefined) gooArmorAddDisabledButton(fromCrew, 5, "Locked", "Locked", "[goo.name] hasn’t learned how to do this yet..." + (pc.level < 7 ? " She may be more confident if you are a higher level." : " Maybe try" + (pc.hasItemByClass(GrayMicrobots, 10) ? "" : " stocking up and") + " carrying some drinkable health items," + ((pc.armor is GooArmor) ? " taking her off," : " and") + " then talking to her" + (InShipInterior() ? "" : " while in your ship") + "?"));
	else if(pc.HP() >= pc.HPMax()) gooArmorAddDisabledButton(fromCrew, 5, "Heal", "Restore Health", "You are already at full health!");
	else if(gooArmorDefense() < 2) gooArmorAddDisabledButton(fromCrew, 5, "Heal", "Restore Health", "[goo.name]’s defense is too low to use her healing ability.");
	else if(pc.hasStatusEffect("Goo Armor Healed")) gooArmorAddDisabledButton(fromCrew, 5, "Heal", "Restore Health", "[goo.name] has already healed you in the past hour. She may need some time to recover before trying it again.");
	else gooArmorAddButton(fromCrew, 5, "Heal", gooArmorCrewOption, ["heal", fromCrew], "Restore Health", "Ask [goo.name] to help mend your wounds.");
	
	if(pc.armor is GooArmor) gooArmorAddButton(fromCrew, 6, ("Clean: " + (flags["GOO_ARMOR_AUTOCLEAN"] != undefined ? "ON" : "OFF")), gooArmorCrewOption, ["clean", fromCrew], "Toggle Fluid Cleaning", ("[goo.name] will " + (flags["GOO_ARMOR_AUTOCLEAN"] != undefined ? "clean your body whenever you are covered in sexual fluids" : "ignore any sexual fluids your body may be covered in") + "."));
	
	if(pc.armor is GooArmor && pc.cumflationEnabled()) gooArmorAddButton(fromCrew, 7, "Cumflation", gooArmorCrewOption, ["cumflation", fromCrew], "Cumflation Options", "Adjust how you want [goo.name] to react when you are inflated with sexual fluids.");
	
	if(flags["GOO_ARMOR_ON_SHIP"] == undefined)
	{
		if(InShipInterior()) gooArmorAddButton(fromCrew, 4, "Stay", gooArmorCrewOption, ["stay", fromCrew], "Stay Here, " + chars["GOO"].short + ".", "Ask [goo.name] to stay on your ship.");
		else gooArmorAddDisabledButton(fromCrew, 4, "Stay", "Stay Here, " + chars["GOO"].short + ".", "This is probably not a good place to leave [goo.name] wandering around... Maybe you should head inside your ship first?");
	}
	else if(fromCrew && InShipInterior())
	{
		if(!pc.hasArmor() || pc.inventory.length < pc.inventorySlots()) gooArmorAddButton(fromCrew, 4, "Take", gooArmorCrewOption, ["take", fromCrew], "Take " + chars["GOO"].short, "Ask [goo.name] to tag along with you.");
		else gooArmorAddDisabledButton(fromCrew, 4, "Take", "Take " + chars["GOO"].short, "You don’t have any extra room to take her! Try emptying your inventory or taking off your outfit first.");
	}
	
	gooArmorAddButton(fromCrew, 14, (fromCrew ? "Leave" : "Back"), gooArmorCrewOption, ["leave", fromCrew]);
}

public function gooArmorTalkButton(btnSlot:int):void
{
	if(!hasGooArmor()) return;
	
	var activate:Boolean = false;
	
	if(pc.level >= 4 && flags["GOO_ARMOR_SWIMSUIT"] == undefined && InRoomWithFlag(GLOBAL.POOL) && !(pc.armor is GooArmor) && pc.inSwimwear(true)) activate = true;
	
	if(activate) addButton(btnSlot, chars["GOO"].short, gooArmorCrewOption, ["talk", true, true], "Talk with " + chars["GOO"].short,"Maybe have a chat with [goo.name]?");
	return;
}
public function gooArmorCrewOption(arg:Array):void
{
	var response:String = arg[0];
	var fromCrew:Boolean = arg[1];
	var exitMain:Boolean = (arg.length > 2 ? arg[2] : false);
	var txt:String = "";
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	gooArmorClearMenu(fromCrew);
	
	switch(response)
	{
		case "talk":
			showGrayGooArmor();
			
			// Level 3
			if(pc.level >= 3 && flags["GOO_ARMOR_CUSTOMIZE"] == undefined && InShipInterior() && !(pc.armor is GooArmor) && rand(4) == 0)
			{
				clearBust();
				
				txt += "Sensing your approach, [goo.name] quickly morphs into a shapeless blob and scoots a couple steps away from you. She suddenly reforms with her back turned to you, appearing in a slightly different guise than her normal self. Her hair is not in the loose, wavy fashion it normally is, but instead, it is tied in a low ponytail. The silvery companion doesn’t turn around, so you can’t tell if something is wrong.";
				txt += "\n\nAfter a brief moment, you call to her. <i>“" + (pc.isBimbo() ? "Umm... [goo.name]?" : "Is something wrong, [goo.name]?") + "”</i> She doesn’t respond, but only wriggles a little... and your ears maybe catch a slight giggle? In any case, it seems like she wants you to approach her instead... So you do.";
				
				processTime(1);
				
				gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewTalk, ["morph 0", fromCrew, exitMain]);
			}
			// Level 4
			else if(pc.level >= 4 && flags["GOO_ARMOR_SWIMSUIT"] == undefined && InRoomWithFlag(GLOBAL.POOL) && !(pc.armor is GooArmor) && pc.inSwimwear(true))
			{
				txt += "You tap [goo.name] for a chat but she is too busy looking around the pool area, wide-eyed.";
				txt += "\n\n<i>“Wooow. Look at this place!”</i> She is enamored by the water and turns to you, noticing your swimwear. <i>“You’re gonna go swimming?”</i>";
				txt += "\n\nYou nod and tell her you are.";
				txt += "\n\n<i>“Like, can I join, too?”</i>";
				txt += "\n\nShe’s waterproof, you think to yourself. <i>“Sure, why not?”</i>";
				txt += "\n\n<i>“Yay!”</i> With that, she jumps with excitement. <i>“Ooh, let me get dressed first!”</i> She shuffles in place, peeling off her pretend goo clothing. <i>“And no peeking...”</i> she winks, <i>“...unless you want to!”</i>";
				txt += "\n\nWith some concentration, [goo.name]’s form rearranges itself and a new shape appears around the surface of her body. Two string-like blobs appear on each of her jiggly breasts, barely covering her silvery nipples, creating a kind of loose bikini top.";
				if(chars["GOO"].legCount <= 1) txt += " Her lower body splits into two, forming shapely legs that";
				else if(chars["GOO"].legCount == 2) txt += " Her shapely legs spread apart slightly to";
				else txt += " Her legs merge into one central blob, then the mass quickly splits into two, forming shapely legs that";
				txt += " make room for the bottom half of her bikini to squeeze into. Her bikini bottom then divides and extends to merge with the strings of her top, converting her swimsuit into an extra-lewd slingkini.";
				txt += "\n\n<i>“So, how do you like it?”</i> She twirls. <i>“I think it’s quite sexy!”</i> You give her outfit a once-over. ‘Sexy’ is an understatement--if she wore anything skimpier, she’d be a full-blown exhibitionist!";
				if(pc.characterClass == GLOBAL.CLASS_ENGINEER) txt += "\n\nYou are not sure that term would really apply to goos who can just form into anything they want though. Technically, she is always naked...";
				txt += "\n\nYou take a moment to test the water from the pool’s edge and proceed to walk right in until you are submerged up to the top of your chest. You turn around and invite [goo.name] in.";
				
				processTime(2);
				
				gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewTalk, ["swimsuit 0", fromCrew, exitMain]);
			}
			// Level 5
			else if(pc.level >= 5 && flags["GOO_ARMOR_CUSTOMIZE"] == 0 && InShipInterior() && !(pc.armor is GooArmor) && pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT))
			{
				txt += "Spotting you with head gear, [goo.name] gets incredibly curious. <i>“Ooo, neat. What’s this do?”</i> she asks, poking it with a gooey finger.";
				txt += "\n\nYou tell her it’s a helmet that protects you from inhaling dangerous gasses and protects against other fluids as well. You also add that it may also help in breathing underwater if the rest of the suit is fully sealed, pressurized, and hooked up to a rebreather.";
				txt += "\n\n<i>“Awesome! You think I can make something like that?”</i> She presses her face against the front, obscuring your view with her flattened face.";
				txt += "\n\n<i>“" + (pc.isBimbo() ? "Yeah, you should, like, totally go for it!" : "Hm... Sure, why not?") + "”</i> you say, finding this as an ideal opportunity for her to learn.";
				txt += "\n\n<i>“Yay!”</i> The gray goo girl leaps up at you to rest herself on your shoulders. The majority of her mass is wrapped around your dome, making you wobble a bit as your vision is masked in complete darkness. After a minute or two, there is a muffled <i>“Okay, I think I’ve got it!”</i> and then she launches herself off you, making you stagger back.";
				txt += "\n\nWhen your vision returns, you find [goo.name] in a half-kneeling pose on the floor, her arms bent and hands balled in a determined fashion, her face in deep concentration. As you [pc.move] towards her, her head is suddenly engulfed in a shapeless silvery blob. The blob then inflates into a more orb-like shape. [goo.name] then stands up to face you.";
				txt += "\n\n<i>“H-How can you see through this thing?”</i> But just as she says that, her microbots get to work in adjusting their composition to make the surface of the new ‘helmet’ optically transparent in the visible light spectrum. The silver-gray color then gradually dissolves, leaving behind a very solid but clear window. <i>“Oh, there we go--I mean, I meant to do that!”</i> She says in response, her bubbly face now completely visible behind the simulated glass.";
				
				processTime(3);
				
				gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewTalk, ["helmet 0", fromCrew, exitMain]);
			}
			// Level 7
			else if(pc.level >= 7 && flags["GOO_ARMOR_HEAL_LEVEL"] == undefined && InShipInterior() && !(pc.armor is GooArmor) && pc.hasItemByClass(GooArmor) && pc.hasItemByClass(GrayMicrobots, 10))
			{
				txt += "You approach [goo.name] for a chat, but find her face suddenly blanche (that is, if she wasn’t already a full coat of solid silver-gray).";
				txt += "\n\n<i>“" + (pc.isBimbo() ? "Hey girl" : "Oh, [goo.name]") + ", something wrong?”</i> You ask, noticing her ill expression.";
				txt += "\n\nShe responds, with an unnatural heaving noise. Then the sound of bubbling and gurgling rumbles through her tummy. <i>“Umm... I don’t feel so good...”</i> She finally exhales, clutching her midsection.";
				txt += "\n\n<i>“Wh-what happened?”</i>";
				txt += "\n\n<i>“Please don’t get mad at me, [pc.name]...”</i> She begs a caveat.";
				txt += "\n\n" + (pc.isAss() ? "You swing your arms in the air. <i>C’mon out with it already! What happened?”</i>" : "You nod and assure her you won’t, whatever it is.") + " You just want to know what’s wrong with her.";
				txt += "\n\nGurgle. <i>“W-well... like...”</i> Bubble. <i>“...you know those energy drinks you keep in your pack?”</i>";
				txt += "\n\nEnergy drinks? What energy drinks?";
				txt += "\n\n<i>“I-I wanted to taste them... and they were </i>too<i> yummy... and... and I drank a whole, whole bunch! I couldn’t help myself! I’m SOOOO sorry!”</i> She blurts, hands now covering her mouth. The gurgling seems to have instantly stopped after the climax of her confession. <i>“Hm?”</i>";
				txt += "\n\nYou double-check your inventory and notice it being a bit lighter than you remember. Open and mostly-empty canisters roll out, one by one, and fall to the hard floor. You squat down to investigate. Hm. It seems [goo.name] has been drinking - or in her case, assimilating - the gray microbots you’ve been holding in your inventory... You stand up to let [goo.name] know exactly what she drank, but as you turn to her, an unnoticed puddle of gray microbots forces you to slip and lose your balance. You go head first toward a nearby wall and your vision goes black.";
				txt += "\n\n<i>“[pc.name]!”</i>";
				
				processTime(2);
				pc.changeHP(-10);
				
				gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewTalk, ["healing 0", fromCrew, exitMain]);
			}
			// Level 9
			else if(pc.level >= 9 && flags["GOO_ARMOR_CUSTOMIZE"] == 1 && InShipInterior() && !(pc.armor is GooArmor) &&
			(	(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
			||	((pc.armor is EmptySlot) && !(pc.upperUndergarment is EmptySlot) && !(pc.lowerUndergarment is EmptySlot) &&
				(	pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)
				||	pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)
				))
			))
			{
				txt += "You find [goo.name] sitting on the floor, shifting and humming about to herself. She seems to be sipping away at a straw connected to a" + (flags["GOO_ARMOR_HEAL_LEVEL"] != undefined ? " familiar-looking" : "n empty juice") + " canister, her head tilting side to side as she hums. She is looking down at a spare data slate, periodically swiping the screen, flipping through different pages of what looks to be a fashion magazine. You call out to the goo girl and she instantly perks up and turns to you, the drinking tube dropping from her mouth.";
				txt += "\n\n<i>“Oh, heya, [pc.name]! What’s up?”</i> Her smile gleams as bright as ever. You ask if she wants to chat and she nods excitedly, forming her lower body into a blob and extending herself towards you. As she swirls herself around you, she continues, <i>“Sure, what do ya--...”</i> Her orbit slows down as she examines you deeper. Expression furrowing, she pouts in concentration. <i>“Hey...”</i>";
				txt += "\n\n<i>“Is something wrong?”</i> you ask.";
				txt += "\n\nIn response, [goo.name] melts into a puddle and surrounds your [pc.feet]. Then, her amorphous mass gradually rises and climbs your [pc.legOrLegs]...";
				
				gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewTalk, ["expose 0", fromCrew, exitMain]);
			}
			// Generic Talks
			else
			{
				txt += "You spend a little time making small talk with the cute goo girl. While her conversation might not be the most in-depth, it is fulfilling enough not to be completely vapid. The subject shifts between";
				
				var talks:Array = [];
				talks.push(" her likes and dislikes");
				talks.push(" her favorite foods");
				talks.push(" your performance on the field");
				talks.push(" what she likes most about Captain Victoria Morrow");
				talks.push(" the music she enjoys listening to");
				talks.push(" your job history");
				if(flags["NALEEN_SNUGGLED"] != undefined) talks.push(" how snuggly the naleen huntress is");
				if(flags["MET_VANAE_MAIDEN"] != undefined || flags["MET_VANAE_HUNTRESS"] != undefined) talks.push(" a vanae’s favorite color");
				if(flags["MET_SEXBOT_FEMALE_ON_TARKUS"] != undefined || flags["MET_SEXBOT_MALE_ON_TARKUS"] != undefined) talks.push(" what sexbots dream about when they sleep");
				if(flags["MET_GRAY_GOO"] != undefined) talks.push(" the potential size of her extended family");
				if(flags["MET_NYREA_ALPHA"] != undefined || flags["MET_NYREA_BETA"] != undefined) talks.push(" how weird nyrea anatomy is");
				if(CodexManager.entryUnlocked("Zil") && CodexManager.entryUnlocked("Gold Myr")) talks.push(" the difference between myr and zil honey");
				txt += RandomInCollection(talks);
				
				txt += " and leads into";
				
				var chats:Array = [];
				var msg:String = "";
				
				msg = " the various encounters she’s seen on your adventure.";
				msg += "\n\n<i>“...and I’ve learned so much from that. That’s why it’s great tagging along with you!”</i> she confesses.";
				msg += "\n\n" + (pc.isBimbo() ? "You give your silver girlfriend a great big hug, squeezing her so hard you swear she could burst into candy and rainbows at any moment. She’s always been so positive!" : "You thank her for the much needed compliment. In a universe where things can get dark fast, you are glad there is some positivity to help balance things out.");
				chats.push(msg);
				
				msg = " a topic about some parasitic creature.";
				msg += "\n\n<i>“...and you should be careful around them, or they’ll go up your butt and never come out!”</i> she concludes.";
				msg += "\n\n" + (pc.isBimbo() ? "Yikes, that sound both exciting and possibly painful!" : "You shrug, not sure where she made that observation, but that does sound like a good enough reason to be careful!");
				chats.push(msg);
				
				msg = " what planets she would like to travel to next.";
				msg += "\n\n<i>“...I think so, too! Yep. Ice Cream Planet... or Frozen Yogurt. Whatever!”</i> she imagines.";
				msg += "\n\n" + (pc.isBimbo() ? "Mmm, that does sound totally yummy! Then after that, Beach Planet!" : "You laugh. She must really like ice cream!");
				if(!pc.hasStatusEffect("Bitterly Cold")) chats.push(msg);
				
				msg = " the freezing weather.";
				msg += "\n\n<i>“...but it’s soooo " + (!pc.hasHeatBelt() ? "c-c-c-cooooooold..." : "cold here!") + "”</i> she whines, then huffs, <i>“" + (!pc.hasHeatBelt() ? "d-d-" : "") + "do you think Ice Cream Planet will be this " + (!pc.hasHeatBelt() ? "c-" : "") + "cold?”</i>";
				msg += "\n\n" + (pc.isBimbo() ? "<i>“I hope not! Besides, this weather is, like, " + (pc.felineScore() >= 3 ? "purr-" : "per") + "fect for wearing more fur, right?”</i> you answer" + (!pc.hasHeatBelt() ? ", hoping to cheer the poor slime-girl up" : " in hopes of appealing to her fashion sense") + "." : "You manage to chuckle a little. It seems " + (!pc.hasHeatBelt() ? "the poor goo-girl" : "she") + " is better suited for warmer climates.");
				if(pc.hasStatusEffect("Bitterly Cold")) chats.push(msg);
				
				msg = " how ausars speak. She tries to imitate different dialects of the ausar language, failing horribly.";
				msg += "\n\n<i>“...I know right? I can’t really tell the difference either!”</i> she replies.";
				msg += "\n\n" + (pc.isBimbo() ? "Like, at least she tried her best! Maybe you two should take a trip to Ausaril some time to learn!" : "You don’t blame her, their language is tricky to foreigners if their tongue isn’t trained for it.");
				chats.push(msg);
				
				msg = " a previous public debate in U.G.C. politics.";
				msg += "\n\n<i>“...and I don’t know much about that foreign gobbly-gook she keeps talking about, but she looks like a total bitch! I mean, have you heard her laugh?”</i> she comments.";
				msg += "\n\n" + (pc.isBimbo() ? "<i>“Oh, totally, that senator has the most bitchiest bitch-face ever, ugh!”</i> you agree, remembering that almost-demonic laugh during the debate." : "While the senator’s politics don’t really mesh with yours, you can agree with [goo.name] on one thing: that senator needs some mods to fix her face for sure--and her voice. Lady laughs like a banshee.");
				if(!pc.isNice()) chats.push(msg);
				
				msg = " a recent charity to help fund research for a remedy to some rare SSTD.";
				msg += "\n\n<i>“...and yeah, I would totally help if I could earn the credits. You think I can give blowjobs for donations?”</i> she ponders.";
				msg += "\n\n" + (pc.isBimbo() ? "<i>“Oh, that would be, like, the best fundraiser ever--I’ll even join you! Double the effort, double the earnings!”</i> you agree, letting the thought linger a little more while you two hatch a hypothetical plan...." : "Hypothetically indulging her silly idea, if given the right circumstances, you could probably send her to a red-light district to shake her money maker and then send the proceeds to the fundraiser....");
				if(pc.isNice()) chats.push(msg);
				
				msg = " a questionable mod being advertised on the holo-boards.";
				msg += "\n\n<i>“...and I dunno, changing yourself into that might not be a good idea, right?”</i> she asks.";
				msg += "\n\n" + (pc.isBimbo() ? "You think about it, but you can’t make an opinion one way or the other. You guess it’s just up to the user to decide!" : "She’s probably right, but you find it humorous that she is concerned about change when she’s a goo-girl who changes form constantly.");
				chats.push(msg);
				
				msg = " a legend about pastry golems.";
				msg += "\n\n<i>“...ooOooOoo--and maybe chocolate! Hm, I wonder what their filling tastes like? Probably yummy!”</i> she comments.";
				msg += "\n\n" + (pc.isBimbo() ? "She’s so silly! Like, no way, how can cupcakes come to life?" : "What a silly idea! There’s no such thing as a cupcake--... is there?");
				if(silly) chats.push(msg);
				
				msg = " a plan to surprise Celise at her next birthday.";
				msg += "\n\n<i>“...and that’s when we throw her a big party and everything, yah?”</i> she asks.";
				msg += "\n\nYou " + (pc.isBimbo() ? "giggle back and nod in agreement. That totally sounds fun!" : "nod, agreeing with her--that does sound like it’d be a lot of fun.");
				if(celiseIsCrew()) chats.push(msg);
				
				msg = " an idea involving Reaha and settling here on New Texas.";
				msg += "\n\n<i>“...and we can have a big farm to put her in!”</i> she illustrates with her hands. <i>“Hmm... I really don’t know what I can be. What do you think she’ll like better: a chicken, a pig, or a horse?”</i> ";
				msg += "\n\n" + (pc.isBimbo() ? "You think it over and tell [goo.name] she would probably look super cute if she changed herself into a chubbly little piggy girl!" : "You don’t really know what Reaha would prefer, but if you were to hazard a guess... maybe the goo-girl could turn herself into a horse - of course!");
				if(reahaIsCrew() && getPlanetName() == "New Texas" && !InShipInterior()) chats.push(msg);
				
				msg = " Anno’s grooming habits.";
				msg += "\n\n<i>“...and that’s what I think would help if she looked into it more. Oh, I wonder how fluffy her tail can get...”</i> she ponders.";
				msg += "\n\n" + (pc.isBimbo() ? "The two of you secretly plot a way to change the snow-colored ausar’s shampoo to try to get her super fluffy!" : "You bet Anno can get it pretty fluffy if she used the right conditioners... or mods.");
				if(annoIsCrew() && InShipInterior()) chats.push(msg);
				
				msg = " a discussion about a particular product.";
				msg += "\n\n<i>“...like, BIG-big! Hmmm... do you think [bess.name] would know if JoyCo sells something like that?”</i> she asks.";
				msg += "\n\n" + (pc.isBimbo() ? "Wow, that’s pretty big! You pout while pondering... You don’t think they have any <i>that</i> big. But maybe you could call in and make a request!" : "You are pretty sure those are a part of JoyCo’s line-up somewhere... just not anywhere near <i>that</i> big.");
				if(flags["BESS_FULLY_CONFIGURED"] != undefined && bessIsCrew()) chats.push(msg);
				
				msg = " some comments about Yammi’s cooking--namely her desserts.";
				msg += "\n\n<i>“...Oh, yesssssss! She makes the yummiest milkshakes and sundaes, too!”</i> she exclaims.";
				msg += "\n\n" + (pc.isBimbo() ? "You lick your [pc.lips] in response, mentally drooling at the thought. Sounds like a good reason to throw an at-home ice cream party!" : "All this talk is giving you quite a craving for some homemade meals, that’s for sure!");
				if(yammiIsCrew() && flags["YAMMI_TALK"] >= 2) chats.push(msg);
				
				msg = " some factoids about ancient, New Texan creatures.";
				msg += "\n\n<i>“...oooh, like dinosaurs?”</i> she asks, wide-eyed. She then morphs herself into her own interpretation of a prehistoric varmint and attempts to chase your own varmint around. <i>“RAWR! I’m gonna get you!”</i>";
				msg += "\n\nYour blue pet playfully tackles the silver goo-dino and gives her a couple loving licks, which instantenously reverts her form back and she gives it a great big hug." + (pc.isBimbo() ? " They are having so much fun together!" : " Those two seem to be getting along very well!");
				if(varmintIsTame() && hasVarmintBuddy() && InRoomWithFlag(GLOBAL.OUTDOOR)) chats.push(msg);
				
				msg = " some wierd crime statistics.";
				msg += "\n\n<i>“...really? I didn’t know you could go to jail for that!”</i> she comments. <i>“Well what if--”</i> [goo.name] quickly realizes where she is. <i>“Uh, never mind!”</i>";
				msg += "\n\nYou poke fun at her concern and before you continue to expand on the details, she insists on changing the subject when she spots what could be a patrolling prison guard. What a silly girl!";
				if(getPlanetName() == "Gastigoth Station" && !InShipInterior()) chats.push(msg);
				
				msg = " a conversation about holo-film gangsters.";
				msg += "\n\n<i>“...and so totally cool!”</i> she exclaims. <i>“Do you think we can pull off being a super awesome duo like them? We’ll have a full posse and everything!”</i> She gleefully plots out her role in the fantasy gang.";
				msg += "\n\nWhile you entertain her idea, you know there is a big difference between movie criminals and actual public enemies. Well, you two are in the proper setting at least!";
				if(getPlanetName() == "Zheng Shi Station" && !InShipInterior()) chats.push(msg);
				
				txt += RandomInCollection(chats);
				
				processTime(15 + rand (16));
				if(exitMain) gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewOption, ["leave", fromCrew, exitMain]);
				else approachGooArmorCrewMenu(fromCrew);
			}
			break;
		case "customize":
			showGrayGooArmor();
			
			txt += "Deciding to go for some customization,";
			
			// Armor changes
			if(pc.armor is GooArmor)
			{
				txt += " you";
				if(pc.isBimbo()) txt += " poke your bestest friend";
				else if(pc.isNice()) txt += " pat your goo friend";
				else txt += " tap your silver companion";
				txt += " for some attention.";
				txt += "\n\n[goo.name] wriggles around you and responds, <i>“Thinking about changing how I look on you?”</i>";
				if(pc.isBimbo()) txt += "\n\n<i>“Yaah! For realsies!”</i> you nod eagerly.";
				else txt += "\n\nYou confirm that you do.";
				
				if(flags["GOO_ARMOR_CUSTOMIZE"] == undefined || flags["GOO_ARMOR_CUSTOMIZE"] < 2)
				{
					txt += "\n\n<i>“Sure thing, just name it!”</i>";
				}
				else
				{
					txt += "\n\n<i>“Oh boy, do I have some options for you! Do you wanna look like a totally";
					if(rand(3) == 0) txt += " hot space-knight";
					else if(rand(2) == 0) txt += " bangin’ spacer " + pc.mf("bro", "chick");
					else txt += " fuckable rusher";
					txt += "? Would you rather";
					if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) txt += " cover up your sexy bits";
					else if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS) && rand(2) == 0) txt += " prance around like a silver-covered " + (!silly ? "butt-slut" : "analmancer");
					else if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) && rand(2) == 0) txt += " sashay with your " + (pc.hasGenitals() ? (pc.hasCock() ? "yummy hot-rod" : "lady lips") : "crotch") + " exposed";
					else if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) && rand(2) == 0) txt += " go out there " + (pc.hasBreasts() ? "sharing your honeydews with the world" : "like a bare-chested hunk");
					else txt += " run around in something more revealing";
					txt += "? Your choice!”</i>";
				}
				txt += " With that, she quickly slaps onto your body and reverts back into her suit-like appearance.";
				txt += "\n\nYou press a button on " + (InShipInterior() ? "a nearby console which projects a mirror designed" : "your codex which activates a holo-projected mirror and you size it") + " to show your full frame.";
				txt += "\n\n" + gooArmorDetails(true);
				
				processTime(2);
				
				gooArmorChangeArmorMenu(fromCrew);
				gooArmorAddButton(fromCrew, 14, "Back", gooArmorChangeArmor, ["back", fromCrew]);
			}
			// Appearance changes
			else
			{
				txt += " you look your";
				if(pc.isBimbo()) txt += " bestest friend";
				else if(pc.isNice()) txt += " goo friend";
				else txt += " silver companion";
				txt += " up and down, thinking.";
				txt += "\n\n[goo.name] looks back and responds, <i>“Looking for a change?”</i>";
				txt += "\n\nYou nod, pondering some more.";
				txt += "\n\n<i>“Totally [pc.name], just name it! What do you think I should change into?”</i>";
				
				processTime(1);
				
				var bodyBtn:int = 0;
				if(chars["GOO"].hairStyle != "null") gooArmorAddButton(fromCrew, bodyBtn++, "Normal", gooArmorChangeBody, ["null", fromCrew], "Appear Normal", "Change to look like her normal self.");
				else gooArmorAddDisabledButton(fromCrew, bodyBtn++, "Normal");
				if(flags["MET_GRAY_GOO"] != undefined)
				{
					if(chars["GOO"].hairStyle != "loose") gooArmorAddButton(fromCrew, bodyBtn++, "Gray Goo", gooArmorChangeBody, ["loose", fromCrew], "Appear Like a Gray Goo", "Change to look like the common gray goo that roam the wilds of Tarkus.");
					else gooArmorAddDisabledButton(fromCrew, bodyBtn++, "Gray Goo");
				}
				else gooArmorAddDisabledButton(fromCrew, bodyBtn++, "Locked", "Locked", "Try exploring Tarkus some more!");
				if(chars["GOO"].hairStyle != "ponytail") gooArmorAddButton(fromCrew, bodyBtn++, "Capt. Morrow", gooArmorChangeBody, ["ponytail", fromCrew], "Appear Like Victoria Morrow", "Change to look like the Captain of the ship she originated from.");
				else gooArmorAddDisabledButton(fromCrew, bodyBtn++, "Capt. Morrow");
				if(flags["DOUBLE_GOO_SLUT_MET_GOO_ARMOR"] != undefined)
				{
					if(chars["GOO"].hairStyle != "double") gooArmorAddButton(fromCrew, bodyBtn++, "DblGoo", gooArmorChangeBody, ["double", fromCrew], "Appear Like the Double-Headed Gray Goo Slut", "Change to look like the double headed gray goo you met on Tarkus.");
					else gooArmorAddDisabledButton(fromCrew, bodyBtn++, "DblGoo");
				}
				
				gooArmorAddButton(fromCrew, 14, "Back", gooArmorChangeBody, ["back", fromCrew]);
			}
			break;
		case "sex":
			showGrayGooArmor(true);
			
			txt += "<i>“Ooo, feeling frisky, are we?”</i> [goo.name]";
			if(pc.armor is GooArmor) txt += " teases you as she rubs and tightens her mass around your body";
			else txt += " swirls herself around you and gives you a playful <i>boop</i> on the nose";
			txt += ". <i>“Well I’m, like, totally in the mood for some fun if </i>you<i> are...”</i>";
			txt += "\n\nWhat would you like to have her do?";
			
			gooArmorAddButton(fromCrew, 0, "Goo Dicks", gooDickFap, true, "Goo Dicks", "Have [goo.name] fill all of your holes and fuck you.");
			if(pc.hasCock()) gooArmorAddButton(fromCrew, 1, "GooSleeve", grayGooCockSleeve, true, "Goo Cocksleeve", "Have [goo.name] jack you off.");
			else gooArmorAddDisabledButton(fromCrew, 1, "GooSleeve", "Goo Cocksleeve", "You don’t have the proper anatomy for that...");
			gooArmorAddButton(fromCrew, 14, "Back", approachGooArmorCrew, [false, fromCrew]);
			break;
		case "heal":
			showGrayGooArmor();
			
			var hpQ:Number = pc.HPQ();
			
			txt += "Looking at your";
			if(hpQ > 75) txt += " light wounds";
			else if(hpQ > 50) txt += " wounds";
			else if(hpQ > 25) txt += " semi-serious wounds";
			else if(hpQ > 10) txt += " heavy wounds";
			else txt += " life-threatening wounds";
			txt += ", you ask if [goo.name] can give you some medical attention.";
			txt += "\n\nShe swirls herself around you to take a look. <i>“";
			if(hpQ > 75) txt += "Ah, silly, that’s just a scratch!";
			else if(hpQ > 50) txt += "Okay, [pc.name], show me where it hurts...";
			else if(hpQ > 25) txt += "Ouch, that must hurt! I hope you’re okay, [pc.name]!";
			else if(hpQ > 10) txt += "Oh, [pc.name], you should really go into urgent care for that...";
			else txt += "Ohmygosh, [pc.name]! You should really go to an emergency med center, quick!";
			txt += "”</i> she says as she quickly assesses the damage. <i>“";
			if(hpQ > 75) txt += "You’re just a " + (pc.tallness < 48 ? "little" : "big") + " baby, aren’t you?";
			else if(hpQ > 50) txt += "...and I’ll kiss it to make it feel better!";
			else if(hpQ > 25) txt += "Here, let me see if I can help!";
			else if(hpQ > 10) txt += "I’ll do my best to help anyway!";
			else txt += "I’m not sure how much I can help, but I’ll try my best!";
			txt += "”</i> And with that, her index finger morphs into a tendril and heads past your [pc.lips] and into your mouth.";
			txt += "\n\nYou feel several drops of microbots flow underneath your [pc.tongue] and travel down your throat. In no time, your body shudders as the tiny machines get to work and your cuts and bruises quickly mend and heal over.";
			txt += "\n\nWhen she does all she can for you, [goo.name] retracts her tendril and returns to meet you face to face, then gives you a light peck on the forehead. <i>“";
			txt += RandomInCollection([
				"Remember to be more careful out there, okay?",
				"Don’t get yourself hurt again!",
				"I hope that helps!"
			]);
			txt += "”</i>";
			
			processTime(3 + rand (2));
			pc.changeHP(50 * flags["GOO_ARMOR_HEAL_LEVEL"]);
			pc.createStatusEffect("Goo Armor Healed", 0, 0, 0, 0, true, "", "", false, 60, 0xFFFFFF);
			
			// Defense Debuff
			if(!pc.hasStatusEffect("Goo Armor Defense Drain"))
			{
				pc.createStatusEffect("Goo Armor Defense Drain", 2, 0, 0, 0, false, "DefenseDown", "Using " + chars["GOO"].short + "’s healing ability has left her in a weaker state than normal.", false, 1440, 0xFFFFFF);
				gooArmorDefense(-2);
				txt += "\n\nYou notice that asking [goo.name] to heal you takes its toll on her strength, temporarily weakening her just a bit.";
			}
			else
			{
				pc.setStatusMinutes("Goo Armor Defense Drain", 1440);
				pc.addStatusValue("Goo Armor Defense Drain", 1, 2);
				gooArmorDefense(-2);
				txt += "\n\nYou feel [goo.name]’s strength being sapped again. You should be careful not to over-do it...";
			}
			txt += "\n\n";
			
			gooArmorAddButton(fromCrew, 0, "Next", approachGooArmorCrew, [false, fromCrew]);
			break;
		case "clean":
			showGrayGooArmor();
			
			if(flags["GOO_ARMOR_AUTOCLEAN"] != undefined)
			{
				txt += "<i>“Now, now there [pc.mister]...”</i> [goo.name] berates you, <i>“you don’t want to be a dirty [pc.boy], do you?”</i>";
				txt += "\n\n<b>[goo.name] will now resist the urge to clean your body of any sexual fluids you may be covered in";
				if(pc.cumflationEnabled()) txt += " or leaking out";
				txt += "!</b>";
				
				flags["GOO_ARMOR_AUTOCLEAN"] = undefined;
			}
			else
			{
				txt += "<i>“Service and a snack!”</i> [goo.name] exclaims. <i>“I will do my best to keep you squeaky clean, [pc.name]!”</i>";
				txt += "\n\n<b>[goo.name] will now happily clean your body of any sexual fluids you may be covered in";
				if(pc.cumflationEnabled()) txt += " or leaking out";
				txt += "!</b>";
				
				flags["GOO_ARMOR_AUTOCLEAN"] = 1;
			}
			txt += "\n\n";
			
			gooArmorAddButton(fromCrew, 0, "Next", approachGooArmorCrew, [false, fromCrew]);
			break;
		case "cumflation":
			showGrayGooArmor();
			
			txt += "How do you want [goo.name] to react when you are inflated with sexual fluids?";
			txt += "\n\n<i>Note that this only applies to your";
			if(pc.hasVagina()) txt += " vagina" + (pc.vaginas.length == 1 ? "" : "s") + " and";
			txt += " ass.</i>";
			txt += "\n\n";
			
			if(flags["GOO_ARMOR_AUTOSUCK"] == undefined) gooArmorAddDisabledButton(fromCrew, 0, "Normal", "Normal", "[goo.name] is allowing the fluids to leak from your orifices and only cleaning it up if she has to.");
			else gooArmorAddButton(fromCrew, 0, "Normal", gooArmorCrewOption, ["cumflation 0", fromCrew], "Normal", "[goo.name] will allow the fluids to leak from your orifices.");
			if(flags["GOO_ARMOR_AUTOSUCK"] == 1) gooArmorAddDisabledButton(fromCrew, 1, "Drink Up", "Drink Up", "[goo.name] is allowed to automatically feed from your orifices.");
			else gooArmorAddButton(fromCrew, 1, "Drink Up", gooArmorCrewOption, ["cumflation 1", fromCrew], "Drink Up", "[goo.name] will go in and clean your orifices out.");
			if(flags["GOO_ARMOR_AUTOSUCK"] == -1) gooArmorAddDisabledButton(fromCrew, 2, "No Leaks", "No Leaking", "[goo.name] is allowed to prevent leaking from your orifices.");
			else gooArmorAddButton(fromCrew, 2, "No Leaks", gooArmorCrewOption, ["cumflation 2", fromCrew], "No Leaking", "[goo.name] will prevent normal leakage from your orifices.");
			gooArmorAddButton(fromCrew, 14, "Back", approachGooArmorCrew, [false, fromCrew]);
			break;
		case "cumflation 0":
			showGrayGooArmor();
			
			txt += "<i>“Aww... Okay,”</i> [goo.name] sighs. <i>“What comes in, must come out, right?”</i>";
			txt += "\n\nWhenever you are filled with sexual fluids, <b>[goo.name] will allow it to leak out of you like normal</b>, only cleaning it up if she has to.";
			txt += "\n\n";
			
			flags["GOO_ARMOR_AUTOSUCK"] = undefined;
			
			gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewOption, ["cumflation", fromCrew]);
			break;
		case "cumflation 1":
			showGrayGooArmor();
			
			txt += "<i>“Ooh-ooh-ohh! Yay!”</i> [goo.name] yips with glee. <i>“Yummy cummies for my tummy!”</i>";
			txt += "\n\nWhenever you are filled with sexual fluids, <b>[goo.name] will now automatically dive in and suck it up!</b>";
			txt += "\n\n";
			
			flags["GOO_ARMOR_AUTOSUCK"] = 1;
			
			gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewOption, ["cumflation", fromCrew]);
			break;
		case "cumflation 2":
			showGrayGooArmor();
			
			txt += "<i>“Ahhh, gonna save the cummies up for something special... maybe for me?”</i> [goo.name] asks hopefully.";
			txt += "\n\nWhenever you are filled with sexual fluids, <b>[goo.name] will try to prevent any of it from leaking out!</b>";
			txt += "\n\n";
			
			flags["GOO_ARMOR_AUTOSUCK"] = -1;
			
			gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewOption, ["cumflation", fromCrew]);
			break;
		case "stay":
			showGrayGooArmor();
			
			txt += "You ask [goo.name] to stay on your ship as a crew member.";
			if(pc.armor is GooArmor)
			{
				txt += "\n\nThe goo-girl looks at you in the eyes, sliding her bottom half around your [pc.lowerBody] a bit. <i>“Aww, really?”</i>";
				txt += "\n\nYou " + (pc.isAss() ? "half-grimace and point to the storage box, signaling to her the alternative" : "nod, telling her to make herself at home") + ".";
				txt += "\n\nShe anxiously bites her silvery lower lip, obviously nervous about leaving you. <i>“Okay, if that’s what you want... then I’ll man the ship for you when you’re, like, away and stuff!”</i> Then she leans in for a hug. <i>“Just promise me you’ll be extra careful out there, okay?”</i>";
				txt += "\n\nWith that, she loosens her embrace, arches her back, and leaps off your body towards the air. Her amorphous mass streams to the ground in a parabolic fashion, flattening into a silver puddle, then reforms itself from it. When she fully emerges, something shiny catches her attention and she is happily [goo.moving] off in its direction.";
			}
			else
			{
				txt += "\n\nThe goo-girl melts in place, obviously disappointed in the request. <i>“Are ya sure about that?”</i>";
				txt += "\n\nYou " + (pc.isNice() ? "tell her you’re sure and that she’ll be safer if she stays on the ship" : "nonchalantly ask her if she’d rather stay in storage instead") + ".";
				txt += "\n\nIn response, she fully emerges from her silver puddle, facing away from you, bends forward a little and shakes her curvy hips and jiggly buttcheeks teasingly in your direction. Turning around, she gives you a puckered face of indignation. <i>“Fine, but like, don’t get yourself hurt and stuff because I’m not there to help you.”</i> Her face relaxes and she give you a smile. <i>“I’ll be here when you get back, okay?”</i>";
				txt += "\n\nYou " + (pc.isBimbo() ? "give a light giggle" : "exhale a chuckle") + ", then ruffle her gooey, silver hair. She’s such a loyal " + (pc.isNice() ? "friend" : "companion") + ".";
			}
			txt += "\n\n(<b>[goo.name] has joined your crew!</b>)";
			txt += "\n\n";
			
			processTime(1);
			break;
		case "take":
			showGrayGooArmor();
			
			if(!pc.hasArmor())
			{
				if(silly && pc.isBimbo() && pc.hasBreasts())
				{
					txt += "With a serious face, you look at your gooey friend and command, <i>“" + chars["GOO"].short.toUpperCase() + ", GRAB MY BOOB";
					if(pc.totalBreasts() >= 2) txt += "S";
					txt += ".”</i>";
					txt += "\n\nShe takes her hand and places it on your";
					if(pc.totalBreasts() >= 2) txt += " right";
					if(pc.totalBreasts() > 2) txt += "-most";
					txt += " breast, then squeezes. <i>HONK!</i>";
					txt += "\n\nIn sync, you both chorus the word, <i>“ADVENTURE...!”</i>";
					txt += "\n\nThe console monitors around you flicker different colors to simulate a discothèque-like rainbow for added emphasis. [goo.name] quickly engulfs herself around your body, changing into your fitted armor, then popping her top half out to meet you as the light show finally stops and everything returns to normal.";
					txt += "\n\nThe two of you look at each other for a good few seconds, then burst into high-pitched giggles.";
				}
				else
				{
					txt += "You ask [goo.name] if she would be interested in joining you.";
					txt += "\n\nHer eyes light up. <i>“Like, of course, bestest buddy!”</i> She leaps up on the spot and spreads herself out wide, only to engulf your body with her mass, giving you a big squishy, gooey hug - even taking some extra motions to rub and grope you in more sensitive areas. She quickly reforms herself into the suit you normally wear her as, then she pops her upper body from you and you can see the overjoyed look on her face. <i>“So, where are we off to next? I’m, like, totally ready for the next adventure!”</i>";
				}
				pc.lust(5);
			}
			else
			{
				txt += "You ask [goo.name] if she would be interested in joining you as you open your inventory to make room for her.";
				txt += "\n\nHer face brightens as she turns to you. <i>“Oh, yay!”</i> She leaps up on the spot and gives you a great big, gooey hug. <i>“Like, I’m ready when you are! Just let me know when you’re heading out, okay?”</i>";
			}
			txt += "\n\n(<b>[goo.name] is no longer on your crew. You are now";
			if(!pc.hasArmor()) txt += " wearing her as your armor";
			else txt += " carrying her along with you";
			txt += ".</b>)";
			txt += "\n\n";
			
			processTime(1);
			break;
		case "leave":
			showGrayGooArmor();
			
			if(gooArmorIsCrew())
			{
				txt += "You decide to let [goo.name] do her thing and tell her that you’re going to tend to some other things.";
				txt += "\n\n<i>“Aye-aye, Captain!”</i> she says with her chest out in a sturdy salute.";
			}
			else
			{
				if(exitMain) txt += "[goo.name] smiles as she";
				else txt += "<i>“Aww, okay!”</i> [goo.name] says as she";
				if(pc.armor is GooArmor)
				{
					txt += " wraps herself around your body and adopting her armor-like appearance, shuffling a bit in your sensitive areas to make sure she’s got you covered where it matters.";
					pc.lust(2 + rand(4));
				}
				else txt += " gives you a quick hug before reforming herself back into your inventory head-first, struggling a bit before finally squeezing in her wide rump with a slick <i>plop!</i>";
			}
			
			processTime(1);
			
			gooArmorAddButton(fromCrew, 0, "Next", gooArmorGoBack, [fromCrew, exitMain]);
			break;
		default:
			gooArmorAddButton(fromCrew, 0, "Next", gooArmorGoBack, [fromCrew, exitMain]);
			break;
	}
	
	gooArmorOutput(fromCrew, txt);
	
	// Item handling.
	switch(response)
	{
		case "stay":
			// Give goo armor to Nova.
			if(pc.armor is GooArmor)
			{
				goo.armor = pc.armor;
				goo.armor.quantity = 1;
				pc.armor.onRemove(pc);
				pc.armor = new EmptySlot();
			}
			else
			{
				var getArmor:ItemSlotClass = new GooeyCoverings();
				getArmor.defense = 2;
				getArmor.hasRandomProperties = true;
				
				for(var i:int = 0; i < pc.inventory.length; i++)
				{
					if(pc.inventory[i] is GooArmor)
					{
						getArmor = pc.inventory[i];
						pc.inventory.splice(i, 1);
					}
				}
				goo.armor = getArmor;
				goo.armor.quantity = 1;
			}
			
			flags["GOO_ARMOR_ON_SHIP"] = true;
			
			gooArmorAddButton(fromCrew, 0, "Next", approachGooArmorCrew, [false, fromCrew]);
			if(!(pc.armor is GooArmor) && flags["GOO_ARMOR_CUSTOMIZE"] != undefined) gooArmorAddButton(fromCrew, 1, "Customize", gooArmorCrewOption, ["customize", fromCrew]);
			break;
		case "take":
			// Get the goo armor.
			var newArmor:ItemSlotClass = goo.armor;
			
			// Swap Nova armor back to old armor.
			goo.armor = new GooeyCoverings();
			goo.armor.quantity = 1;
			goo.armor.defense = 2;
			goo.armor.hasRandomProperties = true;
			
			// Reclaim goo armor.
			if(!pc.hasArmor())
			{
				pc.armor = newArmor;
				newArmor.onEquip(pc);
			}
			else itemCollect([newArmor]);
			
			flags["GOO_ARMOR_ON_SHIP"] = undefined;
			
			gooArmorClearMenu(fromCrew);
			gooArmorAddButton(fromCrew, 0, "Next", approachGooArmorCrew, [false, fromCrew]);
			if(pc.armor is GooArmor && flags["GOO_ARMOR_CUSTOMIZE"] != undefined) gooArmorAddButton(fromCrew, 1, "Customize", gooArmorCrewOption, ["customize", fromCrew]);
			break;
	}
}
public function gooArmorCrewTalk(arg:Array):void
{
	var response:String = arg[0];
	var fromCrew:Boolean = arg[1];
	var exitMain:Boolean = (arg.length > 2 ? arg[2] : false);
	var txt:String = "";
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	showGrayGooArmor();
	gooArmorClearMenu(fromCrew);
	
	switch(response)
	{
		case "morph 0":
			showBust("GRAY_GOO_PRIME");
			
			txt += "You inch towards her little by little and place your hand on her shoulder. She quickly turns around to face you.";
			txt += "\n\n<i>“Oh, hello. Nice to see you... [pc.fullName]?”</i> [goo.name] looks at you but with a different yet familiar face. She has adopted the appearance of Victoria Morrow";
			if(flags["GRAYGOO_SPESS_SKYPE"] != undefined) txt += ", just like the night you witnessed her chatting with the Captain herself";
			txt += "... Her speech inflections seem much more reserved and less bubbly than usual. <i>“Are you looking for someone?”</i>";
			txt += "\n\n<i>“U" + (pc.isBimbo() ? "mmmmmmmmm" : "h") + "... you?”</i> you respond.";
			txt += "\n\nLooking at your reaction, [goo.name] suppresses a soft giggle with one hand to maintain her modesty. <i>“I’m sorry, I’m afraid you are mistaken. Who is this ‘[goo.name]’? A stowaway, perhaps?”</i> Her eyes scan yours. <i>“I can try helping you look for her--we take lost persons cases quite seriously on the </i>NOVA<i>.”</i>";
			txt += "\n\n<i>“" + (pc.isAss() ? "Listen, I don’t ha--" : "Hm, are y--") + "...”</i> You reconsider your answer. Clearly she is role playing with you, so you might as well play along...";
			if(pc.isBimbo()) txt += " <i>“Oh yaaah, that’s right. My B.F.F. has, like, totally disappeared on me. We were supposed to go get ice cream, catch a movie, and have the bestest girls’-night-out ever... But I can’t find her anywhere! I was going to surprise her with something super-duper sexy afterwards, but I guess I gotta, like, hold off on it and stuff...”</i>";
			else if(pc.isAss() || pc.isMischievous()) txt += " <i>“You’re damn right, woman--There’s a stowaway on board and we need to kick her out before she starts a mutiny up in here. Perhaps you’ve seen her. She has a big perky face, huuuge tits - as big as her head! - and a butt that won’t stop jiggling. Oh, and she’s some kind of meta-morphing, shape-shifting mutant, so she could be anyone... I bet she could even control minds!”</i>";
			else txt += " <i>“Captain Morrow, thank goodness I found you! My... my friend, she’s gone missing and I don’t know where to find her!”</i> You wipe the imaginary sweat from your forehead. <i>“One moment, she was with me; the next moment, gone. I think the snatchers might have gotten to her. I mean, I know it’s probably just an urban legend, but I’m worried. What if... what if snatchers are real? I need to find her before it’s too late!”</i>";
			txt += "\n\n<i>“Oh my...”</i> ‘Captain Morrow’ gasps, her eyes wide and brows tilted in deep concern. <i>“We must find her quick!”</i>";
			txt += "\n\nThe two of you spend a small moment opening compartments, looking under shelves, and flipping through security cam channels but can’t ‘find’ signs of [goo.name] anywhere.";
			txt += "\n\nAfter exhausting all methods of search, Morrow drops to her knees.";
			if(pc.isBimbo()) txt += "\n\n<i>“Oh no... She’s totally going to miss out.”</i> You scrunch your face and pout your lips, acting as if you are about to cry.";
			else if(pc.isAss() || pc.isMischievous()) txt += "\n\n<i>“She’s probably got to them. All of them. This ship’s been compromised!”</i> Your face turns into an angry scowl of defeat, exaggerated to make sure she can read it.";
			else txt += "\n\n<i>“She’s... she’s gone.”</i> You cover your face with your hands, preparing to go into full sobbing mode with an imaginary waterfall of tears.";
			txt += "\n\nMorrow’s silvery face begins to break character and she is convinced so much by you that she really believes what you’re saying. Suddenly, she springs onto you with a gooey hug, practically squeezing the life out of you, her legs melting and pooling around your body to add to the embrace.";
			txt += "\n\n<i>“Here I am! Look! See?”</i> Easing her glomp attack, she lifts her head and looks honestly into your eyes. Her face quickly contorts and smoothly shifts back to her [goo.name]-face. <i>“It’s me!”</i>";
			
			processTime(32);
			gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewTalk, ["morph 1", fromCrew, exitMain]);
			break;
		case "morph 1":
			txt += "With the reappearance of [goo.name], you " + (pc.isAss() ? "pat her off you and wince" : "return the hug and give her a smile") + ". Her morphing herself like that gives you an idea. Curious, you ask about her ability to hold different shapes and if she would be willing to change into anything you ask.";
			txt += "\n\n<i>“Sure thing, [pc.name]!”</i> she exclaims as she swirls off your body to face you standing. <i>“Buuut, I might have trouble remembering different forms if you ask for too much. I think Captain Morrow is super pretty, but I really like how I look right now!”</i> She gives you a wink. <i>“And I don’t mind if you ask me to change, okay?”</i>";
			txt += "\n\nYou nod, then ask her if she can do the same when you are wearing her.";
			txt += "\n\n<i>“Mmm... that’s a bit harder, but I can try!”</i> she says pondering. <i>“When you wear me, I just kinda cover everything to make sure I stay on and stuff. I’m afraid, if I change into something else for a long period of time, I might fall off and get lost!”</i>";
			txt += "\n\nYou take a moment to think, then ask: if you brought her an outfit, if she would be willing to duplicate its shape like she did Victoria’s shape.";
			txt += "\n\n<i>“Ooo... I see. Then, if you really want something specific, like a covering for your face or an opening for your butt, gimme something that fits you and I’ll try to copy it!”</i>";
			txt += "\n\n" + (pc.isBimbo() ? "Neat! Y" : "Cool, y") + "ou’ll try to remember that for next time.";
			txt += "\n\n<b>You can now Customize [goo.name]’s appearance!</b>";
			
			flags["GOO_ARMOR_CUSTOMIZE"] = 0;
			processTime(3);
			if(exitMain) gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewOption, ["leave", fromCrew, exitMain]);
			else gooArmorAddButton(fromCrew, 0, "Next", approachGooArmorCrew, [false, fromCrew]);
			break;
		case "swimsuit 0":
			txt += "The goo-girl dips the tip of her toe into the water and quickly retracts back. <i>“Oooh, cold!”</i> The sensitivity in her temperature sensors must be turned up, you note. When she sees you enjoying the water, she huffs her worries away. Not wanting to be left out, she takes a few steps back... then makes a dash towards the pool and jumps straight into the air. <i>“CANNONBALL!”</i>";
			txt += "\n\nShe morphs herself into an actual ball shape and shifts her mass to crash right down into the water. Though she safely lands a few feet away from you, the magnitude of the splash is so great, it lifts you up off your [pc.feet]. When you";
			if(pc.hasFeet()) txt += " find your footing and";
			txt += " touch the pool bottom again, your silver friend surfaces next to you, remorphed back into her bikini-clad self.";
			txt += "\n\n<i>“Ahhh... This really is nice, isn’t it, [pc.name]?”</i> she coos. When she turns to you she finds you completely soaked... and you haven’t even started swimming yet! <i>“Oops! I totally over-did it, didn’t I?”</i>";
			txt += "\n\nYou answer her question by sweeping your arms from behind you and letting loose two handfuls of cool water right at her face, payback for the drenching she gave you.";
			txt += "\n\n<i>“Ack!”</i> she squeaks, then lets out a joyful giggle and splashes back.";
			txt += "\n\nThe two of you splash-fight for a bit, which eventually leads to some friendly, competitive swimming. When you are all swimmed out, you take some time to relax with [goo.name] and chat a little. She talks about all the different swimsuits she’s seen so far and the ones she likes the most. She also offers to <i>be</i> your swimsuit if you ever need one. That definitely would come in handy, you think.";
			txt += "\n\nStepping out of the pool, you approach the shower to rinse yourself off. However, all [goo.name] does is shake like a wet ausar and she is instantly dry, also having reshaped back to her previous form. Before you can get to your gear and dry yourself, you feel two big smacks, one on each of your [pc.butts]. Arching your back in surprise, you turn around to find [goo.name], her hands behind her, looking at you and smiling innocently. She’s so naughty!";
			txt += "\n\n<b>[goo.name] has learned how to change into swimwear!</b>";
			
			flags["GOO_ARMOR_SWIMSUIT"] = 1;
			processTime(45);
			pc.energy(30);
			pc.shower();
			if(exitMain) gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewOption, ["leave", fromCrew, exitMain]);
			else gooArmorAddButton(fromCrew, 0, "Next", approachGooArmorCrew, [false, fromCrew]);
			break;
		case "helmet 0":
			txt += "<i>“So, does it" + (pc.isBimbo() ? ", like," : "") + " work?”</i> you ask surveying her new headwear.";
			txt += "\n\n<i>“Of course it does!”</i> she says, overconfidently and slightly dampened. <i>“Why wouldn’t--...”</i> Her voice cuts off.";
			txt += "\n\n" + (pc.isBimbo() ? "Uh-oh" : "Oh no") + ". What’s happening?";
			txt += "\n\n[goo.name]’s face shows signs of panic as she struggles to loosen her gooey collar, but to no effect. Like a fish gasping for air, her mouth gapes and closes over and over, yet no sound comes from her helmet.";
			if(pc.characterClass == GLOBAL.CLASS_ENGINEER) txt += "\n\nApparently she is putting on an act again, since you know - as a gray goo - she doesn’t need air to survive. But to humor her, you play along and shout: <i>“[goo.name]! Take it off! Take it off!”</i>";
			else txt += "\n\nGoodness, she needs air, quick! This was a stupid idea. But you have no clue how help the poor girl besides shouting, <i>“[goo.name]! Take it off! Take it off!”</i>";
			txt += "\n\nShe can’t hear you. She falls to her [goo.knees] and futilely smacks the floor a few times before finally looking up at you. Her eyes are wide with desperation. She crawls towards you, climbs your torso, and deperately clings to your shoulders. You hold onto her for support.";
			txt += "\n\nHer gaze softens as she seems to take in her last breaths of air.";
			txt += "\n\nHer eyelids slowly fall... then close.";
			txt += "\n\n....";
			if(pc.characterClass == GLOBAL.CLASS_ENGINEER) txt += "\n\nShe <i>is</i> a really great actor, you think to yourself.";
			txt += "\n\nWith her still body in your arms, you look away.";
			
			processTime(5);
			gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewTalk, ["helmet 1", fromCrew, exitMain]);
			break;
		case "helmet 1":
			if(pc.characterClass == GLOBAL.CLASS_ENGINEER) txt += "Just as you ponder whether you should wake her from her fake-death with a kiss to the helmet, a";
			else txt += "A";
			txt += " sudden woosh of air hits your face and you reflexively turn back to meet an unhelmeted [goo.name]... Whose silver-gray face is staring back at you, wearing an incredibly wide smile.";
			txt += "\n\n<i>“Just kidding!”</i> she squeaks.";
			if(pc.characterClass == GLOBAL.CLASS_ENGINEER) txt += "\n\nSo much for that kiss. Oh well.";
			else txt += "\n\nWhat. She was totally miming the whole time. She had you worried!";
			txt += "\n\n<i>“I don’t need to breathe, silly!”</i> she giggles, sliding off you. She stands and experimentally reforms and pops her new bubble helmet a few times, toggling it on and off like testing a freshly-installed light switch.";
			txt += "\n\nWell it looks like she’s picked up an extra ability now, though you hope she’ll take <i>your</i> ability to breathe into consideration when she combines it with the suit....";
			txt += "\n\n<b>[goo.name] has learned how to create a helmet!</b>";
			
			flags["GOO_ARMOR_CUSTOMIZE"] = 1;
			processTime(2);
			if(exitMain) gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewOption, ["leave", fromCrew, exitMain]);
			else gooArmorAddButton(fromCrew, 0, "Next", approachGooArmorCrew, [false, fromCrew]);
			break;
		case "expose 0":
			var chestExposed:Boolean = pc.isChestExposed();
			var crotchExposed:Boolean = pc.isCrotchExposed();
			var assExposed:Boolean = pc.isAssExposed();
			var hasBreasts:Boolean = pc.hasBreasts();
			var hasGenitals:Boolean = (pc.hasGenitals() || pc.balls > 0);
			var isHerm:Boolean = (pc.isHerm() || (pc.balls > 0 && pc.hasVagina()));
			
			txt += "A voice emanates from below you.";
			txt += "\n\n<i>“You know...”</i> Silver tendrils crawl up and around your [pc.lowerBody]. <i>“...You’re looking quite sexy today... And <b>I wanna be sexy too!</b>”</i>";
			txt += "\n\nThe reflexive coils manage to grope your rear on the way up,";
			if(assExposed) txt += " then a tedril slides between your [pc.butts] and prods and traces the rim of your [pc.asshole]. <i>“Ooo, naughty.”</i>";
			else txt += " making sure you feel their presence.";
			txt += " As they slide between your [pc.thighs], they rub and rotate around your crotch area";
			if(hasGenitals) txt += ", letting your genitals feel the pressure and getting them aroused.";
			else txt += ", though there is not much there to try to arouse you with.";
			if(crotchExposed)
			{
				txt += " <i>“";
				if(hasGenitals)
				{
					txt += "Ahh, would you look at that... Letting";
					if(pc.hasCock() || pc.balls > 0) txt += " " + (((pc.cocks.length + pc.balls) == 1) ? "it" : "them") + " all hang out, huh";
					if(isHerm) txt += "... and I see you are allowing";
					if(pc.hasVagina()) txt += " the lad" + (pc.vaginas.length == 1 ? "y" : "ies") + " out for a breather";
					if(isHerm) txt += ", too!";
					else txt += "?";
				}
				else txt += "Hm, a blank canvas here?";
				txt += "”</i>";
			}
			txt += " When her mass continues to climb you, the tendrils round your ribcage, squirm under your armpits and wrap up the rest of your torso,";
			if(hasBreasts) txt += " proceeding to carefully cup each " + (pc.breastRows.length == 1 ? "breast" : "row of breasts") + " in their grasp.";
			else txt += " softly massaging your [pc.chest].";
			if(chestExposed)
			{
				txt += " <i>“";
				if(hasBreasts) txt += (pc.biggestTitSize() < 5 ? "Cute" : "Great") + " tits! The girls gotta breathe, right?";
				else if((pc.mf("m","f") == "m") && pc.tone >= 60 && pc.thickness >= 60) txt += "Oh, such a hunk! I could rub you here all day...";
				else if((pc.mf("m","f") == "m") && pc.tone <= 30 && pc.thickness >= 60) txt += "Does big bear need a hug? Oh yes you do...";
				else if(pc.tone >= 60 && pc.thickness <= 30) txt += "Been working out? Oh, I can tell...";
				else txt += "Aw, pancakes. You should grow some tits here!";
				txt += "”</i>";
			}
			txt += "\n\nFinally, her body rests on your shoulders, weighing you down a little. After the tendrils cover your upper and lower body, they melt and merge together, engulfing your anatomy in a layer of gray goop--not much different than how your suit normally looks--that is, if not for the shape of what you are currently wearing being obvious underneath. Satisfied, the goo girl giggles and opens up gaps in the silver suit, matching the exposed areas of your original attire. She continues this, reshaping herself until she has almost matched the lewdness of the under-outfit.";
			txt += "\n\nShe pauses for a bit to memorize the configuration. <i>“Tricky... but I think I have it figured out now! A-am I <b>sexy</b> yet?”</i>";
			txt += "\n\nYou chuckle and open up a nearby holo-mirror so you can get a better look. You tilt and rotate yourself from side to side and laugh again. Well, she tried, but the things you are wearing underneath clash with what she is going for. You tell her it might be best for you to get naked first and allow her to retry.";
			txt += "\n\nEager to learn to get it right, she agrees. <i>“Okay!”</i> In an instant, her silver body has detached from your body and her jiggly form is standing next to you, eyes wide, hands clasped, and body joyously bouncing up and down.";
			txt += "\n\nYou " + (pc.isNice() ? "smile" : "smirk") + " and proceed to strip off your [pc.gear] until you are in the nude...";
			
			processTime(5);
			gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewTalk, ["expose 1", fromCrew, exitMain]);
			break;
		case "expose 1":
			txt += "You spend some time with [goo.name] as she forms into different outfits on your body, experimenting with several shapes and styles and finding a good match to your figure. She imitates a number of designs she’s found in the fashion magazines, primarily focusing on the lewder cuts and excessively revealing attires.";
			txt += "\n\nProducing openings for your chest, crotch and asshole has gotten her all worked up and stimulated, both in arousal and in intellect; though the holes do make you feel exposed if you were out in public";
			if(pc.exhibitionism() >= 66) txt += "--not that it is a bad thing for you!";
			else txt += ".";
			txt += " Her suit transformations come more naturally to her now as she perfects the craft of skimpy, sexy armor. She is learning quite fast!";
			txt += "\n\nWhen you think she has gotten the hang of it, you decide to call it a day.";
			txt += "\n\n<i>“Aw... And we were having so much fun!”</i> the silver girl pouts as her body tightens around you, making your body bulge a little in places. Then, her mass leaps off your body in one smooth transition, landing beside you and twirling herself about.";
			txt += "\n\nWhen she stops, fully formed, you look back to see that she is “wearing” her own revealing costume--exposing her breast, genitals and ass in full view of you. The attire itself is cute, but extremely lewd. Wow, she is looking pretty alluring there.";
			txt += "\n\n<i>“Like, thanks for hanging out with me! I totally couldn’t have done it without your help!”</i> She gives you a great, gooey hug and kisses you on the cheek as she reverts back to her original";
			if(chars["GOO"].hairStyle == "ponytail") txt += ", less exposed,";
			txt += " form. <i>“Maybe we’ll have more fun next time?”</i>";
			txt += "\n\n";
			if(pc.isBimbo()) txt += "Totally--Anything for your bestest girlfriend!";
			else if(pc.isNice()) txt += "Of course, why not?";
			else if(pc.isMischievous()) txt += "Sure, you’d like that.";
			else if(pc.isAss()) txt += "Maybe. You’ll have to think about it.";
			else txt += "Sure, why not?";
			txt += "\n\n<b>[goo.name] has learned how to make exposed armor</b>--although it may come with some minor drawbacks!";
			
			flags["GOO_ARMOR_CUSTOMIZE"] = 2;
			processTime(45);
			
			pc.lust(15);
			
			if(exitMain) gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewOption, ["leave", fromCrew, exitMain]);
			else gooArmorAddButton(fromCrew, 0, "Next", approachGooArmorCrew, [false, fromCrew]);
			break;
		case "healing 0":
			txt += "Your sight quickly returns and you find yourself clutched in [goo.name]’s silvery mass.";
			txt += "\n\n<i>“[pc.name]... are you okay?”</i>";
			txt += "\n\nYou hope so. You don’t feel any pain, so the fall must have not been major. You run your hand across your [pc.face] just to make sure. No odd bumps on your forehead. Eyes, still intact. Nose, not dislocated. And--! You suck in a long string of air through your teeth. The pain, it stings. Your lower lip, you must have busted it falling down.";
			txt += "\n\n<i>“Oh no, you’re bleeding!”</i> [goo.name] lightly panics.";
			txt += "\n\nMaking sure not to cause another potential accident, you ask her to calm down a bit and tell her where the first-aid kit is on your ship.";
			txt += "\n\n<i>“Oooh, poor thing...”</i> She ignores you, too invested in examining your wound.";
			txt += "\n\nAs she rubs your [pc.lips], you feel a distinct tingle - not of pain, but a cooling sensation... Wait a minute...";
			txt += "\n\nAs the feeling evaporates, you gently remove [goo.name]’s hand and (carefully) run to the restroom, leaving your silver-gray companion to tilt her head in confusion. You splash your face in water and view yourself in the mirror. No cut, no scars. Your lower lip has fully healed and that was a fresh wound only a minute ago! You towel off and return to [goo.name].";
			txt += "\n\nLooking up at you, she scans your bloodless face and happily gasps. <i>“You’re okay!”</i> She lauches herself into you with a big gooey hug.";
			txt += "\n\nYou tell her of what she drank and how it possibly granted her microbots a new ability. Seeing this as good news, and knowing that you are fine, makes her hug even tighter.";
			txt += "\n\n<i>“S-so I’m not in trouble, am I?”</i> she asks, concerned, while loosening her squeeze.";
			txt += "\n\nYou ruffle her slimy silver hair.";
			txt += "\n\n<b>[goo.name] has learned how to heal minor injuries!</b>";
			
			processTime(15);
			flags["GOO_ARMOR_HEAL_LEVEL"] = 1;
			
			pc.destroyItemByClass(GrayMicrobots, 10);
			pc.changeHP(10);
			
			if(exitMain) gooArmorAddButton(fromCrew, 0, "Next", gooArmorCrewOption, ["leave", fromCrew, exitMain]);
			else gooArmorAddButton(fromCrew, 0, "Next", approachGooArmorCrew, [false, fromCrew]);
			break;
	}
	
	gooArmorOutput(fromCrew, txt);
}
public function gooArmorChangeBody(arg:Array):void
{
	var newStyle:String = arg[0];
	var fromCrew:Boolean = arg[1];
	var txt:String = "";
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	
	if(newStyle == "back")
	{
		txt += "On second thought, you refrain from suggesting anything new to [goo.name]’s appearance.";
		txt += "\n\n<i>“Holding out on me, aren’t ya?”</i> she teases, wagging her pointed hand and cusping her hip with the other. <i>“Well, if you want me to doll up, just ask okay?”</i>";
	}
	else
	{
		switch(newStyle)
		{
			case "null":
				txt += "You suggest that [goo.name] change herself back to her normal form.";
				txt += "\n\n<i>“Mmm, my preferred look!”</i> The goo girl lightly giggles and begins her transformation. She does not simply change her form--rather she gives you a sultry wink, inviting you to see each shift in her shape. Tendrils of silver-gray goo dance around her as the surface of her amorphous skin ripples. Her mass sinks inwards only to blossom back out into a hyperfeminine silhouette. She traces her gooey hands across her body, making a show of it. Hypnotized, you watch every change she makes.";
				if(chars["GOO"].legCount != 1) txt += " The tendrils swirl around her lower body, her [goo.legs] melding together into one, making her appear to be sitting on a flower bulb before resting into a recognizable goo base.";
				txt += " Her wavy hair, plump lips and generous curves make her appear like some kind of silvery goddess with the way the light bounces off her form. As her";
				if(chars["GOO"].legCount == 1) txt += " swirling";
				else txt += " gooey";
				txt += " tendrils relax back into her body, she gives her ass a loud smack, breaking you from your entranced daze. <i>“You like this form better, right?”</i>";
				txt += "\n\nYou take a moment to soak in her new look.";
				chars["GOO"].tallness = 73;
				chars["GOO"].legCount = 1;
				chars["GOO"].legType = GLOBAL.TYPE_GOOEY;
				chars["GOO"].legFlags = [GLOBAL.FLAG_AMORPHOUS];
				pc.lust(5);
				break;
			case "loose":
				txt += "You suggest that [goo.name] change herself into the shape of her natural element: the gray goo of Tarkus.";
				txt += "\n\n<i>“Okay, just for you!”</i> The goo girl responds. Starting from the top of her head downwards, she begins to melt. Her hair, her eyes and face, her body... it would be pretty creepy-looking if she weren’t already a silver blob of goo, though. Her slow melting subsides when she becomes a puddle on the floor. She stays that way for a while, making you curious if that is her final form, but just as you tip over to peek, the gray puddle comes to life! It bubbles and shakes as a form begins to acsend from it. You can hear [goo.name] vocalize some heavy breathing as she emerges from her tiny lake, trying to be intimidating. Her form, as curvy as ever, drips with flowing liquid microbots, dropping off her into the lake only to be recycled back into her body as her lower body completes its formation. Her arms are poised in a sinister fashion, fingers tickling the air. Her face wears a menacing smile as she “err”s and “raw”s.";
				txt += "\n\nYou shake your head in this girl’s attempt at being monstrous.";
				txt += "\n\n<i>“Just kidding!”</i> she says, breaking character. <i>“Ee-hee... I hope no one confuses me for being a hostile goo though!”</i>";
				txt += "\n\nYou take a moment to review her new look.";
				chars["GOO"].tallness = 70;
				chars["GOO"].legCount = 1;
				chars["GOO"].legType = GLOBAL.TYPE_GOOEY;
				chars["GOO"].legFlags = [GLOBAL.FLAG_AMORPHOUS];
				break;
			case "ponytail":
				txt += "You suggest that [goo.name] change herself to look more like Captain Victoria Morrow.";
				txt += "\n\n<i>“Like, you want me to look more like " + (chars["GOO"].short.toLowerCase() == "nova" ? "Victoria" : "Nova") + "?”</i> The goo girl attempts her best imitation by covering her mouth with one hand and giving a soft, modest giggle. Her shapeshifting begins at her head, reforming the look of her eyes, lips, cheeks and hair until she appears like a mirror reflection of Captain Morrow herself. The changing wave of goo slides down the rest of her body like a thick condom ring down the longitudinal plane of a penis shaft. Her mass makes her limbs a bit more defined, yet smooth and lean.";
				if(chars["GOO"].legCount != 2) txt += " By the time the wave reaches to the floor below her, her lower body has shifted into a pair of smooth, shapely legs, capped off with comfy-looking shoes. Looking back up, h";
				else txt += " H";
				txt += "er body seems to have formed a kind of tight spacer uniform, each shoulder bearing a Bell-Isle/Grunmann patch. The outfit is wide open, letting her still bouncy tits and crotch display openly in the air.";
				txt += "\n\n<i>“Oops!”</i> [goo.name] squeaks as she notices her lewd exposure and tries to adopt a more conservative look. A tiny “zipper handle” appears below her pussy and proceeds to close up her silver gray-colored uniform, covering the naked areas in its path--traveling from the bulge of her camel toe, sliding across her navel, and stops just below her now half-covered tits. It struggles a bit, making the tightly-compressed muffin-top of breast flesh quake in response. With a cute huff, the goo exhales and the zipper wins the battle, shooting up her cleavage and sealing the round chest globes in a taut encasing, slowing its journey at the base of the neck collar. With that, she looks at you and smiles, trying hard to get into character. <i>“So who’s the " + (crew(true) > 0 ? "crew" : "ship") + "’s captain now?”</i>";
				txt += "\n\nYou take a moment to admire her new look.";
				chars["GOO"].tallness = 73;
				chars["GOO"].legCount = 2;
				chars["GOO"].legType = GLOBAL.TYPE_GOOEY;
				chars["GOO"].legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_SMOOTH, GLOBAL.FLAG_GOOEY];
				break;
			case "double":
				txt += "You suggest that [goo.name] change herself into the shape of the double-headed goo slut the two of you have met during your slutshroom harvesting mission with Azra.";
				txt += "\n\n<i>“Oh, I remember her!”</i> The goo girl squeals <i>“So nice... and hungry!”</i>. She quickly melts into an amorphous silver blob of goo, the mass then trailing up your [pc.leg] and towards your [pc.crotch]. <i>“Like, all growing girls need a good meal!”</i> she teases. Her formless body then climbs your [pc.butt] and [pc.hips] and scales your back until she reaches your shoulders. From there, two orbs form on either side of your head.";
				txt += "\n\n<i>“Hiya!”</i> Two voices eminate simultaneously from the orbs as they each produce a mouth, distinct faces forming and long hair framing them.";
				txt += "\n\n<i>“Hello there, lovely,”</i> says the calm right side, long liquid lashes softly fluttering in your direction.";
				txt += "\n\n<i>“I can’t wait for some yummy cummy!”</i> the bubbly left head exclaims as her gooey tongue runs across her pursed and ready, extra plump lips.";
				txt += "\n\nLooks like you have a Double [goo.name] now.";
				txt += "\n\nThe rest of [goo.name]’s body blooms forth from underneath the two heads, making sure to be exaggeratingly curvy and exceptionally tall--almost twice her usual size. Her massive, hyper-sexualized form gently rolls off you before giving you a teasing bump with her gooey ghetto booty. Now used to her new shape, she makes some superficial tweaks to herself.";
				txt += "\n\n<i>“Wow, girl, lookin’ good!”</i> One head turned to the other, she compliments herself. <i>“You too, sexy!”</i> Then both turning to you, the two ask in unison, <i>“So, what do ya think?”</i>";
				txt += "\n\nYou take a moment to admire her new look.";
				chars["GOO"].tallness = 135;
				chars["GOO"].legCount = 1;
				chars["GOO"].legType = GLOBAL.TYPE_GOOEY;
				chars["GOO"].legFlags = [GLOBAL.FLAG_AMORPHOUS];
				break;
		}
		chars["GOO"].hairStyle = newStyle;
		txt += "\n\nAfter she finishes her transformation, she spins and gives you a full turn-around demonstration. <i>“How’s this look?”</i> Regardless of her new form, there is still some jiggle in her step. It looks like while she can change minute details in her appearance, she can’t completely escape her bouncy bimbo-like body!";
		
		processTime(5);
	}
	
	showGrayGooArmor();
	gooArmorOutput(fromCrew, txt);
	
	approachGooArmorCrewMenu(fromCrew);
}
public function gooArmorDetails(showArmorLevel:Boolean = false):String
{
	var msg:String = "";
	
	// Status: "Goo Armor Design"
	// v1: armor type
	// v2: armor patterns
	// v3: helmet type
	// v4: N/A
	// tooltip: emblem design
	pc.createStatusEffect("Goo Armor Design", 0, 0, 0, 0, true, "", "none", false, 0, 0xFFFFFF);
	var gooDesign:StorageClass = pc.getStatusEffect("Goo Armor Design");
	
	msg += "Your suit of armor is silvery-gray";
	switch(gooDesign.value1)
	{
		case 1: msg += ", with hints of armor-like protrusions"; break;
		case 2: msg += ", with large sections of armor-like pieces"; break;
		case 3: msg += ", with a simulated surface of folded cloth"; break;
		case 4: msg += ", with an appearance of smooth, tight latex"; break;
		case 5: msg += ", shaped into your favorite-style swimwear"; break;
		case 6: msg += ", taking the form of an armored exoskeleton"; break;
	}
	if(gooDesign.tooltip != "" && gooDesign.tooltip != "none")
	{
		msg += " and has " + indefiniteArticle(gooDesign.tooltip) + " emblazoned on each shoulder";
	}
	msg += ".";
	switch(gooDesign.value2)
	{
		case 1: msg += " Across the surface, the suit is patterned with a grid of hexagonal tiles."; break;
		case 2: msg += " There is a distinct glistening silver trim bordering the edges."; break;
		case 3: msg += " Lines of shining silver trace the surface in a design very similar to a printed circuit board."; break;
		case 4: msg += " Portions of the suit are accentuated in linear markings, traveling " + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR) ? "across different anatomical seams" : "from the arms and neck downward") + "."; break;
	}
	if(pc.armor.resistances.hasFlag(DamageFlag.MIRRORED))
	{
		if(gooDesign.value1 != 0 || gooDesign.value2 != 0) msg += " Overall, it";
		else msg += " It";
		msg += " has a crystalline shine to it, adopted from an encounter with a ganrael.";
	}
	if(gooDesign.value3 != 0)
	{
		if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR))
		{
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT)) msg += " The outfit itself is completely closed, much like a body suit should be";
			else msg += " While the outfit is not airtight, it does fit your body well";
			switch(gooDesign.value3)
			{
				case 1: msg += " and is topped with a fashionable helmet that fits snugly around your head"; break;
				case 2: msg += " and is topped with an intimidating-looking pressure helmet" + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT) ? " that protects your head from harm" : ""); break;
				case 3: msg += " and is topped with a bubble-shaped space helmet that covers the entirety of your head"; break;
				case 4: msg += " and is topped with a smoothly-mirrored, featureless helmet that shrouds your visage in mystery"; break;
				case 5: msg += " and is topped with a " + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT) ? "protective" : "nice") + " bike helmet that has adorable animal ears"; break;
				case 6: msg += " and is topped with a heavy-duty military-style helmet" + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT) ? " that protects your head in combat" : ""); break;
				case 7: msg += " and is topped with an impressively designed helmet that is shaped into a tricorn hat"; break;
				case 8: msg += " and is topped with a regal-looking knight’s helmet" + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT) ? " that shields the majority of your head from harm" : ""); break;
				case 9: msg += " and is topped with a roguish styled hood that covers your light" + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT) ? ", protective" : "") + " helmet"; break;
			}
			msg += ".";
		}
	}
	if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
	{
		msg += " Unlike a " + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR) ? "proper swim" : "full body ") + "suit, your outfit leaves your";
		if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) msg += " " + (pc.hasBreasts() ? "tits" : "chest") + ", " + (rand(2) == 0 ? "groin" : "crotch") + " and " + (rand(2) == 0 ? "ass" : "butt") + (rand(2) == 0 ? "hole" : " cheeks");
		else
		{
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST))
			{
				msg += " " + (pc.hasBreasts() ? "tits" : "chest");
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) && pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) msg += ",";
				else if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) msg += " and";
			}
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN))
			{
				msg += " " + (rand(2) == 0 ? "groin" : "crotch");
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) msg += " and";
			}
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) msg += " " + (rand(2) == 0 ? "ass" : "butt") + (rand(2) == 0 ? "hole" : " cheeks");
		}
		msg += " exposed to the elements";
		if
		(	((pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) && pc.upperUndergarment.shortName != "")
		||	((pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) && pc.lowerUndergarment.shortName != "")
		)
		{
			msg += "--that is, if not for the";
			if((pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) && pc.upperUndergarment.shortName != "")
			{
				msg += " [pc.upperUndergarment]";
				if( pc.lowerUndergarment.shortName != "") msg += " and";
			}
			if((pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) && pc.lowerUndergarment.shortName != "") msg += " [pc.lowerUndergarment]";
			msg += " you are wearing underneath";
		}
		msg += ".";
	}
	if (flags["UVETO_DEEPSEALAB_NOVA_UPGRADE"] == 1) msg += " A shield is being emanated from the armor, a trick learned from an encounter with a janeria.";
	if (showArmorLevel)
	{
		msg += "\n\n<b>Armor Defense:</b> " + pc.armor.defense;
		msg += "\n\n<b>Armor Shields:</b> " + pc.armor.shields;
	}
	
	return msg;
}
public function gooArmorChangeArmorMenu(fromCrew:Boolean = true):void
{
	gooArmorClearMenu(fromCrew);
	
	if(pc.statusEffectv1("Goo Armor Design") == 0)
		gooArmorAddButton(fromCrew, 0, "Style", gooArmorChangeDesign, ["style", fromCrew], "Create Style", "Ask to define the style of the suit.");
	else
		gooArmorAddButton(fromCrew, 0, "Style", gooArmorChangeDesign, ["style", fromCrew], "Change Style", "Ask to change the style of the suit.");
	if(pc.statusEffectv2("Goo Armor Design") == 0)
		gooArmorAddButton(fromCrew, 1, "Pattern", gooArmorChangeDesign, ["pattern", fromCrew], "Create Pattern", "Ask to define the pattern on the suit.");
	else
		gooArmorAddButton(fromCrew, 1, "Pattern", gooArmorChangeDesign, ["pattern", fromCrew], "Change Pattern", "Ask to change the pattern on the suit.");
	if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR))
		gooArmorAddDisabledButton(fromCrew, 2, "Emblem", "Emblem", "Your suit does not have shoulder coverings to apply an emblem to.");
	else if(pc.getStatusTooltip("Goo Armor Design") == "" || pc.getStatusTooltip("Goo Armor Design") == "none")
		gooArmorAddButton(fromCrew, 2, "Emblem", gooArmorChangeDesign, ["emblem", fromCrew], "Create Emblem", "Ask to display an emblem on the suit.");
	else
		gooArmorAddButton(fromCrew, 2, "Emblem", gooArmorChangeDesign, ["emblem", fromCrew], "Change Emblem", "Ask to change the emblem on the suit.");
	if(flags["GOO_ARMOR_CUSTOMIZE"] >= 1)
	{
		if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR))
			gooArmorAddDisabledButton(fromCrew, 3, "Helmet", "Helmet", "Your suit cannot acquire a helmet while being a swimsuit" + (silly ? "--that’s unfashionable!" : "."));
		else if(pc.statusEffectv3("Goo Armor Design") == 0)
			gooArmorAddButton(fromCrew, 3, "Helmet", gooArmorChangeDesign, ["helmet", fromCrew], "Create Helmet", "Ask to create a helmet for the suit.");
		else
			gooArmorAddButton(fromCrew, 3, "Helmet", gooArmorChangeDesign, ["helmet", fromCrew], "Change Helmet", "Ask to change the suit’s helmet design.");
	}
	else gooArmorAddDisabledButton(fromCrew, 3, "Locked", "Locked", "[goo.name] hasn’t learned how to do this yet..." + (pc.level < 5 ? " She may be more confident if you are a higher level." : " Maybe try talking to her while" + (InShipInterior() ? "" : " in your ship and") + " wearing an airtight suit?"));
	
	if(flags["GOO_ARMOR_CUSTOMIZE"] == undefined || flags["GOO_ARMOR_CUSTOMIZE"] < 2)
		gooArmorAddDisabledButton(fromCrew, 5, "Locked", "Locked", "[goo.name] hasn’t learned how to do this yet..." + (pc.level < 9 ? " She may be more confident if you are a higher level." : " Maybe try talking to her while" + (InShipInterior() ? "" : " in your ship and") + " wearing something that exposes your chest, crotch and ass?"));
	else
		gooArmorAddButton(fromCrew, 5, "Exposure", gooArmorChangeDesign, ["expose", fromCrew], "Exposure Settings", "Modify the suit to cover or expose your bodyparts.");
	
	if(!gooArmorCheck()) gooArmorAddButton(fromCrew, 13, "Repair", gooArmorChangeArmor, ["repair", fromCrew], "Self Repair", "Something seem’s off about [goo.name]. Ask her to repair herself!");
	
	gooArmorAddButton(fromCrew, 14, "Finish", gooArmorChangeArmor, ["finish", fromCrew]);
}
// Checks goo armor status for repairs.
public function gooArmorCheck(repair:Boolean = false):Boolean
{
	if(!(pc.armor is GooArmor) || !pc.armor.hasRandomProperties) return true;
	
	// Ghost fixes
	if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SKIN_TIGHT)) pc.armor.addFlag(GLOBAL.ITEM_FLAG_SKIN_TIGHT);
	
	// Make sure suit is in normal form first.
	if
	(	pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT)
	||	pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR)
	||	pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)
	||	pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)
	) return true;
	
	// Make sure there isn’t any active status effects affecting the armor’s stats.
	if
	(	pc.hasStatusEffect("Reduced Goo")
	||	pc.hasStatusEffect("Goo Armor Defense Drain")
	) return true;
	
	// Base stats and upgrades:
	var baseDefense:Number = 6;
	var baseSexiness:Number = 5;
	var baseShields:Number = 0;
	var baseResElec:Number = -25;
	// Ganrael
	if(hasGooArmorUpgrade("ganrael", false))
	{
		baseDefense += 2;
	}
	if(hasGooArmorUpgrade("janeria", false))
	{
		baseShields += 50;
		baseResElec += 25;
	}
	// To repair
	if(repair)
	{
		pc.armor.defense = baseDefense;
		pc.armor.sexiness = baseSexiness;
		pc.armor.shields = baseShields;
		pc.armor.resistances.electric.resistanceValue = baseResElec;
	}
	// To check
	if(pc.armor.defense == baseDefense && pc.armor.sexiness == baseSexiness && pc.armor.shields == baseShields && pc.armor.resistances.electric.resistanceValue == baseResElec) return true;
	return false;
}
// Checks and changes armor flags and stats accordingly for exposure.
public function gooArmorChangePart(part:String = "null", expose:Boolean = false):void
{
	if(!(pc.armor is GooArmor) || !pc.armor.hasRandomProperties) return;
	
	switch(part)
	{
		case "chest":
			if(!expose)
			{
				pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
				{
					pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
					pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
					pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
				}
				pc.armor.defense += 2;
				pc.armor.sexiness -= 1;
			}
			else
			{
				pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
				pc.armor.defense -= 2;
				pc.armor.sexiness += 1;
			}
			break;
		case "crotch":
			if(!expose)
			{
				pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
				{
					pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
					pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
					pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
				}
				pc.armor.defense += 2;
				pc.armor.sexiness -= 1;
			}
			else
			{
				pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
				pc.armor.defense -= 2;
				pc.armor.sexiness += 1;
			}
			break;
		case "ass":
			if(!expose)
			{
				pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
				{
					pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
					pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
					pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
				}
				pc.armor.defense += 2;
				pc.armor.sexiness -= 1;
			}
			else
			{
				pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
				pc.armor.defense -= 2;
				pc.armor.sexiness += 1;
			}
			break;
	}
	
	// Convert exposure flags to full if all exist.
	if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) && pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) && pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
	{
		pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
		pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
		pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
		pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
	}
	gooArmorCheckAirtight();
}
// Checks and changes armor flags and stats accordingly for swimwear.
public function gooArmorCheckSwimwear():String
{
	var msg:String = "";
	var swimwear:Boolean = pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR);
	var defToggle:Boolean = true;
	
	if(pc.statusEffectv1("Goo Armor Design") == 5)
	{
		pc.setStatusValue("Goo Armor Design", 3, 0);
		pc.setStatusTooltip("Goo Armor Design", "none");
		pc.armor.addFlag(GLOBAL.ITEM_FLAG_SWIMWEAR);
	}
	else
	{
		pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_SWIMWEAR);
	}
	
	if(swimwear != pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR))
	{
		if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR))
		{
			if(defToggle)
			{
				msg += "Having less coverage on your body lowers your suit’s armor rating a bit, but at least you can swim in it!";
				pc.armor.defense -= 2;
			}
		}
		else
		{
			if(defToggle)
			{
				msg += "No longer exposing your limbs to danger, your suit’s armor rating returns to normal.";
				pc.armor.defense += 2;
			}
		}
	}
	
	pc.armor.hasRandomProperties = true;
	
	return msg;
}
// Checks and changes armor flags and stats accordingly for helmet.
public function gooArmorCheckAirtight():String
{
	var msg:String = "";
	var airtight:Boolean = pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT);
	var defToggle:Boolean = true;
	
	// Airtight check
	if
	(	!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)
	&&	!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST)
	&&	!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)
	&&	!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)
	&&	!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR)
	&&	pc.statusEffectv3("Goo Armor Design") > 0
	)
	{
		pc.armor.addFlag(GLOBAL.ITEM_FLAG_AIRTIGHT);
	}
	else
	{
		pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_AIRTIGHT);
	}
	
	if(airtight != pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT))
	{
		if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT))
		{
			msg += "<b>Your suit is now airtight!</b>";
			if(defToggle)
			{
				msg += " However, the armor displaced to form a helmet will make your suit a little weaker in combat.";
				pc.armor.defense -= 2;
			}
		}
		else
		{
			msg += "<b>Your suit is no longer airtight!</b>";
			if(defToggle)
			{
				msg += " The exclusion of a helmet will make your suit more armored in combat now.";
				pc.armor.defense += 2;
			}
		}
	}
	
	pc.armor.hasRandomProperties = true;
	
	return msg;
}
public function gooArmorChangeArmor(arg:Array):void
{
	var toggle:String = arg[0];
	var fromCrew:Boolean = arg[1];
	var txt:String = "";
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	showGrayGooArmor();
	
	if(toggle == "back")
	{
		txt += "You decide you don’t need anything adjusted on your suit just yet.";
		txt += "\n\n<i>“Okay, feel free to ask anytime!”</i> [goo.name] says as the mass of her lower body glides across yours.";
		gooArmorOutput(fromCrew, txt);
		
		gooArmorClearMenu(fromCrew);
		approachGooArmorCrewMenu(fromCrew);
		return;
	}
	if(toggle == "repair")
	{
		txt += "You feel something is off about your suit and let [goo.name] know about it.";
		txt += "\n\n<i>“Hm, that’s strange...”</i> she sounds, shifting herself around a few times.";
		txt += "\n\n<i>“I’m calculating the data now...”</i>";
		if(!gooArmorCheck())
		{
			txt += "\n\n<i>“Anomalies detected...”</i>";
			txt += "\n\n<i>“Repairing defects...”</i>";
			
			gooArmorCheck(true);
			processTime(5);
			
			txt += "\n\n<i>“...aaaand done!”</i>";
			txt += "\n\nWith that, you feel your armor is back to it’s normal self again. <i>“Thanks, [goo.name]!”</i>";
		}
		else
		{
			txt += "\n\n<i>“...No anomalies detected! No need for repairs, silly!”</i>";
			txt += "\n\nAh, it must have been a false alarm...";
		}
		
		gooArmorOutput(fromCrew, txt);
		processTime(2);
		
		gooArmorClearMenu(fromCrew);
		approachGooArmorCrewMenu(fromCrew);
		return;
	}
	if(toggle == "finish")
	{
		txt += "You give yourself a once over in the mirror, and when you see what you like you let the goo-girl know you’re finished.";
		txt += "\n\n<i>“Like, I made you look";
		if(pc.isChestExposed() || pc.isCrotchExposed() || pc.isAssExposed())
		{
			var tooLewd:Array = [];
			tooLewd.push(" so totally fucking hot right now!" + (pc.exhibitionism() < 33 ? " Think you’ll get used to showing off your body more?" : " You’re definitely my star exhibitionist!"));
			if(pc.isChestExposed()) tooLewd.push(" ready for some titfucking" + (pc.canTitFuck() ? "!" : "... well, if" + (pc.hasBreasts() ? " your boobs were big enough" : " you had tits") + " that is.") + " Just remember to share the goods when they come!");
			else tooLewd.push(" like such a tease. You can do with some more fucking, right?");
			
			txt += RandomInCollection(tooLewd);
		}
		else if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) txt += "--huh. You do look a little weird wearing underwear underneath all that hot bod...";
		else if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST)) txt += ", uh--well you’d look better if you let your chest breathe a little!";
		else if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) txt += " like some kind of fetish superhero for underwear!";
		else if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) txt += " like--hm, you really want to protect your booty, don’t ya?";
		else
		{
			txt += " like a";
			if(pc.statusEffectv1("Goo Armor Design") == 2 || pc.statusEffectv3("Goo Armor Design") == 2) txt += " total badass";
			else if(pc.statusEffectv1("Goo Armor Design") == 1 || pc.statusEffectv2("Goo Armor Design") == 3 || pc.statusEffectv3("Goo Armor Design") == 3) txt += " totally cool space ace";
			else txt += "n awesome rusher";
			txt += " if I say so myself!";
		}
		txt += "”</i> your [pc.belly]--er, [goo.name] comments, gliding herself a bit more around you. She takes a moment to memorize the new shape and pops back out to meet you face to face.";
		
		gooArmorOutput(fromCrew, txt);
		processTime(1);
		
		gooArmorClearMenu(fromCrew);
		approachGooArmorCrewMenu(fromCrew);
		return;
	}
	
	var expose:Boolean = false;
	var airtight:Boolean = pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT);
	pc.armor.hasRandomProperties = true;
	
	txt += "As she shifts around your body, you feel the surface of your [pc.belly] tingle--and then a voice emanating from it.";
	
	switch(toggle)
	{
		case "chest":
			var chestExposed:Boolean = pc.isChestExposedByUpperUndergarment();
			var titSize:Number = pc.biggestTitSize();
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
			{
				txt += "\n\n<i>“So, you want to cover your " + (titSize < 3 ? "chest" : "sisters") + ", huh?”</i> [goo.name] bellows from underneath you.";
				if(titSize < 3) txt += " With rapid efficiency, the silvery goo-girl gets to work and makes a protective layer of liquid microbots to cover your chest. <i>“All done!”</i> she says with an approving giggle.";
				else
				{
					txt += " The silvery goo-girl then gets to work and makes a protective layer of liquid microbots to cover your breasts.";
					if(titSize < 10) txt += " <i>“Nice and perky...”</i> She wraps herself around your tits with ease. <i>“Ever decide that you might wanna, like, y’know, go bigger? You’d look so much hotter!”</i> she comments after finishing her work.";
					else if(titSize < 30) txt += " <i>“Yes, just how I like ‘em, big and juicy!”</i> She joyfully engulfs your mammaries, covering every inch with glee. <i>“I’d gladly protect these knockers any day!”</i>";
					else if(titSize < 60) txt += " <i>“Oooh, so big! Come to mamma!”</i> She greedily hugs your mammaries with every inch of her mass as she can, spreading herself out for full effect. <i>“I hope that’s not too tight for ya!”</i>";
					else if(titSize < 120) txt += " <i>“Yeah, baby, it’s my lucky day! Just look at these chest pillows! Gimme! Gimme!”</i> She expands to meet your size and paints your tits in silver-gray. <i>“This is heaven!”</i>";
					else if(titSize < 240) txt += " Struggling to cover all your titflesh, she exclaims, <i>“[pc.name]! What have you done to your tits! Like, ohmygosh!”</i> Fortunately, she expands herself enough to cover all your sweater meat. <i>“Is there such a thing as too much boobage? Nope!”</i>";
					else txt += " <i>“I must, I must, I must cover this bust!”</i> she chants as she tries her best to engulf the vast surface area of each tit. <i>“This must be, like, a galactic record or something!" + (silly ? " Boy, you sure are taking the title to heart!" : " </i>Phew!<i>") + "”</i>";
					if(pc.bRows() == 2) txt += " She continues this for the next row until it is completely covered.";
					else if(pc.bRows() > 2) txt += " She continues this for the other rows until they are completely covered.";
				}
				txt += "\n\nThis makes you feel a little more protected now with the extra coverage, though the world will miss out on your [pc.chest].";
				txt += "\n\n<b>Your chest is now covered!</b>";
			}
			else
			{
				txt += "\n\n<i>“Ah, you wanna see about freeing " + (titSize < 3 ? "up your chest" : "these babies") + ", eh?”</i> [goo.name] remarks from underneath you.";
				if(titSize < 3) txt += " With one quick motion, the silvery goo-girl gets to work and shifts the protective layer of liquid microbots from covering your chest. <i>“And finished!”</i> she exclaims.";
				else
				{
					txt += " The silvery goo-girl then gets to work and unravels the protective layer of liquid microbots that cover your breasts.";
					if(!chestExposed) txt += " <i>“Okay babies, time for some fresh air... ah... aah, phooey! How can I free them if they are snug in a top already?”</i> Only slightly disappointed, she allows your clothed breasts to pop out into the open air. <i>“Maybe I’ll have better luck next time...”</i>";
					else if(titSize < 10) txt += " <i>“Hello, girls, it’s time to get some fresh air!”</i> And just like that, your breasts pop out and perk up in the open air. <i>“Enjoy it, okay?”</i>";
					else if(titSize < 30) txt += " <i>“You’re free, my children, free!”</i> She giggles as she lets your tits bounce out from their confines. <i>“Roam the land and conquer, my babies!”</i>";
					else if(titSize < 60) txt += " <i>“Oh yes, you’re gonna make mamma proud, aren’t ya?”</i> She coos as she lets your mammaries jostle out of her grip. <i>“Be sure to give that extra jiggle, just for me, okay?”</i>";
					else if(titSize < 120) txt += " <i>“Ooo, I just love hugging these big babies so much!”</i> she whines, <i>“But sometimes, you’ve just gotta let ‘em grow! -- I mean, </i>go<i>!”</i> With that, she allows your tits to flop out over your chest.";
					else if(titSize < 240) txt += " <i>“My thoughts exactly. What’s the point in hiding these giants if they are this big anyway?”</i> she teases. Starting from your covered [pc.nipplesNoun], a hole appears and grows until your massive breast flesh is entirely engulfed by the air around you. <i>“Just as nature intended!”</i>";
					else txt += " <i>“Like, there’s no holding back this dam -- Prepare for freeeeedom!”</i> She exclaims as she creates a hole around each of your areolas and then widens them to make way for your immense mass of tit flesh, spilling them out into the open air. <i>“Ah, this is much better now, don’t ya think?”</i>";
					if(pc.bRows() == 2) txt += " She continues this for the next row until it is completely naked.";
					else if(pc.bRows() > 2) txt += " She continues this for the other rows until they are completely naked.";
				}
				txt += "\n\nWith your [pc.chest] exposed, your sexual presence is more noticeable, but at the cost of some defense if you were to really get into trouble.";
				txt += "\n\n<b>Your chest is now exposed!</b>";
				expose = true;
			}
			break;
		case "crotch":
			var crotchExposed:Boolean = pc.isCrotchExposedByLowerUndergarment();
			var hasGenitals:Boolean = (pc.hasGenitals() || pc.balls > 0);
			var hasSlit:Boolean = (pc.hasStatusEffect("Genital Slit"));
			var cLength:Number = (pc.hasCock() ? pc.cLength(pc.biggestCockIndex(), true) : 0);
			var uniball:Boolean = (pc.balls == 1 || pc.hasStatusEffect("Uniball"));
			var ballDiameter:Number = (pc.balls > 0 ? pc.ballDiameter() : 0);
			var vPuffiness:Number = (pc.hasVagina() ? pc.puffiestVaginalPuffiness() : 0);
			
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
			{
				txt += "\n\n<i>“" + (hasGenitals ? "Oo-hoo, covering up the good bits, I see..." : "Nothing wrong with covering a bare spot, I’d say!") + "”</i> [goo.name] replies from under you.";
				if(!crotchExposed || !hasGenitals) txt += " With a quick twirl, the silvery goo-girl closes the gap to completely cloak your crotch. <i>“...And finished!”</i> she says, punctuated by a short giggle.";
				else
				{
					if(pc.hasCock())
					{
						txt += "\n\n";
						if(pc.hasVagina() || pc.balls > 0) txt += "First, she";
						else txt += "She";
						txt += " starts with your [pc.cocks].";
						if(pc.cocks.length == 1)
						{
							txt += " Giving some experimental strokes to your";
							if(cLength <= 4) txt += " small";
							else if(cLength >= 18) txt += " enormous";
							else if(cLength >= 18) txt += " thick";
							txt += " shaft, [goo.name]";
							if(pc.cocks[0].hasFlag(GLOBAL.FLAG_SHEATHED)) txt += " caresses your sheath,";
							txt += " envelopes your manhood, then takes a moment to";
							if(pc.cocks[0].hasFlag(GLOBAL.FLAG_FORESKINNED)) txt += " pinch your foreskin and";
							txt += " tease your [pc.cockhead 0].";
							txt += " <i>“Mmm, such a delicious cock, [pc.name],”</i> she comments as she creates a large blob of silver goo at the tip of your cock, then undulates it downward towards the base, mimicking a condom with a bulbous head that is giving you a sensuous deepthroat session.";
							if(pc.lust() >= 33)
							{
								txt += " She takes your ";
								if(pc.lust() < 66) txt += "semi-";
								txt += "erect length and";
								if(hasSlit) txt += " gently slides it into your wet genital slit, making sure it stays hidden yet fresh and ready for action when the time calls. <i>“Hafta put the jack back in the box, right babe?”</i>";
								else
								{
									txt += " presses it against your";
									if(cLength <= 4) txt += " underbelly, covering it up with the reflexive surface of her body. <i>“Gotta hide this cutie for later!”</i>";
									else if(cLength <= (pc.tallness / 4)) txt += " belly, doing her best to mask the bulge. <i>“Gotta hide this man-meat for later!”</i>";
									else if(cLength <= (pc.tallness / 3)) txt += " " + (pc.genitalLocation() <= 1 ? "chest" : "lower body") + ", shifting her mass to better hide the large tent you are making in her body. <i>“We’ve got a big one over here!”</i>";
									else if(cLength <= (pc.tallness / 2)) txt += " body, struggling to hide its massive length underneath. <i>“Wow, you sure are packing some serious meat!”</i>";
									else txt += " entire body, unsure if she can do much to hide its presence... <i>“Ohmygosh, you’re, like, more cock than [pc.manWoman]! Well, you know what they say: the more the cock, the more to love! Um... or something like that!”</i>";
								}
							}
							else
							{
								txt += " She takes your flaccid length and";
								if(hasSlit) txt += " gently tucks it back into your wet genital slit, making sure it stays hidden yet fresh and ready for action when the time calls. <i>“Do come out and play when you are in the mood, okay babe?”</i>";
								else
								{
									txt += " smooshes it against your";
									if(cLength <= 4) txt += " " + (pc.genitalLocation() <= 1 ? "crotch" : "underbelly") + ", covering it up with the reflexive surface of her body. <i>“Gotta cover it up just right!”</i>";
									else if(cLength <= (pc.tallness / 4)) txt += " " + (pc.genitalLocation() <= 1 ? "[pc.thigh]" : "belly") + ", doing her best to mask the bulge. <i>“I love hugging a juicy cock!”</i>";
									else if(cLength <= (pc.tallness / 3)) txt += " " + (pc.genitalLocation() <= 1 ? "[pc.knee]" : "lower body") + ", shifting her mass to better hide the large, floppy bulge you are making in her body. <i>“Oh, I’ve caught a big one for sure!”</i>";
									else if(cLength <= (pc.tallness / 2)) txt += " " + (pc.genitalLocation() <= 1 ? "[pc.leg]" : "body") + ", struggling to hide its massive length underneath. <i>“It’s so huge and it’s not even hard yet!”</i>";
									else txt += " " + (pc.genitalLocation() <= 1 ? "entire [pc.leg]" : "entire body") + ", unsure if she can do much to hide its presence... <i>“Ack! I’m not even sure I can completely cover this third leg, but I’ll try my best!”</i>";
								}
							}
						}
						else
						{
							var sameCocks:Boolean = pc.hasSamecType();
							
							txt += " Giving some experimental strokes to your";
							if(sameCocks)
							{
								if(cLength <= 4) txt += " small";
								else if(cLength >= 18) txt += " enormous";
								else if(cLength >= 18) txt += " thick";
								else txt += " matching";
							}
							else txt += " mismatched";
							txt += " shafts, [goo.name]";
							if(pc.hasFullSheaths()) txt += " caresses your sheath,";
							txt += " envelopes your manhoods, then takes a moment to";
							if(sameCocks && pc.cocks[0].hasFlag(GLOBAL.FLAG_FORESKINNED)) txt += " pinch your foreskins and";
							txt += " tease your [pc.cockheads].";
							txt += " <i>“Mmm, such delicious cocks, [pc.name],”</i> she comments as she creates large blobs of silver goo, one at the each cock tip, then undulates them downward towards the base, each mimicking a condom with a bulbous head that is giving you a sensuous deepthroat session.";
							if(pc.lust() >= 33)
							{
								txt += " She takes your ";
								if(pc.lust() < 66) txt += "semi-";
								txt += "erect lengths and";
								if(hasSlit) txt += " gently slides them into your wet genital slit, making sure they stay hidden yet fresh and ready for action when the time calls. <i>“Hafta put the jack back in the box, right babe?”</i>";
								else
								{
									txt += " presses them against your";
									if(cLength <= 4) txt += " underbelly, covering them up with the reflexive surface of her body. <i>“Gotta hide these cuties for later!”</i>";
									else if(cLength <= (pc.tallness / 4)) txt += " belly, doing her best to mask the bulge they create. <i>“Gotta hide these man-meats for later!”</i>";
									else if(cLength <= (pc.tallness / 3)) txt += " " + (pc.genitalLocation() <= 1 ? "chest" : "lower body") + ", shifting her mass to better hide the large tent you are making in her body. <i>“We’ve got big ones over here!”</i>";
									else if(cLength <= (pc.tallness / 2)) txt += " body, struggling to hide their massive lengths underneath. <i>“Wow, you sure are packing some serious meat!”</i>";
									else txt += " entire body, unsure if she can do much to hide their presence... <i>“Ohmygosh, you’re, like, more cock than [pc.manWoman]! Well, you know what they say: the more the cock, the more to love! Um... or something like that!”</i>";
								}
							}
							else
							{
								txt += " She takes your flaccid lengths and";
								if(hasSlit) txt += " gently tucks them back into your wet genital slit, making sure they stay hidden yet fresh and ready for action when the time calls. <i>“Do have them come out and play when you are in the mood, okay babe?”</i>";
								else
								{
									txt += " smooshes them against your";
									if(cLength <= 4) txt += " " + (pc.genitalLocation() <= 1 ? "crotch" : "underbelly") + ", covering them up with the reflexive surface of her body. <i>“Gotta cover ‘em up just right!”</i>";
									else if(cLength <= (pc.tallness / 4)) txt += " " + (pc.genitalLocation() <= 1 ? "[pc.thighs]" : "belly") + ", doing her best to mask the combined bulge. <i>“I love hugging these juicy cocks!”</i>";
									else if(cLength <= (pc.tallness / 3)) txt += " " + (pc.genitalLocation() <= 1 ? "[pc.knees]" : "lower body") + ", shifting her mass to better hide the large, floppy bulge you are creating in her body. <i>“Oh, I’ve caught big ones for sure!”</i>";
									else if(cLength <= (pc.tallness / 2)) txt += " " + (pc.genitalLocation() <= 1 ? "[pc.legOrLegs]" : "body") + ", struggling to hide their massive length underneath. <i>“You’re so huge and aren’t even hard yet!”</i>";
									else txt += " " + (pc.genitalLocation() <= 1 ? "full [pc.legOrLegs]" : "entire body") + ", unsure if she can do much to hide their presence... <i>“Ack! I’m not even sure I can completely cover these all, but I’ll try my best!”</i>";
								}
							}
						}
					}
					if(pc.balls > 0)
					{
						txt += "\n\n";
						if(pc.isHerm()) txt += "Then, she";
						else if(pc.hasVagina()) txt += "First, she";
						else if(pc.hasCock()) txt += "Next, she";
						else txt += "She";
						txt += " makes her way to your [pc.ballsack], covering it with a thin coat of silver goo. Nodules appear across the surface and softly massage " + (uniball ? "your uniball" : "each of your testicles") + ", gradually thickening the layers of goo until the coat is unified with the entier suit. <i>“";
						if(ballDiameter < 1) txt += "Such " + (uniball ? "a cute little pouch" : "tiny balls") + " you have!";
						else if(ballDiameter < 2) txt += "Such " + (uniball ? "a cute pouch" : "yummy balls") + " you have!";
						else if(ballDiameter < 5) txt += "Such " + (uniball ? "a big pouch" : "yummy, big balls") + " you have!";
						else if(ballDiameter < 9) txt += "Mmm, you have such " + (uniball ? "a huge pouch" : "yummy, huge balls") + "!";
						else if(ballDiameter < 15) txt += "Wow, I wonder how you can carry such " + (uniball ? "a massive pouch" : "yummy, massive balls") + " around!";
						else if(ballDiameter < 40) txt += "Are ya smuggling " + (uniball ? "a barrel" : "barrels") + " with that giant sack of yours?!";
						else txt += "Oh, gosh! I hope your " + (uniball ? "pouch isn’t" : "balls aren’t") + " backed up with baby batter or I’ll have to suck it all out of you!";
						txt += "”</i>";
					}
					if(pc.hasVagina())
					{
						txt += "\n\n";
						if(pc.hasCock() && pc.balls > 0) txt += "Finally, she";
						else if(pc.hasCock() || pc.balls > 0) txt += "Next, she";
						else txt += "She";
						txt += " moves her mass towards your [pc.vaginas].";
						
						txt += " With delicate motions, she surrounds";
						if(pc.vaginas.length == 2) txt += " both of";
						else if(pc.vaginas.length > 2) txt += " each of";
						txt += " your";
						if(pc.lust() >= 66) txt += " aroused";
						else if(pc.lust() >= 33) txt += " semi-aroused";
						else txt += " feminine";
						txt += " netherlips, pressing them together and engulfing them, as if your " + (pc.vaginas.length == 1 ? "pussy is" : "pussies are") + " participating in an erotic makeout session. <i>“Muah! Giving the girl" + (pc.vaginas.length == 1 ? "" : "s") + " a goodnight kiss before tucking " + (pc.vaginas.length == 1 ? "her" : "them") + " in if you don’t mind!”</i> With that, your " + (pc.vaginas.length == 1 ? "vagina is" : "vaginas are") + " left hidden under her silver body.";
						if(vPuffiness >= 4) txt += ".. or at least the portions that don’t bulge obscenely outward!";
						else if(vPuffiness >= 2) txt += ".. for the most part, anyway...";
					}
				}
				txt += "\n\nNow that you’ve covered your";
				if(hasGenitals && hasSlit) txt += " genitals and genital slit";
				else txt += " [pc.crotch]";
				txt += ", you feel a little less defenseless.";
				txt += "\n\n<b>Your groin is now covered!</b>";
			}
			else
			{
				txt += "\n\n<i>“" + (hasGenitals ? "Just what I wanna hear! Freedom at last!" : "Nothing to share down there, but it’s not illegal, is it?") + "”</i> [goo.name] stirs beneath you.";
				if(!crotchExposed || !hasGenitals)
				{
					txt += " With quick motion, a gap opens up at your crotch area, allowing your";
					if(!crotchExposed) txt += " clothed";
					txt += " groin to";
					if(cLength > 4 || ballDiameter >= 2 || vPuffiness >= 2) txt += " bulge out and";
					txt += " breathe. <i>“Done!”</i> she says, punctuated by a short giggle.";
				}
				else
				{
					if(pc.hasCock())
					{
						txt += "\n\nMoving some mass around, she opens up a space for your [pc.cocksNoun].";
						if(pc.lust() >= 33)
						{
							if(hasSlit)
							{
								txt += " Your genital slit is exposed to the open air, but instead of leaving it at that, the mischievous goo-girl rubs either side of the orifice, attempting to stimulate it into action. <i>“C’mon, let " + (pc.cocks.length == 1 ? "that baby" : "those babies") + " out for mama!”</i> Her attention proves successful as a reflexive response sends your ";
								if(pc.lust() < 66) txt += "semi-";
								else if(pc.lust() >= 100) txt += "incredibly ";
								txt += "erect length" + (pc.cocks.length == 1 ? "" : "s") + " springing right out, free and unrestrained. <i>“Ooo, I’d love to play peek-a-boo with you anytime, baby!”</i>";
							}
							else
							{
								txt += " Your ";
								if(pc.lust() < 66) txt += "semi-";
								else if(pc.lust() >= 100) txt += "incredibly ";
								txt += "erect length" + (pc.cocks.length == 1 ? " springs" : "s spring") + " forth, out into the open air.";
								if(cLength <= 4) txt += " <i>“Awww... such " + (pc.cocks.length == 1 ? "a cute little thing" : "cute little things") + "!”</i>";
								else if(cLength <= (pc.tallness / 4)) txt += " <i>“Yea, let " + (pc.cocks.length == 1 ? "it" : "‘em") + " all hang out, baby!”</i>";
								else if(cLength <= (pc.tallness / 3)) txt += " <i>“Wow, what have you been feeding " + (pc.cocks.length == 1 ? "it" : "them") + ", boss?”</i>";
								else if(cLength <= (pc.tallness / 2)) txt += " <i>“Release the Kraken! Rawr!”</i>";
								else txt += " <i>“Finally, I get to drop " + (pc.cocks.length == 1 ? "this anaconda" : "these anacondas") + " off! Whew!”</i>";
							}
						}
						else
						{
							if(hasSlit) txt += " Your genital slit is exposed to the open air, ready to reveal your [pc.cocks] on command. <i>“C’mon, you can let " + (pc.cocks.length == 1 ? "that baby" : "those babies") + " out for me, right?”</i> she teases.";
							else
							{
								txt += " Your flaccid length" + (pc.cocks.length == 1 ? " is" : "s are") + " exposed to the open air. <i>“";
								if(cLength <= 4) txt += "Floppy little wiener" + (pc.cocks.length == 1 ? "" : "s") + "--so cute!";
								else if(cLength <= (pc.tallness / 4)) txt += "Let me know if you want me to perk " + (pc.cocks.length == 1 ? "it" : "them") + " up, okay?";
								else if(cLength <= (pc.tallness / 3)) txt += "Woof, " + (pc.cocks.length == 1 ? "that’s" : "they’re") + " big--try not to pass out after you get a stiffy, okay?";
								else if(cLength <= (pc.tallness / 2)) txt += "Rolling out the cock carpet! Watch your step!";
								else txt += "Be careful turning around, you might trip with " + (pc.cocks.length == 1 ? "it" : "them") + " dragging on the ground like that!";
								txt += "”</i>";
							}
						}
					}
					if(pc.balls > 0)
					{
						txt += "\n\nThere is a strong pressure around your [pc.ballsack]. [goo.name] squeezes on it for a brief moment before letting go, opening up the area and letting " + (uniball ? "your uniball" : "each of your testicles") + " free. <i>“";
						if(ballDiameter < 1) txt += "You’re free, " + (uniball ? "my cute little nutsack" : "my little gonads") + "!";
						else if(ballDiameter < 2) txt += "That’s right, breathe it in! It’s fresh air!";
						else if(ballDiameter < 5) txt += "I hope that wasn’t too snug for you!";
						else if(ballDiameter < 9) txt += "My, my, " + (uniball ? "it sure outgrows its" : "they sure outgrow their") + " home fast!";
						else if(ballDiameter < 15) txt += "Like, " + (uniball ? "this is" : "these are") + " totally a travel hazard, for sure!";
						else if(ballDiameter < 40) txt += "Oof, this giant sack sure is cumbersome! It’s good to take " + (uniball ? "a" : "some") + " load off!";
						else txt += "Whew! It’s like carrying a " + (uniball ? "beanbag chair" : "bundle of beanbag chairs") + "! Well, at least I know what we can rest on if we ever get too tired!";
						txt += "”</i>";
					}
					if(pc.hasVagina())
					{
						txt += "\n\nA funny feeling reverberates around your [pc.vaginasNoun] and you hear several smacking vocalizations. Is she... is she playing with your puss" + (pc.vaginas.length == 1 ? "y" : "ies") + "? Sure enough, by pressing your vagina lips together, she is making " + (pc.vaginas.length == 1 ? "it" : "them") + " do kissy faces. Before you can speak, she stops for a second, giggles, then opens up a hole to expose your";
						if(pc.vaginas.length != 1)
						{
							if(pc.matchedVaginas())
							{
								if(vPuffiness >= 4) txt += " overly bloated,";
								else if(vPuffiness >= 2) txt += " puffy,";
								else txt += " matching,";
							}
							else if(pc.vaginas.length == 2) txt += " mismatched,";
							else txt += " mixed boquet of";
						}
						if(pc.lust() >= 66) txt += " aroused";
						else if(pc.lust() >= 33) txt += " semi-aroused";
						else txt += " feminine";
						txt += " vagina" + (pc.vaginas.length == 1 ? "" : "s") + ". <i>“You’re free! Free, my prett" + (pc.vaginas.length == 1 ? "y" : "ies") + "! Free!”</i>";
					}
				}
				
				txt += "\n\nHaving your";
				if(hasGenitals && hasSlit) txt += " genital slit and genitals visible to the public";
				else txt += " [pc.crotch] bathe in the open air";
				txt += " will certainly increase your physical appeal, but that may prove troublesome if you are in a bind.";
				txt += "\n\n<b>Your groin is now exposed!</b>";
				expose = true;
			}
			break;
		case "ass":
			var assExposed:Boolean = pc.isAssExposedByLowerUndergarment();
			var buttSize:Number = pc.buttRating();
			var assLube:Number = pc.ass.wetness();
			var donutLevel:int = pc.analPuffiness();
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
			{
				txt += "\n\n<i>“Ooo-hoo-hoo, booty, booty, booty!”</i> [goo.name] rumbles. <i>“";
				if(buttSize <= 0) txt += "Hm... you’re about as flat as a board back here, capt’n!";
				else if(buttSize <= 5) txt += "Like, you have such a cute little booty back here!";
				else if(buttSize <= 10) txt += "A decent-sized booty--good for smacking and butt-stuff!";
				else if(buttSize <= 15) txt += "Mmm... big and " + (pc.hasSoftButt() ? "soft" : "bouncy") + ", just how I like ‘em!";
				else if(buttSize <= 20) txt += "Wah! So huge and " + (pc.hasSoftButt() ? "squishy" : "huggable") + "! I’ll try my best to cover it all!";
				else txt += "Like, wow, you totes got a donk for miles! It’ll be tough to capture such a majestic beauty!";
				txt += "”</i>";
				if(!assExposed) txt += " With one quick motion, she drapes your backside and covers up any exposed gaps.";
				else
				{
					txt += " After covering your buttcheeks, her mass makes its way toward your [pc.asshole]. <i>“";
					if(donutLevel >= 5) txt += "Whoa, look at this monster! Uh, I guess it would be hard to miss... You must really, </i>really<i> like donuts, huh?";
					else if(donutLevel >= 4) txt += "Would ya look at that fatty. I’ll have to give this big donut a ride later!";
					else if(donutLevel >= 3) txt += "This pucker is really soft and puffy, I could squeeze it for days!";
					else if(donutLevel >= 2) txt += "Your pucker is so soft and squishy" + (pc.hasPlumpAsshole() ? "--like a donut" : "! Yum") + "!";
					else if(donutLevel >= 1) txt += "A little soft and plump--I like it!";
					else txt += "A cutie of a pucker you have here, [pc.name]!";
					txt += "”</i> she says, before giving it a pinch";
					if(assLube >= 2) txt += ", resulting in a " + (assLube >= 4 ? "gush" : "bit") + " of lubricant squirting out,";
					txt += " and finally enveloping your backdoor with her silvery surface.";
				}
				txt += "\n\nPatching up that area makes you feel protected, especially from incoming penetrative attacks.";
				txt += "\n\n<b>Your asshole is now covered!</b>";
			}
			else
			{
				txt += "\n\n<i>“Opening the back door, huh? That’s easy peasy!”</i> [goo.name] squeaks. The goo girl tightly squeezes your rear and releases while creating an opening in the back of the suit. She then produces a rolled tendril with the excess and shoots you a playful <i>SMACK!</i>";
				txt += "\n\nOuch!";
				txt += "\n\nThe silvery suit just giggles as your cheeks";
				if(buttSize <= 0) txt += " shake and recover";
				else if(buttSize <= 5) txt += " jostle and quiver";
				else if(buttSize <= 15) txt += " " + (pc.hasSoftButt() ? "jiggle and jump" : "bounce and flex");
				else if(buttSize <= 20) txt += " clap and " + (pc.hasSoftButt() ? "reverberate like jello" : "bounce ubruptly");
				else txt += " " + (pc.hasSoftButt() ? "produce oceanic waves and jiggle uncontrollably" : "quake and rebound like rubber");
				txt += ", and your [pc.asshole]";
				if(assLube >= 6) txt += " gushes lube and";
				else if(assLube >= 4) txt += " squirts lube and";
				else if(assLube >= 2) txt += " drips lube and";
				txt += " dialates, from the surprise whipping. <i>“That’s what happens when you expose yourself to the elements!”</i>";
				txt += "\n\nWhile this allows others to admire your [pc.butts], it removes a significant amount of armor to do so, giving easier access to your " + (!silly ? "butthole" : "heinie-hole") + "!";
				txt += "\n\n<b>Your asshole is now exposed!</b>";
				expose = true;
			}
			break;
	}
	
	if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT) && expose) txt += " The exposure also claims your suit’s ability to be fully sealed.";
	
	gooArmorChangePart(toggle, expose);
	
	if(airtight != pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT))
	{
		if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT)) txt += " <b>Your suit is now airtight!</b>";
		else txt += " <b>Your suit is no longer airtight!</b>";
	}
	
	txt += "\n\n" + gooArmorDetails(true);
	gooArmorOutput(fromCrew, txt);
	
	processTime(2);
	gooArmorChangeArmorMenu(fromCrew);
}
public function gooArmorChangeDesign(arg:Array):void
{
	var toggle:String = arg[0];
	var fromCrew:Boolean = arg[1];
	var txt:String = "";
	var btn:Number = 0;
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	showGrayGooArmor();
	gooArmorClearMenu(fromCrew);
	
	switch(toggle)
	{
		case "style":
			txt += "<i>“" + (pc.statusEffectv1("Goo Armor Design") == 0 ? "Ah, looking for a specific style" : "So, what style would you like your suit to have") + "?”</i>";
			
			if(pc.statusEffectv1("Goo Armor Design") != 0) gooArmorAddButton(fromCrew, btn++, "None", gooArmorChangeStyle, [0, fromCrew], "No Style", "Remove the suit’s current appearance.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "None");
			if(pc.statusEffectv1("Goo Armor Design") != 1) gooArmorAddButton(fromCrew, btn++, "L.Armor", gooArmorChangeStyle, [1, fromCrew], "Light Armor", "Change the suit’s appearance to look like light armor.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "L.Armor");
			if(pc.statusEffectv1("Goo Armor Design") != 2) gooArmorAddButton(fromCrew, btn++, "H.Armor", gooArmorChangeStyle, [2, fromCrew], "Heavy Armor", "Change the suit’s appearance to look like heavy armor.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "H.Armor");
			if(pc.statusEffectv1("Goo Armor Design") != 3) gooArmorAddButton(fromCrew, btn++, "Clothes", gooArmorChangeStyle, [3, fromCrew], "Clothing", "Change the suit’s appearance to look like normal clothing.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "Clothes");
			if(pc.statusEffectv1("Goo Armor Design") != 4) gooArmorAddButton(fromCrew, btn++, "Latex", gooArmorChangeStyle, [4, fromCrew], "Latex", "Change the suit’s appearance to look like tight latex.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "Latex");
			if(flags["GOO_ARMOR_SWIMSUIT"] == undefined) gooArmorAddDisabledButton(fromCrew, btn++, "Locked", "Locked", "[goo.name] hasn’t learned how to do this yet..." + (pc.level < 4 ? " She may be more confident if you are a higher level." : " Maybe try talking to her while" + (InRoomWithFlag(GLOBAL.POOL) ? "" : " at a pool and") + " wearing an outfit made for swimming?"));
			else if(pc.statusEffectv1("Goo Armor Design") != 5)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Swimwear", "Swimwear", "[goo.name]’s defense is too low to change into swimwear.");
				else gooArmorAddButton(fromCrew, btn++, "Swimwear", gooArmorChangeStyle, [5, fromCrew], "Swimwear", "Change the suit’s appearance to look like something you can swim in.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Swimwear");
			if(pc.statusEffectv1("Goo Armor Design") != 6) gooArmorAddButton(fromCrew, btn++, "ExoSuit", gooArmorChangeStyle, [6, fromCrew], "Exo Suit", "Change the suit’s appearance to look like an armored exoskeleton.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "ExoSuit");
			break;
		case "pattern":
			txt += "<i>“" + (pc.statusEffectv2("Goo Armor Design") == 0 ? "Ooh, I love patterns!" : "Wanna make your suit look pretty?") + "”</i>";
			
			if(pc.statusEffectv2("Goo Armor Design") != 0) gooArmorAddButton(fromCrew, btn++, "None", gooArmorChangePattern, [0, fromCrew], "No Pattern", "Remove the suit’s current pattern.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "None");
			if(pc.statusEffectv2("Goo Armor Design") != 1) gooArmorAddButton(fromCrew, btn++, "Hexagon", gooArmorChangePattern, [1, fromCrew], "Hexagonal Tiles", "Change the suit’s pattern to look like hexagonal tiles.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "Hexagon");
			if(pc.statusEffectv2("Goo Armor Design") != 2) gooArmorAddButton(fromCrew, btn++, "Trim", gooArmorChangePattern, [2, fromCrew], "Silver Trim", "Change the suit’s pattern to have a silvery trim on the edges.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "Trim");
			if(pc.statusEffectv2("Goo Armor Design") != 3) gooArmorAddButton(fromCrew, btn++, "Circuits", gooArmorChangePattern, [3, fromCrew], "Circuits", "Change the suit’s pattern to look like a printed circuit board.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "Circuits");
			if(pc.statusEffectv2("Goo Armor Design") != 4) gooArmorAddButton(fromCrew, btn++, "Lines", gooArmorChangePattern, [4, fromCrew], "Linear Markings", "Change the suit’s pattern to look like linear markings.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "Lines");
			break;
		case "emblem":
			if(pc.getStatusTooltip("Goo Armor Design") == "" || pc.getStatusTooltip("Goo Armor Design") == "none") txt += "<i>“You want an emblem, huh? Is that like a tattoo?”</i>";
			else txt += "<i>“Represent!”</i>";
			
			gooArmorEmblemMenu([fromCrew, 0]);
			break;
		case "helmet":
			txt += "<i>“" + (pc.statusEffectv3("Goo Armor Design") == 0 ? "Would you like a helmet" : "Wanna change your helmet") + "?”</i>";
			
			if(pc.statusEffectv3("Goo Armor Design") != 0) gooArmorAddButton(fromCrew, btn++, "None", gooArmorChangeHelmet, [0, fromCrew], "No Helmet", "Remove the suit’s helmet.");
			else gooArmorAddDisabledButton(fromCrew, btn++, "None");
			if(pc.statusEffectv3("Goo Armor Design") != 1)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Stylish", "Stylish Helmet", "[goo.name]’s defense is too low to apply a helmet.");
				else gooArmorAddButton(fromCrew, btn++, "Stylish", gooArmorChangeHelmet, [1, fromCrew], "Stylish Helmet", "Change the suit’s helmet to look like head gear worn by a snazzy spacer.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Stylish");
			if(pc.statusEffectv3("Goo Armor Design") != 2)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Fierce", "Intimidating Helmet", "[goo.name]’s defense is too low to apply a helmet.");
				else gooArmorAddButton(fromCrew, btn++, "Fierce", gooArmorChangeHelmet, [2, fromCrew], "Intimidating Helmet", "Change the suit’s helmet to look menacing to your opponents.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Fierce");
			if(pc.statusEffectv3("Goo Armor Design") != 3)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Retro", "Bubble Helmet", "[goo.name]’s defense is too low to apply a helmet.");
				else gooArmorAddButton(fromCrew, btn++, "Retro", gooArmorChangeHelmet, [3, fromCrew], "Bubble Helmet", "Change the suit’s helmet to look like something that came from the ancient terran gray-toned films.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Retro");
			if(pc.statusEffectv3("Goo Armor Design") != 4)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Mystery", "Mysterious Mask", "[goo.name]’s defense is too low to apply a helmet.");
				else gooArmorAddButton(fromCrew, btn++, "Mystery", gooArmorChangeHelmet, [4, fromCrew], "Mysterious Mask", "Change the suit’s helmet to look like a mirrored mask and keep your face anonymous.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Mystery");
			if(pc.statusEffectv3("Goo Armor Design") != 5)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Cute", "Animal Ears", "[goo.name]’s defense is too low to apply a helmet.");
				else gooArmorAddButton(fromCrew, btn++, "Cute", gooArmorChangeHelmet, [5, fromCrew], "Animal Ears", "Change the suit’s helmet to appear non-hostile and topped with adorable animal ears.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Cute");
			if(pc.statusEffectv3("Goo Armor Design") != 6)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Combat", "Military Helmet", "[goo.name]’s defense is too low to apply a helmet.");
				else gooArmorAddButton(fromCrew, btn++, "Combat", gooArmorChangeHelmet, [6, fromCrew], "Military Helmet", "Change the suit’s helmet to mimic the features of military-issue combat headgear.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Combat");
			if(pc.statusEffectv3("Goo Armor Design") != 7)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Tricorn", "Triangular Helmet", "[goo.name]’s defense is too low to apply a helmet.");
				else gooArmorAddButton(fromCrew, btn++, "Tricorn", gooArmorChangeHelmet, [7, fromCrew], "Triangular Helmet", "Change the suit’s helmet to resemble a shape similar to a tricorn hat.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Tricorn");
			if(pc.statusEffectv3("Goo Armor Design") != 8)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Knightly", "Knight’s Helmet", "[goo.name]’s defense is too low to apply a helmet.");
				else gooArmorAddButton(fromCrew, btn++, "Knightly", gooArmorChangeHelmet, [8, fromCrew], "Knight’s Helmet", "Change the suit’s helmet to appear like a knight of medieval lore.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Knightly");
			if(pc.statusEffectv3("Goo Armor Design") != 9)
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Roguish", "Rogue’s Hood", "[goo.name]’s defense is too low to apply a helmet.");
				else gooArmorAddButton(fromCrew, btn++, "Roguish", gooArmorChangeHelmet, [9, fromCrew], "Rogue’s Hood", "Change the suit’s helmet to be one covered in a rogue-like hood.");
			}
			else gooArmorAddDisabledButton(fromCrew, btn++, "Roguish");
			break;
		case "expose":
			txt += "Which part of your suit do you want to change?";
			
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
				gooArmorAddButton(fromCrew, btn++, "Chest", gooArmorChangeArmor, ["chest", fromCrew], "Cover Chest", "Ask to modify the suit to cover your chest.");
			else
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Chest", "Expose Chest", "[goo.name] does not have enough armor to do this!");
				else gooArmorAddButton(fromCrew, btn++, "Chest", gooArmorChangeArmor, ["chest", fromCrew], "Expose Chest", "Ask to modify the suit to expose your chest.");
			}
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
				gooArmorAddButton(fromCrew, btn++, "Crotch", gooArmorChangeArmor, ["crotch", fromCrew], "Cover Crotch", "Ask to modify the suit to cover your crotch.");
			else
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Crotch", "Expose Crotch", "[goo.name] does not have enough armor to do this!");
				else gooArmorAddButton(fromCrew, btn++, "Crotch", gooArmorChangeArmor, ["crotch", fromCrew], "Expose Crotch", "Ask to modify the suit to expose your crotch.");
			}
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
				gooArmorAddButton(fromCrew, btn++, "Ass", gooArmorChangeArmor, ["ass", fromCrew], "Cover Ass", "Ask to modify the suit to cover your ass.");
			else
			{
				if(pc.armor.defense < 2) gooArmorAddDisabledButton(fromCrew, btn++, "Ass", "Expose Ass", "[goo.name] does not have enough armor to do this!");
				else gooArmorAddButton(fromCrew, btn++, "Ass", gooArmorChangeArmor, ["ass", fromCrew], "Expose Ass", "Ask to modify the suit to expose your ass.");
			}
			break;
	}
	
	txt += "\n\n" + gooArmorDetails(true);
	gooArmorOutput(fromCrew, txt);
	
	gooArmorAddButton(fromCrew, 14, "Back", gooArmorChangeArmorMenu, fromCrew);
}
public function gooArmorEmblemMenu(arg:Array):void
{
	var fromCrew:Boolean = arg[0];
	var offset:int = arg[1];
	
	gooArmorClearMenu(fromCrew);
	
	var i:int = 0;
	var btnSlot:int = 0;
	var emblemList:Array = [
		["None", "none"],
		["BI/G", "Bell-Isle/Grunmann patch"],
		["Steele", "Steele Tech logo"],
	];
	
	// Push other emblems in the list for unlocking!
	
	if(CodexManager.entryViewed("Aegis")) emblemList.push(["Aegis", "Aegis logo"]);
	if(CodexManager.entryViewed("Camarilla")) emblemList.push(["Camarilla", "Camarilla patch"]);
	//Humphard cut.
	//if(CodexManager.entryViewed("Humphard Inc.")) emblemList.push(["Humphard", "Humphard Inc. logo"]);
	if(CodexManager.entryViewed("J’ejune")) emblemList.push(["J’ejune", "J’ejune logo"]);
	if(CodexManager.entryViewed("JoyCo")) emblemList.push(["JoyCo", "JoyCo logo"]);
	if(CodexManager.entryViewed("KihaCorp")) emblemList.push(["KihaCorp", "KihaCorp logo"]);
	if(CodexManager.entryViewed("Nova Securities")) emblemList.push(["Nova Sec.", "Nova Securities logo"]);
	if(CodexManager.entryViewed("Pyrite")) emblemList.push(["Pyrite", "Pyrite Industries logo"]);
	if(CodexManager.entryViewed("Reaper")) emblemList.push(["Reaper", "Reaper Armaments logo"]);
	if(CodexManager.entryViewed("RhenWorld")) emblemList.push(["RhenWorld", "RhenWorld logo"]);
	if(CodexManager.entryViewed("Snugglé")) emblemList.push(["Snugglé", "Snugglé logo"]);
	if(CodexManager.entryViewed("Xenogen")) emblemList.push(["Xenogen", "Xenogen Biotech logo"]);
	
	if(CodexManager.entryViewed("Black Void")) emblemList.push(["Black Void", "Black Void patch"]);
	if(CodexManager.entryViewed("J.A.F.")) emblemList.push(["J.A.F.", "Joint Ausar Federation patch"]);
	if(CodexManager.entryViewed("Gilden Republic")) emblemList.push(["Gilden Rep.", "Gilden Republic patch"]);
	if(CodexManager.entryViewed("Scarlet Federation")) emblemList.push(["Scarlet Fed.", "Scarlet Federation patch"]);
	if(CodexManager.entryViewed("T.S.C.")) emblemList.push(["T.S.C.", "Terran Space Coalition patch"]);
	if(CodexManager.entryViewed("U.G.C.")) emblemList.push(["U.G.C.", "United Galactic Confederacy patch"]);
	
	for(i = (fromCrew ? 0 : offset); i < (fromCrew ? emblemList.length : (offset + 10)); i++)
	{
		if(!fromCrew && i >= emblemList.length) break;
		if(fromCrew && btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			gooArmorAddButton(fromCrew, btnSlot, "Back", gooArmorChangeArmorMenu, fromCrew);
			btnSlot++;
		}
		
		if(pc.getStatusTooltip("Goo Armor Design") != emblemList[i][1]) gooArmorAddButton(fromCrew, btnSlot, emblemList[i][0], gooArmorChangeEmblem, [emblemList[i][1], fromCrew], StringUtil.toDisplayCase(emblemList[i][1]), (emblemList[i][1] == "none" ? "Remove the current emblem." : "Change the emblem to " + indefiniteArticle(emblemList[i][1]) + "."));
		else gooArmorAddDisabledButton(fromCrew, btnSlot, emblemList[i][0]);
		btnSlot++;
		
		if(fromCrew && emblemList.length > 14 && (i + 1) == emblemList.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			gooArmorAddButton(fromCrew, btnSlot, "Back", gooArmorChangeArmorMenu, fromCrew);
		}
		if(!fromCrew)
		{
			if(offset >= 10) gooArmorAddButton(fromCrew, 10, "Prev Pg.", gooArmorEmblemMenu, [fromCrew, (offset - 10)], "Previous Page", "View more emblems.");
			if(offset + 10 < emblemList.length) gooArmorAddButton(fromCrew, 12, "Next Pg.", gooArmorEmblemMenu, [fromCrew, (offset + 10)], "Next Page", "View more emblems.");
		}
	}
	
	gooArmorAddButton(fromCrew, 14, "Back", gooArmorChangeArmorMenu, fromCrew);
}
public function gooArmorChangeStyle(arg:Array):void
{
	var style:int = arg[0];
	var fromCrew:Boolean = arg[1];
	var txt:String = "";
	var airtight:String = "";
	var swimwear:String = "";
	var partList:Array = [];
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	showGrayGooArmor();
	
	txt += "<i>“" + (rand(2) == 0 ? "No problem!" : "Okay, I’ll try my best!") + "”</i>";
	if(style != 0)
	{
		txt += " [goo.name]";
		if(pc.statusEffectv1("Goo Armor Design") != 0) txt += " reshapes herself around you until the suit is completely featureless, then she prepares";
		else txt += " prepares herself";
		txt += " to make changes based on your suggestion.";
		processTime(3);
	}
	else processTime(1);
	
	switch(style)
	{
		case 0:
			txt += " Without much effort, [goo.name] alters her shape until your outfit becomes the usual shape, with no specific features that really stand out.";
			break;
		case 1:
			txt += " Small plates, straps, and other ornaments form around your suit, making you appear to be fully prepared for anything. Although you know it doesn’t change the armor rating in the least, it still looks pretty cool.";
			txt += "\n\n<i>“Yep, I think it looks pretty cool, too!”</i> the voice emanating from your belly agrees.";
			break;
		case 2:
			txt += " Large pieces of armor flare out from your suit, giving you a bulkier look. Huge pauldrons and arm guards form at your sides";
			if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) txt += ", and " + (pc.bRows() == 1 ? "a" : num2Text(pc.bRows())) + " breastplate" + (pc.bRows() == 1 ? "" : "s") + " at your front";
			txt += ", adding to the size. Although you know it doesn’t change the armor rating at all, from afar, it makes you appear to be some kind of knight or tank" + (silly ? "... or a tank-knight" : "") + ".";
			txt += "\n\n<i>“Space marines, eat your heart out!”</i> exclaims your tummy.";
			break;
		case 3:
			txt += " Natural-looking seams and folds appear on your suit, the texture dulling a bit to simulate the look of your favorite fabric. The goo travels across your body";
			if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
			{
				if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST)) txt += ", " + (pc.hasBreasts() ? "breasts" : "chest");
				if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) txt += ", crotch";
				if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) txt += ", ass";
			}
			txt += " and wraps your limbs in faux-cloth material.";
			txt += "\n\n<i>“Is this casual enough for you?”</i> asks your midriff.";
			break;
		case 4:
			txt += " The suit’s silvery surface becomes extra glossy, simulating the texture of latex. All over your body, the goo compresses and constricts, making the plastic appearance more convincing.";
			if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL))
			{
				if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST)) txt += " It tightens over your " + (pc.biggestTitSize() >= 3 ? "breasts, pressing your jugs close to your chest, yet keeping them in their own snuggly-fitting cups" : "chest, accentuating its form") + ".";
				if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN))
				{
					txt += " Your crotch is sealed in tightly";
					if(pc.hasGenitals() || (pc.balls > 0 && pc.ballSize() > 3))
					{
						txt += ", leaving behind a visible ";
						var bulges:int = pc.cockTotal();
						if(pc.ballSize() > 3) bulges += pc.balls;
						if(bulges > 0) txt += (bulges == 1 ? "bulge" : (bulges == 2 ? "pair" : "set") + " of bulges");
						else txt += (pc.totalVaginas() == 1 ? "camel toe" : (pc.totalVaginas() == 2 ? "pair" : "set") + " of camel toes");
					}
					if(pc.libido() > 50) txt += "--and a zipper forms below, just for the added lewdness";
					txt += ".";
				}
				if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) txt += " Like some kind of lewd binding, the latex-goo tightens around your [pc.butts], keeping them nicely packed together.";
			}
			else txt += " It leaves all of your sensitive bits exposed however, like some kind of fetishized catsuit.";
			txt += "\n\n<i>“Oh, [pc.name], you look so sexy right now...”</i> comments your tummy.";
			break;
		case 5:
			txt += " The body suit’s surface shrinks on your torso, the sleeves";
			if(pc.getStatusTooltip("Goo Armor Design") == "" || pc.getStatusTooltip("Goo Armor Design") == "none")
			{
				if(pc.statusEffectv3("Goo Armor Design") != 0) txt += ",";
				else txt += " and";
				txt += " emblems";
			}
			if(pc.statusEffectv3("Goo Armor Design") != 0)
			{
				txt += " and helmet";
				if(pc.getStatusTooltip("Goo Armor Design") == "" || pc.getStatusTooltip("Goo Armor Design") == "none") txt += ", all";
			}
			txt += " disappearing. Not soon after,";
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
			{
				txt += " by leaving your";
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) partList.push(pc.hasBreasts() ? "breasts" : "chest");
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) partList.push("crotch");
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL)) partList.push("ass");
				if(partList.length > 0) txt += " " + CompressToList(partList) + ",";
				txt += " arms and " + (pc.legCount == 1 ? "[pc.legNoun]" : "[pc.legsNoun]") + " exposed,";
			}
			else txt += " by keeping your arms and " + (pc.legCount == 1 ? "[pc.legNoun]" : "[pc.legsNoun]") + " uncovered,";
			txt += " your armor looks more suitable for swimming in.";
			txt += "\n\n<i>“Beach day or pool party?”</i> your tummy eagerly asks.";
			break;
		case 6:
			author("Zavos");
			txt += " Countless segments of plating emerge from the silver mass, covering your body in a form-fitting lattice of armoring. As you twist to inspect your new appearance, you see the sections shift seamlessly with your movements";
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS))
			{
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST)) partList.push(pc.hasBreasts() ? "breasts" : "chest");
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) partList.push("crotch");
				if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) partList.push("ass");
				txt += ", with";
				if(partList.length == 1) txt += " a tasteful opening that keeps";
				else txt += " tasteful openings that keep";
				txt += " your";
				if(partList.length > 0) txt += " " + CompressToList(partList);
				else txt += " assets";
				txt += " on display";
			}
			txt += "."; 
			txt += "\n\n<i>“Bet you look awesome, like some";
			if(pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN) || pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS)) txt += " slutty";
			else txt += " sexy";
			txt += " secret agent!”</i> your midriff comments.";
			break;
		default:
			txt += " Ripples of change shoot across it and the suit shifts and morphs gradually, getting closer and closer to the design you have chosen. Of course it isn’t a perfectly matching duplicate, given that [goo.name] has added her own touches, but it’s pretty darn close enough.";
			txt += "\n\n<i>“Aaaand finished!”</i> announces the voice coming from your middle.";
			break;
	}
	
	pc.setStatusValue("Goo Armor Design", 1, style);
	swimwear = gooArmorCheckSwimwear();
	airtight = gooArmorCheckAirtight();
	
	if(swimwear.length > 0) txt += "\n\n" + swimwear;
	if(airtight.length > 0) txt += "\n\n" + airtight;
	
	txt += "\n\n" + gooArmorDetails(true);
	gooArmorOutput(fromCrew, txt);
	
	gooArmorChangeArmorMenu(fromCrew);
}
public function gooArmorChangePattern(arg:Array):void
{
	var style:int = arg[0];
	var fromCrew:Boolean = arg[1];
	var txt:String = "";
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	showGrayGooArmor();
	
	txt += "<i>“" + (rand(2) == 0 ? "Alrighty!" : "Gotcha. Here goes!") + "”</i>";
	if(style != 0)
	{
		txt += " [goo.name]";
		if(pc.statusEffectv2("Goo Armor Design") != 0) txt += " wipes the previous pattern and";
		txt += " wriggles a bit in preperation.";
		processTime(3);
	}
	else processTime(1);
	
	switch(style)
	{
		case 0:
			txt += " [goo.name] doesn’t even wriggle and the pattern you had decorating your suit quickly vanishes.";
			break;
		case 1:
			txt += " One by one, lines draw hexagonal tiles on certain parts of your suit, giving it a very modern flavor.";
			break;
		case 2:
			txt += " Like a marker, polished silver trim is drawn along the edges of your suit, giving it an elegant yet simple look.";
			break;
		case 3:
			txt += " Lines of silver are drawn on your suit, bending in angles and ending either off the edge or capped with a dot or circle shape. This circuit board pattern makes your suit look very tech-oriented.";
			break;
		case 4:
			txt += " " + (pc.armor.hasFlag(GLOBAL.ITEM_FLAG_SWIMWEAR) ? "L" : "Emanating from the collar, l") + "ines are drawn downward and across certain anatomical seams along your suit, segmenting it into major portions yet still retaining the one-piece look.";
			break;
		default:
			txt += " Gradually, the new pattern you requested emerges on the surface of the suit until your suit is covered in the new design.";
			break;
	}
	
	pc.setStatusValue("Goo Armor Design", 2, style);
	
	txt += "\n\n" + gooArmorDetails(true);
	gooArmorOutput(fromCrew, txt);
	
	gooArmorChangeArmorMenu(fromCrew);
}
public function gooArmorChangeEmblem(arg:Array):void
{
	var style:String = arg[0];
	var fromCrew:Boolean = arg[1];
	var txt:String = "";
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	showGrayGooArmor();
	
	if(style == "Bell-Isle/Grunmann patch")
	{
		txt += "[goo.name]’s head pops from you, <i>“So what’ll it be?”</i>";
		txt += "\n\nYou ask if she can give you a Bell-Isle/Grunmann patch to go along with your suit.";
		txt += "\n\n<i>“Oh, that’s easy, peasy... Just watch!”</i> In an instant, the recognizable logo is etched onto your armor, one on each shoulder. Looks like she knows that one pretty well!";
		processTime(1);
	}
	else if(style != "none")
	{
		txt += "[goo.name]’s head pops from you, <i>“Sure, whatcha got there?”</i>";
		txt += "\n\nYou press a button on your " + (InShipInterior() ? "dash to display" : "codex to project") + " the " + style + " and let her view it for a moment.";
		txt += "\n\n[goo.name] makes some concentrating noises, storing the details in her memory. When she’s confident she has it, she confirms, <i>“Got it!”</i>";
		txt += "\n\nIt takes a little time, but she manages to get the design printed, one on each shoulder.";
		processTime(3);
	}
	else
	{
		txt += "<i>“Aw, okay!”</i> Removing the " + pc.getStatusTooltip("Goo Armor Design") + " on your shoulders is as easy as blinking for [goo.name]. When she finishes, she exclaims, <i>“There! All done!”</i>";
		processTime(1);
	}
	
	pc.setStatusTooltip("Goo Armor Design", style);
	
	txt += "\n\n" + gooArmorDetails(true);
	gooArmorOutput(fromCrew, txt);
	
	gooArmorChangeArmorMenu(fromCrew);
}
public function gooArmorChangeHelmet(arg:Array):void
{
	var style:int = arg[0];
	var fromCrew:Boolean = arg[1];
	var txt:String = "";
	var airtight:String = "";
	
	gooArmorClearOutput(fromCrew);
	author("Jacques00");
	showGrayGooArmor();
	
	txt += "<i>“" + (rand(2) == 0 ? "Okay, I’m on it!" : "Let’s see here...") + "”</i>";
	if(style != 0)
	{
		txt += " [goo.name] quickly engulfs your head with her gooey matter. Your vision is eclipsed in black for a few seconds before the microbots blocking your eyes begin to clear up, creating a transparent layer and allowing you to see your reflection in the mirror.";
		processTime(3);
	}
	else processTime(1);
	
	switch(style)
	{
		case 0:
			txt += " The helmet on your head quickly opens opens up and rapidly dissolves, melding back into the suit from which it came. After making some final aesthetic adjustments, [goo.name] squeals in approval. <i>“Now just remember to be careful out there!”</i>";
			break;
		case 1:
			txt += "\n\nThe surface of your new head gear becomes more defined until it changes into something similar to a sports speeder’s helmet, but with some noticeable accents. Something tells you that if [goo.name] wasn’t completely silver-gray, the surface would be colored bright pink and decked with heart-shaped stickers.";
			txt += "\n\n<i>“How do you like that? Nice and stylish!”</i>";
			break;
		case 2:
			txt += "\n\nThe helmet’s form twists and shifts, with edges and sharp points appearing across its surface. The viewable area narrows until your reflection shows that it has become a linear slit masking your eyes. The helmet itself is flush with the shape of your head, allowing it to move in sync without wobbling. In the right lighting, at the right angle, you can almost see a piercing glow emanating from your eye slit.";
			txt += "\n\n<i>“Ooh, yeah. Now you look super scary!”</i>";
			break;
		case 3:
			txt += "\n\nThe entire dome inflates into a spherical shape, forming a very distinctive bubble that steadily continues to grow larger. When it reaches the approriate size for you, the rest of the orb’s silvery gray tint dissolves away, leaving behind a glass-like surface. You exprimentally tap it a few times and determine that it sounds very much like glass too--and hopefully a lot more durable!";
			txt += "\n\n<i>“Is this how ancient spacers looked? I like it!”</i>";
			break;
		case 4:
			txt += "\n\nThe helmet’s surface smoothes out and warps to match the dimensions of your head, then the transparency re-shades itself in a silver, reflexive film - painting the entire front to form a smooth, featureless mask. No one can see your face even though you can see through it just fine. This definitely gives you a very anonymous appearance.";
			txt += "\n\n<i>“Ooo, mysterious!”</i>";
			break;
		case 5:
			txt += "\n\nThe headgear’s surface molds into a shape that looks very similar to a round hoverbike helmet, complete with its own flip visor, and fits snugly with your head. At the top, two blobs protrude from the surface. They reshape to form a pair of large, triangular animal ears, like those belonging to a cat or fennec-like creature.";
			txt += "\n\n<i>“Aw, that makes you look like such a cutie!”</i>";
			break;
		case 6:
			txt += "\n\nThe mass around the helmet reshapes itself into a more blocky shape, yet retaining some familiar curvature. A tough-looking visor and an obvious mouthguard form in the front while a slight cap tops the frame and thick ear shells cover the sides, making the headgear appear in line with standard military wear. After a few adjustments, the final design looks like it can take a good beating but remain intact.";
			txt += "\n\n<i>“Like, do you wanna live forever?! Ooh-rah!”</i>";
			break;
		case 7:
			txt += "\n\nThe silvery blob splits and forms into two pointed pieces, one below your lower jaw and the other above your head, looking very much like a shark or bird maw--and, like the mouth of a beast, the “jaw” closes around your head, flattening and reshaping as it goes, the corners polarized at three distinct points. When finished, the helmet gives off the illusion that you are wearing a tricorn hat, closed off by a large collar under your chin.";
			txt += "\n\n<i>“Cool, you look kinda like a pirate now!”</i>";
			break;
		case 8:
			txt += "\n\nThe silver surface of the new helmet begins to split and form separate plates of armor. The plates move and position themselves around your head, creating a regal, crown-like shape at the top and leaving a “Y”-shaped gap as a primary slit for your eyes.";
			txt += "\n\n<i>“I hereby dub thee, Knight of Steele!”</i>";
			break;
		case 9:
			txt += "\n\nThe helmet then forms a cloth-shaped piece that extends in front of you, draping over your head, falling to the sides, and resting atop your shoulders, resulting in a very rogue-like hood. The inside of the helmet is covered in shadow when you are in the right light.";
			txt += "\n\n<i>“Hoodies like this are in style, right?”</i>";
			break;
		default:
			txt += "\n\nThe blob shifts and changes to the desired shape you suggested. You find that [goo.name] pays very close attention to detail, even though she gets carried away with her own unique flourishes. When all is said and done, you find that your suit now possesses a newly designed helmet.";
			txt += "\n\n<i>“There ya go and I hope you like it!”</i>";
			break;
	}
	if(style != 0) txt += " She then retracts the helmet back so you can breathe the unfiltered air again. She’ll have your new helmet ready again when you need it most.";
	
	pc.setStatusValue("Goo Armor Design", 3, style);
	airtight = gooArmorCheckAirtight();
	
	if(airtight.length > 0) txt += "\n\n" + airtight;
	
	txt += "\n\n" + gooArmorDetails(true);
	gooArmorOutput(fromCrew, txt);
	
	gooArmorChangeArmorMenu(fromCrew);
}

// Cleaning blurbs
public function gooArmorAutoCleanBlurb(slurpArea:String = "skin", amountVented:Number = 0, fluidType:int = -1):String
{
	var txt:String = "";
	var fluidNoun:String = (fluidType >= 0 ? pc.fluidNoun(fluidType) : "sexual effluvia");
	
	if(slurpArea == "skin" && amountVented >= 500 && !pc.hasStatusEffect("Goo Armor Auto-Clean Message"))
	{
		// Maybe a 2-day cooldown before playing again
		pc.createStatusEffect("Goo Armor Auto-Clean Message", 0, 0, 0, 0, true, "", "", false, 2880);
		
		txt += "<i>“Oooh, you got <b>covered</b>, didn’t you!?”</i> [goo.name] giggles, wobbling excitedly all around you. <i>“Don’t worry, I’ll clean you aaaaall up.!”</i>";
		txt += "\n\nShe vibrates rapidly all over your body, absorbing all the " + fluidNoun + " that’s slathered you during your latest misadventures. Within the span of a few moments, she has you glistening in the light, as fresh and clean as the day you first departed on your quest. [goo.name] feels a bit heavier and thicker around you, but the weight soon settles in like a natural heavy coat. <i>“All done!”</i> she purrs, wiggling around your loins. <i>“Off to the next adventure!”</i>";
		
		return ParseText(txt);
	}
	
	var slurps:Array = [];
	
	for(var i:int = 0; i < 6; i++)
	{
		txt = "";
		if(slurpArea == "cunt") txt += "Before a trickle flows from your [pc.vaginas], y";
		else if(slurpArea == "butt") txt += "Before a drop exits your anus, y";
		else txt += "Y";
		txt += "ou feel your armor vibrating excitedly";
		if(slurpArea == "cunt") txt += " near your vaginal area";
		else if(slurpArea == "butt") txt += " between your [pc.butts]";
		else txt += " all around you";
		txt += ". <i>“";
		switch(i) {
			case 0: txt += "Ohh, you" + (slurpArea == "skin" ? " really got <b>covered</b> didn’t ya" : "’re really <b>dripping</b> aren’t ya") + "? Don’t worry, I’ll clean up!"; break;
			case 1: txt += "Wow, " + (slurpArea == "skin" ? "what a smell" : "I sense something tasty") + "! It’s soooo hot. Lemme slurp it all up!"; break;
			case 2: txt += "Oh wow, that’s a lotta juice. It’s like you got me a million presents!"; break;
			case 3: txt += "You’re so messy! What’d you... ohh, that smells good... lemme lick it up?"; break;
			case 4: txt += "Yaaaaay, " + ((fluidNoun.indexOf("cum") != -1 || fluidNoun.indexOf("milk") == -1) ? "cummies" : "milkies") + "!"; break;
			case 5: txt += "Aww, somebody had some fun. Let me get you cleaned up for the next round!"; break;
		}
		txt += "”</i> <b>[goo.name] has cleaned you of";
		if(slurpArea != "skin") txt += " some";
		txt += " " + fluidNoun + ".</b>";
		slurps.push(txt);
	}
	
	return ParseText(RandomInCollection(slurps));
}
public function gooArmorAutoSuckBlurb(suckHole:String = "butt", amountVented:Number = 0, fluidType:int = -1):String
{
	var txt:String = "";
	var fluidDesc:String = (fluidType >= 0 ? pc.fluidDescript(fluidType) : "sexual effluvia");
	
	txt += "Silver tendrils emit from your body and shoot up your";
	if(suckHole == "both" || suckHole == "butt") txt += " [pc.asshole]";
	if(suckHole == "both") txt += " and";
	if(suckHole == "both" || suckHole == "cunt") txt += " [pc.vaginas]";
	txt += " accompanied by an excited giggle from your [pc.belly].";
	if(amountVented <= 500) txt += " Small";
	else if(amountVented <= 2000) txt += " Sizeable";
	else txt += " Large";
	txt += " bulges form along the tentacles that pulse and flow across the mass, followed by " + (chars["GOO"].hairStyle == "ponytail" ? "dainty" : "loud") + " slurping noises. [goo.name] is sucking out the " + fluidDesc + " that fills your";
	if(suckHole == "cunt") txt += " [pc.vaginasNoun]";
	else if(suckHole == "butt") txt += " [pc.assholeNoun]";
	else txt += " orifices";
	txt += "!";
	txt += "\n\nAfter she’s completed in drinking your hole";
	if(suckHole == "both" || (suckHole == "cunt" && pc.vaginas.length != 1)) txt += "s";
	txt += " dry, the silver body suit of goo retracts her satiated slime straws, gives a cute burp and sighs.";
	
	return ParseText(txt);
}
	

