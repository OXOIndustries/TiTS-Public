public function timeForXotchiOverride():Boolean
{
	return (flags["MET_XOTCHI"] != undefined && ((hours >= 6 && hours <= 8) || (hours >= 18 && hours <= 20)));
}

// Replace [xotchiName]
public function get xotchiName():String
{
	return flags["XOTCHI_STAGE"] == 4 ? "Mistress" : "Xotchi";
}

// Replace [xotchiPCName]
public function get xotchiPCName():String
{
	return flags["XOTCHI_STAGE"] == 4 ? "Painslut" : pc.nameDisplay();
}

public function xotchiIsMistress():Boolean
{
	return flags["XOTCHI_STAGE"] == 4;
}

public function xotchiOfficeSpecialTime():void
{
	clearOutput();
	showXotchi();

	output("The doors to the Camarilla office ‘woosh’ open, revealing the usual flood of garish colors. Holoscreens display purple-sand beaches and some kind of translucent-green grass. Beyond the shore is a sparkling blue-green sea. Fish-like creatures soar in the distant skies. Balmy heat and tinny tropical music complete the scene, and you wonder briefly if this is supposed to be the tove homeworld.");

	output("\n\nRather than the usual, excitable form of Tlako ready to greet you, another figure crouches behind a desk in the center of the room. The gregarious pink puff ball’s absence is made all the more prominent by the almost palpable impatience radiating off of the orange-and-black form of");
	if (flags["XOTCHI_STAGE"] < 4) output(" Sub-Madam Xotchi Tzall");
	else output(" Mistress");
	output(".");

	output("\n\nThe tove’s gaze is fixed on her desk, her sideways pupils flickering from screen to screen. Her blood-orange feathers are bristled, poofing out of the top of her black lace corset. Her fan sits open on the desk next to her, display screen flashing nonstop updates. As you step in, her outermost eyes glance up and she raises a single talon as her other three hands tap across the desk, presumably closing several windows.");

	if (flags["MET_XOTCHI"] == undefined)
	{
		output("\n\nYou hesitate. You were expecting Tlako, and you’re unsure of how to deal with the sub-madam.");
		
		output("\n\n<i>“If you’re looking for my worthless secretary, she’s not here. There was a problem with Seeder supply chains on Uveto VII, so I sent her down to inspect them personally,”</i> [xotchiName] explains. The task sounds innocuous enough, but there’s an unpleasant smile on the tove’s face.");
		
		output("\n\n<i>“Unfortunately for me, she’s the only other tove on this ship with her Custommunication License. Mome knows how a bimbuoy like her managed </i>that<i>,”</i> she continues. <i>“So that means I lose several hours of </i>my<i> day running the lobbeach,”</i> she pauses, the smile returning to her face. <i>“Still... I suppose it’s worth it to frost the little ditz.”</i> Her ears flip back and a forth for a moment, and she appears lost in thought.");

		flags["MET_XOTCHI"] = 1;
	}

	processTime(5+rand(5));

	xotchiApproachMerge();
}

public function xotchiApproachMerge():void
{
	clearMenu();

	if (flags["XOTCHI_STAGE"] == undefined)
	{
		output("\n\n<i>“How can I help you?”</i> she asks. There’s a sort-of smile on her face, but her tone is far from welcoming. You can tell that the tove is in a bad mood. You could ask her what’s got her bothered, or just come back later when she’s not here.");
	}
	else if (flags["XOTCHI_STAGE"] == 1)
	{
		output("\n\n<i>“Hello, [xotchiPCName],”</i> she squawks. <i>“If you’re looking for my abysmal excuse for a secretary, I’ve sent her back down to Uveto VII.”</i> She smiles and ruffles her feathers smugly. <i>“That’ll teach the little dryborn to maloptimize my appointments,”</i> she adds.");
		
		output("\n\n[xotchiName] looks busy, but you could ask her if she’s up for another bondage session.");
	}
	else if (flags["XOTCHI_STAGE"] == 2)
	{
		output("\n\n<i>“Well, well, well,”</i> chirps [xotchiName], her tangerine eyes scanning you up and down. <i>“If I didn’t know better, I’d say you came here just to see me.”</i>");
		
		output("\n\nYou grin ");
		if (pc.isNice()) output("nervously");
		else if (pc.isMisc()) output("mischievously");
		else output("eagerly");
		output(", feeling a little tingle as she inspects your body.");
	}
	else if (flags["XOTCHI_STAGE"] == 3)
	{
		output("\n\n<i>“Hello there,”</i> coos [xotchiName]. You can’t help but feel like she’s eyeing you like a piece of meat, and it’s definitely turning you on. <i>“Here to beg for more, are we?”</i>");
		
		output("\n\nYou bite your lip, your breathing already intensifying as you nod silently.");
	}
	else
	{
		output("\n\n<i>“Painslut,”</i> she says, simply. The title is an accusation and an enticement, clinical evaluation and shameful condemnation. It promises a world of pleasure and pain, and you tremble, feeling both anticipation and fear coursing through you. You’re ready to drop to your knees in front of her, but that’s not how it works, and you know it.");

		if (pc.isPregnant()) addDisabledButton(2, "Contract", "Permanent Contract", "Probably wise not to get that deep into things whilst pregnant...");
		else addButton(2, "Contract", xotchiContract, undefined, "Permanent Contract", "Maybe it’s time to make this a little more long-term.")
	}

	processTime(5);
	xotchiMenu();
}

public function xotchiMenu():void
{
	if (pc.isPregnant()) addDisabledButton(0, "BlowSteam", "Blow off Steam", "Probably wise not to get that deep into things whilst pregnant...");
	else addButton(0, "BlowSteam", xotchiBlowOffSteam, undefined, "Blow off Steam", "Help the domineering Tove blow off a little steam.");
	addButton(14, "Leave", xotchiLeave);
}

