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
	// 9999
	return false;
}

public function jerynnPetstuffLevel():int
{
	return (flags["JERYNN_PETSTUFF_LEVEL"] == undefined ? 0 : flags["JERYNN_PETSTUFF_LEVEL"]);
}

public function isWearingJerynnsCollar():Boolean
{
	// 99999
	return false;
}

public function isWearingJerynnsHarness():Boolean
{
	// 9999
	return false;
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

	if (isWearingJerynnsCollar() && jerynnPetstuffLevel() > 0 && (rand(jerynnPetstuffMax()) <= jerynnPetstuffLevel())) jerynnAllowPetstuff();
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
	clearOutput();
	showJerynn(true);

	output("The little tag hanging from the collar wrapped tightly around your neck jangles faintly as Jerynn clips a leash - <i>your</i> leash - securely alongside it. A wordless tug and she takes off, leading you out of the bar amidst a sea of lustful stares and half-whispered lewd comments.");

	output("\n\nShe drags you out into the frigid cold and towards a nearby apartment block, soon bundling you into an elevator once inside. Away from the prying eyes of the public, her hands are all over you, grasping and groping");
	if (pc.buttRating() >= 10 || pc.hipRating() >= 10 || pc.biggestTitSize() >= 6 || pc.thickness >= 50) output(" every plush curve they can find");
	else output(" every inch of your body");
	output(". Her amazonian arms pull you close, smothering you");
	if (pc.tallness >= 96) output(" against");
	else output(" into");
	output(" her breasts... putting your [pc.ear] just within nibbling distance.");

	output("\n\n<i>“Now be a good </i>pet<i> for me, you want a </i>treat<i> don’t you?,”</i> she salaciously whispers into your ear, another nibble on the sensitive");
	if (pc.hasScales()) output(" scales");
	else output(" skin");
	output(" for good measure.");

	output("\n\nWhen the elevator door opens you sink down to your hands and knees without a second thought, following behind the amused taur; a <i>good</i> pet indeed. Your position gives you a perfect view between her legs whilst she leads you to the privacy of her apartment, her hefty balls swaying to and fro almost hypnotically with each sauntering step she takes. They jounce and jostle, left to right and back... you swear you can almost <i>hear</i> them burbling, cooking up a huge, thick load of cum fit to drown a person- fit to drown a <i>pet</i>, you correct yourself.");

	output("\n\nYou bump into them without realising, planting a lazy open-mouthed kiss right on");
	if (jerynnIsMistress()) output(" Mistress’s");
	else output(" Jerynn’s");
	output(" left nut in the process. You’re already inside her apartment, the trip down the corridor and through the door having blown straight by your dick-dazed consciousness.");

	output("\n\n<i>“Ooh, somebody’s </i>eager<i> aren’t they! I think I know what treat my pet really wants!”</i> she chuckles.");

	output("\n\n[pc.BarkMeow]!");

	output("\n\n<i>“Let’s get you </i>dressed<i> then,”</i> she starts,");
	if (isWearingJerynnsHarness()) output(" relinquishing you of all of your gear with the exception of your harness");
	else if (!pc.isNude()) output(" relinquishing you of all of your gear. A quick fish through the pockets of her smart coat, hanging just by the door, rewards her with a familiar harness, soon slipped around your limbs");
	else output(" a quick fish through the pockets of her smart coat, hanging just by the door, rewards her with a familiar harness, soon slipped around your limbs");
	output(". The magnetic clasps hum to life and you carefully bend your elbows and knees double, allowing the paired locks to snap together.");

	output("\n\nProperly dressed, Mistress leads you over to the recessed sofa in the center of her lounge. She props herself up in a corner, leaving her tauric underbelly and juicy balls laid bare before you... just hanging there, the plump orbs each almost as big as your head. They jump a little every now and then, their owner straining as the weight of their load pulls uncomfortably at their scaley connection to her body.");

	output("\n\nA sharp tug on your leash is all the prompting you need, diving [pc.face]-first into her crotch. Your [pc.lips] plant themselves reverentially all over the scaly surface of the prodigus nuts, paying homage to their virility and power. The sheer weight of them throbs heavily against your [pc.tongue] when you open your mouth, softly sucking on their exterior; they’re far too large to fit into your mouth so you have to make do by lapping across their surface, slowly spit shining every last scale.");

	output("\n\nYour careful ministrations soon have the spade-like tip of");
	if (jerynnIsMistress()) output(" Mistress’s");
	else output(" Jerynn’s");
	output(" cock peeking from her sheath and it proves too tempting a target to leave alone. Your");
	if (pc.lipRating() >= 4) output(" plush cock-pillows live up to their name as you close your mouth");
	else output(" lips close around");
	output(" her draconic dickhead in a tight seal, your cheeks hollowing as you suck softly on her flesh. A soft moan is the only response you get,");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" paying you little attention; she’s busy watching something on her wall-sized screen, trusting her pet to continue serving her bestial cock without input.");

	output("\n\nAnd serving you do, inch after inch of cock emerging from the taurs sheath to be greeted by your warm, suckling maw. You alternate between slurping on the head and kissing along its length, lapping at the ridges running along the underside and ensuring not one millimeter of it goes unattended.");

	output("\n\nA tug at your leash finally grabs your attention, lost in your little world between the taurs legs.");

	output("\n\n<i>“I said </i>up<i> pet. It’s time for your treat,”</i>");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" orders, patting the floor around the edge of her sofa-pit. You clamber up with a little helping hand from her on the way, more orders to <i>lay down</i> and <i>roll over</i> soon following. She has you lying on your back with your head over the edge of the pit in short order, the reason becoming clear as the taur gets her legs underneath herself and steps over you with her forelegs; leaving her massive cock with a straight shot at your throat.");

	output("\n\nHer cockhead jounces in the air before you, a little thrust of her hind legs thrusting it forward enough to glance off of your cheek to leave a wet, cummy smear down the side of your [pc.face]. She tries again, this time bouncing off your inverted chin and dribbling a trail of pre right over your [pc.lips]. The third attempt is much more restrained, and with a bit of a stretch you just about manage to capture the taurs glans in your mouth, soon sealing your lips around the throbbing cock to ensure it stays right where");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" wants it.");

	output("\n\nA little step here and a careful thrust there and her cock slowly works its way deeper into your mouth, the angled tip soon demanding entrance to your throat. With your neck straight there’s no stopping the inevitable, steeling yourself to swallow along with the next inch of cock that");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" force feeds you, easing its passage into your neck and beyond. She coos with a mix of appreciation and pleasure as you swallow her cock down, your throat milking her turgid flesh in an effort to pull it deeper.");

	output("\n\nHer balls slap into your face lightly, still sticky with saliva from your earlier attention to them. It takes a second before the realization sets in that you’ve managed to take it all, a curious thrill of pleasure throbbing in your loins at the achievement... not that you have long to bask in glory before the taur reverses course, gently liberating a handful of inches from your grasping maw. Those same inches return in short order, faster than their first entry into your gullet, her balls patting into your face a little harder.");

	output("\n\nGradually she works up a rhythm, rutting savagely into your face after your throat fully concedes to being claimed by the taurs pillar of cock. Spittle liberally drools down your face from the thrusting, turning your visage into a sloppy, well-fucked mess. A fresh coat oozes from your maw whenever");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" pulls back, a slightly louder <i>slap</i> when her balls bounce into your face. Her thrusts get a little shorter as her knot begins to inflate, your mouth simply proving too tight a hole to permit the bulbous mass entry.");

	output("\n\n<i>“Here. It. Cooooomes,”</i> she growls, her hips juddering forward one last time as her knot grinds into your [pc.lips]. You can <i>feel</i> her cum thundering down her cock, heavy wads of it being pumped directly into your stomach. The balls resting against your face twitch in tandem with the throbs of her cock, more and more spunk being deposited deep inside your [pc.belly].");

	output("\n\nBy the time she starts to pull her cock from your throat you feel <i>fat</i>, so much taur-cum resting in your gut you feel fit to explode. Her balls aren’t quite done though, smaller blobs of spunk still oozing from her draconic cock as the head clears your neck to leave one final mouthful of spicy taur jizz for you to savor. You struggle to swallow it down between gasping breaths and raspy coughs, content to just lie there limply after your ordeal.");

	output("\n\nStrong, scaly hands peel you from the floor and a pair of arms wrap underneath your back.");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" gingerly carries you somewhere, and with your eyes glued shut with a copious mask of saliva, you’re not sure where to. At least until the sound of water splashing on the floor gives you a clue. Warm water soon has your face clean enough to risk opening your eyes, the taur putting you down on your stumpy limbs to clean you up properly. At some point the clasps on the harness come undone, and she helps to work feeling back into your limbs. When you finally regain <i>some</i> control of your still jelly-like arms, you return the favour, helping to wash all of her hard to reach places.");

	output("\n\nEventually though she turns the steamy water off and directs you out of her shower. Your gear is piled up by the apartment door. Busy as you are with placing all of your equipment in its proper place on your frame, she sneakily grabs you and smothers your mouth with a domineering kiss.");

	output("\n\n<i>“You did very well, </i>pet<i>. You know where I am when you want another belly full,”</i> she teases after breaking the kiss, a hand patting your [pc.belly]. She unhooks the leash that you had all but forgotten about, but leaves the collar prominently wrapped around your neck. You’re soon bundled out of the door and already anticipating the next opportunity to [pc.barkMeow] for Jerynn.");

	processTime(30 + rand(10));
	pc.orgasm();

	pc.loadInMouth(jerynn);

	currentLocation = "UVI N30";

	IncrementFlag("JERYNN_FUCKED");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function jerynnRescuesYourFrozenAss():void
{
	author("Gedan");

	if (flags["JERYNN_FUCKED"] == undefined || pc.isTaur())
	{
		output("A loud crinkling noise draws you back from the brink, a regular rustle akin to a metronome tapping on the side of your near-unconsciousness. You feel yourself shift in time with the noise, your limbs flopping helplessly around to the tune.");
		
		output("\n\nIt’s a struggle to peel open your eyes, the endless freezing winds having battered any exposed [pc.skinFurScales] so completely your [pc.face] is covered in outcroppings of icicles hanging from your features. You have to work your face a little, stretching and tugging against the icy buildup, as sensation slowly creeps back in - bringing with it the deep, throbbing pain of penetrating cold having set into the core of your body - before you can open them.");
		
		output("\n\nYou’re looking down at the floor, slumped over something. Dangling, helplessly, on top of whatever it is as it moves. Streaks of a different shade of blue clash with the color of the surrounding ice as the distinct shape of a person comes into focus. A person with a large, taur-like body that you happened to be bundled over the top of as they take difficult, lumbering steps, fighting against the ice and snow.");
		
		output("\n\nYou suck down an icy cold breath of air before trying to attract your rescuers attention, only to be rewarded with a lightning bolt of pain as your lungs complain - as more warmth seeps back into your body, the less numb everything feels... and the more pain seeps through.");
		
		output("\n\nYou let your eyes drift closed, falling back into fitful slumber amidst the frozen tundra....");
		return false;

		IncrementFlag("UVETO_JERYNN_RESCUES");
		flags["UVETO_JERYNN_RESCUE_LAST"] = days;
		
		rescuer = "Jerynn";
		processTime(1440);
	}
	else
	{
		output("You can barely make out somebody shouting... something off in the distance. It’s a strain to make out what, exactly, it is, but it’s clearly <i>words</i>.");

		output("\n\nAgain and again, the noise comes, every time the source closer than the last... until finally, they come into stark relief against the howling winds of the tundra.");

		output("\n\n<i>“Hey.”</i>");
		
		output("\n\nSuddenly they’re right on top of you! Inches away almost.");
		
		output("\n\n<i>“Hey, wake the fuck up, friend.”</i>");
		
		output("\n\nYou try to respond, but you can barely manage to breathe let alone produce an intelligible noise. The bitter cold has even robbed you of the ability to flop your limbs about... but the twitches and signs of awareness are there.");
		
		output("\n\n<i>“That’s it, no freezing to death in the snow today, thanks. I didn’t drag myself halfway across this fucking moon to drag a fucking popsicle back to town.”</i>");
		
		output("\n\nA crinkly thermal blanket quickly gets wrapped around your body, pain lancing through your muscles as you’re manhandled into position before you settle into the welcoming respite from the biting winds.");

		processTime(180 + rand(60));

		clearMenu();
		addButton(0, "Next", jerynnUnderslungOffer);

		return true;
	}
}

