public function showJerynn(isNude:Boolean = false):void
{
	author("Gedan");
	showBust(isNude ? "JERYNN" : "JERYNN_NUDE");
	showName(jerynnIsMistress() ? "MISTRESS\nJERYNN" : "\nJERYNN");
}

public function metJerynn():Boolean
{
	return flags["MET_JERYNN"] != undefined;
}

public function jerynnIsMistress():Boolean
{
	return false;
}

public function jerynnPetstuffLevel():int
{
	return (flags["JERYNN_PETSTUFF_LEVEL"] == undefined ? 0 : flags["JERYNN_PETSTUFF_LEVEL"]);
}

public function jerynnPetstuffMax():int
{
	return 10;
}

public function jerynnAtBar(btnIdx:int):Boolean
{
	if (flags["JERYNN_APPROACHED"] != undefined && flags["JERYNN_APPROACHED"] == days) return false;
	if ((hours >= 3 && hours <= 9) || (hours >= 12 && hours <= 22))
	{
		output("\n\nA boisterous chortle rings through the interior of the bar.");
		if (!metJerynn()) output(" A quick look around the interior of the bar reveals a taur-like woman stood amongst her cohorts;");
		else output(" It could only be Jerynn and a quick glance around confirms it;");
		output(" she’s stood directly under one of the bar’s dingy little lights, the illumination only serving to better illustrate her imperious stature... and from this angle, an ass that looks like it could crush granite.");

		// [{Woman/Jerynn}] // Steal a few more glances at {the woman/Jerynn}.
		addButton(btnIdx, metJerynn() ? "Jerynn" : "Woman", approachJerynn, undefined, "Steal a few more glances at " + (metJerynn() ? "Jerynn." : "the woman."));
		return true;
	}
	return false;
}

