import classes.Characters.QueenOfTheDeep;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.TypeCollection;

public function tryEncounterQueenOfTheDeep():Boolean
{
	if (flags["QUEEN_OF_THE_DEEP_ENCOUNTERED"] == undefined && pc.findEmptyPregnancySlot(Creature.PREGSLOT_ANY) != -1)
	{
		queenOfTheDeepInitialEncounter();
		return true;
	}
	else
	{
		return DeepCavesBonus();
	}
}

public function queenOfTheDeepHeader():void
{
	author("Savin");
	showName("QUEEN OF\nTHE DEEP");
	showBust("QUEENOFTHEDEEP");
}

public function queenOfTheDeepInitialEncounter():void
{
	queenOfTheDeepHeader();

	flags["QUEEN_OF_THE_DEEP_ENCOUNTERED"] = 1;

	output("\n\nAs you wade through the deep, clear waters of the darkened cave, you begin to hear a faint clicking noise, echoing off of craggy walls. <i>Click. Click. Click</i>. You pause, holding yourself very still to try and isolate the source of the sound. The lake cave is deafening, however, refusing to yield its secrets. Your [pc.ears] strain, every nerve on edge as the clicking becomes louder, more insistent... closer. It resolves into a cacophony of sound, like many legs skittering across the wet stone. The longer it lasts, the more unnerved you become, looking all around you to try and find the impending threat.");
	
	output("\n\nA few droplets of water plunging past you to splash into the lake are your only hint to where the creature is.");
	
	output("\n\nYou look <i>up</i>, craning your neck to the cavern’s ceiling to see a huge multi-legged creature crawling across the black stone, a mass of faintly-glowing reds and greens between a forest of writhing tentacles. Eight monstrously long, slender four-jointed legs suspend the creature over you, clattering across the stone walls.");
	
	output("\n\nThe moment you look up, the creature makes a low hiss and detaches itself from the cavern, spinning end over end and dropping into the water between you and the cave behind you, trapping you between it and impenetrable rock to the west. You stumble back, movements slowed by the water; the creature advances, rising from the quaking lake to its full and massive height. The lake monster, propped up on its crab-like legs stands no less than fifteen feet tall, its red-armored body culminating in a second torso growing out of the first: the body of a woman, covered in glowing algae in shades of green and blue, clinging to her like clothing. Even then, the planty covering can’t conceal a body of cyan skin striped with white, bearing a pair of breasts swollen larger than their owner’s head and each capped with four large nipples glistening with amber moisture.");
	
	output("\n\nEven such an enticing bosom can’t keep your eyes away from the woman-monster’s elongated fangs for long, or the featureless, unfeeling black eyes shining beneath a head of blue-green tentacles growing like hair down her shoulders. She holds a glimmering crystalline longbow in one hand, not yet nocked. And then there’s the pair of gigantic, crushing claws protruding from the front of her bestial lower body, clacking together with deadly menace.");
	
	output("\n\n<i>“What’s this?”</i> a hissing voice murmurs, seeming to come from all around you, bouncing from wall to wall. <i>“A new face");
	if (pc.race().indexOf("myr") == -1) output(" - and a new form, as well");
	output("... You are not among the nyrea breeders that come to throw themselves at me, discontent with their mistresses. Nor a ganrael, whose crystal-clad gel I so love to see stuffed with squirming young. Ah, perhaps you are one of these ‘star-walkers’ I have heard tales of, invading the world of myr high above.”</i>");
	
	output("\n\nAs she speaks, the monstrous woman advances on you, carried on the stalk-like legs that spread out around her lower body, clattering across the walls and the watery bottom of the lake with equal ease. The dozens of bioluminescent tentacles growing from her carapaced back squirm behind her, wrapping around arms and legs, their tips drooling with what could only be some sort of stinger venom that drips freely into the water.");
	
	output("\n\nA predatory smile comes over her blue lips, and the womanly half of the creature reaches down to heft up one of her overburdened breasts, rolling out a lengthy tongue to tease the four teats at its tip. As if responding to the shock of pleasure, the algae-like garb covering much of her body pulses with glowing light.");
	
	output("\n\n<i>“Whatever you are, star-walker, be a good little pet and set aside your weapons. They will serve you little good here,”</i> she insists, taking a massive step closer, now all but standing over you. Desperately, you wade back through the water, cursing the way it slows you down. The creature tsks her tongue and rises up, planting her forelegs on either side of the wide cavern and looking down on you from on high. <i>“I asked you nicely, child. I would hate to damage such a fine incubator for my offspring");
	if (!pc.isCrotchGarbed() && pc.longestCockLength() > 12) output(". Especially one with such a fine tool to fertilize my next clutch, as well");
	output(",”</i> she coos, reaching one of her massive claws out to caress you.");
	
	output("\n\nEntirely on instinct, your body throws itself back in revulsion, trying desperately to avoid her wet, armored hooks.");
	
	output("\n\n<i>“I shan’t ask again, child. Submit to me, and I shall show you a world of pleasure you cannot yet imagine. Or perhaps some strain of misguided heroism plagues you, and you think to test your might against me? Come then, decide: will it be pleasure, or must we battle?”</i>");
	
	processTime(5);

	//[Surrender] [Fight]
	clearMenu();
	addButton(0, "Surrender", queenOfTheDeepInitialSurrender);
	addButton(1, "Fight", queenOfTheDeepGoFite, undefined, "You won’t give in without a fight!");
}

public function queenOfTheDeepGoFite():void
{
	clearOutput();
	queenOfTheDeepHeader();

	output("You bite back your fear and ready your [pc.weapon]. Above you, the creature snarls and pulls an arrow from the quiver on her hip, nearly as long as a spear’s shaft. <i>“So be it! It has been too long since my prey last dared resist me.... Let us see what you star-walkers are capable of!”</i>");

	//[Next] //To fitemenu
	clearMenu();
	addButton(0, "Next", queenOfTheDeepInitFight);
}

public function queenOfTheDeepInitFight():void
{
	pc.createStatusEffect("Watered Down", 0, 0, 0, 0, false, "Icon_Slow", "You’re submerged in water, and your movements are dramatically slowed because of it. While you’re fighting in the lake, your Reflex is reduced!", true, 0);

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new QueenOfTheDeep());
	CombatManager.victoryScene(queenOfTheDeepPCVictory);
	CombatManager.lossScene(queenOfTheDeepPCLoss);
	CombatManager.displayLocation("DEEPS QUEEN");
	CombatManager.beginCombat();
}