public function jerynnUnderslungOffer():void
{
	clearOutput();
	showJerynn();

	output("You bolt awake, still wrapped up tightly in the blanket, throbbing pain still robbing the sense of touch from your extremities.");

	output("\n\n<i>“Awake then, finally.”</i>");
	
	output("\n\nChancing a look around, you carefully rustle the blanket away from your face. Jerynn is perched on her haunches beside you, tending to a small campfire. She’s sat between you and the entrance to a cave that she’s managed to drag you into, and even between the blanket, the fire and her mass blocking the exterior wind, the cold is still absolutely <i>crushing</i>.");
	
	output("\n\n<i>“Your gear is fucking soaked, you need to get out of it before you freeze to death, friend,”</i> she states, matter of factly.");

	if (!pc.isSubby() && !jerynnIsMistress() && (jerynnPetstuffLevel() < jerynnPetstuffMax()))
	{
		output("\n\nYou can feel it, the wetness, wrapped all around you like a straightjacket, slowly strangling the life out of you even in the minor bastion of safety you find yourself within.");
		
		output("\n\n<i>“I don’t have spares with me, though, so you’ll only have the blanket whilst I drag you back to Irestead.”</i> She turns to you, giving the fire a meaningful poke to flare up a flame.");
		
		output("\n\n<i>“We can either chance it with just the blanket, or...”</i> She stares at you, a glimmer of the hunger you’ve seen in her eyes before making a resurgence. <i>“You can share my coat.”</i>");

		processTime(10);

		clearMenu();
		addButton(0, "Share", jerynnUnderslungShare);
		addButton(1, "Chance", jerynnUnderslungChanceIt);
	}
	else
	{
		output("\n\nYou can feel it, the wetness, wrapped all around you like a straightjacket, slowly strangling the life out of you even in the minor bastion of safety you find yourself within.");

		output("\n\n<i>“Get that shit off, you’re gonna share my coat. And pay your tab.”</i> She stares at you, a deep hunger in her eyes as she looks over your sorry, half-frozen body.");

		if (flags["JERYNN_UNDERSLUNG_RIDES"] != undefined)
		{
			output("\n\nYou can barely wait for the chance to wrap yourself around her cock again, and the thought of a");
			if (!pc.hasVagina()) output(" belly");
			else output(" womb");
			output(" full of hot dragonic spunk swilling around and heating you from the inside sounds simply <i>divine</i>.");
		}

		processTime(10);

		clearMenu();
		addButton(0, "Next", jerynnUnderslungShare);
	}
}

