public function outsideCarbonado():Boolean
{
	output(" Finally, to the west, is a combination clothing-store-come-spa. The window rather cheerily offers a cozy experience for potential patrons to warm themselves within after having experienced the bitter chill of the moon’s surface.");

	if (!carbonadoActiveHours())
	{
		output(".. were the shop actually open right now.");
		setNavDisabled(NAV_WEST_DISABLE);
	}

	return false;
}

public function carbonadoActiveHours():Boolean
{
	return (hours >= 8 && hours < 21);
}
public function uvetoCarbonadoStore():Boolean
{
	if (hours >= 20 && hours < 21 && flags["CFS_HANGOUT_EVENT_PENDING"] == 1)
	{
		cfsGoHangoutTime();
		return true;
	}

	if (!carbonadoActiveHours())
	{
		showBust("CFS_EIMEAR");
		
		output("\n\nEimear shuffles you and all of the other hangers-on out of the shop so that they can close for the night.");
		currentLocation = "UVS B9";

		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return true;
	}

	if (!pc.hasStatusEffect("Gwen In Back"))
	{
		if (flags["MET_CFS_GWEN"] == undefined)
		{
			output("\n\nA bored looking");
			if (CodexManager.entryUnlocked("Puazi")) output(" puazi");
			else output(" alien that your codex identifies as a puazi");
		}
		else
		{
			output("\n\nGwen");
		}
		output(" stands behind the counter, eyeing customers and occasionally providing assistance with the automated register. When she gets free time, she thumbs through various comics and fashion magazines on a tablet. A cozy sweater frames her DD-cup breasts, colored to match the shock of deep blue hair behind her heart shaped crest.");
		if (flags["HUNGOUT_CFS"] != undefined)
		{
			output(" She gives you a wave when she sees you, mood brightening instantly.");
			if (flags["FUCKED_CFS_GWEN"] != undefined)
			{
				output(" She pantomimes a growl, throwing a lusty grin in your direction. The dress she’s wearing flaunts her heart shaped coloration for all to see, but she makes a point to make sure you see some extra cleavage.");
			}
		}
		else if (flags["MET_CFS_GWEN"] != undefined) output(" When she sees you at the door she gives a dreamy sigh, leaning her chin on both palms and staring.");

		if (flags["MET_CFS_EIMEAR"] == undefined)
		{
			output("\n\nThe other counter is manned by a variety of staff, one of whom stands a head and shoulder’s height above the rest. Your codex identifies her as half-ausar, half-bruchandus.");
		}
		else
		{
			output("\n\nEimear walks around managing her counter, towering over her part-time staff and making sure none of them mess anything up.");
		}
		output(" Her swimsuit and sports-bra do precious little to contain her massive chest, and she often re-adjusts the uncomfortable looking garment.");
		if (flags["HUNGOUT_CFS"] != undefined)
		{
			output(" She visibly relaxes when she sees you, stepping aside from her constant supervisory role in case you want to talk.");
		}
		else if (flags["MET_CFS_EIMEAR"] != undefined)
		{
			output(" She gives you a smile and a curt nod when she notices you.");
		}
	}
	else
	{
		showBust("");
		output(" Gwen and Eimear are nowhere to be seen, the automated terminal still spun around as a prominent invitation toward self-service...");
	}

	if (flags["MET_CFS"] == undefined)
	{
		addButton(0, "Counter", uvetoCarbonadoFirstTime);
	}
	else
	{
		addButton(0, "Counter", uvetoCarbonadoRepeat);
	}

	return false;
}

public function uvetoCarbonadoRepeat():void
{
	clearOutput();

	if (pc.hasStatusEffect("Gwen In Back"))
	{
		showBust("");
		output("You walk up to the automated register, finding a catalog of the available wares.");
		addButton(0, "Shop", cfsGoBuyMenu);
	}
	else
	{
		showBust("CFS_GWEN");
		output("<i>“Hey there [pc.name]! Can I help you find anything today?”</i> Gwen asks, flipping the electronic catalog of wares in your direction.");
		uvetoCarbonadoMenu();
	}
}

public function uvetoCarbonadoMenu():void
{
	clearMenu();

	if (carbonadoActiveHours()) addButton(0, "Shop", cfsGoBuyMenu);
	else addDisabledButton(0, "Shop", "Shop", "You can’t do this outside business hours.");
	addButton(1, "Talk", uvetoCarbonadoTalk, undefined, "Talk", "Ask the mismatched couple some questions.");
	if (carbonadoActiveHours()) addButton(3, "Massage", cfsGoMassage);
	else addDisabledButton(3, "Massage", "Massage", "You can’t do this outside business hours.");

	if (flags["HUNGOUT_CFS"] != undefined && (hours >= 20 || hours <= 4))
	{
		//Intercept to go shopping
		if(isChristmas())
		{
			if(flags["CFS_HOLIDAY_SHOPPING"] == undefined && (!pc.isTaur() || pc.hasItemByClass(HeatBelt)) && (pc.totalVaginas() > pc.blockedVaginas() || pc.hasCock()))
			{
				pc.createStatusEffect("GWEN_XMAS_CD");
				pc.setStatusMinutes("GWEN_XMAS_CD",60*84);
				cfsHolidayShopping();
				return;
			}
			if((pc.hasCock() || (pc.totalVaginas() > pc.blockedVaginas())) && !pc.hasStatusEffect("GWEN_XMAS_CD") && flags["GWEIMEER_XMAS_2018"] == undefined) 
			{
				gardefordsGwenmas2018();
				return;
			}
		}
		else flags["CFS_HOLIDAY_SHOPPING"] = undefined;
		
		if (hours >= 20 && hours < 21 && flags["CFS_HANGOUT_EVENT_PENDING"] == 1) addButton(2, "Hangout", cfsGoHangoutTime);

		if (pc.hasCock() || pc.totalVaginas() > pc.blockedVaginas())
		{
			addButton(4, "Sleepover", cfsGoSleepover);
			addButton(6, "Lewd Massage", cfsGoLewdMassage);
		}
		else
		{
			addDisabledButton(4, "Sleepover", "Sleepover", "No funbits, no funtimes.");
			addDisabledButton(6, "Lews Massage", "Lewd Massage", "No funbits, no funtimes.");
		}

		addButton(5, "Vidya", cfsGoVidja);
	}

	addButton(14, "Leave", uvetoCarbonadoLeave);
}

public function cfsGoBuyMenu():void
{
	shopkeep = gwen;
	shopkeepBackFunctor = mainGameMenu;
	buyItem();
}

public function uvetoCarbonadoLeave():void
{
	if (hours < 20 && hours > 4 && canTriggerCFSHangoutEvent())
	{
		clearOutput();
		showBust("CFS_GWEN");
		showName("\nGWEN");
		author("Gardeford");

		output("Gwen rushes out to tap you on the shoulder as you leave the store.");
		
		output("\n\n<i>“Hey [pc.name], Me and Emi were wondering if you wanted to come over to our place tonight? We could watch tv or play video games, whatever really. I’m sure you’re in a hurry, but if you wanna come, just meet us here after close. Say, about 20:00? Hope to see you there.”</i> She rushes back into the store, not waiting for an answer.");

		flags["CFS_HANGOUT_EVENT_PENDING"] = 1;
		processTime(2);

		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		mainGameMenu();
	}
}

public function showCarbonado():void
{
	showName("\nCARBONADO");
	showBust("CFS_GWEN", "CFS_EIMEAR");
	author("Gardeford");
}

public function uvetoCarbonadoFirstTime():void
{
	clearOutput();
	showCarbonado();

	flags["MET_CFS_GWEN"] = 1;
	flags["MET_CFS_EIMEAR"] = 1;
	flags["MET_CFS"] = 1;

	output("You wade through the myriad clothing racks, making your way to the main counter. The puazi clerk looks up from her comic, swiping the reader app off her screen. She looks around to make sure no one else has priority in needing help, and upon finding no one gives you a disarming smile and her full attention.");

	output("\n\n<i>“Hi there! Welcome to Carbonado! Is... is there anything I can do to help you-ooo?”</i> she begins. Halfway through the words, her demeanor slackens. Her once alert gaze fades to a dreamy stare, glazed with impure thoughts. Before you can ask her what’s wrong, or do much of anything really, you hear a shout from the other end of the store.");

	output("\n\n<i>“Hang on! Don’t get closer, you’ll only make it worse,”</i> shouts the tall, dark-skinned girl from the far counter. She sprints over, clearing the counter’s distance in a matter of seconds. After making sure the puazi is okay, she gives you a stern look-over. A glistening name-tag on her suit labels her as ‘Eimear’.");

	output("\n\n<i>“You’re not one of the regulars, so I’ll give you the benefit of the doubt. I don’t know if you knew this, but puazi can go into crazy bouts of heat when humans are nearby. There are a couple people who come in every once in a while just to harass poor Gwen here, so forgive me if I sound harsh.");
	if (pc.humanScore() <= 2) output(" You don’t look human, but there must be some in your genes.");
	output("”</i> she says, attempting to push the determined saleswoman away from the counter. Her efforts are impeded by the latter’s batting arms.");

	output("\n\n<i>“It’s okay Eemee, it’s really not a really bad one this time. I can still run the shop. Now, what can I help for you today, "+pc.mf("sir", "ma’am") +",”</i> she asks, much to the ausar hybrid’s chagrin. The expression on her face looks anything but levelheaded, but you decide to humor her.");

	clearMenu();
	addButton(0, "Talk", uvetoCarbonadoIntroTalk);
	addButton(1, "Shop", uvetoCarbonadoIntroShop);
}

public function uvetoCarbonadoIntroTalk():void
{
	clearOutput();
	showCarbonado();

	output("You tell the pudgy puazi that you’d like to talk about how she came to run the store. She gives you a dazed smile of half comprehension.");

	output("\n\n<i>“Oooh, coming on to me after just a few minutes, eh? Well, I guess we can go have some fun in the back room,”</i> she says, biting her bottom lip.");

	uvetoCarbonadoIntroMerge();
}

public function uvetoCarbonadoIntroShop():void
{
	clearOutput();
	showCarbonado();

	output("You tell the pudgy puazi that you’d like to see the inventory. She gives you a dazed smile of half comprehension.");

	output("\n\n<i>“Right to the point. I like that. You can see my goods anytime,”</i> she says, beginning to pull her sweater down over her DD-cup chest.");

	uvetoCarbonadoIntroMerge();
}

public function uvetoCarbonadoIntroMerge():void
{
	output("\n\n<i>“O-K, that’s enough front work for you right now. This is why we got the automated register, remember? Let’s go in back and get you taken care of,”</i> the taller woman says, picking her stocky friend up under the arms and then over her shoulder before she can embarrass herself further. The goat-like alien giggles as she’s hefted into the air, nigh oblivious to the situation.");

	output("\n\n<i>“Sorry about this, I’m sure you’re a great "+ pc.mf("guy", "gal") +". Come back in a bit, okay? We’ll have this all fixed up and you can have some actually meaningful conversation,”</i> she apologizes, flashing the first smile you’ve seen since she came over. “Eemee” carts her tipsy friend into the back room, leaving you alone with the self running register.");

	pc.createStatusEffect("Gwen In Back", 0, 0, 0, 0, true, "", "", false, 60);
	
	clearMenu();
	addButton(0, "Next", function():void { clearOutput(); uvetoCarbonadoStore(); } );
}

public function uvetoCarbonadoTalk():void
{
	clearOutput();
	showCarbonado();

	output("It doesn’t look like you’ll be able to talk to both of the owners at once, so you’ll need to choose one. Both appear open for conversation, though Gwen seems to be making extra effort to get your attention. She waves frantically when you look her way, like she’s trying to call a lost cat.");

	uvetoCarbonadoTalkMenu();
}

public function uvetoCarbonadoTalkMenu(lastF:Function = null):void
{
	clearMenu();

	gatedButton({
		id: 0,
		lbl: "Gwen: Puazi",
		f: uvetoCarbonadoTalkPuazi,
		arg: undefined,
		ttH: "Gwen: Puazi",
		ttB: ""
	});

	gatedButton({
		id: 1,
		lbl: "Gwen: Fashion",
		f: uvetoCarbonadoTalkFashion,
		arg: undefined,
		ttH: "Gwen: Fashion",
		ttB: ""
	});

	gatedButton({
		id: 2,
		lbl: "Eimear: Shop",
		f: uvetoCarbonadoTalkShop,
		arg: undefined,
		ttH: "Eimear: Shop Owner",
		ttB: ""
	});

	gatedButton({
		id: 3,
		lbl: "Eimear: Relation",
		f: uvetoCarbonadoTalkEimearRelationship,
		arg: undefined,
		ttH: "Eimear: Relationship",
		ttB: ""
	});

	gatedButton({
		id: 4,
		lbl: "Gwen: Relation",
		f: uvetoCarbonadoTalkGwenRelationship,
		arg: undefined,
		ttH: "Gwen: Relationship",
		ttB: ""
	}, flags["HUNGOUT_CFS"] == undefined);

	gatedButton({
		id: 5,
		lbl: "Eimear: Fam",
		f: uvetoCarbonadoTalkFamily,
		arg: undefined,
		ttH: "Eimear: Family",
		ttB: ""
	}, flags["HUNGOUT_CFS"] == undefined);

	addButton(14, "Back", uvetoCarbonadoMenu);
}

public function canTriggerCFSHangoutEvent():Boolean
{
	if (flags["CFS_TALKED_PUAZI"] == undefined) return false;
	if (flags["CFS_TALKED_FASHION"] == undefined) return false;
	if (flags["CFS_TALKED_SHOP"] == undefined) return false;
	if (flags["CFS_TALKED_EIMEAR_REL"] == undefined) return false;
	if (flags["CFS_HANGOUT_EVENT_PENDING"] != undefined) return false;
	return true;
}

public function uvetoCarbonadoTriggerHelpingGwen():Boolean
{
	if (rand(10) <= 1 && !pc.hasStatusEffect("Helping Gwen"))
	{
		pc.createStatusEffect("Helping Gwen", 0, 0, 0, 0, true, "", "", false, 120);
		
		output("As you approach the bubbly shopkeep you see her demeanor shift noticeably. What had been an attentive vigil quickly becomes a slouching, hypnotized sway. She gives a drunken giggle as her goat-like eyes lock onto you, utterly lost to alien urges. You could help her out with this problem, or signal Eimear to help.");

		clearMenu();
		addButton(0, "Help", uvetoCarbonadoHelpGwen);
		addButton(1, "Signal", uvetoCarbonadoSignalEimear);

		return true;
	}
	return false;
}