public function queenOfTheDeepPCLoss():void
{
	clearOutput();
	queenOfTheDeepHeader();

	var numEmptyHoles:int = 0;
	var numEmptyVaginas:int = 0;
	var bEmptyAss:Boolean = false;
	var bEmptyVagina:Boolean = false;

	// ass
	if (!pc.isPregnant(3))
	{
		bEmptyAss = true;
		numEmptyHoles++;
	}

	// cunts
	var vi:int = 0;
	var vList:Array = [];
	var vIdx:int = -1;
	if (pc.hasVagina())
	{
		for (vi = 0; vi < pc.vaginas.length; vi++)
		{
			if (!pc.isPregnant(vi))
			{
				numEmptyVaginas++;
				numEmptyHoles++;
				bEmptyVagina = true;
				vList.push(vi);
			}
		}
		if(vList.length > 0) vIdx = vList[rand(vList.length)];
	}
	
	var cIdx:int = -1;
	if (pc.hasCock()) cIdx = pc.biggestCockIndex();

	var bMultiTentacle:Boolean = (numEmptyHoles > 1);

	output("The creeping realization that you have no hope of victory against this mammoth creature begins to take root in your mind, and you start to retreat, stumbling back through the water.");

	output("\n\nSeeing your attempts to escape, the woman scoffs and plants her hands on her wide hips, glowering down at you with her black eyes and pouty blue lips. <i>“Pathetic. You cannot fight, and yet you are too stone-headed to submit. All I wanted was to give you pleasure, child... instead you have made me");
	if (pc.HP() <= 0) output(" hurt you so");
	else output(" force you to admit your basest urges, even when you yourself tried so hard to suppress them");
	output(". Whatever shall I do with you now?”</i>");

	if (pc.HP() <= 0) output("\n\nYou consider begging her to let you go");
	else output("\n\nYou consider begging her to fuck you, to relieve the tension she’s brought to such a catastrophic head");
	output(". Something tells you the monster already has her intentions for you, however, and as you feel your back crack against the furthest reaches of the cave wall, you realize that you have very little hope of swaying her.");

	output("\n\n<i>“Not strong enough to fight, nor wise enough to submit,”</i> the woman says in a sing-song voice, stalking closer until her tremendous claws are under your chin, the threat obvious. <i>“What a waste... I had thought you might be different, star-walker. Worthy of me.”</i>");

	output("\n\nThere’s no room left for you to retreat as the woman lowers herself down, almost face to face with you. Her tentacles reach out, silently grasping your [pc.weapon] and tossing it aside, following in short order by the rest of your [pc.gear]. While they work, the woman-half stares at you with arms crossed and eyes narrowed, the malice of the pose hampered by the way her arms are hefting up her tits, drawing your eyes to the two succulent orbs.");

	output("\n\n<i>“I see your gaze, star-walker,”</i> the woman says, not changing her stance. <i>“And I believe the thoughts of violence have been sufficiently stricken from your mind. You realize now who is superior... who your queen truly is. Do you not?”</i>");

	output("\n\nOne movement from those claws of hers could send your head flying from your body. Rather than risk the creature’s further wrath, you nod.");

	output("\n\nHer mien relaxes somewhat, and the claw slowly draws back from your throat. <i>“I am glad you could be made to see sense, star-walker. Now let me show you a better use for that body of yours... enough of your squirming. Come to me.”</i>");

	output("\n\nShe extends her arms to you, planting them on your shoulders. The invitation is clear, and you find yourself stepping forward into the woman’s embrace, letting her guide you until your face is on level with her heavy, full teats. <i>“I need you stronger, if you are to bear my young,”</i> she says simply, urging you on. <i>“Come. Drink of me, take that strength from my body... and pass it on to those who will soon inhabit yours.”</i>");

	output("\n\nAs the realization that this creature intends to turn you into nothing more than an incubator for her eggs settles in, her powerful grip forces you onto one of her breasts. As");
	if (pc.HP() <= 0) output(" battered");
	else output(" lusty");
	output(" as you are, you’re powerless to resist her directive, and start to suckle from the four stiff nipples on offer. As you surrender into her embrace, her tentacles wrap around you, coiling across your back and slowly worming their way towards your ass.");

	output("\n\nYou feel the heat of venom on you almost instantly, rousing your senses.");
	
	pc.changeLust(100);
	
	if (pc.hasCock())
	{
		output(" Your [pc.cocks] grow");
		if (pc.cocks.length == 1) output("s");
		output(" rigid, pressing into the queen’s belly. She coos delightedly and reaches down to stroke");
		if (pc.cocks.length == 1) output(" it");
		else output(" one of them");
		output(", sending shivers of pleasure through you as her blued fingers wrap around your length.");
	}
	if (pc.hasVagina())
	{
		output(" Trickles of moisture stain your thighs as the venomous arousal snakes its way down to your sex, and the lips of your [pc.cunts] attract more and more attention from the queen’s tendrils. She gives you a playful smile as one almost penetrates you, instead squirting a thick covering of pink poison across your pussy. Your [pc.legOrLegs] just about give");
		if(pc.legCount == 1) output("s");
		output(" out, though the creature holds you fast, refusing to let you fall.");
	}
	output(" A tentacle quickly finds its way to your [pc.asshole], pressing against the");
	if (pc.ass.looseness() <= 1) output(" tight");
	else if (pc.ass.looseness() <= 3) output(" inviting");
	else if (pc.ass.looseness() <= 4) output(" loose");
	else output(" agape");
	output(" ring of it and kissing your hole with venom-soaked lips. You tremble and moan as more and more of the chemical seeps into your body, lighting your nerves aflame with pleasure.");

	output("\n\n<i>“Oh, don’t hold those sweet sounds back, my dear,”</i> the queen insists, running a hand across your [pc.hair]. <i>“You’re in my domain. There’s no one here to see you... to interrupt our union. No one but my servants, who know this pleasure as you do.”</i>");

	output("\n\nYou would moan for her - your body gives you little choice as her dozens of tentacles mercilessly tease you - were it not for the huge, wet breast pressed against your face. You barely need to do anything to coax out a flow of amber nectar, alien milk that floods your mouth with a taste that brings back memories of oranges, wonderfully sweet... and just a little bitter.");

	output("\n\n<i>“Good,”</i> your captor moans, arching her back into your suckling embrace. <i>“Drink deep, my child. Take nourishment from me, pass it on to my young when they’re planted within you, growing and feeding...”</i>");

	output("\n\nYou gulp down mouthfuls of her seemingly endless bounty, draining her mammoth tits with slowly eroding volition. You feel your body being ravaged by her tendrils - they never penetrate you, never go further than teasing and caressing, just spreading more and more of her wonderful chemical arousal across you until it takes a force of will to remain standing. You’re not even sure you could do that, were it not for her tight embrace and the intoxicating taste of her amber milk.");
	
	pc.milkInMouth(queenOfTheDeep);
	pc.milkInMouth(queenOfTheDeep);
	pc.milkInMouth(queenOfTheDeep);

	if (pc.isTaur() || pc.isDrider())
	{
		output("\n\nEventually, your beautiful queen gently guides you off of her teat, urging you to turn around and face away from her. <i>“What a magnificent body you have,”</i> she says, running a hand along your bestial flank. You moan and settle onto your legs, barely keeping yourself above water as the alien temptress prepares you for the inevitable. <i>“You will drink again soon,”</i> she assures you. <i>“You had such a thirst before. I will keep you strong now, for my childrens’ sake.”</i>");
	}
	else
	{
		output("\n\nAfter a blissful eternity of suckling, your enchanting queen gently guides you off of her breast and hefts you up, cradling you in arms that seem as strong and sure as a titan’s. <i>“There, there,”</i> she coos when you groan unhappily, mind reeling at being deprived of your meal. <i>“I will feed you again soon. Many times... again and again, through birth after birth. I must keep you strong...”</i>");
	}

	output("\n\n<i>“Now it is time for you to truly submit to your queen,”</i> your captor-queen says, running a hand along your [pc.butt] and gently sliding a finger into your well-lubed behind. <i>“I am all that remains... I require you to ensure my lineage continues, that I am not the last as my mother prophesied. Surrender your misused body to me, let me give you new purpose...”</i>");

	output("\n\nYou knew what was coming. This moment was inevitable from the moment your queen revealed herself to you. Still, you cannot help but whimper as the two largest of her tentacles find their way to your [pc.legOrLegs], gently circling and caressing your [pc.asshole]");
	if (bEmptyVagina) output(" and [pc.vagina " + vIdx + "]");
	output(".");

	var needNL:Boolean = true;
	if (pc.isBiped())
	{
		if (needNL) output("\n\n");
		needNL = false;
		output("<i>“Your body is so small, so frail,”</i> the queen laments as her tendrils press against your hole");
		if (bMultiTentacle) output("s");
		output(". <i>“I hope I do not cause you pain.”</i> ");
	}
	if (numEmptyVaginas > 1)
	{
		if (needNL) output("\n\n");
		output("Other, smaller tendrils coils around you, finding your other hole");
		if(numEmptyVaginas > 2) output("s");
		output(" and starting to tease ");
		if(numEmptyVaginas == 2) output("it");
		else output("them");
		output(", finding every empty baby-maker you have and preparing to fill them with alien offspring.");
	}

	output("\n\nA moment of silent anticipation consumes you, a momentary eternity of perfect stillness and contentment, before you feel the queen’s");
	if (bMultiTentacle) output(" tentacles start their inescapable advance");
	else output(" tentacle start");
	output(" to spread apart your asscheeks and squirm into your body. You scream in pleasure, utterly surrendering to sensation as your insides are fucked, filled, and bred by your queen.");

	output("\n\n<i>“Yes, that’s good,”</i> the queen moans, all but screaming herself as she reciprocates your ecstasy. <i>“Tell the world of your submission, let all Myrellion hear that a new brood will soon be born. Yes!”</i>");

	output("\n\nThe tentacle");
	if (bMultiTentacle) output("s");
	output(" inside you waste");
	if (!bMultiTentacle) output("s");
	output(" no time in fulfilling the queen’s desire. You feel");
	if (bMultiTentacle) output(" them");
	else output(" it");
	output(" engorging, swelling with the alien’s offspring as they travel from her body to yours. A look over your shoulders shows the largest of the tentacles bloating, its translucent flesh strained by a small, white package that ejects from the queen’s armored back and starts its slow descent towards you. The creature inside, the queen’s first spawn, looks almost like a glistening white jellyfish filled with a cavalcade of swirling pinks and reds, slowly forming the unborn creature’s vitals. There’s only the vaguest hint of a humanoid half, the tiniest silhouette of a torso. It’s so small... so fragile.");

	output("\n\nYou watch its descent eagerly, eyes wide as the tentacle it rides in thrusts deep within you, squirting what feels like thick, viscous liquid into the depths of your bowels. You feel the hit of the queen’s venom immediately, burning away at every last trace of resistance until you’re nothing more than putty in her hands, eagerly relaxing your body for her delicate young.");
	if (numEmptyVaginas > 1) output(" Other tendrils soon follow, swelling with young and opening your body wide. They spear open your cervixes and discharge gallons of thick, sticky venom into your vacant wombs, creating a chemical nest for the unborn aliens to inhabit.");
	else if (bEmptyVagina && bEmptyAss) output(" The tendril fucking your [pc.cunt " + vIdx + "] follows the other’s example, swelling thicker and forcing your body to open wide for its precious payload. It gently, almost tenderly coaxes open your cervix and ejaculates a rush of thick, sticky venom into your vacant womb, creating a chemical nest for the unborn alien to inhabit.");
	
	if (!pc.isPregnant(3))
	{
		pc.loadInAss(queenOfTheDeep);
		(pc as Creature).buttChange(queenOfTheDeep.biggestCockVolume(), false, false, false);
		if (pc.ass.wetnessRaw < 5) pc.ass.wetnessRaw += 1;
		imbibeVenomEffects();
	}

	for (vi = 0; vi < pc.vaginas.length; vi++)
	{
		if (!pc.isPregnant(vi))
		{
			pc.loadInCunt(queenOfTheDeep, vi);
			(pc as Creature).cuntChange(vi, queenOfTheDeep.biggestCockVolume(), false, false, false);
			if (pc.vaginas[vi].wetnessRaw < 5) pc.vaginas[vi].wetnessRaw += 1;
			imbibeVenomEffects();
		}
	}
	imbibeVenomEffects();
	pc.libido(10);

	output("\n\nAnother scream of unparalleled pleasure rips itself from your throat as the first of the queen’s young penetrates your now-gaping ass, stretching you unbearably wide around even its seemingly tiny frame before it rushes into your deepest depths, squirted out into the sticky wad of chemicals left for it by the thrashing tentacle ravaging your bowels. A second spawn quickly follows the first, bloating your belly with the growing occupation of the queen’s alien brood.");
	if (bEmptyAss && !bEmptyVagina) output(" Your ass is soon stuffed full of the queen’s many offspring");
	else if (numEmptyHoles > 1 && (numEmptyHoles != pc.vaginas.length + 1)) output(" Every hole not full of other offspring is soon playing home to the queen’s");
	else output(" Your every hole is soon stuffed with the queen’s offspring");
	output(", a squirming and writhing mass of tiny creatures that move in ways that make you feel ill, even as their mother’s tentacles continue to hold your hole");
	if (bMultiTentacle) output("s");
	output(" open, squirting in more and more of her venomous cocktail and thrusting into you, making sure your body is too overwhelmed by pleasure to reject her children.");

	if (cIdx >= 0)
	{
		output("\n\n<i>“Poor thing,”</i> the queen moans as your [pc.cock " + cIdx + "] throbs and drools its excitement into the water to the beat of her tentacles’ ceaseless violation of your body. <i>“Let me give you some relief...”</i>");

		output("\n\nYou feel a cold hand wrap around your [pc.cock " + cIdx + "], gently stroking from base to tip in a slow, languid motion. It’s only a moment later that you realize the queen’s hand is covered in her venom, using it like lube to stroke you. Moaning, you wiggle your [pc.hips] and press yourself against your loving, caring captor, your body all but begging her for more.");

		output("\n\nShe eagerly provides it, shifting her body until her weighty breasts are positioned on either side of your [pc.cock " + cIdx + "] and enveloping it between them. You’re suddenly aware of how satin-soft they are; how the milk-swollen orbs compress around your shaft, deforming to make the most perfect pair of cockpillows imaginable. Your orgasm is as inevitable as");
		if (silly) output(" death and taxes");
		else output(" every other aspect of your queen’s menagerie of pleasures");
		output(". With a howl of pure bliss, you unleash a torrent of spunk between the queen’s breasts, splattering her body with your [pc.cumNoun]. She just coos and continues to rub her mounds around your shaft, milking you dry of every drop.");
		
		pc.orgasm();
	}

	output("\n\nPleasure hammers through you in shockwaves, a new quake born every time the queen’s sinuous");
	if (bMultiTentacle) output(" tendrils move");
	else output(" tendril moves");
	output(" inside you, assailing your venom-burned body with mind-breaking sensation. She wrings orgasms from you as easily as she does your moans and cries, keeping you suspended in wave after wave of pleasure until your body is crammed as full of her spawn as it can possibly be, your belly bloated with writhing masses of the translucent jellyfish you saw before.");
	
	var i:int = 0;
	for(i = 0; i < 5; i++)
	{
		pc.orgasm();
	}

	output("\n\nOnly then does she release you, slowly drawing her tendril");
	if (bMultiTentacle) output("s");
	output(" out of you. When the tapered tip");
	if (bMultiTentacle) output("s");
	output(" finally pop wetly out of you, you all but collapse - only to be caught by the queen before you can flop bonelessly into the water.");

	output("\n\n<i>“Do you see now?”</i> the queen murmurs into your ear, gently stroking you with hands and still-wet tendrils. <i>“You are so much better suited to bearing young than to battle.”</i>");

	output("\n\nHer hand finds its way to your belly, caressing the bulging swell she created with such tenderness that you have trouble believing she truly is the towering alien before you - that the woman’s lower body isn’t a mere ruse, hiding a delicate and loving soul within.");

	output("\n\nReturning her attention to you, the cyan-skinned queen plants a kiss on your brow and says <i>“Stay with me. Let me nurse you, care for you, help you grow stronger... help you become the perfect incubator for a new generation of my people...”</i>");

	output("\n\nNestled in her arms as you are, head resting against her soft breasts so that you can feel the beat of her monstrous heart inside her... you know she has your best interests at heart. An overwhelming desire takes you, assures you that you must obey your queen of pleasure. That you must safeguard the brood of young now growing inside you.");

	output("\n\nAnd you must grow stronger to better carry the next one.");
	
	output("\n\nBut for now, exhaustion takes you.");

	processTime(60 * 4);
	for (i = 0; i < numEmptyHoles * 3; i++) pc.orgasm();
	
	badEnd();
}