public function jerynnUnderslungChanceIt():void
{
	clearOutput();
	showJerynn();

	output("It takes a couple of attempts but you finally manage to croak out a refusal to her offer.");
	
	output("\n\n<i>“Your funeral,”</i> she drops, completely deadpan. You suppose it will be, if worst comes to worst.");
	
	output("\n\nYou shimmy out of your half-ruined gear within the blankets, kicking the sodden equipment out of the bottom of it as you go. Just as soon as she’s satisfied that you’ve managed to extract your pained limbs from every last scrap of ice-laden clothing, Jerynn bundles it all up and stuffs it into one of her packs.");
	
	output("\n\nShe quickly hikes you over her tauric half’s back, painfully shifting you around with a couple of hops and wiggles to get you centered, before doing her best to secure you in place.");
	
	output("\n\nJust as soon as she’s satisfied that you’re secure and everything is where it should be, Jerynn sets off back into the freezing winds with you flopping around like a dead fish on her back in the process.");
	
	output("\n\nThe winds set into you quickly and you find it a struggle to keep your eyes open. Even inside the blanket, you can feel the bitter cold forming icicles on your face again, robbing what little sense of touch you had managed to regain in short order.");
	
	output("\n\nWith little to really protect you from the cold, it’s only minutes before you’re out again, surrendering to the frozen tundra. At least your frozen body won’t be left out here under");
	// 9999
	output(" a crystal clear sky");
	// an angry, vengeful sky");
	output(" you muse morbidly....");

	processTime(1200 + rand(240));

	IncrementFlag("UVETO_JERYNN_RESCUES");
	flags["UVETO_JERYNN_RESCUE_LAST"] = days;

	clearMenu();
	if (pc.isBiped())
	{
		addButton(0, "Next", hanaFiresideRecovery);
	}
	else
	{
		addButton(0, "Next", uvetoAwakenInMedCenter, "Jerynn");
	}
}

