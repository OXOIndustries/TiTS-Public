import classes.Characters.BothriocPidemme;
public function showBothriocPidemme():void
{
	showName("ENCOUNTER:\nBOTHRIOC");
	author("Nonesuch");
	showBust("BOTHRIOC_PIDEMME"); // pidemme, 9999 decide what things are going to be called when the bulk of the content is coded to cover reuse
}

public function encounterPidemmeBothrioc():void
{
	showBothriocPidemme();

	if (flags["BOTHRIOC_PIDEMME_ENCOUNTERED"] == undefined)
	{
		output("\n\nYou try to remain alert in your gloomy surroundings, scanning every object that looms into view carefully, keeping your ears pinned back for any faint sound. You still almost start out of your skin when a four-armed, black-chitined warrior bursts seemingly out of nowhere, whirling some sort of rope weapon over their head. They draw a rapier from the mass of belts wrapped around the swell of their hips with one set of arms, fling the spinning ropes at your [pc.legs] with the other and launch themselves at you, all in one vicious, fluid movement.");

		if ((pc.reflexes() + (rand(60) - 39) > 30) || pc.isPlanted())
		{
			output("\n\nActing solely on instinct, you sidestep the bolo, grab your [pc.meleeWeapon] and stab it upwards, managing to parry the rapier strike with a judder. You stagger backwards, taking in your assailant as they circle you.");

			if (CodexManager.hasUnlockedEntry("Bothrioc"))
			{
				output("\n\nIt’s a bothrioc - one of the ungendered, eerily elegant spider-people you met in the Embassy, many miles away. This one, though, has a predatory, hungry expression on its long, androgynous face, and it is focused entirely on you.");
				output("\n\n<i>“You’ve met my people before then, starwalker,”</i> they say, thin sword tensed in their chitinous hand. Behind their lithe body, their stuffed, glossy abdomen sways. <i>“Know enough about us to dodge an ambush. But not enough to know that this is my territory, which makes you my egg-bearer by right. So sit down");
				if (!pc.isNude()) output(", take your garments off");
				output(" and make things easy for yourself.”</i>");
				output("\n\nYou doubt they are going to take no for answer.");
			}
			else
			{
				output("\n\nThe creature is lithe, bipedal, has ghostly white skin on those parts of its body that aren’t armored in gleaming, latex-like chitin. That includes their plump, spider-like abdomen, swaying behind their butt. Aside from the mass of belts around their rounded thighs they have no clothes, and your eyes are naturally drawn to where their legs meet - where there is nothing. Simply a blank stretch of soft skin.");
				output("\n\n<i>“Bothrioc detected!”</i> your codex chimes helpfully. <i>“Bothrioc are a monogendered race that are classified extremely dangerous and should be avoided where possible. A full entry has been downloaded.”</i>");
				output("\n\nThe bothrioc laughs.");
				output("\n\n<i>“Perhaps you should have done some research before venturing in here, starwalker,”</i> they say. <i>“Here is a summary: You are in my territory, and that makes you my egg-bearer by right. Sit down");
				if (!pc.isNude()) output(", take your garments off");
				output(" and make things easy for yourself.”</i>");
				output("\n\nYou doubt they are going to take no for answer.");
				CodexManager.unlockEntry("Bothrioc");
			}

			fightBothriocPidemme(false);
		}
		else
		{
			output("\n\nYou’re too off guard to get out of the way of the bolo in time and it tangles around your lower body, round weights thumping into your [pc.hips]. Instinctively you fall");
			if (pc.isTaur()) output(" down and out of the way");
			else output(" backwards");
			output(" as the warrior closes in and stabs at you, taking the sting out of the blow but landing you uncomfortably on your");
			if (!pc.isTaur()) output(" backside");
			else output(" side");
			output(". Struggling");
			if (pc.isTaur()) output(" to prop your torso up");
			else output(" backwards");
			output(" on your elbows, you take your assailant in.");

			if (CodexManager.hasUnlockedEntry("Bothrioc"))
			{
				output("\n\nIt’s a bothrioc - one of the ungendered, eerily elegant spider-people you met in the Airport Embassy, many miles away. This one, though, has a predatory, hungry expression on its long, androgynous face, and it is focused entirely on you.");
				output("\n\n<i>“You’ve met my people before then, starwalker,”</i> they say, thin sword tensed in their chitinous hand. Behind their lithe body, their stuffed, glossy abdomen sways. <i>“But don’t know the really important facts, which are these: this is my territory, and that makes you my egg-bearer by right. So sit still. You will enjoy this a lot, so long as you don’t struggle.”</i>");
				output("\n\nYou doubt they are going to take no for answer.");
			}
			else
			{
				output("\n\nThe creature is lithe, bipedal, has ghostly white skin on those parts of its body that aren’t armored in gleaming, latex-like chitin. That includes their plump, spider-like abdomen, swaying behind their butt. Aside from the mass of belts around their rounded thighs they have no clothes, and your eyes are naturally drawn to where their legs meet - where there is nothing. Simply a blank stretch of soft skin.");
				output("\n\n<i>“Bothrioc detected!”</i> your codex chimes helpfully. <i>“Bothrioc are a monogendered race that are classified extremely dangerous and should be avoided where possible. A full entry has been downloaded.”</i>");
				output("\n\nThe bothrioc laughs.");
				output("\n\n<i>“Perhaps you should have done some research before venturing in here, starwalker!”</i> they say. <i>“Sit still: I will educate you.”</i>");
				output("\n\nYou doubt they are going to take no for answer.");

				CodexManager.unlockEntry("Bothrioc");
			}

			fightBothriocPidemme(true);
		}
	}
	else
	{
		if (bothriocAddiction() <= 25 || (bothriocAddiction() <= 51 && rand(2) == 0))
		{
			output("\n\nYou try and remain alert in your gloomy surroundings, scanning every object that looms into view carefully, keeping your ears pinned back for any faint sound. It doesn’t matter; the creatures down here have spent a lifetime stalking their prey from these shadows, and when the black carapaced biped bursts from their cover, whirling their bolos over their head, it’s from a direction you weren’t anticipating.");

			if ((pc.reflexes() + rand(30) + 1 > 30) || pc.isPlanted())
			{
				output("\n\nStill, you have enough wits about you to sidestep the bolos hurled at you, grab your [pc.meleeWeapon] and stab it upwards, parrying their rapier strike with a judder. You stagger backwards, taking in your assailant as they circle you.");
				output("\n\n<i>“Clever prey,”</i> croons the bothrioc, sword tense in their burnished hand, plump abdomen swaying behind them. <i>“Or should I say - fast prey. Clever prey wouldn’t prance into my territory when I have so many eggs that need bearing!”</i>");

				fightBothriocPidemme(false);
			}
			else
			{
				output("\n\nThe bolos tangle around your lower body, round weights thumping into your [pc.hips]. Instinctively you fall");
				if (pc.isTaur()) output(" down and out of the way");
				else output(" backwards");
				output(" as the bothrioc closes in and stabs at you, taking the sting out of the blow but landing you uncomfortably on your");
				if (!pc.isTaur()) output(" backside");
				else output(" side");
				output(". Struggling");
				if (pc.isTaur()) output(" to prop your torso up");
				else output(" backwards");
				output(" on your elbows, you take your assailant in.");
				output("\n\n<i>“You are in my territory, precious,”</i> the white-and-black predator says, plump abdomen swaying behind them. <i>“That makes you my egg-bearer by right, and you aren’t going anywhere now. So lie back and accept it.”</i>");

				fightBothriocPidemme(true);
			}
		}
		else if (bothriocAddiction() <= 99)
		{
			output("\n\nYou try and remain alert in your gloomy surroundings, scanning every object that looms into view carefully, keeping your ears pinned back for any faint sound. You almost don’t spot the bothrioc at first; you are anticipating a sudden burst of movement, not something laid back leisuredly on a rock. You stop with a jerk, and the two of you gaze at each other silently for a moment.");
			output("\n\n<i>“Here you are again, star-walking egg-bearer.”</i> They grin, black eyes flickering down your form. <i>“My friends and I agree: you are a fine lay. So fine, it seems a shame to attack you.”</i> One elegant chitinous leg slides down another, making a slithery, squeaking noise as the spider-being displays their stuffed, burnished abdomen to you.");
			output("\n\n<i>“Particularly when we both know you want this,”</i> they husk. <i>“So why don’t you just");
			if (!pc.isNude()) output(" take your clothes off");
			else output(" lie down");
			output(" for me? I’ll make it good for you. You know I will.”</i>");

			//If 50+ addiction, ++Lust
			if (bothriocAddiction() >= 50) pc.changeLust(5 + rand(5));
			processTime(2);

			if (pc.lust() < pc.lustMax())
			{
				clearMenu();
				addButton(0, "Accept It", standardBothriocEncounterOfferAccept);
				addButton(1, "Don’t", standardBothriocEncounterOfferRefuse);
			}
			else
			{
				clearMenu();
				addButton(0, "Next", standardBothriocEncounterOfferAccept);
			}
		}
		else
		{
			output("\n\nYou aren’t really remaining alert; your [pc.legs] are moving more or less on auto-pilot, steering you through the caverns in a direction your new instincts tell you to go. When you spot the bothrioc, laid leisurely out on a rock, it’s not really a surprise; this is where you wanted to go. This is who you wanted to meet.");
			output("\n\n<i>“Hello precious,”</i> they murmur. They move their latex-like legs together, making a slithery, squeaking noise that makes heat shoot down to your [pc.groin]. <i>“I have a need... and you have an even greater one. Do you think there’s something we might be able to do together to solve this double problem?”</i>");
			output("\n\nWithout a word, you unfasten your [pc.gear]");
			if (!pc.isNude()) output(" and bare your [pc.skinFurScales]");
			output(" for the immaculate egg-giver. When you");
			if (pc.hasKnees()) output(" get on your [pc.knees]");
			else output(" approximate a kneeling stance");
			output(" for them, submissive bliss blossoms within you. This is where you belong, and it feels...");
			output("\n\n<i>“Beautiful,”</i> whispers the pidemme, sliding off their perch and advancing on you.");

			bothriocPidemmeLossSelector(false);
		}
	}

	processTime(7+rand(3));
	IncrementFlag("BOTHRIOC_PIDEMME_ENCOUNTERED");
}

public function standardBothriocEncounterOfferRefuse():void
{
	clearOutput();
	showBothriocPidemme();

	output("With a firm set of the jaw, you draw your [pc.weapon].");
	output("\n\n<i>“Oh well,”</i> sighs the pidemme. <i>“The sex will be even better for a bit of rough and tumble beforehand.”</i> In one fluid movement they are on their feet, bolos in one set of hands and rapier in the other, advancing on you swiftly and silently.");

	processTime(2);
	fightBothriocPidemme(false);
}

public function standardBothriocEncounterOfferAccept():void
{
	clearOutput();
	showBothriocPidemme();

	output("They are right. Giving in is bliss. Contentment burgeons within you as you unfasten your [pc.gear]");
	if (pc.isNude()) output(". The bothrioc");
	else output(", baring your [pc.skinFurScales] for the egg-giver, who");
	output(" watches with a pleased, hungry smile. By the time you are completely naked and lying on your side, you feel nothing but warm peace and submissive need.");
	output("\n\n<i>“Beautiful,”</i> whispers the pidemme, sliding off their perch and advancing on you.");

	processTime(3);
	bothriocPidemmeLossSelector(false);
}

