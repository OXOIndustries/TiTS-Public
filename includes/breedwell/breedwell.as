// Breedwell Incubation Centre
// Only You Can Save Rahnkind

/*

Plans/Ideas

•	According to Flahne the rahn are a fairly minor race that only got uplifted recently. This provides a hook for the center: Rahn government are interested in a heavy colonisation effort this frontier rush to increase their influence, have the private funding to do it, but need fertile wombs to pump out the numbers. There’s probably plenty of sleaze involved, as the rahn would have to have worked with someone like Xenogen/Tamani to make all of this work and their logo is plastered over everything, which could be used to explain the fairly skeevy set-up.

•	PC should get an email giving coordinates to the place if they either use the NT cockmilker more than once, or get 2 or more kids in the Nursery. Porno ad featuring Tamani natch

•	For now, dick-havers get a fairly rudimentary glory hole scene with the exact same payment mechanics as the NT cockmilker, except possibly with a higher limit. Small chance maybe of the machine being replaced with a cheeky/hungry rahn?

•	Basic payment mechanics for pregnancy/scene ideas seem fine. Still slightly unclear as to how rahn pregnancy really works thanks to no examples in-game (They eat their own eggshells in utero and then mum gives live birth? That actually happens?) but we can play it by ear. Will be quite a lot of intricacy in pregshit thanks to large range of possible children.

•	I’d like to name her Quaelle instead because there’s way too many “-a”s in this game and all the eggs make me think of paella. Everything else described about her is A+

•	Because the rest of the facility is heavily orientated towards vag-havers I envisaged Quaelle as sexually being aimed more towards guys - her whole Reasnor-esque wobbly yummy mummy persona is geared towards that anyway. She’s in her year of heat and is pretty determined to have kids having missed out last time, so doesn’t need much persuasion to get jiggy with Steele. Trap Steele getting a cockmilking off her = yes please. This isn’t to say she can’t also knock up fem Steele/otherwise fuck her - just not the priority.

•	The whole Breeder Stamp thing and additional stuff with the extant rahn is hot af but have to be considered stretch goals for now.

*/

public function breedwellCoordinatesUnlocked():Boolean
{
	return (MailManager.isEntryViewed("breedwell_unlock"));
}
// Ad from Tamani Corp
// Received if PC has the rahn codex + has 2 or more kids in the Nursery OR has donated 500,000+ ml to the NT Cockmilker
public function breedwellCheckBirth():Boolean
{
	return (StatTracking.getStat("pregnancy/total births") >= 5);
}
public function breedwellCheckSperm():Boolean
{
	return ((StatTracking.getStat("milkers/cum milked") + StatTracking.getStat("milkers/cum jarred") + StatTracking.getStat("haley milker/cum milked") + StatTracking.getStat("spunk bunker/cum milked") + StatTracking.getStat("joyco/cum milked") >= 500000) || StatTracking.getStat("pregnancy/total sired") >= 20);
}
public function breedwellTryUnlock():void
{
	if(MailManager.isEntryUnlocked("breedwell_unlock")) return;
	
	if((breedwellCheckBirth() && pc.fertility() > 0) || (breedwellCheckSperm() && pc.virility() > 0))
	{
		goMailGet("breedwell_unlock");
	}
}
public function breedwellEmailText():String
{
	// From: TamaniCorp <Marketing@TamaniCorp.corp>
	// To: PC Steele
	// Subject: The Breedwell Incubation Centre Needs YOU.
	var mom:Boolean = breedwellCheckBirth();
	var msg:String = "<i>As soon as you open this email, a video starts playing.</i>";
	msg += "\n\n<i>“Hey there, eager breeder.”</i> The camera pans down a red velvet background to reveal the self-styled CEO of Tamani Corp, the booby, pink-skinned, punk-coiffed lady herself, smiling wickedly at the screen. <i>“We here at Tamani Corp don’t just sell orgasmically effective fertility treatments to those with a pressing need for them - we keep an eye on the future of our friends. And on those who might be able to help them.”</i>";
	msg += "\n\nShe’s joined on stage by two rahn - a buxom white gel girl and a slightly more svelte red one - both of them dressed in tight, white nurse uniforms emblazoned with the corporation’s logo. They wrap their arms around Tamani, pressing their soft, gooey flesh into hers, beaming.";
	msg += "\n\n<i>“That’s why today, I’m reaching out to you, " + pc.nameDisplay() + " Steele,”</i> Tamani goes on, looking you directly in the eye. You blink. What trick of technology allowed her to do that? <i>“You’ve " + (mom ? "divided your legs and multiplied your way around the frontier" : "donated gallons of hot, teeming cum") + " to your heart’s content, and we’ve taken notice. Because you’re the kind of person we like. Someone like me.”</i>";
	msg += "\n\nThe doe-eyed rahn haven’t been paying any attention to the camera. They’re far more interested in flicking their long, butterfly-like tongues over Tamani’s barely-concealed flesh, sliding their fingers between her thighs and underneath her corset. The heavily modded human keeps her gaze locked onto you, even as the red one plants kisses her on her bubblegum-pink cheek and begins to unzip her shorts.";
	msg += "\n\n<i>“Someone like me thinks: why shouldn’t I get paid for doing what I love? Surely there’s somebody out there who could use a young, fertile " + (mom ? "broodmare" : "fuck stud") + " like me about the place? Well, I’m here to tell you - there is.”</i> The white rahn is kneeling now, arms wrapped around Tamani’s thighs, face nestled between them, lapping hungrily away. The red one is pressed into the CEO from behind, nuzzling her ear as she reaches into her skirt and produces a pretty spectacular, wagging ovipositor erection. Cheeks turning the color of cherryade, Tamani strokes the rugmuncher’s hair as she wraps her other hand around the other’s gel cock, vigorously tugging it. Red moans in appreciation.";
	msg += "\n\n<i>“For this frontier rush only, our friends the rahn are in great need of proven breeding stock like yourself. At the Breedwell Incubation Centre, you can act as a sperm donor - or better yet, as a surrogate for any number of cute gel girls. And you will get paid to do it, because we know you’re good at it. Oop!”</i>";
	msg += "\n\nRed shoves Tamani over onto her hands and knees, making her present her full, naked backside to the rahn. She wastes no time grabbing Tamani by the hips, lining her ovipositor up with her plump, slickened cunt and driving it firmly home. Tamani gasps as waves of motion carry up her soft body, making her boobs bounce, as Red slaps her wide hips into her. The human watches, licking her lips, as White enters the frame, her own ovi-cock fully extended as well, arching towards the human’s round face.";
	msg += "\n\n<i>“I’m doing my bit!”</i> Tamani says, exhilarated eyes finding the camera for the last time. She squeals as Red slaps her backside and White takes a firm grip of her head. <i>“Will you?”</i> She takes hold of White’s shaft and spreads her lips around the bulbous, beading tip.";
	msg += "\n\nThe video generously pans out to provide a couple more seconds of the heated, jiggly spitroasting, before cutting to black. BREEDWELL INCUBATION CENTRE, reads the final screen card. SEE YOU THERE! That’s followed by Tamani’s signature, its coordinates, and a metric ton of scrolling disclaimers which disappear before you can properly focus on them.";
	
	// ++Lust
	//[Breedwell] added to Locations
	
	return msg;
}

