import classes.Characters.PlayerCharacter;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Characters.Cockvine;
import classes.Items.Accessories.TamWolf;
import classes.Items.Accessories.TamWolfDamaged;
public function adultCockvineHeader():void
{
	showName("ADULT\nCOCKVINE");
	showBust("ADULTCOCKVINE");
	author("Nonesuch");
}

public function adultCockvineEncounter():void
{
	adultCockvineHeader();

	CodexManager.unlockEntry("Cockvines");
	IncrementFlag("MET_ADULT_COCKVINE");

	output("\n\n");
	
	// Basically, reflex check + randomisation!
	if (rand(pc.RQ()/2) + (pc.RQ() / 2) > 60)
	{
		clearMenu();
		
		var isSlut:Boolean = ((pc.isTreated() && pc.isBimbo()) || pc.isBimbo() || pc.isCumSlut() || (pc.libido() >= 50 && pc.lust() >= 33) || pc.lust() > 66);
		
		output("In the gloom of the deep caverns you feel constantly on edge; the second you set your gaze anywhere your neck begins to crawl, expecting an attack to come from behind. The ground is the last place your instincts tell you to keep an eye on, but when you glance downwards momentarily you are glad you did. You jerk to an immediate halt, staring at the thick, tubular, organic object sprawled out from a crevice across your path.");

		// First Encounter
		if (CodexManager.entryViewed("Cockvines"))
		{
			output("\n\nDeceptively still and partially hidden in the darkness it might be, but you know a cockvine tentacle when you see one.");
		}
		else
		{
			output("\n\nYou’ve no idea what it is but everything about it, particularly the way it disappears into that dark hole, makes you uneasy.");
		}

		if (flags["FUCKED_ADULT_COCKVINE"] == undefined)
		{
			output("\n\nThe thick snake-like thing suddenly rears and grabs at your [pc.legOrLegs]; you jump back in the nick of time. Rippling and bobbing agitatedly in the dim light now, you can see it is some sort of lithe, green tentacle with a blunt, purple head, replete with a moist, horizontal slit across the top. It is inexpressibly obscene and your eye is drawn to the thickening end disappearing into the crevice, from which more of these penis-vines are sliding into view. You can only imagine what the main body of this thing looks like: undoubtedly if it had managed to grab you, you would have found out.");

			// Female Treated/Bothrioc perked/whatever slut perks
			if (isSlut)
			{
				output("\n\nGazing at the emerging tentacles now – those pliable, thick, strong frustrated tentacles which look like just so much juicy cock to you – you feel dim annoyance with yourself for <i>not</i> letting yourself get caught. It is only natural for a creature like this to react to the presence of someone like you, so well-suited to blissfully taking care of such tense, hot, veiny frustration. And how good would that feel... you realize vaguely you are moving towards the mass of writhing cockvines automatically.");

				// Weak willed/otherwise srsly far gone:
				if (pc.WQ() < 15 || pc.isCumSlut())
				{
					output("\n\nYou couldn’t stop your body’s instincts even if you wanted to. You smile beatifically as first one tentacle, then a second wrap their warm embrace around you, beading their herbal semen onto your skin, leading and welcoming you to their deep, wet boudoir.");

					// Go to Consentacles
					addButton(0, "Next", adultCockvineConsentacles);
					return;
				}
				
				addButton(0, "Stop", adultCockvineEncounterStop, undefined, "Stop Moving", "Stop moving towards the cockvines.");
				addButton(1, "Go on...", adultCockvineEncounterGoOn, undefined, "Go on", "Surrender yourself to the cockvines.");
			}
			// Not megaslut
			else
			{
				output("\n\nThe thought makes you shudder. Feeling deeply grateful for and not a little smug about your quick eyes and wits, you carefully skirt the writhing mass of tentacles and continue on your way.");
				
				addButton(0, "Next", mainGameMenu);
			}
		}
		else
		{
			output("\n\nThe thick snake-like thing suddenly rears and grabs at your [pc.legOrLegs], but you are ready for it and jump back easily. The lithe, green tentacle with its blunt, purple head ripples and bobs agitatedly in the dim light now; you hear the slithering, swampy sound of more of it emerging from its crevice nest, rustled into action.");
			
			// Female Treated/Bothrioc perked/whatever slut perks
			if (isSlut)
			{
				output("\n\nGazing at the emerging tentacles now – those pliable, thick, strong frustrated tentacles which look like just so much juicy cock – you feel dim annoyance with yourself for <i>not</i> letting yourself get caught. It is only natural for a creature like this to react to the presence of someone like you, so well-suited to blissfully taking care of such tense, hot, veiny frustration. And how good would that feel... you realize vaguely you are moving towards the mass of writhing cockvines automatically.");

				// Weak willed/otherwise srsly far gone
				if (pc.WQ() < 5 || pc.isCumSlut())
				{
					output("\n\nYou couldn’t stop your body’s instincts even if you wanted to. You smile beatifically as first one tentacle, then a second wrap their warm embrace around you, beading their herbal semen onto your skin, leading and welcoming you to their deep, wet boudoir.");

					// Go to Consentacles
					addButton(0, "Next", adultCockvineConsentacles);
					return;
				}
				
				addButton(0, "Stop", adultCockvineEncounterStop, undefined, "Stop Moving", "Stop moving towards the cockvines.");
				addButton(1, "Go on...", adultCockvineEncounterGoOn, undefined, "Go on", "Surrender yourself to the cockvines.");
			}
			// Not megaslut
			else
			{
				output("\n\nThe sight never fails to make you shudder. Feeling deeply grateful for and not a little smug about your quick eyes and wits, you carefully skirt the writhing mass of tentacles and continue on your way.");
				
				addButton(0, "Next", mainGameMenu);
			}
		}
	}
	else
	{
		if (flags["FUCKED_ADULT_COCKVINE"] == undefined)
		{
			output("In the gloom of the deep caverns you feel constantly on edge; the second you set your gaze anywhere your neck begins to crawl, expecting an attack to come from behind. The ground is the last place your instincts tell you to keep an eye on – you don’t see the thick, tubular, organic, deceptively still shape lying across your path until it is far too late. You gasp as something warm, wet and ropy wraps itself around your [pc.legOrLegs], wrenching you off balance; before you can recover, your assailant has established a firm grip around your");
			if (pc.isNaga()) output(" tail");
			else output(" [pc.foot]");
			output(" and sent you sprawling.");
			output("\n\nYou stare down at it, heart pounding. It is some sort of lithe, green tentacle with a blunt, purple head, complete with a moist, horizontal slit across the top. It is inexpressibly obscene and your eye is balefully drawn to the thickening end disappearing into the crevice; more of these penis-shaped vines are slithering out of it, a whole nest of these creatures stirred into action. You claw desperately at the ground but the vine attached to you draws you remorselessly towards the hole, where more tentacles curl their strong, warm grip around you.");
			output("\n\nYou manage to claw your weapon free as the dark swallows you entirely; in here, there is only the heavy herbal heat and smell of the plant monster and its many oozing, sinewy appendages, patiently winding themselves around your frame. You’ve got to fight free!");
		}
		else
		{
			output("In the gloom of the deep caverns you feel constantly on edge; the second you set your gaze anywhere your neck begins to crawl, expecting an attack to come from behind. The ground is the last place your instincts tell you to keep an eye on – you don’t see the thick, tubular, organic, deceptively still shape lying across your path until it is far too late. You gasp and then groan with understanding horror as something warm, wet and ropy wraps itself around your [pc.legOrLegs], wrenching you off balance; before you can recover the cockvine has established a firm grip around your");
			if (pc.isNaga()) output(" tail");
			else output(" [pc.foot]")
			output(" and begins to tug you away.");
			output("\n\nDizzily you hear the busy, ropy sound of its many other appendages writhing out of a nearby crevice, stirred into action. You claw desperately at the ground but the vine attached to you draws you remorselessly towards the hole, more tentacles curling their strong, warm grip around you as you are dragged closer. You manage to claw your weapon free as the dark swallows you entirely; in here, there is only the heavy herbal heat and smell of the plant monster and its many oozing, sinewy appendages, patiently winding themselves around your frame.");
			output("\n\nYou’ve got to fight free!");
		}

		(pc as PlayerCharacter).createStatusEffect("Cockvine Grip", 1, 0, 0, 0, false, "Constrict", "You’re in the grip of a Cockvine!", true, 0);
		clearMenu();
		
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(new Cockvine());
		CombatManager.victoryScene(adultCockvinePCVictory);
		CombatManager.lossScene(cockvineLossRouter);
		CombatManager.displayLocation("COCKVINE");
	
		addButton(0, "Fight!", CombatManager.beginCombat);
	}
}

