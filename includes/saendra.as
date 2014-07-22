public function saenHeader():void
{
	clearOutput();
	author("Savin");
	showBust("SAENDRA");
	showName("\nSAENDRA");
}

public function saendraAtBar():Boolean
{
	if (flags["FALL OF THE PHOENIX STATUS"] == 1)
	{
		if (flags["SAEN MET AT THE BAR"] == undefined)
		{
			return true;
		}

		if (flags["SAENDRA GONNA GO GET A COCK"] >= 1)
		{
			return false;
		}

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

	if (arg != 0)
	{
		flags["SAENDRA AFFECTION"] += arg;
	}

	// capped!
	if (flags["SAENDRA AFFECTION"] > 69) flags["SAENDRA AFFECTION"] = 69;

	return flags["SAENDRA AFFECTION"];
}

// Procs the first time the player enters Anno's bar after rescuing Saen
// Returns true if it output, false if it didnt
public function saenAtTheBarFirstTimeEvent():Boolean
{
	flags["SAEN MET AT THE BAR"] = 1;

	saenHeader();

	output("As you step into Anon’s, you hear a sharp whistle over the low din of conversation, followed by a voice calling “<i>Hey, hero!</i>” Searching the dark bar room, you eventually spot a familiar figure among the patrons: the red-headed freighter captain you rescued from the Black Void not all that long ago. Surprised to see the fiery captain again, you make your way over to her table. She makes a gesture to the bartender, and as you take a seat across from her, a pair of steins are dropped off: yours full of top-shelf booze, hers full of some salty-smelling white cream. ");

	output("\n\nAs the captain lifts her glass, you see something’s very different about her since the last time you saw her: her left arm ends at the elbow, after which it’s replaced by a glistening chrome prosthetic, mimicking the shape of her remaining limb. Seeing where your eyes are wandering, the captain sighs and shrugs, looking at the metallic hand grasping her stein. ");

	output("\n\n“<i>Just a flesh wound,</i>” she chuckles dryly, followed by a long drink that leaves a thin white moustache on her lip. “<i>Could have been a lot worse, though...</i>”");

	output("\n\n“<i>Speaking of which: thanks again for the timely rescue, hero,</i>” she says, giving you an exaggerated wink as leans back in her seat, cradling her frothy, potent-smelling drink. “<i>Thought I was a goner that time for sure. You sure know how to make an entrance, don’tcha? Oh, the name’s Saendra by the way. Captain Saendra en Illya... or just Saen to my friends. Pleasure to meet you.</i>” She extends her flesh-wrought hand, and you shake it vigorously.");

	output("\n\n“<i>Steele. [pc.name] Steele,</i>” you say, wincing slightly as the untrimmed ivory claws on her  grey-furred hand brush against your skin, but her wringing grip is surprisingly gentle for all its strength.");

	output("\n\nAs you and the captain release each other, a bright blue light flashes on her silver-colored mechanical hand and a holographic fairy woman appears, just a touch taller than Saen’s palm, fluttering on her translucent butterfly wings with a short sundress flowing around her knees. With faintly English accent, the hologram announces, “<i>Port authority wants a word, Saen. Something about docking fees and empty accounts. Again.</i>”");

	output("\n\n“<i>And the virtual vixen here’s Valeria,</i>” Saen adds, nodding to her wrist. “<i>I think you’ve met.</i>”");

	output("\n\n“<i>Hey!</i>” the A.I. says, smiling up at you. “<i>Sorry, I didn’t notice you there. Long time no see, [pc.name]. Good to see you.</i>”");

	output("\n\nYou give her a polite nod as she turns urgently back to her captain. “<i>Seriously, furball, we’re dead broke. We have to dig up some credits or we’re grounded. Uh, grounded-er.</i>”");

	output("\n\n“<i>We’ll talk about it later, Val. Just stall ‘em for a little. I’ll take care of it.</i>”");

	output("\n\n“<i>That’s what you said last ti-</i>”");

	output("\n\nWith a button press, the A.I. is banished back into Saendra’s wrist. ");

	output("\n\n“<i>So, where were we, hero?</i>” the captain says, leaning in enough to give you a front-row view of her impressive cleavage through the low cut of her shirt, the two heavy orbs of her breasts pressing against the cold tabletop. “<i>Oh, I know. How about the part where I give you a... </i>proper reward<i> for bailing me out of that tight spot, hmm? I like to be very good to my friends, you know,</i>” she says, grinning wolfishly as you feel a warm, soft tail coil around your [pc.leg]. “<i>I’ve got a room upstairs, hero. What do you say you let me show you just how grateful I am?</i>”");

	saendraAffection(5);

	clearMenu();
	//[Let’s do it!] [Not right now]
	addButton(0, "Let's do it!", takeTheRewardYouSlut, undefined, "Take the reward", "Accept Saen's reward.");
	addButton(1, "Not right now", dontTakeTheRewardWhaddaYouGayOrSomething, undefined, "Not right now", "Turn the reward down.")
}

public function dontTakeTheRewardWhaddaYouGayOrSomething():void
{
	saenHeader();

	output("As politely as you can, you try to excuse yourself. “<i>Sorry. Maybe some other time.</i>”");
	
	output("\n\nWith a <i>tsk</i>, the sultry halfbreed leans back, letting you go. “<i>Aw, killjoy. Well, looks like I’m grounded here for the time being, anyway. If you change your mind, swing back around come evenings. Even if all you want’s a drinking buddy.</i>”");
	
	output("\n\nYou nod, and slip out of the booth, heading towards the door. Over your shoulder, you hear her call, “<i>See you around, hero!</i>”");

	clearOutput();
	addButton(0, "Next", mainGameMenu);
}

public function takeTheRewardYouSlut():void
{
	saenHeader();

output("“<i>Alright,</i>” you say, reaching down to stroke the soft tail slithering up your leg. “<i>Let’s see this gratitude of yours, captain.</i>”");

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

	output("\n\nFor a second, you part; you’re both panting with lust and desire, hands roaming all over each other. Her voice dripping with raw sexuality, your lover asks, “<i>So how do you want me, hero? I’m all yours....</i>”");

	saendraSexMenu();
}

// Repeat meetings at the bar
public function meetSaenAtTheBar():void
{
	saenHeader();

	output("Seeing Saen in her usual spot, you slide into the booth across from the fiery-haired captain and call for a drink.");

	output("\n\n“<i>Heyya, hero,</i>” she says, grinning even as her pair of fluffy tails coil affectionately around your [pc.leg]. She kicks back what’s left of her drink as you say hello, leaning back in her seat with her arm slung over the back and her chest pressed out, straining her blouse in all the right ways. “<i>So what’s up? Just come for the company... or do you wanna blow off some steam?</i>”");

		saendrasBarMenu();
}

public function saendrasBarMenu():void
{
	clearMenu();

	//Options:
	//[Talk] [Sex] [Appearance] {If SaenAffection >= 70: [Kiss her]} [Leave]
	//NOTE: Unless otherwise noted, nothing but Sex & Leave will cause the PC to leave; ie, you return to her main menu after each choice made. 
	
	addButton(0, "Talk", talkToSaendraAboutStuffAndThings, undefined);
	addButton(1, "Sex", saendraSexMenu, undefined);
	addButton(2, "Appearance", takeAGoodLookAtSaendra, undefined);
	if (saendraAffection() >= 70)
	{
		addButton(3, "Kiss Her", kissSaendraOnTheLipsAndEverystuff, undefined);
	}
	else
	{
		addDisabledButton(3, "Kiss Her", "Kiss Her", "Maybe if she liked you more and stuff you could totally make out and kiss her on the lips and stuff and things.")
	}
	addButton(14, "Leave", leaveSaendraAtTheBar, undefined);
}

public function saendraSexMenu():void
{
	clearMenu();

	if (!saendra.hasCock()) addButton(0, "Take Strapon", takeSaensStrappedyDappedyCock, undefined, "Take Strapon", "Saendra dons a strapon and goes to town on your ass.");
	else addButton(0, "Get Buttfucked", takeSaensCompletelyReasonablyProportionedFutaCock, undefined, "Get Buttfucked", "Put Saendra's new cock to work on your ass.");

	if (pc.hasCock())
	{
		addButton(5, "Cowgirl", saendraRidesYouCowgirlStyle, undefined, "Cowgirl Style", "Let Saendra ride your cock cowgirl style.");
		addButton(6, "Fuck Her Ass", saendraTakesItUpDaButte, undefined, "Fuck Her Ass", "Fuck Saendras wonderous ass.");
		addButton(7, "Titfuck", saendrasTitsLookRatherGloriousItdBeAShameIfSomebodyStuckTheirCockIntoThatDeliciousCleavage, undefined, "Titfuck", "Saendras tits look rather glorious. It'd be a shame if somebody stuck their cock into that delicious cleavage.");
	}
	else
	{
		addDisabledButton(5, "Cowgirl", "Cowgirl Style", "If you had a cock you could let Saendra ride you cowgirl style.");
		addDisabledButton(6, "Fuck Her Ass", "Fuck Her Ass", "You could fuck her wonderous ass... if you had a cock.");
		addDisabledButton(7, "Titfuck", "Titfuck", "Saendras tits look rather glorious. It's a shame you don't have a cock to stick into that delicious cleavage.");
	}

	if (pc.hasVagina())
	{
		addButton(10, "Probe Sex", saendraProbesYourCuntWithHerMechaArm, undefined, "Probe Sex", "Saendra's mechanical arm has some interesting features...");

		if (saendra.hasCock())
		{
			addButton(11, "Ride Cock", saendraStuffsHerFutacockInYourCunt, undefined, "Ride Cock", "Well, you talked her into getting a cock. It'd only be fair to give her somewhere proper to stick it.");
		}
		else
		{
			addDisabledButton(11, "Ride Cock", "Ride Cock", "Maybe you should talk to Saendra about various other... improvements available these days. Maybe about picking up a cock?");
		}
	}
	else
	{
		addDisabledButton(10, "Probe Sex", "Probe Sex", "Saendra's mechanical arm has some interesting features, but without a vagina there's not much you can do with them.");

		if (saendra.hasCock())
		{
			addDisabledButton(11, "Ride Cock", "Ride Cock", "Without a vagina, there's only one hole Saendra can stuff her cock in.");
		}
		else
		{
			addDisabledButton(11, "Ride Cock", "Ride Cock", "Maybe you should talk to Saendra about various other... improvements available these days. Maybe she could pick up a cock and you could get yourself a vagina?");
		}
	}
}

public function leaveSaendraAtTheBar():void
{
	saenHeader();

	output("You spend a few minutes in friendly banter with the fluffy halfbreed, trading a few choice bits of news or gossip, but soon feel that your visit is reaching its end. Seeing you getting ready to leave, Saen");
	if (saendraAffection() >= 70) output(" reaches across the table to give you a quick, affectionate kiss");
	else output(" inclines her head to you");
	output(". “<i>See you around, hero. Take care out there.</i>”");

	output("\n\nYou tell her you will as you head on out.");

	saendraAffection(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function kissSaendraOnTheLipsAndEverystuff():void
{
	saenHeader();

	output("You reach across the table and cup Saendra’s cheek, earning a pleasantly surprised gasp from the young woman as you lean in, pressing your lips to hers. She’s like putty in your hands for the briefest of moments, nuzzling against your hand as she returns your kiss. ");
	
	output("\n\nYou hold her for a moment, eyes closed as your enjoy the pleasant warmth of her thin lips, the feel of her hot breath across your own. You’re both smiling when you finally break the kiss, a look of longing in the captain’s eyes as the moment of solace ends. Almost shyly, Saen runs a hand through her fiery hair, looking pointedly away from you. “<i>T-that was... ohhh....</i>” ");
	
	output("\n\nYou can see a bright blush under her pale, freckled cheeks, and can’t help but smile.");

	saendrasBarMenu();
}

public function talkToSaendraAboutStuffAndThings():void
{
	saenHeader();

	output("You ask Saen if she’s got a few minutes to just chat.");

	output("\n\n“<i>Sure, hero,</i>” she says with a warm smile. “<i>What’s on your mind?</i>”");

	addButton(0, "How's Work", saendraHowsWork);
	addButton(1, "Hobbies", saendraHobbies);
	addButton(2, "Valiera Work", saendraValeriaWork);
	addButton(3, "Her Race", saendraHerRace);

	if (days != flags["SAENDRA TALK PHOENIX STATUS"]) addButton(4, "Phoenix Status", saendraPhoenixStatus);
	else addDisabledButton(4, "Phoenix Status", "Phoenix Status", "You've already talked to Saendra about the status of her ship today.");

	if (flags["SAENDRA OFFER CREDITS UNLOCKED"] != undefined && flags["SAENDRA OFFERED CREDITS"] == undefined) addButton(5, "Offer Credits", saendraOfferCredits, "Offer Credits", "A loader of a few thousand credits would go a long way towards helping Saendra get back on her feet...");
	else addDisabledButton(5, "Offer Credits", "Offer Credits", "Maybe if you can find out about the problems she's been having in a little more detail, you could offer to help her out with some credits.");

	if (flags["SAENDRA FUCKED"] != undefined) addButton(6, "Futafication", saendraFutification, undefined, "Futafication", "Ask Saendra if she's ever thought about growing a dick.");
	else addDisabledButton(6, "Futafication", "Futafication", "Get a little more intimate with Saendra and then you might be in a position to ask about her lack of a wang-doodle.");
}

public function saendraHowsWork():void
{
	saenHeader();

	output("\n\n“<i>So, how’s work,</i>” you ask, remembering the strained conversation between her and Valeria when you first met her here.");
	
	output("\n\nSaen makes a face and grabs another drink from a passing waitress. “<i>Could be better, honestly. The </i>Phoenix<i> took a beating from those pirates and the repair costs were, uh, unexpected.</i>”");
	
	output("\n\nNo sooner have the words left her mouth than Valeria appears on her cybernetic wrist, arms crossed under her chest and looking none too pleased with Saendra. “<i>What Saen means is that we’re completely broke, and our ship is dead in the water. So to speak, anyway. The pirates’ opening salvo broke the old girl’s back, and we’re lucky we managed to limp home after you showed up.</i>”");
	
	output("\n\n“<i>Oh come on, it’s not that bad,</i>” Saen laughs, though half-heartedly. ");
	
	output("\n\nValeria rolls her eyes. “<i>Either way, without the </i>Phoenix<i>, we’re out of work, so to answer your question, [pc.Name], work’s nonexistent and my fluffball here is a fluff-bum.</i>”");
	
	output("\n\n“<i>Hey!</i>” Saen winces, “<i>Low blow, Val.</i>”");
	
	output("\n\nValeria sighs. “<i>Sorry, captain. I’m just... frustrated by all this. I didn’t mean anything....</i>”");
	
	output("\n\nSaen grins and reaches down to rub Valeria’s holo-avatar on the cheek. “<i>Yeah, me too, sweetheart. Me too.</i>” Turning back to you, she says, “<i>Well, I’ve got a job right now fixing things around the station. This bucket’s barely holding together, so there’s plenty of work. Just doesn’t pay for piss. Especially since it costs an arm and a leg to have my baby sitting in dry dock. Still, I’ve got a few things lined up, don’t you worry. I’ll be back out in the Black before you know it.</i>” ");
	
	if (saendraAffection() >= 70)
		output("\n\nWith a mischievous grin, she adds “<i>Relax. I won’t forget to call.</i>”");

	saendraAffection(5);

	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
}

public function saendraHobbies():void
{
	saenHeader();

	output("“<i>What’re you doing for fun these days?</i>”");
	
	output("\n\n“<i>Make fun of people on the ‘net, mostly. Aside from VR, there’s not really a whole lot to do on this damn station. Flirt with the bar girls, a few odd jobs to keep food and booze in me. I feel like I’m spending all my free time working on my ship, these day. That or drowning my sorrows in here. And with my baby’s wings broke, I’ve got plenty of troubles to ruminate on.</i>”");
	
	output("\n\n“<i>Sounds pretty dreary,</i>” you say with a wry chuckle.");
	
	output("\n\n“<i>Well, it’s not all bad. I’m actually got into the playtest for the new edition of </i>Perils in Perdition<i>, which FINALLY fixes the damn broken rules in the last one. 12th Edition didn’t even </i>try<i> to fix the </i>obvious</i>, </i>painful<i> flaws of 11th Edition. The Troubadour I was playing for like, two years was so stupidly powerful... and it’s a white magic class! I shouldn’t even be doing damage, much less outclassing the Dervish or Blood Mage. I mean, I’m not even min-maxing this shit!</i>”");
	
	output("\n\n“<i>What.</i>”");
	
	output("\n\n“<i>And I can’t believe they left out </i>Melina’s Magic Mace<i> in 12th edition. I mean, that’s easily THE best item in the -- why are you looking at me funny?</i>”");

	saendraAffection(5);

	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
}

public function saendraValeriaWork():void
{
	saenHeader();

	output("As you chat a bit with Saen, you notice that Valeria’s holo-avatar is sitting out on her wrist, legs dangling over the edge as she flips through what looks like a virtual book. You ask her what she’s got there, which startles the A.I. girl enough that she nearly falls over. ");
	
	output("\n\n“<i>Oh, uh, nothing. It’s just an idle animation that plays when I’m distracted or doing a search, is all.</i>”");
	
	output("\n\n“<i>A search for what?</i>” you ask.");
	
	output("\n\n“<i>Looking for some work Saen and or myself can do. Odd jobs and maintenance work for her, network repair and data archiving for me. Trying to make sure we get the good stuff before that stupid bug gets it.</i>”");
	
	output("\n\n“<i>Bug?</i>”");
	
	output("\n\nSaen interjects: “<i>Fella by the name of Kylon. Some kinda insect creature from the asshole of the universe. Best damn techie on the station... aside from me, that is!</i>”");
	
	output("\n\n“<i>Whatever you say, boss,</i>” Valeria says, rolling her eyes. As she does so, a strange few shapes on the virtual book in the AI’s holographic hands catch your eye. Leaning over her diminutive form, you look down to see a thousand thousand tiny writhing bodies on her book’s pages, committing innumerable acts of debauchery all at once. ");
	
	output("\n\nBefore you can ask what that’s all about, the book vanishes into thin air, and Valeria turns a darker shade of blue. Saen throws her head back and laughs heartily as her A.I. awkwardly stammers out, “<i>H-hey now, I’ve got more computing power than a whole fleet, you know. A girl’s gotta keep all that thinking power, uh... occupied....</i>”");
	
	output("\n\n“<i>What she means is my entire cloud drive is full of her fetish porn and she’s a dirty, dirty little minx.</i>”");
	
	output("\n\n“<i>Implying you don’t watch it, too!</i>” Valeria snaps before vanishing back into Saen’s wrist, leaving the halfbreed laughing uncontrollably.");

	saendraAffection(5);

	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);

}

public function saendraHerRace():void
{
	saenHeader();

	output("Looking the cat-eared, fluffy-tailed space slut over, you finally ask her what she is, exactly. ");
	
	output("\n\n“<i>[pc.name]... I am... your father!</i>” Saen says in a low, deep voice.... before snickering and waving you off. “<i>Seriously though, that’s a weird question out of the blue. But alright, uh, well, I’m what you’d call a halfbreed. My mom was a kaithrit - a pirate, actually, for most of her life - and my dad was an ausar cargo hauler. The </i>Phoenix<i> was actually his, before... well, you know. So I guess I got a little bit of both races in me: mom’s ears and eyes, dad’s big ol’ fluffy tail and forelimbs.</i>” She pauses to look at her left arm, then grimaces when she suddenly remembers the shiny chrome where the fluff on her other arm would begin. Saendra sighs and rubs at her cybernetic limb. ");
	
	output("\n\nWith a wry chuckle, she composes herself back into her normally lewd self and, snapping a finger towards her groin, says, “<i>Got some girly perks from the ausar half, too: I’m built to </i>take ‘em<i> down there, if you know what I mean.");
	if (saendra.hasCock()) output(" And now I’ve got this kick-ass kitty-puppy-dick-thing going on. So that’s pretty cool.");
	output(" I guess the best way to describe what I am is ‘bitch-kitten.’ Tough as a wolf, playful as a kitten: that’s me!</i>”");
	
	output("\n\nYou chuckle at the half-baked double entendre, and ask how a kaithrit pirate and an ausar cargo captain could have got together. “<i>Talk about opposite world, right?</i>”");
	
	output("\n\nSaen chuckles. “<i>Yeah, definitely. You know, they never really talked about it much - how they got together, that is. I guess my mom must have tried to rob him, and somehow somewhere a whirlwind romance started. Or a really ironic one-night stand gone horribly wrong.</i>”");
	
	output("\n\nShe shrugs and rests her chin in her hands, looking you square in the eye. “<i>C’mon, hero, let’s change the subject before I get all nostalgic and need a hug. Or are you just trying to get me to introduce you to my folks? Careful, mom’s still got a laser shotgun!</i>”");

	//[Next] [Parents]
	saendraAffection(5);
	
	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
	addButton(1, "Parents", saendraParents);
}

public function saendraParents():void
{
	saenHeader();

	output("“<i>Tell me a little bit more about your folks.</i>”");
	
	output("\n\nSaen sighs. “<i>There was a hint back there, you know. Ugh, fine. My mom’ still around, yeah. Not a pirate anymore, but still an asskicker of the highest order. She does private security work now, I think, out on the rim. We actually bumped into each other a few months ago, working. That was pretty neat.</i>”");
	
	output("\n\n“<i>But, uh, dad passed a couple of years back. Got in a fight he couldn’t win, I guess.</i>”");
	
	output("\n\n“<i>Oh. Sorry,</i>” you say, putting a hand on Saen’s.");
	
	output("\n\nShe shrugs. “<i>It’s fine. That was years ago, I’m okay now,</i>” she says, patting your hand. “<i>Now c’mon, let’s talk about something a little bit more fun, huh?</i>”");

	saendraAffection(-10); // -5 plus remove the 5 we added before the branch.
	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
}

public function saendraHerArm():void
{
	saenHeader();

	output("“<i>So, mind telling me a little about that chrome?</i>” you ask, nodding to her cybernetic arm. ");
	
	output("\n\nSaendra blinks at you, then looks to her half-mechanical arm, almost like she’d forgotten it was there. “<i>Oh, yeah. Nothing too fancy, I guess. Between medical bills and patching my ship up, I’m pretty tight on credits. Had to settle for the most basic model, pretty much. I can kind-of-sort-of feel things through it, but it responds pretty much one-to-one and it’s easy to clean and fix.</i>”");
	
	output("\n\nAs she speaks, Saen moves her silvery left arm around, rotating the wrist and wiggling her fingers. She breaks her melancholy long enough to put her hand on your arm and give you a little smile. “<i>Like I said when we met, it could be a lot worse. Besides, with some spare parts from my ship and a little scrounging, I’ve managed to do some modding. Reworked a dead holo-terminal into a wrist-display...</i>”");
	
	output("\n\nValeria shimmers to life on her wrist, waving at you.");
	
	output("\n\n“<i>... built a telescoping probe out of some old mil-spec hardware. Good for fuckin’ and fixin’. Oh, and a flamethrower. Just some old fuel cells and a lighter, but good enough to burn the next pirate that wants a piece of me! I’d show you, but, uh, I don’t want to burn the place down. But it totally works!</i>”");
	
	output("\n\n“<i>Right. So about that probe...?</i>”");
	
	output("\n\nSaen gives you a grin and flicks her cyber-wrist. From the palm, a long, thick metallic hose snakes out, slithering across the table toward you. “<i>Three feet long, thick as a bullcock, and completely prehensile. Took a little mucking around with the firmware and the control chip they put in my brain - ow, by the way. Don’t recommend it - but I got it to work! Give it a kiss!</i>” she laughs as the slithering probe rears up like a cobra, its rounded, pointy tip reaching over to peck you on the lips. ");
	
	if (flags["SAENDRA FUCKED"] != undefined)
	{
		output("\n\n“<i>So... when do I get to use this bad boy on you, hero?</i>” she teases, adding an exaggerated wink for emphasis.");
	}


	saendraAffection(5);

	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
}

public function saendraPhoenixStatus():void
{
	saenHeader();
	flags["SAENDRA TALK PHOENIX STATUS"] = days;

	output("“<i>So how’s your ship doing, Saen?</i>”");
	
	output("\n\nSaendra sighs, resting her cheek in her hand. “<i>Not great, hero. Those damn pirates broke the old girl’s back with a rocket when they jumped me. Her hull’s torn to pieces, the flux converters are shot all over, and the shields are blown out. Went out with a bang just before I punched the light drive getting out of there.</i>”");
	
	output("\n\n“<i>That bad, huh?</i>” you ask, just as a waitress comes by with another full stein for your companion. ");
	
	output("\n\nShe nods. “<i>It ain’t great, that’s for sure. I had insurance on the </i>Phoenix<i>, of course, but not enough to cover her getting torn up by that kind of weapons fire. At least it was enough to get most of the interior patched up, and the life support works, uh, most of the time. I’m ending up spending most of my free time down there fixing her by hand, with whatever spare parts I can beg or skirt off the garage crew. Gonna take me forever at this rate, though.</i>”");

	if (flags["SAENDRA PHOENIX STATUS TIMES"] == undefined)
	{
		output("\n\nAfter a moment of thought, Saendra adds, “<i>Hey, if you want... I’m pretty sure we’re parked in the same dock. Lemme give you the berth number... you could drop by any time. Would be nice to have some company while I’m working.</i>”");

		output("\n\nShe scribbles something down on her napkin and hands it over to you.");

		output("\n\n<b>The <i>Phoenix</i> has been unlocked from the Tavros Station central lift.</b>");

		flags["SAENDRA PHOENIX AVAILABLE"] = 1;
	}
	else if (flags["SAENDRA PHOENIX STATUS TIMES"] <= 4 || saendraAffection() < 70)
	{
		output("\n\nAfter a moment Saen adds, “<i>Progress is just so </i>slow<i>. Weapons and shields are giving me a world of trouble, and...</i>” she sighs heavily. “<i>Dammit all.</i>”");
		
		output("\n\nValeria shimmers into being on Saen’s wrist. “<i>Slow and steady wins the race, captain. Just be patient.</i>”");
		
		output("\n\n“<i>I know, I know,</i>” the captain sighs, her ears lowering. “<i>I just feel so fuckin’ helpless cooped up here. I hate not having my ship.</i>”");
		
		output("\n\nYou reach over and put a hand on Saendra’s shoulder, and she visibly relaxes, smiling over at you. “<i>Sorry, hero. Don’t let me get you down... maybe you’d like to help me take my mind off it?</i>” she adds with a lusty wink, her fluffy tail coiling around your [pc.leg].");
	}
	else
	{
		// Unlock [Offer Credits] talk
		flags["SAENDRA CREDITS TALK AVAILABLE"] = 1;

		output("\n\n“<i>You’ve been at it long enough,</i>” you say gently. ");
		
		output("\n\nSaen sighs. “<i>Yeah. I just... I don’t know what the fuck I’m doing. I’m so strapped for cash doing odd jobs that I can barely pay the docking fees, much less get the parts I need to fix my girl. I don’t know what I’m doing wrong... it shouldn’t be this hard to fix a damn ship.</i>”");
		
		output("\n\nSaen plants her chin on the table, her ears lowering sadly. “<i>Nevermind, babe. I’ll figure something out... don’t worry about me, okay? I’m a big girl, I can take care of myself.</i>”");
	}

	if (flags["SAENDRA PHOENIX STATUS TIMES"] == undefined) flags["SAENDRA PHOENIX STATUS TIMES"] = 1;
	else flags["SAENDRA PHOENIX STATUS TIMES"]++;

	saendraAffection(5);

	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
}

public function saendraOfferCredits():void
{
	saenHeader();
	flags["SAENDRA OFFERED CREDITS"] = 1;

	output("“<i>Hey, I’ve been thinking,</i>” you say, fishing a credit stick out of your pack. “<i>If this would help you out, Saen...</i>”");
	
	output("\n\nHer eyes widen as she realizes what it is in your hand. “<i>Hey, what... what is this?</i>”");
	
	output("\n\nYou shrug. “<i>I know you’re strapped for cash, so, I mean, I have plenty to spare...</i>” ");
	
	output("\n\n“<i>Oh, you");
	if (pc.tallness > saendra.tallness) output(" big");
	else output(" little");
	output(" idiot...</i>” Saen sighs, reaching across the table and curling your fingers back around the credit chit. “<i>I don’t... I can’t take that, hero. You’ve done so much for me already. The last thing I want is to owe you more than I already do.</i>”");
	
	output("\n\nBefore you can try and insist, Saen leans over and plants a kiss full on your lips. “<i>But thank you. I mean it. I just... I have to do this myself, [pc.name]. It’s important to me, okay? Understand?</i>”");
	
	output("\n\nYou nod, and return the chit to your inventory.");

	saendraAffection(5);

	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
}

public function saendraFutification():void
{
	saenHeader();

	if (pc.credits >= 2000 && flags["SAENDRA OH GOD IM POOR"] != undefined)
	{
		saendraOkayLetsDoItCredits();
		return;
	}

	output("A bit hesitantly, you broach the subject of your own desires for the fluffy halfbreed. “<i>So, uh, Saendra... you know, you’re a beast in bed, but...</i>”");
	
	output("\n\nShe interrupts you with a wolfish grin, leaning in until her heavy breasts are straining against her vest, her ample cleavage on full display. “<i>Lemme guess... you want to talk me into getting a big, thick cock, right? {if PC is male: “<i>I knew you were a little buttslut at heart, hero... you just needed the right person to bring it out!</i>” // if PC is female: “<i>A strapon or tenta-probe not cutting it for ya, babe?</i>”}");
	
	output("\n\n“<i>Uh. Well, yeah, actually.</i>”");
	
	output("\n\nSaen blinks. “<i>O-oh. I was... hey, I was just joking. C’mon, hero, knock it off.</i>”");
	
	output("\n\n{if Affection =< 49:");
	output("\n\nYou try to push the issue, but are firmly rebuffed. “<i>Seriously, [pc.name], I’m not... look, I like you and all, but I’m not gonna mess my body up just for you. That’s asking waaay too much, babe,</i>” she says, putting a hand on yours. “<i>Now c’mon, let’s get a drink and do something </i>fun<i>.</i>”}");
	
	output("\n\n{If Affection => 50:");
	output("\n\nSaen sighs, rubbing the back of her neck with her silvery arm. “<i>Ahhh. I dunno, hero. I just... I mean... why? I’m happy the way I am. We have good sex -- no, </i>great<i> sex! -- and I’m fine sticking with toys and stuff when I wanna go after a tight little hole like yours. I just don’t see why I need a dick. I like being a girl.</i>” ");

	saendraAffection(-5);

	//[Drop It] [Push:Reversable] [Push:FeelsGood]
	clearMenu();
	addButton(0, "Drop It", saendraDropIt, "Drop It", "Drop the subject.");
	if (flags["SAENDRA TALKED ABOUT FUTA"] >= 1 && saendraAffection() >= 50)
	{
		addButton(1, "Push: Reverse", saendraFutaReversable, true, "Push: Reversable", "Push the discussion about Saendra getting a cock. Emphasise that the process is reversable after all...");
		addButton(2, "Push: Good", saendraFutaFeelsGoodMan, false, "Push: Feels Good", "Push the discussion about Saendra getting a cock. Emphasise that it would feel really special.")
	}
	else
	{
		if (saendraAffection() < 50)
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

	output("“<i>Alright, alright. Forget I asked,</i>” you say, patting Saen’s shoulder. ");
	
	output("\n\nShe nods slowly. “<i>Yeah. Let’s, uh, let’s just move on, huh?</i>”");

	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
}

public function saendraFutaTalkII(reversePath:Boolean = true):void
{
	saenHeader();

	if (reversePath)
	{
		output("“<i>Come on, Saen, haven’t you ever wanted to try it out? Besides, what do you have to lose? If you don’t like it, you can always get rid of it.</i>”");
		
		output("\n\nSaen fidgets uncomfortably. “<i>I... I guess. I don’t know, [pc.name], I can tell you really want it, but... you know what? Fuck it! You’re right, I can always get rid of it later.</i>” ");
		
		output("\n\nYou break into a big grin as Saendra finally gives into your cocklust. She hops to her feet, suddenly excited. “<i>Alright. I know this creepy demon chick across the hall that does custom mods. But </i>you’re<i> paying for it, you want it so bad.</i>”");
	}
	else
	{
		output("“<i>C’mon, Saen. It’ll feel amazing,</i>” you say, putting a hand on your lover’s. “<i>Imagine a great big clit, super sensitive, pounding");
		if (pc.hasVagina()) output(" my pussy");
		else output(" my ass");
		output(". And you’d have a prostate, too... you haven’t had anal until you’ve done it with a prostate in your backdoor.</i>”");
		
		output("\n\n“<i>You’re not wrong,</i>” Saen admits. “<i>I hear shit like that all the time... extranet’s got plenty of dickgirl porn, you know.</i>”");
		
		output("\n\nValeria pops up. “<i>And you’ve downloaded most of it!</i>”");
		
		output("\n\n“<i>Sh-shut it, pixel-butt!</i>” Saen snaps, clicking Val off. “<i>Look, I dunno, hero. I can tell you really want it, but... ah, maybe you’re right. It probably </i>would<i> feel amazing. Maybe you’re right. What’s the harm in trying, right?</i>” ");
		
		output("\n\nYou break into a big grin as Saendra finally gives into your cocklust. She hops to her feet, suddenly excited. “<i>Alright. I know this creepy demon chick across the hall that does custom mods. But </i>you’re<i> paying for it, you want it so bad.</i>”");
	}

	saendraDoCockuMenu();
}

public function saendraDoCockuMenu(triedThrobb:Boolean = false):void
{
	clearMenu();
	if (player.credits >= 2000)
	{
		addButton(0, "Okay", saendraOkayLetsDoItCredits, undefined, "Okay", "Agree to pay the fees required to get Saendra setup with a cock.");
	}
	else
	{
		addButton(0, "Okay", saendraBuhuImPoor, undefined, "Okay", "Agree to pay the fees required to get Saendra setup with a cock.");
	}

	if (!triedThrobb)
	{
		addDisabledButton(1, "Throbb", "Use Throbb", "Saendra seemed pretty against the idea of using Throbb for the process.");
	}
	else
	{
		if (player.hasItem(new Throbb()))
		{
			addButton(1, "Throbb", saendraUseTheThrobbLuke, undefined, "Use Throbb", "Hey, you've got some of this stuff kicking around. Might as well put it to a good use, right?");
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
		pc.credits -= 2000;

		output("“<i>Sounds good. Let’s do it.</i>”");

		output("\n\nSaen flashes you a grin, her prior nervousness evaporating behind her usual bravado. “<i>Alright. I’ll meet you over there, hero. Don’t keep me waiting!</i>” With that, she slips out of the booth, grabs her jacket from over her seat, and pops out of the bar. ");
	}
	else
	{
		output("“<i>Hey, I finally got the money!</i>” you announce.");
		
		output("\n\nSaen blinks. “<i>Huh? Didya win a bet or something, hero?</i>”");
		
		output("\n\n“<i>No, for getting you, you know... what we talked about.</i>” ");
		
		output("\n\n“<i>...Oh. I guess I did agree to that, huh? Alright, if you got the money, I’m still willing to give it a shot, [pc.name]. Meet ya at Dark Chrysalis?</i>”");
		
		output("\n\nYou nod as Saen packs up and pops on out of the bar, reaching back and brushing your cheek with one of her fluffy tails as she goes. ");
	}

	flags["SAENDRA GONNA GO GET A COCK"] = 1;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function saendraUseTheThrobbLuke():void
{
	saenHeader();

	output("“<i>Actually... I have a little something here. We could do it right now,</i>” you suggest, producing a Throbb injection.");
	
	output("\n\n“<i>Woah!</i>” Saen says, waving her hands. “<i>Nuh-uh. No way. I’ve heard about that shit. It fucks with your mind, man. I got better shit to do than spend all day fapping my brains out and eating my own cum or something. Not happening. We do it my way, or you can cram your dicklust right up your ass... before I cram my dick up there.</i>”");

	saendraDoCockuMenu(true);
}

public function saendraBuhuImPoor():void
{
	saenHeader();

	flags["SAENDRA OH GOD IM POOR"] = 1;

	output("You");
	if (pc.armor != EmptySlot()) output(" turn out your pockets");
	else output(" shrug apologetically");
	output(". “<i>I don’t think I can really afford that.</i>”");
	
	output("\n\n“<i>Welp,</i>” Saen says with a sigh, plopping back down in her seat. “<i>I guess you’ll just have to make due with a wet, lusty, libidinous slut of a fuckbuddy without a dick. Poor you!</i>”");
	
	output("\n\nShe gives you a playful punch on the arm. “<i>C’mon, let’s drop it... though all this talk of dicks might have gotten me a little horny. You gonna take responsibility for that, hero?</i>” she teases. ");

	clearMenu();
	addButton(0, "Next", talkToSaendraAboutStuffAndThings);
}

public function saendraAtDarkChrysalis():Boolean
{
	if (flags["SAENDRA GONNA GO GET A COCK"] == 1 && !saendra.hasCock()) return true;
	return false;
}

public function darkChrysalisSaendraInject():void
{
	output("\n\nSaendra is leaning against the counter, her twin tails wagging ever so slightly. Surprisingly given Saen's slutty nature, she's managed to keep herself off of Sera's free-swinging dick so far. By the looks the halfbreed keeps shooting that way, though, you doubt it's going to last much longer. Better make it quick.");
}

public function saenSeraHeader():void
{
	clearOutput();
	showBust("SERA", "SAENDRA");
	author("Savin");
	showName("SERA &\nSAENDRA");
}

public function saendraTalkInDC():void
{
	saenSeraHeader();

	output("“<i>Hey,</i>” you say, approaching your fluffy lover and grabbing a handful of her ass. “<i>Ready for this?</i>”");
	
	output("\n\nShe nods. “<i>I think so. Let’s get this over with before I change my mind, okay?</i>”");
	
	output("\n\n“<i>You lovebirds done yet?</i>” Sera says with disinterest. The wanna-be succubus is leaning against the counter, filing her long, pointed nails. Her big, firm breasts are at the perfect angle to let her ring piercings brush the countertop, swaying slightly in the artificial breeze coming in from the vent. “<i>Gonna buy something, or are you just here to see how many cockhungry sluts I can fuck into submission in a row? Here’s a hint: more than the two of you.</i>”");
	
	output("\n\nYou step up to her. The imposing demoness finally looks up.");
	if (fuckedSeraBefore()) output(" “<i>Oh, you again. So its definitely the latter. C’mon, meat, get your girlfriend to bend over and hike those pants down. I don’t have all day.</i>”");
	else output(" “<i>So what’s it gonna be, meat? You want something, or just my dick?</i>”");
	
	output("\n\n“<i>We came to buy something,</i>” you finally say, cutting off any further innuendo from the succubus. “<i>Saendra here...</i>”");
	
	output("\n\n“<i>Wants to grow a dick? Christ, be more vanilla.</i>”");
	
	output("\n\n“<i>Uh. Yeah, actually.</i>”");
	
	output("\n\nSera snorts. “<i>Called it. Hey, ease up. Girls with dicks are basically the new big tits fetish. Especially when they’ve got both, huh?</i>” she says, shifting slightly to emphasize her own ample bust. “<i>So what’s it gonna be, kitten? You want a big, thick cock to fuck your [pc.boy]friend here with?");
	if (pc.hasCock()) output(" Maybe one so big that you’ll put [pc.hisp] to shame?");
	output(" Or do you want a dainty little dick that everyone’s gonna want to suck on before they spread your legs and fuck you like a dirty whore? Maybe then the boys’ll finally be able to tell when you cum.</i>”");
	
	output("\n\nFlashing the demoness a grin, Saendra leans in and whispers, “<i>You’re just jealous that I don’t have to fake it.</i>”");
	
	output("\n\n“<i>Ha! Guess it must be hard to hold it in when half the station’s had a go at your ass today.</i>”");
	
	output("\n\n“<i>Not my fault the boys - and the girls - are lining up around the block for a chance at me!</i>”");
	
	output("\n\nSera snickers. “<i>A chance? Like you could keep your legs closed if they payed you to.</i>” ");
	
	output("\n\n“<i>That’s right,</i>” Saen says, leaning in so close her nose is practically touching the succubus’s, “<i>I give it away, instead of having to brow-beat my customers into it. How’s it feel not being able to actually get a date, glow-in-the-dark?</i>”");
	
	output("\n\n“<i>Mmm. Keep talking dirty to me and I might let you suck my cock, furball. But only if you ask nice.</i>”");
	
	output("\n\nSaen sidles in, a little closer. Their lips all but brush. “<i>Half off?</i>”");
	
	output("\n\nSera answers by reaching out and grabbing Saendra’s tit through her vest. “<i>Done. But " + pc.mfn("man-meat", "tits mcgee", "your butt-buddy") + " gets in on it, too.</i>”");

	processTime(5);

	//[Threesome!] [No way!] [Watch] [Know each other?] [Just Buy]
	//If PC has fucked Sera a few times, go right to threesome.
	if (timesFuckedSera() >= 4)
	{
		addButton(0, "Next", saenAndSeraThreesome);
	}
	else
	{
		addButton(0, "Threesome!", saenAndSeraThreesome, undefined, "Threesome", "Get in on some hot furball-on-demon action. Because why not.");
		addButton(1, "No way!", saenAndSeraNoWay, undefined, "No way!", "Avoid most likely taking it up the butt... for now.");
		
		if (silly) addButton(2, "Watch", saenAndSeraWatch, undefined, "Watch", "You'd prefer to just watch Sera work Saendra over with her cock... or is it Saendra who will be doing the working? NEXT TIME ON EPIC FUCK BATTLES");
		else addButton(2, "Watch", saenAndSeraWatch, undefined, "Watch", "You'd prefer to just watch Sera work Saendra over with her cock... or is it Saendra who will be doing the working?");

		addButton(3, "You've Met?!", saenAndSeraMet, undefined);
		addButton(4, "Just buy", saenAndSeraJustBuy, undefined);

	}
}

public function saenAndSeraJustBuy():void
{
	saenSeraHeader();

	output("“<i>I think we’ll just pay the full price,</i>” you say, planting a credit chit on the counter.");
	
	output("\n\nSera huffs. “<i>A thousand creds just to keep your dignity? Impressive. I guess I’ll just have to pound your girlfriend’s ass some other time.</i>”");

	processTime(1);

	clearMenu();
	addButton(0, "Next", saenAndSeraGetTheDrugs, true);
}

public function saenAndSeraMet():void
{
	saenSeraHeader();

	output("“<i>I take it you two know each other?</i>” you say, watching the two girls practically making out already.");
	
	output("\n\nSera eyes Saendra. “<i>What? You didn’t tell [pc.him]?</i>”");
	
	output("\n\n“<i>T-tell [pc.him] what?</i>” Saendra says, fidgeting.");
	
	output("\n\n“<i>That </i>somebody<i> sucked cock to get those big, bouncy meatbags on her chest.</i>”");
	
	output("\n\nSaen blushes. “<i>Hey!</i>”");
	
	output("\n\n“<i>Aww, it’s okay, furball,</i>” Sera teases, squeezing Saendra’s breast until she winces. “<i>They turned out pretty nice. You might just get to use them on me... if you’re lucky</i>”");
	
	output("\n\nTurning to you, Saen whimpers, “<i>I-it was just once! One cup size, honest!</i>”");
	
	output("\n\nSera’s fingers move to Saen’s nipple, pinching down. “<i>Big-titted bimbo bashful about her boobs? Tsk-tsk.</i>” ");

	processTime(3);

	removeButton(3);
}

public function saenAndSeraWatch():void
{
	saenSeraHeader();

	output("“<i>I think I’ll just watch...</i>” you say, stepping back from the entangled pair. ");
	
	output("\n\nSera huffs. “<i>Fine. But only a quarter off for one cock-sucker.</i>”");
	
	output("\n\nSaendra gives you a reproachful look... just before Sera grabs her head and face-plants her on the counter. “<i>Hope you’re ready for a five hundred credit peepshow, meat,</i>” Sera says, walking around the counter and planting her legs behind Saendra’s upturned ass. The smooth, purple-hued hand not holding the fluffy privateer down reaches around and slaps her ass, fingers sinking into the halfbreed’s squeezable booty. ");
	
	output("\n\n“<i>So where do you want it, slut?</i>” Sera sneers, her lengthy, blue-purple prick flopping into the crack of Saen’s ass.");
	
	output("\n\n“<i>Ass,</i>” Saendra answers, her hands bracing against the countertop.");
	
	output("\n\nSera laughs, her hands hooking through Saen’s belt and yanking down. The halfbreed gives a muted gasp as her pants fall to the deck, leaving her womanhood bare to the succubus’s pleasure. Rather than take the shot, Sera says, “<i>What’s that, furball? I don’t think I heard you.</i>”");
	
	output("\n\n“<i>Put it... gah! Put it in my ass!</i>” Saendra gasps as a pair of Sera’s finger slip into her sex, sliding into her pussy up to the knuckles. Saen groans, fingers digging into the steel countertop as the demoness’s digits probe deep in her slit. ");
	
	output("\n\n“<i>Stop mumbling, slut,</i>” Sera snaps, thrusting her fingers so deep that Saen screams, her tails shooting straight out. “<i>Where do you want me to fuck you in?</i>”");
	
	output("\n\n“<i>My ass!</i>” Saen cries, “<i>Fuck my ass! Fuck my ass, Sera!</i>”");
	
	output("\n\nSera reaches forward, grabbing the scruff of Saen’s neck and pulling her back, hard enough to get the halfbreed to look at her. “<i>There. Was that so hard, slut?</i>” she says, her tongue languidly reaching out to lick the side of Saen’s face, the over-long appendage dragging slowly from chin to where her a human’s ears might have been. Saen shivers, her tails tucking in around Sera’s fingers buried in her cunt. The succubus roughly pulls them back out of the way, keeping the fluffy twins well away from her prize. ");
	
	output("\n\nThe demon-girl releases Saendra’s head, shifting her grip to her own foot-long manhood and guiding her glans down to the ring of the halfbreed’s pucker. “<i>Woah, what’ve you been putting back here, slut? Could fit a fucking tuna can in you,</i>” Sera sneers, apparently having no trouble sliding her purple schlong right into Saendra’s ass. Saen grimaces, biting her lip as she takes the lengthy member. You watch as her gut visibly distends, a little lump forming in her belly as the crown of Sera’s demonic dong pushes against her innards; opposite that, Sera’s heavy nuts bop into Saendra’s backside, resting against the lips of her drooling gash. ");
	saendra.buttChange(sera.cockVolume(0), false, false, false);
	
	output("\n\nWith a little grunt, Saen looks over her shoulder and flashes the succubus a grin. “<i>Is it in yet?</i>”");
	
	output("\n\n“<i>You’re fucking nuts, slut,</i>” Sera laughs. “<i>Alright, let’s see how you like this.</i>”");
	
	output("\n\nSera’s demonic tail swings around one of her legs, the cock-like appendage on its tip reaching up to join its owner’s other manhood. Just like the first, Sera takes her tail-cock and guides it to the now-gaping hole of Saendra’s ass, pressing the crown into the space between her footlong as the top of Saen’s hole. The halfbreed gives a muted gasp as the tail-cock pushes in, spreading Saen wide open between the two of them.");
	saendra.buttChange(sera.cockVolume(0) + sera.cockTailVolume(), false, false, false);
	
	output("\n\n“<i>Feel it now, bitch?</i>” Sera sneers, slapping Saen’s ass. ");
	
	output("\n\n“<i>Is that one finger or two?</i>” Saen laughs, her voice turning into a yelp as the succubus spanks her again. That shuts the randy kitten-bitch up for a moment as the succubus gets ready to start really fucking her. ");
	
	output("\n\nYou lean back against the far wall, a small smirk playing across your face as Sera starts to thrust her hips into the halfbreed’s backside, ripple of flesh quaking through her big behind as the succubus pounds her twin lengths into Saendra’s clenching hole. The fluffy slut lets out a cry of pleasure as the demoness goes to work on her, and you suddenly become very aware of the heat spreading through your own loins, turned on by the rigorous assfucking on display. You let a hand snake down");
	if (pc.lowerUndergarment == EmptySlot()) output(" to your [pc.crotch]");
	else output(" your [pc.underwear] to your [pc.crotch]");
	output(", running your fingers across your");
	if (pc.hasCock()) output(" [pc.cock]");
	else if (pc.hasVagina()) output(" [pc.cunt]");
	else output(" ass");
	output(" to give yourself a little stimulation. ");
	
	output("\n\nSaen catches sight of your will breaking down and shoots you a wink. “<i>Missing out, hero!</i>” she jeers, just as Sera’s hips slam into her ass, both cocks buried to the hilt. “<i>More than enough cock to go around!</i>”");
	
	output("\n\n“<i>[pc.He] made [pc.hisa] choice, furball,</i>” Sera grunts, hips moving faster. “<i>Now clench that ass tighter before I see if I can fit my fist up there, too!</i>”");
	
	output("\n\n“<i>Shut up and fuck me harder, pencil-dick!</i>” Saen laughs back, raising her tails and pushing her hips back against the demoness’s thrusting cocks. ");
	
	output("\n\nYou can only imagine they were yours, the mounting pleasure of pounding your bitch-kitten’s hot little ass, two rods rubbing against each other through the deep, tight-clenched channel of Saendra’s ass. You start to");
	if (pc.hasVagina()) output(" finger");
	else output(" stroke");
	output(" yourself to the thought, emulating that imagined sensation as best you can with what you have. ");
	
	output("\n\n“<i>Now </i>that<i> gets me hot,</i>” Saen cheers from over at the counter. “<i>Harder, [pc.name], harder!</i>”");
	
	output("\n\nYou watch as Saen’s hand snakes down between her spread legs, mirror your own intentions as she starts to stroke her clit. “<i>Ohhh yeah, just like that....</i>” ");
	
	output("\n\n“<i>Fuck,</i>” Sera jeers, “<i>if I wanted this shit, I’d have gone into camwhoring. Get over here and suck a cock already, freeloader.</i>”");
	
	output("\n\nBefore the succubus can get too irate with you, Saendra clamps down hard on the twin pricks spearing her ass, stopping the demoness’s assfucking mid-thrust. “<i>Oh, </i>now<i> you get tight...</i>” Sera starts to say, before grunting with pleasure. “<i>Knock it off or I’m gonna...</i>”");
	
	output("\n\n“<i>Gonna c-c-cuuuum,</i>” Saen finishes, panting hard as her fingers work overtime on the engorged red mound of her pleasure-buzzer. Before Sera can do anything, the succubus’s balls and thighs are suddenly slathered in a squirt of fem-cum as Saen blows her girly load across the shopkeep’s sack; Saen’s legs are visibly shaking from the pleasure as she cums and cums, eyes rolling in her head as orgasm rocks her. ");
	saendra.orgasm();
	
	output("\n\nGrabbing the halfbreed’s shoulders for leverage, Sera slaps her cocks in to the hilt despite how clenched the fluffy slut’s gotten during her orgasm. Saendra screams, back arching and tails shooting straight out as Sera forcefully reams her ass, ignoring the tightness as she buries herself in the bitch-kitten’s ass. “<i>Take it, slut!</i>” Sera growls, hilting herself in the halfbreed’s hole, “<i>Take it and fucking scream my name!</i>”");
	
	output("\n\nSera’s cocks visibly engorge and throb as her demonic dicks fill with cum, and empty out into Saendra’s colon. The halfbreed gasps, grabbing at her tits and bucking back against the demon’s dicks as she’s suddenly filled with hot seed. With a final moan, Saen face-plants on the counter, tails swishing happily as the succubus pumps her ass with spooge. ");
	saendra.loadInAss(sera);
	saendra.loadInAss(sera);
	sera.orgasm();
	sera.orgasm();
	saendra.orgasm();
	
	output("\n\n“<i>Not bad,</i>” Sera says after a long moment, planting a hand on Saendra’s backside and using it to leverage herself out of her tight hole. A waterfall of cum sloshes out with her, splattering onto the deck or the succubus’s thighs; Saen just grins blissfully, still rubbing her clit and wagging her tails happily. ");
	
	output("\n\n“<i>Ugh,</i>” the demoness grimaces, wiping a few stray strands of spooge off her dick onto Saen’s upturned ass. “<i>I guess you earned your discount, slut. Though you better clean your damn mess up.</i>”");

	//Go to Get the Drug
	pc.lust(15);
	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Next", saenAndSeraGetTheDrugs);
}

public function saenAndSeraThreesome():void
{
	saenSeraHeader();

	output("“<i>Good choice, meat,</i>” Sera says, sliding herself up onto the counter and slowly spreading her legs, giving you a good look at the footlong cock and heavy, swinging balls between them. “<i>What’s a mouthful of cum for a discount, right? Come on, bitches, on your knees. I don’t have all day.</i>”");
	
	output("\n\nAt the succubus’s instruction, you take Saen’s hand as you both sink to your knees");
	if (!pc.hasKnees()) output(", or close enough, in your bestial case");
	output(". “<i>Good sluts,</i>” Sera coos, hooking one of her long, purple legs over each of your shoulders, leaving her half-hard shaft bobbing between you and Saen, almost inviting in the way it twitches, growing more turgid under your fixed gazes. Slowly, you crane your neck up toward the foot-long cock on offer and reach your tongue out for a taste.");
	
	output("\n\n“<i>Not yet!</i>” Sera snaps, cracking her thigh into the side of your face, just hard enough to get your attention. She wraps her fingers around her bobbing cock, lifting it up and pointing towards her hefty sack. “<i>You’ve got to earn your way up to the main course, meat.</i>”");
	
	output("\n\nSaen grins at that. “<i>At least it’s better than getting tea-bagged,</i>” she says before reaching up and daintily wrapping her lips around one of Sera’s nads, perfectly encompassing the testicular orb; you take the cue and mirror your lover’s action, all but kissing her across the gulf of Sera’s sack as you take her nut into your mouth. The taste is strong, thick and musky and oh-so-enticing; your eyes flutter,");
	if (pc.hasCock() output(" cock stiffening");
	else if (pc.hasVagina()) output(" cooch wettening");
	else output(" loins afire");
	output(" as desire suddenly takes hold over you. Without further prompting from the dominant demoness, you start to suckle on the supple orb of her teste. Your tongue rolls her nut around your mouth, licking and lapping at the taut skin, sucking just enough to feel the pull as Saen does the same, your mouths tugging her ball in opposite directions. ");
	
	output("\n\n“<i>Not bad,</i>” Sera says, her clawed fingers brushing through Saen’s fiery locks and across your own [pc.hair]. “<i>You two really ought to come as a pair... keep this up and I might just hire you out for the night... or should I be pimping you out to my customers? That’d drum up some business...</i>”");
	
	output("\n\n“<i>Uck oo uu, uut</i>” Saen mumbles around her mouthful of demon-balls. ");
	
	output("\n\n“<i>What’s that?</i>” the demon growls, “<i>Sorry, couldn’t hear you over my balls in your mouth.</i>”");
	
	output("\n\nSera doesn’t wait for an answer, just wrapping her smooth, high-heeled demon legs around your shoulders and pulling the both of you in. You open wide, letting as much demon-nut into your mouth as Sera wants to shove in, until the bottom of her sack is being ppushed up by your bottom lip, straining between your mouth and Saendra’s. The succubus’s thighs push you further together, all but forcing you to make out around her churning balls. And churn they do: you can feel the demon’s sack reacting to your loving attention, clenching and throbbing with need, with pent-up seed ready to be drained from Sera’s rock-hard rod. ");
	
	output("\n\nSeeing where your eyes are going, Sera gives you a curt nod. “<i>Go on, bitch. I guess you can’t curb that cocklust forever, can you?</i>”");
	
	output("\n\nYou ignore the insult in favor of getting your lips around the cyan blue crown of Sera’s dick. The demoness groans, reclining on her hands as you cradle her cock, lips parting to take the first few inches. The taste is intoxicating, the sensation of watery pre caressing your [pc.tongue] as the demonic dick throbs and twitches at your touch.");
	
	output("\n\n“<i>No fair!</i>” Saen complains, popping off of the succubus’s nuts, “<i>Cheater.</i>”");
	
	output("\n\n“<i>Plenty of cock to go around, furball,</i>” Sera grins, her prick-tapered tail swishing around into view. Before Saen can protest, Sera’s tail rushes forward and plugs her mouth full of tailcock, silencing the bitch-kitten with a nice mouthful of her favorite snack. ");
	
	output("\n\nNow getting double-teamed on two ends, Sera merely gives a little shudder and closes her eyes, leaving the heavy lifting to her two dutiful cock-shiners. With your halfbreed lover occupied by a vigorous mouthfucking, you’re free to fulfil the succubus’s wish, slowly sliding yourself down her lengthy rod. You make a sensual trip downwards, doing all you can to tame your gag reflex as the monstrously long demon dong stretches your throat wide, feeling like it’s reaching into your gut by the time your lips touch Sera’s groin. Rather than moving your head overmuch, you content yourself with letting your quaking throat pleasure your demonic mistress, squeezing and caressing the slick shaft until even the normally stoic Sera is is groaning, her legs binding you tight against her crotch until it’s hard to breath - you’re not sure if its the cock lodged in your gullet or the overpowering musky odor drifting up from her pussy and straight into your nose. ");
	
	output("\n\n“<i>Tsk. I feel like I’m doing all the work here, sluts,</i>” Sera sneers, even as her tailcock pounds Saendra’s mouth until the lust-addled bitch-kitten is practically delirious. “<i>Step it up if you want to earn that discount. Or are you two just sucking my cocks it because you love it?</i>”");
	
	output("\n\nBefore you can try and rectify your apparent failings, Sera grabs the both of you by the head, using her powerful legs to push you onto the deck. “<i>You know, in some early earth dances,</i>” the succubus coos, her cocks popping out of your and Saendra’s open mouths, “<i>you sometimes had to switch partners right in the middle of things. It’s going to be something like that.</i>”");
	
	output("\n\nBefore you can question what’s going on, Sera’s high-heeled foot plants you face-first on the deck, putting you on all fours with your ass pressed against your lover’s. Sera hops off the counter, planting her legs between your asses and spreading you apart with a flick of her tail. You lean out, giving the succubus just enough room to kneel between the two of you. You wince as you feel a veiny, writhing mass of cockflesh slap your ass; behind you, Saen’s tails wriggle apart, spreading like her legs as Sera’s yardarm plops between her cheeks. You find yourself bodily pushed forward as the succubus leans back, all but using you like a chair as she presses the cyan crown of her cock into Saendras bum.");
	saendra.buttChange(sera.cockVolume(0), false, false, false);
	
	output("\n\nYou, of course, aren’t left out of the ass-pounding action. Sera’s twisting tailcock wraps around your [pc.leg], hugging your flesh tight as the tip of her tentacle-like appendage teases the rim of your [pc.asshole]. You shiver, bracing yourself and trying to relax as the pressure against your ass increases. Finally, with a grunt of effort from the succubus - and one of pleasure from you - she’s in! " + pc.buttChange(sera.cockTailVolume(), true, false, false); + " You grit your teeth, fingers digging into the cold, unforgiving steel of the deck as you feel yourself being speared by the tendril of Sera’s alien cock. Her probing member’s entrance isn’t painful: she goes nice and slow, clearly concerned entirely for the tightness of your hole and her own pleasure, making no move towards returning the favor. You grit and bear it as she fucks herself deep into your [pc.asshole], forging ahead no matter how tight you clench, her tailcock thruting until you could swear you feel your stomach bulging. ");
	
	output("\n\nBehind you, you hear a cry of pleasure tear itself from Saen’s lips as the succubu thrusts her hips forward, plowing her spit-slick prick into the halfbreed’s well-trained fuckhole. Saen screams in pleasure, her tails flicking wildly around the succubus’s hips, batting at your [pc.butt]. You can all but feel the demon’s cock pushing into Saen’s asshole, feeling every inch of purple dick by the beat of Saen’s tails wagging around. Sera takes her time fucking herself into your lover’s ass, but finally bottoms out -- in you, too. Fully buried in two tight holes, Sera gives a groan of pleasure and grabs a handful of both your asses, squeezing hard enough to make you clench on her tailcock. ");
	
	output("\n\n“<i>Oh fuck, get it in there,</i>” Saen moans, vigorously fingering herself as the demon’s crotch presses into her squishable butt. “<i>Juuuuust like that.</i>”");
	
	output("\n\n“<i>Oh, you’re just insatiable, aren’t you?</i>” Sera grins, giving her a slap on the hiney. “<i>Lucky you your friend here’s occupying my other prick, or I’d giving you a one-woman DP.</i>” ");
	
	output("\n\nSaen looks over her shoulder, flashing the demoness a grin. “<i>We’ll see about that,</i>” she says, and suddenly Sera’s cock inside you goes wild, straining against your anal walls. You let out a startled gasp, moaning like a whore as the tailcock suddenly thrashes in your hole.");
	
	output("\n\n“<i>Too... too tight, bitch!</i>” Sera snaps, swatting Saen on the ass again. The slutty halfbreed is unrelenting, though, clenching down so tight on the demon’s dick that you can <i>feel</i> the cum surging through her slender tail, desperate for release. “<i>Cut it out or I’m gonna... gonna...</i>”");
	
	output("\n\n“<i>Gonna cum?</i>” Saen finishes for her, wiggling her hips around the succubu-girl’s cock. That does it! Sera lashes out, striking Saendra’s ass as hard as she can - which only serves to make the bitch-kitten squeeze tighter and urge on her own orgasm. ");
	
	output("\n\nYou don’t have much more warning that a sudden twitch in Sera’s tailcock to herald her orgasm. A flood of warm, sticky wetness flows into your [pc.asshole], squirting deep into your colon thanks to the buried tailcock inside you. You groan as you’re pumped full of demon-cum, your stomach roiling as it receives an injection from the wrong end. Saen echoes you with a howling cry of pleasure as she’s fucked full of the demon’s cum; even with Saen’s muscles clenching hard, the demoness grips down on the fluff-slut’s hips and manages to forcefully fuck her ass, slowly hammering at Saen’s ass until her primary cock cums as well, filling the halfbreed’s spasming hole with another thick load of demonic spunk. ");
	pc.loadInAss(sera);
	saendra.loadInAss(sera);
	pc.orgasm();
	saendra.orgasm();
	sera.orgasm();
	sera.orgasm();
	
	output("\n\nSera heaves a heavy sighs, and you feel the tendril of her cocktail recede from inside you. “<i>Not bad,</i>” she growls, “<i>I guess that’ll do. This time.</i>”");

	processTime(30+rand(15));

	clearMenu();
	addButton(0, "Next", saenAndSeraGetTheDrugs);
}

public function saenAndSeraNoWay():void
{
	saenSeraHeader();

	output("“<i>No way!</i>” you say, taking a step back. “<i>Not happening.</i>”");
	
	output("\n\nSera rolls her eyes. “<i>What, can’t stand to see your slutty girlfriend get pounded by someone with a real dick? Or are you having second thoughts about letting her peg your ass with a real slab of meat? Don’t worry, meat, no amount of cockdrug is going to make this furball half the woman I am. So man up and throw the cash down, or get the fuck out.</i>”");

	processTime(3);

	removeButton(1);
}

public function saenAndSeraGetTheDrugs(fullPrice:Boolean = false):void
{
	saenSeraHeader();

	// Money was already taken by Saen, so she'll give you half of it back
	if (!fullPrice) pc.credits += 1000;

	output("“<i>Alright,</i>” Sera says, taking credit chit offered by Saen and pulling a small hypo spray out from under her counter. “<i>Here you go, furball. Read the fucking warning label before you take the damn thing, or I’m gonna laugh when you end up in the hospital with a dick bigger than you are.</i>” ");
	
	output("\n\n“<i>Yeah, yeah, whatever,</i>” Saendra says, snatching the hypo from the succubus’s hands and tucking it into her cleavage. She turns her attention back to you, “<i>Well, we’ve got it. Let’s do this... somewhere with some privacy, alright? Meet me at the </i>Phoenix<i> and we’ll... we’ll do it. Together.</i>” ");
	
	output("\n\n“<i>Seriously. Warning label. It’s not there for you to wipe your ass with,</i>” Sera calls after Saen as the fluffy captain slips out of the shop. Sera grimaces. “<i>Dipshit.</i>” ");

	flags["SAENDRA GONNA GO GET A COCK"] = 2;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}