public function fightBothriocPidemme(isTripped:Boolean = false):void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new BothriocPidemme());
	CombatManager.displayLocation("BOTHRIOC");
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(bothriocPidemmePCVictory);
	CombatManager.lossScene(bothriocPidemmePCLoss);
	CombatManager.encounterTextGenerator(function():String {
		var m:String = "The pidemme’s two legs, four arms and straight antennae are armored in black chitin, flexible and burnished like latex. Elsewhere on their body, their human-like skin is ghostly white. You can clearly see this, because aside from a jumble of belts wrapped around their curvy waist, the creature is entirely naked. Perhaps this is because they feel they have nothing to hide; between their legs there is simply a blank expanse, and although they have small, black nipples, their chest is quite flat. Underneath their messy shock of "+ CombatManager.getHostileActors()[0].hairColor + " hair, their face seems to shift from masculine to feminine depending on how the dim light strikes it. Two pupil-less, tar-like eyes watch your every move.\n\nAbove their round butt and swaying with their every move, the bothrioc’s arthropod-like abdomen is covered tightly in the same austere, gleaming chitin that their limbs are. Occasionally you catch a glimpse of its wet tip; ovipositor open and ready to breed you, as soon as you give in.\n\nThe spider-being wields a rapier, a long rifle and a seemingly inexhaustible supply of bolos. They switch between them seamlessly, each of the four hands arranging itself just so to make efficient use of the weapon currently equipped.";

		return m;
	});
	
	if (isTripped)
	{
		CombatAttacks.applyTrip(pc);
	}

	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function bothriocPidemmePCLoss():void
{
	clearOutput();
	showBothriocPidemme();
	showName("DEFEAT:\nBOTHRIOC");

	if (pc.HP() <= 0)
	{
		output("Your battered body sinks to the ground, unable to stand up to the spider’s onslaught anymore. You aren’t capable of struggling when the pidemme steps forward and matter-of-factly twists you this way and that, checking your body. Once they are satisfied you aren’t going to up and die on them, they swiftly rip your [pc.gear] off, leaving you completely naked.");
	}
	else
	{
		output("That gnawing hunger inside finally bubbles to the surface. You can’t concentrate anymore, you need some sort of release. You begin blindly ripping your [pc.armor] from your body, determined to have it whether this spider helps you or not. The bothrioc simply basks in your unwitting strip show and their victory, waiting for the opportunity to take things into their many hands.");
	}

	bothriocPidemmeLossSelector(true);
}

public function bothriocPidemmeLossSelector(fromCombat:Boolean = false):void
{
	output("\n\n");

	// If we're not actually coming from combat, make an actual instance of the enemy
	// for various method calls of the scenes downrange
	if (!fromCombat)
	{
		var e:BothriocPidemme = new BothriocPidemme();
		setEnemy(e);
	}
	
	if (!pc.isPregnant(3))
	{
		bothriocPidemmeButtEggs(fromCombat);
	}
	else if (pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG) != -1)
	{
		bothriocPidemmeVagEggs(fromCombat)
	}
	else
	{
		bothriocPidemmeOralTime(fromCombat);
	}
	
	// Clear the enemy now we're done with it
	if (!fromCombat)
	{
		setEnemy(null);
	}
}

public function bothriocPidemmePCVictory():void
{
	clearOutput();
	showBothriocPidemme();
	showName("VICTORY:\nBOTHRIOC");

	if (enemy.HP() <= 0)
	{
		output("The pale creature falls to a knee before you, her (his?) chest heaving with the effort of sucking down air in the face of the onslaught you have wrought on them. Her head hangs low, averting her gaze from falling on the more dominant member of the exchange...");
	}
	else
	{
		output("The pale creatures knees disappear out from under her (him?) after a momentary final tremble of resistance. Her pale features are tinged with the slightest hue of color; the crushing lust you’ve evoked in her further evidenced by her throbbing ovipositor jutting behind her and drooling with need...");
	}

	output("The only question remaining now is how to best teach her the error of her ways.");

	clearMenu();

	if (!pc.hasCock()) addDisabledButton(0, "Dock Ovi", "Dock Ovipositor", "You’d need a cock for this.");
	else if (pc.cockThatFits(enemy.vaginalCapacity(0)) == -1) addDisabledButton(0, "Dock Ovi", "Dock Ovipositor", "You’re too big to slide into her ovipositor!");
	else addButton(0, "Dock Ovi", bothriocPidemmeDockOvi);
	
	if (pc.hasVagina()) addButton(1, "Vag Ride", bothriocPidemmeVagRide, false, "Vaginal Ride", "Their ovipositor, your pussy.");
	
	addButton(2, "Ass Ride", bothriocPidemmeVagRide, true, "Ass Ride", "Their ovipositor, your ass.");

	addButton(14, "Leave", bothriocPidemmeVictoryLeave);
}

public function bothriocPidemmeVictoryLeave():void
{
	clearOutput();
	showBothriocPidemme();
	showName("VICTORY:\nBOTHRIOC");

	if (bothriocAddiction() < 50) output("No sense in rewarding your assailant after putting her in her place.");
	else output("You have to admit to yourself that just giving the egg-giver exactly what she wanted in the first place is a tempting thought... but clearly she’s proven herself undeserving of the chance to leave you with her eggs entirely.");

	output("\n\nYou leave her to her devices, knelt amongst the cavern floors.");

	CombatManager.genericVictory();
}

