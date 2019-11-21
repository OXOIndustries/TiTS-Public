// milking scene: https://docs.google.com/document/d/1w3zwGo1yy_OxUtgkmmsRRUdPBrZE48G3G-c4FEIyq7s/edit#

public function saenHeader(nude:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showSaendra(nude);
}
public function saendraBustDisplay(nude:Boolean = false):String
{
	var str:String = chars["SAENDRA"].bustDisplay;
	
	if(nude) str += "_NUDE";
	
	return str;
}
public function showSaendra(nude:Boolean = false):void
{
	showBust(saendraBustDisplay(nude));
	showName("\nSAENDRA");
}
public function showValeria():void
{
	showBust("VALERIA");
	showName("\nVALERIA");
}

public function saendraPhoenixMailGet():void
{
	var timeStamp:uint = GetGameTimestamp();
	// Keep unlock in chronological order from her later mail!
	if (MailManager.isEntryUnlocked("saendraxpack1")) timeStamp = MailManager.getEntry("saendraxpack1").UnlockedTimestamp - 1;
	// Unlock mail!
	goMailGet("saendrathanks", timeStamp);
}

//Drop this shit in every Phoenix room cause Savin is a jerk.
public function phoenixLocationSetter():Boolean
{
	if(flags["FALL OF THE PHOENIX STATUS"] == 1)
	{
		rooms[currentLocation].planet = rooms[shipLocation].planet;
		rooms[currentLocation].system = rooms[shipLocation].system;
	}
	//Reset soz it updates automagically.
	showLocationName();
	return false;
}

public function thePhoenixShipIsOpen():Boolean
{
	if(flags["SAENDRA GONNA GO GET A COCK"] == 2) return true;
	return (flags["SAENDRA PHOENIX AVAILABLE"] != undefined);
}
public function thePhoenixShipBonus(btnSlot:int):void
{
	output("\n\n<i>The Phoenix</i> is nearby, only a stones-throw away from your own ship, docked in a much smaller neighboring hangar.");
	
	if (thePhoenixShipIsOpen()) addButton(btnSlot, "The Phoenix", move, "PHOENIX RECROOM");
	else addDisabledButton(btnSlot, "The Phoenix", "The Phoenix", "This ship is locked and cannot be entered.");
}

public function saendraBarAddendum(slot:int = 7):Boolean
{
	if (saendraAtBar())
	{
		if (flags["SAEN MET AT THE BAR"] == undefined)
		{
			saenAtTheBarFirstTimeEvent();
			return true;
		}
		else
		{
			output("\n\nThe firey red-head you saved from the pirates aboard <i>The Phoenix</i> is here, tucked away in one of the many booths available throughout the bar.");
			if (flags["SAENDRA_XPACK1_STATUS"] == 5)
			{
				addButton(slot, "Saendra", sx1TalkFriend, undefined, "Saendra", "Talk to Saen about her friend. Can you help her out?");
			}
			else
			{
				addButton(slot, "Saendra", meetSaenAtTheBar, undefined, "Saendra", "See what Saen is up to.");
			}
			return false;
		}
	}
	return false;
}

public function saendraAtBar():Boolean
{
	if (flags["SAENDRA_DISABLED"] != undefined)
	{
		return false;
	}
	
	if (flags["SAENDRA GONNA GO GET A COCK"] == 1 || flags["SAENDRA GONNA GO GET A COCK"] == 2)
	{
		return false;
	}
	
	if (flags["SAENDRA_XPACK1_CREDITTIME"] != undefined && (GetGameTimestamp() - flags["SAENDRA_XPACK1_CREDITTIME"] <= (24 * 60)))
	{
		return false;
	}
	
	if (flags["SAENDRA_XPACK1_STATUS"] != undefined)
	{
		switch (flags["SAENDRA_XPACK1_STATUS"])
		{
			case 0: // not started
			case 5: // beat pirate group
			case 6:
			case 8:
			case 9:
			case 10:
			case 11:
			default:
				return true;
				break;

			case 1: // waiting at elevator
			case 2: // timer expired to elevator
			case 3: // visited elevator location after expiration
				return false;
				break;
		}
	}
	
	if (flags["FALL OF THE PHOENIX STATUS"] == 1)
	{
		return true;
	}
	else
	{
		return false;
	}
}

public function saendraAffection(arg:int = 0):int
{
	if (flags["SAENDRA AFFECTION"] == undefined) flags["SAENDRA AFFECTION"] = 0;
	if (flags["SAENDRA_MAX_AFFECTION"] == undefined) flags["SAENDRA_MAX_AFFECTION"] = 69;

	if (arg != 0)
	{
		flags["SAENDRA AFFECTION"] += arg;
	}

	// capped!
	if (flags["SAENDRA AFFECTION"] > flags["SAENDRA_MAX_AFFECTION"]) flags["SAENDRA AFFECTION"] = flags["SAENDRA_MAX_AFFECTION"];

	trace("Saendra Affection: " + flags["SAENDRA AFFECTION"]);
	return flags["SAENDRA AFFECTION"];
}

// Procs the first time the player enters Anno's bar after rescuing Saen
public function saenAtTheBarFirstTimeEvent():void
{
	flags["SAEN MET AT THE BAR"] = 1;

	clearOutput();
	author("Savin");
	showName("\nSAENDRA");
	showBust(saendraBustDisplay(),"VALERIA");

	output("As you step into Anon’s, you hear a sharp whistle over the low din of conversation, followed by a voice calling <i>“Hey, hero!”</i> Searching the dark bar room, you eventually spot a familiar figure among the patrons: the red-headed freighter captain you rescued from the Black Void not all that long ago. Surprised to see the fiery captain again, you make your way over to her table. She makes a gesture to the bartender, and as you take a seat across from her, a pair of steins are dropped off: yours full of top-shelf booze, hers full of some salty-smelling white cream. ");

	output("\n\nAs the captain lifts her glass, you see something’s very different about her since the last time you saw her: her left arm ends at the elbow, after which it’s replaced by a glistening chrome prosthetic, mimicking the shape of her remaining limb. Seeing where your eyes are wandering, the captain sighs and shrugs, looking at the metallic hand grasping her stein. ");

	output("\n\n<i>“Just a flesh wound,”</i> she chuckles dryly, followed by a long drink that leaves a thin white moustache on her lip. <i>“Could have been a lot worse, though...”</i>");

	output("\n\n<i>“Speaking of which: thanks again for the timely rescue, hero,”</i> she says, giving you an exaggerated wink as she leans back in her seat, cradling her frothy, potent-smelling drink. <i>“Thought I was a goner that time for sure. You sure know how to make an entrance, don’tcha? Oh, the name’s Saendra by the way. Captain Saendra en Illya... or just Saen to my friends. Pleasure to meet you.”</i> She extends her flesh-wrought hand, and you shake it vigorously.");

	output("\n\n<i>“Steele. [pc.name] Steele,”</i> you say, wincing slightly as the untrimmed ivory claws on her gray-furred hand brush against your skin, but her wringing grip is surprisingly gentle for all its strength.");

	output("\n\nAs you and the captain release each other, a bright blue light flashes on her silver-colored mechanical hand and a holographic fairy woman appears, just a touch taller than Saen’s palm, fluttering on her translucent butterfly wings with a short sundress flowing around her knees. With a faintly English accent, the hologram announces, <i>“Port authority wants a word, Saen. Something about docking fees and empty accounts. Again.”</i>");

	output("\n\n<i>“And the virtual vixen here’s Valeria,”</i> Saen adds, nodding to her wrist. <i>“I think you’ve met.”</i>");

	output("\n\n<i>“Hey!”</i> the A.I. says, smiling up at you. <i>“Sorry, I didn’t notice you there. Long time no see, [pc.name]. Good to see you.”</i>");

	output("\n\nYou give her a polite nod as she turns urgently back to her captain. <i>“Seriously, furball, we’re dead broke. We have to dig up some credits or we’re grounded. Uh, grounded-er.”</i>");

	output("\n\n<i>“We’ll talk about it later, Val. Just stall ‘em for a little. I’ll take care of it.”</i>");

	output("\n\n<i>“That’s what you said last ti-”</i>");

	output("\n\nWith a button press, the A.I. is banished back into Saendra’s wrist. ");

	output("\n\n<i>“So, where were we, hero?”</i> the captain says, leaning in enough to give you a front-row view of her impressive cleavage through the low cut of her shirt, the two heavy orbs of her breasts pressing against the cold tabletop. <i>“Oh, I know. How about the part where I give you a... </i>proper reward<i> for bailing me out of that tight spot, hmm? I like to be very good to my friends, you know,”</i> she says, grinning wolfishly as you feel a warm, soft tail coil around your [pc.leg]. <i>“I’ve got a room upstairs, hero. What do you say you let me show you just how grateful I am?”</i>");

	processTime(7);
	saendraAffection(5);

	clearMenu();
	//[Let’s do it!] [Not right now]
	addButton(0, "Let’s do it!", takeTheRewardYouSlut, undefined, "Take the Reward", "Accept Saen’s reward.");
	addButton(1, "Not Now", dontTakeTheRewardWhaddaYouGayOrSomething, undefined, "Not Right Now", "Turn the reward down.")
}

public function dontTakeTheRewardWhaddaYouGayOrSomething():void
{
	saenHeader();

	output("As politely as you can, you try to excuse yourself. <i>“Sorry. Maybe some other time.”</i>");
	
	output("\n\nWith a <i>tsk</i>, the sultry halfbreed leans back, letting you go. <i>“Aw, killjoy. Well, looks like I’m grounded here for the time being, anyway. If you change your mind, swing back around come evenings. Even if all you want’s a drinking buddy.”</i>");
	
	output("\n\nYou nod, and slip out of the booth, heading towards the door. Over your shoulder, you hear her call, <i>“See you around, hero!”</i>");

	processTime(1);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function takeTheRewardYouSlut():void
{
	saenHeader();

	output("<i>“Alright,”</i> you say, reaching down to stroke the soft tail slithering up your [pc.leg]. <i>“Let’s see this gratitude of yours, captain.”</i>");

	output("\n\nGrinning from ear to ear, the fluffy halfbreed takes you by the hand and pulls you out of the booth. You follow her up the stairs to the bar’s collection of rooms, enjoying the view of her pert, gropable behind swaying with every step. Her pair of dexterous tails gently tease you as you make your way upstairs, flicking across your [pc.chest] or brushing against your thighs until you’re");
	if (pc.hasCock()) output(" hard as a rock");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" dripping wet");
	output(", never letting up until she swipes her keycard and lets you in, the two of you practically tumbling over each other onto the soft bed.");

	output("\n\nGroping, teasing, and kissing, the two of you spend several minutes rolling on the bed: Saen straddling you one moment,");
	if (pc.biggestTitSize() > 0) output(" cupping your breasts");
	if (pc.biggestTitSize() > 0 && pc.hasCock()) output(" and");
	if (pc.biggestTitSize() > 0 && !pc.hasCock()) output(";");
	if (pc.hasCock()) output(" caressing your [pc.cock] through your [pc.gear];");
	output(" the next, you’ve got her pinned beneath yourself, tugging blindly at her belt as she presses your face into her chest, burying you in a valley of her breasts. She gasps softly into your ear as your hand disappears down her pants,");
	if (!saendra.hasCock()) output(" caressing the lips of her wet, inviting womanhood");
	else output(" grabbing the throbbing, turgid shaft of her bristly cock");
	output(". She hooks a clawed hand through your [pc.gear], pulling you into her, trailing kisses along your neck and cheek.");

	output("\n\nFor a second, you part; you’re both panting with lust and desire, hands roaming all over each other. Her voice dripping with raw sexuality, your lover asks, <i>“So how do you want me, hero? I’m all yours....”</i>");

	processTime(8);
	saendraSexMenu();
}

// Repeat meetings at the bar
public function meetSaenAtTheBar():void
{
	saenHeader();

	output("Seeing Saen in her usual spot, you slide into the booth across from the fiery-haired captain and call for a drink.");

	output("\n\n<i>“Heyya, hero,”</i> she says, grinning even as her pair of fluffy tails coil affectionately around your [pc.leg]. She kicks back what’s left of her drink as you say hello, leaning back in her seat with her arm slung over the back and her chest pressed out, straining her blouse in all the right ways. <i>“So what’s up? Just come for the company... or do you wanna blow off some steam?”</i>");

	processTime(1);
	saendrasBarMenu();
}

public function saendrasBarMenu():void
{
	clearMenu();

	//Options:
	//[Talk] [Sex] [Appearance] {If SaenAffection >= 70: [Kiss her]} [Leave]
	//NOTE: Unless otherwise noted, nothing but Sex & Leave will cause the PC to leave; ie, you return to her main menu after each choice made. 
	
	addButton(0, "Talk", talkToSaendraAboutStuffAndThings, undefined);
	if (pc.lust() >= 33) addButton(1, "Sex", saendraSexTalk, undefined);
	else addDisabledButton(1, "Sex", "Sex", "Probably want to be a little lusty yourself before you go bringing up the topic of sex.");
	addButton(2, "Appearance", takeAGoodLookAtSaendra, undefined);
	if (saendraAffection() >= 70)
	{
		addButton(3, "Kiss Her", kissSaendraOnTheLipsAndEverystuff, undefined);
	}
	else
	{
		addDisabledButton(3, "Kiss Her", "Kiss Her", "Maybe if she liked you more and stuff you could totally make out and kiss her on the lips and stuff and things.")
	}

	if (flags["SAENDRA_FEED_MILK"] == undefined) addButton(4, "Her Drink", askSaendraAboutDrink, undefined);
	else if (pc.isLactating() && pc.biggestTitSize() >= 2 && saendraAffection() >= 50) addButton(4, "Feed Her", feedSaendraYourMilk, undefined, "Feed Her", "Give Saendra some of your own sweet cream.");
	else if (saendraAffection() >= 50) addDisabledButton(4, "Feed Her", "Feed Her", "You need to have at least B-cup breasts and be lactating for this.");
	else addDisabledButton(4, "Feed Her", "Feed Her", "Maybe you should get to know her better before trying this.");

	if (flags["SAENDRA_XPACK1_STATUS"] == 5)
	{
		// talk about rescue
		addButton(5, "Her Friend", sx1TalkFriend, undefined, "Saendra’s Friend", "Talk to Saen about her friend. Can you help her out?");
	}
	else if (flags["SAENDRA_XPACK1_STATUS"] == 6)
	{
		// talk about expired rescue
		addButton(5, "Her Friend", sx1SaensFriendExpired, undefined, "Saendra’s Friend", "Ask Saendra about her friend.");
	}
	else if (flags["SAENDRA_XPACK1_STATUS"] == 9)
	{
		// followup about rescue
		addButton(5, "Pirates", sx1TalkPirates, undefined, "The Pirates", "Follow up with Saendra about the pirates. You deserve answers after all of this.");
	}
	// Techie Hotfix
	if ((flags["SAENDRA_XPACK1_STATUS"] == 9 || flags["SAENDRA_XPACK1_STATUS"] == 10) && flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] != undefined && flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == undefined)
	{
		addButton(6, "Tech Guard?", sx1TalkTechGuardFix, undefined, "Ausar Engineer?", "Ask Saendra about what happened to the techie guard during your run with her on Deck 92.");
	}

	addButton(14, "Leave", leaveSaendraAtTheBar, undefined);
}

public function saendraSexMenu():void
{
	clearMenu();

	if (saendra.hasCock()) addButton(0, "GetButtfuck’d", takeSaensCompletelyReasonablyProportionedFutaCock, undefined, "Get Buttfucked", "Put Saendra’s new cock to work on your ass.");
	else addButton(0, "Take Strapon", takeSaensStrappedyDappedyCock, undefined, "Take Strapon", "Saendra dons a strapon and goes to town on your ass.");

	addButton(10, "Probe Sex", saendraProbesYourCuntWithHerMechaArm, undefined, "Probe Sex", "Saendra’s mechanical arm has some interesting features...");
	
	if (pc.hasCock())
	{
		addButton(5, "Cowgirl", saendraRidesYouCowgirlStyle, undefined, "Cowgirl Style", "Let Saendra stick your cock up her ass and ride it cowgirl style.");
		addButton(6, "Fuck Her Ass", saendraTakesItUpDaButte, undefined, "Fuck Her Ass", "Fuck Saendras wonderous ass.");
	}
	else
	{
		addDisabledButton(5, "Cowgirl", "Cowgirl Style", "If you had a cock you could let Saendra ride you cowgirl style.");
		addDisabledButton(6, "Fuck Her Ass", "Fuck Her Ass", "You could fuck her wonderous ass... if you had a cock.");
	}

	if (pc.hasVagina())
	{
		if (saendra.hasCock())
		{
			addButton(11, "Ride Cock", saendraStuffsHerFutacockInYourCunt, undefined, "Ride Cock", "Well, you talked her into getting a cock. It’d only be fair to give her somewhere proper to stick it.");
		}
		else
		{
			addDisabledButton(11, "Ride Cock", "Ride Cock", "Maybe you should talk to Saendra about various other... improvements available these days. Maybe about picking up a cock?");
		}
	}
	else
	{
		if (saendra.hasCock())
		{
			addDisabledButton(11, "Ride Cock", "Ride Cock", "Without a vagina, there’s only one hole Saendra can stuff her cock in.");
		}
		else
		{
			addDisabledButton(11, "Ride Cock", "Ride Cock", "Maybe you should talk to Saendra about various other... improvements available these days. Maybe she could pick up a cock and you could get yourself a vagina?");
		}
	}

	if (pc.hasTailCock()) addButton(7, "Tailcock", saendraTailcockFuck, undefined, "Tailcock Titfuck", "Get a titfuck for your tailcock from Saendra.");
	else addDisabledButton(7, "Tailcock", "Tailcock Titfuck", "You need a tailcock for this!");
	
	addButton(14, "Leave", leaveSaendraFromSex, undefined, "Leave Her", "Leave Saendra hanging; she’ll probably be a little offended...");
}