public function uvetoCarbonadoSignalEimear():void
{
	clearOutput();
	author("Gardeford");
	showName("GWEN &\nEIMEAR");
	showBust("CFS_GWEN", "CFS_EIMEAR");

	output("You turn toward Eimears counter, waving for her attention as Gwen stretches over the counter in an attempt to reach you. She glances over, apologizing to a customer she’s dealing with when she notices the dazed Puazi splayed over the counter, drunkenly grasping for some part of you to touch. It only takes her a moment to reach the two of you, and she quickly gets one arm around Gwen’s waist and hoists her into the air.");
	
	output("\n\n<i>“Sorry about that,”</i> you apologize with a teasing grin.");
	
	output("\n\n<i>“Don’t worry about it. You give me an excuse to spend more time with her,”</i> she replies with a wink before carting her giggling girlfriend into the back room.");

	pc.createStatusEffect("Gwen In Back", 0, 0, 0, 0, true, "", "", false, 30);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function uvetoCarbonadoHelpGwen():void
{
	clearOutput();
	author("Gardeford");
	showName("\nGWEN");
	showBust("CFS_GWEN");

	output("Gwen gasps dramatically as you approach, running a finger through the neck of her blouse.");
	
	output("\n\n<i>“Steeele, are you here to be my hero? I guess it’s your fault in the first place, but whatever. Just come right around back here,”</i> she relays, unhitching the countertop entrance and woozily sauntering through a door in back. She glances back at you while she walks, bumping into the door once before opening it. It doesn’t seem to hurt much, but you still wince as you follow her through.");

	if (pc.isBimbo()) output("\n\n<i>“Are we gonna have sex!?”</i>, you ask excitedly");
	else output("\n\n<i>“So, how do you want to do this?”</i>, you ask");
	output(". The back room is small, but still open enough to move around. A number of boxes containing various convenience products and perfumes litter the floor, and a counter with a large sink lines the back wall.");

	if (pc.isBimbo()) output("\n\n<i>“kinda I guess? H");
	else output("\n\n<i>“I don’t know, h");
	output("aven’t you ever dealt with a puazi before? I’m not big on making decisions right now. You could probably play this little piggy or something with me and I’d get off. Just no dicks, please. I still have to work after this and I don’t have a change of underwear,”</i> she carefully articulates, spending a significant amount of time on each word.");

	//if silly mode
	if (silly)
	{
		output("\n\nYou think it over for a second before coming to a sudden realization. It’d be super fucking hilarious to get her off playing this little piggy! You maneuver the literally love-sick puazi to a nearby chair, sitting her down and pulling off her shoes. She stares at you, confused but complacent, as you run your fingers along one of her calves. She coos as you briefly tickle her sole through a black lace sock.");
		
		output("\n\n<i>“Now, this little piggy went to market,”</i> you say, giving her big toe a gentle wiggle. A shudder runs through her leg, and she stifles a moan with some difficulty. Apparently she wasn’t kidding about getting off this easily. You let go, moving on to the next line.");
		
		output("\n\n<i>“And this little piggy stayed home.”</i> Her back arches as you wiggle the second toe, almost propelling her out of the chair. Eyes that had at least been in focus are now greatly dilated, staring in your general direction with an amorous ambience. Before her muscles can fully relax, you launch into the next assault.");
		
		output("\n\n<i>“This little piggy had a great feast, but what’s this! Oh no, a wolf attack!”</i> you shout as you wiggle the middle toe, leaning in and giving her inner thigh a nibble. Both her legs splay out, toes tensing and straining against their confining socks. A lusty moan is interrupted as her jaws clench shut, the noise trickling through her teeth in halting streams. Without skipping a beat, you lift her leg into a straight position and wiggle the second to last toe.");
		
		output("\n\n<i>“This. Little. Piggy. Had. None,”</i> you murmur between a bevy of kisses that creep from her thigh to her ankle. A long, bright blue tongue lolls out of her mouth, followed by an unintelligible attempt to speak. Starting at her heel, you gently massage her foot until your fingers are gently wrapped around her pinky toe. You lean in close, capturing her tongue with your lips and reeling her into a deep kiss.");
		
		output("\n\nWhile she sloppily attempts to kiss you back, one leg still hooked over your shoulder, you begin walking your hand down over her knee. Her muscles twitch with each fingerfall, growing more tense as you approach her crotch. She lets out a disappointed trill as you pull back from your kiss, unable to lean forward to follow you. You smile as you finally reach your target.");
		
		output("\n\n<i>“And the last little piggy went all the way home,”</i> you whisper, slipping under her panties and accentuating the last word with an assault on her clit. She gasps at the sudden intrusion, eyes flashing wide with incomprehensible bliss. Her hands grasp blindly to pull you into another kiss, using your lips to muffle her moans. Her long tongue explores every inch of your mouth, The bright and colorful muscle sloppily intertwining with yours.");
		
		output("\n\nA series of rumbling shudders alerts you to pull away, just in time for her teeth to clench shut in a body rocking orgasm. You rush to pull her up as her body shoots into a curve, almost smacking her head against the wall. The stiffness only last for a second before she collapses into your arms, huffing to get breath. Once she recovers she stands and smacks herself on both cheeks, psyching herself up with a shout.");
		
		output("\n\n<i>“Thanks Steele! That was a little weird, but I don’t judge. If I have another episode don’t hesitate to help out again. Mine hit really hard, but they’re also pretty good about being over after a good time. Also if you were worried about the noise, don’t, this room is sound proofed,”</i> she says, smiling and opening the door for you.");
		
		output("\n\n<i>“Now that that’s over, is there anything I can help you with shopping wise?”</i> She asks as you exit the counter space.");
	}
	else
	{
		output("\n\n<i>“No dick?");
		if (!pc.hasCock() && !pc.hasHardLightEquipped()) output(" I couldn’t if I wanted to")
		else if (pc.isBimbo()) output(" Aww, okay");
		else if (pc.isNice()) output(" No problem");
		else if (pc.isMisc()) output(" I don’t need one for this");
		else output(" If you insist");
		output(",”</i> you reply with a");
		if (pc.isNice() || !pc.isBimbo()) output(" grin");
		else output(" frown");
		output(", hooking a finger under the hem of her blouse and slowly inching it up over her waist. She coos as you brush the soft skin of her stomach, caressing your way to her panty line. A quick snap unhooks the button on her pants, popping them open to reveal a sexy pair of black lace panties.");
		
		output("\n\n<i>“Is this what you always wear? A little risque for daily use, don’t you think?”</i> you taunt, matching the words with kneading teases across her crotch. Ragged breath grows heavier as you approach her slit, and her already cloudy eyes begin to dilate.");
		
		output("\n\n<i>“They’re really cum, comfortable. I don’t, don’t show them to people except Emi. Oh and you now, heheh. I always forget to put a fan in here,”</i> she mumbles, head swaying slightly from left to right. She absentmindedly pulls at her blouse, exposing one citrine colored breast and coppery nipple to the cool air.");
		
		output("\n\nYou swiftly take advantage of this vulnerable teat, nibbling gently and letting your teeth graze the sensitive nub. At the same time you slide your fingers over her lips and into her sopping cunt, eliciting a shocked cry from the pudgy puazi. She arches forward, trying futilely to resist the urges beckoning her to blissful oblivion.");
		
		output("\n\n<i>“Thasgood! Thasgood thasgood thasgood Emi,”</i> she whispers intently, each iteration ferrying a fiery breath to the nape of your neck. Her hole tightens around you like a molten press, sucking your digits harder even as you pull them out. The salacious shopkeep shrinks closer around you, running her fingers");
		if (pc.hasHair()) output(" through your [pc.hair]");
		else output(" over your naked scalp");
		output(" and pulling you tightly to her chest as she plants a wet kiss on your shoulder.");
		
		output("\n\nThe intoxicatingly sweet scent of her body wash fills your nose as you nuzzle in, redoubling your twin assault. Her body heat seems to be rising by the second, and it flows through your lips to warm you to the core. Soft moans are accentuated by the shlicking of her dripping pussy, and you feel her body begin to tense up in your hands.");
		
		output("\n\nYou’re reunited with the cool air as her entire body splays, back arching against the chair. Hot femcum spurts through your fingers, soaking her panties through with a copious volume of sticky love-juice. Her legs keep her in the air for a minute before settling down and letting her collapse into a panting mess. She gives you a sheepish look as her eyes steadily return to focus.");
		
		output("\n\n<i>“I guess I need to change panties anyway,”</i> she admits, getting to her feet with only a slight wobble, and grabbing a new pair of undergarments and pants from one of the numerous boxes around the room. She strips out of her pants in seconds, giving you a quick view of orange and black buttock before she pulls the second pair up to her waist.");
		
		output("\n\n<i>“Thanks Steele. Sorry, I think I said Emi’s name in there somewhere but that should just be an indicator of how good you were doing,”</i> she simultaneously thanks and apologizes to you. You follow her out of the back room and into the main sales floor.");
		
		output("\n\n<i>“Now then, is there anything shopping wise I can help you with?”</i> she asks as you exit the counter space.");
	}

	processTime(10+rand(3));
	pc.changeLust(15);

	uvetoCarbonadoTalkMenu();
}

public function uvetoCarbonadoTalkPuazi():void
{
	clearOutput();
	showBust("CFS_GWEN");
	showName("\nGWEN");
	author("Gardeford");

	if (uvetoCarbonadoTriggerHelpingGwen()) return;

	flags["CFS_TALKED_PUAZI"] = 1;

	output("<i>“So, doesn’t this condition of yours make being a shopkeeper a little tough?”</i> you ask after heading to Gwen’s counter.");
	
	output("\n\n<i>“Not at all! I mean, it might, if I were on a planet with more humans. You might be surprised at how few humans actually come to Uveto for vacation and stuff. It’s nothing like what I imagine Terra is like for a puazi trying to find work. Emi does a pretty good job of dissuading the ones who do want to cause trouble, but most of the local population stay planetside,”</i> she replies, directing a series of taps at the machine beside her.");
	
	output("\n\n<i>“Besides, I’ve got this thing to help people check out. It’s not like this is a crippling disability. All it means is I get a little extra alone time with Emi during the day. She’s the type to get stressed easy, so it works out,”</i> the pudgy puazi explains.");
	
	output("\n\n<i>“Was there anything else you wanted?”</i>");

	processTime(5);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkPuazi);
}

public function uvetoCarbonadoTalkFashion():void
{
	clearOutput();
	showBust("CFS_GWEN");
	showName("\nGWEN");
	author("Gardeford");

	if (uvetoCarbonadoTriggerHelpingGwen()) return;

	flags["CFS_TALKED_FASHION"] = 1;

	output("<i>“So what made you decide to get into this business?”</i> You ask the puazi saleswoman. She beams, the kind of look that says ‘I’m always prepared for this question.’");
	
	output("\n\n<i>“So when I was little my mom sent pictures into a JoyCo contest. I don’t know if you or your parents were buying JoyCo diapers at the time, but my mom won that contest. I was on all the promotional material for like two years. I still have the pictures saved, see look,”</i> she proclaims, pulling a small tablet from under the desk. She taps through a few menus before turning the screen your way, revealing a picture of a baby puazi wearing a diaper emblazoned with the JoyCo logo. An infectious smile coats her features, only emphasized by the fact that her body’s natural coloration forms a series of hearts.");
	
	output("\n\n<i>“Basically the galaxy’s adorablest baby,”</i> she proudly remarks, scrolling through a number of other baby pictures. You find yourself grinning as she finishes her slideshow, setting the tablet onto the counter between you.");
	
	output("\n\n<i>“But yeah, I don’t feel like paying the mod costs for modeling, so I decided to make a ton of money selling clothes to the people who do! I’m not winning any galactic contests or anything, but last year’s Miss Milky Way had me design her wedding dress,”</i> she brags, turning the tablet toward you again to show off a black-skinned alien in a stark white dress. She stands beside a similarly colored male in a dapper suit, with a large ‘thank you’ scrawled in above the pair. The dress is lined with rich fur, tapering into a long train that lies behind her.");
	
	output("\n\n <i>“I find the design process to be just as much fun as seeing people try on my outfits. My artist friends probably get super annoyed with me, cause I always send designs back for the littlest changes,”</i> she explains with a laugh.");
	
	output("\n\n<i>“When I first started I was so excited to have people who liked my work. Now, and I totally mean to be as cheesy as possible, I’m just happy to spoil Emi at every opportunity,”</i> she finishes, directing a glance at the taller woman.");
	
	output("\n\n<i>“Anything else you wanted to ask about?”</i>");

	processTime(8);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkFashion);
}

public function uvetoCarbonadoTalkShop():void
{
	clearOutput();
	showBust("CFS_EIMEAR");
	showName("\nEIMEAR");
	author("Gardeford");

	flags["CFS_TALKED_SHOP"] = 1;

	output("<i>“So how did you guys manage to get a storefront on the landing station? That can’t be a simple process,”</i> you ask the dusky masseuse, glancing around at a store that looks beyond the average starter’s price range.");
	
	output("\n\nThe half-bruchandus grins slyly. <i>“You’d think, wouldn’t you. It’s actually an ultra simple process when the building space runs in your family. Somewhere way back on my dad’s side someone got ahold of the rights to own a store here. Before I got here it was a training center and shop for wrestling paraphernalia. Some of the stormguard are really into GWF matches, enough that business kept the store open till my dad could take over. Dad was more into the wrestling than the store owning though, regrettably, so the store fell into a bit of disrepair,”</i> she says with a hint of disappointment.");
	
	output("\n\n<i>“That obviously didn’t last,”</i> You remark with a");
	if (pc.isNice()) output(" smile");
	else if (pc.isMisc()) output(" grin");
	else output(" smirk");
	output(".");
	
	output("\n\n<i>“Oh no. As soon as I was done with college I persuaded him to let me take over. It didn’t take much convincing. After meeting Gwen he was all for us turning the place into something different. We still get some of the old customer base to visit as well. Stormguard warriors occasionally come by the sauna to loosen up before a fight. One of them even challenged me to a fight for a discount once. I don’t think he’d ever seen a bruchandus, much less wrestled with one. I had to promise him I’d destroy the security footage after his first hold slipped right over my head,”</i> she smiles proudly, steepling her fingers and stretching.");
	
	output("\n\n<i>“Don’t tell Gwen, but we make more money on repeat massage customers than people coming in to buy clothing. I think people kinda shy away from her hyper attitude, and she’s garbage at dealing with insurance and the tove contractors. They could probably get her to sign over whatever kind of deal they wanted, even without a human being nearby. We’ve got it in paper that I handle those kind of things though, so even if she did they wouldn’t have anything legal. Now, was there anything else you wanted?”</i>");

	processTime(8);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkShop);
}