public function queenOfTheDeepSurrenderCombat():void
{
	clearOutput();
	queenOfTheDeepHeader();

	output("<i>“Alright, alright! I surrender!”</i> you say, setting your [pc.weapon] down on the rocks nearby.");
	
	output("\n\nA huge smile spreads across the creature’s cyan lips, and she lowers herself down almost to your level, submerging much of her titanic body in the shifting waters. <i>“I knew you would come around,”</i> she purrs, lowering her bow and running a hand across her bare breasts. <i>“Rest easy, child; I can forgive your momentary insolence. What’s important is that you came around in the end...”</i>");

	queenOfTheDeepSurrenderII(true);
}

public function queenOfTheDeepInitialSurrender():void
{
	clearOutput();
	queenOfTheDeepHeader();

	output("<i>“Alright, alright,”</i> you say, gently setting your [pc.weapon] down on the rocks nearby. <i>“Let’s go with pleasure.”</i>");
	
	output("\n\nThe creature smiles, her writhing forest of tentacles coiling seductively around her humanoid half, drooling venom over her cyan skin as they cup her breasts and tease at the plump curves of ass resting on the lower body’s carapace. <i>“I’m so very glad you chose sense, my dear,”</i> she coos, running her long tongue along the underside of the largest of her tendrils, a fat squirming mass of translucent flesh that squirts pink pre from its tapered lips.");

	queenOfTheDeepSurrenderII(false);
}

public function queenOfTheDeepSurrenderII(fromCombat:Boolean):void
{
	var numEmptyHoles:int = 0;
	var numEmptyVaginas:int = 0;
	var bEmptyAss:Boolean = false;
	var bEmptyVagina:Boolean = false;

	// ass
	if (!pc.isPregnant(3))
	{
		bEmptyAss = true;
		numEmptyHoles++;
	}

	// cunts
	if (pc.hasVagina())
	{
		for (var vi:int = 0; vi < pc.vaginas.length; vi++)
		{
			if (!pc.isPregnant(vi))
			{
				numEmptyVaginas++;
				numEmptyHoles++;
				bEmptyVagina = true;
			}
		}
	}

	var bMultiTentacle:Boolean = (numEmptyHoles > 1);

	output("\n\nHer long, spindly legs draw her closer to you, lowering her down as she approaches until her bestial body is half-submerged in the water, and her humanoid half looms close to you, arms outstretched. <i>“Come to me, then,”</i> she purrs. <i>“Let me show you the true meaning of pleasure.”</i>");

	if (pc.isBimbo()) output("\n\nYou can’t wait to feel all those tentacles squirming around inside you!");
	else output("\n\nYou shudder at the thought of what the creature is going to do with all those tentacles...");

	output("\n\nYou take a");
	if (pc.isBimbo()) output("n eager");
	else output(" wary");
	output(" step forward, and the woman’s hands close around your shoulders, pulling you the rest of the way until you’re nestled against her ample chest, feeling her heavy breasts compress against your [pc.chest]. Tentacles squirm around you, reaching around the woman’s body to grope at your exposed [pc.skinFurScales] and tug at your");
	if (pc.isNude()) output(" gear");
	else output(" [pc.armor]");
	output(", divesting you of your equipment with surprising dexterity.");
	
	output("\n\nAs her tendrils work, the woman’s hand caresses your cheek, tracing the curves of your skin down your neck and arm before wrapping around your hand and gently guiding it towards the mountainous swell of one of her breasts, planting your palm against the four stiff nubs of her teats. <i>“See?”</i> she says, voice growing husky as you take the hint and grope her, <i>“I can be a gentle mistress... a loving queen...”</i>");
	
	output("\n\nA queen, is she? The woman certainly acts the part: a queen of the deep lake.");

	output("\n\nYou open your mouth to speak, to answer her claims, but instantly your lips are locked with hers, tongues entangling as the queen grows more aggressive. Her tendrils assail your bare body, working hard to slather you with their pink discharge. You feel the heat of venom on you almost instantly, rousing your senses.");
	if (pc.hasCock())
	{
		output(" Your [pc.cocks] grow");
		if (pc.cocks.length == 1) output("s");
		output(" rigid, pressing into the queen’s belly. She coos delightedly and reaches down to stroke");
		if (pc.cocks.length == 1) output(" it");
		else output(" one of them");
		output(", sending shivers of pleasure through you as her blued fingers wrap around your length.");
	}
	if (pc.hasVagina())
	{
		output(" Trickles of moisture stain your thighs as the venomous arousal snakes its way down to your sex, and the lips of your twat attract more and more attention from the queen’s tendrils. She gives you a playful smile as one almost penetrates you, instead squirting a thick covering of pink poison across your pussy. Your [pc.legOrLegs] just about give");
		if(pc.legCount == 1) output("s");
		output(" out, though the creature holds you fast, refusing to let you fall.");
	}
	output(" A tentacle quickly finds its way to your asshole, pressing against the");
	if (pc.ass.looseness() <= 1) output(" tight");
	else if (pc.ass.looseness() <= 3) output(" inviting");
	else if (pc.ass.looseness() <= 4) output(" loose");
	else output(" agape");
	output(" ring of it and kissing your hole with venom-soaked lips. You tremble and moan as more and more of the chemical seeps into your body, lighting your nerves aflame with pleasure.");

	output("\n\n<i>“Oh, don’t hold those sweet sounds back, my dear,”</i> the queen insists, running a hand across your [pc.hair]. <i>“You’re in my domain. There’s no one here to see you... to interrupt our union. No one but my servants, who know this pleasure as you do.”</i>");

	if (pc.isBimbo() || pc.isTreated() || pc.exhibitionism() >= 75)
	{
		output("\n\nYou haven’t seen these servants of hers, but the idea of being watched while you’re thoroughly fucked in every hole makes your heart hammer eagerly in your chest.");
	}
	else
	{
		output("\n\nServants? You shudder to think there’s more creatures like her lurking about...");
	}

	output("\n\nYou would moan for her - your body gives you little choice as her dozens of tentacles mercilessly tease you - were it not for the huge, wet breast all but pressed against your face. You find the queen’s hand guiding you down to it, angling your head to the four stiff buds at its peak. Your mouth opens on instinct like a nursing babe’s, and your [pc.lips] seal around the queen’s royal tit, sucking gently. You barely need to do anything to coax out a flow of amber nectar, alien milk that floods your mouth with a taste that brings back memories of oranges, wonderfully sweet... and just a little bitter.");

	output("\n\n<i>“Good,”</i> your captor moans, arching her back into your suckling embrace. <i>“Drink deep, my child. Take nourishment from me, pass it on to my young when they’re planted within you, growing and feeding...”</i>");

	output("\n\nYou gulp down mouthfuls of her seemingly endless bounty, draining her mammoth tits with slowly eroding volition. You feel your body being ravaged by her tendrils - they never penetrate you, never go further than teasing and caressing, just spreading more and more of her wonderful chemical arousal across you until it takes a force of will to remain standing. You’re not even sure you could do that, were it not for her tight embrace and the intoxicating taste of her amber milk.");

	if (pc.isTaur() || pc.isDrider())
	{
		output("\n\nEventually, your beautiful queen gently guides you off of her teat, urging you to turn around and face away from her. <i>“What a magnificent body you have,”</i> she says, running a hand along your bestial flank. You moan and settle onto your legs, barely keeping yourself above water as the alien temptress prepares you for the inevitable. <i>“So large and strong... you will be able to house many of my young. A perfect breeder....”</i>");
	}
	else
	{
		output("\n\nAfter a blissful eternity of suckling, your enchanting queen gently guides you off of her breast and hefts you up, cradling you in arms that seem as strong and sure as a titan’s. <i>“There, there,”</i> she coos when you groan unhappily, mind reeling at being deprived of your meal. <i>“I will feed you again soon. Many times... as often as you want, my lovely breeder.”</i>");
	}
	
	clearMenu();
	addButton(0, "Next", queenOfTheDeepSurrenderIISplit, fromCombat);
}