public function bothriocPidemmeButtEggs(fromCombat:Boolean):void
{
	if (bothriocAddiction() >= 60 || !fromCombat)
	{
		output("Knowing what’s expected of you, you turn away from the bothrioc, and present your egg-hole for the taking,");
		if (pc.isTaur()) output(" folding your legs and lowering your bestial half");
		else output(" getting down on all fours");
		output(". You smile when you feel four hands slide down your shoulders and");
		if (pc.hairLength > 0) output(" through your [pc.hair]");
		else output(" over your scalp");
		output(", a smooth, swollen weight settling down atop you. You’re in for a long breeding.");

		output("\n\nYou next feel a chitinous hand caress your face, tracing down the jawline, onto your neck, as another encircles your [pc.breasts]. Though you two are strangers (probably? The entrancing, eerie creatures down here tend to blend into one another for you), there’s a loving familiarity to the procedure. It’s not like it’s any secret between you two that you’re attached to the attentions of the bothrioc.");

		output("\n\n<i>“Wonderful morsel...”</i> they moan, extending their ovipositor, letting the thick organ drool all over your [pc.ass] as it searches out a hole to breed, making you shiver with anticipation. <i>“So perfect for...”</i> The eggshaft tenses up and shoves itself into your [pc.asshole].");
		pc.buttChange(enemy.cockVolume(0), true, true, false);
		output(" You are well trained now in handling ovipositors, and though you coo with delight at being penetrated, it doesn’t knock the breath out of you like it once did. Well, almost. By the third or fourth ring that stretches your ass wide, the rhythmic hammering of inch after inch of eggtube being fed into your ass is still threatening to knock the breath completely out of you. The only thing keeping your breathing relatively steady is plenty of practice.");
		
		output("\n\nYou can already taste the euphoria. Your mind feels almost as though it has been short-circuited. The only thing that matters right now is enjoying this breeding as much as possible, and that in part means spurring your temporary lover onward. You " + pc.catDog("purr", "moan") + " loudly and put on a show for the victorious warrior and their long, thick, um... spear. You can immediately feel the heightened arousal in your ass, as the first spurts of slime shoot deep into your guts. The bothrioc is now actively running their many hands over you, delighting in exploring your body as much as thrusting into your hot clench.");
		
		output("\n\nA lustful groan and a sudden stoppage indicate all you need to know: The ovipositor has docked in your [pc.ass]. The bothrioc almost helplessly rests atop you, transfixed with bliss, as you feel the first egg pop through your sphincter almost effortlessly");
		if (pc.hasCock()) output(", squeezing your prostate thoroughly as it passes");
		output(". You shatter into orgasm instantly, shaking as your entire body ripples with waves of bliss,");
		if (pc.hasCock()) output(" forced to spurt your [pc.cumColor] load submissively against the ground");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.eachCunt] dribbling [pc.girlCum] freely");
		output(". Your [pc.asshole] clamps down on the massive egg tube, letting eggs through in a staccato rhythm that only serves to heighten the ecstasy to unbearable levels. Your eyes roll back, [pc.nipples]");
		if (pc.canLactate()) output(" oozing [pc.milk]");
		else if (pc.hasNippleCunts() || pc.hasLipples()) output(" throbbing");
		else output(" hardening");
		output(", squeals of total abandon are forced past your lips.");
		
		output("\n\nActing on your body’s impulse, you crane your neck up toward the supine bothrioc and plant a kiss on their cheek. Stirring in surprise, the bothrioc turns and plants a hard kiss directly on your lips. Before either of you really process the thought, you’re tongue-kissing to the hammering of your hearts and the clenching of your ass and the relentless advance of the eggs.");
		
		output("\n\nYou giggle uncontrollably between kisses, positively giddy at the radiant bothrioc’s loving ministrations and the warmth and life settling into you. Visions of ecstatic laying dance in your head, and imagining this bothrioc filling you up with eggs day after day is a thought that has you drooling a bit.");
		
		output("\n\n<i>“More,”</i> you groan out huskily, <i>“give me every egg you’ve got.”</i> The bothrioc steals another kiss with their long, powerful tongue. Eventually the need to breathe pries the two of you apart, and in between sucking in lungfuls of air, the bothrioc manages to respond.");
		
		output("\n\n<i>“You were never going to get less than what you deserve - all of them.”</i>");
		
		output("\n\nYou struggle and groan, thrusting your [pc.ass] back into the source of your happiness. Another orgasm crashes over you like a wave - it is merely an almost unbearable peak in a never-ending daze of intense fucking.");
		if (pc.hasCock())
		{
			output(" Your rigid phallus");
			if (pc.cocks.length > 1) output("es start to pour their");
			else output(" starts to pour its");
			output(" load, as it’s squeezed out by the relentless pressure of eggs on your prostate.");
			if (pc.cumQ() <= 10) output(" Only the meager drops that your body has produced and held back during this experience dribble out.");
			else if (pc.cumQ() <= 100) output(" A respectable, virile load is spent upon the ground in a long stream.");
			else if (pc.cumQ() <= 500) output(" By the time your stream of [pc.cum] fully gushes out onto the ground, you’ll have a respectable puddle.");
			else if (pc.cumQ() <= 1000) output(" The thick puddle that has already formed on the ground from your precum is just the beginning. The [pc.cum] pouring from you now would be likened by poets to a lake or sea.");
		}
		if (pc.hasCock() && pc.hasVagina()) output(" Meanwhile, y");
		// This looks dumb but trust me
		else if (pc.hasVagina()) output(" Y");
		if (pc.hasVagina())
		{
			output("our cunt");
			if (pc.vaginas.length > 1) output("s convulse");
			else output(" convulses");
			output(" as you’re driven wild by the gargantuan egg-tube cramming tight against");
			if (pc.vaginas.length == 1) output(" it");
			else output(" them");
			output(" through the thin separation. Your [pc.femCum]");
			if (pc.wettestVaginalWetness() <= 2) output(" leaks a few drops");
			else if (pc.wettestVaginalWetness() <= 3) output(" streams down your [pc.legOrLegs]");
			else output(" gushes all over yourself and the ground");
			output(", desperate to the end for just a taste of that stimulation.");
		}
		output(" The center of the orgasmic light-show going off inside you is your [pc.asshole], which spasms intensely around the pacifying egg-tube.");
		if (pc.ass.wetness() <= 0) output(" Unfortunately your thrusting is futile as the friction inside prevents your hobbled thrusts from even jostling the straining egg-stalk within, which leaves you entirely at the mercy of the bothrioc’s eggs to enhance your orgasm.");
		else if (pc.ass.wetness() < 4) output(" Thankfully, your hole is prepared for just such a situation, and with it you can slide a few inches on and off the stalk. You both shudder when your hips slam back into its abdomen. The next thrust makes you scream, as you pull out, keeping an egg trapped in your ring far longer than normal only to slam it and the one behind it through your abused sphincter in a single movement.");
		else output(" Your eternally fuck-hungry hole does not disappoint, and you find yourself able to use the bothrioc’s ovipositor as a colossal egg-beaded dildo, constantly roiling with eggs being wrung from it by the slick ministrations of your [pc.anus]. Every time you bring yourself to a new peak the bothrioc climaxes with you as your wet tailhole assiduously milks them for every egg they have.");
		
		output("\n\nEventually, you find yourself slowly coming down from a brainless bliss. For long moments all you and your dominant breeder can do is sag together in a conjoined, sweaty puddle, their breath billowing over the back of your neck, arms wrapped around your [pc.chest] and swollen belly; eventually though, the godly egg-stalk slowly retracts, leaving the ovi-fuck tunnel it and many before it have molded from your guts. You don’t mind, however, as the heavy life within you is more than comfort. You cradle your swollen belly, and you feel the familiar sense of wonder at the burgeoning warmth that drives you and the bothrioc to seek each other out. Both of you were agitated that the eggs were not where they belong; but now you can both relax in the afterglow of setting it right, at least for a time.");
		
		output("\n\nThe bothrioc groans contentedly as they finally withdraw completely from your gaped hole, and languorously reaches up to brush your [pc.hair], their enormous smile at your ear.");
		
		// Huge ass AND wet butthole AND thick hips: 
		if (pc.buttRating() >= 10 && pc.hipRating() >= 10 && pc.ass.wetness() > 0)
		{
			output("\n\n<i>“Light of the stars, egg-slut,”</i> the bothrioc whispers. <i>“I heard you farlanders can mold your bodies to your whim, but I never imagined I’d lay eggs in such a perfect");
			if (pc.tallness < 66) output(" little");
			output(", egg-ready breeder. Don’t be a stranger - I can’t wait to slide another brood into your cloaca.”</i>");
		}
		// Genderless and not-bothrioc: 
		else if (!pc.hasCock() && !pc.hasVagina() && pc.race().indexOf("bothrioc") == -1)
		{
			output("\n\n<i>“It’s good to see an egg-slut with none of those nasty extra parts. Were you born this way, farlander, or did you choose it? Did you think to yourself that the only pleasure you should have in life is our eggs as you shunned whatever was cluttering up your perfect mound? Or were you always one for the pleasures of the cloaca? Either way, you’re a beautiful incubator. Sleep well.”</i>");
		}
		// Bothrioc TF’d:
		else if (pc.race().indexOf("bothrioc") != -1)
		{
			output("\n\n<i>“I can see you’re so enamored with us that you decided to become us. So long as your cloaca is a home to eggs, you’ll be ensnared in our love no matter what you are.”</i>");
		}
		else
		{
			output("\n\n<i>“You will make a fine mother for our children, farlander. Come back once you have borne them - you have still much pleasure to bear if this barren land is to be repopulated.”</i>");
		}
		
		output("\n\nYou slip into a happy, wonderfully serene doze as the creature slips silently away.");
	}
	else
	{
		output("<i>“Our numbers have been thinned and scattered terribly by the myr war,”</i> the bothrioc says, as they bend you forward, pull your hands behind your back and truss them with a bolo. <i>“Travellers to our lands are few and heavily armed. Needs must, starwalker. You understand.”</i>");
		
		output("\n\nThey swiftly clamber atop you and straddle you, the warm, smooth weight of egg-bloated abdomen thumping into your [pc.ass]. From the sheer heftiness of it, you guess there’s good reason for the predatory creature’s urgency.");
		
		output("\n\nThe bothrioc leans against you and uses their upper arms to pin you firmly in place by the shoulders as their ovipositor slides free. You can’t see it, but you certainly can feel it - thick, warm and coated with oil, it feels ridiculously big as it slides up");
		if (pc.hasVagina()) output(" the line of your [pc.vagina]");
		else output(" your taint");
		output(" and into the crack of your ass.");

		if (flags["BOTHRIOC_PIDEMME_FUCKED"] == undefined || flags["BOTHRIOC_PIDEMME_BUTT_EGGED"] == undefined)
		{
			flags["BOTHRIOC_PIDEMME_BUTT_EGGED"] = 1;
			output(" The sheer repulsiveness of the situation makes you clench up automatically, willing yourself to be anywhere else.");
		}
		else if (flags["BOTHRIOC_PIDEMME_FUCKED"] <= 24)
		{
			output(" You’re at least used to this now, but you can’t stop your body clenching up with awful anticipation.");
		}
		// was spec'd 24-59, but theres no fallback after 59 so ¯\_(ツ)_/¯
		else
		{
			output(" A slight thrill tremors through you. Once upon a time you found this disgusting, and perhaps you still do, and yet... the forceful alienness of it fascinates you, warmth and arousal shooting through your veins in anticipation.");
		}
		
		output("\n\n<i>“Relax, precious,”</i> murmurs the athletic creature, third hand stroking the line of your jaw. <i>“This will feel wonderful for you in the course of time - I promise you that from the bottom of my hearts.”</i>");
		
		output("\n\nThe tip of their ovipositor seems to shrink down to a tiny damp spear when it finds your [pc.anus], where it begins to apply enormous pressure. In seconds, the tip forces itself inside and expands. There’s a brief delay and the organ withdraws slightly, which gives you an opportunity to breathe a sigh of relief. Immediately, that sigh of relief is choked out of you as the next segment of ovipositor slides home into your asshole, making you clutch the dirt. This is a pattern that repeats over and over, with each segment larger than the last. Slowly your asshole is stretched wider - more wet, hot pressure is placed upon your sensitive innards - and yet still the bothrioc goes on, sighing with the pure pleasure of pushing itself into you like this. Bizarrely though... you feel a little calmer and more relaxed about being reamed like this the longer it goes on, your muscles unknotting and allowing the predator to fill you even further.");
		pc.buttChange(enemy.cockVolume(0), true, true, false);

		output("\n\nThey pause the penetration for a moment, grinding their abdomen back and forth on your [pc.ass] and sawing their ovipositor in your [pc.anus] with it.");

		output("\n\n<i>“Ahh, you’re feeling it now, aren’t you, little morsel?”</i> the victorious predator says breathlessly. <i>“That calm and euphoria... I’ve been there, I know. You’ll be feeling that a lot from now on.”</i>");
		
		output("\n\nEnthused, they use their lower pair of arms to massage your [pc.chest] in slow, languid motions, all the while their upper pair hold you firmly in place.");
		if (pc.canLactate()) output(" Playing with your swollen [pc.nipples] for a few moments, the bothrioc is able to tease out a few droplets of [pc.milk], which they bring to their mouth to taste. Following on the heels of a hum of approval, you find yourself being outright milked by the bothrioc, first one teat and then the next in sequence. Every so often one hand comes up bearing some of your [pc.milk] for the thirsty spider’s drink.");
		
		output("\n\nThe alien’s thorough plundering of your ass resumes with aplomb. In your more relaxed state, you no longer find it impossible to breathe correctly; each short thrust of the alien cock still drives the wind from you, but now you can synchronize with it, and with each deep inhalation a tingling euphoria grows, a perverse physical delight at being prized apart and used like this. A moment later, the sheer chitin of the bothrioc’s abdomen shell bumps against your [pc.anus]. The thick tube buried in your ass will go no further, and the bothrioc astride you shudders. Then you feel it.");

		output("\n\nPressing against the ring of your sphincter, larger still than the largest section of the ovipositor, must be the egg. After a moment of intense resistance, forcing sweat onto your brow and a harsh gasp from your lips, it pops inside graciously. The feeling of that massive object rolling into your gut causes you to clamp down sympathetically. The bothrioc’s ragged breathing is suddenly torn apart by a low and guttural moan, no doubt from the suddenly crushing vice of your anus.");

		if (pc.hasCock())
		{
			output("\n\nThe next egg rams your prostate on the way through, hard. It’s swiftly followed by another, and another. The pressure on your boy buzzer never seems to cease - but the intensity of it ratchets up as your intestines are crammed with smooth, hard objects. Trickles of pre are forced out of [pc.eachCock], made erect by the strain.");
		}
		else if (pc.hasVagina())
		{
			output("\n\n[pc.EachVagina]");
			if (pc.wettestVaginalWetness() <= 1) output(" drips");
			else if (pc.wettestVaginalWetness() <= 3) output(" dribbles");
			else output(" floods");
			output(" in sympathy with the mistreatment of your asshole. You aren’t sure if it’s aching for the filling or for the maternal transaction taking place in your guts, but you’re acutely aware of it. As each egg pops through your abused sphincter, your love-tunnel trembles and streams a bit more [pc.femcum].");
		}

		output("\n\nYou’d normally squirm in frustration at your inability to access your privates, because the measured, inexorable fucking the bothrioc is delivering is getting you tantalizingly close. You don’t struggle though. Maybe it’s the relentless pounding of your sphincter, maybe the bothrioc grunting in ecstasy on top of you, or maybe it’s the foggy sensation settling over your mind, but you feel calm and assured. You take it on faith that your release will come.");
		
		output("\n\nWith each egg that enters you, the fuzzy euphoria grows, and your resistance to the feeling of serenity crumbles. You expect to become giddy, or otherwise lose touch with reality, but it is merely a warm happiness blanketing your thoughts. They’re fuzzier, but they’re still there and they still come perfectly. In a way, it’s worse, because with most drugs you can clearly delineate the drugged you from the sober you. You can’t help but feel that, deep down, you wanted this and it’s impossible to say if whatever the bothrioc’s eggs are doing to you is responsible. Another egg... another sympathetic clamping of your sphincter... another moan from both you and bothrioc. Repetition of the ecstatic experience of being entered, again and again, and never the hollow disappointment of the phallus departing your back passage.");

		output("\n\nOrgasm is inevitable. You aren’t entirely sure when it strikes, but it’s close to the moment you feel your stomach begin to bloat. Another egg sends you crashing through the gate of ecstasy.");
		if (pc.hasCock())
		{
			output(" Your iron-hard phallus");
			if (pc.cocks.length > 1) output("es begin to eject their");
			else output(" begins to eject its");
			output(" load, in the intense, helpless manner of a prostate orgasm.");
			if (pc.cumQ() <= 10) output(" Only the meager drops that your body has produced and held back during this experience dribble out.");
			else if (pc.cumQ() <= 100) output(" A respectable, virile load is spent upon the ground in a long stream.");
			else if (pc.cumQ() <= 500) output(" By the time your stream of [pc.cum] fully gushes out onto the ground, you’ll have a respectable puddle.");
			else output(" The thick puddle that has already formed on the ground from your precum is just the beginning. The [pc.cum] pouring from you now would be likened by poets to a lake or sea.");
		}
		if (pc.hasCock() && pc.hasVagina()) output(" Meanwhile, y");
		else if (pc.hasVagina()) output(" Y");
		if (pc.hasVagina())
		{
			output("our vagina");
			if (pc.vaginas.length > 1) output("s convulse");
			else output(" convulses");
			output(", driven wild by the gargantuan egg-tube cramming tight against");
			if (pc.vaginas.length == 1) output(" it");
			else output(" them");
			output(" through your thin inner wall. Your [pc.femcum]");
			if (pc.wettestVaginalWetness() <= 1) output(" leaks a few drops");
			else if (pc.wettestVaginalWetness() < 4) output(" streams down your [pc.legOrLegs]");
			else output(" gushes down your [pc.legOrLegs] and onto the ground");
			output(", desperate to the end for a bit of that stimulation.");
		}

		output("\n\nThe star of the orgasmic light-show going off inside you is your [pc.asshole], which spasms intensely around the massive invader. You rock your hips in a desperate bid for more sensation.");
		if (pc.ass.wetness() <= 0) output(" But the friction inside prevents your hobbled thrusts from even jostling the straining egg-stalk within, leaving you entirely at the mercy of the bothrioc’s eggs to enhance your orgasm, making you desperate for each fresh bumpy weight. Each egg that passes through seems to begin your orgasm anew.");
		else if (pc.ass.wetness() < 4) output(" Thankfully, your hole is prepared for just such a situation, and with it you can slide a few inches on and off the stalk. At first the bothrioc thinks you’re trying only now to escape, and gives an irritated bark until your hips slam back into its abdomen, causing you both to shudder. The next thrust makes you scream, as you pull out, keeping an egg trapped in your ring far longer than normal only to slam it and the one behind it through your abused sphincter in a moment.");
		else output(" Your eternally fuck-hungry hole does not disappoint, and you find yourself able to use the bothrioc’s ovipositor as a colossal egg-beaded dildo, constantly roiling with eggs being wrung from it by the slick ministrations of your [pc.anus]. Every time you bring yourself to a new peak the bothrioc climaxes with you as your wet tailhole assiduously milks them for every egg they have.");

		output("\n\nFinally the bothrioc is spent of their enormous burden of eggs - a fact you’re only too aware of, due to the newly engorged state of your [pc.stomach]. The organ finally retracts, leaving your guts feeling hollow, despite the new load weighing you down. Once they’ve extricated themselves from your [pc.ass] the bothrioc adjusts their grip on you to whisper into your ear:");

		//Pick randomly from available options, don’t play last option if any others are available.
		if (bothriocAddiction() >= 30)
		{
			output("\n\n<i>“You’re already well on your way to becoming a broodmother, precious. I see even that thought sending shivers down your spine. Don’t fret; we love you, and we want to care for you the same as you care for our children. You’ll know when you’re ready.”</i>");
		}
		else if (pc.ass.wetness() >= 4)
		{
			output("\n\n<i>“That breeding hole of yours is better than any cloaca I’ve had. You weren’t merely born for this; you were made for this.”</i>");
		}
		else if (pc.buttRating() >= 10)
		{
			output("\n\n<i>“Such a plush [pc.ass]. Why, you’re so comfortable I could just lie here and lay eggs in you all day. Unlucky us that I have places to be.”</i>");
		}
		else
		{
			output("\n\n<i>“You did well. Hopefully you’ll raise our children as well as you milked me for my eggs.”</i>");
		}

		output("\n\nThe bolos are slipped off your hands. Presumably the creature leaves, although you don’t hear them doing so. You lie there for several long minutes, simply cradling your egg-swollen [pc.stomach]. You’re hardly able to think or move, and the weight settled inside you makes you feel more soporific than uncomfortable. It is only after some minutes of a strange, peaceful doze that you clamber back to your [pc.feet] and limp over to where your [pc.gear] was flung.");
	}

	IncrementFlag("BOTHRIOC_PIDEMME_FUCKED");

	processTime(25 + rand(10));
	pc.loadInAss(enemy);
	pc.orgasm();

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

