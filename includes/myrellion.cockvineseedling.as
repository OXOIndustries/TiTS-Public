public function cockvineSeedlingHeader():void
{
	showName("COCK VINE\nSEEDLING");
	showBust("COCKVINESEEDLING");
	author("Nonesuch");
}

public const Seedling_Type_Vine:int = 0;
public const Seedling_Type_Human:int = 1;
public const Seedling_Type_Horse:int = 2;
public const Seedling_Type_Bulbous:int = 3;
public const Seedling_Type_Ribbed:int = 4;

public function cockvineSeedlingEncounter():void
{
	clearOutput();
	cockvineSeedlingHeader();

	output("In the gloom of the deep caverns you feel constantly on edge; the second you set your gaze anywhere your neck begins to crawl, expecting an attack to come from behind.");

	if (pc.RQ() <= 25 + rand(25)) output(" You almost jump out of your skin when something touches your [pc.legs], and you curse as you hear some small pest slithering swiftly away from you in the darkness. Caves are just the goddamn worst.");
	else
	{
		output(" You freeze as your eyes land on something on the ground ahead of you. An organic, tubular something, about two feet long.");

		if (CodexManager.entryViewed("Cockvine"))
		{
			output(" After a tense moment ascertaining it isn’t attached to anything, you recognize the cockvine to be a seedling.");
		}

		output("\n\nThe green, snake-like creature is quietly probing away with one of its ends, ringed in delicate tendrils, between the cracks of the cave wall. It tenses up suddenly, craning its other thick end towards you; though it lacks any obvious sensory organs it evidently knows you’re there, because it immediately slithers a retreat into the dark.");
	}

	processTime(5 + rand(3));

	//[Give Chase] [Ignore]
	clearMenu();
	addButton(0, "Chase", cockvineSeedlingChase);
	addButton(1, "Ignore", mainGameMenu);
}

public function cockvineSeedlingChase():void
{
	clearOutput();
	cockvineSeedlingHeader();

	if (pc.RQ() <= 40 + rand(35))
	{
		output("You charge after the");
		if (!CodexManager.entryViewed("Cockvine")) output(" snake-like creature");
		else output(" cockvine seedling");
		output(" down the narrow tunnel it escaped into, stumbling and scraping over the damp rock in your effort to catch up with it. For a few moments you see its tail urgently winding its way away from you, and you think maybe you can grab it – then you bang your [pc.foot] against a protrusion of rock, making you cry out in pain and forcing you to come to a halt. You glower after the");
		if (!CodexManager.entryViewed("Cockvine")) output(" snake");
		else output(" seedling");
		output(" and then turn back to the path, rubbing your sore spot and cursing.");

		// -5% HP
		pc.HP(0.05 * pc.HPMax());

		clearMenu()
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("You charge after the");
		if (!CodexManager.entryViewed("Cockvine")) output(" snake-like creature");
		else output(" cockvine seedling");
		output(" down the narrow tunnel it escaped into, nimbly darting over and around the damp rock in your effort to catch up with it. You lose sight of it in the gloom – and then emerge abruptly in a dead end. Nowhere left to run, the");
		if (!CodexManager.entryViewed("Cockvine")) output(" strange, green creature");
		else output(" seedling");
		output(" is curled up in a ball as far away from you as it can, shivering slightly.");

		if (!CodexManager.entryUnlocked("Cockvine"))
		{
			output("\n\n“<i>Cockvine,</i>” your codex pipes up. “<i>Extremely dangerous plant life-form, native to Myrellion. Its seedling form is relatively harmless, however it is capable of forming parasitic attachments to other life-forms if placed under duress.</i>”");
			
			CodexManager.unlockEntry("Cockvine");
		}
		else
		{
			output("\n\n");
		}
	}

	var sCockType:int = RandomInCollection(
			[Seedling_Type_Vine, Seedling_Type_Vine, Seedling_Type_Vine,
			Seedling_Type_Human, Seedling_Type_Human,
			Seedling_Type_Horse, Seedling_Type_Horse,
			Seedling_Type_Bulbous, Seedling_Type_Bulbous,
			Seedling_Type_Ribbed]);

	output("The seedling has its non-tendril end pointed towards you; you can see that it is shaped");
	if (sCockType == Seedling_Type_Vine) output(" like an obscene mix of plant and penis; thick, flexible and oily.");
	else if (sCockType == Seedling_Type_Human) output(" very much like a cut human cock, blunt bulbous tip and all.");
	else if (sCockType == Seedling_Type_Horse) output(" rather like a horse cock, a sheath of green epidermis folding back to reveal a long, purple shaft with a flat tip.");
	else if (sCockType == Seedling_Type_Bulbous) output(" bulbously, like a series of balls in a tight sock. The one furthest up the seedling is the biggest: knot-like.");
	else output(" almost like an oval: a thick bulge in the middle with distinct ridges running along the green belly, tipped by a conical, spear-like tip.");

	processTime(10 + rand(5));

	//[Kill It] [Join] [Leave]
	clearMenu();
	addButton(0, "Kill It", cockvineSeedlingKillIt);
	addButton(1, "Join", cockvineSeedlingJoin, sCockType, "Join", "Try and persuade the thing to become your tail.");
	addButton(2, "Leave", cockvineSeedlingLeave);
}