public function xotchiLeave():void
{
	clearOutput();
	showXotchi();

	if (flags["XOTCHI_STAGE"] == undefined)
	{
		output("You decide that you’re not feeling up to dealing with Xotchi at the moment, and politely take your leave from the Camarilla office. The tove huffs behind you, muttering something about <i>“a waste of chromosomes and money.”</i>");
	}
	else
	{
		output("You decide that you’re not feeling up to a session with [xotchiName] at the moment, and politely take your leave from the Camarilla office. [xotchiName] looks a little disappointed, but bids you farewell.");
	}

	processTime(1);

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function xotchiBlowOffSteam():void
{
	clearOutput();
	showXotchi();

	if (flags["XOTCHI_STAGE"] == undefined)
	{
		output("The orange tove definitely seems out of sorts. And you ask if there’s anything you can do to help.");
		
		output("\n\nShe opens her beak, no doubt to issue some scathing retort, but stops short, her four eyes running up and down you.");
		
		output("\n\n<i>“Possibly,”</i> she says, a curious tone in her voice. <i>“I have a .. let’s say a ‘routine,’ that helps me to relieve stress. It does involve two people, and </i>would<i> involve a significant amount of pain on your end, and pleasure on my part,”</i> she says with a smile.");

		processTime(2);

		clearMenu();
		addButton(0, "Bow Out", xotchiBlowOffSteamS1Nope, undefined, "Bow Out", "Change your mind.");
		addButton(1, "I’m Down", xotchiBlowOffSteamGo, undefined, "I’m Down", "Most intriguing...");
	}
	else
	{
		output("You tell [xotchiName] that you’d like to join her for a session. Her face lights up as she snaps her fan shut.");

		xotchiBlowOffSteamGo(true);

		processTime(1);
	}
}

public function xotchiBlowOffSteamS1Nope():void
{
	clearOutput();
	showXotchi();

	output("That doesn’t feel like your style at all. You politely decline and excuse yourself from the office.");

	processTime(1);

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function xotchiContract():void
{
	clearOutput();
	showXotchi();

	output("You ask Mistress if a more permanent arrangement is possible.");
	
	output("\n\nAll four of Mistress’ eyes widen at your words. <i>“Oh my,”</i> she smirks, <i>“is my little painslut </i>that<i> taken with servicing [pc.hisHer] Mistress?”</i>");
	
	output("\n\nYou nod. The memories of your last session are still fresh, and your body hasn’t stopped aching for more of Mistress’ sweet, terrible touch.");
	
	output("\n\n<i>“I suppose if I had a truly obedient submissive, one completely devoted in body and mind to me, willing to live as my lovely little painslut forever,”</i> she fluttering her fan over her beak, not quite concealing the smile spreading across her face, <i>“I would claim them as my own in an instant.”</i>");
	
	output("\n\n<i>“It would, however,”</i> she adds, snapping the fan shut, <i>“require total surrender to me and accepting your role as my permanent property for the rest of time. Is this something you could do, painslut? Give up on your star-hopping lifestyle to live the rest of your life at my feet?”</i>");
	
	output("\n\nThis is a huge decision. Are you ready to give yourself over to Mistress and give up everything else? This would mean an end to your adventures.");

	processTime(7);

	clearMenu();
	addButton(0, "Not Yet", xotchiContractNotYet);
	addButton(4, "Forever", xotchiContractGo, undefined, "Become Xotchi’s Forever", "Sign on the dotted line.");
}

public function xotchiContractNotYet():void
{
	clearOutput();
	showXotchi();

	output("You’re not quite sure you’re ready for that, and say as much to Mistress, hoping that she won’t be too disappointed.");
	
	output("\n\nReading the concern on your face, she smiles. <i>“It’s more than alright, painslut. I’m honestly just flattered you asked. Maybe, at some point in the future, you’ll decide to be mine forever.”</i>");
	
	output("\n\nShe fans herself briefly before adding, <i>“Is there anything else that you wanted to ask me about?”</i>");

	processTime(4);

	clearMenu();
	if (pc.isPregnant()) addDisabledButton(0, "BlowSteam", "Blow off Steam", "Probably wise not to get that deep into things whilst pregnant...");
	else addButton(0, "BlowSteam", xotchiBlowOffSteamContract, undefined, "Blow off Steam", "Help the domineering Tove blow off a little steam.");
	addButton(14, "Leave", xotchiLeave);
}

public function xotchiBlowOffSteamContract():void
{
	clearOutput();
	showXotchi();

	output("You tell [xotchiName] that you’d like to join her for a session. Her face lights up as she snaps her fan shut. <i>“Always delighted for the opportunity to hurt you, dear painslut.”</i>");

	xotchiSteamStage1(true);
}

public function xotchiContractGo():void
{
	clearOutput();
	showXotchi();

	output("You drop to your knees, whispering <i>“yes.”</i>");
	
	output("\n\n<i>“I think you can be a little more formal than that, my little painslut,”</i> she chortles.");
	
	output("\n\nYou hesitate, unsure of what to say.");
	
	output("\n\n<i>“Are you nervous, little "+ pc.mf("boy","girl") +"?”</i> Xotchi asks, stroking your head. <i>“I’m not a monster, painslut, I just like being in control.”</i>");
	
	output("\n\nShe purrs, tilting your head up with her fan. <i>“You’ll be my obedient little slave, but I’m going to be a good Dominant. You’re still allowed to say no, you just belong to me.”</i> She leans in forward, her claws");
	if (pc.hasHair()) output(" running through your [pc.hair]");
	else output(" running over your head");
	output(". <i>“I’ll take care of you, handle all the hard decisions for you, and you’ll be my obedient little slut.”</i>");
	
	output("\n\nYou whimper softly at her touch, feeling as if a great weight had been lifted off your shoulders.");
	
	output("\n\nShe caresses your cheek lightly, and gestures for you to rise, leading you down the familiar series of tubes and tunnels to your shared room of punishment and pleasure.");
	
	output("\n\n<i>“Let’s formalize this, shall we?”</i> she says, activating the room’s emitters, bringing a synthetic sea floor into existence around you. A light lurch in your stomach announces the absence of gravity in the room as well. As she drifts upwards into the air, she clears her throat. <i>“Sub-Madam Xotchi Tzall of Uveto VII Station Wabeship speaking. Record.I am taking ownership and full custody of [pc.name] Steele. [pc.name] Steele has surrendered autonomy to me and desires to be my subservient property. Upon verbal and biometric consent from [pc.name] Steele, ownership and control over "+ pc.mf("his", "her") +" body, autonomy, property, and material rights transfer to me. Continuous consent is mutually understood, but also required of both parties. At any point, either party may invoke independent, third-party arbitration to terminate this contract. I am Sub-Madam Xotchi Tzall, and I consent to these conditions.”</i>");
	
	output("\n\nShe snaps her fan open, revealing a camera display, with her words slowly panning across it. She presses one of her palms to it. The screen briefly turns bright green before blinking.");
	
	output("\n\n<i>“And you, painslut? Do you consent?”</i> she asks, offering her fan to you. Her voice is strangely quiet and oddly vulnerable.");
	
	output("\n\nYou breathlessly take the fan, repeating the words, then hold your palm to the screen. The screen blinks green, then beeps.");
	
	output("\n\nMistress lets out a held breath, and then smiles. <i>“Now for something a bit less formal,”</i> she murmurs. <i>“Repeat after me: I agree to be Mistress Xotchi Tzall’s loving submissive for all time.”</i>");
	
	output("\n\n<i>“I agree to be Mistress Xotchi Tzall’s loving submissive for all time,”</i> you reply with a smile.");
	
	output("\n\nMistress drifts forward, framing her hands around your face in a strange gesture-her top-most hands resting on your temples, the lower pair cupping your cheeks. All four of her amber eyes meet yours as she brushes the tip of her beak against your");
	if (!pc.hasMuzzle()) output(" nose.");
	else output(" muzzle.");
	
	output("\n\n<i>“Mine,”</i> she says softly.");
	
	output("\n\nYou tremble uncontrollably at the words, awash in some strange blend of obedience, lust, and love. The words complete you somehow, as if you’ve finally found what you’ve been unknowingly searching the galaxy for.");

	processTime(10);

	clearMenu();
	addButton(0, "Next", xotchiContractGoII);
}

public function xotchiContractGoII():void
{
	clearOutput();
	showXotchi();

	output("\n\n<i>“Yours,”</i> you answer.");
	
	output("\n\nShe smiles again, drawing away, and sliding a hand down your arms. <i>“Would you like to celebrate, painslut?”</i> she asks, almost shyly.");
	output("\n\nYou bite your lip in anticipation and nod.");
	
	output("\n\nMistress somersaults in the null gravity, shedding her corset and accoutrements, then coiling around your body. Slowly, sensuously,");
	if (!pc.isNude()) output(" she undoes your [pc.clothes], peeling away your layers until you float naked with her in the depths of the simulated sea.");
	else output(" she trails her claws up around your body in a lazy spiral, picking out just the rights spots to make you shiver and gasp.");
	output(" Her corkscrew path ends with her face-to-face with you, brushing the curve of her beak against your lips. You open your mouth in an instinctive gasp, you eyes closing briefly.");
	
	output("\n\nWhen you open them again, she’s gone. You twist and turn awkwardly, before spotting her reclined on the purple sand below, cradling several shiny objects in her arms. A school of glowing orbs briefly flows around you as you awkwardly try to dog paddle down to her.");
	
	output("\n\n<i>“Come down, painslut. I have a surprise for you.”</i> She laughs at your predicament, but does nothing to help, letting you twist and drift your way eventually down to her. When you finally do touch down on the hardlight sand, she smiles.");
	
	output("\n\n<i>“I knew you could do it,”</i> she chuckles, pulling you against her. She holds up a hoop of metal, decorated in black lace. <i>“Now here’s your reward.”</i>");
	
	output("\n\nIt takes you a moment to understand. It isn’t until you see the small lock on the hoop that it dawns on you.");
	
	output("\n\n<i>“A collar?”</i> you ask in breathless awe.");
	
	output("\n\n<i>“Call me an optimist, but I had it made a little bit after our first session,”</i> she says, idly turning the metal ring over in her hands. <i>“When I see something I like, I immediately start thinking about ways to keep it.”</i>");
	
	output("\n\nYou blush deeply at her words, burying your face against the soft feathers of her stomach.");
	
	output("\n\n<i>“You’re going to need to earn it, though, painslut,”</i> Mistress says, stroking your head. <i>“The price of this shiny new collar is your complete and utter degradation, dear, under the highest setting on the vigoroux.");
	if (silly) output(" But since we’re not allowed to go THAT far, I guess I’ll have to settle on some begging and debasement.");
	output("”</i>");
	
	output("\n\nYour eyes widen, a slow shiver running through your body. She slides out from under you and floats upward, just overhead from your prone body. You hear the familiar hum of her vigoroux powering on.");
	output("\n\nYou look up at her, her orange feathers aglow with an ozone haze, her sinuous tail arcing with jags of indigo electricity, and the metal ring held in one of her hands raining down violet sparks. She looks down at you, her lash in one hand, the ring in the other, like some ancient god of judgement.");
	
	output("\n\n<i>“Beg for it, painslut,”</i> she intones. You feel the familiar sensation of hardlight cuff materializing into place around your arms");
	if (pc.hasFeet()) output(" and ankles");
	output(", pinning you to the floor. She allows you one more look at you before she flicks her tail, showering you with sparks. You arch your back in surprise, as a hundred little pinpicks of pain dig into you, each one a promise of things to come.");
	
	output("\n\n<i>“Please, Mistress,”</i> you murmur, as something swishes through the air behind you.");
	
	output("\n\nKRACK!");
	
	output("\n\n<i>“Louder,”</i> she orders, her words coupled with the strike of her flogger across your [pc.butt]. You squeal at the sudden burst of pain, white hot on your cheeks, then radiating up through the rest of your body like lines of fire.");
	
	output("\n\n<i>“Please, Mistress!”</i> you moan, arching your back down and thrusting your rear back as far as your manacles will let you. You’re already drooling, wanting more of Mistress’ punishment.");
	
	output("\n\nKRACK! KRACK!");
	
	output("\n\nTwin flashes of pain sear across your ass, the electric crackle clinging to your tender flesh even as the implement passes. You convulse with pain, your eyes rolling back in the intertwined surge of pleasure.");
	
	output("\n\n<i>“Please. Mistress. What?”</i> comes Mistress’ voice from behind you.");
	
	output("\n\n<i>“P-please, muh-mistress ...”</i> you groan. It’s so hard to talk through gritted teeth, but you try your best. <i>“Cuh-collar muh-me.”</i>");
	
	output("\n\n<i>“Much better, painslut,”</i> she says. <i>“But what kind of Dominant would I be if I took orders from my submissive?”</i>");
	
	output("\n\nYou whimper, dreading the coming punishment, but still giving your butt a wiggle, showing Mistress your eagerness.");
	
	output("\n\nKRACK! KRACK! KRACK!");
	
	output("\n\nPain erupts through you, thundering waves of agony that tear through your body and brain. For a brief, blessed moment, your butt goes numb, your nerves overloaded. When the pain comes back it’s threefold, a blazing fire that makes you collapse forward, face-down in the sand, sobbing uncontrollably.");
	
	output("\n\nFor a minute or two, the world is just swirling colors and excruciating torment. Then Mistress is in front of you, lifting your head carefully, holding a single claw in front of your eyes, watching carefully as you focus on it.");
	
	output("\n\n<i>“Say my name,”</i> she says softly.");
	
	output("\n\nIt takes a few moments remember how to form words. <i>“Mistress,”</i> you reply.");
	
	output("\n\n<i>“And yours?”</i> she asks.");
	
	output("\n\n<i>“P-painslut,”</i> you answer.");
	
	output("\n\n<i>“Would you like to continue, painslut?”</i> she asks, stroking your head. <i>“Do you need a break?”</i>");
	
	output("\n\nYou tell her that you want more, and, after a few more checks, she nods. <i>“Good [pc.boyGirl].”</i>");
	
	output("\n\nYou pant for a bit, then push yourself back up to your hands and knees. Mistress waits until you’re all the way up before drifting back behind you, laughing as you give your butt an experimental wiggle.");
	
	output("\n\nWhen the next strike comes, it’s softer than the previous ones, but you still cry out as it lands, agony radiating out from you. Slowly, she builds back up, each strike a little harder, letting you breathe between each one. The pain builds, but so, too, does a sort of comforting rhythm.");
	
	output("\n\nEach strike feels better and better. The pain is there-in fact, the pain is what’s making it feel better and better. After a dozen more, your ass is on fire, and you’re drooling continuously onto the sand, your tongue lolling out, and your eyes barely focused. You are Mistress’ painslut, and Mistress makes you feel so good. Mistress loves hurting you, and you love being hurt by mistress.");
	
	output("\n\nAfter what might be an hour or maybe even two, your body gives out, collapsing to the seafloor. Stupid body! Painslut wants more. Painslut needs Mistress’ touch.");
	
	output("\n\nWhen Mistress floats in front of you, you can only gaze up at her in adoration, an expression of pure, wanton abandon on your face.");
	output("\n\nShe smiles down at you, and it feels as good as another strike from her flogger.");
	
	output("\n\nThe thing is in her hand-it’s something... has a name-collar. She holds the collar towards your mouth, all glittery with sparks. <i>“Show me how much you want it,”</i> she orders.");
	
	output("\n\nYou lean forward, fighting the exhaustion in your body, reaching your mouth to the collar, kissing it. Electricity ripples out from it across your lips, a storm of pinpricks that draw involuntary whimpers from you.");
	
	output("\n\nShe nods in approval. Mmmm, approval from Mistress! You want more. Painslut needs to please [pc.hisHer] Mistress. You open your mouth, running your tongue along the metal curve, feeling the electricity stab into your mouth, and loving every minute of it.");
	
	output("\n\nShe lets you adore the collar for a while longer before she pulls it away. You hope you didn’t do anything wrong!");
	
	output("\n\n<i>“Beg,”</i> she says, dangling it above you.");
	
	output("\n\n<i>“Please!”</i> you whine. With Mistress in front of you, the lashing has stopped, and with the collar out of reach, all the pain has stopped, leaving you with only lingering aches.You need her touch.");
	
	output("\n\nShe swings the collar back and forth, just out of reach, showering your face with tiny, burning sparks. Your breath hisses between your lips in pain, even as your body writhes, hungry for more.");
	
	output("\n\n<i>“Pleeeeaaaase,”</i> you groan. <i>“Please, Mistress! I want it! I need it!”</i>");
	
	output("\n\n<i>“Harder,”</i> she purrs. Mistress drifts overhead, coasting slowly across your back, dragging her claws in, scoring lines of electric torture down your body. You spasm, howling in desperation, pleasure, and satisfaction.");
	
	output("\n\n<i>“You’re mine now, painslut,”</i> she coos, dragging another agonizing line across your back. <i>“And I own only the best playthings. Show me that you deserve the collar.”</i>");
	
	output("\n\n<i>“I’m Mistress’ personal plaything. Your private slut forever. I’ll do anything and everything Mistress wants,”</i> you moan, writhing under Mistress’ sweet, terrible touch.");
	
	output("\n\n<i>“Good [pc.boyGirl],”</i> she coos. With each plaintive cry from you, she rewards you with another torment, until you’re a quivering mess, lying on simulated sand, your body a twitching ruin, and your mind utterly broken. Your arms and legs are criss-crossed with welts, your face a mess of tears and drool, and your ass and thighs already purple from bruises. And yet, all that matters is Mistress, and she’s standing over you.");
	
	output("\n\nThe cuffs have been released, and you’re splayed on your back looking up at her. She’s never been more beautiful than now-staring down at you, her expression a mixture of approval, accomplishment, and love. When she leans down to secure the collar around your neck, you can barely burble a response. But it barely matters-Mistress says what’s really important.");
	
	output("\n\n<i>“Mine,”</i> she coos.");

	processTime(15);

	clearMenu();
	addButton(0, "Next", xotchiContractGoIII);
}

public function xotchiContractGoIII():void
{
	clearOutput();
	showXotchi();

	output("\n\nIt takes a surprisingly short time to adjust to life as Mistress’ submissive.");
	
	output("\n\nOver the course of a few weeks, you become used to your collar and managed to earn a lovely little lock and tag, proclaiming your new name, <i>“Painslut”</i> to any reader. It gives you the most delicious thrill when you catch people reading it. You’re simultaneously satisfied and embarrassed that everyone who sees you knows that you’re Mistress’ property. And Mistress never runs out of errands to send you on so that everyone gets a chance to see you. It’s a good thing Uveto Station is heated, because she refuses you any clothes to cover your naked body. After the work day, it’s just the two of you, and you alternate between loving sessions of pain, and less intense times spent together, cuddling or exploring stories in the holo room.");
	
	output("\n\nNot that your body looks <i>too</i> different from before. A few minor genetic modifications give you a subtle set of gills along the sides of your neck, a few aquatic modifications to your ears and eyes, and a translucent webbing between your fingers so that you can follow alongside Mistress both above and below deck of Uveto Station.");
	
	output("\n\nAbove deck, you mostly accompany her, functioning as her full-time servant, and lying at her feet when not called upon for a task. You love feeling her hand or foot on top of you as she talks to visitors to the station. She often strokes your");
	if (pc.hasHair()) output(" hair");
	else output(" head");
	output(" when talking to people to give you the attention that you crave. She’s since fired her old secretary, and you’re quite satisfied in the knowledge that you’re able to perform all of those duties admirably <i>and</i> serve as Mistress’ painslut.");
	
	output("\n\nBelow deck, it’s much of the same. You swim behind her in the aquatic labyrinth that makes up most Uveto Station. You <i>do</i> hear her tove workers talking in passing, but it’s primarily in awe of both Mistress and you. The verbal contract was sound, but Mistress insisted on a formal, written one, deciding that a standard marriage contract satisfied both of your needs. You’re now her property <i>and</i> her spouse, which did something unusual to your claim to your father’s fortune. As your spouse, she now has a claim to it as well, and the prospect of a potentially massive pile of money fired her imagination. To be honest, it’s a bit of a relief to have someone else deal with all of that.");
	
	output("\n\nLately, she’s been taking you out on trips to other planets in her personal shuttle, having taken over the quest for your father’s legacy. She’s carving her way across the galaxy at a feverish pace, buying, bribing, and hostilely taking over anything in her way. You’ve even been able to help-offering your body to help sweeten any deals that need it-with Mistress’ permission, of course, and under her watchful eye.");

	processTime(100);

	clearMenu();
	addButton(0, "Next", xotchiContractGoIV);
}

public function xotchiContractGoIV():void
{
	clearOutput();
	showXotchi();

	output("Six months later.");
	
	output("\n\nYou adjust the black lace around your steel collar nervously, glancing down at the matching cuffs around your wrists. Mistress told you to be on your best behavior tonight. You carefully load up a platter with a teapot, a number of cups, and a small stack of biscuits, and carry it through the door.");
	
	output("\n\nThe sitting room is a fair cry from the lobby that your Mistress used to greet visitors in, lavishly decorated in thick, velvet tapestries, lined with dark wood paneling, cunningly concealing complex control systems. Large paintings if dignified toves line the walls, and a glittering chandelier hangs from the ceiling, throwing the occasional, errant prismatic scatter across the floor. All it took was a leveraging your name as her new property to give Mistress the cache she needed to secure her own satellite-sized wabeship, custom-decorated to her tastes. With her new status and growing wealth, she’s a full Madam by Camarilla standards. You and she have spent the last few months splitting your time between decorating, working, and exploring for new leads.");
	
	output("\n\n<i>“Thank you, painslut,”</i> she purrs as you enter, her approval suffusing you with a familiar warm glow. She’s nested comfortably down in an overstuffed chair, sitting opposite the room’s two other occupants.");
	
	output("\n\nMistress has adopted a bit of her own space-faring style, now that’s she’s on the hunt for your father’s fortune. Her lace corset is lined with several tactical pouches with a sling for her vigoroux, now outfitted for combat as well as bedroom use. A pair of goggles rest atop her head, amidst the familiar cluster of black flowers.");
	
	output("\n\nAs you set the tea tray down on a nearby table, you hear a snigger from the other occupants of the room. You turn, then nearly stumble over backward.");
	
	output("\n\nYour cousin is sprawled across the couch, dwarfed by the hulking form of a black-furred kaithrit male next to [rival.himHer]. [rival.name] leers at you, eyes afire with sadistic delight. The kaithrit’s expression is no better, as the predatory glare from his scarred face matches the throbbing bulge in his pants.");
	
	output("\n\n<i>“You know, I had heard the stories, but I really, really needed to see it for myself,”</i> [rival.heShe] guffaws. <i>“Holy shit! You honest-to-goodness have given up, haven’t you [pc.name]? You know, I’m actually embarrassed </i>for<i> you. This is just sad!”</i>");
	
	output("\n\n<i>“I’ll thank you to not address my submissive without my permission, [rival.name],”</i> says Mistress coldly. <i>“Painslut,”</i> she nods to you, <i>“the tea, please.”</i>");
	
	output("\n\nCheeks burning, you clumsily pour the tea as your cousin sniggers behind you. For the first time in months, you wish you had some clothes on to shield you from [rival.hisHer] view.");
	
	output("\n\n<i>“I’m assuming you didn’t invite me over just to show off how easily you’ve broken my cousin,”</i> [rival.name] snarks. <i>“And if you’re hoping to do the same to me, I have to warn you that I’m not interested. Plus,”</i> [rival.heShe] adds jerking [rival.hisHer] thumb to the kaithrit, <i>“I’ve got a little bit of backup in case of any funny business.”</i>");
	
	output("\n\n<i>“So I’ve noticed. What happened to your last bodyguard, Steele? You seem to go through them at an alarming rate these days,”</i> sniffs Mistress, holding a teacup delicately in her talons. You move to leave, but she pats the edge of her seat and after a moment’s hesitation, you kneel down on the floor at her feet. One of her talons runs across your");
	if (pc.hasHair()) output(" [pc.hair]");
	else output(" head");
	output(" in reassurance.");
	
	output("\n\n<i>“Vildarii assassin,”</i> [rival.name] replies, narrowing [rival.hisHer] eyes at Mistress. <i>“Snuck right up on me and nearly blew a hole through my chest. I don’t suppose you’d know anything about that, would you?”</i>");
	
	output("\n\n<i>“No more than you’d know about the drive core that went inexplicably critical on my ship last week,”</i> says Mistress, cooly sipping her tea. <i>“I wonder if your new employee knows what he’s in for.”</i>");
	
	output("\n\n<i>“I pay them well enough,”</i> says [rival.name], throwing his arms wide. <i>“Koriss Deadeye here knew the risks when I hired him.”</i>");
	
	output("\n\n<i>“It comes with benefits,”</i> rumbles the kaithrit, fixing you with his slitted pupils. You suddenly realize how vulnerable you are, and lean back instinctively against Mistress’ hand.");

	processTime(100);

	clearMenu();
	addButton(0, "Next", xotchiContractGoV)
}

public function xotchiContractGoV():void
{
	clearOutput();
	showXotchi();

	output("<i>“Frankly, that’s what I mean to talk with you about, Steele,”</i> says Mistress, clinking down her teacup. <i>“The costs of this race are mounting. I’ve spent nearly half a million credits this month alone on security and leads. And I can’t imagine it’s been any cheaper for you.”</i>");

	output("\n\n<i>“Hey, you’ve got to spend money to make money,”</i> [rival.name] snarks, unsuccessfully hiding a flash of annoyance.");

	output("\n\n<i>“And if you’ve spent anywhere near what I have, then you have to be wondering if it’s going to be worth it,”</i> says Mistress in a wheedling tone.");

	output("\n\n<i>“Let’s say I have,”</i> says your cousin, leaning forward, [rival.hisHer] arms on [rival.hisHer] knees. <i>“</i>You’re</i> still going after it, and if a tove wants something that bad, then there’s gotta be a ton of money.”</i>");

	output("\n\n<i>“Not always,”</i> murmurs Mistress, almost inaudibly, her fingers sliding down to the back of your neck, and tugging absently on your collar. The rising sense of anxiety melts away at her words and her touch.");

	output("\n\n<i>“A tove, exactly,”</i> says Mistress, more loudly to [rival.name]. <i>“And you understand how indeflappable we are in the pursuit of our goals. </i>And<i> I have the income from my wabeship to fund my pursuit of this fortune.”</i>");

	output("\n\n<i>“I’ve got resources, too, bitch,”</i> snaps [rival.name].");

	output("\n\nYou leap to your feet, not sure of what exactly you plan to do, but ready to jam those words back down your cousin’s throat. You’re so incensed that it takes Mistress’ firm touch on your back to make you realize that, smoothly and silently, Koriss-the hulking kaithrit-is holding five, razor-edged claws under your chin. You take a deep breath, and slowly sink back to the floor as the Kaithrit draws his arm back.");

	output("\n\n<i>“Thank you, dear,”</i> says Mistress, once you’re settled again. <i>“And now, the short answer to that is,”</i> she says, turning to [rival.name], <i>“no, you don’t.”</i>");

	output("\n\n<i>“Maybe </i>you<i> don’t-”</i> [rival.HeShe] starts, before Mistress cuts [rival.himHer] off.");

	output("\n\n<i>“That half a million I mentioned? Half of </i>that<i> went into digging up thorough records on your father, Maximillian Steele, and running the numbers on your activities since this rush began. You </i>don’t<i> have the resources to keep this up, Steele. You’re either critically in debt already, or rapidly approaching zero.”</i>");

	output("\n\nFor the first time, [rival.name] is speechless, mouth agape.");

	output("\n\n<i>“I’m making you a one-time offer, Steele. Four-point-two trillion credits to give up, pack your bags, and go home,”</i> Mistress says, withdrawing a credit chip from her corset.");

	output("\n\n<i>“You don’t have that kind of money!”</i> [rival.heShe] sputters.");

	output("\n\n<i>“I took out a loan,”</i> Mistress says simply. Her tone is level, but your turn to her in shock. You’ve spent enough time among the toves to know what that means. Loans amongst toves are seen as massive social failings, and are generally critically predatory. <i>“With my wabeship as collateral,”</i> she adds.");

	output("\n\nYou finally snap your mouth shut, worried that you’ve given something away, only to turn to see the same expression on your cousin’s face.");

	output("\n\n<i>“Well that just means the fortune has to be even more than that!”</i> [rival.name] sputters. <i>“I can scrounge up what I need and-”</i>");

	output("\n\n<i>“No, you can’t,”</i> says Mistress. <i>“The other half of this month’s expenditures saw to that. I’ve bribed, paid-off, or bought-out every contact I could find in order to blacklist you for the rest of the year. No one’s going to do business with you.”</i> She pauses, delicately sipping her tea. <i>“Not forever, mind you,”</i> she adds, <i>“but long enough to put you terminally deep in the red.”</i>");

	output("\n\n<i>“Are you </i>INSANE?!<i>”</i> yells [rival.name]. <i>“You bankrupted yourself just to fuck me over?”</i>");

	output("\n\n<i>“I think I might be,”</i> says Mistress, smiling. She tugs your collar, pulling you up into the chair with her. <i>“And don’t flatter yourself, [rival.name]-this wasn’t for you.”</i> Her arms wrap tight around you and squeeze.");

	output("\n\n[rival.name]’s eyes widen as [rival.hisHer] eyes snap back and forth between the two of you. <i>“This-this... this is fucking BULLSHIT!”</i> [rival.heShe] screams.");

	output("\n\n<i>“No, it’s simple,”</i> says Mistress, petting you as she speaks, <i>“You sign a contract renouncing any claim to the Steele fortune and then you get to walk away with 4.2 trillion.”</i>");

	output("\n\n<i>“Sounds like a good deal, boss,”</i> says the kaithrit.");

	output("\n\n<i>“Shut the fuck up! What do you know?”</i> snarls [rival.name]. <i>“You’re just the dumb muscle!”</i>");

	output("\n\n<i>“I </i>did<i> graduate at the top of my class, and I’m a certified galactic accountant,”</i> Koriss replies. He pulls a small tablet out of his battle-worn bandolier and begins tapping numbers into it.. <i>“And even based on the limited information I have now, I can tell you that the cost-benefit seems pretty clear-cut.”</i>");

	output("\n\n<i>“Really?”</i> says Mistress, her ears perking up. <i>“Would you like a job after you’re done with your current contract?”</i>");

	output("\n\n<i>“All of you shut up! Just shut up! Shut! The Fuck! Up!”</i> screams [rival.name]. [rival.HeShe] takes a few deep breaths before pointing a shaky finger at you.");

	output("\n\n<i>“[pc.HimHer],”</i> [rival.name] says finally. <i>“I’ll sign your contract, and you can even keep your money-all four trillion of it-but I get [rival.HimHer] as my own property.”</i>");

	output("\n\nA long silence answers this offer.");

	output("\n\n<i>“And what would you do with [pc.HimHer]?”</i> asks Mistress quietly. You glance up at her in alarm, voicing your concern.");

	output("\n\n<i>“Ruin [pc.HimHer],”</i> says [rival.name] through bared teeth. <i>“Just wreck [pc.HisHer] life the way you just wrecked mine.”</i>");

	output("\n\n<i>“And this is worth a fortune to you?”</i> Mistress asks.");

	output("\n\n<i>“Yes,”</i> [rival.heShe] says furiously.");

	output("\n\n<i>“I decline your counteroffer,”</i> says Mistress, simply, pulling you back into her lap.");

	output("\n\n<i>“What?”</i> [rival.name] snarls. <i>“You wouldn’t sell [pc.name] for </i>that<i> much?”</i>");

	output("\n\n<i>“No,”</i> says Mistress, looking down at you with a confused expression. <i>“I honestly wouldn’t sell my painslut for </i>any<i> amount, I think,”</i> she says. <i>“How curious,”</i> she murmurs, running her hands across your face. You smile up at her, your worry fading.");

	output("\n\n<i>“What? WHAT?”</i> fumes [rival.name].");

	output("\n\n<i>“What an un-tove-like thing for me to say,”</i> she remarks, ignoring [rival.name]. <i>“I do believe [pc.heShe]’s ruined </i>me<i>.”</i> She smiles, nuzzling her beak against your lips.");

	output("\n\nYour cousin gapes at the two of you, running a hand through [rival.hisHer] hair. <i>“The fuck?”</i> [rival.heShe] finally manages to croak.");

	output("\n\n[rival.HeShe] blusters for a bit more, but the fight seems to have gone out of [rival.himHer]. After a half hour more of dire threats and exasperation, [rival.heShe] finally consents to the original terms. Koriss and your Mistress review the contract, arguing over the finer points, before [rival.name] signs it and Mistress hands [rival.himHer] the credit chip.");

	output("\n\nWhen [rival.name] finally storms out of the room, [rival.heShe] stops to shoot you the most malignant glare [rival.heShe] can muster before he leaves. But it doesn’t really matter.");

	output("\n\nWhat matters is your Mistress.");

	output("\n\nWith the others finally gone, you sidle up next to her. <i>“Are you going to be alright?”</i> you ask.");

	output("\n\n<i>“I think so,”</i> she says, her eyes a bit distant. <i>“The wabeship was the collateral, after all. I’ll lose that, but not my shuttle. We can still get around in that, even if it means smaller accommodations than we’re used to, while we search for your father’s fortune.”</i>");

	output("\n\n<i>“What if it’s not enough?”</i> you ask. <i>“I mean, it can’t be as much as four trillion credits.”</i>");

	output("\n\n<i>“I think... I actually think that would be okay,”</i> Mistress says, her eyes focusing on you. She laughs suddenly, wrapping her feathered tail around you. You’re suddenly reminded of the long-ago aftercare sessions the two of you spent back on Uveto VII.");

	output("\n\n<i>“Oh my goodness, painslut!”</i> she chortles. <i>“I’ve spent so much time breaking you over and over, that I didn’t notice when you broke </i>me<i>. Can you believe it? I honestly don’t care about the money.”</i>");

	output("\n\nShe wraps her arms around you hugging you close to her body. You return the embrace, your arms sinking into her plush feathers. <i>“Just you,”</i> she says.");

	processTime(100);

	clearMenu();
	badEnd();
}

public function xotchiBlowOffSteamGo(extendScene:Boolean = false):void
{
	if (extendScene == false)
	{
		clearOutput();
		showXotchi();
	}
	else
	{
		output("\n\n");
	}

	output("<i>“Follow me, then,”</i> says [xotchiName], turning toward the gaudy back wall. At her approach a panel WOOSH-es up.");
	if (pc.tallness > 48) output(" You duck down a little to follow her.");
	output(" She walks ahead of you, moving with the awkward shuffle of all toves walking bipedally. It’s kind of funny-such a domineering personality in a 3-foot creature that waddles so much that the black feather in her headdress bounces with every step. You stifle a laugh and follow behind");
	if (pc.tallness > 48) output(", stooping to avoid hitting your head on the ceiling");
	output(".");
	output("\n\nThe hallway is startlingly bare after the saturated tropical panorama of the main office. Gray, brushed steel makes up the walls, floor, and ceiling of a hallway only a few yards long. Small domes of light are placed in regular lines along the walls. Oddly enough, the hall seems as wide as it is tall, feeling more like a tunnel than a typical hallway. At the far end is a circular doorway, a metal iris spiraled shut.");
	output("\n\nWhen she reaches the far end of the hall, [xotchiName] snaps open her fan, her claw tips playing over a myriad of icons. A hollow beeping emits from some unseen speaker. You think you can hear-from the other side of the door-the sucking sound of water draining.");

	if (flags["XOTCHI_STEAMED_CLAMS"] == undefined)
	{
		output("\n\n<i>“I’m assuming that, like most of the sapients that come through here, you’re solely terrestrial,”</i> she says with a disdainful sniff. <i>“We’re entering the workstrata of the wabeship. It’s normally staffed solely with toves, and we much prefer swimming to walking.”</i>");
		
		output("\n\n<i>“Fully half of this station is filled with water to accommodate the tove staff that keeps it running,”</i> she explains, tapping a clawed foot against the steel floor as the draining sound continues. <i>“What you terrestrials experience is the part of the ship we build for customers.”</i>");
		
		output("\n\nYou think back to the size of the satellite and the small amount of it you’ve been able to explore, the impact of her words settling on you. <i>“We have a crew complement of 800 toves in the workstrata of Uveto Station, give or take 25 on leave at any given time. All working hard to keep it operating smoothly,”</i> she adds.");
		
		output("\n\nThe metal iris opens, revealing a blue tunnel beyond it.");
		
		output("\n\n<i>“Try not to make a fool of yourself,”</i> says [xotchiName] bafflingly, as she steps through it. You walk through the door, blinking at the sight before you.");
		
		output("\n\nYou’re in a tunnel again, but this is one appears to me made of an energy field, similar to your own shields. Outside of it, though, is a chamber easily 30 feet high and twice as a wide, filled with water. Toves drift overhead through it; their bodies-amusingly awkward on land-undulate gracefully through water. With their talons tucked, they’re surprisingly streamlined, moving like eels between massive satellite-shaped apparatuses hanging in the water.");
		
		output("\n\nStationary toves cluster around the satellites, and you realize that the irregular spheres are consoles, covered in screens and keyboards. The four-armed toves work busily at them, their eyes flickering independently from screen to screen. You hear nothing in in the tunnel but the impatient tapping of Xotchi’s talon on the steel floor. But you notice that the toves in the water overhead don’t seem to be talking-instead, when two toves meet, their feathery ears sway this way and that, gesturing meaning to one another.");
		
		output("\n\n<i>“Are you going to continue gaping like you’re sundazed?”</i> asks [xotchiName], snapping her fan open and tapping out several complex patterns on it. <i>“Because I </i>could<i> be attending to other things in the meanwhile.”</i>");
		
		output("\n\nShe leads you across the floor to a wall on the opposite side. <i>“The route will be a bit long, as you terrestrials are limited to two dimensions.”</i>");
		
		output("\n\nShe takes you down several more corridors, some made of transparent tubes winding between gigantic, churning machines, others made of the same brushed steel of the first corridor, and through at least one other massive, water-filled room. Once or twice, you wait as [xotchiName] adjusts the gravity in the following corridor to allow you to slide down it as a gentle slope. It might be your imagination, but her deep-orange feathers seem to be fluffing out more and more with each passing tunnel and tube, making the tove look both agitated and even more like a stuffed animal.");
		
		output("\n\n<i>“It would not be a good idea for you to wander off,”</i> she notes.");
		
		output("\n\nYou weigh her words, considering that even if you <i>could</i> navigate your way through the tunnels of the workstrata, getting through the massive, water-filled chambers would be fairly difficult.");

		flags["XOTCHI_STEAMED_CLAMS"] = 1;
	}


	output("\n\nAfter walking through what feels like a half mile of tunnels, you slide down a clear, plastic tube into a small, dark room.");
	output("\n\nIt’s circular and maybe fifteen feet across, and looks nothing like the other rooms you’ve seen so far. The walls are pitch black, with faint lights glowing from them, like distant stars. The room is primarily lit by a large, blue ring set in the center of the floor.");
	output("\n\n<i>“I’ve had quite enough waiting,”</i> says [xotchiName], sliding through the tunnel and landing on floor behind you, she huffs. <i>“As un-tove-like as it is, I’m going to generate a verbal contract.”</i>");
	output("\n\nYou turn to face the little creature on the floor behind you as she taps her fan and clears her throat. <i>“This is Sub-Madam Xotchi Tzall of the Uveto VII Station Wabeship. I am engaging in a consensual sexual encounter that will include restraint, pain, electrical play, and pleasure denial. At any point, either party may terminate the encounter by stating so. Please state your name and consent to the encounter.”</i>");
	output("\n\nYou consider her words, and then state your own name and willingness to participate.");
	output("\n\n<i>“Finally!”</i> chirps [xotchiName], the one word blending hunger, frustration, and eagerness in three short syllables.");

	processTime(10);

	clearMenu();
	addButton(0, "Next", xotchiSteamStage1);
}

public function xotchiSteamStage1(extendingScene:Boolean = false):void
{
	if (extendingScene == false)
	{
		clearOutput();
		showXotchi();
	}
	else
	{
		output("\n\n");
	}

	output("[xotchiName] chirps instructions to you, then busies herself, punching in complex commands into her fan. You [pc.move] into the blue ring on the floor, and raise your hands above your head. A loud humming saturates the air as the blue ring glows with a dim, insistent light. You glance down, curious, as the ring rises up out of the floor, rising up to");
	if (pc.hasFeet()) output(" your ankles");
	else output(" halfway up your tail");
	output(". The ring stops, rotating slowly just as a flare of light above your head heralds another ring descending from the ceiling. It slides down around your wrists, spinning counter-motion to the one below you.");

	output("\n\nBemused, you try to drop your arms, wondering if the ring will follow your wrists. With a start, you realize that your hands are locked in place above your head. You look down, attempting to shift your [pc.feet], only to find that they’re not moving either. A tingle down your back and a sudden lurch in your gut announces something else as of yet unseen.");

	output("\n\nYou turn this way and that, seeing nothing, but sure that something’s going on. It’s not until you become aware of a faint dizziness");
	if (pc.biggestTitSize() >= 1) output(" coupled with a curious sense of weightlessness to your breasts");
	if (pc.hasCock())
	{
		if (pc.biggestTitSize() >= 1) output(" and");
		output(" a puzzling lift to your dick");
		if (pc.balls > 0) output(" and balls");
		output(" that you recognize the feeling of zero-gravity.");
	}
	output(" You twist and pull, more out of curiosity than alarm, finding that despite the lack of gravity, you’re secured in place by these manacles.");

	output("\n\nSuspended in midair, you watch in bemusement as [xotchiName] rises up before you, her orange beak leading, as she twirls slowly through the air. Her four claws dance across her corset, claw tips plucking and pulling, undoing the black, lacy garment. Once it’s loosened, she slips out of it, leaving the garment hanging in the air as she snakes through the air, sinuous and graceful.");

	output("\n\nHere in zero-G, [xotchiName] has all the grace of her fellow toves underwater. She twists and pirouettes in a lazy circle around you, her apricot plumage rippling as she spirals closely past your face. Each of her four citron eyes stare at you in turn as you turn your head to watch her. She surges past you, her feathers and tail providing thrust and guidance as she alights on the ceiling (the floor?) and opens a small hatch.");

	output("\n\nThe light of the floating rings shifts slowly to green, and the black walls brighten. Specks of light drift through the air, slowly detailing into more recognizable patterns. You realize, as the holograms float into place, that the walls are one large projector. You see sand below, massive stalks of greenery above, swirling clouds of tiny particles, and bizarre, bright shapes drifting lazily through them. Far overhead, the green surface of the sea glimmers dimly. It’s clear that the room is intended to give anyone a sense of being on some alien sea floor.");

	if (flags["XOTCHI_STAGE_1"] == undefined)
	{
		output("\n\n<i>“Today has been very educational for you, hasn’t it Steele?”</i> she remarks, kicking off from the wall, something cradled in her four arms. The impatient edge is gone from her voice-it’s softer now, low and almost musical, but still with the faintest rasp.");
		output("\n\n <i>“You’ve learned a lot about toves, and not just what your Codex regurgitates for you,”</i> she says, <i>“After all, most of that is heavily edited-by Camarilla request,”</i> she adds, her goat-like pupils glowing in the low, green light. <i>“The Camarilla sued for a violation of privacy when the Codex provided too much information.”</i>");
		output("\n\nYou frown. You hadn’t realized that your Codex could be giving you anything other than complete information.");
		output("\n\n<i>“Does it say that we don’t understand sex?”</i> she asks, her voice slightly sing-song. <i>“That we’re silly, naive money grubbers? Elders of some gentle race?”</i>");
	}

	output("\n\nShe opens her four palms, revealing a spiky, metallic cone. One claw drags down its side, and the twisted device erupts into purple sparks. The light strobes through the dimly lit room, casting demonic shadows on [xotchiName]’s face. Indigo motes bury themselves in the walls, grounding out against the screens, while rivulets of violet light coruscate across [xotchiName]’s sleek body.");

	if (flags["XOTCHI_STAGE"] == undefined)
	{
		output("\n\n<i>“You don’t </i>really<i> understand sex, Steele. It’s not just the mashing of genitals, but pleasure building and building, radiating throughout your system.”</i> She drifts forward, her plumage crackling as it ripples. She stops a few inches from your face, and you breathe in the unmistakable tang of ozone cloying around her. [xotchiName] raises a single talon, an inch from your nose.");
		output("\n\nYou say nothing, your breath catching as your eyes focus nervously on the current-carrying talon an inch from you. It sinks slowly, still an inch from your [pc.skinFurScales].");
		output("\n\n<i>“Toves don’t feel sexual pleasure the way you do, no. And neophytes like my idiot secretary are ridiculously unaware of the concept, yes,”</i> her voice is almost hypnotic, standard galactic words with an undertone of birdsong. <i>“But. That. Doesn’t. Mean,”</i> she begins, twitching her upraised claw.");
	}

	output("\n\nWithout warning, she taps three claws of her hand against the center of your chest. Your back arches forward before you even register the blinding electric sting. Your nerves light up as pain snaps through your system. And then, just as suddenly, it’s over.");

	output("\n\n");
	if (pc.isNice()) output("You squeal in shock, surprised by both the pain and the apparently joy Xotchi takes in delivering it.");
	else if (pc.isMisc()) output("You tried to rattle off a <i>bon mot</i> but the words scatter away, as if she’s shocked your brain directly.")
	else output("You strain against the bindings, gritting your teeth and writhing.");

	output("\n\n<i>“Nnnnnnnnnf,”</i> [xotchiName] purrs, twin tongues licking along opposite sides of her beak, as she watches you recover from the shock.");
	if (flags["XOTCHI_STAGE"] == undefined)
	{
		output("<i>“...that doesn’t mean that we don’t know how to get off.”</i>");

		output("\n\nYou pant through the shock. [xotchiName] practically cartwheels in place, her arms and legs outspread. She taps her claws against each other, sending out more sparks. In one of her four hands she holds the twisted metal cone, running her fingers lovingly over it. <i>“It’s my Vigoroux,”</i> she explains, slowly gathering herself and dashing through the air around you. <i>“Think of it as a battery, running a charge through my body. And when I touch you, you get some of that charge.”</i>");
	}

	output("\n\nShe drags her claws against your side, sending a jolt up against your midsection. Your body again arches to that side. Before you can even mouth a response, she’s on your other side, dragging again, making you twist awkwardly in midair while sparking pain arcs through you.");

	output("\n\n<i>“The point of contact is what makes it,”</i> she says. <i>“A small, focused point of contact,”</i> she continues, flicking her claws together and laughing brightly as you wince reflexively from the sparks, <i>“can hurt.”</i>");
	
	output("\n\n<i>“But if it’s spread out over a broader surface,”</i> she purrs, sinking the flat of a small palm towards your chest, <i>“the more pleasurable it can be.”</i>");
	
	output("\n\nYou brace yourself, expecting a larger shock, surprised as you feel the lightest tickle against your [pc.skinFurScales].");
	if (pc.hasFur()) output(" You glance down, watching the hairs of your arm rise up, flickering with purple-pink light as they reach for [xotchiName]’s palm.");
	else output(" You glance down, watching a purple-pink forest of light flicker between your [pc.skin] and [xotchiName]’s palm.");
	output(" Slowly, your muscles unclench, and you enjoy the almost feathery feel of light pinpricks of electricity playing across your [pc.skin].");

	output("\n\n[xotchiName]’s four, squid-like eyes sweep over you, her center-most ones focusing on your face, while the other two follow her hands. <i>“Is it pleasurable for you, [xotchiPCName]?”</i> She twists through the air, her plumage undulating once more as she curves around you. Tiny rivulets of electricity run up and down the length of her body, giving her her own irregular glow in the dimness.");

	output("\n\nYou arch as you feel her palm brush across the small of your back, sending a bright cluster of sensation through you. You gasp at the sudden wash of electric pinpricks, and, unbidden, your [pc.legs] buck");
	if (pc.legCount == 1) output("s");
	output(" forward.");

	output("\n\n<i>“Bioelectrical nervous systems, Steel.”</i> [xotchiName]’s honeyed voice caresses your ear. <i>“We can make as many adjustments to our physiology as we like, but we still run on electricity, and our tissue will always respond to the more </I>powerful<I> signal.”</i>");

	output("\n\nYou glance down as [xotchiName]’s blood-orange tail coils up in front of you, a storm of tiny, purple lightning jags filling the spaces between her plumes. With agonizing slowness, she lays it against you. A thousand pinpricks of pain hit you, too numerous and too fast for your brain to process. In their wake, they leave the quaking relief of pains passing. Her tail drifts slowly around your frame, a wave of pain and pleasure overlapping over and over again as it drifts across you. You moan, writhing and whimpering, twisting in vain away from the current.");

	output("\n\nIt’s hard to focus with your brain drowning in sensation, but you hazily register her tail moving towards your chest, and you draw in a ragged breath, not sure yourself if you’re about to moan in pleasure or protest. Before you can decide, the tove’s electrified tail sweeps across your nipples, and your brain explodes.");

	output("\n\nThe pain is greater as the electric jolts ripple across your sensitive flesh, so, too, is the pleasure of relief in each one’s passing. Dozens of sparks of agony run through you and you grit your teeth, looking up at the four-eyed visage of");
	if (!xotchiIsMistress()) output(" Xotchi Tzall");
	else output(" Mistress");
	output(" smiling down at you. When she pulls her tail away your whole body shakes, pulling hard against the restraints, feeling like you’re tumbling head over heels in the sweet ache of pain passed and a cool wave of relief.");

	output("\n\n<i>“Power and pleasure, [xotchiPCName],”</i> she trills, moving to pet you, and clucking in amusement as you reflexively flinch away. <i>“In this moment, I have all of the power over your helpless body, and that gives </i>me<i> a great deal of pleasure.”</i> She drifts in a lazy loop around you.");

	output("\n\n<i>“Others, though,”</i> she chirps, her feathery coat rippling, propelling her through the air, <i>“others enjoy surrendering their power, their control, to someone else.”</i> The tip of her tail flicks against your back, and you yelp, flinching from the electric SNAP.");

	output("\n\nWith a complex twist, she stops herself dead in the air, hovering just a few inches in front of you. <i>“Do you enjoy being under my control, [xotchiPCName]? Being my toy to torment?”</i>");

	processTime(20+rand(5));
	flags["XOTCH_STAGE"] = 1;

	clearMenu();
	addButton(0, "Enough!", xotchiSteamStage1Enough);
	addButton(1, "More!", xotchiSteamStage2); // To go stage 2
}

public function xotchiSteamStage2():void
{
	clearOutput();
	showXotchi();

	output("You asked for more, and [xotchiName], it seems, is eager to provide.");

	output("\n\nShe twists in midair, floating upside down. You blink-or are <i>you</i> the upside-down one? Between the electro-stim and the holographic psychedelic underseascape you’re feeling more than a bit disoriented. The slow spin of your tormentor isn’t helping things either. You swear you’re starting to see large, unnerving shapes drifting in the false ‘distance’ of the simulated ocean floor.");

	output("\n\n<i>“You’re enjoying it. Good...”</i> she coos, running her claws down the battery, drawing out purple sparks.");
	
	output("\n\n<i>“A great many sapient species are wired to only process one sensation at a time,”</i> [xotchiName] says. Her feathers ripple and she floats into the open space before you. Her left lower hand cradles the battery, the one above stroking it gently, violet-white tracks outlining her claws.");
	
	output("\n\n<i>“I wonder how much you can handle?”</i> she muses, placing the tip of one claw under her beak, in a look of mock curiosity. <i>“Let’s find out together!”</i> she says, all four of her eyes narrowed in a mirthful leer.");

	if (pc.isNice()) output("\n\nYou bite your lip and shiver before admitting your own curiosity about your limits.");
	else if (pc.isMisc()) output("\n\n<i>“Oh yes, let’s,”</i> you quip. <i>“I love learning new things.”</i>");
	else output("\n\n<i>“I can handle anything you can dish out,”</i> you puff. <i>“I’ve taken a beating and delivered beatdowns across the galaxy.”</i>");

	output("\n\n<i>“Though I think that’s enough talking,”</i> she muses. <i>“Let’s take more control away from you, [xotchiPCName].”</i> She clears her throat, then calls out into the room. <i>“Sub-Madam Xotchi Tzall addressing the Limited Environment Neurostim Generator.”</i>");

	output("\n\nA subtle chime rings out in response, a low vibration you almost feel rather than hear. <i>“Stage 2 restrictions,”</i> she chirps, her high voice contrasting sharply with the answering tone-a ringing like underwater church bells.");
	
	output("\n\nYou already suspect what’s about to happen, but the speed at which the hardlight gag snaps into place is a surprise. You blink, shaking your head in shock as the blue, dimly-glowing piece restricts your jaw. You try to mouth a protest but can only get out a muffled <i>“Mmnnff!”</i>");
	
	output("\n\n<i>“Much better,”</i> coos [xotchiName], drifting in closer. You feel twin snaps of electric pain as her claws pinch your chin. You yelp, but she holds tight, all four eyes locked on yours as she leers. Pain radiates out from her claws, making your eyes water.");

	output("\n\n<i>“Isn’t. That. Better. [xotchiPCName]?”</i> She asks, clipping each word.");
	
	output("\n\nYou writhe, the crackle of sustained contact snapping continuously over your chin and cheeks. Still bound, and now gagged, you can’t seem to wrest free from her surprisingly-strong grip. You feel a whimper bubble up from your throat, spilling out around the gag.");
	
	output("\n\nYou nod, just to end the torment, and feel [xotchiName]’s claws release instantly. You let out a staggered groan, shuddering in relief.");

	output("\n\n<i>“Good [pc.boyGirl],”</i> she says simply, seemingly unaware of your discomfort. <i>“See how much easier things are when you listen to [xotchiName]?”</i> Her three free hands fly across the surface of her cradled battery, tapping panels and turning dials. The metal shell lets out three giant sparks, each the size of a walnut, followed by three more, hanging in the air in front of the tove.");
	
	output("\n\nYou flinch reflexively, the action not lost on [xotchiName]. She smirks, turning a dial on the device slowly. The battery extends filaments, connecting to the sparks by cords of light, making them look like a crackling, purple bouquet. Nine hardlight tails trail from the battery: a medieval lash remade with Camarilla tech.");

	output("\n\n<i>“And you </i>want<i> to listen to [xotchiName], don’t you?”</i> She asks sweetly, holding up the battery as a grip for a <i>lash</i> of purple electricity. Your eyes widen at the sight, your body tensing and your breath quickening. If the sparks coming off of her claws were enough to make you writhe in pain you can’t imagine what sort of medieval torments she could inflict with <i>that</i> thing.");

	output("\n\n<i>“Afraid, [xotchiPCName]?”</i> She mocks, laying the tails of the lash against her open palm and drawing them across. They crackle against each other, streaming purple sparks into the the null gravity, each one illuminating a different, disturbing palette of shadows against [xotchiName]. Your breath catches in your chest as she drifts closer, your whole body tensed in tight memory of the pain and");
	if (flags["XOTCHI_STAGE"] == 1) output("... oddly enough,");
	output(" the pleasure that followed it.");

	output("\n\nStill, you writhe against the bindings, helpless as she brings the lash closer. She’s grinning now, her ears perked up and her orange-red feathers puffing up in anticipation. You yelp through the gag, your eyes fixed on the flogger as it inches toward your [pc.belly].");

	output("\n\nWith the tiniest turn of her wrist, she flicks the electric lash against you. You let out a reflexive scream through the gag. Your whole body jerks, tensed against a rush of pain that doesn’t come. Instead, a light tickling brushes against your belly as you twitch involuntarily.");

	output("\n\n[xotchiName] laughs so hard that she actually turns end-over-end in the air. <i>“Oh, we’re going to have </i>fun<i>, [xotchiPCName].”</i>");

	output("\n\nShe flips the lash back and forth, brushing it across your [pc.breasts] like an antique feather duster. The faint humming from the electric tassels is barely audible over the synthesized sounds of the sea. The light tickling plays across your [pc.nipples], and you shiver as they perk up harder than you’ve ever seen.");

	output("\n\n[xotchiName] pulls her arm back, and with a twist of her wrist and a wicked gleam in her eye, snaps the lash down.");

	output("\n\nCRACK!");

	output("\n\nThere’s power in it this time, and your back arches before you even register the pain properly. It lashes across you, lightning jags of pain so intense that your vision clouds. A muffled scream cuts through the air and, like the pain, it takes a moment for you to process it, realizing that it’s coming from you.");

	output("\n\nThe lash only strikes once, but you’re still bucking. The sensation is too much for just the single moment of contact, and echoes through your body as your jaw clenches around the gag.");

	output("\n\n[xotchiName] watches you intently, the purple light of her tool reflecting off all four of her eyes, fixating on you with a hungry expression. Some small part of your brain not overwhelmed with the pulsing sting of the lash notes that her twin tongues are licking her beak-she’s absolutely getting off on your misery.");

	output("\n\nIt feels like forever, but might be only a few moments, and then the pain passes, leaving you sagging in your restraints. Your body feels weak, and you’re breathing so hard that flecks of drool are starting to dribble from around your gag. Your eyes are unfocused, the holographic world around you melting into indistinct colors.");

	output("\n\nA sharp sting prickles across your scalp as [xotchiName]");
	if (pc.hasHair() && pc.hairLength >= 6) output(" grabs you by your hair");
	else output(" grabs the back of your head");
	output(", tilting your face up towards hers. As the pain of the lash leaves you, these secondary prickles feel almost good-little jabs of pain that encourage even greater waves of relief.");

	output("\n\n<i>“We’ve barely begun, [xotchiPCName],”</i> she whispers, her beak so close to your [pc.face] that tiny static crackles jump from her to you, making your skin crawl.");

	output("\n\n<i>“You’re mine to torment-my passenger through this strait of fear.”</i>");

	output("\n\nShe releases you, swirling back through the air, her feather rippling and her thick tail brushing against your stomach. A thousand purple sparks pour against your [pc.skin] and, unbidden, your belly pushes forward, bathing you in countless stings that burn fast, leaving cool pleasure in their wake.");

	output("\n\nShe hovers in the air before you, wreathed in a faint purple aura, metal shell cradled in one arm, the other three arms toying with the crackling tails of the lash. The occasional angry line of electricity jags across her frame, making her look like some bizarre idol of a best-forgotten god.");

	output("\n\nShe cackles, electrical arcs crawling up the sides of her face and sparking off her ears. She raises her arm and slashes down with it, the tails of the lash twisting unnaturally in the air.");

	output("\n\nShe strikes, and your world explodes into pain.");

	output("\n\nCRACK!");

	output("\n\nYou piece together the order of the sensations, after the fact. The lashes strike your midsection, feeling like a punch to the gut, driving deep and knocking the wind out of you. Then the pain radiates out in jagged webs, covering the gamut from prickling tickle to mind-jolting sting at the same time. In one moment, it’s pain centered on your stomach, in the next overlapping instant it’s resonating through your entire body. It overloads your brain, blacks out your senses, and for an unknowable amount of time your world is pure, distilled agony.");

	output("\n\nIt passes, like a tide pulling out, and what replaces it is a sudden feeling of emptiness. The intensity of your throes is so great that when it leaves, you feel hollow-an barren shore of sensation. Then the relief rushes in, almost as intense as torment, a euphoria that leaves you trembling and moaning.");

	output("\n\nBefore you can process these thoughts-before you can recover, she raises her arm and the lash cracks against you again.");

	output("\n\nCRACK!");

	output("\n\nAgony shreds through you, pain so intense it feels like you body is being torn apart. For a white-hot moment, you’re not sure you can take anymore.");
	
	output("\n\nAnd, again, relief come rushing in after. Even as you convulse, echoes of torment reverberating through you, cool pleasure trickles through. You didn’t know you could feel pain and pleasure at the same time, and the sensation is intoxicating.");
	
	output("\n\n[xotchiName] raises her arm again, and you whimper in protest. You’re not sure you can stand it again, and yet... more pain means more pleasure, doesn’t it? With the agony comes this new, unsettling euphoria that leaves you light-headed and trembling.");

	output("\n\nShe smiles, as if reading your mind, and you feel oddly embarrassed. The sensation is short-lived, drowned in the flash of dread and anticipation as the lash descends.");

	output("\n\nCRACK!");

	output("\n\nMore pain, tangled up in bliss, and you scream through the gag, the hardlight pushing against your jaw. You’re writhing against your bindings, half of you trying to escape the tove’s torture, half of you itching for release.");
	if (pc.hasVagina())
	{
		output(" You feel a wetness");
		if (pc.hasLegs()) output(" between your legs");
		else output(" against your front");
		output(" as you grind your thighs together.");
	}
	else if (pc.hasCock())
	{
		output(" Your shaft");
		if (pc.cocks.length > 1) output("s are");
		else output(" is");
		output(" rock hard, pre already spattering from your tip with each wild buck of your hips.");
	}
	else output(" Your sphincter clenches and unclenches in time with the rest of your body’s convulsions.");

	output("\n\nCRACK! CRACK! CRACK!");

	output("\n\nYou squeal, your brain drowning in conflicting sensations. You can’t take anymore-you <i>need</i> more. Your whole body feels lit up like a massive circuit, every nerve vibrating back and forth with agony and delight.");

	output("\n\nYou lose track of the strikes, falling away into the terrible rhythm that [xotchiName] builds, a swinging pendulum of torment that threatens to shatter you with each swing. The world fades, leaving behind only the delicious suffering.");

	output("\n\nIt’s only when the strikes stop that your brain starts to pull itself back together. You’re dimly aware of [xotchiName] laughing, pausing as you catch your breath, watching you slowly manage to focus your eyes on her. She holding up a single finger in front of your face, and gradually, laboriously, you focus on the claw tip.");

	output("\n\n<i>“Oh good, you’re still in there,”</i> she smirks, two of her eyes locked on yours, her hands toying with the lash.");

	output("\n\nYou feel the flogger brushing against you, the faint electrical tingle barely registering against the previous tide of pain. It’s swishing back and forth, being swept almost gently against you. It’s a soothing rhythm as she brushes it back and forth, up and down.");

	output("\n\n<i>“The harder the sun beats down on you, the sweeter the starlight feels, [xotchiPCName],”</i> she says sweetly. Too sweetly, it dawns on you, just as you realize that she’s sweeping the lash across your nipples.");

	output("\n\nYou arch your back as hundreds of prickles dance across your [pc.chest], grounding themselves in your [pc.nipples]. You throw your head back, drooling uncontrollably against the gag, your eyes rolling back. Back and forth, back and forth, she teases your nipples, making you whimper and writhe.");

	output("\n\n<i>“Doesn’t it feel good, [xotchiPCName]?”</i> she purrs.");
	
	output("\n\nYou garble your assent, your head swimming in sweet delirium.");
	
	output("\n\n<i>“Let’s find out what the other end of that feels like”</i> she says, pulling the lash away from your chest.");
	
	output("\n\nIt takes a moment to understand what she means, and before you can mouth any sort of protest you hear the hum of the lash speeding through the air.");

	output("\n\nCRACK!");

	output("\n\nYou scream so violently that the hardlight gag vibrates against your jaw. The world explodes into pain, bursting out from your nipples and tearing through your body. You thrash against the shackles, trying to flee your own body and the agony lancing through it.");

	output("\n\nThe world flickers in front of your eyes. You’re about to pass out. The long, drawn-out scream from behind your gag winds down into a quavering sob as your exhausted body twitches weakly.");
	
	output("\n\nYou shudder, taking in a deep breath through your nose, trying to collect the fragments of your thoughts. [xotchiName] watches you thoughtfully as you take a few more breaths, struggling to come back to your senses. You can hear someone whimpering, and after a minute of strained concentration, you realize it’s you.");
	
	output("\n\nYour whole body is sore, burned out by the barrage of lashes and the tidal wave of pain. And now, the rush of relief and pleasure in the wake of all of it all feels like bliss on top of bliss. You sob again, the sweeping wave of delight, itself, almost too much to bear.");

	output("\n\nA faint beeping emits from [xotchiName]’s device, and the clicking of her talons against it heralds the sudden disappearance of your gag. Suddenly free, you slowly open and close your jaw, feeling the dull ache as a mere drop in the ocean of pain you’ve just experienced.");
	
	output("\n\n<i>“Having fun, [xotchiPCName]?”</i> [xotchiName] asks.");
	
	output("\n\n");
	if (pc.isNice()) output("You can’t help it-a sob escapes from your throat and you can feel tears pooling in your eyes. You’re not entirely broken, but your body feels like it’s been pushed further than it’s ever gone, and the powerful, conflicting sensations have been overwhelming.");
	else if (pc.isMisc())
	{
		output("You grin, ignoring the soreness of your mouth and wink, trying to shrug off the echoes of agony making your muscles twitch. <i>“Maybe. Are you sure you’ve got that thing turned on?”</i> you ask cheekily.");

		output("\n\n[xotchiName] raises her eyebrows, then snaps the lash up in the air again. You flinch involuntarily, and she smirks.");
	}
	else
	{
		output("\n\nYou pant heavily, managing to puff out your chest, despite the chorus of painful protests from your muscles at the act. <i>“Is that all you’ve got?”</i> You grunt, huffing a bit.");
	}

	output("\n\nShe reaches forward, brushing her claw down your");
	if (pc.hasMuzzle()) output(" muzzle");
	else output(" cheek");
	output(". Your yelps are justified this time, as electricity snaps continuously between her talons and your [pc.skinFurScales]. You twist and pull at your restraints, trying in vain to escape the pain. <i>“Poor [xotchiPCName],”</i> she says, her voice filled with far too much sympathy to be believable. <i>“Wound so tight-the last bastion of [pc.hisHer] father’s legacy. That’s so, so much pressure on you.”</i>");

	output("\n\nShe pulls her claw back, leaving you groaning against your gag. She coos gently into your ear. <i>“You liked it though, didn’t you? You want more, don’t you?”</i>");

	flags["XOTCHI_STAGE"] = 2;
	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Enough!", xotchiSteamStage2Enough);
	addButton(1, "More!", xotchiSteamStage3);
}

public function xotchiSteamStage3():void
{
	clearOutput();
	showXotchi();

	output("You want more. You’re beginning to suspect that you might <i>need</i> more, and you say so.");

	output("\n\n[xotchiName] makes a curious sound-a musical trill that ends in a low chuckle. She twists the battery, drifting through the air towards you, cradling her palm against your cheek. You flinch reflexively, but her touch brings only a faint tingle against your [pc.skin]. She leans in close, her feathers brushing against your ear.");

	output("\n\n<i>“Oh, [xotchiPCName],”</i> she coos, <i>“I have such sights to show you.”</i>");

	output("\n\nA shiver of fear races up your spine at her words, and as she taps a staccato of commands on her battery you wonder if you might be in for more than you can handle.");

	output("\n\nSomething fizzes overhead and you crane your neck, squinting through your bound arms at the sound. With a small flash of light, your hardlight bindings disappear, leaving your arms to drift free. A matching flash from below you indicates that the binding around your");
	if (pc.hasLegs() && !pc.hasTail()) output(" legs");
	else if (pc.hasLegs() && pc.hasTail()) output(" legs and tail");
	else output(" lower half");
	output(" have likewise come undone. Like [xotchiName], you’re now adrift in the zero-gravity room. As good as it feels to stretch out your limbs, you’re a little disappointed at no longer being restrained.");

	output("\n\nWhile [xotchiName] is peering intently at the battery, two of her eyes are on your face, and clearly reading your expression. <i>“Don’t worry, [xotchiPCName], you’ll be nice and restrained in a moment. I just need to make some... adjustments. Be a good [pc.boyGirl] and use this time to shake out your wrists. The hardlight bands shouldn’t affect your circulation, but better safe than sorry.”</i>");

	output("\n\nYou’re a bit confused by her split attention, but take her advice, taking the time to glance at the room around you. You massage your wrists, taking in the seascape as you drift in the small room. Despite the real dimensions of the room the projectors and screens convey a convincing illusion that you’re floating on the seafloor of some alien planet. In the shimmering, green light distant forests of kelp sway, and small, flickering puffballs dart this way and that, just out of reach. Overhead massive shadows pass, and underfoot purple sand swirls in a synthesized current.");

	output("\n\nAs you take it all in, you see the lights fading, green light giving way to purple, the puffball fish replaced by strange web-like organisms that pulse and dart through the dimness. [xotchiName] curses, twisting the battery, cycling through a small, rotating display.");

	output("\n\n<i>“Damn interns,”</i> she mutters, before squawking in triumph. <i>“HAH! Here it is!”</i>");
	
	output("\n\nHardlight flickers below you, vivid blue lines sketching and criss-crossing into something that looks massive, too large for so small a room. Colors cycle into place across its surface, and you get the impression of massive sunflower, the size of a bed, with hundreds of wiggling tentacles in place of petals.");
	
	output("\n\nThose tentacles snap up towards you as you pedal your limbs uselessly in the null gravity.");
	
	output("\n\n<i>“[xotchiPCName], meet the nothoa,”</i> [xotchiName] chirps happily. <i>“It’s endemic to Mome and eager to meet you.”</i>");

	output("\n\nShe’s not wrong. The nothoa’s yellow, rubbery tentacles wrap tight around your wrists");
	if (pc.hasFeet()) output(" and ankles");
	else output(" and lower half");
	output(", pulsing warm against you. They pull you down against its central surface, a bristling carpet of black polyps that writhe and ripple against your body. The sensation isn’t unpleasant, but it <i>is</i> intensely weird. You try pushing yourself up, managing to get to your hands and knees atop the bizarre creature before the tentacles pull tight, trapping you in place.");

	output("\n\n<i>“Don’t worry, [xotchiPCName],”</i> chirps [xotchiName]. You crane your neck to see her drifting casually overhead, her feathers puffing and unpuffing as she slows herself to a stop, looking upside-down at you. <i>“The nothoa is just here to help hold you in place. A bit of added atmosphere.”</i>");

	output("\n\nYou glance around through the purple light, the yellow tentacles, the rippled black mass beneath you, unsure what atmosphere that might be.");
	
	output("\n\n[xotchiName] nuzzles the battery, sending rivulets of crawling electricity up her beak. You feel a momentary surge of irrational jealousy. Are you actually jealous of a battery?");
	
	output("\n\n<i>“Now, where were we? I believe some desperate little supplicant was begging for more?”</i> The battery clicks in her hand, humming loudly as sparks crawl across her feathers. In the dim light they highlight her terrifying beauty, illuminating her blood-orange feathers, and reflecting off all four eyes.");

	if (pc.isNice())
	{
		output("\n\nYou nod submissively, a tremble running down your body. You want more of her torment-the kind of ecstasy that only comes from pain.");
	
		output("\n\n<i>“Good [pc.boyGirl],”</i> whispers [xotchiName]. She hooks a claw under your chin, a bright spark snapping against you, drawing out a hungry whimper from your lips.");
	}
	else if (pc.isMisc())
	{
		output("\n\nYou grin, pointing out that you haven’t really begged for it, biting your lip and hinting at a response.");

		output("\n\n[xotchiName] smiles, her eyes flashing. She’s reading you like a book and eager to play. <i>“You haven’t begged yet? We’ll have to fix that.”</i>");
	}
	else
	{
		output("\n\nYou jut your chin out, stating proudly that you’ve never begged for anything.");

		output("\n\n<i>“Is that so?”</i> says [xotchiName], her eyes lighting up. <i>“Let’s see if we can change that.”</i>");
	}

	output("\n\nWith a flick of her tail she swoops up and over you. You hear her chirping happily under her breath, but as you turn to follow her, you’re stopped by the tentacles, held in place against the alien beast.");
	
	output("\n\nOn all fours against the giant anemone, you can’t see, but can absolutely feel the gentle brush of the lash against your [pc.ass]. Electric tingles crackle across your flesh, and you groan involuntarily. ");
	if (pc.hasCock()) output(" You’re already so hard, and your stiffness is buried amidst the forest of tentacles beneath you.");
	else if (pc.hasVagina()) output(" How long have you been at this? You’re so wet that you’re dripping down on the gently swaying tentacles, feeling stray trickles of wetness moving down your thighs.");
	
	output("\n\nThe lash traces back and forth across your ass, up against the small of your back, and occasional light flicks of it tap lightly against your sides, sending exploratory jolts through you. It’s almost soothing, making the sudden lash of pain across all the more jarring.");

	output("\n\n<i>KRAK!</i>");

	output("\n\nHarder than anything you’ve felt yet, pain lances up through your body, drawing a strangled scream from your [pc.lips]. The impact of the lash, the electricity-it’s like she just whipped you down to the bone. The agony explodes into a moment that lasts forever, and when it finally recedes your realize you’re whimpering, your arms and legs shaking, echoes of the pain quaking through your frame.");

	output("\n\nYou’re barely aware of the tickle of [xotchiName]’s feathers up your spine, as the tove drifts upside-down overhead, twirling in the null gravity to perch amidst the tentacles in front of you. You barely register her presence, your head hanging low, panting as you recover from the strike. She looks at you quizzically, reaching up with a claw, the tingle from contact with her muted in the wake of the recent blow. She tilts your head up, her four eyes scanning across your face, taking in your breath, the trickle of drool that’s escaped your lips, the focus of your eyes.");

	output("\n\n<i>“How was that, [xotchiPCName]? Do you want more?”</i>");

	flags["XOTCHI_STAGE"] = 3;
	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Enough!", xotchiSteamStage3Enough);
	addButton(1, "More!", xotchiSteamStage4)
}

public function xotchiSteamStage4():void
{
	clearOutput();
	showXotchi();

	output("<i>“Good,”</i> she says, a trill of birdsong at the back of her throat. <i>“It’s important for everyone to be aware of their limits in a session like this.”</i> She twists the dial at the bottom of her lash, and the electric humming grows louder. <i>“Let’s find yours, [xotchiPCName].”</i>");
	
	output("\n\nShe kicks upwards and disappears from view. You feel several sharp tracings down your back, the drag of [xotchiName]’s electrified talons as she slips behind you.");
	
	output("\n\n<i>“It’s an exchange of power, yes? You give me your submission, and I give you the dominance you crave,”</i> comes her voice from behind you.");
	
	output("\n\n<i>KRACK</i>");
	
	output("\n\nPain! Pain explodes through you as the lash bites into the flesh of your [pc.ass], electricity carving jagged paths through your nerves, rocking you forward on the anemone, only the hardlight tentacles keeping you from convulsing forward. Someone just screamed in pain. You don’t realize it’s you until it stops when you gasp in a ragged breath.");

	output("\n\n<i>“And you clearly crave it, don’t you?”</i> taunts [xotchiName]’s voice from behind you. You’re not even sure, yourself. The agony is excruciating, but the immediate rush of pleasure that pulses through you is equal at least to the pain. You’re not sure how much more you can handle, but you want as much as you can handle before you collapse into a quivering pile.");

	output("\n\n<i>“Yes,”</i> you manage to whisper, between breaths.");
	
	output("\n\n<i>“Good little painslut,”</i> purrs [xotchiName]. The name has a moment to register with you before you hear the swish of the lash and brace yourself for pain.");
	
	output("\n\nAnd it comes, again, and again, each strike across your [pc.ass] shattering your world into mind-breaking throes. Your pants turn to sobs, and each strike comes with approval from [xotchiName].");

	output("\n\n<i>KRACK!</i>");
	
	output("\n\n<i>“Enjoying yourself, little painslut? Don’t worry, there’s more to come.”</i>");
	
	output("\n\n<i>KRACK!</i>");
	
	output("\n\n<i>“Delicate little thing-are those tears for me?”</i>");
	
	output("\n\n<i>KRACK!</i>");
	
	output("\n\n<i>“Not broken yet? I’ll have to try a bit harder...”</i>");

	output("\n\nWords trickle slowly into your brain. It’s hard to think through the fog of aches, spasms, and the shuddering rush of pleasure that accompanies the torment. It feels amazing, ecstasy and torture melded together-you need more, more, more. When [xotchiName]’s feathers tickle against your back, it’s one more sensation lost in the storm.");

	output("\n\n<i>“Beg for it, [xotchiPCName],”</i> she murmurs against your ear, electricity crawling from her beak to your [pc.ear]. <i>“Tell me how much you need it. Beg me to hurt you, painslut.”</i>");
	
	output("\n\nTrussed up by holographic tentacles, brain awash in a storm of hedonistic torment, with [xotchiName]’s claws carving electric trails down your back, it takes times to sort out words enough to respond.");
	
	output("\n\n<i>“I... I need it,”</i> you finally moan. <i>“Please, I need more,”</i> you whimper, already aware that your shuddering limbs can barely hold you up. It’s true, though-with the rush of pain leaving, and the aching pleasure bubbling up in you, you’re already craving more.");

	output("\n\n<i>“Please, </i>Mistress,<i>,”</i> she corrects.");

	output("\n\n<i>“Please, Mistress,”</i> you repeat. Your words slur as cascading shudders roll through your body, equal parts pain and humiliation. <i>“Please hurt me more.”</i>");

	output("\n\n<i>“Perfect,”</i> she says, the tip of her beak tracing a sharp electric trail against the back of your neck.");
	
	output("\n\n<i>“Sub-Madam Xotchi Tzall addressing the Limited Environment Neurostim Generator,”</i> she says in a loud, clear voice. There’s an answering chime from the chamber around you. <i>“Stage 3 Restrictions,”</i> she says.");
	
	output("\n\nHardlight tentacles surround you, engulfing you in a psychedelic forest of shifting colors. You couldn’t fight them off if you wanted to-your whole body feels like jelly at this point. The tentacles slide over your body, turning you over, adjusting your position and tightening. When they finally recede it takes several long moments to make sense of your new position. You’re on your back with your legs folded underneath you, your arms raised up over your head, but bent so that your hands clasp behind your head. Thinner tentacles criss-cross over your body, forming complex patterns that hold you motionless against the squirming anemone beneath you. A thicker tentacle stretches across your mouth, muffling your confused whimpers.");
	if (pc.hasCock())
	{
		output(" In front of you, on display for the sub-madam,")
		if (pc.cocks.length > 1) output(" are");
		else output(" is");
		output(" your engorged cock");
		if (pc.cocks.length > 1) output("s");
		output(", throbbing and already leaking precum, the base of your length secured firmly with a tentacle loop");
	}
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	else if (!pc.hasCock() && pc.hasVagina()) output(" In front of you, on display for the sub-madam, is");
	if (pc.hasVagina())
	{
		output(" your sopping wet pussy, dripping sticky trails of ladyjuice onto the tentacles criss-crossing at its opening.");
	}

	output("\n\n<i>“Stage 3 is special, [xotchiPCName],”</i> says [xotchiName] drifting above you. <i>“Not only are you bound up like the prettiest little package for Mistress,”</i> she coos, <i>“but the compositional code for the tentacles has been altered in the sweetest of ways.”</i>");

	output("\n\nShe taps a single, electrified claw against a knot of tentacles at your [pc.thigh]. The electric tingle races up the web of tentacles binding you, snapping a light shock of pain across your whole body.");

	output("\n\nYou yelp against your gag, bucking lightly, only to feel the tentacles tighten around you. [xotchiName] laughs sweetly, twisting in the air in front of you, purple sparks radiating out from her sinuous body.");

	output("\n\n<i>“I’m going to give you exactly what you begged for, [xotchiPCName]. I’m going to hurt you in the sweetest of ways,”</i> she says, her feathers ruffling out in anticipation.");

	output("\n\nYou’re entirely exposed to [xotchiName] and her lash, your limbs trapped, and the rest of your body on display. You whimper against the gag as she runs the electric tails of the tool down your [pc.breasts], tickling bursts of electricity radiating out along your bindings in complex, sensual twists.");

	//[Prioritize cock over vag. If cock is present, ignore vag condition here:
	output("\n\nWhen the first strike comes, it’s not against your [pc.breasts] or even your [pc.ass], but against your");
	if (pc.hasCock()) output(" straining dick");
	else if (pc.hasVagina()) output(" sopping cunt");
	else output(" delicate undercurve");
	output(".");

	output("\n\nYou scream. Exquisite pain slices through your entire being, crackling out from the strike of the lash, spiralling out through your whole frame. You buck against your bindings, feeling them constrict, wrapping electrified coils around you even tighter. The pleasure comes right on its heels, flooding you with a heady delirium that fills the gaps in your fractured sense of self.");

	output("\n\n<i>“Oh, [xotchiPCName], was it that good?”</i> trills [xotchiName]’s voice.");

	output("\n\nHer words are the focal point for your to collect yourself. Awareness centers around the question, your mind coalescing again, gathering the slivers of your psyche back into something resembling consciousness. Your sense of body comes next. You’re aware of trembling all over, your throat raw from your muffled screams. Wet trails of tears running down from the corners of your eyes. A single rivulet of drool oozes down from your [pc.lips], over your chin, and down your neck. Your breathing is labored-your [pc.breasts] heaving.");

	output("\n\n<i>“Breathe, painslut,”</i> coos [xotchiName], drifting overhead. <i>“Can’t have you passing out halfway through the fun.”</i> Her sinuous, feathered tail caresses around your head and neck before she slithers, cat-like, down your front, her electrified claws walking a pinprick trail down your [pc.breasts] and [pc.belly]. Strangely, the individual points help you to steady your breathing, and your sobs dwindle, replaced with soft, regular whimpers.");

	output("\n\n<i>“Sounds like my little slut is ready for more,”</i> says [xotchiName], leaping gracefully off your body. Her tail leaves a parting snap against your [pc.hips], bringing you sharply back to attention.");

	output("\n\nShe raises the lash in one hand, and your arch your back in anticipation, presenting more willing, bound flesh for your Mistress.");
	
	output("\n\n<i>“Good little painslut,”</i> Mistress nods, cracking the lash down in approval.");
	
	output("\n\n<i>“KRACK!”</i>");
	
	output("\n\n<i>“You’re so hungry for pain, and that makes Mistress so happy.”</i>");
	
	output("\n\n<i>“KRACK!”</i>");
	
	output("\n\n<i>“You’re making such a mess, painslut. Are you having that much fun?”</i>");
	
	output("\n\n<i>“KRACK!”</i>");
	
	output("\n\n<i>“You’re so close to breaking. I can taste it.”</i>");
	
	output("\n\n<i>“KRACK!”</i>");

	output("\n\nEach time you howl in pain, she coos approval, and soon, her sweet encouragement is tied inextricably into the braided sensations of pain and euphoria. After several more strikes, you’re not sure if you’re craving the burst of pain, the rush of pleasure, your Mistress’ approval. It honestly doesn’t matter-it’s all so wonderful, and it’s all there is in the world.");
	
	output("\n\nWhen she pauses again, you’re a quivering mess, your muscles spasming and twitching. Every breath summons memories of the pain you’ve suffered, and try as you might, you’re having trouble taking more than few pained gulps of air at a time. Your eyes are unfocused-everything in front of you is a haze of swirling shapes.");
	if (pc.hasCock() || pc.hasVagina()) output(" You think you must have cum at some point, because your [pc.thighs] are soaked.");
	
	output("\n\n<i>“How is my little painslut?”</i> She leans in close, tilting your chin up, her blood orange face filling up your field of vision. You can’t form words, or even thoughts. The most you can do is move your lips soundlessly for a few moments, until a faint whimper spills out from them.");
	
	output("\n\n<i>“Broken beyond all repair?”</i> She coos. <i>“How wonderful...”</i>");

	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Next", xotchiSteamStage4II);
}

public function xotchiSteamStage4II():void
{
	clearOutput();
	showXotchi();

	output("You hear her bark a command to the room, and in a shower of sparkles, your restraints dissolve around you. You float free, barely registering your own weightless drift, but cry out when your limbs unfold, a sharp ache snapping through them.");
	
	output("\n\nMistress is immediately at your side, the feathered creature winding effortlessly around your body. Her electrical charge is gone, and her six arms grab different part of your body-upper and lower arms, your sides, your thighs-squeezing and gently massaging them as she criss-crosses your body.");
	
	output("\n\n<i>“My restraints don’t generally interfere with circulation, but it looks like you’ve cramped a little,”</i> she says, slithering up your front. <i>“I’m going to need to take care of you for a bit,”</i> she says softly, her four amber eyes peering into yours.");
	
	output("\n\n<i>“And no, you don’t get a say in it.”</i>");

	processTime(5+rand(3));

	clearMenu();
	addButton(0, "Next", xotchiSteamStage4III);
}

public function xotchiSteamStage4III():void
{
	clearOutput();
	showXotchi();

	output("The touch of her feathers against your body is unbearably soft after the punishment you’ve endured. The jarring difference is sensation overwhelms you, and you sob briefly without understanding why.");
	
	output("\n\nMistress smiles, brushing the smooth curve of her beak against your nose, her topmost hands clasping your cheeks. <i>“Oh, I’ve broken you so beautifully, painslut. Don’t worry-Mistress will make it better.”</i>");
	
	output("\n\nThe holographic scenery around you shifts, asserting a strange plain of multicolored sea sponges while glowing star-shapes drift through the indigo sea overhead. Some trick of the gravity mimics the tidal pull of the sea, rocking you gently back and forth.");
	
	output("\n\nYou’re in no state to do more than blink softly and whimper though, breathing heavily as the seascape unfolds before you. You feel Mistress’ hands against you and see her tail ripple as she guides you down to the hardlight sponges, turning you so that your [pc.ass] rests weightlessly on a curved, bowl-like one. She positions herself behind you, drawing you back until your head rests against her plush belly, her tail curled around your chest.");
	
	output("\n\nHands that had a few minutes ago viciously inflicted more pain than you’d thought possible now caress your head and your shoulders. One pair traces a short path back and forth from your shoulders up to your neck, every so often sliding forward to pull you back against her in a soft squeeze.");
	
	output("\n\nThe other pair of hands alights on your temples.");
	if (pc.hasHair()) output(" Her claws run through your [pc.hair], tracing along your scalp, sometimes in tandem, sometimes alternating.");
	else output(" Her claws trace across your scalp in meandering patterns.");
	output(" The sensation is rhythmic, and when coupled with the gentle ministrations of her hands on your chest, you feel the sobs in your chest start to fade, your breathing shifting to become slow and regular.");

	output("\n\n<i>“You did wonderfully, painslut,”</i> Mistress coos, nuzzling against the top of your head. For all of her small stature, she’s wrapped around you, pulling you tight against her warm, feathered body. You feel safe and secure, rocked by the waves, held in her arms.");
	
	output("\n\nOverhead, alien shapes drift in the current, blinking lazy colors against the midnight background. Mistress nuzzles you softly, making small noises of approval. Gradually those noises merge into one another into strings of music. You realize that she’s singing to you, wordlessly, her voice a combination of whale song and nightingale, as you curl up in her arms beneath an alien sea.");
	
	output("\n\n<i>“My lovely little painslut...”</i> She coos, her voice like thoughts inside a dream.");

	output("\n\nYou lose track of time as you doze in Mistress’ embrace, the memory of pain slowly replaced by a warm sense of contentment. At several points, she holds a silver pouch to your mouth and you gratefully sip something cold and sweet, feeling a little better each time as she strokes you gently, curled around you and clucking like a brooding hen.");
	
	output("\n\nOver the course of several hours, you breathe deeply, feeling more like you’re slowly waking up than falling asleep. Your conscious mind drifts back together in parts, and you can once again differentiate sensations. Slowly-twisting shapes drift overhead in the alien sea. The warmth of Mistress’ feather’s against your skin is a blessedly soft relief from the ache everywhere else.");
	
	output("\n\nFor a minutes, Mistress pulls away from you, and you mewl softly, only for her to return, dabbing something cool and wet against your skin.");

	output("\n\n<i>“Regelatin,”</i> she explains, running a goopy hand across your front. <i>“I don’t want your body too broken.”</i> You glance down, registering for the first time the red, angry lines criss-crossing your body. As Mistress slathers the blue, vaguely luminescent gel across them, the lines fade.");

	output("\n\nAnother hour is spent, floating weightlessly in the chamber, with Mistress alternating between comforting you and soothing your injuries. You realize that she’s fussing over you a bit, too, nibbling at your ears, grooming you gently with her claws. When you return the favor, she stretches out her neck appreciatively, clucking her approval. A graceful game of tag breaks out, with you and Mistress gently teasing and touching each other in the simulated sea.");
	
	output("\n\nSoon, you’re feeling like yourself again, and after checking multiple times, Mistress makes sure you’re settled on the ground before gradually turning the gravity back on. You stagger a bit as weight becomes an issue again, and she’s immediately at your side, making sure you can walk. Back on the ground, the tove is back to her scampering, waddling gait, but as she leads you back up through the labyrinth of tunnels, you remember the serpentine grace of your Mistress of pain.");

	flags["XOTCHI_STAGE"] = 4;
	processTime(15+rand(5));
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function xotchiSteamStage3Enough():void
{
	clearOutput();
	showXotchi();

	output("That was too much. You didn’t realize how much it would hurt, and how far it would push you. You ask for an end to the session.");

	output("\n\n<i>“Understandable,”</i> says [xotchiName], twisting the base of her lash. The faint, electric hum of it fades, and the lashes retract into the top of the device. <i>“Play like this can be overwhelming on both ends of the situation,”</i> she says softly, far more gently than it had been a moment ago. She taps a few commands into the device. <i>“It’s important that everyone know their limits.”</i>");
	
	output("\n\nThe sea beast beneath you fades, dissolving into holographic afterimages, and the seascape around you brightens, shifting back to the lavender sand and shallow waters from the beginning of your session. You let out a massive sigh of relief as the bindings around your arms release you, and you settle down onto a simulated bed of sand.");
	
	output("\n\n<i>“You did remarkably well, [xotchiPCName],”</i> she says, winding her way through the air. Behind her the holographic seascape shows a swaying forest of kelp. <i>“There are very few beings who could manage that much pain and stimulation, [xotchiPCName].”</i> She taps a portion of the wall, withdrawing a small, blue sphere from an open panel.");
	
	output("\n\nA trick of the gravity lets you settle to the synthetic sea bed, letting you feel a gentle tug alternating your left and right, mimicking a tidal pull. [xotchiName] swims over you, her metal shell replaced with a small, pulsating orb. As you lie back on the shifting sands, she runs the rippling blob across your skin.");
	
	output("\n\n<i>“Regelatin,”</i> she explains, running a goopy hand across your chest. You shiver at the sudden coldness of the goo against you.");
	if (pc.isGoo()) output(" The coldness spreads, absorbing slowly into your biomass, softening your stiff, achy sections.");
	output(" <i>“It helps to numb and regenerate tissue.”</i> You lean back on the lavender sands, twitching involuntarily as [xotchiName] drifts overhead, running the orb up and down your body. You don’t recall drifting off, and in truth, you don’t-not really anyway-slipping instead into a happy doze, lulled by the artificial tug of waves and the hissing sound of sand rolling underwater.");
	
	output("\n\nThe touch of her feet on your [pc.belly] nudges you from your revere. Your eyes open to watch her trail up your body, the softness of her feathers shockingly gently after all the pain’s she’s inflicted. She slithers up and around you, like a living feather boa, lifting your head gently and curling beneath it, holding you against her stomach. Her tail slips and remains over your shoulder, brushing gently back and forth across your chest.");
	
	output("\n\n<i>“You did very well, [xotchiPCName],”</i> she says, her orange feathers drifting around her in the false current. <i>“You made an excellent painslut.”</i>");
	
	output("\n\nOne pair of hands gently caress your head and your shoulders, sliding back and forth in a gentle rhythm. The other pair");
	if (pc.hasHair() && pc.hairLength >= 1) output(" runs through your [pc.hair], tracing along your scalp, sometimes in tandem, sometimes alternating.");
	else output(" traces across your scalp in meandering patterns.");
	output(" Her hands are just as at ease soothing you as they were at tormenting you, and you lean back, enjoying the feeling of tender ministrations.");
	
	output("\n\n<i>“This is a simulation of the peritidal zone just off the Eastern shore of Oriab,”</i> [xotchiName] says, running the edge of her beak against the rim of your ear. You shiver, and she nuzzles a bit more.");
	
	output("\n\n<i>“It’s beautiful this time of year,”</i> she notes. You have to agree-between the pale lavender sands, the shimmering green water, and the kelp-trees, it’s like something out of a vacation advert.");
	
	output("\n\n<i>“It’s a popular tourist spot on Mome,”</i> she says. <i>“Of course, we set up deflectorial fields to keep out the shantaks-they’re a sort of... moray eel, I suppose would be the Earth analogue-except they fly.”</i>");
	
	output("\n\nShe doesn’t seem to expect much from you in the conversation, which is fine-you’re more than a little exhausted from your session with her. She goes on and on, her usually-harsh voice softening as she recounts childhood memories of her home planet, taking you across the sea of years, holding you close to her. At various points, she holds a small silver pouch to your lips, encouraging you to sip from its nozzle.");
	
	output("\n\n<i>“Hydrate or you’ll cramp up,”</i> she scolds gently. You sip gratefully, nestling happily against the warm fur of her embrace.");
	
	output("\n\nAn hour passes with [xotchiName] wrapped around you. The ache in your muscles fade, and the floating headspace dissolves, leaving you feeling more grounded. After making sure that you’re feeling like yourself again, [xotchiName] gets you into a standing position, slowly turning the full gravity on.");
	
	output("\n\nBack under full gravity, [xotchiName] returns to the stocky scampering that’s characteristic of toves, waddling ahead to open up the pathway, leading you up through the labyrinth of tunnels. She gives you a reassuring pat on the hips. <i>“Feel free to drop by again. I’ll always need to blow off more steam.”</i>");
	
	output("\n\nYou’re not sure if that’s a good thing or a bad thing, but you smile back at her, walking out of the Camarilla office.");

	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function xotchiSteamStage2Enough():void
{
	clearOutput();
	showXotchi();

	output("You yelp that you can’t take anymore.");
	
	output("\n\nSomething flashes across [xotchiName]’s face. Is it concern?");
	
	output("\n\n<i>“There’s no shame in knowing your limits, [xotchiPCName],”</i> she says, twisting the base of her battery. The violet tendrils snake back into the metal shell, and she taps out a staccato of commands into it.");
	
	output("\n\nThe bindings around you dissolve into hardlight sparkles, and the holographic room around you blurs. The seascape around you dissolves into the shallows from earlier, purple sands and green, glittering surface overhead. A winding river of yellow sand improbably cuts though the purple slopes just below you.");
	
	output("\n\nA trick of the gravity lets you settle to the synthetic sea bed, letting you feel a gentle tug alternating your left and right, mimicking a tidal pull. [xotchiName] swims over you, her metal shell replaced with a small, pulsating orb. As you lie back on the shifting sands, she runs the rippling blob across your skin.");
	
	output("\n\n<i>“Regelatin,”</i> she explains, running a goopy hand across your chest. You shiver at the sudden coldness of the goo against you.");
	if (pc.isGoo()) output(" The coldness spreads, absorbing slowly into your biomass, softening your stiff, achy sections.");
	output(" <i>“It helps to numb and regenerate tissue.”</i> You lean back on the lavender sands, twitching involuntarily as [xotchiName] drifts overhead, running the orb up and down your body. You don’t recall drifting off, and in truth, you don’t-not really anyway-slipping instead into a happy doze, lulled by the artificial tug of waves and the hissing sound of sand rolling underwater.");
	
	output("\n\n<i>“Not many can cope with the pain you endured, [xotchiPCName],”</i> she notes, massaging the tincture into you. You’re so relaxed that you barely notice when she curls up, cat-like, on your chest, her multitude of hands massaging softly against you.");
	
	output("\n\n<i>“Perhaps we could do even more,”</i> she notes. You blink your eyes open in alarm.");
	
	output("\n\nShe laughs, a curious sound like a dozen songbirds chattering. <i>“At another time,”</i> she clarifies, reading your expression. <i>“And with your consent, of course,”</i> she adds.");
	
	output("\n\n<i>“That’s one of the secrets of domination-or maybe one of its curious ironies,”</i> she sighs, nesting down against you. Her fluffy body is warm, and the heat feels even better than the regelatin against your bruised body.");
	
	output("\n\n<i>“The Domme feigns control over the submissive, but the submissive is the one with all the power. If the submissive withdraws consent, then the session is over,”</i> she explains. <i>“It’s a poor Dominant who tries to push a submissive further than they agreed, or pressures a sub into something they don’t want. A good Dominant will do only what the sub agrees to, and not a thing more.”</i>");
	
	output("\n\n<i>“And </i>I<i> am a </i>very<i> good Dominant,”</i> she preens, lifting her head regally, her crest of plumes arching up between her ears.");
	
	output("\n\nYou take a chance and run your fingers under her chin, stroking her feathers in encouragement. Her eyes widen in surprise, before she smiles down at you. She reaches down with her front pair of hands, stroking your head.");
	
	output("\n\n<i>“And you are an excellent submissive,”</i> she coos.");
	
	output("\n\nYou stay in that position for a while, [xotchiName] preening atop your chest as you pet her. The tove voicing her approval through words or happy trills of contentment. At one point, she scampers off to a wall panel and returns with a small, silver pouch.");
	
	output("\n\nShe holds the nozzle of the pouch to your lips, encouraging you to drink. <i>“Hydrate or you’ll cramp up,”</i> she scolds gently. You sip gratefully, nestling happily against the warm fur of her embrace.");
	
	output("\n\nAn hour passes as the ache in your muscles fade, and the floating headspace dissolves, leaving you feeling more grounded. After making sure that you’re feeling like yourself again, [xotchiName] gets you into a standing position, slowly turning the full gravity on.");
	
	output("\n\nBack under full gravity, [xotchiName] is back to the stocky scampering that’s characteristic of toves, waddling ahead to open up the pathway ahead, leading you up through the labyrinth of tunnels. She gives you a reassuring pat on the hips. <i>“Feel free to drop by again. Maybe we’ll try something a little more adventurous next time.”</i>");
	
	output("\n\nYou’re not sure if that’s a good thing or a bad thing, but you smile back at her, walking out of the Camarilla office.");

	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}

public function xotchiSteamStage1Enough():void
{
	clearOutput();
	showXotchi();

	output("You’re really not feeling this, and you tell [xotchiName] so.");

	output("\n\nShe blinks all four eyes together, and clicks her beak once.");
	
	output("\n\n<i>“Well, that’s fine, I suppose”</i> she says, twisting the base of the silver battery. The violet tendrils retract, and the electric crackle fades out. The orange tove definitely looks a little disappointed, and you comment on that.");
	
	output("\n\n<i>“I suppose I am,”</i> she says, tapping out a few commands on the battery in her hands. The seascape around you fades, leaving behind the silver walls of the holographic chamber. Your hardlight bindings dissolve in a spray of sparkles as you float free in the zero gravity.");
	
	output("\n\n<i>“But that’s not your problem,”</i> she says. It sounds passive aggressive, and you feel the need to respond to that. She cuts you off before you can, though.");
	
	output("\n\n<i>“It is distinctly NOT your problem,”</i> she chirps shortly. <i>“A good Dominant respects a submissive’s boundaries, and a good tove respects a contract-even a verbal one.”</i> She swims through the air to the locker panel, clipping her flowered headset back into place.");

	output("\n\nYou open your mouth to reply, but a flashing red light overhead interrupts you.");
	
	output("\n\n<i>“People today ...”</i> she mumbles, tapping her headset and speaking into it. <i>“I told you to never interrupt me during a session!”</i> she snaps.");
	
	output("\n\nAs she converses, you take the time to stretch out your limbs. You weren’t restrained for very long, and your arms aren’t particularly stiff. It takes only a few zero-g exercises to get yourself feeling back to normal.");
	
	output("\n\n<i>“[xotchiPCName],”</i> she says, tapping her headset off. <i>“It’s terribly poor manners, but I’m going to have to leave without providing you any aftercare for our session. We’ve got a ‘dignitary’ visiting the station, and I need to greet him.”</i> She uses all four hands for her finger quotes, doubling the amount of sarcasm that should be possible.");
	
	output("\n\n<i>“Even short sessions necessitate aftercare, though,”</i> she says. <i>“Recuperation time,”</i> she explains, <i>“care for your body and brain so that it can reset after experiencing a significantly altered state. I’ll send in someone you’re familiar with so that you’ll be comfortable adjusting.”</i> Her explanation picks up speed as she goes. By the time she snaps her corset and accessories into place, her tone has taken on its usual irritated rasp.");
	
	output("\n\n<i>“Sincerest apologies again, [xotchiPCName],”</i> she says, darting out of the entry port. As she leaves you can hear her voice echoing behind her. <i>“Fucking Scrote! If he mentions paying for his Dyson Sphere again, I’m going to peck out his eyes...!”</i>");
	
	
	output("\n\nA second later, the entry port to the room snaps open, and a familiar pink form darts in, undulating through the air.");

	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", xotchiSteamStage1EnoughII);
}

public function xotchiSteamStage1EnoughII():void
{
	clearOutput();
	showXotchi();

	output("<i>“Oh my goshness! Saludatations again, S-s-s-s-steele!”</i> chirps Tlako. Her greeting ends on a curious chatter, and you notice that the little pink tove is shivering so hard that she’s practically vibrating in mid air.");
	
	output("\n\n<i>“S-s-s-sub-madam Xotchi to me to assis-sis-sist you with your recuperacation,”</i> she stutters. Her four arms are wrapped tight around her, and you can distinctly see frost on the edges of her feathers. Her four eyes look a little glazed, too. All-in-all, she looks like she’s on the edge of shock.");
	
	output("\n\nYou kick off the wall and grab her, the icy cold of her body against your naked form making you yelp.");

	output("\n\n<i>“Warm ...”</i> she mumbles, as you wrap your arms around her, trying to brush the frost from her body. As you do, her feathers ruffle out, making her fluffier than usual, until she’s almost a lumpy pink ball of fuzz in your arms.");

	output("\n\nYou can feel her shiver, still, and you hug her to you, trying to warm her.");

	output("\n\nAfter a few moments, she chirps, the tiny sound emerging from her fluffiness. It takes her a few tries to actually form a string of coherent words. <i>“Assistant Fourth Grade Tlako addressing the Limited Environment Neurostim Generator,”</i> she peeps.");

	output("\n\nThe room lets out a low chime in response.");
	
	output("\n\n<i>“Y’quaa hot springs p-p-p-p-please,”</i> she cheeps. <i>“Real water.”</i>");
	
	output("\n\nThe room chimes again, and the zero-g fades, lowering the both of you to the floor. Hardlight lines sketch gentle curved shapes around you, turning the room around you into a marble basin. A splash announces the opening of a panel and a bubbling stream of water that slowly fills the basin.");

	output("\n\nSteam rises from the hot water as the room converts into a miniature hot springs. The hot water is at your waist, and you cautiously lower Tlako into it. You pause briefly, then decide that you could probably use a soak, too. Your muscles are a little sore from being suspended by [xotchiName].");

	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", xotchiSteamStage1EnoughIII);
}

public function xotchiSteamStage1EnoughIII():void
{
	clearOutput();
	showXotchi();

	output("As you sink down to your shoulders in the hot water, the submerged blob of pink fur in front of you gradually uncurls. Below the surface, you can see Tlako stretch out, slowly turning this way and that.");
	if (pc.IQ() >= 40) output(" You’re relatively sure that toves are amphibious, and the amount of time she spends underwater confirms it.");
	output(" She finally surfaces, flinging her pink plumes back over her head and wiping her hands over her eyes.");
	
	output("\n\n<i>“Callooh, callay!”</i> she chirps triumphantly, bobbing in the water in front of you. <i>“Steele! It’s Steele! Hello! Hello, Steele! Did I forget to greet you? I’m so sorry!”</i>");
	
	output("\n\nYou smile and assure the excited little bird that she did already greet you.");
	
	output("\n\n<i>“Oh frabjous! Looks like even when on the edge of cold hardening, I’ve still got it!”</i> she looks extremely pleased with herself.");
	
	output("\n\nCold hardening? Does she mean freezing?");
	
	output("\n\n<i>“Similarish!”</i> she chirps. <i>“Cold is really bad for toves. It makes it hard to breathe, because our feathers start to tighten up,”</i> she says, lifting a dripping arm from the water and running her hand across her pink feathers. She continues babbling, apparently VERY energetic now that she’s warm again. <i>“Stiff feathers mean no breathing. I guess they’re more like leaves then, or maybe fronds... frondthers... feathonds... freathers...”</i> She laughs. She splashes water at you and you respond in kind. Tlako giggles and dives underwater again, surfacing with another happy spray of mist.");

	output("\n\nYou ask her why she was out in the cold if it’s so bad for toves.");

	output("\n\n<i>“I... may have accidentally and irrecontrieveably decalendared several important events from Sub-madam Xotchi’s agenda for the week,”</i> she says sheepishly. <i>“The sub-madam sent me down to survey Uveto VII as a punishment.”</i>");
	
	output("\n\nBut surely she would have taken precautions, especially if cold is so bad for toves.");

	output("\n\n<i>“We’re </i>really<i> senseptible to it. I had a thermal pack and I even bought a parka from a huskar who said she made it from her own fur, and it </i>still<i> didn’t keep all the cold out!”</i> she squawks.");

	output("\n\nThe thought of the itty-bitty pink fuzzball in an oversized parka makes you snort.");

	output("\n\n<i>“Hey, abiotic stress is nothing to laugh about!”</i> she protests. <i>“I even had mittens and a scarf!”</i>");
	
	output("\n\nThe mental image is too much and you burst out laughing.");
	
	output("\n\n<i>“Rude!”</i> says Tlako indignantly, splashing you. <i>“Impropritent!”</i>");
	
	output("\n\nYou splash her back and she yelps, returning fire.");
	
	output("\n\nThe next hour is spent helping Tlako to thaw out in the makeshift hot springs. Along the way, you feel a few muscles unclench, and the immediacy of [xotchiName]’s torments fade away. Once you’ve both recovered, you Tlako dissolves the hardlight and drains the water from the room. Hot air vents blow you both dry, leaving the little pink tove extra poofy.");
	
	output("\n\nYou trade jokes and chatter with her as she leads the way back up through the tunnels and up to the Camarilla office.");

	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", move, rooms[currentLocation].westExit);
}