public function uvetoCarbonadoTalkEimearRelationship():void
{
	clearOutput();
	showBust("CFS_EIMEAR");
	showName("\nEIMEAR");
	author("Gardeford");

	flags["CFS_TALKED_EIMEAR_REL"] = 1;

	output("<i>“How did you meet Gwen? There’s gotta be a story there,”</i> you inquire whimsically.");
	
	output("\n\n<i>“I-It’s not as fantastic as you think. I know I don’t really look like it, but I was really shy and unsocial in school. I didn’t really talk to anybody and spent most of my time locked in my dorm room. I actually met Gwen in the film and animation appreciation club. We both had the same favorite tv show, and hit it off pretty hard just based on that. It’s a good thing she’s really forward, because I don’t think I’d have ever worked up the courage to ask her out,”</i> Eimear relates with a relieved sigh.");
	
	output("\n\n<i>“She just kept coming over to my room to watch shows and play games. I couldn’t tell her no, and I don’t think I ever wanted to. Before I knew it we were, well, err, physical.”</i> The coal charred cutie gets quieter as she continues, almost seeming to shrink before your eyes. She suddenly slaps herself on the cheek, shaking her head and letting out an exasperated gasp of air.");
	
	output("\n\n<i>“Sorry. Thinking about it makes me remember how nervous I used to be. Before I met her I had no plans to take over this shop. I just wanted to get a job somewhere where no one would notice, and play videogames with the rest of my free-time. I suppose I still play a lot of games, but this is far from low-key living, and I couldn’t be happier about it,”</i> she smiles endearingly as she continues.");
	
	output("\n\n<i>“I asked Gwen to move in with me after we graduated, and even after all that time I was still a little worried that she would say no. She just stared at me and asked what I had thought was going to happen. We live pretty close to the elevator on the surface, so it’s super convenient,”</i> she finishes, looking at you expectantly.");
	
	output("\n\n<i>“Was there anything else you wanted?”</i>");

	processTime(8);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkEimearRelationship);
}

public function uvetoCarbonadoTalkGwenRelationship():void
{
	clearOutput();
	showBust("CFS_GWEN");
	showName("\nGWEN");
	author("Gardeford");

	if (uvetoCarbonadoTriggerHelpingGwen()) return;

	output("<i>“So I heard about how you met Eimear, got any funny stories or insight you think she might’ve missed?”</i> you ask the puazi shopkeep. She snickers in response, checking Eimear’s place at the far counter before responding.");
	
	output("\n\n<i>“Did she give you the club story? With the adorable nervous tic?”</i> You give a confused nod, wondering where she’s going with this.");
	
	output("\n\n<i>“That is where we met, but the get together isn’t quite as spontaneous and innocent as she tells it. It might sound really shallow, but I’m not big into shy types. Even so, I couldn’t resist a body with near to two feet on me and muscle to back it up. I had to have her. It was the first time I’d swooned that hard without my biology being the instigator,”</i> she runs a hand through her shock of blue hair, biting her lip at memories you can definitely imagine.");
	
	output("\n\n<i>“You didn’t hear this from me, but she might have bumped into one of my friends before a party, and that friend might have offered her something to help her open up. No drugs or anything, just booze. I was hoping it would make her a bit more chatty, but I think she took a bit more than a first timer should. Nothing dangerous, but she doesn’t remember that night, don’t you honey,”</i> she catches Eimear’s eye, still talking to you, but mimicking lovey dovey talk at the unaware beauty across the storefront. She waves and smiles, unable to hear the conversation.");
	
	output("\n\n<i>“Turns out I really underestimated how strong she was. The thought of getting into her pants had crossed my mind, but not until after she’d sobered up and I’d gotten her back to the dorms. She wanted into mine the moment she got there, and barely had enough decency left to not strip me on the dance floor. She just hefted me over her shoulder and carried me out of the ballroom in one arm, straight back to her dorm. She had one of the fancy single rooms, complete with soundproofed walls. She tossed me onto her bed and tried taking off my shirt, but ended up just ripping it right up the middle,”</i> She makes a tracing gesture at");
	if (flags["FUCKED_GWEN"] == undefined) output(" the shape on her chest");
	else output(" the heart shape on her chest");
	output(".");
	
	output("\n\n<i>“Then she got engrossed with the pattern on my chest, just couldn’t stop giggling. She kept alternating between tracing it with her fingers and kneading my boobs. The oil she secretes keeps her skin super smooth, so it felt <b>really</b> good. It was a big quandary for me, cause I really wanted to be on top, but I also didn’t want to get crushed, so I just let her do her thing. About ten minutes into this she tries to take her top off, and manages to get it stuck on her head. Those tits are bigger than my head when they are contained, so without a bra on she just wrapped my head in a warm bastille of boob.”</i> You can see a blush coat her orange cheeks, spreading to the edge of her darker coloration.");
	
	output("\n\n<i>“The anticipation I felt as her fingers made their way to my cunt had my heart hammering like a spire drill. She didn’t waste any time either, thrusting into me as soon as she found it. The trouble, or I guess it’s not really trouble... actually it’s kinda great. Anyway, the thing about a seven foot tall lover is that three fingers are about as thick as your average cock for a puazi. Bruchandus supposedly use that oil stuff primarily for wrestling, but fuck if it isn’t the perfect lube. I was stuck tight between her and the bed, and her hips are big enough that I could hardly clench mine with her body pressed in that close. All I could do was cum and moan into her cleavage,”</i> She declares, full of energy. She seems to notice how hard she is gripping her tablet, setting it down on the table and taking a breath to relax.");
	
	output("\n\n<i>“She started to slow down pretty quick though. Maybe a minute or so of intense masturbation before she sagged down and fell asleep on top of me. As soon as I recovered my senses I was able to literally slide out from under her. Her oil production skyrockets when she’s aroused, so it was slippery enough that when she wasn’t awake to hold me there I could slip out. I tried my hardest to get her back to a semi dressed state, and then snuck out.”</i> She drums her fingers on the counter.");
	
	output("\n\n<i>“Please don’t tell her about that,”</i> she adds quickly. <i>“I was gonna tell her but she gets really excited telling the innocent story, and that makes me happy. I don’t want one drunk encounter to ruin that enthusiasm. Was there anything else you wanted?”</i>");

	processTime(10);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkGwenRelationship);
}

public function uvetoCarbonadoTalkFamily():void
{
	clearOutput();
	showBust("CFS_EIMEAR");
	showName("\nEIMEAR");
	author("Gardeford");

	output("<i>“So what’s your family like? You mentioned your dad was a wrestler, but what about your mom? How did they meet? What was it like for you growing up?”</i> you ask. The dusky masseuse shifts in place, running a hand through her oil-slicked hair.");
	
	output("\n\n<i>“I was wondering when you’d ask. Most people start with that question. ‘What kind of alien are you? I thought bruchandus couldn’t interbreed?’ Things like that. Most of them also assume my dad is the bruchandus. The ones who know anything about the race hear wrestling and pin it right on him. They couldn’t be more wrong,”</i> she answers, giggling as she remembers something from her past.");
	
	output("\n\n<i>“No, my daddy is Agner <i>“Frozen Wolf”</i> Jessen, ‘The greatest oil wrestler on the planet.’ It was really awesome as a kid, even when I grew up and found out he was the only oil wrestler on the planet. He wasn’t champion of anything, but he did get the odd exhibition game. Turns out people pay pretty good money to see huskar wrestle.”</i>");
	
	output("\n\n<i>“One of those matches was from a big time famous bruchandus wrestler, wanted some good publicity wrestling small time unknowns from around the galaxy. I hear he was actually a really nice guy, but I never got the chance to meet him. When dad got the notification he trained himself near to sickness. I should call and get him to tell you some stories about it, cause they’d just sound really cringeworthy coming from me,”</i> she laments with a shake of her head.");
	
	output("\n\n<i>“Anyway, dad was pretty far into this guy’s galactic wrestle-quest, and at that point I think he had lost maybe one in ten matches. He was some mix of overconfident and bored, so when my dad floored him in the first round he almost lost on the spot. It wasn’t some miracle movie though, and the guy got his footing back in the second round. Dad gave him a run for his money, but didn’t win.”</i> She gets a big grin, leaning a little closer.");
	
	output("\n\n<i>“Didn’t win the fight anyway. One family watching the game had a daughter about my dad’s age, and she was immediately smitten with dad to astronomically cliched levels. So much so that she walked up to him after the match was over, a blushing nervous wreck, and asked him to marry her. Do you know what he said? He said no.”</i> She mocks a frown, shaking her head to match the notion.");
	
	output("\n\n<i>“Now, mom really was that shy, and probably would’ve accepted this outcome, but he offered to get to know her if she wanted another chance to ask. She hastily accepted, getting her parents’ permission to visit him here on Uveto over the next few years, and eventually moving in with him after she finished school. He said yes the second time she asked, the day after she graduated. Her parents weren’t very happy,”</i> she continues, her frown losing its joviality.");
	
	output("\n\n<i>“She really wanted to have a kid, but bruchandus don’t exactly have the same kind of plumbing as huskar, and that kind of change isn’t something an average person can do easily. So she scrounged up all the money she could find, and with dad’s help got a surgery to make her fertile. I happened about a year later,”</i> she says, returning to a slightly happier mood.");
	
	output("\n\n<i>“Mom loved every second of it, even the painful bits. Her parents didn’t. They all but disowned her as soon as they found out she was planning it. My grandmother doesn’t acknowledge that she is one, and sometimes I think she might not admit to people that she has a daughter. My mom had a hard time with it at first, but dad’s parents were more than happy to have a grandchild, and spoiled the everloving fuck out of both me and mom.”</i> The half-bruchandus’ eyes mist a little, but she still laughs as she goes on.");
	
	output("\n\n<i>“Mom didn’t even bat an eye when I told her I was gay, or that my girlfriend was a puazi. The first thing she asked was whether or not she needed to worry about her human friends having been in the house the day before Gwen came for dinner. Dad was just worried about how ‘young’ I was. Not everyone waits till they’re thirty six,”</i> the sable shopkeep looks down, finding her fingers steepled.");
	
	output("\n\n<i>“I’m really happy with my family. It’s nice when thinking with your heart gets you exactly where you want to be,”</i> she finishes.");
	
	output("\n\n<i>“Now that I got that out, did you want anything else?”</i>");

	processTime(12);
	uvetoCarbonadoTalkMenu(uvetoCarbonadoTalkFamily);
}

public function showCfsHangouts():void
{
	showName("GWEN\n& EIMEAR");
	showBust("CFS_GWEN", "CFS_EIMEAR");
	author("Gardeford");
}

public function cfsGoHangoutTime():void
{	
	clearOutput();
	showCfsHangouts();

	if (flags["CFS_HANGOUT_EVENT_PENDING"] == 1)
	{
		output("You see the shopkeeper couple exiting their store and walk up to greet them. Gwen waves as she sees you, totally encased in fluffy winter gear.");
		
		output("\n\n<i>“Steele! Glad you could make it. Our place is just down the elevator,”</i> she relates,");
		if (pc.tallness < 54 || pc.tallness > 66) output(" looping her arm under your own to walk alongside you");
		else output(" grasping hold of your hand to walk beside you");
		output(". She pulls you toward the large tunnel, directing you towards the section designated for personnel use. Eimear lines up on your other side, matching her wife’s gesture. You notice a fair share of jealous stares as you enter the elevator, framed by the two alluring aliens.");
		
		output("\n\nDespite the elevators foreboding size, it doesn’t take long at all before you reach the city proper. You let yourself be lead through the main thoroughfare, your guides directing you toward a large condominium. Despite the heat-belt strapped to her waist, steam trails in thin wisps from Eimear’s skin. Even inside the city the cold still nips relentlessly. The three of you take a regular sized elevator up to the fourth floor, stepping out into a short hallway with a single door.");
		
		output("\n\nGwen rummages through her purse, pulling out a slate blue keycard. The door clicks and pops open, revealing an expansive living room complete with cushioned computer gaming areas and a massive projection screen on the wall in front of an equally gigantic couch. Holotapes and videogame consoles border the screen, stacked neatly in short piles. To your right, a large kitchen area dominates the east wall. There are two closed doors along the other walls.");
		
		output("\n\n<i>“This is our house! Over there is our bedroom, and that one is the bathroom. I’m gonna go grab some snacks, so please make yourself at home,”</i> Gwen gushes as you enter. She rushes off to the kitchen, ditching her winter jacket as she goes. Eimear hangs her heat belt on a wall rack by the door, and you follow her as she moves to the couch.");
		
		output("\n\n<i>“I’m thinking an episode of The Flare. The new season is starting up soon, so we can start with the first episode,”</i> she states as you");
		if (!pc.isTaur()) output(" drop yourself onto the cushions");
		else output(" ease your way onto the cushions");
		output(". You sink into the comfortable plush material, taking your time to get situated.");
		if (pc.isGoo()) output(" You’re surprised to find the material wicking away the excess liquid produced by your body, leaving it dry and pillowy.");
		output(" Eimear quickly finds what she is looking for, slotting the holotape into a nearby player and joining you on the couch. Gwen butts in moments later, squishing herself between the two of you with a large bucket of popcorn.");
		
		output("\n\n<i>“Alright! First episode, go!”</i> she says, prompting the device to begin playing.");
		
		processTime(15+rand(5));
		clearMenu();
		addButton(0, "Next", cfsGoHangoutTimeII);
	}

	//flags["CFS_HANGOUT_EVENT_PENDING"] = undefined;
}