public function queenOfTheDeepSurrenderIISplit(fromCombat:Boolean):void
{
	clearOutput();
	queenOfTheDeepHeader();
	
	var numEmptyHoles:int = 0;
	var numEmptyVaginas:int = 0;
	var bEmptyAss:Boolean = false;
	var bEmptyVagina:Boolean = false;

	// ass
	if (!pc.isPregnant(3))
	{
		bEmptyAss = true;
		numEmptyHoles++;
	}

	// cunts
	var vi:int = 0;
	var vList:Array = [];
	var vIdx:int = -1;
	if (pc.hasVagina())
	{
		for (vi = 0; vi < pc.vaginas.length; vi++)
		{
			if (!pc.isPregnant(vi))
			{
				numEmptyVaginas++;
				numEmptyHoles++;
				bEmptyVagina = true;
				vList.push(vi);
			}
		}
		if(vList.length > 0) vIdx = vList[rand(vList.length)];
	}
	
	var cIdx:int = -1;
	if (pc.hasCock()) cIdx = pc.biggestCockIndex();

	var bMultiTentacle:Boolean = (numEmptyHoles > 1);
	
	output("<i>“Now it is time for you to truly submit to your queen,”</i> your captor-queen says, running a hand along your [pc.butt] and gently sliding a finger into your well-lubed behind. <i>“I am all that remains... I require you to ensure my lineage continues. That I am not the last as my mother prophesied. Surrender your body to me, bear my young back among your people. Become the herald of a new age for my kind.”</i>");

	output("\n\nYou knew what was coming. This moment was inevitable from the moment your queen revealed herself to you. Still, you can’t help but whimper as the two largest of her tentacles find their way between your [pc.legOrLegs], gently circling and caressing your [pc.asshole]");
	if (bEmptyVagina) output(" and [pc.vagina " + vIdx + "]");
	output(".");

	if (pc.isBiped())
	{
		output("\n\n<i>“Your body is so small, so frail,”</i> the queen laments as her tendrils press against your hole");
		if (bMultiTentacle) output("s");
		output(". <i>“I hope I do not cause you pain.”</i> ");
	}
	else
	{
		output("\n\n");
	}

	if (bMultiTentacle)
	{
		output("Other, smaller tendrils coil around you, finding your other hole");
		if (numEmptyVaginas > 1) output("s");
		output(" and starting to tease them, searching out every empty baby-maker you have and preparing to fill them with alien offspring.");
	}

	output("\n\nA moment of silent anticipation consumes you, a momentary eternity of perfect stillness and contentment, before you feel the queen’s");
	if (bMultiTentacle) output(" tentacles start their inescapable advance");
	else output(" tentacle start");
	output(" to spread apart your asscheeks and squirm into your body. You scream in pleasure, utterly surrendering to sensation as your insides are fucked, filled, and bred by your queen.");

	output("\n\n<i>“Yes, that’s good,”</i> the queen moans, all but screaming herself as she reciprocates your ecstasy. <i>“Tell the world of your submission, let all Myrellion hear that you herald in a new age, a new brood for your queen! Yes!”</i>");

	if (!pc.isPregnant(3))
	{
		pc.loadInAss(queenOfTheDeep);
		(pc as Creature).buttChange((queenOfTheDeep as Creature).biggestCockVolume(), false, false, false);
		imbibeVenomEffects();
	}

	for (vi = 0; vi < pc.vaginas.length; vi++)
	{
		if (!pc.isPregnant(vi))
		{
			pc.loadInCunt(queenOfTheDeep, vi);
			(pc as Creature).cuntChange(vi, queenOfTheDeep.biggestCockVolume(), false, false, false);
			imbibeVenomEffects();
		}
	}
	imbibeVenomEffects();
	output("\n\nThe tentacle");
	if (bMultiTentacle) output("s");
	output(" inside you waste");
	if (!bMultiTentacle) output("s");
	output(" no time in fulfilling the queen’s desire. You feel");
	if (bMultiTentacle) output(" them");
	else output(" it");
	output(" engorging, swelling with the alien’s offspring as they travel from her body to yours. A look over your shoulder shows the largest of the tentacles bloating, its translucent flesh strained by a small, white package that ejects from the queen’s armored back and starts its slow descent towards you. The creature inside, the queen’s first spawn, looks almost like a glistening white jellyfish filled with a cavalcade of swirling pinks and reds, slowly forming the unborn creature’s vitals. There’s only the vaguest hint of a humanoid half, the tiniest silhouette of a torso. It’s so small... so fragile.");

	output("\n\nYou watch its descent eagerly, eyes wide as the tentacle it rides in thrusts deep within you, squirting what feels like thick, viscous liquid into the depths of your bowels. You feel the hit of the queen’s venom immediately, burning away at every last trace of resistance until you’re nothing more than putty in her hands, eagerly relaxing your body for her delicate young.");
	if (numEmptyVaginas > 1) output(" Other tendrils soon follow, swelling with young and opening your body wide. They spear open your cervixes and discharge gallons of thick, sticky venom into your vacant wombs, creating a chemical nest for the unborn aliens to inhabit.");
	else if (bEmptyVagina && bEmptyAss) output(" The tendril fucking your [pc.cunt " + vIdx + "] follows the other’s example, swelling thicker and forcing your body to open wide for its precious payload. It gently, almost tenderly coaxes open your cervix and ejaculates a rush of thick, sticky venom into your vacant womb, creating a chemical nest for the unborn alien to inhabit.");

	output("\n\nAnother scream of unparalleled pleasure rips itself from your throat as the first of the queen’s young penetrates your now-gaping ass, stretching you unbearably wide around even its seemingly tiny frame before it rushes into your deepest depths, squirted out into the sticky wad of chemicals left for it by the thrashing tentacle ravaging your bowels. A second spawn quickly follows the first, bloating your belly with the growing occupation of the queen’s alien brood.");
	if (bEmptyAss && !bEmptyVagina) output(" Your ass is soon stuffed full of the queen’s many offspring");
	else if (numEmptyHoles > 1 && (numEmptyHoles != pc.vaginas.length + 1)) output(" Every hole not full of other offspring is soon playing home to the queen’s");
	else output(" Your every hole is soon stuffed with the queen’s offspring");
	output(", a squirming and writhing mass of tiny creatures that move in ways that make you feel ill, even as their mother’s tentacles continue to hold your hole");
	if (bMultiTentacle) output("s");
	output(" open, squirting in more and more of her venomous cocktail and thrusting into you, making sure your body is too overwhelmed by pleasure to reject her children.");

	if (cIdx >= 0)
	{
		output("\n\n<i>“Poor thing,”</i> the queen moans as your [pc.cock " + cIdx + "] throbs and drools its excitement into the water to the beat of her tentacles’ ceaseless violation of your body. <i>“Let me give you some relief...”</i>");

		output("\n\nYou feel a cold hand wrap around your [pc.cock " + cIdx + "], gently stroking from base to tip in a slow, languid motion. It’s only a moment later that you realize the queen’s hand is covered in her venom, using it like lube to stroke you. Moaning, you wiggle your [pc.hips] and press yourself against your loving, caring captor, your body all but begging her for more.");

		output("\n\nShe eagerly provides it, shifting her body until her weighty breasts are positioned on either side of your [pc.cock " + cIdx + "] and enveloping it between them. You’re suddenly aware of how satin-soft they are; how the milk-swollen orbs compress around your shaft, deforming to make the most perfect pair of cockpillows imaginable. Your orgasm is as inevitable as");
		if (silly) output(" death and taxes");
		else output(" every other aspect of your queen’s menagerie of pleasures");
		output(". With a howl of pure bliss, you unleash a torrent of spunk between the queen’s breasts, splattering her body with your [pc.cumNoun]. She just coos and continues to rub her mounds around your shaft, milking you dry of every drop.");
	}

	output("\n\nPleasure hammers through you in shockwaves, a new quake born every time the queen’s sinuous");
	if (bMultiTentacle) output(" tendrils move");
	else output(" tendril moves");
	output(" inside you, assailing your venom-burned body with mind-breaking sensation. She wrings orgasms from you as easily as she does your moans and cries, keeping you suspended in wave after wave of pleasure until your body is crammed as full of her spawn as it can possibly be, your belly bloated with writhing masses of the translucent jellyfish you saw before.");
	
	var i:int = 0;
	for(i = 0; i < 5; i++)
	{
		pc.orgasm();
	}

	output("\n\nOnly then does she release you, slowly drawing her tendril");
	if (bMultiTentacle) output("s");
	output(" out of you. When the tapered tip");
	if (bMultiTentacle) output("s");
	output(" finally pop");
	if (!bMultiTentacle) output("s");
	output(" wetly out of you, you all but collapse - only to be caught by the queen before you can flop bonelessly into the water.");

	output("\n\n<i>“So much better than fighting me, was it not?”</i> the queen murmurs into your ear, gently stroking you with hands and still-wet tendrils. Her hand finds its way to your belly, caressing the bulging swell she created with such tenderness that you have trouble believing she truly is the towering alien before you - that the woman’s lower body isn’t a mere ruse, hiding a delicate and loving soul within.");

	output("\n\nReturning her attention to you, the cyan-skinned queen plants a kiss on your brow and says <i>“I have tried and failed so many times before... but you are different. I feel it. You will herald a rebirth of my race... of </i>our<i> race. Let my young grow inside you, learn from you, drink of your body and its uniqueness... and let them change to be stronger for it.”</i>");

	output("\n\nThe queen’s meaning escapes you, but nestled in her arms as you are, head resting against her soft breasts so that you can feel the beat of her monstrous heart inside her... you know you don’t need to understand.");

	output("\n\nExhaustion takes you.");

	//[Next]
	clearMenu();
	addButton(0, "Next", queenOfTheDeepSurrenderIII, fromCombat);
}

public function queenOfTheDeepSurrenderIII(fromCombat:Boolean):void
{
	clearOutput();
	queenOfTheDeepHeader();

	output("You awaken on the lakeshore, groggily opening your eyes. For a moment, you wonder if your encounter with the queen of the deep lake was a dream, a delusion born of darkness and isolation. That dream (or was it a nightmare?) ends when you feel something churning inside you, and your hand is drawn instinctively to your [pc.belly]. You’re gravid, and your [pc.skinFurScales] bulges with new life... the queen’s offspring squirm just under the surface, slight bulges in your flesh you can both see and feel as they adjust themselves inside you.");

	output("\n\nGroaning, you stagger to your [pc.feet], hand still protectively on your spawn-swollen belly. You find your equipment a short distance away, dry and neatly packed away for you. You smile to yourself as you kit up, wondering if you’ll ever see your queen again...");

	processTime(60 * 4);

	if (fromCombat)
	{
		output("\n\n");
		CombatManager.genericLoss();
	}
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
}

public function queenOfTheDeepClimb():void
{
	clearOutput();
	output("You’re at a hell of a disadvantage down here, facing the beast of a woman head on. But on her back, the woman-half can’t see and the legs can’t stab you... you’d definitely stand a better chance back there! Though those tentacles are going to be a problem, they’re certainly the lesser of two evils.");

	if (pc.reflexes() >= 20 + rand(15))
	{
		output("\n\nYou leap forward, running straight at the creature, hoping to take her by surprise. She shrieks and jabs one of her huge legs at you, slamming it into the water just inches from you. You bob and weave, evading her strikes until you’re just under her carapaced lower body. Gritting your teeth, you grab hold of one of her legs’ spikey outcroppings and start to haul yourself up, scrambling out of the water and up onto the creature’s back.");
		
		output("\n\n<i>“UNHAND ME!”</i> she bellows, thrashing about in an attempt to dislodge you. You scream and dig your fingers into her plated back, finding handholds to grab onto as she tries to shake you off!");
		
		pc.removeStatusEffect("Watered Down");
	}
	else
	{
		output("\n\nYou leap forward, running straight at the creature, hoping to take her by surprise. She shrieks and swings one of her oversized claws at you, slamming it into your chest and sending you flying back into the water. <i>“Clever, creature,”</i> she hisses, stomping forward. <i>“Very clever... but futile.”</i>");
	}
	CombatManager.processCombat();
}