// [Breedwell]
public function flyToBreedwellIntro(page:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	switch(page)
	{
		case 0:
			shipLocation = "BREEDWELL_SPACE";
			currentLocation = "BREEDWELL_SPACE";
			generateMap();
			showLocationName();
			clearBust();
			showName("\nTRAVELING...");
			
			output("A breeding center for rahn, that has reached out to you and your loins specifically? You’d suspect so honeyed a temptation to be a trap, but a quick internet search does confirm the existence of a private Tamani/U.G.C. co-owned installation in the system the coordinates in the ad pointed you towards. You tap them into your nav computer, and are soon on your way to the nearest warp gate.");
			output("\n\nWistral is way out on the frontier, a red giant which glowers a vast, weary welcome to you as you emerge in its system. No living creature has ever looked up from its complement of planets and moons and called it home - but the small fleet of ships hanging over Planet No. 5 is looking to change that. You have to assume the conditions there must be <i>almost</i> right, or there is something very precious down on that brown, hazy surface, to make it worth those arrays of solar mirrors and cloud seeders that you can see on your monitors. Terraforming is not cheap.");
			output("\n\nBreedwell Incubation Centre, meanwhile, is in orbit around the nearest gas giant. It’s a large, white space station, stamped with a purple Tamani logo half a mile tall. It has two ports that you can see; the one with NEW ARRIVALS in glowing letters above it is busy with small, oblong carriers coming and going from the warp gate. As you draw your craft closer, that sign blinks out and the word DONORS blinks into being above the less busy entrance. Clear enough.");
			
			processTime(5);
			
			addButton(0, "Next", flyToBreedwellIntro, 1);
			break;
		case 1:
			// Move PC to Breedwell Hangar
			shipLocation = "BREEDWELL_HANGAR";
			currentLocation = "BREEDWELL_HANGAR";
			generateMap();
			showLocationName();
			showBust("FUURAHN_NURSE");
			showName("WELCOME TO\nBREEDWELL");
			
			output("You land and alight in the airy hangar, and are immediately greeted by a bubbly fuu’rahn in a tight-fitting nurse outfit.");
			output("\n\n<i>“Hello, and welcome to Breedwell!”</i> she trills. <i>“Thank you so much for traveling out here to lend yourself to the great effort! If you just head up to reception that way and say hi to Quaelle at the desk, she’ll sort you out with where you need to go, and any questions you might have. Um, word of warning though - I’d loosen your clothing a lil’ bit before entering reception. Ok bye now!”</i> She hurries off to another passenger ship that’s just landed.");
			
			processTime(3);
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
public function flyToBreedwell():Boolean
{
	// Intro First
	if(flags["BREEDWELL_VISITED"] == undefined)
	{
		flyToBreedwellIntro();
		flags["BREEDWELL_VISITED"] = 1;
		return true;
	}
	
	author("Nonesuch");
	
	output("You warp into the Wistral system and head on towards the gas giant that BIC is orbiting around, keeping your monitors fixed upon Planet No. 5 as you do so. It’s fascinating, and weirdly moving, to watch that bleak, brown orb slowly being painted green and blue.");
	output("\n\nYou navigate your way into the DONORS entrance and land in the sparsely populated hangar without issue. You power down the ship");
	if(leaveShipOK()) output(" and step out the airlock. The fuu’rahn greeter smiles at you, but she knows you know your way around now.");
	return false;
}

// Room Descriptions

// Breedwell Hangar
public function breedwellHangarBonus():Boolean
{
	output("You are standing in the center’s secondary hangar, where ‘donors’ such as yourself come and go. It’s tall and airy, utilitarian white except for the grime and scorch marks that any place which houses spacecraft picks up. One wall is a vast energy barrier, beyond which the black eternity of space stares back. Facing it on the far wall is a giant Tamani logo, under which flat monitors endlessly loop adverts of the corporation’s products. Or porn. There’s no obvious distinction between the two.");
	output("\n\nIt’s pretty empty and quiet in here, aside from the distant sounds of the station’s activity. The fuu’rahn greeter is ");
	switch( hours % 6 )
	{
		case 1: output("chatting with a bald, muscular man"); break;
		case 2: output("chatting with a skittish-looking saeri"); break;
		case 0:
		case 3: output("standing on her own, browsing a tablet device"); break;
		case 4: output("chatting with a heavily pregnant gryvain"); break;
		case 5: output("nowhere to be seen. Probably with another visitor in a handy nearby closet"); break;
	}
	output(". To the east, a ramp and corridor lead to reception.");
	
	return false;
}
// Breedwell Reception
public function breedwellReceptionBonus():Boolean
{
	author("Nonesuch");
	
	if (breedwellPremiumNeedPunish()) return breedwellPremiumPunishScene();
	
	// Reception First
	if(flags["QUAELLE_MET"] == undefined)
	{
		showBust("QUAELLE");
		
		output("You head up the ramp from the hangar and along a white, brightly-lit corridor to some double doors labeled ‘Visitors Reception’.");
		output("\n\nYou are met with a heavy, humid blast of air when you open them, as if you’d stepped into a greenhouse. The walls in here are covered in lush, wet creeping vines, the ceiling with hanging baskets overflowing with greenery - a remarkable change from the dry, clinical whiteness your senses have been treated to so far.");
		output("\n\n<i>“Hello there!”</i> says a fluid, womanly voice somewhere at the heart of it. <i>“I can shiver you, but if you could - and then - yes. Splendid!”</i> You lift one of the hanging fronds to see who you’re talking to.");
		output("\n\nThe being behind the wide reception desk is the very embodiment of softness and wetness, writ on letters large, yellow and feminine. Her lower body is serpentine, but there’s nothing snake-like about that big, wide, blunt tail, patterned with brilliant orange spots, shining with moisture; it looks distinctly more like something that would spend three hours patiently climbing up a garden wall. Up from that edgeless wedge of a base a human-like body climbs, albeit a very thick, wet, hairless human, dressed in a waterproof chocolate-colored dress and lab-coat, against which mountainous, F-cup breasts are placing a mighty strain. At the top of this is a head and a flat-nosed, pleasantly-featured face, with full, golden lips and brilliant, frog-like, double-pupiled eyes. A number of cilia-like antennae slowly undulate from underneath a beige, conch-like hat. If the gastropodic being is irritated by you spending several moments properly taking her in, she doesn’t show it. She simply waves to direct your attention up to her face when you’re done.");
		output("\n\n<i>“Welcome to the Breedwell Incubation Centre. I’m Quaelle, the matron here,”</i> she says, drawing out the ‘e’ in ‘Breedwell’ and ‘here’ into a kind of happy hush. She pauses to brush the crude, colorful bracelets hanging from her wide arms further up. She’s in no hurry, and in the hot, humid environment here it’s hard not to share her mood. <i>“If you’ll give me one moment...”</i>");
		output("\n\nPeacefully she turns and taps a few times at a monitor. A tiny camera fixed to the roof eyeballs you. A glad smile slowly spreads over Quealle’s face.");
		output("\n\n<i>“[pc.name] Steele!”</i> she says. [pc.name] Steeeeeeeeele! <i>“Going off our analytics, it’s wonderful that you’ve taken up the offer to help the rahn with your shiversome body. So fertile! Such genes! Would you like the induction now, or do you have other questions?”</i> She gazes at you beatifically with her striking, double-pupiled eyes, antennae gently waving. <i>“You do, of course. Why don’t we sit aside and chat for a while?”</i>");
		// Roehm not met:
		if(!CodexManager.entryUnlocked("Roehm"))
		{
			output("\n\n<b>Your codex beeps to inform you that it has downloaded details of Quealle’s race.</b>");
			CodexManager.unlockEntry("Roehm");
		}
		
		processTime(3);
		
		flags["QUAELLE_MET"] = 1;
		
		// [Induction] [Talk] [Appearance]
		quaelleMainMenu(true);
		return true;
	}
	
	output("Breedwell’s reception area is a fairly large, circular room, dominated by a curved desk against the north wall. It is hot and very humid here, greenhouse-like, the lights muzzy with the water in the air. Moisture drips down the walls, slathered with exotic creepers. Hanging baskets droop lush greenery from the ceiling.");
	output("\n\nFrom here, corridors fan out to every part of the station, and there’s a relative amount of bustle going on. Rahn of every color and shape, either staff members in nurse uniforms or swollen, eager studs dressed in all sorts of styles, hurry from one place to the other. One or two thoroughly impregnated surrogates relax on seats, flush-faced.");
	
	if (quaelleHasLeft())
	{
		output(" At the hub of it all is a rather stern-looking doh’rahn.");
		if (flags["QUAELLE_LEFT"] == undefined) output(" <b>Quaelle, the roehm matron, isn’t anywhere in sight.</b>");
	}
	else if (quaelleTriggerBirthScene())
	{
		output(" At the hub of it all is a rather stern-looking doh’rahn.");
		if (flags["QUAELLE_NATAL_UNIT"] == undefined)
		{			
			output(" <b>The back-up matron catches your eye the moment you enter and gives you a brief smile. Looks like she’s been waiting for you.</b>")
			output("\n\n<i>“You should go to the natal unit,”</i> the purple rahn says, before you can open your mouth. <i>“Go through the south doors, then west a short distance past the breeding pods.”</i> She shakes her head slightly. <i>“Imagine deliberately getting pregnant in a place like this. Takes some cheek!”</i>");
		}
		else
		{
			output(" <b>The back-up matron catches your eye the moment you enter, gives you a brief smile. You recognise that look. Nervous excitement tightens your chest.</b>")
			output("\n\n<i>“Congratulations, you’re a dad. Again.”</i>");
			output("\n\nThe purple rahn points southwards with her stylus.");
			output("\n\n<i>“You know where to go, right? Hope you brought flowers. She’s very hungry.”</i>");
		}		
	}
	else if (quaelleIsRecovering(1))
	{
		output(" At the hub of it all is a rather stern-looking doh’rahn.");
		output("\n\nQuaelle must still be on maternity leave.");
	}
	else if (quaelleIsImmobile())
	{
		output(" At the hub of it all is a rather stern-looking doh’rahn.");
		if (flags["QUAELLE_IMMOBILE_GREET"] == undefined)
		{
			if (flags["QUAELLE_IMMOBILE_PREG_COUNT"] == undefined) output(" <b>Quaelle, the roehm matron, isn’t anywhere in sight. What’s become of her?</b>");
			else output(" <b>You guess Quaelle must have become incapacitated by pregnancy again. Thanks to a certain randy someone.</b>");	
		}
		else output(" Quaelle must still be incapacitated.");
	}
	else if(quaelleSexTimer(1,6)) output(" At the hub of it all is a rather stern-looking doh’rahn. <b>Quaelle isn’t anywhere in sight. A loo’rahn aide catches your eye and with a smirk jerks her head at a door behind the front desk leading northwards. Apparently the roehm is on her break.</b>");
	else output(" At the hub of it all, behind the desk, is Quaelle. The chesty roehm matron is busy at her monitors and with various aides, some of whom are literally hopping from foot to foot as she slowly and placidly turns to deal with each.");
		
	// If PC barred from Sperm Donation Bay:
	if(flags["BREEDWELL_DONATION_LOCKED"] != undefined)
	{
		output("\n\nTo the east is the Sperm Donation Bay. You’re famous there, for a particular value of famous. Two rahn aides stationed by the doors slide their hands meaningfully towards their stun batons when they catch you looking at the entrance.");
		
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	}
	if (flags["BREEDWELL_PREM_POD_BAN"] == 1)
	{
		output("\n\nTo the south is the Pod Lounge. You’re no longer welcome there, as a result of believing raising rahn kids yourself was better than serving the interests of Breedwell.");
		if (!quaelleTriggerBirthScene()) flags["NAV_DISABLED"] |= NAV_SOUTH_DISABLE;
	}
	//stop move north unless quaelle is waiting or is immobile
	if (!quaelleSexTimer(1, 6) && !quaelleIsImmobile()) flags["NAV_DISABLED"] |= NAV_NORTH_DISABLE;
	
	if (quaelleReplacedWithDohrahn()) addButton(0, "Doh'rahn", quaelleApproachDohrahn);
	else addButton(0, "Quaelle", approachQuaelle);
	
	return false;
}
// Breedwell Pod Lounge
public function breedwellLoungeBonus():Boolean
{
	author("Nonesuch");
	
	//always disable for now, pc cant move into the mod area, only move out
	flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
	
	output("You are in the surrogate partition of the pod lounge. It’s a long room, clean and sparse, set with seating on one side, the pods on the other. Some of them are turned inwards, nothing but a blank expanse of wall and an OCCUPIED sign lit up above it. Most though are ready to go: empty, adjustable seats, rather like hairdresser seats backing into the wall, with various synthetic harnesses at arm and leg height.");
	if(hours >= 23 || hours < 6) output(" It’s empty here right now.");
	else if((hours >= 6 && hours < 11) || (hours >= 19 && hours < 23)) output(" There’s one or two heavily pregnant rahn-bearers here, resting on the seating, faces flushed and puffy.");
	else
	{
		output(" It’s fairly busy right now - surrogates of all size and descriptions chat with one another, comparing baby bumps and soothing nervy newbies.");
		// PC has been bred 3 times or more:
		if(flags["BREEDWELL_TIMES_BRED"] >= 3) output(" There are a few other surrogates here, gearing themselves up for a hard breeding or just resting, and since you’re a familiar face you exchange smiles" + (pc.isPregnant() && pc.bellyRating() >= 10 ? ", admiring belly rubs": "") + " and pleasantries with the other working girls and cuntboys you know.");
	}
	output("\n\nThrough a one-way window you can see the other half, the rahn patron area, a plush and well-furnished lounge. There are great gaggles of the colorful gel women in there, chatting amongst themselves, relaxing around tables and enjoying glasses of sparkling alcohol and goopy cum, brought to them by floating cater droids. Ubiquitous are the station’s tablet catalogues: the well-to-do rahn flick through them, giggling and leaning into each other, as they weigh up which of the currently available surrogates they want to have a session with.");
	// PC is Premium standard:
	if(flags["BREEDWELL_STATUS_BREEDER"] >= 2) output(" You can see your face and blurb prominent in the Premium section of the catalogues being bandied around closer to you, but your picture is currently darkened. There seems to be some disappointment about this.");
	output("\n\nAcross the room from them are the doors which lead to the mating pods. Even as you watch, a numbered light appears above one, a rahn quickly strides over to it, and disappears inside.");
	
	if (!quaelleTriggerBirthScene()) flags["NAV_DISABLED"] |= NAV_WEST_DISABLE;
	
	// [Pod]
	if(flags["BREEDWELL_STATUS_BREEDER"] == undefined) addDisabledButton(0, "Pod", "Pod", "You are not familiar with this yet. You probably need to be properly introduced before using it.");
	else if(flags["BREEDWELL_PREM_POD_BAN"] == 1) addDisabledButton(0, "Pod", "Pod", "You have been banned!");
	else if(!pc.hasVagina()) addDisabledButton(0, "Pod", "Pod", "You require a vagina to try this.");
	else if(!breedwellCheckBirth()) addDisabledButton(0, "Pod", "Pod", "Making babies? You don’t think you’re exprienced enough to try this yet...");
	else if(pc.isFullyWombPregnant() && totalPregRahnEggs() >= (breedwellBreederLevel() * 2 * totalRahnPregnancies())) addDisabledButton(0, "Pod", "Pod", "You’re already too stuffed to do this.");
	else if(pc.fertility() <= 0) addDisabledButton(0, "Pod", "Pod", "You’re not fertile enough to do this.");
	else addButton(0, "Pod", breedwellApproachPod, undefined, "Pod", "Harness yourself up and get ready for a breeding.");	
	
	return false;
}
// Breedwell Sperm Donation Bay
public function breedwellDonationBonus():Boolean
{
	author("Nonesuch");
	
	output("You are in the station’s sperm donation bay. It’s a spacious but utilitarian and rather sterile room similar in style to most of the rest of Breedwell, not a place designed for people to hang around. Despite that, there are two or three other donors here, either sat splay-legged and recovering from a heavy draining, or chatting with the rahn staff.");
	// Donated three times or more:
	if(flags["BREEDWELL_TIMES_DONATED"] >= 3) output(" You recognize most of them, veteran cum-pumps like yourself, and you exchange knowing grins and small talk with a couple.");
	output("\n\nAt the far eastern end is a row of innocuous, identical doors, leading to the extractor cubicles. Looming over and tubed up to them are vast glass cylinders, containers for the produce that will be siphoned off for the rahn’s use.");
	
	// [Cubicle]
	if(flags["BREEDWELL_STATUS_DONATOR"] == undefined) addDisabledButton(0, "Cubicle", "Cockmilker", "You are not familiar with this yet. You probably need to be properly introduced before using it.");
	else if(!pc.hasCock()) addDisabledButton(0, "Cubicle", "Cockmilker", "You require a penis to try this.");
	else if(!breedwellCheckSperm()) addDisabledButton(0, "Cubicle", "Cockmilker", "Milking your semen? You don’t think you’re exprienced enough to try this yet...");
	else if(pc.virility() <= 0) addDisabledButton(0, "Cubicle", "Cockmilker", "You’re not virile enough to do this.");
	else if(flags["BREEDWELL_DONATION_USED"] == days)
	{
		output("\n\nThe cubicles refuse to open when you approach them. They’re evidently programmed not to for those who have already given their donation for the day.");
		addDisabledButton(0, "Cubicle", "Cockmilker", "You can’t use this at the moment. Maybe later?");
	}
	else addButton(0, "Cubicle", breedwellApproachCockmilker, undefined, "Cockmilker", "Donate some sperm.");
	
	return false;
}

// Quaelle functions
public function showQuaelle(nude:Boolean = false):void
{
	var sBust:String = "QUAELLE";
	//commented out until these preg bust exist
	//if(quaellePregnancyStage(0) == 2) sBust += "_F1";
	//else if(quaellePregnancyStage(0) == 3) sBust += "_F2";
	//if(quaellePregnancyStage(1) == 2) sBust += "_B1";
	//else if(quaellePregnancyStage(1) == 3) sBust += "_B2";
	if(nude) sBust += "_NUDE";
	showName("\nQUAELLE");
	showBust(sBust);
}
public function quaelleIsLover():Boolean
{
	if (flags["QUAELLE_LOVER"] > 0) return true;
	
	return false;
}
public function quaelleIsPregnant(vIdx:int = -1):Boolean
{
	if(vIdx == 0) return (quaelleBellyRatingFront() > 0);
	if(vIdx == 1) return (quaelleBellyRatingBack() > 0);
	return (quaelleBellyRatingFront() + quaelleBellyRatingBack() > 0);
}
public function quaelleIncubationDays():Number
{
	// Total days she is preggo for.
	// She gives birth the day after.
	return 31;
}
public function quaelleBellyRatingFront():Number
{
	if(flags["QUAELLE_INCUBATION_TIMER_F"] == undefined || flags["QUAELLE_INCUBATION_TIMER_F"] > quaelleIncubationDays()) return 0;
	return (Math.round((flags["QUAELLE_INCUBATION_TIMER_F"] / quaelleIncubationDays()) * 100));
}
public function quaelleBellyRatingBack():Number
{
	if(flags["QUAELLE_INCUBATION_TIMER_B"] == undefined || flags["QUAELLE_INCUBATION_TIMER_B"] > quaelleIncubationDays()) return 0;
	return (Math.round((flags["QUAELLE_INCUBATION_TIMER_B"] / quaelleIncubationDays()) * 100));
}
public function quaelleIsImmobile():Boolean
{
	if (quaelleIsPregnant() && quaellePregnancyStage(0) == 3 && quaellePregnancyStage(1) == 3)
	{
		flags["QUAELLE_IMMOBILE_PREG"] = 1;
		return true;
	}
	return false;
}
public function processQuaellePregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if (flags["QUAELLE_INCUBATION_TIMER_F"] != undefined) flags["QUAELLE_INCUBATION_TIMER_F"] += totalDays;
	if (flags["QUAELLE_INCUBATION_TIMER_B"] != undefined) flags["QUAELLE_INCUBATION_TIMER_B"] += totalDays;
	
	var timestamp:int = GetGameTimestamp() + deltaT;
	
		if(flags["QUAELLE_BIRTH_EMAIL"] == undefined && (flags["QUAELLE_INCUBATION_TIMER_F"] > quaelleIncubationDays() || flags["QUAELLE_INCUBATION_TIMER_B"] > quaelleIncubationDays()))
		{
			if (flags["QUAELLE_INCUBATION_TIMER_F"] > quaelleIncubationDays()) timestamp = (GetGameTimestamp() + deltaT - (flags["QUAELLE_INCUBATION_TIMER_F"] * 24 * 60) + (quaelleIncubationDays() * 24 * 60));
			else timestamp = (GetGameTimestamp() + deltaT - (flags["QUAELLE_INCUBATION_TIMER_B"] * 24 * 60) + (quaelleIncubationDays() * 24 * 60));
			resendMail("quaelle_birth", timestamp);
			flags["QUAELLE_BIRTH_EMAIL"] = 1;
			quaelleBirth(timestamp);
		}
	
}
public function knockUpQuaelleChance(vIdx:int = -1):void
{
	if(!quaelleIsPregnant(vIdx) && pc.virility() > 0 && flags["QUAELLE_FERTILE"] == 1)
	{
		var bonusChance:Number = 10;
		var rem:Number = 0;
		bonusChance += pc.cumQ() / 100;
		if(bonusChance > 25) bonusChance = 25;
		bonusChance *= pc.virility();
		if (bonusChance > 75)
		{
			rem = bonusChance - 75;
			rem = rem / 10;
			bonusChance = 75;
		}
		bonusChance += rem;
		if (bonusChance > 99) bonusChance = 99;
		bonusChance *= 100;

		if(rand(10000) < bonusChance)
		{
			if (vIdx == -1 || vIdx == 0)
			{
				flags["QUAELLE_INCUBATION_TIMER_F"] = 0;
				flags["QUAELLE_NUM_BABIES_F"] = 1;
				flags["QUAELLE_BABY_GENDERS_F"] = new Array();
				flags["QUAELLE_BABY_GENDERS_F"].push("F");				
			}
			if (vIdx == -1 || vIdx == 1)
			{
				flags["QUAELLE_INCUBATION_TIMER_B"] = 0;
				flags["QUAELLE_NUM_BABIES_B"] = 1;
				flags["QUAELLE_BABY_GENDERS_B"] = new Array();
				flags["QUAELLE_BABY_GENDERS_B"].push("F");	
			}
			pc.clearRut();
		}
	}
}
public function quaelleCleanupPregnancy(pregSlot:int = -1):void
{
	if (pregSlot == -1 || pregSlot == 0)
	{
		flags["QUAELLE_INCUBATION_TIMER_F"] = undefined;
		flags["QUAELLE_NUM_BABIES_F"] = undefined;
		flags["QUAELLE_BABY_GENDERS_F"] = undefined;
	}
	if (pregSlot == -1 || pregSlot == 1)
	{
		flags["QUAELLE_INCUBATION_TIMER_B"] = undefined;
		flags["QUAELLE_NUM_BABIES_B"] = undefined;
		flags["QUAELLE_BABY_GENDERS_B"] = undefined;
	}
	if (flags["QUAELLE_IMMOBILE_PREG"] == 1)
	{
		flags["QUAELLE_IMMOBILE_PREG"] = undefined;
		IncrementFlag("QUAELLE_IMMOBILE_PREG_COUNT");
	}
	flags["QUAELLE_IMMOBILE_GREET"] = undefined;
	flags["QUAELLE_IMMOBILE_VISIT"] = undefined;
}

// [Quaelle]
public function approachQuaelle():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	//check if pc asked quaelle for sex but didn't show in the 6 hours timeframe
	if (flags["QUAELLE_SEX_WAIT"] != undefined && !quaelleSexTimer(0, 6))
	{		
		quaelleSexNoShow();
	}
	else
	{	
		// !Lover:
		if(!quaelleIsLover()) output("<i>“Trembulent Steele!”</i> The roehm turning and smiling at you is like watching the sun come up, and takes roughly as long. <i>“How wonderful to see you back at Breedwell. Is there anything you need, or wanted to ask?”</i>");
		//in snit
		else if (quaellePregShutdown() && flags["QUAELLE_FERTILE"] != 0) quaellePregShutdownTalk();
		else if (quaelleInSnit()) output("<i>“Metronomic Steele.”</i> Quaelle gives you a cool smile and doesn’t reach her arms out. She couldn’t make it clearer that you’re still in the doghouse with her if she’d built one. <i>“Is there something you’d like to discuss?”</i>");
		//pc pregnant
		else if (quaelleIsPCPreg() > 0 && quaellePCPregTime(10) && flags["QUAELLE_PREG_GREET"] != 1) quaellePCPregGreeting();
		//quaelle pregnant
		else if (quaellePregnancyStage() >= 2) quaellePregGreeting();
		// Lover:
		else output("<i>“Efficervescent Steele.”</i> The roehm had begun freezing programs and shooing her aides away the moment you stepped into reception, so by the time you approach her the two of you are relatively alone. She smiles at you without saying a word, hands clasped and cilia waving towards you, apparently happy to just sit and drink you in.");
	
		// [Induction] [Talk] [Hug] [Sex]
		quaelleMainMenu();
	}
}
public function quaelleMainMenu(fromIntro:Boolean = false):void
{
	clearMenu();
	var desc:String;
	if(!breedwellInductionCheck()) addButton(0, "Induction", ((flags["BREEDWELL_STATUS_BREEDER"] == undefined && flags["BREEDWELL_STATUS_DONATOR"] == undefined) ? breedwellInductionRouter : breedwellInductionUpdate), undefined, "Induction", ((flags["BREEDWELL_STATUS_BREEDER"] == undefined && flags["BREEDWELL_STATUS_DONATOR"] == undefined) ? "Get the low-down on what this job offer really is." : "See what your other half might be in for."));
	else if(flags["BREEDWELL_STATUS_BREEDER"] == undefined || flags["BREEDWELL_STATUS_DONATOR"] == undefined)
	{
		if(!pc.hasGenitals()) addDisabledButton(0, "Induction", "Induction", "You do not yet qualify. Get some genitals first!");
		else if(pc.isHerm() && !breedwellCheckBirth() && !breedwellCheckSperm()) addDisabledButton(0, "Induction", "Induction", "You do not yet qualify. Get to popping out more children or have your cum milked somewhere first!");
		else if(pc.hasVagina() && !breedwellCheckBirth() && flags["BREEDWELL_STATUS_BREEDER"] == undefined) addDisabledButton(0, "Induction", "Induction", "You do not yet qualify. Get to popping out more children already!");
		else if(pc.hasCock() && !breedwellCheckSperm() && flags["BREEDWELL_STATUS_DONATOR"] == undefined) addDisabledButton(0, "Induction", "Induction", "You do not yet qualify. Go get your cum milked somewhere!");
		else addDisabledButton(0, "Induction", "Induction", "Not necessary--You’ve already been qualified!");
	}
	else addDisabledButton(0, "Induction", "Induction", "Not necessary--You’ve been qualified for both areas already!");
	addButton(1, "Talk", quaelleTalk);
	if(flags["QUAELLE_HUGGED"] != undefined) addButton(2, "Hug", quaelleGetAHug);
	if (quaelleIsLover())
	{
		if (quaelleIsRecovering(3)) addDisabledButton(3, "Sex", "Sex", "She is still recovering from giving birth.");
		else addButton(3, "Sex", quaelleAskSex, undefined);
	}
	if (MailManager.isEntryViewed("breedwell_premium_invite"))
	{
		if (breedwellPremiumContractCount() > 0) desc = "Renewal";
		else desc = "Premium";
		if (breedwellPremiumIsQualified(true))
		{
			if (breedwellPremiumContractCount() > 0) addButton(4, desc, breedwellPremiumRenewPremium,undefined,desc,"Ask about your Premium Breeder contract. Is it possible to do another term?");
			else addButton(4, desc, breedwellPremiumGetPremiumQuaelle,undefined,desc,"Ask about becoming a Premium Breeder.");
		}
		else if (flags["BREEDWELL_PREM_CON_BAN"] == 1) addDisabledButton(4, desc, desc, "You have been banned!");
		else if (breedwellPremiumUnderContract()) addDisabledButton(4, desc, desc, "You are already under contract.");
		else if (!pc.hasVagina()) addDisabledButton(4, desc, desc, "You have no wombs!");
		else addDisabledButton(4, desc, desc, "Probably a bad idea to talk about this whilst you’re currently knocked up with something other than rahn.");
	}
	addButton(5, "Appearance", quaelleAppearance);
	
	if(!fromIntro) addButton(14, "Leave", mainGameMenu);
}
// Description
public function quaelleAppearance():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	output("The roehm matron of Breedwell Incubation Centre is about 9\' 10\" from conch-hatted head to blunt-tipped tail, but half of that is horizontal. With its soft, moist epidermis and brilliant orange spots, her great, thick, yellow, lozenge of a lower body is reminiscent of nothing so much as the body of a giant sea slug. When she moves she does so with a kind of glacial grace, slowly undulating to where she needs to be, abetted by a thin trail of slime which quickly dries behind her, more like sweat than mucus. It’s rather relaxing to watch, but it must be agonizing to work with her. Still, surrounded by monitors and rahn aides, the roehm is in reach of pretty much everything she needs in order to be the nerve center of BIC.");
	output("\n\nThe upper half of Quaelle rears up to about 6\' 6\", and is slightly less alien to your own sensibilities, as in general terms it’s that of a plump, pear-shaped human. If humans had wet, hairless yellow skin and no ears, anyway. The wide, FF breasts shaping and straining her waterproof brown dress and lab overcoat, though - those you understand. As you do the pleasant, flat-nosed face, with its full, glistening golden lips. The roehm’s eyes are arresting: double conjoined pupils, frog-like in iridescent blue irises, tar-black figures of eight floating in an alien swamp. Upon her brow and below her conch hat her cilia antennae climb, tipped blue like her eyes, constantly craning and waving this way and that. Her arms are ringed with charm bracelets, crude and colorful. The overall impression is that of a friendly, voluptuous infant school teacher who also happens to be a slug.");
	// is Preggers
	if(quaelleIsPregnant())
	{
		var bellyF:Number = quaelleBellyRatingFront();
		var bellyB:Number = quaelleBellyRatingBack();
		
		// Front only
		if(bellyF >= 10 && bellyB < 10)
		{
			// Lightly pregnant, front only:
			if(quaellePregnancyStage(0) == 1) output("\n\nShe looks a tad swollen around the front.");
			// Moderately pregnant, front only:
			else if(quaellePregnancyStage(0) == 2) output("\n\nShe’s got an undeniable baby belly now, stretching the front of her dress. It’s carried easily by a frame all but meant to bear kids.");
			// Heavily pregnant, front only:
			else output("\n\nShe is flush and ripe with her pregnancy now, belly massively protuberant, her swollen breasts resting on top of it. If you thought Quaelle was complacent and serene before, it’s nothing on the place she’s at now; she looks like she’s simmering in some unknowable peace, seemingly set to slow motion in comparison to everyone around her.");
		}
		// Back only
		else if(bellyB >= 10 && bellyF < 10)
		{
			// Lightly pregnant, back only:
			if(quaellePregnancyStage(1) == 1) output("\n\nIs her uniped base slightly more rounded than it was before?");
			// Moderately pregnant, back only:
			else if(quaellePregnancyStage(1) == 2) output("\n\nHer gastropod end is definitely swollen with pregnancy now, the flesh around her end tautening nicely. She moves around with more care, being careful not to bump it into furniture.");
			// Heavily pregnant, back only:
			else output("\n\nHer gastropod end is heavily pregnant now, orange spots taut with the bellyful of life she’s carrying. If you thought Quaelle was complacent and serene before, it’s nothing on where she is now; she looks like she’s simmering in some unknowable peace, seemingly set to slow motion in comparison to everyone around her.");
		}
		// Both
		else if(bellyF >= 10 && bellyB >= 10)
		{
			// Front pregnant light, back pregnant light-moderate:
			if(quaellePregnancyStage(0) == 1 && quaellePregnancyStage(1) == 1) output("\n\nShe looks a tad swollen, both around the front and around her tail.");
			// Front pregnant moderate, back pregnant light-moderate:
			else output("\n\nShe’s got an undeniable baby belly now, stretching the front of her dress. Not only that, her thick back quarters also look swollen, taut and gravid.");
		}
	}
	// PC has fugged her:
	if(flags["QUAELLE_SEXED"] != undefined) output("\n\nAs only adventurous, non-judgmental, patient and charming individuals such as yourself are aware, Quaelle has a pussy towards the bottom of her front: brilliant blue like her eyes, but otherwise human-like. If human clitorises could extend outwards into ten inch long, fully functional, cilia-tipped tentacle penises, that is. At the very tip of her tail she has her other vagina, another brilliant blue treasure that’s usually nestled away beneath folds of flesh. That one has no clitoris, but does have a wonderfully long and sensitive passage.");
	
	addDisabledButton(5, "Appearance");
}