public function cfsGoHangoutTimeII():void
{
	clearOutput();
	showCfsHangouts();

	output("A large spaceship cruises through the black expanse of space, following a much smaller ship through an asteroid field, firing weapons as it moves. Inside the ship, a tall, armored knight stands stoically. He glares at the smaller ship through the windows of the control deck.");

	output("\n\n<i>“You have evaded me long enough,”</i> he remarks under his breath. <i>“No one can run from me forever.”</i> Upon the completion of this statement, he is surrounded by a large animated nameplate, large barriers surrounding the name ‘Ironwall, The Turgid Terror.’");

	output("\n\nGwen leans over, cupping a hand to your ear. <i>“That’s Ironwall, he’s a supervillain with the ability to create barriers. His armor enhances latent psionic powers to increase their str-oww”</i> she yelps as Eimear jabs her in the side to shut her up.");

	output("\n\n<i>“Let [pc.himHer] watch,”</i> she whispers.");

	output("\n\nWhen you look back to the show, the focus has changed to what must be the interior of the smaller ship. A man in a rather phallic looking suit of armor sits at the controls, with warning sirens blaring and outside explosions rocking the cockpit. His suit is navy blue, with gauntlets that flare out like metallic horsecocks. Phosphorescent green shades shield his eyes, leaving only a wide grin visible.");

	output("\n\n<i>“Damn him! Hold on guys! It looks like we’ll just have to finish him here and now,”</i> he shouts, a nameplate proclaiming him to be ‘The Flare, Hero of Justice.’ He turns hard on the ship’s controls, moving directly toward the larger craft.");

	output("\n\n<i>“You idiot, you’re going to get us killed!”</i> comes a voice from the ship’s rear quarters.");

	output("\n\n<i>“Not today I’m not, just get ready to jump,”</i> he shouts in reply.");

	output("\n\n<i>“We don’t have the money to buy another ship!”</i>");
	
	output("\n\n<i>“His mind is set, girlie, just hunker down.”</i>");
	
	output("\n\nThe scene switches to a ship’s interior. Robotic soldiers mill about, carrying out various cleaning duties. Suddenly an immense explosion rocks the wall, with the Flare leaping out of the flames, flanked by a sumo-sized man carrying a massive hammer and a robotic centauress wielding a plasma rifle.");

	output("\n\n<i>“This is not an effective strategy!”</i> shouts the centaur, a nameplate labeling her ‘Taurina, master tactician.’ She blasts away some approaching droids, but doesn’t notice a larger one approaching behind her. Before it can attack, it is smashed to pieces by the hammer from before.");

	output("\n\n<i>“How many times have I told you to watch your back. Master tactician, bah!”</i> the heavyset titan shouts, hefting his weapon. Ironclad bars label him as ‘Ivan Orgoth, The Shaft of Strength.’");

	output("\n\nRobots with wicked looking sharp bits approach from every side, and the three heroes group in a tight cluster. A loud noise alerts them to the hole their ship punched in the larger spacecraft. A vacuum begins that pulls many of the robots into the vastness of space. Taurina grabs her compatriots, her hooves magnetically anchoring her to the floor. She trudges toward an open hallway, managing to get through just before it closes off, and dropping her cargo to the ground. The two men cough and sputter for a few seconds, steadily recovering their bearings.");

	output("\n\n<i>“Thanks Taurina, we’d be dead without your help,”</i> Flare declares with a grin. The digital display that makes up the mechanical centaurs face shows a blush, and she struggles to find words. She trots down the hallway, huffing and shaking her head.");

	output("\n\n<i>“Damn right you would. Don’t ever let me hear about you going on a mission without me, you’d somehow wind up killing yourself before you got there,”</i> she laments, reaching the end door before they begin to follow. When the group reaches the end of the corridor, Flare presses a button to open the door, only to reveal a wall of armed murderbots, weapons trained on the surprised heroes.");

	output("\n\n<i>“We have you surrounded, don’t move,”</i> barks one of the droids, pointing menacingly at the unorthodox ensemble of fighters.");

	output("\n\n<i>“You villains will never stop the motion of justice! You’ve given me enough time to prepare one of my special attacks! Expel, bursting white explosion!”</i> shouts the Flare, punching the air towards the corridor. A pulse of glowing white energy bursts from his gauntlet, washing over the battalion of bots and penetrating their armor. When the light dies down all that’s left is a scrap-heap.");

	output("\n\n<i>“You idiot!”</i> yells Taurina, bashing him on the shoulder before continuing, <i>“That attack leaves your arm unusable for the next hour. What happens if there’s another ambush, or if you need your full strength to stop Ironwall?”</i>");
	
	output("\n\n<i>“You worry too much, Taurina. With you and Ivan by my side, there’s no way he can stop us,”</i> he says, patting her on the back of her tauric half. His left arm hangs limply at his side, fingers twitching on occasion, but otherwise immobile.");

	output("\n\nThe trio make their way forward, reaching the ship’s bridge in a surprisingly short time. After a few steps in the group gives a collective gasp as sapphire energy surrounds the Flare’s companions, locking them inside impenetrable cages of pure energy.");
	
	output("\n\n<i>“You thought to burst in guns blazing against a psionic of my caliber? Perhaps you thought you were being stealthy; I’ve known stupider soldiers,”</i> comes the deep rumbling of Ironwall’s voice. The large captain’s chair turns around to reveal his seated frame.");
	
	output("\n\n<i>“Or maybe you’re brazen enough to think that you can defeat me. I’ve analyzed your techniques, and I know you won’t be able to use that attack again using that arm. Even with the other arm available, that level of power won’t puncture my barriers. I’m going to end your heroic career here and now,”</i> the wicked knight threatens. Globes of evil energy begin to form in his hands, humming menacingly as they grow.");

	output("\n\n<i>“You’ve made a tactical error, Ironwall,”</i> Flare replies, his tone sharp and serious, <i>“assuming that a hero like me is limited to one burst of energy. Double fist armor penetrating technique! Ivory thrust!”</i>");
	
	output("\n\nHe links his hands together as he shouts, a pearl of radiant energy forming between the gauntlets flared tips. Ironwall hisses, diverting the attack orb’s energy into a shield. A tornado of energy picks up around the superhero as he unleashes his attack, firing the tiny orb of force into the shield with enough strength to crack it on impact. Ironwall struggles, releasing Taurina and the Shaft and returning the excess power to his main shield.");
	
	output("\n\n<i>“Justice! Flow and extinguish evil’s flame!”</i> The bright flash increases in intensity until nothing can be seen save an expanse of pure white. When the light dies down, Ironwall lies unconscious on the floor. Flare huffs and falls to his knees, breathing heavily. His suit is torn up the right arm, with trails of blood leaking onto the floor.");
	
	output("\n\n<i>“Flare! Are you alright? Your body was too strained for an attack like that,”</i> Taurina exclaims as she rushes to his side, her voice rife with concern. He leans into her support, letting her assist him as he rises.");
	
	output("\n\n<i>“The police will be here soon to take care of Ironwall. You can treat me on the ship while we travel. For now just make sure he’s restrained. If this was all it took to defeat me the galaxy would’ve been overtaken by evil long ago. I won’t let that happen. As long as I live the peaceful inhabitants of the Universe League will have nothing to fear.”</i> The camera zooms in on his face for this increasingly serious monologue before cutting to black. Credits roll, accompanied by an upbeat exit theme.");
	
	output("\n\nGwen grabs your shoulder, beaming at you and tearing your attention away from the tv.");
	
	output("\n\n<i>“So, what did you think?”</i> she asks, cocking an eyebrow.");
	
	//[good][not my thing][garbage]
	processTime(20+rand(3));
	clearMenu();
	addButton(0, "Good", cfsGoHangoutTimeIII, 0);
	addButton(1, "Not My Thing", cfsGoHangoutTimeIII, 1);
	addButton(2, "Garbage", cfsGoHangoutTimeIII, 2);
}