public function queenOfTheDeepPCVictory():void
{
	clearOutput();
	queenOfTheDeepHeader();

	if (enemy.HP() <= 0)
	{
		output("With a shriek of agony, the titanic creature collapses, legs giving out under the strain of your attacks and dumping her into the dark water before you. <i>“Enough! Enough!”</i> she groans, <i>“I yield, star-walker. You are... much stronger than I imagined. Much stronger than any creature to enter my domain in many years...”</i>");
	}
	else
	{
		output("The creature’s legs give out beneath her, dropping her into the water before you with a husky grunt from its woman-half. She stumbles a bit, clutching at her heavy breasts and letting her tentacles squirm all over her body, digging into the hole between her lower and upper body and wrapping around her torso to tease every inch of over-sensitive flesh.");

		output("\n\n<i>“You refused my pleasure,”</i> she gasps between moans of arousal. <i>“Now you seem intent on inflicting your own.”</i>");
	}

	output("\n\n<i>“Tell me what you desire, star-walker,”</i> the creature says, trying to hold herself steady for you. <i>“I am the queen of this place. A queen of pleasures of the flesh, as well. If that is what you desire, you may take it freely. Or perhaps there is something else?”</i>");

	clearMenu();

	if (pc.hasCock()) addButton(0, "Cloaca Fuck", queenOfTheDeepCloacaFuck, undefined, "Cloaca Fuck", "Take the queen up on her offer. Climb up on that giant lower body of hers and find somewhere to sheathe your cock. ");
	else addDisabledButton(0, "Cloaca Fuck", "Cloaca Fuck", "Requires a dick.");

	if (pc.findEmptyPregnancySlot(Creature.PREGSLOT_ANY) != -1) addButton(1, "Get Egged", queenOfTheDeepGetEgged, undefined, "Get Egged", "You’ll let the queen fill you with her young, as she wanted, though she’ll do it your way.");
	else addDisabledButton(1, "Get Egged", "Get Egged", "You’d need to have a viable orifice for the Queen to stuff full of eggs.")

	addButton(2, "Take Bow", queenOfTheDeepTakeBow, undefined, "Take her bow", "Take the queen’s bow as payment for her assault on you. The strange crystal weapon looks damn swanky.");

	addButton(3, "Her Story", queenOfTheDeepHerStory, undefined, "Listen to her Story", "What you desire is to learn who, and what, she is. Even your Codex can’t seem to figure out what she’s supposed to be.");

	addButton(14, "Leave", queenOfTheDeepLeave);
}

public function queenOfTheDeepCloacaFuck():void
{
	clearOutput();
	queenOfTheDeepHeader();
	
	var selCock:int = (pc as Creature).cockThatFits(queenOfTheDeep.analCapacity());
	
	if (selCock == -1) selCock = (pc as Creature).smallestCockIndex();

	output("To the victor go the spoils, you tell yourself. The creature intended to fill you with her eggs... or whatever it is she lays, so you might as well return the favor and fill her with seed. You start to wade towards her through the water, shedding your [pc.gear] as you go until you’re bare naked and unarmed, mere inches from the creature’s humanoid half. Your [pc.cock " + selCock + "] announces itself with a tumescent throb, poking out of the water and all but pressing against the monstrous woman’s belly.");

	output("\n\n<i>“It is pleasure you desire after all,”</i> she says, licking her dark blue lips and reaching down to caress your [pc.cock " + selCock + "]. <i>“A shame. You will never know the bliss I could have brought you, if only you would take my eggs.”</i>");

	output("\n\nEnough of that, you command her. She tried and failed, and now it’s your turn to call the shots. She groans, but doesn’t resist your invective; the woman merely busies herself with your prick, stroking you from tip to base with growing speed using the endless warm water around you as lube. A moan of pleasure soon escapes your [pc.lips], and you find yourself drawn to the big, cyan breasts hanging heavily from the creature’s chest. Your fingers sink into them, all but vanishing into cool flesh that quivers and jiggles in the most alluring ways. You can feel just how full each tit is, how laden with her alien milk.");

	if (pc.isTreatedBull() || pc.isBro()) output("\n\nYou tell her just how awesome a pair of cock-cozies she’s rocking.");
	else output("\n\nGrinning, you tell the woman-creature that you’d like to see those big tits of her wrapped around your cock.");

	output("\n\n<i>“Is that so?”</i> she coos, slipping a little lower on her behemoth body, aligning her pendulous chest with your [pc.cock]. You run a hand along one of her milk-laden udders, grasping at the four-nippled teat until a squirt of amber milk runs into your palm, which you smear into her cleavage until her blue flesh glistens with it. The captive creature moans as you milk her, chewing on a dark lip and cupping the bottom of her rack, hefting it up and surrounding your shaft.");

	output("\n\nYou’re suddenly aware of how satin-soft her tits are; how the milk-swollen orbs compress around your shaft, deforming to make the most perfect pair of cockpillows imaginable. Moaning, you grasp at the creature’s shoulders, trying to steady yourself as cataclysmic waves of pleasure wash over you. A few minutes of this treatment, of being subjected to her too-soft breasts gliding across every inch of cockflesh while slathered with milky lube, has you trembling on the brink of orgasm.");

	output("\n\nIt’s too much to bear!");

	if (pc.libido() >= 75)
	{
		output("\n\nYour orgasm is as inevitable as");
		if (silly) output(" death and taxes");
		else output(" every other aspect of your queen’s menagerie of pleasures");
		output(". With a howl of pure bliss, you unleash a torrent of spunk between the queen’s breasts, splattering her body with your [pc.cumNoun]. She just coos and continues to rub her mounds around your shaft, milking you dry of every drop until your prick finally stops spurting, leaving her plastered with");
		if (pc.cumQ() <= 250) output(" several thin rivulets of spunk");
		else if (pc.cumQ() <= 500) output(" several thick globs of spunk");
		else if (pc.cumQ() <= 2500) output(" what looks like an entire bukkake scene");
		else output(" a full body-covering of your jizz that’s");
		output(" intermixing with the milky coating on her tits.");

		output("\n\n<i>“My, aren’t we sensitive?”</i> the creature purrs, her inhumanly long tongue reaching down to lick through the mess you’ve left between her tits. <i>“And what a mess you made...”</i>");

		output("\n\nYou smirk and step forward, assuring the creature that was only the first course.");
	}
	else
	{
		output("\n\nYou wrench yourself back, using every ounce of willpower to separate yourself from the lusty alien. You won’t be satisfied with just a regular titfucking... even one as awesome as that... No, you need to see the real treasures of her body for yourself.");
	}

	if (!pc.isTaur())
	{
		output("\n\nYou push the creature’s humanoid half down and scramble up her back, fighting off the dozens of squirming tentacles on her back in order to find somewhere to sit, straddling her back with your cock hanging heavily over the bubble-butt resting on her lower body, barely concealing her sex. You ease yourself down, gently prying apart her soft asscheeks and slipping your [pc.cock " + selCock + "] between them.");
	}
	else
	{
		output("\n\nYou dash around the defeated creature’s behemoth body until you’re directly behind her. Once positioned, you lunge forward and mount her like a mare, leaping onto her back and thrusting your [pc.cock " + selCock + "] into a gaping orifice on her hind end.");
	}
	
	(pc as Creature).cockChange();

	output("\n\nThe woman screams, a bellowing cry of pleasure that echoes throughout the caverns as you ram your prick into her gaping fuck-hole. You reach around her body, grasping at her heavy breasts and squeezing to the beat of your thrusting hips. Her quivering hole squeezes around your [pc.cock " + selCock + "], sealing you in an embrace of wet warmth that slides around your shaft this way and that until your voice joins hers in cries of ecstasy. Beneath you, the creature’s legs spasm and scrape against the cavern walls, trying to keep their balance as pleasure threatens to overwhelm her.");

	output("\n\nHer screams only drive you on, spurring you to hammer her hole harder, driving yourself as deep into her cunt as you can.");

	output("\n\n<i>“I’m already so full of young, and yet you’d curse me with more?”</i> the woman below you manages to groan between gasps of pleasure. <i>“Ah! Truly you are a cruel, cruel creature.”</i>");

	output("\n\nWell, maybe she shouldn’t have tried to fuck you full of those children then!");

	output("\n\nYou reach down and slap her ass, sinking your fingers into those big, blue cheeks and making her squeal. For such a big thing, she’s amazingly sensitive...");

	output("\n\nAs you think that, you start to feel several small, wriggling... things... wriggling along your");
	if (!pc.hasLegs()) output(" lower body");
	else output(" legs");
	output(", coiling around you and rubbing your [pc.skinFurScales] with something wet and warm. It takes you a moment to realize they’re the creature’s tentacles, spraying you down with venom. You wave them off, smacking them away... but too late to stop what’s already been done.");

	output("\n\n<i>“You wanted pleasure,”</i> the creature coos, smirking over her shoulder at you. <i>“Just keep fucking me... let the poison work, until your brain is nothing but </i>fuck<i>.”</i>");

	output("\n\nGrunting, you slam yourself into her, down to the hilt until she screams. You’re gonna have to give her everything you’ve got now, before the venom leaves you too horny to think. You secure your hands on her hips, grabbing hard and using her human half as leverage to pound her genital hole faster and harder. Sinking as much cockflesh as you can into the spasming slit, you find yourself already succumbing to her venom: your body heats up, becoming more and more sensitive to every touch.");
	if (!pc.isTaur()) output(" The feeling of your [pc.butt] grinding against the smooth carapace of the creature’s back, t");
	else output(" T");
	output("he sensation of wet muscle contracting around your [pc.cock " + selCock + "], the cold smoothness of the creature’s cyan skin in your hands... it’s all too much to bear.");

	output("\n\nWith a roar of ecstasy, you slam yourself in to the hilt and cum, letting loose");
	if (pc.libido() >= 75) output(" all the seed you’ve got left");
	else if (pc.cumQ() <= 250) output(" a few weak webs of jizz");
	else if (pc.cumQ() <= 500) output(" several squirts of seed");
	else output(" a torrent of spunk");
	output(" into the creature’s body, basting her squirming vaginal walls with your climax. She grunts and wobbles, many legs scrabbling for purchase on the slick stone as she’s subjected to a hint of the pleasure she’s given you, and soon follows you into orgasm. The creature screams, her high voice echoing from the walls around you in a deafening chorus of exultation. Amber milk sprays from her huge tits, and you feel moisture bubbling up from inside her slit - a warm, creamy mix of your own seed and femcum intermixing inside her spasming walls.");

	output("\n\nYour body slumps against her woman-half’s back, breathing heavily as you recover from your climax.");

	output("\n\n<i>“I have... never been </i>mounted<i> like this before,”</i> the creature moans, resting her head against the stone. <i>“How bestial...”</i>");

	output("\n\nSomehow, you get the feeling she enjoyed that ‘bestial’ treatment.");

	output("\n\nYou pull yourself off the beast’s tentacle-laden back and flop into the water, gathering up your equipment from the watery depths and staggering off. The well-fucked monster is left behind in the darkness, fading into the shadows behind you.");

	output("\n\nYou doubt you’ll see it again.");

	queenOfTheDeep.loadInCunt(pc, 0);
	pc.orgasm();
	if (pc.libido() >= 75) pc.orgasm();

	processTime(45 + rand(15));

	output("\n\n");
	CombatManager.genericVictory();
}