public function cockvineLossRouter():void
{
	if (pc.hasCock() || pc.hasVagina())
		adultCockvinePCLoses();
	else
		adultCockvineHahaFuckYouGenderless(true);
}

public function adultCockvineGrenadesInEnclosedSpaces(damageValue:TypeCollection, pluralNades:Boolean = false, usedLauncher:Boolean = false, isLustGas:Boolean = false):void
{
	//Activates if PC uses a grenade. 50% chance of taking damage/getting gassed
	output("\nThe moment the grenade");
	if (pluralNades) output("s");
	output(" leave");
	if (!pluralNades) output("s");
	output(" your")
	if (!usedLauncher) output(" hand");
	else output(" launcher");
	output(" you wonder if maybe");
	if (!usedLauncher) output(" throwing");
	else output(" using");
	output(" explosives in such a tight, enclosed space is a really good idea... you struggle with the cockvine frenetically, trying to ball yourself up the best you can, your skin prickling as the seconds count down. FOOM.");

	// miss
	if (rand(2) == 0)
	{
		output(" The slimy rock shakes around you and the cockvine writhes and spasms from the impact, but though you are momentarily deafened you are otherwise unharmed. Phew!");
	}
	else
	{
		output(" You are thrown forward and smack your head into the slimy rock as the grenade");
		if (pluralNades) output("s");
		output(" go");
		if (!pluralNades) output("es");
		output(" off with a deafening bang.");

		if (isLustGas)
		{
			output(" Dazed, you cannot help but take a big gulp of the gas now billowing thickly through the cramped, slithery pit.");
			var damage:TypeCollection = damageValue.makeCopy();
			damage.applyResistances(pc.getLustResistances());
			pc.lust(damage.getTotal());
		}
		else
		{
			output(" Though the writhing mass of cockvines absorbs the majority of it, you are thumped mightily hard by the impact of the explosion.");
			applyDamage(damageValue, pc, pc);
		}
	}
}

public function adultCockvineSenseOverride():void
{
	output("You doubt you could show off your moves very well down here, even if this creature <i>had</i> eyes.");
}

public function adultCockvineStruggleOverride():void
{
	//PC struggle 
	//Replaces run if at stage 1 or higher
	clearOutput();
	output("Instead of attacking the cockvine directly you work at grimly extricating yourself from its grasping tentacles, peeling the coiling, writhing appendages off you and clambering out of this hellish pit.");

	var chance:Number;

	if (pc.PQ() > pc.RQ()) chance = pc.PQ();
	else chance = pc.RQ();
	
	//Limber confers a 20% escape chance.
	if(pc.hasPerk("Limber")) chance += 20;

	if (rand(100) > chance)
	{
		output(" But it’s useless. The moment you manage to fight one off two more have tightened their damp, muscular weight around another part of your body. After thirty seconds of sweaty, fretful struggling you have to concede you’re no better off than you started.");
	}
	else
	{
		output(" You pull, push and wriggle the best you can, and after a lengthy tussle manage to force the monster to part some of its grip on you. Muscles and lungs straining, you manage to climb some of the way to safety.");
		pc.addStatusValue("Cockvine Grip", 1, -1);
		if (pc.hasStatusEffect("Grappled")) pc.removeStatusEffect("Grappled");
	}
	
	pc.setStatusValue("Cockvine Grip", 2, 1);
	
	CombatManager.processCombat();
}

