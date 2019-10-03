import classes.Characters.PlayerCharacter;
import classes.Items.Apparel.MagneticHarness;
import classes.Items.Miscellaneous.EmptySlot;
import classes.StorageClass;

public function showJerynn(isNude:Boolean = false, harness:Boolean = false):void
{
	author("Gedan");
	showBust(jerynnBustDisplay(isNude, harness));
	showName(jerynnIsMistress() ? "MISTRESS\nJERYNN" : "\nJERYNN");
}
public function jerynnBustDisplay(isNude:Boolean = false, harness:Boolean = false):String
{
	var sBust:String = "JERYNN";
	
	if(harness) sBust += "_DOM";
	if(isNude) sBust += "_NUDE";
	
	return sBust;
}

public function metJerynn():Boolean
{
	return (flags["MET_JERYNN"] != undefined);
}

public function jerynnIsMistress():Boolean
{
	return (isWearingJerynnsCollar() || (flags["JERYNN_RESPONSE_LIKED"] != undefined && flags["JERYNN_RESPONSE_LIKED"] <= 1));
}

public function jerynnPetstuffLevel(inc:Boolean = false):int
{
	if (inc)
	{
		trace("Increasing Petstuff Level!");
		if (flags["JERYNN_PETSTUFF_LEVEL"] == undefined) flags["JERYNN_PETSTUFF_LEVEL"] = 0;
		flags["JERYNN_PETSTUFF_LEVEL"]++;

		if (flags["JERYNN_PETSTUFF_LEVEL"] > jerynnPetstuffMax()) flags["JERYNN_PETSTUFF_LEVEL"] = jerynnPetstuffMax();
	}
	var val:int = (flags["JERYNN_PETSTUFF_LEVEL"] == undefined ? 0 : flags["JERYNN_PETSTUFF_LEVEL"]);
	trace("Petstuff Level:", val);
	return val;
}

public function hasJerynnsCollar():Boolean
{
	return ((pc as PlayerCharacter).hasKeyItem("Jerynn’s Collar"));
}

public function isWearingJerynnsCollar():Boolean
{
	var item:StorageClass = (pc as PlayerCharacter).getKeyItem("Jerynn’s Collar");
	
	if (item == null) return false;
	if (item.value1 == 0) return false;
	return true;
}

public function hasJerynnsHarness():Boolean
{
	return ((pc as PlayerCharacter).hasItemByClass(MagneticHarness));
}

public function isWearingJerynnsHarness():Boolean
{
	return ((pc as PlayerCharacter).upperUndergarment is MagneticHarness);
}