public function queenOfTheDeepGetEgged():void
{
	clearOutput();
	queenOfTheDeepHeader();

	//PC gets loaded with 3-6 eggs in ass + each vag (that isn't already occupied). Massive +gape, permanent +wetness in holes filled, +10 Libido. PC gets da big preggers belly automatically. 
	//Restore PC to full health, dump lust. +several orgasms per hole/dick/etc. 

	var numEmptyHoles:int = 0;
	var numEmptyVaginas:int = 0;
	var bEmptyAss:Boolean = false;
	var bEmptyVagina:Boolean = false;

	// ass
	if (!pc.isPregnant(3))
	{
		bEmptyAss = true;
		numEmptyHoles++;
	}

	// cunts
	var vi:int = 0;
	var vList:Array = [];
	var vIdx:int = -1;
	if (pc.hasVagina())
	{
		for (vi = 0; vi < pc.vaginas.length; vi++)
		{
			if (!pc.isPregnant(vi))
			{
				numEmptyVaginas++;
				numEmptyHoles++;
				bEmptyVagina = true;
				vList.push(vi);
			}
		}
		if(vList.length > 0) vIdx = vList[rand(vList.length)];
	}
	
	var cIdx:int = -1;
	if (pc.hasCock()) cIdx = pc.biggestCockIndex();
	
	var bMultiTentacle:Boolean = (numEmptyHoles > 1);

	output("<i>“Now that you’ve calmed down,”</i> you say, starting to peel off your [pc.gear], <i>“maybe we can work something out.”</i>");

	output("\n\nThe queen’s blackened eyes widen - only for a moment, before her features resolve into a lascivious smile. <i>“Ah, that would make my heart soar,”</i> she says, taking a long-legged step forward. You put a hand up, warning her back; she sucks in a sharp breath and recoils, settling back onto the surface of the water.");

	output("\n\n<i>“But we do it my way,”</i> you say simply, setting aside your equipment and wading through the water towards her.");

	output("\n\n<i>“As you wish,”</i> the queen answers, setting her bow down in turn and opening her arms to you, allowing you to slip into her embrace. <i>“You are very strong, my dear one. I have never met anyone able to defeat me like this before, you should know. I expect this will be an encounter to remember.”</i>");

	output("\n\nIt certainly will be.");

	output("\n\nYou step up to the queen’s humanoid half, letting your gaze wander across a voluptuous figure of cyan flesh patched with cream-white, covered with patches of luminescent moss arrayed like clothing. Her coverings conceal everything but her breasts, and it is to those pendulous orbs that you are instantly drawn. The queen coos softly as your hand reaches out to cup one of her heavy tits, sinking your finger deep into the pliant flesh - your hand all but vanishes in her soft skin, letting you feel in glorious detail how full of milk she is, all but overflowing with what can only be a sweet, thick bounty.");

	output("\n\n<i>“You wish to drink from me?”</i> she asks, dark lips smiling. <i>“Please, dear one, don’t hold back. Let me nourish you... give you the strength to bear my young.”</i>");

	output("\n\nHer offer is too good to pass up, and hearing her already purring about how full of children you’ll soon be sends a shiver of arousal down your spine");
	if (cIdx >= 0) output(" until your [pc.cock " + cIdx + "] is stiff and pressing against her belly. The queen only smiles more, reaching down to wrap her cyan fingers around your prick and gently stroking it, urging you deeper into her embrace");
	output(". Licking your lips, you heft up her breast and press your [pc.lips] to it, locking them around her four-pointed teat.");

	output("\n\nYou barely need to do anything to coax out a flow of amber nectar, alien milk that floods your mouth with a taste that brings back memories of oranges - wonderfully sweet... and just a little bitter.");
	
	output("\n\n<i>“Ah, yes,”</i> your captive queen moans, cupping the other breast and rolling back her head. <i>“Take nourishment from me, pass it on to my young when they are planted within you, growing and feeding...”</i>");
	
	output("\n\nYou gulp down mouthfuls of her seemingly endless bounty, draining her mammoth tits with rapidly growing excitement. As you drink, you feel her arms close around you, fingers digging into your back... and then several other slender appendages encircling you, wrapping around your body and gently working down towards your ass and crotch. You pay them no mind at first, until you feel a gentle wetness start to drool onto your [pc.skinFurScales], followed quickly by a");
	if (pc.isDependant(Creature.DEPENDANT_MYRVENOM)) output(" familiar and awesome");
	output(" burn.");

	output("\n\nYou glance up at the queen, and find her smiling down at you with glistening eyes and dark lips turned into a doting smile. She strokes your [pc.hair] affectionately, gently urging you deeper into her breast, urging more of her squirting teats into your mouth. You can’t resist the temptation to drink more and more and more of her creamy, thick milk... the taste is absolutely intoxicating, better than any liquor.");

	output("\n\n<i>“I can tell you like it,”</i> your lover moans, now all-but cradling you in her arms. A shiver runs through you as her many tentacles seed your body with aphrodisiac venom, preparing you for what promises to be mind-blowing bliss. <i>“I am glad. Not even my most loving servants drink as you do...”</i>");

	output("\n\nYour heart flutters at the compliment... or at the feeling of several tentacles brushing against your [pc.asshole]");
	if (pc.hasVagina()) output(" and [pc.cunts]");
	output("; you can’t be sure. Either way, you continue to drink deep of the rich amber meal your lover is granting you, only stopping to moan and shiver as one of her tentacles sprays your " + (bEmptyAss ? "[pc.asshole]" : "[pc.vagina " + vIdx + "]") + " with its lusty red chemicals. You’re practically swimming in a sea of lust-venom by the time the queen seems satisfied that you can handle the amorous onslaught that is to come, and gently pries you off her breast.");
	
	pc.milkInMouth(queenOfTheDeep);
	
	output("\n\n<i>“Are you ready, dear one?”</i> she asks, cupping your cheeks. You nod eagerly, and receive a kiss for your trouble, a passionate embrace of the lips that lets her sinfully sinuous tongue play all across your mouth. What you wouldn’t give to feel that penetrating a more tender hole...");
	if (pc.isBiped()) output(" <i>“You are so small for one so strong. I hope I do not cause you pain now.”</i>");

	output("\n\nYou would brace yourself, try to ready your body for what’s to come, but you quickly find that all the volition has drained out of your body, leaving you utterly relaxed in the queen’s arms. You’re not sure you could resist her now if you wanted to.");
	if (pc.isBimbo()) output(" Not that you do! The thought of being pumped full of tiny little babies gets you even more excited than her venom... and those cock-tentacles look absolutely scrumptious. Maybe she’ll let you suck one while she fucks you full of little critters!");

	output("\n\nThe first tentacle finds its way to your " + (bEmptyAss ? "[pc.asshole]" : "[pc.vagina " + vIdx + "]") + ", gently prodding against your withering resistance until, with a wet pop, you feel the squirming alien appendage probing into you, slathering your already-tender walls with her lusty venom. Your eyes flutter, heart hammering as the sensation overwhelms you, almost wracking you with orgasm even as this first tendril enters you.");

	output("\n\n<i>“Rest easy, my darling,”</i> the queen says, still stroking you, trailing kisses across your cheek. <i>“All you need do now is let me work, let me give you pleasure. Your part in this comes later...”</i>");
	
	output("\n\nYou just moan and squirm, using what little movement your leaden body allows to buck back against the tentacle inside you, trying to get more and more of her into your " + (bEmptyAss ? "[pc.asshole]" : "[pc.vagina " + vIdx + "]") + ".");
	if (numEmptyHoles > 1)
	{
		output(" Other tentacles squirm around your body, finding their way towards your other hole");
		if (numEmptyHoles > 1) output("s");
		output(" and following the example of the first, sliding in through your now-nonexistent defenses and squirting what feels like gallons of aphrodisiacs into");
	 	if (numEmptyVaginas > 0) output(" your womb");
	 	if (numEmptyVaginas > 1) output("s");
	 	if (numEmptyVaginas > 0 && numEmptyHoles > numEmptyVaginas) output(" and");
		if (numEmptyHoles > numEmptyVaginas) output(" your bowels");
	 	output(".");
	}

	output("\n\nLooking up, you see something more than viscous pink fluids starting to make their way up the largest of the queen’s translucent tendrils, stretching the shaft wide around a tiny white bulb of matter. For a moment, the substance escapes your addled mind’s understanding... until you see the vaguest outline of humanoid form growing from it. Otherwise, the tiny parcel looks more like a jellyfish than it does its mother, a mass of whiteness flicked with reds and pinks that make up the translucent infant’s unformed vitals.");

	output("\n\nIt’s so small and delicate. You can hardly believe that someday it will become the towering beast its mother is.");

	output("\n\nYou watch its descent eagerly, eyes wide as the tentacle it rides in thrusts deep within you in a wave of the queen’s potent venom. You feel the hit of the chemical lust immediately, burning away at every last trace of resistance until you’re nothing more than putty in her hands, eagerly relaxing your body for her delicate young.");
	if (numEmptyVaginas > 1) output(" Other tendrils soon follow, swelling with young and opening your body wide. They spear open your cervixes and discharge gallons of thick, sticky venom into your vacant wombs, creating a chemical nest for the unborn aliens to inhabit.");
	else if (bEmptyVagina && bEmptyAss) output(" The tendril fucking your [pc.cunt " + vIdx + "] follows the other’s example, swelling thicker and forcing your body to open wide for its precious payload. It gently, almost tenderly coaxes open your cervix and ejaculates a rush of thick, sticky venom into your vacant womb, creating a chemical nest for the unborn alien to inhabit.");

	//permanent +wetness in holes filled, +10 Libido
	if (!pc.isPregnant(3))
	{
		pc.loadInAss(queenOfTheDeep);
		(pc as Creature).buttChange(queenOfTheDeep.biggestCockVolume(), false, false, false);
		if (pc.ass.wetnessRaw < 5) pc.ass.wetnessRaw += 1;
		imbibeVenomEffects();
	}

	for (vi = 0; vi < pc.vaginas.length; vi++)
	{
		if (!pc.isPregnant(vi))
		{
			pc.loadInCunt(queenOfTheDeep, vi);
			(pc as Creature).cuntChange(vi, queenOfTheDeep.biggestCockVolume(), false, false, false);
			if (pc.vaginas[vi].wetnessRaw < 5) pc.vaginas[vi].wetnessRaw += 1;
			imbibeVenomEffects();
		}
	}
	
	imbibeVenomEffects();
	pc.libido(10);
	
	output("\n\nAnother scream of unparalleled pleasure rips itself from your throat as the first of the queen’s young penetrates your now-gaping hole, stretching you unbearably wide around its seemingly tiny frame before it rushes into your deepest depths, squirted out into the sticky wad of chemicals left for it by the thrashing tentacle ravaging your");
	if (bEmptyVagina) output(" [pc.vaginas]");
	if (bEmptyVagina && bEmptyAss) output(" and");
	if (bEmptyAss) output(" bowels");
	output(". A second spawn quickly follows the first, bloating your belly with the growing occupation of the queen’s alien brood.");
	if (numEmptyHoles == 1)
	{
		output(" Your");
		if (bEmptyVagina) output(" [pc.cunt " + vIdx + "]");
		else output(" [pc.asshole]");
		output(" is soon stuffed full of the queen’s many offspring");
	}
	else if (numEmptyHoles > 1 && numEmptyHoles != pc.vaginas.length + 1) output(" Every hole not full of other offspring is soon playing home to the queen’s offspring");
	else output(" " + (numEmptyHoles == 1 ? "Your" : "Every") + " hole is soon stuffed with the queen’s offspring");
	output(", a squirming and writhing mass of tiny creatures that move in ways that make you feel ill, even as their mother’s tentacles continue to hold your hole");
	if (numEmptyHoles > 1) output("s");
	output(" open, squirting in more and more of her venomous cocktail and thrusting into you, making sure your body is too overwhelmed by pleasure to reject her children.");

	if (cIdx >= 0)
	{
		output("\n\n<i>“Poor thing,”</i> the queen moans as your [pc.cock " + cIdx + "] throbs and drools its excitement into the water. <i>“Let me give you some relief...”</i>");

		output("\n\nYou feel a cold hand wrap around your [pc.cock " + cIdx + "], gently stroking from base to tip in a slow, languid motion. It’s only a moment later that you realize the queen’s hand in covered in her venom, using it like lube to stroke you. Moaning, you wiggle your [pc.hips] and press yourself against the defeated queen, your body all but begging her for more.");

		output("\n\nShe eagerly provides it, shifting her body until her weighty breasts are positioned on either side of your [pc.cock " + cIdx + "] and enveloping it between them. You’re suddenly aware of how satin-soft they are; how the milk-swollen orbs compress around your shaft, deforming to make the most perfect pair of cockpillows imaginable. Your orgasm is as inevitable as");
		if (silly) output(" death and taxes");
		else output(" every other aspect of the queen’s menagerie of pleasures");
		output(". With a howl of pure bliss, you unleash a torrent of spunk between the queen’s breasts, splattering her body with your [pc.cumNoun]. She just coos and continues to rub her mounds around your shaft, milking you dry of every drop.");
	}

	output("\n\nPleasure hammers through you in shockwaves, a new quake born every time the queen’s sinuous");
	if (bMultiTentacle) output(" tendrils move");
	else output(" tendril moves");
	output(" inside you, assailing your venom-burned body with mind-breaking sensation. She wrings orgasms from you as easily as she does your moans and cries, keeping you suspended in wave after wave of pleasure until your body is crammed as full of her spawn as it can possibly be, your belly bloated with writhing masses of the translucent jellyfish you saw before.");
	
	var i:int = 0;
	for(i = 0; i < 5; i++)
	{
		pc.orgasm();
	}

	output("\n\nOnly then does she release you, slowly drawing her tendril");
	if (bMultiTentacle) output("s");
	output(" out of you. When the tapered tip");
	if (bMultiTentacle) output("s");
	output(" finally pop");
	if (!bMultiTentacle) output("s");
	output(" wetly out of you, you all but collapse - only to be caught by the queen before you can flop bonelessly into the water.");

	output("\n\n<i>“Thank you,”</i> she says simply, holding you tight. <i>“Your generosity may yet save my race. I will forever be in your debt, my dearest star-walker.”</i>");

	output("\n\nAll you can really do is moan, managing to place a hand on your now-bloated belly, feeling the squirming life within you. The queen smiles and puts her hand over yours, enjoying your body as much as you enjoy the feeling of her young nestling within you. You know you lost control a long, long time ago, but held protectively in the queen’s arms, feeling her heavy breasts and beating heart against your back... none of that matters. All you feel is contentment.");

	output("\n\n<i>“Go now,”</i> the queen whispers, stroking your [pc.hair]. <i>“Go, and take my young out among your stars. You shall be my herald, carrying them far, far from here... somewhere safe, where they may grow strong. As strong as you, my dear.”</i>");

	output("\n\nYour eyes flutter closed at the queen’s words. Exhaustion takes you.");

	processTime(60 * 4);
	for (i = 0; i < numEmptyHoles * 3; i++) pc.orgasm();

	clearMenu();
	addButton(0, "Next", queenOfTheDeepGetEggedII);
}