// [Induction]
public function breedwellInductionCheck():Boolean
{
	// Flag checks
	if(pc.isHerm() && flags["BREEDWELL_STATUS_BREEDER"] != undefined && flags["BREEDWELL_STATUS_DONATOR"] != undefined) return true;
	if(pc.isFemale() && flags["BREEDWELL_STATUS_BREEDER"] != undefined) return true;
	if(pc.isMale() && flags["BREEDWELL_STATUS_DONATOR"] != undefined) return true;
	// Viability checks - interrupts button generation if not eligible candidate.
	if(pc.hasVagina() && flags["BREEDWELL_STATUS_BREEDER"] == undefined)
	{
		if(!pc.hasCock() || flags["BREEDWELL_STATUS_DONATOR"] != undefined) return (!breedwellCheckBirth());
	}
	if(pc.hasCock() && flags["BREEDWELL_STATUS_DONATOR"] == undefined)
	{
		if(!pc.hasVagina() || flags["BREEDWELL_STATUS_BREEDER"] != undefined) return (!breedwellCheckSperm());
	}
	// Show button if haven't yet inducted!
	return false;
}
public function breedwellInductionRouter():void
{
	if(pc.isHerm() && breedwellCheckBirth() && breedwellCheckSperm() && flags["BREEDWELL_STATUS_BREEDER"] == undefined && flags["BREEDWELL_STATUS_DONATOR"] == undefined) breedwellInduction("herm");
	else if(pc.hasVagina() && breedwellCheckBirth() && flags["BREEDWELL_STATUS_BREEDER"] == undefined) breedwellInduction("female");
	else if(pc.hasCock() && breedwellCheckSperm() && flags["BREEDWELL_STATUS_DONATOR"] == undefined) breedwellInduction("male");
	else
	{
		clearOutput();
		output("Error: None of the conditions match!");
		output("\n");
		output("\nBreeder, Status: " + (flags["BREEDWELL_STATUS_BREEDER"] == undefined ? "<i>Not yet inducted!</i>" : flags["BREEDWELL_STATUS_BREEDER"]));
		output("\nDonator, Status: " + (flags["BREEDWELL_STATUS_DONATOR"] == undefined ? "<i>Not yet inducted!</i>" : flags["BREEDWELL_STATUS_DONATOR"]));
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}
public function breedwellInductionUpdate(update:Boolean = false):void
{
	clearOutput();
	if (quaelleReplacedWithDohrahn()) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");
	
	// Only appears in Quaelle’s main menu if PC has inductions they have not taken and are capable of doing (e.g. chose to talk to her initially, are herm, or grew something new).
	if (quaelleReplacedWithDohrahn()) output("You ask the purple-membraned rahn about helping in a new way.");
	else output("<i>“You wish to help the great effort another way? I’m so pleased to hear that, efferlicious Steele!”</i> Quaelle slowly oozes out from behind her desk. <i>“Just follow me, and I’ll show you the other wing.”</i>");
	
	// Carries on from whichever induction scene PC has not taken
	clearMenu();
	if(pc.isHerm() && breedwellCheckBirth() && breedwellCheckSperm())
	{
		if(flags["BREEDWELL_STATUS_BREEDER"] != undefined) addButton(0, "Next", breedwellInduction, "male");
		else if(flags["BREEDWELL_STATUS_DONATOR"] != undefined) addButton(0, "Next", breedwellInduction, "female");
		else addButton(0, "Next", breedwellInductionRouter);
	}
	else addButton(0, "Next", breedwellInductionRouter);
}
public function breedwellInduction(response:String = ""):void
{
	clearOutput();
	if (quaelleReplacedWithDohrahn()) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");
	clearMenu();
	
	switch(response)
	{
		case "female":
			if (quaelleReplacedWithDohrahn())
			{
				output("<i>“Right. Yes. Induction.”</i> The do’rahn rubs her temples and sighs. <i>“Look, you’re a " + pc.mf("guy","girl") + " who’s seen a lot of action. You wouldn’t be here if that wasn’t the case. So I’ll just give you the lowdown from here, ok? It’s very simple.”</i>");
				output("\n\n<i>“Go through the door to the south. You’ll see some pods with chairs built into them. Just sit yourself down in one of them and relax, the machine will take care of the rest. The rahn donors have been told to be gentle with you, although that doesn’t mean they won’t get over-excited. You’ll get paid half once you’re full, and the other half once you’ve actually delivered them. Got it? Great.”</i>");
				output("\n\nShe returns to her monitor before you can respond.");
				if (flags["BREEDWELL_STATUS_BREEDER"] == undefined) flags["BREEDWELL_STATUS_BREEDER"] = 1;
				addButton(14, "Leave",mainGameMenu,undefined);
			}
			else
			{
				output("<i>“Let’s go to the pod chambers, shall we?");
				if(!pc.hasPheromones()) output(" That’s where we’ll need a trembulent young " + pc.mf("boylady", "lady") + " such as yourself, after all!");
				else output(" Those hormones of yours are almost making me dizzy, hmm, goodness me. We could do with suiting you up there straight away!");
				output("”</i>");
				output("\n\nQuaelle nestles a touch tablet into her arm and undulates her way from around the counter. The way the roehm moves is slow but rather hypnotic, waves of motions following each other down her great, soft side. She draws you close to her with a friendly touch of the shoulder, and the buttery smell of caramel wafts over you, leaving you feeling... horny? Sweet heat sinks down to [pc.eachVagina] and your [pc.nipples] " + (pc.hasErectNipples() ? "engorge" : "moisten") + " readily.");
				output("\n\nRelaxed and slightly light-headed now, you don’t mind that walking alongside Quaelle necessitates going at an arthritic pace.");
				processTime(2);
				// +Lust
				pc.changeLust(5);
				// goto pods intro
				addButton(0, "Next", breedwellInduction, "pods intro");
			}
			break;
		case "male":
			if (quaelleReplacedWithDohrahn())
			{
				output("<i>“Right. Yes. Induction.”</i> The do’rahn rubs her temples and sighs. <i>“Look, you’re a " + pc.mf("guy","girl") + " who’s seen a lot of action. You wouldn’t be here if that wasn’t the case. So I’ll just give you the lowdown from here, ok? It’s very simple.”</i>");
				output("\n\n<i>“Go through the door to the east. You’ll see some cabins attached to some big glass cylinders. Just go in there, whip your schlong out and go nuts. There’s porn, a prostate milker if you really want. Just make sure your sperm goes into the cylinder at the end. You’ll get paid according to how much you give us. Got it? Great.”</i>");
				output("\n\nShe returns to her monitor before you can respond.");
				if (flags["BREEDWELL_STATUS_DONATOR"] == undefined) flags["BREEDWELL_STATUS_DONATOR"] = 1;
				addButton(14, "Leave",mainGameMenu,undefined);
			}
			else
			{
				output("<i>“Let’s go to the extraction chambers, shall we?");
				if(!pc.hasPheromones()) output(" That’s where we’ll need a trembulent young " + pc.mf("man", "ladyboy") + " such as yourself, after all!");
				else output(" Those hormones of yours are almost making me dizzy, ooh, goodness me. We could do with getting you into a donation cubicle straight away!");
				output("”</i>");
				output("\n\nQuaelle nestles a touch tablet into her arm and undulates her way from around the counter. The way the roehm moves is slow but rather hypnotic, waves of motion following each other down her great, soft side, gradually sliding her slimy bulk forward. She draws you close to her with a friendly touch of the shoulder, and the buttery smell of caramel wafts over you, leaving you feeling... horny? Sweet heat sinks down to [pc.eachCock] and your [pc.nipples] " + (pc.hasErectNipples() ? "engorge" : "moisten") + " readily.");
				output("\n\nRelaxed and slightly light-headed now, you don’t mind that walking alongside Quaelle necessitates going at an arthritic pace.");
				processTime(2);
				// +Lust
				pc.changeLust(5);
				// goto semen intro
				addButton(0, "Next", breedwellInduction, "semen intro");
			}
			break;
		case "herm":
			if (quaelleReplacedWithDohrahn())
			{
				output("<i>“Right. Yes. Induction.”</i> The do’rahn rubs her temples and sighs. <i>“Look, you’re a herm who’s seen a lot of action. You wouldn’t be here if that wasn’t the case. So I’ll just give you the lowdown from here, ok? It’s very simple.”</i>");
				output("\n\n<i>“Go through the door to the east. You’ll see some cabins attached to some big glass cylinders. Just go in there, whip your schlong out and go nuts. There’s porn, a prostate milker if you really want. Just make sure your sperm goes into the cylinder at the end. You’ll get paid according to how much you give us. Or go through the door to the south. You’ll see some pods with chairs built into them. Just sit yourself down in one of them and relax, the machine will take care of the rest. The rahn donors have been told to be gentle with you, although that doesn’t mean they won’t get over-excited. You’ll get paid half once you’re full, and the other half once you’ve actually delivered them. Got it? Great.”</i>");
				output("\n\nShe returns to her monitor before you can respond.");	
				if (flags["BREEDWELL_STATUS_BREEDER"] == undefined) flags["BREEDWELL_STATUS_BREEDER"] = 1;	
				if (flags["BREEDWELL_STATUS_DONATOR"] == undefined) flags["BREEDWELL_STATUS_DONATOR"] = 1;	
				addButton(14, "Leave",mainGameMenu,undefined);
			}
			else
			{			
				output("<i>“And where shall we go first?”</i> Quaelle folds her arms underneath her titanic breasts and leans back, gazing at you with a grin which only seems to get wider. <i>“Because luckily for us, you’re equipped to help us whichever way you like! Would you like to be introduced to the breeding pods first, or the semen extractors?”</i>");
				processTime(1);
				// [Pods] [Extractors]
				addButton(0, "Pods", breedwellInduction, "pods");
				addButton(1, "Extractors", breedwellInduction, "extractors");
			}
			break;
		case "pods":
			output("Quaelle nestles a touch tablet into her arm and undulates her way from around the counter. The way the roehm moves is slow but rather hypnotic, waves of motions following each other down her great, soft side. She draws you close to her with a friendly touch of the shoulder, and the buttery smell of caramel wafts over you, leaving you feeling... horny? Sweet heat sinks down to [pc.eachVagina] and your [pc.nipples] " + (pc.hasErectNipples() ? "engorge" : "moisten") + " readily.");
			output("\n\nRelaxed and slightly light-headed now, you don’t mind that walking alongside Quaelle necessitates going at arthritic pace.");
			processTime(2);
			// +Lust
			pc.changeLust(5);
			// goto pods intro
			addButton(0, "Next", breedwellInduction, "pods intro");
			break;
		case "extractors":
			output("Quaelle nestles a touch tablet into her arm and undulates her way from around the counter. The way the roehm moves is slow but rather hypnotic, waves of motion following each other down her great, soft side, gradually sliding her slimy bulk forward. She draws you close to her with a friendly touch of the shoulder, and the buttery smell of caramel wafts over you, leaving you feeling... horny? Sweet heat sinks down to [pc.eachCock] and your [pc.nipples] " + (pc.hasErectNipples() ? "engorge" : "moisten") + " readily.");
			output("\n\nRelaxed and slightly light-headed now, you don’t mind that walking alongside Quaelle necessitates going at arthritic pace.");
			processTime(2);
			// +Lust
			pc.changeLust(5);
			// goto semen intro
			addButton(0, "Next", breedwellInduction, "semen intro");
			break;
		case "pods intro":
			// PC to Breedwell Pod Lounge
			moveTo("BREEDWELL_LOUNGE");
			
			output("She leads you through the south door, the dryer, sterile air in the corridor almost a relief from the muggy heat of reception.");
			output("\n\n<i>“I’ve got the mods a roehm needs to go a long time outside of wet environments,”</i> Quaelle says, as if she’s read your mind. <i>“But the rahn overseers insisted on making my workplace, as well as my rooms, adapted to my tastes. So flickerful of them!”</i> You’ve reached another large set of double doors, but Quaelle leads you up a ramp set to one side to a smaller door, which she opens with a swipe of her lanyard pass. <i>“Secretly though, Steele... they love reception being like that. Their membranes become so shimmerlent when they visit me! Rahn are swamp creatures at heart too, you know.”</i>");
			output("\n\nYou are led into a narrow, tube-shaped room, reinforced plexiglass on all sides providing a view of the sand-colored gas giant outside one way, and into the room below on the other. In this comfortable lounge are many different rahn, a dropped jelly bean bowl discombobulation of them, chatting with each other and scrolling through what appear to be digital catalogues. Quaelle gestures at some screens set below the window that enable you to get a closer look at them. Though the rahn are a multi-hued and many-shaped race, these all seem to share one thing in common: for want of a better word, randiness. Their faces are flushed, they speak and gesture eagerly and frenetically, and they all look slightly swollen around the midriff.");
			output("\n\n<i>“The rahn government wishes to oversee a grand colonization effort in this frontier rush,”</i> says Quaelle, the smell of caramel enveloping you as she oozes close to your side. <i>“But to colonize, you need numbers. For numbers - if you are the rahn - you need surrogates. Fizzy, lambent surrogates, lots and lots of them. For those... a partnership with Tamani Corp helps.”</i>");
			output("\n\nShe points down to a close frame of one, a big wobbly loo’rahn dressed in loose-fitting business clothes who’s pressed a tick box next to a picture of a female ovir on her catalogue. On the far wall of the lounge there is a long series of doors with darkened displays above them. One lights up, displaying a number. The loo’rahn hurries across and disappears inside.");
			output("\n\n<i>“So you want me to be a... surrogate?”</i> you say. <i>“Let rahn lay their eggs in me, carry them to term?”</i>");
			output("\n\n<i>“That’s more or less it!”</i> replies Quaelle happily. <i>“Mate with vibrantic gel women, bear their oscillacious babies, and get paid for it. Doesn’t that sound like a dream job?”</i>");
			output("\n\nShe presses a button on the monitor, and the view changes to what is evidently the small room the loo’rahn just disappeared into. She has her skirt down, her big bum pointing up to the camera, and she is absolutely pounding the petite, green-scaled ovir you saw in the catalogue with her long, bulging ovi-dick. The ovir is naked and in a strange harness-like contraption that fixes her into the wall, holding her legs backwards, her arms out to the side and completely exposing her pussy. You can’t really tell more details than that because she’s smothered in over-stimulated, jiggly orange gel - except for her head, which is just about poking up above the loo’rahn’s shirt-covered boobs. Her face is a rictus of sexual delirium.");
			processTime(5);
			// +Lust
			pc.changeLust(5);
			// <pb>
			addButton(0, "Next", breedwellInduction, "pods next");
			break;
		case "pods next":
			output("<i>“You record this?”</i> you say, watching the frantic fuck session in progress. There’s no sound, but both the rahn and the ovir’s mouths are lolled open and they must be making a hell of a racket in there. <i>“And I’d have to be bound like that?”</i>");
			output("\n\n<i>“Emmm... yes. But that’s such a sourtonous way of putting it, Steele,”</i> Quaelle replies, charm bracelets rattling. <i>“Tamani are testing these prototype wall bracers here because not only do they believe they increase chances of conception, but they make things incredibly efficient in facilities like these. Watch!”</i>");
			output("\n\nIn the cubicle, the one-sided liaison has come to a messy conclusion. Glued to her partner with her own spooge, the plump loo’rahn spends a short while resting on top of the ovir, before whispering something with a smile in the reptile girl’s ear-hole and slowly withdrawing her truncheon-like ovipositor. The ovir’s twat is gaped and leaking with honey-like fluid, and her own once-slim stomach is now swollen with eggs.");
			output("\n\nThe rahn picks up her clothes and heads through a side door without further ado, to what looks like a well-appointed shower room. The moment she’s gone, nimble robot limbs telescope down from the ceiling and briskly clean and dry the stuck, panting ovir with sprays of water and air and a brisk towel wand.");
			output("\n\n<i>“Prototype pheromone treatment,”</i> Quaelle points to one of the jet sprays. <i>“Seems to be working well. Drives our rahn absolutely shiverous, anyway!”</i>");
			output("\n\nThe ovir balloons out her cheeks, exhaling long and hard when the cleansing is done and the servo-limbs have lifted back into the ceiling, leaving her looking rosy, without a trace of orange goo on her - and then the main door slides open, allowing a sporty-looking zel’rahn to stride in. She rubs her hands as she takes in the ovir, and swiftly begins to remove her jogging pants.");
			output("\n\n<i>“We try and fit in as many potential couplings per session as possible,”</i> explains Quaelle. <i>“And, emmm, you may be asked to do a bit of prep work sometimes, like this lucky young lady is.”</i> The rahn has clambered up over the ovir’s head with the help of some handles and is in the process of athletically thrusting her red pussy into the surrogate’s face. <i>“That’s why we reached out for provenly trembulent and fertile persons such as yourself, Steele. Although there’s different grades of surrogates - perhaps we’ll talk about that later - your willingness and fruitfulness is an absolute guarantee to our rahn patrons. As for recordings...”</i>");
			output("\n\nThe matronly gastropod taps the console’s interface a couple more times. You are treated to a split screen of many scenes similar to those you’ve just seen, but now cut, edited and displayed lovingly from many different angles. The ovir’s previous encounter is already in there. Quaelle pulls it up. ANOTHER HONEY PIE DELIVERED BY TAMANI! reads a speech bubble above a thumbs-upping cartoon of the pink-and-green CEO, as the loo’rahn throws her head back, moans and blows her egg-filled load into the ovir.");
			output("\n\n<i>“It’s all repackaged into advertisements and erotica for Tamani,”</i> Quaelle says, knitting her fingers and gazing at you with her brilliant, eerie eyes. <i>“It’s the principle way they’re paying for this station - and you, of course. You’ll become quite famous, shiverous Steele! Emmm, if you agree to keep coming back. Return surrogates get popular, and so get paid more. Different grades. We’ll talk about it later.”</i>");
			processTime(9);
			// +Lust
			pc.changeLust(5);
			// <pb>
			addButton(0, "Next", breedwellInduction, "pods done");
			break;
		case "pods done":
			// PC to Breedwell Reception square
			moveTo("BREEDWELL_RECEPTION");
			
			output("Quaelle oozes back towards reception, leaving a thin, quickly-drying slime trail behind her. She doesn’t turn off the monitor, nor ask you to come with her. Perhaps because they move so slow, roehm have different etiquette when it comes to leaving, well aware other races will finish whatever they’re doing and quickly catch them up. Certainly,");
			// extremely low Reflexes:
			if(pc.RQ() < 10) output(" even");
			output(" you could spend another two minutes watching amateur rahn porn here and get back to reception before her.");
			// Brute/Bimbo:
			if(pc.isBimbo() || pc.isBro()) output(" Which is, of course, exactly what you do. You leave a slight amount of drool on the monitor when you do reluctantly leave the observation chamber, heavy, unrequited lust throbbing through your loins.");
			output("\n\n<i>“So then!”</i> says Qualle, once you are enveloped back in the green, sultry fug of reception. She reaches beneath her desk and hands you a holo-light contract. <i>“What do you think? Oh, I am so hoping such a pulseful and flavorsome young " + pc.mf("boy", "lady") + " as yourself is willing to help the rahn with their great effort!”</i>");
			processTime(3);
			// [Sign] [Don’t Sign]
			addButton(0, "Sign", breedwellInduction, "pods sign");
			addButton(1, "Don’t Sign", breedwellInduction, "don't sign");
			break;
		case "pods sign":
			output("You came here to get jiggy with jelly girls and get real paid doing so, and that’s exactly what you intend to do. Quaelle’s peaceful expression broadens into a tropical summer of a smile as you scribble your signature below the stipulations.");
			output("\n\n<i>“Excellent. Oh, I’m so pleased, vibrant, vacillicious Steele! That sets you up as a beginner surrogate.");
			if(!pc.hasCock()) output(" And a sperm donor, should you grow the equipment needed for that!");
			output(" You may use the pods as you please. You’ll receive a small sum whenever you do, and a larger one upon the successful delivery of your rahn babies. Don’t worry about where you have them - Breedwell will find you!”</i>");
			output("\n\nThe roehm sighs happily, double pupils orbiting back to her monitors.");
			output("\n\n<i>“Now then. Would you like to sit and chat some more? I imagine you’re dying to get into a pod and started, though. I know I would be!”</i>");
			processTime(2);
			
			flags["BREEDWELL_STATUS_BREEDER"] = 1;
			
			// [Talk] [Appearance] [Leave]
			quaelleMainMenu();
			break;
		case "semen intro":
			// PC to Breedwell Sperm Donation Bay
			moveTo("BREEDWELL_DONATION");
			
			output("She leads you through the east door, the dryer, sterile air in the corridor almost a relief from the muggy heat of reception.");
			output("\n\n<i>“I’ve got the mods a roehm needs to go a long time outside of wet environments,”</i> Quaelle says, as if she’s read your mind. <i>“But the rahn overseers insisted on making my workplace, as well as my rooms, adapted to my tastes. So flickerful of them!”</i> You’ve reached another large set of double doors, but Quaelle leads you up a ramp set to one side to a smaller door, which she opens with a swipe of her lanyard pass. <i>“Secretly though, Steele... they love reception being like that. Their membranes become so shimmerlent when they visit me! Rahn are swamp creatures at heart too, you know.”</i>");
			output("\n\nYou are led into a narrow, tube-shaped room, reinforced plexiglass on all sides providing a view of the vacuum of space one way, and into the larger room below on the other. It’s sparsely populated by a few rahn staff chatting with some non-rahn visitors, kui-tan, humans and the like. There is a long row of cubicles at one end, connected to a series of great, glass cylinders. Most of them are empty, but a couple swirl with heavy, off-white fluid.");
			output("\n\n<i>“The rahn government wishes to oversee a grand colonization effort in this frontier rush,”</i> says Quaelle, the smell of caramel enveloping you as she oozes close to your side. <i>“But to colonize, you need numbers. For numbers - if you are the rahn - you need donors. Throbulous, lambent donors, lots and lots of them. For those... a partnership with Tamani Corp helps.”</i>");
			output("\n\nThere are monitors fixed below the window, and Quaelle presses one on. You are treated to a view inside one of the cubicles. A well-built dober-sar is clutching two handles fixed into the wall and thrusting his brown, thoroughbred hips into a pink, synthetic hole in the wall, similar in appearance to the New Texan cockmilker. His red, bulging knot bumps against it again and again, his thick cock rooting deep inside.");
			processTime(5);
			// +Lust
			pc.changeLust(5);
			// <pb>
			addButton(0, "Next", breedwellInduction, "semen next");
			break;
		case "semen next":
			output("<i>“You record this?”</i> you say, watching the sweating, pointy-eared doggie go.");
			output("\n\n<i>“Of course!”</i> replies Quaelle happily. <i>“Tamani Corp want to make absolutely sure their new generation of extractors are to everyone’s satisfaction. And to analyze what type of stimulation is the most effective.”</i>");
			output("\n\nShe gestures at the monitor. The ausar has paused his humping for a moment, and is tapping on an interface mounted on the wall next to the automated gloryhole. A robotic arm telescopes down from the ceiling, a small pink dildo attached. At the same time, a flat screen appears above the cockmilker, lively with lurid action. It’s a scene featuring a petite, blonde-haired, pink-lipped human boi and three rather bestial-looking ausar hunks. The ausar are not being gentle. The donor in the cubicle stares into the screen at the same time as the dildo nestles itself between his muscular ass cheeks and begins to pump rhythmically. If you thought he was pounding the cockmilker with everything he had before, you were wrong.");
			output("\n\n<i>“Ooh my,”</i> hums Quaelle, watching with you. <i>“So vigorous and shiverous! Hopefully we’ll get a good sample from him today. Theeerre we go.”</i> The ausar throws his head back and howls a silent howl on the monitor, cords of muscle standing out on his neck. Thick semen gouts into the glass cylinder in front of him, eventually covering the bottom, at least a couple of liters or so.");
			output("\n\n<i>“Not bad,”</i> adjudges the roehm, watching the ausar slowly stagger back, wobbly-legged. <i>“But I’m sure you could give us soooo much more, couldn’t you, fulbullent Steele? I know you could!”</i>");
			processTime(9);
			// +Lust
			pc.changeLust(5);
			// <pb>
			addButton(0, "Next", breedwellInduction, "semen done");
			break;
		case "semen done":
			// PC to Breedwell Reception square
			moveTo("BREEDWELL_RECEPTION");
			
			output("Quaelle oozes back towards reception, leaving a thin, quickly-drying slime trail behind her. She doesn’t turn off the monitor, nor ask you to come with her. Perhaps because they move so slow, roehm have different etiquette when it comes to leaving, well aware other races will finish whatever they’re doing and quickly catch them up. Certainly,");
			// extremely low Reflexes:
			if(pc.RQ() < 10) output(" even");
			output(" you could spend another two minutes watching guys and herms jizz themselves silly here and get back to reception before her.");
			// Brute/Bimbo:
			if(pc.isBimbo() || pc.isBro()) output(" Which is, of course, exactly what you do. You leave a slight amount of drool on the monitor when you do reluctantly leave the observation chamber, heavy, unrequited lust throbbing through your loins.");
			output("\n\n<i>“So then!”</i> says Qualle, once you are enveloped back in the green, sultry fug of reception. She reaches beneath her desk and hands you a holo-light contract. <i>“What do you think? Oh, I am so hoping such a pulseful and flavorsome young " + pc.mf("boy", "lady") + " as yourself is willing to help the rahn with their great effort!”</i>");
			processTime(3);
			// [Sign] [Don’t Sign]
			addButton(0, "Sign", breedwellInduction, "semen sign");
			addButton(1, "Don’t Sign", breedwellInduction, "don't sign");
			break;
		case "semen sign":
			output("So basically this gig is a much-improved experience to the one you’ve been treating yourself to on New Texas? Gee, what a difficult decision this is. Quaelle’s peaceful expression broadens into a tropical summer of a smile as you scribble your signature below the stipulations.");
			output("\n\n<i>“Excellent. Oh, I’m so pleased, vibrant, vacillicious Steele! That sets you up as a donor.");
			if(!pc.hasVagina()) output(" And a beginner surrogate, should you grow the equipment needed for that!");
			output(" You may come and use the extractors once per day, and will receive your payment then. That’s to stop the kui-tan going crazy with them. " + (pc.raceShort() == "kui-tan" ? "We know what you’re like!" : "You know what they’re like!") + "”</i>");
			output("\n\nThe roehm sighs happily, double pupils orbiting back to her monitors.");
			output("\n\n<i>“Now then. Would you like to sit and chat some more? I imagine you’re dying to get into a cubicle, though. I hope you are, anyway!”</i>");
			processTime(2);
			
			flags["BREEDWELL_STATUS_DONATOR"] = 1;
			
			// [Talk] [Appearance] [Leave]
			addButton(0, "Next", mainGameMenu);
			break;
		case "don't sign":
			if(pc.isAss()) output("Bluntly");
			else if(pc.isMischievous()) output("Dryly");
			else output("Politely");
			output(", you tell her you are not down for work quite as degrading as this.");
			output("\n\n<i>“I understand, stillomnous Steele,”</i> replies Quaelle " + (rand(2) == 0 ? "diplomatically" : "calmly") + ", pulling the contract back towards her, although notably not putting it away. <i>“This job does require a certain, emmm... open mindedness. But! The offer will remain open, for awhile at least. And I know what life is like for bright-burning, vibrocious young things on the frontier. Once - sorry, if you are in desperate need of money, you know where to come.”</i>");
			processTime(1);
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Talk
public function quaelleTalk(response:String = "intro"):void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	clearMenu();
	addButton(0, "Rahn", quaelleTalk, "rahn", "Rahn", "Ask why they’re so interested in pumping out babies.");
	addButton(1, "Roehm", quaelleTalk, "roehm", "Roehm", "Ask her about her race.");
	addButton(2, "Her", quaelleTalk, "her", "Her", "Ask of the Breedwell Matron herself.");
	addButton(14, "Finish", quaelleTalk, "finish", "Finish", "Wrap up chatting with Quaelle.");
	
	switch(response)
	{
		case "intro":
			output("<i>“Alright just to talk?”</i> you ask.");
			output("\n\n<i>“Of course!”</i> Quaelle calls across her chief aide, a serious-looking doh’rahn, to take her place, then slides out from behind reception and leads you to a leafy cove off of main reception. This whole process takes five minutes.");
			output("\n\n<i>“Would you like a drink? Some cushions?");
			// Noticeably pregnant:
			if(pc.isPregnant() && pc.bellyRating() >= 30) output(" In your state you should be taking things as gently as possible, you know.");
			output(" Now then--”</i> the roehm settles herself down in amongst the creeping vines, antennae undulating idly. The smell of caramel is quite heavy in here. <i>“Hmm. What would you like to know, shiversome Steele?”</i>");
			// +5 minutes
			processTime(5);
			// [Rahn] [Roehm] [Her] [Finish]
			break;
		case "rahn":
			if (quaelleTalkStage() != 1)
			{
				// Part 1
				output("<i>“Why exactly are the rahn doing all this?”</i> you ask. <i>“It must be costing them loads to maintain this station, not to mention all the kids they’re producing.”</i>");
				output("\n\n<i>“The logic behind it is straightforward and monoceptive really, Steele,”</i> says Quaelle, pushing her charms further up her wide arms. <i>“The rahn are fairly new arrivals on the galactic scene. They were only discovered in the last galactic rush, and they were at a fairly primitive stage then.");
				if(silly) output(" We’re talking level 1 trash mobs here.");
				output(" Sooooo, they’ve been working hard at catching up, now that they’re full members of the U.G.C. But no matter how hard you work your cute jelly tush, you’re never going to have the same sort of influence in the U.G.C. as humans and ausar do. Demographics, finances, vested interests: they are all stacked against you. Galactic rushes present an opportunity to the rahn and other such, emmm, minor races. For everyone to stop calling them minor.”</i>");
				output("\n\nShe pauses and pulls some leaves off the nearest vine, transferring them to her mouth. You’re left watching, and eventually fiddling with your codex, as the roehm placidly munches on them, politely swallowing before continuing.");
				output("\n\n<i>“Sorry, judderific Steele. These little chats are also my lunch breaks. And I need lots of those. What were we talking about? Oh yes!”</i> She claps. <i>“Fluctulicious rahn, and why we’re helping them make more of them. As if we really need a reason!”</i>");
				output("\n\n<i>“But, yes. The more planets and sectors you control, the more representatives you can have in the Galactic Senate. But gaining planets and sectors is not easy, emmmm, until a Frontier Rush comes along. The rahn have been gearing up for this for decades. Stockpiling credits, picking out livable and terraformable planets that will be linked to warp gates that they intend to swamp with colonists. The lil’ brown rock you saw coming in, that’s just one of a dozen. We’re sending rahn kids to care centres all over the frontier!”</i>");
				output("\n\n<i>“So this is an artificial baby boom?”</i> you say wonderingly. <i>“Hundreds of rahn being brought into this world, purely for political purposes?”</i>");
				output("\n\n<i>“Just because it has a political purpose doesn’t make it wrong, throbbose Steele,”</i> replies Quaelle placidly. <i>“Having little Senatorial representation means being exploited or outright owned by one of the major corporations, or vassalized by one of the more established and aggressive races. The rahn wish not to be so much at the mercy of others anymore. They have had three centuries sampling what that is like. Rahn born now will be proud of what they did for their people, just by existing.”</i>");
				output("\n\nShe folds some more leaves into her mouth. <b>You get the impression that Quaelle has perhaps more to say on this subject, but she’s done talking about it for now. There’s a very purposeful air to her munching.</b>");
				if (flags["QUAELLE_TALK_RAHN"] == undefined) flags["QUAELLE_TALK_RAHN"] = GetGameTimestamp();
				processTime(7);
			}
			if (quaelleTalkStage() > 0)
			{	
				quaelleTalkRahnPart2();				
			}
			addDisabledButton(0, "Rahn");
			break;
		case "roehm":
			if (quaelleTalkStage() != 1)
			{
				// Part 1
				output("<i>“You’ve never met any roehm before?”</i> Quaelle grins widely. <i>“Perhaps that is not so surprising. We need warm, wet environments to be comfortable. Such as--”</i> She opens her arms to the sweltering haze of the room you’re in. <i>“Otherwise we start shrivelling up. On our first trip out from Hdar-Roe, me and my friends went without our climate suits into a human/ausar starport, just to see what it was like. Ugh! Never again. I do not know how you febrilicious, erratisome creatures stand the dryness. Your skin must be so numb and deadened to taste and smell. It is very mellible to think of it.”</i>");
				output("\n\nShe pauses a moment to pluck some leaves off a nearby vine, and munches on them with obvious enjoyment. One thing you definitely are learning about the roehm is that you’re going to have to be patient if you’re going to spend time around them.");
				output("\n\n<i>“So then! Us,”</i> Quaelle says, once she’s politely swallowed away her cud. <i>“Emmm, one of the really important differences between us and most other people is that we have no ears.”</i> She lifts her conch-like hat to reveal she’s bald, her smooth, yellow skin unbroken all the way around her scalp and down to her neck. <i>“We have these instead!”</i> She replaces her hat and strokes her six blue-tipped antennae with an exaggerated sweep. <i>“And they’re just as good!”</i> This is receiving a lesson on basic anatomy from a kindergarten teacher. Although perhaps a kindergarten teacher wouldn’t have huffed with such obvious sensual enjoyment when she touched her wiggling cilia like that.");
				output("\n\n<i>“The difference comes across in our translation chips,”</i> she goes on. <i>“When you describe <i>hearing</i> something, what I must sound like to you, I only have a partial understanding of what that must be like... so the words come out garbled, the Babelware doing its best to translate what you’re trying to express.”</i> She laughs. It’s a series of giggly <i>“hmms”</i>, one every two seconds. <i>“It’s so funny sometimes! So vivicious and fluctacular!”</i>");
				if(pc.isNice()) output("\n\n<i>“If you don’t mind me asking - is it not frustrating, moving so much slower than everyone else?”</i>");
				else if(pc.isMischievous()) output("\n\n<i>“You’re so slow, though!”</i> you teasingly exclaim, enjoying being able to cut loose and laugh at one other, strange aliens that you are. <i>“How annoying that must be!”</i>");
				else if(pc.isAss()) output("\n\n<i>“I don’t think I’d be able to stand moving as slow as you do,”</i> you remark.");
				output("\n\nQuaelle shrugs, a great ripple of soft flesh, her bust quivering slightly.");
				output("\n\n<i>“It’s a matter of perspective,”</i> she replies, still gazing at you with her apparently imperturbable air of condescending kindness. <i>“We live for hundreds upon hundreds of years naturally, and always aim to be in the most pleasant of places and occupations. There is time enough for everything. Whereas you...”</i> She sighs. <i>“If you do not mind me saying, shiverous Steele, we find you dry and fleet things rather tragic.”</i>");
				output("\n\nShe pushes some more leaves into her mouth with obvious satisfaction. <b>You get the impression that Quaelle has perhaps more to say on this subject, but she’s done talking about it for now. There’s a very purposeful air to her munching.</b>");
				if (flags["QUAELLE_TALK_ROEHM"] == undefined) flags["QUAELLE_TALK_ROEHM"] = GetGameTimestamp();
				processTime(5);
			}
			if (quaelleTalkStage() > 0)
			{	
				quaelleTalkRoehmPart2();				
			}
			addDisabledButton(1, "Roehm");
			break;
		case "her":
			if (quaelleTalkStage() != 2)
			{
				// Part 1
				output("<i>“Me?”</i> Quaelle laughs, boobs quaking gently. <i>“Hmm. Hmm. Hmm. And why would you want to know about me particularly, oscillious Steele?”</i> she teases, leaning forward slightly. The smell of caramel intensifies, the sweetness seeming to reach into your [pc.skinFurScales] - and down to your groin,");
				if(pc.hasCock()) output(" [pc.eachCock] hardening helplessly");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" [pc.eachVagina] moistening readily");
				output(". <i>“You forget that I have a file on you. And we picked you exactly because of your, emmm, profligacy. Do you wish to flirt? Shiver sweet nothings into my antennae? Do you think if you exhaust all conversation with me, I will then be obliged to sweep you into my arms?”</i> Whether it’s the humid heat or the truth of her words, you blush, and she laughs again winningly. (Still. Wasn’t there just a hint of a come-on there?)");
				output("\n\n<i>“Aww. I’m sorry, quiverful Steele,”</i> the roehm says, sobering slightly and leaning back again. <i>“I have all of your information at my fingertips, and yet I tease you when you ask something of me. That’s mean.”</i>");
				output("\n\nQuaelle reaches out, tears a handful of leaves from a creeper and folds them into her mouth. She chews with her brilliant double eyes elsewhere, mind apparently elsewhere.");
				output("\n\n<i>“Well,”</i> she continues once she’s swallowed, <i>“I come from Hdar-Roe itself. So beautiful and thrombulent, Steele! The mucus falls! The moss symphonies and the Viscerous Palace! You MUST visit when you get the chance. I’ll take you.”</i> She has the enthusiasm of a fresh-faced teacher who’s just thought of a great field trip. <i>“But even before I was 5, I was restless. I wanted to see the galaxy! I’ve always been like that, even outside my full years. My dad was a cundarian - my mom <i>thinks</i> anyway, she went a bit wild during some of her own full years - and she thinks I inherited that from him.”</i>");
				output("\n\n<i>“I was subcontracted by Tamani to be Head of PR here, as soon as the Great Effort really began. We Roehm are supposed to very good in these sorts of roles - which is a liiiiittle bit insulting. The telepathic slug thing, you know. Hmm!”</i> she harrumphs, cilia wiggling fitfully. <i>“It only requires a bit of empathy to tell whether someone wants a cup of protein, a hug, or to be left alone, you know.”</i>");
				output("\n\n<i>“I’d built up some cash from stocks - it’s easy to do if you’re patient, you know - and used it to give myself a couple of mods. Like these!”</i> She casually hefts one of her huge, pendulous breasts, fingers disappearing as she squeezes it slightly. <i>“Breasts have always seemed to me like the most roehm-like part of aliens - so soft and loving and trembulent. People have been so much more likely to agree to do what I ask them to do since I grew them, too! Also the sweet scent, I’m sure you’ve noticed.”</i> She extends her palm and blows across it towards you, billowing caramel over your face. <i>“It’s for the kids in the nursery, mainly. If you smell like candy, they’re a lot more obedient. And more likely to give hugs!”</i>");
				processTime(8);
				if(flags["QUAELLE_TALKED_HER"] == undefined)
				{
					output("\n\n<i>“Speaking of which...”</i> Quaelle pauses, hands knitted, gazing at you. There’s an unusual tension on her erstwhile calm and pleasant face; an urge breaking loose of a certain timidity. <i>“You asked about me, and I’ve always felt you get to know and bond with someone much better by hugging than by talking. My people do it all the time, twine antennae, but - well. I know others don’t always appreciate being hugged by a roehm. Expensive clothes, and so on. I certainly learned that on my first trip away from Hdar-Roe.”</i>");
				
					flags["QUAELLE_TALKED_HER"] = 1;
				
					// [Hug] [Don’t Hug]
					clearMenu();
					addButton(0, "Hug", quaelleTalk, "hug", "Hug Her", "She looks awfully soft.");
					addButton(1, "Don’t Hug", quaelleTalk, "no hug", "Don’t Hug Her", "She looks awfully wet.");
				}
				else
				{
					output("\n\nShe pushes some more leaves into her mouth with obvious satisfaction.");
					if(flags["QUAELLE_HUGGED"] != undefined) output(" <b>You get the impression that Quaelle has perhaps more to say on this subject, but she’s done talking about it for now. There’s a very purposeful air to her munching.</b>");
					addDisabledButton(2, "Her");
				}
				//note QUAELLE_TALK_HER is a different flag than QUAELLE_TALKED_HER
				if (flags["QUAELLE_TALK_HER"] == undefined) flags["QUAELLE_TALK_HER"] = GetGameTimestamp();
			}
			if (quaelleTalkStage() > 1)
			{	
				quaelleTalkHerPart2Intro();				
			}
			break;
		case "no hug":
			output("<i>“I understand, solemnious Steele,”</i> says Quaelle soothingly, when you turn her down. <i>“My role is to make you comfortable here, not pander to my own silly desires. I won’t bring it up again.”</i>");
			output("\n\nShe inhales another handful of leaves, apparently unperturbed.");
			processTime(1);
			addDisabledButton(2, "Her");
			break;
		case "hug":
			output("Without another word you get up, go around to her side of the table and, with a winning smile, open your arms to her. With a trilling ‘Emmm’ of pleasure, Quaelle draws you deep into her moist, warm and incredibly pillowy embrace,");
			if(pc.tallness <= 78) output(" pushing your face between her wide bosom");
			else output(" squeezing your [pc.chest] against her wide bosom, chin on her shoulder");
			output(". And wow, pillowy is the word. She’s like a giant sack of wet featherdown, apparently no end to her give. You squeeze her back the best you can.");
			output("\n\n<i>“Aww. Thank you so much, shiverous Steele!”</i> she says, once she’s released you. <b>You now have a wet imprint all the way down your front and, yes, you do smell like horny caramel.</b> <i>“I wish I could give hugs to everyone that passed through my reception. But most of my visitors move so fast, and don’t seem to realize how much they need one... I do hope you’ll keep coming back for them, Steele,”</i> she goes on, looking at you with a slightly more amorous, sly bend to her peaceful smile. <i>“Bodily contact, it’s so important for making the world a much better place.”</i>");
			processTime(2);
			// +Lust, Roehm Slimed status added, [Hug] option added in Quaelle main menu
			quaelleHugged();
			clearMenu();
			addButton(0, "Next", quaelleMainMenu);
			break;
		case "finish":
			output("You thank her for her time as she’s polishing off her last load of leaves.");
			output("\n\n<i>“I always have time, lumirific Steele,”</i> she replies pleasantly. <i>“So long as you’re willing to still your trembles for a little while. Take care!”</i>");
			processTime(1);
			quaelleMainMenu();
			break;
	}
}

public function quaelleHugged():void
{
	pc.lust(15);
	IncrementFlag("QUAELLE_HUGGED");
	
	// Roehm Slimed
	// Lasts 12 hours or until PC has a shower
	// Libido floor raised by +10%, Speed -5%, Tease effectiveness +15%
	pc.createStatusEffect("Roehm Slimed", 10, -5, 15, 0, false, "Icon_Splatter", "Direct physical contact with a roehm in heat results in stickiness, and smelling rather like an orgy in a vat of molasses.", false, 0, 0xB793C4);
	pc.addStatusValue("Roehm Slimed", 4, 1);
	pc.setStatusMinutes("Roehm Slimed", 720);
}
// Hug
// Option appears in main menu if PC hugged her the first time
public function quaelleGetAHug():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	var shorty:Boolean = (pc.tallness <= 78);
	
	output("<i>“Would you like a hug, hoverous Steele?”</i> says Quaelle, antennae twitching. <i>“Of course you would! Come here. There’s no need to be shy!”</i>");
	output("\n\nThe colorful, tropical alien opens her arms to you, and as slimy as it is it’s pleasure itself to wrap your arms around her and let your " + (shorty ? "face" : "chest") + " be squeezed " + (shorty ? "between" : "into") + " her huge bosom. It’s like being enveloped by a giant pillow that’s spent the last week being soaked in warm sugar water.");
	output("\n\n<i>“Theeeere we go,”</i> beams the roehm, when she finally releases you. <b>You now have a wet imprint all the way down your front and, yes, you do smell like horny caramel.</b> <i>“Doesn’t that feel better? Whenever you would say <i>“It’s alright”</i> or <i>“Thank you”</i> to someone, hug them instead. You will express yourself 10 times better!”</i>");
	
	processTime(1);
	quaelleHugged();
	
	clearMenu();
	addButton(0, "Next", quaelleMainMenu);
}