public function approachJerynn():void
{
	clearOutput();
	showJerynn();

	output("You allow yourself to drink deeply of");
	if (!metJerynn()) output(" her form.");
	else output(" Jerynn’s form again.");

	if (!metJerynn())
	{
		output("\n\nHer four-legged lower half betrays a sense of power and stability");
		if (CodexManager.hasUnlockedEntry("Leithans")) output(" beyond even that of a leithan");
		output(". Her squat legs leave the bulk of her body low");
		if (CodexManager.hasUnlockedEntry("Leithans")) output("er");
		output(" to the ground, but are corded and thick with muscle; a theme repeated in her hindquarters. A thick, powerful tail erupts from the peak of her ass, framed by a pair of heavily-toned cheeks. The tail sweeps behind her, thinning along its length, covered like the rest of her body in a layer of fine, light blue scales, if the subtle glimmering of the light catching on the uneven surface is anything to go by.");
		
		output("\n\nThe scales draw your attention along her body, shimmering light acting almost like runway lights along her spine and up her back, interrupted only by a thermal bodice wrapped tightly around her upper-half’s midriff. Strength exudes from starkly defined muscles weaving over and around each other, adding bulk to her shoulders and down her arms.");
		
		output("\n\nHer sharply muzzled face is aimed squarely in your direction. You’ve been staring for... who knows how long, and somewhere along the line she must have noticed! Your gaze meets hers finally and the cocky grin parting the lines of her mouth redoubles as she makes her way towards you, her tail swaying to-and-fro behind her with every step.");
		
		output("\n\nWith your eyes fixed to her face, the final few details of her form filter in. A pair of aggressive horns explode from the top of her head, and where you’d expect hair, instead her scales give way to similarly angular plates that curve away from her body, layered over each other.");
		
		output("\n\nAs she closes in on you though, her chest takes center stage. The bodice cups under a pair of huge breasts, each easily as large as her head, and the flimsy little garment does little to arrest the impressive jiggling of her jugs as she closes the final few feet on her path directly towards you.");
		
		output("\n\n<i>“Something the matter, </i>friend</i>,”</i> she states matter of factly.");

		if (flags["UVETO_JERYNN_RESCUES"] != undefined)
		{
			if (pc.isBro())
			{
				output("\n\n<i>“Nothing’s the matter, babe. Just I swear I’ve seen that ass somewhere before and I just cannot place it,”</i> you boisterously reply.");
			}
			else if (pc.isBimbo())
			{
				output("\n\n<i>“Nothing’s the matter, just, like, I swear I’ve seen you somewhere before but I dunno!”</i> you reply with a giggle.");
			}
			else if (pc.isNice())
			{
				output("\n\n<i>“Oh no, you just look a little familiar is all,”</i> you reply.");
			}
			else if (pc.isAss())
			{
				output("\n\n<i>“Just trying to place where I’d seen you is all,”</i> you reply.");
			}
			else
			{
				output("\n\n<i>“Not at all, I just can’t shake the feeling I’ve seen you before,”</i> you reply.");
			}

			output("\n\n<i>“Is that so? Hah, well, maybe if I spun you upside down you’d recognise me.”</i>");
			
			output("\n\nConfusion furrows your brow, drawing a deep and hearty laugh from the draconic-taur.");
			
			output("\n\n<i>“Really? I pulled your sorry self outta’ the snow a");
			if (flags["UVETO_JERYNN_RESCUE_LAST"] < 14) output(" couple days");
			else if (flags["UVETO_JERYNN_RESCUE_LAST"] < 28) output(" couple weeks");
			else output(" while");
			output(" back and dragged your unconscious ass all the way back to Irestead. By my count that means you </i>owe<i> me, </i>friend<i>.”</i>");
			
			output("\n\n<i>“A drink, then?”</i> you offer, somewhat half-heartedly. It’s not every day you come face to face with your ex-anonymous saviour.");
		}
		else
		{
			if (pc.isBro())
			{
				output("\n\n<i>“Just properly appreciating the view, babe,”</i> you boisterously reply.");
			}
			else if (pc.isBimbo())
			{
				output("\n\n<i>“Nothing’s the matter, just, like, you kinda stand out you know?”</i> you reply with a giggle.");
			}
			else if (pc.isNice())
			{
				output("\n\n<i>“Oh no, you just... stand out a little is all,”</i> you reply.");
			}
			else if (pc.isAss())
			{
				output("\n\n<i>“You just stand out from the crowd is all,”</i> you reply.");
			}
			else
			{
				output("\n\n<i>“Nothing at all, it’s just not every day you get to see a dragon-pony,”</i> you reply.");
			}

			output("\n\n<i>“Is that so? Well, did nobody ever tell you that it’s not polite to stare, </i>friend<i>?”</i>");
			
			output("\n\nShe has you there, the bluster taken out of your sails just a little bit as she seems to");
			if (pc.tallness < 90) output(" loom ever larger over you.");
			else output(" stare you down even harder.");
			
			output("\n\n<i>“I think your impoliteness deserves an apology, don’t you think, </i>friend<i>,”</i> she almost growls at you, a demanding depth to her intonation.");
			
			output("\n\n<i>“A drink, then?”</i> you offer, somewhat half-heartedly.");
		}

		output("\n\nShe sidles up against your arm, her impressive bust enveloping you in the process. Strong arms wind around you and her hands make themselves busy, shamelessly fondling your");
		if (pc.isChestExposed() && !pc.isCrotchExposed())
		{
			output(" exposed [pc.nipples]");
			if (pc.hasCock()) output(" and [pc.cock] through your [pc.lowerGarments]");
			else if (pc.hasVagina()) output(" and [pc.vagina] through your [pc.lowerGarments]");
		}
		else if (!pc.isChestExposed() && pc.isCrotchExposed())
		{
			output(" [pc.upperGarments]-clad [pc.nipples]");
			if (pc.hasCock()) output(" and exposed [pc.cock]");
			else if (pc.hasVagina()) output(" and exposed [pc.vagina]");
		}
		else if (pc.isChestExposed() && pc.isCrotchExposed())
		{
			output(" exposed [pc.nipples]");
			if (pc.hasCock()) output(" and [pc.cock]");
			else if (pc.hasVagina()) output(" and [pc.vagina]");
		}
		else
		{
			output(" [pc.nipples]");
			if (pc.hasCock()) output(" and [pc.cock]");
			else if (pc.hasVagina()) output(" and [pc.vagina]");
			output(" through your [pc.clothes]");
		}
		output(".");
		if (!pc.isTaur())
		{
			output(" The other");
			if (pc.buttRating() <= 5) output(" pinches");
			else if (pc.buttRating() <= 10) output(" gropes");
			else
			{
				output(" grabs");
				if (pc.buttRating() <= 15) output(" at");
				else output(" a handful of");
			}
			output(" your [pc.ass] possessively, the the glassy-smooth scales on her fingers gliding effortlessly over your [pc.skinFurScales].");
		}

		output("\n\n<i>“No. Oh no no no. I have something far </i>far<i> better in mind,”</i> she whispers in your [pc.ear], a firm <i>bite</i> punctuating the implied offer. <i>“Jerynn. Remember the name. You’ll be </i>screaming<i> it later.”</i>");
		flags["MET_JERYNN"] = true;

		if (pc.isSubby())
		{
			pc.lust(pc.lustMax());
		}
		else
		{
			pc.lust(10);
		}

		processTime(10);

		clearMenu();
		addButton(0, "Allow", jerynnAllow, undefined, "Allow Her", "You like where this is going...");
		if (!pc.isSubby())
		{
			addButton(1, "Rebuff", jerynnRebuff, undefined, "Refuse Her", "Not like this...");
		}
		else
		{
			addDisabledButton(1, "Rebuff", "Refuse Her", "You can’t bring yourself to reject a strong hand like this...");
		}
	}
	else
	{
		output("\n\nYou can’t help but oogle the strong curves of her well-built frame. The memory of her powerful, purposeful gait... the sensual sway of her tail... to say nothing of her jiggling valley of cleavage... or the glassy-smooth texture of her scales against your [pc.skinFurScales]....");

		output("\n\nYou hadn’t even noticed her move as she sidles up against your arm again, her mountainous bust enveloping you in the process. Strong arms wind around you and her hands make themselves busy, shamelessly fondling your");
		if (pc.isChestExposed() && !pc.isCrotchExposed())
		{
			output(" exposed [pc.nipples]");
			if (pc.hasCock()) output(" and [pc.cock] through your [pc.lowerGarments]");
			else if (pc.hasVagina()) output(" and [pc.vagina] through your [pc.lowerGarments]");
		}
		else if (!pc.isChestExposed() && pc.isCrotchExposed())
		{
			output(" [pc.upperGarments]-clad [pc.nipples]");
			if (pc.hasCock()) output(" and exposed [pc.cock]");
			else if (pc.hasVagina()) output(" and exposed [pc.vagina]");
		}
		else if (pc.isChestExposed() && pc.isCrotchExposed())
		{
			output(" exposed [pc.nipples]");
			if (pc.hasCock()) output(" and [pc.cock]");
			else if (pc.hasVagina()) output(" and [pc.vagina]");
		}
		else
		{
			output(" [pc.nipples]");
			if (pc.hasCock()) output(" and [pc.cock]");
			else if (pc.hasVagina()) output(" and [pc.vagina]");
			output(" through your [pc.clothes]");
		}
		output(".");
		if (!pc.isTaur())
		{
			output(" The other");
			if (pc.buttRating() <= 5) output(" pinches");
			else if (pc.buttRating() <= 10) output(" gropes");
			else
			{
				output(" grabs");
				if (pc.buttRating() <= 15) output(" at");
				else output(" a handful of");
			}
			output(" your [pc.ass] possessively, the the glassy-smooth scales on her fingers gliding effortlessly over your [pc.skinFurScales].");
		}

		output("\n\n<i>“Here to pay off your tab, </i>friend<i>?”</i> she lustily drawls directly into your [pc.ear].");

		if (pc.isSubby())
		{
			pc.lust(pc.lustMax());
		}
		else
		{
			pc.lust(10);
		}

		processTime(10);

		clearMenu();
		addButton(0, "Allow", jerynnAllow, undefined, "Allow Her", "You know where this is going and you’re not about to say no...");
		if (!pc.isSubby())
		{
			addButton(1, "Rebuff", jerynnRebuff, undefined, "Refuse Her", "Not like this...");
		}
		else
		{
			addDisabledButton(1, "Rebuff", "Refuse Her", "You can’t bring yourself to reject a strong hand like this...");
		}
	}
}