public function jerynnUnderslungShare():void
{
	clearOutput();
	showJerynn();

	output("<i>“Good choice, friend,”</i> she half-laughs");
	if (jerynnPetstuffLevel() == 0) output(", perhaps not expecting you to agree to the offer");
	if (jerynnPetstuffLevel() < jerynnPetstuffMax()) output(" quite so easily");
	output(".");

	output("\n\n<i>“Come on, get all that soaked shit off.”</i> She rummages around in one of the packs flanking her body, quickly extracting a curious arrangement of straps.");
	if (!isWearingJerynnsHarness())
	{
		output("\n\n<i>“You’ll need this on instead. Make sure you stay nice and </i>secure<i>.”</i> You simply look at her, confused as to what the contraption is supposed to achieve.");

		output("\n\nWith a huff she throws the things at you, leaving you to handle the nitty gritty yourself. Given the circumstance, your need for survival pushes you to accept that they’re a requisite for staying safe and getting out of here.");

		output("\n\nA few minutes of effort under the blanket is all it takes to peel all of your gear off, and a couple of kicks of your half-numb legs pushes them out of the blanket and free of your body. You’re going to need to see what you’re doing for the straps though, and you <i>really</i> don’t want to take your time with them given the conditions. Mentally, you build yourself up, taking a couple of deep breaths before forcefully throwing the blanket open, the cold nipping at your [pc.skinFurScales] all too quickly.");

		if (jerynnPetstuffLevel() == 0)
		{
			output("\n\nSpinning the harness around, you rapidly try and understand just how the fuck it’s supposed to be worn. It forms two big loops, obviously intended to wrap fully around the body of the wearer. Each corner of it then has another pair of smaller loops, and a magnetic clasp to hold them together.");

			output("\n\nYou look over at Jerynn for guidance and a few quick hand motions clarify how things are supposed to work. You drop the thing to the floor and step into the big loops, pulling the whole thing up so one of the large binds is wrapped around your hips and the other");
			if (pc.biggestTitSize() > 1)
			{
				output(" just below your");
				if (pc.breastRows.length > 1) output(" top row of breasts");
				else output(" [pc.breasts]");
			}
			else output(" around your chest");
			output(", the thicker strap connecting the two aligned with your back. You cinch the two bands tight before starting on the smaller binds; each pair has another connecting strap, similar to the one now held tight to your spine. The first goes around the upper part of a limb, the second the lower part.");
		}
		else
		{
			output("\n\nSpinning the harness around, you untangle the large loops from the mess of other straps and");
			if (pc.isBiped()) output(" step");
			else output(" slide");
			output(" your body between them, pulling the first loop up to your hips and the second to");
			if (pc.biggestTitSize() > 1)
			{
				output(" just below your");
				if (pc.breastRows.length > 1) output(" top row of breasts");
				else output(" [pc.breasts]");
			}
			output(" and cinch them both tight. The smaller bands slip onto your limbs shortly after.");
		}

		output("\n\nBiceps, forearms, thighs, calves. You pull each to a comfortable tightness, leaving the whole contraption held tight to your [pc.skinFurScales]. Simple really.");

		output("\n\nAs soon as you’re done, Jerynn pushes you back on top of the blanket. She manhandles your joints and bends your elbows");
		if (pc.hasKnees()) output(" and knees");
		output(" closed. The magnetic clasps on each pair of binds come together to hold your limbs doubled over and leaving you on all fours with little means to do much of anything but wait for what comes next.");
	}
	else
	{
		output("\n\nA few minutes of effort under the blanket is all it takes to peel all of your gear off, and a couple of kicks of your half-numb legs pushes it all out of the blanket and free of your body. You wriggle out of the thermal blanket and into the freezing environment of the cavern. The little status lights on the tiny magnetic clasps are lit, and when you bend your arm double they snap together. The other three click closed just as easily, leaving you on elbows and knees for");
		if (jerynnIsMistress()) output(" Mistress");
		output(" Jerynn to take over.");
	}

	if (!isWearingJerynnsCollar())
	{
		output("\n\nA scaled hand wraps around your naked neck, a tut coming from the drago-taur as she rubs at your [pc.skinFurScales] possessively.");

		output("\n\n<i>“You’re not wearing your collar, pet,”</i> she chastises.");

		output("\n\nShe rummages through your gear whilst packing it away, eventually coming across the collar in the process. It quickly finds its way around your neck, cinched tight.");
	}

	output("\n\nThe drago-taur fingers a control on the cuff of her smart jacket and the zipper holding it closed sweeps down its length, opening the entire portion covering her lower body up in a matter of seconds. With more care than you thought her powerful frame capable of, she steps over and around you, her forelegs coming to rest on either side of your head and the main bulk of her body so close above you that you can feel the heat radiating from it already. Her knees bend slowly, the pleasant heat building against your back until you feel the glassy-smooth scales of her underbelly smother against your [pc.skinFurScales].");

	output("\n\nJerynn straights her legs out again, and this time your body follows with her. Your weight is taken by the straps entirely, the half you’re wearing magnetically coupling with what must be another part of the whole that she was already sporting under the layers of thermal insulation. A shiver rips through her frame as you settle in against her, stealing her body heat and repaying it with the chill burrowed into your flesh.");

	if (flags["JERYNN_PETSTUFF_MORE_TIMES"] == undefined || flags["JERYNN_PETSTUFF_MORE_TIMES"] <= 2)
	{
		output("\n\nA part of you wonders just why she’d have this gear - and already be wearing her half of it - but not have an extra set of dry clothing to spare, but the thought seems to fall away, unimportant in the face of a solid source of dry, soothing warmth.");
		if (jerynnPetstuffLevel() > 0 && (pc.isBimbo() || pc.libido() >= pc.libidoMax() * 0.75 || pc.lust() >= pc.lustMax() * 0.75)) output(" And the knowledge that her heavy balls are soon going to be nestled against your groin.");
	}

	output("\n\n<i>“Come on, I’m getting cold. Get your knees and elbows into the legs of my coat,”</i> she demands, and at this point you’re only too happy to comply. The prospect of even <i> more</i> warmth is just too promising to pass up!");

	output("\n\nProperly and finally positioned, Jerynn hits the control of her smart coat again and the zip mirrors its prior motion. Thick wool closes in around your underside as the coat closes up around the both of you, working its way all the way along your body before finally wrapping the garment around your [pc.face], sealing you into darkness.");

	output("\n\n<i>“Just... a little... THERE,”</i> Jerynn says somewhat muffled by the layers of clothing, shifting around and hopping herself up on her rear legs. The motion causes you to settle into the coat properly to leave your head nestled safely between her forelegs and your [pc.ass] tucked just in front of her hindlegs.");

	output("\n\nShe takes a tentative step to steady herself with the additional weight of a passenger before she sets off proper, leaving you to doze off in a serenely soothing bubble of safety.");

	processTime(15+rand(5));

	clearMenu();
	addButton(0, "Next", jerynnUnderslungShareII);
}