public function queenOfTheDeepGetEggedII():void
{
	clearOutput();
	queenOfTheDeepHeader();

	output("You awaken on the lakeshore, groggily opening your eyes. For a moment, you wonder if your encounter with the queen of the deep lake was a dream, a delusion born of darkness and isolation. That dream (or is it terror?) ends when you feel something churning inside you, and your hand is drawn instinctively to your [pc.belly]. You’re gravid, and your [pc.skinFurScales] bulges with new life... the queen’s offspring squirm just under the surface, slight bulges in your flesh you can both see and feel as they adjust themselves inside you.");

	output("\n\nGroaning, you stagger to your [pc.feet], hand still protectively on your spawn-swollen belly. You find your equipment a short distance away, dry and neatly packed away for you. You smile to yourself as you kit up, wondering if you’ll ever see your queen again...");
	
	// permanent +wetness in holes filled, +10 Libido

	output("\n\n");
	CombatManager.genericVictory();
}

public function queenOfTheDeepTakeBow():void
{
	clearOutput();
	queenOfTheDeepHeader();

	output("<i>“What I desire... is this,”</i> you say, putting a hand on the crystalline bow the <i>“queen”</i> used against you.");
	
	output("\n\nShe sucks in a sharp breath, but after a moment’s hesitation, her cyan fingers uncurl from around it. You take the quiver from her hips and sling it onto yours, kitting up in the queen’s former weapons.");
	
	output("\n\n<i>“A fair trade: violence for the tools to defend against it,”</i> she says, rising up onto her stalk-like legs. <i>“Use it in good faith, star-walker. May it serve you as well as it has me, and my mother before me.”</i>");
	
	output("\n\nYou sling the bow over your shoulder and watch as the creature retreats, fading into the oppressive darkness. Something tells you that you won’t be seeing her again.");

	output("\n\n");
	enemy.inventory.push(new QueensBow());
	CombatManager.genericVictory();
}

public function queenOfTheDeepHerStory():void
{
	clearOutput();
	queenOfTheDeepHeader();

	output("Rather than take advantage of the defeated <i>“queen,”</i> as she styles herself, you’d rather know who - and what - she is.");
	
	output("\n\n<i>“Ah, an unexpected wish,”</i> the woman says, apprehension melting away as you fail to assail her further. <i>“But a welcome one, I assure you. In this darkened world, it is so often fuck or be fucked. So little time for talking. Of course, I’m guilty of jumping to such things myself as well, am I not?”</i> she laughs.");
	
	output("\n\nNow that’s an understatement.");
	
	output("\n\n<i>“But that does not answer your question, does it? Hmm, where to start, though...”</i>");
	
	output("\n\n<i>“Once, my people were called the Water Queens. We live our whole lives in water, and once there was a queen to every great lake here in the darkest depths of the planet. We traded in water: we would allow the nyrea, ganrael, and other races to enjoy clear, pristine water in exchange for their service. The seed of other races is necessary for us to breed, you see, and those women who came in search of water were asked to bear our eggs. It was an amicable trade for most, made better by the incredible pleasure we offered freely to those that joined with us. But that was many, many generations ago,”</i> she says sadly, her dark eyes drifting closed as she speaks.");
	
	output("\n\nYou wonder if she can really see you at all.");
	
	output("\n\n<i>“In truth, I do not know what became of my race,”</i> the queen says, wrapping her cyan arms around herself. As she speaks, now, the glowing moss that covers much of her body droops down to the barest embers of luminescence, bathing the two of you in shadows. <i>“I have sent my servants out to scout other lakes in the Deep many times. Each returns with the same story: there are no Water Queens at the other lakes, not for a hundred miles around. Even the furthest-fielding travelers that I have captured cannot say they’ve seen one before. My mother, may her spirit rest, gave voice to prophecy when I was young: that I would be the last of our race, and soon we would be nothing but shadows in the legends of the other Deep-dwellers. As years go by, I believe more and more that she was right.”</i>");
	
	output("\n\nCurious, you find yourself having to ask, <i>“Didn’t you say you were");
	if(pc.isBimbo()) output(", like, super");
	output(" pregnant? That you were going to lay eggs in me? What about </i>your<i> children?”</i>");
	
	output("\n\nA pained look washes over the queen’s features, and she looks sharply away from you. <i>“Ah. Yes. I have laid more than one hundred clutches of my young in the bodies of nearly every race that calls this world their home. Water Queens are a difficult pregnancy, demanding on their hosts. Only the strongest can bear our young to term, and those that do leave an... impression upon the young they bear. You do not yet understand, I sense. Allow me to explain: I was laid in the body of a red myrmedion, a young woman who ventured into the Deep to escape the violence that consumed her people. I wield her venom, now. Her strength flows in my veins, making me mightier than my mother and granting me armor that turns aside all but the most savage of blows. They were my bearer’s gifts to me, her first and only child.”</i>");
	
	output("\n\nShe was born to a red myr? That would mean... she can’t be more than a few years old.");
	
	output("\n\nThe queen gives you a wicked grin, and you can see the venom pooling on her long fangs and on the tips of her many tendrils. <i>“These gifts should make my young stronger, better than I am. Yet instead they are born weak, mewling things... when they are born at all. I have no surviving young. I fear some curse has befallen the creatures of the Deep, made them inhospitable hosts for my offspring. Only when you arrived did I see a glimmer of hope, a star-walker whose body may yet be untainted by this curse. I hoped you would bear my young back among the stars, allow them to escape their fate here. I see now I was mistaken.”</i>");

	processTime(10 + rand(5));

	//Menu here, with [Leave] and [Get Egged] as options only.
	addDisabledButton(2, "Take Bow");
	addDisabledButton(3, "Her Story");
}

public function queenOfTheDeepLeave():void
{
	clearOutput();
	queenOfTheDeepHeader();

	output("You want nothing else from the queen, and tell her to leave in peace. She gives you an apprehensive look, but slowly rises to her full height and begins to withdraw.");
	
	output("\n\n<i>“I thank you for my life,”</i> she says quietly. <i>“I will not trouble you again.”</i>");
	
	output("\n\nYou doubt you’ll see the monster again.");

	output("\n\n");
	CombatManager.genericVictory();
}