public function jerynnRebuff():void
{
	clearOutput();
	showJerynn();

	if (pc.isTreated() || pc.lust() >= (pc.lustMax() * 0.85))
	{
		output("You scrunch your eyes closed tightly, willing every fiber of your");
		if (pc.isBimbo()) output(" bubbly");
		output(" being into acting on <i>your</i> orders, forcing the rising desire to go with the flow back down. Tentatively you take a step away from");
		if (!metJerynn()) output(" the woman");
		else output(" Jerynn");
		output(", peeling yourself out of her tight grasp.");
	}
	else
	{
		output("With a huff you force the rising desire to go with the flow back down and tentatively take a step away from");
		if (!metJerynn()) output(" the woman");
		else output(" Jerynn");
		output(", peeling yourself out of her tight grasp.");
	}

	output("\n\n<i>“It’s like that, is it?”</i>");
	
	output("\n\nYou nod, your breath still coming a little faster than normal.");
	
	output("\n\n<i>“Then you better not let me catch you staring again, right? I might not be so </i>accomodating<i> the next time,”</i> she growls through gritted teeth.");
	
	output("\n\nShe turns to head back to her compatriots at the other end of the bar... and catches you by surprise with a heavy thwack from her tail right on your [pc.asscheek]. Message received!");

	processTime(5);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function jerynnAllow():void
{
	clearOutput();
	showJerynn(true);

	if (jerynnPetstuffLevel() > 0 && (rand(jerynnPetstuffMax()) <= jerynnPetstuffLevel())) jerynnAllowPetstuff();
	else
	{
		var opts:Array = [jerynnAllowFucked];
		if (pc.hasCock()) opts.push(jerynnAllowRidden);

		output("You barely have time to say anything let alone accept before she has a firm grip around your wrist. Jerynn takes off towards the exit of the bar, with you stumbling to keep up as she drags you along beside her. The brisky, icy-cold air only batters your face for moments before you’re pulled inside a nearby apartment building and bundled into an elevator.");

		output("\n\nNo sooner have the doors slammed closed does the taur have you pinned up against the wall, her hands grasping and groping");
		if (pc.thickness >= 75 || pc.buttRating() >= 12 || pc.hipRating() >= 12 || pc.biggestTitSize() >= 6) output(" every plush curve they can find.");
		else output(" every inch of your body.");
	}
}

public function jerynnAllowFucked():void
{
	output("\n\n");

	if (pc.hasCock())
	{
		var cIdx:int = pc.biggestCockIndex();
		
		if (pc.isCrotchExposed()) output("Scaly d");
		else output("D");
		output("igits close around your");
		if (pc.isCrotchExposed()) output(" your exposed cock");
		else output(" the bulge in your [pc.lowerGarment]");
		output(", greedily");
		if (pc.biggestCockLength() < 12) output(" encircling");
		else output(" cupping");
		output(" your [pc.cock "+cIdx+"]. The taur squeezes on your meat, appraising it for her purposes and clearly finds you wanting.... ");
	}
	output("Her fingers");
	if (pc.hasCock())
	{
		output(" move lower");
		if (pc.balls > 0) output(" and cup under your [pc.balls]");
	}
	else
	{
		output(" move between your [pc.thighs]");
	}
	if (pc.hasVagina())
	{
		output(", the tips of her claws tickling the lips of your [pc.pussy]");
	}
	else
	{
		output(", the tips of her claws brushing against your");
		if (pc.hasPlumpAsshole()) output(" plump");
		output(" asshole");
	}
	output(". Her body pushes closer to smother you in cleavage, a satisfied groan rumbling in the draconic-taurs chest.");

	output("\n\n<i>“Yes, you’ll do just </i>fine<i>,”</i> she salaciously whispers into your ear, nibbling on the sensitive");
	if (pc.hasScales()) output(" scales");
	else output(" skin");
	output(" for good measure. When the doors open with a ping, she bundles you out of the elevator in front of herself and continues bodily manhandling you down the corridor towards her apartment, never wasting an opportunity to grab a handful of your [pc.ass].");

	output("\n\nRows upon rows of doors pass you by before one finally opens as you approach, Jerynn herding you through it. Once inside, she wastes no time in shoving you towards the recessed pit in the middle of the room. Thankfully, the soft base and the padding around the edges arrests most of your rapid descent, but you don’t have long to orient yourself before the taurs hands are shoving you back upright. Between a flurry of pokes and prods you gradually get maneuvered to the edge of the comfortable recess, lying atop the outer edge of it");
	if (pc.hasArmor() || pc.hasLowerGarment()) output(" somehow having lost your [pc.lowerGarments] in the process");
	output(".");

	output("\n\nShade casts itself over you as she looms over you, the heat of the taurs underbelly radiating against your back shortly before the glassy-smooth scales make contact with your [pc.skinFurScales]. The knees of her forelegs drop against the floor to either side of your head as Jerynn settles her weight atop you, smothering you under her much larger frame. A thick, throbbing mass of heat finds itself wedged between your [pc.buttcheeks] in the process. It tugs at your [pc.asshole] whenever the taur moves, sliding over your [pc.skinFurScales] and leaving a trail of wetness.");

	output("\n\nWith a heave Jerynn finds enough space to slide her cock out from between your bodies. It doesn’t go without the touch of your flesh for long though, its spade-like tip soon wedged against your [pc.vagOrAss]. She keeps it there, almost taunting you with the inevitable thrust that will eventually burrow it into your body. Carefully measured pressure tricks you into thinking she’s going to <i>finally</i> push forward... only for the penetration to never come. Instead, all you have is the slowly pooling heat of the taurs precum dribbling into your");
	if (!pc.hasVagina()) output(" ass");
	else output(" cunt");
	output(" and the incessant throbbing of her cock as it sits on the very precipice of fucking you.");

	if (pc.isBimbo())
	{
		output("\n\n<i>“Please, just fuck me!”</i>");
	}
	else
	{
		output("\n\n<i>“Fuck me");
		if (pc.lust() >= pc.lustMax() * 0.75) output(" already");
		output(",”</i> you almost surprise yourself with the barely audible whisper under your breath.");

		output("\n\n<i>“I’m sorry what was that, friend?”</i> Jerynn asks.");

		output("\n\n<i>“Fuck me");
		if (pc.lust() >= pc.lustMax() * 0.75) output(" already");
		output(",”</i> you repeat, far more assertive than before.");

		output("\n\n<i>“Aren’t you forgetting something, </i>friend<i>?”</i> she pushes with a chuckle.");

		output("\n\nSigh. <i>“Please, fuck me");
		if (pc.lust() >= pc.lustMax() * 0.75) output(" already");
		output("!”</i>");
	}

	output("\n\n<i>“Well, seeing as you asked so </i>nicely<i>,”</i> she half-laughs.");

	output("\n\nFinally, blissfully, she starts to push forward, the angled head of her cock popping into you with little fuss, especially with the aid of the liberal pool of pre already coating your insides.");
	if (pc.hasVagina()) pc.cuntChange(pc.gapestVaginaIndex(), jerynn.biggestCockVolume());
	else pc.buttChange(jerynn.biggestCockVolume());
	//{Not super gapey:
	if ((pc.hasVagina() && pc.gapestVaginaLooseness() < 5) || (!pc.hasVagina() && pc.ass.looseness() < 5))
	{
		output(" It’s slow going, but the taur maintains an even pace as she gradually reams you out with her cock. Its shape makes for the perfect tool to burrow into a tight");
		if (!pc.hasVagina()) output(" ass");
		else output(" pussy");
		output(" like yours, an increasingly large mass of dick being forced into you with the minimum of trouble.");
	}
	else
	{
		output(" Your");
		if (!pc.hasVagina()) output(" ass");
		else output(" pussy");
		output(" seems insatiable, even in the face of such a monstrously large cock. The taur just slides right in, inch after inch swallowed by your body like your");
		if (!pc.hasVagina()) output(" ass");
		else output(" cunt");
		output(" had been purpose-built to sheathe her cock.");
	}
	output(" Her rear legs shuffle forward as she feeds dick into you");
	if (pc.isBiped()) output(", nudging between your already splayed-wide thighs to keep you as spread and open as possible");
	output(".");

	output("\n\nJerynn coos deeply when her sheath kisses your");
	if (!pc.hasVagina())
	{
		output(" puckered");
		if (!pc.hasPlumpAsshole()) output(" ring");
		else output(" donut");
	}
	else
	{
		output(" stretched-taut labia");
	}
	output(". Her hips grind from side to side, almost as if testing the true pliability of your [pc.vagOrAss] to handle her draconic cock. The motion teases your");
	if (pc.hasCock() && !pc.hasVagina()) output(" prostate");
	else if (pc.hasVagina()) output(" g-spot");
	else output(" flesh in the most sensitive places");
	output(" and drags her silky-smooth scales across your");
	if (pc.hasScales()) output(" own");
	else output(" [pc.skinFurScales]");
	output(", serving to illustrate your current position; her body has you smothered securely against the floor, her legs pinning you to the edge of the pillow-lined pit and you have two feet of cock buried in your");
	if (!pc.hasVagina()) output(" ass");
	else output(" pussy");
	output(".");

	output("\n\nWhen she starts to pull back you almost feel yourself get dragged along with her cock. On instinct your hands wrap around the taurs sculpted forelegs for support, anchoring yourself in position whilst she draws the throbbing mass from your body. The support proves comforting when she reverses direction, forcing herself back into you far, far faster than during her initial reaming of your");
	if (!pc.hasVagina()) output(" ass");
	else output(" cunt");
	output(". Her next thrust is faster still, enough momentum for her heavy balls to");
	if (pc.balls > 0)
	{
		if (!pc.hasStatusEffect("Uniball")) output(" slap wetly against your");
		else output(" little trap pouch");
	}
	else
	{
		output(" slap wetly against your");
		if (pc.hasClit()) output(" [pc.clits]");
		else if (pc.hasCock()) output(" [pc.cock]");
		else output(" groin");
	}
	output(".");

	output("\n\nYou hang on for dear life as she slams into your [pc.vagOrAss] with increasing fervor. Every thrust grinds into your most sensitive places, her balls paddling your");
	if (pc.balls > 0)
	{
		if (pc.hasStatusEffect("Uniball")) output(" little");
		output(" balls almost as proof of her virility, of her position over you");
	}
	else if (pc.hasClit()) output(" engorged [pc.clits]")
	else if (pc.hasCock()) output(" engorged cock");
	else output(" groin");
	output(" adding a little extra touch just as the coursing pleasure of her cock grinding through you fades at the end of her strokes.");

	output("\n\nThe constantly increasing pace of the taurs savage fucking skips a beat when a bulb at the base of her cock begins to inflate. If only for a moment at least, a little extra force squeezing the taurs rapidly engorging knot into you. Your grip on her forelegs proves fruitful when she tries to pull back out though, your");
	if (!pc.hasVagina()) output(" ass");
	else output(" pussy");
	output(" trying in vain to hold on to Jerynn’s knot. It slips free with a lewd <i>’pop’</i> with a little struggle on both your parts... only to slam back into your [pc.vagOrAss] even harder with her next thrust.");

	output("\n\nYour close, oh so close. Torn between Jerynn literally breaking you before she orgasms and her burgeoning knot grinding your");
	if (pc.hasCock()) output(" prostate");
	else if (pc.hasClit()) output(" clit");
	else if (pc.hasVagina()) output(" g-spot");
	else output(" sensetive walls");
	output(" to dust, one final thrust is all it takes to set the taur off. Cum barrels up her draconic cock and into you, the first splash of liquid heat thundering into your");
	if (!pc.hasVagina()) output(" guts");
	else output(" womb");
	output(" the last little touch needed to push you over the edge too. More pulses jet into your");
	if (!pc.hasVagina()) output(" ass");
	else output(" cunt");
	output(" as your body does its utmost to milk every last drop it can from the taur, gurgles soon building deep in your [pc.belly].");

	output("\n\nTrapped between the taur and the floor so securely, there isn’t a lot of space for her prodigious load to fill and it soon starts to spurt out of the tight seal between her engorged knot and your taut");
	if (!pc.hasVagina()) output(" asshole");
	else output(" pussy");
	output(". The pulses of taur-spunk flowing into your body to displace the cloying load already contained offers just enough sensation to drag your orgasm on longer, stars filling your vision as you ride out the incredible high.");

	output("\n\nAfter a moment’s breath-catching - on both your parts - she");
	if (!pc.hasVagina()) output(" gingerly");
	output(" pulls away, her cock slowly sliding free over the course of a few stuttering steps. She collapses with a thud into the pit behind you, thoroughly satisfied. You though, feel fit to have a little nap right where you lie. Maybe when you wake up you’ll actually be able to feel your legs again....");

	output("\n\nA bright flash, bright enough to hurt your eyes even through closed eyelids, startles you.");

	output("\n\n<i>“Ahh, yeah that’s a keeper right there,”</i> Jerynn chuckles.");

	output("\n\nPeering over your shoulder, you spot her leaning against a corner of the sofa-pit, a glass tablet between her hands. She taps at it a little and a screen bursts to life filling a whole wall. Some more clacking of claws-on-glass follows whilst you regard the screen. With little fanfare all of the open application windows minimize, leaving you staring at her chosen background....");

	output("\n\nA photo of your fucked-to-gaping [pc.vagOrAss] sits front and center, a thick stream of jizz streaming out of your cavernous hole");
	if (pc.balls > 0) output(", over your balls,");
	output(" and puddling between your knees. The angle leaves enough out of frame to hide your identity from a casual viewer");
	if (pc.exhibitionism() >= 60) output(", sadly,");
	output(" but anybody who knew you would likely recognise you immediately....");

	output("\n\n<i>“I’m sure you can see yourself out whilst I clean myself up, </i>friend<i>,”</i> she says with an underlying hint of an order before peeling herself out of her comfortable corner and heading to her bathroom.");

	output("\n\nYou get the message pretty clearly");
	if (pc.hasLowerGarment() || pc.hasArmor()) output(" and tug your [pc.lowerGarments] back on");
	output(". Your knees feel weak when you get your legs back under you and you’re pretty sure your hips are going to have some <i>hellah</i> bruises come the morning... but the satisfied throb in your loins leads you to believe it was fucking worth it.");

	output("\n\nYour musing is cut short when the icy-cold air of Irestead slams into your [pc.face] again. One final tussle with your");
	if (pc.hasLowerGarment() || pc.hasArmor()) output(" pants");
	else if (pc.hasCock()) output(" cock");
	else output(" gear");
	output(" to make sure you’re");
	if (pc.isCrotchExposed() || pc.isChestExposed()) output(" somewhat");
	output(" presentable and you mingle back into the crowds, another face just making their way around Uveto.");

	processTime(30 + rand(10));
	pc.orgasm();
	if (pc.hasVagina()) pc.loadInCunt(jerynn, pc.gapestVaginaIndex());
	else pc.loadInAss(jerynn);

	currentLocation = "UVI N30";

	IncrementFlag("JERYNN_FUCKED");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function jerynnAllowRidden():void
{
	output("\n\n");
	
	if (pc.hasCock())
	{
		var cIdx:int = pc.biggestCockIndex();
		
		if (pc.isCrotchExposed()) output("Scaley d");
		else output("D");
		output("igits close around");
		if (pc.isCrotchExposed()) output(" your exposed cock");
		else output(" the bulge in your [pc.lowerGarment]");
		output(", greedily");
		if (pc.biggestCockLength() < 12) output(" encircling");
		else output(" cupping");
		output(" your [pc.cock "+cIdx+"]. Her body pushes closer to smother you in cleavage, a satisfied groan rumbling in the draconic-taurs chest.");
	}

	output("\n\n<i>“");
	if (pc.biggestCockLength() >= 24) output("Oooh yes, you might actually be a </i>challenge<i>");
	else output("Yes, you’ll do just </i>fine<i>");
	output(",”</i> she salaciously whispers into your ear, nibbling on the sensitive");
	if (pc.hasScales()) output(" scales");
	else output(" skin");
	output(" for good measure. Her firm grip");
	if (pc.biggestCockLength() <= 12) output(" around");
	else output(" on");
	output(" your package never lets up, hefting and stroking and <i>squeezing</i> the beginnings of life into your oncoming erection. When the doors open with a ping, that same grip tightens to the edge of pain... and then she sets off out of the elevator, dragging you along dick-first!");

	output("\n\nBlessed relief comes when you finally make it into Jerynns apartment and her hand falls away from your crotch... shortly before she pushes you over into the recessed pit filling the center of the room. Thankfully, the soft base and the padding around the edges arrests most of your rapid descent, but you don’t have long to orient yourself before the taurs hands are shoving you back upright. Between a flurry of pokes and prods you gradually get pushed to the edge of the comfortable recess, sat on the outer edge of it");
	if (pc.hasArmor() || pc.hasLowerGarment()) output(" somehow having lost your [pc.lowerGarments] in the process");
	output(".");

	output("\n\nA scaly red ass hovers inches away from your face, the taurs thick tail raised up high to reveal her plump pussy already glistening with arousal. You could swear it winks as at you as the raw scent of <i>need</i> hits your nose and burrows deep into your brain like a parasite, clamping on to your thoughts and steering them inexorably towards filling the taur with as much cock as possible. Your body responds exactly as required with hearty throbs, stiffening your [pc.cock "+cIdx+"] into an diamond-hard bar of literal need to <i>fuck</i> in seconds.");

	output("\n\n<i>“Be a good [pc.boy],”</i> she teases");
	if (pc.biggestCockLength() >= 24) output(", taking a couple of steps away from you.");
	else if (pc.biggestCockLength() >= 12) output(", taking a step away from you.");
	else output(".");

	output("\n\nYour hand is wrapped around the [pc.sheath "+cIdx+"] of your dick in milliseconds, your [pc.cockHead "+cIdx+"] wedging into the lusty cavern of cunt as you");
	if (pc.biggestCockLength() <= 12) output(" lift");
	else output(" heft");
	output(" it according to Jerynns demands. Properly prepared she takes a half-step backward, sinking");
	if (pc.biggestCockLength() >= 24) output(" the first foot of your massive prick");
	else output(" your prick");
	output(" into her swelteringly hot pussy with ease.");
	if (pc.biggestCockLength() >= 24) output(" More steps quickly follow the first as her oversized body proves more than capable of handling your extreme endowment.");
	output(" A little wiggle of her rear and she settles her firm ass down on your lap with a lust filled moan, leaving every inch of your [pc.cockNounSimple "+cIdx+"] buried in her convulsing cunt.");

	output("\n\nThe scales smothering your");
	if (pc.bellyRating() >= 5 || pc.thickness >= 30) output(" [pc.belly]");
	else output(" abdomen");
	output(" pull away, inch after inch of your cock wetly sliding out of her cunt. All those inches return to her heated depths, with interest, as her ass crashes back into your body at speed forcing an ‘oomph’ of surprise from you. And again, she pulls away slowly and then forces herself back against you at speed; make no mistake, there is fucking happening but Jerynn is most definitely the one doing it. You’re just along for the ride, the supplier of the fuckpole she’s chosen to sate her lusts with.");

	output("\n\nAt some point you find your [pc.hands] holding on to her ass for dear life, your fingers sinking into the meaty flesh of her flanks. It doesn’t slow her down, not one bit. If anything she seems emboldened by it, taking some perverse pleasure from riding your cock so hard you feel as though your [pc.hips] might give out at any moment.");
	if (pc.hasKnot(cIdx)) output(" The only thing that does seem to give her pause is your [pc.knot "+cIdx+"], and even then only for long enough for a full-body shiver to interrupt conscious control of her legs. It’s extra girth resists entering the taurs pussy before her puffy lips swallow it whole, slipping free with a lewd <i>’pop’</i> when she pulls away from you again.");

	output("\n\nYour close, oh so close. Torn between Jerynn literally breaking you before she orgasms and your intense need to blow your load, one final crash is all it takes to set you off like a nuclear warhead. Cum barrels up your [pc.cock "+cIdx+"] and into the draconic taur, the first splash of your liquid heat thundering into her cunt setting off Jerynn too.");
	if (pc.cumQ() >= 1000) output(" More pulses jet into her cunt as her body works to milk every drop it can from you");
	if (pc.cumQ() >= 5000) output(", her belly gurgling as you pump more and more spunk deep into her.");
	if (pc.cumQ() >= 10000) output(" She wiggles her ass firmly against your body whilst your twinned orgasms rage on");
	if (pc.cumQ() >= 25000) output(" her belly bloating hugely under the sheer mass you’re filling her with");
	if (pc.cumQ() >= 100000) output(" until she almost scrapes the floor.");
	if (pc.cumQ() >= 125000)
	{
		output(" But your [pc.balls] still");
		if (pc.balls > 1) output(" aren’t");
		else output(" isn’t")
		output(" done, forcing yet more [pc.cum] into her desperate cunt until her underbelly pillows out against the mattress and her flanks fill out to either side.");
	}
	if (pc.cumQ() >= 250000)
	{
		output(" Only when you’ve somehow managed to pump so much spunk into her that she’s three times as wide as normal does her body finally say it’s had enough, the remainder of your shared eternity-long orgasm spurting out of the tight seal of her plump pussy around your [pc.cock "+cIdx+"].");

		output("\n\n<i>“<b>Fuck</b>, [pc.name]. Just... <b>fuck</b>”</i>, she exasperates, <i>“if you keep cuming like a fucking freight-hauler I might have to fucking </i>keep<i> you!”</i>");
	}

	output("\n\nAfter a moment’s breath-catching - on both your parts - she");
	if (pc.biggestCockLength() >= 24) output(" gingerly");
	output(" pulls away,");
	if (pc.biggestCockLength() >= 24) output(" your cock slowly sliding free over the course of a few stuttering steps");
	else output(" your cock sliding free with a pop");
	output(". Jerynn");
	if (pc.cumQ() >= 10000) output(" carefully");
	output(" makes her way towards her bathroom");
	if (pc.cumQ() >= 25000) output(" after a minor struggle stepping out of her sofa-pit thanks to the freely roiling mass of jizz bloating her belly");
	output(".");

	output("\n\n<i>“I’m sure you can see yourself out whilst I clean myself up, </i>friend<i>,”</i> she says with an underlying hint of an order.");

	output("\n\nYou get the message pretty clearly");
	if (pc.hasArmor() || pc.hasLowerGarment()) output(" and tug your [pc.lowerGarments] back on");
	output(". Your knees feel weak when you get your legs back under you and you’re pretty sure your hips are going to have some <i>hellah</i> bruises come the morning... but the satisfied throb in your loins leads you to believe it was fucking worth it.");

	output("\n\nYour musing is cut short when the icy-cold air of Irestead slams into your [pc.face] again. One final tussle with your");
	if (pc.hasArmor() || pc.hasLowerGarment()) output(" [pc.lowerGarment]");
	else output(" cock");
	output(" to make sure you’re");
	if (pc.isCrotchExposed() || pc.isChestExposed()) output(" somewhat");
	output(" presentable and you mingle back into the crowds, another face just making their way around Uveto.");

	processTime(30 + rand(10));
	pc.orgasm();

	currentLocation = "UVI N30";

	IncrementFlag("JERYNN_FUCKED");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function jerynnAllowPetstuff():void
{
	
}