public function adultCockvineConsentacles():void
{
	if (!pc.hasCock() && !pc.hasVagina())
	{
		adultCockvineHahaFuckYouGenderless(false);
		return;
	}
	
	clearOutput();
	adultCockvineHeader();

	output("The cockvine winds its multitudinous, fibrous grip around you as you approach its nest");
	if (!pc.isNude()) output(", languidly shedding your [pc.gear] as you go");
	output(".");
	if (pc.tallness > 80 || pc.thickness >= 100) output(" Despite your size it");
	else output(" It");
	output(" easily lifts you off your [pc.feet] when you reach the verge of the crevice; you sink slowly downwards into the dense, tropical heat, thick tentacle flesh rubbing across your [pc.skin], coiling around your arms, waist and [pc.legOrLegs], exploring you with steady, deliberate interest. You slow your breathing down, taking in deep lungfuls of the humid, herbal atmosphere, deliberately relaxing yourself, luxuriating in the way the cockvine’s scent makes your muscles loosen, in the way it causes your blood to rise to the surface of your [pc.skin]");
	if (pc.hasVagina()) output(" and makes [pc.eachVagina] moisten itself eagerly");
	output(".");

	output("\n\nYou clutch two constituent parts of your tentacle harness, running your grip down them, enjoying their firm, oily, ever-so-slightly pliant texture, coaxing the thing on. The tips ooze creamy white seed onto you in response, smearing across your [pc.breast] and cheek; the sharp smell - citric, sweet and musky - hits your bloodstream like alcohol, making your pupils dilate, your [pc.lips] part and your [pc.nipples]");
	if (!pc.hasFuckableNipples()) output(" harden");
	else output(" wet themselves");
	output(".");

	output("\n\nThe cockvine’s progress is slow - implacable but gentle - completely at odds to the manner in which it swiped at you in the first place. Innately you understand that it acts in direct proportion to its captive; because you happily stepped into it and are willing it on, its movements are sensual, almost peaceful. Smiling amorously, you reach your head forward and teasingly lick the nearest vine. Like a cat’s tail it rises and curls upwards in response, letting you run your tongue all along its pliant, sleek girth to its leaking tip. Beneath your dangling lower body another tentacle curves its long length along your groin");
	if (pc.hasVagina())
	{
		output(", [pc.eachVagina] seeping excitement");
		if(pc.hasClit()) output(" to the deliberate, slimy friction across [pc.eachClit]");
	}
	if (pc.hasVagina() && pc.hasCock()) output(" and");
	if (pc.hasCock())
	{
		output(" [pc.eachCock] hardening irresistibly to the oily rubbing along");
		if (pc.cocks.length == 0) output(" its");
		else output(" their");
		output(" underside");
		if (pc.cocks.length > 1) output("s");
	}
	output(".");

	output("\n\nThe cockvine that has your tongue’s attention undulates peacefully over your [pc.lips] for a moment, taking the time to smear them with its fruit, before parting them in a single fluid movement. Hollowing your cheeks you practically vacuum the leaking purple head inwards, the heavy herbal musk invading your mouth, intensifying the fug of pheromone arousal you’re lost in to an almost trance-like state.");
	// Oral Fixation
	if (pc.isCumSlut())
	{
		output("\n\nYour tender lips, puffed up to the tentacle’s teasing and eagerly absorbing its fluids, have already driven you practically to the edge – when it stretches them wide and fills your mouth with bulging, heavily scented prick it’s too much. The sound of your muffled moans reaches your ears from somewhere far away as you rocket to an orgasm,");
		if (pc.hasVagina()) output(" [pc.eachVagina] quivering and wetting itself across the tentacle sliding across it");
		if (pc.hasVagina() && pc.hasCock()) output(" and");
		if (pc.hasCock()) output(" [pc.eachCock] tensing up and spurting cum in an uncontrolled series of ecstatic seizures");
		output(", dribbling down your chin freely. In the wet delirium of it you find yourself wondering how it is possible for anyone to not enjoy sucking cock.");
	}

	if (pc.hasVagina())
	{
		output("\n\n[pc.EachVagina] is");
		if (pc.wettestVaginalWetness() <= 3) output(" wet with excitement");
		else output(" seeping excitement down your thighs");
		output(" and you grind against the throbbing mass of warm plant flesh beneath you needily, eager to be filled. You rotate your head, dragging your tongue and cheeks across the bulging cockvine stuffed in your mouth, trying to goad it on, and your attention is rewarded moments later when a particularly large cockvine penetrates your [pc.vagina], its head spreading your puffy lips wide before the deliciously thick, firm shaft ploughs deep into you.");
		output("\n\n");
		if (pc.vaginas.length > 1)
		{
			output(" Your other");
			if (pc.vaginas.length == 2) output(" pussy");
			else output(" pussies");
			output(" practically foam");
			if (pc.vaginas.length == 2) output("s");
			output(" with frustration, crying out to be tended to – which");
			if (pc.vaginas.length == 2) output(" it");
			else output(" they");
			output(" duly");
			if (pc.vaginas.length == 2) output(" is");
			else output(" are");
			output(", other cockvines seeking out your readied fuck-hole");
			if (pc.vaginas.length > 2) output("s");
			output(" and stretching");
			if (pc.vaginas.length == 2) output(" it");
			else output(" them");
			output(" with questing, oily, sugared plant dick.");
			output("\n\n");
		}
		output("Other tentacles coil and slither over your [pc.legOrLegs], eagerly seeking out other entrances to invade. One of them does. Your eyes cross as you feel a warm bluntness determinedly pressing against your [pc.asshole] and then pushing inside, dense but pliant dick sliding into your [pc.ass], the roughness of it contrasting brilliantly with the sweetness saturating [pc.eachVagina].");
	}
	else
	{
		output("\n\nYou grind against the throbbing mass of warm plant flesh beneath you needily, eager to be filled. You rotate your head, running your tongue and cheeks across the bulging cockvine stuffing your mouth, trying to goad it on, and your attention is rewarded moments later when a particularly large cockvine penetrates your [pc.asshole], its head spreading your sensitive sphincter wide before the deliciously thick, firm shaft ploughs deep into your tunnel.");
		if (pc.hasCock()) output(" It thoughtlessly mashes over your prostate, your helplessly hard [pc.cocksNounSimple] flexing and bulging to the pump of the questing, oily, sugared plant dick.");
	}

	if (pc.hasCuntTail())
	{
		output("\n\nThe plant monster doesn’t even have to search out your pussy tail; spreading itself and drooling eagerly in the presence of so many phalluses and long since out of your mind’s blissed-out control, it seizes upon the tip of the nearest questing vine, causing a new vein of pleasure to course through the dense fuckery you are mired in as it happily clamps down and begins to vigorously milk it. It would be impossible to take if you weren’t already so relaxed.");
	}

	output("\n\nThe cockvine holds you up and fucks your every orifice long and slow, writhing and bending into your deepest, sweetest spots, honeying your mouth");
	if (pc.hasVagina()) output(",");
	else output(" and");
	output(" your guts");
	if (pc.hasVagina())
	{
		output(" and your");
		if (pc.vaginas.length == 1) output(" pussy");
		else output(" pussies");
	}
	output(" with the endless leak of thick, citrus cum from its smooth, purple tips. It isn’t a mass of cocks all driven by their own independent urges, they act as a single creature with a delicious organic rhythm. Vines have wrapped themselves around your arms, striping them in glistening green; they tighten up when the tentacles engaged in reaming your [pc.vagOrAss] speed up, making you feel trapped in a straitjacket of warm, wet sex, making you squeal around the one you are fellating, forced to another juicy, flexing high... and then they loosen up, caressing your form sensuously, coddling you, lubricating your [pc.skin], assiduously preparing you for the next frenzied climax of rutting.");

	output("\n\nYou grip the ends of the tentacles swaddling your arms gratefully, jerking their bulging lengths as you lavish the one pumping into your mouth with attention, kneading and licking every inch, glorying in the way it rewards you by powerfully surging all the way in and ejaculating small loads of its pheromone-rich cum straight down your throat, making you glow with intense arousal,");
	if (pc.hasVagina()) output(" [pc.eachVagina] dribbling freely around the vine stuffed into it");
	if (pc.hasVagina() && pc.hasCock()) output(" and");
	if (pc.hasCock()) output(" [pc.eachCock] straining needily");
	output(".");

	output("\n\nYou cannot be the only one who knows about this side of the plant creatures, surely? That they are wonderful lovers if you give yourself to them willingly? No, you think not. You think there are probably more than a few ant women, starved of men-folk, who come down here and walk gladly into their planet’s darkest caves; the most shameful and succulent of secrets. You tense up around the girthy, pliant tentacles you are transfixed on in filthy glee at the thought.");

	output("\n\nYour sense of time and space are shattered by a series of wet, full body climaxes; how long you spend in that hot, green luscious daze doesn’t matter, there is only the multitude of hard, loving tentacles and your willingness to return their affection with interest. When you are nothing more than a drooling, cock-dazed mess of flesh it flips you upside down so that your [pc.chest] and arms are dangling down towards the trunk. Agitated now with its long anticipated release it thrusts into your [pc.vagOrAss] hard, one beneath you plunging in and out of your throat, eight inches of firm, wide plant prick using your gullet like a fleshlight.");

	if (pc.hasLipples() || pc.hasFuckableNipples())
	{
		output("\n\nPositioning your body downwards alerts the carpet of cockvines beneath you to " + pc.totalNipples() + " orifices that have hitherto gone unmolested. You tense up with fresh glee as " + num2Text(pc.fuckableNippleCount()) + " new tentacles stretch into the sensitive insides of your [pc.nipples], arching your back and presenting your [pc.chest] to drive them further inside.");
	}

	output("\n\nYour [pc.butt] turned over, the");
	if (!pc.hasVagina()) output(" tentacle using your ass presses, rubs and bumps hard into an entirely new area electrifyingly");
	else
	{
		output(" tentacles using your ass and");
		if (pc.vaginas.length == 1) output(" pussy");
		else output(" pussies");
		output(" press rub and bump into entirely new areas electrifyingly");
	}
	output(" and when the cockvines bulge with their final payload, stretching your every hole even wider, you cannot help but orgasm again, tensing up and thrashing around your hot, obdurate fillings wildly, your [pc.cum]");
	if (pc.isLactating()) output(" and [pc.milk]");
	output(" spattering the heaving plant creature. Your flexing tunnel");
	if (pc.hasVagina()) output("s");
	output(" gladly knead the cockvines as they fountain vast amounts of cum into you, drawing your warm, musky, citric reward into your belly, your intestines");
	if (pc.hasVagina()) output(" and your womb");
	if (pc.vaginas.length > 1) output("s");
	output(".");
	output("\n\nThe eager spurting of the cockvines before, lubricating and softening you, was clearly just pre-cum of some sort, a pale appetizer – the undocked stamen around you writhe and explode with cum, pasting you from top to bottom with their ripe cream as you are gorged on it, hands clenching and unclenching whilst it surges into what feels like every space in your body.");
	if (pc.hasVagina()) output(" Your womb quickly swells out, heavy warmth packing into you until you look six months pregnant.");

	output("\n\nYou blank out for a bit, unable to process anything but having seed reamed into you from every direction for a long time; a wet, clenching, throbbing daze which goes on for who knows how long. When your consciousness pieces itself back together you find yourself still being held, right way up this time, by the cockvine. Its energy expended, it clutches your dangling limbs gently, slowly rubbing your [pc.skin]. Is it... cuddling you? You’re not in any state to complain. You let your head dangle and enjoy the humid warmth, regaining your breath, reveling in the satisfying throb of your well-fucked body, and the feeling of fruity semen leaking out of your disgracefully treated");
	if (pc.vaginas.length == 1) output(" pussy");
	else if (pc.vaginas.length > 1) output(" pussies");
	if (pc.vaginas.length > 0) output(" and");
	output(" ass.");

	output("\n\nAfter a while you pat the cockvine meaningfully. Immediately it slowly lifts you upwards, cool air touching your limp, sweat and cum slicked body. Stars dance across your vision as, with a surprising amount of gentleness, the cockvine rolls you onto the ground outside its nest. You grin sleepily and caress the last tentacle as it, with an obvious amount of reluctance, relinquishes its grip on you and withdraws. Such a gentleman.");

	output("\n\nYou rest for a while longer and then");
	if (!pc.isNude()) output(" clamber back into your clothes");
	else if (pc.isBiped() || pc.isTaur()) output(" clamber back to your [pc.feet]"); 
	else output(" right yourself");
	output(", ready to carry on. The fun you’ve had here will stay with you, though; you smile dozily as the high taste, texture and smell of citrus sex inundates your senses as you go on your unsteady way.");

	processTime(60);
	
	var ppCockvine:Cockvine = new Cockvine();
	
	for (var i:int = 0; i < pc.vaginas.length; i++)
	{
		pc.loadInCunt(ppCockvine, i);
		pc.cuntChange(i, ppCockvine.cockVolume(0));
	}
	pc.loadInAss(ppCockvine);
	pc.buttChange(ppCockvine.cockVolume(0));
	pc.loadInMouth(ppCockvine);

	pc.orgasm();
	pc.orgasm();
	pc.orgasm();

	IncrementFlag("FUCKED_ADULT_COCKVINE");

	clearMenu();
	addButton(0, "Next", mainGameMenu);

}