// Create Rahn
public function getBreedwellRahnPregContainer(rahnType:int = 0):PregnancyPlaceholder
{
	var ppRahn:PregnancyPlaceholder = new PregnancyPlaceholder();
	
	ppRahn.removeCocks();
	switch(rahnType)
	{
		case 1:
			ppRahn.originalRace = "zel'rahn";
			ppRahn.skinTone = "red";
			ppRahn.createCock(6, 1);
			ppRahn.shiftCock(0, GLOBAL.TYPE_INHUMAN);
			ppRahn.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
			ppRahn.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
			break;
		case 2:
			ppRahn.originalRace = "loo'rahn";
			ppRahn.skinTone = "amber";
			ppRahn.createCock(5.5, 1.75);
			ppRahn.shiftCock(0, GLOBAL.TYPE_INHUMAN);
			break;
		case 3:
			ppRahn.originalRace = "go'rahn";
			ppRahn.skinTone = "white";
			ppRahn.createCock(8, 0.75);
			ppRahn.shiftCock(0, GLOBAL.TYPE_INHUMAN);
			break;
		case 4:
			ppRahn.originalRace = "doh'rahn";
			ppRahn.skinTone = "purple";
			ppRahn.createCock(7, 1.10);
			ppRahn.shiftCock(0, GLOBAL.TYPE_INHUMAN);
			break;
		case 5:
			ppRahn.originalRace = "fuu'rahn";
			ppRahn.skinTone = "blue";
			ppRahn.createCock(6, 1.5);
			ppRahn.shiftCock(0, GLOBAL.TYPE_CANINE);
			ppRahn.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
			break;
		case 6:
			ppRahn.originalRace = "go'rahn";
			ppRahn.skinTone = "white";
			ppRahn.createCock(18, 0.5);
			ppRahn.shiftCock(0, GLOBAL.TYPE_INHUMAN);
			ppRahn.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			break;
		case 7:
			ppRahn.originalRace = "fuu'rahn";
			ppRahn.skinTone = "turquoise";
			ppRahn.createCock(8, 1.5);
			ppRahn.shiftCock(0, GLOBAL.TYPE_INHUMAN);
			ppRahn.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
			break;
		default:
			ppRahn.originalRace = "rahn";
			ppRahn.skinTone = "iridescent";
			ppRahn.createCock();
			ppRahn.shiftCock(0, GLOBAL.TYPE_INHUMAN);
			break;
	}
	ppRahn.cocks[0].addFlag(GLOBAL.FLAG_GOOEY);
	ppRahn.cocks[0].addFlag(GLOBAL.FLAG_LUBRICATED);
	ppRahn.cocks[0].addFlag(GLOBAL.FLAG_OVIPOSITOR);
	ppRahn.cocks[0].cockColor = ppRahn.skinTone;
	ppRahn.cumType = GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO;
	
	ppRahn.impregnationType = "RahnPregnancyBreedwell";
	
	return ppRahn;
}