public function leaveSaendraFromSex():void
{
	saenHeader();

	output("Even after leading her to bed, you decide to leave her by herself anyway...");
	output("\n\nSaendra gives a " + (saendraAffection() < 70 ? "scoff" : "sigh") + " of disappointment.");

	processTime(1);
	saendraAffection(-5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function leaveSaendraAtTheBar():void
{
	saenHeader();

	output("You spend a few minutes in friendly banter with the fluffy halfbreed, trading a few choice bits of news or gossip, but soon feel that your visit is reaching its end. Seeing you getting ready to leave, Saen");
	if (saendraAffection() >= 70) output(" reaches across the table to give you a quick, affectionate kiss");
	else output(" inclines her head to you");
	output(". <i>“See you around, hero. Take care out there.”</i>");

	output("\n\nYou tell her you will as you head on out.");

	processTime(3);
	saendraAffection(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kissSaendraOnTheLipsAndEverystuff():void
{
	saenHeader();

	output("You reach across the table and cup Saendra’s cheek, earning a pleasantly surprised gasp from the young woman as you lean in, pressing your lips to hers. She’s like putty in your hands for the briefest of moments, nuzzling against your hand as she returns your kiss. ");
	
	output("\n\nYou hold her for a moment, eyes closed as your enjoy the pleasant warmth of her thin lips, the feel of her hot breath across your own. You’re both smiling when you finally break the kiss, a look of longing in the captain’s eyes as the moment of solace ends. Almost shyly, Saen runs a hand through her fiery hair, looking pointedly away from you. <i>“T-that was... ohhh....”</i> ");
	
	output("\n\nYou can see a bright blush under her pale, freckled cheeks, and can’t help but smile.");
	
	processTime(2);
	pc.lust(5);
	
	saendrasBarMenu();
}

public function talkToSaendraAboutStuffAndThings(doOutput:Boolean = true):void
{
	if (doOutput)
	{
		saenHeader();

		output("You ask Saen if she’s got a few minutes to just chat.");

		output("\n\n<i>“Sure, hero,”</i> she says with a warm smile. <i>“What’s on your mind?”</i>");
	}
	
	clearMenu();
	addButton(0, "How’s Work", saendraHowsWork);
	addButton(1, "Hobbies", saendraHobbies);
	addButton(2, "Valeria Work", saendraValeriaWork);
	addButton(3, "Her Race", saendraHerRace);
	addButton(4, "Her Arm", saendraHerArm);
	
	if (days != flags["SAENDRA TALK PHOENIX STATUS"]) addButton(5, "PhoenixStatus", saendraPhoenixStatus, undefined, "Phoenix Status", "Check on the status of Saendra’s ship.");
	else addDisabledButton(5, "PhoenixStatus", "Phoenix Status", "You’ve already talked to Saendra about the status of her ship today.");

	if (flags["SAENDRA_XPACK1_CREDITOFFER"] == 1)
	{
		if (pc.credits >= 20000) addButton(6, "OfferCreds", sx1OfferCredits, undefined, "Offer Credits", "Offer to pay for Saendra’s ship to be repaired. You may end up in the hole for twenty grand or so, but you’ll make her very, very happy.")
		else addDisabledButton(6, "OfferCreds", "Offer Credits", "You figure you’ll need about twenty grand to get Saendra back into space....")
	}
	else
	{
		if (flags["SAENDRA CREDITS TALK AVAILABLE"] != undefined && flags["SAENDRA OFFERED CREDITS"] == undefined) addButton(6, "OfferCreds", saendraOfferCredits, undefined, "OfferCreds", "A loader of a few thousand credits would go a long way towards helping Saendra get back on her feet...");
		else if (flags["SAENDRA CREDITS TALK AVAILABLE"] != undefined && flags["SAENDRA OFFERED CREDITS"] != undefined) addDisabledButton(6, "Offer Credits", "Offer Credits", "You’ve already offered her credits, but she politely declined.");
		else addDisabledButton(6, "OfferCreds", "Offer Credits", "Maybe if you can find out about the problems she’s been having in a little more detail, you could offer to help her out with some credits.");
	}
	
	if (!saendra.hasCock())
	{
		if (flags["SAENDRA TIMES SEXED"] != undefined) addButton(7, "Futafication", saendraFutification, undefined, "Futafication", "Ask Saendra if she’s ever thought about growing a dick.");
		else addDisabledButton(7, "Futafication", "Futafication", "Get a little more intimate with Saendra and then you might be in a position to ask about her lack of a wang-doodle.");
	}
	
	addButton(14, "Back", saendrasBarMenu);
}

public function saendraHowsWork():void
{
	clearOutput();
	author("Savin");
	showName("\nSAENDRA");
	showBust(saendraBustDisplay(),"VALERIA");
	output("<i>“So, how’s work,”</i> you ask, remembering the strained conversation between her and Valeria when you first met her here.");
	
	output("\n\nSaen makes a face and grabs another drink from a passing waitress. <i>“Could be better, honestly. The </i>Phoenix<i> took a beating from those pirates and the repair costs were, uh, unexpected.”</i>");
	
	output("\n\nNo sooner have the words left her mouth than Valeria appears on her cybernetic wrist, arms crossed under her chest and looking none too pleased with Saendra. <i>“What Saen means is that we’re completely broke, and our ship is dead in the water. So to speak, anyway. The pirates’ opening salvo broke the old girl’s back, and we’re lucky we managed to limp home after you showed up.”</i>");
	
	output("\n\n<i>“Oh come on, it’s not that bad,”</i> Saen laughs, though half-heartedly. ");
	
	output("\n\nValeria rolls her eyes. <i>“Either way, without the </i>Phoenix<i>, we’re out of work, so to answer your question, [pc.Name], work’s nonexistent and my fluffball here is a fluff-bum.”</i>");
	
	output("\n\n<i>“Hey!”</i> Saen winces, <i>“Low blow, Val.”</i>");
	
	output("\n\nValeria sighs. <i>“Sorry, captain. I’m just... frustrated by all this. I didn’t mean anything....”</i>");
	
	output("\n\nSaen grins and reaches down to rub Valeria’s holo-avatar on the cheek. <i>“Yeah, me too, sweetheart. Me too.”</i> Turning back to you, she says, <i>“Well, I’ve got a job right now fixing things around the station. This bucket’s barely holding together, so there’s plenty of work. Just doesn’t pay for piss. Especially since it costs an arm and a leg to have my baby sitting in dry dock. Still, I’ve got a few things lined up, don’t you worry. I’ll be back out in the Black before you know it.”</i> ");
	
	if (saendraAffection() >= 70)
		output("\n\nWith a mischievous grin, she adds <i>“Relax. I won’t forget to call.”</i>");

	processTime(5);
	saendraAffection(5);

	removeButton(0);
}

public function saendraHobbies():void
{
	saenHeader();

	output("<i>“What’re you doing for fun these days?”</i>");
	
	output("\n\n<i>“Make fun of people on the ‘net, mostly. Aside from VR, there’s not really a whole lot to do on this damn station. Flirt with the bar girls, a few odd jobs to keep food and booze in me. I feel like I’m spending all my free time working on my ship, these days. That or drowning my sorrows in here. And with my baby’s wings broke, I’ve got plenty of troubles to ruminate on.”</i>");
	
	output("\n\n<i>“Sounds pretty dreary,”</i> you say with a wry chuckle.");
	
	output("\n\n<i>“Well, it’s not all bad. I’m actually got into the playtest for the new edition of </i>Perils in Perdition<i>, which FINALLY fixes the damn broken rules in the last one. 12th Edition didn’t even </i>try<i> to fix the </i>obvious</i>, </i>painful<i> flaws of 11th Edition. The Troubadour I was playing for like, two years was so stupidly powerful... and it’s a white magic class! I shouldn’t even be doing damage, much less outclassing the Dervish or Blood Mage. I mean, I’m not even min-maxing this shit!”</i>");
	
	output("\n\n<i>“What.”</i>");
	
	output("\n\n<i>“And I can’t believe they left out </i>Melina’s Magic Mace<i> in 12th edition. I mean, that’s easily THE best item in the -- why are you looking at me funny?”</i>");

	processTime(4);
	saendraAffection(5);

	removeButton(1);
}

public function saendraValeriaWork():void
{
	clearOutput();
	author("Savin");
	showName("\nSAENDRA");
	showBust(saendraBustDisplay(),"VALERIA");
	output("As you chat a bit with Saen, you notice that Valeria’s holo-avatar is sitting out on her wrist, legs dangling over the edge as she flips through what looks like a virtual book. You ask her what she’s got there, which startles the A.I. girl enough that she nearly falls over. ");
	
	output("\n\n<i>“Oh, uh, nothing. It’s just an idle animation that plays when I’m distracted or doing a search, is all.”</i>");
	
	output("\n\n<i>“A search for what?”</i> you ask.");
	
	output("\n\n<i>“Looking for some work Saen and or myself can do. Odd jobs and maintenance work for her, network repair and data archiving for me. Trying to make sure we get the good stuff before that stupid bug gets it.”</i>");
	
	output("\n\n<i>“Bug?”</i>");
	
	output("\n\nSaen interjects: <i>“Fella by the name of Kylon. Some kinda insect creature from the asshole of the universe. Best damn techie on the station... aside from me, that is!”</i>");
	
	output("\n\n<i>“Whatever you say, boss,”</i> Valeria says, rolling her eyes. As she does so, a strange few shapes on the virtual book in the AI’s holographic hands catch your eye. Leaning over her diminutive form, you look down to see a thousand tiny writhing bodies on her book’s pages, committing innumerable acts of debauchery all at once. ");
	
	output("\n\nBefore you can ask what that’s all about, the book vanishes into thin air, and Valeria turns a darker shade of blue. Saen throws her head back and laughs heartily as her A.I. awkwardly stammers out, <i>“H-hey now, I’ve got more computing power than a whole fleet, you know. A girl’s gotta keep all that thinking power, uh... occupied....”</i>");
	
	output("\n\n<i>“What she means is my entire cloud drive is full of her fetish porn and she’s a dirty, dirty little minx.”</i>");
	
	output("\n\n<i>“Implying you don’t watch it, too!”</i> Valeria snaps before vanishing back into Saen’s wrist, leaving the halfbreed laughing uncontrollably.");

	processTime(5);
	saendraAffection(5);

	removeButton(2);
}

public function saendraHerRace():void
{
	saenHeader();

	output("Looking the cat-eared, fluffy-tailed space slut over, you finally ask her what she is, exactly. ");
	
	output("\n\n<i>“[pc.name]... I am... your father!”</i> Saen says in a low, deep voice... before snickering and waving you off. <i>“Seriously though, that’s a weird question out of the blue. But alright, uh, well, I’m what you’d call a halfbreed. My mom was a kaithrit - a pirate, actually, for most of her life - and my dad was an ausar cargo hauler. The </i>Phoenix<i> was actually his, before... well, you know. So I guess I got a little bit of both races in me: mom’s ears and eyes, dad’s big ol’ fluffy tail and forelimbs.”</i> She pauses to look at her left arm, then grimaces when she suddenly remembers the shiny chrome where the fluff on her other arm would begin. Saendra sighs and rubs at her cybernetic limb. ");
	
	output("\n\nWith a wry chuckle, she composes herself back into her normally lewd self and, snapping a finger towards her groin, says, <i>“Got some girly perks from the ausar half, too: I’m built to </i>take ‘em<i> down there, if you know what I mean.");
	if (saendra.hasCock()) output(" And now I’ve got this kick-ass kitty-puppy-dick-thing going on. So that’s pretty cool.");
	output(" I guess the best way to describe what I am is ‘bitch-kitten.’ Tough as a wolf, playful as a kitten: that’s me!”</i>");
	
	output("\n\nYou chuckle at the half-baked double entendre, and ask how a kaithrit pirate and an ausar cargo captain could have got together. <i>“Talk about opposite world, right?”</i>");
	
	output("\n\nSaen chuckles. <i>“Yeah, definitely. You know, they never really talked about it much - how they got together, that is. I guess my mom must have tried to rob him, and somehow somewhere a whirlwind romance started. Or a really ironic one-night stand gone horribly wrong.”</i>");
	
	output("\n\nShe shrugs and rests her chin in her hands, looking you square in the eye. <i>“C’mon, hero, let’s change the subject before I get all nostalgic and need a hug. Or are you just trying to get me to introduce you to my folks? Careful, mom’s still got a laser shotgun!”</i>");

	processTime(4);
	//[Next] [Parents]
	saendraAffection(5);
	
	addButton(3, "Parents", saendraParents);
}

public function saendraParents():void
{
	saenHeader();

	output("<i>“Tell me a little bit more about your folks.”</i>");
	
	output("\n\nSaen sighs. <i>“There was a hint back there, you know. Ugh, fine. My mom’s still around, yeah. Not a pirate anymore, but still an asskicker of the highest order. She does private security work now, I think, out on the rim. We actually bumped into each other a few months ago, working. That was pretty neat.”</i>");
	
	output("\n\n<i>“But, uh, dad passed a couple of years back. Got in a fight he couldn’t win, I guess.”</i>");
	
	output("\n\n<i>“Oh. Sorry,”</i> you say, putting a hand on Saen’s.");
	
	output("\n\nShe shrugs. <i>“It’s fine. That was years ago, I’m okay now,”</i> she says, patting your hand. <i>“Now c’mon, let’s talk about something a little bit more fun, huh?”</i>");

	processTime(2);
	saendraAffection(-10); // -5 plus remove the 5 we added before the branch.
	
	removeButton(3);
}

public function saendraHerArm():void
{
	clearOutput();
	author("Savin");
	showName("\nSAENDRA");
	showBust(saendraBustDisplay(),"VALERIA");
	output("<i>“So, mind telling me a little about that chrome?”</i> you ask, nodding to her cybernetic arm. ");
	
	output("\n\nSaendra blinks at you, then looks to her half-mechanical arm, almost like she’d forgotten it was there. <i>“Oh, yeah. Nothing too fancy, I guess. Between medical bills and patching my ship up, I’m pretty tight on credits. Had to settle for the most basic model, pretty much. I can kind-of-sort-of feel things through it, but it responds pretty much one-to-one and it’s easy to clean and fix.”</i>");
	
	output("\n\nAs she speaks, Saen moves her silvery left arm around, rotating the wrist and wiggling her fingers. She breaks her melancholy long enough to put her hand on your arm and give you a little smile. <i>“Like I said when we met, it could be a lot worse. Besides, with some spare parts from my ship and a little scrounging, I’ve managed to do some modding. Reworked a dead holo-terminal into a wrist-display...”</i>");
	
	output("\n\nValeria shimmers to life on her wrist, waving at you.");
	
	output("\n\n<i>“...built a telescoping probe out of some old mil-spec hardware. Good for fuckin’ and fixin’. Oh, and a flamethrower. Just some old fuel cells and a lighter, but good enough to burn the next pirate that wants a piece of me! I’d show you, but, uh, I don’t want to burn the place down. But it totally works!”</i>");
	
	output("\n\n<i>“Right. So about that probe...?”</i>");
	
	output("\n\nSaen gives you a grin and flicks her cyber-wrist. From the palm, a long, thick metallic hose snakes out, slithering across the table toward you. <i>“Three feet long, thick as a bullcock, and completely prehensile. Took a little mucking around with the firmware and the control chip they put in my brain - ow, by the way. Don’t recommend it - but I got it to work! Give it a kiss!”</i> she laughs as the slithering probe rears up like a cobra, its rounded, pointy tip reaching over to peck you on the lips. ");
	
	if (flags["SAENDRA TIMES SEXED"] != undefined)
	{
		output("\n\n<i>“So... when do I get to use this bad boy on you, hero?”</i> she teases, adding an exaggerated wink for emphasis.");
	}

	processTime(5);
	saendraAffection(5);

	removeButton(4);
}

public function saendraPhoenixStatus():void
{
	saenHeader();
	flags["SAENDRA TALK PHOENIX STATUS"] = days;

	output("<i>“So how’s your ship doing, Saen?”</i>");
	
	output("\n\nSaendra sighs, resting her cheek in her hand. <i>“Not great, hero. Those damn pirates broke the old girl’s back with a rocket when they jumped me. Her hull’s torn to pieces, the flux converters are shot all over, and the shields are blown out. Went out with a bang just before I punched the light drive getting out of there.”</i>");
	
	output("\n\n<i>“That bad, huh?”</i> you ask, just as a waitress comes by with another full stein for your companion. ");
	
	output("\n\nShe nods. <i>“It ain’t great, that’s for sure. I had insurance on the </i>Phoenix<i>, of course, but not enough to cover her getting torn up by that kind of weapons fire. At least it was enough to get most of the interior patched up, and the life support works, uh, most of the time. I’m ending up spending most of my free time down there fixing her by hand, with whatever spare parts I can beg or skirt off the garage crew. Gonna take me forever at this rate, though.”</i>");

	if (flags["SAENDRA PHOENIX STATUS TIMES"] == undefined)
	{
		output("\n\nAfter a moment of thought, Saendra adds, <i>“Hey, if you want... I’m pretty sure we’re parked in the same dock. Lemme give you the berth number... you could drop by any time. Would be nice to have some company while I’m working.”</i>");

		output("\n\nShe scribbles something down on her napkin and hands it over to you.");

		output("\n\n<b>The <i>Phoenix</i> has been unlocked from the Tavros Station central lift.</b>");

		flags["SAENDRA PHOENIX AVAILABLE"] = 1;
	}
	else if (flags["SAENDRA PHOENIX STATUS TIMES"] <= 4 || saendraAffection() < 70)
	{
		output("\n\nAfter a moment Saen adds, <i>“Progress is just so </i>slow<i>. Weapons and shields are giving me a world of trouble, and...”</i> she sighs heavily. <i>“Dammit all.”</i>");
		
		output("\n\nValeria shimmers into being on Saen’s wrist. <i>“Slow and steady wins the race, captain. Just be patient.”</i>");
		
		output("\n\n<i>“I know, I know,”</i> the captain sighs, her ears lowering. <i>“I just feel so fuckin’ helpless cooped up here. I hate not having my ship.”</i>");
		
		output("\n\nYou reach over and put a hand on Saendra’s shoulder, and she visibly relaxes, smiling over at you. <i>“Sorry, hero. Don’t let me get you down... maybe you’d like to help me take my mind off it?”</i> she adds with a lusty wink, her fluffy tail coiling around your [pc.leg].");
	}
	else
	{
		// Unlock [Offer Credits] talk
		flags["SAENDRA CREDITS TALK AVAILABLE"] = 1;

		output("\n\n<i>“You’ve been at it long enough,”</i> you say gently. ");
		
		output("\n\nSaen sighs. <i>“Yeah. I just... I don’t know what the fuck I’m doing. I’m so strapped for cash doing odd jobs that I can barely pay the docking fees, much less get the parts I need to fix my girl. I don’t know what I’m doing wrong... it shouldn’t be this hard to fix a damn ship.”</i>");
		
		output("\n\nSaen plants her chin on the table, her ears lowering sadly. <i>“Never mind, babe. I’ll figure something out... don’t worry about me, okay? I’m a big girl, I can take care of myself.”</i>");
	}

	if (flags["SAENDRA PHOENIX STATUS TIMES"] == undefined) flags["SAENDRA PHOENIX STATUS TIMES"] = 1;
	else flags["SAENDRA PHOENIX STATUS TIMES"]++;

	processTime(3);
	saendraAffection(5);

	removeButton(5);
}

public function saendraOfferCredits():void
{
	saenHeader();
	flags["SAENDRA OFFERED CREDITS"] = 1;

	output("<i>“Hey, I’ve been thinking,”</i> you say, fishing a credit stick out of your pack. <i>“If this would help you out, Saen...”</i>");
	
	output("\n\nHer eyes widen as she realizes what it is in your hand. <i>“Hey, what... what is this?”</i>");
	
	output("\n\nYou shrug. <i>“I know you’re strapped for cash, so, I mean, I have plenty to spare...”</i> ");
	
	output("\n\n<i>“Oh, you");
	if (pc.tallness > saendra.tallness) output(" big");
	else output(" little");
	output(" idiot...”</i> Saen sighs, reaching across the table and curling your fingers back around the credit chit. <i>“I don’t... I can’t take that, hero. You’ve done so much for me already. The last thing I want is to owe you more than I already do.”</i>");
	
	output("\n\nBefore you can try and insist, Saen leans over and plants a kiss full on your lips. <i>“But thank you. I mean it. I just... I have to do this myself, [pc.name]. It’s important to me, okay? Understand?”</i>");
	
	output("\n\nYou nod, and return the chit to your inventory.");

	processTime(2);
	saendraAffection(5);

	removeButton(6);
}

public function saendraFutification():void
{
	saenHeader();

	if (pc.credits >= 2000 && flags["SAENDRA OH GOD IM POOR"] != undefined)
	{
		saendraOkayLetsDoItCredits();
		return;
	}

	output("A bit hesitantly, you broach the subject of your own desires for the fluffy halfbreed. <i>“So, uh, Saendra... you know, you’re a beast in bed, but...”</i>");
	
	output("\n\nShe interrupts you with a wolfish grin, leaning in until her heavy breasts are straining against her vest, her ample cleavage on full display. <i>“Lemme guess... you want to talk me into getting a big, thick cock, right?");
	if (!pc.hasVagina() && pc.hasCock()) output(" I knew you were a little buttslut at heart, hero... you just needed the right person to bring it out!”</i>");
	if (pc.hasVagina()) output(" A strapon or tenta-probe not cutting it for ya, babe?”</i>");
	
	output("\n\n<i>“Uh. Well, yeah, actually.”</i>");
	
	output("\n\nSaen blinks. <i>“O-oh. I was... hey, I was just joking. C’mon, hero, knock it off.”</i>");
	
	if (saendraAffection() <= 49)
	{
		output("\n\nYou try to push the issue, but are firmly rebuffed. <i>“Seriously, [pc.name], I’m not... look, I like you and all, but I’m not gonna mess my body up just for you. That’s asking waaay too much, babe,”</i> she says, putting a hand on yours. <i>“Now c’mon, let’s get a drink and do something </i>fun<i>.”</i>");
	}
	else
	{
		output("\n\nSaen sighs, rubbing the back of her neck with her silvery arm. <i>“Ahhh. I dunno, hero. I just... I mean... why? I’m happy the way I am. We have good sex -- no, </i>great<i> sex! -- and I’m fine sticking with toys and stuff when I wanna go after a tight little hole like yours. I just don’t see why I need a dick. I like being a girl.”</i> ");
	}

	processTime(2);
	saendraAffection(-5);

	//[Drop It] [Push:Reversable] [Push:FeelsGood]
	clearMenu();
	addButton(0, "Drop It", saendraDropIt, undefined, "Drop It", "Drop the subject.");
	if (flags["SAENDRA TALKED ABOUT FUTA"] >= 1 && saendraAffection() > 49)
	{
		addButton(1, "Push: Reverse", saendraFutaTalkII, true, "Push: Reversable", "Push the discussion about Saendra getting a cock. Emphasize that the process is reversible after all...");
		addButton(2, "Push: Good", saendraFutaTalkII, false, "Push: Feels Good", "Push the discussion about Saendra getting a cock. Emphasize that it would feel really special.")
	}
	else
	{
		if (saendraAffection() <= 49)
		{
			addDisabledButton(1, "Push: Reverse", "Push: Reversable", "If your relationship with Saendra was a little more developed, you might be able to talk her into it.");
			addDisabledButton(2, "Push: Good", "Push: Feels Good", "If your relationship with Saendra was a little more developed, you might be able to talk her into it.")
		}
		else
		{
			addDisabledButton(1, "Push: Reverse", "Push: Reversable", "Maybe if you really try talking to her about it again, she might be more willing to go through with it.");
			addDisabledButton(2, "Push: Good", "Push: Feels Good", "Maybe if you really try talking to her about it again, she might be more willing to go through with it.")
		}
		
	}
}

public function saendraDropIt():void
{
	saenHeader();

	if (flags["SAENDRA TALKED ABOUT FUTA"] == undefined) flags["SAENDRA TALKED ABOUT FUTA"] = 1;
	else flags["SAENDRA TALKED ABOUT FUTA"]++;

	output("<i>“Alright, alright. Forget I asked,”</i> you say, patting Saen’s shoulder. ");
	
	output("\n\nShe nods slowly. <i>“Yeah. Let’s, uh, let’s just move on, huh?”</i>");

	talkToSaendraAboutStuffAndThings(false);
	removeButton(6);
}

public function saendraFutaTalkII(reversePath:Boolean = true):void
{
	saenHeader();

	if (reversePath)
	{
		output("<i>“Come on, Saen, haven’t you ever wanted to try it out? Besides, what do you have to lose? If you don’t like it, you can always get rid of it.”</i>");
		
		output("\n\nSaen fidgets uncomfortably. <i>“I... I guess. I don’t know, [pc.name], I can tell you really want it, but... you know what? Fuck it! You’re right, I can always get rid of it later.”</i> ");
		
		output("\n\nYou break into a big grin as Saendra finally gives into your cocklust. She hops to her feet, suddenly excited. <i>“Alright. I know this creepy demon chick across the hall that does custom mods. But </i>you’re<i> paying for it, you want it so bad.”</i>");
	}
	else
	{
		output("<i>“C’mon, Saen. It’ll feel amazing,”</i> you say, putting a hand on your lover’s. <i>“Imagine a great big clit, super sensitive, pounding");
		if (pc.hasVagina()) output(" my pussy");
		else output(" my ass");
		output(". And you’d have a prostate, too... you haven’t had anal until you’ve done it with a prostate in your backdoor.”</i>");
		
		output("\n\n<i>“You’re not wrong,”</i> Saen admits. <i>“I hear shit like that all the time... extranet’s got plenty of dickgirl porn, you know.”</i>");
		
		output("\n\nValeria pops up. <i>“And you’ve downloaded most of it!”</i>");
		
		output("\n\n<i>“Sh-shut it, pixel-butt!”</i> Saen snaps, clicking Val off. <i>“Look, I dunno, hero. I can tell you really want it, but... ah, maybe you’re right. It probably </i>would<i> feel amazing. Maybe you’re right. What’s the harm in trying, right?”</i> ");
		
		output("\n\nYou break into a big grin as Saendra finally gives into your cocklust. She hops to her feet, suddenly excited. <i>“Alright. I know this creepy demon chick across the hall that does custom mods. But </i>you’re<i> paying for it, you want it so bad.”</i>");
	}

	processTime(1);
	saendraDoCockuMenu();
}

public function saendraDoCockuMenu(triedThrobb:Boolean = false):void
{
	clearMenu();
	if (pc.credits >= 2000)
	{
		addButton(0, "Okay", saendraOkayLetsDoItCredits, undefined, "Okay", "Agree to pay the fees required to get Saendra set up with a cock.\n\nCost: 2,000 credits");
	}
	else
	{
		addButton(0, "Okay", saendraBuhuImPoor, undefined, "Okay", "Agree to pay the fees required to get Saendra set up with a cock.\n\nCost: 2,000 credits");
	}

	if (!triedThrobb)
	{
		addDisabledButton(1, "Throbb", "Use Throbb", "Saendra seemed pretty against the idea of using Throbb for the process.");
	}
	else
	{
		if (pc.hasItemByClass(Throbb))
		{
			addButton(1, "Throbb", saendraUseTheThrobbLuke, undefined, "Use Throbb", "Hey, you’ve got some of this stuff kicking around. Might as well put it to a good use, right?");
		}
		else
		{
			addDisabledButton(1, "Throbb", "Use Throbb", "If you had some, you could try and offer a dose of Throbb to Saendra rather than having to pay the extortionate fee it would otherwise take.");
		}
	}
}

public function saendraOkayLetsDoItCredits():void
{
	saenHeader();

	if (flags["SAENDRA OH GOD IM POOR"] == undefined)
	{
		output("<i>“Sounds good. Let’s do it.”</i>");
		output("\n\nSaen flashes you a grin, her prior nervousness evaporating behind her usual bravado. <i>“Alright. I’ll meet you over there, hero. Don’t keep me waiting!”</i> With that, she slips out of the booth, grabs her jacket from over her seat, and pops out of the bar. ");
	}
	else
	{
		output("<i>“Hey, I finally got the money!”</i> you announce.");
		output("\n\nSaen blinks. <i>“Huh? Didya win a bet or something, hero?”</i>");
		output("\n\n<i>“No, for getting you, you know... what we talked about.”</i> ");
		output("\n\n<i>“...Oh. I guess I did agree to that, huh? Alright, if you got the money, I’m still willing to give it a shot, [pc.name]. Meet ya at Dark Chrysalis?”</i>");
		output("\n\nYou nod as Saen packs up and pops on out of the bar, reaching back and brushing your cheek with one of her fluffy tails as she goes. ");
	}
	
	pc.credits -= 2000;

	processTime(1);
	flags["SAENDRA GONNA GO GET A COCK"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function saendraUseTheThrobbLuke():void
{
	saenHeader();

	output("<i>“Actually... I have a little something here. We could do it right now,”</i> you suggest, producing a Throbb injection.");
	
	output("\n\n<i>“Woah!”</i> Saen says, waving her hands. <i>“Nuh-uh. No way. I’ve heard about that shit. It fucks with your mind, man. I got better shit to do than spend all day fapping my brains out and eating my own cum or something. Not happening. We do it my way, or you can cram your dicklust right up your ass... before I cram my dick up there.”</i>");

	processTime(1);
	saendraDoCockuMenu(true);
}

public function saendraBuhuImPoor():void
{
	saenHeader();

	flags["SAENDRA OH GOD IM POOR"] = 1;

	output("You");
	if (!(pc.armor is EmptySlot)) output(" turn out your pockets");
	else output(" shrug apologetically");
	output(". <i>“I don’t think I can really afford that.”</i>");
	
	output("\n\n<i>“Welp,”</i> Saen says with a sigh, plopping back down in her seat. <i>“I guess you’ll just have to make due with a wet, lusty, libidinous slut of a fuckbuddy without a dick. Poor you!”</i>");
	
	output("\n\nShe gives you a playful punch on the arm. <i>“C’mon, let’s drop it... though all this talk of dicks might have gotten me a little horny. You gonna take responsibility for that, hero?”</i> she teases. ");

	processTime(1);
	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
}

public function saendraAtDarkChrysalis():Boolean
{
	if (flags["SAENDRA GONNA GO GET A COCK"] == 1) return true;
	return false;
}

public function darkChrysalisSaendraInject():void
{
	output("\n\nSaendra is leaning against the counter, her twin tails wagging ever so slightly. Surprisingly given Saen’s slutty nature, she’s managed to keep herself off of Sera’s free-swinging dick so far. By the looks the halfbreed keeps shooting that way, though, you doubt it’s going to last much longer. Better make it quick.");
}

public function saenSeraHeader(doNude:Boolean = false):void
{
	clearOutput();
	if (!doNude) showBust("SERA", saendraBustDisplay());
	else showBust("SERA_NUDE", saendraBustDisplay(true));
	author("Savin");
	showName("SERA &\nSAENDRA");
}

public function saendraTalkInDC():void
{
	saenSeraHeader();

	output("<i>“Hey,”</i> you say, approaching your fluffy lover and grabbing a handful of her ass. <i>“Ready for this?”</i>");
	
	output("\n\nShe nods. <i>“I think so. Let’s get this over with before I change my mind, okay?”</i>");
	
	output("\n\n<i>“You lovebirds done yet?”</i> Sera says with disinterest. The wanna-be succubus is leaning against the counter, filing her long, pointed nails. Her big, firm breasts are at the perfect angle to let her ring piercings brush the countertop, swaying slightly in the artificial breeze coming in from the vent. <i>“Gonna buy something, or are you just here to see how many cockhungry sluts I can fuck into submission in a row? Here’s a hint: more than the two of you.”</i>");
	
	output("\n\nYou step up to her. The imposing demoness finally looks up.");
	if (fuckedSeraBefore()) output(" <i>“Oh, you again. So it’s definitely the latter. C’mon, meat, get your girlfriend to bend over and hike those pants down. I don’t have all day.”</i>");
	else output(" <i>“So what’s it gonna be, meat? You want something, or just my dick?”</i>");
	
	output("\n\n<i>“We came to buy something,”</i> you finally say, cutting off any further innuendo from the succubus. <i>“Saendra here...”</i>");
	
	output("\n\n<i>“Wants to grow a dick? Christ, be more vanilla.”</i>");
	
	output("\n\n<i>“Uh. Yeah, actually.”</i>");
	
	output("\n\nSera snorts. <i>“Called it. Hey, ease up. Girls with dicks are basically the new big tits fetish. Especially when they’ve got both, huh?”</i> she says, shifting slightly to emphasize her own ample bust. <i>“So what’s it gonna be, kitten? You want a big, thick cock to fuck your [pc.boy]friend here with?");
	if (pc.hasCock()) output(" Maybe one so big that you’ll put [pc.hisHers] to shame?");
	output(" Or do you want a dainty little dick that everyone’s gonna want to suck on before they");
	if(pc.legCount > 1) output(" spread your [pc.legs] and");
	output(" fuck you like a dirty whore? Maybe then the boys’ll finally be able to tell when you cum.”</i>");
	
	output("\n\nFlashing the demoness a grin, Saendra leans in and whispers, <i>“You’re just jealous that I don’t have to fake it.”</i>");
	
	output("\n\n<i>“Ha! Guess it must be hard to hold it in when half the station’s had a go at your ass today.”</i>");
	
	output("\n\n<i>“Not my fault the boys - and the girls - are lining up around the block for a chance at me!”</i>");
	
	output("\n\nSera snickers. <i>“A chance? Like you could keep your " + (pc.hasLegs() ? "legs closed" : "sex locked up") + " if they paid you to.”</i>");
	
	output("\n\n<i>“That’s right,”</i> Saen says, leaning in so close her nose is practically touching the succubus’s, <i>“I give it away, instead of having to brow-beat my customers into it. How’s it feel not being able to actually get a date, glow-in-the-dark?”</i>");
	
	output("\n\n<i>“Mmm. Keep talking dirty to me and I might let you suck my cock, furball. But only if you ask nice.”</i>");
	
	output("\n\nSaen sidles in, a little closer. Their lips all but brush. <i>“Half off?”</i>");
	
	output("\n\nSera answers by reaching out and grabbing Saendra’s tit through her vest. <i>“Done. But " + pc.mfn("man-meat", "tits mcgee", "your butt-buddy") + " gets in on it, too.”</i>");

	processTime(5);

	//[Threesome!] [No way!] [Watch] [Know each other?] [Just Buy]
	//If PC has fucked Sera a few times, go right to threesome.
	clearMenu();
	if (timesFuckedSera() >= 4)
	{
		addButton(0, "Next", saenAndSeraThreesome);
	}
	else
	{
		addButton(0, "Threesome!", saenAndSeraThreesome, undefined, "Threesome", "Get in on some hot furball-on-demon action. Because why not?");
		addButton(1, "No way!", saenAndSeraNoWay, undefined, "No way!", "Avoid most likely taking it up the butt... for now.");
		
		if (silly) addButton(2, "Watch", saenAndSeraWatch, undefined, "Watch", "You’d prefer to just watch Sera work Saendra over with her cock... or is it Saendra who will be doing the working? NEXT TIME ON EPIC FUCK BATTLES!");
		else addButton(2, "Watch", saenAndSeraWatch, undefined, "Watch", "You’d prefer to just watch Sera work Saendra over with her cock... or is it Saendra who will be doing the working?");

		addButton(3, "You’ve Met?!", saenAndSeraMet, undefined);
		addButton(4, "Just buy", saenAndSeraJustBuy, undefined);

	}
}

public function saenAndSeraJustBuy():void
{
	saenSeraHeader();

	output("<i>“I think we’ll just pay the full price,”</i> you say, planting a credit chit on the counter.");
	
	output("\n\nSera huffs. <i>“A thousand creds just to keep your dignity? Impressive. I guess I’ll just have to pound your girlfriend’s ass some other time.”</i>");

	processTime(1);

	clearMenu();
	addButton(0, "Next", saenAndSeraGetTheDrugs);
}

public function saenAndSeraMet():void
{
	saenSeraHeader();

	output("<i>“I take it you two know each other?”</i> you say, watching the two girls practically making out already.");
	
	output("\n\nSera eyes Saendra. <i>“What? You didn’t tell [pc.himHer]?”</i>");
	
	output("\n\n<i>“T-tell [pc.himHer] what?”</i> Saendra says, fidgeting.");
	
	output("\n\n<i>“That </i>somebody<i> sucked cock to get those big, bouncy meatbags on her chest.”</i>");
	
	output("\n\nSaen blushes. <i>“Hey!”</i>");
	
	output("\n\n<i>“Aww, it’s okay, furball,”</i> Sera teases, squeezing Saendra’s breast until she winces. <i>“They turned out pretty nice. You might just get to use them on me... if you’re lucky.”</i>");
	
	output("\n\nTurning to you, Saen whimpers, <i>“I-it was just once! One cup size, honest!”</i>");
	
	output("\n\nSera’s fingers move to Saen’s nipple, pinching down. <i>“Big-titted bimbo bashful about her boobs? Tsk-tsk.”</i> ");

	processTime(3);

	removeButton(3);
}

public function saenAndSeraWatch():void
{
	saenSeraHeader();

	output("<i>“I think I’ll just watch...”</i> you say, stepping back from the entangled pair. ");
	
	output("\n\nSera huffs. <i>“Fine. But only a quarter off for one cock-sucker.”</i>");
	
	output("\n\nSaendra gives you a reproachful look... just before Sera grabs her head and face-plants her on the counter. <i>“Hope you’re ready for a five hundred " + (isAprilFools() ? "dogecoin" : "credit") + " peepshow, meat,”</i> Sera says, walking around the counter and planting her legs behind Saendra’s upturned ass. The smooth, purple-hued hand not holding the fluffy privateer down reaches around and slaps her ass, fingers sinking into the halfbreed’s squeezable booty. ");
	
	output("\n\n<i>“So where do you want it, slut?”</i> Sera sneers, her lengthy, blue-purple prick flopping into the crack of Saen’s ass.");
	
	output("\n\n<i>“Ass,”</i> Saendra answers, her hands bracing against the countertop.");
	
	output("\n\nSera laughs, her hands hooking through Saen’s belt and yanking down. The halfbreed gives a muted gasp as her pants fall to the deck, leaving her womanhood bare to the succubus’s pleasure. Rather than take the shot, Sera says, <i>“What’s that, furball? I don’t think I heard you.”</i>");
	
	output("\n\n<i>“Put it... gah! Put it in my ass!”</i> Saendra gasps as a pair of Sera’s finger slip into her sex, sliding into her pussy up to the knuckles. Saen groans, fingers digging into the steel countertop as the demoness’s digits probe deep in her slit. ");
	
	output("\n\n<i>“Stop mumbling, slut,”</i> Sera snaps, thrusting her fingers so deep that Saen screams, her tails shooting straight out. <i>“Where do you want me to fuck you in?”</i>");
	
	output("\n\n<i>“My ass!”</i> Saen cries, <i>“Fuck my ass! Fuck my ass, Sera!”</i>");
	
	output("\n\nSera reaches forward, grabbing the scruff of Saen’s neck and pulling her back, hard enough to get the halfbreed to look at her. <i>“There. Was that so hard, slut?”</i> she says, her tongue languidly reaching out to lick the side of Saen’s face, the over-long appendage dragging slowly from chin to where a human’s ears might have been. Saen shivers, her tails tucking in around Sera’s fingers buried in her cunt. The succubus roughly pulls them back out of the way, keeping the fluffy twins well away from her prize. ");
	
	output("\n\nThe demon-girl releases Saendra’s head, shifting her grip to her own foot-long manhood and guiding her glans down to the ring of the halfbreed’s pucker. <i>“Woah, what’ve you been putting back here, slut? Could fit a fucking tuna can in you,”</i> Sera sneers, apparently having no trouble sliding her purple schlong right into Saendra’s ass. Saen grimaces, biting her lip as she takes the lengthy member. You watch as her gut visibly distends, a little lump forming in her belly as the crown of Sera’s demonic dong pushes against her innards; opposite that, Sera’s heavy nuts bop into Saendra’s backside, resting against the lips of her drooling gash. ");
	saendra.buttChange(sera.cockVolume(0), false, false, false);
	
	output("\n\nWith a little grunt, Saen looks over her shoulder and flashes the succubus a grin. <i>“Is it in yet?”</i>");
	
	output("\n\n<i>“You’re fucking nuts, slut,”</i> Sera laughs. <i>“Alright, let’s see how you like this.”</i>");
	
	output("\n\nSera’s demonic tail swings around one of her legs, the cock-like appendage on its tip reaching up to join its owner’s other manhood. Just like the first, Sera takes her tail-cock and guides it to the now-gaping hole of Saendra’s ass, pressing the crown into the space between her footlong and the top of Saen’s hole. The halfbreed gives a muted gasp as the tail-cock pushes in, spreading Saen wide open between the two of them.");
	saendra.buttChange(sera.cockVolume(0) + sera.cockTailVolume(), false, false, false);
	
	output("\n\n<i>“Feel it now, bitch?”</i> Sera sneers, slapping Saen’s ass. ");
	
	output("\n\n<i>“Is that one finger or two?”</i> Saen laughs, her voice turning into a yelp as the succubus spanks her again. That shuts the randy kitten-bitch up for a moment as the succubus gets ready to start really fucking her. ");
	
	output("\n\nYou lean back against the far wall, a small smirk playing across your face as Sera starts to thrust her hips into the halfbreed’s backside, ripples of flesh quaking through her big behind as the succubus pounds her twin lengths into Saendra’s clenching hole. The fluffy slut lets out a cry of pleasure as the demoness goes to work on her, and you suddenly become very aware of the heat spreading through your own loins, turned on by the rigorous assfucking on display. You let a hand snake down");
	if (!(pc.lowerUndergarment is EmptySlot)) output(" to your [pc.crotch]");
	else output(" your [pc.lowerUndergarment] to your [pc.crotch]");
	output(", running your fingers across your");
	if (pc.hasCock()) output(" [pc.cock]");
	else if (pc.hasVagina()) output(" [pc.cunt]");
	else output(" ass");
	output(" to give yourself a little stimulation. ");
	
	output("\n\nSaen catches sight of your will breaking down and shoots you a wink. <i>“Missing out, hero!”</i> she jeers, just as Sera’s hips slam into her ass, both cocks buried to the hilt. <i>“More than enough cock to go around!”</i>");
	
	output("\n\n<i>“[pc.HeShe] made [pc.hisHer] choice, furball,”</i> Sera grunts, hips moving faster. <i>“Now clench that ass tighter before I see if I can fit my fist up there, too!”</i>");
	
	output("\n\n<i>“Shut up and fuck me harder, pencil-dick!”</i> Saen laughs back, raising her tails and pushing her hips back against the demoness’s thrusting cocks. ");
	
	output("\n\nYou can only imagine they were yours, the mounting pleasure of pounding your bitch-kitten’s hot little ass, two rods rubbing against each other through the deep, tight-clenched channel of Saendra’s ass. You start to");
	if (pc.hasVagina()) output(" finger");
	else output(" stroke");
	output(" yourself to the thought, emulating that imagined sensation as best you can with what you have. ");
	
	output("\n\n<i>“Now </i>that<i> gets me hot,”</i> Saen cheers from over at the counter. <i>“Harder, [pc.name], harder!”</i>");
	
	output("\n\nYou watch as Saen’s hand snakes down between her spread legs, mirroring your own intentions as she starts to stroke her clit. <i>“Ohhh yeah, just like that....”</i> ");
	
	output("\n\n<i>“Fuck,”</i> Sera jeers, <i>“if I wanted this shit, I’d have gone into camwhoring. Get over here and suck a cock already, freeloader.”</i>");
	
	output("\n\nBefore the succubus can get too irate with you, Saendra clamps down hard on the twin pricks spearing her ass, stopping the demoness’s assfucking mid-thrust. <i>“Oh, </i>now<i> you get tight...”</i> Sera starts to say, before grunting with pleasure. <i>“Knock it off or I’m gonna...”</i>");
	
	output("\n\n<i>“Gonna c-c-cuuuum,”</i> Saen finishes, panting hard as her fingers work overtime on the engorged red mound of her pleasure-buzzer. Before Sera can do anything, the succubus’s balls and thighs are suddenly slathered in a squirt of fem-cum as Saen blows her girly load across the shopkeep’s sack; Saen’s legs are visibly shaking from the pleasure as she cums and cums, eyes rolling in her head as orgasm rocks her. ");
	saendra.orgasm();
	
	output("\n\nGrabbing the halfbreed’s shoulders for leverage, Sera slaps her cocks in to the hilt despite how clenched the fluffy slut’s gotten during her orgasm. Saendra screams, back arching and tails shooting straight out as Sera forcefully reams her ass, ignoring the tightness as she buries herself in the bitch-kitten’s ass. <i>“Take it, slut!”</i> Sera growls, hilting herself in the halfbreed’s hole, <i>“Take it and fucking scream my name!”</i>");
	
	output("\n\nSera’s cocks visibly engorge and throb as her demonic dicks fill with cum, and empty out into Saendra’s colon. The halfbreed gasps, grabbing at her tits and bucking back against the demon’s dicks as she’s suddenly filled with hot seed. With a final moan, Saen face-plants on the counter, tails swishing happily as the succubus pumps her ass with spooge. ");
	saendra.loadInAss(sera);
	saendra.loadInAss(sera);
	sera.orgasm();
	sera.orgasm();
	saendra.orgasm();
	
	output("\n\n<i>“Not bad,”</i> Sera says after a long moment, planting a hand on Saendra’s backside and using it to leverage herself out of her tight hole. A waterfall of cum sloshes out with her, splattering onto the deck or the succubus’s thighs; Saen just grins blissfully, still rubbing her clit and wagging her tails happily. ");
	
	output("\n\n<i>“Ugh,”</i> the demoness grimaces, wiping a few stray strands of spooge off her dick onto Saen’s upturned ass. <i>“I guess you earned your discount, slut. Though you better clean your damn mess up.”</i>");

	//Go to Get the Drug
	pc.lust(15);
	processTime(20 + rand(5));
	pc.credits += 500;

	clearMenu();
	addButton(0, "Next", saenAndSeraGetTheDrugs);
}

public function saenAndSeraThreesome():void
{
	saenSeraHeader();

	output("<i>“Good choice, meat,”</i> Sera says, sliding herself up onto the counter and slowly spreading her legs, giving you a good look at the footlong cock and heavy, swinging balls between them. <i>“What’s a mouthful of cum for a discount, right? Come on, bitches, on your knees. I don’t have all day.”</i>");
	
	output("\n\nAt the succubus’s instruction, you take Saen’s hand as you both sink to your knees");
	if (!pc.hasKnees()) output(", or close enough, in your bestial case");
	output(". <i>“Good sluts,”</i> Sera coos, hooking one of her long, purple legs over each of your shoulders, leaving her half-hard shaft bobbing between you and Saen, almost inviting in the way it twitches, growing more turgid under your fixed gazes. Slowly, you crane your neck up toward the foot-long cock on offer and reach your tongue out for a taste.");
	
	output("\n\n<i>“Not yet!”</i> Sera snaps, cracking her thigh into the side of your face, just hard enough to get your attention. She wraps her fingers around her bobbing cock, lifting it up and pointing towards her hefty sack. <i>“You’ve got to earn your way up to the main course, meat.”</i>");
	
	output("\n\nSaen grins at that. <i>“At least it’s better than getting tea-bagged,”</i> she says before reaching up and daintily wrapping her lips around one of Sera’s nads, perfectly encompassing the testicular orb; you take the cue and mirror your lover’s action, all but kissing her across the gulf of Sera’s sack as you take her nut into your mouth. The taste is strong, thick and musky and oh-so-enticing; your eyes flutter,");
	if (pc.hasCock()) output(" cock stiffening");
	else if (pc.hasVagina()) output(" cooch wettening");
	else output(" loins afire");
	output(" as desire suddenly takes hold over you. Without further prompting from the dominant demoness, you start to suckle on the supple orb of her teste. Your tongue rolls her nut around your mouth, licking and lapping at the taut skin, sucking just enough to feel the pull as Saen does the same, your mouths tugging her ball in opposite directions. ");
	
	output("\n\n<i>“Not bad,”</i> Sera says, her clawed fingers brushing through Saen’s fiery locks and across your own [pc.hair]. <i>“You two really ought to come as a pair... keep this up and I might just hire you out for the night... or should I be pimping you out to my customers? That’d drum up some business...”</i>");
	
	output("\n\n<i>“Uck oo uu, uut”</i> Saen mumbles around her mouthful of demon-balls. ");
	
	output("\n\n<i>“What’s that?”</i> the demon growls, <i>“Sorry, couldn’t hear you over my balls in your mouth.”</i>");
	
	output("\n\nSera doesn’t wait for an answer, just wrapping her smooth, high-heeled demon legs around your shoulders and pulling the both of you in. You open wide, letting as much demon-nut into your mouth as Sera wants to shove in, until the bottom of her sack is being pushed up by your bottom lip, straining between your mouth and Saendra’s. The succubus’s thighs push you further together, all but forcing you to make out around her churning balls. And churn they do: you can feel the demon’s sack reacting to your loving attention, clenching and throbbing with need, with pent-up seed ready to be drained from Sera’s rock-hard rod. ");
	
	output("\n\nSeeing where your eyes are going, Sera gives you a curt nod. <i>“Go on, bitch. I guess you can’t curb that cocklust forever, can you?”</i>");
	
	output("\n\nYou ignore the insult in favor of getting your lips around the cyan blue crown of Sera’s dick. The demoness groans, reclining on her hands as you cradle her cock, lips parting to take the first few inches. The taste is intoxicating, the sensation of watery pre caressing your [pc.tongue] as the demonic dick throbs and twitches at your touch.");
	
	output("\n\n<i>“No fair!”</i> Saen complains, popping off of the succubus’s nuts, <i>“Cheater.”</i>");
	
	output("\n\n<i>“Plenty of cock to go around, furball,”</i> Sera grins, her prick-tapered tail swishing around into view. Before Saen can protest, Sera’s tail rushes forward and plugs her mouth full of tailcock, silencing the bitch-kitten with a nice mouthful of her favorite snack. ");
	
	output("\n\nNow getting double-teamed on two ends, Sera merely gives a little shudder and closes her eyes, leaving the heavy lifting to her two dutiful cock-shiners. With your halfbreed lover occupied by a vigorous mouthfucking, you’re free to fulfill the succubus’s wish, slowly sliding yourself down her lengthy rod. You make a sensual trip downwards, doing all you can to tame your gag reflex as the monstrously long demon dong stretches your throat wide, feeling like it’s reaching into your gut by the time your lips touch Sera’s groin. Rather than moving your head overmuch, you content yourself with letting your quaking throat pleasure your demonic mistress, squeezing and caressing the slick shaft until even the normally stoic Sera is groaning, her legs binding you tight against her crotch until it’s hard to breathe - you’re not sure if it’s the cock lodged in your gullet or the overpowering musky odor drifting up from her pussy and straight into your nose. ");
	
	output("\n\n<i>“Tsk. I feel like I’m doing all the work here, sluts,”</i> Sera sneers, even as her tailcock pounds Saendra’s mouth until the lust-addled bitch-kitten is practically delirious. <i>“Step it up if you want to earn that discount. Or are you two just sucking my cocks because you love it?”</i>");
	
	output("\n\nBefore you can try and rectify your apparent failings, Sera grabs the both of you by the head, using her powerful legs to push you onto the deck. <i>“You know, in some early earth dances,”</i> the succubus coos, her cocks popping out of your and Saendra’s open mouths, <i>“you sometimes had to switch partners right in the middle of things. It’s going to be something like that.”</i>");
	
	output("\n\nBefore you can question what’s going on, Sera’s high-heeled foot plants you face-first on the deck, putting you on all fours with your ass pressed against your lover’s. Sera hops off the counter, planting her legs between your asses and spreading you apart with a flick of her tail. You lean out, giving the succubus just enough room to kneel between the two of you. You wince as you feel a veiny, writhing mass of cockflesh slap your ass; behind you, Saen’s tails wriggle apart, spreading like her legs as Sera’s yardarm plops between her cheeks. You find yourself bodily pushed forward as the succubus leans back, all but using you like a chair as she presses the cyan crown of her cock into Saendra’s bum.");
	saendra.buttChange(sera.cockVolume(0), false, false, false);
	
	output("\n\nYou, of course, aren’t left out of the ass-pounding action. Sera’s twisting tailcock wraps around your [pc.leg], hugging your flesh tight as the tip of her tentacle-like appendage teases the rim of your [pc.asshole]. You shiver, bracing yourself and trying to relax as the pressure against your ass increases. Finally, with a grunt of effort from the succubus - and one of pleasure from you - she’s in!");
	pc.buttChange(sera.cockTailVolume(), true, true, false);
	output(" You grit your teeth, fingers digging into the cold, unforgiving steel of the deck as you feel yourself being speared by the tendril of Sera’s alien cock. Her probing member’s entrance isn’t painful: she goes nice and slow, clearly concerned entirely for the tightness of your hole and her own pleasure, making no move towards returning the favor. You grit and bear it as she fucks herself deep into your [pc.asshole], forging ahead no matter how tight you clench, her tailcock thrusting until you could swear you feel your stomach bulging. ");
	
	output("\n\nBehind you, you hear a cry of pleasure tear itself from Saen’s lips as the succubus thrusts her hips forward, plowing her spit-slick prick into the halfbreed’s well-trained fuckhole. Saen screams in pleasure, her tails flicking wildly around the succubus’s hips, batting at your [pc.butt]. You can all but feel the demon’s cock pushing into Saen’s asshole, feeling every inch of purple dick by the beat of Saen’s tails wagging around. Sera takes her time fucking herself into your lover’s ass, but finally bottoms out -- in you, too. Fully buried in two tight holes, Sera gives a groan of pleasure and grabs a handful of both your asses, squeezing hard enough to make you clench on her tailcock. ");
	
	output("\n\n<i>“Oh fuck, get it in there,”</i> Saen moans, vigorously fingering herself as the demon’s crotch presses into her squishable butt. <i>“Juuuuust like that.”</i>");
	
	output("\n\n<i>“Oh, you’re just insatiable, aren’t you?”</i> Sera grins, giving her a slap on the hiney. <i>“Lucky you your friend here’s occupying my other prick, or I’d giving you a one-woman DP.”</i> ");
	
	output("\n\nSaen looks over her shoulder, flashing the demoness a grin. <i>“We’ll see about that,”</i> she says, and suddenly Sera’s cock inside you goes wild, straining against your anal walls. You let out a startled gasp, moaning like a whore as the tailcock suddenly thrashes in your hole.");
	
	output("\n\n<i>“Too... too tight, bitch!”</i> Sera snaps, swatting Saen on the ass again. The slutty halfbreed is unrelenting, though, clenching down so tight on the demon’s dick that you can <i>feel</i> the cum surging through her slender tail, desperate for release. <i>“Cut it out or I’m gonna... gonna...”</i>");
	
	output("\n\n<i>“Gonna cum?”</i> Saen finishes for her, wiggling her hips around the succubu-girl’s cock. That does it! Sera lashes out, striking Saendra’s ass as hard as she can - which only serves to make the bitch-kitten squeeze tighter and urge on her own orgasm. ");
	
	output("\n\nYou don’t have much more warning than a sudden twitch in Sera’s tailcock to herald her orgasm. A flood of warm, sticky wetness flows into your [pc.asshole], squirting deep into your colon thanks to the buried tailcock inside you. You groan as you’re pumped full of demon-cum, your stomach roiling as it receives an injection from the wrong end. Saen echoes you with a howling cry of pleasure as she’s fucked full of the demon’s cum; even with Saen’s muscles clenching hard, the demoness grips down on the fluff-slut’s hips and manages to forcefully fuck her ass, slowly hammering at Saen’s ass until her primary cock cums as well, filling the halfbreed’s spasming hole with another thick load of demonic spunk. ");
	pc.loadInAss(sera);
	saendra.loadInAss(sera);
	pc.orgasm();
	saendra.orgasm();
	sera.orgasm();
	sera.orgasm();
	flags["FUCKED SERA"] = 1;
	flags["SAEN_X_SERA_THREESOME"] = 1;
	
	output("\n\nSera heaves a heavy sigh, and you feel the tendril of her cocktail recede from inside you. <i>“Not bad,”</i> she growls, <i>“I guess that’ll do. This time.”</i>");

	processTime(30 + rand(15));
	pc.credits += 1000;

	clearMenu();
	addButton(0, "Next", saenAndSeraGetTheDrugs);
}

public function saenAndSeraNoWay():void
{
	saenSeraHeader();

	output("<i>“No way!”</i> you say, taking a step back. <i>“Not happening.”</i>");
	
	output("\n\nSera rolls her eyes. <i>“What, can’t stand to see your slutty girlfriend get pounded by someone with a real dick? Or are you having second thoughts about letting her peg your ass with a real slab of meat? Don’t worry, meat, no amount of cockdrug is going to make this furball half the woman I am. So man up and throw the cash down, or get the fuck out.”</i>");

	processTime(3);

	removeButton(1);
}

public function saenAndSeraGetTheDrugs():void
{
	saenSeraHeader();

	output("<i>“Alright,”</i> Sera says, taking the credit chit offered by Saen and pulling a small hypo spray out from under her counter. <i>“Here you go, furball. Read the fucking warning label before you take the damn thing, or I’m gonna laugh when you end up in the hospital with a dick bigger than you are.”</i> ");
	
	output("\n\n<i>“Yeah, yeah, whatever,”</i> Saendra says, snatching the hypo from the succubus’s hands and tucking it into her cleavage. She turns her attention back to you, <i>“Well, we’ve got it. Let’s do this... somewhere with some privacy, alright? Meet me at the </i>Phoenix<i> and we’ll... we’ll do it. Together.”</i> ");
	
	output("\n\n<i>“Seriously. Warning label. It’s not there for you to wipe your ass with,”</i> Sera calls after Saen as the fluffy captain slips out of the shop. Sera grimaces. <i>“Dipshit.”</i> ");

	flags["SAENDRA GONNA GO GET A COCK"] = 2;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function phoenixRecRoomAtTavros():void
{
	output("\n\nSaendra is pacing nervously around the rec room of her ship, her twin tails tightly clutched to her body as she wanders around. Seeing you, she smiles, <i>“Make yourself at home, hero. Lemme know when you’re ready and we’ll get started.”</i>");

	addButton(0, "Saendra", doTheCockingDeed);
}

public function doTheCockingDeed():void
{
	saenHeader();

	output("<i>“Hey, babe,”</i> Saen says as you approach. Before you can say a word, she");
	if (pc.tallness >= (saendra.tallness - 6)) output(" slips into your arms");
	else output(" picks you right up");
	output(" and plants a kiss on your lips. This one’s more passionate than usual, almost fervent as she pulls you in tight, desperate. When she breaks it, her feline eyes open slowly, and she flashes you a smile. <i>“I read over the instructions. I think... I think I’m ready when you are.”</i>");
	
	output("\n\nYou nod and lead your lover into her cabin, planting her in the bed and helping her undress. Saen’s eager to be rid of her clothes, stripping out of her vest and unbuttoning her shirt. She’s a little slower when it comes to her pants, wiggling out of her jeans and spreading her legs, feet planted on the edge of the bed. You stand between them like a gynecologist, eyes fixed on the slick slit of Saendra’s sex; her silver fingers run across her lips, teasing the hood of her clit even as she pulls the tip off the hypospray. ");
	
	output("\n\n<i>“Okay. I just need to set the dial on the tip here to the size I want... there we go. Let’s see... do I want balls? Eeehhhh.... I guess. Would look weird without them. I mean, where would the cum come from? Oooh! Wait! I’m gonna have a prostate now, aren’t I? Maybe this won’t be so bad after all... having a cock is just going to make anal even better! I like the sound of that.... Alright, balls for sure, let’s go for, uh, eight on dick length? I don’t exactly have anything to compensate for... but let’s dial up the thickness a little. Trust me, that’s what gets you. Length is nice, but I </i>love<i> a good stretching.”</i>");
	
	output("\n\nFinished adjusting the hypo’s settings, Saen breathes out, steeling herself as she presses the head of the spray to her groin, just over her [saendra.pussy]. <i>“Alright, [pc.name], here goes nothing...”</i> ");
	
	output("\n\nYou hear the hiss of the spray activating, and the deed is done. A long moment passes. You and Saendra hold almost perfectly still, silent, waiting for Sera’s drug to take effect. ");
	
	output("\n\n<i>“Was... was it a dud?”</i> she finally asks, hazarding a look down at her cockless crotch. <i>“Son of a b-”</i>");
	
	output("\n\nBefore she can complete her thought, Saen suddenly doubles over in pain, clutching her gut. <i>“Oh shit it’s... aaahhhh!”</i> she cries, squirming and whimpering as the drug takes effect, rewriting her body to its very core. <i>“It’s coming it’s coming it’s COMING!”</i>");
	
	output("\n\nYou watch with bated breath as the flesh above her cunt swells, bulging out in the vague shape of a cockhead erupting from her groin. <i>“Fuck, it feels good...”</i> she gasps, hands running up from her stomach to her tits, pinching hard on her nips. <i>“Oh fuck oh fuck...”</i> ");
	
	output("\n\nSuddenly, her hands are on your head, grabbing you and forcing you down into her crotch. You give a startled yelp as Saen mashes your lips right onto the burgeoning tip of her cockhead, now bristling with nodules and bumps like a cat’s prick. You don’t have much choice as the mutant member literally grows into your waiting mouth, forcing its way through your lips and onto your [pc.tongue]. ");
	
	output("\n\n<i>“You... you asked for this,”</i> Saen grunts, hips shifting to push more of her dick into your mouth. <i>“Come on, just suck it!”</i>");
	
	output("\n\nGiven your position, you can’t really argue. You let your tongue play across the bristly head of Saen’s new cock, caressing its underside and tapered crown, letting it steadily grow past your [pc.lips] and down your throat. Eight inches never seemed so <i>big</i> before; you’re struggling to open your jaw wide enough to take the girthy, turgid shaft - she wasn’t kidding when she said she wanted it thick! As it grows, you feel something... something much bigger start to press against your lips. You strain against Saen’s firm hands, pulling back just enough to see what could only be a canid knot swelling at the base of her new prick. You gulp as the swollen bitch-breaker presses insistently against your lips, finally growing large enough to force its way into your mouth.");
	saendra.createDefaultCock();
	
	output("\n\nYou lick at it, and are immediately rewarded with a pleasured wince from your lover, and a thick trickle of pre rolling down your throat. <i>“Ah! God DAMN it’s sensitive... geeentle, hero!”</i> Saen gasps, and the way her cock’s twitching in you now, you’d be surprised if you weren’t about to swallow her very first load of cum. ");
	
	output("\n\nBefore that can happen, though, her balls make their appearance. Your chin is pushed back by the sudden swell of dangling flesh beneath Saen’s cock. Rather than forming into a heavy, dangling set of nads like you might have expected, though, the skin forming under Saendra’s cock stays tight against her groin, filling out into a smooth little trap-pouch hanging just over her cooch. ");
	
	output("\n\n<i>“And here I was worried about them getting in the way,”</i> Saen grins, reaching down to caress her new sack. The moment she touches it, though, her whole body shudders, a sudden surge of pleasure seizing her. <i>“Fuck! What’s... oh fuck yes! I think I’m... I think I’m cumming!”</i> ");
	pc.loadInMouth(saendra);
	saendra.orgasm();
	
	output("\n\nOh, boy! You brace yourself, sucking hard on the halfbreed’s half-and-half cock as it swells and throbs; you feel the cum rushing up it just a moment before you taste it, her cockhead engorging as it blows a massive wad down your throat. You all but gag on the voluminous alien jizz, much thicker and much more of it than a human’s ejaculate, smearing across the back of your throat. You tear yourself off of Saen’s cock, desperately swallowing down the creamy load already coating your mouth -- only to get a follow-up facial, her cock painting your face white. Her fur-coated hand reaches down and grabs her shaft, stroking off through the remainder of her orgasm while you recover.");
	
	output("\n\nPanting, chest heaving, Saen gives a slight chuckle as the last drops of spunk drip down from her tapered head, drooling between her fingers. <i>“Oh, fuck, that felt AMAZING,”</i> she says, flashing you a grin. <i>“I don’t know why I was so against this... it’s great. Like a huge fucking clit!”</i>");
	
	output("\n\n<i>“See?”</i> you say, returning her smile. <i>“Told you you’d like it.”</i>");
	
	output("\n\nShe laughs. <i>“C’mere, you,”</i> she says, pulling you up overtop her and hugging you tight. Her tongue licks across your cheek, lapping up her still-warm spunk. Giggling, she says, <i>“Not bad! Might have to take some yoga classes and work on my flexibility...”</i> ");
	
	output("\n\nYou recline in your lover’s arms as she continues to ‘groom’ you, licking up all her excess seed from your cheeks and off your lips, ending with a long and tongue-filled kiss. You let her hold you a while longer after that, cheek resting atop her soft tits as Saendra recovers from her very first male orgasm.");

	flags["SAENDRA GONNA GO GET A COCK"] = 3;

	// Deposit PC in Saen's cabin
	processTime(30+rand(15));
	currentLocation = "PHOENIX QUARTERS";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function saendraSexTalk():void
{
	saenHeader();

	output("Leaning across the table with a sly, lusty grin, you ask <i>“What do you say, Saen -- care to blow off some steam?”</i>");
	
	output("\n\nGrinning from ear to ear, the fluffy halfbreed takes you by the hand and pulls you out of the booth. You follow her up the stairs to the bar’s collection of rooms, enjoying the view of her pert, gropable behind swaying with every step. Her pair of dexterous tails gently tease you as you make your way upstairs, flicking across your [pc.chest] or brushing against your thighs until you’re");
	if (pc.hasCock()) output(" hard as a rock");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" dripping wet");
	if (!pc.hasCock() && !pc.hasVagina()) output(" shivering with need");
	output(", never letting up until she swipes her keycard and lets you in, the two of you practically tumbling over each other onto the soft bed. Groping, teasing, and kissing, the two of you spend several minutes rolling on the bed: Saen straddling you one moment,")
	if (pc.biggestTitSize() > 0) output(" cupping your breasts");
	if (pc.biggestTitSize() > 0 && pc.hasCock()) output(" and");
	if (pc.hasCock())
	{
		output(" caressing your [pc.cock]");
		if (pc.isCrotchGarbed()) output(" through your [pc.gear]");
	}
	output("; the next, you’ve got her pinned beneath yourself, tugging blindly at her belt as she presses your face into her chest, burying you in a valley of her breasts. She gasps softly into your ear as your hand disappears down her pants,");
	if (!saendra.hasCock()) output(" caressing the lips of her wet, inviting womanhood");
	else output(" grabbing the throbbing, turgid shaft of her bristly cock");
	output(". She hooks a clawed hand through your [pc.gear], pulling you into her, trailing kisses along your neck and cheek.");
	
	processTime(11);
	
	//Getting Futa!Saendra's Panties
	//Replace her normal sex scenes after Futafication. 10% chance to play when fucking her. 
	//Replace 3rd paragraph in sex intro with:
	if(saendra.hasCock() && rand(10) == 0)
	{
		clearMenu();
		addButton(0,"Next",newFutaSaendraScenes);
		return;
	}

	output("\n\nFor a second, you part; you’re both panting with lust and desire, hands roaming all over each other. Her voice dripping with raw sexuality, your lover asks, <i>“So how do you want me, hero? I’m all yours....”</i>");

	saendraSexMenu();
}

public function takeAGoodLookAtSaendra():void
{
	clearOutput();
	author("Savin");
	showName("\nSAENDRA");
	showBust(saendraBustDisplay(),"VALERIA");
	output("Captain Saendra en Illya is a six-foot-three halfbreed, a clear mix of ausar and kaithrit physiology. She’s humanoid, tall and lanky, with just enough visible muscle to give her a chiseled appearance, harder than your average gal. Her face is human enough, though she sports a pair of green slitted eyes, distinctly feline, and a pair of overly tall, perky gray cat ears that adorn the top of her head. Both ears are pierced with rows of small silver studs from base to tip. Her right arm is coated up to the elbow in a thin layer of soft gray fur, and her fingers are tipped with tiny curved claws. Her legs are long and powerful, furred from the knee down, and ending in a pair of soft, padded soles. A pair of long, bushy tails swish gaily behind her, coiling around her with a kaithrit’s prehensile dexterity. Saen’s facial features are feminine, with a smattering of pale freckles accentuating her cute little nose, though a trio of faint scars on her right cheek and brow belie a history of violence. A long, fiery-red ponytail hangs all the way down her back to her waist, bound by a pretty blue bow. She has flared hips and a soft, squishy butt; above it, you can just see the outline of a holster, loaded with her archaic Hammer pistol. She’s wearing a low-cut white blouse under a black vest, and a pair of dark blue pants held up by a belt sporting all manner of gadgets, as well as a pair of suspenders that hug her breasts nicely. She’s wearing a leather choker around her neck, from which dangles a pair of long silk strips that hang to her waist, each tipped with a golden bell. Saen’s left arm is visibly mechanical from the elbow down, now sporting a wrist-mounted display screen and holo-projector on which flutters her Artificial Intelligence companion. Valeria’s holo-avatar smiles warmly at you.");
	
	output("\n\nSaen has a pair of big, pillowy E-cup breasts, each with a perky nipple at their tip.");
	
	if (saendra.hasCock())
	{
		output("\n\nHanging between Saendra’s legs is a very thick eight inch cock, a hybrid of knotty ausar prick and a spiny, bumpy-headed kitty cock. Her phallus is accompanied by a tight little pouch of a sack, clinging tight under her swinging dick. ");
	}
	else
	{
		output("\n\n");
	}

	output("She has a warm, wet, and accommodating pussy between her legs and a cock-draining asshole between her gropable buttcheeks, right where it belongs.");

	// Do fuck all with the menu
}

public function saendraProbesYourCuntWithHerMechaArm():void
{
	saenHeader(true);

	//Fucking finally a literal anal probe ahahahaha scifi porn yay.
	output("You roll onto your back and tear off your [pc.armor], spreading your [pc.legOrLegs] around the busty bitch-kitten’s hips so she’s got a good view of your groin and the tender little ring of your ass. Saen grins from ear to ear, reaching down to roughly squeeze your [pc.butt], kneading the soft flesh of your ready backside. <i>“I think I know what you’re after... you want a taste of this bad boy, don’tcha?”</i> she chuckles, flicking her wrist and letting her thick, prehensile probe slither out from her mechanical arm. The snake-like steel coils around your [pc.leg] and then toward your face, its slender, ice-cold tip tickling your nose and lips with deft, sure motions. <i>“Go on, then. Get him ready,”</i> she says, sinking to her knees");
	if(pc.legCount > 1) output(" between your spread");
	else output(" around your");
	output(" [pc.legOrLegs]. ");

	output("\n\nTaking the hint, you open your mouth and let the tip of Saendra’s probe slither in like a rectal-ravishing serpent, the cool metal hard and unyielding against your tongue, the rusty taste overpowering your senses. You shudder as a little gout of steam pours from your mouth and nose, but dutifully suckle on Saen’s tip, lathering it with saliva in preparation of the coming onslaught. With a little verbal urging from your lover, you start to move your head with it, soon sucking on it like a thick cock. She wriggles it in your grasp, slithering inch after inch into your mouth until you’re practically deepthroating her wrist-probe.");

	if (pc.hasCock())
	{
		output("\n\nAs you suck Saen’s metal tentacle, she kindly returns the favor. Your entire body convulses as her hot breath sears across your bare cockflesh, making you tremble with anticipation as she nuzzles up against your shaft. Her bestial tongue flickers across the base of your shaft, coiling around it with slow, languid ease. The halfbreed grins up at you as she massages your prick with her rough alien tongue, slathering it just as you’re doing to her probe before releasing you. <i>“Don’t worry");
		if (pc.tallness < (saendra.tallness - 6)) output(" little");
		else output(" big");
		output(" fella,”</i> Saen coos, kissing the tip, <i>“we’ll convince [pc.name] to ram you up my ass and fuck me silly next time. till then, here’s something to remember me by....”</i>");
		output("\n\nSaen cups her hefty breasts and presses them around your cock. Your eyes roll back into your head as she starts to titfuck you, moving her entire body up and down your shaft with practiced speed, enveloping every inch of your [pc.cock] in warm, soft titflesh with each and every motion. You groan in her grasp, reveling in the sensation of her magnificent rack worshipping your cock as it smears thick stains of pre through the wide valley of her cleavage.");
	}
	else
	{
		if (pc.hasVagina()) output("\n\n");
		output("As you suck Saen’s probe, the pretty fluffball slips down to your groin, her smooth, clawed hand running across your thighs, caressing your tender [pc.skin].");
		if (pc.hasVagina()) output(" She leans her head against your [pc.leg], her hot breath searing across your womanhood. She takes a great, deep breath, exhaling with a groan of satisfaction. <i>“You smell incredible, hero. So strong, so potent... oh god it gets my heart racing,”</i> she says with a grin, running a knuckle around the lips of your womanhood before leaning in to plant a tender little kiss on");
		if (pc.hasClit()) output(" the nub of your [pc.clit]");
		else output(" your slit");
		output(". <i>“Maybe next time I’ll get to play with this hole, hmm?”</i> she adds, her long tongue flickering out and diving into your unprotected [pc.cunt]. You gasp at the sudden penetration, at the feeling of her slender tongue caressing your inner walls.");
	}

	output("\n\nThe foreplay continues for a few long, blissful minutes that blend into a symphony of pleasures as Saendra tends to your loins, getting you nice and ready for the main event. Gently, she retracts the probe from your mouth, leaving you feeling suddenly empty as the sultry redhead stands,");
	if (pc.isBiped()) output(" spreading your [pc.legs] wide for herself, hands braced on your [pc.knees]");
	else output(" positioning herself");
	if(pc.legCount > 1) output(" between");
	else output(" along");
	output(" your [pc.legOrLegs], bracing herself on your [pc.hips]");


	output(". You take a deep breath and try to relax as best you can as Saen’s probe slithers down your body, teasing its way down your supple curves, before holding itself rigid, looking like a giant silver tentacle that’s about to ream your ass. She leans in, her flared hips slowly inching towards your own until the wet, pointed tip of the probe brushes your [pc.asshole], sending an electric shiver of pleasure up your spine. Here it comes... ");

	output("\n\nAt the last moment, Saen lunges forward, cupping your cheek and pressing her lips to yours. You gasp, breath catching in your throat as Saen’s tongue slips between your lips, playing across your teeth. It takes a second for you to relax, finally easing into the unexpected kiss, wrapping your arms around Saen’s slender waist as she finally pushes her telescoping probe forward, bringing the rounded steel head through the circle of your sphincter. You groan into Saendra’s lips, but the penetration comes surprisingly easily, helped along by your long minutes of preparation and the tender, loving embrace of your red-maned lover. With the first inches inside your rectum, Saen breaks the kiss, smiling down at you with a deep, radiant warmth. She caresses your cheek, gently cupping it and bringing your head up for another quick kiss as she wiggles her hips, easing another few inches into you. You roll your head back and moan openly as her tentacle pushes in, stretching your rectal walls wider and wider as the slender steel thickens. Soon you’ve gone from her needle-like point to the grapefruit-sized rod of cold, unforgiving probe that’s now stretching your bum wide.");
		pc.buttChange(9.27, true, true, false); // 24 * 0.5

	output("\n\n<i>“Oh, you’re a fine piece of ass, hero,”</i> Saen laughs. <i>“So fuckin’ glad I put sense strips on that probe... the tip’s soooo sensitive... I can feel every inch of your [pc.asshole] clamping down on me, fighting for every inch. Oh god....”</i>");

	output("\n\nYou pull Saendra down onto you, holding her tight as more and more of her probe slithers in, starting to wriggle and writhe inside of you -- more like a tentacle than a cock, now, as her tip brushes every inch of your walls in its wild flailing. You groan with anal pleasure, feeling as if she’s tearing you apart as the thickness being rammed into your ass increases with every inch, until eventually you can take no more.");
	if (pc.hasCock()) output(" The pressure on your prostate is incredible - too much to bear! You can feel cum surging through your groin, your [pc.cocksLight] reacting to the ceaseless push on your most sensitive spot.");

	output("\n\nBy now, though, you’re on the edge of paradise, your entire body writhing and breath raggedly catching as Saen kisses along your neck and [pc.chest], easing you through it as she slowly starts to move - no more goes in, but instead she increases the writhing of what’s inside, her probe acting like an impossibly long metal vibrator rammed so far up your ass you can almost taste it. With something that mobile crammed that far up your ass, you can’t hope to last long. Within minutes, you can feel the swelling pressure of an anally-induced orgasm crashing through you, your entire body seizing up as feral pleasure takes hold. Screaming your pleasure until the walls seem to shake around you, you grab onto Saendra and hang on for dear life as your body convulses around the thick, unyielding probe-tail inside you.");
	if (pc.hasCock()) output(" Cum spurts from your [pc.cocks], blasting Saen’s gut with an explosive load of [pc.cumColor] spunk. She grins down at you, her flesh-wrought hand grabbing your cock and giving it the attention it so desperately craved, pumping your shaft as you blow your load across her belly, finally winding down until you’re trickling cum onto yourself, rivulets running through the gray fur of Saen’s fingers.");
	pc.orgasm();

	output("\n\nBy the time it’s done, you’re covered in a cold sweat, wrapped in Saen’s arms as she slowly withdraws from inside you. You’re left feeling powerfully empty, as if Saen’s probe <i>belongs</i> inside you, and you’re incomplete without it. You give a pathetic little whine as she leaves, you, your [pc.legOrLegs] wrapping around your lover and refusing to let her part from you. Smiling, Saen curls up against you, head resting on your heaving chest, trailing kisses along your [pc.chest] until you drift off to sleep, clutched in your lover’s arms. ");

	processTime(30+rand(5));

	clearMenu();
	addButton(0, "Next", saendraPostFuckscene);
}

public function takeSaensStrappedyDappedyCock():void
{
	//Strapon buttsecks. Not available after FutaSaen rises.
	saenHeader(true);
	var selCunt:int = pc.cuntThatFits(33.5);
	if (selCunt < 0) selCunt = 0;

	output("Dangling on the side of Saen’s nightstand is a very tempting toy indeed, a thick, footlong vibrator hooked onto a set of sheer black leather straps. Following your gaze, Saen gets a big grin on her face as she reaches over and grabs the oversized strapon.");
	if (pc.hasCock()) output(" <i>“Wanna see if you can take as good as you can get?”</i> Saen teases, grabbing your [pc.cock] and giving it a few playful tugs.");
	else if (flags["SAENDRA TALKED ABOUT FUTA"] != undefined) output(" <i>“You wanted to see me with a cock, huh? Let me show you why I don’t need one!”</i> Saen teases, a dangerous glint in her eyes.");
	else output(" Saen’s fingers brush along your [pc.butt], squeezing one of the cheeks between her steel fingers. <i>“I know what you want, slut,”</i> she teases. <i>“Now spread ‘em wide!”</i>");
	output(" You squirm beneath your fiery lover as she straddles your [pc.hips], effortlessly strapping on the oversized latex rod. It bobs menacingly between her legs, hanging just over the slick slit of her sex, its base pressed tight to the hood of her clit. Somehow, you doubt you’re the only one who’s going to be feeling that thing...");

	output("\n\n<i>“Ready for this?”</i> Saen grins, looming over you, hands planting on your shoulders to pin you down, helpless before her advance. You nod eagerly, spreading your [pc.legOrLegs] wide open for Saen’s big, faux cock. Rather than go straight for the prize, though, Saen pulls you up into a kiss, her thin lips locking to your own, pressed tight for a long moment. Your eyes close, arms wrapping around your lover’s back, holding her tight until she breaks the kiss. With a wolfish grin, Saen slithers down your body, gently leaning you back in the bed and trailing kisses down your [pc.skin], hands roaming across your [pc.chest] and [pc.hips] as she slowly, sensually makes her way back toward your inviting hole. It’s ready for her by the time Saen reaches it:");
	if (pc.hasVagina()) output(" your [pc.cunt "+ selCunt +"] is drooling with excitement, lips wet and ready for the coming fucking");
	else output(" your [pc.asshole] is as relaxed as it can be, lulled into a false sense of security by Saen’s surprisingly gentle treatment");
	output(". Saen’s mechanical hand slips down, one finger pressing easily into your [pc.vagOrAss "+ selCunt +"]; you give a gasp, squirming as her digit probes your depths - it’s as if she’s testing you out, gently stretching you, slowly fingering herself deeper down until she’s buried to the knuckle. ");

	output("\n\n<i>“I think you’re ready, hero,”</i> she grins, popping her finger out of your hole and grabbing your [pc.legOrLegs], yanking you closer to her until her floppy strapon’s head is all but pressed against the");
	if (pc.hasVagina()) output(" lips");
	else output(" rim");
	output(" of your [pc.vagOrAss "+ selCunt +"]. Saen leans in, one hand resting on your [pc.chest], the other cupping your ass, keeping you nice and spread for her as her hips slowly begin to rock in. Your breath catches as the plastic cockhead pushes into you, stretching the walls of your [pc.vagOrAss] around its thick girth. You groan, back arching instinctively as shockwaves of pleasure course through you, spurred on as Saen’s hips thrust her strapon in inch by inch. It’s slow going, but gentle, each thrust bringing her a little deeper inside you; knowing Saen this pace won’t last long, but you enjoy it while you can, wrapping your [pc.legOrLegs] around her waist and guiding her in. ");

	output("\n\nIt’s a blissful eternity before Saendra’s fully buried inside you, the base of her strapon pressing tight against");
	if (!pc.hasVagina()) output(" your ass.");
	else output(" the lips of your [pc.cunt "+ selCunt +"].");

	// 12 * 2 = CockVolume of 33.51466667
	if (pc.hasVagina()) pc.cuntChange(0, 33.5, true, true, true);
	else pc.buttChange(33.5, true, true, true);

	output("Your chest is already heaving, breath coming hot and heavy as your lover fucks herself hilt-deep into your [pc.vagOrAss "+ selCunt +"]. Finally she’s finished, as deep as she’ll get into your quivering hole, panting with the effort of it. Then you notice: the vibrator isn’t even on yet. Your eyes go wide, meeting Saendra’s as she licks her lips, a finger brushing the very back of her latex cock, where a little switch is hidden away.");

	output("\n\n<i>“I want you to scream for me,”</i> she whispers, so low you can barely hear her, before she flicks the switch. ");

	output("\n\nYou give Saen her wish, a cry tearing from your lips as the vibrator skips from zero to full throttle in the span of a heartbeat, thrumming against the tight confines of your [pc.vagOrAss "+ selCunt +"] like a jackhammer. Saen, too, gives a gasp of pleasure, wincing as the vibe presses back against her clit, teasing her pleasure buzzer even as it assails your hole. Her fingers dig into you, steadying the both of you as the vibe gets to work, pulling you back from the edge of climax; you groan and clutch at your lover, trying to hold back your cries of pleasure. Saen only gives you a moment to adjust before her hands wander down to your [pc.hips] and take hold, gripping you tight as her hips start to move. The sensation’s only stronger as her hips start to buck, teasing the very");
	if (!pc.hasVagina()) output(" rim");
	else output(" lips");
	output(" of your [pc.vagOrAss "+ selCunt +"] before plunging back in at full force. The first time she slams herself back in, you scream - loud, high, unable to contain yourself as your lover fucks your [pc.vagOrAss "+ selCunt +"].");

	output("\n\n<i>“That’s what I like to hear!”</i> Saen grunts through gritted teeth as her crotch slaps against your well-fucked hole, driving the vibe hard against her own clit. <i>“Ooooh fuck! Take it, [pc.name]! Fucking take it!”</i> ");

	output("\n\nYou fucking take it. Even when Saen’s strength all but gives out, you just pull your lover down atop you, holding her tight as her hips piston against you, driving the shivering strapon into your [pc.vagOrAss "+ selCunt +"] again and again. With every pounding thrust, you can feel your orgasm mounting, your release more and more urgent as Saen’s hot breath scores across your cheek, her firm breasts pressing against yours, kissing trailing across your shoulders, hands teasing your thighs and [pc.chest]....");

	output("\n\nOrgasm hits you like a brick wall. With a particularly potent thrust, Saendra hilts you on her vibrator, slamming all twelve inches deep into your quivering hole. Your screams reach a crescendo as your body reacts, muscles afire with pleasure, wringing the latex rod clenched between them like vices. Saen doesn’t seem far behind you, especially as your orgasming hole pushes the vibe back, holding it to her clit until she’s crying out, teased over the edge by the incessant vibrations. Saen yanks you into a kiss, pulling you tight as");
	if (pc.hasVagina()) output(" both your cunts");
	else output(" your ass and her cunt");
	output(" are consumed by pleasure.");

	pc.orgasm();

	output("\n\n<i>“Oh fuck,”</i> Saen breathes, chest pressed tight to yours as she slowly comes down from her orgasmic high. <i>“You fucking take it like a champ, hero.”</i>");

	saendra.orgasm();

	output("\n\n<i>“And you give it like a damn amazon,”</i> you answer, grabbing a handful of Saen’s leather-strapped booty. Saen giggles, nuzzling up against you -- and burying the vibe deeper inside you. You give a little grunt, until your lover mercifully turns the toy off, though she does nothing about leaving it hilt deep inside you... and you’d have it no other way. With your fiery lover close at hand, arms wrapped around each other, you drift off into a peaceful, sex-exhausted sleep.");

	processTime(30+rand(15));
	clearMenu();
	addButton(0, "Next", saendraPostFuckscene);
}

public function saendraStuffsHerFutacockInYourCunt():void
{
	saenHeader(true);
	//Cuntcommanders only. Better than missionary position because Fen has sexual PTSD. So much cockworship, you'd think it was an Elzi thread.
	var selCunt:int = pc.cuntThatFits(saendra.cockVolume(0));
	if (selCunt == -1) selCunt = pc.biggestVaginaIndex(); // Should never happen, but w/e

	output("Looking up at your red-maned lover, you ask how she’d like a little attention on that thick, knotted kitty-cock of hers. Saen grins, her chrome fingers already wrapped around her shaft. <i>“Normally I’m one to take the lead, but... for you, anything.”</i> She winks and rolls off of you, spreading her half-furred legs invitingly. You follow her, slinking down the length of the bed and back up between her legs, shifting them up over your shoulders as you advance. Saendra squirms, biting her lip in anticipation as you draw near her prick. Saen’s cock is standing straight up, wholly ready for your attention by the time you make your slow, tantalizing way up to it. Her hard red shaft bobs slightly as you approach, its many crimson bristles looking like such a tasty treat that you can’t help but lick your way across them, feeling an inch-long coating of spines pass across the tip of your tongue, leaving your head swimming with their musky, earthy taste. When your [pc.tongue] crests the crown of her tapered hybrid cock, Saen visibly shudders, a wave of pleasure washing through her strong enough to nearly dislodge her legs from over you. ");

	output("\n\n<i>“Careful with the tip,”</i> she whines,her fingers digging into the bed. <i>“The barbs are sensitive...”</i>");

	output("\n\nOh, that’s practically an invitation. Your tongue unfurls again, the very tip pressing up against the slight swell of Saen’s bitch-breaking knot, licking up from her stem to the cluster of spines near her tip, going nice and slow, making sure Saen gets to feel every moment of your tantalizing ascent. She moans and squirms, hips shifting around you as you tease and lick her cock, slowly coating the turgid shaft with a thick glaze of drool. Every flick of your [pc.tongue] earns you a new girlish gasp or sexy moan from your lover, and soon her flared hips are rising to meet your mouth, an unsubtle plea for more. You give Saen a wink and open wide, letting the eager bitch-kitten thrust herself deep in your mouth, slamming her tapered cockhead against the back of your throat. ");

	output("\n\nRather than let her keep going, though, you clamp your lips around the base of her slowly-swelling knot, ardently refusing to let Saen pull out. Your lover gives a muted whine as she finds herself trapped between your [pc.lips], left utterly at your [pc.tongue]’s mercy. You keep her there, utterly still, for a long moment, just long enough to remind her who’s boss before slowly bobbing your head off her rod. As you do so, Saen busies herself by leaning over to her nightstand and pulling out the familiar shape of a vacuum-sealed condom. At the apex of your sucking, Saendra pushes you off her pecker just long enough to plant the rim of the sheath over her crown; you do the rest. Your teeth easily stretch the nano-fiber sheath down over Saen’s length, encasing it in a tight, form-fitting protective layer. You can practically taste her through it. ");

	output("\n\nThere’s so much more of Saendra to explore than just her cock, though. As you continue to lick and tease the manhood you’ve given her, your fingers wander up her spread legs. Starting at the break where her fur ends and the bare, hot flesh begins, you slowly trace your fingers down, brushing along her sensitive thighs and down to the underside of her spit-slick prick. Your digits tease and caress the small, tight pouch of Saen’s sack, giving it just enough of a squeeze to make her gasp and clench before moving dowards. Immediately below it, almost hidden under the swell of her balls, is the stiff red bud of her clit. You don’t dare touch it outright, but your fingers deftly tease their way around its hood, which turns out to be more than enough to make her cry out, a slick trickle of excitement drooling out into your hand. You grin up at her as she moans, locking eyes with your lover for the briefest of seconds before letting a brace of fingers slip into her sex. ");

	output("\n\n<i>“So much for my cock,”</i> she groans as you finger her sodden twat. <i>“Even after all that... still can’t get enough of my pussy, can you?”</i> ");

	output("\n\nYou stick your tongue out at the lusty slut, punctuating the action by pushing your fingers in to the knuckle. Saen’s back arches, her hands clutching fistfuls of the sheets as you ram yourself home inside her. Her cock reacts, too, going rigid against your lapping tongue and ejecting a thick dollop of pre, ballooning the tip of the condom in the process."); // Yum! You lick it off, reveling in the strong, salty taste of her seed... oh, you need more of that.");

	output("\n\nEnough of this foreplay shit - you want it now! You surge forward, grabbing Saen’s cock and straddling her hips. <i>“Now we’re talking!”</i> she grins, reaching up to steady you as you move overtop her, angling her slick schlong towards the lips of your [pc.cunt "+ selCunt +"]. You hold there, just a moment, savoring the anticipation; but you can’t deny your mounting lust much longer than that, and slide yourself down onto Saen’s turgid cock.");
	saendra.cockChange();
	output("\n\nYou’d almost forgotten about the ring of barbs surrounding her crown, but they make themselves readily apparent as Saen’s thick rod slides into you. You scream your pleasure as you’re lowered onto the bristly cock, stretched wide and left to feel every one of those nodules pressing tight into the sensitive walls of your eager pussy.");
	pc.cuntChange(selCunt, saendra.cockVolume(0), true, true, false);
	output(" The alien feeling nearly drives you to orgasm in moments as her bristly cock scrapes along your cunt’s walls, the very tip of her tapered cock pressing insistently into your womb. You swoon, barely able to stay upright over Saen without her hands firmly locked on your hips, rooting you in place as you adjust to her unique shape and size.");

	output("\n\n<i>“You alright, babe?”</i> she grins, gently stroking your [pc.skinFurScales]. You nod, taking Saen’s hands and lacing your fingers through hers. She gives you a slight nod, shifting her arms to support you as you start to move. You’re all too happy to lean into her grip, putting your weight onto the halfbreed as you start to rise off her lap, once again feeling her bristly cock sliding through your");
	if (pc.vaginas[selCunt].looseness() <= 2) output(" tight");
	else output(" clenching");
	output(" passage. You really start to bounce after that, moving your [pc.hips] over Saen’s throbbing cock, faster and faster, finally hitting your stride. ");

	output("\n\nYour hands shift up, finally no longer needing Saen’s support, and latch onto her big, E-cup tits. Saen gives a little gasp as your fingers dig in, squeezing the soft mounds until flesh rises between your digits like putty. You give her big, pink nipples a squeeze -- just enough to give Saen a shudder of pleasure -- before returning your attentions to the sex proper, groping and squeezing Saendra’s lush bust with every rise and fall of your hips. As you continue to ride her dick, Saen’s fluffy tails beat eagerly behind you, mindlessly showing their approval as you take their owner’s kittycock deep into your eager sex. ");

	output("\n\nThe way Saen’s breathing hard now, you don’t think she’s going to last much longer... and neither are you, really. Her cock’s too good, so thick and so... alien. The sensation of her nodules against your tender slit, the dread of her swollen bitch-breaker pressing into your lips, is almost too much to bear. And that knot... you know you’ll have to take it, that your lover <i>needs</i> to have it tied inside you, spreading you wide open as she cums. You squirm, wrestling with your own willpower, steeling yourself to take the plunge. ");

	output("\n\nAs if she’s reading your mind, Saen locks eyes with you and grins, her hands locking back around your [pc.hips] and pulling you down, just hard enough to break down the last of your will. You let yourself slide down her rod, slow and steady until the swell of Saen’s knot is pressed tight against the lips of your [pc.pussy]. You push yourself further, groaning as the knot pushes into you. The fullness, the stretching sensation, nearly drives you over the edge. You scream your pleasure, back arching like a bitch in heat as you tie yourself to your halfbreed lover. ");

	output("\n\n<i>“Ooooh fuck yeah,”</i> Saen groans as her knot slides into you, <i>“Clench on it... tighter... fuck I’m gonna...”</i>");

	output("\n\nYou feel it before she says anything: a powerful throbbing all through her bristly kittycock, punctuated by a hot squirt of cum that fills the condom wrapped tight around her cock, ballooning the reservoir inside you like a second knot. Fuck it’s <i>hot</i>, straining against your pussy’s walls until you’re crying out, hips thrusting faster on their own, working to drain the halfbreed’s prick of all its seed. You barely notice your own orgasm rising amid the intense pleasure of your knotting; your cunt contracts around her cum-blasting cock, waves of pleasure rocking your body as Saen cums and cums, and you do too. ");

	//pc.loadInCunt(saendra, selCunt);
	pc.orgasm();
	saendra.orgasm();

	output("\n\nWith a shudder, you collapse atop Saendra, breath ragged as pleasure finally overtakes you. Your lover’s arms wrap tight around your waist holding you close as your orgasms come to pass, ushering you off into sleep. ");

	processTime(30+rand(15));
	clearMenu();
	addButton(0, "Next", saendraPostFuckscene);
}

public function takeSaensCompletelyReasonablyProportionedFutaCock():void
{
	saenHeader(true);
	//You thought tailpegging was terrifying!

	output("Saendra leans over you, her big tits blocking out the lights overhead as she plants her hands on either side of you, staring down with a fierce grin. <i>“I saw where you were looking, hero,”</i> she growls, one of her hands gripping yours and forcing it down into her crotch. Your fingers instinctively wrap around the throbbing, hot cockflesh hanging there, tips brushing along the spiny ridges of her feline crown. <i>“You wanted this thing so bad... I hope you’re ready to get what you wished for, [pc.name].”</i>");

	output("\n\nShe leans down, just enough to brush her lips across yours, getting a taste of you before licking her lips and squeezing your hand around her mutant cat-dog cock. <i>“Want to put that");
	if (!silly) output(" talented tongue");
	else output(" purdy mouth");
	output(" of yours to work, hero?”</i> she teases, her other hand stroking your [pc.hair], ever so gently pushing you towards her crotch. Too predictable. You answer her by grabbing a handful of her butt and yanking her forward, forcing Saen to stumble forward on her knees until she’s straddling your shoulders, her cock resting on your [pc.chest]. ");

	output("\n\nShe grins,");
	if (pc.biggestTitSize() >= 4) output(" cupping your breasts, squeezing them around her prick.");
	output(" <i>“That works too.”</i>");

	output("\n\nYou rest back on your elbows, gently stroking Saen’s cock as she wiggles her hips toward your waiting mouth. Your fingers brush along the bumpy ridge of spines cresting her cockhead, the mere touch sending a shiver of pleasure down your lover’s spine. A tiny whimper catches in her throat as you tease the sensitive spines, her hands digging into your [pc.chest] as her ribbed crown approaches your [pc.lips]. Your [pc.tongue] reaches out to greet it, one quick lick across the tapered head before");
	if (pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" coiling around it, guiding her kittycock into your mouth");
	else output(" caressing her kittycock’s underside, urging it in with short, fast laps until her cockhead’s brushing your lips");
	output(". The taste of her dick is magnificent, earthy and musky and oh so <i>right</i>; your tongue eagerly caresses the feline bumps around her crown, lovingly sucking the prick you worked so hard to give your sexy, hermaphroditic lover.");

	output("\n\nSaen groans, hips rocking into your open mouth, slowly riding your face.");
	if (pc.biggestTitSize() >= 4) output(" Her hands gently cup and squeeze your [pc.chest], pushing your mounds together around the base of her cock as she rocks her hips back. You grin up at her, letting the sultry halfbreed use your boobs, squeeze them around her knotty back half before sliding her cock forward back into your mouth. Titfuck and a cocksucking? If she keeps that up, you’re worried your lover won’t last to the main event!");
	output(" You concentrate for the moment on getting her rod as wet as you can, slathering it with spit every time she thrusts into your mouth, opening wide in wait of her return when she withdraws. Soon, her cock is glistening in the dim light, every inch covered in your spit-lube, hot and throbbing against your writhing tongue. ");

	output("\n\n<i>“God damn, you really want it, don’t you?”</i> Saen grins, hips moving faster, fucking your mouth to keep you from answering. <i>“Does it get");
	if (pc.hasCock()) output(" your cock hard");
	else if (pc.hasVagina()) output(" your pussy wet");
	else output(" you excited");
	output(" when a smoking hot dickgirl facefucks you? Huh?”</i>");

	output("\n\nYour answer is gagged out by the mouthful of kitten-dick spearing your face, sounding more like you gargling the trickle of pre starting to ooze down your throat. Saendra grins wolfishly at the sound, and you suddenly find yourself sucking not just her cock but her fingers as well, lips bending around two of the fur-clad digits. <i>“Sounds like you’re about done, hero. Don’t worry, I’ll give as good as I get... now get ‘em nice and wet, or those spines on my cock are going to hurt.”</i> ");

	output("\n\nKnowing what’s coming, you do as your red-maned lover suggests and start suckling on her fingers until they’re matted down and dripping, just as wet as her dick. Nodding approvingly, she slips them out of your mouth, and downwards towards her real goal. Your body goes stiff, breath catching as her fingers press hard against your [pc.asshole]. All you can do is relax yourself, trying to grant her an easy entry; you still manage to cry out when she pushes in, a wordless gasp of pleasure as your lover’s well-lubed digits pierce your hole, caressing your bare, squirming walls. Your back arches a bit as she spreads the lube around, taking her time with slow, even swirls to make sure that you get a nice, even coating across every inch of your rectal walls she can reach. ");

	output("\n\nSatisfied with her work, Saendra slips herself out of you and with a little nudge, rolls you onto your stomach. You gasp, moaning as her fingers leave you empty... and wanting more. You eagerly roll onto all fours, lifting your ass in the air for her. Her metallic hand rewards you with a sharp slap on the [pc.butt], letting your flesh jiggle as she moves back behind you, flopping her sodden cock into your upturned crack. ");

	output("\n\n<i>“You wanted it, hero,”</i> she teases, her hands gripping your [pc.hips]. Her cock drags down until the tapered tip is resting against your well-lubed hole, wet and hot and so very hard against your [pc.asshole]. She leans in close, her chest almost against your back, and whispers, <i>“So take it.”</i>");

	output("\n\nShe thrusts in, her spiny kitten-dick spearing your ass open around its rounded barbs. The feeling is incredible, countless tiny bulbs caressing the very rim of your hole, teasing the over-sensitive flesh as she pushes in. She only goes easy for the briefest second, just long enough to let her tip spread you open, before she rams herself hilt-deep into you slick hole.");
	saendra.cockChange();
	pc.buttChange(saendra.cockVolume(0), true, true, false);
	output(" You stop yourself from screaming only by biting down hard on Saen’s pillow, fingers clawing at the bedsheets as you’re anally violated by the thick, meaty girth of her kittycock. Once she gets into you, her prick feels more like a fist forcing its way into you, stretching your spasming walls wide open around its rounded point, making sure you feel every bump and ridge of her spiney feline member. ");

	output("\n\n<i>“How do you like it, [pc.name]?”</i> she breathes, her swelling knot pressing against your hole. <i>“Was it worth it?”</i>");

	output("\n\nYou cry something back at her, but it’s lost to the ether around the pillow bit hard between your teeth. She takes that for assent and starts to move, out and in with unrelenting force; each thrust in slams you into the bed, burying your face in the mattress as your lover buttfucks you with a vengeance.");
	if (pc.hasCock()) output(" At least she’s thinking of you while she’s doing it: after the first few tentative thrusts, Saen reaches around your [pc.hips] and grabs your [pc.cock], giving it a rough tug for every hammer-fall she makes into your eager ass.");
	output(" You can’t help but gasp and cry out every time Saen’s bristly cock plunges into you, your sensitive ass exploding with sensation as her nodule-covered prick slides into and out of you, so strange and alien that you’re helpless but to shiver and moan. ");

	output("\n\nEvery one of your sweet, sexual noises seems to make Saendra go wilder with lust, fucking you hard and fast, relentlessly driving you into the bed. You know you’re not going to hold out long against her anal assault, but any resemblance of objection, or conscious thought at all, is quickly swept aside by her plunging thrusts and bucking hips, the feeling of her stretching you out and her spines scraping tenderly along every inch of your rectal walls");
	if (pc.hasCock()) output(", putting such wonderful pressure on your backdoor’s own little pleasure buzzer that you have to fight to keep yourself from cumming every time her bristles press against your prostate. Saen’s milking the cum out of you with every thrust");
	output(".");

	output("\n\nYour climax comes quickly, and messily, announced by a high scream of pleasure as your ass contracts around Saen’s thrusting kittycock.");
	if (pc.hasVagina()) output(" Your [pc.cunt] spasms with orgasmic tremors, drooling and squirming, instinctively looking for a cock to milk even as your asshole is being relentlessly drilled.");
	if (pc.hasCock()) output(" Your [pc.cock], spurred on by the pressure on your well-fucked prostate, erupts in a shower of [pc.cumNoun], splattering onto the bedsheets in a waterfall of sexual fluids. Saen’s pumping hand moves faster, rubbing out your wad of cum with the same vigor that she pounds your [pc.asshole].");

	pc.orgasm();

	output("\n\nEven as your orgasm overtakes you, you’re seized by the dread that Saen’s nowhere near done with you. You give a plaintive look over your shoulder, and are met with a wicked grin plastered across Saendra’s features, her fingers only digging deeper into your pliant flesh. <i>“Not letting you off that easy,”</i> she grins, punctuating the thought with a harsh slap on your ass. Youch! You wince, biting your lip as the fluffy slut makes you squeeze around her ribbed prick, making sure you feel every barb. ");

	output("\n\nAnother spank has you screaming, voice undulating with the apex of every thrust, muscles going wild around your lover’s cock. Only slowly do you become aware of a thick, heavy pressure against your [pc.asshole], demanding entry: you gulp as Saen’s knot presses into your crack, feeling as thick around as a fist against your clenching hole. ");

	output("\n\n<i>“Oh, fuck,”</i> you whine as the knot pushes in, relentlessly forging into your clenched hole, forcing you open, stretching you over its mighty girth. Saen smacks your [pc.butt] again and again, never letting you relax, making you nice and tight around her as she force-fucks her knot into your quaking hole. You issue a shrill cry as her bitch-breaker finally smashes through your limp, half-hearted defenses, finally lodging itself inside you. Your last attempts at resistance fall away to nothing as Saen lodges her knot in your [pc.asshole], tying herself to you just as her own orgasm arrives. With a final smack on your thoroughly abused ass, Saen lets herself go, roaring like a beast as she thrusts deep and cums. You moan as you feel her hot, thick spunk shooting into you, splatting through your ass in hot, sticky waves. ");

	pc.loadInAss(saendra);
	saendra.orgasm();

	output("\n\n<i>“How’d you like that, [pc.name]?”</i> Saen grins, giving your cum-filled ass an affectionate pat. <i>“Think you got your money’s worth out of it?”</i>");

	output("\n\nYou give the randy bitch-kitten a half-nod, barely able to muster the will to move. She leans in, planting a kiss on your cheek - and then grabs you by the waist, flipping the both of you onto your sides. You go down with a grunt, but quickly find yourself wrapped in a soft, warm embrace, Saen’s tails curling around you as she pulls you tight against her, letting you feel her big, bare breasts press against your back. ");

	output("\n\nShe nuzzles against your neck, whispering, <i>“Well, the rough stuff only gets you so far, huh?”</i> You smile slightly, feeling your lover’s cock twitch inside you, still drooling, the knot slowly releasing you over the next half hour. For now though, you content yourself to relax in Saendra’s embrace, drifting off to sleep.");

	processTime(30+rand(15));
	clearMenu();
	addButton(0, "Next", saendraPostFuckscene);
}

public function saendraTakesItUpDaButte():void
{
	saenHeader(true);
	//Because sometimes a man's gotta take charge... until Saen reveals that she can totally top from the bottom, too.
	//Or, how Savin acquired infinite rage because there's no vaginal whatsoever in Spess Hel

	var selCock:int = pc.cockThatFits(saendra.analCapacity());
	if (selCock == -1) selCock = pc.smallestCockIndex();

	output("You hook your hands around Saen’s thick hips and roll the towering beauty over onto her back. She gives a little gasp, silenced as you press your lips to hers, finding her big, bestial tongue eagerly awaiting your own. Your lover moans sensually, returning your kiss with her insatiable, fiery passion, hands grabbing your [pc.butt] and pulling you down hard atop her. Before you can recover, you feel a hot, soft warmth across your lower body, and a moment later your [pc.cock "+ selCock +"] is encircled by the fluffy embrace of one of Saen’s tails. The busty captain breaks the kiss, grinning at you as her prehensile appendage gently squeezes your manhood as it moves, slowly wrapping around your [pc.cock "+ selCock +"] from [pc.cockHead "+ selCock +"] to stem");
	if (pc.balls > 0) output(", the very tip coming to rest pressed against your [pc.balls], gently flicking across your " + pc.sackDescript(true));
	output(".");

	output("\n\nThe way she moves her tail, rhythmically squeezing one loop after the other, is near enough to drive you mad. Saen chuckles as you groan, body convulsing at her tender tail-wank, nearly losing control so early. You have to grit your teeth and bear it, shivering as your [pc.cock "+ selCock +"] is oh-so-tenderly milked by the lusty captain’s supple, fluffy grasp. Your hand wanders up, fingers trailing along the pale flesh of her thighs, making her gasp and groan as you grab one of her big, pillowy tits, squeezing the bra-bursting globe hard enough to make her squeal. You shift down, lips trailing across her skin to one of her stiff nipples, gently grazing it with your teeth, just hard enough to make her breath catch before you kiss it, taking the small point into your mouth like a suckling babe. Her back arches at your touch, yielding to your oral advance as your [pc.tongue] laps across her puffy teat, giving it a little twist with your teeth that has her moaning aloud, silvery fingers running");
	if (!pc.isBald()) output(" through");
	else output(" across");
	output(" your [pc.hair], urging you on. Her tail mercifully loosens its grasp on your prick, her mind so distracted by the pleasure in her breasts that she’s forgotten about you, giving you a moment to catch your breath.");

	output("\n\nYour respite doesn’t last long, though. Suckling hard, your other hand is soon guided by your lover to her other boob, left to squeeze and caress the soft mountain of tit-flesh. Even as you do so, you can feel Saen moving beneath you, pushing back against your mouth as her legs wrap around your waist, feet locking just behind your [pc.butt] and pushing you forward. Your [pc.cockHead " + selCock +"] grazes her thigh, so close to her sex that you can feel the wet heat boiling off her, searing the sensitive flesh of your [pc.cockHead "+ selCock +"] with a pleasant, thoroughly arousing warmth that seems to reach deep into you, leaving you even harder with cum roiling in your [pc.balls], already eager to paint your partner’s thighs with seed. A quiet, lust-addled moan betrays you, and with a slick smile Saen’s tail contracts again, wrapping your prick in a soft heat so perfect a match for your [pc.cock "+ selCock +"] that you could swear her tail was made for you. Saen coos appreciatively as your [pc.hips] buck against her grasp, trying to thrust into the tight, soft vice holding your member; she cups your cheek, pulling you from her breast to kiss you again, holding you to herself for a long minute. Her tail is unrelenting throughout, massaging you from stem to stern until you can feel slick trails of pre leaking from your slit, bubbling up in preparation for the coming storm. You try and warn Saen, but she pulls you hard, refusing to allow your lips to stray from hers. ");

	output("\n\nWhen you finally do break free, mumbling, <i>“G-gonna cum!”</i> Saen only smiles.");

	output("\n\n<i>“Come on, a");
	if (pc.cocks[selCock].cLength() < 5) output(" cute little");
	else output(" big, hung");
	output(" [pc.raceBoyGirlShort] like you’s gotta be able to cum twice... three times... before I wear you out. So come on, let it go, hero. Smear my thighs with your seed.”</i>");

	output("\n\nYou couldn’t resist that invitation even if you wanted to. And with the way she moves, the way her burning hot cunt swelters just a hair’s breadth from your leaking cockhead... you wouldn’t dream of holding back. With a fierce grunt, you slam your hips forward, almost piercing the folds of Saen’s sodden box, and blow your pent up load all over her taut thighs and sultry snatch. Your hips piston, fucking the wringing coils of her tail as cum bursts from your [pc.cock "+ selCock +"], hot globs of [pc.cumColor] smearing lewdly across her pussy. She’s quick to reach down and spread herself wide for you, lips agape as your seed pours in or smears around her crotch. <i>“Fuck yeah, hero! Just like that. Let it all out!”</i>");

	pc.orgasm();

	output("\n\nYou carry on, panting and groaning as you hump away, fucking like mad until every last drop of your orgasmic seed has coated Saendra’s thighs, leaving her groin a sticky [pc.cumColor] mess. She grins, rubbing your thick spooge in before licking it off her fingertips, moaning in satisfaction. <i>“Oh yeah, that’s good... god, I don’t just get </i>covered<i> in cum nearly enough. What do you say, hero? Wanna let me jerk your [pc.cock "+ selCock +"] off again and again till I’m just dripping [pc.cumColor]?”</i>");

	// [Anal] [Tail Wank]
	clearMenu();
	addButton(0, "Anal", saendraButteFuckeAnal);
	addButton(1, "Tail Wank", saendraButteFuckeTailwank);
}

public function saendraButteFuckeAnal():void
{
	saenHeader(true);

	var selCock:int = pc.cockThatFits(saendra.analCapacity());
	if (selCock == -1) selCock = pc.smallestCockIndex();

	output("Tempting, but you’ve got other plans. While she’s been basking in a covering of hot spunk, Saen’s tail has relaxed around your [pc.cock "+ selCock +"], letting you slip the well-wrung member free of the redhead’s grasp. She gives a little gasp as you pull free, but when you grab her hips and roll her over, face down on the bed, she just cries out with glee and lifts her tails, swishing gaily to give you a nice view of her taut ass and cunny, still dripping with cum. <i>“No? Well, in that case... fuck my ass! Let me feel all that pent-up spunk of yours deep inside!”</i>");

	output("\n\nNow that’s an idea. You heft her up, getting the lusty slut on her knees, ass swaying happily as her silver arm reaches back, teasing her clit as she spreads her legs, an open invitation to use her to your heart’s content. With aplomb, Saen scoops up the seed smeared across her thighs and pushes it into her ass as lube, her well-trained ring offering no resistance to her powerful mechanical digits. She gives a little moan as she readies herself, coating her waiting anal walls with your first load of seed. Satisfied, she looks over her shoulder and gives you a wink. <i>“Don’t you dare be gentle, hero, I want it </i>rough<i>!”</i>");

	output("\n\nShe asked for it. You give her a hard slap on that spankable ass of hers, setting her flesh to jiggling as you grab your cock and line it up with her tight little crack. Saen grins over her shoulder and shakes her booty for you, letting you pull her hand from her hole, leaving her ass agape and winking, stretched wide like a cunt and oh so inviting. Your hips slide forward, hotdogging her crack to get your rod nice and covered with your own seed, still smeared on her and hot as hellfire. The sensation of the steaming spunk on your tool has you hard again in moments, and with the barest motion your [pc.cock "+ selCock +"] slides in, gliding past the gaping, well-lubed ring of the horny whore’s asshole and into the warm, tight depths of her anus.");
	pc.cockChange(true, false);
	
	output("\n\nFor such a buttslut, Saendra’s tighter than a vice when she wants to be. You get the first few inches of your cum-slathered crank into her before she clenches down, making you gasp in pain and pleasure as her powerful muscles wring your prick for all it’s worth, squeezing and contracting rhythmically as you try to push in. You give her another harsh slap, and the sudden squeeze just about pushes you right back out - before she completely relaxes, and you nearly fall in, sinking right up to the groin");
	if (pc.balls > 0) output(", balls slapping into the sodden mess of Saen’s dripping cunt");
	output(".");
	saendra.buttChange(pc.cockVolume(selCock), false, false, false);
	output(" She groans, fingers digging into the sheets as you bury yourself ");
	if (pc.balls > 0) output("balls-");
	output("deep inside her, stopping only when your hips press into her cushy keister. A long moment passes, both you and your lover caught in the rapture of absolute penetration: Saen moaning, chest heaving as you try and catch your breath, reveling in the way her ass contracts around your prick, trying to milk your next load of cum right out of you. ");

	output("\n\nYou give Saen’s ass a squeeze, fingers scoring across her taut flesh as you start to move. Every inch draws a lusty moan or a cry of pleasure from the sultry bitch-kitten; she screams when you thrust back in, burying her face in the pillow as you start to hammer her cock-gripping asshole. Her tails wrap around your waist, hugging you tight as you pull out before caressing your [pc.butt] and pulling you back in. In answer you grab Saen’s long ponytail, yanking her hair back until her back arches with a scream of pleasure, finally unable to hold back her cries. You give the rampant slut another spank, and then another, picking up a sadistic rhythm that keeps her squeezing so wonderfully tight around your cock. You can feel the cum boiling up your vein, rushing up into the roiling inferno of Saen’s spasming anal muscles.");

	output("\n\n");
	if (saendra.hasCock()) output("You reach around to grab your lover’s bristly cock as you pound her. She gives a delighted little squeal as your fingers wrap around her throbbing erection, jacking it to the beat of your thrusting hips, cresting her tapered cockhead each time your [pc.hips] slam into her jiggling ass. ");
	output("<i>“Oh yeah! Fuck my ass harder!”</i> Saen cries as you hammer her gaping hole, <i>“Harder! I need it harder!”</i>");

	output("\n\nYou’re not sure how much harder you can go! With a grunt of effort you push her hips down, planting her flat on the bed and shifting your [pc.legOrLegs] until you’re right over her, cock angled right into the slut’s sultry hole. You shift your hands up, grabbing the lusty redhead by the tits for leverage; she screams her pleasure as you");
	if(pc.legCount == 1) output(" wrap your [pc.knee]");
	else output(" plant your [pc.knees]");
	output(" around her waist and start to jackhammer her ass. <i>“Fuck! Just like that!”</i> she cries, clawed fingers tearing into her sheets, <i>“Fuck me just like that, hero! FUCK ME!”</i>");

	output("\n\nAs fast as you can move your hips, you fuck the needy halfbreed’s ass. Her muscles go wild around you, squeezing so hard you think you’re going to faint - you fight for every inch, throwing your entire strength into the redhead’s squeezing hole until the inevitable, heart pounding rise of your own orgasm flickers through your mind, breath quickening as your body prepares to unleash its second load.");
	saendra.orgasm();
	output(" You’d feel bad, if at that moment Saen didn’t scream again as a wetness spreads");
	if(pc.legCount > 1) output(" between");
	else output(" along");
	output(" your [pc.knees]. You grin as she cums, her pussy juices soaking the sheets");
	if (saendra.hasCock()) output(" as her cock spurts all over her belly, her thick seed trapped between her gut and the bed");
	output(". You let yourself go, releasing your hold on your load and joining her in orgasm. [pc.cum] floods down your [pc.cock "+ selCock +"] and into the roiling depths of Saendra’s ass, filling the halfbreed’s gut with a rush of cum. <i>“Yeah! I feel it!”</i> she cries, reaching back to grab your [pc.butt]. <i>“Fill me with it, hero! Fuck me full of cum!”</i> ");
	saendra.loadInAss(pc);
	pc.orgasm();

	output("\n\nHilt-deep in the lusty slut, you finally let yourself stop thrusting, just reveling in the sensation of her muscles wringing you, milking every last drop of seed from your [pc.cock "+ selCock +"]. Panting to catch your breath, you let yourself fall onto Saen’s back, nuzzling into the nape of her neck as your cock continues to drool into her hot hole. She leans back to plant a kiss on your cheek, rubbing herself against you as your eyes flutter closed, content to sleep off the afterglow in your lover’s clutches. ");

	processTime(30+rand(15));

	clearMenu();
	addButton(0, "Next", saendraPostFuckscene);
}

public function saendraButteFuckeTailwank():void
{
	saenHeader(true);

	output("That’s an offer you can’t resist. You give the sultry redhead a little nod, and immediately feel her twin tails go to work with cat-like grace, completely prehensile despite their soft, fluffy, canid appearance. Still over-sensitive from your first orgasm, your body reacts with a pleasured shudder as her fluffy tails wrap around your [pc.cock], squeezing just enough to keep you from going completely soft in her grasp. Saen’s powerful legs hook around your waist, pulling you into her tails’ embrace, rocking your [pc.hips] forward. ");

	output("\n\nYour hands find their way to her tits in the meantime, steadying yourself overtop the sexy space slut by seizing her supple breasts and squeezing hard. Saen gasps, squirming under your grasp as you squeeze and knead her big tits, pinching and tugging her pink nips until they’re a pair of diamond-hard points, perfect to roll between your fingers. Grinning lustily, Saen whispers, <i>“You like ‘em, huh? Do a nice pair of big, squishy tits turn you on as much as me?”</i>");
	if (pc.biggestTitSize() >= 4) output(" Saen reaches up and grabs your own tits for emphasis, giving you a taste of your own medicine. You shiver in delight as her soft-and-steel fingers run across your tender flesh, brushing the tips of your [pc.nipples].");
	else output(" Saen’s hands squeeze overtop your own, wandering across her ample tits and guiding you to her most sensitive spots. You grin as the captain’s breath catches, her tails going rigid as she works with you to savage her bust.");

	output("\n\nAs you work the halfbreed’s tits, her tails finally get back in the action, squeezing harder around your [pc.cock] and smearing your first load of cum back around your shaft. <i>“Keep going,”</i> she says, her voice little more than a husky whisper in your ear, <i>“See if you can make me cum just from my tits...”</i> That’s a challenge you wouldn’t mind undertaking... though the way her fluffy appendages are starting to work your cock, you might not last long enough to see it through. Grinning up at you, Saen’s legs grip your hips tighter, pulling you in toward her, forcefully thrusting your [pc.hips] forward into the tight, soft grip of her tails. You finally get the idea, and when her legs relent, you start to move on your own, fucking her tails like they’re one big, fluffy onahole. She gives you an approving wink, which quickly devolves into a back-arching groan of pleasure as you squeeze her tits hard, giving the sultry slut something else to think about for a moment. ");

	output("\n\nYou take advantage of the momentary lapse in her tail-based assault to shift position, backing your [pc.legOrLegs] up from a position of penetration to one better suited to fucking Saendra’s tails. You get yourself angled in on the cum-slick hole made by her tails and start to piston into them, ready to give the sexy bitch-kitten the cum-glazing she asked for. You’re getting close again already, and watching the cute little twitches and gasps of pleasure play across Saen’s face as you grope her big boobs is only making you hotter.");

	output("\n\n<i>“Don’t hold back,”</i> she growls, as if reading your mind. <i>“Fucking give it to me!”</i>");

	output("\n\nYou cum on command, one last buck of your hips before your [pc.cock] erupts in a geyser of [pc.cumColor] spooge raining down on Saen’s belly.");
	pc.orgasm();
	output(" The redhead grins, licking her lips hungrily as her gut and the undersides of her tits are basted with your hot seed. <i>“That’s two!”</i> she cheers, wiping up a particularly thick glob of spunk and licking it off her fingertips. She’s got a good glaze now, your spunk smeared liberally across her stomach and chest from two rapid-fire orgasms, though the hungry, predatory look in her eyes says you aren’t done yet. ");

	output("\n\nSaen’s tails contract tight around your [pc.cock] as you continue to spurt, your cum draining into her fur as she grapples your member. You’re too drained to thrust even if you want to, so Saen takes over, her tail tips rubbing and caressing your [pc.cock], ceaseless in their attention to your sensitive, sex-weary flesh. You grunt and groan, shivering as Saen’s fluff teases you, refusing to let you take even a moment to recover. All you can do is try and take your mind off of it: and Saendra’s quaking, cum-covered bosom provides the perfect opportunity. You grab your bitch-kitten lover by the shoulder and pull her up, holding her tight as your mouth seeks out one of her pert teats, locking on like a suckling babe. Saen gasps, tails wringing at you in response to the sudden stimulation. Saen’s arms wrap around you, fingers digging into your back as you molest her chest, sucking and squeezing for all you’re worth. Her tails return the favor of course, wringing your cock faster and harder until you can’t help but cry out; your skin is so fucking sensitive from the second cumming! ");

	output("\n\nYou shouldn’t be able to come again. There’s no way... not after twice, so soon together, but as the seconds wrest into minutes, pleasure overwhelming your lust-addled mind, you don’t think the sultry redhead’s going to give you any choice. You’re just along for the ride, now, letting her soft, semen-slathered tails wring every last drop from your poor, abused cock. You try and give as good as you get, suckling, caressing, pinching, and squeezing those big, beautiful tits of hers - and it’s working! Saen’s panting and gasping, her sex hot and wet against your [pc.leg]");
	if (saendra.hasCock()) output(", her bristly cock throbbing with need, drooling pre onto her already cum-slathered body");
	output(", only adding to the mess you’ve made the quivering slut.");

	output("\n\nThis time, she cums first. You’re greeted by a rush of fem-cum splattering across your groin and a wail of pleasure tearing from Saen’s lips");
	if (saendra.hasCock()) output(" as her mutant cock erupts, her boobgasm reaching all the way to her untouched rod. Her cock shoots a thick rope right onto your belly before she can grab it and pull up, angling the rest of her explosive orgasm to mix with yours, adding to the cum-basting she’s already gotten - and will be getting more of, if her tails have anything to say about it");
	saendra.orgasm();
	output(". Her tails are going wild around your [pc.cock], the prehensile tools squeezing you so hard you’re afraid even if you could cum, it would just be bottled up by her sadistic pressure. She’s relentless, though, and it isn’t long before you feel the pressure building again, your body racing to follow your lover over the edge of bliss.");

	output("\n\n<i>“You earned it,”</i> Saen grins, and suddenly her tails relax around you, the gripping pressure gone in an instant. The sudden release is too much, spurring your pent-up prick to cum again.");
	pc.orgasm();
	output(" You scream, the sensation too much as cum rushes up your thrice-used shaft and onto the bitch-kitten’s belly, blasting her with a");
	if (saendra.hasCock()) output(" fourth");
	else output(" third");
	output(" load of spunk. Saen grins and takes it like the cum-hungry slut she is, leaning back and letting you blow your whole load across her tits and stomach, eagerly rubbing the hot spooge in as you deliver the finale of your one-"+ pc.mf("man", "woman") +" bukkake. ");

	output("\n\nThe money-shot ends with Saen’s body slathered with your cum, looking more [pc.cumColor] than pink. With a sated sigh, the lusty halfbreed flops back in the bed, idly rubbing the coating of cum sticking to her skin. She <i>reeks</i> of sex now, a heady aroma of your cum and hers mixing around her. <i>“Oh, that’s nice,”</i> she grins, eyes fluttering closed. One of her hands hooks under your arm, tugging you down. <i>“C’mere, hero, unless you wanna go for number four.”</i>");

	output("\n\nYou obediently collapse beside your lover, more exhausted than she is from your sexual ordeal. Sleep overtakes you in moments.");

	processTime(30+rand(15));
	clearMenu();
	addButton(0, "Next", saendraPostFuckscene);
}

public function saendraRidesYouCowgirlStyle():void
{
	saenHeader(true);

	var selCock:int = pc.cockThatFits(saendra.analCapacity());
	if (selCock == -1)
	{
		selCock = pc.smallestCockIndex();
	}

	output("You roll onto your back and tell Saen to take charge, that you’d love to leave yourself in her capable, experienced hands. Your lover smiles for the briefest moment, then pounces, leaping over you, straddling your waist, tugging at your [pc.gear] and quickly freeing [pc.eachCock]. You groan as she grips [pc.oneCock], quickly pumping it as she shifts her weight around, getting into position. Soon, her flared hips and big, gropable ass are hovering over your dick, so tantalizingly close that you can feel the intense, radiant warmth of her body on your [pc.cockHead "+ selCock +"]. But she holds steady over you, continuing to stroke you with fast, furious motions; before long, thick drops of slick pre are running down your length, staining Saen’s fur-clad fingers and making your [pc.cock "+ selCock +"] a slippery, sticky mess. Satisfied, Saen lets your cock go, bringing her pre-slick fingers up to her mouth and cleaning them off one by one, slipping each digit in and suckling on it like a tiny cock, making sure to get every last drop. ");
	
	output("\n\nWhile your lover busies herself cleaning off her fingers, she’s left you in the lurch, cock standing straight up at attention, still bubbling drops of pre in anticipation of a fucking that’s suddenly seemed to stop. Hazed with lust, your body starts to jerk and shiver in desperation, consumed by the need to breed. Your hips thrust upwards, cockhead brushing Saen’s cheeks and thighs but unable to make headway without help. You grit your teeth and sink back, but just as you’ve given up for the moment, Saen eases herself down, her meaty cheeks brushing along either side of your throbbing erection, squeezing it into her sizable crack. You moan aloud, unable to contain your sexual relief as the gentle, all-consuming sensation of Saendra’s soft cheeks closes around your cockflesh. ");
	
	output("\n\nYou reach down, trying to guide your cock into one of your lover’s welcoming holes, overeager to bury yourself inside her searing depths. However, before you can, one of Saen’s tail swishes out from around her, snatching up your wrists in its surprisingly firm grip. <i>“Oh, no,”</i> the halfbreed teases, shifting your hands back over your head. <i>“Just lie back, hero. Trust me.”</i>");
	
	output("\n\nShe leans down, pressing her lips to yours. With a lust-filled sigh, your relax into her kiss, letting Saendra have her way with you. She smiles, trailing down your body with gentle nuzzles and caresses, tracing across your [pc.chest] and belly with a hundred loving kisses. As she moves down your body, Saen starts to slowly rock her hips, dragging your cock through her tightly-clenched derriere. Now things are looking up! You let yourself go, relaxing completely as Saen hotdogs you, slowly picking up the pace. Now that you’ve submitted, Saendra rewards you with faster thrusts, hips rising and falling with abandon. Pre leaks liberally from your eager cock, smearing your lover’s rump with a thickening coat of sticky white seed. ");
	
	output("\n\nGrinning, Saen lets go of your wrists, taking your hands in hers and guiding them to the flares of her hips. Your fingers sink into her yielding flesh, clutching her tightly and starting to guide her pace. The lusty red-head licks her lips hungrily, and you can see her chest heaving, hefty breasts bouncing beneath rock-hard nipples. It doesn’t take a genius to see that she wants it just as much as you want to give it to her. You lock eyes with the pretty privateer, and she gives you just the slightest of nods, never breaking the pace of her silky-smoothing motions, never giving your cock a chance to breathe. ");
	
	output("\n\nYou brace yourself and reach around her thick hips, grabbing your rock-hard shaft and holding it straight up into Saen’s oncoming hips. She stops just at the tip, your [pc.cockHead "+ selCock +"] pressing into her welcoming asshole, its dark ring kissing your crown. Heat radiates off of Saendra’s body, pouring from her rectal opening to the sensitive flesh of your prick, making you groan as she tantalizingly lowers herself down. You both gasp as your [pc.cock "+ selCock +"] pops into her, suddenly clenched in the hot, slick embrace of her anal walls. A low, sensual moan escapes your lover’s lips, Saen’s sonorous voice crying out her pleasure as she sinks down on your cock, taking more and more inside herself. It takes nearly a minute for her to finally stop, her motions so agonizingly slow as she buries you inside her that you’ve nearly cummed by the time she’s seated on your lap. ");
	pc.cockChange(false, false);
	saendra.buttChange(pc.cockVolume(selCock), false, false, false);
	
	output("\n\n<i>“I love...”</i> she groans, rolling her head back and cupping one of her huge tits, pinching the nipple between her clawed fingers, <i>“Oh, fuck, I love your cock in my ass, [pc.name]. I can feel your heartbeat inside me, so... oh, so strong, so thick. That’s right, go ahead and cum, fill me up with everything you’ve got, hero. Let me bask in it.”</i>");
	
	output("\n\n<i>“Not yet,”</i> you groan, clenching your teeth with effort, trying to hold it in. But Saen’s muscles clenching and massaging and caressing your cock’s every inch is almost too much to stand, and you can feel your [pc.balls] ready to burst inside her. While you can, you grip Saen’s big old hips and push her up, trying to get the big girl back in action. She laughs, but starts moving with you, rolling her hips up until your prick nearly pops out of her backdoor, only to slowly slide back down your pole");
	if (pc.balls > 0) output(" until your balls press into her plush booty");
	output(". She locks her hands onto your [pc.chest] for support, starting to rise and fall quicker, hammering onto your lap, your prick pounding her ass hard and fast until you’re both moaning lustily, the room echoing with your cries of passion and the raw, musky smell of sex. ");
	
	output("\n\nIt isn’t long before the inevitable climax, but now as you start to feel your prick swell with cum, you can feel Saen’s heart racing, her breath hot and ragged on your chest as she rides you with everything she’s got, her sodden box drooling her feminine slime across your lap, smearing you with a mix of her cum and your pre.");
	if (saendra.hasCock()) output(" Her cock bounces with her every motion, her own turgid length bobbing, pre glistening on its bristled tip.");
	output(" With one last groan of mind-rending pleasure, you yank Saendra down onto your cock, ramming yourself as far up her slick hole as you can go before the first great blast of cum explodes from your slit, smearing her rectal walls [pc.cumColor] with seed. She cries aloud, clutching at her heaving breasts as she follows you over the edge, clamping down hard on your cock as her pussy erupts, drooling fem-cum over your belly");
	saendra.loadInAss(pc);
	pc.orgasm();
	saendra.orgasm();
	if (saendra.hasCock()) output(" even as her halfbreed cock shoots its own load, pushed over by the pressure on her feminine prostate; you try and cover your face as she cums, spraying your [pc.chest] and neck with thick, white spunk");
	output(".");
	
	output("\n\nMoments later, your lover collapses atop you, body quivering as you fill her ass with more and more of your potent seed. Little spurts squirt back out of her, smearing onto your [pc.legOrLegs] and staining her sheets with frothy cream. You wrap your arms around her shoulders, holding the beautiful girl close as your orgasms slowly subside, fading into the blissful afterglow of sexual release, and then into a peaceful sleep, your [pc.cock "+ selCock +"] still fully buried inside Saen’s tight, spunk-filled ass.");

	processTime(30+rand(15));
	clearMenu();
	addButton(0, "Next", saendraPostFuckscene);
}

public function saendraTailcockFuck():void
{
	saenHeader(true);
	author("Archangel");
	
	output("<i>“Well...”</i> you say, grunting and pushing yourself up so you’re straddling her, before you bring your tailcock");
	if(pc.tailCount > 1) output("s");
	output(" over your head like a scorpion’s stinger, until " + (pc.tailCount == 1 ? "it’s" : "they’re") + " hanging over her face. ");

	if(pc.isBimbo()) output("<i>“Check this out, Saen! I got " + (pc.tailCount == 1 ? "this thing" : "these things") + " a while ago, and I totally love " + (pc.tailCount == 1 ? "it! It’s" : "them! They’re") + " soooo amazing! Wanna try " + (pc.tailCount == 1 ? "it" : "‘em") + " out?”</i> you say, giggling and poking one of her breasts with the tip of [pc.oneTailCock].");
	else if(pc.isBro()) output("<i>“I got a new toy for you to play with, slut!”</i> you say, lightly smacking the side of her face with [pc.oneTailCock].");
	else if(pc.isAss()) output("<i>“I got a new toy for you to play with, slut!”</i> you say, lightly smacking the side of her face with [pc.oneTailCock].");
	else if(pc.isMischievous()) output("<i>“How about I ‘prick’ you?”</i> you say, grinning. Saendra rolls her eyes and groans at your pun as you wag [pc.oneTailCock] above her.");

	output("\n\n<i>“Whoa. Where did you get that thing?”</i> she says, sitting up and grabbing your tailcock, pulling it closer for a better look. You explain");
	if(pc.hasParasiteTail())
	{
		output(" how you had seen the parasite while");
		if(pc.tailType == GLOBAL.TYPE_COCKVINE) output(" wandering around Myrellion, chased it, and decided to get it to join with you rather than squish it into slime");
		else output(" adventuring");
	}
	else output(" that you’ve taken some specialized mods to get the new piece of anatomy");
	output(". She nods her understanding and lies back down. <i>“I don’t mind playing around with it, but that isn’t going inside me, and there’s nothing you can say or do to change that!”</i> she warns, smacking your [pc.butt] with her tails. Well, it’s a partial victory, you suppose.");

	output("\n\nSaen looks up at you, rubbing her chin with her hand, as if wondering what to do with you.");
	if(pc.balls > 0) output(" You feel a ticklish feeling under your [pc.balls] and look down to see the tips of Saendra’s tails swishing back and forth against your [pc.sack]. You look back up at her to see a grin on her face.");

	output("\n\n<i>“I have an idea. How about...”</i> she wraps her soft, fluffy tails around your [pc.tailCock], sheathing them within a warm, furry prison. <i>“I’ll just get you off like this,”</i> she says, grinning.");

	output("\n\n<i>“Actually, I got a better one,”</i> you say, flexing the muscles of your [pc.tailCock] and pushing past the confines of her tail to lodge the upper section of your [pc.tailCock] right between her hefty tits. <i>“Why not both?”</i> you add, rapidly wiggling your tailcock back and forth, motorboating her breasts and giving yourself both an impromptu titfuck and a great show of jiggling titflesh.");

	output("\n\n<i>“Wha-? Hey, stop it! Ah!”</i> Saen yelps, mashing her tits together and effectively stopping any further movement. She grins up at you. <i>“Next time, a little warning, you ass!”</i> she says, playfully frowning up at you. You stick your tongue out at her and apologize.");

	output("\n\n<i>“Well, now that you’ve so nicely apologized, we can move on to the main course!”</i> she teases. She wraps her tails around the middle and lower sections of your [pc.tailCock], enclosing them in a warm, tight, furry sheath, with the upper portion of your [pc.tailCock] still trapped in the valley of her soft cleavage. Saendra then starts to slowly jerk you off with her tails, almost milking you, you think, with the way her tails tighten around your [pc.tailCock].");

	output("\n\nYou let out a slight groan at the sensation, and a bead of precum rolls off the top of your [pc.tailCock]. Saen wiggles her shoulders, using your own pre as lube mixed with a quick dollop of her own spit.");

	output("\n\nYou shudder as you feel the wet fur and soft titflesh slide around your [pc.tailCock]. It gets even better when she finally begins to use her tails in earnest, the furry appendages making your [pc.tailCock] feel like it’s in a very long, very soft onahole!");

	output("\n\nDetermined to get her off too, you spit on the fingers of one hand, then reach down and roughly shove them into her ass and pussy without warning.")
	if (saendra.hasCock()) output(" You spit into your other hand, using it to grab her already hard kitty dick and pump the turgid mass up and down.");

	output("\n\nSaendra gasps, her mouth falling open in a perfect ‘O’ of pleasure and surprise. <i>“Oh you little-”</i> is all she manages to get out before you start thrusting your fingers in and out of her sodden box and tight ass")
	if (saendra.hasCock()) output(" and jerking her spiny cock off")
	output(". She makes cute little gasps and moans, followed by a loud yelp as you smack her ass and wag your [pc.tailCock], reminding her that you need a little loving too. You’re pretty sure you hear her grumble something that sounds suspiciously like ‘asshole’ before she goes back to work.");

	output("\n\nIt isn’t long before you feel the oh-so-familiar twitch in your [pc.balls]. In response, you start thrusting your fingers in and out of her even faster.");
	if (saendra.hasCock()) output(" Her cock starting to twitch too, matching your own rising orgasmic motions.");
	output(" Her moans and gasps increase in pitch, and her tails go into overdrive, pumping so fast that you feel like you’re fucking a real pussy!");

	output("\n\nIt’s not long before the urge is too much for you to bear. With a loud groan, you stick your fingers as far as they’ll go into Saendra’s ass and pussy and let yourself cum. Y");
	if(pc.hasCock()) output("our [pc.cocks] spurt" + (pc.cockTotal() == 1 ? "s" : "") + " ropes of [pc.cumType] into the air, most of which falls on Saendra, while y");
	else if(pc.hasVagina() && pc.isSquirter()) output("our [pc.vaginas] blast" + (pc.totalVaginas() == 1 ? "s" : "") + " [pc.girlCumType] between your [pc.thighs] while y");
	output("our [pc.tailCocks] blast" + (pc.tailCount == 1 ? "s" : "") + " [pc.cumType] directly into " + (pc.hasCock() ? "her" : "Saendra’s") + " face. At this point, the stimulation and sudden, overwhelming musk of your orgasm plastering her face is too much: with a yowl, Saendra finally lets loose and joins you, adding another load to the puddle growing on her bed and body.");

	output("\n\nYou both stay there for a few seconds, panting, until Saen finally says <i>“Next time, we’re doing this in the shower.”</i>");

	output("\n\nYou look up at her to say something, but the moment you notice her face, you burst out laughing. With all the cum you spurted out, it looked like someone had thrown a pie onto her face. Albeit a very [pc.cumFlavor] pie. Too wiped out to do much else, you simply flop on top of her, the cum between your bodies squishing and squelching as Saendra moves around to accommodate you on the bed.");

	output("\n\nYou distinctly hear what sounds like <i>“Clean up nightmare”</i> before you fall asleep, hugging your bitchkitten tight.");

	pc.orgasm();
	saendra.orgasm();
	pc.applyCumSoaked();
	processTime(30+rand(15));
	clearMenu();
	addButton(0, "Next", saendraPostFuckscene);
}

public function saendraPostFuckscene():void
{
	saenHeader();

	if (flags["SAENDRA TIMES SEXED"] == undefined) flags["SAENDRA TIMES SEXED"] = 0;
	
	output("You awaken after a short nap in your lover’s arms, only to find yourself alone in the big bed. You rub the sleep from your eyes and prop yourself up, punctuated by a long yawn. Just past the foot of the bed, Saen looks over her shoulder and gives you a grin as she finishes buttoning her shirt. ");
	
	output("\n\n<i>“Thanks for that, hero,”</i> she says with a wink before hiking her pants back, your last glimpse of her bare, sexy body vanishing.");
	if (flags["SAENDRA TIMES SEXED"] > 0) output(" <i>“We should do that again some time. You know where to find me.”</i>");
	else output(" <i>“I really needed that. You’re the best, [pc.name].”</i>");
	output(" She hops over to plant a quick kiss on your cheek before grabbing her keys off the counter, telling you to let yourself out when you’re ready. A moment later, she slips out the door, leaving you alone.");
	
	output("\n\nYou spend a few minutes gathering your things");
	if (!pc.isNude()) output(" and dressing");
	output(" before following suit, back down to the bar. ");

	flags["SAENDRA TIMES SEXED"]++;
	
	processTime(120 + ((rand(60) + 1) - 30));
	
	saendraAffection(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Getting Futa!Saendra's Panties
//Replace her normal sex scenes after Futafication. 10% chance to play when fucking her. 
//Replace 3rd paragraph in sex intro with:
public function newFutaSaendraScenes():void
{
	clearOutput();
	saenHeader();
	author("Savin");
	var x:int = -1;
	if(pc.hasVagina())
	{
		x = pc.cuntThatFits(chars["SAENDRA"].cockVolume(0));
		if(x < 0) x = rand(pc.totalVaginas());
	}
	output("For a second, you part; you’re both panting with lust and desire, hands roaming all over each other. Her voice dripping with raw sexuality, Saendra reaches between her legs and starts to stroke her dick. <i>“I think it’s about time you took responsibility for this big slab of cockmeat,”</i> she purrs, kissing you and grinding the nub-ringed crown against your [pc.leg]. <i>“You wanted it soooo bad, didn’t you? Still want it now?”</i>");
	output("\n\nYou nod eagerly, ready and willing to take advantage of your lover’s throbbing masculinity. The moment you do, you feel Saen’s fingers grab your [pc.hips] and suddenly you’re getting flipped around, your face buried in her pillow and your [pc.butt] in the air. Her metallic hand grabs the back of your head and forces you down, and you’re pretty sure you hear something about <i>“bite the pillow”</i> as she gets you right where she wants you - and where you want to be.");
	if(pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(" Your tail lifts up eagerly, inviting the beautiful bitchkitten to ravage you however she wants.");

	output("\n\nShe slaps your ass and sidles up behind you, making you cry out in that wonderful mix of pleasure and pain that sends fire through your loins.");
	if(pc.hasCock()) output(" Your [pc.cock] jumps to attention, throbbing powerful and already beading with pre. Something tells you it isn’t going to get much attention while Saen’s masculinized libido is flaring like this, and you reach back between your legs to stroke it.");
	output(" You feel Saendra’s knotty kitty-cock grind against your [pc.butt], running her ring of spines between your asscheeks and prodding gently against your [pc.vagOrAss " + x + "].");

	output("\n\n<i>“Mmm, let’s make things a little sloppier back here,”</i> your lover suggests, reaching into her nightstand and pulling out a bottle of a clear, thick liquid that your mind automatically identifies as lube. She pops it, and a second later you feel a cold drizzle hitting your backside; Saen sucks in a sharp breath ");
	output("of appreciation");
	if(silly) output(" and mutters <i>“Dat ass,”</i>");
	output(" as she rubs the lube in, fingering your [pc.vagOrAss " + x + "] and spreading the shockingly cold stuff around.");

	output("\n\n<i>“Oooh, that’s good,”</i> Saen purrs. <i>“");
	if(pc.buttRating() <= 5) output("I love tight little butts. Gonna smack this ass till you scream");
	else if(pc.buttRating() <= 10) output("You’ve got a great little bubble butt back here, Hero. I’m gonna enjoy making it bounce.");
	else output("Oh man, you have such a huge fuckin’ ass. Gonna make it bounce like jelly in a second.");
	output("”</i>");

	output("\n\nShe smacks your lubed-up butt again, harder this time, and you wiggle your [pc.butt] at her and push back against her cock. She’s got it nice and slicked up, too, slathered in so much lube that it’s dripping a nice little puddle between her legs. Even her balls, pressed against your hind end, seem nice and juicy with all that wetness on them... maybe when Saen’s done emptying them into your [pc.vagOrAss " + x + "] you can convince her to let you give them some well-deserved worship.");

	output("\n\n<i>“So eager,”</i> Saendra says, and as she speaks, you feel two of her fingers slip along your rump and down to the tip of her cock, pushing it down until her nubby ring is flush against the ");
	if(pc.hasVagina()) output("lips");
	else output("ring");
	output(" of your [pc.vagOrAss " + x + "]. <i>“You really must love dickgirls, huh? Wanna feel my tits on your back while I fuck you doggystyle... ugh, can’t tease you that much, or I might just cum all over your ass before we start.”</i>");

	output("\n\nWith a whine, you beg Saendra to go ahead and fuck you already. The thought of all this leadup ending into a butt-basting before it even begins is too much to bear - you need her <i>now</i>!");
	output("\n\nIn one rough, forceful motion Saendra pistons her hips forward and grabs you");
	if(pc.hasHair()) output("r hair");
	else output("by the scruff of the neck");
	output(", pulling your head up and into a passionate kiss that muffles your screams of excitement. Her kitty-cock slides into you, all but gliding along your sensitive walls on a glaze of cold lubricant; the ring of feline spines around her tapered crown digs into you, stretching you just a little wider, and rubbing against your most tender places with vigorous purpose.");

	output("\n\nSaen slides in to the hilt, grunting in your [pc.ear] as she pounds your ");
	if(pc.hasVagina()) output("cunt");
	else output("ass");
	output(" in. You squeal in pleasure, rocking back against her to get as much of her turgid lady-cock into your hole as possible. Your lover rocks her hips against your backside, giving you short, quick strokes as she trails kisses along your neck. Every time she bottoms out in you, you grunt and moan, giving voice to your growing ecstasy - God <i>damn</i> you love her cock!");
	if(pc.IQ() > 75) output(" Definitely one of your best investments yet.");
	else if(pc.isBimbo()) output(" Everything’s better with dicks - especially your girlfriends!");

	if(pc.hasVagina()) pc.cuntChange(x, saendra.cockVolume(0));
	else pc.buttChange(saendra.cockVolume(0));

	output("\n\n<i>“Keep the noise down, lover,”</i> Saen giggles mid-thrust. <i>“I don’t want the neighbors to get angry.”</i>");
	output("\n\nYou try to keep it down - you really do - but the feeling of Saen’s spiny dick grinding against your ");
	if(pc.hasVagina()) output("vaginal");
	else output("anal");
	output(" walls, the way her breasts press against your back, her breath hot against your cheeks as your lover humps away at you... it’s all too much. Your cries of pleasure only escalate, getting louder and faster until you feel like your voice is a constant stream of pleasured cries.");

	output("\n\nFinally, Saen seems to get annoyed with your screams. Rather than letting up on ");
	if(!pc.hasVagina()) output("reaming you");
	else output("pounding your pussy");
	output(", Saen reaches down, grabs the bright pink panties she was wearing off the floor, and stuffs them straight in your mouth! Your eyes go wide, you gag, and then the smell and taste of sweat, perfume, and alien cockmusk hits you. It’s the latter one that overpowers you; the scent of pent-up sexual desire and dried hints of hermaphroditic semen on the crotch. You can taste every boner Saen’s had all day, and your heart flutters knowing your [pc.vagOrAss " + x + "] is going to be getting a full helping of this wonderful stuff.");

	output("\n\n<i>“That’s more like it!”</i> Saendra cheers, slapping your ass and earning a muted yelp as her panties absorb the sounds of your screams. <i>“Unf! Yeah, now you’re gonna get it" + pc.catDog("", ", my favorite little bottom bitch", false) + "!”</i>");

	output("\n\nNow that you’re not going to be waking the neighbors - or at least, not the ones three doors down - Saen starts to move faster and harder, hammering your ");
	if(pc.hasVagina()) output("pussy");
	else output("ass");
	output(" so forcefully you’re half-sure you’ll have bruises on your butt in the morning. Your [pc.butt] bounces to the beat of her thrusts, and the bed creaks noisily underneath you. Your fingers dig into the sheets, clawing at Saen’s bed to take some comfort against the more and more brutal ");
	if(!pc.hasVagina()) output("ass-");
	output("fucking you’re taking.");

	output("\n\n<i>“Oh, that’s good,”</i> Saen growls, pressing the turgid knot against your spasming hole. <i>“Ugh, gonna... gonna cum soon... Hang on down there, Hero!”</i>");

	output("\n\nOh God. You clench your teeth around her musky panties, trying to relax your body as best you can in order to admit the meaty wad of dog-flesh at the base of Saen’s thrusting cock. Even then, the amorous bitch-kitten meets enough resistance that she ends up grabbing the bottle of lube and spraying down her bitch-breaker, lathering it up until she’s finally able to push it into you.");

	output("\n\nEven her panties can’t stop the sound of you screaming now, crying out in overwhelming pleasure as you’re stretched to the limit by the halfbreed’s turgid knot. Then again, Saen’s crying out as well, back arched and tails swishing at full-speed; your [pc.vagOrAss " + x + "] clenches hard on her knot, enough to send her right over the edge and in orgasm. Your eyes bulge as your ");
	if(pc.hasVagina() && !pc.isPregnant(x)) output("womb is");
	else if(pc.hasVagina()) output("tunnel");
	output(" flooded with bitch-kitten spunk, a wash of hot, sticky white cream that gives you the most wonderfully full sensation.");

	output("\n\n<i>“Fuck,”</i> she grunts, flopping on top of you. Her big, bouncy breasts press heavily against your back, <i>“That was... that was worth getting a dick.”</i>");
	output("\n\n<i>“Mff mumph,”</i> you answer around a mouthful of panties.");

	//first time, get panties
	if(!pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink."))
	{
		output("\n\n<i>“You can hang onto those,”</i> Saen laughs, reaching down to give you a kiss on the lips around her cummy pink undies. <i>“Since we can’t be together </i>all<i> the time... maybe");
		if(pc.hasCock()) output(" when you get lonely you can use ‘em to jerk off and think of me, huh? Or maybe");
		output(" you can be a real pervert and wear ‘em around. A big, girly, pink sign that you’re aaaaallllll mine,”</i> she giggles, kissing you again.");
		output("\n\n<i>“Okay, I’m gonna go back down,”</i> she laughs, running a hand along your bare side. <i>“See you later, babe. Lock up when you can feel your legs again, okay.”</i>");
		output("\n\nYou give a weak thumbs up and roll onto your side, yawning contentedly.");
		//[Next], back down to bar.
		//Acquired new panties: Saendra’s - Ultra-tight and bright pink.
		output("\n\n<b>You’ve acquired Saendra’s panties!</b>");
		pc.createKeyItem("Panties - Saendra's - Ultra-tight and bright pink.");
	}
	//Repeat, has panties
	else
	{
		output("\n\n<i>“Oh, yeah, lemme grab those,”</i> Saen laughs, yanking her panties out of your mouth. You gasp and drool as soon as they come out, and watch them tumble to the floor.");
		output("\n\n<i>“Gross. Anyway,”</i> you feel Saen’s hand on your ass and, with a little push and a lot of help from lube, Saen pulls her knot out of your well-fucked ");
		if(pc.hasVagina()) output("cunt");
		else output("ass");
		output(". She grins to herself when some of her cum drools out of your hole, and she gives you a playful swat. <i>“I’m gonna head out. Lock up when you can feel your legs again, okay, Hero?”</i>");
		output("\n\nYou give a weak thumbs up and roll onto your side, yawning contentedly.");
	}
	//[Next], back down to bar.
	if(pc.hasVagina()) pc.loadInCunt(saendra,x);
	else pc.loadInAss(saendra);
	processTime(24);
	flags["SAENDRA TIMES SEXED"]++;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function askSaendraAboutDrink():void
{
	clearOutput();
	showName("\nSAENDRA");
	showBust(saendraBustDisplay(),"VALERIA");
	author("Savin");

	output("<i>“Actually, I wanted to know what’s in the glass,”</i> you tell her, peering into the mug of thick, frothy white. <i>“I see you drinkin’ it every time I’m here. ");
	if (pc.isBimbo() || pc.isBro() || pc.isMischievous()) {
		output("I didn’t know cum was on the menu!”</i>");
		output("\n\nSaendra rolls her eyes. <i>“It’s not, hormones-for-brains.");
	}
	else {
		output("Kinda looks like jizz, y’know.”</i>");
		output("\n\nSaendra snickers. <i>“Yeah, I’ve noticed. Val likes to point it out every chance she gets.");
	}
	output(" It’s not cum.");
	if (saendra.hasCock()) output(".. not that I’m above guzzling spunk or anything. I’ve had some fun suckin’ my own cock now, thanks to your upgrades. Kaithrit flexibility and all. Anyway.");
	output(" What I’m drinkin’ is cream. Good ol’ ausari steamed, fermented cream. It’s like milk, but full of fat and booze that goes right to my ass.”</i>");
	output("\n\nValeria sighs from Saen’s wrist. <i>“That jizz soda is super bad for you, Saendra! Do you know how many calories are in a glass.”</i>");
	output("\n\n<i>“Yes, mother, I do. It’s not like I can afford to eat actual food anyway, and this stuff’s cheaper than water. It’s great.”</i>");
	output("\n\nVal makes an even more exaggerated sigh until Saen swipes her hand through her companion’s avatar. <i>“Let’s talk about how many blow-bang holos you downloaded this year, huh?”</i>");
	output("\n\nThe digital fairy huffs and quiets down, earning a laugh from Saendra. <i>“She’s just jealous of my excellent taste in cheap booze-milk. So is your idle curiosity satisfied, [pc.name]?”</i>");

	if (flags["SAENDRA_FEED_MILK"] == undefined) flags["SAENDRA_FEED_MILK"] = 0;
	processTime(10);

	clearMenu();
	addButton(0, "Next", saendrasBarMenu);
}

public function feedSaendraYourMilk():void
{
	clearOutput();
	saenHeader();

	output("<i>“How about I get you something better to drink than that junk?”</i> you tease, flicking a finger across Saendra’s mug."); 
	if (flags["SAENDRA_FEED_MILK"] >= 1) output("\n\n<i>“You don’t have to ask twice!”</i> Saendra grins, slipping out of the booth and extending a hand to you. <i>“C’mon.”</i>");
	else {
		output("\n\nSaendra flashes you a pretty smile. <i>“Well, if you wanna buy me a drink, I won’t stop you. Don’t have to ply me with alcohol if you’re looking to get in my pants, though, hero...”</i>");
		output("\n\n<i>“Who said anything about buying?”</i>");
		output("\n\n<i>“No stealing!”</i> Saendra says with a grin. <i>“I basically live here. I don’t-”</i>");
		output("\n\nYou interrupt her by grabbing one of your own boobs and giving it a squeeze. <i>“I meant straight from the tap.”</i>");
		output("\n\nSaendra blinks. <i>“O-oh! Well, that’s... new. I mean, I’m not gonna say no...”</i>");
		output("\n\n<i>“Then let’s go,”</i> you say, standing and offering her a hand. You haul Saen up and out of the booth, pulling the red-haired kitty close. You whisper into her grey ear, <i>“I hope you’re hungry.”</i>");
	}
	output("\n\nYou and Saendra walk up to her room above the bar hand-in-hand, her tails wrapping around your waist and her eyes rarely leaving your [pc.chest]. You can see the hunger growing in her eyes, taking on an almost feral, primitive desire as you ascend the steps.");
	output("\n\nYou’ve barely made it into the room before Saendra is tearing off your ");
	if (pc.hasArmor()) output("[pc.armor]");
	else output("gear");
	output(", grabbing your [pc.boobs] in her fluffy hands and squeezing them hard enough to make your breath catch in your throat. [pc.Milk] erupts from your [pc.nipples], wetting Saen’s fur and running between her fingers.");
	output("\n\n<i>“Ohhh, that’s the good stuff right there!”</i> Saendra giggles, tugging a nipple up to her mouth and licking it clean. Her tongue’s silk-soft and moves with inhuman deftness, circling and caressing your areola while her lips close around your [pc.nipple], kissing it with just enough suction to draw out another squirt of [pc.milk].");
	output("\n\n<i>“Yeah,”</i> she purrs, licking her lips. <i>“This is way better than the trash at the bar. And the server’s a real cutie, too. ");
	if (saendra.hasCock()) output("I’ll be sure to give [pc.himHer] a big, fat tip later...”</i>");
	else if (pc.hasCock()) output("Maybe I’ll work [pc.hisHer] tip later...”</i>");
	else output(" Maybe I’ll get my strapon later and give [pc.himHer] a nice, big tip...”</i>");
	output("\n\nSounds tempting, but for right now, you have a lactic load that needs to be delivered into the bitchkitten’s belly. Not that you need to do much to encourage her: the moment she’s done talking again, Saen is wrapping her arms around your waist and shoving her face into your tits. You squirm, pressed between your lover’s hot breath and the cold, unyielding wall. Her hands grope and knead your [pc.butt], holding you steady while her lips latch around your teat again. ");
	output("\n\nThis time she drinks her fill, nuzzling into your soft breast and sucking down all you have to offer. You moan softly into her feline ear, letting Saen know just how much you enjoy feeling all that [pc.milk] leak out from your rock-hard nips.");
	if (pc.hasCock()){
		output(" Your [pc.cock] stiffens against Saendra’s thigh, momentarily breaking the kitten’s concentration. She slips a hand around your waist and wraps her fingers around your [pc.cock], stroking it slowly.");
		output("\n\n<i>“A little milk from down here, too?”</i> she murmurs. <i>“I’ll take all you can give me, Hero.”</i>");
	}
	output("\n\nYour lover gives you a little wink and tightens her grip on you. There’s a moment of sudden weightlessness, and then your back is slamming into the soft cushion of the bed. Saen’s legs straddle your [pc.hips], pinning you to the sheets while her tongue runs all over your [pc.belly] and chest, working its way back up to your quivering cups. Her plush pink lips find their way to the breast that so far has gone unmolested, kissing her way into another long, sensuous drink from your ");
	var milkQ:Number = pc.lactationQ();
	if (milkQ >= 5000) output("boundless");
	else if (milkQ >= 1500) output("deep");
	else output("fading");
	output(" reserves.");
	output("\n\nWhile she drinks, Saen’s hands grope your thighs and other breast");
	if (pc.totalBreasts() > 2) output("s");
	output(", making sure your free meal is well-rewarded with pleasure. You squirm under her, feeling your heart hammer in your chest and your skin tingles in the wake of Saendra’s kisses and caresses. Your " + (pc.legCount == 1 ? "[pc.leg] wraps" : "[pc.legs] wrap") + " around her hips, holding her tight to your body until the pretty kitty’s had her fill of your [pc.milk].");
	output("\n\nEven when she’s finally drank you dry, Saendra doesn’t try to seperate from you: she’s content to turn her cheek to the side and rest her head in your cleavage. <i>“Delicious,”</i> she murmurs, hugging you. <i>“Careful you don’t just become my favorite snack.”</i>");
	
	IncrementFlag("SAENDRA_FEED_MILK");
	pc.milked(100);
	pc.orgasm();
	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