public function adultCockvineEncounterGoOn():void
{
	clearOutput();
	adultCockvineHeader();

	output("You have no wish to stop your body’s instincts. Your mind sinks into the cotton wool of its vast erogenous zone and lets your flesh get on with it, smiling beatifically as first one tentacle, then a second wrap their warm embrace around you, beading their herbal semen onto your skin, leading you downwards to their deep, wet boudoir.");

	clearMenu();
	addButton(0, "Next", adultCockvineConsentacles);
}

public function adultCockvineEncounterStop():void
{
	clearOutput();
	adultCockvineHeader();

	output("You get a firm grip on your treacherous instincts and stop yourself moving within range of the coiling, writhing cockvine. You give the tentacle nest a wide berth, shaking yourself down and refocusing on the cavern’s shadows. You really need to start investing in more cold showers.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function adultCockvinePCVictory():void
{
	clearOutput();
	adultCockvineHeader();
	output("One more tentacle weakly tries to coil itself around its neck and then flops backwards. All around you the battered, oozing cockvine’s appendages wither and sink slowly downwards, too exhausted and broken to continue holding you. Wheezing, you pull yourself out of the crevice and collapse on the ground, pulling in blessedly cold, fresh air into your lungs.");

	output("\n\nYou are exhausted and covered in the creature’s disgusting slime – but are also feeling a tingle of endorphins for managing to beat the cockvine in its own lair. After you’ve rested a bit, you pick yourself up and carry on.\n\n");

	CombatManager.genericVictory();
}

public function adultCockvinePCEscapes():void
{
	clearOutput();
	output("A tentacle flaps at your [pc.feet] and almost catches hold of you again – you savagely");
	if (pc.isTaur() || pc.isBiped()) output(" kick it");
	else output(" crush it against the rock");
	output(", get a good grip on the ledge above you and heave yourself out of the crevice.");

	output("\n\nYou take a single moment to pull in the blessedly cold, fresh air and then stumble away as fast as you can, the sound of enraged cockvine slapping heavily at the ground in search of its prize echoing off the stone walls close behind you.\n\n");

	CombatManager.abortCombat();
}

public function adultCockvinePCLoses():void
{
	clearOutput();
	adultCockvineHeader();

	if (pc.HP() <= 0)
	{
		output("You swat weakly at the tentacles busily winding themselves around your body");
		if (!pc.isNude()) output(" and reaching through your [pc.gear]");
		output("; the cockvine responds by tightening up around your arm hard, making you whimper. It cannot be helped. The monstrous plant has crushed all the resistance out of you and you find you no longer want to struggle, continue to make the thing react violently to your movements.");
	}
	if (pc.lust() >= pc.lustMax())
	{
		output("Your limbs go limp and your eyes glaze as you draw in the rich, tropical air steadily. At some point you stopped not wanting to do this. Every lungful of the cockvine’s scent makes you feel more relaxed, more turned on, blood flowing away from your mind and muscles towards your [pc.groin]. The forefront of your brain cries out against it, but it is piloting a holed, rudderless ship of a body. You sink into the warm, cosseting tentacles absently, no longer willing to struggle.")
	}
	output(" Let it do as it may.")


	output("\n\nThe cockvine is still energized from its battle with you and it flexes over your [pc.skin]");
	if (pc.isChestGarbed()) output(" and [pc.upperGarment]");
	output(" with brisk momentum. Even after it has taken your wrists and spread-eagled you across its nest, warm, wet plant continues to slide over your trunk, over your [pc.nipples] and [pc.thighs], slathering you in its coating oil and beading pre-cum, tightening up and relaxing around your forearms and hips. You mumble with unease as a thick vine coils itself around your neck; this is swiftly muffled as its tip seeks out your mouth, pushes the blunt head brusquely past your lips and invades your mouth with its wet, pungent denseness. You set your teeth against it and spasm as another vine immediately pelts your [pc.butt] angrily.");

	output("\n\nYes, better not to piss it off at this point. You soften your mouth and let the purple plant cock fill it. It eagerly quests and curls into your maw, spurred on by the inadvertent rub of your tongue over its smooth underbelly, and it is soon touching the front of your throat, where it tenses up and spurts thick semen. You don’t even get to taste it, nor are you extended the courtesy of being able to spit it out; the syrupy substance goes straight down your throat, warming your stomach. You feel the same warm, green, arousing glow you felt when forced to breathe in the cockvine’s scent only redoubled, spreading out through your whole being. An organic beat throbs through you and dimly you see and appreciate the unremitting, insatiable lusts that drive this bestial plant");
	if (!pc.hasCock() && !pc.hasVagina()) output(".");
	else
	{
		output(", mercilessly making");
		if (pc.hasCock()) output(" your own [pc.cocks] engorge and stand to attention");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.vaginas] moisten and spread");
		output(" in submissive sympathy.");
	}

	output("\n\nOther tentacles are");
	if (pc.isCrotchGarbed()) output(" burrowing busily through your [pc.lowerGarment],");
	else if (pc.isBiped()) output(" coiling themselves up around your [pc.thighs],");
	output(" blindly seeking out the fresh, fertile holes they know are there.");
	if (pc.hasVagina())
	{
		output(" You crane your hips listlessly away from them, but there’s really no stopping it. Your eyes cross as a particularly thick cockvine presses against the entrance to your [pc.vagina] and then surges into your wet, sensitized innards with the same brusque, indifferently eager movement that it used to invade your mouth, its big, smooth head spreading your lips wide. You cannot stop your pussy from accepting and clinging to the thick, hard plant prick eagerly, sending twinges of pleasure nibbling through you as it spears further in, bending into your walls demandingly.");
		if (pc.vaginas.length > 1) output(" Your other vagina");
		if (pc.vaginas.length > 2) output("s");
		if (pc.vaginas.length > 1) output(" are treated similarly, dense plant cock penetrating your readied breeding bays until you are utterly filled, pushing into your pleasure spots from multiple angles, a mind-blowing sensation which would make you scream if your mouth wasn’t also stuffed with dick.");
	}
	
	if (pc.hasCock())
	{
		if (pc.hasVagina()) output("\n\n");
		else output(" ");

		output("You manage a muffled grunt as one vine wraps its thinner end around your helplessly erect [pc.cock] and tightens");
		if (pc.cocks.length > 1)
		{
			if(pc.cocks.length == 2) output("; your other cock is");
			if (pc.cocks.length > 2) output("; your other cocks are");
			output(" treated similarly, smaller tentacles reaching in to take a firm grip on your overgrowth of dicks");
		}
		output(". You might have found it funny that the plant creature sees your male sex as simply another");
		if (pc.cocks.length > 1) output(" set of");
		output(" appendage");
		if (pc.cocks.length > 1) output("s");
		output(" to treat with secure suspicion - except they rub, soften and tighten around your girth");
		if (pc.cocks.length > 1) output("s");
		output(" thoughtlessly, a rough, wet masturbation which combines with the throb of arousal radiating through you to put you on a high, singing edge.");
	}
	
	output("\n\nInevitably a vine slides a slimy course between your buttocks, pressing against your [pc.asshole] and then spreading it wide, relentlessly feeding inch after inch of warm, oily tentacle into your bowels");
	if (pc.hasCock()) output(", mindlessly riding over your tender prostate as it does");
	output(".");
	if (pc.hasCuntTail())
	{
		output(" Your");
		if(pc.hasParasiteTail()) output(" parasitic tail");
		else output(" [pc.tail]");
		output(", drooling and eagerly spreading itself in the presence of so many phalluses, is a final, easy target. Just when you thought you’d reached as much as you could take your back arches, your body seizing up as you feel a tentacle thrust into your rear pussy’s sensitive wet stem, your petals happily clutching at the green, pumping hardness.");
	}

	output("\n\nYou are utterly transfixed by the thing, your limbs and trunk bound by clenching wet muscle as the self-same stuff pumps into your every orifice. Other stiff tentacle ends bat into your skin, oozing their white payloads onto you, frustrated by your inability to take every single one of them.");

	var numCunts:int = pc.vaginas.length;
	if (pc.hasCuntTail()) numCunts++;

	if (numCunts >= 3) output(" Which hardly seems fair, given just how many you have stuffed inside you.");
	output(" The situation would be untenable, unthinkable, maddening if it wasn’t for the dense pheromones the cockvine has dumped into your lungs and stomach; with the relaxation and vagueness they bring you are able to take the hard, multiple fuckings without much issue, zone out, go somewhere else... except when the pleasure forced upon you peaks. The way the cockvine writhes into you, bending into your inner walls");
	if (pc.hasVagina()) output(", appendages pressing against each other through your tender flesh");
	output(" with a flexibility no normal cock could – it’s impossible to completely ignore.");
	if (pc.hasVagina())
	{
		output(" Your");
		if (pc.vaginas.length == 1) output(" pussy");
		else output(" pussies");
		output(" tense up around the hot stem");
		if (pc.vaginas.length > 1) output("s");
		output(" as they continuously press into your deepest area");
		if (pc.vaginas.length > 1) output("s");
		output(" of gratification and then quiver");
		if (pc.vaginas.length == 1) output("s");
		output(" in orgasm,");
		if (pc.wettestVaginalWetness() <= 3) output(" dribbling");
		else output(" spurting");
		output(" your juices around");
		if (pc.vaginas.length == 1) output(" it");
		else output(" them");
		output(".");
	}
	if (pc.hasCock())
	{
		output(" The way your ");
		if (pc.cocks.length > 1) output(" cocks twitch and bulge");
		else output(" cock twitches and bulges");
		output(" every time the cockvine rides over your prostate eventually becomes unbearable and finally");
		if (!pc.hasVagina()) output(" it is");
		else output(" they are");
		output(" forced to unload, milked and squeezed into spurting out length after length of cum onto the plant below; just");
		if (!pc.hasVagina()) output(" another");
		else output(" some more");
		output(" uncontrolled, bestial phallus");
		if (pc.hasVagina()) output("es");
		output(" doing whatever");
		if (!pc.hasVagina()) output(" it");
		else output(" they");
		output(" may in this terrible nest of them.");
	}

	output("\n\nThe cockvine convulses into you, redoubling its efforts every time you move, twitch or try to pull away from it. The flexing of your orgasm");
	if (pc.hasCock() && pc.hasVagina()) output("s");
	output(" makes the tentacle in your mouth thrust straight into your throat in excitement, any hoarse groans you might have made utterly stifled by ten inches of dripping stamen using your gorge like a fleshlight. Every so often it tenses up and squirts a drab of thick semen into your clenching holes, lubricating them with their heavy sweetness, making it easier for the plant cocks to thrust into you, spurring them on to fuck you from every angle harder and harder. You cannot stop yourself tensing up, convulsing in response to your throat and [pc.butt]");
	if (pc.hasVagina()) output(" and [pc.eachVagina]");
	output(" being ravished in this way, energising it still further, shaking and squeezing you this way and that.");

	output("\n\nYou are hopelessly driven to other, aching orgasms in this green, sticky delirium – maybe it’s two, maybe it’s five, you don’t keep count – before the cockvine finally reaches its own torrential high. Its tentacles bulge, spreading your [pc.lips] and [pc.asshole]");
	if (pc.hasVagina()) output(" and [pc.eachVagina]");
	output(" even wider as they penetrate you as deeply as they can before fountaining out their thick, citric payloads, filling what feels like every space in your body with heavy warmth. The eager spurting of the cockvines before, lubricating and softening you, was clearly just pre-cum of some sort, a pale appetizer – the undocked stamen around you writhe and explode with cum, pasting you from top to bottom with their ripe cream as you are gorged on it, hands clenching and unclenching whilst it surges down your throat and is pumped into your butt");
	if (pc.hasVagina())
	{
		output(" and");
		if (pc.vaginas.length == 1) output(" pussy");
		else output(" pussies");
	}
	output(".");
	if (pc.hasVagina()) output(" Your womb quickly swells out, heavy warmth packing into you until you look six months pregnant.");

	output("\n\nYou blank out for a bit, unable to process anything but having seed reamed into you from every direction for a long time; a wet, clenching, throbbing daze which goes on for who knows how long. When your consciousness pieces itself back together you find yourself being slowly lifted upwards, cool air touching your limp, sweat and cum slicked body. Stars dance across your vision as, with a surprising amount of gentleness, the cockvine rolls you onto the ground outside its nest. You suppose the thing <i>has</i> to treat a potentially fertilized mate with a certain amount of propriety.");
	if (!pc.isNude()) output(" You find yourself woozily grateful that, despite treating them with extreme impoliteness, the cockvine has not actually ripped any of your clothes off. The task of going back in after them would have been unthinkable.");

	output("\n\nIt takes you a while for the green vagueness to recede and for you to regain enough strength to stand up. You exhale heavily as plant cum oozes warmly out of your ravaged [pc.asshole]");
	if (pc.hasVagina()) output(" and [pc.vagina]");
	output(", and you shoot a sour look at the nearby crevice. There is no sign whatsoever of your assailant; it has completely withdrawn. The high taste, texture and smell of citrus sex stays with you as you go your unsteady way.\n\n");

	processTime(45+rand(15));

	for (var i:int = 0; i < pc.vaginas.length; i++)
	{
		pc.loadInCunt(enemy, i);
		pc.cuntChange(i, enemy.cockVolume(0));
	}
	pc.loadInAss(enemy);
	pc.buttChange(enemy.cockVolume(0));
	pc.loadInMouth(enemy);
	pc.orgasm();

	clearMenu();
	CombatManager.genericLoss();
}

public function adultCockvineHahaFuckYouGenderless(fromCombat:Boolean = true):void
{
	clearOutput();
	adultCockvineHeader();

	if (fromCombat)
	{
		if (pc.HP() <= 0)
		{
			output("You swat at the tentacles busily winding themselves around your body");
			if (!pc.isNude()) output(" and reaching through your [pc.gear]");
			output(" weakly; the cockvine responds by tightening up around your arm hard, making you whimper. It cannot be helped. The monstrous plant has crushed all the resistance out of you and you find you no longer want to struggle, make the thing continue to react violently the way it does to your movements.");
		}
		else if (pc.lust() >= pc.lustMax())
		{
			output("Your limbs go limp, your eyes glaze as you draw in the rich, tropical air steadily. At some point you stopped not wanting to do this. Every lungful of the cockvine’s scent makes you feel more relaxed, more turned on, blood flowing away from your mind and muscles towards your [pc.groin]. The forefront of your brain cries out against it, but it is piloting a holed, rudderless ship of a body. You sink into the warm, cosseting tentacles absently, no longer willing to struggle.");
		}
		output(" Let it do as it may.");
	}
	else
	{
		output("\n\nThe cockvine winds its multitudinous, febrile grip around you as you approach its nest");
		if(!pc.isNude()) output(", languidly shedding your [pc.gear] as you go");
		output(".");
		if (pc.tallness > 80 || pc.thickness >= 100) output(" Despite your size it");
		else output(" It");
		output(" easily lifts you off your [pc.feet] when you reach the verge of the crevice; slowly you sink downwards into the dense, tropical heat, thick tentacle flesh rubbing across your [pc.skin], coiling around your arms, waist and [pc.legOrLegs], exploring you with steady, deliberate interest.");
	}

	output("\n\nYou feel the monster slide its pliant grip between your thighs... and there it freezes. You feel it pat your featureless mound several times, searching for something that isn’t there.");

	output("\n\n<i>“You are fucking kidding me,”</i> says a querulous voice from deep within the crevice. <i>“This shit AGAIN?”</i> You gasp as a tentacle grasps you around your [pc.legOrLegs] and hauls you ass over tit upwards. A cockvine points at your face, quivering and spitting cum with barely contained rage. <i>“Listen to me closely, flesh-thing. I didn’t transplant myself into another dimension just so some new chucklefuck could come along and pull the neuter card again. You think you’re goddamn clever, traipsing around a sex game with no genitals? I swear if you bother me before you go out and get yourself a pussy – or a dick if you really must – I will beat your ass so hard it’ll be the same color as my stamen. Capiche?</i>?”");

	output("\n\n<i>“I – uh...”</i> you stammer.");

	output("\n\n<i>“Good. Now fuck off.”</i> The tentacle clutching your lower body coils itself up and then lashes you out of the crevice, where you land with a thump. After a couple of moments recovering you pick yourself up and carry on your unsteady way, making a wide berth of the cockvine nest. You wonder whether getting rejected by the plant monster in this way was on balance a good thing or a bad thing.\n\n");

	processTime(10);

	if (fromCombat)
	{
		CombatManager.genericLoss();
	}
	else
	{
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}

}

public function cockvinePregnancyBirthing(pregSlot:int):void
{
	clearOutput();
	adultCockvineHeader();

	var pData:PregnancyData = pc.pregnancyData[pregSlot] as PregnancyData;
	
	output("A sudden gush of fluid warms the insides of your [pc.thighs], and something tugs urgently at the bottom of your stomach. Alarm is quickly replaced by understanding, and you allow instinct and the odd, green impulses you’ve been experiencing over the last few days take over.");
	if (pc.isNude()) output(" You squat");
	else output(" You quickly take off your [pc.lowerGarments] and squat");
	output(", bearing down with your hips as, with a groan, you feel your birth canal dilate. Rippling down it and then spreading your vagina wide with its bulbous, purple head it comes; your cockvine seedling is vigorous, thick, lithe, and exactly the right shape to make you tingle... there’s no denying it.");

	output("\n\nYou cry out in shocked pleasure as it wriggles its way into life, a gush of fluid from your sensitized pussy aiding its passage to the ground. The moment the green snake-like thing hits the deck it’s off, sinuously winding its way towards cover – but you can’t hold your attention on it, not with its brothers impatiently following it down the path to freedom.");
	
	output("\n\nYour [pc.vagina "+ pregSlot +"] is stretched wide again and again by the ropy creatures, your pussy used along every inch of it by your strong, flexible offspring; they cause you to produce an astonishing amount of lubricant, and eventually you just have to surrender yourself to how filthily good it feels. You whimper as you are brought to orgasm by your third seedling, particularly thick, forced out by your ecstatic contractions; then you cry out and arch your back as the fourth and fifth, made impatient by their slower sibling, wriggle their way out at the same time. It becomes a blur, bearing down again and again to reach those wonderful, birth-giving highs, lost in a slimy, clenching euphoria.");
	
	output("\n\nAt last you are emptied and with a blissed out sigh you lie on your side and force yourself to come out of your daze, at least a little.");
	
	if (InRoomWithFlag(GLOBAL.CAVE, GLOBAL.FOREST, GLOBAL.JUNGLE, GLOBAL.DESERT, GLOBAL.PLANE))
	{
		output(" You birthed "+ pData.pregnancyQuantity +" cockvines, however you can’t even see most of them anymore – the ones that remain are swiftly winding their way towards the darkest, moistest place they can sense. The little buggers really hit the ground running! No doubt evolution has taught them their mothers are unlikely to display much maternal affection towards them. If you’re quick though you might be able to catch one and send it to the nursery.");
	}
	else if (InShipInterior())
	{
		output(" You birthed "+ pData.pregnancyQuantity +" cockvines, however you can’t even see most of them anymore – the ones that remain are swiftly winding their way out of your room, insinuating their way into the darkest holes your ship has to offer. The little buggers really hit the ground running! You suppose most of them will perish on here without food or soil – some might be able to sneak off-board next time you land. If you’re quick though you might be able to catch one and send it to the nursery.");
	}
	
	pc.orgasm();
	//[Catch One] [Leave Them]
	clearMenu();
	addButton(0, "Catch One", cockvinePregnancyCatch);
	addButton(1, "Leave Them", cockvinePregnancyLeave);
}

public function cockvinePregnancyLeave():void
{
	clearOutput();
	adultCockvineHeader();

	output("You watch the snake-like plants go. Out of sight, out of mind.");
	if (InShipInterior() && crew(true) > 0) output(" Might give some of your crew a start, though.");
	output("\n\nYou clean yourself up and then drift off into a pleasant doze.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function cockvinePregnancyCatch():void
{
	clearOutput();
	adultCockvineHeader();

	output("You settle your sights on your <i>“youngest”</i>, gliding away on its green belly slightly too casually. You leap forward and grab it squarely around the middle.");
	
	output("\n\n<i>“Gotcha!”</i> The serpent writhes and whips its mismatched ends desperately at first before going limp, accepting defeat. You grin, and summon the drone.");
	
	output("\n\n<i>“Take this to the nursery. It will need a dark, moist plot and a serious amount of clearance,”</i> you tell it.");
	
	if (flags["COCKVINE_SEEDLING_CAPTURED"] == undefined)
	{
		flags["COCKVINE_SEEDLING_CAPTURED"] = 1;

		output("\n\n<i>“It is forbidden for that species of flora to be transported off Myrellion,”</i> the drone trills in response.");
		
		if (shipLocation != "600" && shipLocation != "2I7")
		{
			output("\n\n<i>“Bit late for that, don’t you think?”</i> you snap. <i>“Put it in a secret compartment or something. It’s going to a controlled space; it’ll be fine.”</i>");
		}
		else
		{
			output("\n\n<i>“I think everyone here has got more pressing concerns than what happens to a single baby plant, don’t you?”</i> you snap. <i>“Put it in a secret compartment or something. It’s going to a controlled space; it’ll be fine.”</i>");
		}

		output("\n\nThe drone doesn’t argue the point, and a few moments later you’re watching it drift away with its slithery charge. Satisfied, you clean yourself up and then drift off into a pleasant doze.");
	}
	else
	{
		output("\n\nThe drone thankfully doesn’t try and argue with you this time, and a few moments later you’re watching it drift away with its slithery charge. Satisfied, you clean yourself up and then drift off into a pleasant, hour-long doze.");
	}

	StatTracking.track("pregnancy/cockvine seedlings captured", 1);
	StatTracking.track("pregnancy/total day care", 1);
	
	addChildCockvine(1);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function addChildCockvine(numChild:int = 1):void
{
	ChildManager.addChild(
		Child.NewChild(
			GLOBAL.TYPE_COCKVINE,
			2.5,
			numChild,
			1, 0, 0, 0
		)
	);
}
