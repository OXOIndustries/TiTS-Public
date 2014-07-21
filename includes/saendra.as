public function saenHeader():void
{
	clearOutput();
	author("Savin");
	showBust("SAENDRA");
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
	if (!flags["FALL OF THE PHOENIX STATUS"] == 1 || !flags["SAEN MET AT THE BAR"] == undefined) return false;

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

	output("A bit hesitantly, you broach the subject of your own desires for the fluffy halfbreed. “<i>So, uh, Saendra... you know, you’re a beast in bed, but...</i>”");
	
	output("\n\nShe interrupts you with a wolfish grin, leaning in until her heavy breasts are straining against her vest, her ample cleavage on full display. “<i>Lemme guess... you want to talk me into getting a big, thick cock, right? {if PC is male: “<i>I knew you were a little buttslut at heart, hero... you just needed the right person to bring it out!</i>” // if PC is female: “<i>A strapon or tenta-probe not cutting it for ya, babe?</i>”}");
	
	output("\n\n“<i>Uh. Well, yeah, actually.</i>”");
	
	output("\n\nSaen blinks. “<i>O-oh. I was... hey, I was just joking. C’mon, hero, knock it off.</i>”");
	
	output("\n\n{if Affection =< 49:");
	output("\n\nYou try to push the issue, but are firmly rebuffed. “<i>Seriously, [pc.name], I’m not... look, I like you and all, but I’m not gonna mess my body up just for you. That’s asking waaay too much, babe,</i>” she says, putting a hand on yours. “<i>Now c’mon, let’s get a drink and do something </i>fun<i>.</i>”}");
	
	output("\n\n{If Affection => 50:");
	output("\n\nSaen sighs, rubbing the back of her neck with her silvery arm. “<i>Ahhh. I dunno, hero. I just... I mean... why? I’m happy the way I am. We have good sex -- no, </i>great<i> sex! -- and I’m fine sticking with toys and stuff when I wanna go after a tight little hole like yours. I just don’t see why I need a dick. I like being a girl.</i>” ");

[Drop It] [Push:Reversable] [Push:FeelsGood]

	saendraAffection(-5);

	clearMenu();
}