public function jerynnUnderslungShareII():void
{
	clearOutput();
	showJerynn();

	var vIdx:int = pc.gapestVaginaIndex();

	output("You’re not sure how long you were asleep for, but something bouncing against your");
	if (!pc.hasVagina()) output(" [pc.ass]");
	else output(" [pc.pussy "+vIdx+"]");
	output(" drags you back to the land of the living. Every step your tauric-taxi takes comes with another jounce against your");
	if (pc.hasCock()) output(" unmentionables");
	else if (!pc.hasVagina()) output(" ass");
	else output(" pussy");
	output(", as a distinctly masculine-tinged musk seeps into your nose to tickle at the back of your throat.");

	output("\n\nJerynn’s movements have caused you to settle further back on her frame, your spine curved to follow the contour of her underbelly exactly leaving your [pc.butt] angled slightly upward. Each step she takes swings you around just enough to feel the tender warmth of her cock-holster depart from the crook of your rear... only to bounce back into it, and the heavy balls dangling below, as her rear end catches back up.");

	output("\n\nThe radiant heat from the tip of it offers a tantalizing touch, especially when you rock back-and-forth just right for");
	if (pc.vaginas.length > 1 || pc.clitCount() > 1) output(" one of");
	output(" your still icy-cold");
	if (!pc.hasVagina()) output(" [pc.asshole]");
	else if (pc.clitCount() >= 1)
	{
		output(" [pc.clit]");
		if (pc.clitCount() > 1) output("s");
	}
	else output(" [pc.pussy "+vIdx+"]");
	output(" to smother it. You arch your spine, seeking out the pleasant heat on your most tender areas. With the right combination of straining your arms and twisting your back, you settle yourself into just the right spot- almost every step hitting the mark.");

	output("\n\nIt only takes another half-dozen swings or so before you feel the sheath starting to poke <i>into</i> you rather than just pillowing against your body. You had");
	if (jerynnPetstuffLevel() == 0) output("n’t");
	output(" considered the effect of your chilly [pc.skinFurScales] on Jerynn");
	if (jerynnPetstuffLevel() > 0 && pc.isSubby()) output(", delighted that you’ve had the same effect on her.");
	else output(" but it’s too late. Not like you can do anything about it either, trussed up under her body like you are.");

	output("\n\nHer steps suddenly come to a halt, jouncing you around harder than you’ve become accustomed to. Your weight shifts backward as she bends her rear legs, positioning your");
	if (!pc.hasVagina()) output(" [pc.asshole]");
	else output(" [pc.vagina "+vIdx+"]");
	output(" for a near perfect seal against her scaly sheath. The now constant exchange of heat into your slightly flushed flesh mirrors a teasing cold on Jerynn’s end. A cold touch serves as impromptu foreplay as the slow encroachment of a firm, pointed tip working its way into your body solidifies the reality of your current position. A living, breathing, portable onahole.");

	output("\n\nA few inches sink into you, almost unbearably slowly, the steep angle of the tip quickly shrinking into a manageable thickness along the length following behind. It isn’t long before the first of many powerful humps up into you arrives, launching you up and off the hot flesh an inch or so before you settle back into place against the sheath, slightly more of the length disappearing into your");
	if (!pc.hasVagina()) output(" ass");
	else output(" pussy");
	output(" in the process.");

	output("\n\nJerynn’s angular cock just keeps going, on and on, deeper and deeper into your core, bringing a heat deep into the center of your body. The draconic taur’s powerful heartbeat pulses through it,");
	if ((!pc.hasVagina() && pc.ass.looseness() < 5) || (pc.hasVagina() && pc.gapestVaginaLooseness() < 5)) output(" forcing your body to accept an increasingly large pillar of cockflesh");
	else output(" a flush of fresh warmth coursing along the pillar of cockflesh");
	output(", heating you from the inside out. There’s no telling really just how much dick is inside you, or even how much more there is to go; it’s all you can do to moan inside your warm, wooly prison, unsure even to yourself if it’s the additional heat staving off the cold that you’re enjoying so much, or the simple fact that you’re slowly, inescapably becoming a living cocksock.");
	if (pc.hasVagina())
	{
		pc.cuntChange(vIdx, jerynn.biggestCockVolume(), false);
	}
	else
	{
		pc.buttChange(jerynn.biggestCockVolume(), false);
	}

	output("\n\n<i>“");
	if ((!pc.hasVagina() && pc.ass.looseness() < 5) || (pc.hasVagina() && pc.gapestVaginaLooseness() < 5)) output("Tight but deep");
	else output("Perfect fit");
	output(", just how I like it,”</i> she hisses, the sound of her voice partially muffled through the coat. Your ride grunts and raises her rear back up from the floor, once again beginning to make progress through the icy tundra. Every step bouncing you around, fucking your");
	if (!pc.hasVagina()) output(" [pc.ass]");
	else output(" [pc.vagina "+vIdx+"]");
	output(" in the process....");

	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Next", jerynnUnderslungShareIII);
}