// [Pod]
// Rahn Breeding Mechanics
// PC receives 2 rahn eggs per breeding. PC receives 1-5 breedings per session. They obviously cannot use pods if all their wombs are occupado.
/*
	Modifier					No. of breedings
	Womb Egg Trainer Level		+1 every second level. e.g. +1 at level 2, +2 at level 4
	250%+ Fertility				+1
	Premium Breeder				+1
*/
public function eggBreederLevel(bWomb:Boolean = true):int
{
	var level:int = 1;
	if(flags["EGG_TRAINING"] >= 1) level++;
	if(flags["EGG_TRAINING"] >= 2) level++;
	if(flags["EGG_TRAINING"] >= 3) level++;
	if(flags["EGG_TRAINING"] >= 4) level++;
	if(pc.hasPerk("Broodmother")) level += 2;
	// Womb bonuses
	if(bWomb && pc.hasVagina())
	{
		var nFertility:Number = pc.fertility();
		if(nFertility >= 2.5) level++;
		if(nFertility >= 5) level++;
		if(nFertility >= 10) level++;
		if (flags["BREEDWELL_PREM_EGG_CAP_BONUS"] != undefined) level += flags["BREEDWELL_PREM_EGG_CAP_BONUS"];
	}
	
	return level;
}
public function breedwellBreederLevel():int
{
	var level:int = eggBreederLevel();
	if(flags["BREEDWELL_STATUS_BREEDER"] >= 2) level += 2;
	
	return level;
}
public function totalPregRahnEggs():int
{
	var nEggs:int = 0;
	for(var i:int = 0; i < pc.vaginas.length; i++)
	{
		if(InCollection(pc.pregnancyData[i].pregnancyType, ["RahnPregnancy", "RahnPregnancyBreedwell"])) nEggs += pc.pregnancyData[i].pregnancyQuantity;
	}
	return nEggs;
}
public function totalRahnPregnancies():int
{
	var nRahn:int = 0;
	for(var i:int = 0; i < pc.vaginas.length; i++)
	{
		if(InCollection(pc.pregnancyData[i].pregnancyType, ["RahnPregnancy", "RahnPregnancyBreedwell"])) nRahn++;
	}
	return nRahn;
}
// PC receives 300 credits for every egg they take after a session, then 600 credits for every rahn carried to term at birth.
public function breedwellApproachPod():void
{
	clearOutput();
	clearBust();
	author("Nonesuch");
	
	// Intros
	// If Lust <31 set to 31, otherwise ++Lust
	if(pc.lust() < 33) pc.changeLust((33-pc.lust()));
	else pc.changeLust(15);
	
	// First
	if(flags["BREEDWELL_TIMES_BRED"] == undefined)
	{
		output("Well... time to justify flying all the way out here, you guess. You approach one of the backward-facing chairs, one of the ones towards the end of the lounge, so no-one can see you fumbling around. You take off your [pc.gear] - there’s a handy clothing compartment situated next to every pod, that scans your thumbprint and locks away once you’re naked. You sit your bare [pc.butt] down on the padded seat and put your hands on the rests. A helmet-like scanner descends over your head and flickers a light across your eyes.");
		output("\n\n<i>“Welcome, [pc.name] Steele,”</i> a soothing voice says in your ear. <i>“Please relax as the Tamani Conceptuzal Harness MkV orientates you.”</i> Classical music begins to play as steel bands snap shut around your wrists");
		if(pc.hasLegs()) output(" and ankles,");
		else if(pc.isNaga() || pc.isGoo()) output(" and around your " + (pc.isNaga() ? "tail" : "gooey mass") + ",");
		else output(" and around your lower body,");
		output(" and the chair moves you backward into the wall, shutting securely in front of you. In the darkness of the cavity the machine spends a moment playing its flickering blue light over you - considering your weight and body type, perhaps - and then it turns you around");
		if(pc.hasLegs()) output(", pulling your [pc.legs] up and splaying them as it does so");
		else if(pc.isNaga()) output(", drawing the lower half of your tail to one side as it does");
		else if(pc.isGoo()) output(", drawing your goo away in clumps");
		output(". Your hands are fixed out to the side at about head-height, comfortable but immovable.");
		if(pc.isHerm()) output(" Your seat is craned ever so slightly so that [pc.eachCock] flop" + (pc.cocks.length == 1 ? "s" : "") + " onto your stomach and [pc.eachVagina] " + (pc.vaginas.length == 1 ? "is" : "are") + " made obvious and bare.");
		output("\n\nThus, with your [pc.chest] and [pc.eachVagina] completely exposed, it opens the wall to your designated cubicle and slides your bound form into the light. It finishes by extending a pheromone pen and giving you a quick spray across the thighs and collarbone. The faintly peachy smell wafts up your nostrils, and heat rises to your [pc.skinFurScales], your " + (pc.vaginas.length == 1 ? "pussy" : "pussies") + " becoming flush and wet with chemical arousal.");
		output("\n\n<i>“Thank you for choosing the Tamani Conceptuzal Harness, for all your sapient breeding needs,”</i> the voice says sweetly, as the classical music ends. <i>“You are now marked as available, [pc.name]. Remember: good breeders take it with a smile.”</i>");
		output("\n\nThe helmet retracts, and you’re left on your own in the small, sparsely furnished cubicle, to gaze at the door opposite and wait.");
		output("\n\nYou’re not made to wait particularly long, though.");
		
		processTime(14);
	}
	// Repeat non-premium
	else if(flags["BREEDWELL_STATUS_BREEDER"] < 2)
	{
		output("The process is slightly unnerving, but you’re used to it now. And - quietly - you’re rather beginning to enjoy it. You pack your [pc.gear] away in the thumbprint locker and sit your bare [pc.butt] down on a chair. The helmet descends over your eyes.");
		output("\n\n<i>“Welcome back, [pc.name] Steele,”</i> says the soothing voice. <i>“Please relax as the Tamani Conceptuzal Harness MkV orientates you.”</i> It starts to play a tune similar to the one you had on over the comms system as you made your way towards Wistral as it snaps its steel bands shut around your wrists");
		if(pc.hasLegs()) output(" and ankles");
		else if(pc.isNaga()) output(" and tail");
		else if(pc.isGoo()) output(" and goo");
		output(", and retracts you into darkness. It only takes a moment to scan you before it turns you around");
		if(pc.hasLegs()) output(", pulling your [pc.legs] up and splaying them as it does so");
		else if(pc.isNaga()) output(", drawing the lower half of your tail to one side as it does");
		else if(pc.isGoo()) output(", drawing your goo away in clumps");
		output(". Your hands are fixed out to the side at about head-height, comfortable but immovable.");
		if(pc.isHerm()) output(" Your seat is craned ever so slightly so that [pc.eachCock] flop" + (pc.cocks.length == 1 ? "s" : "") + " onto your stomach and [pc.eachVagina] " + (pc.vaginas.length == 1 ? "is" : "are") + " made obvious and bare.");
		output("\n\nAnd so, with your [pc.chest] and [pc.eachVagina] completely exposed, it opens the wall to your designated cubicle and slides your bound form into the light. It finishes by extending a pheromone pen and giving you a quick spray across the thighs and collarbone. The faintly peachy smell wafts up your nostrils, and you welcome the heat that rises to your [pc.skinFurScales], your " + (pc.vaginas.length == 1 ? "pussy" : "pussies") + " becoming flush and wet with chemical arousal.");
		output("\n\n<i>“Thank you for choosing the Tamani Conceptuzal Harness, for all your sapient breeding needs,”</i> the voice says sweetly, as the music ends. <i>“You are now marked as available, [pc.name]. Remember: good breeders take it with a smile.”</i>");
		output("\n\nThe helmet retracts, and you’re left on your own in the small, sparsely furnished cubicle, to gaze at the door opposite and wait.");
		output("\n\nYou’re never made to wait particularly long.");
		
		processTime(12);
	}
	// Premium
	else
	{
		output("9999");
		output("\n\n");
		output("\n\n");
		output("\n\n");
		output("\n\n");
		
		processTime(10);
	}
	
	var sceneList:Array = [];
	sceneList.push(1);
	sceneList.push(2);
	// Cock and/or lactating only 
	if(pc.hasCock() || pc.isLactating()) sceneList.push(3);
	sceneList.push(4);
	sceneList.push(5);
	sceneList.push(6);
	sceneList.push(7);
	
	var sceneCount:int = Math.min(breedwellBreederLevel(), 4);
	if(flags["BREEDWELL_STATUS_BREEDER"] >= 2) sceneCount++;
	
	clearMenu();
	addButton(0, "Next", breedwellPodScenes, [sceneList, sceneCount, 0]);
}
// Scenes
public function breedwellPodScenes(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	
	var sceneList:Array = arg[0];
	var sceneCount:int = arg[1];
	var numEggs:int = arg[2];
	var select:int = -1;
	
	// Selected at random
	if(sceneList.length > 0) select = sceneList[rand(sceneList.length)];
	else
	{
		output("ERROR: No scene exists!");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var vIdx:int = -1;
	var nonPregWombs:Array = [];
	var i:int = 0; 
	
	// Look for empty wombs.
	for(i = 0; i < pc.vaginas.length; i++)
	{
		if(!pc.isPregnant(i)) nonPregWombs.push(i);
	}
	if(nonPregWombs.length > 0) vIdx = nonPregWombs[rand(nonPregWombs.length)];
	if(vIdx < 0)
	{
		var rahnWombs:Array = [];
		// Then look for ongoing rahn pregnancies.
		for(i = 0; i < pc.vaginas.length; i++)
		{
			if(InCollection(pc.pregnancyData[i].pregnancyType, ["RahnPregnancy", "RahnPregnancyBreedwell"]) && pc.pregnancyData[i].pregnancyQuantity < (breedwellBreederLevel() * 2)) rahnWombs.push(i);
		}
		if(rahnWombs.length > 0) vIdx = rahnWombs[rand(rahnWombs.length)];
		// Otherwise, just choose a random vagina.
		if(vIdx < 0) vIdx = rand(pc.vaginas.length);
	}
	
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(select);
	
	switch(select)
	{
		case 1:
			showBust("BREEDWELL_ZELRAHN_SPORTY");
			
			output("The track-suited zel’rahn who strides in is slim and svelte by rahn standards, and has the confidence and ease about her of someone who’s done this any number of times before.");
			output("\n\n<i>“Oh hey,”</i> she croons, big grin plastered on her strawberry face, gazing at your helplessly exposed " + (pc.vaginas.length == 1 ? "pussy" : "pussies") + " as she shrugs off her top. <i>“Look at you!”</i> Casually she leans over you and trails her fingers backwards and forwards over your labia, flicking teasingly at your [pc.clit " + vIdx + "] before plunging her digits in deep.");
			switch(pc.vaginas[vIdx].type)
			{
				// Vanae/Gabilani:
				case GLOBAL.TYPE_VANAE:
				case GLOBAL.TYPE_GABILANI: output("\n\nThe rahn laughs with delight as you gasp and reactively tighten up, your pussy’s strong, " + (pc.vaginas[vIdx].type == GLOBAL.TYPE_VANAE ? "cilia-lined" : "muscular") + " walls kneading her fingers intently. <i>“What a cockmilker that is! On what world did you get that done, [pc.boy]? You know what, never mind.”</i> She places a warm, gooey hand over your mouth as she impatiently discards her bottoms, stroking her engorged, pointed barb-lined ovipositor with the other. <i>“I don’t wanna know. A bit of mystique makes the fucking better, you know?”</i>"); break;
				// Mouth:
				case GLOBAL.TYPE_MOUTHGINA: output("\n\n<i>“Wow,”</i> the rahn says wonderingly, tracing your lip-like labia and running her finger along the [pc.femcum]-sodden tongue. <i>“You know, I heard a couple of my more, um, semen-interested friends went in for this kind of thing. That how it is for you, [pc.boy]? D’you have someone who gives it to you in a doggie bowl every morning?”</i> The prospect seems to arouse her. Impatiently she discards her bottoms, stroking her extended, blunt barb-lined ovipositor. <i>“I’m afraid I don’t have that flavor of fun. But who knows. Maybe I can get you addicted to the taste of this, too...”</i>"); break;
				// Nyrea:
				case GLOBAL.TYPE_NYREA: output("\n\n<i>“The... thingy planet! Bugs!”</i> the rahn exclaims, as she traces the inside of your strange, inverted cum-canister, tips pushing against one of your sensitive, swollen pouches. <i>“I’ve read about these! You’ve got a pussy but you’re actually, like, a man-bug aren’t you?”</i> She looks up at you. <i>“" + (pc.isCuntboy() ? "Guess this kind of equipment suits a cuntboy down to the ground, huh?" : "Don’t look much like a man to me, though.") + "”</i> She discards her bottoms, stroking her extended, blunt barb-lined ovipositor as she continues to finger you. <i>“So: Guess I get to be the big, scary girl-bug who stuffs her sissy slave so full of eggs he can barely move, then. That’s cool.”</i>"); break;
				// Flower:
				case GLOBAL.TYPE_FLOWER: output("\n\n<i>“Pretty,”</i> she sighs wonderingly, sliding her fingers up your fronds, flicking at your petals and dot-clit, laughing when she makes you twitch and gasp. She extends her long tongue and dips it into your hole, savoring your [pc.girlCumFlavor] with a smack of the lips. <i>“Bet you attract all sorts of fly boys with a flash of that.”</i> She discards her bottoms, stroking her extended, blunt barb-lined ovipositor as she continues to finger you. <i>“This is my hothouse for the next little while though, poppy. You aren’t gonna need much watering once I’m done with you.”</i>"); break;
				// Otherwise:
				default: output("\n\n<i>“Aww, how sweet and vanilla!”</i> The rahn laughs as she curls her fingers along your tunnel and you squirm with pleasure " + (!pc.isSquirter() ? "dribbling" : "gushing") + " [pc.femcum]. She sucks her digits clean before going on. <i>“Lost count of how many of these I’ve stuffed full of eggs. And, I mean, I could keep on doing it forever...”</i> She impatiently discards her bottoms, stroking her extended, blunt barb-lined ovipositor as she firmly slots two of her fingers back into your [pc.vagina " + vIdx + "]. <i>“...but you should consider something, I dunno, a bit more unusual if you’re going to keep on displaying yourself, [pc.boy]. The broodmares with the neat downstairs, they’re the ones who really pull the rich rahn in.”</i>"); break;
			}
			output("\n\nThe red gel girl lines herself up with the hole she’s been teasing and then opens it with a firm shove of her hot ovi-cock. You didn’t know if a single cell organism could be described as athletic as such, but this one fucks you with seemingly relentless energy, one powerful thrust of her lean hips after another. The barbs of her cock rub up and down your sensitive, pheromone-enflamed tunnel and you cum explosively,");
			if(pc.isSquirter()) output(" [pc.femcum] spurting plentifully around her girth");
			output(" writhing helplessly in your bonds and squealing as she continues to pump you heedlessly.");
			
			pc.cuntChange(vIdx, ppRahn.cockVolume(0));
			
			output("\n\n<i>“‘S it [pc.boyGirl], sing for me,”</i> the rahn domme groans lustfully, " + (!pc.biggestTitSize() < 3 ? "grasping your [pc.chest]" : "sinking her fingers into your [pc.chest]") + ". <i>“I can keep this up all day. I ain’t gonna stop until you beg me for my eggs!”</i>");
			output("\n\nShe clearly means it, lost in a sun-like blaze of energy. You are mercilessly rubbed to another coruscating, full body orgasm, and when you dimly realize she isn’t slowing down even slightly you find yourself crying out deliriously, begging her to breed you.");
			output("\n\n<i>“Louder! That’s it. That’s it!”</i> She plants her mouth over yours and invades your mouth with her long, nimble tongue, twining it around your own as she plants herself into your [pc.vagina " + vIdx + "] as deep as she can and unloads, your pussy walls swelling with the smooth weight of eggs and the warm gush of lubricant. You groan woozily as she slowly withdraws, barbs grazing down your tenderized cunt, and then twitch as she stands over you and squirts the last of her sweet, musky lube across your face and [pc.chest].");
			output("\n\n<i>“Nice,”</i> she grins, admiring her handiwork before gathering her clothes. <i>“Just imagine: in a decade’s time, there’ll be a lot of lil’ mes running around. Maybe we’ll catch up one day, and me and one of our daughters can double team you?”</i> She’s laughing at her own depravity as she saunters out.");
			break;
		case 2:
			showBust("BREEDWELL_LOORAHN_JOLLY");
			
			output("The plump loo’rahn stumbles into your cubicle, almost as if she had to be shoved in. Her face is flushed and she’s giggling nervously; it doesn’t take the scent of wine that wafts over to you to know that it took more than the encouragement of her friends to find the courage to step in here.");
			output("\n\n<i>“H-hi,”</i> she says, gazing at you shyly. <i>“I’m sorry - I don’t think I’ll be very good at this... ooh, you’re " + pc.mf("handsome", "pretty") + ", though.”</i> The big gel woman breathes in the heavy pheromones you’re emitting, and her expression becomes softer. She unbuttons her top, allowing her pendulous, honey-colored breasts to slowly flop out. <i>“I... um, I’m going to go pretty slow. Is, is that alright?”</i>");
			output("\n\nYou do your best to be encouraging; you moan sweetly when, after several attempts, she manages to line the bulbous tip of her terran-like ovipositor with the entrance of your [pc.vagina " + vIdx + "], and then tell her to rest on top of you, take her time. Her big jelly-boobs pillow onto your " + (pc.tallness >= 48 ? "[pc.chest]" : "face") + " as she sinks deep into the folds of your pussy and then loses herself in the throes of it, packing you full of bulging hot ovipositor again and again with quivering movements.");
			
			pc.cuntChange(vIdx, ppRahn.cockVolume(0));
			
			output("\n\n<i>“You’re so lovely!”</i> she coos, ducking her head down to limpet her lips around yours, breathing wine and sugar into your mouth. Her lips and tongue move over yours as her soft, wide thighs rub against your [pc.thighs] with increasingly urgent pumps. <i>“Oh, oh... I’m so glad somebody as nice as you will be carrying my kids...”</i> She passionately twines her long, butterfly-like tongue around your [pc.tongue] as she cums, hot breath advancing down your throat as first one egg, then another spreads your [pc.vagina " + vIdx + "] wide, intense sensation sliding up your tunnel, easing open your cervix and depositing itself in your womb.");
			output("\n\nThe chubby orange rahn rests on top of you for a while, glued to you with sweat and oozing juices, before retracting out of you and wobblingly collects her stuff. Her shy awkwardness returns as the afterglow ebbs - but she still manages to give you a sincere, happy smile before she leaves.");
			output("\n\n<i>“Goodbye, sweetie,”</i> she sighs. <i>“Take good care of yourself. And my eggs.”</i>");
			break;
		case 3:
			showBust("BREEDWELL_GORAHN_TALL");
			
			var highCumQ:Boolean = false;
			
			output("The tall, casually-dressed go’rahn who steps in now is thin by rahn standards, an off-white candle of a gel woman, and as she disrobes she’s happy to explain why she picked you: She hasn’t eaten all day.");
			// If both randomly select one
			if(pc.hasCock() && (!pc.isLactating() || rand(2) == 0))
			{
				highCumQ = (pc.cumQ() >= 2000);
				output("\n\nYou tremble in your harness as she grips your [pc.hips] and applies powerful suction to your [pc.cock], willing the cum out of you with hard, hungry drags of her lips. It’s practically vampiric, and your cock can’t take much of that kind of attention before seizing up and launching [pc.cumColor] rockets of [pc.cum] into her waiting maw, your thighs thrusting reactively to the pleasure of it.");
				if(highCumQ) output(" You’re a productive enough cum pump to noticeably swell out her hips and bosom with your geyser-like spurts.");
				
				ppRahn.loadInMouth(pc);
			}
			else
			{
				output("\n\nYou gasp helplessly in your harness as she drains your [pc.milk]-heavy [pc.boobs] one after the other with powerful drags of her lips, all the while fingering your [pc.vagina " + vIdx + "], playing with what she will plunder once her thirst is satiated. It doesn’t take many rolls and teases of her mouth over your [pc.nipples] for you to be " + (!pc.canMilkSquirt() ? "dribbling" : "gushing") + " [pc.milkColor] fluid into her waiting maw, your [pc.thighs] thrusting reactively to the sensation her fingers are pushing on you.");
				output(" Your breasts are so full you noticeably swell out her hips, stomach and bosom with the [pc.milkFlavor] cascade you produce.");
			}
			output("\n\nShe rises, smacking her lips with deep enjoyment, and practically purring with absorbed energy, moves on to the main event, unbuttoning her jeans and extending her pseudo-sheathed, horse-like ovipositor. Moans and then wails are forced out of your mouth as she grips your bound [pc.legOrLegs] and fucks you energetically, her");
			if(highCumQ) output(" newly thickened");
			output(" thighs beating a steady rhythm against your exposed ass. Her egg-cock seems to be constantly drooling lube, and your [pc.vagina " + vIdx + "] is already a leaking, gaping mess by the time her hands tighten on your [pc.skinFurScales], she thrusts her blunt prick as deep as she can and with a husky groan of her own impregnates you, her eggs deposited into your womb in a great warm wash of musky white fluid.");
			
			pc.cuntChange(vIdx, ppRahn.cockVolume(0));
			
			output("\n\nHaving finished both her meal and fuck, she withdraws her ovipositor and leaves for the shower room without another word, leaving you a leaking, drooling mess, simultaneously drained and stuffed.");
			break;
		case 4:
			showBust("BREEDWELL_DOHRAHN_BUSINESS");
			if (flags["BREEDWELL_PREM_BADEND_LAVLEV"] == undefined) flags["BREEDWELL_PREM_BADEND_LAVLEV"] = 0;
			output("<i>“You know, I find the whole ‘strapped down and helpless’ element unsavory,”</i> opines the business-suited doh’rahn that strides in, considering you through her gleaming holo-glasses. <i>“Implies unwillingness. Makes explicit the unfair power structures underpinning this supposedly valiant enterprise. Undoubtedly a turn-on for some, but not really for me.”</i> She unbuttons her shirt a little bit, breasts shifting underneath the thin fabric, and a bloom of musky, spice washes over you. Your mouth waters reactively, and your already-aroused pussy goes into overdrive, drooling [pc.femcum] and flexing up needily. <i>“It’s like they’re saying I couldn’t get anything I wanted from you, whenever I wanted, wherever.”</i>");
			output("\n\nEver so slowly she takes off her clothes, revealing more and more of her top-heavy, purple body and intensifying the heavy smell of her pheromones in the cramped cubicle, carefully folding each of her expensive garments on the table. It’s clearly done to render you a quivering mess long before she slithers off her prim white panties and extends her tentacle-feeler lined ovipositor, and it’s mercilessly effective. You’re wriggling around, flexing against your obdurate bonds, practically panting,");
			if(pc.hasCock()) output(" [pc.eachCock] thickly erect");
			output(", long before she gets to that stage.");
			output("\n\nPlaying with one of her nipples, she strokes her pseudo-dick slowly over your [pc.vagina " + vIdx + "], letting her short, fat little tentacles to wriggle against your [pc.clit " + vIdx + "] and labia, all the while her hot smell inundates your nostrils and throat until finally the moaning pleas for her to fuck and impregnate you are torn from your mouth. Only then, with a thin smirk, does she line herself up with your hole and thrusts home, making you orgasm");
			if(pc.isSquirter()) output(" in a small explosion of [pc.femcum]");
			output(" on the spot, incredible pleasure making you writhe and spasm in your bonds wildly.");
			
			pc.cuntChange(vIdx, ppRahn.cockVolume(0));
			
			output("\n\nEvidently quite used to her partners being in this state, the doh’rahn fucks you almost phlegmatically, holo-glasses still in place, big boobs bapping a pleasant rhythm upon her chest as she slides her cock back down your passage and then firmly slots it back in, sensation knibbling through you as her tentacles waggle inside of you excitedly. You seem to get rocked by a fresh orgasm every ten seconds, such is the tactile overdose she’s subjecting you to, gleeful spasms rocking up your body from your [pc.vagina " + vIdx + "] again and again. You’re barely even sensate when she does finally bite her lip and speed up a bit, huffing and breasts bouncing as she swells your womb with her round, smooth bounty.");
			output("\n\n<i>“Uff! Good,”</i> she sighs, as if she’s just seen some pleasing quarterly projections. She withdraws from your gaped twat, fastidiously cleaning it with a tissue before picking up her clothes. <i>“Hope to run into you elsewhere, [pc.name], so we can do this without all the forced, unpleasant nonsense. My company will always need more office relaxers about the place.”</i>");
			break;
		case 5:
			showBust("BREEDWELL_FUURAHN_PUNK");
			
			output("The fuu’rahn with the nose-stud and asymmetrical haircut has been to see a gel sculptor recently, a part-masseur part-modder who specializes in reshaping the malleable flesh of rahn. You know this because it’s the first thing she tells you when she enters your cubicle, and displays her curly, pigtail nipples and three-toed, talon-like feet to you proudly. She winces slightly as she extends her studded, pointed ovipositor, blowing out her cheeks as she forces out the rounded bulb at the base out of her groin.");
			output("\n\n<i>“What do you think?”</i> she asks almost timidly, touching the knot. <i>“I was kinda going for an ausar look with a couple of cool extras, and I’m told people really like this thing on them. Guess I’ll find out for myself, huh?”</i>");
			output("\n\nShe grasps you by the [pc.hips] and enters your [pc.vagina " + vIdx + "] gently, careful eyes on your face as she dips her hardness in and finds your limit, but as her delightful studs rub up and down your tunnel and you make your enjoyment of it clear with arches of your back and clenches against your steel clasps, she grins and goes at you in a more carefree manner, her corkscrew nipples pressing into your [pc.chest] as she molds her green-and-blue flesh to yours.");
			
			pc.cuntChange(vIdx, ppRahn.cockVolume(0));
			
			output("\n\nShe loses herself to it so much, in fact, that she doesn’t even notice she’s shoved her knot beyond your parted lips as she tenses up and ejaculates her eggs into you. You certainly do, though; you squeal at the intense sensation, clamping down on her dick reactively.");
			output("\n\n<i>“Oh!”</i> she says, blissful expression turning to one of startlement. <i>“Did I do something - ? Oh. I, uh.”</i> She awkwardly tries to withdraw. <i>“I’m, um... kind of stuck in you. Sorry about that.”</i>");
			output("\n\nShe spends the time waiting for her knot to deflate by playing with your [pc.nipples],");
			if(pc.hasCuntNipples(0)) output(" fingering them and cooing at the pleasure it causes you, wetting her digits in " + (pc.isLactating() ? "[pc.milk]" : "[pc.femcum]"));
			else if(pc.isLactating()) output(" circling them teasingly and then suckling you hungrily when you bead [pc.milk] in response");
			else output(" circling them over and over and licking them teasingly");
			output(".");
			// If cunt/mouth nips:
			if(pc.hasCuntNipples(0) || pc.hasLipples(0)) output("\n\n<i>“Those nipples are really cool!”</i> she laughs when she’s finally able to unhouse her ovi-cock from the hot morass of eggs and blue lubricant she’s left inside you. <i>“I’m definitely going to get some done for myself next time I see my sculptor.”</i> She blows you a kiss as she gathers her clothes and bobs her pert, naked ass out into the shower receptacle.");
			// If else:
			else output("\n\n<i>“That was actually kinda fun!”</i> she laughs when she’s finally able to unhouse her ovi-cock from the hot morass of eggs and blue lubricant she’s left inside you. <i>“I can’t wait to knot with someone else and just kinda hang for a little while. Maybe you again, sometime?”</i> She blows you a kiss as she gathers her clothes and bobs her pert, naked ass out into the shower receptacle.");
			break;
		case 6:
			showBust("BREEDWELL_GORAHN_SCARF");
			
			output("The tall, lithe go’rahn is dressed in an ornate, full-bodied robe and a long headscarf, as if she were a member of some sort of religious order. You doubt anybody religious would have the reason she does for wearing that headscarf, though. You watch as, eyes placidly fixed on you, she silently removes it and allows her mass of white, phallic head-tentacles to move freely, and unravels her robe to reveal a similar wriggling bush of flexible ovi-cocks eagerly thickening and writhing to the scent you’re giving off. You’ve never been more aware of the steel clasps holding you in place as, with a similarly calm and silent smile, this avatar of tentacular lust slowly paces towards you.");
			output("\n\nWithin a minute you’ve got a girthy phallic feeler rammed into every hole you’ve got available, a head tentacle stretching open your [pc.lips] as another pumps its gooey, leaking tip past your [pc.anus].");
			
			pc.buttChange(ppRahn.cockVolume(0));
			
			if(pc.vaginalCapacity(vIdx) > (ppRahn.cockVolume(0) * 2)) output(" She easily gets two into your spacious and well-gaped twat, stretching the walls with shifting, restless, prehensile cock.");
			else output(" With patient but indefatigable pushes she manages to get two into your tight cunt, stretching the walls with shifting, restless, prehensile cock.");
			
			pc.cuntChange(vIdx, (ppRahn.cockVolume(0) * 2));
			
			var fuckableNipples:int = pc.fuckableNippleCount();
			if(fuckableNipples > 0) output(" " + StringUtil.capitalize(num2Text(fuckableNipples)) + " more thrust" + (fuckableNipples == 1 ? "s" : "") + " eagerly into the sensitive confines of your [pc.nipples].");
			output(" The rest bat their leaking heads against your [pc.skinFurScales], as if admonishing you for not being able to accommodate them as well.");
			output("\n\nYou thrash helplessly in your fixed position to it all, groaning and squealing in sudden, electric orgasm");
			if(pc.isSquirter())
			{
				output(", spurting [pc.femcum]");
				if(pc.canMilkSquirt()) output(" and [pc.milk] everywhere");
			}
			output(", nothing but a receptacle for horny, insatiable rahn tentacles. The bizarre alien groans in husky orgasm herself occasionally, one of her appendages tensing up and spurting warm, white goo into your mouth, your " + (pc.vaginas.length == 1 ? "pussy" : "pussies") + ", or your [pc.butt] - and each time she simply withdraws it and replaces it with another. It all becomes a blur of thick dick and rahn lube, inundating your brain with the smell and texture of it until you’re washed away on a sea of hard, writhing, white sex...");
			output("\n\nYou regain your senses a little while later. There is no way to judge how long you’ve been out of it, except the go’rahn is gone and the cleaning cycle hasn’t started yet, so you’re still covered with rahn juices from head to gaping, leaking cunt" + (pc.vaginas.length == 1 ? "" : "s") + ". Did she even impregnate you, or was this simply an opportunity to inflict her wonderfully horrendous, horrendously wonderful body on someone who couldn’t run away? You guess you’ll find out in a couple weeks’ time.");
			break;
		case 7:
			showBust("BREEDWELL_FUURAHN_PEAR");
			
			output("<i>“I had half of my body mass trimmed off,”</i> explains the perky, dumpy fuu’rahn who bounces into your cubicle, smiling at you brightly as she shrugs off her fashionable jacket. The pear-shaped gel girl is barely four foot tall.");
			// Gabilani codex read:
			if(CodexManager.entryViewed("Gabilani")) output(" That, her figure, and her mottled green-and-blue color immediately calls to mind the gabilani of Tarkus.");
			output(" <i>“To pay for a trip out here, and all across the frontier. You wouldn’t believe how being this size cuts down on the bills.”</i>");
			// PC height < 4' 5":
			if(pc.tallness < 53)
			{
				output(" Her eyes shine with naked delight as they trail across your own small-but-perfectly-formed body. <i>“Guess why I picked you?”</i>");
				output("\n\nShe makes love to you with sweaty, delighted eagerness, her thick, soft hips slapping a steady rhythm against your own splayed thighs, her nubby ovipositor reaching deep inside you. It’s oversized for her, a girthy monster of a cock that rubs against your walls delightfully until you’re flexing back and moaning to her every jiggling thrust.");
				
				pc.cuntChange(vIdx, ppRahn.cockVolume(0));
				
				output("\n\n<i>“It’s so nice to be able to do this with somebody the same size for once,”</i> she groans lustily in your ear. She pauses to mash lips with you, tangling her tongue with your [pc.tongue]. <i>“So sick of the oral jokes...”</i>");
				output("\n\nThe thick, wonderful weight of her eggs travels up her stalk and you orgasm hard to the sensation, your [pc.vagina " + vIdx + "] clenching up and almost willing the heavy, smooth fact of them into your womb. Blue-and-green arms hold you close until the implantation is certain, and a slurry of [pc.femcum] and blue lube is dribbling down your [pc.ass].");
				output("\n\n<i>“That was great,”</i> sighs the fuu’rahn, slowly slithering out of your grip. Her happy, gratified gaze trail over your sweaty, swollen form as she picks up her clothes. <i>“Y’know, that size just looks <i>right</i> for pregnancy. I can see you being a hit even with peeps who aren’t freaks like me!”</i> She waggles her fingers at you cheekily as she leaves.");
			}
			else
			{
				output("\n\nShe sighs as she takes in your considerably larger body, splayed and readied for her delectation. <i>“Only problem is - it makes every lover look like an adventure course. But a little exercise never hurt anyone, right good-looking?”</i>");
				output("\n\nOnce she’s peeled her clothes off, she hoists herself up using her thighs, and then uses your cuffed hands as leverage with which to make love to you with sweaty, delighted eagerness, her thick, soft hips slapping a steady rhythm against your own splayed thighs, her nubby ovipositor reaching deep inside you. It’s oversized for her, a girthy monster of a cock that rubs against your walls delightfully until you’re flexing back and moaning to her every jiggling thrust.");
				
				pc.cuntChange(vIdx, ppRahn.cockVolume(0));
				
				output("\n\n<i>“Can’t skimp on the size of your ‘possi, though,”</i> she groans lustily");
				if(pc.hasBreasts()) output(", head wedged between your [pc.breasts]");
				output(". <i>“If you can’t please the girls and boys there’s no point even...”</i> she loses her train of thought as she cums, the thick, wonderful weight of her eggs traveling up her stalk. You orgasm yourself to the sensation, your [pc.vagina " + vIdx + "] clenching up and almost willing the heavy, smooth fact of them into your womb. Blue-and-green arms hold you close until the implantation is certain, and a slurry of [pc.femcum] and blue lube is dribbling down your [pc.ass].");
				output("\n\n<i>“Look after them, big [pc.boyGirl],”</i> sighs the fuu’rahn, slowly slithering out of your grip. Her happy, gratified gaze trail over your sweaty, swollen form as she picks up her clothes. <i>“You should think about shrinking yourself down too, y’know. Short and thick suits being a dedicated incubator, you know...”</i>");
			}
			break;
	}
	
	processTime(30 + rand(9));
	
	addRahnEgg(vIdx, 2);
	pc.loadInCunt(ppRahn, vIdx);
	numEggs += 2;
	pc.orgasm();
	
	sceneList.splice(sceneList.indexOf(select), 1);
	sceneCount--;
	
	clearMenu();
	if(sceneCount <= 0 || sceneList.length <= 0) addButton(0, "Next", breedwellPodEnd, numEggs);
	else addButton(0, "Next", breedwellPodScenes, [sceneList, sceneCount, numEggs]);
}
public function addRahnEgg(vIdx:int, numEggs:Number = 2):void
{
	if(vIdx < 0 || vIdx > 2) return;
	
	if(InCollection(pc.pregnancyData[vIdx].pregnancyType, ["RahnPregnancy", "RahnPregnancyBreedwell"])) 
	{
		pc.pregnancyData[vIdx].pregnancyQuantity += numEggs;
		pc.addPregnancyBellyMod(vIdx, numEggs * 5, false);
	}
}
// Ending
public function breedwellPodEnd(numEggs:int = 0):void
{
	clearOutput();
	author("Nonesuch");
	
	output("After " + (numEggs == 2 ? "the" : "each") + " session has come to its intense, womb-swelling conclusion, the harnesses’ robotic limbs telescope outwards and clean you thoroughly, jetting off the sweat and sugary rahn jizz and gently pinching the lips of [pc.eachVagina] together, to present a decorous picture to the next client. You always get a spray of the prototype pheromone mixture too, and you quickly become dizzy with it, your " + (pc.vaginas.length == 1 ? "pussy" : "pussies") + " flush with heat and desperate for a coupling long before the door opposite slides open to reveal your next impatient, lusty gel girl stud.");
	output("\n\nAfter the last though, once you’ve received another brisk cleaning the harnesses’ helmet comes down over your head again.");
	output("\n\n<i>“You have received as many fertilized ovum as our biometrics determine you can healthily carry, [pc.name] Steele,”</i> says the calm voice in your ear. <i>“Good [pc.boyGirl]! Entering cool down phase.”</i> Soothing electronica plays as you are withdrawn back into the wall and turned around. The steel binds cuffing your wrists and " + (pc.hasLegs() ? "your ankles" : "your lower body") + " snap open, and a warm, moistened cloth is gently rubbed over them and your swollen belly. At last, you are shifted back out into the sterile light of the incubator lobby.");
	output("\n\n<i>“Thank you for using Tamani Conceptuzal Harness MkV,”</i> says the voice, as the muzak comes to an end. <i>“Your account has been accredited for your work, and you will be paid for each rahn we identify you successfully carrying to term. We, and Tamani Twenty Four’s 18 billion viewers, hope to see you again.”</i>");
	output("\n\nYou are left rubbing your now heavily gravid belly, tired, dazed yet perversely gratified.");
	
	processTime(15);
	
	pc.credits += (300 * numEggs);
	IncrementFlag("BREEDWELL_TIMES_BRED");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// [Cockmilker]
// Mechanically should work in the same way the NT one does, e.g. awards credits at an increasingly lesser rate the more the PC donates, only at steeper cut-off points. The overall effect should be that modest ejaculations reward less than they would with the NT milker, but larger loads reward more, with a higher overall ceiling.
// Suggested Thresholds
/*
	Output Threshold			Credits per 1,000 ml
	0ml							10
	Less than 5,000 ml			8
	Less than 20,000 ml			5
	Less than 200,000 ml		3
	Less than 500,000 ml		1
	Less than 1,000,000 ml		0.5
	Less than 10,000,000 ml		0.1
	100,000,000 ml or more		0.05
*/
public function breedwellCumCreditValue(amount:Number = 0):Number
{
	// New calculations!
	var maxCredVal:Number = 10; // Maximum credit value to start.
	var normalAmount:Number = 500000; // Point where credit value is at 1 credit/mL before degrading.
	// Build function curve with these values to get the multiplier!
	var curveMult:Number = 2; // The curve magnitude.
	var scalar:Number = 1; // Scale of the entire amount.
	
	// Other adjustments...
	normalAmount = 1500000;
	curveMult = 4;
	scalar = 0.005 * pc.cumQuality();
	
	var creditVal:Number = ( maxCredVal / Math.pow((((curveMult * amount) / normalAmount) + 1), 2) );
	var cashOut:Number = (amount * creditVal * scalar);
	
	// Hard cap
	var minCredCap:Number = 5;
	var maxCredCap:Number = 500000;
	if(cashOut < minCredCap) cashOut = minCredCap;
	if(cashOut > maxCredCap) cashOut = maxCredCap;
	
	if(debug)
	{
		output("OUTPUT: " + amount + " mLs @ " + Math.round(cashOut) + " Credits ( " + creditVal + " creds/mL )");
		output("\n\n");
	}
	
	return Math.round(cashOut);
}
// Idk what the maximum amount the PC can feasibly jizz is in this game, but the scene where you break this thing should be fairly close to it. Given NT cockmilker’s limit is 4,000,000, set limit to 20,000,000 for now.

public function breedwellApproachCockmilker():void
{
	clearOutput();
	clearBust();
	author("Nonesuch");
	
	output("You step into a cubicle, the door hissing shut behind you. The milker is an oblong, arm-like machine offering its blunt end towards you, its clean, blue crinkle of shiny, latex-like material awaiting use. It’s obviously built to be adaptable, and that impression is confirmed when a flickering light plays over you from the cam-unit above and the thing whirrs, adjusting its receiver and handles to compensate for your height. Beyond it the fifteen foot glass cylinder looms; a daunting, gleaming challenge.");
	output("\n\nYou");
	if(pc.isCrotchGarbed()) output(" take your [pc.lowerGarments] off and");
	output(" move across and take hold of the handles. The screen above the milker blinks on, silently displaying two touch buttons.");
	
	processTime(4);
	
	pc.createStatusEffect("Breedwell Cockmilker Porno");
	pc.createStatusEffect("Breedwell Cockmilker Dildo");
	
	breedwellCockmilkerMenu();
}
public function breedwellCockmilkerMenu():void
{
	var porno:Boolean = (pc.hasStatusEffect("Breedwell Cockmilker Porno"));
	var dildo:Boolean = (pc.hasStatusEffect("Breedwell Cockmilker Dildo"));
	
	clearMenu();
	addButton(0, ("Porn: " + (!porno ? "OFF" : "ON")), breedwellCockmilkerTogglePorno, undefined, ("Turn Pornography " + (!porno ? "On" : "Off")), (!porno ? "Watch porn whilst you’re getting milked." : "Don’t watch porn whilst you’re getting milked."));
	addButton(1, ("Dildo: " + (!dildo ? "OFF" : "ON")), breedwellCockmilkerToggleDildo, undefined, ("Turn Dildo " + (!dildo ? "On" : "Off")), (!dildo ? "Take it up the ass." : "Avoid getting prostate milked."));
	addButton(4, "Begin", breedwellCockmilkerStart, (pc.cocks.length == 1 ? 0 : -1));
}
public function breedwellCockmilkerTogglePorno():void
{
	if(!pc.hasStatusEffect("Breedwell Cockmilker Porno")) pc.createStatusEffect("Breedwell Cockmilker Porno");
	else pc.removeStatusEffect("Breedwell Cockmilker Porno");
	breedwellCockmilkerMenu();
}
public function breedwellCockmilkerToggleDildo():void
{
	if(!pc.hasStatusEffect("Breedwell Cockmilker Dildo")) pc.createStatusEffect("Breedwell Cockmilker Dildo");
	else pc.removeStatusEffect("Breedwell Cockmilker Dildo");
	breedwellCockmilkerMenu();
}
public function breedwellCockmilkerEnd(cumTotal:Number = 0):void
{
	pc.removeStatusEffect("Breedwell Cockmilker Porno");
	pc.removeStatusEffect("Breedwell Cockmilker Dildo");
	StatTracking.track("breedwell/cum milked", cumTotal);
	IncrementFlag("BREEDWELL_TIMES_DONATED");
	// Disable cockmilker for the day.
	flags["BREEDWELL_DONATION_USED"] = days;
}
// Intro
public function breedwellCockmilkerCockSelect():void
{
	clearOutput();
	author("Nonesuch");
	
	output("It seems you have more than one penis... Which one do you want to milk?");
	output("\n");
	
	clearMenu();
	for(var i:int = 0; i < pc.totalCocks(); i++)
	{
		output("\n<b>#" + (i + 1) + ":</b> " + formatFloat(pc.cLength(i), 3) + " in long, " + pc.cocks[i].cockColor + " [pc.accurateCockName " + i + "]");
		addButton(i,"#" + (i + 1), breedwellCockmilkerStart, i, StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock","Get your [pc.cockNoun " + i + "] milked.");
	}
}
public function breedwellCockmilkerStart(cIdx:int = -1):void
{
	if(cIdx < 0)
	{
		breedwellCockmilkerCockSelect();
		return;
	}
	
	clearOutput();
	author("Nonesuch");
	
	var porno:Boolean = (pc.hasStatusEffect("Breedwell Cockmilker Porno"));
	var dildo:Boolean = (pc.hasStatusEffect("Breedwell Cockmilker Dildo"));
	var cLength:Number = pc.cLength(cIdx);
	var cumQ:Number = 0;
	
	// Porn off AND Dildo off
	if(!porno && !dildo)
	{
		output("Pfft. Artificial stimulation is for lightweights and the imagination-less. You click both options off and take hold of your [pc.cock " + cIdx + "], thinking as you do of the cute rahn babes who will soon be enjoying your [pc.cumVisc] [pc.cumColor] seed, one way or another. You’re already nicely erect when you take hold of the handles proper, and you line yourself up and slowly sink your [pc.cockHead " + cIdx + "] into the synthetic crease of the machine.");
		output("\n\nThe machine hums as you dip further into it, pleasant vibrations running through your hardness.");
		// Small cock:
		if(cLength <= 4) output(" It’s rather baggy at first, but it tightens up precipitously, the material puckering up at the base, and your cute little twig is soon being provided with as gasp-inducingly tight a fuck as it’s ever likely to find.");
		// Average cock:
		else if(cLength <= 12) output(" It feels nice and tight around you, the machine barely having to adjust itself at all to glove your fine-sized cock.");
		// Big cock:
		else if(cLength <= 24) output(" It’s a frustrating experience to begin with, the hole too small for your monster dick, but the machine quickly adjusts, latex material fanning out from the hole and moving backwards, until you’re being provided with a wonderfully long, large ona-hole perfectly suited for a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber.");
		// Massive cock:
		else output(" There’s a whine and a throb as you keep feeding your thickness in, and you " + pc.mf("chuckle", "giggle") + " as at last the machine beeps in protest, choked upon your massive, totemic dick with it barely halfway in. It’s not giving up, though. After a slight pause the material puffs out massively, swelling out of the metal seams of its housing with a sound like a balloon inflating. You push inwards, it keeps bulging outwards, and you groan with contentment as your " + (pc.balls >= 2 ? "[pc.balls]" : "[pc.thighs]") + " touch the crinkled opening. Finally, a hole that can take a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber!");
		output("\n\nYou draw yourself out and then saw your way in, and once satisfied quickly fall into a good rhythm, clutching the padded handles so you can go at the smooth, warm cock-holster with hard slaps of your groin. Heat builds in your [pc.cock " + cIdx + "] until it’s unbearable, and as much as you want to keep fucking the exquisitely tight and velvety milker forever, you find yourself tumbling over the edge.");
		
		processTime(15 + rand(9));
		
		// Run Output scene
		cumQ = cumMilkerCumEstimate();
		
		clearMenu();
		addButton(0, "Next", breedwellCockmilkerOutput, [cIdx, dildo, porno, cumQ]);
	}
	// Porn Off, Dildo On
	else if(!porno && dildo)
	{
		output("Rotting your brain with porn is a no, but a nice prostate milking... yeah. That gives you a few tingles. You select one option and not the other, and there’s a whirring sound as a mechanical arm descends behind you. You shiver slightly as a warm, blunt object nestles itself between your buttcheeks, pausing when it is pressed against the pad of your [pc.anus].");
		output("\n\nYou take hold of your [pc.cock " + cIdx + "] and give it a few strokes, closing your eyes as you imagine all the gel cute rahn babes who will soon be enjoying your [pc.cumVisc] [pc.cumColor] seed, one way or another. Your prick rears up readily to those fruity thoughts, and you take hold of the handles proper, line yourself up and slowly sink your [pc.cockHead " + cIdx + "] into the synthetic crease of the machine.");
		output("\n\nThe machine hums as you sink further into it, pleasant vibrations running through your hardness.");
		// Small cock:
		if(cLength <= 4) output(" It’s rather baggy at first, but it tightens up precipitously, the material puckering up at the base, and your cute little twig is soon being provided with as gasp-inducingly tight a fuck as it’s ever likely to find.");
		// Average cock:
		else if(cLength <= 12) output(" It feels nice and tight around you, the machine barely having to adjust itself at all to glove your fine-sized cock.");
		// Big cock:
		else if(cLength <= 24) output(" It’s an irritating experience to begin with, the hole too small for your monster dick, but the machine quickly adjusts, latex material fanning out from the hole and moving backwards, until you’re being provided with a wonderfully long, large ona-hole perfectly suited for a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber.");
		// Massive cock:
		else output(" There’s a whine and a throb as you keep feeding your thickness in, and you " + pc.mf("chuckle", "giggle") + " as at last the machine beeps in protest, choked upon your massive, totemic dick with it barely halfway in. It’s not giving up, though. After a slight pause the material puffs out massively, swelling out of the metal seams of its housing with a sound like a balloon inflating. You push inwards, it keeps bulging outwards, and you groan with contentment as your " + (pc.balls >= 2 ? "[pc.balls]" : "[pc.thighs]") + " touch the crinkled opening. Finally, a hole that can take a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber!");
		output("\n\nAs you cloak more and more of your dick in warm tightness, the prehensile dildo behind you follows you in, maintaining obdurate, patient pressure against your asshole. When you draw yourself outwards, however, it stays exactly where you found your limit, and you tense up slightly as you begin to penetrate yourself on it, the dildo’s blunt head opening your up and filling your rear entrance with hardness. You " + pc.mf("grunt", "coo") + " as it suddenly squirts a warm, oily load of lube into you, easing its passage and allowing it to slip its way in wonderfully deep. It’s only then that it becomes to judder, sending delicious vibrations quaking through your groin. You " + pc.mf("bark", "squeal") + " with pleasure as it hits the tender, buried button of your prostate, reactively making you tense up with joy and push your [pc.cock " + cIdx + "] back deep into the milker.");
		output("\n\nYou draw yourself out and then saw your way in, fucking the silky glove of the synthetic sleeve at the same time as you are drilled from behind, the robot cock driving over your " + (!pc.isHerm() ? "boy" : "herm") + " button at the same time as filling your lower body with quaking pleasure. It makes you weak in the [pc.knees], and you have to hold onto the padded handles closely to keep your balance as you reactively slap your [pc.thighs] into the machine, each thrust driving the milking dildo deep into where you are most sensitive. This is what being milked really feels like, the heat and pressure building in your [pc.cock " + cIdx + "] beyond your control. You cry out as you tumble over the edge.");
		
		processTime(25 + rand(9));
		
		// Run Output scene
		cumQ = cumMilkerCumEstimate();
		
		clearMenu();
		addButton(0, "Next", breedwellCockmilkerOutput, [cIdx, dildo, porno, cumQ]);
	}
	// Porn on, Dildo off
	else if(porno && !dildo)
	{
		output("You’re glad you’re given the option of one but not the other. Carefully, you press ‘yes’ to porno and ‘no’ to getting reamed. A cartoon Tamani appears on the screen, lying on her side and smirkingly considering a number of out-sized dildos. Each has an option written on it.");
		output("\n");
		
		processTime(1);
		
		breedwellPornMenu([cIdx, dildo]);
	}
	// Porn On, Dildo On
	else
	{
		output("You’re not letting either option escape your voracious appetites. You tap ‘Yes’ to both options. There’s a whirring sound as a mechanical arm descends behind you; you shiver slightly as a warm, blunt object nestles itself between your buttcheeks, and you push out your [pc.butt] to allow it better access.");
		output("\n\nA cartoon Tamani has appeared on the screen, lying on her side and smirkingly considering a number of out-sized dildos. Each has an option written on it.");
		output("\n");
		
		processTime(1);
		
		breedwellPornMenu([cIdx, dildo]);
	}
}
public function breedwellPornMenu(arg:Array):void
{
	var cIdx:int = arg[0];
	var dildo:Boolean = arg[1];
	
	clearMenu();
	output("\n1.\tLive Streams from the Pods (f, h)");
	addButton(0, "1", breedwellPornScenes, [cIdx, dildo, 1]);
	output("\n2.\tLittle Red Riding Boi (fb, m, h)");
	addButton(1, "2", breedwellPornScenes, [cIdx, dildo, 2]);
	output("\n3.\tYorinn’s Hour of Yiff (m)");
	addButton(2, "3", breedwellPornScenes, [cIdx, dildo, 3]);
	output("\n4.\tSelect Recordings from the Gastigoth (f, h, m)");
	addButton(3, "4", breedwellPornScenes, [cIdx, dildo, 4]);
	if(dildo)
	{
		output("\n5.\tPeg me, Tamani! (f, you)");
		addButton(4, "5", breedwellPornScenes, [cIdx, dildo, 5]);
	}
}
public function breedwellPornScenes(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	
	var cIdx:int = arg[0];
	var dildo:Boolean = arg[1];
	var track:int = arg[2];
	var cLength:Number = pc.cLength(cIdx);
	var cumQ:Number = 0;
	
	// Intro
	if(!dildo) output("You take hold of the handles proper, line yourself up and slowly sink your [pc.cockHead " + cIdx + "] into the synthetic crease of the machine, pressing your chosen dildo as you do. The cartoon Tamani grabs it, splays her legs and slides it into her pussy, eyes crossing and mouth ‘oh’ing as she does. The screen zooms between her open lips.");
	// Intro for all except 5.
	else if(track != 5) output("You take hold of the handles proper, line yourself up and slowly sink your [pc.cockHead " + cIdx + "] into the synthetic crease of the machine, pressing your chosen dildo as you do. The prosthetic behind you follows you in, and you gasp slightly as it penetrates you, slowly opening up your [pc.anus]. The cartoon Tamani grabs your chosen dildo, splays her legs and slides it into her pussy, eyes crossing and mouth ‘oh’ing as she does. The screen zooms between her open lips.");
	
	switch(track)
	{
		case 1:
			output("\n\nThere are nine minimized feeds in front of you, each displaying some lascivious action going on in the breeding pods elsewhere on the station. You focus upon one for a couple of seconds - a purple rahn in the throes of ecstasy, hammering her hips into a bound ausar herm whose engorged doggy cock is flopping this way and that - and the feed zooms out in response, taking over the screen, so you can drink in every detail. Oof! Who knew you could be a double squirter?");
			output("\n\nAs soon as you get tired with one feed, or one breeding session comes to its natural, sticky conclusion, you can swap to another feed with a flick of the eyeballs, and then another, and then another. It’s heady, sleazy over-stimulation, and your blood pulses through your veins faster as you submerge yourself in a sea of curvy gel girls having their way with just about every shape and size of being imaginable. Your [pc.hips] are on auto-pilot, thrusting into the welcoming embrace of the cockmilker with harder and harder strokes.");
			if(dildo) output(" The mechanical dildo bores deep into you, sending delightful shivers through your core, and making you arch your back as it drives into your prostate.");
			// Small cock:
			if(cLength <= 4) output(" It’s rather baggy at first, but it tightens up precipitously, the material puckering up at the base, and your cute little twig is soon being provided with as gasp-inducingly tight a fuck as it’s ever likely to get.");
			// Average cock:
			else if(cLength <= 12) output(" It feels nice and tight around you, the machine barely having to adjust itself at all to take your fine-sized cock.");
			
			// Big cock:
			else if(cLength <= 24) output(" It’s a frustrating experience to begin with, the hole too small for your monster dick, but the machine quickly adjusts, the material fanning out from the hole and moving backwards, until you’re being provided with a wonderfully long, large ona-hole perfectly suited for a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber.");
			// Massive cock:
			else output(" There’s a whine and a throb as you keep feeding your thickness in, and you " + pc.mf("chuckle", "giggle") + " as at last the machine beeps in protest, choked upon your massive, totemic dick with you barely halfway in. It’s not giving up, though. After a slight pause the material puffs out massively, swelling out of the metal seams of its housing with a sound like a balloon inflating. You push inwards, it keeps bulging outwards, and you groan with contentment as your " + (pc.balls >= 2 ? "[pc.balls]" : "[pc.thighs]") + " touch the crinkled opening. Finally, a hole that can take a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber!");
			if(!dildo)
			{
				output(" Pure pleasure courses up your [pc.cock " + cIdx + "]");
				if(pc.balls >= 1) output(", filling your [pc.balls] with a wonderfully intense pressure");
				output(".");
			}
			output("\n\nMost of the dalliances in Breedwell’s pods are short, rough and frenzied affairs - no doubt aided by the pheromone mixture Tamani Corp insists on spraying their surrogates with - but there’s some that are slower, sweeter, and ultimately sexier. You watch transfixed as the go’rahn spends a long while tonguing the human female’s exposed cunt, forcing the young lady to a couple of trembling, transfixed orgasms, before gently mounting her with her spiral-shaped ovipositor, making out with the surrogate, lovingly fondling her petite breasts with their small, pointy nipples until the two are completely lost in themselves.");
			if(dildo) output(" Each thrust of the gleaming, alien cock seems to correspond to a pump of the mechanical cock against your prostate.");
			output(" Oh Void...");
			break;
		case 2:
			output("\n\n<i>“Hey everyone,”</i> smiles the breathy, red hot-panted human boi mincing through a forest clearing, flicking the blonde curls underneath his hood at the camera. <i>“I’m on my way to my Auntie Dzaan in the forest. She says she has something big and deep for me. I sure hope I don’t run into mean old wolves on the way. Oh no!”</i> Two big ausar step smirking into the clearing, both of them packing heavy bulges in their jeans.");
			output("\n\nLust inflames you as you watch the ‘wolves’ pin the femboy down and take turns with his pert, peachy ass, and you spear yourself further into the machine. Pleasant vibrations run through");
			if(!dildo) output(" your hardness.");
			else output(" both your hardness and your back passage as the dildo you’re pierced on judders of its own volition, and you arch your back as it bumps over your tender prostate.");
			// Small cock:
			if(cLength <= 4) output(" It’s rather baggy at first, but it tightens up precipitously, the material puckering up at the base, and your cute little twig is soon being provided with as gasp-inducingly tight a fuck as it’s ever likely to get.");
			// Average cock:
			else if(cLength <= 12) output(" It feels nice and tight around you, the machine barely having to adjust itself at all to take your fine-sized cock.");
			// Big cock:
			else if(cLength <= 24) output(" It’s a frustrating experience to begin with, the hole too small for your monster dick, but the machine quickly adjusts, the material fanning out from the hole and moving backwards, until you’re being provided with a wonderfully long, large ona-hole perfectly suited for a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber.");
			// Massive cock:
			else output(" There’s a whine and a throb as you keep feeding your thickness in, and you " + pc.mf("chuckle", "giggle") + " as at last the machine beeps in protest, choked upon your massive, totemic dick with you barely halfway in. It’s not giving up, though. After a slight pause the material puffs out massively, swelling out of the metal seams of its housing with a sound like a balloon inflating. You push inwards, it keeps bulging outwards, and you groan with contentment as your " + (pc.balls >= 2 ? "[pc.balls]" : "[pc.thighs]") + " touch the crinkled opening. Finally, a hole that can take a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber!");
			output(" You judder your [pc.hips] into the machine, pleasure coursing through your shaft, eyes fixed upon the screen.");
			output("\n\nThe porno is appallingly xenophobic really, relying on eye-rolling stereotypes of human easiness and ausar bestiality. Sometimes though, cheap and nasty is exactly what you want.");
			if(!dildo) output(" You hammer the milker");
			else output(" You let the machine hammer your [pc.ass]");
			output(" as you watch one of the wolves fuck Red from below, roughly jerking his dinky trap prick as he does, whilst another paints his upturned, gasping face in cum from his thick red cock. Heat builds in your [pc.cock " + cIdx + "] until it’s unbearable, and as much as you want to keep fucking the exquisitely tight and velvety milker for as long as possible, you find yourself tumbling over the edge.");
			break;
		case 3:
			output("\n\n<i>“Hullo there!”</i> smiles the amiable-looking bear-morph at the camera. Burly isn’t the word for him; his checkered shirt and jeans could be used as tents by an ordinary-sized human, but they look like they’re painted onto his shaggy, musclebound body. He’s in some sort of faux-rustic stable setting. The partition wall groans uneasily as he leans on it. <i>“Yorinn here. I thought today I’d step on down to Vesperia and visit some of my friends in the country. Hey there, Iker!”</i>");
			output("\n\n<i>“Hey,”</i> grins the vest-clad bipedal zebra who’s just sauntered into frame. He’s taller and leaner than Yorinn, although everything’s relative; he’s still built like a striped shithouse. Like the bear, he looks like he’s smuggling a raskvel around in his (very tight) undies. <i>“Listen, I could use some help cleaning out the grease pits. Think you could lend a hand? I warn you, though. It’s likely to get miiiiiighty greasy in there.”</i>");
			output("\n\nThe whole thing’s knowingly absurd, but that lends it a gentle charm that might otherwise be lacking when these bestial men’s men start getting hot and heavy with each other. You pick up the pace, really beginning to pound the synthetic hole you’re mired in as you watch Iker work his pole-like equine cock deep into Yorinn’s wide, muscular backside from behind, rattling the giant, oily silo they’re in as he begins to clap his prime, thoroughbred thighs into the bear in a lusty fury.");
			if(dildo) output(" It coincides with the mechanical dildo boring deep into you, sending delightful shivers through your core, and making you arch your back as it drives into your prostate.");
			// Small cock:
			if(cLength <= 4) output(" The cockmilker is rather baggy at first, but it tightens up precipitously, the material puckering up at the base, and your cute little twig is soon being provided with as gasp-inducingly tight a fuck as it’s ever likely to get.");
			// Average cock:
			else if(cLength <= 12) output(" The cockmilker feels nice and tight around you, the machine barely having to adjust itself at all to take your fine-sized cock.");
			// Big cock:
			else if(cLength <= 24) output(" The cockmilker is a frustrating experience to begin with, the hole too small for your monster dick, but the machine quickly adjusts, the material fanning out from the hole and moving backwards, until you’re being provided with a wonderfully long, large ona-hole perfectly suited for a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber.");
			// Massive cock:
			else output(" The cockmilker gives a whine and a throb as you keep feeding your thickness in, and you " + pc.mf("chuckle", "giggle") + " as at last the machine beeps in protest, choked upon your massive, totemic dick with you barely halfway in. It’s not giving up, though. After a slight pause the material puffs out massively, swelling out of the metal seams of its housing with a sound like a balloon inflating. You push inwards, it keeps bulging outwards, and you groan with contentment as your " + (pc.balls >= 2 ? "[pc.balls]" : "[pc.thighs]") + " touch the crinkled opening. Finally, a hole that can take a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber!");
			output(" You judder your [pc.hips] into the machine, pleasure coursing through your shaft, eyes fixed upon the screen.");
			output("\n\nYou hammer the machine");
			if(dildo) output(", delighting in every pump of the dildo into your [pc.ass],");
			output(" as a husky morph drops into the Vesperian ‘grease pit’, then an alligator, then a blue-skinned, tentacle-mouthed alien, until the camera is panning across a pool of oiled, mountainous muscle and thick dick pounding into every hole going... Heat builds in your [pc.cock " + cIdx + "] until it’s unbearable, and as much as you want to keep fucking the exquisitely tight and velvety milker for as long as possible, you find yourself tumbling over the edge.");
			break;
		case 4:
			output("\n\nA muscular, strong-jawed woman in a military uniform is sat at a desk, working away at a holo-keyboard. It seems a fairly ordinary scene, until the micro camera drone slowly dips underneath the desk. There, arms sleeve-bound behind her and ring-gagged, a collared, naked kaithrit is licking the woman’s long, black thigh-high boots.");
			output("\n\n<i>“I better be able to see my face in those by the time I’m finished, smuggler bitch,”</i> the officer growls, and the kaithrit whimpers. <i>“I can make your sentence longer as well as shorter, you know.”</i>");
			output("\n\nIs this real? This or any of the other scenes you can switch to with a flick of the eyeballs, all of them purportedly from the prison station Gastigoth? You watch entranced, [pc.hips] shoving into the soft, crinkly fabric of the cockmilker, pleasure coursing up your shaft, at sordid recordings of interrogation sessions, the infamous breeding program, body reassignment chambers, and, of course, the steamy labyrinth of sexual score-settling that are prison showers the universe over. Guards on prisoners, prisoners on prisoners, wealthy visitors on whatever they want. It’s filthy, watching this stuff, terrible, and incredibly, undeniably horny.");
			if(dildo) output(" It’s made all the more intense by the dildo buried deep in your ass beginning to vibrate and then finding your prostate with mechanical precision, ruthlessly milking you with stiff, juddering strokes.");
			// Small cock:
			if(cLength <= 4) output(" The cockmilker is rather baggy at first, but it tightens up precipitously, the material puckering up at the base, and your cute little twig is soon being provided with as gasp-inducingly tight a fuck as it’s ever likely to get.");
			// Average cock:
			else if(cLength <= 12) output(" The cockmilker feels nice and tight around you, the machine barely having to adjust itself at all to take your fine-sized cock.");
			// Big cock:
			else if(cLength <= 24) output(" The cockmilker is a frustrating experience to begin with, the hole too small for your monster dick, but the machine quickly adjusts, the material fanning out from the hole and moving backwards, until you’re being provided with a wonderfully long, large ona-hole perfectly suited for a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber.");
			// Massive cock:
			else output(" The cockmilker gives a whine and a throb as you keep feeding your thickness in, and you " + pc.mf("chuckle", "giggle") + " as at last the machine beeps in protest, choked upon your massive, totemic dick with you barely halfway in. It’s not giving up, though. After a slight pause the material puffs out massively, swelling out of the metal seams of its housing with a sound like a balloon inflating. You push inwards, it keeps bulging outwards, and you groan with contentment as your " + (pc.balls >= 2 ? "[pc.balls]" : "[pc.thighs]") + " touch the crinkled opening. Finally, a hole that can take a " + (!pc.isHerm() ? "man" : "herm") + " of your caliber!");
			output(" You judder your [pc.hips] into the machine, pleasure coursing through your shaft, eyes fixed upon the screen.");
			output("\n\nThe human officer has the kaithrit prisoner’s head firmly pressed between her open thighs, dispassionately watching a live feed of a gryvain interrogating some sort of lithe insectile crossbreed attached to a steel rack.");
			output("\n\n<i>“Ramp up the current. We know he knows where his friends hid the polonium,”</i> she directs into a mic. <i>“You aren’t getting up his ass until we get it out of him.”</i> The color in her cheeks rises, her mouth opening as she watches the willowy male judder and wail on the screen, and you find yourself humping the exquisitely tight and silky cockmilker with heedless abandon, the pressure in your " + (pc.balls >= 2 ? "gonads" : "prick") + " intensifying");
			if(dildo) output(", the dildo pumping you all the while");
			output("...");
			break;
		case 5:
			output("<i>“Ooh,”</i> giggles the cartoon Tamani, fixing her eyes with yours. <i>“Well, it’s not quite my favorite way of collecting cum... but I’m not going to say no to a sweet donator like you. Ok!”</i>");
			output("\n\nShe leaps up and grabs one of the dildos, which has straps attached to its base. She fastens it around her waist as a faceless figure appears on-screen, mired in a cockmilker. It’s evidently a simplified version of you," + (pc.hasBreasts() ? " going off the size of its boobies" : " going off its flat chest") + " and its [pc.skinColor] skin.");
			output("\n\n<i>“Put that");
			if(cLength > 4) output(" gorgeous piece of meat");
			else output(" cute lil’ toy");
			output(" into the slot,”</i> whispers Toon Tamani, blinking her big eyes at you. <i>“For Tamani.”</i> You do so, sighing as you slide your [pc.cock " + cIdx + "] into the silky, slinky embrace of the receiver. A pleasurable tremor runs through it as the machine vibrates, adjusting to your size and stimulating you until you are hard and ready. You gasp as the base suddenly tightens up, vice-like, around your base.");
			output("\n\n<i>“Theeere we go,”</i> purrs Tamani, swaggering up behind the visualization of you, strap-on waggling. <i>“It’d be a dreadful shame for you to get away before I’ve milked every last drop out of you, wouldn’t it?”</i>");
			output("\n\nShe grips the hips of the cartoon version of you, positions her comically oversized dildo between your butt cheeks, and then slowly works her way in. You gasp and tense up slightly as the mechanical prosthetic mirrors exactly what’s happening on screen, piercing your [pc.anus] and slowly working its way into your sensitive insides.");
			output("\n\n<i>“Relax, sweet buttslut of mine,”</i> says Tamani soothingly. <i>“Wait just a sec...”</i> she reaches up and squeezes one of her plush tits, biting her lip with pleasure. As she does, your back passage is warmed by a sudden gush of lubricant squirted out of the dildo’s end. <i>“Theeere we go!”</i> the human cries winningly, thrusting her pink hips into cartoon you with enough force to make their flesh ripple. The actual prosthetic follows suit, of course, and you whine as it easily slides all the way in, opening your colon up and pressing into you deep.");
			output("\n\nToon Tamani has a dorkily happy expression on her round face as she saws into you, each pump of her hips coinciding precisely with a heavy stroke of the thick, obdurate robo-cock into you. Cartoon you simply has a deep blush across their face.");
			output("\n\n<i>“Is that good?”</i> she teases, holding your gaze, breasts jouncing up and down. <i>“Do you like bottoming for the biggest cumslut in the galaxy? It’s usually around now the milker detects your prostate...”</i> You whine as a sudden, brilliant surge of sensation lights up your nerve endings, making you spasm against the machine, [pc.cock " + cIdx + "] flexing. <i>“Hahaha, I felt that from here!”</i> Tamani casually slaps cartoon you’s ass, which is transferred as a slight electric shock down the dildo’s shaft, making you writhe in trapped, painful pleasure. <i>“Here, let me make it even better...”</i>");
			output("\n\nShe reaches for her other tit, this time just gripping one of her erect nipples and carefully twisting, as if tuning a radio. A slight amount of steam blows out of her ears as the dildo starts juddering hard in response, all the while riding over your poor, tender prostate again and again. Cartoon you has grown a pair of [pc.eyeColor] eyes and a mouth - the former are crossed and the latter has its [pc.tongue] hanging out of it. It’s not far from the truth.");
			output("\n\n<i>“How do you like it, [pc.name]?”</i> exclaims the pink, punky toon with a slightly manic edge, thrusting her wide hips into you all the while. <i>“Nice and slow? Tender and meaningful? Well, too bad - your Tamani’s piece of ass right now, and Tamani likes doing it hard!”</i>");
			output("\n\nYou moan and wail as the dildo reams you, forcing your [pc.cock " + cIdx + "] into the silky, tight knead of the milker, pinioned between the two unrelenting mechanical forces. It’s agonizingly wonderful to just submit to it, see yourself simply as that cartoon you Tamani is ass-fucking with enough force to generate blur-lines, and copy their motion as they moan, arch their back, and cum...");
			break;
	}
	
	processTime(55 + rand (11));
	cumQ = cumMilkerCumEstimate();
	
	clearMenu();
	addButton(0, "Next", breedwellCockmilkerOutput, [cIdx, dildo, true, cumQ, track]);
}

// Output scenes
public function breedwellCockmilkerOutput(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	
	var cIdx:int = arg[0];
	var dildo:Boolean = arg[1];
	var porno:Boolean = arg[2];
	var cumQ:Number = arg[3];
	var track:int = (arg[4] != null ? arg[4] : -1);
	
	var cumPrice:Number = breedwellCumCreditValue(cumQ);
	
	// Low output
	if(cumQ < 500)
	{
		output("You arch your back and nut, groaning hoarsely as [pc.cum] squirts into the clutching confines of the receiver. The base of the milker limpets you close, ruthlessly holding you to it so not a single drop can escape it. The tubes twitch in front of you, and your seed dribbles out onto the glass floor of the cylinder. Incapable of anything else, you hump the seal giddily until you’re flexing blanks, and finally the synthetic material relaxes enough for you to withdraw.");
		output("\n\nYou’ve produced nothing at all really, a few drops that look foolish in the giant canister, chaff in a silo. Every little helps, you suppose. The screen blinks back on, informing you that <b>you have been paid " + cumPrice + " credits for your " + Math.round(cumQ) + " mL donation</b>.");
	}
	// Middling output 
	else if(cumQ < 1000)
	{
		output("You arch your back and nut, groaning hoarsely as [pc.cum] spurts into the clutching confines of the receiver. The base of the milker limpets you close, ruthlessly holding you to it so not a single drop can escape it. The tubes twitch in front of you, and your seed splatters and then dribbles out onto the glass floor of the cylinder. Incapable of anything else, you hump the seal giddily until you’re flexing blanks, and finally the synthetic material relaxes enough for you to withdraw.");
		output("\n\nBy most measures you’ve produced a lot, enough that a partner would protest if you started waving your stuff around in the bedroom, but the pool of [pc.cum] that doesn’t quite cover the whole of the glass floor of the giant canister seems slightly pitiful in this context. Never mind, you did your bit. The screen blinks back on, informing you that <b>you have been paid " + cumPrice + " credits for your " + Math.round(cumQ) + " mL donation</b>.");
	}
	// Large output
	else if(cumQ < 5000)
	{
		output("You arch your back and unload gloriously, groaning hoarsely as you flume line after line of [pc.cum] into the clutching confines of the receiver. The base of the milker limpets you close, ruthlessly holding you to it so not a single drop will escape it. The tubes attaching it to the cylinder dance in front of you, hungrily siphoning away your huge output. You keep your eyes fixed upon the glass cylinder ahead of you and keep thrusting away at the seal, grunting with deep pleasure as you watch your seed first explode out into the container, then pour out steadily. You don’t stop until your " + (pc.balls >= 2 ? "[pc.balls] are" : "[pc.cock " + cIdx + "] is") + " achingly dry, and the synthetic material relaxes enough for you to withdraw.");
		output("\n\nThe floor of the cylinder has completely disappeared; you’ve filled it at least five or six inches deep with [pc.cumVisc], [pc.cumColor] semen. Wonderful! You feel a glow of accomplishment (although the vast tract of glass you didn’t fill haunts you a little. What kind of bloated monsters are they expecting here, anyway?) The screen blinks back on, informing you that <b>you have been paid " + cumPrice + " credits for your " + Math.round(cumQ) + " mL donation</b>. There’s even a little cartoon Tamani there, giving you a thumbs up and a ‘Good job, stud!’");
	}
	// Massive output
	else if(cumQ < 10000000)
	{
		output("You feel your vast reserves boiling up inside of you, and a howl of pure joy is ripped from your [pc.lips] as it finally finds release, coursing up your shaft and exploding out of your dilated slit into the receiver. The base of the milker attempts to limpet to you, and then gives up a second later when the sheer quantity of hot [pc.cum] overwhelms it, great gobbets of your seed oozing and spraying out from the seal.");
		output("\n\nThe tubes in front of you groan as they draw it away the best they can, the clear synthetic material straining as your [pc.cock " + cIdx + "] flexes up gloriously again and again. You keep your eyes fixed upon the glass cylinder ahead of you, thrusting your [pc.hips] away at the seal, groaning with overwhelming pleasure as you watch your [pc.cum] geyser out into the container first like an opened fire hydrant, then in thick, controlled bursts, the [pc.cumVisc] liquid pooling thickly against the walls. You’re over the overwhelming urge now, but your loins have so much to give, and you’re determined to thrust every last milliliter of your delicious, fecund cum into that vast container.");
		output("\n\nSweat soaks your [pc.skinFurScales] by the time you’re firing blanks, [pc.cumColor] fluid dripping down your [pc.thighs], but you are now looking up at a ten foot high glass cylinder that is almost full to the brim with your cum. The screen blinks on, informing you that <b>you’ve donated " + Math.round(cumQ) + " mLs for " + cumPrice + " credits</b>. A cartoon Tamani is gazing at the total, her pupils hearts, hands clutched together, drooling slightly. You sit back, [pc.cock " + cIdx + "] slowly slithering back outwards, with a wheezing, deeply satisfied sigh.");
	}
	// Too much
	else
	{
		output("You’ve been waiting for this moment. You felt rather like you were carrying several kegs between your " + (pc.hasLegs() ? "legs" : "thighs") + " when you [pc.move] into this cubicle, and now you’re all ready to ride this [pc.cumVisc], [pc.cumColor] tornado. Your vast reserves of cum seethe and swell inside of you, rising to an ecstatic point, and a howl of pure joy is ripped from your [pc.lips] as it finally finds release, surging up your shaft and exploding out into the receiver.");
		output("\n\nYou would have been hurled back by the force of it had the base of the milker not automatically tightened around you, but even that gives up a moment later when the next load of [pc.cum] rockets out of your [pc.cock " + cIdx + "], and you yourself have to take firm hold of the milker’s handles to remain in place. Your eyes cross and your [pc.tongue] lolls out as you ejaculate again, and again, and again, a gallon of seed thrown out with every ecstatic flex, and at no point does it feel like you’re even close to getting it all out there.");
		output("\n\nThe tubes in front of you flail as they bulge up with [pc.cum], and it geysers into the glass container like a stream in spate. Your [pc.hips] are on auto-pilot, thrusting automatically into the strained machinery as you keep giving it more, and more and more, groaning with overwhelming pleasure as [pc.cumColor] fluid sloshes heavily against the walls of the container until it’s filled to a point high above you.");
		
		pc.orgasm();
		
		clearMenu();
		// Willpower > 50%
		if(pc.WQ() > 50)
		{
			output("\n\nYour seed churns higher and higher, up to the top... a dim voice is telling you maybe you should stop... but you’re lost in the throes of intense ecstasy, there’s so much more cum left to launch up your red-hot shaft, and a deeper, more savage voice is telling you to keep going...");
			
			pc.orgasm();
			
			// [Keep Going] [Stop]
			addButton(0, "Keep Going", breedwellCockmilkerOverLimit, [cIdx, cumQ, true]);
			addButton(1, "Stop", breedwellCockmilkerOverLimit, [cIdx, cumQ, false]);
		}
		// Otherwise: //go to Keep Going
		else
		{
			addButton(0, "Next", breedwellCockmilkerOverLimit, [cIdx, cumQ, true]);
		}
		return;
	}
	
	if(!porno && !dildo)
	{
		output("\n\nYou");
		if(pc.isCrotchGarbed()) output(" put your [pc.lowerGarments] back on and");
		output(" exit the cubicle, [pc.eachCock] throbbing pleasantly.");
		
		pc.orgasm();
	}
	else if(!porno && dildo)
	{
		output("\n\nThe dildo assiduously pumps into you all the way through your orgasm, ruthlessly kneading your prostate so that the machine may extract every last drop of [pc.cum] out of you. Only then does it slowly retract out of your puckered anus, dragging over your tenderized walls as it goes, leaving you wobbly and completely, achingly drained. It’s only after a couple minutes rest, and making use of the conveniently situated moistened towel dispenser, that you");
		if(pc.isCrotchGarbed()) output(" put your [pc.lowerGarments] back on and");
		output(" exit the cubicle, [pc.eachCock] throbbing mightily.");
		
		pc.orgasm();
	}
	else
	{
		switch(track)
		{
			case 1:
				output("\n\nComing down in a lusty haze, you watch the go’rahn and the now-heavily-swollen human relaxing together on the harness, talking quietly. Eventually the white rahn fetches a pen from her bag and writes a number on the girl’s forearm, kissing her on the brow before leaving. Cute. You");
				if(!dildo)
				{
					if(pc.isCrotchGarbed()) output(" put your [pc.lowerGarments] back on and");
					output(" exit the cubicle, [pc.eachCock] throbbing pleasantly.");
				}
				else
				{
					output(" wait for the dildo to slowly retract out of your puckered anus before");
					if(pc.isCrotchGarbed()) output(" putting your [pc.lowerGarments] back on and");
					output(" exiting the cubicle, [pc.eachCock] throbbing pleasantly.");
				}
				break;
			case 2:
				output("\n\nThe porno resumes with Red naked and covered in ausar spunk, alone in the clearing.");
				output("\n\n<i>“There you are!”</i> growls a husky female voice. A tall, bespectacled dzaan strides on screen. <i>“Playing with the doggies again? I bet you’ve lost the nice lunch your mother made you, too!”</i>");
				output("\n\n<i>“I’m sorry, auntie,”</i> replies Red miserably. <i>“They took all of it. And I’m so hungry...”</i>");
				output("\n\n<i>“Aww. Well, never fret, my dear.”</i> The dzaan unzips her pants and allows her fifteen inch cock and four fat balls to flop out. <i>“It just so happens that I haven’t been sucked off in weeks.”</i>");
				output("\n\nHappy endings are nice. You");
				if(!dildo)
				{
					if(pc.isCrotchGarbed()) output(" put your [pc.lowerGarments] back on and");
					output(" exit the cubicle, [pc.eachCock] throbbing pleasantly.");
				}
				else
				{
					output(" wait for the dildo to slowly retract out of your puckered anus before");
					if(pc.isCrotchGarbed()) output(" putting your [pc.lowerGarments] back on and");
					output(" exiting the cubicle, [pc.eachCock] throbbing pleasantly.");
				}
				break;
			case 3:
				output("\n\nThe porn finishes with Yorinn and Iker frotting nice and slow, clutching each other’s shoulders as they bump their prestigious, greased-up beast cocks against each other until Yorinn paints the zebra morph’s front in a geyser of thick jizz with a huge, ragged howl.");
				output("\n\n<i>“Sorry, man... I think we only managed to mess this ol’ place up even worse,”</i> says Yorinn, dolefully gazing around at the cum slathered equipment once he’s husked his last.");
				output("\n\n<i>“Oh, that’s alright.”</i> Iker scrunches the bear-morph’s hair fondly. <i>“You can always come back tomorrow.”</i>");
				output("\n\nSweet. You");
				if(!dildo)
				{
					if(pc.isCrotchGarbed()) output(" put your [pc.lowerGarments] back on and");
					output(" exit the cubicle, [pc.eachCock] throbbing pleasantly.");
				}
				else
				{
					output(" wait for the dildo to slowly retract out of your puckered anus before");
					if(pc.isCrotchGarbed()) output(" putting your [pc.lowerGarments] back on and");
					output(" exiting the cubicle, [pc.eachCock] throbbing pleasantly.");
				}
				break;
			case 4:
				output("\n\n<i>“Mmm. Worth a few days off your sentence, just about,”</i> smirks the Gastigoth officer on screen, considering her gleaming boots. The kneeling, naked kaithrit mumbles thanks. <i>“You’ll need to apply to get a better tongue attached if we’re going to subtract any serious amount of time, though. Same time tomorrow, C581.”</i>");
				output("\n\nWas any of that real, or gruesome, eerily realistic fantasy? You");
				if(!dildo)
				{
					if(pc.isCrotchGarbed()) output(" put your [pc.lowerGarments] back on and");
					output(" leave the cubicle feeling slightly dazed and unreal yourself.");
				}
				else
				{
					output(" wait for the dildo to withdraw out of your puckered anus before");
					if(pc.isCrotchGarbed()) output(" putting your [pc.lowerGarments] back on and");
					output(" leaving the cubicle, feeling slightly dazed and unreal yourself.");
				}
				break;
			case 5:
				output("\n\n<i>“Every last drop! Every last drop! Theeeere we go,”</i> coos Tamani, her energetic pumping blessedly slowing, her eyes fixed upon a cartoon approximation of the glass cylinder. <i>“Good [pc.boy]!”</i> She wipes a bead of sweat from her brow, blows out her cheeks and withdraws her strap-on with a cork-like ‘pop’. You moan raggedly as the dildo drags backwards over your brutalized walls and out of your gaped asshole. <i>“I’m gonna need a drink after all that!”</i>");
				// Small-medium output:
				if(cumQ < 1000) output(" She harrumphs as she takes in the modest amount of [pc.cum] you’ve produced on-screen. <i>“Not that you’re much use there.”</i> She wags a stern finger at cartoon you, slumped exhausted and quivering over the machinery. <i>“Get some cum mods down you, or befriend a galotian, [pc.name]! That’s your homework from Mistress Tamani. Run along with you now!”</i> The screen winks off.");
				// Otherwise:
				else output(" She hurries over to a tap on the cylinder’s side and draws herself a large, [pc.cumColor] glass. <i>“Luckily I have gorgeous, juicy cumpumps like you about the place. Mmm...”</i> A lipsmack and a horny moan follows her polishing off the glass in a single gulp. <i>“Y’know how addicted to cum I am? I built a business empire just so I’d have a limitless supply of the stuff. Ta ta for now, [pc.name]! Me and my big mean strap-on will always be waiting for your slutty, juicy ass!”</i>");
				output("\n\nIt’s only after a couple minutes rest, and making use of the conveniently situated moistened towel dispenser, that you");
				if(pc.isCrotchGarbed()) output(" put your [pc.lowerGarments] back on and");
				output(" exit the cubicle, [pc.eachCock] throbbing mightily.");
				break;
		}
		pc.orgasm();
	}
	
	pc.credits += cumPrice;
	breedwellCockmilkerEnd(cumQ);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function breedwellCockmilkerOverLimit(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	
	var cIdx:int = arg[0];
	var cumQ:Number = Math.min((arg[1] / 3), 20000000);
	var ohnoes:Boolean = arg[2];
	
	var cumPrice:Number = breedwellCumCreditValue(cumQ);
	
	// Stop
	if(!ohnoes)
	{
		output("It takes pretty much every vestige of your self-control, but with a heaving grunt you pull your [pc.cock " + cIdx + "] out of the cock-socket. You continue to gobbet [pc.cum] with heavy throbs, splashing over the walls, but by closing your eyes and steadying your breath you’re able to calm your over-sexed body down, and slowly it recedes down to a slow drool out of your [pc.cockHead " + cIdx + "].");
		output("\n\nIt’s just as well. More sober now, you gaze up at the entirely-full glass cylinder, creaking with the pressure of your ‘donation’. The cockmilker nozzle droops, oozing [pc.cum], looking every bit as spent as your cock does. Still, the machine is still functioning, and it’s able to present a read-out on its screen: <b>" + Math.round(cumQ) + " mL for " + cumPrice + " credits</b>. A cartoon Tamani is gazing at the total, her pupils hearts, hands clutched together, drooling slightly.");
		output("\n\nIt’s incredibly satisfying to look up at the cylinder and see it completely filled with your seed - even more so, to have conquered your own base impulses and not broken the thing (that deep, inward voice remains though, murmuring NEXT time you should sail onwards heedlessly, flood the whole damn station in your cum, show everyone exactly what kind of stud they’re dealing with here...)");
		output("\n\nAfter you gathered yourself a bit, you");
		if(pc.isCrotchGarbed()) output(" pull your [pc.lowerGarments] back on and");
		output(" limp out of the cubicle, [pc.eachCock] throbbing mightily, spattered pretty thoroughly in your produce. You could probably do with a shower.");
		
		processTime(15 + rand(4));
	}
	// Keep Going
	else
	{
		output("One of the tubes ruptures, spraying the fecund slime across your [pc.chest], face and the walls of the cubicle, an alarm begins to blare as the glass walls of the cylinder begin to creak, but you don’t care. There’s only the tight, silky embrace of the cockmilker and your desire to hump it until you’re completely dry.");
		output("\n\n<i>“Stop! Stop!”</i> cries someone. There’s a commotion going on behind you, but you don’t care. You barely half done. There’s only the tight, silky embrace of the cockm-");
		output("\n\nWarm, gooey hands grab you and roughly pull you backwards out of the wailing, smoking machine. You huff in surprise, shaken out of your sticky, orgasmic reverie, and your [pc.cock " + cIdx + "] flexes its next load straight up into the air, spattering both you and the three stern-looking rahn aides surrounding you.");
		output("\n\n");
		// PC is kui-tan OR has nuki nuts perk OR is male Treated:
		if(pc.raceShort() == "kui-tan" || pc.hasPerk("'Nuki Nuts") || pc.isTreatedBull())
		{
			output("<i>“I warned them!”</i> snaps the most senior-looking one. <i>“You let fucking");
			if(pc.raceShort() == "kui-tan") output(" kui-tan");
			else if(pc.hasPerk("'Nuki Nuts")) output(" kui-tan modders");
			else output(" cowdiddlers");
			output(" in, I said, and they’ll completely take the piss!");
		}
		else output("<i>“This is what happens when you set no goddamn limits!”</i> snaps the most senior-looking one. <i>“Fucking space drifters will mod themselves up and completely take the piss!");
		output(" We’ve got enough seed out of you,”</i> she goes on through pursed lips, gesturing at the creaking, groaning cylinder you’ve filled to bursting, " + indefiniteArticle(pc.cumColor()) + " obelisk that looks like it’s going to crack at any moment. <i>“Now and forever. Collect your payment, and <b>never</b> come back here.”</i>");
		output("\n\nYour [pc.cock " + cIdx + "] has been oozing a gentle river of [pc.cum] the whole time this has been going on, washing over everyone’s footwear, and the rahn leave in a disgusted hurry, shaking it off their heels. When, at last, you’ve stopped drooling enough that you can [pc.move], you stagger over to the screen to see how much you’ve earned. <b>The display is maxed out at " + Math.round(cumQ) + " mLs</b>.");
		output("\n\n<i>“Hey,”</i> says the cartoon Tamani, lounging by the figure and grinning at you. <i>“I don’t care what anyone says, super stud: You’re MY kind of " + pc.mf("guy", "girl") + ". Let’s meet up sometime, k?”</i> She produces <b>a sack of cash with the number " + cumPrice + " written on it</b> and deposits it in front of you, departing with a blown kiss.");
		
		processTime(35 + rand(9));
		
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		
		// PC barred from reentering Donation Wing
		flags["BREEDWELL_DONATION_LOCKED"] = 1;
	}
	
	// Cum-covered status active
	pc.applyCumSoaked();
	
	pc.credits += cumPrice;
	breedwellCockmilkerEnd(cumQ);
	
	currentLocation = "BREEDWELL_RECEPTION";
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Rahn Birthing Scene (Breedwell)
public function rahnBreedwellBirthing(pregSlot:int = 0, numEggs:int = 2):void
{
	clearOutput();
	clearBust();
	author("Nonesuch");
	
	output("Pressure at the base of your stomach, and a certain wriggling restlessness above, has been building for the last few hours. Weakness assails your [pc.legOrLegs], making you stagger, as liquid pain suddenly grasps at you deep, your cervix dilating. You’re giving birth!");
	// If on ship:
	if(InShipInterior()) output("\n\nAs quickly as you can, you waddle into your room, switch the auto-medkit on in the bathroom, carefully place yourself on the bed" + (!pc.isNude() ? ", rip off your [pc.gear]" : "") + " and spread your [pc.thighs], biological imperative virtually ordering you what to do.");
	// If in public:
	else if(InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR)) output("\n\nAs quickly as you can, you waddle into the nearest rest room, grab the medkit drone off the wall (frontier bathrooms are thankfully readily equipped for this sort of thing), lock yourself in a cubicle and spread your [pc.thighs], biological imperative virtually ordering you what to do.");
	// If in wild:
	else output("\n\nGroaning at the timing, you" + (!pc.isNude() ? " shed your [pc.gear] and" : "") + " position yourself the best you can in the inhospitable and non-hospital-able terrain. The wish that you’d stayed somewhere indoors and safe hums through your thoughts like a mosquito, but there’s no helping it now -- you’ll have to deliver on your own.");
	output("\n\n");
	if(InShipInterior() && 9999 == 0) output("The medkit drone monitors your pulse and places a large sheet beneath your thighs, instructing you to bear down rhythmically with soft, wordless beeps. ");
	output("You huff, sensation ripples and spasms in your stomach, you puff, your vaginal tunnel swells, you lose all of your breath, sense of time... and then in a rush a flood of gooey life pours easily out of your engorged pussy and onto the " + (InShipInterior() ? "sheets" : "floor") + ", a 6 pound single cell that huffs, takes a deep breath, and then begins to wail shrilly.");
	output("\n\nWow, that was so easy! Only boneless lifeforms boning you from now on! Pleasurable even, the way that slick, thickness poured over your puffy lips and [pc.eachClit]. It’s just as well, because... oh Void... it’s");
	if(numEggs > 2) output(" definitely");
	output(" not the last rahn you’re going to be bringing into the world today. Your eyes roll to the heavens as another series of clenches rack your sex, the next gel girl of yours impatiently following the same molten journey as the first...");
	if(numEggs > 10) output("\n\nThey come swiftly after the first couple, a great rush of brightly colored life issuing out of your gaped, flooded pussy. The last three struggle out together, forced out finally by something approaching an orgasm, your whole body tightening up and fluming [pc.girlCum] in order to get the triplets out of you.");
	output("\n\nAt long last your belly is flat and hollow-feeling for the first time in what seems like a year, and you have");
	if(numEggs == 2)
	{
		output(" two rahn babies, one in each arm. Void, they are the cutest things, tiny gel girls that wave their plump little limbs in bafflement at their surrogate mom and the airy wide space they’ve found themselves in.");
		if(pc.isLactating()) output(" They’re wedged against parts of your body they clearly do understand, however, and in a few moments you’re sighing in peace as they suckle your [pc.breasts].");
	}
	else if(numEggs <= 8)
	{
		output(" your arms full of rahn babies. The wailing has mostly stopped, and they are snuffling, frowning and cooing at their surrogate mom and the big wide world in general. They are the cutest goddamn things.");
		if(pc.isLactating())
		{
			output(" They’re wedged against parts of your body they clearly understand, however, and in a few moments you’re sighing in peace as tiny mouths hungrily suckle your [pc.breasts].");
			if(pc.totalNipples() >= numEggs) output(" Lucky you’ve got one for each.");
			else output(" The ones waiting their turn boop their tiny fists into their happily drinking sisters with a mixture of curiosity and impatience.");
		}
	}
	else
	{
		output(" armfuls, lapfuls and a " + (InShipInterior() ? "bed" : "floor") + " full of rahn babies. You hope Breedwell knew what they were doing when they hired you - there’s enough here to form a small colony on their own! The wailing has mostly stopped, and the tiny gel girls are waving their plump little limbs and cooing in bafflement at the big wide world they are now in, the ones you can’t fit onto your arms and lap pawing at you for attention. They are the cutest goddamn things.");
		if(numEggs > 10) output(" You are a broodmother par excellence, and you are soon fully and happily involved in what you should be doing. You suckle " + (numEggs > pc.totalNipples() ? (num2Text(pc.totalNipples()) + " of them at a time") : "all of them at once") + ", hungry mouths attached to your [pc.nipples] whilst you simultaneously clean and play with others, making them giggle by tickling their bare soles, skillfully switching between them so that each gets at least a little of mom’s time.");
	}
	
	processTime(45 + rand(11));
	
	clearMenu();
	addButton(0, "Next", rahnBreedwellBirthEnd, numEggs);
}
public function rahnBreedwellBirthEnd(numEggs:int = 2):void
{
	clearOutput();
	author("Nonesuch");
	
	// First
	if(flags["BREEDWELL_RAHN_BIRTHS"] == undefined)
	{
		output("A beep startles you out of your post-natal haze.");
		output("\n\n<i>“Hello, Surrogate [pc.name],”</i> says the bulky incubator drone with the Tamani logo emblazoned upon it in a sweet voice. <i>“Thank you for helping Breedwell with the great effort! You shall be credited for each rahn child you have borne to term. Rest assured, they shall be quite safe w--”</i>");
		output("\n\n<i>“Hello and congratulations, [pc.name] Steele,”</i> says the bulky incubator drone with the Steele logo emblazoned upon it in a matter-of-face voice, butting into the first drone from behind. <i>“Shall I take these children of <b>yours</b> to <b>your</b> nursery? I also have combat protocols installed to ward off cot-robbing interlopers. You merely need to say when.”</i>");
		output("\n\n<i>“You shall not be paid if you choose to keep any of the rahn you agreed to hand over at this time, surrogate [pc.name],”</i> says the sweet-voiced Tamani drone, turning slowly and deliberately to face the Steele drone. <i>“It may also affect your standing with the Breedwell Centre, should you choose to work with us again. I would also surely hate to vaporize any robotic personnel of yours for failing to keep their distance.”</i>");
		
		processTime(2);
	}
	// Repeat
	else
	{
		output("A beep, followed by a second beep in a slightly different tone, startles you out of your post-natal haze. Hovering nearby are both the Tamani drone and the Steele drone. They say nothing, simply waiting expectantly with their incubators, passive-aggressively occupying one another’s space. It’s remarkable how two silent, faceless entities can still manage to convey a simmering hatred for one another.");
		
		processTime(1);
	}
	IncrementFlag("BREEDWELL_RAHN_BIRTHS");
	
	// [Tamani] [Steele]
	clearMenu();
	addButton(0, "Tamani", rahnBreedwellBirthTamani, numEggs, "Tamani", "Hand the rahn over to the Tamani drone. You’ll get paid, and it’s what the whole enterprise was supposed to be about, after all.");
	addButton(1, "Steele", rahnBreedwellBirthSteele, numEggs, "Steele", "You carried and bore them, dammit. Nobody’s taking them away from you now!");
}
// Tamani
public function rahnBreedwellBirthTamani(numEggs:int = 2):void
{
	clearOutput();
	author("Nonesuch");
	
	output("It’s a wrench, holding the rahn babies for the last time, letting them play with your [pc.hair] and then placing them one after the other into the incubator, but you knew there’d be a scene like this eventually, and it’s hardly fair to decide they’re yours now.");
	output("\n\n<i>“Thank you so much, " + pc.mf("Mr.", "Ms.") + " Steele,”</i> trills the drone when the operation is done, rising into the air.");
	if(numEggs <= 3) output(" One of the rahn looks down at you soulfully, placing her");
	else output(" A few of the rahn look down at you soulfully, placing their");
	output(" tiny hands on the glass. Oh c’mon, don’t do <i>that.</i>");
	if (breedwellPremiumUnderContract()) output(" <i>“Your contract quota has been updated. We hope to see you at Breedwell Incubation Centre in the future!”</i>");
	else output(" <i>“Your bank balance has been updated. We hope to see you at Breedwell Incubation Centre in the future!”</i>");
	output("\n\nThe Steele drone has already departed, in some robotic approximation of a snit. You’re left with your own thoughts");
	if (!breedwellPremiumUnderContract()) output(" - and a healthier bank account");
	output(".");
	
	StatTracking.track("pregnancy/rahn eggs/birthed", numEggs);
	StatTracking.track("pregnancy/rahn eggs/tamani", numEggs);
	StatTracking.track("pregnancy/total births", numEggs);
	
	if (breedwellPremiumUnderContract()) breedwellPremiumRecordBirth(numEggs);
	else pc.credits += (600 * numEggs);
	
	processTime(3);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
// Steele
public function rahnBreedwellBirthSteele(numEggs:int = 2):void
{
	clearOutput();
	author("Nonesuch");
	
	output("You hold each of the rahn babies, giving them a little blow on the stomach to make them wiggle and squeal, and then place them one after the other into the incubator. It’s a bit tough to say goodbye to them, but it’s a huge appeasement to your instincts that you’ll get to see them again on Tavros.");
	output("\n\n<i>“I shall deliver them to " + (flags["BRIGET_MET"] != undefined ? "Ms. Briget" : "the nursery") + " safe and sound,”</i> the drone assures you, rising up into the air with its jelly baby payload. <i>“It might not be my place to say, " + pc.mf("Mr.", "Ms.") + " Steele - but in my estimation you’ve done the right thing.”</i>");
	output("\n\nThe Tamani drone has already departed, no doubt to inform its superiors of your transgression. Well, whatever. There’ll always be other opportunities to earn more money.");
	
	var r:BreedwellRahnPregnancyHandler = PregnancyManager.findHandler("RahnPregnancyBreedwell") as BreedwellRahnPregnancyHandler;
	var c:Child = Child.NewChildWeights(
		r.pregnancyChildRace,
		r.childMaturationMultiplier,
		numEggs,
		r.childGenderWeights
	);
	c.BornTimestamp = GetGameTimestamp();
	
	ChildManager.addChild(c);
	
	StatTracking.track("pregnancy/rahn eggs/birthed", numEggs);
	StatTracking.track("pregnancy/rahn eggs/day care", numEggs);
	StatTracking.track("pregnancy/total births", numEggs);
	StatTracking.track("pregnancy/total day care", numEggs);
		
	flags["BREEDWELL_PREM_KEEP_KID"] = 1;
	
	processTime(3);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}