public function queenLactationEvent():void
{
	clearOutput();
	author("Savin");
	
	output("You feel a tightness in your [pc.chest], strong enough to make you stop dead in your tracks and clutch at your chest, trying to figure out the source of the uncomfortable sensation.");
	if (pc.biggestTitSize() <= 0)
	{
		output(" When you move your hand around, you suddenly feel your chest starting to... starting to grow! You watch with amazement as your previously flat chest expands outward, creating a pair of small, but perfectly formed breasts! <b>You stare at your new tits</b> for a few moments, gingerly rubbing a hand around the newly sensitive flesh.");
		pc.breastRows[0].breastRatingRaw = 2;
	}
	output(" After a moment, you feel an altogether pleasant pressure building up behind your [pc.nipples], and quickly find that they’re beading with moisture!");

	output("\n\nYou give your tits a tentative squeeze, and sure enough a jet of [pc.milkNoun] squirts out, splattering over the ground. <b>You’re lactating!</b> It looks like your body is preparing itself for the inevitable birth of the Queen of the Deep Lake’s offspring....");
	
	if (pc.milkMultiplier < 75) pc.milkMultiplier = 75;
	if (pc.milkFullness < 75) pc.milkFullness = 75;
	pc.setBoobSwelling();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function queenLactationIncreaseEvent():void
{
	clearOutput();
	author("Savin");
	
	output("Lately you’ve been feeling your lactating tits get fuller and fuller, like they’re swollen with more and more [pc.milkNoun] every hour. <b>You’re definitely lactating more now</b>.");
	
	pc.milkRate += 2.5;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function queenBellyMovementEvent():void
{
	clearOutput();
	author("Savin");
	
	output("You find your hands idly drifting down to your [pc.belly], caressing the taut bulge of pregnant flesh. As if responding to your touch, you feel the queen’s spawn inside you moving, squirming around just beneath the surface. One seems to find its way directly to your hand, brushing against your palm through the thin barrier of your [pc.skinFurScales].");

	output("\n\nYou smile to yourself and rub back, assuring the spawn inside you that you’re here, and that they’re safe and loved. A feeling of happiness floods through you at that, and you find yourself smiling dumbly as you proceed.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function queenBellyrubEvent():void
{
	clearOutput();
	author("Savin");
	
	output("As you’re walking along, you find that a few people stop you on the street to ask you about your pregnancy: how far along are you, when are they due, can they feel your belly? You can’t find the heart to tell them that your belly was filled with the spawn of a deep-dwelling monster, and squirm out of their questions as best you can.");

	output("\n\nThough you do find yourself guiltily enjoying the belly pats that come your way.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function queenMorningSickness():void
{
	clearOutput();
	author("Savin");
	
	var inShip:Boolean = InShipInterior();
	var inPublic:Boolean = (InPublicSpace() || rooms[currentLocation].planet.toLowerCase().indexOf("station") != -1 || rooms[currentLocation].hasFlag(GLOBAL.INDOOR));
	
	output("A wave of nausea hits you out of nowhere, all but toppling you over. You stumble");
	if (inShip) output(" over to your vessel’s restroom");
	else if (inPublic) output(" to the nearest bathroom");
	else output(" to the ground");
	output(" and puke, retching until your eyes and throat burn.");

	output("\n\nYou recover a few minutes later, grumbling about the queen and her spawn. The feeling of your [pc.belly] shifting quiets you, though, and you find your hands protectively circling around your pregnant gut. The creatures growing inside you squirm slightly, seeming to rub against your hands with startling affection.");

	output("\n\nIt’s not <i>all</i> bad, you suppose...");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function queenDreamEvent():void
{
	clearOutput();
	author("Savin");
	showName("WATER\nQUEEN...");
	showBust("");
	
	output("<b>Your sleep is disturbed by strange dreams...</b>");

	output("\n\nThe darkness of sleep parts to the luminescent pulsing of glowing moss, hanging heavily from the roofs of caves you recognize as belonging on Myrellion. You look around, and find yourself moving over crystal clear water, carried upon a solid, smooth surface.");

	output("\n\n<i>“Welcome home, [pc.name],”</i> an unfamiliar voice whispers. Your attention is drawn forward, to the body of a nude woman sitting just beside you, her cyan skin radiant in the glow of the fungal light.");

	output("\n\nThe woman pivots on her hips, revealing a body not unlike that of the Queen of the Deep Lake, though... she has your eyes. The woman smiles at you, leaning back on what must be her spidery body to plant a kiss on your cheek.");

	output("\n\n<i>“Who...?”</i> you start to ask, though the answer is self-evident, flooding your mind with images of a life spent together, of raising dozens of Water Queens and growing old amid a horde of loving daughters.");

	output("\n\nHappiness overwhelms you, and you return the girl’s affectionate kiss, holding onto her back as she leads you into the deepest caves of her homeworld.");

	output("\n\nAround you, you can hear the movements of dozens... hundreds, even... of legs moving through the water as your brood comes home to roost.");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function queenAlmostDueMessage():void
{
	clearOutput();
	author("Savin");
	
	output("You note that your swollen belly is shifting awkwardly. The many water-spawn inside you are shifting more and more lately, and your body has been feeling even more wet and hot the last little while. You doubt you’ll be carrying these creatures around with you much longer.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function queenPregnancyEnds():void
{
	clearOutput();
	author("Savin");
	
	var se:StorageClass = pc.getStatusEffect("Queen Pregnancy End");
	
	// Failsafe
	if(se == null)
	{
		output("ERROR: 'Queen Pregnancy End' Status Effect does not exist.");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var buttPreggers:Boolean = (se.value3 > 0);
	var cuntPreggers:Boolean = (se.value4 > 0);
	var numCuntPreggers:Number = se.value4;
	var numPreggers:Boolean = se.value3 + se.value4;

	output("You feel a slight drop in your [pc.belly], like something is moving inside you, falling through your");
	if (buttPreggers) output(" gut");
	if (buttPreggers && cuntPreggers) output(" and");
	if (cuntPreggers)
	{
		output(" womb");
		if (numCuntPreggers > 1) output("s");
	}
	output(". Realization hits you a moment later as your hands instinctively wrap around your stomach, and tendrils of pleasure start to creep out through your [pc.skinFurScales]: your pregnancy is about to be at an end.");

	output("\n\nAs quickly as you can, you divest yourself of your [pc.gear] while you’re still able, and slump to the ground with your [pc.legOrLegs] ");
	if(pc.legCount == 1) output("limp");
	else output("spread wide");
	output(". Another wave of almost-orgasmic pleasure hits you, all but knocking you prone - it’s an effort to keep your eyes focused, watching as your belly starts to deflate. You can actually <i>feel</i> the queen’s spawn moving inside you, crawling through your body towards the open air.");

	output("\n\nThe way they’re moving, you don’t think you need to do anything, much less push - the creatures looked so delicate going in, you’re afraid the extra pressure might hurt them. Instead, you do all you can to relax yourself, aided in that cause by the alien pleasure your implanted children bring you. You start to feel an unnatural heat and wetness drooling out of your");
	if (numCuntPreggers > 1) output(" [pc.cunts]");
	else if (numCuntPreggers == 1) output(" [pc.cunt]");
	if (buttPreggers && cuntPreggers) output(" and");
	if (buttPreggers) output(" [pc.asshole]");
	output(", which you quickly recognize as the queen’s venom, finally burst out of you after weeks of churning inside you.");

	output("\n\nYou surrender to the chemical pleasure, moaning and shuddering as the first of your children crests");
	if (cuntPreggers) output(" the lips of your cunt");
	else output(" the ring of your ass");
	output(", surging out of your body with an explosively wet <i>POP!</i> You arch your back and scream, thrashing in orgasmic bliss as you deliver new life into the world - as you fulfill the duty the Queen of the Deep Lake set before you.");

	output("\n\nLooking down, you see the newborn creature: it still resembles the pale jellyfish you saw before, but now that form is but a cocoon surrounding the eight-legged crab-drider body you’re familiar with, a paper-thin veneer protecting the tiny life form just opening its eyes and wailing. You scoop it up, tearing away the veneer still clinging to its soft, fragile body: inside is a tiny blue body attached to the slender, tall red bestial underside you remember from the queen.");

	output("\n\nThe little thing stares up at you with wide open eyes and mewls at you, forming what sounds like a word: <i>“Thirsty!”</i>");

	output("\n\nShe... she can talk!");
	
	output("\n\nYou blink away your surprise and gather the girl up in your arms, guiding her to your [pc.chest]. Her eight legs cling hard to your arm, and her arms quickly find your tit and bring it up to her mouth. You gasp and moan as she coaxes out the first trickle of [pc.milkNoun] and starts to suckle, nourishing herself as you once did on her true mother.");
	
	output("\n\nThere isn’t time to dwell on the bliss of surrogate motherhood, however, as you’re quickly reminded that the queen laid more than one of her tiny offspring inside you....");

	imbibeVenomEffects();
	
	clearMenu();
	addButton(0, "Next", queenPregnancyEndsII);
}

public function queenPregnancyEndsII():void
{
	clearOutput();
	author("Savin");

	output("You quickly lose track of time, your world fading into the abstract pleasure of birth, bringing each successive offspring to a nipple to nurse, and trying to keep others from wandering off as they adjust to their spindly legs. By the time your body seems finally empty, you count a total of " + pc.statusEffectv1("Queen Pregnancy End") + " offspring having clawed their way out of you, leaving you panting and gasping on the ground.");

	output("\n\nThe queen’s young are nothing if not precocious, and soon you’re surrounded by little eight-legged princesses wobbling around unsteadily, chattering at each other in high-pitched voices that struggle to form full sentences. Each seems utterly amazed at her ability to speak, stopping to squeal or giggle or jump around before they can finish a thought.");

	output("\n\nYou manage to stay awake long enough to herd your daughters around yourself and pull your Codex out, putting in for a pickup drone from your father’s child-care center. After that, though, you find that consciousness slips away from you.");

	clearMenu();
	addButton(0, "Next", queenPregnancyEndsIII);
}

public function queenPregnancyEndsIII():void
{
	clearOutput();
	author("Savin");

	output("You wake up what seems like hours later, with a blanket you don’t recognize draped over you and a receipt crunched up in your hand. A note’s been written on it in messy, scratchy handwriting: <i>“Thank you for taking care of us!”</i> the first line reads. In what looks like different handwriting, a second line adds <i>“We’ll miss you! Come see us soon!”</i>");

	output("\n\nSeveral large kiss-marks dot the receipt as well, and little hearts and doodles of the princesses hugging you. Aww...");

	output("\n\nYou put the decorated page away as you gather your equipment.");

	output("\n\n<b>New key item added!</b>");

	QueenOfTheDeepPregnancy.queenCleanupData();
	(pc as Creature).createKeyItem("Water Princess Note", 0, 0, 0, 0, "This receipt by a child-recovery drone was doodled all over by the tiny water princesses you gave birth to. They’ve scrawled several affectionate drawings all over it, and written thank-yous for taking care of them. Looking at it gives you a warm, fuzzy feeling...");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