public function jerynnUnderslungShareIII():void
{
	clearOutput();
	showJerynn();

	output("Without the ability to see outside of the coat, all you have to focus on is the seemingly never ending quantity of cock burrowing into you. It feels like it’s wormed its way all the way");
	if (!pc.hasVagina()) output(" up to your stomach");
	else output(" into your womb");
	output(", allowing the taur to slowly drip hot precum deep into you. The cold still settled into your bones seems to recede on two fronts because of it; between the coat and Jerynn’s body heat, your outer body already feels so much more <i>alive</i>, but the expanding volume of trapped cock-milk works on you from the inside out.");

	output("\n\nEven with how restricted the ‘thrusts’ are, you’re gradually building up to what promises to be a pleasant orgasm thanks to her cock slowly thickening inside you. Molding you around it, forcing your body to conform to its exacting demands. Additional girth grants it extra purchase against your");
	if (!pc.hasVagina()) output(" [pc.asshole]");
	else output(" [pc.vagina "+vIdx+"]");
	output(", the mass it needs to grind into every bundle of sensitive nerves it can find.");
	if (pc.hasCock()) output(" Your [pc.cock] likewise rubs into the soft interior of the coat, trapped between your body and the garment, frotting itself between the tickly touch of the wool and your [pc.skinFurScales].");

	output("\n\nYou space out again, content to simply focus on the constant, deep reaming that you’re receiving. Happy to spend a little while offering your saviour some much needed release in exchange for her safeguarding your existence.");
	if (!pc.isSubby() && jerynnPetstuffLevel() < jerynnPetstuffMax() / 2)
	{
		output(" Accepting of the fact you’re slowly being turned into a mockery of a hot water bottle as the thick mast of cock delivers a constant drizzle of pre-spunk into your");
		if (!pc.hasVagina()) output(" guts");
		else output(" womb");
		output(".");
	}
	else
	{
		output(" Excited by the prospect of your");
		if (!pc.hasVagina()) output(" guts");
		else output(" womb");
		output(" being basted with searing hot dragon spunk, of being turned into little more than a cum-filled hot water bottle.");
	}

	output("\n\nEventually your backwards-motion becomes more restricted, the full length of Jerynn’s cock no longer capable of sliding so effortlessly into your");
	if (!pc.hasVagina()) output(" ass");
	else output(" pussy");
	output(". A handful more steps reveals the reason why; a rapidly burgeoning bulb of flesh at the base of her cock, grown too large to slip back inside of you, instead lightly ");
	if (!pc.hasVagina()) output("pounding against the fleshy donut of your asshole");
	else if (pc.clitCount(vIdx) > 1) output(" grinding into each and every one of the clits surrounding your cock-stuffed cunt");
	else if (pc.clitCount(vIdx) == 1) output(" grinding into the clit of your cock-stuffed cunt");
	else output(" pounding against the lips of your cock-stuffed cunt")
	output(". Each wet slap it makes against your [pc.skinFurScales] leaves a larger, firmer impression than the last as it continues to grow.");

	output("\n\nYour world moves upright again as the taxi-taur sits back on her haunches. The angle leaves you sat precariously against the ever fattening knot. With all of your weight resting against the bulb, your flesh slowly stretches wider, gradually allowing the cock-lock to worm its way deeper into your body. Your progress is slow, evidently too slow for Jerynn, her hand coming to rest atop your head through the coat, an extra little push hastening your acceptance of her knot. It’s only a few seconds with the help of the extra force before you jerk down, your cock-crammed");
	if (!pc.hasVagina()) output(" ass");
	else output(" cunt");
	output(" swallowing the bulb.");

	if (jerynnPetstuffLevel() == 0)
	{
		output("\n\n<i>“Yesssss, finally,”</i> Jerynn hisses. <i>“You’re the first");
		if (!pc.isSubby()) output(" passenger");
		else output(" cock cozy");
		output(" that’s ever been able to take the whole thing,");
		if (!pc.isSubby()) output(" friend");
		else output("slut");
		output(". Congratulations.”</i>");
	}
	else
	{
		output("\n\n<i>“Yesssss,”</i> Jerynn hisses. <i>“You’re just the perfect fucking size for a");
		if (!pc.isSubby() && jerynnPetstuffLevel() < jerynnPetstuffMax()) output(" passenger, friend");
		else output(" cock cozy, pet");
		output(". Congratulations.”</i>");
	}

	output("\n\nA swell of pride wells up in your chest and you squeeze down around her knot involuntarily. Her hips jerk upward, shifting you around, but you’re locked firmly in place now, no longer sawing back and forth on her dick. You can better feel the heat oozing out of it though, especially at the tip, where it continues to deposit a slowly enlarging bubble of pre-spunk right into your");
	if (!pc.hasVagina()) output(" guts");
	else output(" womb");
	output(".");

	output("\n\nShe stands and takes off again, the knot wedged into your hole dragging you around with the motions of her body now. It’s still getting larger, and the jerky movement tweaks your insides in just the right way to make you clamp down around it. Her stride becomes commensurately uneven as her steps feed into your clenches around her knot, your body automatically milking her shaft thanks her knot grinding into your");
	if (pc.hasVagina()) output(" g-spot.");
	else if (pc.hasCock()) output(" prostate.");
	else output(" hole.");

	output("\n\nIt isn’t much longer before you feel the body pressed to your back begin to shudder, her cock perceptibly thickening as her massive, heavy balls pull tight to your [pc.legs]. A far hotter jet of liquid warmth spews into you, and another... and another. The undulations of her orgasm being delivered directly to your core swells her knot in pulses, smashing it against your most sensitive places and eking an orgasm out of you, too.");
	if (pc.hasCock())
	{
		output(" Her knot grinding into your prostate firmly sets your cock off, too,");
		if (pc.cumQ() <= 500) output(" weak");
		else output(" thick");
		output(" ropes of your [pc.cumColor] cum");
		if (pc.cumQ() <= 500) output(" oozing");
		else output(" splattering");
		output(" against the coat.");
	}

	output("\n\nAll you can do is hang there impaled on her cock as her stride resumes, your belly slightly swollen with the weight of her cum. Her dick never manages to fully soften, staying safely wrapped up in your");
	if (!pc.hasVagina()) output(" guts");
	else output(" pussy");
	output("; the feedback loop of her knot hitting all the right places has your tunnel milking her like a pro, in turn keeping her knot inflated enough to remain tied in your");
	if (!pc.hasVagina()) output(" [pc.asshole].");
	else output(" [pc.vagina "+vIdx+"].");

	processTime(40+rand(20));
	pc.orgasm();
	pc.lust(pc.lustMax() * 0.4);

	clearMenu();
	addButton(0, "Next", jerynnUnderslungShareIV)
}