public function cfsGoHangoutTimeIII(resp:uint = 0):void
{
	clearOutput();
	showCfsHangouts();

	switch (resp)
	{
		default:
		case 0:
			output("<i>“That was");
			if (!pc.isBimbo()) output(" awesome");
			else output(", like, the greatest movie I’ve ever seen");
			output("!”</i> you exclaim, prompting an equally giddy nod from Gwen.");

			output("\n\n<i>“I know right! It only gets better as the plot progresses and they work out the kinks. Lots of people quit in the first couple episodes ‘cause they don’t like the writing or some other stupid reason like that. But they have no idea what they’re missing. The writing has improved a million times over the five seasons it’s been running, and even this old stuff has that charm that only begining shows can get.”</i> As she speaks, she shuts off the movie player. You hop up, helping the pair of them to clean up the snacks.");
			break;

		case 1:
			output("\n\n<i>“That was...");
			if (!pc.isBimbo()) output(" not my kind of show");
			else output(" okay, I guess, but like, it needs more boobs");
			output(",”</i> you express, prompting an understanding shrug from the excitable puazi.");

			output("\n\n<i>“Oh well, it’s not for everyone. If you ever think about giving it a second chance we could watch one of the movies. They were all made after the initial rough period, so they aren’t quite as cheesy and shoddily written. The first few still have some cheese, but definitely not that bad. If you come over some other time I’m sure we can find something you can have more fun with,”</i> she says as she shuts off the movie player. You rise from the couch, helping the pair with cleaning up snacks.");
			break;

		case 2:
			output("\n\n<i>“That was");
			if (!pc.isBimbo()) output(" pretty terrible");
			else output(" like, the wastiest waste of time. I could’ve been masturbating");
			output(",”</i> you frown, shaking your head and garnering a dejected frown from Gwen.");

			output("\n\n<i>“I’m sorry you feel that way. It really does get better as the series goes on, the writing improves and the characters have meaningful relationships. But If that’s how you feel then I guess we’ll need to find some other way to have fun if you come over some other time,”</i> she says, ending on a much more cheerful note. You rise from the couch, helping the pair with cleaning up snacks.");
			break;
	}

	output("\n\n<i>“Just ask either of us around closing time if you want to hang out again, we’re free most nights,”</i> Gwen explains, bringing you to the door. As you leave the house, Eimear steps out with you and taps you on the shoulder to get your attention.");

	output("\n\n<i>“Hey Steele! One more thing before you go. If Gwen ever has an episode while you’re around, I’d be okay if you, you know, helped her out with it. I already know she’d be up for it, but I just wanted you to know its good with me in case that would be a trouble spot,”</i> she declares, growing more flustered with every word. You can see a blush even through her ebon cheeks, but she grows suddenly somber. <i>“Just don’t fuck her up. If I see her with any kind of drugs or anything that screws up her head I’ll sooner crack yours than call the authorities.”</i>");

	output("\n\nYou gulp, nodding confirmation. At your answer she smiles again, patting you on the shoulder before hopping back.");

	output("\n\n<i>“Great. Hope to see you again soon, tonight was a lot of fun. I’ll tell you what. I’m not as loose as Gwen, but I’ll give you a massage on the house if you want, might even get you off while I’m at it. It’s happened before without me even trying, the poor guy was super embarrassed. Have a great night!”</i> She returns to the house, leaving you to return to the city at large.");

	//return to bottom of elevator
	processTime(15+rand(3));
	currentLocation = "UVI F34";
	
	flags["CFS_HANGOUT_EVENT_PENDING"] = 2;
	IncrementFlag("HUNGOUT_CFS");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function cfsGoSleepover():void
{
	clearOutput();
	//showCfsHangouts();
	showBust("CFS_GWEN_NUDE");
	showName("\nGWEN");
	author("Gardeford");

	output("You walk up to Gwen’s counter, preparing to ask if she wants to hang out again. The stout shopkeeper’s joyful presence brightens even further when she sees you, hooking a beckoning finger in your direction.");
	
	output("\n\n<i>“Hey Steele, Emi’s gonna be out of the house for a personal training visit tonight. You wanna come over?”</i> she says, reading your mind. You reply in the affirmative, and the alluring alien pumps her fist in the air. She walks around the counter to meet you, grabbing a warm coat from under the register.");
	
	output("\n\n<i>“I can leave a little early. We didn’t get that automated register to collect dust. Also I can’t wait to get you into bed.”</i> she whispers the latter with a wink, looping an arm under yours and tugging you towards the exit. You get another bundle of jealous looks as you walk to the elevator, pulled along by your coat-wrapped companion.");
	
	output("\n\nThe ride down is uneventful, but the closer you get to her home, the more excited Gwen grows. By the time you make it to the couple’s town front apartment she’s bouncing on her heels, and has a difficult time getting her keycard in the door. It opens after a cluster of failed attempts, and she dashes inside.");
	
	output("\n\nYou follow her through the door, and are instantly treated to a faceful of clothing. First comes her coat, then her blouse and pants. By the time you fish your way out of the tangle of clothing she’s gone, presumably into the open bedroom along the back wall. A trail of discarded undergarments confirms your deduction, leading the way through the door. The rooms lighting is dim, but it does nothing to hide the wonderful sight before you.");
	
	output("\n\nGwen lies supine on the bed, legs spread wide and curving to touch at the feet. In her nudity her full coloration is visible, with dusky skin interrupted by burnished orange. Dark copper nipples tip a pair of breasts that make up the twin-apex of a heart shape on her chest. The titian streak lacks a point, continuing down between her legs and onto her butt. It’s only interruption is her azure slit, glistening in the dim light. The hole is circled by a bramble of equally vibrant turquoise fuzz, extending just above her crotch.");
	
	output("\n\n<i>“I’m sorry if hair isn’t your thing, but Emi just loves it. I think it’s something about her not being able to grow any down there,”</i> she explains, stretching her arms up to the headrest. You ditch your [pc.gear] at the foot of the bed, climbing in to meet the plump puazi. Her excited chestfalls speed up at your approach, goat-like eyes intently scrutinize your body");
	if (pc.hasCock()) output(" before focusing on [pc.eachCock]");
	else if (pc.hasVagina()) output(" before focusing on [pc.eachVagina]");
	output(". One hand strays from its upward perch to glide over your stomach and toward your crotch.");

	//male
	var doMale:Boolean = !pc.hasVagina() || (pc.hasCock() && rand(2) == 0);

	if (doMale)
	{
		var cockIdx:int = pc.biggestCockIndex();

		output("\n\nHer dusky fingers close around your [pc.cock "+ cockIdx +"], gently stroking its length and running her thumb over the [pc.cockHead "+ cockIdx +"]. As she probes your [pc.cockNoun "+ cockIdx +"], her cerulean tongue rolls over her lips, leaving them with a glistening sheen. Her gaze shifts to meet yours, saying more with a look than she could articulate in words. Not needing any instruction, you reposition yourself between her legs, letting her rub the tip of your [pc.cock "+ cockIdx +"] against her mons. She lets out a distressed moan at her inability to do more.");
		
		output("\n\n<i>“I won’t know what you want if you can’t tell me,”</i> you tease, wresting control of your dick and taking over the rubbing process. The Puazi stares perplexed for a moment, reaction delayed by an increasing biological urge. All the words try to escape her mouth in a jumble of noise that sounds more like a cry of pleasure, and her hands wave desperately in an attempt to offer a better explanation.");
		
		output("\n\n<i>“I-I want... Cock! Cockinmypusshy... Yours pleashe,”</i> she begs, trying to scoot herself closer with each pause. The last bit is tacked on when you don’t immediately comply, accompanied by a nervous grin. You tease her for a moment longer before lining up and slowly pushing your way inside her.");
		
		output("\n\nA stream of incoherent pleasure noises escape between clenched teeth as you sink deeper into her vibrant blue box, and eyes that a moment ago were at the very least able to focus now roll back in blissful surrender. Her legs lock to your hips as you begin to rhythmically thrust into her,");
		if (pc.isTaur() || pc.tallness >= 108) output(" hugging tightly to your sides");
		else output(" pulling you in as they meet behind your body");
		output(". She continues to vocalize nonsense with each thrust, with an occasional word breaking through the haze.");
		
		output("\n\n<i>“Goood... Yummy wombstabber... Fillup... upupup...,”</i> she babbles, holding you as tightly as she can manage.");
		if (pc.isTaur() || pc.tallness >= 96) output(" You reach down and plug two fingers into her mouth. In her drunken lust she kisses them like a mouth, Swirling her tongue around to wet them down to the knuckle. She looks up to meet your eyes with a blurry stare, smiling and she sucks on your digits. Hot breaths from her nose feel cool against the nuclear heat of her saliva.");
		else output(" You lean down, running your fingers through her short hair and pulling her into a kiss. Her long tongue flits instinctively into your mouth, pushing around until it finds your own. It’s thinner tip sloshes around, circling your tongue in one direction and then the other to reach every spot possible. Hot breaths from her nose wash over your face, still managing to cool the nuclear heat of your sloppily locked lips.");
		
		output("\n\nYou pull away from her mouth with a pop, still connected by a line of strings that break and drop to her chest. A similar web of juices splatters between your hips, steadily increased by the alien beauty’s seemingly unending stream of mini orgasms. With every thrust her grip on both your body and her consciousness slips, spiraling slowly towards blazing euphoria. You steady one bouncing breast with a tight grip, extracting a delighted yelp with a tug on its dusky nipple.");
		
		output("\n\n<i>“Cumming! Inside, okay... C-can’t pregnant! Inside, good!”</i> she shouts out amidst her frenzy of delightful feelings. You can feel your own lusts building, and let yourself lose control, mindlessly bucking into her as your climax builds. It feels as if all the heat in your body is focused through [pc.eachCock], pumped into");
		if (pc.cocks.length > 1) output(" and onto");
		output(" her desire bridled body. The prurient puazi gives a satisfied sigh, accepting every drop with an exhausted embrace. You pull slowly out of her cum-soaked cunt, gasping at the cool air on your tender privates as you flop to your side next to her.");
		
		output("\n\n<i>“Waaaait, I can... I clean up. Feelgood,”</i> she mumbles, sitting up suddenly, only to fall flat on her face. She pushes herself up directly in front of [pc.eachCock] and begins sucking and licking to clean every bit of juice from");
		if (pc.cocks.length == 1) output(" it’s surface");
		else output(" their surfaces");
		output(". Her position treats you to the perfect view of her cum-stuffed pussy, blasted with juices from butt to thighs. You slip a hand through her legs to massage her clit, lubricated by the [pc.cumColor] jizz occasionally dribbling over it.");
		
		output("\n\n<i>“Mmmm,”</i> She coos, slowly sucking on your [pc.cockHead "+ cockIdx +"]. You look down when the pressure steadily decreases, finding your extraterrestrial companion fast asleep, breathing softly through her nose. Her lips still purse to kiss the tip of your [pc.cockNoun "+ cockIdx +"], but it seems like she was more exhausted than she let on. You flop onto your back, letting restful sleep embrace you as well.");
	}
	else
	{
		var p:int = pc.pickUnblocked();
		output("\n\nInquiring fingers quickly reach your [pc.clit], rubbing around before");
		if (pc.vaginas.length > 1)
		{
			output(" passing teasingly over your other puss");
			if (pc.vaginas.length == 2) output("y");
			else output("ies");
			output(" and carressing a thigh. She raises her eyebrows at your duplicate genitals.");
		}
		else
		{
			output(" brushing gently along your inner thigh and returning inward.");
		}
		output(" You coo softly at her touch, and are elated to see her dusky nipples harden at the sound. You reach out and pinch one of the onyx nubs, tugging a moan out of her in one quick motion. The lusty alien attempts to hold eye contact, but her gaze continually breaks to stare toward your nether region.");

		output("\n\n<i>“H-hey. I like dicks as much as the next girl, they’re great and cum is great, and, uhh, stupid stupid. Pull yourself together! Anyway, can I just eat the fuck out of your pussy? Haha oh god, I must sound like I’m having a fit,”</i> she sputters, unable to break from her stare. The need in her voice is palpable, flowing out of her in a river of broken statements and lustful slips of the tongue. You grin at her inconfidence, taking a rough hold on her short crop of hair and pulling her into a kiss. She gives in immediately, moaning into your mouth as your tongue explores hers. Before she can get too invested you push her onto her back, holding her prone form steady as you shift positions.");

		output("\n\nThe anxious alien shudders with anticipation, growing more restless as you position your ass over her face. You carefully lower yourself atop her");
		if (pc.isTaur() || pc.tallness < 96) output(", the bed shifting in softness to accommodate your weight");
		output(", and gasp as she begins to work her way into your sex with her tongue. She clutches at your hips, attempting to drag them closer with all the strength she can muster. You clench your teeth to stifle a moan as she alternates between taking heaving breaths and facefucking your crotch. Twinging beacons of bliss race through your body as her chin and lower lip rub relentlessly at your [pc.clit]");

		output("\n\nAs your moans increase in volume you notice something strange. Each time your voice reaches its peak the chubby puazi’s legs clench together, toes spreading as her thighs rub fruitlessly together. The sight brings a cruel thought to your mind, one you can’t help but entertain. You lean forward, wrenching the amorous alien’s legs apart and holding them open. Your interference does nothing to stop her torrent of licks, but you hear a questioning grunt the next time she grabs a breath.");

		output("\n\nYou focus the pleasure running in your veins, controlling the volume of your moaning. Gwen’s thighs begin to clench as you grow louder, and you hear a pained groan as her phosphorescent pussy twitches needfully. Her legs strain to close as your voices intensity rises, but you arent about to let her off the hook so easily. A long tongue dives into your [pc.pussy " + p + "], Finding just the right spot to break your regulated vocalizations into a carnal concert. Expressions of symphonic delight burst from your mouth, and your whole body quivers wonderfully with each note.");
		if (pc.hasCock()) output(" [pc.eachCock] spurts [pc.cumColor] jizz to mix with the hot femcum already splattered onto the multicolored maiden’s chest, smeared in by an impromptu " + (!silly ? "boobjob" : "Puazuri") + ".");

		output("\n\nBeneath you, the punished puazi tenses, love juices squirting like a leaky faucet. Coming off of your own high, you jump on this opportunity, quickly plugging her hole with two fingers. Her legs slap shut around your hand, but it’s too late to block your driving digits. The slippery sex syrup dripping from her cunt makes any pressure her thighs apply near to meaningless. You simply glide through the improvised blockade to continue your relentless fingering.");

		output("\n\nBristly turquoise fuzz tickles your fingers as you vigorously thumb the puazi’s love button. Gwen’s own assault on [pc.eachClit] is considerably delayed. She laps");
		if (pc.vaginas.length > 1) output(" and fingers");
		output(" as thoroughly as she can, but every few seconds she pauses as an orgasmic tremor rocks her shapely form. After a few minutes of this her vigorous treatment fails to return, and you rise as quickly as your ecstasy exhausted hips will carry you, afraid that she might have been unable to catch a breath.");

		output("\n\nMuch to your relief, your exotic companion is simply asleep. The majority of her compact frame is coated in sweat or sticky juices, but you notice them being wicked away by the bedding. The wet surfaces of her body dry near instantly on contact with the sheets, cleaned by the wonders of science. This must be a useful perk of living with someone who constantly secretes liquid. You lie down beside the conked out cutie, and let restful sleep take you as well");
	}

	output("\n\nYou wake in the morning to find Gwen still fast asleep, lying at an extremely uncomfortable looking angle with limbs strewn wildly in each direction. Her chest rises and falls quite evenly, citrine breasts quivering softly as they move. You rise from the bed, contemplating waking the peachy puazi, but deciding against it. She needs her rest. You grab your [pc.gear] and head back to the city proper.");

	processTime(10+rand(5));
	pc.orgasm();

	//dump outside house at 7 am
	currentLocation = "UVI F34";
	
	IncrementFlag("HUNGOUT_CFS");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function cfsGoVidja():void
{
	clearOutput();
	showCfsHangouts();

	output("<i>“Do you guys want to hang out tonight? Last time was a lot of fun,”</i> you ask, leaning on the counter between you and Eimear. The dusky amazon grins excitedly, setting down her work tablet.");

	output("\n\n<i>“Sure! I can set up a game to play. I think there’s a tournament going on for Soul Fantasy: Battle Gatcha 2.0, we can try that for a bit,”</i> she says, eyes afire with new motivation. She walks around the counter gate, heading swiftly to Gwen’s side of the shop.");

	output("\n\n<i>“Hey Gwen, we’re going to play games. The interns can lock up tonight. [pc.name] wants to come over,”</i> she explains. The heart-emblazoned puazi all but tosses her tablet onto the counter, rushing into the back room and emerging moments later with a hastily donned jacket. One of the neck tassels is caught on her horns, and she quickly bats it off.");

	output("\n\n<i>“Well then? Let’s hurry down!”</i> she exclaims, hooking an arm under yours and pulling you out the door. Eimear walks just ahead of you, hitting the button to start the elevator and opening the door when you arrive at the couple’s apartment. She immediately heads for the entertainment center, setting a small tablet onto a Girderbeam Inc. Gaming Panel. A 3D screen pops up, showcasing the intro video to what looks like a fighting game. A bounty of fighters clash while shouting catchphrases and abilities that all but drown each other out.");

	output("\n\n<i>“We can use my account, I have all the characters unlocked and everything. I spent a probably unhealthy amount of time and money on this game a couple years ago, and then a bunch more during the Flare collaboration to get him unlocked for Gwen. He’s the only character she’s good at,”</i> she whispers the last bit as she shoves a controller into your hands. It lacks buttons, instead having two simple touchpads for your thumbs and two more for your index fingers where triggers and bumpers would be placed.");
	
	output("\n\n<i>“It’s really easy to get into. The button pads read inputs from the electrical signals in your brain. You might feel a little shock when the game starts, but after that you should be able to just think about what you want the character to do and have it happen. I haven’t done anything with the current tournament, so it should match you against someone about on your skill level,”</i> she explains, moving your fingers into the correct positioning as she speaks.");
	
	output("\n\nYou look back to the screen. Now that the intro video has ended, the games menu seems much more streamlined than the mess from before. A selection of options covers the screen in an easily identifiable arrangement. There’s a label for tournaments, free play, local co-op, and challenges, along with an arrow leading to <i>“roll new heroes!”</i>. You hit tournaments, and are immediately met with a totally blank “Select your character” screen.");
	
	output("\n\n<i>“Oh shit, I forgot you don’t actually know anyone. Uhh, pick Matoossa! He’s pretty easy for beginners,”</i> Eimear blurts as a countdown starts at the top of the screen. As the name she mentioned enters your thoughts, a character appears on screen. He, at least you think its a he, wears an outfit like a cybernetic ninja, covering his body up to the neck. Cheek length white hair billows around his head as if intense wind is blowing, and in place of eyes he has what seem to be swirling graphite smears. His mouth is sewn shut, tightly locked in place by thin jade chains. He carries a sword that discharges varying levels of electricity through its sheath, glowing a dull white color.");

	output("\n\nWhen you confirm your choice, he slashes through the <i>“Locked in”</i> alert that appears, dashing off screen. The next screen gives each fighter an intro sequence. Your character drops from the sky, slashing through a nearby cinderblock so quickly that a white flash is all that’s visible of the sword. He then proceeds to stare menacingly at the opposite end of the arena.");
	
	output("\n\n<i>“Is that supposed to be scary? I won’t bow to some child’s nightmare,”</i> comes your opponent characters voice, a high but masculine tone. Eimear frowns and scoots up upon hearing it. The character himself is a tall, lanky man wielding two futuristic sawed off shotguns. He wears a fancy jacket and khaki pants, with jewel encrusted rings of various colors on his fingers. He has spiky blonde hair and aviator sunglasses with a target symbol embossed on the left lens. A digitized billboard in the back declares him to be “Hollyhock”.");
	
	output("\n\n<i>“Shit. He’s the reward character for arena tournament one. You can’t even get him anymore,”</i> Your alien companion warns, her lion-like tail flitting worriedly. A countdown begins on the screen, and you prepare yourself as best you can. The best you can do doesn’t count for much in the end. As soon as the countdown reaches zero, your opponent bursts forward and catches you with a point blank blast from one of the shotguns. Instead of bullets, it produces a fist like burst of energy. Your character is sent flying, and before you can react he has you in a corner, smashing repeatedly to keep you locked in the air.");
	
	output("\n\nYou’re dead in under a minute, and you see a message pop up in the bottom corner. <i>“<b>BlastMaster has sent you a communication: Get rekt scrub</b>!”</i> Eimear grunts an expletive, taking the controller from you and dropping down next to you on the couch.");
	
	output("\n\n<i>“This guy wants to be a fucking smartass, I’ll show him who’s a damn scrub,”</i> she growls fiercely, maneuvering back to the character select menu. The screen flits about quickly before settling on a humanoid alligator in a trench-coat and bowler hat. Bubbling green and purple liquids leak from the cracks in his scales and drip from his mouth. The label at the top proclaims his title, or name you aren’t sure which, as “The Infestigator”.");
	
	output("\n\nThe second match countdown begins once she chooses her selection, with the gator inspector crawling in from the side of the screen. The moment the number reaches zero your former opponent attempts the same swift combo that got you locked into a corner. Out of the corner of your eye you see Eimear take a quick breath and tighten her grip on the controller. The alligator detective on-screen explodes in a shower of toxic fumes, damaging the shotgun wielding fighter even as he continues his dash.");
	
	output("\n\nEimear comes back in from behind, leaping out of the puddle left by the poisonous burst. Infestigator rips into Hollyhock’s shoulder, making a few rending tears before taking two vials out from his coat and smashing them into the open wound. Following this he backs away, but BlastMaster’s HP is still rapidly trickling down, and they don’t seem to be making any moves to counterattack.");
	
	output("\n\n<i>“There we go. They wanna talk shit, they get the fatal flaw kill,”</i> Eimear remarks smugly. As she speaks, her opponent melts into a gaseous puddle, complete with wisps of smoke in the shape of tiny skulls. She’s still smirking as the third round begins, rolling her thumbs in tune with the game’s background music. This time her opponent doesn’t get a chance to dash in. He puts up a block as soon as the round begins, but Eimear simply has the gator belch a splash of gunk onto his arms, breaking the guard and laying into him with claws and tail smashes.");
	
	output("\n\nThe other player gets in a few hits, but the incensed shopkeeper doesn’t give him any chances for a real comeback. A meter on the sidebar that had been filling up reaches its peak, and the Infestigator roars. He leaps into the air, pulling out a comically large magnifying glass and lining it up with a purple sun that appears in the sky behind him. When the light travels through the glass, it turns into a laser that causes his opponent to collapse into a half melted pile of fuming decay. As the victory screen begins, he leaps onto the corpse to begin devouring it.");
	
	output("\n\n<i>“I hate people who talk shit. Maybe we should just play local,”</i> Eimear states plainly, handing the controller back to you. Gwen grabs another controller, bouncing in place and looking excited at the prospect.");
	
	output("\n\n<i>“I like that idea, we can play together that way!”</i> she exclaims. You laugh as she maneuvers to the co-op menu, and decide to pick the same character from before as you get into the game. She picks an elfish demonic man with a black hole looking sphere where his stomach should be. Your games are much more fun than the tournament round, with you and her trading wins pretty evenly throughout three matches. You even manage to pull ahead and win the final round. You hand the controller off to Eimear, letting the two lovers duke it out in a game.");
	
	output("\n\n<i>“Oh no you don’t, If I’m playing her I’ll have to break out the big guns,”</i> Gwen says, flexing comically. Her character flash changes to The Flare, the character from the show you watched earlier. Her gameplay seems markedly improved with this character, going toe to toe with Eimear on the infectious alligator from before. The towering half-bruchandus nudges you during the fight, diverting a little of her attention.");
	
	output("\n\n<i>“This is the only guy she’s any good at, but I’ve got a secret strategy to win every time,”</i> she confides with a wink. Her hand darts downward, slipping through layers of clothing to reach Gwen’s crotch. The intensely focused puazi gives a surprised yip, and her character locks up mid jump. Eimear leans back, relaxing as she multitasks her way to a quick victory. Her hapless girlfriend doesn’t even try to voice a complaint, dropping the controller to tightly grip the invading arm.");
	
	output("\n\n<i>“No fair. That’s cheating,”</i> the prurient puazi frowns, her chest heaving.");
	
	output("\n\n<i>“Yes, but you love it,”</i> Eimear replies, kissing her on the nose....");

	processTime(240+rand(20));

	clearMenu();
	addButton(0, "Next", cfsGoVidjaII);
}

public function cfsGoVidjaII():void
{
	clearOutput();
	showCfsHangouts();

	output("You stand, stretching and giving each girl a goodbye hug.");
	
	output("\n\n<i>“It was awesome to have you over again, [pc.name]. If you ever feel like hanging out you know where we’re at,”</i> Eimear says, embracing you tightly before letting go.");
	
	output("\n\n<i>“Yeah, hope to see you again soon,”</i> Gwen chimes in.");
	
	output("\n\n<i>“");
	if (pc.isBimbo()) output("Oh yeah! Maybe we can do it shirtless next time!");
	else if (pc.isNice()) output("This was a lot of fun, I can’t wait,");
	else if (pc.isMisc()) output("It was fun, next time we can spice it up. Strip gaming maybe?");
	else output("Yeah okay, it was pretty fun,");
	output("”</i> you");
	if (pc.isBimbo() || pc.isMisc()) output(" suggest slyly");
	else if (pc.isNice()) output(" say, meaning every word");
	else output(" admit begrudginly");
	output(". The plump puazi shows you to the door, waving goodbye as you head back to the city proper.");

	//return to main city.
	processTime(3+rand(3));
	currentLocation = "UVI F34";
	
	IncrementFlag("HUNGOUT_CFS");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function cfsGoMassage():void
{
	clearOutput();
	author("Gardeford");
	showBust("CFS_EIMEAR");
	showName("\nEIMEAR");

	output("You walk up to Eimear’s counter, and ask if you can have a massage. The amazonian half-breed flashes a smile, scrolling on her tablet to find a specific button.");
	
	output("\n\n<i>“Definitely! If you’ll just choose which of our wonderful masseurs or masseuses you’d like to receive your massage from,”</i> she asks, swiveling the tablet computer in your direction. Three different buttons, labeled with names you can only assume belong to the variety of workers also manning the counter, blink on screen. It looks like you have a choice to make, or you could ask Eimear for a personal massage.");

	//[intern1](tooltip with their gender and race, as well as type of massage specialty. 500 credits)[intern2](same)[intern3](same)[Eimear](Ask the co-owner for a one on one massage, 1000 credits)

	processTime(2+rand(2));
	clearMenu();
	if (pc.credits >= 1000) addButton(0, "Eimear", cfsGoMassageEimear, undefined, "Ask the co-owner for a one-on-one massage. 1000 credits.");
	else addDisabledButton(0, "Eimear", "Eimear", "Ask the co-owner for a one-on-one massage. 1000 credits. Shame you can’t afford it.");

	addButton(14, "Back", uvetoCarbonadoMenu);
}

public function cfsGoMassageEimear():void
{
	clearOutput();
	author("Gardeford");
	showBust("CFS_EIMEAR");
	showName("\nEIMEAR");

	output("<i>“What if I want a massage from you?”</i> you ask, spinning the machine right back in her direction. The soot-skinned beauty grins devilishly, clicking away from the selection screen.");

	output("\n\n<i>“We can certainly work something out, but I cost double");
	if (flags["HUNGOUT_CFS"] != undefined) output(", and I’m sorry, but our friendship won’t get you a discount");
	output(",”</i> she informs you as she opens the payment window. You swipe your codex at the terminal and follow her as she leads you to the rear portion of the shop. The heat of the sauna has you");
	if (pc.skinType == GLOBAL.SKIN_TYPE_FUR) output(" panting");
	else output(" sweating");
	output(" right away, but the wonderful smell of scented oils prevents it from being too uncomfortable. You undress in a small changing room, leaving your clothing in a basket and heading into the executive massage parlor.");

	output("\n\n<i>“Just lie prone on the mat, and I’ll take care of the rest,”</i> Eimear instructs. You follow her direction, lying front first on the soft cushiony mat. Your dusky masseuse dips her hands into a bowl of lilac colored liquid, rubbing them together to mix it in. Anticipation keeps your heart racing, along with a slight expectation of cold.");

	output("\n\nWhat comes is a happy disappointment. Her hands are a perfect lukewarm temperature, spreading the nice smelling oil over your body. They compass your back like a map, prodding and lightly squeezing, searching your musculature for tense spots. Once she’s profiled the areas that feel tight or stiff she sets in, working them with a master’s firm precision.");

	output("\n\nA sigh escapes your lips as her fingers undo the built-up strain of your adventures, all the way from your lower back to your shoulder blades.");
	if (pc.hasWings()) output(" She pays careful attention to the base of your [pc.wings], gently rubbing them as she passes by."); 
	output(" Upon finishing with your shoulders for the moment, she transitions to your [pc.butt], giving each cheek a firm rubdown.");

	if (flags["HUNGOUT_CFS"] != undefined && pc.buttRating() >= 10)
	{
		output("\n\n<i>“You’re packing more ass than Gwen back here, and that’s saying something. Not a lot of room for tension with this much cushion,”</i> she jokes, giving them a playful squeeze. ");
	}
	else output("\n\n");
	output("Talented touches work from your [pc.thighs] down to");
	if (pc.hasTail()) output(" the tip of your [pc.tail]");
	else output(" your [pc.feet]");
	output(". The combination of oil and her naturally secreted lubricant lets her hands slip easily along your form, repeating the kneading motions as needed until your muscles relax. When she’s done with your behind, the sable siren inches back up along your sides. Unwinding pressure caresses your arms, one at a time, from the shoulder all the way down to the space between your fingers.");

	output("\n\nFinally, her expert motions settle on your neck. You feel yourself drifting almost to sleep in her balmy embrace, feeling utterly serene as she finishes up. As soon as it began your massage is over, leaving you at once wanting more and totally satisfied. You feel ready to tackle any challenge the Rush can throw at you, and loose enough to dodge a bullet.");

	output("\n\n<i>“Thanks");
	if (pc.isBimbo()) output("! You’re a real Profo-, profi-, professor? You have magical hands!");
	else if (pc.isNice()) output("! You’re very good at this");
	else if (pc.isMisc()) output("! Maybe we can get more acquainted some time");
	else output(",");
	output("”</i> you say, giving Eimear a warm smile. She returns it in kind, opening the door for you on your way back to the shop proper.");

	output("\n\n<i>“Any time. Be sure to hang out around the store a little bit before heading out if you’re going down planet side. Hypothermia sucks, and it’s cold even with the belts,”</i> she warns, looking genuinely concerned as she follows you out.");

	pc.credits -= 1000;
	processTime(15+rand(5));

	uvetoCarbonadoMenu();
}

public function cfsGoLewdMassage():void
{
	clearOutput();
	author("Gardeford");
	showBust("CFS_EIMEAR_NUDE");
	showName("\nEIMEAR");

	output("You wait patiently until the days last customer leaves the store, walking up to Eimear’s desk and leaning toward her.");

	output("\n\n<i>“Can I take you up on that after hours massage offer,”</i> you ask, tossing her a hopeful grin. She nods in understanding, powering down the various workplace computers on her counter.");

	output("\n\n<i>“Gwen, I’m gonna give Steele a massage quick before we leave, is that okay with you?”</i> she shouts across the store.");

	output("\n\n<i>“Mhmm! I can do some design work while I wait!”</i> comes her puazi lover’s reply. She smiles, opening the counter gate for you and heading back to the massage rooms. You strip in the waiting room, growing a little aroused at the prospects of what’s coming. Eimear is waiting by the table as you enter the room, hands already dripping with extra lotion.");

	output("\n\n<i>“");
	if (pc.isTaur()) output("Sit here and make yourself comfortable.");
	else output("Lie on your back.");
	output(" I’ll take care of everything.”</i> Her words are a kind instruction, but a hint of authority accents her tone. You almost can’t help but comply, situating yourself as she directs you.");

	output("\n\nA blissful sigh escapes your lips as she begins, her warm hands caressing your stomach. It isn’t so much a massage as a sensual exploration of your body, with her fingertips tracing exotic patterns on your [pc.skinFurScales]. Her traveling touches bring her to your [pc.chest], and she squeezes a little more roughly on each side, pressing your");
	if (pc.biggestTitSize() >= 1) output(" breasts");
	else output(" pecs");
	output(" together from the side.");

	output("\n\n<i>“");
	if (pc.biggestTitSize() >= 15) output("It must be tough with boobs this big, If you ever need a back massage you be sure to come by,”</i> she offers with a grin.");
	else if (pc.biggestTitSize() >= 7) output("Feels like we’re about the same size, if you ever need a back massage, be sure to come by,”</i> she offers with a sympathetic grin.");
	else if (pc.biggestTitSize() >= 5) output("Yours are the same size as Gwen’s, just perfect,”</i> she grins, thumbing your [pc.nipples].");
	else if (pc.biggestTitSize() >= 1) output("Haha, between the huskar and stormguard I rarely ever see boobs this small. They’re so cute!”</i> she giggles, grinning wide.");
	else output("You’ve got some great muscle developing here, let’s make sure it doesn’t get too strained,”</i> she says with a wink.");
	output(" You smile back, staring into her emerald green eyes as she works her magic over your body. Instead of continuing upward, her movements take a turn toward your lower body. Slickened hands dance back across your [pc.belly], making their way down");
	if (pc.isTaur()) output(" and over your rump");
	output(" to reach your crotch.");

	if (pc.isPregnant())
	{
		output("\n\nI’m a little jealous,”</i> she admits softly, gently retracing her path over your swollen stomach. Her fingers play hesitantly across your [pc.skinFurScales], and you stifle a giggle at the ticklish feeling they instill on your sensitive");
		if (pc.isTaur()) output(" underside");
		else output(" midsection");

		output("\n\n<i>“I wonder if I could convince Gwen to take some kind of dick growth drug and knock me up,”</i> she mumbles, almost to herself, before shaking her head and turning back to you.");
	}
	else
	{
		output("\n\n<i>“Let’s have a little fun, shall we?”</i> she asks teasingly.");
	}

	//var doMale:Boolean = !pc.hasVagina() || (pc.hasCock() && rand(2) == 0);
	var doMale:Boolean = pc.hasCock() && (pc.totalVaginas() <= pc.blockedVaginas());

	if (doMale)
	{
		var cIdx:int = pc.biggestCockIndex();

		output("\n\n<i>“There’s always stress to be worked out down here,”</i> she jokes, administering long strokes along your pelvis with both thumbs. You sigh as her finger reach the base of [pc.eachCock]. Instead of taking");
		if (pc.cocks.length == 1) output(" it");
		else output(" them");
		output(" in a firm grasp, she lets two fingers glide along the length of your [pc.cock "+ cIdx +"]. Untempered lusts rise at her barest touch, a coalesced heat and need that follows her leading digits. The feeling builds, alternating between your [pc.cockHead "+ cIdx +"] and your");
		if (pc.balls <= 0 || pc.ballSize() <= 0) output(" loins.");
		else output(" [pc.balls].");

		output("\n\n<i>“Holding it in is no good, that will only make you more stressed. Won’t you just let it out?”</i> she asks tenderly, and you almost do. You can feel your prostate tighten in preparation, ready to give in to her demands, but you rein it in with great effort. This feeling is too good, and you <i>need</i> to feel it for just a little longer. The dusky amazon clicks her tongue at your resistance.");

		output("\n\n<i>“That won’t do. I told you to let it out, so please, cum,”</i> her last word is a whispered command, bringing with it a rush of blinding pleasure. Control is wrested from your mind, and [pc.cumColor] jizz");
		if (pc.cumQ() <= 100) output(" spurts onto your stomach");
		else if (pc.cumQ() <= 500) output(" coats your stomach");
		else if (!pc.isTaur()) output(" paints your [pc.chest]");
		else output(" spills over your lower body and onto the massage bed");
		output(". The intense spasms of orgasm rush out of you as quickly as they came, leaving you feeling utterly relaxed as the buxom half-breed wicks your [pc.cum] away.");
	}
	else
	{
		var p:int = pc.pickUnblocked();
		output("\n\n");
		if (pc.hasCock()) output("<i>“You didn’t think I’d forget about this, did you?”</i> she teases");
		else if (pc.vaginas.length == 1) output("<i>“There’s always stress to be worked out down here,”</i> she jokes");
		else output("<i>“I’m always surprised by the variety of body types we get here,”</i> she marvels");
		output(", methodically squeezing your inner thighs. She lets two fingers slip between your folds, slowly circling the hole. You gasp as she slips inside, the penetration made all too easy by her natural lubricant.");

		output("\n\nShe wastes no time, plugging your [pc.cunt " + p + "] with");
		if (pc.vaginas[p].looseness() <= 1) output(" a single digit");
		else if (pc.vaginas[p].looseness() <= 3) output(" a pair of digits");
		else output(" her whole hand");
		output(". Her skin is slick and warm, caressing your insides with delicate devoir. At first her movements are broad, searching for <i>“stress points”</i> along your inner walls and focusing in when her touch brings a moan to your lips. Her free hand massages your [pc.chest] as she works, splaying as she draws it down your midsection to repeat the movements.");

		output("\n\nIn no time her expert strokes bring your [pc.legs]");
		if (!pc.isNaga()) output(" locking together");
		else output(" coiling tight");
		output(". Shudders run through your entire body, arching you against the bed for endless moments until release takes you back to the form fitting cushion.");
		if (pc.hasCock())
		{
			output(" [pc.eachCock] spurt");
			if (pc.cocks.length > 1) output("s");
			output(" a single extra strand of [pc.cum], twitching in defeat.");
		}
		output(" Your heart thunders in your chest, the only muscle with any semblance of urgency remaining.");
	}

	output("\n\n<i>“Here, you need help getting up? Come on, let’s get you up,”</i> Eimear encourages, hefting you to a standing position. You need a little help for the first few feet, but regain your composure by the time you leave the room.");

	output("\n\n<i>“Thanks,”</i> you express hoarsely, retrieving your [pc.gear] and heading back to the main shop. Gwen is waiting for you in the lobby, giving a gleeful shriek when Eimear picks her up in a full body hug and spins her around.");

	output("\n\n<i>“Alright, now we can head home. Hope to see you again soon, [pc.name],”</i> she remarks as the three of you exit the building. The oddly matched couple head off in the direction of the elevator, leaving you to decide what to do next.");

	var diffHours:int = 22 - hours;
	processTime(diffHours * 60);

	pc.orgasm();

	currentLocation = "UVI F34";
	
	IncrementFlag("HUNGOUT_CFS");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function cfsHolidayShopping():void
{
	flags["CFS_HOLIDAY_SHOPPING"] = 1;
	
	clearOutput();
	clearMenu();
	author("Gardeford");
	showName("\nGWEN");
	showBust("CFS_GWEN");
	
	output("As you near carbonado, you notice that only Gwen is standing there to meet you. She’s completely bundled up in a snug parka, looking warm enough to brave the planets chill. She waves as she sees you, shouting a greeting across the nearly empty thoroughfare.");
	output("\n\n<i>“Hey [pc.name]! Emi was in a rush to set up for holiday videos, and I got stuck with a last second customer, so she went home early,”</i> You brace yourself as she jumps into an enthusiastic hug and kiss, wrapping around one of your arms.");
	output("\n\n<i>“Since I have you alone for a bit, I figured I would poach you to help me pick out a Christmas gift,”</i> she tugs you toward the massive elevator tunnel.");
	output("\n\n<i>“");
	if(pc.isNice()) output("Why don’t you just design an outfit for her?");
	else if(pc.isMischievous()) output("Why not just cook up some sexy lingerie?");
	else output("Can’t you just make her an outfit or something?");
	output("”</i> you ask on the way planetside.");
	output("\n\n<i>“That’s dumb. I can think up clothes for her any time during the year. Giving them as gifts would be cheap, plus,”</i> she looks around for a moment, surveying the totally empty elevator platform, <i>“I think I’d prefer her out of her clothes for Christmas.”</i>");
	output("\n\nIt’s hard to argue with the knowing look she gives you, so you reply with a chuckle. The platform comes to halt with a hydraulic hiss, rocking the two of you toward the door as you think about gifts. Come to think of it, you don’t even know where you’ll be shopping.");
	output("\n\n<i>“I called a taxi when I got done closing up shop, it should be around here somewhere. There, I think!”</i> she points to a frost covered hover car, parked near the elevator base.");
	
	processTime(10+rand(6));
	
	addButton(0, "Next", cfsHolidayShoppingII, undefined, "", "");
}

public function cfsHolidayShoppingII():void
{
	clearOutput();
	clearMenu();
	author("Gardeford");
	showName("\nGWEN");
	showBust("CFS_GWEN");
	
	if(pc.isTaur())
	{
		output("<i>“Pff! We don’t need a car, I can get us wherever you want to go, just point me in the right direction,”</i> you say, patting your rump invitingly. The coat wrapped puazi doesn’t respond immediately, but turns away from the taxi with a blush in her cheeks.");
		output("\n\n<i>“O-oh. That’s not offensive or anything? I was afraid it would be like asking a Veletan if they were pregnant,”</i> she asks, stepping hesitantly in your direction.");
		output("\n\n<i>“I wouldn’t have offered if it was. Just hop on! It saves money, too,”</i> you insist. Relenting, Gwen lets you help her up onto your back, and you begin trotting off. She guides you down Uveto's main thoroughfare, passing a few people walking in the mostly deserted night streets. Some toss jealous looks in her direction, but by now she’s fully invested in the experience, and the aura from your heat belt probably doesn’t hurt.");
		output("\n\nEventually, you wind up at a small mall complex. ");
	}
	else
	{
		output("The two of you climb in the back, and Gwen inputs the location and a credit chit into the machine. The car takes off immediately, moving through the icy streets at a brisk pace. The windows are so frosted over that you can’t see anything beyond the blurred shapes of the occasional bundled-up passerby.");
		output("\n\nThe taxi takes you to a mall complex, similar to the one on the skydeck. ");
	}
	output("This one lacks the flair and extravagance for appealing to alien tourists, however, containing simple shops and average mall attractions. With all the people you get to know it’s relaxing to have a moment to shop around for nothing in particular. After an hour of aimless wandering, Gwen claps on your arm and rushes into a small crafts store.");
	output("\n\n<i>“Oh! She’d love this!”</i> she exclaims, showing you a small box of cream colored cloth. Modest text on the boxes cover declares it to be super absorbent memory cloth. Gwen turns the box over to show you a neat little descriptive section. The cloth strips help liquid secreting races handle water sensitive objects.");
	output("\n\n<i>“Isn’t most of the stuff at your house waterproofed?”</i> you ask, raising an eyebrow. The bright eyed puazi harrumphs, dismissing your doubts.");
	output("\n\n<i>“Of course it is, but Emi still gets annoyed when she leaves wet spots on the touchpads. Based on the little chart they have there I think these should last around a year for someone like her,”</i> The excited alien chatters on her way to the checkout counter. At the checkout Gwen also acquires a small box to place her gift in, wrapping it up in a single purple ribbon.");
	output("\n\nThe two of you wander around the mall for a little more time, stopping for ice cream at a small parlor. The clerk gives you both extra since the night has been quiet, heaping a third scoop into your glasses. Your shopping partner beams as she eats, practically glowing bright as the exotic fruit dotting her sundae. When you’re both finished she stands with a sudden urgency.");
	if(!pc.isTaur())
	{
		output("\n\n<i>“Come on, Emi’s probably wondering where we are,”</i> with her shopping done, Gwen pulls you back out to the taxi with single minded haste. She types her address into the auto-driven vehicles control panel, and it kicks into gear with a whirr of energy. You watch the blurry figures through the frost on the windows as the hover car pulls back onto Uveto’s main streetways.");
		output("\n\nSuddenly, the taxi slows and pulls to the side, leaving you parked at the roadside. There are no warning lights going off, so you look to your side and immediately find your answer. Your puazi shopping partner is paused in the act of hitting the taxi’s emergency stop button, her shaking finger still jamming it down. Her breath is coming in deep, steamy blankets, and her eyes are already half glazed with uncomprehending lust as she turns in your direction.");
	}
	else
	{
		output("\n\n<i>“Come on! Emi’s probably wondering where we are,”</i> With her shopping done, Gwen pulls you out of the mall, raring to go. You help her up onto your back, trotting back toward her apartment. Given that most of the walk was along the main street, you have a pretty good idea of where you’re going. ");
		output("\n\nSuddenly, you feel your riders hands loosen from their grip around your waist. They travel up over your [pc.belly] and squeeze your [pc.chest]. Her breathing grows ragged, and you can feel her body heat rising over the temperature from your heat belt. It seems you might have made a terrible miscalculation.");
	}
	
	processTime(90+rand(30));
	
	addButton(0, "Next", cfsHolidayShoppingIII, undefined, "", "");
}

public function cfsHolidayShoppingIII():void
{
	clearOutput();
	clearMenu();
	author("Gardeford");
	showName("\nGWEN");
	showBust("CFS_GWEN_NUDE");
	
	if(!pc.isTaur())
	{
		output("<i>“Shorry [pc.name]... I jush need to shtop a bit. Would you mlem alngh mngh,”</i> she continues trying to talk as her tongue drives a wet path up your exposed neck, dotting it at random with sloppy kisses. She fervently nuzzles against you, savoring the touch of your " + (pc.skinType == GLOBAL.SKIN_TYPE_SKIN ? "flesh against her own" : "[pc.skinfurscales] against her skin") + ". As her tongue explores you her hands reach out to join them, feeling and squeezing your [pc.chest] and [pc.belly].");
		output("\n\nWith some effort, you pull her from your neck and into a kiss. The instant your tongue passes her lips you feel a quaking shudder run through her whole body. Without even a moan, she melts into you, her muscles slackening save a few subtle tremors. Feverish heat pours from the neck of her jacket it, and you pull at the zipper like the ribbon on a freshly wrapped gift.");
		output("\n\nUnderneath the coat she’s wearing nothing but a sheer tank top, soaked with sweat. You can see her nipples poking against the fabric, looking painfully erect in the dim light. The sense stricken slut tries desperately to get her pants off, but her fists just clench around the belt when you move to help.");
		if(pc.hasVagina())
		{
			output("\n\nYou forgo actually removing her pants for the moment, slipping your hand past hers with a fluid motion. The bristly hair on her crotch is utterly soaked with juices already, a hot, sticky flood that seeps through her panties as well. Wasting no time, you press forward over her cushiony mound, attacking her clit with two fingers. Great splashing schlicks emanate up as you work, pinching her engorged bud with your thumb.");
			output("\n\nNow a half-noise escapes her. Not quite a moan, but a silent orgasm escaping in sound. She leans close, whispering the melodic gasp in your ear. With it something snaps to attention within her. She tugs at your [pc.gear] with manic comprehension, baring your crotch to the open air, and dives into it. Heated breathes wash over your mons, but with her awkward angle, knelt beside you on the car’s cushion, she cant get at your [pc.vagina].");
			output("\n\nContent to let her squirm for the moment, you re-assert your control over the situation. With one hand, you swiftly hike the prurient puazi’s pants down over her bountiful bottom. You take an avaricious grope of one of her pillowy buttocks before giving the black-orange flesh a resounding smack. Shivers entirely independent of the quivering flesh run up her back, delivering the first real moan of the night to Gwen’s lips.");
			output("\n\n<i>“Ohhhhguh, more toushing, pleash,”</i> she cries. You oblige her desperation, kneading her supple ass-flesh in your hand. Her hungry cunt sucks at your fingers as you move them over the edge of her entrance, begging for you to fill her. Soft, wet pressure dabs at your [pc.clit] as the needful slut stretches her long tongue, lapping at you as she presses her face into your " + (pc.isNaga() ? "coiled tail" : "closed legs") + ". Each strained lick brings an increasing pleasure to your budding clit, and you feel your hips aching to buck closer to its source.");
			output("\n\n<i>“You’ve been such a good girl, buying a gift for your girlfriend. A good girl like you deserves a reward,”</i> you purr, " + (pc.isNaga() ? "unfurling your coils" : "opening your legs") + " as you speak. Every time the words <i>good girl</i> leave your lips, you feel her ring tighten on the tips of your fingers. Even in the throes of her lust filled frenzy, her body responds to the praise.");
			output("\n\nGwen dives into your [pc.vagina] like it’s the only thing she needs in the world, making love to your crotch with zealous fervor. The gentle licks from before now send pulses of bliss through your body as her long, grooved tongue rubs over your [pc.clit]. Her hands grip your [pc.thighs] to pull herself more vigorously into her task. You lean back against the door, making it easier for the prurient puazi to get at her prize.");
			output("\n\nFrom this angle you can see the unfocused yearning in the alien merchant’s eyes. Now that she has what she wants, her frantic movements settle into a more measured pace. Her hands wander over your body, exploring your [pc.butt], your [pc.chest], and anywhere else she can reach without breaking contact with you for more than a second. Frequent orgasmic tremors travel up her spine, causing a mesmerizing jiggle in her bubble butt. Tasting you seems to be more than she needs to get off.");
			output("\n\nFeeling your own impending orgasm, you grasp gwen by the hair, mashing her face into your [pc.vagina] and " + (pc.isNaga() ? "curling your tail around her head and neck" : "wrapping your legs around her head") + ". The ardor afflicted alien doesn’t even struggle to breathe, quivering and moaning softly in your grasp. You hear intermittent spatters on the taxi’s seat as she shudders, squirting hot femcum onto her feet.");
			output("\n\nYou ride out your orgasm in silent euphoria, muscles clenching almost painfully taut. The puazi’s tongue is like a superheated dildo inside you, its grooved surface setting off aftershocks long after you would’ve settled down normally. As the pleasure slowly fades, your strength joins it, and you droop into utter relaxation. Gwen lays with her head on your hip, still lost to the world. She breathes heavily, grinning absentmindedly and licking her lips.");
		}
		else
		{
			output("\n\nYou jerk her pants down with a few forceful tugs, and once you’ve conquered her mountainous thighs they slip off rather easily. Bountiful assflesh slaps onto the leather seat, splashing in feminine juices that had soaked through her clothes. The whole while your puazi partner licks at your neck and cheek, whispering beckoning moans in your ear. Wandering hands slip down to your crotch, meeting [pc.eachCock] along the way.");
			output("\n\nAn excited gasp escapes her lips as her hands close around your [pc.cockBiggest], so full of longing that it sends a throbbing twinge of pleasure through your body. She’s pulled away from her kisses, staring at your [pc.cockBiggest] with her tongue lolling from her mouth and a needful fire in her eyes. Before she can do anything drastic, you take her chin in your hand and force her eyes back to you.");
			output("\n\n<i>“Ah ah, not so fast. You have another mouth for that. I’m not done with this one,”</i> you command. The fight leaves her in a heartbeat, though her hands still keep her anchored to your crotch. You pull her into a kiss that she reciprocates as best she can, her long tongue rubbing against your teeth and the roof of your mouth. One of her hands works your length, while she rubs the palm of the other over your [pc.cockHeadBiggest].");
			output("\n\nA soft moan escapes your lips, goaded by her ministrations, and you feel her pause for a moment. Shudders run through her body as she cums, urged on by the simple sound of your pleasure. She manages to lift herself to face you, sitting on your lap. The heavy heat of her body seeps into you, only growing in intensity as you shrug out of your [pc.gear].");
			output("\n\n[pc.EachCock] throb" + (pc.totalCocks() == 1 ? "s" : "") + " needfully as the bristly hair around her cunt brushes against your length. You line up your [pc.cockHeadBiggest] to her cunt and massage her butt and thighs in an attempt to coax her to relax. She doesn’t need much convincing. An enormous sigh escapes her lips as she sinks down onto your [pc.cockBiggest], eyes rolling back and cheeks flush with pure, natural lust.");
			output("\n\nIt takes you only a few seconds to realize that this isn’t going to work. While perfectly willing and eager, your rider is in no condition to move with any effort. Perhaps if you were a puazi, and she a human, simply sitting like this would be enough to have you filling her womb to the brim. For now, though, you’ll need to take the lead.");
			output("\n\nThe ardorous alien offers no resistance as you swing her to the side, letting her down onto the seat and repositioning to be on top. Your task is made slightly awkward by the fact that her legs clamp around your waist, not letting your [pc.cockBiggest] leave her bliss blazed cunt for a second. Before you get to work, you pull up the sheer, sweat soaked top that “covers” her breasts, letting the DD-cups flop free in the open air. Stiff, copper colored nipples pop up, released from their fabric prisons.");
			output("\n\nYou begin to slowly thrust into the prurient puazi, but with her frenzied biological urges casting their spell her reaction is astounding. Her body tenses, and she hugs tightly to you, only to push away, gritting her teeth as a moan attempts to escape her lips. It comes in loud grunts, bursting through anything that was left of her tattered inhibitions. You glance up as she pushes you, noticing that the frosty coating on the glass is beginning to melt.");
			output("\n\n<i>“Careful, If you’re any louder the people outside might... might stop to look...”</i> you begin, trailing off as you return your attention to Gwen. Her eyes are fully glazed over, taking heavy breaths that set her stomach and breasts to jiggling. She smiles, loving and uncomprehending. Any stranger off the streets of Uveto could look in the car now, and this overstimulated slut would let you breed her in front of every single one.");
			output("\n\nAnd if you don’t find a way to quiet her down they just might. You gather up spit in your mouth, leaning over the lust-drunk lady and letting it drip right down. Her moans still, and her eyes lock on your mouth, still unfocused but somehow uncomfortably aware of what’s happening. She opens her mouth wide, tongue lolling out to reach for your saliva like it’s the only sustenance she needs in the world.");
			output("\n\nHer insides clench tightly around your [pc.cockBiggest] as the first drops hit her tongue, and her eyes roll back into her head. You break off the trail, letting the whole mass of spit drop into her mouth. She gives a half choked cry, her back arching as her legs shoot out, kicking the door behind you. Tremors run through her thighs as she tries and fails to re-secure herself around your waist. She doesn’t need to.");
			output("\n\nYou take as firm a grip as you can gather on her sweat-slicked hips and begin bucking into her, pressing close and kissing her in the same series of motions. Slick splashes sound from between your legs as superheated femcum spurts out onto [pc.eachCock], creating a resounding slap as your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.hips]") + " slap against her expansive buttocks. Pulling away from the kiss, you steady one of her quaking breasts, lavishing the stiff nipple with attention. The rigid bud is a stark contrast to the pillowy flesh that surrounds it, offering a token resistance as you press your face into the bright orange titmeat.");
			output("\n\nGwen’s instincts seem divided, with one hand pushing and the other pulling you into a tighter embrace. She seems to sense your impending orgasm before you do, grasping your [pc.buttcheeks] with both hands, and pulling you further inside her than her legs can pull alone. Her chest heaves, almost on the verge of hyperventilating as she stares through you. Her blurry gaze settles on your throbbing member.");
			output("\n\nOnce she has you locked in you realize that it’s too late to prevent what’s coming. You struggle to buck your hips, to move in any meaningful fashion, but the impulse bound puazi clutches tight, sealing you in the perfect position to pour your seed into her womb. Aching bolts of pleasure send shivers through your body as you consign yourself to your fate. The pressure built up inside you refuses to be fully contained.");
			output("\n\nYour partner lets out an elated gasp as a spurt of [pc.cum] gushes from [pc.cockBiggest], the herald of what’s to come. You grit your teeth as the full flood follows, ");
			if(pc.cumQ() < 100) output("spurting a few extra shots directly into her womb");
			else if (pc.cumQ() < 1000) output("filling her womb to the brim");
			else if(pc.cumQ() < 5000) output("packing her womb and sending a few pressurized spurts back onto the seat");
			else output("feeling the surges of [pc.cum] fill her instantly before gushing back out and spreading over the seats beneath you");
			output(". With the last of your strength you pull away, leaving a last jet of [pc.cum] on her hair covered pubic mound.");
			output("\n\nWith that you collapse backward. Gwen wets her fingers in her cum-soaked fuck-hole, bringing a handful of [pc.cum] up to her mouth. She tries to suck the sticky mess from her fingers, but not before her twitching muscles paint [pc.cumColor] streaks on her cheeks.");
		}
		output("\n\nYou recover first, hitting a button to restart the taxi’s previous path. You clean up as best as you can on the way, but you doubt there’s any way to disguise the smell. This taxi will need a thorough cleaning. Gwen flops around drunkenly as you redress, and doesn’t fight when you help her slip loosely back into her clothes. She still hasn’t recovered by the time you make it back to her apartment, so you half support half carry her to the door.");
	}
	else
	{
		output("<i>“Shorry [pc.name]. Can we pull over for a shecond. I jusht wanna hagl mngm mllmm,”</i> she continues talking even as her tongue trails a wet line up your neck, punctuated by sloppy kisses. You feel your own body heat rise in response to hers, and struggle to maintain your composure as you walk.");
		output("\n\n<i>“Don’t worry Gwen, we’ve just got a minute or two more till we reach your apartment. We can take care of it when we get there. Besides, it’s too cold to get naked, right?”</i> You do your best to sound confident, and mistakenly take a look over your shoulder. Your alien passenger is halfway through shrugging out of her coat, with nothing underneath it except a sheer, sweat-soaked tank top that clings to every curve of her chubby figure. Her coppery nipples stand in stark relief against the fabric, straining it with every breath. She stares at you with a dwindling comprehension of your words.");
		output("\n\n<i>“No naked, don wanna freeze,”</i> she mumbles, slipping her arms back into the coat. She makes no move to zip it, instead turning and lying flat on your back. Her warmth seeps into your [pc.skinFurScales], and you feel ");
		if(pc.isHerm()) output("your twin sexes twitch");
		else if (pc.hasCock()) output("[pc.eachCock] twitch" + (pc.totalCocks() == 1 ? "es" : "") + "");
		else output("[pc.eachVagina] twitch" + (pc.totalVaginas() == 1 ? "es" : "") + "");
		output(" in response.");
		output("\n\n<i>“But yooouuuu’re naked here,”</i> she whines. A pleasurable chill runs up your spine as she spreads your [pc.asscheeks]" + (pc.hasTail() ? ", and moves your [pc.tail] out of the way with her chin" : "") + ". Before you can do anything to answer her, you feel a wet, slippery heat on your [pc.ass]. You stumble, catching yourself at the last moment and casting a sinfully short glance over your shoulder. You can’t see much of the puazi beyond the back of her head bobbing in time with the kisses on your backside, but you also get a perfect view of her delicious derriere as she grinds against you. The motion leaves wet splotches of femcum through her pants, and you can see tight, orgasmic shudders run through her at odd intervals.");
		output("\n\n<i>“Gwen, There are other people on the street. We’ve got to make it home first,”</i> you argue halfheartedly. If she hears you at all through her lust addled fervor, she chooses to ignore your warning. Instead, she dives face first between your [pc.asscheeks], greedily lapping at your [pc.asshole] with her grooved tongue. Each brush of her lips sends a stronger signal to your brain. Stop walking and <b>Let. Her. Lick.</b>");
		output("\n\nYou muscle through the command, teetering forward even as your body commands you to stop. With each step you feel her weight more intensely, feel her jutting nipples grinding against your back. You begin to fantasize about what she could do without your movement making it more difficult. Where she could stick that long tongue. Without realizing it, you’ve come to a complete stop in the middle of the sidewalk, a handful of onlookers staring in disbelief.");
		output("\n\n<i>“We’ll be fine, She had a little too much to drink and I need to get her back ho-Oh-mmmm,”</i> you begin to make an excuse, your words transforming into a gasping moan as Gwen presses harder into you, her tongue working its way deep into your [pc.asshole]. ");
		if(pc.hasCock())
		{
			output("\n\nThe striated organ rubs relentlessly against your prostate, and you feel [pc.eachCock] instantly throb into full hardness, slapping your undercarriage. The feverish puazi’s hands leap into action, caressing your [pc.cockBiggest] from tip to hilt. " + (pc.balls > 1 ? "One hand hefts your [pc.balls] till they rub against her face, and you feel every crest of molten air as she inhales your essence, breathing your musk like it could replace oxygen." : "") + "");
			output("\n\nYou struggle to form thoughts. ‘No. don’t! There are people watching’, But these rational reactions are swiftly beaten away by the baser impulses. ‘Feel good. More, <b>Cum!</b>’ Your eyes roll back, and you grit your teeth as the last command reaches your sex. Spurts of [pc.cum] shoot from [pc.eachCock], ");
			if(pc.cumQ() < 100) output("spattering the street with [pc.cumColor] dots");
			else if(pc.cumQ() < 10000) output("painting [pc.cumColor] streaks on the sidewalk");
			else output("painting the sidewalk [pc.cumColor]");
			output(". Your legs buckle, and you collapse into your own fluids.");
		}
		else
		{
			output("\n\nThe striated organ writhes like a living thing inside you, and Gwen’s hot breath on your [pc.vagina] only serves to expedite your pleasure. Her hands jump into action as you gasp in bliss, one masturbating your [pc.clit] with mindless furor. The other holds your lips open long enough for her to lower her head a little more. Lightning lances of lust dart through your rump as her tongue retracts from your [pc.asshole], only to dive into your [pc.vagina] with greater energy. She doesn’t even attempt to breathe as she makes love to your sex.");
			output("\n\nYou struggle to form thoughts. ‘Wait. This isn’t the time. So many people watching’, But all these rational thoughts swiftly lose out to the baser impulses. ‘So good. Maybe if I just <b>Cum</b> a little bit!’ Your eyes cross, and you grit your teeth as the last command hits [pc.eachVagina]. ");
			if(pc.girlCumQ() < 100) output("Droplets");
			else if(pc.girlCumQ() < 1000) output("Squirts");
			else output("A flood");
			output("\n\n of [pc.femCum] run down your legs and onto the street below. Your legs buckle, and you collapse into a puddle of your own juices.");
		}
		output("\n\nTime seems to pass in slow motion for a while, as Gwen continues to lick and prod at you, prolonging the flood of pleasure to your brain. People pass by you on the street, and you catch a couple words of encouragement.");
		output("\n\n<i>“Stay strong " + pc.mf("dude", "gal") + ", having a puazi girlfriend is tough,”</i> one man says as he passes.");
		output("\n\nMiraculously, no one takes a pass at either you or Gwen, and you recover enough to move in what seems like an hour, but your codex informs you to be only about five minutes. Gwen is all but passed out on your back, mumbling about dessert. You struggle to your feet and walk shakily for the last minute it takes you to reach the apartment, gently helping gwen down off your back so she doesnt hurt herself.");
	}
	
	processTime(60+rand(30));
	pc.orgasm();
	
	addButton(0, "Next", cfsHolidayShoppingIIII, undefined, "", "");
}

public function cfsHolidayShoppingIIII():void
{
	clearOutput();
	clearMenu();
	showCfsHangouts();
	
	output("<i>“Hey, what took you guys so lo- oh! Ooh,”</i> Eimear says as she opens the door for you. Gwen giggles and teeters over into her arms.");
	output("\n\n<i>“Emi, heehee. Emi Emi,”</i> she mumbles, nestling into the taller woman’s cleavage.");
	output("\n\n<i>“Yes, did you have a tough time shopping? Did you even make it to the shopping?”</i> she mocks, rubbing the chubby puazi’s back.");
	output("\n\n<i>“Don’t worry, we made it that far. This was all on the ride back,”</i> You assure her. She tosses a sympathetic smile your way.");
	output("\n\n<i>“Well, I’m glad it was you and not some stranger. That’d be the last thing I want for Christmas. Thank you,”</i> She says, stepping forward and planting a kiss on your cheek.");
	output("\n\n<i>“Any time, she’s more than enough gift for me,”</i> you laugh.");
	output("\n\n<i>“Emi </i>Emi<i>,”</i> adds Gwen, muffled by tit.");
	output("\n\n<i>“Right, let’s get you inside and get you something to drink. Feel free to stop by when we’re a little less occupied, [pc.name],”</i> Eimear smiles, leading her lust addled lover back into the house.");
	output("\n\nYou turn, contemplating where to go next. Thoughts of other Christmas activities fill your head, and you start back out onto the chilly Uvetan streets.");
	
	processTime(20+rand(10));
	
	currentLocation = "UVI H34";
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}