public function cockvineSeedlingKillIt():void
{
	clearOutput();
	cockvineSeedlingHeader();

	output("You squish the thing. One less rape monster plaguing these caves, you think to yourself with satisfaction as you make your way back to the main path.");

	pc.XP(10);
	processTime(3);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function cockvineSeedlingLeave():void
{
	clearOutput();
	cockvineSeedlingHeader();

	output("Unable to bring yourself to kill the completely defenseless creature you shrug and leave it be, retracing your steps back to the main path.");

	pc.XP(10);
	processTime(3);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function cockvineSeedlingJoin(sCockType:int):void
{
	clearOutput();
	cockvineSeedlingHeader();

	output("You tap your chin as you consider the thick, lithe end of the cowering plant creature musingly. Yes, there’s definitely... possibilities there. Juicy possibilities.");
	if (!pc.isNude()) output(" You smile as you undo your [pc.lowerGarments] and let them drop to the ground.");

	if (pc.isBro() || pc.isTreatedMale())
	{
		output("\n\n“<i>C’mon lil bro,</i>” you say, grinning winningly and giving it a double finger shoot. “<i>This planet is chick city and I need a wingman. Time to join up with a winner!</i>”");
	}
	else if (pc.isNice())
	{
		output("\n\n“<i>Relax little guy, I’m not going to hurt you,</i>” you say soothingly, moving slowly towards the curled up seedling. “<i>What do you say we become, y’know, friends? You won’t believe how well I’ll treat you...</i>”");
	}
	else if (pc.isMischievous())
	{
		output("\n\n“<i>You’re in luck, my slithery little friend,</i>” you say, grin widening as you move slowly towards the curled up seedling. “<i>Instead of getting stomped on, you get to be a part of [pc.name] Steele’s wild ride! C’mon, shake a tail and get up here.</i>”");
	}
	else
	{
		output("\n\n“<i>Here’s the deal,</i>” you say, smirk widening as you move slowly towards the curled up seedling. “<i>I don’t kill you. In return, you become my tail and do exactly what I say. Capiche?</i>”");
	}

	output("\n\nYou stand over the thing, carefully positioning yourself so it can’t escape and presenting your bare flesh as prominently as you can. At length the cockvine seedling raises its tendril end, nodding and groping at the air, tasting your scent. Hesitantly it touches your [pc.skin]; when you don’t flinch away");
	if (pc.isBiped() || pc.isTaur())
	{
		output(" it curls itself around a leg");
	}
	else if (pc.isNaga())
	{
		output(" your snake tail");
	}
	else
	{
		output(" it shifts itself onto your slime");
	}
	output(". You murmur encouragement and remain as still as you can, feeling the smooth plant undulate its way up your [pc.thigh] and then probing the base of your spine above your [pc.butt]");
	if (pc.tailCount > 0)
	{
		output(", in between your other tail");
		if (pc.tailCount > 1) output("s");
	}
	output("; your eyes open wide and you gasp as the seedling rears back and plants its tendril end into you with an audible smack. You feel its proto-roots penetrate your skin, burying inwards to touch the nerves to be found there. It’s not exactly painful but certainly uncomfortable, rather like getting operated on under local anesthetic. You gasp and almost laugh as you feel odd pangs and twitches at the base of your back, strange impulses shooting up your spine as the parasite merges with you, grafting into your nervous system and suppressing your immune system’s desire to attack it.");

	output("\n\nSlowly but surely you feel sensation spreading downwards into your new appendage. You twinge odd new muscle groups and to your delight the tail reacts; after you’ve flexed it a few times you find you are able to swing your cock-tail around, admire it and catch it, feel it as your own.");

	pc.clearTailFlags();
	pc.tailType = GLOBAL.TYPE_COCKVINE;
	pc.tailCount = 1;
	pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
	pc.addTailFlag(GLOBAL.FLAG_LONG);
	pc.tailGenital = GLOBAL.TAIL_GENITAL_COCK;

	if (sCockType == Seedling_Type_Vine)
	{
		pc.tailGenitalArg = GLOBAL.TYPE_COCKVINE;
		pc.tailGenitalColor = "green";
		output(" The parasite has retained its color; slimy and flexible, green with a proud purple head, it leaves no doubt as to its plant origin.");
	}
	else if (sCockType == Seedling_Type_Human)
	{
		pc.tailGenitalArg = GLOBAL.TYPE_HUMAN;
		pc.tailGenitalColor = "pink";
		
		output(" Your own skin pigment is swiftly spreading up it; it is a thick, [pc.tailCockColor] appendage with a familiarly human cock tip.");
	}
	else if (sCockType == Seedling_Type_Horse)
	{
		pc.tailGenitalArg = GLOBAL.TYPE_EQUINE;
		pc.addTailFlag(GLOBAL.FLAG_FLARED);
		pc.tailGenitalColor = RandomInCollection("pink", "black", "mottled-pink");
		
		output(" Your own skin pigment is swiftly spreading up it; it is a thick, sheathed [pc.tailCockColor] appendage with what is unmistakably a flat-tipped horse-cock protruding readily out of it.");
	}
	else if (sCockType == Seedling_Type_Bulbous)
	{
		pc.tailGenitalArg = GLOBAL.TYPE_CANINE;
		pc.addTailFlag(GLOBAL.FLAG_KNOTTED);
		pc.tailGenitalColor = "red";
		
		output(" Your own skin pigment is swiftly spreading up it; it is a thick, bulbous [pc.tailCockColor] appendage, arrestingly alien with its bean pod-like bulges, culminating in a big hole-filling swelling halfway up it. Bizarre it might look but you don’t doubt you could cause some lucky someone serious pleasure with this thing.");
	}
	else
	{
		pc.tailGenitalArg = GLOBAL.TYPE_COCKVINE;
		pc.addTailFlag(GLOBAL.FLAG_RIBBED);
		pc.tailGenitalColor = "green";
		
		output(" Your own skin pigment is swiftly spreading up it; it is a thick, ribbed, arching [pc.tailCockColor] appendage, a fat, stretching bulge near the end, reptile-like with its proud, blunt point.");
	}

	output("\n\nYou let it swing back, enjoying the pliable swing of it as it settles back over your [pc.butt]. It’s undoubtedly a part of you now, although... as you head back to the main path your blood quickens, little whispers and twinges of desire teasing at your subconscious, green shoots worming their way through the red of your desire; quiet, insistent impulses urging you to roam far and wide, plunging your new cock into as many wet holes as you possibly can. A small part of you wonders with unease how easy this thing will be to really control.");

	pc.libidoRaw += 5;
	pc.lust(5);

	//+5 Libido
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}