public function jerynnUnderslungShareIV():void
{
	clearOutput();
	showJerynn();

	output("You lose track of how many loads Jerynn has pumped into you; for all you know, you’ve been hanging under her for weeks, slowly bloated with more and more spunk. At some point her tireless balls pumped your [pc.belly] full enough for you to rub against the inside of her coat");
	if (pc.hasCock()) output(", trapping your [pc.cocks] between your [pc.skinFurScales] and the soft wool");
	output(".");

	output("\n\nA growing din builds in the background, just barely audible between the muffling of Jerynn’s coat and the snow crunching under her feet.");

	output("\n\n<i>“Almost back,");
	if (!pc.isSubby() && jerynnPetstuffLevel() < jerynnPetstuffMax() / 2) output(" friend");
	else output(" cock-socket");
	output(",”</i> she announces to you.");

	output("\n\nThe din grows louder as you approach civilization, other snowy footsteps growing louder and louder as the taur makes her way through the gates of Irestead and onto the main street.");

	processTime(240+rand(60));
	pc.lust(10);

	if (jerynnPetstuffLevel() == 0)
	{
		// straight to her place
	}
	else if (flags["JERYNN_PETSTUFF_MORE_TIMES"] != undefined && flags["JERYNN_PETSTUFF_MORE_TIMES"] < 10)
	{
		output("\n\n<i>“A good trip, but I don’t think you’ve paid off your ticket just yet, friend,”</i> she says, coming to a stop.");

		if (!pc.isSubby())
		{
			output("\n\n<i>“What do you think?”</i>");

			// [Lemme Out] // Goes to Her Place
			// [More Pls] // Go through the variants as described
		}
		else
		{
			// More Pls
		}
	}
	else
	{
		output("\n\n<i>“You know, I’m not so sure I want to let you off, friend,”</i> she muses. You clamp down around her, half in fear and half in wonder.");

		output("\n\n<i>“You make a pretty good cock socket. Not perfect though,”</i> something rubs the coat, your cum-filled gut held fast against the interior of it and passing the sensations directly through to you. <i>“I can think of a few... improvements. What do you think, cumdump?”</i>");

		//[Lemme out] // go to prior to bad-end
		//[More pls] // Bad end
	}
}

/*
// More Please order:
Long walk around Irestead before back to her place.
Goes to the bar to get a drink before going back to her place.
Long walk, then the bar, then back to her place.
Long walk shopping variant, back to her place, variant of her place where she collars you and has you eat cum from a doggy bowl.
Bar, teases jerome, back to her place, cumbowl, clean her cock.
Bar, teases jerome, back to her place, cumbowl, clean her cock, spend the night.
Bar, teases jerome, brings him back, lets Jerome fuck her.

// Refusing bad end
Switches between fucking jerome and full version of petplay.
*/