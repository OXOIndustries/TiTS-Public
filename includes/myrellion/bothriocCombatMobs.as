public function showBothriocPidemme():void
{
	showName("ENCOUNTER:\nBOTHRIOC PIDEMME");
	author("Nonesuch");
	showBust("BOTHRIOC_PIDEMME"); // pidemme, 9999 decide what things are going to be called when the bulk of the content is coded to cover reuse
}

public function encounterPidemmeBothrioc():void
{
	showBothriocPidemme();

	if (flags["BOTHRIOC_PIDEMME_ENCOUNTERED"] == undefined)
	{
		flags["BOTHRIOC_PIDEMME_ENCOUNTERED"] = 1;

		output("\n\nYou try to remain alert in your gloomy surroundings, scanning every object that looms into view carefully, keeping your ears pinned back for any faint sound. You still almost start out of your skin when a four-armed, black-chitined warrior bursts seemingly out of nowhere, whirling some sort of rope weapon over their head. They draw a rapier from the mass of belts wrapped around the swell of their hips with one set of arms, fling the spinning ropes at your [pc.legs] with the other and launch themselves at you, all in one vicious, fluid movement.");

		if (pc.reflexes() + rand(30) + 1 > 30)
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

			if (pc.reflexes() + rand(30) + 1 > 30)
			{
				output("\n\nStill, you have enough about you to sidestep the bolos hurled at you, grab your [pc.meleeWeapon] and stab it upwards, parrying their rapier strike with a judder. You stagger backwards, taking in your assailant as they circle you.");
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
			if (bothriocAddiction() >= 50) pc.lust(5 + rand(5));
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
				addButton(0, "Next"< standardBothriocEncounterOfferAccept);
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

			// 9999 bothrioc losses
		}
	}
}

public function standardBothriocEncounterOfferRefuse():void
{
	clearOutput();
	showStandardBothrioc();

	output("With a firm set of the jaw, you draw your [pc.weapon].");
	output("\n\n<i>“Oh well,”</i> sighs the pidemme. <i>“The sex will be even better for a bit of rough and tumble beforehand.”</i> In one fluid movement they are on their feet, bolos in one set of hands and rapier in the other, advancing on you swiftly and silently.");

	fightBothriocPidemme(false);
}

public function standardBothriocEncounterOfferAccept():void
{
	clearOutput();
	showStandardBothrioc();

	output("They are right. Giving in is bliss. Contentment burgeons within you as you unfasten your [pc.gear]");
	if (pc.isNude()) output(". The bothrioc");
	else output(", baring your [pc.skinFurScales] for the egg-giver, who");
	output(" watches with a pleased, hungry smile. By the time you are completely naked and lying on your side, you feel nothing but warm peace and submissive need.");
	output("\n\n<i>“Beautiful,”</i> whispers the pidemme, sliding off their perch and advancing on you.");

	// 9999 bothrioc losses
}

public function fightBothriocPidemme(isTripped:Boolean = false):void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(new BothriocPidemme());
	CombatManager.displayLocation("FIGHT:\nBOTHRIOC PIDEMME");
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(bothriocPidemmePCVictory);
	CombatManager.lossScene(bothriocPidemmePCLoss);
	CombatManager.encounterTextGenerator(function():String {
		var m:String = "You’re facing off against a pidemme bothrioc. Their two legs, four arms and straight antennae are armored in black chitin, flexible and burnished like latex. Elsewhere on their body, their human-like skin is ghostly white. You can clearly see this, because aside from a jumble of belts wrapped around their curvy waist, the creature is entirely naked. Perhaps this is because they feel they have nothing to hide; between their legs there is simply a blank expanse, and although they have small, black nipples, their chest is quite flat. Underneath their messy shock of "+ CombatManager.getHostileCharacters()[0].hairColor + " hair, their face seems to shift from masculine to feminine depending on how the dim light strikes it. Two pupil-less, tar-like eyes watch your every move.\n\nAbove their round butt and swaying with their every move, the bothrioc’s arthropod-like abdomen is covered tightly in the same austere, gleaming chitin that their limbs are. Occasionally you catch a glimpse of its wet tip; ovipositor open and ready to breed you, as soon as you give in.\n\nThe spider-being wields a rapier, a long rifle and a seemingly inexhaustible supply of bolos. They switch between them seamlessly, each of the four hands arranging itself just so to make efficient use of the weapon currently equipped.";

		return m;
	});
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}