public function bothriocPidemmeVagEggs(fromCombat:Boolean):void
{
	var vagIdx:int = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
	var vagTag:String = "[pc.vagina "+ vagIdx +"]";
	var totalOtherVagPregs:int = pc.totalWombPregnancies();

	if (bothriocAddiction() >= 60 || !fromCombat)
	{
		output("Knowing what’s expected of you, you turn away from the bothrioc, and present your [pc.ass] for the taking,");
		if (pc.isTaur()) output(" folding your legs and lowering your bestial half");
		else output(" getting down on all fours");
		output(". You shiver with anticipation when you feel four hands slide down your shoulders and");
		if (pc.hairLength > 0) output(" through your [pc.hair]");
		else output(" over your scalp");
		output(", a smooth, swollen weight settling down atop you. Your whole body keens for the long, hard breeding it’s about to take.");

		output("\n\n<i>“Very nice, little one,”</i> the bothrioc laughs, stroking the side of your face fondly. <i>“But I notice we have a slight problem...”</i> another pair of hands find your [pc.belly] and stroke the swollen curve with soothing, circular motions. <i>“It seems someone got to you beforehand. One of my friends? A mean old nyrea?”</i> You feel the warm, oily touch of the bothrioc’s ovipositor, gently sliding between the cheeks of your [pc.ass], shrinking itself down to a small tip, teasing your [pc.anus] for a moment... then slithering further down, across the sensitive skin of your taint to touch the labia of your "+vagTag+". You gasp slightly as it rides over your [pc.clit "+ vagIdx +"], making it tingle with pleasure.");
		
		output("\n\n<i>“Fortunately for us you’re a very dedicated little egg-slut, and have provided other breeding hole");
		if (pc.vaginas.length > 1) output("s");
		output(" for me to fill. Would you like that?”</i> Their voice descends to a low croon, hot air in your [pc.ear] as that incredibly dexterous ovipositor of theirs plays with your [pc.vaginaColor "+ vagIdx +"] lips, sending unbearable arousal snaking through you. <i>“For me to stuff your other hole so you can barely move for new life, all yours to bear?”</i>");
		
		output("\n\n<i>“More than anything,”</i> you moan, with all your heart.");
		
		output("\n\n<i>“Very well...”</i>");
		
		output("\n\n");
		if (pc.vaginas[vagIdx].looseness() <= 2) output("After a moment’s resistance");
		else output("With ease");
		output(" the oiled tip of their ovipositor slips between the lips of your pussy, reaching into your tender, moist insides. It feels small for all of a moment - you gasp and");
		if (pc.isTaur()) output(" shiver uncontrollably");
		else output(" clutch the dirt");
		output(" as the first segment spreads you wide, stuffing the mouth of your cunt quite full. The thing is like an obscenely long, bumpy, well-lubricated dildo, one its owner takes vocal, groaning pleasure in pushing into your "+vagTag+", segment after segment. Every bump that makes its way inside ramps up the unadulterated ecstasy you feel - the vague hollowness and neediness replaced with glorious, gorged gratification. This is where you belong; this is where you most at peace. [pc.girlCum] and warm bothrioc oil ooze freely down your");
		if (pc.vaginas.length == 2) output(" other pussy");
		else if (pc.vaginas.length > 2) output(" other pussies");
		else if (pc.hasCock()) output(" semi-erect cock");
		else output(" your [pc.thighs]");
		output(". You moan as your cunt clenches up, willing more of the creature’s fantastic egg cock into you.");
		pc.cuntChange(vagIdx, enemy.cockVolume(0), true, true, false);
		
		output("\n\n<i>“It’s wonderful, isn’t it farlander?”</i> sighs the bothrioc, tenderly stroking the line of your jaw at the same time as holding you firmly in place. The tip of the ovipositor presses against your cervix; you feel nothing but an intense wish for it to fill you further, to insert its oil and love into every cell of your being. <i>“Now you have accepted where your place is. You’ll carry that message into the stars, won’t you? So these caves are filled with sexy, pliant farlanders like you...”</i> it coos into your ear as the tip narrows down into a small tip again and then gently penetrates your cervix. Only the powerful, subliminal directive to completely relax stops you from clenching up with glee.");
		
		output("\n\n<i>“Very well done,”</i> they whisper once they are fully inside, ovipositor pulsating up every inch of your cunt to reach right up into your womb. The burnished carapace of its abdomen is pressed down on your [pc.ass], and you catch your breath when you feel it tense up. <i>“Here is your reward...”</i>");
		
		output("\n\nThe first egg stretches your pussy lips so wide you think it’s not going to fit; when it finally does pressure its way into your tunnel you cum right there and then,");
		if (pc.isTaur()) output(" clenching your fists");
		else output(" clutching the floor");
		output(" as your body rocks with waves of ecstasy,");
		if (pc.vaginas[vagIdx].wetness() <= 3) output(" oozing");
		else output(" gushing");
		output(" [pc.girlCum] around the bulbous penetration. The sensation is made all the more intense by the relentless passage of the smooth, round object, powered up your tunnel by your own clenches and then deposited heavily in your womb. You are not allowed a chance to catch your breath; another egg wedges into your opened labia, shoved inside by the pressure of the next, and the next, and the next...");
		
		output("\n\nThe series of orgasms you are made to endure are intensified by the four roving hands of the bothrioc. Caught in their own intense gratification, they");
		if (pc.biggestTitSize() >= 4) output(" press their fingers deep into your plush boobs and");
		if (!pc.hasFuckableNipples()) output(" squeeze");
		else output(" finger");
		output(" your [pc.nipples]");
		if (pc.canLactate()) output(" until [pc.milk] runs freely down your [pc.chest]");
		output(", forgoing the opportunity to lock you in position to instead slip smooth, armored fingers between your [pc.lips], where you bite down on them whenever an egg opens up your pussy lips and makes you arch your back in pleasure. It is made all the more intense by how stuffed with children-to-be your guts");
		
		if (totalOtherVagPregs > 1) output(" and other pussies are");
		else if (totalOtherVagPregs == 1) output(" and other pussy is");
		else output(" are");

		output("; as your womb swells with heavy promise, it presses against the pregnant load");
		if (totalOtherVagPregs >= 1) output("s");
		output(" you’re already carrying, utterly bloating with dense alien pregnancy.");
		
		if (pc.buttRating() >= 10)
		{
			output("\n\n<i>“It is good to see you have developed a perfect ass for breeding, farlander,”</i> groans the bothrioc, their supple hips and backside bounce energetically on your [pc.ass]. <i>“Would that I could sit on a cushion like this and give you eggs all day long...”</i>");
		}
		else if (pc.canLactate())
		{
			output("\n\n<i>“You produce now? Like the golds,”</i> groans the bothrioc, withdrawing a hand from your [pc.chest] to admire the [pc.milk] rolling down their fingers. They seize your [pc.nipples] hard, and you whine as [pc.milkColor] fluid sprays freely from your tender");
			if (!pc.hasFuckableNipples()) output(" nubs");
			else output(" openings");
			output(". <i>“Good. I’d hate for our children to go hungry...”</i>");
		}
		else
		{
			output("\n\n<i>“Just a few more, precious, don’t worry...”</i> groans the bothrioc, their supple hips and backside bounce energetically on your [pc.ass]. <i>“You’ve been ever so good, and my eggs will do wonderful things for you - I promise.”</i>");
		}
		
		output("\n\nAt long last, the production line of round, firm ovals being funnelled into your "+vagTag+" comes to an end - the last egg is squeezed into your utterly stuffed womb, and you moan woozily as the bothrioc withdraws its ovipositor by degrees, dragging its oily, bulbous length along you tender, throbbing walls. It rests for a moment on your back, its two hearts thumping against your [pc.skinFurScales], before finally retracting it out of your well-gaped pussy, leaving a trail of mixed oil and femcum up the crack of your [pc.ass]. They turn you over and you share a tender, sweaty embrace, their hard, smooth lips pressing against yours.");
		
		output("\n\n<i>“What a fine egg-slut you have turned out to be,”</i> they whisper into your mouth. Regret tinges their tone of profound satisfaction and affection. <i>“If only I had the home and resources to look after you permanently, farlander. One day, maybe...”</i>");
		
		output("\n\nThey slowly break their four-armed embrace and slip away. You lie there for several long minutes, unable to do anything but cradle your swollen midriff, utterly stuffed from back to front with alien spawn. You aren’t able to think or move, and don’t want to: you simply lie there and enjoy the wonderful, swollen warmth and peace that pulses right through you. It is only after some minutes of that violent-flavoured doze that you clamber back to your [pc.feet] and wobble over to where your [pc.gear] was flung.");
	}
	else
	{
		output("<i>“Our numbers have been thinned and scattered terribly by the myr war,”</i> the bothrioc says, as they bend you forward, pull your hands behind your back and truss them with a bolo. <i>“Travellers to our lands are few and heavily armed. Needs must, farlander. You understand.”</i>");
		
		output("\n\nTheir curt tone dissolves into amused laughter a moment later when, after straddling you and using one pair of hands to hold you by the shoulders, another pair of chitin-gloved hands touch your lightly bulging belly.");
		
		output("\n\n<i>“You DO understand! Is this the work of one of my friends? Or did some mean old nyrea get to you first?”</i> You shiver as the smooth weight of the creature’s bulging abdomen rests down on top of your back, their hands describing soothing circles over your swollen stomach. <i>“Whatever the case, it’s nice to know you’re... accommodating, farlander. That will serve you well, as we change you into a perfect little incubator...”</i> they sigh dreamily, and at last you feel the warm, oily touch of the bothrioc’s ovipositor, gently sliding between the cheeks of your [pc.ass].");
		
		output("\n\n<i>“It does leave us a bit of a problem though, precious. I NEED to lay some eggs, but it feels like your cloaca is stuffed to the gills.”</i> The egg-tube shrinks itself down to a small tip, teasing your [pc.anus] for a moment... and then it slithers further down, across the sensitive skin of your taint to touch the labia of your "+vagTag+". You gasp slightly as it rides over your [pc.clit], making it tingle with pleasure. <i>“Fortunately for us, it seems you have other hole");
		if (pc.vaginas.length > 1) output("s");
		output(" to fill. Are you like the red myr - or more like those luscious males the nyrea keep tucked away? It doesn’t matter. As said, farlander... needs must.”</i> ");
		
		output("\n\n");
		if (pc.vaginas[vagIdx].looseness() <= 2) output("After a moment’s resistance");
		else output("With ease");
		output(" the oiled tip of their ovipositor slips between the lips of your pussy, reaching into your tender, moist insides. It feels small for all of a moment - you gasp and");
		if (pc.isTaur()) output(" shiver uncontrollably");
		else output(" clutch the dirt");
		output(" as the first segment spreads you wide, stuffing the mouth of your cunt quite full. The thing is like an obscenely long, bumpy, well-lubricated dildo, one its owner takes vocal, groaning pleasure in pushing into your "+vagTag+", segment after segment. Strangely though, the more they manage to reach into your wet hole, the calmer and more relaxed you are about it. Wonderful pleasure radiates out from your female sex, and it feels like the more you unwind and let the spider-being have their way with you, the more gratification you get from it. After a few moments, [pc.girlCum] and warm bothrioc oil ooze freely down your");
		if (pc.vaginas.length == 2) output(" other pussy");
		else if (pc.vaginas.length > 2) output(" other pussies");
		else if (pc.hasCock()) output(" semi-erect cock");
		else output(" your [pc.thighs]");
		output(" from your stuffed cunt. You moan as it clenches up, willing more of the creature’s fantastic egg cock into you.");
		pc.cuntChange(vagIdx, enemy.cockVolume(0), true, true, false);
		
		output("\n\n<i>“It’s wonderful once you let go, isn’t it farlander?”</i> sighs the bothrioc, tenderly stroking the line of your jaw at the same time as holding you firmly in place. The tip of the ovipositor presses against your cervix; it has you utterly filled. <i>“Once you accept where your true place is. Just a little more, precious... think soft thoughts...”</i> it coos into your ear as the tip narrows down again and then gently penetrates your cervix. You don’t feel pain; the sheer oiled relaxation the bothrioc has poured into you makes you will it on, anything for another inch of that wonderful, full sensation.");
		
		output("\n\n<i>“Very well done,”</i> they whisper once they are fully inside, ovipositor pulsating up every inch of your cunt to reach right up into your womb. The burnished carapace of its abdomen is pressed down on your [pc.ass], and you catch your breath when you feel it tense up. <i>“Now comes the really good part...”</i>");
		
		output("\n\nThe first egg stretches your pussy lips so wide you think it’s not going to fit; when it finally does pressure its way into your tunnel you cum right there and then,");
		if (pc.isTaur()) output(" clenching your fists");
		else output(" clutching the floor");
		output(" as your body rocks with waves of ecstasy,");
		if (pc.vaginas[vagIdx].wetness() <= 3) output(" oozing");
		else output(" gushing");
		output(" [pc.girlCum] around the bulbous penetration. The sensation is made all the more intense by the relentless passage of the smooth, round object, powered up your tunnel by your own clenches and then deposited like a prize in your womb. You are not allowed a chance to catch your breath; another egg wedges into your opened labia, shoved inside by the pressure of the next, and the next, and the next...");
		
		output("\n\nThe series of orgasms you are made to endure are amplified by the four roving hands of the bothrioc. Caught in their own intense gratification, they");
		if (pc.biggestTitSize() >= 4) output(" press their fingers deep into your plush boobs and");
		if (!pc.hasFuckableNipples()) output(" squeeze");
		else output(" finger");
		output(" your [pc.nipples]");
		if (pc.canLactate()) output(" until [pc.milk] runs freely down your [pc.chest]");
		output(", forgoing the opportunity to lock you in position to instead slip smooth, armored fingers between your [pc.lips], where you bite down on them whenever an egg opens up your pussy lips and makes you arch your back in pleasure. It is made all the more intense by how stuffed with children-to-be your guts");

		if (totalOtherVagPregs > 1) output(" and other pussies are");
		else if (totalOtherVagPregs == 1) output(" and other pussy is");
		else output(" are");
		output("; as your womb swells with heavy promise, it presses against the pregnant load");
		if (totalOtherVagPregs >= 1) output("s");
		output(" you’re already carrying, utterly bloating with dense alien pregnancy.");
		
		if (pc.buttRating() >= 10)
		{
			output("\n\n<i>“Such a perfect ass you have for breeding, farlander,”</i> groans the bothrioc, their supple hips and backside bounce energetically on your [pc.ass]. <i>“Would that I could sit on a cushion like this and give you eggs all day long...”</i>");
		}
		else if (pc.canLactate())
		{
			output("\n\n<i>“Ah... you produce? Like the golds,”</i> groans the bothrioc, withdrawing a hand from your [pc.chest] to admire the [pc.milk] rolling down their fingers. They seize your [pc.nipples] hard, and you whine as [pc.milkColor] fluid sprays freely from your tender");
			if (!pc.hasFuckableNipples()) output(" nubs");
			else output(" openings");
			output(". <i>“Good. I’d hate for our children to go hungry...”</i>");
		}
		else
		{
			output("\n\n<i>“Just a few more, precious, don’t worry...”</i> groans the bothrioc, their supple hips and backside bounce energetically on your [pc.ass]. <i>“You’ve been ever so good, and my eggs will do wonderful things for you - I promise.”</i>");
		}
		
		output("\n\nAt long last, the production line of round, firm ovals being funnelled into your "+vagTag+" comes to an end - the last egg is squeezed into your utterly stuffed womb, and you moan woozily as the bothrioc withdraws its ovipositor by degrees, dragging its oily, bulbous length along your tender, throbbing walls. They rest for a moment on your back, their two hearts thumping against your [pc.skinFurScales], before finally retracting it out of your well-gaped pussy, leaving a trail of mixed oil and femcum up the crack of your [pc.ass].");
		
		output("\n\n<i>“Whew! You can’t imagine the relief, getting those out of my system, farlander,”</i> the spidery creature whispers in your [pc.ear]. <i>“I only wish I could run into such a loving, maternal breed-machine like you every day of the week.”</i>");
		
		output("\n\nThe bolos are slipped off your hands and their weight lifts off your back. Presumably the creature leaves, although you don’t hear them doing so. You lie there for several long minutes, unable to do anything but cradle your swollen midriff, utterly stuffed from back to front with alien spawn. You’re hardly able to think or move, and the weight settled inside you makes you feel more soporific than uncomfortable. It is only after some minutes of a strange, peaceful doze that you clamber back to your [pc.feet] and wobble over to where your [pc.gear] was flung.");
	}

	IncrementFlag("BOTHRIOC_PIDEMME_FUCKED");

	processTime(25 + rand(10));
	pc.loadInCunt(enemy, vagIdx);
	pc.orgasm();

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

public function bothriocPidemmeOralTime(fromCombat:Boolean):void
{
	if (bothriocAddiction() >= 60 || !fromCombat)
	{
		output("<i>“Well now, precious,”</i> murmurs the bothrioc, lying themselves down on top of your back, <i>“let’s have a feel of you.”</i> They don’t tie your hands, but you make no attempt to fight them off - just the touch of the heavy, juicy weight of their sheer black abdomen on your [pc.butt] sends a shiver of pure delight up your spine, making you feel unfocused and pliant. Slender hands touch your rounded belly, describing comforting, round movements over the taut skin. Soft laughter tinkles in your [pc.ears].");

		output("\n\n<i>“I should have guessed. A nice, eager incubator strolls into my territory, ready to please - of course somebody got to you before me.”</i>");
		if (pc.hasVagina()) output(" Smooth fingers find your [pc.vagina], stroking your puffy labia. When the bothrioc speak next, it’s in a tone of aroused wonder. <i>“Bearing multiple broods, farlander? Yours must be a very receptive and eager kind. There are more of you, right? I could use more than one...”</i>");
		output(" They sigh heavily.");

		output("\n\n<i>“I’m sorry!”</i> you wail. <i>“It’s just that...”</i> An elegant, chitinous digit touches your [pc.lips].");
		
		output("\n\n<i>“I know, I know,”</i> laughs the bothrioc. <i>“You can’t help");
		if (!pc.hasKnees()) output(" kneeling down");
		else output(" getting on your [pc.knees]");
		output(" and presenting yourself for anything you run into that needs to breed. Nobody’s blaming you for who you are, sweet incubator.”</i> They stroke the line of your jaw silently for a while, and you get lost in the comforting movement, craning your chin so that they can stroke the sensitive [pc.skin] on your neck. <i>“Tell you what,”</i> they whisper,");
		if (pc.biggestTitSize() <= 1) output(" other hands drifting down your chest to touch your [pc.nipples]");
		else output(" other hands drifting down to cup your [pc.breasts] and knead them");
		output(", <i>“would you like a suckle? I can hold myself back - for you.”</i>");
		
		output("\n\nYou find yourself blushing from the kindness of the egg-giver, and the warmth you can feel throbbing between you.");
		
		output("\n\n<i>“Would you really mind - ?”</i> The bothrioc shifts themselves upwards, deliberately dragging the heavy weight of their abdomen up your spine, and arranges themselves in front of you so they are sitting on top of that black, shiny teardrop, The distended, violet hole winks at you wetly, the tip of their pent-up ovipositor clear to see.");
		
		output("\n\n<i>“Of course not, precious,”</i> they smile. <i>“Open wide.”</i> The purple tip presses insistently against your [pc.lips], and with a sigh of pure pleasure you do exactly what they say.");
		
		output("\n\nIt’s a little softer on the surface, perhaps, than a cock; beneath the skin though it’s a bulbous tube of restless muscle that reacts to the rubbing of your lips and tongue across it by bunching up and thrusting deeper into your maw. It’s heaven, in other words, and you gladly stretch your jaw to get the first big, round segment into your mouth, tightening your cheeks around it assiduously, so that when the bothrioc draws it back it leaves your lips with a distinct “pop”. Then it comes back, slathered with a fresh payload of oil to smear and drool across your [pc.lips], dribbling down your chin.");
		
		output("\n\nYou eagerly swallow the slightly numbing, coating substance, relish it dollop into your stomach, and embrace the warm fuzz which engulfs you; stretching out from your head to join hands with the glow that pulses from your core so that you are a being of total, sensual, submissive lust, overcome with bliss at abasing yourself in front of the alien creature and pleasuring their strange, long egg-stalk. In to the back of your throat, suck... out, dragging your lips and [pc.tongue] along the bulbous tube. In to the back of your throat, suck... swallow, coo as the lubricant coats a fresh layer of tenderness over your [pc.skinFurScales]. The fact that");
		if (pc.hasCock()) output(" [pc.eachCock] is rock hard, readily dripping pre");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.eachVagina] is sopping wet, spread and waiting to be taken");
		output(" is almost a side note; it’s at your mouth that you are taking the most enjoyment.");

		output("\n\nThe only thing which seems to matter is making the experience better for the egg-giver, because it seems every time you draw a groan of pleasure from their lips, every time you make them thrust into your mouth a little harder, a blurry wave of ecstasy washes right through you. You reach out and stroke the latex-like sheen of their abdomen, willing them to give you more.");
		if (pc.hasLongTongue()) output(" You wrap your lithe, flexible tongue around the ovipositor, squeezing and rubbing the segments all the way up to the opening.");
		output(" You tongue the inside of the dilated tube, moving your head this way and that so you can flick at the sensitive inner flesh, making the bothrioc cry out with pleasure, one pair of hands clutching your head whilst the other two play with their tiny black nipples.");
		
		output("\n\n<i>“You are amazing, precious,”</i> they attest throatily, stroking behind your [pc.ear]. <i>“No wonder everything wants to breed you... a mouth and a will to please like yours needs to be given to the next generation, a thousand times over--”</i> Unable to contain themselves any further, they thrust their thick, purple egg-stalk in deep, sinking straight down into your throat. The overwhelming sensation you feel at being taken like this, your air-flow blocked by the bothrioc’s oil-slicked urge, is one of deep arousal, your [pc.nipples]");
		if (!pc.hasFuckableNipples()) output(" hardening up instantly");
		else output(" drooling arousal freely");
		output(". A small whimper of joy is the first sound out of your mouth when the bothrioc retracts themselves, your [pc.lips] and [pc.tongue] dragging along their bulging ovipositor all the way. They respond by pumping straight back into your throat even harder, delivering a gobbet of oil straight to your stomach.");
		
		output("\n\nThe lithe spider-being throat-fucks you for... well, it doesn’t matter. For as long as they want. You’re just happy to be of such gleeful, glorious use, your mouth and oesophagus the worshipful sleeve into which the wonderful, thick egg-stalk can imperiously thrust into again and again, slickened with the oil that makes everything so clear, so peaceful. At some point you orgasm;");
		if (pc.hasCock()) output(" [pc.cum] spurts over your [pc.belly] and the ground from your deliriously flexing [pc.cock]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.femCum] soaks your [pc.thighs], leaking from your clenching [pc.vagina]");
		output(". Maybe you do it multiple times. It doesn’t matter. What matters is pleasuring the wonderful, strong, kind dominant with your wet, needy face-cunt.");
		
		output("\n\nThe bothrioc’s frenzy of arousal grows to the point that, their black eyes locking with yours, you fuzzily worry that they are going to forget themselves and impregnate your stomach anyway. Would that be so bad? You could take it, you’re sure... the very moment that thought occurs though, they retract themselves slowly from your face, trailing clear lubricant as they go. You let their tip go with a teasing smack of your lips, panting hard but happily, uncaring of the amount of drool and alien fluid that have liberally painted your face.");
		
		output("\n\n<i>“No... I can hold myself back,”</i> purrs the bothrioc, thin chest heaving, admiring the view below them as they retract their ovipositor entirely. <i>“You’ve had enough of the gift for today, and I can always find someone else to take my eggs. What to do you say, precious?”</i>");
		
		output("\n\n<i>“Thank you, egg-giver,”</i> you chime, giving them a big, oil-slathered smile. They gather you up in their four arms and give you a long, tender squeeze, hot against their flat, white chest.");
		
		output("\n\n<i>“You are very welcome,”</i> they breathe in your ear. <i>“Come and find me once you have borne your current clutch. A precious brood queen like you should never be without a full, teeming belly.”</i>");
		
		output("\n\nThey lay you down gently and depart silently. You’re too exhausted and unfocused under the fuzz of bothri-oil to do anything but lie there and doze for a little while. Eventually, with a slight feeling of regret that nothing else has found you, twisted your body this way and that and rammed themselves into your tender holes as they please, you wipe your face clean, find your gear, and press on.");
	}
	else
	{
		output("<i>“Our numbers have been thinned and scattered terribly by the myr war,”</i> the bothrioc says, as they");
		if (pc.isTaur()) output(" lay you down");
		else output(" bend you forward");
		output(", pull your hands behind your back and truss them with a bolo. <i>“Travellers to our lands are few and heavily armed. Needs must, farlander. You understand.”</i>");
		
		output("\n\nTheir curt tone dissolves into amused laughter a moment later when, after straddling you and using one pair of hands to hold you by the shoulders, another pair of chitin-gloved hands touch your");
		if (pc.bellyRating() < 20) output(" lightly");
		else if (pc.bellyRating() > 50) output(" heavily");
		output(" bulging belly.");
		
		output("\n\n<i>“You DO understand! Is this the work of one of my friends? Or did some mean old nyrea get to you first?”</i>");
		if (pc.hasVagina()) output(" Smooth fingers find your [pc.vagina], stroking your puffy labia. When the bothrioc speak next, it’s in a tone of aroused wonder. <i>“Bearing multiple broods, farlander? Yours must be a very receptive and eager kind. There are more of you, right? I could use more than one...”</i>");
		output(" You shiver as the smooth weight of the creature’s bulging abdomen rests down on top of your back, their hands describing soothing circles over your swollen stomach. <i>“Whatever the case, it’s nice to know you’re... accommodating, farlander. That will serve you well, as you’re changed into a perfect little incubator.”</i>");
		
		output("\n\nThey sigh dreamily, before slowly working their way upwards, deliberately dragging that latex-covered weight up your spine. You look up blearily to find they have turned around to face you, sitting down on top of their abdomen with legs splayed, its tip a few inches away from your face. The distended, violet hole winks at you wetly, the tip of their pent-up ovipositor clear to see.");
		
		output("\n\n<i>“It does leave us a little bit of an issue though, farlander,”</i> husks the bothrioc, gazing down at you, four hands moving up and down their flat, lissom front in a sensual dance of fingers. <i>“I’ve got eggs to plant, but being the sort of person that bends that");
		if (pc.buttRating() < 10) output(" cute little");
		else output(" big fat");
		output(" ass over for anything that feels a need to breed, you can’t take any more. Poor luck for me...”</i> They don’t look disappointed; far from it. Their black eyes flit over your prone form with naked lust. Their abdominal slit dilates and the violet tip of their ovipositor slides its way out, a thick, bulbous member utterly slathered in oil. It bumps against your [pc.lips] and you wince automatically; it is utterly, obscenely alien.");
		
		output("\n\n<i>“Hmm yes,”</i> hums the bothrioc, half with lust and half with affirmation. <i>“Eager incubator or not, you don’t have the right frame of mind yet, do you? So I will do my bit for the greater good. No eggs will be planted today, but you shall have plenty of my oil. Once you’ve had enough,”</i> they say, gazing into your [pc.eyes] with their half-lidded black orbs, <i>“everything will become much clearer, much easier for you. I promise you that precious, from the bottom of my hearts.”</i>");
		
		output("\n\nYou can’t see any way out of this; you are utterly beaten and your hands are securely tied behind your back.");
		if (bothriocAddiction() <= 24) output(" Maybe if you just don’t think about it...");
		else output(" The warm glow inside of you helps; you find if you sink yourself into that and relax, this doesn’t seem so bad at all...");
		output(" The purple tip bumps insistently against your lips, and closing your eyes you open up and accept the warm, oil-slathered ovipositor past your teeth.");
		
		output("\n\nIt’s a little softer on the surface, perhaps, than a cock; beneath the skin though it’s a bulbous tube of restless muscle that reacts to the rubbing of your lips and tongue across it by bunching up and thrusting deeper into your maw. The first big, round segment stretches your mouth quite wide - and then it retracts, slipping back inside the bothrioc momentarily. Then it’s back, slathered with a fresh payload of oil to smear and drool across your [pc.lips], the walls of your mouth and dribble down your chin. The bothrioc groans with pleasure, one pair of hands holding your head whilst the other two busy themselves on their tiny, black nipples, as you stoically loosen your jaw and accept the bulging segment whole.");
		
		output("\n\nThe process repeats itself; the spider-being extends their big, purple ovipositor into your mouth, each time a little deeper, and then draws all the way back, so that when they next push inside there’s another generous coating of bothri-oil to slather all over you.");
		if (bothriocAddiction() <= 24) output(" You do your best to avoid swallowing it - their ulterior motive has to be denied - but you have to let some of it slide down your throat, to avoid choking. Steadily you find yourself relaxing despite yourself, a warm, calming buzz settling over you, and it becomes easier and easier to lose yourself to the rhythm of pleasuring the egg-beast. Holding onto your disgust seems pointless. If the creature wishes to make this more manageable for you, why should you fight it? You swallow a little more of the warm, slightly numbing fluid peaceably.");
		else output(" Your initial disgust fades as you let the warm, slightly numbing fluid slide down your throat almost by instinct, and an enjoyable, unfocused buzz settles over your perception. You don’t like the egg-beast making you do this (don’t you?), however you may as well let the oil do its business and relax you, so that this bizarre oral can go quickly and painlessly.");
		
		output("\n\n<i>“Yes precious,”</i> says the bothrioc, looking down at you closely, <i>“it’s not so bad, is it? Not when you let go. Open wide...”</i> they arch their head back and sigh as they push their ovipositor in deep, straining your lips and touching the back of your throat with it. Such is the state of your relaxation now that no urge to choke occurs. Indeed, you clamp your cheeks around it, intent on drawing off the lube and intensifying the happy little cloud that is settling over your mind.");
		
		output("\n\n<i>“Mmm...”</i> they groan as they retract again, the slick bumps riding over your [pc.tongue]. <i>“I can tell you’ve had plenty of experience. Did you");
		if (pc.hasKnees()) output(" get on your [pc.knees] and");
		else output(" kneel and");
		output(" polish the egg-stalk of whatever stuffed you full of their young? Before and after, probably.”</i> The blush on your cheeks matches the high color you can see blossoming on their own chalk-white features, oil oozing freely down from their abdominal opening. Your oral, and the sight of your body, plump with life, is working them up. <i>“Think open thoughts, brood queen,”</i> they urge. <i>“I want to feel every inch of your ripe touch.”</i>");
		
		output("\n\nThis time, when the ovipositor thrusts itself past your lips, fills your mouth and touches the back of your throat, it doesn’t stop. The relaxation the creature has imbued you with is such that suppressing your gag reflex is a cinch; you simply open wide and feel the bulbous tube stretch down your oesophagus, its segments bulging your neck, lustrous oil drooling down your chin. The bothrioc moans with pure delight, two hands clutching the sides of their thin face, almost the entire extent of their sex shoved into your face. Just as stars begin to take over your vision it retracts outwards so that only the first segment is widening your lips, allowing you to take a big gulp of air. Then they thrust themselves back down that tight passageway they’ve claimed as their own.");
		
		output("\n\nThe utterly obscene sounds of a thick, bulbous, oily ovipositor funnelling itself in and out of your throat fill the cavern, lubricant dripping down thickly from your chin onto the dirt. The bothrioc violates you with increasing passion, the smooth bulges of their violet egg-tube pushing past your tonsils and stretching your throat forcefully. If it weren’t for the being’s copious fluids it would be a deeply unpleasant experience. With, it simply is something you have to do, calmly and blithely. If you hollow your cheeks around the creature’s length they groan with ecstasy, and the encompassing buzz seems to intensify, gratifying you and making you feel pleased, soft and eager to be used as a receptacle for the dominant’s lust.");
		
		output("\n\nThe bothrioc’s frenzy of arousal grows to the point that, their black eyes locking with yours, you suddenly worry that they are going to forget themselves and impregnate your stomach anyway. The very moment that thought occurs though, they retract themselves slowly from your face, trailing clear lubricant as they go. You cough, [pc.tongue] hanging out and pant, uncaring of the amount of drool and alien fluid which dribbles downwards.");
		
		output("\n\n<i>“No... I can hold myself back,”</i> purrs the bothrioc, thin chest heaving, admiring the view below them. <i>“You’ve had enough of the gift for today, and I can always find someone else to take my eggs.”</i> Once their ovipositor is entirely holstered, they climb back on top of you, enjoying the touch of your [pc.skinFurScales] as they untie your hands. <i>“For now, anyway,”</i> they whisper in your ear. <i>“Find me once you have borne your current clutch, precious. A breeding queen-in-training like you should never be without a round belly teeming with spawn.”</i>");
		
		output("\n\nThey lift themselves off you and leave silently. You’re too exhausted and unfocused under the fuzz of bothri-oil to do anything but lie there and doze for a little while. Eventually the nagging thought of something else finding you and making coarse use of you drives you back up onto your feet, wipe your face clean, find your gear, and press on.");
	}

	IncrementFlag("BOTHRIOC_PIDEMME_FUCKED");

	processTime(25 + rand(10));
	pc.loadInMouth(enemy);
	pc.orgasm();

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

public function bothriocPidemmeDockOvi():void
{
	clearOutput();
	showBothriocPidemme();
	showName("VICTORY:\nBOTHRIOC");

	var cockIdx:int = pc.cockThatFits(enemy.vaginalCapacity());
	var cock2Idx:int = pc.cocks.length > 1 ? pc.cockThatFits2(enemy.analCapacity()) : -1;
	var cockTag:String = "[pc.cock " + cockIdx + "]";

	output("<i>“So how do you people fertilize these eggs of yours?”</i> you query");
	if (!pc.isNude()) output(", as you casually shed your [pc.gear]");
	output(". <i>“Given you haven’t got anything between your legs.”</i>");
	if (CodexManager.hasViewedEntry("Bothrioc") || flags["BOTHRIOC_PIDEMME_DOCKED"] != undefined) output(" You already know this of course but it’s always a pleasure to make them repeat it, given how well it segues into the hot and heavy.");
	
	output("\n\n<i>“Our ovipositor does everything, farlander,”</i> the lithe piebald creature mumbles in response, from their position on the ground in front of you. You notice a slight sneer cross their long face when you");
	if (pc.hasLowerGarment()) output(" discard your [pc.lowerUndergarment] and");
	output(" let [pc.eachCock] flop downwards meaningfully. If anything, their distaste increases your ardour for having your way with this wannabe predator. <i>“We can push it into another’s egg-chamber, collect the oil there and use that to seed our load; then we find someone else to take our readied eggs.”</i>");

	output("\n\n<i>“So then...”</i> you say with mocking thoughtfulness, standing over the defeated pidemme, deliberately swinging your "+cockTag+" close to their pale face. <i>“If I were to, let’s say, fuck that plump abdomen of yours absolutely silly my... oil... would fertilize the eggs in there, correct?”</i>");
	
	output("\n\n<i>“I--”</i> splutters the [enemy.hairColor]-haired bothrioc, some color finally blooming on their face. <i>“It’s alien seed, so - I don’t know if--”</i>");
	
	output("\n\n<i>“Only one way to find out. Turn around, ‘precious’.”</i>");
	
	clearMenu();
	addButton(0, "Next", bothriocPidemmeDockOviII, [cockIdx, cock2Idx, cockTag]);
}
public function bothriocPidemmeDockOviII(arg:Array):void
{
	clearOutput();
	showBothriocPidemme();
	showName("VICTORY:\nBOTHRIOC");
	
	var cockIdx:int = arg[0];
	var cock2Idx:int = arg[1];
	var cockTag:String = arg[2];
	
	output("Eyes down, the supple, six-limbed being shifts themselves so the curves of their snow-white back and bum is visible, between which their bulging, blimp-like abdomen dominates proceedings. It’s impossible to tell really with these creatures, but given its size in comparison to the bothrioc carrying it, the androgyne really must be bursting to the brim with eggs. It is taut, uniformly black and glossy all the way around, and - you murmur as you press your hands against it, moving it back and forth - is warm and pleasantly smooth to the touch. At the tip, winking and glistening at you with wet arousal, is the ovipositor’s entrance; dilated and brilliantly violet within.");
	
	output("\n\nYou dip your finger into the warm, oily hole and laugh quietly when the crouched bothrioc tenses up slightly. When you dip two fingers in, circling the slick walls of the tube inside before gently spreading it, you force a gasp past their lips, their chitin-clad fingers clutching the dirt. The body you are toying with is inexpressibly alien - but the effect you’re having on the pent-up being attached to it, eerily beautiful with its immaculate white skin and gleaming, latex-like armor, is undeniably arousing, heat wiring down to your [pc.crotch], your "+cockTag+" hardening up inexorably. You place");
	if (pc.isNaga() || pc.isGoo()) output(" yourself behind");
	else if (pc.isTaur()) output(" your hind legs either side of");
	else output(" your [pc.thighs] either side of");
	output(" the glossy abdomen and slide the underside of your member over the ovipositor’s open mouth, basting it into clinging, bothrioc juices back and forth until you are urgently erect.");
	
	output("\n\n<i>“Just... do it, if you are going to do it, pervert!”</i> moans the spider-being, back arched with anticipation. Hazily you wonder whether there’s a contact reaction involved too; certainly, ever since your fingers got slathered in bothrioc oil you have felt imbued with a calm sense of sexual purpose. Who cares if it’s an arachnid egg sac? Every hole, after all, is a goal.");
	
	output("\n\nYou draw your oil-slicked cock back, press your [pc.cockHead "+cockIdx+"] against the violet hole, and then with a groan of immense gratification, help yourself to the bothrioc’s warm, slick insides. The ovipositor is sensually as black and white as the bothrioc themselves: at first sweat-inducingly tight, then loose, then tight again, an undulating fuck-sleeve which is bizarre but delightful to sink your length into.");
	if (pc.cocks[cockIdx].cLength() <= 8)
	{
		output(" In almost no time you’re mired up to your");
		if (pc.balls == 0) output(" [pc.hips]");
		else output(" [pc.balls]");
		output(" in the creature’s hole. You feel a slight twinge of frustration, because you can feel that the ovipositor’s tunnel continues beyond your [pc.cockHead "+cockIdx+"]. If only you had a monster dick! Still, the lust thrumming through your length makes your regret fleeting in the extreme.");
	}
	else
	{
		output(" It is particularly wonderful because the creature’s ovipositor stretches down and down, a seemingly endless tunnel which suits your long, craning cock brilliantly. The bothrioc whines and gasps as you keep going, your intense lust urging you to keep holding their abdomen firmly");
		if (pc.isTaur()) output(" between your front legs");
		output(" and continue to push inch after inch of rock-hard dick into it.");

		output("\n\n<i>“This is worse than getting caught by a wetraxxal!”</i> they wail, as your");
		if (pc.balls > 0) output(" [pc.balls]");
		else output(" [pc.thighs]");
		output(" finally bump against their taut chitin.");
	
		output("\n\n<i>“You were going to push this ridiculous tube of yours into me,”</i> you remind them curtly. <i>“So I don’t think you have any right to complain.”</i>");
	}
	if (pc.hasKnot(cockIdx))
	{
		output(" You grunt as your fiercely inflated knot bumps against the bothrioc’s entrance; urged on by the lust beating through you, you jerk against their abdomen until, with a feeling of elation on your end and a moan and a writhe on the bothrioc’s, you push it in, firmly knotting your cock inside.");
	}

	output("\n\nYou are soon thrusting away, [pc.hips] bumping repeatedly against the black sheen as you enjoy every inch of that undulating, warm squeeze you have claimed as your own, sheer pleasure forcing small gasps and hums of pleasure past your [pc.lips]. The bothrioc shudders and gasps, back arched and four hands clutching the ground hard as you rail their abdomen with increasing passion, a thin stream of oil dribbling down from their well-opened hole. Whatever distaste they held for your genitals is not preventing the filthy delight you’re forcing upon them now - a thought which makes you laugh breathlessly, clutch their taut black latex-chitin tightly and pump into their warm, wet egg-tube with even more energy. Beneath the swell of their abdomen, their round, white ass vibrates pleasantly with every heavy smack of your [pc.thighs] into them.");
	if (pc.hasTailCock())
	{
		output("\n\nThere’s no way you’re letting that go unmolested, particularly not with your [pc.cockTail] raring to get in on the action. It requires almost no urging on your part for the tentacle-like parasite to rear around your [pc.ass] and zero in on the bothrioc’s neat, curvy behind. You groan of pure pleasure twines with the spider-being’s squawk of surprise when you penetrate their tar-black asshole with a single, hard push.");

		output("\n\n<i>“Oh lands above, you’re infested with the plant things too?!”</i> they cry, staring over their shoulder wild-eyed. <i>“Isn’t one disgusting phallus thing enough for you?”</i>");
	
		output("\n\nYou answer that by energetically working their tight little black rose loose before funnelling your tightly packed urge into their back passage, all the while you continue to thrust your "+cockTag+" into their stripe-textured ovipositor. For all their noise the bothrioc is clearly used to this; muscles relax around your [pc.cockTail] and it is soon thrusting into that cute, warm ass for all it is worth, sensual delight pulsing back up your spine, sound-tracked by a steady stream of gasps and alien curses from the other end.");
	}
	else if (cock2Idx >= 0) output(" Your [pc.cock "+cock2Idx+"] tingles with dissatisfaction at not being able to claim that prize at the same time. If only you had something a bit more flexible...");

	output("\n\nAfter several long minutes of deeply enjoyable pushing, the filthy sounds of your copulation echoing off the cavern walls, the anticipation of release tightens up your body, and you let yourself fly over the edge. You clutch the bothrioc’s abdomen intently, your "+cockTag+" dilates");
	if (pc.balls > 0) output(", your [pc.balls] clench");
	output(" and you spume a huge dollop of [pc.cum] deep into their egg-hole.");
	if (pc.hasTailCock()) output(" Your [pc.cockTail] eagerly joins, ramming itself six inches deep into the tight, wriggling tunnel it’s claimed as its own before thoroughly fruiting it with plant jizz.");
	output(" You draw yourself in and out, enjoying the wonderful checkered sensation of the oily ovipositor up and down your cock, all the while you continue to pump out every last [pc.cumVisc] drop; letting the gasping spider-slut know just how much you enjoy doing it with long sighs, whips of the head and gratuitous "+pc.mf("groans", "moans") +".");

	if (pc.cumQ() >= 1000)
	{
		output("\n\nThe bothrioc’s abdomen creaks a warning as your ridiculously messy and backed-up orgasm goes on and on. It has bloated up to beyond the size of a gold myr’s honey-belly on your [pc.cum], utterly stuffed, before with a high wail from the bothrioc it discharges back, spattering onto your [pc.thighs] and oozing thickly down your unfortunate partner’s underbelly.");

		output("\n\n<i>“Penises are SO disgusting!”</i> they assert emphatically.");
	}

	output("\n\nAfter you rest for a moment, supported by the abdomen’s bulk, you pull out, trailing warm oil and [pc.cumColor] semen as you go, and admire your handy work.");
	if (pc.cumQ() < 1000) output(" A single drop of your cum drips down from the bothrioc’s violet egg-hole, but the rest of your load has been hungrily absorbed; providing a suitable bath for the predator’s eggs, filling them with even greater need, but now forced to eject eggs fertilized by you.");
	else output(" A steady stream of your cum drips down from the bothrioc’s thoroughly gaped violet egg-hole, but the sheer plumpness of it now speaks to how much remains inside; a vast bath for the predator’s progeny, surely consigned to carry and lay eggs fertilized by you for the foreseeable future.");
	if (pc.hasTailCock()) output(" A thin trail of cream is also working its way down the creature’s curvy thigh, sourced from between their butt-cheeks. Your [pc.cockTail] throbs with satisfaction.");

	output("\n\n<i>“It probably won’t... work, you know,”</i> says the bothrioc lowly, recovering their breath and looking over their shoulder at you askance, hair muddled. You grin at the redness you’ve managed to bring out on their pale cheeks. <i>“Farlander seed. It’s... it’s ridiculous to think my eggs would take to it.”</i> You retrieve your [pc.gear] before moving over and place a teasing kiss on their hot forehead.");

	output("\n\n<i>“Spread my kids far and wide, ‘precious’.”</i>");

	IncrementFlag("BOTHRIOC_PIDEMME_DOCKED");
	IncrementFlag("BOTHRIOC_PIDEMME_FUCKED");

	processTime(20+rand(10));
	enemy.loadInCunt(pc, 0);
	pc.orgasm();

	CombatManager.genericVictory();
}

public function bothriocPidemmeVagRide(isAnal:Boolean = false):void
{
	clearOutput();
	showBothriocPidemme();
	showName("VICTORY:\nBOTHRIOC");

	var holeIdx:int = -1;
	var holeTag:String = "[pc.asshole]";

	if (!isAnal && pc.hasVagina())
	{
		holeIdx = pc.cuntThatFits(enemy.cockVolume(0));
		if (pc.isPregnant(holeIdx))
		{
			var possNewHole:int = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
			if (possNewHole != -1)
			{
				holeIdx = possNewHole;
			}
		}
		if (holeIdx == -1) holeIdx = rand(pc.vaginas.length);
		
		holeTag = "[pc.vagina " + holeIdx + "]";
	}

	output("You coolly consider the unearthly androgyne at your [pc.feet]. The staring blank between their legs is hardly ideal where you’re concerned. It limits your " + (isAnal ? "ass-" : "pussy-") +"pleasure options to seeing how good they are at oral (probably not great. How much practice would such a creature get?)... or...");

	output("\n\n<i>“Get on your front,”</i> you demand. Cowed by your");
	if (enemy.HP() <= 0) output(" physical");
	else output(" sexual");
	output(" dominance the bothrioc does so without a word, slender black-armored limbs turning themselves around and laying their flat tummy on the ground, round butt exposed and plump abdomen in the air. You lay your hands on the pleasantly warm, latex-like burnish of the abdomen and lead them up to the dilated slit at the top, wet and brilliantly violet. The bothrioc murmurs and then inhales sharply when you circle the rim with your finger, enjoying the sensation of warm oil which drips freely from the thick tube holstered within. It requires very little stimulus for you to coax their ovipositor, sprouting outwards thickly like a sturdy, bulbous branch of bamboo.");

	output("\n\n<i>“If that is - what you wanted all along, farlander--”</i> gasps the bothrioc as you grasp your newfound pet and stroke it, at least seven inches of length now reaching upwards, <i>“--why didn’t you, why didn’t you just roll over for me?”</i>");


	output("\n\nThey’re trying for bravado, but all you can hear in their not-quite-male-not-quite-female voice is need. You say nothing as you move over them");
	if (pc.isNaga()) output(", swaddling their lower body in your [pc.legs]");
	else if (pc.isGoo()) output(", swaddling their lower body in sticky goo");
	else if (pc.legCount > 1) output(", one [pc.foot] either side of their abdomen");
	output(" so that the creature’s wonderfully dexterous and chunky ovipositor is pressed against your "+holeTag+". Gently you stroke yourself with the tip, rubbing it across your sensitive");
	if (isAnal) output(" ring until arousal is coursing through you, your ass aching for a thick intruder to scratch your building itch....")
	else
	{
		output(" mouth and over [pc.eachClit] until arousal is coursing through you, your pussy plush and");
		if (pc.vaginas[holeIdx].wetness() <= 2) output(" moist");
		else output(" dribbling");
		output(" with [pc.femCum].");
	}

	output("\n\n<i>“You pump eggs into me with this thing without my say so,”</i> you say at last, gazing levelly down at the prone bothrioc, <i>“it will be the very last thing you do with it.”</i> Their moan combines with your sigh as you push forward and slide bumpy egg dick into your waiting wet hole.");

	output("\n\nIt’s a thoroughly odd position to take to get some satisfaction out of a defeated foe, but that only adds to its exotic allure. How many other beings can you watch knelt beneath you, gasping and clutching the ground, whilst you penetrate yourself on them? The overriding sense of calmness helps. There must be some contact reaction with the oil - ever since you slathered your fingers in it, you have felt serenely driven by your own sexual desires, radiating with assured, sensual need. You sit further down on the thick stalk, letting it push deep into your sensitive inner walls, before rotating and flexing your hips, seeing what you can get away with, all the little explosions of pleasure go off in your "+holeTag+". You could sit here all day on top of your well-lubricated androgyne-mounted dildo, slowly rotating it back and forth, letting the pleasure overtake you. Maybe you will! Your muscles clench up and you exhale dreamily");
	if (pc.hasVagina())
	{
		output(", feeling your [pc.femCumColor] juices");
		if (pc.wettestVaginalWetness() <= 2) output(" drip");
		else output(" dribble");
		output(" downwards");
		if (isAnal || pc.vaginas.length > 1) output(" from your [pc.vaginas]");
	}
	output(".");

	output("\n\nBy the intense way they are clutching the dirt with all four hands, the intense strain in their back muscles, and the steady “huff huff huff” being forced past their thin lips, you can tell it’s taking everything the bothrioc’s got not to release their eggs up into you. The abdomen you’re currently riding looks very swollen - just how many have they got backed up in there? Teasingly, you");
	if (pc.isTaur()) output(" push your [pc.ass] down even harder");
	else if (pc.isNaga()) output(" grip your coils");
	else if (pc.isGoo()) output(" grip your viscous mass");
	else output(" grip your [pc.hips] around it");
	output(", squeezing the warm, black chitin");
	if (pc.isTaur()) output(" against the ground");
	output(" at the same time as tightening up nicely around your pet dick; this draws a low wail out of the lithe spider-being, and a flush of wonderful, slathering of oil into your "+holeTag+". A substantial amount, then.");

	output("\n\nYou play with your [pc.nipples],");
	if (!pc.hasFuckableNipples()) output(" rolling your fingers around your tender nubs");
	else output(" fingering their tender insides");
	output(", intent on increasing the bright sensuousness blazing through you, seeming to light up this dank, dark cave. You whuff as a drawn-out orgasm pulses through you, pleasure shimmering up through your whole body from your stuffed " + holeTag);
	if (pc.isLactating()) output(", making [pc.milk] spurt freely around your digits.");
	else output(".");
	output(" You keep working");
	if (pc.isBiped()) output(" your hips around");
	else output(" yourself up and down");
	output(" the ovipositor at the same leisured stroke, letting the ecstasy go on and on at its own pace. When you finally come down you favor the wide, black eyes of the bothrioc, staring over their shoulders and heaving for breath, with a smile.");

	output("\n\n<i>“You still alright down there, little guy-girl-thing?”</i> you ask. You pump vigorously, pushing their egg-dick into your wet walls, making them gasp. <i>“Good. Because now we’re REALLY going to go for the pennant.”</i>");

	output("\n\nYour [pc.ass] bounces up and down on the abdomen you’ve got trapped");
	if (pc.isBiped()) output(" between your [pc.hips]");
	else output("-");
	output(" as you athletically ratchet yourself upwards to an even bigger peak, making ruthless use of the bothrioc. Their egg stalk eagerly reaches itself into your "+holeTag+" as far as it will go, the series of smooth nodules stretching");
	if (isAnal) output(" you deliciously")
	else output(" your mouth and pushing against [pc.eachClit]");
	output(" as you draw it inwards.");
	if (pc.hasCock() && !pc.isTaur()) output(" Feverishly your hands descend to your [pc.cock], and you pump your length to the same delicious rhythm with which you bend the ovipositor within you, the overwhelming double pleasure seizing you up and forcing ecstatic cries past your [pc.lips].");

	if (pc.hasTailCock())
	{
		output("\n\nThe bothrioc’s cute, round bum, jouncing away underneath their trapped abdomen, has remained an enticing target this entire time, and now with lascivious amounts of arousal directing your every movement, you can no longer resist your [pc.cockTail]’s slavering impulses. You rear your parasitic tail around, and with barely any nervous input it zeroes in on the spider being’s neat, white behind. You groan of pure pleasure twines with their squawk of surprise when you penetrate their tar-black asshole with a single, hard push.");

		output("\n\n<i>“Oh lands above, you’re infested with the plant things too?!”</i> they cry, staring over their shoulder wild-eyed. <i>“Isn’t having a weird, sticky trap hole enough for you?”</i>");

		output("\n\nYou answer that by energetically working their tight little black rose loose before funnelling your tightly packed urge into their back passage, all the while continuing to pump their bumpy ovipositor in your tender depths. For all their noise the bothrioc is clearly used to this; muscles relax around your [pc.cockTail] and it is soon thrusting into that cute, warm ass for all it is worth, sensual delight pulsing back up your spine, sound-tracked by a steady stream of gasps and alien curses from the other end.");
	}

	output("\n\nWhen the next orgasm hits a few moments later it’s even better for the energy you’ve put behind it; stars fizzle over your [pc.eyes] as your "+holeTag+" clenches up over and over again around the oily egg-cock you’ve made your own");
	if (!isAnal)
	{
		output(", [pc.femcum]");
		if (pc.vaginas[holeIdx].wetness() <= 2) output(" drooling");
		else output(" gushing");
		output(" freely down the bothrioc’s eager, distended stalk and over their latex-like armor.");
	}
	else output(".");
	if (pc.hasCock())
	{
		output(" The heavy pulses pushes your [pc.cock] over the edge as well, and you groan with total release");
		if (!pc.isTaur()) output(", gripping your pulsing dick");
		output(" as it spurts [pc.cum] all over their graceful white back.");
	}
	if (pc.hasTailCock()) output(" Your [pc.cockTail] is happy to get in on the act; the ropes of floral muscle coil up euphorically and the next moment thoroughly seed the spider-being’s tight back passage with hot, thick plant cum with heavy, gratifying throbs.");

	output("\n\nIt’s during your fourth or fifth ground-shaking "+ (isAnal ? "orgasmic-pulse" : "pussy-pulse") +" that you glance down and realize the bothrioc has been gazing at you pleadingly this entire time; long, androgynous face fixed with sexual anguish.");

	output("\n\n<i>“Please,”</i> they whisper.");

	// Only offer the choice if the hole in question could actually be egged
	if (!pc.isPregnant(isAnal ? 3 : holeIdx))
	{
		//[Let them] [Nope]
		clearMenu();
		addButton(0, "Let Them", bothriocPidemmeVagRideII, [isAnal, true, holeIdx], "Let Them", "Let them release their eggs inside you.");
		addButton(1, "Nope", bothriocPidemmeVagRideII, [isAnal, false, holeIdx], "Nope", "Deny them.");
	}
	else
	{
		clearMenu();
		addButton(0, "Next", bothriocPidemmeVagRideII, [isAnal, false, holeIdx]);
	}
}

public function bothriocPidemmeVagRideII(opts:Array):void
{
	var isAnal:Boolean = opts[0];
	var isEgging:Boolean = opts[1];
	var holeIdx:int = opts[2];
	
	clearOutput();
	showBothriocPidemme();
	showName("VICTORY:\nBOTHRIOC");

	if (isEgging)
	{
		if (bothriocAddiction() <= 50)
		{
			output("You’re so high you couldn’t care less - and you do feel bad about denying the little bugger this badly.");
		}
		else
		{
			output("The only thing that would make this any better is getting a nice, heavy clutch to carry away with you - and you do feel bad about denying the generous egg-giver this badly.");
		}
		
		output("\n\n<i>“Go on then,”</i> you gasp, still gripping their smooth abdomen tightly with your legs. <i>“For being so good.”</i>");
		
		output("\n\nImmediately, and with an ecstatic, almost pained howl, the bothrioc releases a huge gush of oil into you, so large it washes warmly back down their latex egg-sac in clear, oozing rivers. The heavy, round objects which are then expelled into your relaxed, " + (isAnal ? "awaiting ass" : "waiting womb") + " come out in a heady rush, practically fighting each other down the bothrioc’s ovipositor to get into that wet, plush breeding bay that has been tormenting them this entire time. Your eyes cross as your belly plumps out, crammed with alien young that your " + (isAnal ? "ass" : "pussy") + " eagerly coaxes inside with delicious clenches.");
		
		output("\n\n<i>“Thank you...”</i> groans the ");
		if (pc.hasCock()) output(" cum-spattered");
		output(" bothrioc every time they squeeze an oval past your sensitive " + (isAnal ? "ring" : "lips") + ", their whole body clenched up in ecstasy. <i>“Thank you... thank you... aargh... thank you!”</i> ");
		
		output("\n\nThey sag at last, their abdomen notably deflated, their oozing violet egg-stalk flopping out. Exhaustion and the shimmering relaxation that the creature’s fluids induce compel you to");
		if (pc.isTaur()) output(" lower yourself");
		else output(" flop");
		output(" down on top of them, your rounded stomach");
		if (!pc.isTaur()) output(" and [pc.chest]");
		output(" pressing into the warm curve of their back.");
		
		output("\n\n<i>“That wasn’t so bad in the end, was it?”</i> you murmur in their plated ear.");
		
		output("\n\n<i>“No... it wasn’t,”</i> comes the breathy reply. They slide around to face you, press their hands against your belly, strokes your chin, and reaches their thin lips up to your own ear. <i>“Next time though, farlander... I think you’ll see things a little bit differently.”</i>");
		
		output("\n\nImplied malice or not, it’s difficult to want to do anything but hold the warm, lithe creature for a little while longer, share the wonderful, sticky glow. Eventually they disentangle and silently retreat back into the darkness, leaving you to pick up your gear and continue on - a little more splay-");
		if (pc.hasFeet()) output(" footed");
		else output(" hipped");
		output(" than you were.");

		output("\n\n");
		processTime(20+rand(10));
		if (isAnal) pc.loadInAss(enemy);
		else pc.loadInCunt(enemy, holeIdx);
		pc.orgasm();
	}
	else
	{
		if (bothriocAddiction() > 50)
		{
			output("The desire to accept a nice, big clutch and ease the egg-giver’s burden is so great that it almost bypasses your brain and flies past your " + (isAnal ? "ring" : "lips") + " anyway - but somehow you clamp down on it.");
			
			output("\n\n<i>“Not today, lover,”</i> you purr, continuing to thrust away, riding out your dazzling orgasm. <i>“Just think how great it will feel for all this... when you do get to finally release them...”</i>");
			
			output("\n\nThe bothrioc grits their teeth - but despite continuing to leak oil deliriously into your " + (isAnal ? "ass" : "cunt") + ", they manage to hold on. When you finally come down, draw the still-achingly erect ovipositor out of your oozing, gently aching hole, you");
			if (pc.isTaur()) output(" lower yourself");
			else output(" flop");
			output(" down on top of them, stroking their sculpted chin and bulging, pent up abdomen comfortingly.");
			
			output("\n\n<i>“Maybe next time,”</i> you soothe into their ear. <i>“If you’re good.”</i>");
			
			output("\n\n<i>“Just... get out of here,”</i> they grit. <i>“If I don’t find an incubator who isn’t a sadist in the next hour, I’m going to burst.”</i>");
			
			output("\n\nYou pat their " + enemy.hairColor + " hair and go to fetch your gear, laughing as you watch the bothrioc hobble off, clutching their dangerously swollen egg-sac.");
		}
		else
		{
			output("You snort, despite yourself. How stupid do you look?");
			
			output("\n\n<i>“I told you, keep those to yourself,”</i> you order sternly, continuing to thrust away, riding out your dazzling orgasm. <i>“You can always find another chump to stick them into - so long as you’ve still got your tube.”</i>");
			
			output("\n\nThe bothrioc grits their teeth - but they take the point and manage to hold on, despite leaking oil deliriously into your pulsing " + (isAnal ? "anus" : "cunt") + ". When you finally come down, draw the still-achingly erect ovipositor out of your oozing, gently aching hole, you");
			if (pc.isTaur()) output(" lower yourself");
			else output(" flop");
			output(" down on top of them, stroking their sculpted chin and bulging, pent up abdomen comfortingly.");
			
			output("\n\n<i>“Maybe next time, precious,”</i> you coo mockingly in their ear. <i>“If you’re good.”</i>");
			
			output("\n\n<i>“I’ll get you next time, farlander,”</i> they grit back. <i>“And once your attitude has been corrected, I’ll pump your every hole so full of eggs you won’t be able to move. Please get off me now - if I don’t find an incubator who isn’t a sadist in the next hour, I am going to burst.”</i>");
			
			output("\n\nYou pat their "+ enemy.hairColor + " hair and go to fetch your gear, laughing as you watch the bothrioc hobble off, clutching their dangerously swollen egg-sac.");
		}

		output("\n\n");
		processTime(20+rand(10));
		enemy.impregnationType = ""; // Remove the impreg. type to avoid egging the player during orgasm.
		if (isAnal) pc.loadInAss(enemy);
		else pc.loadInCunt(enemy, holeIdx);
		pc.orgasm();
	}

	CombatManager.genericVictory();
}