public function jerynnPetstuffMax():int
{
	return 8;
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

		addButton(btnIdx, (metJerynn() ? "Jerynn" : "Tauress"), approachJerynn, undefined, (metJerynn() ? "Jerynn" : "Taur Woman"), "Steal a few more glances at " + (metJerynn() ? "Jerynn." : "the taur-like woman."));
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
		
		output("\n\n<i>“Something the matter, </i>friend<i>?”</i> she states matter of factly.");

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

			output("\n\n<i>“Is that so? Hah, well, maybe if I spun you upside down you’d recognize me.”</i>");
			
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
			output(" your [pc.ass] possessively, the glassy-smooth scales on her fingers gliding effortlessly over your [pc.skinFurScales].");
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
			output(" your [pc.ass] possessively, the glassy-smooth scales on her fingers gliding effortlessly over your [pc.skinFurScales].");
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
		var opts:Array = [{ v: jerynnAllowFucked, w: 15 }];
		if (pc.hasCock()) opts.push({ v: jerynnAllowRidden, w: 15 });

		output("You barely have time to say anything let alone accept before she has a firm grip around your wrist. Jerynn takes off towards the exit of the bar, with you stumbling to keep up as she drags you along beside her. The brisky, icy-cold air only batters your face for moments before you’re pulled inside a nearby apartment building and bundled into an elevator.");

		output("\n\nNo sooner have the doors slammed closed does the taur have you pinned up against the wall, her hands grasping and groping");
		if (pc.thickness >= 75 || pc.buttRating() >= 12 || pc.hipRating() >= 12 || pc.biggestTitSize() >= 6) output(" every plush curve they can find.");
		else output(" every inch of your body.");
		
		if (jerynnPetstuffLevel() > 0 && isWearingJerynnsCollar())
		{
			opts.push( { v: jerynnAllowPetstuff, w: 10 * jerynnPetstuffLevel() } );
		}
		
		weightedRand(opts)();
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
		output("igits close around");
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
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0)
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
	if (pc.totalVaginas() == 0 || pc.blockedVaginas() > 0) output(" ass");
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
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) pc.cuntChange(pc.gapestVaginaIndex(), jerynn.biggestCockVolume());
	else pc.buttChange(jerynn.biggestCockVolume());
	//Not super gapey:
	var gapeness:Number = pc.ass.looseness();
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) gapeness = pc.gapestVaginaLooseness();
	if (gapeness < 5)
	{
		output(" It’s slow going, but the taur maintains an even pace as she gradually reams you out with her cock. Its shape makes for the perfect tool to burrow into a tight");
		if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) output(" pussy");
		else output(" ass");
		output(" like yours, an increasingly large mass of dick being forced into you with the minimum of trouble.");
	}
	else
	{
		output(" Your");
		if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) output(" pussy");
		else output(" ass");
		output(" seems insatiable, even in the face of such a monstrously large cock. The taur just slides right in, inch after inch swallowed by your body like your");
		if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) output(" cunt");
		else output(" ass");
		output(" had been purpose-built to sheathe her cock.");
	}

	//Fen rejiggered this in. Any blocked vaginas forces bootyhole usage.
	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;


	output(" Her rear legs shuffle forward as she feeds dick into you");
	if (pc.isBiped()) output(", nudging between your already splayed-wide thighs to keep you as spread and open as possible");
	output(".");

	output("\n\nJerynn coos deeply when her sheath kisses your");
	if (!hasVagina)
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
	if (pc.hasCock() && !hasVagina) output(" prostate");
	else if (hasVagina) output(" g-spot");
	else output(" flesh in the most sensitive places");
	output(" and drags her silky-smooth scales across your");
	if (pc.hasScales()) output(" own");
	else output(" [pc.skinFurScales]");
	output(", serving to illustrate your current position; her body has you smothered securely against the floor, her legs pinning you to the edge of the pillow-lined pit and you have two feet of cock buried in your");
	if (!hasVagina) output(" ass");
	else output(" pussy");
	output(".");

	output("\n\nWhen she starts to pull back you almost feel yourself get dragged along with her cock. On instinct your hands wrap around the taurs sculpted forelegs for support, anchoring yourself in position whilst she draws the throbbing mass from your body. The support proves comforting when she reverses direction, forcing herself back into you far, far faster than during her initial reaming of your");
	if (!hasVagina) output(" ass");
	else output(" cunt");
	output(". Her next thrust is faster still, enough momentum for her heavy balls to");
	if (pc.balls > 0)
	{
		output(" slap wetly against your");
		if (!pc.hasStatusEffect("Uniball")) output(" [pc.sack]");
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
	if (!hasVagina) output(" ass");
	else output(" pussy");
	output(" trying in vain to hold on to Jerynn’s knot. It slips free with a lewd <i>‘pop’</i> with a little struggle on both your parts... only to slam back into your [pc.vagOrAss] even harder with her next thrust.");

	output("\n\nYou’re close, oh so close. Torn between Jerynn literally breaking you before she orgasms and her burgeoning knot grinding your");
	if (pc.hasClit()) output(" clit");
	else if (hasVagina) output(" g-spot");
	else if (pc.hasCock()) output(" prostate");
	else output(" sensetive walls");
	output(" to dust, one final thrust is all it takes to set the taur off. Cum barrels up her draconic cock and into you, the first splash of liquid heat thundering into your");
	if (!hasVagina) output(" guts");
	else output(" womb");
	output(" the last little touch needed to push you over the edge too. More pulses jet into your");
	if (!hasVagina) output(" ass");
	else output(" cunt");
	output(" as your body does its utmost to milk every last drop it can from the taur, gurgles soon building deep in your [pc.belly].");

	output("\n\nTrapped between the taur and the floor so securely, there isn’t a lot of space for her prodigious load to fill and it soon starts to spurt out of the tight seal between her engorged knot and your taut");
	if (!hasVagina) output(" asshole");
	else output(" pussy");
	output(". The pulses of taur-spunk flowing into your body to displace the cloying load already contained offers just enough sensation to drag your orgasm on longer, stars filling your vision as you ride out the incredible high.");

	output("\n\nAfter a moment’s breath-catching - on both your parts - she");
	if (!hasVagina) output(" gingerly");
	output(" pulls away, her cock slowly sliding free over the course of a few stuttering steps. She collapses with a thud into the pit behind you, thoroughly satisfied. You though, feel fit to have a little nap right where you lie. Maybe when you wake up you’ll actually be able to feel your legs again....");

	output("\n\nA bright flash, bright enough to hurt your eyes even through closed eyelids, startles you.");

	output("\n\n<i>“Ahh, yeah that’s a keeper right there,”</i> Jerynn chuckles.");

	output("\n\nPeering over your shoulder, you spot her leaning against a corner of the sofa-pit, a glass tablet between her hands. She taps at it a little and a screen bursts to life filling a whole wall. Some more clacking of claws-on-glass follows whilst you regard the screen. With little fanfare all of the open application windows minimize, leaving you staring at her chosen background....");

	output("\n\nA photo of your fucked-to-gaping [pc.vagOrAss] sits front and center, a thick stream of jizz streaming out of your cavernous hole");
	if (pc.balls > 0) output(", over your balls,");
	output(" and puddling between your knees. The angle leaves enough out of frame to hide your identity from a casual viewer");
	if (pc.exhibitionism() >= 60) output(", sadly,");
	output(" but anybody who knew you would likely recognize you immediately....");

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

	pc.HP(pc.HPMax());
	pc.energy(pc.energyMax());
	
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

	output("\n\nBlessed relief comes when you finally make it into Jerynns apartment and her hand falls away from your crotch... shortly before she pushes you over into the recessed pit filling the center of the room. Thankfully, the soft base and the padding around the edges arrests most of your rapid descent, but you don’t have long to orient yourself before the taurs hands are shoving you back upright. Between a flurry of pokes and prods you gradually get pushed to the edge of the comfortable recess, sitting on the outer edge of it");
	if (pc.hasArmor() || pc.hasLowerGarment()) output(" somehow having lost your [pc.lowerGarments] in the process");
	output(".");

	output("\n\nA scaly blue ass hovers inches away from your face, the taurs thick tail raised up high to reveal her plump pussy already glistening with arousal. You could swear it winks as at you as the raw scent of <i>need</i> hits your nose and burrows deep into your brain like a parasite, clamping on to your thoughts and steering them inexorably towards filling the taur with as much cock as possible. Your body responds exactly as required with hearty throbs, stiffening your [pc.cock "+cIdx+"] into an diamond-hard bar of literal need to <i>fuck</i> in seconds.");

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
	if (pc.hasKnot(cIdx)) output(" The only thing that does seem to give her pause is your [pc.knot "+cIdx+"], and even then only for long enough for a full-body shiver to interrupt conscious control of her legs. It’s extra girth resists entering the taurs pussy before her puffy lips swallow it whole, slipping free with a lewd <i>‘pop’</i> when she pulls away from you again.");

	output("\n\nYou’re close, oh so close. Torn between Jerynn literally breaking you before she orgasms and your intense need to blow your load, one final crash is all it takes to set you off like a nuclear warhead. Cum barrels up your [pc.cock "+cIdx+"] and into the draconic taur, the first splash of your liquid heat thundering into her cunt setting off Jerynn too.");
	
	var cumQ:Number = pc.cumQ();
	
	if (cumQ >= 1000)
	{
		output(" More pulses jet into her cunt as her body works to milk every drop it can from you");
		if (cumQ >= 5000) output(", her belly gurgling as you pump more and more spunk deep into her");
		output(".");
	}
	if (cumQ >= 10000)
	{
		output(" She wiggles her ass firmly against your body whilst your twinned orgasms rage on");
		if (cumQ >= 25000) output(" her belly bloating hugely under the sheer mass you’re filling her with");
		if (cumQ >= 100000) output(" until she almost scrapes the floor")
		output(".");
	}
	if (cumQ >= 125000)
	{
		output(" But your [pc.balls] still");
		if (pc.balls > 1) output(" aren’t");
		else output(" isn’t")
		output(" done, forcing yet more [pc.cum] into her desperate cunt until her underbelly pillows out against the mattress and her flanks fill out to either side.");
	}
	if (cumQ >= 250000)
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
	if (cumQ >= 10000) output(" carefully");
	output(" makes her way towards her bathroom");
	if (cumQ >= 25000) output(" after a minor struggle stepping out of her sofa-pit thanks to the freely roiling mass of jizz bloating her belly");
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
	pc.HP(pc.HPMax());
	pc.energy(pc.energyMax());

	IncrementFlag("JERYNN_FUCKED");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function jerynnAllowPetstuff():void
{
	clearOutput();
	showJerynn(true, true);

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
	output(" gingerly carries you somewhere, and with your eyes glued shut with a copious mask of saliva, you’re not sure where to. At least until the sound of water splashing on the floor gives you a clue. Warm water soon has your face clean enough to risk opening your eyes, the taur putting you down on your stumpy limbs to clean you up properly. At some point the clasps on the harness come undone, and she helps to work feeling back into your limbs. When you finally regain <i>some</i> control of your still jelly-like arms, you return the favor, helping to wash all of her hard to reach places.");

	output("\n\nEventually though she turns the steamy water off and directs you out of her shower. Your gear is piled up by the apartment door. Busy as you are with placing all of your equipment in its proper place on your frame, she sneakily grabs you and smothers your mouth with a domineering kiss.");

	output("\n\n<i>“You did very well, </i>pet<i>. You know where I am when you want another belly full,”</i> she teases after breaking the kiss, a hand patting your [pc.belly]. She unhooks the leash that you had all but forgotten about, but leaves the collar prominently wrapped around your neck. You’re soon bundled out of the door and already anticipating the next opportunity to [pc.barkMeow] for Jerynn.");

	processTime(30 + rand(10));
	pc.orgasm();

	pc.loadInMouth(jerynn);

	currentLocation = "UVI N30";
	pc.HP(pc.HPMax());
	pc.energy(pc.energyMax());

	IncrementFlag("JERYNN_FUCKED");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function jerynnRescuesYourFrozenAss():Boolean
{
	showBust(jerynnBustDisplay());
	author("Gedan");

	if (flags["JERYNN_FUCKED"] == undefined || pc.isTaur())
	{
		output("A loud crinkling noise draws you back from the brink, a regular rustle akin to a metronome tapping on the side of your near-unconsciousness. You feel yourself shift in time with the noise, your limbs flopping helplessly around to the tune.");
		
		output("\n\nIt’s a struggle to peel open your eyes, the endless freezing winds having battered any exposed [pc.skinFurScales] so completely your [pc.face] is covered in outcroppings of icicles hanging from your features. You have to work your face a little, stretching and tugging against the icy buildup, as sensation slowly creeps back in - bringing with it the deep, throbbing pain of penetrating cold having set into the core of your body - before you can open them.");
		
		output("\n\nYou’re looking down at the floor, slumped over something. Dangling, helplessly, on top of whatever it is as it moves. Streaks of a different shade of blue clash with the color of the surrounding ice as the distinct shape of a person comes into focus. A person with a large, taur-like body that you happened to be bundled over the top of as they take difficult, lumbering steps, fighting against the ice and snow.");
		
		output("\n\nYou suck down an icy cold breath of air before trying to attract your rescuers attention, only to be rewarded with a lightning bolt of pain as your lungs complain - as more warmth seeps back into your body, the less numb everything feels... and the more pain seeps through.");
		
		output("\n\nYou let your eyes drift closed, falling back into fitful slumber amidst the frozen tundra....");
		
		IncrementFlag("UVETO_JERYNN_RESCUES");
		flags["UVETO_JERYNN_RESCUE_LAST"] = days;
		
		processTime(1440);
		
		return false;
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
			output(" full of hot draconic spunk swilling around and heating you from the inside sounds simply <i>divine</i>.");
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
	// Fen note: KILLED THE 9's MUTHA HUMPAHS
	if(!uvetoCloudy() && !uvetoBlizzard()) output(" a crystal clear sky");
	else output(" an angry, vengeful sky");
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
	showJerynn(false, true);

	output("<i>“Good choice, friend,”</i> she half-laughs");
	if (jerynnPetstuffLevel() == 0) output(", perhaps not expecting you to agree to the offer");
	if (jerynnPetstuffLevel() < jerynnPetstuffMax()) output(" quite so easily");
	output(".");

	output("\n\n<i>“Come on, get all that soaked shit off.”</i>");
	if (!isWearingJerynnsHarness())
	{
		output(" She rummages around in one of the packs flanking her body, quickly extracting a curious arrangement of straps.");
		
		output("\n\n<i>“You’ll need this on instead. Make sure you stay nice and </i>secure<i>.”</i>");
		if (jerynnPetstuffLevel() == 0) output(" You simply look at her, confused as to what the contraption is supposed to achieve.");

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

	if (!isWearingJerynnsCollar() && hasJerynnsCollar())
	{
		output("\n\nA scaled hand wraps around your naked neck, a tut coming from the drago-taur as she rubs at your [pc.skinFurScales] possessively.");

		output("\n\n<i>“You’re not wearing your collar, pet,”</i> she chastises.");

		output("\n\nShe rummages through your gear whilst packing it away, eventually coming across the collar in the process. It quickly finds its way around your neck, cinched tight.");
	}

	output("\n\nThe drago-taur fingers a control on the cuff of her smart jacket and the zipper holding it closed sweeps down its length, opening the entire portion covering her lower body up in a matter of seconds. With more care than you thought her powerful frame capable of, she steps over and around you, her forelegs coming to rest on either side of your head and the main bulk of her body so close above you that you can feel the heat radiating from it already. Her knees bend slowly, the pleasant heat building against your back until you feel the glassy-smooth scales of her underbelly smother against your [pc.skinFurScales].");

	output("\n\nJerynn straights her legs out again, and this time your body follows with her. Your weight is taken by the straps entirely, the half you’re wearing magnetically coupling with what must be another part of the whole that she was already sporting under the layers of thermal insulation. A shiver rips through her frame as you settle in against her, stealing her body heat and repaying it with the chill burrowed into your flesh.");

	if (jerynnPetstuffLevel() <= 2)
	{
		output("\n\nA part of you wonders just why she’d have this gear - and already be wearing her half of it - but not have an extra set of dry clothing to spare, but the thought seems to fall away, unimportant in the face of a solid source of dry, soothing warmth.");
		if (jerynnPetstuffLevel() > 0 && (pc.isBimbo() || pc.libido() >= pc.libidoMax() * 0.75 || pc.lust() >= pc.lustMax() * 0.75)) output(" And the knowledge that her heavy balls are soon going to be nestled against your groin.");
	}

	output("\n\n<i>“Come on, I’m getting cold. Get your knees and elbows into the legs of my coat,”</i> she demands, and at this point you’re only too happy to comply. The prospect of even <i>more</i> warmth is just too promising to pass up!");

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
	showJerynn(false, true);

	var vIdx:int = pc.gapestVaginaIndex();
	//Fen rejiggered this in. Any blocked vaginas forces bootyhole usage.
	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;

	output("You’re not sure how long you were asleep for, but something bouncing against your");
	if (!hasVagina) output(" [pc.ass]");
	else output(" [pc.pussy "+vIdx+"]");
	output(" drags you back to the land of the living. Every step your tauric-taxi takes comes with another jounce against your");
	if (pc.hasCock()) output(" unmentionables");
	else if (!hasVagina) output(" ass");
	else output(" pussy");
	output(", as a distinctly masculine-tinged musk seeps into your nose to tickle at the back of your throat.");

	output("\n\nJerynn’s movements have caused you to settle further back on her frame, your spine curved to follow the contour of her underbelly exactly leaving your [pc.butt] angled slightly upward. Each step she takes swings you around just enough to feel the tender warmth of her cock-holster depart from the crook of your rear... only to bounce back into it, and the heavy balls dangling below, as her rear end catches back up.");

	output("\n\nThe radiant heat from the tip of it offers a tantalizing touch, especially when you rock back-and-forth just right for");
	if (pc.vaginas.length > 1 || pc.totalClits() > 1) output(" one of");
	output(" your still icy-cold");
	if (!hasVagina) output(" [pc.asshole]");
	else if (pc.totalClits() >= 1)
	{
		output(" [pc.clit]");
		if (pc.totalClits() > 1) output("s");
	}
	else output(" [pc.pussy "+vIdx+"]");
	output(" to smother it. You arch your spine, seeking out the pleasant heat on your most tender areas. With the right combination of straining your arms and twisting your back, you settle yourself into just the right spot- almost every step hitting the mark.");

	output("\n\nIt only takes another half-dozen swings or so before you feel the sheath starting to poke <i>into</i> you rather than just pillowing against your body. You had");
	if (jerynnPetstuffLevel() == 0) output("n’t");
	output(" considered the effect of your chilly [pc.skinFurScales] on Jerynn");
	if (jerynnPetstuffLevel() > 0 && pc.isSubby()) output(", delighted that you’ve had the same effect on her.");
	else output(" but it’s too late. Not like you can do anything about it either, trussed up under her body like you are.");

	output("\n\nHer steps suddenly come to a halt, jouncing you around harder than you’ve become accustomed to. Your weight shifts backward as she bends her rear legs, positioning your");
	if (!hasVagina) output(" [pc.asshole]");
	else output(" [pc.vagina "+vIdx+"]");
	output(" for a near perfect seal against her scaly sheath. The now constant exchange of heat into your slightly flushed flesh mirrors a teasing cold on Jerynn’s end. A cold touch serves as impromptu foreplay as the slow encroachment of a firm, pointed tip working its way into your body solidifies the reality of your current position. A living, breathing, portable onahole.");

	output("\n\nA few inches sink into you, almost unbearably slowly, the steep angle of the tip quickly shrinking into a manageable thickness along the length following behind. It isn’t long before the first of many powerful humps up into you arrives, launching you up and off the hot flesh an inch or so before you settle back into place against the sheath, slightly more of the length disappearing into your");
	if (!hasVagina) output(" ass");
	else output(" pussy");
	output(" in the process.");

	output("\n\nJerynn’s angular cock just keeps going, on and on, deeper and deeper into your core, bringing a heat deep into the center of your body. The draconic taur’s powerful heartbeat pulses through it,");
	if ((!hasVagina && pc.ass.looseness() < 5) || (hasVagina && pc.gapestVaginaLooseness() < 5)) output(" forcing your body to accept an increasingly large pillar of cockflesh");
	else output(" a flush of fresh warmth coursing along the pillar of cockflesh");
	output(", heating you from the inside out. There’s no telling really just how much dick is inside you, or even how much more there is to go; it’s all you can do to moan inside your warm, wooly prison, unsure even to yourself if it’s the additional heat staving off the cold that you’re enjoying so much, or the simple fact that you’re slowly, inescapably becoming a living cocksock.");
	if (hasVagina)
	{
		pc.cuntChange(vIdx, jerynn.biggestCockVolume());
	}
	else
	{
		pc.buttChange(jerynn.biggestCockVolume());
	}

	output("\n\n<i>“");
	if ((!hasVagina && pc.ass.looseness() < 5) || (hasVagina && pc.gapestVaginaLooseness() < 5)) output("Tight but deep");
	else output("Perfect fit");
	output(", just how I like it,”</i> she hisses, the sound of her voice partially muffled through the coat. Your ride grunts and raises her rear back up from the floor, once again beginning to make progress through the icy tundra. Every step bouncing you around, fucking your");
	if (!hasVagina) output(" [pc.ass]");
	else output(" [pc.vagina "+vIdx+"]");
	output(" in the process....");

	processTime(20+rand(5));

	clearMenu();
	addButton(0, "Next", jerynnUnderslungShareIII, vIdx);
}

public function jerynnUnderslungShareIII(vIdx:int):void
{
	clearOutput();
	showJerynn(false, true);

	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;

	output("Without the ability to see outside of the coat, all you have to focus on is the seemingly never ending quantity of cock burrowing into you. It feels like it’s wormed its way all the way");
	if (!hasVagina) output(" up to your stomach");
	else output(" into your womb");
	output(", allowing the taur to slowly drip hot precum deep into you. The cold still settled into your bones seems to recede on two fronts because of it; between the coat and Jerynn’s body heat, your outer body already feels so much more <i>alive</i>, but the expanding volume of trapped cock-milk works on you from the inside out.");

	output("\n\nEven with how restricted the ‘thrusts’ are, you’re gradually building up to what promises to be a pleasant orgasm thanks to her cock slowly thickening inside you. Molding you around it, forcing your body to conform to its exacting demands. Additional girth grants it extra purchase against your");
	if (!hasVagina) output(" [pc.asshole]");
	else output(" [pc.vagina "+vIdx+"]");
	output(", the mass it needs to grind into every bundle of sensitive nerves it can find.");
	if (pc.hasCock()) output(" Your [pc.cock] likewise rubs into the soft interior of the coat, trapped between your body and the garment, frotting itself between the tickly touch of the wool and your [pc.skinFurScales].");

	output("\n\nYou space out again, content to simply focus on the constant, deep reaming that you’re receiving. Happy to spend a little while offering your saviour some much needed release in exchange for her safeguarding your existence.");
	if (!pc.isSubby() && jerynnPetstuffLevel() < jerynnPetstuffMax() / 2)
	{
		output(" Accepting of the fact you’re slowly being turned into a mockery of a hot water bottle as the thick mast of cock delivers a constant drizzle of pre-spunk into your");
		if (!hasVagina) output(" guts");
		else output(" womb");
		output(".");
	}
	else
	{
		output(" Excited by the prospect of your");
		if (!hasVagina) output(" guts");
		else output(" womb");
		output(" being basted with searing hot dragon spunk, of being turned into little more than a cum-filled hot water bottle.");
	}

	output("\n\nEventually your backwards-motion becomes more restricted, the full length of Jerynn’s cock no longer capable of sliding so effortlessly into your");
	if (!hasVagina) output(" ass");
	else output(" pussy");
	output(". A handful more steps reveals the reason why; a rapidly burgeoning bulb of flesh at the base of her cock, grown too large to slip back inside of you, instead lightly ");
	if (!hasVagina) output("pounding against the fleshy donut of your asshole");
	else if (pc.totalClits() > 1) output(" grinding into each and every one of the clits surrounding your cock-stuffed cunt");
	else if (pc.totalClits() == 1) output(" grinding into the clit of your cock-stuffed cunt");
	else output(" pounding against the lips of your cock-stuffed cunt")
	output(". Each wet slap it makes against your [pc.skinFurScales] leaves a larger, firmer impression than the last as it continues to grow.");

	output("\n\nYour world moves upright again as the taxi-taur sits back on her haunches. The angle leaves you sat precariously against the ever fattening knot. With all of your weight resting against the bulb, your flesh slowly stretches wider, gradually allowing the cock-lock to worm its way deeper into your body. Your progress is slow, evidently too slow for Jerynn, her hand coming to rest atop your head through the coat, an extra little push hastening your acceptance of her knot. It’s only a few seconds with the help of the extra force before you jerk down, your cock-crammed");
	if (!hasVagina) output(" ass");
	else output(" cunt");
	output(" swallowing the bulb.");

	if (jerynnPetstuffLevel() == 0)
	{
		output("\n\n<i>“Yesssss, finally,”</i> Jerynn hisses. <i>“You’re the first");
		if (!pc.isSubby()) output(" passenger");
		else output(" cock cozy");
		output(" that’s ever been able to take the whole thing,");
		if (!pc.isSubby()) output(" friend");
		else output(" slut");
		output(". Congratulations.”</i>");
	}
	else
	{
		output("\n\n<i>“Yesssss,”</i> Jerynn hisses. <i>“You’re just the perfect fucking size for a");
		if (!pc.isSubby() && !jerynnIsMistress()) output(" passenger, friend");
		else output(" cock cozy, pet");
		output(". Congratulations.”</i>");
	}

	output("\n\nA swell of pride wells up in your chest and you squeeze down around her knot involuntarily. Her hips jerk upward, shifting you around, but you’re locked firmly in place now, no longer sawing back and forth on her dick. You can better feel the heat oozing out of it though, especially at the tip, where it continues to deposit a slowly enlarging bubble of pre-spunk right into your");
	if (!hasVagina) output(" guts");
	else output(" womb");
	output(".");

	output("\n\nShe stands and takes off again, the knot wedged into your hole dragging you around with the motions of her body now. It’s still getting larger, and the jerky movement tweaks your insides in just the right way to make you clamp down around it. Her stride becomes commensurately uneven as her steps feed into your clenches around her knot, your body automatically milking her shaft thanks her knot grinding into your");
	if (hasVagina) output(" g-spot.");
	else if (pc.hasCock()) output(" prostate.");
	else output(" hole.");

	output("\n\nIt isn’t much longer before you feel the body pressed to your back begin to shudder, her cock perceptibly thickening as her massive, heavy balls pull tight to your [pc.legs]. A far hotter jet of liquid warmth spews into you, and another... and another. The undulations of her orgasm being delivered directly to your core swells her knot in pulses, smashing it against your most sensitive places and eking an orgasm out of you, too.");
	if (pc.hasCock())
	{
		var cumQ:Number = pc.cumQ();
		output(" Her knot grinding into your prostate firmly sets your cock off, too,");
		if (cumQ <= 500) output(" weak");
		else output(" thick");
		output(" ropes of your [pc.cumColor] cum");
		if (cumQ <= 500) output(" oozing");
		else output(" splattering");
		output(" against the coat.");
	}

	output("\n\nAll you can do is hang there impaled on her cock as her stride resumes, your belly slightly swollen with the weight of her cum. Her dick never manages to fully soften, staying safely wrapped up in your");
	if (!hasVagina) output(" guts");
	else output(" pussy");
	output("; the feedback loop of her knot hitting all the right places has your tunnel milking her like a pro, in turn keeping her knot inflated enough to remain tied in your");
	if (!hasVagina) output(" [pc.asshole].");
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
	showJerynn(false, true);

	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;

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
	pc.orgasm();

	IncrementFlag("UVETO_JERYNN_RESCUES");
	flags["UVETO_JERYNN_RESCUE_LAST"] = days;
	
	pc.lust(10);
	if (hasVagina)
	{
		pc.cuntChange(pc.gapestVaginaIndex(), jerynn.biggestCockVolume(), false);
		pc.loadInCunt(jerynn, pc.gapestVaginaIndex());
		pc.maxOutCumflation("vagina " + pc.gapestVaginaIndex(), jerynn);
	}
	else
	{
		pc.buttChange(jerynn.biggestCockVolume(), false);
		pc.loadInAss(jerynn);
		pc.maxOutCumflation("ass", jerynn);
	}
	

	if (jerynnPetstuffLevel() == 0)
	{
		clearMenu();
		addButton(0, "Next", jerynnPetstuffHerPlace, true);
	}
	else if (jerynnPetstuffLevel() <= 7)
	{
		output("\n\n<i>“A good trip, but I don’t think you’ve paid off your ticket just yet, friend,”</i> she says, coming to a stop.");

		clearMenu();
		if (!pc.isSubby())
		{
			output("\n\n<i>“What do you think?”</i>");

			addButton(0, "Lemme Out", jerynnPetstuffHerPlace, true);
		}
		else
		{
			addDisabledButton(0, "Lemme Out", "Lemme Out", "You can’t bring yourself to refuse her offer...");
		}
		
		var tarF:Function;
		var cLevel:int = jerynnPetstuffLevel();

		switch (cLevel)
		{
			case 1: tarF = jerynnPetstuffLongWalk; break;
			case 2: tarF = jerynnPetstuffBar; break;
			case 3: tarF = jerynnPetstuffLongWalk; break;
			case 4: tarF = jerynnPetstuffLongWalk; break;
			case 5: tarF = jerynnPetstuffBar; break;
			case 6: tarF = jerynnPetstuffBar; break;
			default: case 7: tarF = jerynnPetstuffBar; break;
		}

		addButton(1, "More Pls", tarF, undefined, "More Please", silly ? "Mr Bones wild ride never ends...." : "The ride doesn’t have to end....");
	}
	else
	{
		output("\n\n<i>“You know, I’m not so sure I want to let you off, friend,”</i> she muses. You clamp down around her, half in fear and half in wonder.");

		output("\n\n<i>“You make a pretty good cock socket. Not perfect though,”</i> something rubs the coat, your cum-filled gut held fast against the interior of it and passing the sensations directly through to you. <i>“I can think of a few... improvements. What do you think, cumdump?”</i>");

		clearMenu();
		addButton(0, "Lemme Out", jerynnPetstuffBar, undefined, "Lemme Out", "A tempting offer, but you suspect it might be the last decision you get to make....");
		addButton(1, "More Pls", jerynnPetstuffBadEnd, undefined, "More Pls", "Why keep playing this silly game? You could just have this all the time... forever.");
	}
}

public function jerynnPetstuffHerPlace(isLemmeOut:Boolean = false):void
{
	clearOutput();
	showJerynn(false, true);

	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;
	trace("Her Place");
	
	if (jerynnPetstuffLevel() == 0)
	{
		output("She’s");
	}
	else if (isLemmeOut)
	{
		output("You wriggle and struggle, obviously giving rise to your feelings on the matter. It’s been a fun trip but you want nothing more than to breathe fresh air... and drain yourself of the belly full of cum you’re sporting.");
		
		output("\n\n<i>“Hah. Okay, okay, I get the message,”</i> she replies to your unvoiced position on the matter.");
		
		output("\n\nShe continues");
	}
	else
	{
		output("She continues");
	}
	output(" moving with purpose, but there’s no way to tell where, really. After all, you’re just along for the ride. Voices distantly surround you, the faint hint of music playing in the background. Eventually a door slams closed behind you, cutting off the ever-present gusting wind and silencing most of the hustle and bustle of the outpost, leaving only the gentle hum of electronics.");

	output("\n\nA few steps later and Jerynn comes to a stop, another door closing behind. You lurch somewhat, moving vertically, the many, many loads of spunk bubbling around in your");
	if (!hasVagina) output(" gut");
	else output(" womb");
	output(" swilling to-and-fro in the process; an elevator would be a safe bet. A similar lurch jostles you around as the movement stops and she takes off walking again. Another pause, another door, but this time she sighs heavily as she comes to a stop, finally.");

	if (jerynnPetstuffLevel() == 4)
	{
		output("\n\nThe clatter and rattle from the shop are back, the item dropped on the floor behind you with little care. You don’t have long to consider it before l");
	}
	else
	{
		output("\n\nL");
	}
	output("ight blasts your face as she lowers the zipper of her smart jacket, your eyes taking a good while to adjust to the fact you’re no longer in pitch blackness. Things are still fuzzy, but you can just about make out a mirror with your still half-dazed face in front of you as the blue-scaled tail of the taur hooks its tip through the opening made in the jacket so far, tugging it open further.");

	output("\n\nYour reflection comes into focus slowly as more and more of your body is revealed from under the coat; flushed red with heat and sweaty, oh so sweaty, from so long tucked into the confines of the garment.");
	if (pc.hasFur() || pc.hasHair())
	{
		output(" Your");
		if (pc.hasHair()) output(" hair");
		else output(" fur");
		output(" is a complete mess, matted and tussled from the long journey back to Irestead.");
	}

	output("\n\nWith a jerk the zipper zooms past most of your body, your [pc.belly] full of cum roiling heavily below you now that the coat isn’t providing a measure of support for it. You can see it in the mirror, an obscene swell of [pc.skin] weighing you down, as large, you imagine, as it would be after nine solid months of baby dragon-taur growth....");

	output("\n\nJerynn is staring at you through the mirror, a satisfied, confident smirk on her face. A blush");
	if (pc.hasFur()) output(" strong enough to show through your fur");
	else output(" strong enough to tinge your scales");
	output(" is all you can respond with as she bends her knees, finally lowering you to the floor. Your elbows take some of your weight, but your gut is just too full for your knees to reach the floor. A barely audible click and the taur starts to stand back up, her knot tugging at your");
	if (!hasVagina) output(" [pc.ass]");
	else output(" [pc.vagina]");
	output(". It doesn’t come easy and it takes her a few strong jerks before it starts to move, setting you wobbling on your self-made waterbed.");

	output("\n\nRough, cold pads softly press against your [pc.skinFurScales] as the taur brings one of her hind legs to bear against your back; one final tug with a little extra pressure squeezing you into the floor with her foot and her huge knot <i>finally</i> rushes out of your tender");
	if (!hasVagina) output(" ass");
	else output(" pussy");
	output(", a gush of still hot spunk jetting out of you after it. Inch after inch of half-rigid cock follows the knot, leaving an odd hollow in its wake, more jizz oozing from your well-fucked passage.");

	if (jerynnPetstuffLevel() < 4 || isLemmeOut)
	{
		output("\n\nAfter what feels like miles of dragon-dick has been removed from your interior, Jerynn rolls you over onto your back, cold tiles supporting your weight. Looking up you can clearly make out a collection of shower heads around you, and soon, they’re busy spraying glorious, soothing, steamy water all over. With your gut slowly draining and the hot water washing away all the sticky, sweaty horribleness caked over your body, Jerynn moves around you, undoing the final parts of the harness. Your knees and elbows finally free you just flop against the floor, exhausted but immensely satisfied, content to simply lie there and soak in the heat of the shower.");
		
		processTime(15);

		clearMenu();
		addButton(0, "Next", jerynnPetstuffCleanup, isLemmeOut);
	}
	else
	{
		if (!isWearingJerynnsCollar())
		{
			output("\n\nA flash of darkness passes over your vision before something tightens around your neck. You look to the mirror and spot a long rope of chain still clutched in the taurs hand, leading down towards your head. You crane your neck and see a thick collar of the same style as the harness still restraining your arms and legs cinched tight around it.");
		}
		else
		{
			output("\n\nA flash of darkness passes over your vision before the sound of something snapping closed accompanies an increased weight around your neck. You look to the mirror and spot a long rope of chain still clutched in the taurs hand, leanding down towards your head. You crane your neck and see the end of the chain is latched securly to the thick collar around your neck.");
		}
		if (jerynnPetstuffLevel() == 4) output(" Now there’s a little silver disc hanging from the front of it, stamped simply with three letters; P-E-T.");

		output("\n\n<i>“Now, you’re going to be a good "+ pc.catDog("kitty", "puppy") +" for Mistress Jerynn now, aren’t you? The least you can do for her rescuing you from the nasty cold is to indulge her, right?”</i>");

		if (jerynnPetstuffLevel() != 4)
		{
			output("\n\nYou make to voice");
			if (!pc.isSubby()) output(" a reluctant");
			output(" ‘yes’, but she gives the leash a firm tug before you can get past the ‘y’. <i>“First rule; good "+ pc.catDog("kitties", "puppies") +" only [pc.barkMeow],”</i> she teases, a glint of dominance in her eye.");
		}

		output("\n\nYou [pc.barkMeow] quietly in response.");

		output("\n\n<i>“");
		if (jerynnPetstuffLevel() == 4) output("Better, but it still needs some work. Not now though.");
		else output("We’ll have to work on that, but not now.");
		output(" First we need to get you fed, you must be </i>famished<i>.”</i> She tugs on the leash again, dragging you further from the mirror.");

		output("\n\nThe source of the clatter soon becomes evident; a " + pc.catDog("kitty", "doggy") +" bowl lies on the floor amid a veritable sea of cum, filled to the brim with as much as it can hold. You look up at her and she only nods toward the bowl... and then the thirst hits you. Who knows how long you’ve been incommunicado as she carried you back to Irestead, how long without proper food or drink. You dive face-first into it, sucking the thick spunk through your lips like a " + pc.mf("man", "woman") +" discovering an oasis after weeks in the desert.");
		
		pc.loadInMouth(jerynn);

		output("\n\nIt’s thick and cloying, musky. A spice to it that hides the usually salty tang. The taur watches over you closely, occasionally directing you to eat more ‘pet-like’. By the time the bowl is nearly empty, you’re lapping at it like a "+ pc.catDog("cat", "dog") +", scooping big blobs of it up with your [pc.tongue] and pulling it back into your mouth.");

		if (jerynnPetstuffLevel() == 4 || isLemmeOut)
		{
			output("\n\n<i>“Good [pc.boy]! Now, let’s get cleaned up so you can have a rest, I’m sure you’re tired as fuck.”</i>");

			output("\n\nShe fires up the shower heads and they’re soon spraying glorious, soothing, steamy water all over. You’re content to simply kneel there and allow the heat to diffuse into you, finally properly excising the cold from your bones as the sweaty horribleness caked over your body is washed away. She moves around you, undoing the harness from your arms and legs, but leaves the collar in place.");

			processTime(20);
			
			clearMenu();
			addButton(0, "Next", jerynnPetstuffCleanup, isLemmeOut);
		}
		else
		{
			output("\n\n<i>“Good [pc.boy]! Now, you’ve left a mess that you need to clean up.”</i>");
			
			output("\n\nHer tail curls around in front of her body and she hands off the handle to the leash, slipping the tip of her tail through it. She tugs you around for a while, leading you on a merry little lap around the bathroom before she slips the leash between her rear legs from behind, the tip coming to a halt under her still half-hard cock.");
			
			output("\n\nIt’s massive, easily two feet long in total, with a knot as big as your fist even in this state. And it’s covered from stem to stern in a layer of cum, beads of it threatening to drip free to the floor. Her scale-covered balls are in a similar state, hanging heavy and splattered with the leavings that managed to spurt their way out of you during the trip back to Irestead.");
			
			output("\n\n<i>“Come on, put that "+ pc.catDog("kitty", "puppy") +" tongue to work, </i>pet<i>”</i> she orders softly.");
			
			output("\n\nYou shuffle under her frame and softly place your [pc.lips] to each of her prodigious balls in turn. Thick strings of cum hang in the air connecting your face to the dangling orbs, a sweep of your [pc.tongue] collecting them and pulling them into your mouth. Slurping them down, you chase them back through the air until your lips pillow against the scales of her nuts, sucking their surface slowly clean of cum. You work your way up from the bottom, catching all of the rivulets about to drip free of their surface, jumping back and forth from left to right as you progress. They’re just far too big for you to fit into your mouth, so you have to take your time as you work up their height to ensure you don’t lose any progress from the layer of cum drooling down over the scales you’ve already slurped clean.");
			
			output("\n\nYou have to twist your head around to reach into the crook between her sack and sheath, and even then you can’t really get close enough to suck the cum off. Instead you settle on nuzzling into the space as close as possible and lapping the little reservoir of spunk like a little "+ pc.catDog("kitty", "doggy") +" bowl. Following the spicy taste around, your mouth is soon wrapped halfway around her sheath, sucking it clean as you lift yourself up to reach the top half.");
			
			output("\n\nYou continue like that along the length of dickmeat hanging in the air, slurping it clean inch by inch and shuffling your way around on your elbows and knees as you move along it. The knot proves somewhat troublesome considering you can barely even wrap your lips around a quarter of it, especially when your ministrations have the taur back to full hardness, but you work diligently for Mistress.");
			
			output("\n\nBy the time you reach the angular tip of her cock the length is almost dancing in the air to the tune of her heartbeat. You give it a soft kiss and then finally lower your ass to the floor.");
			
			output("\n\n<i>“Good [pc.boy]!”</i> she praises you, and you [pc.barkMeow] in response.");
			
			output("\n\n<i>“Time for your treat!”</i>");
			
			output("\n\nTreat? Oh boy, treat!");
			
			processTime(30);

			clearMenu();
			addButton(0, "Next", jerynnPetstuffHerPlacePostShopping)
		}
	}
}

public function jerynnPetstuffHerPlacePostShopping():void
{
	trace("Her place, post shopping");
	
	clearOutput();
	showJerynn(true, true);

	output("Her tail loops the leash over the top of her cock and tugs the slack out. It pulls you off your ass and towards her throbbing, engorged dick mouth-first. The pointed tip slides past your lips with ease and you’re soon suckling on her cock eagerly. Careful yanks on the leash pull you further, only stopping when her dragon dick reaches the back of your throat. The fresh taste of hot precum graces your tongue and you set to gulping it down eagerly, lost in the task of servicing Mistress however she pleases.");
	
	output("\n\nIt doesn’t take long before her balls pull up tightly to her body, having spent so long under the ministrations of your diligent mouth work already. Every slurp, every suckle has them jouncing around under their own weight.");
	
	output("\n\n<i>“Ngh, don’t spill a droooop,”</i> Jerynn moans aloud above you. You had no intention of it! Not that she gives you much choice in the matter; her tail strains taut, in turn tugging the leash just a little harder, and the arrow-like head of her cock slides into your throat just in time for the first pulse of spunk to hurtle its way down the dick between your [pc.lips].");
	
	pc.loadInMouth(jerynn);
	
	output("\n\nHeat suffuses your neck as her thick load gets pumped straight down it, oozing down and gathering in your belly. Pulse after pulse fresh from the source weighing heavily in your rapidly filling [pc.belly]; a fitting reward for Mistress Jerynn’s slutty little pet.");
	
	output("\n\nYour lungs burn with the need for breath as her orgasm wanes, the leash finally allowing you enough slack to pull the dragon-dick from your throat and suck down a chest full of air. The taur’s cock leaves you one final gift before slipping free of your pursed lips, a lazy glazing of fresh cum spreading over your [pc.tongue] to enjoy the unique, spicy tang one last time.");
	
	output("\n\n<i>“Good [pc.boy]! Now, let’s get cleaned up so you can have a rest, I’m sure you’re tired as fuck.”</i>");
	
	output("\n\nShe fires up the shower heads and they’re soon spraying glorious, soothing, steamy water all over. You’re content to simply kneel there and allow the heat to diffuse into you, finally properly excising the cold from your bones as the sweaty horribleness caked over your body is washed away.");
	if (!hasJerynnsCollar())
	{
		output(" She moves around you, undoing the harness from your arms and legs, but leaves the collar in place.");
		pc.createKeyItem("Jerynn’s Collar", 1, 0, 0, 0, "A thick leather band, designed to cinch tightly yet comfortably around your neck.");

		clearMenu();
		addButton(0, "Next", jerynnPetstuffCleanup, false);
	}
	else
	{
		output(" She scrubs under the straps of the harness but leaves it in place, still locked together around your arms and legs.");

		clearMenu();
		addButton(0, "Next", jerynnPetstuffSleepingOver);
	}
	
	processTime(15 + rand(10));
}

public function jerynnPetstuffCleanup(isLemmeOut:Boolean = false):void
{
	trace("Cleanup");
	
	clearOutput();
	showJerynn(true);

	output("Jerynn,");
	if (!pc.isSubby() && jerynnPetstuffLevel() < jerynnPetstuffMax()) output(" to her credit");
	else output(" looking after her toy you suppose");
	output(", cleans you up, slowly and methodically, scrubbing you down and helping to work feeling back into your limbs. When you finally regain <i>some</i> control of your still jelly-like arms, you return the favor, helping to wash all of her hard to reach places.");

	output("\n\nEventually though she turns the steamy water off and directs you out of her shower.");

	var lootHarness:Boolean = false;
	
	if (jerynnPetstuffLevel() >= 4 && !hasJerynnsHarness() && !isWearingJerynnsHarness() && flags["JERYNN_HARNESS_GIFTED"] == undefined)
	{
		output("\n\nShe points you to her packs and you make with retrieving all of your gear. Tucked under your stuff is a little parcel intended for you, PET simply written across the top of it. Inside is a modified version of the harness you’ve become intimately familiar with whilst under the taur; each of the magnetic clasps has a tiny status light hidden on the corner, all of them dim. You slip it on automatically and you realize it’s sized perfectly for you, your suspicions about the clasps confirmed when you bend your arm double but the tell-tale smack of the clasps locking together is absent.");
		
		output("\n\nYou slip the garment back off for later and don the rest of your gear. ");
		
		flags["JERYNN_HARNESS_GIFTED"] = 1;
		lootHarness = true;
	}
	else
	{
		output("\n\nShe points you to her packs and you make with retrieving all of your gear, suiting back up and getting ready to return to your travels.");
	}

	output("\n\nBefore you leave, you make to thank her properly for saving you. You don’t even manage to utter the first syllable though, as she grabs");
	if (!isWearingJerynnsCollar()) output(" you around the waist and wraps you up in her arms tightly");
	else output(" the dangling chain of the leash and pulls you into her body");
	output(", a sinuous tongue making its way past your lips in a domineering kiss.");

	output("\n\n<i>“You’re welcome, </i>");
	if (jerynnPetstuffLevel() < jerynnPetstuffMax() / 2) output("friend");
	else output("pet");
	output("<i>,”</i> she says after breaking the kiss, her confident smirk once again present. She");
	if (!isWearingJerynnsCollar()) output(" finally slips the collar that you had all but forgotten about off and");
	else output(" unhooks the leash that you had all but forgotten about, but leaves the collar prominently wrapped around your neck. She");
	output(" bundles you out of the door");
	if (jerynnIsMistress()) output(" already anticipating the next opportunity to [pc.barkMeow] for Jerynn.");
	else if (jerynnPetstuffLevel() <= 5) output(" safe if a little confused.");
	else output(" and you make your way back to the icy cold streets of Irestead, still sore but glad to be safe.");

	if (!isLemmeOut || jerynnPetstuffLevel() <= 0) jerynnPetstuffLevel(true);
	processTime(15 + rand(15));

	currentLocation = "UVI N30";
	pc.HP(pc.HPMax());
	pc.energy(pc.energyMax());
	
	if(lootHarness)
	{
		output("\n\n");
		quickLoot(new MagneticHarness());
	}
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function jerynnPetstuffSleepingOver():void
{
	trace("Sleepover");
	
	clearOutput();
	showJerynn(true, true);

	output("Finally clean and dry, "+ (jerynnIsMistress() ? "Mistress" : "") +" Jerynn grabs the leash and wraps it tightly around her hand, keeping you close to her side. She leads you out of the bathroom and back into the main room of her apartment, everything in here sized appropriately for a near nine foot tall draconic-taur. The middle of the room sports a giant, sunken pit, stuffed full of pillows and blankets. Its bottom is a giant mattress filling the entire recess as the taur steps down into it, the fabric puffing out around her foot paw as she does. You feel tiny by comparison, a sense that only grows stronger when you hop down into the pillow-stuffed pit.");

	output("\n\nJerynn props her upper body up in one of the corners, easily tall enough to lean on the outside edge of it. She pats the mattress in front of her and you take that as an order, struggling to get your limbs under you on the soft surface; you make it, with something of a struggle that the taur finds hilarious, laughing to herself at your misfortune.");

	output("\n\n<i>“Good [pc.boy],”</i> she praises, and you beam in response. Even [pc.barkMeow].");
	
	if (flags["JERYNN_PETSTUFF_OPTIN_OFFERED"] != undefined)
	{
		output("\n\n<i>“No more talkin’, I’m tired, you’re tired, long day. Come on,”</i> she suggests, a hand rubbing against her flank as an invitation.");
		
		output("\n\nYou hadn’t noticed but your body does feel exhausted. You’re curled up under Mistress’s underbelly before you’ve even had chance to think, her thick tail lazily curling all around you.");
		
		clearMenu();
		addButton(0, "Next", jerynnPetstuffWakeUp);
		return;
	}
	
	flags["JERYNN_PETSTUFF_OPTIN_OFFERED"] = 1;
	
	output("\n\nThe leash comes unclipped from your collar and left on the high-ground, out of your reach. She leans a bit further and a dataslate returns in her grasp, a few seconds of idle taps against it and a large screen bursts into life, almost entirely filling the wall facing her. Various shows are indexed down the side, but the main view is full of galnet browsers; she’s flipping through them and pulls out one for a food delivery service here in Irestead. The others, though, really capture your attention. A few pharmaceutical companies, all of them specialising in transformatives... some clothing outlets, mostly specialising in garments fit for the tauricly-abled.... One window really catches your eye though; a forum dedicated to pet-play fetishism. Not surprising, really.");

	output("\n\nWhat does draw your attention though are the few child windows connected to it; things Mistress is obviously keeping a close eye on. There’s one specifically about training tips. Another focuses on physical modifications and equipment. The one at the top of the list really stands out though, discussing the legalities of owning a sapient pet.");

	output("\n\nThe screen chimes a happy little jingle, breaking you from your concentration. The window she was tapping away at now filled with a giant ‘Thank you for your order!’ message and a delivery eta. No longer focused on the food order, she spots just what it is you’re looking at and laughs to herself.");

	output("\n\n<i>“What do you think? You like being a pet? You can speak normally,”</i> she says.");

	processTime(15);
	
	clearMenu();
	addButton(0, "Enjoy", jerynnPetstuffLikeIt, 0);
	addButton(1, "Okay", jerynnPetstuffLikeIt, 1);
	addButton(2, "Nope", jerynnPetstuffLikeIt, 2);
}

public function jerynnPetstuffLikeIt(response:int):void
{
	clearOutput();
	showJerynn(true, true);

	var responses:Object = { liked: response };

	if (response == 0)
	{
		output("<i>“");
		if (pc.isBimbo()) output("Like, it’s lib-libe-lib. Kinda nice.");
		else output("It’s liberating in a way.");
		output(" Not having to worry about anything but what you want,”</i> you reply.");

		output("\n\n<i>“What you want </i>Mistress<i>.”</i>");
		
		output("\n\n<i>“What you want, Mistress,”</i> you correct. <i>“All a pet has to worry about is what their owner wants them to worry about.”</i>");
		
		output("\n\n<i>“A strange concept, isn’t it? To have choice taken away from you somehow being the most liberating thing imaginable.”</i>");
		
		output("\n\n<i>“It’s... good, Mistress. Like a bit of a holiday from my own life.”</i>");
	}
	else if (response == 1)
	{
		output("<i>“It’s a fun change of pace,”</i> you reply. <i>“Putting the desires of others in front of my own, the desires of </i>you<i>.”</i>");
		
		output("\n\n<i>“Your desires, </i>Mistress<i>.”</i>");
		
		output("\n\n<i>“");
		if (pc.isBimbo()) output("Um, y");
		else output("Y");
		output("our desires, </i>Mistress<i>.”</i> you correct. <i>“All a pet has to worry about is what their owner wants them to worry about.”</i>");
		
		output("\n\n<i>“A strange concept, isn’t it? To have choice taken away from you somehow being the most liberating thing imaginable.”</i>");
		
		output("\n\n<i>“I’m not sure Mistress. It’s good for a while, but I have my own life to live too. I can put it on hold, for a while, but I’ll always want to forge my own path.”</i>");
	}
	else
	{
		output("<i>“Not particularly,”</i> you reply. <i>“I just like a good fuck, but I have my own life to live. Your desires align with mine from time to time, so why not indulge a little?”</i>");
		
		output("\n\n<i>“Your desires, </i>Mistress<i>.”</i>");
		
		output("\n\n<i>“Yeah, your desires Mistress.”</i> you correct. <i>“It’s nice being able to hang it all up for a while and take a break, but I have my own worries, my own commitments to live up to.”</i>");
		
		output("\n\n<i>“Surely you can appreciate the irony though? To have choice taken away somehow being the most liberating thing imaginable?”</i>");
		
		output("\n\n<i>“I’m not sure Mistress. I guess for a little while, but I have my own life to live too. People that depend upon me, people that I can’t let down. I’ll always want to forge my own path.”</i>");
	}

	output("\n\n<i>“Understandable.");
	if (response != 0) output(" Commendable, even.");
	output("”</i> she muses, turning her attention back to the screen for a while. She pulls up the stack of windows you were looking at, flipping through them to find something specific. <i>“But you’re here again on the end of my leash, so for the time being you’ll happily indulge your Mistress, right?”</i>");

	output("\n\n<i>“");
	if (response == 0) output("Always");
	else if (response == 1) output("Of course");
	else output("For now,");
	output(" Mistress,”</i> you answer chipperly. She");
	if (pc.hasFur()) output(" scruffles your fur");
	else if (pc.hasHair()) output(" scruffles your hair");
	else if (pc.hasLongEars()) output(" scritches between your ears");
	else output(" strokes your head");
	output(" by way of a response and then taps at her tablet.");

	output("\n\nTwo images of petgirls blow up to fill the screen side-by-side. The one on the left is wrapped up tightly in a shiny layer of latex, the arms and legs of the occupant obviously doubled up similar to the harness you’ve been wearing, albeit with much more material covering the rest of the body. The other has seen some extensive medical work though, their arms and legs having been replaced entirely with robotic facsimiles of "+ pc.catDog("feline", "canine") +" limbs, effectively adapting their body to a life permanently spent as a quadruped.");

	output("\n\n<i>“I’m interested to see your point of view on these kinds of adaptations, pet. What do you think would be most appropriate?”</i>");

	processTime(15);
	
	clearMenu();
	addButton(0, "Bitchsuit", jerynnPetstuffLimbStuff, [responses, 0]);
	addButton(1, "Cybernetics", jerynnPetstuffLimbStuff, [responses, 1]);
	addButton(2, "Owner", jerynnPetstuffLimbStuff, [responses, 2])
}

public function jerynnPetstuffLimbStuff(compOpts:Array):void
{
	clearOutput();
	showJerynn(true, true);

	var responses:Object = compOpts[0];
	var response:int = compOpts[1];

	responses.limbs = response;

	if (response == 0)
	{
		output("<i>“The harness would be the better of the two, I think,”</i> you answer after a moment’s consideration. <i>“At least that way, no matter what, they would always have the ability to rely on themselves, Mistress, no matter what happened.”</i>");
	}
	else if (response == 1)
	{
		output("<i>“The cybernetics would be the better of the two, I think,”</i> you answer after a moment’s consideration. <i>“As... drastic a change as replacement may be, they look like they would allow for a lot more movement than the harness.”</i>");
	}
	else
	{
		output("<i>“Fundamentally Mistress, I think it would be down to the whims of the owner and what they expect of their pet,”</i> you answer after a moment’s consideration.");
	}

	output("\n\nJerynn hmms under her breath, thinking for a moment herself.");
	
	output("\n\n<i>“I have to say I’ve been partial to the cybernetics option myself. The suit is much cheaper, but you’ve seen how difficult it is to get around on your own. Can’t wear them constantly either, causes problems with the limbs to stay bent like that for too long.”</i>");
	
	output("\n\nNow that she mentions it, your hands do feel a little weird.");
	
	output("\n\n<i>“Something to be said for the routine, though. Daily personal preparation of your pet, making sure they’re healthy whilst you slip ‘em into the suit,”</i> she continues, obviously having spent a huge amount of time considering the two options herself.");
	
	output("\n\nShe goes back to tapping away at the tablet again as she continues. <i>“The cybernetics though, now that’s where the fun is. Limbs that actually work like the pet needs ‘em to work and none of the health issues. The part I like the most though is it’s a one way trip; can’t easily graft flesh and blood back to implants. Gotta stick to wetware for the rest of your days after that.”</i>");
	
	output("\n\nThe two windows slide back to their minimized state, replaced with only a single view this time. A grid of marketing images for a variety of transformative products, each spinning around independently and highlighting various features. Three of them are surrounded by a colorful border, probably indicating that they’ve been viewed in the past.");
	
	output("\n\nThe first is skin, pretty much. The model flips through some options like pigmentation, thicknesses and such, but pretty much just plain old human skin.");

	output("\n\nThe next is more interesting and offers far more options. Various lengths and shades of fur, and dozens of other connected options. Patterns, textures, even down to variations in the length based on body area.");
	
	output("\n\nThe final one offers almost as many options again, this time for scales. Pigmentation, patterns, sub-patterns, thicknesses, roughness, even down to the shape of the scales on different parts of the body.");
	
	output("\n\n<i>“Similar theme, pet. Interesting to see what you can make of each,”</i> she asks.");

	processTime(15);
	
	//[Skin][Fur][Scales][Owner]
	clearMenu();
	addButton(0, "Skin", jerynnPetstuffSkin, [responses, 0]);
	addButton(1, "Fur", jerynnPetstuffSkin, [responses, 1]);
	addButton(2, "Scales", jerynnPetstuffSkin, [responses, 2]);
	addButton(3, "Owner", jerynnPetstuffSkin, [responses, 3]);
}

public function jerynnPetstuffSkin(compOpts:Array):void
{
	clearOutput();
	showJerynn(true, true);

	var responses:Object = compOpts[0];
	var response:int = compOpts[1];

	responses.skin = response;

	output("It takes a while but you finally settle on an argument for a favorite.");

	if (response == 0)
	{
		output("\n\n<i>“Skin would be most appropriate, Mistress. Fur would be so difficult to wash and dry, and scales I imagine get caught on things,”</i> you answer, finally.");
	}
	else if (response == 1)
	{
		output("\n\n<i>“Fur would be most appropriate, Mistress. Soft and fluffy suits a pet much better than skin or scale,”</i> you answer, finally.");
	}
	else if (response == 2)
	{
		output("\n\n<i>“Scales would be most appropriate, Mistress. Fur would be so difficult to wash and dry, and skin just seems too... pedestrian,”</i> you answer, finally.");
	}
	else
	{
		output("\n\n<i>“They all have benefits I think, Mistress. Only really the owner would know which would suit their pet the best, as the owner is the only person who can answer how they wish to care for their pet,”</i> you answer, finally.");
	}

	output("\n\n<i>“Scales. Definitely scales,”</i> she retorts quickly. <i>“Fur’s too ticklish against mine, makes it really hard to enjoy a snuggle with your pet. Skin is pretty fragile in my experience. Yeah, it makes it real easy to figure out when your "+ pc.catDog("kitty", "puppy") +" tripped over their own feet and landed face first on the floor when the bruise shows up, but there’ll be nothing actually wrong beyond the bruise.”</i>");
	
	output("\n\nYou find yourself nodding in agreement.");
	
	output("\n\n<i>“Scales though, scales are pretty tough. Take it from me. And the modders are real up on their stuff when it comes to getting exactly what you want.”</i>");
	
	output("\n\nThe model definitely seemed to agree with the sentiment; far more color options and combinations. Mixed-color designs would probably be a lot easier to get right too compared to fur.");
	
	output("\n\nShe goes back to the tablet again, but before the screen can change again a chime from the apartment door interrupts. <i>“Don’t go anywhere, pet,”</i> she chuckles to herself, rolling to her feet and walking off to answer. The mattress is soon weighed down by her frame again, an <i>exceedingly</i> large bag in one hand, the bowl you’d so dutifully cleaned earlier in the other. Delicious, rich wafts of odor escape the bag and your stomach rumbles angrily, the thirst from earlier returned as hunger with just as pressing a need to sate it.");
	
	output("\n\nShe digs through the contents of the bag for a minute, judging your reaction to a dozen different foodstuffs in the bag. Whichever she deems you had the strongest reaction to ends up partially scooped out into your bowl, carefully positioned where Mistress can keep an eye on you whilst she eats her fill. She eats messily with her hands, offering you bits and pieces of the other trays as she devours her way through the majority, every bit delicious, and every time you end up licking her fingers clean.");
	
	output("\n\n<i>“So,”</i> she starts between bites, <i>“what do you think of a pet that can’t physically talk anymore?”</i> She quickly sucks a few bits of sauce off a finger, just enough to poke at the tablet without covering it in food in the process. Three windows pop up on the screen, three different options.");
	
	output("\n\nThe first is a company that produces high-tech communication devices. They seem to specialize in sub-vocal equipment, the kind of stuff that doesn’t actually needs you to make a noise to transmit speech, relying on a series of sensors around the neck- almost like a collar. One of the items states that it actually suppresses vocalizations entirely in the process, allowing speech to be sent without making a sound louder than an exhaled breath in the process. The only noises it wouldn’t suppress are noises it doesn’t <i>detect</i> as speech.");
	
	output("\n\nOne seems much more extreme, another transformative company. The page is mostly full of enhancements for singers and the like, offering larger potential ranges, higher notes, that kind of thing. Some offer to allow a consumer to emulate various fantastical beasts- at a cost, though. Generally removing the ability for normal speech in the process.");
	
	output("\n\nThe final window is just another thread from the petplay forum you spotted earlier, extolling the idea that it’s best <i>not</i> to force a prospective pet into losing their voice, and instead placing emphasis on it being the only choice they have to make on a regular basis. Knowing that they <i>could</i> speak, but that they don’t... unless allowed.");

	processTime(15);
	
	//[Collar][Mods][Choice][Owner]
	clearMenu();
	addButton(0, "Collar", jerynnPetstuffVoice, [responses, 0]);
	addButton(1, "Mods", jerynnPetstuffVoice, [responses, 1]);
	addButton(2, "Choice", jerynnPetstuffVoice, [responses, 2]);
	addButton(3, "Owner", jerynnPetstuffVoice, [responses, 3]);
}

public function jerynnPetstuffVoice(compOpts:Array):void
{
	clearOutput();
	showJerynn(true, true);

	var responses:Object = compOpts[0];
	var response:int = compOpts[1];

	responses.voice = response;

	if (response == 0)
	{
		output("<i>“The collar is interesting, I think. It takes choice away but I guess you could always listen in if the need arose,”</i> you answer.");
	}
	else if (response == 1)
	{
		output("<i>“The mods are interesting, I think. There’s a sense of... permanence to them, of finality,”</i> you answer. <i>“At least as permanent as a mod goes these days.”</i>");
	}
	else if (response == 2)
	{
		output("<i>“I think leaving it up to the pet is most interesting. To be given some power over their lifestyle is important, at least as far as demonstrating their commitment to their owner on a regular basis,”</i> you answer.");
	}
	else
	{
		output("<i>“Only the owner can really decide, I think. The best choice would depend entirely on how much time they were willing to dedicate, and how well they understood their pet,”</i> you answer.");
	}

	output("\n\n<i>“Mmm.");
	if (response != 0) output(" I hadn’t considered it that way before, but you’re right, pet. Still though,");
	output(" I lean towards the collars I think. Gives both the pet and the owner a viable connection so I wouldn’t have to keep such a close eye all the time, ya know? Give the freedom to be out without having to worry what mischief your little "+ pc.catDog("kitty", "puppy") +" has gotten up to!”</i>");

	output("\n\nMistress taps away at the tablet again, though this time no more kinky pages are forthcoming. Instead one of the shows tucked away on the side of the screen shoots up to fill the display, the title sequence for what promises to be a trashy drama show beginning to roll.");

	output("\n\nShe tries to hide a burp under her breath, trying at least to be somewhat lady-like in your presence. <i>“No more talkin’, I’m tired, you’re tired, long day. Come on,”</i> she suggests, a hand rubbing against her flank as an invitation.");
	
	output("\n\nYou hadn’t noticed but your body does feel exhausted, and the belly full of food weighs you down so heavily. You’re curled up under Mistress’s underbelly before you’ve even had chance to think, her thick tail lazily curling all around you. The show makes for fantastic white noise as you half-doze off, suddenly jolting awake from time to time and only being aware of the missing time thanks to the story being completely incoherent as you skip ten or fifteen minutes at a time.");

	processTime(15);
	
	//[Next] // Wake up
	clearMenu();
	addButton(0, "Next", jerynnPetstuffWakeUp, responses);
}

public function jerynnPetstuffWakeUp(responses:Object = null):void
{
	trace("Wake up");
	
	clearOutput();
	showJerynn(true, true);

	// Opt in is shown if you selected any one of the same options she would and you didn't balk at the very first option. => vary'd as simply "OptIn:"

	output("You toss and turn through the night with your Mistress, waking up briefly time and again as she fits in her sleep. Throughout, she keeps you close and safe, sometimes keeping you wrapped in the coils of her tail, other times smothering you in her amazonian arms.");
	
	output("\n\nSunlight filters through the blinds of the apartment, streams of light landing across your face to tear you from your slumber. Jerynn has rolled fully onto her back, her tail keeping you perched securely atop her underbelly. Your wakefulness doesn’t go unnoticed, an extra firm squeeze of the scales coiled around you join with a heartfelt <i>“Good morning, </i>pet<i>,”</i> from the taur.");
	
	output("\n\n<i>“How are you feeling?”</i> she asks.");
	
	output("\n\nA wiggle of your stumpy arms and legs reminds you of the harness, and that they’re still in good working order. At least working as well as the straps will let them. Mostly though, you feel surprisingly well rested, a feeling you’re about to give voice to before the full measure of your predicament blooms once more in your mind, " + pc.catDog("meowing", "barking") +" happily rather than vocalizing your comfort.");
	
	output("\n\n<i>“Good pet, very good,”</i> Mistress Jerynn chuckles, obviously pleased with your performance.");

	var isOptIn:Boolean = false;
	
	if (responses != null)
	{
		flags["JERYNN_RESPONSE_LIKED"] = responses.liked;
		flags["JERYNN_RESPONSE_LIMBS"] = responses.limbs;
		flags["JERYNN_RESPONSE_SKIN"] = responses.skin;
		flags["JERYNN_RESPONSE_VOICE"] = responses.voice;

		isOptIn = (responses.liked != 2 && (responses.limbs != 0 || responses.skin >= 2 || responses.voice == 0 || responses.voice == 3));
	}
	
	if (!isOptIn)
	{
		output("\n\n<i>“Let’s get you cleaned up then, can’t be lazing about here all day with you,”</i> she says.");
		
		output("\n\nThe magnetic locks on the harness are soon unstuck, your arms and legs floppy and unresponsive after a long night spent doubled over. She leaves you in the pit of comfort to work your tight muscles back to life, heading to the bathroom.");
		
		output("\n\nYou lie there, still barely in control of your extremities, and let the last day or so rest on your mind. A bundle of gear landing heavily next to you breaks you from your engrossed pondering, the taur perching herself on the edge of the pit whilst you make yourself busy with your equipment.");
		
		output("\n\n<i>“Keep last night in mind, </i>friend<i>. Sooner or later I’m going to have to take matters into my own hands for </i>your<i> benefit, if not my own,”</i> she says, a stern tone underlining the true meaning of her words.");
		
		output("\n\nSuiting back up under the watchful eyes of the taur, you have plenty to think on....");
		
		jerynnPetstuffLevel(true);
		processTime(10 + rand(10));

		currentLocation = "UVI N30";
		pc.HP(pc.HPMax());
		pc.energy(pc.energyMax());
	
		//[Next]
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("\n\n<i>“You like this, don’t you.”</i>");
		
		output("\n\n[pc.BarkMeow].");
		
		output("\n\nHer tail squeezes you affectionately, the tip rubbing under your chin with care before she speaks again. <i>“Don’t you think it’s silly to keep getting yourself lost in the Rift? Lost so that I have to traipse out there and find you? Lost so that you can have another night of this?”</i>");
		
		output("\n\nYou think on her point carefully for a moment. She’s right, to an extent; if this <i>is</i> what you want from her, then there is no reason to wander the frozen surface of Uveto expressly to get it.");

		output("\n\n[pc.BarkMeow].");

		var numDifferent:int = 0;
		var numSame:int = 0;
		var numOwner:int = 0;
		
		switch (responses.limbs)
		{
			case 0:
				numDifferent++;
				break;
			case 1:
				numSame++;
				break;
			default:
			case 2:
				numOwner++;
		}

		switch (responses.skin)
		{
			case 0:
				numDifferent++;
				break;
			case 1:
				numDifferent++;
				break;
			case 2:
				numSame++;
			default:
			case 3:
				numOwner++;
		}

		switch (responses.voice)
		{
			case 0:
				numSame++;
				break;
			case 1:
				numDifferent++;
				break;
			case 2:
				numDifferent++;
				break;
			default:
			case 3:
				numOwner++;
		}

		output("\n\nShe leans over and grabs the tablet from the night previous. A few taps and the windows from the various stores reopen. Another quartet of taps and she has a shopping basket full of");
		if (numDifferent >= numSame && numDifferent >= numOwner) output(" everything that you’d preferred the night previous.");
		else if (numSame >= numDifferent && numSame >= numOwner) output(" everything you two had shared interest in the night previous.");
		else output(" everything she said she preferred the night previous.");
		
		output("\n\nWarm wetness spreads over your [pc.asscheek], soon followed by a tell-tale firm poke, Jerynn looking down at you with a knowing smirk. Well, some morning fun <i>does</i> sound enticing! With some difficulty you manage to heft your [pc.ass] up and over the growing spire of her cock, trapping it between the scales of her underbelly and your wriggling frame in the process. The angled tip gives it the ideal shape to tunnel a perfect space for itself between");
		if (pc.biggestTitSize() <= 1) output(" your bodies");
		else output(" your [pc.breasts]");
		output(", every pump of the draconic taur’s heart sending another surge of cock onward.");
		
		output("\n\nHer tail urges you to move up her body, a somewhat troublesome task without the proper use of your limbs or ground to seek purchase against. Instead you take to worming your way along her body, squeezing around the dragon dick stuffed under you in the process- a body-sized handjob jumps out as the most appropriate way to describe the process as every inch wriggled along its length leaves a similarly sized trail of wetness on your [pc.skinFurScales] in kind.");
		
		var hasVagina:Boolean = false;
		if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;
		
		output("\n\nThe tip slides down your body as you make progress until reaching the tipping point; springing free of the body-on-body fuck-socket, the angled glans");
		if (hasVagina) output(" grazing through your labia");
		else output(" escapes the touch of your flesh and bounces back, tapping you right on the butthole");
		output(". Memories of the whole thing buried in your flesh come crashing back, doubly so when her cock finally settles into place with the tip tickling your");
		if (hasVagina) output(" [pc.cunt].");
		else output(" [pc.asshole].");
		
		output("\n\nEven after a night of sleep, your fuckhole still hasn’t recovered fully from the brutal stretching at the hands of Jerynn... making it all the easier to slide the tip of her bestial dick back into it and greedily gobbling down almost a foot of it under your own power. The back-half though, that takes some effort, having to work yourself back and forth- fucking yourself on her cock- to gather enough momentum with your restrained limbs to slip another inch past the gates of your");
		if (!hasVagina) output(" ass.");
		else output(" pussy.");
		
		if (hasVagina)
		{
			pc.cuntChange(pc.gapestVaginaIndex(), jerynn.biggestCockVolume());
			pc.loadInCunt(jerynn, pc.gapestVaginaIndex());
		}
		else
		{
			pc.buttChange(jerynn.biggestCockVolume());
			pc.loadInAss(jerynn);
		}
		
		output("\n\nYou build up into a good rhythm and slowly work yourself toward the hilt between moans, progress slowing considerably the closer you get to your target. Mistress Jerynn offers you no help on the way, leaving the job of coring");
		if (!hasVagina) output(" your body almost to your stomach");
		else output(" your womb");
		output(" on her cock entirely down to you. You’re so close! Just a few more inches!");
		
		output("\n\nAnd then you bump into the already half-inflated knot. Again and again you push back against it, and over and over your");
		if (!hasVagina) output(" [pc.ass]");
		else output(" [pc.cunt]");
		output(" refuses to yield enough to permit it entrance. You try and try and try but just can’t find the leverage required to stuff the throbbing thing inside. <i>You</i> won’t be satisfied until you’ve taken the whole thing because you know <i>Mistress</i> won’t be satisfied until every inch of her dick is buried inside her pet.");
		
		output("\n\nScales wrap under the harness band around your waist, the taur’s tail seeking a solid anchor to pull against. And pull it does; whenever you slam yourself back against the knot with all your might, it tugs right along with you... but not quite enough. You slam back again, and again it taunts you with the promise of help that it doesn’t quite deliver.");
		
		output("\n\nYou look up toward Jerynn and see her smirking back, a horribly demanding glint in her eyes.");

		output("\n\n<i>“Want a little help there, </i>pet<i>?”</i>");

		output("\n\nYou nod enthusiastically.");

		output("\n\n<i>“Then say you’ll stay as my pet "+ pc.catDog("kitty", "puppy") +"-[pc.boyGirl].”</i>");

		output("\n\nThe enormity of the request hits you in an instant, your body falling still just as soon as understanding of the request meanders through your lust-addled brain.");

		processTime(20 + rand(10));
		
		clearMenu();
		addButton(0, "Stay", jerynnPetstuffOptIn, undefined, "Stay", "Something tells you this might be the last decision you get to make...");
		addButton(1, "No", jerynnPetstuffNoOptIn)
	}
}

public function jerynnPetstuffOptIn():void
{
	clearOutput();
	showJerynn(true, true);

	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;

	output("[pc.BarkMeow]!");
	
	output("\n\nHer tail <i>immediately</i> throws all of its power behind a firm tug, your limbs scrabbling about against her scales in cooperation. It’s a tight fit, but with a lot of squeezing her knot <i>finally</i> thunders into your");
	if (!hasVagina) output(" ass");
	else output(" cunt");
	output(" with a lewd pop, satisfying fullness instantly blooming from your stretched-taut flesh. Job done, her tail slithers its way up your back and curves around your neck; a firm squeeze around it sending shivers down your spine.");
	
	output("\n\nYou open your eyes to her dangling the tablet right in front of your face; a verbal contract-come-poem, of sorts, fills the majority of the screen. Tucked right in the corner is a blinking little recording indicator, paired with a viewfinder focused squarely on your blissed out face.");
	
	output("\n\n<i>“Read it, pet. Aloud,”</i> she orders.");
	
	output("\n\nYou’re all too happy to comply, quickly thundering through the declaration whilst every word is recorded for posterity. Words fall from your throat almost automatically, announcing your willingness to hand over everything you have to Mistress Jerynn in a few short paragraphs; your equipment, your body and your mind forever.");
	
	output("\n\nHer cock throbs with every sentence, every inch of power that you promise her over your very existence until, with a final statement of your name, you designate her as your Mistress and your owner. She holds herself back for you to finish reciting the end of it, signaling her thorough enjoyment of your self-debasement with a thunderous blast of spunk. The weight, the heat, the throbbing of it all join together and throw you plunging over the edge into a similarly mind-bending orgasm of your own, your body working overtime to milk your Mistress’s cock of every last drop of pleasure possible.");
	
	output("\n\nThe enormity of it knocks you silly, fuckdrunk out of your mind. When reality seeps back in around the edges, Mistress is busy tapping away at the tablet. Being glass you can make out the cart of tens of thousands of credits of assorted mods expanding as she piles on customizations and specifics. She works quickly, seeming to know exactly what every last toggle does, where every option she most desires is tucked away. All you can do is heave breath into your lungs and twitch around her draconic dick. Her thumb presses tight to the corner and seals your fate; an order placed and a certain video filed away.");
	
	output("\n\nAlmost immediately a notification comes back, a half-snorted chuckle your owner’s only response.");
	
	output("\n\n<i>“Well, I didn’t expect that. Come on, the sooner we get you started the sooner you’ll be the perfect little cock-socket,”</i> she says happily.");
	
	output("\n\nStill wearing her half of the harness contraption, she fiddles with the tablet for a couple of moments before the magnetic interlocks click on. You shift slightly as they center and then lock together, once more attached to the underside of the taur, once more full-to-bursting with her throbbing cock. Her coat is back over the two of you in short order, and all you can do is hang there. At least this time you have the pleasure of hugging her flanks with your stumpy limbs, a much more personal orientation.");
	
	output("\n\nTime becomes irrelevant in the cocoon of the woolen coat, the taur soon making her way out of the apartment and back onto the streets of Uveto. You simply lose yourself to the impromptu fucking motion, no longer caring much of the possibility that you might be discovered, simply content to fuck, to be used as little more than a living onahole.");
	
	output("\n\nLight returns to your world all too soon, already at the destination Mistress Jerynn had set off to reach; the medical station already here on Uveto! The fritzy-droid confirms that it has the capability to carry out at least a portion of the ordered work. Uncaring for your comfort and already being treated exactly as prescribed by the contract, it jabs you with a hypospray right on the shoulder as it holds idle conversation with the taur. Seconds later you’re out for the count....");
	
	processTime(30 + rand(15));

	clearMenu();
	addButton(0, "Next", jerynnPetstuffBadEndII, true);
}

public function jerynnPetstuffNoOptIn():void
{
	clearOutput();
	showJerynn(true, true);

	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;

	output("<i>“No,”</i> you say with some measure of reservation.");
	
	output("\n\nHer tail unclasps its hold on the harness and slithers up your back to carefully wrap around your neck. She uses the grip to manhandle your body into doing as she pleases, pulling you forward to free a few inches of her cock before reversing course, stuffing it back into you with abandon.");
	
	output("\n\n<i>“Then keep last night in mind, </i>pet<i>,”</i> she says between ragged breaths, nearing her tipping point. <i>“Sooner or later- hnnf- I’m going to have to take - fuck - take matters into my own hands for - hnng - </i>your<i> benefit, if not my own,”</i> she continues between grit fangs. <b>A stern tone underlines the true meaning of her words; a threat that, if she has to keep saving you as she is, then eventually she’s going to make sure you can’t put yourself in danger any longer.</b>");
	
	output("\n\nThe taur’s pace redoubles, your");
	if (!hasVagina) output(" [pc.ass]");
	else output(" [pc.pussy]");
	output(" bouncing against her huge knot with every thrust. She tugs you against it firmly as the tell-tale pulses of a thick load navigating the length of dickflesh thunder through you, a pool of hot, thick heat building deep in your");
	if (!hasVagina) output(" guts");
	else output(" womb");
	output(" as she dumps another load into you. The weight building, bloating you up slightly is the final touch needed to throw you off the precipice of your own orgasm, your body clenching around her cock to milk it dry.");
	
	if (hasVagina)
	{
		pc.cuntChange(pc.gapestVaginaIndex(), jerynn.biggestCockVolume());
		pc.loadInCunt(jerynn, pc.gapestVaginaIndex());
	}
	else
	{
		pc.buttChange(jerynn.biggestCockVolume());
		pc.loadInAss(jerynn);
	}
	
	output("\n\nWhen your sense returns, you’re upside down and still under the taur, her tail cradling you to keep you in position- to keep your cum-filled");
	if (!hasVagina) output(" ass");
	else output(" pussy");
	output(" plugged with cock as she drags you to the bathroom. With some care she lowers you to the floor, her cock sliding out of you and followed by a lewd burp of spunk when the angled tip finally slips free.");
	
	output("\n\nYou lie there to drain out some, soothing heat of the shower soon making itself known across your [pc.skinFurScales]. Jerynn, looking after her toy you suppose, cleans you up, slowly and methodically, scrubbing you down and helping to work feeling back into your limbs once she peels the harness off of you. When you finally regain <i>some</i> control of your still jelly-like arms, you return the favor, helping to wash all of her hard to reach places.");
	
	output("\n\nEventually though she turns the steamy water off and directs you out of her shower. She points you to her packs and you make with retrieving all of your gear, suiting back up and getting ready to return to your travels.");
	
	output("\n\nBefore you leave, you make to thank her properly for saving you. You don’t even manage to utter the first syllable though, as she grabs the dangling chain of the leash and pulls you into her body, a sinuous tongue making its way past your lips in a domineering kiss.");
	
	output("\n\n<i>“Remember, </i>pet<i>,”</i> she says after breaking the kiss, her confident smirk once again present. She unhooks the leash that you had all but forgotten about, but leaves the collar prominently wrapped around your neck. She bundles you out of the door already anticipating the next opportunity to [pc.barkMeow] for Jerynn.");

	jerynnPetstuffLevel(true);
	
	processTime(15 + rand(8));
	pc.orgasm();
	
	//[Next] // Back outside
	currentLocation = "UVI N30";
	pc.HP(pc.HPMax());
	pc.energy(pc.energyMax());
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function jerynnPetstuffLongWalk():void
{
	trace("Long Walk");
	
	clearOutput();
	showJerynn(false, true);

	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;

	output("Jerynn saunters around, far more casually than the trip back to Irestead. Now that you’re back, she seems content to take her time. Your world is the inky blackness of the coat, the throbbing length of cock speared into your depths and the heavy musk of many, many orgasms. An occasional voice slips through, muffled somewhat by your wooly prison. The odd rumbling of some type of vehicle moving past.");

	output("\n\nThe chattering of idle talk seems to get louder growing into a constant din, and at some point the constant noise of gusty winds seems to have died off. Constant footsteps echo around you, obviously not caused by the taur as they fall out of sync with the tooing-and-froing of her body, and her knot still grinding your");
	if (!hasVagina) output(" [pc.ass]");
	else output(" [pc.pussy]");
	output(" into submission. Something bumps into you through the coat and you suddenly feel... exposed");
	if (pc.exhibitionism() >= 65) output(", a thrill running through your mind");
	output(". Wherever she’s taken you, there’s a lot of people around, and you’re right in the middle of them being reamed out by a cock as big as your arm.");
	if (pc.exhibitionism() >= 65)
	{
		output(" The realization somehow manages to turn you on even more; the thrill of being fucked in public with the people around you none-the-wiser courses through you. Your");
		if (!hasVagina) output(" ass");
		else output(" pussy");
		output(" milks the fat knot plugging it and Jerynn almost stumbles in response. She wasn’t expecting you to enjoy this as much as you are!");
	}

	output("\n\nKnocks and prods jiggle you around near constantly, the hustle and bustle around you remaining constant throughout. You have to stifle a moan as best you can as the extra touches send you into overdrive, cumming in public, dangling beneath your tauric saviour. The undulations of your tunnel wrings her cock with fresh vigor and she comes to a stop briefly, another heavy load of spunk depositing itself deep in your");
	if (!hasVagina) output(" bowels");
	else output(" cunt");
	output(". A "+ (pc.mf("moan", "groan")) +" escapes your throat despite your best efforts and it only serves to double down on your orgasm, the chance that somebody might have heard you adding an extra kick to your pleasured, writhing body.");

	if (jerynnPetstuffLevel() == 4)
	{
		output("\n\nShe continues moving with purpose, winding through the crowds as best she can. A few knocks and scrapes later and a door bell jingles above you as Jerynn walks under it. She spends a few minutes idly browsing, though what she’s looking at you have no idea. All kinds of rattles and clatters punctuate her stop-start movements around the interior of what has to be some kind of shop.");

		output("\n\nA heavy clatter followed by a long rattle hitting something above you eventually begets a response.");
		
		output("\n\n<i>“That’ll be 200 credits please.”</i>");
		
		output("\n\nThe coat rustles, presumably as Jerynn looks through her pockets to find a means of payment.");
		
		output("\n\n<i>“Thank you! I’m sure you’ll enjoy them, they look very nice!”</i>");
		
		output("\n\nJerynn grunts her assent and sets back off, leaving the shop with another jingle.");

		clearMenu();
		addButton(0, "Next", jerynnPetstuffHerPlace)
	}
	else
	{
		if (jerynnPetstuffLevel() == 3)
		{
			clearMenu();
			addButton(0, "Next", jerynnPetstuffBar);
		}
		else
		{
			clearMenu();
			addButton(0, "Next", jerynnPetstuffHerPlace);
		}
	}
	
	processTime(20 + rand(8));
}

public function jerynnPetstuffBar():void
{
	trace("Bar");
	
	clearOutput();
	showJerynn(false, true);

	output("She sets back off with definitive purpose, a certain sway to her swagger that you can’t help but deem intentional; you swing around more than the you did during the trip back to Irestead and it feels almost a little disorientating. No time to get used to it though, as the sounds of your surroundings change again. It almost sounds as though a fire is roaring away somewhere off in the distance, an overlay of various, chattering voices around the place holding a dozen different conversations.");

	output("\n\nJerynn takes a few more steps before she sits back on her rear legs, and what you think is her tail wraps under you and coils all over the bulge you’ve formed in her coat possessively. She sits, quietly, the background titters of people talking continue unabated, her tail lightly rubbing at you through the thick padding keeping you hidden from their eyes.");

	if (jerynnPetstuffLevel() < 5)
	{
		output("\n\n<i>“Mead,”</i> you hear from above you. Is she- are you in the Freezer? Is she sitting down for a <i>drink</i>?");
		
		output("\n\nYou sit there, perched full of her knob, as quietly as you can. She’ll be done when she’s done, you reason, so you’ll just have to wait until she’s good and ready to move on.");
		
		output("\n\n<i>“Been out a while, Jay, not been in for a while.”</i> You can just about pick out the voice as it comes closer. A squeak and an ‘oof’ <i>right</i> next to you as the speaker becomes clearer.");
		
		output("\n\n<i>“Yeah, just got back into town. Pretty bad out there, especially when you’ve gotta lump back somebody who got themselves caught short,”</i> the taur replies.");
		
		output("\n\n<i>“Found another one, eh?”</i> the stranger just on the other side of the coat pushes.");
		
		output("\n\n<i>“Yup, another idiot face first in the snow.”</i>");
		
		output("\n\n<i>“Alive, I hope?”</i> You can hear the emotion in the other speaker’s voice, clearly very concerned.");
		
		output("\n\nHer tail squeezes against you and you do your level best to keep quiet. She only lets up when the tell-tale sound of a "+ pc.mf("groan", "moan") +" from your mouth reaches her ears, the cum-bloated [pc.skinFurScales] of your belly too sensitive to hold back.");
		
		output("\n\n<i>“Yeah, I’d say they’re doing pretty well,”</i> Jerynn responds, a trailing chuckle for a joke shared only between the two of you. <i>“Now if you’ll excuse me, I have a very hot date with a long shower.”</i>");
		
		output("\n\n<i>“Later, Jay, and good work!”</i>");
		
		output("\n\nShe stays sat for a couple more seconds, glugging the last of her drink loudly before making a move to stand back up and set off from the bar.");
	}
	else if (jerynnPetstuffLevel() < 7 || (jerynnPetstuffLevel() == 8 && (flags["JERYNN_PETSTUFF_FLIPFLOP"] == 0 || flags["JERYNN_PETSTUFF_FLIPFLOP"] == undefined)))
	{
		if (jerynnPetstuffLevel() == 8) flags["JERYNN_PETSTUFF_FLIPFLOP"] = 1;
		
		output("\n\n<i>“Mead,”</i> you hear from above you. Back in the Freezer.");
		
		output("\n\nYou sit there, perched full of her knob, as quietly as you can. She’ll be done when she’s done, you reason, so you’ll just have to wait until she’s good and ready to move on. A good pet knows their place, after all.");
		
		output("\n\nAll is relatively quiet for the longest time. She sits, sipping her drink, and you make yourself somewhat busy by softly clenching around her thick dragon dick, losing yourself in a fuck-drunk haze. She stands and walks, though not very far, before sitting back down.");
		
		output("\n\n<i>“Oh, h-hey Miss Jay.”</i> The speaker is talking softly, but you can just about make them out over the background chatter.");
		
		output("\n\n<i>“Tut Jerome, you know what to call me,”</i> Jerynn responds confidently.");
		
		output("\n\n<i>“M-mistress Jerynn.”</i> Oh this is good.");
		
		output("\n\n<i>“That’s better. You’ve certainly screamed it enough to remember it, haven’t you?”</i>");
		
		output("\n\nHe doesn’t reply, but you take the creaking from the stool under him as a sign of some affirmative motion.");
		
		output("\n\nShe stands again, but only moves a few steps. Something presses into your side as she does so.");
		
		output("\n\n<i>“It’s been a while since we last blew off a little steam, hasn’t it </i>Jerbear<i>?”</i>");
		
		output("\n\nYou’re pretty sure you can hear the guy gulp.");
		
		output("\n\n<i>“I’ve got a little surprise for you. But not today. Soon,”</i> she pushes. <i>“Go on, feel my coat.”</i>");
		
		output("\n\nYou clench down around her cock immediately, a hand soon groping through the thick wool and pressing against your [pc.belly].");
		
		output("\n\n<i>“A-another one?”</i> he replies, somewhat astonished. He knows you’re under here?");
		
		output("\n\n<i>“The best one. Almost perfect I’d say,”</i> she chuckles.");
		
		output("\n\nHeavy silence sits between the pair whilst she gulps down the last of her drink loudly. Beverage finished and glass slammed down on the counter she stands back up and sets off out of the bar. It’s only when she crosses the threshold that you finally relax, having clamped down around her like a vice since she gave you away to");
		if (flags["MET_JEROME"] != undefined) output(" Jerome.");
		else output(" the guy.");
	}
	else
	{
		if (jerynnPetstuffLevel() == 8) flags["JERYNN_PETSTUFF_FLIPFLOP"] = 0;
		
		output("\n\n<i>“Mead,”</i> you hear from above you. Back in the Freezer.");
		
		output("\n\nYou sit there, perched full of her knob, as quietly as you can. She’ll be done when she’s done, you reason, so you’ll just have to wait until she’s good and ready to move on. A good pet knows their place, after all.");
		
		output("\n\nAll is relatively quiet for the longest time. She sits, sipping her drink, and you make yourself somewhat busy by softly clenching around her thick dragon dick, losing yourself in a fuck-drunk haze. She stands and walks, though not very far, before sitting back down.");
		
		output("\n\n<i>“Oh, h-hey M-mistress Jerynn.”</i> The speaker is talking softly, but you can just about make them out over the background chatter.");
		
		output("\n\n<i>“Hello, Jerome,”</i> Mistress replies.");
		
		output("\n\nShe stands again, but only moves a few steps. Something presses into your side as she does so.");
		
		output("\n\n<i>“It’s been awhile since we last blew off a little steam, hasn’t it </i>Jerbear<i>?”</i>");
		
		output("\n\nYou’re pretty sure you can hear the guy gulp.");
		
		output("\n\n<i>“It’s time for your surprise,”</i> she chuckles.");
		
		output("\n\nThe stool beside you creaks again, and you clench down around her cock as a hand gropes through the thick wool.");
		
		output("\n\n<i>“You’re coming back to my place. Drink up,”</i> she orders.");
		
		output("\n\nHeavy silence sits between the pair whilst she gulps down the last of her drink loudly. A pair of glasses slam down on the counter as she stands back up, joined by another tell-tale creak from the neighbouring stool.");

		//[Next] // Go to A Night With Jerome
		processTime(30 + rand(10));
		
		clearMenu();
		addButton(0, "Next", jerynnPetstuffNightWithJerome);
		return;
	}

	processTime(30 + rand(10));
	
	clearMenu();
	addButton(0, "Next", jerynnPetstuffHerPlace);
}

public function jerynnPetstuffNightWithJerome():void
{
	trace("Night with jerome");
	
	clearOutput();
	showJerynn(true, true);

	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;

	output("The trip back to");
	if (jerynnIsMistress()) output(" Mistress’s");
	else output(" Jerynn’s");
	output(" apartment is a little more nerve wracking than usual, with the addition of another body being along for the trip. You can’t help but squeeze down around the draconic dick knotting your");
	if (!hasVagina) output(" ass");
	else output(" pussy");
	output(" so securely. The taur certainly doesn’t seem shy about enjoying your actions to the fullest, moaning her appreciation for your ‘work’ between the odd stutter-step.");

	output("\n\nYou’re broken free from your worries with the familiar slam of");
	if (jerynnIsMistress()) output(" Mistress’s");
	else output(" Jerynn’s");
	output(" apartment door closing. She all but orders Jerome to make himself comfortable as light begins to creep back inside your woolen prison, your eyes taking a good while to adjust to the fact you’re no longer in pitch blackness. The taur shucks it free with a wiggle, jostling you around as you hang laden with countless loads of cum below her.");
	
	output("\n\nSeconds later, Jerynn is stepping down into the sofa-pit that lies central to her lounge, a pair of corded, white-furred legs appearing in your line of sight in the process. With the bear being sat on the edge of the pit, and you hanging under the taur, your head is oh-so-perfectly positioned to get an eye full of the guys half-hard cock as it grows turgid, throbbing thicker and larger with each passing second.");
	
	output("\n\n<i>“Go on </i>pet<i>, get him ready,”</i>");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" orders. A fuzzy, white hand encroaches your vision, wrapping digits around the fat lump of cock just below you. With the slightest of twitches, the dick wobbles upright and pats you on the");
	if (pc.hasMuzzle()) output(" muzzle");
	else output(" cheek");
	output(". A little more wobbling and some fussing and the chunky glans slips between your [pc.lips], leaving you to suckle on the bears dick at leisure.");
	
	output("\n\nHe <i>likes</i> that if the deep groan is anything to go by; at least up until it gets choked off, between a much more feminine moan and bouts of intense tongue action between");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" and the bear. You busy yourself with the thick cockmeat stuffed in your mouth, suckling deeply on the bear’s flesh, savoring your reward of intermittent spurts of pre for your efforts.");
	
	output("\n\nYou’re almost disappointed when Jerynn pulls away and the");
	if (silly) output(" lolicocksicle");
	else output(" cock");
	output(" slips free of your mouth with a <i>pop</i>... but your work is done. The bears cock juts proudly from his groin, glistening with a sheen of your saliva as it bobs slightly to the beat of his heart. Not that you have long to inspect it, as");
	if (!jerynnIsMistress()) output(" Jerynn");
	else output(" Mistress");
	output(" turns around and backs up to the edge of the sofa-pit.");
	
	output("\n\n<i>“Come on then, Jerome, put that fat fucking thing to </i>use<i>,”</i> she teases him.");

	output("\n\nYou jolt forward in your bindings a moment later, momentarily stuffed full of slightly more taur-cock before your body swings forward with her momentum. And again, the extra mass of cock receding before you reach the apex of your swing. Another jostle and you’re set to jouncing around under the taur, the three intertwined bodies starting to fall into the rhythm set by your pendulous swings.");

	output("\n\nThe taurs knot battering your");
	if (pc.hasCock() && !hasVagina) output(" prostate");
	else if (hasVagina) output(" g-spot");
	else
	{
		if (pc.hasPlumpAsshole()) output(" puffy donut");
		else output(" asshole");
	}
	output(" with its girth quickly sends you over the edge, convulsing around her draconic cock in orgasm, milking another load from her prodigious balls in the process. She moans deeply above you... and then starts to throw her own weight back against the bears thrusting hips, wet slaps of ass-meeting-hips playing in your [pc.ears].");
	
	if (hasVagina)
	{
		pc.cuntChange(pc.gapestVaginaIndex(), jerynn.biggestCockVolume());
		pc.loadInCunt(jerynn, pc.gapestVaginaIndex());
	}
	else
	{
		pc.buttChange(jerynn.biggestCockVolume());
		pc.loadInAss(jerynn);
	}

	output("\n\nA growing groan behind signals the impending summit of the polar bears pleasure, one, two, three more thrusts before he slams into");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" one last time. Telling gurgles from above let you know that the bear is every bit as <i>proficient</i> as the taur, her underbelly bloating slightly as Jerome pours his pleasure into her, glassy-smooth scales pillowing against your back.");

	output("\n\nYou hang there, lost in the sensations of being the head of the fuck-train until");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" takes a careful step forward. More stutter-steps follow as she turns around, and the bears furry legs re-enter your vision. The two of them get back to tongue-tennis as a half-hard, cum-slicked cock dangles just before your mouth....");

	output("\n\nWith some stretching and straining you manage to get your mouth close enough that, with a little luck, some leverage from your tongue, and no small amount of sucking, it bats wetly into your [pc.lips]. Careful work lets you slip the head back into your mouth, your [pc.tongue] swirling around the ridges and bumps to slurp it clean.");
	
	pc.loadInMouth(jerome);

	output("\n\nA surprised grunt into the makeout session above prompts a little investigation from the pair, a chuckle from the taur soon following.");

	output("\n\n<i>“I told you. Almost perfect,”</i>");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" says. The bear can only groan as you continue to clean his cock.");
	
	processTime(30 + rand(15));

	clearMenu();
	addButton(0, "Next", jerynnPetstuffNightWithJeromeII);
}

public function jerynnPetstuffNightWithJeromeII():void
{
	clearOutput();
	showJerynn();

	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;

	output("All too soon, the taur pulls away again, this time hopping up behind the bear and quickly ushering him out of her apartment. He scarcely has time to get his pants back on, let alone the rest of his gear before the apartment door is slamming shut behind him.");

	output("\n\nNow just you and");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(", she sighs happily and heads to the bathroom. Once more you come face-to-face with your own visage in the mirror. Jerynn, again, staring at you through the mirror, a satisfied, confident smirk on her face. A blush");
	if (pc.hasFur()) output(" strong enough to show through your fur");
	else if (pc.hasScales()) output(" strong enough to tinge your scales");
	output(" is all you can respond with as she bends her knees, finally lowering you to the floor. Your elbows take some of your weight, but your gut is just too full for your knees to reach the floor. A barely audible click and the taur starts to stand back up, her knot tugging at your");
	if (!hasVagina) output(" [pc.ass]");
	else output(" [pc.vagina]");
	output(". It doesn’t come easy and it takes her a few strong jerks before it starts to move, setting you wobbling on your self-made waterbed.");
	
	output("\n\nRough, cold pads softly press against your [pc.skinFurScales] as the taur brings one of her hind legs to bear against your back; one final tug with a little extra pressure squeezing you into the floor with her foot and her huge knot <i>finally</i> rushes out of your tender");
	if (!hasVagina) output(" ass");
	else output(" pussy");
	output(", a gush of still hot spunk jetting out of you after it. Inch after inch of half-rigid cock follows the knot, leaving an odd hollow in its wake, more jizz oozing from your well-fucked passage.");
	
	output("\n\nAfter what feels like miles of dragon-dick has been removed from your interior, Jerynn rolls you over onto your back, cold tiles supporting your weight. Looking up you can clearly make out a collection of shower heads around you, and soon, they’re busy spraying glorious, soothing, steamy water all over. With your gut slowly draining and the hot water washing away all the sticky, sweaty horribleness caked over your body, Jerynn moves around you, undoing the final parts of the harness. Your knees and elbows finally free you just flop against the floor, exhausted but immensely satisfied, content to simply lie there and soak in the heat of the shower.");
	
	output("\n\nJerynn,");
	if (!jerynnIsMistress()) output(" to her credit");
	else output(" looking after her toy you suppose");
	output(", cleans you up, slowly and methodically, scrubbing you down and helping to work feeling back into your limbs. When you finally regain <i>some</i> control of your still jelly-like arms, you return the favor, helping to wash all of her hard to reach places.");
	
	output("\n\nEventually though she turns the steamy water off and directs you out of her shower. She points you to her packs and you make with retrieving all of your gear, suiting back up and getting ready to return to your travels.");
	
	output("\n\nShe grabs you before you have a chance to leave, a sinuous tongue making its way past your lips in a domineering kiss.");
	
	output("\n\n<i>“You’re welcome, </i>");
	if (jerynnPetstuffLevel() < jerynnPetstuffMax() / 2) output("friend");
	else output("pet");
	output("<i>,”</i> she says after breaking the kiss, her confident smirk once again present. She");
	if (!isWearingJerynnsCollar()) output(" finally slips the collar that you had all but forgotten about off and");
	else output(" unhooks the leash that you had all but forgotten about, but leaves the collar prominently wrapped around your neck. She");
	output(" bundles you out of the door");
	if (jerynnIsMistress()) output(" already anticipating the next opportunity to [pc.barkMeow] for Jerynn.");
	else if (jerynnPetstuffLevel() <= 5) output(" safe if a little confused.");
	else output(" and you make your way back to the icy cold streets of Irestead, still sore but glad to be safe.");

	jerynnPetstuffLevel(true);
	
	pc.orgasm();
	processTime(180 + rand(60));

	pc.HP(pc.HPMax());
	pc.energy(pc.energyMax());
	currentLocation = "UVI N30";
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function jerynnPetstuffBadEnd():void
{
	clearOutput();
	showJerynn(false, true);

	var hasVagina:Boolean = false;
	if (pc.totalVaginas() > 0 && pc.blockedVaginas() == 0) hasVagina = true;

	output("Your");
	if (!hasVagina) output(" [pc.ass]");
	else output(" [pc.pussy]");
	output(" convulses around her spire of draconic cock in response to the question. Even aware of exactly what her ‘improvements’ might entail, exactly what it means for <i>you</i>, there’s just something deep in your mind, some seed Jerynn has planted that refuses to turn her offer down.");
	
	output("\n\nShe takes your lack of refusal as tacit acceptance of the way things will be between the two of you from here on out; she, the Mistress and Owner, you, the slutty fuckpuppet kept for another’s entertainment. With no negative forthcoming Jerynn breaks into a much faster jog than the trip back, heading deep into the bowels of Irestead with you no longer in a position to steer her from the path she’s now set upon. The familiar sounds of intermingling into the background din of the outpost are soon lost behind a closed door. The queasy shifting of your");
	if (!hasVagina) output(" gut");
	else output(" belly");
	output(" full of spunk roiling oddly in the elevator soon repeats as it has many times in the past.");
	
	output("\n\nThe two of you reach her apartment in record time, but her coat remains steadfast. Instead a screen bursts to life, a half-dozen audio streams chattering over top of each other as a cacophony of blips and chimes break through the otherwise indecipherable noise.");
	
	output("\n\n<i>“Well, I didn’t expect that. Come on, the sooner we get you started the sooner you’ll be the perfect little cock-socket,”</i> she says happily, the screen falling silence once again.");
	
	output("\n\nSoon enough you’re back in the elevator and heading back down to the streets of Irestead. You simply lose yourself to the impromptu fucking motion, no longer caring much of the possibility that you might be discovered, simply content to fuck, to be used as little more than a living cocksleeve.");
	
	output("\n\nLight returns to your world all too soon, already at the destination Jerynn had set off to reach; the medical station already here on Uveto. The fritzy-droid confirms that it has the capability to carry out at least a portion of the ordered work. Uncaring for your comfort it jabs you with a hypospray right on the shoulder as it holds idle conversation with the taur. Seconds later you’re out for the count....");
	
	processTime(54);
	
	clearMenu();
	addButton(0, "Next", jerynnPetstuffBadEndII, false);
}

public function jerynnPetstuffBadEndII(isOptIn:Boolean):void
{
	clearOutput();
	showJerynn(false, true);
	
	pc.removeAll();
	
	output("Numb. Everything is numb. Your head feels as though it’s been filled with cotton wool, your mouth similar. It’s a real struggle to tear open your eyes, every single muscle in your body refusing to cooperate, and when you do the light entering them is physically painful. You have to squint to keep the worst of the pain away, your surroundings blurry, unfocused.");

	output("\n\nGradually your [pc.eyes] adjust to the room, details filtering in.");
	if (!jerynnIsMistress()) output(" Jerynn’s");
	else output(" Mistress’s");
	output(" apartment. You’re propped up against the edge of the sofa-pit in the main room, facing the display filling a wall. You make a move to rub your face but your hand refuses to follow orders. A lazy tilt of your head to the offending limb");
	if (flags["JERYNN_RESPONSE_LIMBS"] == 0)
	{
		output(" acting as though it were still wrapped tightly in the embrace of the harness, but without a strap in sight. You frantically wave your arm around to absolutely no avail; your elbow simply refuses to cooperate with your brain’s demands for it to move. The same for your other arm, after a quick test. Your knees similarly refuse orders");
		if (pc.isBiped())
		{
			output(" leaving the");
			if (pc.hasFeet()) output(" the soles of your [pc.feet]");
			else if (pc.hasPaddedLegs()) output(" the pads of your [pc.feet]");
			else output(" your [pc.feet]");
			output(" tucked under your [pc.ass].");
		}
	}
	else
	{
		output(" shows it missing. Wait, missing?! You frantically wave the stubby end of your shoulder around to absolutely no avail; all you can see is the hints of embedded cybernetics; bio-organic circuitry spread across and presumably under your [pc.skinFurScales] right where your arm should be. More wiggling and searching proves equally fruitless of your other arm... or your legs. At least you have <i>something</i> of the upper leg left, stumps just long enough to ensure your [pc.butt] is completely intact and unmolested by an infusion of technology.");
	}

	output("\n\n");
	if (!jerynnIsMistress()) output("Jerynn");
	else output("Mistress");
	output(" jogs her way into the room from behind, the sounds of your physical distress grabbing her attention and drawing her to you in seconds. She drops bodily into the pit beside you, an arm wrapping around your back to pull you into a smothering hug against her tits.");

	output("\n\n<i>“Shh, I’m here now pet,”</i> she whispers soothingly into your ear, <i>“the worst of it’s over with; just a few changes whilst you were out.”</i> She rolls so that her back is against the side of the pit, leaving you propped up across the front of her upper body whilst she slides over an already opened delivery crate.");

	output("\n\n<i>“It took a week for the changes to settle, pet, but you’re ready now.”</i>");

	output("\n\nA week? You’ve been out a week?!");

	if (flags["JERYNN_RESPONSE_LIMBS"] != 0)
	{
		output("\n\n<i>“The cybernetics took a while to integrate. Best you not be aware for the worst of it,”</i> she says idly whilst rummaging through the container. Her hands extract a box, proudly marked as containing a set of cybernetic limbs. Specifically, cybernetic <i>"+ pc.catDog("kitty", "puppy") +"</i> limbs, in a classy jet-black with yellow highlight motif.");
		if (!jerynnIsMistress()) output(" Jerynn");
		else output(" Mistress");
		output(" can barely contain her own excitement as she tears into the box, extracting four glossy chunks of high-tech goodness in mere moments.");
		
		output("\n\nThey snap into place on the mounting points knitted to your flesh with a little fussing, locking themselves into place with a positive click. Each one connects and calibrates itself to form a near perfect seal against your [pc.skinFurScales] before it starts accepting ‘input’ from you, flexing awkwardly as you start to get a feel for how to control them.");
	}
	else
	{
		output("\n\n<i>“Just some tweaks to your joints. Best you not be struggling against them whilst they adapt,”</i> she says idly whilst rummaging through the container. She fishes out a thick bundle of black latex, a shake quickly unraveling it in the air to reveal five extrusions with obvious implications; arm and leg sheaths, along with a partial mask for the head. Mistress can barely contain her own excitement as she straightens it all out, yanking a heavy zip down the back of the suit.");
		
		output("\n\nShe juggles you and the suit around, slipping your limbs into the proper places with a bit of a struggle before tackling the head. It takes some tugging");
		if(pc.hasHair()) output(" and more than a few pulled hairs");
		output(" but it finally settles into place, wrapped tightly around your [pc.face], leaving nothing but your eyes and mouth exposed. The zip rumbles closed down your spine to pull every last inch of the latex tight; a perfect fit, leaving only an area around your crotch exposed to the air.");
	}

	output("\n\nStrong claws under your arms remove you from the seat of");
	if (jerynnIsMistress()) output(" Mistress’s");
	else output(" Jerynn’s");
	output(" lap, tipping you horizontal and placing you on the floor on your new");
	if (flags["JERYNN_RESPONSE_LIMBS"] == 0) output("ly latex-wrapped");
	output(" limbs. A week laid up and immobile");
	if (flags["JERYNN_RESPONSE_LIMBS"] != 0) output(" and a whole new set of sensations feeding back from your robo-limbs");
	output(" has you stumbling to keep your balance just to stay upright, stable as a newborn "+ pc.catDog("kit", "pup") +".");

	output("\n\nYour bowl finds itself slid under your nose, a delicious waft of steam emitting from the contents to strike a blow straight to your famished stomach. In the blink of an eye you’re face-first in there, wolfing down your first meal in days, a firm hand stroking along your back urging you onward.");

	output("\n\nThe bowl soon finds itself licked clean, and no sooner have you finished do you find staying upright an increasing struggle. You let yourself fall to your side, barely struggling to keep your eyes open as a new wave of exhaustion kicks in.");
	if (jerynnIsMistress()) output(" Mistress");
	output(" Jerynn scooches closer, her comforting hand still petting over your [pc.skinFurScales], her other hand rattling a rather sizeable bottle of medications....");
	
	pc.createStatusEffect("Milk Paused");
	pc.createStatusEffect("Cum Paused");
	processTime((7 * 24 * 60) + rand(1440));
	
	clearMenu();
	addButton(0, "Next", jerynnPetstuffBadEndIII, isOptIn);
}

public function jerynnPetstuffBadEndIII(isOptIn:Boolean):void
{
	clearOutput();
	showJerynn(false, true);

	output("The next few weeks pass in much the same way, a routine building where you spend the majority of your time sleeping between meals. Every bowl finds itself peppered with another round of pills.");
	if (!isOptIn)
	{
		output(" At first you refused to eat out of fear of what they were; hunger would always win out though, and without dramatic adverse consequences, you soon accepted that their consumption was simply going to be required to stave off starvation.");
	}
	output(" Whatever questions you might have about them were");
	if (flags["JERYNN_RESPONSE_VOICE"] == 0 || flags["JERYNN_RESPONSE_VOICE"] == 3) output(" muffled away by the presence of the collar wrapped around your neck, stealing any noise it deemed unacceptable of a pet.");
	else if (flags["JERYNN_RESPONSE_VOICE"] == 1) output(" strangled away by a constant throbbing pain in your neck whenever you would try to talk.");
	else output(" kept to yourself.");

	output("\n\nMore changes made themselves evident almost immediately, every meal, each sleep, every round of pills changing your body a little more.");
	if (pc.biggestTitSize() > 3)
	{
		output(" Your chest is the first noticeable target, mass disappearing from your [pc.chest] serving to make finding your balance on your");
		if (flags["JERYNN_RESPONSE_LIMBS"] != 0) output(" new limbs");
		else output(" latex-cocooned limbs");
		output(" easier with every passing day, leaving you with manageable handfuls by the time the reduction tapers off.");
	}
	if (pc.thickness >= 75 || pc.tone >= 75)
	{
		if (pc.biggestTitSize() > 3) output(" The rest of your body follows suit, your body slimming");
		else output(" Each day it becomes easier to find your balance as your body slims");
		output(" away under the guise of a carefully controlled diet to leave you with an agile poise.");
	}
	if (pc.hasCock()) 
	{
		output(" The greatest");
		if (pc.biggestTitSize() > 3 || pc.tone >= 75 || pc.thickness >= 75) output(" loss");
		else output(" change");
		output(" though comes in the form of your [pc.cock], withering smaller with each passing day, until, one morning, nothing remains of it; just an unadorned");
		if (pc.hasFur()) output(" tuft");
		else output(" patch");
		output(" of [pc.skinFurScales] where it used to jut proudly from your groin.");
	}

	if (pc.skinType != GLOBAL.SKIN_TYPE_SKIN && flags["JERYNN_RESPONSE_SKIN"] == 0)
	{
		if (pc.isGoo())
		{
			output("\n\nYour amorphous body turns milky as the days pass, slowly solidifying with a near perfect layer of pale skin.");
		}
		else
		{
			output("\n\nYour");
			if (pc.skinType == GLOBAL.SKIN_TYPE_FUR) output(" fur thins");
			else if (pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output(" scales thin");
			else if (pc.skinType == GLOBAL.SKIN_TYPE_CHITIN) output(" chitin thins");
			else if (pc.skinType == GLOBAL.SKIN_TYPE_FEATHERS) output(" feathers thin");
			else if (pc.skinType == GLOBAL.SKIN_TYPE_LATEX) output(" latex skin thins, flaking off in small, hardened patches");
			else if (pc.skinType == GLOBAL.SKIN_TYPE_PLANT || pc.skinType == GLOBAL.SKIN_TYPE_BARK) output(" verdant plant-like epidermis thins")
			output(" gradually as the days pass, shedding increasing amounts of detritus to leave only soft, pink skin behind.");
		}
	}
	else if (pc.skinType != GLOBAL.SKIN_TYPE_FUR && flags["JERYNN_RESPONSE_SKIN"] == 1)
	{
		if (pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output("\n\nYour scales thin gradually as the days pass, tufts of fur slowly erupting from between the edges to dislodge them. The tufts grow with every passing day, building into a thick, jet-black coat.");
		else if (pc.skinType == GLOBAL.SKIN_TYPE_SKIN) output("\n\nYour skin breaks out in odd patches as the days pass, fur starting to sprout around your body to build into a thick, jet-black coat.");
		else if (pc.isGoo()) output("\n\nYour amorphous body turns milky as the days pass, slowly solidifying with a near perfect layer of pale skin. Tufts of fuzz soon begin to grow in the wake of the porcelain skin to leave you with a thick, jet-black coat of fur.");
		else output("\n\nYour [pc.skin] thins out gradually as the days pass, tufts of fur slowly erupting. The tufts grow with every passing day, building into a thick, jet-black coat.");
	}
	else if (pc.skinType != GLOBAL.SKIN_TYPE_SCALES && flags["JERYNN_RESPONSE_SKIN"] >= 2)
	{
		if (pc.skinType == GLOBAL.SKIN_TYPE_SKIN) output("\n\nYour skin breaks out in odd patches as the days pass, your sense of touch becoming dull on the eve of the appearance of each new off-colored spot. Gradually, a tough layer of scales begins to form, spreading out in an interlocking mesh of lustrous red.");
		else if (pc.skinType == GLOBAL.SKIN_TYPE_FUR) output("\n\nYour fur thins out gradually as the days pass, shedding in increasing amounts. In the wake of each missing patch remains a tough layer of lustrous red scales.");
		else if (pc.isGoo()) output("\n\nYour amorphous body turns milky as the days pass, a peppering of tough, colorless scales solidifying into a complete layer. Pigment slowly bleeds into each one in turn, leaving you with a layer of lustrous red scales.");
		else output("\n\nYour [pc.skin] breaks out in odd patches as the days pass, your sense of touch becoming dull on the eve of the appearance of each new off-colored spot. Gradually, a tough layer of scales begins to form, spreading out in an interlocking mesh of lustrous red.");
	}
	else if (pc.skinType == GLOBAL.SKIN_TYPE_SCALES && flags["JERYNN_RESPONSE_SKIN"] >= 2 && pc.scaleColor != "red")
	{
		output("\n\nPigment slowly bleeds through your scales in patches, a wave of lustrous red overtaking your [pc.scaleColor].");
	}

	if (!pc.hasVagina())
	{
		output("\n\nBy the fourth week, the changes desired by");
		if (jerynnIsMistress()) output(" Mistress");
		output(" Jerynn seem to be over, but you’re left with one final oddity; a pressure building day by day deep in your midriff. It starts as a tightly packed ball and elongates with each bowl of dosed food, nestling between your [pc.hips]. The nature of it finally becomes clear one day, when you awake soon after a meal to the sensation of something... blooming between your [pc.thighs]. With new-found flexibility, you manage to contort yourself in such a way to survey the cause of the change. Nestled between your legs sits a thick pair of scale-covered labia, flanking the entrance to your newly minted pussy.");
	}
	else if (!pc.hasVaginaType(GLOBAL.TYPE_GRYVAIN))
	{
		output("\n\nBy the fourth week, the changes desired by");
		if (!jerynnIsMistress()) output(" Mistress");
		output(" Jerynn seem to be over, but you’re left with one final oddity; a curious pressure building just on the edge of your [pc.pussies]. The nature of it finally becomes clear one day, when you awake soon after a meal to the sensation of something... blooming between your [pc.thighs]. With new-found flexibility, you manage to contort yourself in such a way to survey the cause of the change. Your labia have plumped up some, and gained a fine dusting of scales in the process.");
	}

	output("\n\nWith your body changed so dramatically, you’re reliant on");
	if (jerynnIsMistress()) output(" Mistress");
	else output(" Jerynn");
	output(" for the most basic of tasks. True to form, she takes pride in providing you with everything you need, keeping you clean, well fed and above all else, instilled with a sense of reverent <i>cherishment</i>.");
	
	output("\n\nThrough many hours of trial and error - and no small amount of encouragement - you begin to get the hang of");
	if (flags["JERYNN_RESPONSE_LIMBS"] != 0) output(" your new limbs");
	else output(" life all all-fours");
	output(", earning yourself at least some minor feeling of self-empowerment. Small as it may be, it forms an important step; being trusted to keep yourself out of trouble allows");
	if (jerynnIsMistress()) output(" your owner");
	else output(" Jerynn");
	output(" to return to work on a more regular basis. She leaves you to your own devices for a day or two at a time, her treks out to the rift kept as short as possible.");
	
	output("\n\nIn her place, all you have for company is a carefully curated playlist of videos left running from the moment she leaves to the second she returns. Training material of a fashion. They start simple, just little tips for how to move around better as a kept pet, effective means of emulating little gestures to emote as a " + pc.catDog("kitten", "puppy") +" would to its owner, how to behave when out in public on a leash.... Every list you watch through ends with an impromptu check-up when your owner returns, the contents of the next list changing to suit what she believes you need better command of.");
	
	output("\n\nIt isn’t long before you’ve graduated from the basics and the lists become more sexual in nature. Just interspersed with one or two of Mistress’s favorite videos at first, a little nugget to stew on in between the otherwise steady stream of higher brow viewing. That quickly falls by the wayside though, an almost constant bombardment of petgirls being railed by their owners six ways from Sunday soon following. What few videos you could consider as ‘learning material’ between them focusing more on the proper way to beg for cock than for treats.");
	
	output("\n\nOf course, with little ability to tend to yourself, the uninterrupted stream of pornography has your");
	if (pc.hasVagina()) output(" needy");
	else output(" virgin");
	output(" pussy desperate for any stimulation. And so Mistress finds you with your ass high in the air, presenting your soaked cunt for her inspection every time she walks through the apartment door. Without fail you wind up stuffed full of her cock and pounded senseless, the stresses of her day washed away with a night of vigorous fucking.");
	
	processTime((4 * 7 * 24 * 60) + rand(1440));
	
	if (pc.biggestTitSize() > 3)
	{
		for(var bRow:int = 0; bRow < pc.breastRows.length; bRow++)
		{
			pc.breastRows[bRow].breastRatingRaw = 3;
		}
	}
	
	if (pc.thickness >= 75) pc.thickness = 74;
	if (pc.tone >= 75) pc.tone = 74;
	
	if (pc.hasCock()) pc.removeCocks();

	if (pc.skinType != GLOBAL.SKIN_TYPE_SKIN && flags["JERYNN_RESPONSE_SKIN"] == 0)
	{
		pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
		pc.skinTone = "pale pink";
		pc.skinFlags = [GLOBAL.FLAG_SMOOTH];
	}
	else if (pc.skinType != GLOBAL.SKIN_TYPE_FUR && flags["JERYNN_RESPONSE_SKIN"] == 1)
	{
		pc.skinType = GLOBAL.SKIN_TYPE_FUR;
		pc.furColor = "black";
		pc.skinFlags = [GLOBAL.FLAG_SMOOTH];
	}
	else if (flags["JERYNN_RESPONSE_SKIN"] >= 2)
	{
		if(pc.skinType != GLOBAL.SKIN_TYPE_SCALES) pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
		if(pc.scaleColor != "red") pc.scaleColor = "red";
		pc.skinFlags = [GLOBAL.FLAG_SMOOTH];
	}
	
	if (!pc.hasVagina()) pc.createVagina();
	var vIdx:int = pc.gapestVaginaIndex();
	if (!pc.hasVaginaType(GLOBAL.TYPE_GRYVAIN))
	{
		for(vIdx = 0; vIdx < pc.vaginas.length; vIdx++)
		{
			pc.shiftVagina(vIdx, GLOBAL.TYPE_GRYVAIN);
			pc.inflateVagina(vIdx);
		}
	}
	
	vIdx = pc.gapestVaginaIndex();
	pc.cuntChange(vIdx, jerynn.biggestCockVolume(), false);
	pc.loadInCunt(jerynn, vIdx);
	pc.maxOutCumflation("vagina " + vIdx, jerynn);
	
	clearMenu();
	addButton(0, "Next", jerynnPetstuffBadEndIV);
}

public function jerynnPetstuffBadEndIV():void
{
	clearOutput();
	showJerynn();

	output("One morning, after a particularly energetic night, Mistress doesn’t leave on her regular schedule. You find her packing a flight case full of clothes and other important essentials. Curiosity has you intrigued, so you spend your time playfully winding between her legs and generally making something of a nuisance of yourself. A leash finds itself snapped to your collar in short order, wound around the nearest door handle to keep you out of the way.");

	output("\n\n<i>“We’re going on a trip, and we need to leave </i>now<i>,”</i> she informs you, no more details forthcoming.");
	
	output("\n\nThe case is soon full and thrown over her back, leaving her free to clip a belt around your waist and take up your leash. Just like that you’re following behind her out of the apartment, trotting along beside her as she leads you outside for the first time in months. Lusty stares, lewd comments and more than a few cheeky gropes are aimed towards you as you follow Mistress wherever she may lead you, soon arriving at a much larger elevator; one you recall that will take you to the station above the moon.");
	
	output("\n\nAnother familiar sight soon arrives; your ship, still here in the docking bay after all your time spent on the planet. And Mistress is making a beeline straight for it. The loading ramp opens automatically when it detects you; another fact that seems unsurprising for your owner as she leads you aboard.");
	
	output("\n\nInside everything seems exactly as it had been left; albeit covered in dust.");
	if (crew(true) > 0)
	{
		output(" It looks as though your crewmate");
		if (crew(true, true) > 1) output("s");
		output(" took off some time ago in your absence, having stayed at least a while.");
	}
	
	output("\n\n<i>“Somebody has been looking for you, pet,”</i> Mistress says, the docking ramp closing behind the two of you with a bang, <i>“had a photograph and thought you were on Uveto.”</i>");
	
	output("\n\nShe leads you around the familiar space as she acquaints herself with where everything is, seemingly no stranger to the interior of a spaceship. Her hard-sided case falls to the deck plating with a crash when you arrive in your old cabin, her body soon falling onto the bed with a huff.");
	
	output("\n\n<i>“I didn’t like the look of [rival.himHer], or [rival.hisHer] goons, so I did some digging. And I found out who you used to be.”</i> she continues, patting the mattress next to her. You hop up into her arms without a second thought. <i>“The only way I can keep you safe, pet, is to stay one step ahead of them.”</i>");
	
	output("\n\nShe cradles you tightly in a possessive embrace as she lays out her plan. An adventure really, traveling around the rush frontier in search of a certain set of probes. Probes intended for <i>you</i>. Mistress will keep you safe, keep you loved... and keep you in your place... there’s just one thing you have to do first.");
	
	output("\n\nHer tablet reappears, pulled from one of the many pockets dotted around the taurs coat. On its display is a formal contract, passing the cost of many, many hundreds of thousands of credits worth of modifications off onto you officially along with a very... long term plan for the remuneration of said costs. And until those costs are repaid, you would be hers to do with as she pleases; everything you own, everything you are, everything you will be, hers until such time as the debt is repaid.");
	
	output("\n\nHer pet. On <i>her</i> ship. Chasing <i>her</i> legacy.");
	
	output("\n\nYou can’t accept the proposition soon enough, "+ pc.catDog("meowing", "barking") +" in delight at the opportunity that the last few months of hard work and training have obviously been leading up to. The contract is signed, or at least signed as best you can given your state, soon enough. With one final crushingly tight squeeze, Mistress puts you back down on the bed and then heads off back to <i>her</i> bridge.");
	
	output("\n\nYou follow after her, scuttling your");
	if (flags["JERYNN_RESPONSE_LIMBS"] != 0) output(" metal");
	else output(" restrained");
	output(" limbs across the deck plating. She’s darting back and forth between various control panels and displays, acquainting herself with the lay of the ship. You plant your ass on the cold floor beside her, doing your best to direct her to where specific controls are located whenever she utters something related to them under her breath. The ship is soon cleared for launch and heading back out into the inky blackness of the void, a firm pet along your back along with a firm reinforcement of <i>“Good pet,”</i> all the thanks you need.");
	
	output("\n\nSoft pets continue right up until the ship reaches a safe distance from the station and the autopilot engages. <i>“Long trip ahead of us, pet, and I know just the right way to pass the time,”</i> Mistress says.");
	
	output("\n\n<i>“Present,”</i> she orders.");
	
	output("\n\nYour ass is high in the air before she’s even finished the word, the wedged tip of her cock nudging its way into your pussy not long behind it.");
	
	output("\n\nA long trip indeed.");
	
	processTime((5 * 7 * 24 * 60) + rand(1440));
	pc.removeStatusEffect("Milk Paused");
	pc.removeStatusEffect("Cum Paused");
	
	badEnd("GAME OVER?");
}