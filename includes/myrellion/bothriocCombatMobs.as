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

	bothriocPidemmeLossSelector(false);
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
	
	if (isTripped)
	{
		pc.createStatusEffect("Tripped", 0, 0, 0, 0, false, "DefenseDown", "You've been tripped, reducing your effective physique and reflexes by 4. You'll have to spend an action standing up.", true, 0);
	}

	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function bothriocPidemmePCLoss():void
{
	clearOutput();
	showStandardBothrioc();
	showName("DEFEAT:\nBOTHRIOC PIDEMME");

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

	if (!pc.isPregnant(3))
	{
		bothriocPidemmeButtEggs(fromCombat);
	}
	else if (pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG) != -1)
	{
		bothriocPidemmeVagEggs(fromCombat)
	}
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

		output("\n\n<i>“Wonderful morsel... <i>“ they moan, extending their ovipositor, letting the thick organ drool all over your [pc.ass] as it searches out a hole to breed, making you shiver with anticipation. <i>“So perfect for...”</i> The eggshaft tenses up and shoves itself into your [pc.butthole].");
		pc.buttChange(enemy.cockVolume(0), true, true, false);
		output(" You are well trained now in handling ovipositors, and though you coo with delight at being penetrated, it doesn’t knock the breath out of you like it once did. Well, almost. By the third or fourth ring that stretches your ass wide, the rhythmic hammering of inch after inch of eggtube being fed into your ass is still threatening to knock the breath completely out of you. The only thing keeping your breathing relatively steady is plenty of practice.");
		
		output("\n\nYou can already taste the euphoria. Your mind feels almost as though it has been short-circuited. The only thing that matters right now is enjoying this breeding as much as possible, and that in part means spurring your temporary lover onward. You");
		if (pc.race().indexOf("kaithrit") != -1) output(" purr");
		else output(" moan");
		output(" loudly and put on a show for the victorious warrior and their long, thick, um... spear. You can immediately feel the heightened arousal in your ass, as the first spurts of slime shoot deep into your guts. The bothrioc is now actively running their many hands over you, delighting in exploring your body as much as thrusting into your hot clench.");
		
		output("\n\nA lustful groan and a sudden stoppage indicate all you need to know: The ovipositor has docked in your [pc.ass]. The bothrioc almost helplessly rests atop you, transfixed with bliss, as you feel the first egg pop through your sphincter almost effortlessly");
		if (pc.hasCock()) output(", squeezing your prostate thoroughly as it passes”</i>");
		output(". You shatter into orgasm instantly, shaking as your entire body ripples with waves of bliss,");
		if (pc.hasCock()) output(" forced to spurt your [pc.cumColor] load submissively against the ground");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.eachCunt] dribbling [pc.girlCum] freely");
		output(". Your [pc.asshole] clamps down on the massive egg tube, letting eggs through in a staccato rhythm that only serves to heighten the ecstasy to unbearable levels. Your eyes roll back, [pc.nipples]");
		if (pc.canLactate()) output(" oozing [pc.milk]");
		else if (pc.hasNippleCunts() || pc.hasLipples()) output(" throbbing");
		else output(" hardening");
		output(",  squeals of total abandon are forced past your lips.");
		
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
			else if (pc.cumQ() <= 500) output(" By the time your stream of [pc.jizz] fully gushes out onto the ground, you’ll have a respectable puddle.");
			else if (pc.cumQ() <= 1000) output(" The thick puddle that has already formed on the ground from your precum is just the beginning. The [pc.jizz] pouring from you now would be likened by poets to a lake or sea.");
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
			else if (pc.wettestVaginalWetness() <= 3) output(" streams down your [pc.legs]");
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
		else if (pc.race.indexOf("bothrioc") != -1)
		{
			output("\n\nBothrioc TF’d: <i>“I can see you’re so enamored with us that you decided to become us. So long as your cloaca is a home to eggs, you’ll be ensnared in our love no matter what you are.”</i>");
		}
		else
		{
			output("\n\n<i>“You will make a fine mother for our children, farlander. Come back once you have borne them - you have still much pleasure to bear if this barren land is to be repopulated.”</i>");
		}
		
		output("\n\nYou slip into a happy, wonderfully serene doze as the creature slips silently away.");
	}
	if (bothriocAddiction() <= 59)
	{
		output("<i>“Our numbers have been thinned and scattered terribly by the myr war,”</i> the bothrioc says, as they bend you forward, pull your hands behind your back and truss them with a bolo. <i>“Travellers to our lands are few and heavily armed. Needs must, starwalker. You understand.”</i>");
		
		output("\n\nThey swiftly clamber atop you and straddle you, the warm, smooth weight of egg-bloated abdomen thumping into your [pc.ass]. From the sheer heftiness of it, you guess there’s good reason for the predatory creature’s urgency.");
		
		output("\n\nThe bothrioc leans against you and uses their upper arms to pin you firmly in place by the shoulders as their ovipositor slides free. You can’t see it, but you certainly can feel it - thick, warm and coated with oil, it feels ridiculously big as it slides up");
		if (pc.hasVagina()) output(" the line of your [pc.vagina]");
		else output(" your taint");
		output(" and into the crack of your ass.");

		if (flags["BOTHRIOC_FUCKED"] == undefined)
		{
			output(" The sheer repulsiveness of the situation makes you clench up automatically, willing yourself to be anywhere else.");
		}
		else if (flags["BOTHRIOC_FUCKED"] <= 24)
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
		
		output("\n\nThe alien’s thorough plundering of your ass resumes with aplomb. In your more relaxed state, you no longer find it impossible to breathe correctly; each short thrust of the alien cock still drives the wind from you, but now you can synchronize with it, and with each deep inhalation a tingling euphoria grows, a perverse physical delight at being prised apart and used like this. A moment later, the sheer chitin of the bothrioc’s abdomen shell bumps against your [pc.anus]. The thick tube buried in your ass will go no further, and the bothrioc astride you shudders. Then you feel it.");

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
			else if (pc.wettestVaginalWetness() < 4) output(" streams down your [pc.legs]");
			else output(" gushes down your [pc.legs] and onto the ground");
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

	IncrementFlag(flags["BOTHRIOC_FUCKED"]);

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

public function bothriocPidemmeVagEggs(fromtCombat:Boolean):void
{
	
}