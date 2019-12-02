import classes.Characters.HuntressVanae;
import classes.Characters.MaidenVanae;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.VaginaClass;
public function encounterVanae(isHuntress:Boolean):void
{
	clearOutput();

	if (isHuntress)
	{
		userInterface.showName("FIGHT: VANAE\nHUNTRESS");
		userInterface.showBust("VANAE_HUNTRESS");
		IncrementFlag("MET_VANAE_HUNTRESS");
	}
	else
	{
		userInterface.showName("FIGHT: VANAE\nMAIDEN");
		userInterface.showBust("VANAE_MAIDEN");
		IncrementFlag("MET_VANAE_MAIDEN");
	}

	author("Jim T");

	//First Encounter

	if (!CodexManager.entryUnlocked("Vanae"))
	{
		CodexManager.unlockEntry("Vanae");

		output("As you move through the jungle, your codex suddenly begins to beep out a warning. <i>“Vanae life-signs detected! Collecting all known extranet data on this species...”</i>");
		
		output("\n\nYou look around you and see nothing. Is the codex malfunctioning? The device is equipped with short-range sensors, but there’s nothing as far as you can see.");
		
		output("\n\nYou ready your [pc.weapon], your [pc.eyes] carefully scanning your surroundings...");
		
		output("\n\n<i>“Data Retrieved! The vanae are an all-female race that can change their skin to match the color of their surroundings. They are also tree-dwelling, "+ pc.mf("Master", "Mistress") +" Steele,”</i> your codex informs you, and just in time. ");

		// IF VANAE HUNTRESS
		if (isHuntress)
		{
			output("\n\nYou look up and see someone about to land on you! You dive out of the way and quickly turn to look at your opponent. They land as slick as a cat and level a pointed spear at you.");
			
			output("\n\nIt seems she was trying to hit you with the blunt end though - was she trying to knock you out?");
			
			output("\n\n<i>“...Whoops, I missed. You’re no ordinary");
			if(pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.raceShort]");
			else output(" off-worlder");
			output("!”</i> the vanae woman exclaims. She looks fairly humanoid, except for her tentacle hair, tail, and organic skirt. Her tentacles are violet colored and bioluminescent, while the rest of her is pale as snow. Her body is covered in gorgeous glowing violet swirls and patterns, just like her hair.");
			
			// Please make sure the nipples parser always calls up the fact she’s lactating, if it doesn’t already. Couldn’t tell from the GIT info.
			output("\n\nThe other thing that immediately captures your attention are her sizable [vanaeHuntress.breastCupSize]s and [vanaeHuntress.milkyNipples]. She seems to be lactating a transparent violet liquid that is drooling down her [vanaeHuntress.breasts]. As you check her out, you can see her webbed hands gripping the handle of her spear.");
			
			output("\n\nWhen you look up, you notice her eyes are firmly shut. They have been all this time. Is she planning to fight you blind? ");
		}
		// ELSE IF MAIDEN VANAE
		else
		{
			output("\n\nYou look up and see someone about to land on you! You dive out of the way and quickly turn to look at your opponent. They hit the ground where you were seconds before, stumbling off balance and crashing spectacularly. ");
			
			output("\n\n<i>“Owww!”</i> You hear your attacker cry out pitifully. When she picks herself up, rubbing her head, you get a good look at her. She looks like a young humanoid woman, except for her tentacle hair, tail, and organic skirt. Her tendrils are pink and bioluminescent, while the rest of her is pale as snow. Her body is covered in gorgeous glowing pink swirls and patterns, just like her hair. ");
			
			output("\n\nThe other thing that immediately captures your attention are her small [vanaeMaiden.breastCupSize]s and [vanaeMaiden.milkyNipples]. She seems to be lactating a transparent pink liquid that is drooling down her [vanaeMaiden.breasts]. ");
			
			output("\n\nAs you check her out, you also notice she’s holding a pointed spear in her webbed hands. They are visibly trembling - she doesn’t look terribly experienced at this kind of thing.");
			
			output("\n\n<i>“...Um, hold it right there! Don’t make me hurt you, okay?”</i> the pink-haired alien pleads. You realize she was trying to hit you with the blunt end. Does she really want to fight?");
			
			output("\n\nYou also notice her eyes are firmly shut and have been this whole time. Is she planning to fight you blind? ");
		}

		// MERGE
		output("\n\nYour codex clues you in to what is going on.");
		
		output("\n\n<i>“Vanae have vestigial eyes, "+ pc.mf("Master", "Mistress") +" Steele, and exceptionally keen hearing. You’ll also want to avoid the liquid she sprays from her breasts; it incapacitates and arouses on contact.”</i>");
		
		output("\n\nBest. Present. Ever.");

		// IF VANAE HUNTRESS
		if (isHuntress)
		{
			output("\n\nMeanwhile, the vanae huntress looks a bit huffy. <i>“...I can’t believe I messed up my first strike. But I won’t make the same mistake twice,");
			if (pc.hasCock()) output(" your cum is mine");
			else output(" your girl-cum is mine");
			output("!”</i>"); 

			output("\n\nWait, what?! She’s after your");
			if (pc.hasCock()) output(" [pc.cumNoun]?");
			else if (pc.hasVagina()) output(" [pc.girlCumNoun]?");
			else output(" girl-cum? You don’t even have any to give!");
			output(" Do you even get a choice in the matter?");
		}
		// ELSE IF MAIDEN VANAE
		else
		{
			output("\n\n<i>“Your... your hip talked!”</i> The vanae maiden squeaks out in surprise. The Codex wasn’t joking about her keen hearing. <i>“...Listen, you. " + pc.mf("I won’t mess up my first hunt - I just won’t - so you’re going to take my virginity and like it - understand?", "You’re going to be my first, so I hope you like girls!") + "”</i>");
			
			output("\n\nWhaaaaaaat?! You barely have time to register as she swings her spear. Clearly, she’s regained her composure.");
		}
	}
	// REPEAT SCENE
	else
	{
		output("As you move through the jungle, your Codex beeps out a warning. <i>“Vanae life-signs detected!”</i>");

		output("\n\nYou instinctively leap back and ready your");
		if (pc.hasRangedWeapon()) output(" [pc.rangedWeapon].");
		else if (pc.hasMeleeWeapon()) output(" [pc.meleeWeapon]."); 
		else output(" fists.");

		// IF VANAE HUNTRESS
		if (isHuntress)
		{
			output(" You’re glad you moved first, because a vanae huntress lands right where you were standing with a thud. She just came out of nowhere!");

			output("\n\n<i>“I missed? You’re no ordinary");
			if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.raceShort]");
			else output(" off-worlder");
			output(".”</i> She looks completely perplexed at your ability to sense her beforehand. You’re pretty sure she wouldn’t get it even if you explained it to her.");

			output("\n\nThe vanae huntress that attacked you is sporting a pair of sizable [vanaeHuntress.breastCupSize]s. She seems to be an experienced " + pc.mf("", "fem-") + "cum hunter.");
		}
		// IF MAIDEN VANAE
		else
		{
			output(" You’re glad you moved first, because a vanae maiden lands right where you were standing. She hits the ground awkwardly, toppling over and very nearly braining herself.");

			output("\n\n<i>“Owww! How’d you see me coming? That’s not fair!”</i> You hear your attacker cry out pitifully. She seems perplexed at your ability to sense her beforehand. You’re pretty sure she wouldn’t get it even if you explained it to her.");

			output("\n\nThe pink-haired vanae quickly pulls herself to her feet, levelling her spear at you. <i>“S-stop right there, you! You’re going to " + pc.mf("take my virginity - and you better be gentle!", "be my first - so I hope you like girls!") + "”</i>");

			output("\n\nThe vanae maiden that attacked you is sporting a pair of [vanaeMaiden.breastCupSize]s. This seems to be her first time hunting for a mate.");
		}
	}

	output("\n\nIt’s a fight!");

	clearMenu();
	if (isHuntress)
	{
		configHuntressFight();
		addButton(0, "Next", CombatManager.beginCombat);
	}
	else
	{
		configMaidenFight();
		addButton(0, "Next", CombatManager.beginCombat);
	}
}

public function configMaidenFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new MaidenVanae());
	CombatManager.victoryScene(vanaePCVictory);
	CombatManager.lossScene(vanaeMaidenPCDefeat);
	CombatManager.displayLocation("MAIDEN");
}

public function configHuntressFight():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new HuntressVanae());
	CombatManager.victoryScene(vanaePCVictory);
	CombatManager.lossScene(vanaeHuntressPCDefeat);
	CombatManager.displayLocation("HUNTRESS");
}

public function vanaeWaitWhilstGrappled():void
{
	// [Don't Struggle] 
	output("You resign yourself, relaxing and enjoying her lube you up with her sensuous strokes. She senses your surrender and grins, enthusiastically rubbing her [enemy.breasts] against you even more.");
	if (enemy is MaidenVanae) output(" <i>“Nice! Now just lie back and relax, and I promise we’ll have a good time - okay?”</i>");
	else output(" <i>“...Mmm, I like it when they give in. That means we can get to the fun bit that much faster...”</i>");
	applyDamage(new TypeCollection( { tease: 16 + rand(8) } ), enemy, pc, "minimal");
}

public function vanaeEscapeGrapple(escapeCause:String = ""):void
{
	// [Successful Escape]: 
	if (escapeCause == "Escape Artist")
	{
		output("Displaying a remarkable degree of flexibility you manage to twist and turn out of her grasp,");
	}
	else
	{
		output("You finally break free of her grasp,");
	}
	
	output(" pushing her off and getting back up. You’re positively dripping with her sticky violet goo. That was a close one!");

	if (CombatManager.hasEnemyOfClass(HuntressVanae)) output(" The blind huntress picks up her spear once again. <i>“By the Sky Mother; you’re so slippery! You better be worth all the effort.”</i>");
	else output(" The blind huntress picks up her spear and stomps her foot. <i>“Arghh, I was so close! Was I really that bad?”</i>");
	
	pc.removeStatusEffect("Tripped");
	pc.removeStatusEffect("Stunned");
}



public function vanaeTFScene():void
{
	// These paragraphs are to be inserted wherever there is a part that says // (TF SCENE). Didn't want to keep copy and pasting it. Played in scenes where the Vanae would spray the PC's genitals with body altering amounts of her milk.

	var options:Array = [];
	
	if (pc.hasCock()) options.push("cock");
	if (pc.balls > 0 && ((pc.ballDiameter() < 8 && !pc.hasPerk("Bulgy")) || (pc.ballDiameter() < 16 && pc.hasPerk("Bulgy")))) options.push("balls");
	if (pc.hasVagina()) options.push("vagina");
	
	// Does not play for Neuters.
	if (options.length <= 0) return;
	
	switch (options[rand(options.length)])
	{
		case "cock":
			var cumChanged:Boolean = false;
			
			// Increase PC's ballEfficiency and cumMultiplier
			if (pc.ballEfficiency < 5) {pc.ballEfficiency += 0.25; cumChanged = true}
			if (pc.ballEfficiency < 4) {pc.ballEfficiency += 0.25; cumChanged = true}
			if (pc.ballEfficiency < 3) {pc.ballEfficiency += 0.25; cumChanged = true}
			
			if (pc.cumMultiplier() < 3) {pc.cumMultiplierRaw += 0.25; cumChanged = true}
			if (pc.cumMultiplier() < 2) {pc.cumMultiplierRaw += 0.25; cumChanged = true}
			if (pc.cumMultiplier() < 1) {pc.cumMultiplierRaw += 0.25; cumChanged = true}
			
			output("\n\nYour [pc.cocks]");
			if (pc.cocks.length > 1) output(" tingle and throb");
			else output(" tingles and throbs");
			output(". Soon you feel an incredible pooling pressure in your loins becoming heavier and heavier and just aching to come out. You");
			if (pc.balls > 0) output("r [pc.balls] swell with incredible weight as you");
			output(" let out a deep guttural groan. When you can’t hold it any longer, you cry out as");
			if (pc.cumQ() <= 200) output(" a small fountain of [pc.cumColor], [pc.cumVisc] [pc.cumNoun] spurts");
			else output(" small fountains of [pc.cumColor], [pc.cumVisc] [pc.cumNoun] spurt");
			output(" uncontrollably from your [pc.cockHeads].");
			if(cumChanged) output(" <b>Your cum production has increased!</b>");
			
			break;
		
		case "balls":
			output("\n\nAs the slick fluid seeps into the pores of your [pc.sack]. You can feel even more of your hot [pc.cumNoun] surging and churning inside. You can feel your [pc.balls] swelling and stretching to abnormal proportions to contain your fiercely broiling spunk.");
	
			// Increase ball size of PC and cancel trap pouch effect.
			if (pc.hasStatusEffect("Uniball") && rand(3) == 0)
			{
				pc.removeStatusEffect("Uniball");
				if (pc.ballSizeRaw < 6 && pc.hasPerk("Bulgy")) pc.ballSizeRaw = 6;
				else if (pc.ballSizeRaw < 3) pc.ballSizeRaw = 3;
				//pc.balls = 2;
			}
			
			//Bulgy grows fastah~
			if(pc.hasPerk("Bulgy"))
			{
				pc.ballSizeRaw += 3;
				if (pc.ballDiameter() < 10) pc.ballSizeRaw += 2;
				if (pc.ballDiameter() < 6) pc.ballSizeRaw += 2;
			}
			else
			{
				pc.ballSizeRaw += 1.5;
				if (pc.ballDiameter() < 10) pc.ballSizeRaw += 1;
				if (pc.ballDiameter() < 6) pc.ballSizeRaw += 1;
			}

			output(" The new weight catches you by surprise as");
			if(pc.balls == 1) output(" it");
			else output(" they");
			if(pc.balls == 1) output(" hangs");
			else output(" hang");
			output(" lower and larger than before. <b>The size of your [pc.balls] has increased!</b>");
			break;
			
		case "vagina":
			// Increase vaginal wetness of PC and make a squirter, if not already. If available, move wetness beyond squirter value and allow for collection/measurement like cum/milk.
			
			output("\n\nDeep inside of your [pc.vaginas], you feel a warm, pleasurable sensation begin to form. It builds and builds until the dams break, and a wellspring of [pc.girlCumVisc] juice comes flooding from your [pc.thighs]. Your legs quake and tremble as spurts of [pc.girlCum] jump from your soppy slit");
			if (pc.vaginas.length > 1) output("s");
			output(".");
			
			for (var i:int = 0; i < pc.vaginas.length; i++)
			{
				if ((pc.vaginas[i] as VaginaClass).wetnessRaw < 4) pc.vaginas[i].wetnessRaw = 4;
				else pc.vaginas[i].wetnessRaw += 0.1;
			}
			
			output(" <b>Your vaginal wetness has increased"); 
			if (!pc.isSquirter()) output(" and you are now a squirter");
			output("!</b>");

			break;
	}
}

public function vanaeHeader(preName:String):void
{
	if (enemy is MaidenVanae)
	{
		showBust("VANAE_MAIDEN");
		showName(preName + "MAIDEN");
	}
	else
	{
		showBust("VANAE_HUNTRESS");
		showName(preName + "HUNTRESS");
	}
	author("Jim T");
}

public function vanaePCVictory():void
{
	vanaeHeader("VICTORY:VANAE\n");
	
	// HP WIN
	if (enemy.HP() <= 1)
	{
		output("You land the final blow on your opponent, sending her sprawling to the ground. She seems unable to continue the fight, coughing as she grabs her side. There is shock and fear written all over her face.");

		if (enemy is HuntressVanae)
		{
			output("\n\n<i>“W-what manner of");
			if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.raceShort]");
			else output(" creature");
			output(" are you? I’ve never failed at an ambush before!”</i> the vanae huntress exclaims. Her spear is lying far away from her now. She’s completely at your mercy...");

			output("\n\n<i>“...I guess that’s that, then. You’re going to kill me, right? Go right ahead. I’m ready.”</i>");
		}
		else
		{
			output("\n\n<i>“I-I-I lost! I can’t believe it, I can’t believe this is happening. I failed my first hunt, and now I’m going to die!”</i> the vanae maiden babbles, clearly in a state of panic. She then curls up into a ball and begins to rock gently back and forth.");

			output("\n\nHer spear is lying far away from her now. She’s completely at your mercy. What will you do with her?");
		}
	}
	else
	{
		if (enemy is HuntressVanae)
		{
			output("The busty huntress can’t take it any longer, letting out a sweet cry as she falls to the ground. All the while she’s stroking her [enemy.clits], gazing at you as she masturbates furiously.");

			output("\n\n<i>“Oh sweet Sky Mother, I can’t take it any longer");
			if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" - I don’t care if you are [pc.aRaceShort]");
			output(". Please, just fuck me!”</i> she whimpers, plunging her index finger inside of her drooling snatch. She lewdly spreads her [enemy.legs] just so you can see just how sopping wet she is.");
		}
		else
		{
			output("The virgin huntress can’t take it any longer, letting out a sweet cry as she falls to the ground. All the while she’s stroking her [enemy.clits], gazing at you as she masturbates furiously.");

			output("\n\n<i>“Oh sweet Sky Mother, I’ve never been so horny in all my life! Please, can you fuck me? I don’t care where!”</i> she whimpers, madly fingering her unsullied snatch. She lewdly spreads her [enemy.legs] just so you can see just how sopping wet she is. <i>“...Please?”</i>");
		}

		output("\n\nShe’s so worked up right now, you’re pretty sure you could get her to do just about anything.");
	}

	// MERGE ALL (HP & LUST)

	if (pc.lust() >= 33)
	{
		output("\n\nDo you succumb to your darker, carnal desires and");
		if (!pc.isAss()) output(" ask to");
		output(" fuck the other-worldly");
		if (enemy is HuntressVanae) output(" woman");
		else output(" maiden");
		output("? Or do you just leave her be?");
	}
	else
	{
		output("\n\n<b>You’re not turned on enough to take advantage of your defeated foe.</b>");
	}
	
	// VANAE HUNTRESS OPTIONS
	clearMenu();

	if (pc.lust() >= 33)
	{
		if (enemy is HuntressVanae)
		{
			// Vaginal
			if (pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) != -1 && pc.genitalSpot < 2) addButton(0, "Vaginal Sex", vanaeVictorySexIntro, "vaginal", "Vaginal Sex", "Fuck the huntresses pussy.");
			else
			{
				if (!pc.hasCock()) addDisabledButton(0, "Vaginal Sex", "Vaginal Sex", "You need a cock to fuck the huntresses vagina.");
				else if (pc.cockThatFits(enemy.vaginalCapacity(0)) == -1) addDisabledButton(0, "Vaginal Sex", "Vaginal Sex", "Your cock is simply too big to fuck her vagina.");
				else addDisabledButton(0, "Vagial Sex", "Vaginal Sex", "Your Tab-As are in the wrong place to fit into her Slot-Bs!");
			}

			// Tittyfuck
			if (pc.hasCock() && pc.longestCockLength() >= 3) addButton(1, "Tit Fuck", vanaeVictorySexIntro, "titfuck", "Tit Fuck", "Slide your cock between those juicy tits.");
			else
			{
				if (!pc.hasCock()) addDisabledButton(1, "Tit Fuck", "Tit Fuck", "You need a cock to fuck the huntresses tits.");
				else if (pc.longestCockLength() < 3) addDisabledButton(1, "Tit Fuck", "Tit Fuck", "Your cock is too short to fuck the huntresses tits.");
			}

			// Requires one cock, any size.
			// Must have Cock
			// Must have front or mid genitals.
			if (pc.hasCock() && pc.genitalSpot < 2) addButton(2, "Squirt n Jerk", vanaeVictorySexIntro, "squirtnjerk", "Squirt N Jerk", "Have the huntress jerk you off with her tentacles whilst dribbling her milk all over you.");
			else
			{
				if (!pc.hasCock()) addDisabledButton(2, "Squirt n Jerk", "Squirt n Jerk", "You need a cock to get a milky-jerkbath.");
				else if (pc.genitalSpot >= 2) addDisabledButton(2, "Squirt n Jerk", "Squirt n Jerk", "Your cock’s in the wrong place for a milky-jerkbath.");
			}
			
			// PC gets eaten out
			if (pc.hasVagina() && pc.genitalSpot < 2) addButton(3, "Cunnilingus", vanaeVictorySexIntro, "cunnilingus", "Cunnilingus", "Have the huntress eat you out.");
			else
			{
				if (!pc.hasVagina()) addDisabledButton(3, "Cunnilingus", "Cunnilingus", "You’d need a cunt if you want the huntress to eat you out.");
				else if (pc.genitalSpot >= 2) addDisabledButton(3, "Cunnilingus", "Cunnilingus", "You’d need front-mounted genitals for the huntress to eat you out.");
			}

			// 69 whilst getting a blowjob
			// 4 * 12, min 6", spot 0
			if (pc.hasCock() && pc.cockThatFits(217) != -1 && pc.genitalSpot < 2) addButton(4, "69 - BJ", vanaeVictorySexIntro, "69bj", "Blowjob 69", "Have the huntress suck your cock whilst you return the favor.");
			else
			{
				if (!pc.hasCock()) addDisabledButton(4, "69 - BJ", "69 - BJ", "You need a cock to partake of a 69 whilst receiving a blowjob.");
				else if (pc.cockThatFits(217) == -1) addDisabledButton(4, "69 - BJ", "69 - BJ", "Your cock is too big for the Vanae to handle.");
				else if (pc.longestCockLength() < 6) addDisabledButton(4, "69 - BJ", "69 - BJ", "Your cock is too short for the Vanae to properly lavish it with the attention it requires.");
				else if (pc.genitalSpot >= 2) addDisabledButton(4, "69 - BJ", "69 - BJ", "Your cock is in the wrong place to support 69 positions.");
			}

			// 69 whilst getting eaten out
			if (pc.hasVagina() && pc.genitalSpot < 2) addButton(5, "69 - Cunni", vanaeVictorySexIntro, "69cunni", "Cunnilingus 69", "Eat the huntress out whilst she returns the favor.");
			else
			{
				if (!pc.hasVagina()) addDisabledButton(5, "69 - Cunni", "69 - Cunni", "You need a pussy to partake of a 69 whilst getting eaten out.");
				else if (pc.genitalSpot >= 2) addDisabledButton(5, "69 - Cunni", "69 - Cunni", "Your pussy is in the wrong place to support 69 positions.");
			}

			// Two scene versions like 69 - Vag or Anal. Must have Vag to choose Vag version. Female/Herm can choose either version.
			// NOT vag or ass, so females/herms can get assplay.
			// No size requisites. Size of tentacle is 2/3rds PC capacity (As she can use the tip or the base). If needed, max out at seven inches girth and 60 inches long.
			if (pc.hasVagina()) addButton(6, "TentaSex - Vag", vanaeVictorySexIntro, "tentacunt", "Vaginal Tentacle Sex", "Have her put those interesting looking tentacles to work on your pussy.");
			else addDisabledButton(6, "TentaSex - Vag", "TentaSex - Vag", "You need a pussy in order to get it reamed with the huntresses tentacles.");
			addButton(7, "TentaSex - Ass", vanaeVictorySexIntro, "tentabutt");

			addButton(8, "Milk Bath", vanaeVictorySexIntro, "milkbath");

			// [Vaginal Sex] [Tit Fuck] [Nipple Fuck] [Squirt & Jerk] [Cunnilingus] 
			// [Sixty Nine - BJ] [Sixty Nine - Cunni] [Tenta Sex - Vag] [Tenta Sex - Anal] [Milk Bath]
			
			if(pc.hasTail(GLOBAL.TYPE_COCKVINE))
			{
				//scene is currently cockvine only; can be tweaked for future suitable (i.e. with own gonads) types
				addButton(9,"UseTailCock",cockvineTailPlusVanaeVictory,undefined,"Use Tailcock", "Let the busty, blind cumslut impregnate herself with your parasitic, vine-spawning tail-cock.");
			}
			else
			{
				if(!pc.hasCock()) addDisabledButton(9,"UseTailCock","Use Tailcock","You don’t have any cocks, let alone parasitic ones.");
				else addDisabledButton(9,"UseTailCock","Use Tailcock","You don’t have a cock able to parasitize the vanae.");
			}
			//Cuff&Fuck
			cuffNFuckButton(10, enemy);
		}
		else
		{
			// Cowgirl Virginity Takin'
			// Cock, it fits 12 * 4, front/mid genitals
			if (pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) != -1 && (pc.genitalSpot == 0 || pc.genitalSpot == 1))
			{
				addButton(0, "Cowgirl", vanaeVictorySexIntro, "maiden_virginity", "Cowgirl", "Pop her cherry by having her ride your cock, cowgirl style.");
			}
			else
			{
				if (!pc.hasCock()) addDisabledButton(0, "Cowgirl", "Cowgirl", "You’d need to a cock to allow the Vanae to ride you.");
				else if (pc.genitalSpot > 1) addDisabledButton(0, "Cowgirl", "Cowgirl", "Your Tab-As are in the wrong place to fit into her Slot-Bs!");
				else addDisabledButton(0, "Cowgirl", "Cowgirl", "Your cock is simply too big for the Vanae to take.");
			}

			// No requirements
			addButton(1, "Cunnilingus", vanaeVictorySexIntro, "maiden_cunni", "Cunnilingus", "Claim her alien pussy with your mouth and eat her out.");
			
			if(pc.hasTail(GLOBAL.TYPE_COCKVINE))
			{
				addButton(2,"UseTailCock",cockvineTailPlusVanaeVictory,undefined,"Use Tailcock", "Trick the poor, sweet, blind girl into giving her maidenhead to your parasitic tail-cock.");
			}
			else
			{
				if(!pc.hasCock()) addDisabledButton(2,"UseTailCock","Use Tailcock","You don’t have any cocks, let alone parasitic ones.");
				else addDisabledButton(2,"UseTailCock","Use Tailcock","You don’t have a cock able to parasitize the vanae.");
			}
			//Cuff&Fuck
			cuffNFuckButton(3, enemy);
		}
	}
	else
	{
		if (enemy is HuntressVanae)
		{
			// Vaginal
			addDisabledButton(0, "Vaginal Sex");
			addDisabledButton(1, "Tit Fuck");
			addDisabledButton(2, "Squirt n Jerk");
			addDisabledButton(3, "Cunnilingus");
			addDisabledButton(4, "69 - BJ");
			addDisabledButton(5, "69 - Cunni");
			addDisabledButton(6, "TentaSex - Vag");
			addDisabledButton(7, "TentaSex - Ass");
			addDisabledButton(8, "Milk Bath");
			addDisabledButton(9, "UseTailCock");
		}
		else
		{
			addDisabledButton(0, "Cowgirl");
			addDisabledButton(1, "Cunnilingus");
			addDisabledButton(2, "UseTailCock");
		}
	}
	
	addButton(14, "Leave", noThanksTentaSlutImOut);
}

public function noThanksTentaSlutImOut():void
{
	clearOutput();
	vanaeHeader("VICTORY:VANAE\n");
	
	output("You shake your head to clear the cobwebs out after your brief spat with the");
	if (enemy is MaidenVanae) output(" vanae maiden.");
	else output(" vanae huntress.");
	
	output("\n\nYou scavenge through her dropped equipment, looking for anything that might be of use, before quickly and quietly leaving the area.");
	
	output("\n\n");
	
	processTime(15 + rand(5));
	CombatManager.genericVictory();
}

public function vanaeVictorySexIntro(scene:String):void
{
	// Clicking on any Sex Option
	clearOutput();
	vanaeHeader("VICTORY:VANAE\n");
	output("You can’t help it, she is just too damn hot. There’s no way you are going to just leave without");
	if (!pc.isAss()) output(" seeing if she’s up for a tumble");
	else output(" hitting that");
	output(".");


	// if (HP DEFEAT)
	if (enemy.HP() <= 1)
	{
		if (pc.isNice())
		{
			output("\n\nYou tell her you’re not planning to kill her because you’re just not that kind of person. Instead, you’d like to patch things up by having sex instead. You make sure to make it a request and not a demand, since you don’t want to force her into anything.");
		}
		else if (pc.isMischievous())
		{
			output("\n\nYou tell her you’re not going to kill her, but you <i>would</i> really like to fuck her. Seems like a fair enough trade since she did try to beat you senseless, after all.");
		}
		if (!pc.isAss())
		{
			output("\n\nThe [enemy.hairColor] headed huntress appears completely floored. Instead of ending her life you are letting her live and, on top of that, politely asking to have sex with her. ");

			// IF VANAE HUNTRESS
			if (enemy is HuntressVanae)
			{
				output("\n\n<i>“Y-you want to breed with me willingly, after I tried to attack you? Um... sure!”</i> Her cheeks flush. Suddenly she’s acting quite coy. <i>“...");
				if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" You’re really strange, for [pc.aRaceShort]. You’re quite different from others of your kind");
				else output(" You really aren’t from around here, are you? I’ve never met an off-worlder like you before");
				output(".”</i>");
			}
			//IF VANAE MAIDEN
			else
			{
				output("\n\n<i>“Y-you’re serious? Really? You’re not just messing with me?”</i> The girly huntress lifts her head and releases her legs. You’d swear she was looking at you, but her eyelids are firmly closed. <i>“...You’re not a normal");
				if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.raceShort]");
				else output(" off-worlder");
				output(", are you? I mean, I don’t have much experience to speak of, but I’m pretty sure this isn’t normal. You’re supposed to eat me or something.”</i>");
			}
		}

		if (pc.isMischievous())
		{
			// IF VANAE MAIDEN
			if (enemy is MaidenVanae)
			{
				output("\n\nYou quip that it’s still early, and there’s plenty of time left to eat her. She giggles a little at the innuendo, clearly letting her guard down. In turn, you let down yours. You’re pretty sure she’s not going to try anything.");
			}
			else
			// IF NOT VANAE MAIDEN
			{
				output("\n\nYou quip that it’s understandable, since you’re one of a kind. She doesn’t seem to get the joke, though. Your gut tells you she’s not going to try anything funny, so it’s okay to let your guard down.");
			}
		}

		if (pc.isAss())
		{
			output("\n\nYou give her a menacing stare and tell her you’re not going to kill her, but she better make reparations for trying to brain you - sexually. And if she tries anything funny, you’ll make damn sure she regrets it.");
			
			// IF VANAE HUNTRESS
			if (enemy is HuntressVanae)
			{
				output("\n\nThe violet headed huntress quivers as you stare at her. She seems glad that you’re letting her live, but at the same time, terrified by the tone of your voice. <i>“Y-you want to breed with me willingly, after I tried to attack you, off-worlder? Um... sure! W-what would you like me to do?”</i>");
			}

			// IF VANAE MAIDEN
			else
			{
				output("\n\nThe pink headed huntress quivers as you stare at her. She seems glad that you’re letting her live, but at the same time, terrified by the tone of your voice. <i>“Y-you’re serious? You’re not going to eat me? What would you like me to do, then?”</i>");
			}
		}
	}

	output("\n\nYou inform the conquered amazoness that you");
	if (pc.isAss()) output(" are going");
	else output(" would like");
	output(" to");

	var action:String = "";
	var functor:Function = null;
	var arg:* = undefined;

	switch(scene)
	{
		case "maiden_virginity":
			action = "take her virginity with her on top";
			functor = vanaeMaidenTakeVirginity;
			break;
		
		case "maiden_cunni":
			action = "take her virginity with her on bottom";
			functor = vanaeMaidenCunnilingus;
			break;
		
		case "vaginal":
			action = "fuck her [enemy.pussy]";
			functor = vanaeHuntressVaginalSex;
			break;

		case "nipplefuck":
			action = "fuck her [enemy.nipples]"; // ????
			break;

		case "titfuck":
			action = "fuck her [enemy.breasts]";
			functor = vanaeHuntressTitfuck;
			break;
		
		case "squirtnjerk":
			action = "have her squirt her [enemy.milk] all over [pc.eachCock] and jerk you off with her tentacles";
			functor = vanaeHuntressSquirNJerk;
			break;
		
		case "cunnilingus":
			action = "have her eat out your [pc.cunt]";
			functor = vanaeHuntressEatsPCCunt;
			break;

		case "69bj":
			action = "eat out her [enemy.pussy] while she returns the favor";
			functor = vanaeHuntress69;
			arg = "69bj";
			break;

		case "69cunni":
			action = "eat out her [enemy.pussy] while she returns the favor";
			functor = vanaeHuntress69;
			arg = "69cunni";
			break;
		
		case "tentacunt":
			action = "have her fuck your [pc.vagina] with that tail of hers";
			functor = vanaeHuntressTentaSex;
			arg = "tentacunt";
			break;
		
		case "tentabutt":
			action = "have her fuck your [pc.ass] with that tail of hers";
			functor = vanaeHuntressTentaSex;
			arg = "tentabutt";
			break;
		
		case "milkbath":
			action = "have her bathe you in her [enemy.milk]";
			functor = vanaeHuntressMilkBath;
			break;
		
		default:
			action = "Couldn’t find action text for " + scene;
			break;
	}

	output(" " + action);

	if (enemy.lust() >= enemy.lustMax())
	{
		output(". She seems to shiver with anticipation, clearly willing to"); 
		if (pc.isAss()) output(" carry out your command");
		else output(" fulfill your request");
		output(".");

		// if Vanae Maiden & not 69 Cunni & not lust loss
		if (enemy is MaidenVanae && scene != "69cunni")
		{
			output("\n\n<i>“I’ve never done that sort of thing before. So be patient with me, okay?”</i> she meekly requests, looking you up and down. She seems uncertain how to proceed, hindered by her lack of experience. ");
		}
	}

	// MERGE

	if (!pc.isNude())
	{
		output("\n\n<i>“Um, you’re wearing clothes... so I should...”</i> Her words trail off as you begin to strip off your [pc.gear], causing her to lose her train of thought. ");
		//if (!(pc.armor is EmptySlot) || !(pc.upperUndergarment is EmptySlot)) output(" You expose yourself to her, momentarily holding your breath, waiting for her response. At the sight of your bare [pc.chest], her breathing grows shorter, heavier, and you can feel the warmth of her breath on your half-naked body.");
		if(pc.isChestGarbed())
		{
 			output("As your [pc.chest]");
 			if(pc.biggestTitSize() >= 1 && (pc.breastRows.length > 1 || pc.breastRows[0].breasts > 1)) output(" are");
 			else output(" is");
 			output(" exposed, her");
		}
		else output("Her");
		output(" breathing becomes quite ragged, clearly aroused by the sight of your half-naked body.");

		if (pc.hasCock() || pc.hasVagina())
		{
			output(" Even more blood rushes to her cheeks as");
			if (pc.hasCock()) output(" [pc.eachCock]");
			if (pc.hasCock() && pc.hasVagina()) output(" and");
			if (pc.hasVagina()) output(" [pc.eachPussy]");
			if (pc.hasCock() && pc.hasVagina() || pc.cocks.length > 1 || pc.vaginas.length > 1) output(" are");
			else output(" is");
			output(" exposed. Her [enemy.lips] part with fervent anticipation, each breath heavy with");
			if (enemy is MaidenVanae) output(" indescribable");
			else output(" carnal");
			output(" longing.");
		}
		else
		{
			output("\n\nWhen your [pc.groin] is exposed you can see she looks a little disappointed and more than a little confused. It’s clear she’s never come across someone like you before. ");

			output("\n\nYou tell her that you’re going to enjoy her efforts even though you don’t have anything down there, and she seems to take your word for it.");
		}
	}

	clearMenu();
	addButton(0, "Next", functor, arg);
}

public function vanaeMaidenTakeVirginity():void
{
	var selCock:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(selCock < 0) selCock = pc.smallestCockIndex();
	var pcWonFight:Boolean = false;
	
	
	// Won fight
	if (enemy.lust() >= enemy.lustMax() || enemy.HP() <= 1)
	{
		clearOutput();
		vanaeHeader("VICTORY:VANAE\n");
		
		pcWonFight = true;

		output("Getting down on all fours, the youthful huntress reaches down and tentatively touches [pc.oneCock]. She lets out a surprised noise as her slender fingers dance along your length. It is clearly the first time she’s ever felt a cock, let alone one like yours.");

		output(" <i>“...");
		if (pc.cocks[selCock].cLength() <= 5) output(" It’s smaller than I thought");
		else if (pc.cocks[selCock].cLength() >= 10) output(" It feels so large");
		else output(" It feels so soft");
		output(" and so strangely shaped! I’ve never touched a male sex organ before.”</i> Her cheeks flush. As you begin to swell and stiffen she jumps back in surprise. <i>“...It moves?! Mine doesn’t do that!”</i>");

		output("\n\nYou tell her that it’s perfectly normal, and she seems to settle down. She then begins to position herself above your [pc.cock " + selCock + "]. You can see right up her short tentacle skirt, getting an eyeful of her bald [enemy.pussyNoun] and [enemy.clits].");

		output("\n\nSlowly crouching down on top of you, she grabs your [pc.cock " + selCock +"] with one hand and rubs it against her moist, virginal slit. Since she’s rushed to put you inside of her, you’re not hard enough, and your [pc.cockHead " + selCock + "] keeps refusing to press inside of her entrance.");

		output("\n\n<i>“Um, it’s not going in...?”</i> the virgin huntress questions you, clearly not getting the problem. After you explain you need to be more aroused first, she flushes harder. <i>“Oh! You’re not aroused? Don’t you find me attractive enough? What if I do this?”</i>");

		output("\n\nShe leans forward and presses her [enemy.breasts] against your [pc.face]. Her [enemy.nipples] drag across the [pc.skinFurScales] of your cheek as she tries her hand at seduction. The floral aroma of her [enemy.skin] fills your nostrils, innocently accompanied by the sweet scent of her arousal.");

		output("\n\nHer silky unblemished skin and awkward attempts at arousal are cute and still have the desired effect, [pc.eachCock] becoming steadily more rigid. The amateur huntress lets out a delighted noise as you jerk and stiffen between her webbed fingers, her [enemy.breasts] pressing eagerly against you.");

		output("\n\n<i>“...Good! I knew I could be sexy, at least if I really tried.”</i> The young woman smiles triumphantly, your erect [pc.cockNoun " + selCock + "] gripped in her slender fingers. <i>“So... this bit I’m not so sure about.");
		if (pc.cocks[selCock].cLength() <= 5) output(" But you’re small enough, it should be okay...");
		else if (pc.cocks[selCock].cLength() >= 10) output(" You’re pretty big, I’m not sure you’ll even fit...");
		else output(" Be gentle, okay?");
		output("”</i>");

		output("\n\n");
	}
	else
	{
		vanaeHeader("DEFEAT: VANAE\n");
		output("\n\n");
	}

	// NOTE: Both Win and Loss versions of this scene are identical from this point on. When putting in the Loss Scene, merge here and take everything below this line.

	output("The virgin huntress descends nervously on your [pc.cock " + selCock + "] and presses your [pc.cockHead " + selCock + "] against her [enemy.pussy]. You let out a low moan as you feel her narrow entrance slowly part around your");
	if (pc.cocks[selCock].hasFlag(GLOBAL.FLAG_TAPERED) <= 5) output(" equally tiny");
	else if (pc.cocks[selCock].hasFlag(GLOBAL.FLAG_FLARED) || pc.cocks[selCock].hasFlag(GLOBAL.FLAG_BLUNT)) output(" massive");
	else output(" swollen");
	output(" tip, kissing and squeezing your sensitive flesh.");
	if (pc.cockVirgin == true) output(" It’s a first for both of you.");
	
	// Virginity check.
	var lostVirginity:Boolean = pc.cockChange(true, false);

	output("\n\nYour [pc.cockHead " + selCock + "] presses against her maidenhead, and you can see her wince.");
	if (!pc.isAss()) output(" To make things easier, you grab her [enemy.ass] and stroke it, distracting her from the pain. When you’re sure she’s ready, you ease your [pc.cockNoun " + selCock + "] forward and claim her womanhood. As gentle as you are, she still lets out a sharp cry");
	else output(" You know she’s going to feel pain either way, so you don’t screw around. With a single thrust you claim her womanhood, causing her to let out a sharp cry");
	output("."); 

	output("\n\nYou feel a warm trickle down your [pc.cock " + selCock + "] from her deflowering as she wraps her arms around your neck. <i>“It’s okay - keep going. I can take it.”</i>");
	if (!pc.isAss()) output(" At her insistence, you");
	else output(" You");
	output(" do just that, sliding your [pc.cock " + selCock + "] deeper into her virgin [enemy.pussyNoun]. Her untraversed insides part around your swelling cock and mold freshly to your [pc.cockShape " + selCock + "] cock’s shape.");

	output("\n\nHer pussy is lined with hundreds of little bumps which pleasurably stroke your [pc.cockNoun " + selCock + "] as you push further inside of her. Finally your [pc.cockHead " + selCock + "] is resting against her deepest point. You swell with the knowledge you have completely deflowered and claimed her amazonian [enemy.pussyNoun], every inch now squeezing around your throbbing length.");

	output("\n\n<i>“It stings a little, but at the same time, feels really good.”</i> the young huntress breathily exclaims, wiggling her [enemy.ass] in your lap. Her movements cause your [pc.cock " + selCock + "] to churn around deep inside of her [enemy.pussy], forcing a girlish moan from her [enemy.lips].");

	output("\n\nAll of a sudden there is a shifting sensation around your [pc.cock " + selCock + "] and it feels as if it is being licked by hundreds of tiny tongues. You realize that her [enemy.pussy] is not lined with bumps, but feelers lying flush. Now awake for the first time, they lap eagerly at your length inside her incredibly narrow passage. As alien as it is, it feels <i>sooo good</i>.");

	output("\n\nYou reel and wonder how after this you’re ever going to");
	if (pc.cockVirgin || lostVirginity) output(" go back to sex with regular, terran women");
	else output(" be able to use your hand to get off ever again");
	output(". You’re utterly hooked on her wriggling alien [enemy.pussyNoun]");
	if (silly) output(" and now that you’ve gone vanae, you’re not sure you’ll ever keep away");
	output("!");
 
	output("\n\nShe seems just as excited by you as she grinds her hairless mound against your");
	if (pc.balls > 0) output(" [pc.sack]");
	else output(" [pc.base " + selCock + "]");
	output(". Her juices excitedly dribble down your length, and her velvety soft feelers lick your length from point blank range. Meanwhile, she hugs your neck and presses her [enemy.breasts] excitedly against your [pc.face].");

	output("\n\nSoon the inexperienced huntress is bouncing and wiggling madly on your lap, losing herself to pleasure as she rides your [pc.cock " + selCock + "]. <i>“I’ve never felt anything like this before, it feels as if I’m flying!”</i> she whimpers. All the while, her alien insides lash, clench, and drool excitedly around your length.");

	output("\n\nIn your mind, you can’t believe an alien virgin is bouncing up and down on your [pc.cock " + selCock + "], about to gush all over your throbbing length. The image of you spurting your [pc.cum] deep inside of her previously unclaimed [enemy.pussyNoun] gets you incredibly hot, and soon you find yourself utterly losing control.");

	output("\n\nYour body moves on instinct as you seize her hips in your hands. Both of you frantically and feverishly grind against each other, pushing each other to even greater heights. She reaches the peak first, creaming herself in your lap as she shudders and jets her [enemy.girlCum] around your [pc.cock " + selCock + "]. It’s not long before you follow, shooting your load inside her unsullied, virgin depths and marking her insides with your [pc.cumNoun].");

	output("\n\nYou");
	var cumQ:Number = pc.cumQ();
	if (cumQ <= 50) output(" splatter and spurt tiny dribbles");
	else if (cumQ <= 200) output(" gloriously shoot spasmic jets");
	else output(" gloriously unload thick jets");
	output(" of hot, [pc.cumVisc] jism deep inside of her, sullying her untouched womb with your [pc.cumNoun]. All the while she trembles in your lap and receives your spunk inside of her, feeling it spatter blissfully inside her inner walls.");
	
	enemy.loadInCunt(pc, 0);
	vanaeSimplePreg();
	pc.orgasm();
	enemy.orgasm();

	output("\n\nWhen she pulls away from you, you can see a definite glow to her features and a bright smile on her face. <i>“...My first time... I never thought it would be so good. And because you came inside of me, I’m going to be pregnant!”</i>");

	// IF FIRST TIME
	if (StatTracking.getStat("characters/maiden vanae/cherrys popped") == 0)
	{
		output("\n\nThe deflowered huntress rubs her belly and realization hits you like a ton of bricks. Pregnant?! Your Codex brings you up to speed.");

		output("\n\n<i>“Vanae breed by hunting males and engaging in vaginal intercourse, "+ pc.mf("Master", "Mistress") +" Steele. Due to their incredible fertility, pregnancy is almost always assured. A vanae maiden is exceptionally fertile compared to others of her species.”</i>");

		output("\n\nIn other words, there’s a ridiculously high chance that you just got her pregnant. Your Codex asks if you want it to add a name to the Steele family register.");

		output("\n\nWhen you turn your attention back to the amazonian huntress, however, she’s nowhere to be found. Did she take off when you weren’t looking? You wonder if you’ll ever see her again.");
	}
	else
	{
		output("\n\nYour Codex tentatively asks if you’d like to add <i>another</i> entry to the Steele family register. You chew it out for its sass, and when you look up you realize the amazonian huntress is nowhere to be seen. You wonder if you’ll ever see her again.");
	}

	StatTracking.track("characters/maiden vanae/cherrys popped");

	processTime(30+rand(10));
	
	output("\n\n");
	
	if (pcWonFight) CombatManager.genericVictory();
	else CombatManager.genericLoss();
}

public function vanaeMaidenCunnilingus():void
{
	var pcWonFight:Boolean = false;
	
	if (enemy.lust() >= enemy.lustMax() || enemy.HP() <= 1)
	{
		clearOutput();
		vanaeHeader("VICTORY:VANAE\n");
		
		pcWonFight = true;
		
		output("You tell the virgin huntress to lie back on the ground and spread her [enemy.thighs]. She meekly obeys your command, getting down and parting them as far as she can. She bashfully exposes the vulnerable pink-tinted skin of her inner loins to you, letting you drink it up with your hungry eyes. ");

		output("\n\nHer webbed hands come down and part her short tentacle skirt. Her [enemy.pussyNoun] is cute and pink, two tiny clits poking out from her puffy lips. You can see a glistening wetness on her unsullied flower, just begging to be licked off.");

		output("\n\nYou slink down between her [enemy.legs] and bring your [pc.face] inches away from her [enemy.pussy], inhaling the sweet scent of her arousal. She gives a pleasured shiver as you brush her girl parts with your [pc.lips]. As you tease them she wiggles eagerly on the spot, unable to contain the powerful sensations threatening to take over.");

		output("\n\n");
	}
	else
	{
		vanaeHeader("DEFEAT: VANAE\n");
		output("\n\n");
	}

	// NOTE: Both Win and Loss versions of this scene are identical from this point on. When putting in the Loss Scene, merge here and take everything below this line.

	output("Seeing her wiggle just from the touch of your lips gets you fired up and you feel your");
	if (pc.hasCock()) output(" [pc.cocks] stiffen and stir");
	else if (pc.hasVagina()) output(" own [pc.cunts] moisten with arousal");
	else output(" bare loins ache");
	output(". It turns you on to know you will be the first to plunge your tongue inside of her and savor the taste of her hairless alien pussy.");

	output("\n\nYou reach up with two fingers and part her dewy lower lips. Her scent is so strong, so powerful, and so delicious you positively ache with the desire to thrust your [pc.tongue] inside of her cute honey hole. It is a desire you immediately sate, pressing your [pc.lips] against her [enemy.pussy] and burying it inside of her.");

	output("\n\nThe maiden huntress lets out a sweet cry as your hungry tongue roams around wildly inside of her silky depths. You feel her bringing up her [enemy.legs] and resting them on your shoulders. As you eat her out, she wraps them around you and pulls you closer, eager to feel your tongue roaming every inch of her slick insides.");

	output("\n\nYou are surprised when your tongue breaches her to find hundreds of little feelers suddenly tickling your tongue tip, the insides of her [enemy.pussy] clearly more alien than the outside. At first it feels odd, but you quickly grow used to it. Continuing to lap out her insides, you are soon rewarded with a flood of her heavenly girl juice gushing onto your tongue.");

	output("\n\nMoaning and lapping up her cunny juice,");
	if (pc.hasCock()) 
	{
		output(" your [pc.cocks] feel");
		if(pc.cockTotal() == 1) output("s");
		output(" painfully stiff, as if you’re going to blow your load all over the ground without a single caress");
	}
	else output(" your own thighs tremble and squeeze together. You’re pretty sure you’re going to cream yourself without a single caress - you’re just that turned on by eating out the dainty huntress and tasting her sweet girl juice");
	output(". Your hands wrap around and grab her [enemy.butt], squeezing it firmly.");

	output("\n\nShe squeals with delight as you forcefully grope and knead her [enemy.ass] - the plethora of sensations sending her careening over the edge. With a sharp cry, her [enemy.legs] spasm and shake as she reaches that white hot peak. Her [enemy.girlCum] splashes and squirts all over your [pc.face] and [pc.tongue] as she utterly drenches you.");

	if (pc.hasCock() || pc.hasVagina())
	{
		output("\n\nHaving her girlishly spurt all over your face gets you so hot that you can’t stand it any longer");
		if (pc.hasCock()) output(" spastically shooting [pc.cum] from your [pc.cocks] and all over the ground");
		if (pc.hasVagina()) output(", creaming yourself right there and then. You cry out as [pc.eachVagina] spasms and your [pc.girlCum] gushes down your [pc.thighs]");
		output(". You muffle your mouth inside of her spasming [enemy.pussyNoun] as your face is utterly drenched in her [enemy.girlCum].");
		pc.orgasm();
		enemy.orgasm();
	}

	output("\n\nWhen you pull back, you notice she is lying back on the ground staring at you. Both of you are wearing the same deliciously dazed expression, breathing low and heavy in your orgasmic haze.");

	output("\n\n<i>“That was... that was amazing. I’ll never forget you, my first.”</i> the nubile huntress gets up and kisses you long and hard, your lips smeared with her own [enemy.girlCum].");

	if (pc.hasCock() || pc.hasVagina())
	{
		output(" Before she leaves, she scoops up what she can of your");
		if (pc.hasVagina()) output(" [pc.girlCum]");
		if (pc.hasVagina() && pc.hasCock()) output(" and");
		if (pc.hasCock()) output(" [pc.cum]");
		output(" and presses it into her [enemy.pussy], sealing it with some sticky milk from her tiny breasts.");
	}

	output("\n\nYou are left with a gloriously light sensation running through your entire body and a face covered in alien girl juice.");

	output("\n\n");
	
	processTime(30+rand(10));
	
	if (pcWonFight) CombatManager.genericVictory();
	else CombatManager.genericLoss();
}

public function vanaeHuntressVaginalSex():void
{
	clearOutput();
	vanaeHeader("VICTORY:VANAE\n");

	var selCock:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(selCock < 0) selCock = pc.smallestCockIndex();

	output("Warming you up first, the blind huntress gets down on all fours and grabs [pc.oneCock] in her webbed hands. You can feel flattened suckers on her palms brushing lightly against your flesh, your [pc.cock " + selCock + "] stiffening and swelling at her gentle touch.");

	if (pc.cocks[selCock].cLength() <= 3)
	{
	output("\n\nAs she strokes your [pc.cock " + selCock + "] she lets out a surprised noise, touching it a few times to be certain. <i>“Um, this is it? This feels a little too small - that can’t be right.”</i> You flush furiously, telling her that <i>is</i> your cock. She coughs a little, apologizing for her rudeness. <i>“I guess I’ve just never come across one this... cute and small.”</i>");
	}
	else if (pc.cocks[selCock].cLength() < 7)
	{
		output("\n\nAs the alien amazon touches your [pc.cock " + selCock +"] she lets out a pleased noise, stretching her webbed fingers around your [pc.sheath]. <i>“Mmm, I like this size. It should fit snugly in my [enemy.vaginaNounSimple],”</i> she practically purrs. Clearly, she’s a fan of your junk.");
	}
	else
	{
		output("\n\nAs the alien amazon touches your [pc.cock " + selCock +"] she lets out a surprised noise. Suddenly, she’s bringing around her second hand to touch your length, making certain that it is what she thinks it is. <i>“Surely it’s not this big - and you want to put that inside of me?!”</i> Clearly, she has doubts if it will even fit inside of her.");

		output("\n\nYou assure her it will despite your size, though she looks dubious. <i>“If you leave me ruined from your stupidly huge cock, I’m holding you responsible,”</i> she warns.");
	}

	output("\n\nOnce she finishes appraising your [pc.cock " + selCock + "] she stretches out her [enemy.tongue], gently lapping at your [pc.cockhead " + selCock +"]. The bumps of her tongue bristle and stroke your sensitive glans, her saliva drooling lewdly on it and down your [pc.cock " + selCock +"]. Soon she is moving down, her tongue curling hungrily around the underside of your shaft. You quickly stiffen and groan as she masterfully lashes your length, leaving it rigid and glistening in her spit.");

	if (pc.balls > 0)
	{
		output("\n\nDescending further, she suckles and slowly kisses your [pc.balls], lavishing");
		if (pc.balls == 1) output(" it");
		else output(" them");
		output(" with loving, tender licks. Her tongue then slides under and around your [pc.sack],");
		if (!pc.hasVagina()) output(" her tongue-tip lapping at the sensitive flesh between your orbs and your [pc.asshole]");
		else output(" her tongue-tip lashing at your [pc.pussy]");
		output(". You moan and arch your back at the incredible feeling of the feminine huntress lashing at your");
		if (!pc.hasVagina()) output(" dirty erogenous zone, pressing your [pc.sack] against her nose as she hungrily inhales your sweaty ball musk");
		else output(" lady parts, hungrily inhaling the scent of your drooling snatch as you hump her mouth. It feels so damn good");
		output("!");
	}
	else if (pc.hasVagina())
	{
		output("\n\nHeading lower, she slides her tongue along your [pc.onePussy] and teases it with her tongue. You moan and push your muff against her teasing tip, arching your back all the while. The feminine huntress continues to lash your lady parts, hungrily inhaling the scent of your drooling snatch as you hump her mouth. It feels so damn good!");
	}
	else
	{
		output("\n\nHeading lower, she slides her tongue into your [pc.butt], teasing your [pc.asshole] with expert precision. You moan and arch your back at the incredible feeling of the feminine huntress lashing at your dirty hole, pressing against her mouth as she sticks it in deep. Soon she’s hungrily lapping out your jack hole. It feels so damn good!");
	}

	output("\n\nWhen she stops you’re almost disappointed, stopping just short of shooting your load all over her [enemy.hair]. As you cool off, she gestures for you to sit yourself on a nearby rock. With [pc.eachCock] aching you sit down, waiting for what comes next. You don’t have to wait long. The vanae huntress is soon moving to stand over your lap, her [enemy.legs] slung to either side of you. It almost feels as if she’s going to give you a strip tease.");

	output("\n\nYou’re not far off as she spreads her tenta-skirt, giving you a nice long look at her [enemy.pussy]. Her [enemy.clits] protrude from the top of her violet labia lips, already engorged from licking your");
	if (pc.balls > 0) output(" [pc.sack]");
	else if (pc.hasVagina()) output(" [pc.pussy]");
	else output(" [pc.ass]");
	output(". You impulsively reach out and stroke them. The merest touch causes her to moan out loud, grabbing your shoulder as her [enemy.legs] tremble and shake. Clearly it is a <i>very</i> sensitive spot.");

	output("\n\nBatting your hand away with flushed cheeks, the pale huntress chastises you and then slowly descends on your [pc.cock " + selCock + "]. Soon you are brushing against her slick alien slit, her velvety lips stroking your [pc.cockHead " + selCock + "]. Jolts of pleasure surge down your staff and you let out a low, guttural moan. Your pre-cum drools all over her silky snatch, marking it prematurely with your [pc.cumColor] spunk.");

	output("\n\nUnwilling to wait a second longer, you slide your hands up her [enemy.thighs] and grab her [enemy.hips], pushing her down. She lets out a surprised cry as you impale her on your [pc.cockNounSimple " + selCock + "], sheathing yourself in her otherworldly [enemy.pussyNoun].");
	//Dick virginity check
	var lostVirgin:Boolean = pc.cockChange(true, false);

	output("\n\nImmediately you feel your [pc.cockHead " + selCock + "] being licked by hundreds of tiny feelers. It seems her pussy isn’t as normal as you first thought! The unique and powerful sensation forces a low moan from your throat as your [pc.cock " + selCock +"] sinks further inside of her otherworldly cooch. As alien as it is, it feels <i>good</i>.");

	output("\n\nYour hot flesh buries inside of her and you can feel her twitching and squeezing excitedly, her juices drooling around your pulsing length. She wraps her arms around your neck and presses her [enemy.breasts] against your chest, burying her face into your shoulder.");

	output("\n\nHer hairless mound is soon urgently rubbing against your");
	if (pc.balls > 0) output(" [pc.sack]");
	output(" [pc.base]");
	output(", gasping as your [pc.cock " + selCock + "] rubs around inside of her. You keenly feel her velvety soft feelers licking your length from every angle and causing you to reel with pleasure.");

	if (!lostVirgin) output("\n\nOnce you’ve mated with a pussy like this, you’re not sure you’ll <i>ever</i> be able to go back to having sex with a normal one. You might be ruined for life!");
	else output("\n\nIs... is every pussy as good as this?! You can’t believe you’ve gone without sex for so long before now. You’re not sure you’ll ever be the same again.");

	output("\n\n<i>“Oh sweet Sky Mother, your cock feels so good pressing deep inside of me!”</i> the busty huntress whimpers. As you stir around inside of her licking honey pot, her webbed fingers cling to your back, digging into your [pc.skinFurScales]. You keep a firm grip on her [enemy.hips] as she wiggles about; her alien insides pressing, lashing, and clenching excitedly around your [pc.cock " + selCock + "]. <i>“Fuck me harder,");
	if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" you damn [pc.raceShort]!");
	else output(" off-worlder!");
	output(" Shove your [pc.cock " + selCock + "] deep inside of me and fill my womb with your wonderful spunk. Breed me!”</i>");

	output("\n\nYou frantically begin bouncing her in your lap, causing her to let out a sweet, pleasured cry. A few hip thrusts later and she’s already spastically creaming herself in your lap. Her [enemy.pussy] clings desperately to you as she shudders and jets around your [pc.cock " + selCock + "], reaching that glorious pleasure peak.");

	output("\n\nYou don’t stop and continue to thrust up inside of her spasming, squirting hole with merciless abandon. She squeals out loud as her mind shatters into a million glorious pieces. The air is filled with lewd squelching and smacking noises as you pound her [enemy.pussy] from below. A second, madder orgasm soon follows, the delirious huntress biting into your shoulder hard as she struggles to contain her pleasured screams.");

	output("\n\nOne of her silky feelers slips inside of your cock hole and wiggles about, pushing you right over the edge. You shudder and drive your [pc.cock] as deep as you can inside of her, releasing your hot [pc.cumNoun] into her alien [enemy.vaginaNounSimple].");
	var cumQ:Number = pc.cumQ();
	if (cumQ <= 50) output(" While your orgasm feels truly explosive, you only dribble a small amount of your [pc.cumVisc] seed inside of her.");
	else output(" You batter the inside of her [enemy.pussy] with " + ((cumQ >= 1000) ? "gallons of " : "") + "your [pc.cumVisc] seed, your mind immediately engulfed by a blissful haze.");

	output("\n\nYour vanae lover then slides you out of her worn out [enemy.vaginaNounSimple]. You can see your [pc.cum]");
	if (cumQ <= 50) output(" dribbling");
	else if (cumQ <= 600) output(" oozing");
	else output(" gushing");
	output(" from her spasming fuck hole. Your [pc.cocks]");
	if (pc.cockTotal() == 1) output(" aches and stiffens");
	else output(" ache and stiffen");
	output(" at the glorious sight. She follows up by lapping and cleaning your [pc.cumVisc] [pc.cockNounSimple], making sure it is completely spotless.");

	enemy.loadInCunt(pc, 0);
	vanaeSimplePreg();
	pc.orgasm();
	enemy.orgasm();

	processTime(30+rand(10));
	clearMenu();
	addButton(0, "Next", vanaeHuntressPostVictoryScene);
}

public function vanaeHuntressTitfuck():void
{
	clearOutput();
	vanaeHeader("VICTORY:VANAE\n");

	output("The exotic huntress gestures for you to seat yourself on a nearby rock. You sit down and spread your [pc.legOrLegs]. As she walks over her [enemy.breasts] sway and bounce, causing your [pc.cocks] to stiffen with delicious anticipation.");

	output("\n\nApproaching you and getting on her knees, the busty amazon brings her webbed hands up to cup her [enemy.breasts], making her already impressive cleavage stand out. Her [enemy.nipples] drool her violet milk down her ample flesh, curling and dribbling down to her [enemy.belly]. There is a distinctly feminine scent in the air mixed with a fruity aroma, the latter coming from her nipple milk.");

	output("\n\nPressing both webbed hands against the sides of her [enemy.breasts] and giving a pointed squeeze, thick, gooey ropes of her violet milk spurt out of her [enemy.nipples]. Your [pc.cocks]");
	if (pc.balls > 0) output(" and [pc.balls]");
	output(" are suddenly splashed in the sticky substance.");

	output("\n\nLike a cow milking herself, she continues to press and squeeze her pale udders until your junk is utterly covered from tip to base. You bask in the sensation of her warm, slick liquid clinging to your sensitive rod");
	if (pc.cocks.length > 1) output("s");
	output(" as your body begins to undergo some changes.");

	vanaeTFScene();

	output("\n\nWith your [pc.cocks] covered in her slick milk and your own [pc.cumNoun], she takes them and squeezes them between her supple breast flesh. You can see her [enemy.nipples] hardening as her alien assets wrap around your [pc.cumVisc] rod");
	if (pc.cocks.length > 1) output("s");
	output(", making you even stiffer in turn. Soon her [enemy.breasts] are enclosed around your straining hardness.");

	output("\n\nYour mind is utterly blown as she begins to bounce her [enemy.breasts] up and down on your [pc.cocks]. Her warm, heavy weight slaps against your [pc.thighs]. Drunk with pleasure, you needily push your [pc.hips] up to meet her pale, creamy flesh, your lubricated [pc.cocksNounSimple] easily sliding back and forth between her slippery cleavage.");

	output("\n\nA musky, erotic scent fills the air as well as lewd slapping sounds. You are acutely aware of the fact you are being given a tit job by an alien amazon, on an exotic world far from civilized space. The thought makes your [pc.cocks] ache even more,");
	if (pc.cocks.length == 1) output(" a pearl");
	else output(" pearls");
	output(" of [pc.cumColor] emerging from your [pc.cockHeads] and smearing all over her prickled flesh. You let out a low sinful moan, letting your head fall back as your member");
	if (pc.cocks.length > 1) output("s are");
	else output(" is");
	output(" mercilessly pumped and pistoned.");

	output("\n\nYou’re not the only one drowning in pleasure, the vanae huntress pinching her erect nipples and letting out a husky moan. <i>“Mmm, please mark me and make a mess of me - I want you to stain my [enemy.breasts] with your [pc.cum],”</i> she begs, all the while pumping your aching firmness.");

	output("\n\nHearing her plead for your [pc.cum] all over her fleshy alien assets pushes you over the edge. You seize her [enemy.breasts] in both hands and begin ravishing them with lusty abandon. Each frantic thrust causes her to pant and moan, her violet milk spilling violently from her [enemy.breasts].");

	output("\n\nYou see white as a shockwave seizes your [pc.groin], an explosion of awesome, broiling pleasure traveling along your [pc.cocks] and erupting all over her [enemy.breasts]. Ridiculous amounts of [pc.cum] explode from your [pc.cockHeads] and splatter her [enemy.skin] as you shiver in blissful release. At the same time she lets out a sweet cry and gushes her slick violet milk all over your [pc.belly], clenching your [pc.cocks] hard in the throes of her own shuddering orgasm.");

	output("\n\nAs if on instinct, the alien huntress moans and wrings [pc.eachCock] between her [vanae.breasts] even as you both cum, milking you for every last drop of your hot jism. She doesn’t stop until you are completely spent all over her fleshy swells and her [pc.skin] is utterly marked with your [pc.cumColor] spunk.");

	pc.orgasm();
	enemy.orgasm();

	processTime(30+rand(10));
	clearMenu();
	addButton(0, "Next", vanaeHuntressPostVictoryScene);
}

public function vanaeHuntressEatsPCCunt():void
{
	// PC must have pussy and front/mid genitals.
	clearOutput();
	vanaeHeader("VICTORY:VANAE\n");

	output("The exotic huntress gestures for you to seat yourself");
	if (pc.isBiped()) output(" and spread your [pc.legs]");
	output(" down");
	output(". As soon as you do she sinks down onto her webbed hands and knees, crawling towards you just like a cat. Your breathing becomes heavy and your temperature rises several degrees as she slinks up");
	if (pc.legCount == 2) output(" between your [pc.legs]");
	output(", her [enemy.lips] pressed into a wicked smile.");

	output("\n\nYour heart races and you feel liquid fire spreading out from your lower belly. As she presses those perfect plush lips against your [pc.skinFurScales] a rush of excitement and arousal seizes your body. You let out a shameless little moan of pleasure, arching your back needily against her claiming mouth.");
	if (pc.legCount == 2) output(" Your [pc.legs] wrap instinctively around her waist, your [pc.feet] resting at the small of her back.");

	output("\n\nYou lie there complacently as the amazonian huntress travels upwards, kissing at your [pc.nipple]. You excitedly push your [pc.chest] forward, your eagerness rewarded as she seizes one of your buds. She catches it gently between her teeth and lashes the tip with her tongue, causing your mind to utterly dissolve into pleasure.");

	output("\n\nEventually she lets go of your captive [pc.nipple], sliding down your [pc.skinFurScales]. Soon she is kissing the upmost point of your [pc.vaginaNounSimple], causing delicious, molten pleasure to overtake your loins and your [pc.thighs] to tremble in ecstasy.");

	output("\n\nThe busty amazon parts the lips of your sex with her webbed fingers, massaging your passage with her masterful tongue. It’s not long before her mouth is full of your juices. You groan and raise your [pc.hips], allowing her further access as she laps at your insides.");

	output("\n\nAs her webbed hand reaches up and strokes your");
	if(pc.hasClit()) output(" [pc.clits]");
	else output(" labia");
	output(" you let out a delirious cry, reaching up and running your fingers through her [enemy.hair]. You dig them in as she eagerly delves inside of you, moaning as her [enemy.tongue] presses deep inside of your [pc.pussy].");

	output("\n\nWhen she pulls out you let out a disappointed noise, only to have it turn to a husky moan as");
	if(pc.hasClit()) output(" her [enemy.lips] slip around your [pc.oneClit]. As she suckles on it,");
	output(" her webbed fingers slip up and into your [pc.pussy], spreading your folds and slipping deep inside. Suddenly you’re enduring a two pronged assault, your pearl swirled and flicked in her mouth as her magical fingers sinfully screw your sex.");

	output("\n\nYour insides clench around her plunging fingers as you let out a sweet cry. Your [pc.legOrLegs] spasm");
	if(pc.legCount == 1) output("s");
	output(" as you well and truly cream yourself, your [pc.girlCum] gushing around her digits as you buck your hips wildly. She continues to stroke your innermost point, coaxing your orgasm out and playing your pulsing pussy like a fiddle. You cum so hard your mind goes utterly blank, losing all concept of who or where you are as you tremble and spasm in her webbed hands.");

	output("\n\nUtterly exhausted, your entire body goes limp at once, your mind spinning in a delirious haze. You are distantly aware that she’s pulled her fingers out from inside of you and is now lapping at your [pc.pussy], cleaning it off with several long, loving licks.");

	output("\n\nYou continue to float impossibly high as she makes sure not a drop of your [pc.girlcum] remains on your twitching twat, making sure it is slick and spotless. It gives you time to come back to your senses.");

	pc.orgasm();
	enemy.orgasm();

	processTime(30+rand(10));
	clearMenu();
	addButton(0, "Next", vanaeHuntressPostVictoryScene);
}

public function vanaeHuntress69(selScene:String):void
{
	// selScene == 69bj or 69cunni
	var isBj:Boolean;
	var isCunni:Boolean;

	if (selScene == "69bj")
	{
		isBj = true;
		isCunni = false;
	}
	else if (selScene == "69cunni")
	{
		isCunni = true;
		isBj = false;
	}
	else
	{
		trace("Vanae 69 scene called incorrectly.");
	}

	var selCock:int;

	if (isBj)
	{
		selCock = pc.cockThatFits(217);
		if(selCock < 0) selCock = pc.smallestCockIndex();
	}

	clearOutput();

	output("The busty alien huntress lies back on the ground, spreading her [enemy.thighs] wide. At the same time she parts her tenta-dress, exposing her [enemy.pussy] to your lusty gaze. As you look at her, she flushes, coyly spreading her legs even further apart. Her [enemy.clits] are poking out cutely from her puffy lips.");

	output("\n\nSpurred forward by lust, you walk around and slink down, moving forward so that your loins are in each other’s faces. You can see her [enemy.pussy] even better up close, her puffy lips already moist. The sweet scent of her arousal wafts up, and you relish it, pressing your face against her sodden cunt. From the satisfied moan you hear behind you and the rubbing against your sensitive flesh, you know she’s doing exactly the same.");

	output("\n\nEager to please you, you can feel her wet tongue pressing flush against your");
	if (isBj) output(" [pc.cockHead " + selCock + "]");
	else output(" [pc.pussy]");
	output(". You can feel every tiny bump caressing your");
	if (isBj) output(" manhood, causing it to stiffen and ache");
	else output(" girl parts, causing a warm feeling to rise in your lower belly");
	output(". Your senses ablaze, you are acutely aware of even the tiniest touch lavished on your loins.");

	// if BJ version
	if (isBj)
	{
		output("\n\nSoon her tongue tip is dipping sensuously into your slit, plumbing deliciously into your cock hole and forcing you to shudder with delight. As she tongue-fucks your [pc.cockHead " + selCock + "] her");
		if (pc.balls > 0) output(" webbed hands wrap around your [pc.sheath] and [pc.balls]");
		else output(" webbed hand wraps around your [pc.sheath]");
		output(". You groan as she teases your dilating tip and jerking you off at the same time");
		if (pc.balls > 0) output(", all the while gently and sensuously squeezing your [pc.sack]");
		output(".");

		output("\n\nYou feel as if you are being utterly milked as your loins are held fast in the lusty huntress’s tight warm grasp, dribbles of your pre-cum surging up to be swiftly scooped up by her tongue. Reduced to primal instinct, you hone in on the intoxicating smell of her [enemy.pussy], burying your [pc.face] between her [enemy.thighs].");
	}
	else
	{
		output("\n\nSoon her amazonian fingers are parting your dewy lower lips and delving sensuously into your slit. A sweet moan escapes your lips as she wiggles her tongue deep inside of you, lovingly lashing the insides of your [pc.pussy] and lapping up your leaking wetness. You shift your hips and allow her alien tongue to roam even deeper inside of you. It coaxes you to spasm and drool your hot honey all over her eagerly awaiting taste buds.");

		output("\n\nJust as you begin grinding your [pc.hips] excitedly against her face, she pulls her tongue out of your [pc.pussy]. You let out a disappointed noise only to have it transform into a husky moan as her [enemy.lips] travel upwards");
		if(pc.hasClit()) output(", suckling on [pc.oneClit] and pulling it into her mouth. Your breath hitches as");
		else output(" and");
		output(" her slender fingers slip up and into your [pc.vaginaNounSimple], plunging deep inside your [pc.pussyColor] folds.");

		output("\n\nYou groan and whimper as her magical digits stir up and sinfully screw your sex");
		if(pc.hasClit()) output(", all the while sucking on and lashing [pc.oneClit]");
		output(". Reduced to primal instinct, you hone in on the intoxicating smell of her [enemy.pussy], burying your [pc.face] between her [enemy.thighs].");
	}

	output("\n\nEager to claim her alien muff, you lap at her glistening lips and taste her sweet nectar rolling across your tongue. Hungry for more, you nuzzle your [pc.face] into her [enemy.pussy] and breach it with your ravenous tongue.");

	output("\n\nYou are surprised to also feel hundreds of little feelers tickling your tongue tip, the insides of her [enemy.pussy] clearly more alien than the outside. At first it feels odd, but you quickly grow used to it. Continuing to lap out her insides, you are soon rewarded with a flood of her heavenly girl juice gushing onto your tongue.");

	if (isCunni)
	{
		output("\n\nThe busty amazon lets out a sweet, shivering cry as you lewdly fuck her bald, dewy mound with your tongue, her [enemy.ass] quivering madly as she edges closer to the brink. You can feel her [enemy.thighs] pressing needily against your cheeks, trembling against your [pc.skinFurScales] as she struggles to contain the coiling pleasure within.");

		output("\n\nNot one to be outdone, she presses against that glorious spot deep inside of your inner walls, coaxing and milking it with her fingers");
		if(pc.hasClit()) output(" as she suckles upon your [pc.clits]. You whimper with pleasure as her fingers furiously fuck your [pc.pussy]");
		output(", thoroughly coating them in your wetness as you get even more hot and bothered. God, she knows how to get" + pc.mf(" someone", " a girl") + " off!");

		output("\n\nYou copy her movements,");
		if(pc.hasClit()) output(" and you both suck on each others clits,");
		else output(" both");
		output(" feverishly fingering each other and lapping at each other’s pussies. Soon your voices rise in pitch, and your movements grow increasingly frantic and heated as you grind your hips against each other’s hands and mouths. You both reach that magical moment together, creaming yourselves literally at each other’s hands.");
	}
	else
	{
		output("\n\nThe busty amazon lets out a sweet, shivering cry as you lewdly fuck her bald, dewy mound with your tongue, her [enemy.ass] quivering madly as she edges closer to the brink. Not one to be outdone, she suddenly pulls your [pc.cock " + selCock + "] into her mouth. Before you know it, your [pc.cockHead] is knocking against the back of her narrow throat, your length engulfed in a deliciously warm heat.");

		output("\n\nYou let out a low, primal groan into her [enemy.pussy], grinding your [pc.hips] against her [enemy.face]. You can feel your throbbing glans being squeezed at the very back of her slick gullet, her tongue lewdly lashing at your undercarriage.");

		output("\n\nSuddenly there is a slackening and you are able to press further, the lusty amazon taking you all the way down her throat. You push your [pc.hips] flush against her cheeks, burying your [pc.cockHead " + selCock + "] down her throat as she drools wetly around your base. Pulling back, a large cum-like rope of saliva connects her [enemy.lips] and your sticky length, spittle dripping down her chin just like spunk.");

		output("\n\nAs she deepthroats your [pc.cock " + selCock + "], you wrap your [pc.lips] around her [enemy.clits], sucking on and tongue-lashing them. You feel the vibrations of a stifled moan coursing through your [pc.cockNounSimple " + selCock + "], her [enemy.hips] wiggling excitedly. An even stronger one follows as you slip your fingers inside of her [enemy.pussy], teasing it as she impales her mouth on your [pc.cockNoun " + selCock + "].");
	}

	output("\n\nIn a single moment of molten release, you both spasm and reach that glorious white-hot peak. You liberally unload your");
	if (isBj) output(" [pc.cum] deep in her throat as she spasms and squirts her [enemy.girlCum] into your mouth");
	else output(" [pc.girlcum] in her mouth as she spasms and squirts her [enemy.girlCum] in yours");
	output(".");

	output("\n\nFor what seems like an eternity, you are both caught in a cycle of swallowing each other’s juices and simultaneously unloading, your cries muffled against each other’s privates. Eventually you are both left in a sweaty wonderful mess, the taste of your");
	if (isBj) output(" [pc.cumNoun]");
	else output(" [pc.girlCumNoun]");
	output(" in her mouth and her [enemy.girlCumNoun] in yours.");

	pc.orgasm();
	enemy.orgasm();

	output("\n\nAs you reel in post orgasmic bliss, the alien huntress lies on top of you and affectionately licks");
	if (isBj) output(" the underside of your [pc.cock " + selCock +"]");
	else output(" your twitching snatch");
	output(". She makes sure to lap up every last drop of your");
	if (isBj) output(" [pc.cum]");
	else output(" [pc.girlCum]");
	output(", making sure you are slick and spotless.");

	processTime(30+rand(10));

	clearMenu();
	addButton(0, "Next", vanaeHuntressPostVictoryScene);
}

public function vanaeHuntressTentaSex(selScene:String):void
{
	// selScene == tentacunt or tentabutt
	var isButt:Boolean;
	var isCunt:Boolean;

	if (selScene == "tentacunt") isCunt = true;
	isButt = !isCunt;

	clearOutput();
	vanaeHeader("VICTORY:VANAE\n");

	// Two scene versions like 69 - Vag or Anal. Must have Vag to choose Vag version. Female/Herm can choose either version.
	// NOT vag or ass, so females/herms can get assplay.
	// No size requisites. Size of tentacle is 2/3rds PC capacity (As she can use the tip or the base). If needed, max out at seven inches girth and 60 inches long.

	output("The alien huntress gestures for you to bend over, and you do so willingly, all the while looking over your shoulder with butterflies in your stomach. As she slips her long tentacle tail between her legs to form a makeshift penis, you can’t help but wet your [pc.lips] in anticipation. You poke your [pc.ass] out that much more in offering. ");

	output("\n\nYou notice there is a small slit on the tip of her tail, dribbling small amounts of [enemy.milk]. Could it be she can ejaculate from it just like a cock? You can’t wait to find out!");

	output("\n\nYour [pc.thighs] tremble in anticipation as she approaches you from behind, rubbing her oddly textured appendage back and forth between your [pc.butt]. The way it twists and wiggles makes you realize just how much control she has over it, bending it into snake-like shapes with ease against your ass. Imagining it inside of you and hitting all the right spots gets you seriously hot and bothered.");

	output("\n\nYou become acutely aware of every sensation bombarding your body, passion burning across your [pc.skinFurScales] and setting it alight. You bite back a moan as her tentacle teases your");
	if (isCunt) output(" moistened slit");
	else output(" puckered entrance");
	output(", a tingling anticipation flooding your lower stomach.");

	output("\n\nAt first her tip teases your");
	if (isCunt) output(" glistening");
	else output(" puckered");
	output(" entrance, tracing inch by glorious inch");
	if (isCunt) output(" along your [pc.pussyColor] pussy lips");
	else output(" around your naughty hole");
	output(". Your [pc.thighs] quiver with delight as it slowly begins pressing inside of you, slowly sinking inside your");
	if (isCunt) output(" netherlips.");
	else output(" aching rump.");

	if (isButt && pc.analVirgin || isCunt && pc.vaginalVirgin)
	{
		output("\n\n...It’s your first time, and you’re so damn excited you can’t stay still. You can’t believe you’re going to lose your");
		if (isButt) output(" anal");
		output(" virginity to an exotic amazonian huntress, with her tail cock no less! The lewdness of your situation makes your [pc.groin] ache, discovering wonderful new sensations you never knew you could <i>feel</i>.");

		output("\n\nYou do know one thing, though. For the rest of your life, you will never forget this single indelible moment. <b>You have lost your");
		if (isButt) output(" anal");
		output(" virginity!</b>");

		if (isButt)
		{
			pc.analVirgin = false;
			pc.buttChange(pc.analCapacity() * 0.6, false);
		}
		else
		{
			pc.vaginalVirgin = false;
			pc.vaginas[0].hymen = false;
			pc.cuntChange(0, pc.vaginalCapacity(0) * 0.6, false);
		}
	}

	output("\n\nYou clench excitedly around her incredible length as it wiggles around and caresses your inner walls, teasing its way further inside of your");
	if (isCunt) output(" [pc.vagina]");
	else output(" [pc.asshole]");
	output(". You positively melt as it strokes and probes your");
	if (isCunt) output(" slick");
	else output(" dirty");
	output(" insides, biting back a moan and pushing yourself against her rising hips.");

	if (isCunt && pc.vaginas[0].looseness() <= 1 || (isButt && pc.ass.looseness() <= 1)) output("<i>“...Was this your first time? You feel so tight!”</i> she exclaims");
	else if ((isCunt && pc.vaginas[0].looseness() <= 2) || (isButt && pc.ass.looseness() <= 2))
	{
		output("<i>“You like my tail buried in your");
		if (isCunt) output(" [pc.pussyColor] pussy");
		else output(" beautiful bottom");
		output(", don’t you? I love how tight you are!”</i> she exclaims");
	}
	else if ((isCunt && pc.vaginas[0].looseness() <= 3) || (isButt && pc.ass.looseness() <= 3)) output("<i>“Oooh, you know just how to squeeze me - you’ve done this a lot, haven’t you?”</i> she asks");
	else output("<i>“You’re so loose - you’ve done this a lot, haven’t you?”</i> she asks");
	output(". You let out a trembling cry in response, your mind reeling from the intense sensations utterly seizing your body as her tentacle ‘cock’ coils around inside of you.");

	output("\n\nHer organic skirt begins wrapping around your [pc.hips] and [pc.thighs], pulling her waist flush with your [pc.ass]. You gasp as the crook of her upper thighs presses neatly against the grooves of your rump, her naked flesh pressing against your [pc.skinFurScales]. Suddenly she’s all inside of you, her writhing appendage buried deep in your");
	if (isCunt) output(" warm, wet insides");
	else output(" [pc.asshole]");
	output(".");

	output("\n\nSlowly she begins to plumb your");
	if (isCunt) output(" [pc.pussy]");
	else output(" [pc.asshole]");
	output(" with her [enemy.tail], holding you fast with her suckling skirt. Her tendrils wrap around your [pc.thighs]");
	if (pc.totalClits() > 0) output(" and tease your [pc.clits]");
	else if (pc.hasCock()) output(" and tease your [pc.cockHeads]");
	else output(" and tease your [pc.groin]");
	output(", making you squirm with pleasure.");
	if (isCunt) output(" You gush around her [enemy.tail]");
	else if (pc.vaginas.length == 1) output(" Your [pc.cunt] is glistening wet");
	else if (pc.vaginas.length > 1) output(" Your [pc.cunts] are glistening wet");
	else if (pc.hasCock()) output(" Pre-cum dribbles from your [pc.cocks]");
	else output(" You swoon");
	output(" as she teases and screws you with her assorted tentacles.");

	output("\n\nNever have you felt so complete as being fucked right now by this amazon huntress, pleasure coursing through your body in crashing waves. You positively drown in ecstasy, pressing your [pc.hips] needily against her own.");

	output("\n\nJust when you think you can’t reach any higher than you already are, her flexible tip begins stroking your most sensitive spot,");
	if (isCunt) output(" rubbing deliciously against your G-spot");
	else if (isButt && pc.hasCock()) output(" pressing and teasing your prostate");
	else output(" pressing and teasing against your sensetive depths");
	output(". You let out a loud, shameless cry as her suckers clamp on, tugging and suckling at it. It pushes you careening over the edge in a glorious, spasmodic rush.");

	output("\n\nYour [pc.legOrLegs] shake");
	if(pc.legCount == 1) output("s");
	output(" and you cream yourself hard,");
	if (pc.hasCock()) output(" [pc.cum] shooting from [pc.eachCock]");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" [pc.girlcum] squirting from [pc.eachPussy]");
	if (!pc.hasCock() && pc.hasVagina() || !pc.hasCock() && pc.hasVagina()) output(" and all over the place");
	if (!pc.hasCock() && !pc.hasVagina()) output(" racked with wave after wave of pleasure");
	output(". At the same time she shoots her [enemy.milk] inside of you, filling up your spasming hole.");

	output("\n\nAs you reel in post orgasmic bliss, the alien huntress lies on top of you and affectionately licks");
	if (pc.hasCock()) output(" the underside of your [pc.cock]");
	else if (pc.hasVagina()) output(" your twitching snatch");
	else output(" out your ass");
	output(". She makes sure to");
	if (pc.hasCock() || pc.hasVagina())
	{
		output(" lap up every last drop of your");
		if (pc.hasCock()) output(" [pc.cum]");
		else output(" [pc.girlcum]");
	}
	else output(" give your [pc.asshole] a thorough rimming");
	output(", making sure it is slick and spotless.");

	pc.orgasm();
	enemy.orgasm();
	processTime(30+rand(10));

	clearMenu();
	addButton(0, "Next", vanaeHuntressPostVictoryScene);
}

public function vanaeHuntressSquirNJerk():void
{
	clearOutput();
	vanaeHeader("VICTORY:VANAE\n");
	
	// Requires one cock, any size.
	// Must have Cock
	// Must have front or mid genitals.

	output("The exotic huntress gestures for you to seat yourself on a nearby rock. After you sit down and spread your [pc.legOrLegs] she follows, cupping her [enemy.breasts] with a mischievous smile. You marvel at how magnificent her fleshy peaks look as she pushes them up with her webbed hands, making them look even perkier.");

	output("\n\nShe squirts thick, gooey ropes of [enemy.milk] from her [enemy.nipples], dousing [pc.eachCock]. You let out a " + pc.mfn("masculine groan", "girlish moan", "breathy moan") + ", your slick staff");
	if (pc.cocks.length > 1) output("s");
	output(" titillated and twitching. Your aching flesh is completely covered in her violet fluid, and you feel your body start to undergo some changes.");

	vanaeTFScene();

	output("\n\nAs her fluid and your [pc.cum] drool down your [pc.cockNounSimple], a delicious little shiver runs down your spine. Moving closer towards you, the alien female places her webbed hands on your shoulders, a cheeky smile playing on her [enemy.lips].");

	output("\n\n<i>“Mmm, I think I missed a few spots. How about I rub it in for you?”</i> she asks, her organic skirt beginning to break apart to stroke your [pc.cumNoun]-coated [pc.cocksNounSimple]. Violet tentacles reach out and sensuously caress your [pc.cockHeads].");

	output("\n\nAs one of her tenta-tips wiggle and dip into your sticky cock hole");
	if (pc.cocks.length > 1) output("s");
	output(" you shudder with delight, arching your back into her ministrations. She continues to tease your dilating tip");
	if (pc.cocks.length > 1) output("s");
	output(" and deliver torturous amounts of pleasure. ");

	if (pc.isAss()) output("\n\nYou finally snap, commanding her to stroke you off properly.");
	else output("\n\nEventually you cave, asking her to stroke you off.");
	output(" She gives a wicked little smile and");
	if (pc.isAss()) output(" obeys");
	else output(" grants");
	output(" your request, wrapping your [pc.cocks]");
	if (pc.balls > 0) output(" and [pc.balls]");
	output(" in a mass of her tentacles. Soon");
	if (pc.cocks.length == 1) output(" it is");
	else output(" they are");
	output(" being deliciously squeezed, applying sticky friction to every inch of your length");
	if (pc.cocks.length > 1) output("s");
	output(".");

	output("\n\nYou let out a low, husky moan as her wet suckers flirt with and kiss every inch of your aching loins. Her coils utterly bombard your senses as they rub and writhe in different directions, a sticky, smacking noise filling the air. You press your [pc.cocks] needily into her violet tendrils, drowning in pleasure.");

	output("\n\n<i>“You really like my tentacles, don’t you");
	if (pc.zilScore() < 4 && pc.naleenScore() < 5) output(", off-worlder");
	output("? I bet you’d just love it if I did this.”</i> Her suckers suddenly clamp onto your");
	if (pc.balls > 0) output(" [pc.sack],");
	output(" length");
	if (pc.cocks.length > 1) output("s");
	output(" and [pc.eachCockHead], tugging strongly at your sensitive flesh. It feels as if your genitals are being given a hundred hickeys from every angle. You whimper in delight, all the while struggling to contain the rapidly rising explosion threatening to claim your senses. <i>“I think you’re almost there. Just let it go, shoot it all out.”</i>");

	output("\n\nPurringly coaxing you, the alien huntress speeds up her massage, vigorously jerking you off in a completely unpredictable way. You can’t hold out against the sensations assaulting your [pc.cocks], crying out as you reach that inevitable peak. You groan long and low as you spasmically shoot your [pc.cum] into the writhing, violet mess.");

	output("\n\nAs you deliciously shudder and spill your seed all over her tentacles, she cups her [pc.breasts] once more, basting your [pc.cocks] in her [enemy.milk]. Your hot [pc.cumNoun] spurts point blank into it, mixing in as she wrings your junk for every last drop.");

	output("\n\nAs you reel in post orgasmic bliss, the alien huntress crouches down and affectionately licks the underside of [pc.eachCock]. She makes sure to lap up every last drop of your [pc.cum] and her [enemy.milk], making sure your loins are slick and spotless.");

	pc.orgasm();
	enemy.orgasm();
	processTime(30+rand(10));

	clearMenu();
	addButton(0, "Next", vanaeHuntressPostVictoryScene);
}

public function vanaeHuntressMilkBath():void
{
	clearOutput();
	vanaeHeader("VICTORY:VANAE\n");
	// Any gender, no requirements.

	output("The exotic huntress gestures for you to lie down and you obediently do so. She stands a foot away from you. <i>“So, you want a nice bath? I can definitely do that.”</i> She purrs, the [enemy.milk] dribbling from her [enemy.breasts] begins to turn a far richer hue. <i>“I’m sure you’ll enjoy it");
	if (pc.zilScore() < 4 && pc.naleenScore() < 5) output(", off-worlder");
	output(". After all, I hear the sensation can be quite addicting");
	if (pc.zilScore() < 4 && pc.naleenScore() < 5) output(", especially for your kind");
	output(".”</i>");

	output("\n\nShe grabs her [enemy.breasts] firmly in her webbed hands and begins to sensuously and forcefully massage them, almost as if she’s stirring up the contents inside. For all you know that’s exactly what she’s doing as she lets out a sensuous purr. Talk about a milkshake!");

	output("\n\nOnce she seems to have finished, she grabs her [enemy.nipples] firmly between her fingers. Pointing her nubs at you she squirts a thick, gooey rope of her udder milk directly on your [pc.groin]. The liquid looks thicker than before and definitely different. It doesn’t take long at all for it to start taking effect.");

	vanaeTFScene();

	output("\n\n<i>“Feels good doesn’t it? I’m just getting started.”</i> She splatters twin streams of her [enemy.milk] all over your [pc.chest]. As your upper body is splattered and bathed your [pc.nipples] begin to ache.");
	if (pc.isLactating()) output(" Your [pc.milk] spurts out wildly all over your chest like a [pc.milkColor] bukkake shower.");

	output("\n\nYou can’t hold out any longer as you madly stroke your [pc.groin]");
	if (!pc.hasCock() && !pc.hasVagina()) output(" and play with your [pc.nipples]");
	output(". You are rewarded with electric jolts of pleasure that set your entire body alight. You’ve masturbated before, but never in your life has it ever felt this <b>intense</b>!");

	output("\n\n<i>“Feels good, doesn’t it? Should I continue, or did you want me to stop now? I will if you want me to.”</i> The vanae huntress teases you, squirting one more rope of her druggy goop onto your body. A blissful quiver travels up your [pc.thighs] as you desperately plead for her to continue - your cheeks burning furiously.");

	output("\n\n<i>“Alright. Just remember, you asked for it!”</i> the busty huntress exclaims. She spurts even more violet arcs of her wonderful milk from her [enemy.nipples] and splattering it all over your [pc.skinFurScales]. You moan and in the process swallow a mouthful of her [enemy.milk] splattered on your [pc.lips]. It tastes delicious. As it rolls across your [pc.tongue] it begins to tingle, and your whole body aches.");

	if (pc.hasCock() || pc.hasVagina())
	{
		output("\n\nShe douses you until you can’t take it anymore and experience a truly body-wracking orgasm. You cry out as glorious fountains of");
		if (pc.hasCock()) output(" [pc.cum]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.girlcum]");
		output(" explode from your [pc.groin] and shoots all over the place. You continue to spasm spastically and unload like [pc.aRaceShort]-shaped geyser until you are utterly spent.");

		output("\n\n<i>“Couldn’t hold out anymore? I understand, it’s pretty intense. But we’re nowhere near finished yet");
		if (pc.zilScore() < 4 && pc.naleenScore() < 5) output(", off-worlder");
		output(".”</i> The alien huntress informs you, all the while squirting more milk onto your already slickened body. <i>“...And because you’ve been so good, I’ll be nice, and touch you a little.”</i>");

		output("\n\nShe reaches out with a single toe and strokes your slimy loins. The tiniest touch causes your lower body to seize up with pleasure. A few strokes and you’re already unloading more of your spunk, letting it splash wildly against the underside of her [enemy.foot]. You moan and beg for more; her drug enhanced touch more intense than anything you’ve ever experienced.");

		output("\n\n<i>“You want more,");
		if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.raceShort]");
		else output(" off-worlder");
		output("? Okay then, I can do that,”</i> she purrs, stroking you off with her foot. Her very touch feels more incredible than sex as you continue to spasm and spurt shamelessly.");

		output("\n\nAfter the very last of orgasms subsides, you are utterly covered in your own");
		if (pc.hasCock()) output(" [pc.cum]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.girlcum]"); 
		output(" in an embarassing mess. She’s sapped you dry, your love juice floating around in her [enemy.milk].");

		output("\n\nIn an admirable effort the alien huntress begins to clean you off. First she wipes you off with her webbed hands and tentacles and then licks you all over, lapping up the mixture of your juices and her own intoxicating milk in a lewd yet amorous display.");
	}
	else
	{
		output("\n\nWith a naughty grin she continues to douse you until you can’t take it anymore, your back arching as you are pushed over the edge. You experience an earth shattering orgasm, your whole body shuddering and convulsing as you reach that blissful peak.");

		output("\n\nNot finished with you yet, the vanae huntress squirts even more [enemy.milk] onto your already slickened body, causing your temperature to rise. She then reaches out with a single toe and runs it up against your groin. Just the tiniest touch anywhere causes your lower body to explode with pleasure. You moan and beg for more, her drug enhanced touch more intense than any sensation you’ve ever experienced, and she delivers.");
		
		output("\n\nAfter the very last of your orgasms subsides, you are utterly covered in her [enemy.milk]. In an admirable effort, the alien huntress begins to clean you off. First she wipes you off with her webbed hands and tentacles and then licks you all over, lapping up her own intoxicating fluid in a lewd yet amorous display.");
	}

	pc.orgasm();
	enemy.orgasm();

	processTime(30+rand(10));
	
	clearMenu();
	addButton(0, "Next", vanaeHuntressPostVictoryScene);
}

public function vanaeHuntressPostVictoryScene():void
{
	clearOutput();
	vanaeHeader("VICTORY:VANAE\n");

	if (pc.isAss())
	{
		output("After she is finished, you order her to get on all fours. She obediently gets down on her webbed hands and knees, and lifts her [enemy.tail] up for your benefit. ");

		output("\n\nOnce she’s in position, you proceed to spank the living hell out of her for ambushing you. The vanae huntress lets out a startled yelp but doesn’t move, trembling as you lash her [enemy.ass]. You continue to do so until her rounded buttocks are the same color as her [enemy.hair].");
		
		output("\n\nLooking at her glowing cheeks gives you a small rise of satisfaction. Despite her cries of protest, her [enemy.pussy] is visibly leaking down her snowy thighs. You spank her once more and then make her <i>promise</i> not to ambush you ever again.");
		
		output("\n\nShe nods furiously and gets up, all the while rubbing her battered rump with a sorry look on her face. You then give her permission to leave. For some reason, she hesitates to do so. The huntress is suddenly sporting a rather coy look, and her [enemy.hips] are wiggling side to side. ");
		
		output("\n\n<i>“Um... I know I deserved that, and I won’t do it ever again. But if you want to play sometime, come find me, okay?”</i> she cutely requests. She then darts back into the Mhen’gan jungle. Guess she took a real shine to you despite her bruised buttocks.");
	}
	else
	{
		output("After she has finished, you make out with the amazonian woman. At first she is surprised, but soon she is wrapping her arms around your neck and moaning into your lips. When you finally pull away she lets out a wistful noise, as if she wanted to kiss for quite a bit longer.");

		if (pc.isMischievous())
		{
			output("\n\nYou do, however, punish her for ambushing you before you let her leave. In a stern voice, you order her to bend over and raise her [enemy.tail]. She looks more than a little confused as she pushes out her [enemy.ass], trying to figure out what you’re up to.");
			
			output("\n\nOnce she’s in position, you bring your flat hand down on her bare buttocks with a loud slap. She jumps and lets out a yelping noise, rubbing her sore butt and puffing out her cheek. You’re wearing a grin on your face, telling her it’s payback for the ambush. ");
			
			output("\n\n<i>“OWW! Well, I guess I deserved that.”</i> It appears her warrior pride has taken a dent. <i>“Um, hey. If I see you around, how about we do this again? You know, without the ambush. Think on it, okay?”</i> she cutely requests. She then darts back into the Mhen’gan jungle. Guess she took a real shine to you despite her bruised buttock.");
		}
		else
		{
			output("\n\n<i>“That was... um... something else. If I see you around sometime, can we do it again?”</i> she cutely requests. It’s clear from the excitement in her voice that she enjoyed your frisky encounter. She gives you one more goodbye kiss before swiftly retreating back into the Mhen’gan jungle.");
		}
	}

	output("\n\n");
	
	processTime(5);
	CombatManager.genericVictory();
}

public function vanaeHuntressPCDefeat():void
{
	vanaeHeader("DEFEAT: VANAE\n");

	if (pc.HP() <= 1)
	{
		output("The pain is too much, and you fall on your back, unable to continue the fight. The vanae huntress slides up to you and strokes your aching wounds. She lets out a sympathetic noise.");

		output("\n\n<i>“...Sorry,");
		if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" my pet");
		else output(" off-worlder");
		output(". If you hadn’t dodged my first attack, I wouldn’t have had to bruise you so much,”</i> she softly explains, kissing your tender [pc.skinFurScalesNoun]. You wince; damn, that smarts! You feel her rubbing her [enemy.breasts] against your body, smearing your wounds with her [enemy.milk].");

		output("\n\nAll of a sudden, the pain is gone. You also realize the feeling of her brushing along your [pc.skinFurScales] is causing your blood to boil. As she slowly drags her [enemy.nipples] along your [pc.chest], blood rushes to your cheeks... among other places.");

		output("\n\n<i>“Oh, I see you’re feeling better now? That’s good. There’s nothing worse than damaging prey, after all. I will be letting you go after this - but not before I get what I came for.”</i> the busty huntress purrs, her tentacles wrapping around your lower body. <i>“...Your");
		if (pc.hasCock()) output(" virile cum belongs to me. You’re my treasured prize, after all.");
		else if (pc.hasVagina()) output(" tasty girlcum, my dear, belongs to me. And I am <i>very</i> experienced in getting girls off - trust me.");
		output("”</i>");

	}
	// Lust
	else
	{
		output("You can’t hold out any longer,");
		if (!pc.hasStatusEffect("Tripped") && !pc.hasStatusEffect("Grapple")) output(" falling on your back and panting lustily");
		else output(" giving in at long last");
		output(". You’re so freaking horny; all you want to do is get off!");

		output("\n\nAs if to grant your wish, the vanae huntress rubs against your body. She strokes your sensitive [pc.skin], causing you to shiver with impotent longing. Blood rushes to your loins and you’re unable to relieve it. ");

		output("\n\nYour mind is spinning and you lose all sense of reason. If you don’t orgasm soon, you feel as if you’ll go mad! You’re surprised to hear your own voice begging her to help you cum.");

		output("\n\n<i>“...You want me to do what now? How naughty of you!”</i> The busty huntress kisses your [pc.chest] sending a spike of torturous pleasure shooting through your body. <i>“I was going to let you go, but now you want to stay. Are you sure?”</i>");

		output("\n\nYou aren’t going to be able to move like this as you’re stuck in a delirious, debilitating sense of lust. You plead for her not to leave, since you can’t just be left like this.");

		output("\n\nShe hums and trails her webbed fingers along your cheek, considering your request. <i>“Well, I’m very kind. I’ll get you off, and then let you go, but only if you are a good " + pc.mf("boy", "girl") + " and give me all your wonderful");
		if (pc.hasCock()) output(" cum");
		else output(" girlcum");
		output(", okay?”</i>");
	}

	if (pc.hasCock() || pc.hasVagina())
	{
		if (!pc.isNude() && ((pc.hasCock() && !pc.hasVagina() && pc.mf("m", "f") == "f") || (pc.hasVagina() && !pc.hasCock() && pc.mf("m", "f") == "m")))
			output(" It seems despite being " + pc.mf("masculine", "feminine") + " in appearance she can ‘smell’ your true gender.");

		output("\n\nYou’d do just about anything to get off right now, so you earnestly promise to give her your");
		if (pc.hasCock()) output(" spunk");
		else output(" lady milk");
		output(".");
	}

	var options:Array = [];

	// Fuck her cunt -- Cock + size requirement
	if (pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) != -1) options.push(vanaeHuntressPCDefeatCuntFux);

	// Milkbath -- Gender neutral variants
	options.push(vanaeHuntressPCDefeatMilkbath);

	// Titfuck -- stringent size requirement + cock
	if (pc.cocks.length > 0)
	{
		for (var i:int = 0; i < pc.cocks.length; i++)
		{
			var cockI:CockClass = pc.cocks[i];

			if (cockI.cLength() >= 3 && cockI.cLength() <= 12 && cockI.thickness() >= 0.5 && cockI.thickness() <= 4)
			{
				// Ideally I'd pass the cockindex into the function but I'm being lazy fuck off
				//if (cockI.volume() > pc.cocks[foundCock].volume()) foundCock = i;
				options.push(vanaeHuntressPCDefeatTitfux);
				break;
			}
		}
	}

	// Squirt N Jerk
	if (pc.hasCock()) options.push(vanaeHuntressPCDefeatSquirtNJerk);
	
	// Cunni
	if (pc.hasVagina()) options.push(vanaeHuntressPCDefeatCunnilingus);

	// Tentafuck -- vagOrAss enabled, but makes reference to bits so no neuters
	if (pc.hasCock() || pc.hasVagina()) options.push(vanaeHuntressPCDefeatTentafux);


	options[rand(options.length)]();
}

public function vanaeHuntressPCDefeatCuntFux():void
{
	// Must have Cock
	// Max girth 4 inches
	// Max Length 12 inches.
	var numCum:int = 5 + rand(5);

	output("\n\nThe exotic alien huntress purrs, sliding down your body and stripping off your [pc.gear]. <i>“...Today is a very good day for you,");
	if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.raceShort]");
	else output(" off-worlder");
	output(". I’m fertile and raring to go.”</i>");

	var selCock:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(selCock < 0) selCock = pc.smallestCockIndex();

	// If first time breeding with a Vanae huntress.
	if (flags["VANAE_HUNTRESS_BRED"] == undefined)
	{
		output("\n\nFertile... wait, is she going to breed with you? For some reason, the vanae huntress seems to be cupping her breasts instead. Her words and actions don’t seem to be matching up.");
		
		output("\n\n<i>“Vanae huntresses produce a euphoric and lust inducing liquid from their breasts. It also sharply increases a victim’s cum production when sprayed on the genitals,”</i> your codex enlightens you.");
		
		output("\n\n<i>“They also breed by capturing male prey and forcing them to fertilize them, "+ pc.mf("Master", "Mistress") +" Steele. Since vanae are extremely fertile, pregnancy is almost certainly assured.”</i>");
		
		output("\n\nGee, thanks codex. You notice the vanae huntress seems to ignore your sophisticated device despite the fact it’s talking. She doesn’t seem to care much for any of your gear - it seems she’s solely interested in your loins and not in looting you.");
		
		output("\n\nSomewhere in the back of your drug addled mind you wonder if you should use it to call for help. But would anyone come? By the time they arrive it will be too late - this octopus girl will have finished mating with you.");
		
		output("\n\nYour head swirls with indecision as the vanae huntress positions her [enemy.breasts] above your [pc.groin]. They are capped with perky violet nipples with beautiful swirls and patterns around them. She sensuously and forcefully massages her mammaries before dribbling her lube-like milk on your [pc.cockHeads].");
		
		output("\n\nAs it touches your sensitive flesh, your [pc.cocks] swell");
		if (pc.cocks.length == 1) output("s");
		output(" rapidly and you let out a groan. Your loins feel as if they’re on fire, your pre-cum surging out and dribbling lazily down your shaft");
		if (pc.cocks.length > 1) output("s");
		output(". You try to buck your hips but can’t, utterly paralyzed by her transparent milk.");
		
		output("\n\nYour mind becomes");
		if (pc.lust() >= pc.lustMax()) output(" even more");
		output(" hazy and drug addled, filled with erotic thoughts. Suddenly you feel less opposed to the idea of breeding with her. Would it really be so bad to go through with it? Meanwhile, her druggy milk begins to take effect on your loins.");
	}
	// Repeat (Have bred with Vanae Huntress before.
	else
	{
		output("\n\nYou can’t believe the same thing is happening to you <i>again</i>. You’ve already knocked up a huntress before; how many times are they going to make you breed with them before they’re satisfied?");
		
		output("\n\n... Still, the last time was a very pleasurable experience. [pc.EachCock] becomes engorged from the memory of your last encounter.");
		
		output("\n\nThe vanae huntress lets out a pleased noise as your [pc.cocksNoun] stand");
		if (pc.cocks.length == 1) output("s");
		output(" ready and raring to go. <i>“Ohh, you want to breed with me that badly? I guess there’s no helping it then - you’re going to be a daddy.”</i>");
		
		output("\n\nYou’re pretty sure you already are one, but you can’t bring yourself to speak. You simply lie back and take it as she positions her [enemy.breasts] above your [pc.groin]. They are capped with perky violet nipples with beautiful swirls and patterns around them. She sensuously and forcefully massages her mammaries before dribbling her lube-like milk on your [pc.cockHeads].");
		
		output("\n\nAs it touches your sensitive flesh, your [pc.cocks] swell");
		if (pc.cocks.length == 1) output("s");
		output(" rapidly, and you let out a groan. Your loins feel as if they’re on fire, your pre-cum surging out and dribbling lazily down your shaft. You try to buck your hips but can’t, utterly paralyzed by her transparent milk.");
		
		output("\n\nYour mind becomes");
		if (pc.lust() >= pc.lustMax()) output(" even more");
		output(" hazy and drug addled, filled with erotic thoughts. Suddenly you feel less opposed to the idea of breeding with her. Would it really be so bad to do it one more time? Meanwhile, her druggy milk begins to take effect on your loins.");
	}

	// MERGE
	vanaeTFScene();

	output("\n\nAs your [pc.cum] drools down your [pc.cocks], she stands up and plants her [enemy.feet] on either side of your waist. When she spreads her organic tentacle skirt, you notice her [enemy.pussy] looks very humanoid, with the exception of her [enemy.clits].");

	output("\n\nThe pale huntress then slowly descends on you in a squatting pose and rests her [enemy.pussy] snugly against the underside of your [pc.cumVisc] member. She moans and slowly begins to rock back and forth, stroking off your [pc.cock " + selCock + "] with her [enemy.vaginaNounSimple].");

	output("\n\nAs her folds part around your [pc.cockHead] you feel your [pc.cock] being licked by hundreds of tiny feelers.");
	pc.cockChange(true, false);
	if (flags["VANAE_HUNTRESS_BRED"] == undefined) output(" It seems her pussy isn’t so normal after all!");
	else output(" Part of you has longed for this ever since the last tryst.");
	output(" The unique and powerful sensation forces a low moan from your throat. As alien as it is, it feels <i>good</i>.");

	output("\n\nWhen even more of your [pc.cumNoun] drools from your [pc.cockHeads], she reaches down and scoops it up - forbidding it to dribble down with the rest of your spilled seed.");

 	output("\n\n<i>“Uh uh, no more of that down there! You’re going to give it to me in my pussy, understand?”</i> she coos, lapping up your [pc.cumFlavor] [pc.cumNoun] from her webbed fingers.");

	output("\n\nYou nod drunkenly in response. Soon you feel her grabbing [pc.oneCock] and bringing it upward, lifting herself higher to hover over your [pc.cockHead " + selCock + "]. She then slowly lowers back down, sliding you into her otherworldly cooch.");

	output("\n\nYou feel so wrong being violated by an alien woman who beat you down in the jungle. At the same time your [pc.cock " + selCock + "] twitches and throbs excitedly as she slides you inch by glorious inch into her muff, sheathing it inside of her. You keenly feel her velvety soft feelers licking your length from every angle.");

	output("\n\nOnce you’ve mated with a pussy like this, you’re not sure you’ll <i>ever</i> be able to go back to having sex with a normal one. You might be ruined for life!");

	output("\n\n<i>“Mmm, you’re all the way in. How does it feel?”</i> she asks, her violet netherlips excitedly clinging to your [pc.cockNoun] as her insides lash at you.");
	if (pc.balls > 0) output(" At the same time she gently rubs her hairless mound against your [pc.sack].");

	output("\n\nYou moan out that it feels wonderful, your [pc.cockHead " + selCock + "] flexing inside of her. Grinning in response, she slowly begins rocking her waist in your lap. The busty huntress lets out a blissful moan as your [pc.cock " + selCock + "] wetly stirs around inside of her [enemy.pussy], caressing her silky inner walls.");
 
	output("\n\n<i>“Fuck me harder. Shove your [pc.cock " + selCock + "] deep inside of me and fill my womb with your wonderful spunk. Breed me!”</i> she commands, bucking wildly against you. One of her silky feelers slips inside of your cock hole and wiggles about, pushing you right over the edge.");

	output("\n\nOverwhelmed with sensation, you cum once more - this time inside her [enemy.pussy]. Your [pc.hips] spasm shamefully as you batter her insides with your [pc.cum]. As your baby juice floods up inside of her, she lets out a sweet trembling cry, spastically creaming herself around your spurting [pc.cock " + selCock + "].");

	output("\n\nOnce you are finished, your vanae lover slides you out of her [enemy.pussyNoun]. You can see your [pc.cum]");
	var cumQ:Number = pc.cumQ();
	if (cumQ <= 50) output(" dribbling");
	else if (cumQ <= 600) output(" oozing");
	else output(" gushing");
	output(" from her fuck hole. [pc.EachCock] begins to stiffen and jerk at the glorious sight.");

	vanaeSimplePreg(numCum);
	for(var y:int = 0; y < numCum; y++)
	{
		processTime(10+rand(5));
		enemy.loadInCunt(pc, 0);
		pc.orgasm();
		enemy.orgasm();
	}

	// if First Time
	if (flags["VANAE_HUNTRESS_BRED"] == undefined)
	{
		output("\n\n<i>“Keep some of that. We’re not done yet by a long shot. I want to make </i>sure<i> that you’ve gotten me pregnant,”</i> she informs you, grinning and getting down on all knees. She licks the underside of your [pc.cock " + selCock + "], making your whole body tremble with joy. You relax back, giving yourself over to pleasure...");
	}

	output("\n\n... An hour later ...");

	output("\n\nYour mind is spinning in a deliciously delirious haze. Forced to orgasm countless times, your entire body feels impossibly heavy. Your [pc.cocks]");
	if (pc.cocks.length == 1) output(" has");
	else output(" have");
	output(" been worked over in every way imaginable");
	if (pc.balls > 0) output(" and your empty [pc.balls] are filled with a pleasurable ache.");

	output("\n\nMeanwhile, the vanae huntress is sitting in a pool of your [pc.cum], her [enemy.pussy] utterly battered with it. She scoops up some of her [enemy.milk] and rubs it along her lower lips, seemingly sealing in your spunk.");

	output("<i>“Mmm, that’s </i>more<i> than enough. I’m sure we’ll give birth to some lovely daughters, don’t you think?”</i> she purrs. <i>“I’ll be sure to bring your [pc.cum] back to our Queen and matrons, so they can get to enjoy it it too.”</i>");

	output("\n\nShe plants a single kiss on your");
	if (pc.balls > 0) output(" [pc.balls]");
	output(" [pc.cock " + selCock + "]");
	output(" before retreating back into the Mhen’gan jungle, her tail and hips swaying all the while. It seems you’re going to be the father of quite a few vanae daughters.\n\n");

	processTime(10);
	IncrementFlag("VANAE_HUNTRESS_BRED");

	CombatManager.genericLoss();
}

public function vanaeHuntressPCDefeatMilkbath():void
{
	// Any sex, no requisites.
	if (!pc.hasCock() && !pc.hasVagina())
	{
		output("\n\n<i>“...But I don’t have any to give!”</i> You explain frustratedly, all the while wiggling your [pc.hips]. You don’t have a pussy or cock for her to milk. She really is barking up the wrong tree.");

		output("\n\nQuirking an eyebrow, the vanae huntress moves her [enemy.hand] down and touches your loins. <i>“...Y-you’re... what are you, exactly?!”</i> She seems utterly baffled by your lack of traditional genitalia.");

		output("\n\nShe pats your loins before coming to a decision - she’s not going to go away empty handed. <i>“There’s no such thing as a creature with no liquids to give. I’ve just got to find out the right way to extract them, that’s all... and I know just the way to do it.”</i>");
	}

	output("\n\nShe takes off your [pc.gear], making sure you’re nice and prepared. Your things are tossed cleanly to the side and land somewhere in the nearby brush.");

	output("\n\n<i>“I’m not going to even touch you,");
	if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" my dear");
	else output(" off-worlder");
	output(". How would you like a nice bath?”</i> The exotic huntress purrs, pulling herself off your body, and standing upright. The [enemy.milk] dribbling from her [enemy.breasts] begins to turn a far richer hue. <i>“I’m going to bathe you with my special milk for a bit, I’m sure you’ll enjoy it.");
	if (pc.hasCock() || pc.hasVagina())
	{
		output(" You’ll be pumping out plenty of your delicious ");
		if (pc.hasVagina()) output("girl-");
		output(" cream in no time.");
	}
	output("”</i>");

	if (flags["VANAE_MILKBATH_TIMES"] == undefined)
	{
		output("\n\n<i>“Vanae huntresses can produce a euphoric and lust inducing liquid from their breasts, "+ pc.mf("Master", "Mistress") +" Steele. It also sharply increases a victim’s cum production when sprayed on the genitals.”</i> Your codex enlightens you from its position halfway in the brush.");

		output("\n\nGee, thanks codex. You notice the vanae huntress seems to ignore your sophisticated device despite the fact it’s talking. She doesn’t seem to care much for any of your gear - it seems she’s solely interested in your loins and not in looting you.");
	}

	output("\n\nShe grabs her [enemy.breasts] firmly in her webbed hands and begins to sensuously and forcefully massage them, almost as if she’s stirring up the contents inside. For all you know that’s exactly what she’s doing as she lets out a sensuous purr. Talk about a milkshake!");

	output("\n\nOnce she seems to have finished, she grabs her [enemy.nipples] firmly between her fingers. She points her nubs at you and squirts a thick, gooey rope of her udder milk directly on your [pc.groin]. The liquid looks thicker than before and definitely different. It doesn’t take long at all for it to start taking effect.");

	vanaeTFScene();

	output("\n\n<i>“Feels good doesn’t it? I’m just getting started.”</i> She splatters twin streams of her [enemy.milk] all over your [pc.chest]. As your upper body is splattered and bathed your [pc.nipples] begin to ache.");
	if (pc.isLactating()) output(" Your [pc.milk] spurts out wildly all over your chest like a [pc.milkColor] bukkake shower.");

	output("\n\nYou can’t hold out any longer as you madly stroke your [pc.groin]");
	if ((!pc.hasCock() && pc.hasVagina()) || (pc.hasCock() && !pc.hasVagina())) output(" and play with your [pc.nipples].");
	output(" You are rewarded with electric jolts of pleasure that set your entire body alight. You’ve masturbated before, but never in your life has it ever felt this <b>intense</b>!");

	output("\n\nDeep down you’re truly ashamed about how you’re acting, but you’re also totally getting off on it. A blissful quiver travels up your [pc.thighs] as you desperately plead for her to continue - your cheeks burning furiously.");

	output("\n\n<i>“Alright. Just remember, you asked for it!”</i> the busty huntress exclaims. She spurts even more violet arcs of her druggy milk from her [enemy.nipples] and splatters it all over your [pc.skinFurScales]. You moan and, in the process, swallow a mouthful of the gloop splattered on your [pc.lips]. It tastes delicious. As it rolls across your [pc.tongue], it begins to tingle and your whole body aches.");

	if (pc.hasCock() || pc.hasVagina())
	{
		output("\n\nShe douses you until you can’t take it anymore and experience a truly body-wracking orgasm. You cry out as glorious fountains of");
		if (pc.hasCock()) output(" [pc.cum]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.girlcum]");
		output(" explode from your [pc.groin] and shoot all over the place. You continue to spasm spastically and unload like [pc.aRaceShort]-shaped jism geyser until you are utterly spent. ");

		output("\n\n<i>“Couldn’t hold out anymore? I understand, it’s pretty intense. But we’re nowhere near finished yet");
		if (pc.zilScore() < 4 && pc.naleenScore() < 5) output(", off-worlder");
		output(".”</i> The alien huntress informs you, all the while squirting more milk onto your already slickened body. <i>“...And because you’ve been so good, I’ll be nice, and touch you a little.”</i>");

		output("\n\nShe reaches out with a single toe and strokes your slimy loins. The tiniest touch causes your lower body to seize up with pleasure. A few strokes and you’re already unloading more of your spunk, letting it splash wildly against the underside of her [enemy.foot]. You moan and beg for more; her drug enhanced touch more intense than anything you’ve ever experienced.");

		output("\n\n<i>“You want more,");
		if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.raceShort]");
		else output(" off-worlder");
		output("? Okay then, I can do that,”</i> she purrs, stroking you off with her foot. Her very touch feels more incredible than sex as you continue to spasm and spurt shamelessly.");

		output("\n\n... An hour later...");

		output("\n\nYour mind is spinning in a delicious haze. You have been forced to orgasm countless times, your entire body now feeling impossibly heavy. You’re utterly covered in your own sticky juices from the waist down.");

		output("\n\nMeanwhile, the vanae huntress patiently scoops up every drop of your");
		if (pc.hasCock()) output(" [pc.cum]");
		if (pc.hasCock() && pc.hasVagina()) output(" and");
		if (pc.hasVagina()) output(" [pc.girlcum]");
		output(" with her tentacles. She spoons it into her [enemy.pussy] and then scoops up her [enemy.milk], rubbing it along her slit to seal in the juices. What little dribbles she can’t collect she laps up with her tongue in a lewd, amorous display.");

		output("\n\nYou can taste it as she kisses you goodbye, thanking you for the meal. She then retreats into the Mhen’gan jungle and leaves you there, naked and spent.");

		pc.orgasm();
		pc.orgasm();
		enemy.orgasm();
		processTime(75+rand(25));
	}
	else // neuter
	{
		output("\n\nShe douses you until you can’t take it anymore and experience a truly body-wracking orgasm. Your whole body shudders and convulses as you reach that blissful peak. To her dismay you don’t give her a drop of fluid - selfishly keeping all the pleasure to yourself.");

		output("\n\n<i>“I don’t understand. What <i>are</i> you?”</i> the vanae huntress exclaims. She’s clearly frustrated by her failure to milk you. She squirts even more milk onto your already slickened body and causing your temperature to rise. A few minutes later, you’re cumming all over again without giving her a single drop of spunk. <i>“...Maybe I’m not trying hard enough?”</i>");

		output("\n\nShe reaches out with a single toe and runs it up against your groin. Just the tiniest touch anywhere causes your lower body to explode with pleasure, as you moan and beg for more. She aggressively delivers, determined to get <i>something</i> out of you...");

		output("\n\n... Thirty Minutes Later...");

		output("\n\nYour mind is spinning in a delicious haze. You have been forced to orgasm countless times, your entire body now feeling impossibly heavy. The huntress, however, seems at the limit of her patience.");

		output("\n\n<i>“...Fine! I give up. I don’t know what you are, but for some reason I can’t get anything out of you. The Sky Mother is clearly playing a joke on me. Keep it!”</i> She storms off into the Mhen’gan jungle in a huff and leaves you lying there, naked and spent.");

		pc.orgasm();
		enemy.orgasm();

		processTime(45+rand(15));
	}
	
	IncrementFlag("VANAE_MILKBATH_TIMES");
	output("\n\n");
	CombatManager.genericLoss();
}

public function vanaeHuntressPCDefeatSquirtNJerk():void
{
	// Must have Cock
	// Min Girth 0.5 inch
	// Min Length 1 inch

	output("\n\nThe exotic alien huntress purrs, sliding down your body");
	if (!pc.isNude()) output(" and stripping off your [pc.armor]");
	else output(" and dragging her naked self along your [pc.skin]");
	output(". You can feel her pointedly rubbing against [pc.eachCock]. <i>“How about I pleasure");
	if (pc.cocks.length == 1) output(" this");
	else output(" these");
	output(" for you, hmm? But first, let’s get you a little bit more prepared...”</i>");

	output("\n\nYou lie there helpless as she pulls away from you, cupping her [enemy.breasts] with a mischievous smile. You marvel at how magnificent her fleshy peaks look as she pushes them up with her webbed hands, making them look even perkier. ");

	output("\n\nShe squirts thick, gooey ropes of [enemy.milk] from her [enemy.nipples], dousing [pc.eachCock]. You let out a " + pc.mfn("masculine groan", "girlish moan", "breathy moan") + ", your slick staff");
	if (pc.cocks.length > 1) output("s");
	output(" titillated and twitching. Your aching flesh is completely covered in her violet fluid.");

	output("\n\nAs it drools down your");
	if (pc.balls > 0) output(" [pc.balls]");
	else output(" buttocks");
	output(" a delicious little shiver runs down your spine. Moving closer towards you, the alien female places her webbed hands on your shoulders, a cheeky smile playing on her [enemy.lips]. She’s lubing you up, but for what? Suddenly, your loins start tingling and undergo some changes.");

	// (TF SCENE)
	vanaeTFScene();

	output("\n\n<i>“Mmm, I think I missed a few spots. How about I rub it in for you?”</i> she asks, her organic skirt beginning to break apart to stroke your [pc.cumNoun]-coated [pc.cocks]. Violet and ivory tentacles reach out and sensuously caress your [pc.cockHeads].");

	output("\n\nAs one of her tenta-tips wiggle and dip into your sticky cock hole");
	if (pc.cocks.length > 1) output("s");
	output(" you shudder with delight, arching your back into her ministrations. She continues to tease your dilating tip");
	if (pc.cocks.length > 1) output("s");
	output(" and deliver torturous amounts of pleasure. ");

	output("<i>“You really like my tentacles, don’t you? I bet you’d just love it if I did this.”</i> She gives a wicked little smile, wrapping your [pc.cocks]");
	if (pc.balls > 0) output(" and [pc.balls]");
	output(" in a mass of her tentacles. Soon they are being deliciously squeezed, applying sticky friction to every inch of your length");
	if (pc.cocks.length > 1) output("s");
	output(". You whimper in delight, your [pc.hips] wiggling as you struggle to contain the rapidly rising explosion threatening to overtake your loins.");

	output("\n\nHer coils utterly bombard your senses as they rub and writhe in different directions, a sticky, smacking noise filling the air. Soon her suckers are clamping onto your");
	if (pc.balls > 0) output(" [pc.sack],");
	output(" length");
	if (pc.cocks.length > 1) output("s");
	output(" and [pc.eachCockHead], tugging strongly at your sensitive flesh. It feels as if your genitals are being given a hundred hickeys from every angle. <i>“I think you’re almost there. Just let it go, shoot it all out.”</i>");

	output("\n\nPurringly coaxing you, the alien huntress speeds up her massage, vigorously jerking you off in an completely unpredictable way. You can’t hold out against the sensations assaulting your [pc.cocks], crying out as you reach that inevitable peak. You groan long and low as you spasmically shoot your [pc.cum] into the writhing, violet mess.");

	output("\n\nAs you deliciously shudder and spill your seed all over her tentacles she cups her [pc.breasts] once more, basting your [pc.cocks] once more in her nipple liquid. Your hot [pc.cumNoun] spurts point blank into her sticky boob milk, mixing in as she wrings your junk for every last drop. You groan long and low, knowing with this you have been utterly defeated by the alien huntress.");

	output("\n\n... An hour later...");

	output("\n\nYour mind is spinning in a deliciously delirious haze. Forced to orgasm countless times into her writhing tentacles, your entire body feels impossibly heavy. You are utterly covered in your own [pc.cum] in an embarrassing mess. She’s sapped you dry, your love milk floating around in her luminescent ink. ");

	pc.orgasm();
	enemy.orgasm();

	output("\n\nMeanwhile, the vanae huntress patiently scoops up every drip of your");
	if (pc.hasCock()) output(" [pc.cum]");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" [pc.girlcum]"); 
	output(" with her tentacles. She spoons it into her [enemy.pussy] and then scoops up her [enemy.milk], rubbing it along her slit to seal in the juices. What little dribbles she can’t collect she laps up with her tongue in a lewd, amorous display.");

	output("\n\nYou can taste it as she kisses you goodbye, thanking you for the meal. She then retreats into the Mhen’gan jungle and leaves you there, naked and spent.");

	processTime(90+rand(25));
	output("\n\n");
	CombatManager.genericLoss();
}

public function vanaeHuntressPCDefeatTitfux():void
{
	// Must have Cock
	// Max girth 4 inches
	// Max Length 12 inches.
	// Min Girth 0.5 inch
	// Min Length 3 inch

	var selCock:int = -1;
	if (pc.cocks.length > 0)
	{
		for (var i:int = 0; i < pc.cocks.length; i++)
		{
			var cockI:CockClass = pc.cocks[i];
			if (cockI.cLength() >= 3 && cockI.cLength() <= 12 && cockI.thickness() >= 0.5 && cockI.thickness() <= 4)
			{
				// Ideally I'd pass the cockindex into the function but I'm being lazy fuck off
				if (selCock == -1 || cockI.volume() > pc.cocks[selCock].volume()) selCock = i;
			}
		}
	}

	output("\n\nThe exotic alien huntress purrs, sliding down your body and stripping off your [pc.gear]. You can feel her pointedly rubbing against [pc.eachCock]. <i>“...I can see you checking out my breasts. Do you like them?”</i> she asks coyly, all the while applying delicious friction to the underside of your sheathe");
	if (pc.cocks.length > 1) output("s");
	output(".");

	output("\n\nYou moan and nod, enjoying the sensation of her ample breasts dragging erotically along your exposed belly. Her nipples seem to stiffen in response. Clearly, she enjoys hearing how much you love her massive tits just as much as you love being tantalized with them.");

	output("\n\n<i>“Well then, if you like them that much, how about you and my breasts get better acquainted?”</i> she sensuously suggests. You nod in response, aching to enjoy the pleasures her alien assets have to offer.");

	output("\n\nThe busty amazoness pulls back and brings her webbed hands up to cup her [enemy.breasts], making her already impressive cleavage stand out. Her [enemy.nipples] drool her violet milk down her ample flesh, curling and dribbling down to her [enemy.belly]. There is a distinctly feminine scent in the air mixed with a fruity aroma, the latter coming from her nipple milk.");

	output("\n\nPressing both hands against the sides of her [enemy.breasts] and giving a pointed squeeze, thick, gooey ropes of her violet milk spurt out of her [enemy.nipples]. Your [pc.cocks]");
	if (pc.balls > 0) output(" and [pc.sack]");
	output(" are suddenly splashed in the sticky substance.");

	output("\n\nLike a cow milking herself, she continues to press and squeeze her pale udders until your junk is utterly covered from tip to base. You bask in the sensation of her warm, slick liquid clinging to your sensitive rod");
	if (pc.cocks.length > 1) output("s");
	output(" as your body begins to undergo some changes.");

	vanaeTFScene();

	output("\n\nWith your [pc.cocks] covered in her slick milk and your own [pc.cumNoun], she takes them and squeezes them between her supple breast flesh. You can see her [enemy.nipples] hardening as her alien assets wrap around your [pc.cumVisc] rod"); // cumVisc rods seems kinda weird but it should work from the looks of the returns...
	if (pc.cocks.length > 1) output("s");
	output(", making you even stiffer in turn. Soon her [enemy.breasts] are enclosed around your straining");
	if (pc.cocks.length == 1) output(" hardness.");
	else output(" members.");

	output("\n\nYour mind is utterly blown as she begins to bounce her [enemy.breasts] up and down on your [pc.cocks]. Her warm, heavy weight slaps against your [pc.thighs]. Drunk with pleasure, you needily push your [pc.hips] up to meet her pale, creamy flesh, your lubricated [pc.cocksNounSimple] easily sliding back and forth between her slippery cleavage.");

	output("\n\nOnce again your [pc.cumNoun] begins to boil and surge from your [pc.cockHeads] as you smear your [pc.cumColor] jism all over her pumping cleavage.");

	output("\n\n<i>“That’s right, let it all out on my breasts. That’s a good " + pc.mf("boy","girl") + ",”</i> she croons, rhythmically pumping your firmness. <i>“I want you to unload it all across my tits and cover them in your [pc.cum].”</i>");

	output("\n\nThe mental image of that gets you even more fired up. You let out an involuntary moan as she begins aggressively working [pc.eachCock], her ample breasts wetly slapping up and down against your groin. The sticky friction sets your straining staff");
	if (pc.cocks.length > 1) output("s");
	output(" alight and your head lolls back. Before you know it, you find yourself panting and thrusting your hips against her slapping alien tits, reaching that incredible, mind blowing peak...");

	output("\n\nWith a violent, shuddering eruption, your [pc.cumNoun] fires up in thick, gooey ropes, splattering the alien huntress right on her face. You cry out as [pc.cumColor] ropes streak up as if fired from a [pc.cock] shaped volcano, falling back down to coat her ample teats in your jism. She lets out a low moan of pleasure, continuing to milk [pc.eachCock] as you spasmically spurt all over her snow white skin.");

	output("\n\nOnce you are done, she pulls back and licks the underside of [pc.oneCock], making your whole body tremble with joy. It seems she’s not quite finished with you yet, lubing you back up and taking you back into her breast flesh. You relax back, giving yourself over to pleasure...");

	output("\n\n... An hour later ...");

	output("\n\nYour mind is spinning in a deliciously delirious haze. Forced to orgasm countless times, your entire body feels impossibly heavy. Your [pc.cocks]");
	if (pc.cocks.length == 1) output(" has");
	else output(" have");
	output(" been worked over in every way imaginable");
	if (pc.balls > 0) output(" and your empty [pc.balls] are filled with a pleasurable ache");
	output(".");

	pc.orgasm();
	enemy.orgasm();

	output("\n\nMeanwhile, the vanae huntress’s breasts are utterly coated in your [pc.cum]. She patiently scoops up every drip of your");
	if (pc.hasCock()) output(" [pc.cum]");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" [pc.girlcum]");
	output(" with her tentacles and spoons it into her [enemy.pussy]. She then rubs [enemy.milk] on her slit to seal in the juices. What little dribbles she can’t collect she laps up with her tongue in a lewd, amorous display.");

	output("\n\nYou can taste it as she kisses you goodbye, thanking you for the meal. She then retreats into the Mhen’gan jungle and leaves you there, naked and spent.");

	processTime(90+rand(25));
	output("\n\n");
	CombatManager.genericLoss();
}

public function vanaeHuntressPCDefeatCunnilingus():void
{
	// Must have Vagina

	output("\n\nThe exotic alien huntress purrs, sliding down your body and stripping off your [pc.gear]. She slowly begins littering small kisses down your vulnerable belly. <i>“We vanae feed off certain liquids, you know. I’m not going to let you go until I’ve lapped up every drop you have to give; no matter how many times I have to make you cum in order to get it.”</i>");

	output("\n\n<i>“We also have a way of getting a lot of it out of you. Did you want to see?”</i> she huskily asks you. You nod feverishly, willing to do just about anything for her at this point.");

	output("\n\nThe beautiful amazon pulls away from you and you seize the chance to inhale. Her kisses absolutely took your breath away! As you strain your neck you see her grabbing her [enemy.breasts] in both hands and slowly and sensuously massaging them. Just watching her stirring them up causes your [pc.cunts] to tingle with excitement.");

	output("\n\nOnce she seems to have finished stirring up her breasts, she grabs her [enemy.nipples] firmly between her fingers. She points her nubs at you and squirts a thick, gooey rope of her udder milk directly on your [pc.groin]. The liquid looks thicker than before and definitely different. It doesn’t take long at all for it to start taking effect.");

	vanaeTFScene();

	output("\n\nNow that your [pc.pussies] are utterly drenched in her milk, she crawls back up and strokes your slit from below. You let out a mewling cry as her slender fingers trail lazily up your sticky lips and cause a fresh batch of wetness to gush all over them.");

	output("\n\nWatching you laying there like the good little prey you are, your amazonian lover sucks on your [pc.nipple] and teases it gently with her teeth. You endure a delicious two-pronged assault on your privates, her tongue lashing your sensitive nub as her finger probes");
	if (pc.vaginas.length > 1) output(" a");
	else output(" your"); 
	output(" gushing puss. It feels so damn good, the vanae huntress certainly knows what she’s doing! As expected from an all-female race, she is truly gifted at getting a girl off.");
	if (pc.hasCock()) output(" [pc.EachCock] stiffens and jerks, obviously responding to her attentions.");

	output("\n\nHer hot breath warms your [pc.skin] as her canine teasingly drags along your [pc.nipple], causing it to stiffen. Her beautiful floral scent and the feel of her silky smooth skin fill your senses as she rubs sensuously against you. You soon realize your ability to move is returning, but you’re too far into it to care about escape. All you can do is shamelessly arch your back into her attentions, begging for more.");

	output("\n\nYour wish is granted as she lets go of your captive [pc.nipple], sliding down your body");
	if (pc.hasLegs()) output(" and between your thighs");
	else output(" and towards your sex");
	output(". Her massive breasts rub against your skin as she runs her tongue up your silken slit, causing you to gasp aloud.");
	if (pc.hasLeg())
	{
		output(" You instinctively bring your [pc.legOrLegs] up and rest");
		if (pc.legCount == 1) output(" it");
		else output(" them");
		output(" on her shoulders, pulling her mouth needily towards your [pc.pussy].");
	}
	output(" Soon the alien woman’s tongue is nestled inside your slavering snatch, gloriously lapping at your insides.");

	output("\n\nWhen her long prehensile tail hooks around");
	if(pc.hasClit()) output(" and rubs [pc.oneClit] at the same time");
	output(", you let out a sharp cry of pleasure and spasm, instantly creaming yourself in her mouth.");
	if (pc.hasCock()) output(" [pc.EachCock] spurts your [pc.cum] all over the place in an erotic fanfare.");
	output(" Rather than stop, the vanae huntress thoroughly lashes your now overly sensitive snatch, eagerly scooping up your [pc.girlCum] with her skillful tongue. You’re quickly fired back up again and bucking your hips wildly against her gorgeous face.");

	pc.orgasm();

	output("\n\n<i>“Mmm, it’s as if your pussy was made to fit my mouth, my dear.”</i> The alien huntress exclaims, shortly before lapping up another helping of your [pc.cumNoun]. You shake and tremble wildly, experiencing several small explosive orgasms.");
	if(pc.hasClit()) output(" One of her tail’s suckers clamp onto your [pc.clit]. As she gently tugs on it");
	else output(" As her oral assault seems to end");
	output(", you feel your loins explode in a gooey gush right into her inviting mouth and your mind absolutely shatters.");

	output("\n\n... An hour later ...");

	output("\n\nYour mind is spinning in a deliciously delirious haze. Forced to orgasm countless times, your entire body feels impossibly heavy. [pc.EachVagina]");
	if(pc.hasClit()) output(" and [pc.clits] have");
	else output(" has");
	output(" been worked over in every way imaginable. All the while your forceful lover has lapped up every last drop of");
	if (pc.hasCock()) output(" [pc.cum] and");
	output(" [pc.girlcum] you had to give with fervor. There’s simply no more left to give.");

	output("\n\n<i>“Thanks for the meal, beautiful. Maybe I’ll catch you again sometime?”</i> The vanae huntress purrs, sliding off your paralyzed form. She lands a sensuous kiss on your [pc.lips], and you can taste your own [pc.girlCum]. She then retreats into the Mhen’gan jungle, her tail and hips sexily swaying all the while.");

	processTime(90+rand(25));
	output("\n\n");
	CombatManager.genericLoss();
}

public function vanaeHuntressPCDefeatTentafux():void
{
	// All but Neuter. 
	// Two versions - one vag, one ass. If pc.hasPussy, randomly choose between ass or vag. If male, only choose ass.
	// PC can take any size since the girth could be the tip or the thick base. Size of tentacle is 2/3rds PC capacity (As she can use the tip or the base). If needed, max out at seven inches girth and 60 inches long.

	var isCunt:Boolean = false;
	if (pc.hasVagina() && rand(2) == 0) isCunt = true;

	output("\n\n“Anything<i>, you say? I’ll take you up on that offer.”</i> The vanae huntress purrs, sliding down your body and stripping off your [pc.gear]. What exactly is she planning to do with you?");

	output("\n\nShe pulls herself back from your body and cups her [enemy.breasts] firmly in her webbed hands. She begins sensuously and forcefully massaging them, almost as if she’s stirring up the mammary milk inside. For all you know, that’s exactly what she’s doing as she lets out a sensuous purr. Talk about a milkshake!");

	output("\n\nOnce she seems to have finished, she grabs her [enemy.nipples] firmly between her fingers. She points her nubs at you and squirts a thick, gooey rope of her udder milk directly on your [pc.groin]. The liquid looks thicker than before and definitely different. It doesn’t take long at all for it to start taking effect.");
	
	vanaeTFScene();

	output("\n\nAs your [pc.legOrLegs] tremble");
	if(pc.legCount == 1) output("s");
	output(", she");
	if (pc.isBiped()) output(" spreads your thighs and");
	output(" positions herself close to your");
	if (isCunt) output(" naked mound");
	else output(" [pc.ass]");
	output(". Her long tentacle tail is suddenly poking out from between her [enemy.thighs] and below her [enemy.pussy], just like an alien cock. Her teasing tip or ‘glans’ strokes the sensitive flesh of your");
	if (isCunt) output(" [pc.pussy]");
	else output(" [pc.asshole]");
	output(" causing you to cry out in pleasure, your senses infinitely enhanced by her intoxicating melon milk.");

	output("\n\nYou can acutely feel a small slit on the tip of her tail, dribbling small amounts of [enemy.milk] against your sensitive");
	if (isCunt) output(" lips");
	else output(" rim");
	output(". Could it be she can ejaculate from it just like a cock?");

	output("\n\n<i>“I’m going to stick this inside of you and fuck you just like a man. That’s what you want, right?”</i> she teases you not only with her [enemy.tail] but with her words. You try to think straight but keep sinking back into drunken pleasure...");

	output("\n\nBefore you know it, you’re nodding furiously and begging her to fuck you with it. Unable to get yourself off, her fucking you like this is the only way you’ll get any release. And it feels so <i>good</i> rubbing against your");
	if (isCunt) output(" sopping wet slit");
	else output(" defenseless rim");
	output(".");

	output("\n\nYou become acutely aware of every sensation bombarding your body, passion burning across your [pc.skinFurScales] and setting it alight. You bite back a moan as your [pc.thighs] tremble with anticipation, a tingling anticipation flooding your lower stomach.");

	output("\n\nAt first her tip teases your");
	if (isCunt) output(" glistening");
	else output(" puckered");
	output(" entrance, tracing inch by glorious inch");
	if (isCunt) output(" along your [pc.pussyColor] pussy lips");
	else output(" around your naughty hole");
	output(". Your [pc.thighs] quiver with delight as it slowly begins pressing inside of you, slowly sinking inside your");
	if (isCunt) output(" netherlips.");
	else output(" aching rump.");

	if ((isCunt && pc.vaginalVirgin) || (!isCunt && pc.analVirgin))
	{
		output("\n\nIt’s your first time, and you’re so damn excited you can’t stay still. You can’t believe you’re going to lose your");
		if (!isCunt) output(" anal");
		output(" virginity to an exotic amazonian huntress, with her tail cock no less. The lewdness of your situation makes your [pc.groin] ache, discovering wonderful new sensations you never knew you could <i>feel</i>.");

		output("\n\nYou do know one thing, though. For the rest of your life, you will never forget this single indelible moment. <b>You have lost your");
		if (!isCunt) output(" anal")
		output (" virginity!</b>");

		if (isCunt)
		{
			pc.vaginalVirgin = false;
			pc.vaginas[0].hymen = false;
		}
		else
		{
			pc.analVirgin = false;
		}
	}

	if (isCunt) pc.cuntChange(0, pc.vaginalCapacity(0) * 0.6, false, false, false);
	else pc.buttChange(pc.analCapacity() * 0.6, false, false, false);

	output("\n\nYou clench excitedly around her incredible length as it wiggles around and caresses your inner walls, teasing its way further inside of your");
	if (isCunt) output(" [pc.pussy]");
	else output(" [pc.ass]");
	output(". You positively melt as it strokes and probes your");
	if (isCunt) output(" slick");
	else output(" dirty");
	output(" insides, biting back a moan. Suddenly you realize you have a bit of body motion back, but instead of wriggling free you’re raising your hips, allowing her better entry into your");
	if (isCunt) output(" womanly");
	else output(" forbidden");
	output(" passage.");

	var looseness:Number;
	if (isCunt) looseness = pc.vaginas[0].looseness();
	else looseness = pc.ass.looseness();

	output("\n\n");
	if (looseness <= 1) output("<i>“...Was this your first time? You feel so tight!”</i> she exclaims");
	else if (looseness <= 3)
	{
		output("<i>“You like my tail buried in your");
		if (isCunt) output(" [pc.pussyColor] pussy");
		else output(" beautiful bottom");
		output(", don’t you? I love how tight you are!”</i> she exclaims");
	}
	else output("<i>“You’re so loose - you’ve done this a lot, haven’t you?”</i> she asks");
	output(". You let out a trembling cry in response, your mind reeling from the intense sensations utterly seizing your body as her tentacle ‘cock’ coils around inside of you.");

	output("\n\nTentacles of her organic skirt begin coiling around your [pc.hips], pulling her waist flush with your own. You gasp as your bellies rub together and her naked flesh brushes against your [pc.skinFurScales], her writhing alien appendage now buried fully inside of you.");

	output("\n\nSlowly she begins to plumb your");
	if (isCunt) output(" [pc.pussy]");
	else output(" [pc.asshole]");
	output(" with her [enemy.tail], holding you fast with her suckling skirt. Her tendrils wrap around your [pc.thighs]");
	if (pc.totalClits() > 0) output(" and tease your [pc.clits]");
	else if (pc.hasCock()) output(" and tease your [pc.cockHeads]");
	else output(" and tease your [pc.groin]");
	output(", making you squirm with pleasure.");
	if (isCunt) output(" You gush around her [enemy.tail]");
	else if (!isCunt && pc.hasVagina())
	{
		if (pc.vaginas.length == 1) output(" Your [pc.cunt] is sopping wet");
		else output(" Your [pc.cunts] are sopping wet");
	}
	if (pc.hasCock()) output(" as even more [pc.cum] dribbles from your [pc.cocks].");
	else output(" as she teases and screws you with her assorted tentacles.");

	output("\n\nNever have you felt so complete as being fucked right now by this amazon huntress, pleasure coursing through your body in crashing waves. You positively drown in ecstasy, pressing your [pc.hips] needily against her own.");

	output("\n\nJust when you think you can’t reach any higher than you already are, her flexible tip begins stroking your most sensitive spot");
	if (isCunt && pc.hasVagina()) output(", rubbing deliciously against your G-spot");
	else if (pc.hasCock()) output(", pressing and teasing your prostate");
	output(". You let out a loud, shameless cry as her suckers clamp on, tugging and suckling at it. It pushes you careening over the edge in a glorious, spasmodic rush.");

	output("\n\nYour [pc.legOrLegs] shake");
	if(pc.legCount == 1) output("s");
	output(" and you cream yourself hard,");
	if (pc.hasCock()) output(" [pc.cum] shooting from [pc.eachCock]");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" [pc.girlcum] squirting from [pc.eachPussy]");
	if ((pc.hasCock() && !pc.hasVagina()) || (!pc.hasCock() && pc.hasVagina())) output(" and all over the place");
	output(". At the same time she shoots her [enemy.milk] inside of you, filling up your spasming hole.");

	if (isCunt) pc.loadInCunt(enemy, 0);
	else pc.loadInAss(enemy);
	enemy.orgasm();
	pc.orgasm();

	output("\n\n<i>“How was that for starters?”</i> The vanae huntress asks. Your mind goes blank. That was just the start of it? Suddenly she’s stoking your fire once more, getting you ready for yet another round. You’re not sure if your mind can take that a second time!");

	output("\n\n... An hour later...");

	output("\n\nYour mind is spinning in a deliciously delirious haze. Forced to orgasm countless times with just her foot, your entire body feels impossibly heavy. You are utterly covered in your own");
	if (pc.hasCock()) output(" [pc.cum]");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" [pc.girlcum]");
	output(" in an embarrassing mess. She’s sapped you completely dry.");

	output("\n\nMeanwhile, the vanae huntress patiently scoops up every drip of your");
	if (pc.hasCock()) output(" [pc.cum]");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina()) output(" [pc.girlcum]");
	output(" with her tentacles. She spoons it into her [enemy.pussy] and then scoops up her [enemy.milk], rubbing it along her slit to seal in the juices. What little dribbles she can’t collect she laps up with her tongue in a lewd, amorous display.");

	output("\n\nYou can taste it as she kisses you goodbye, thanking you for the meal. She then retreats into the Mhen’gan jungle and leaves you there, naked and spent.");

	processTime(90+rand(25));
	output("\n\n");
	CombatManager.genericLoss();
}

public function vanaeMaidenPCDefeat():void
{
	vanaeHeader("DEFEAT: VANAE\n");

	// HP
	if (pc.HP() <= 1)
	{
		output("The pain is too much and you fall on your back, unable to continue the fight. The vanae maiden pumps her fist and spear in the air, clearly elated by her victory.");
		
		output("\n\n<i>“YES! I did it, I won - I’m a real huntress now!”</i> She seems giddy with delight. It seems it’s the first fight that she’s ever won.");
		
		output("\n\nRemembering your injuries, her elated look turns to one of clear concern. <i>“Oh... um... sorry I had to hurt you so badly. You didn’t look like you were going to go down without a fight, so... yeah.”</i> She scratches the back of her neck, looking a little bashful and nervous. You can’t believe you were beaten by such an obviously inexperienced huntress.");
		
		output("\n\nIn your defeat, you lie there helpless as she moves up and sticks her spear into the ground beside you. She’s not going to take your life, at any rate. Instead she’s cupping her tiny breasts, though for what reason, you have no idea.");
		
		output("\n\n<i>“You’re hurting, right? I know a trick to help. I don’t have much, but my breasts secrete a substance that’ll take away your pain. Hold still.”</i> she urges you. First she removes your [pc.gear] and then she squirts [enemy.milk] from her [enemy.breasts]. It splatters all over your [pc.chest] and smears all over your [pc.skinFurScales].");
		
		output("\n\nAll of a sudden, the pain is gone. You also realize the feeling of her brushing along your [pc.skinFurScales] is causing your blood to boil. As you look up at her cupping her [enemy.breasts], blood rushes to your cheeks... among other places.");
		
		output("\n\n<i>“Oh, it worked! I’m so glad. Um... you might be feeling a bit aroused right now. That’s a side effect of our milk. How about I help you work that off?”</i> she coyly suggests. <i>“As... as the victor, I have to take my prize, after all... that’s the way my people do things.”</i>");
	}
	else
	{
		output("You can’t hold out any longer,");
		if (!pc.hasStatusEffect("Tripped") && !pc.hasStatusEffect("Grapple")) output(" falling on your back and panting lustily");
		else output(" giving in at long last");
		output(". You’re so freaking horny, all you want to do is get off!");
		
		output("\n\nMeanwhile, the vanae maiden pumps her fist and spear in the air, clearly elated by her victory. She completely ignores your obvious frustration as you fiddle with yourself on the ground.");
		
		output("\n\n<i>“YES! I did it, I won - I’m a real huntress now!”</i> She seems giddy with delight. It seems it’s the first fight that she’s ever won. Walking up to you, she sticks her spear in the ground and shoots you a confident grin.");
		
		output("\n\n<i>“I can’t believe I won with my sex appeal. Wait until I tell everyone about it! Well, after I help you with your frustration problem, that is.”</i> She suddenly looks a little bashful, <i>“A-as... as the victor, I have to take my prize. That’s the way my people do things. Any problems with that?”</i>");
		
		output("\n\nYou shake your head feverishly. If you don’t orgasm soon, you feel as if you’ll go mad!");
		if(!pc.isCrotchExposed() && !pc.isChestExposed() && !pc.isAssExposed()) output(" You strip off your [pc.gear] and ");
		else output(" You ");
		output("lewdly demand that she take her prize.");
		
		output("\n\n<i>“Geez, you’re really forward about it! I guess it can’t be helped. You better be gentle, okay?”</i> she chastises you.");
	}

	var options:Array = [];

	if (pc.hasCock() && pc.genitalSpot < 2 && pc.cockThatFits(enemy.vaginalCapacity(0)) != -1) options.push(vanaeMaidenPCDefeatTakeVirginity);
	options.push(vanaeMaidenPCDefeatCunnilingus);
	
	options[rand(options.length)](); // How the fuck did I miss this??!
}

public function vanaeMaidenPCDefeatTakeVirginity():void
{
	// PC Virginities taken: +1 (If you want to take a tally of 'achievements')
	// Must have Cock
	// Must have front or mid genitals.
	// Max girth 4 inches
	// Max Length 12 inches.

	var selCock:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(selCock < 0) selCock = pc.smallestCockIndex();

	output("\n\nGetting down on all fours, the youthful huntress reaches down and tentatively touches [pc.oneCock]. She lets out a surprised noise as her slender fingers dance along your length. It is clearly the first time she’s ever felt a cock, let alone one like yours.");

	output("\n\n<i>“");
	if (pc.cocks[selCock].cLength() <= 3) output("It’s smaller than I thought");
	if (pc.cocks[selCock].cLength() >= 10) output("It feels so large");
	else output("It feels so hard");
	output(" and so strangely shaped! I’ve never touched a male sex organ before.”</i> Her cheeks flush. <i>“I’m going to get you to stick this inside of me, but I’m a little nervous. It is my first time after all, and it looks pretty scary.”</i>");

	output("\n\nDespite her concerns, she positions herself above your [pc.cock]. You can see right up her short tentacle skirt, getting an eyeful of her bald [enemy.vaginaNounSimple] and [enemy.clits]. It makes your already aching [pc.cock " + selCock + "] throb even harder.");

	output("\n\nSlowly crouching down on top of you, she grabs your [pc.cock " + selCock + "] with one hand and rubs it against her moist, virginal slit. She seems to be having a tough time getting it inside of her because she’s not wet enough yet. <i>“Um... it keeps slipping?”</i>");

	output("\n\nYou tell her she needs to be more aroused first");
	if (pc.cockVirgin) output(" - at least that’s your guess -");
	output(" and she flushes a little. When she asks how, you suggest her bringing her breasts a little closer to your [pc.face]. She does so obediently as you somehow take the lead, her [enemy.breasts] pushed eagerly against you.");

	if (pc.isAss())
	{
		output("\n\nUsually you’re pretty sure you wouldn’t be so nice, but");
		if (pc.lust() >= pc.lustMax()) output(" you’re so aroused you don’t care");
		else output(" it seems her milk is clouding your thoughts");
		output(". All you can think of right now is getting off.");
	}

	output("\n\nAs you seize one of her [enemy.nipples] between your teeth, she gives a startled little jump. You suck on it and flick her tip with your tongue. Soon she is letting out a low moan as you roll her bud around in your mouth, teasing it to stiffness.");

	output("\n\nThe floral aroma of her [enemy.skin] fills your nostrils, innocently accompanied by the sweet scent of her arousal. After a while of nipple play you’re fairly sure she’s wet, and tell her it’s okay to proceed.");

	output("\n\n<i>“Um... thank you!”</i> the young woman flushes, grabbing your erect [pc.cockNoun " + selCock + "] and holding it upright. <i>“Um, ");
	if (pc.cocks[selCock].cLength() <= 3) output("you’re pretty small, so I’m sure it’ll be fine...");
	else if (pc.cocks[selCock].cLength() < 10) output(" be gentle, okay?");
	else output(" you’re pretty big, I’m not sure you’ll even fit...");
	output("”</i>");

	vanaeMaidenTakeVirginity();
}

public function vanaeMaidenPCDefeatCunnilingus():void
{
	output("\n\nThe virgin huntress lies back on the ground and spreads her [enemy.thighs]. She bashfully exposes the vulnerable pink-tinted skin of her inner loins to you, letting you drink it up with your hungry eyes.");

	output("\n\nHer webbed hands come down and part her short tentacle skirt. Her [enemy.pussyNoun] is cute and pink, two tiny clits poking out from her puffy lips. You can see a glistening wetness on her unsullied flower, just begging to be licked off.");

	output("\n\n<i>“I... I want you to eat me out, okay? Can I trust you to do that?”</i> she meekly requests. Too horny to refuse, you slink down between her [enemy.legs] and bring your [pc.face] inches away from her [enemy.pussy]. If she wants you to eat her out, you’ll do just that.");

	output("\n\nShe gives a pleasured shiver as you brush her girl parts with your [pc.lips]. As you tease them she wiggles eagerly on the spot, unable to contain the powerful sensations threatening to take over.");

	vanaeMaidenCunnilingus();
}

//cockvine tail versus vanae (first draft)
//misch/mean scene (gives ~0.5-1 points toward personality)
//impregnates the vanae with cockvines instead of daughters; also adds a <times selected>/100 chance of adding a cockvine blurb to vanae combat descript(s)
//scene is currently cockvine only; can be tweaked for future suitable (i.e. with own gonads) types
//tooltip, vanae maiden: Trick the poor, sweet, blind girl into giving her maidenhead to your parasitic tail-cock.
//tooltip, vanae huntress: Let the busty, blind cumslut impregnate herself with your parasitic, vine-spawning tail-cock.
//disabled tooltip, no cockvine tail: You don’t have {(no cocks)any cocks, let alone parasitic ones. /(else)a cock able to parasitize the vanae... unless you’re cynical enough to consider your own children parasites. Victor Steele, is that you?}
//disabled tooltip, balls too big to get around (12"+): Your monster balls are too big to sneak your tail around!

//new victory intro fork - should work for both HP and lust wins
//replaces the shared victory sex intro (i.e. everything after the scene selection menu)
//if a hunger/need to fuck score is introduced for the cock-tail, scene should still work as an automatic trigger with minimal adjustment
public function cockvineTailPlusVanaeVictory():void
{
	clearOutput();
	pc.addHard(1);
	author("Zeikfried");
	vanaeHeader("VICTORY:VANAE\n");
	//if (enemy is HuntressVanae)
	output("You open your mouth to answer her, but something stops you. The ");
	//(maid)
	if(enemy is MaidenVanae) output("girl’s slender");
	else output("woman’s juicy thighs");
	output(" tremble");
	if(enemy.lust() >= enemy.lustMax()) output(" from the force of her frigging");
	output(", and her pussy shines wetly under her slithering skirt. A foreign urge takes shape in you");
	if(!pc.hasCock())
	{
		output(", rendered all the more stark by your ");
		if(pc.hasVagina()) output("female sex");
		else output("lack of a sex");
	}
	output(": desire to impregnate her with your seed. Images slideshow through your mind, showing the ");
	if(enemy is MaidenVanae) output("virginal girl");
	else output("shapely amazon");
	output(" trembling under your primal love, growing gravid with your spawn, swelling until she’s immobile and finally, birthing a healthy, baby... vine? And just like that, you understand where this sudden compulsion is coming from and why you have to answer it.");

	output("\n\nYour [pc.tailCock] snakes ");
	if(pc.legCount == 1) output("around your waist");
	else output("through your legs");
	output(" to a position at the front of your crotch");
	if(pc.hasCock()) output(", and you feel your [pc.cockNounSimple] drool a bit of pre as it frots its way along the underside.");
	else if(pc.hasVagina()) output(", and you shiver as the glans, then the shaft, slides through the track of [pc.oneVagina].");
	else output(".");
	output(" The dark desire to spread your parasite grows in intensity, drowning out everything, forcing you to answer it. Swaying your hips to get her attention, you prepare to dissimulate.");

	if(pc.isNice()) 
	{
		output("\n\n<i>“Hey, er... ");
		if(enemy.HP() < 1) output("I’m not going to hurt you, so ");
		output("do you");
		if(pc.isBimbo()) output(", like,");
		else output(" maybe");
		output(" want to... have s-sex?”</i> you stammer, unaccustomed to malicious half-truths.");
	}
	//(misch)
	else if(pc.isMischievous())
	{
		output("\n\n<i>“What I have in mind won’t hurt you");
		if(pc.isBimbo()) output(", cutie");
		output(",”</i> you flirt, thrusting at her. <i>“Unless you’re super tight.”</i>");
	}
	//(mean)
	else
	{
		output("\n\n<i>“Spare the ");
		if(pc.isBimbo()) output("talk");
		else output("histrionics");
		output("... just get on my dick,”</i> you grunt, jabbing your crotch-vine at her crudely.");
	}
	output("\n\nThe vanae’s ears twitch as she takes in your new, ‘erect’ profile. ");
	if(enemy is MaidenVanae) 
	{
		output("<i>“R-really? Even after I tried to hurt you, you want to give me your seed?”</i> Her demeanor lifts");
		if(enemy.HP() < 1) output(" as she sits up and sniffles");
		output(". <i>“I’m so happy...”</i>");
	}
	else
	{
		output("<i>“You’re very kind,”</i> the seasoned huntress flatters. <i>“Then... if you’re offering me your seed, I </i>eagerly<i> accept.”</i>");
	}
	output("\n\nThe vanae scoots closer, ");
	if(enemy.lust() >= enemy.lustMax()) output("pussy-wettened ");
	output("hand outstretched as you bring your groin to her face. ");
	if(pc.hasCock())
	{
		output("The eager alien first ");
		if(pc.isTaur()) output("touches");
		else output("reaches for");
		output(" [pc.oneCock], but you clear your throat to distract her. Though she doesn’t turn her head, her finned ears pivot to indicate attention and you slip your viny, phallic parasite into her hand instead without a hitch.");
	}
	else
	{
		output("The alien’s fingers wrap around your [pc.tailCock], pulling it toward a pair of ");
		if(enemy is MaidenVanae) output("prim");
		else output("plump");
		output(" lips.");
	}
	if(enemy is MaidenVanae)
	{
		output("\n\n<i>“So this is a male penis...”</i> your callow lover muses, breathing right on the glans. <i>“It’s so stiff and thick... kinda sticky too.”</i>");
	}
	else output("\n\n<i>“Such a strange organ,”</i> the amazon remarks, drawing it close to her mouth. <i>“It’s so flexible and eager.”</i>");
	output(" She reclines and spreads her thighs, dragging you in by your ‘cock’ and trying to line it up for insertion, but you pull back.");

	output("\n\n<i>“Not like that,”</i> you interject, conscious of your tail dipping away from your crotch as she tugs. You nudge the vanae’s shoulder");
	if(pc.tallness >= 80)
	{
		output(" with your ");
		if(pc.isTaur()) output("fore-");
		output("[pc.foot]");
	}
	output(", and she takes the hint. Giggling girlishly, she rolls over onto her hands and knees, lifting her tail and exposing her double-nubbed pussy.");
	output("\n\n<i>“Like this, then?”</i> she asks, waggling her [enemy.butt] in the air. Her ");
	if(enemy is MaidenVanae) output("pearly skin blushes and her ");
	output("sensitive ears flatten to pick up sound from the rear, but from her newfound passivity, you conclude that they’re no longer enough to give her a perfect picture. Your dark desire flares again as you take her, safe from scrutiny.");

	if(!pc.isAss())
	{
		output("\n\n");
		if(pc.isBimbo()) output("<i>“Cute butt, honey,”</i> you coo, grasping ");
		else if(pc.isBro()) output("<i>“Yeah,”</i> you grunt, grasping ");
		else output("<i>“Very nice,”</i> you admire, grasping ");
		if(pc.isTaur()) output("her between your fore-legs.");
		else output("her [enemy.hips].");
	}

	if(enemy is MaidenVanae) 
	{
		output("\n\nThe slender girl tenses as your parasite forces her open, clawing up handfuls of dirt in her delicate fingers. <i>“Nnnnn... keep going,”</i> she moans, through clenched teeth. You steady her ");
		if(pc.isTaur()) output("by resting one foreleg on her shoulder");
		else output("with a hand on her shoulder");
		output(", and her tentacled hair wraps around your ");
		if(pc.isTaur()) output("ankle");
		else output("wrist");
		output(", wringing out the pain of her first lovemaking as your verdant vine bottoms in her virgin pussy.");
	}
	else
	{
		output("\n\nThe huntress hums through pinched lips in appreciation as your parasite parts her well-loved labia, even lowering her chest until her breasts drag in the dirt and her engorged clits are angled to rub on your shaft. This is clearly not the first time she’s made love from this position.");
	}
	output("\n\nSilken cilia inside the vanae corral and caress your [pc.tailCock], dumping impulses of pleasure right into your spinal nerves as the ");
	if(enemy is MaidenVanae) output("newly-minted ");
	output("woman acclimates to the penetration. Her ");
	if(pc.isTaur()) output("shoulder");
	else output("ass");
	output(" trembles under your fingers, and she grunts out permission, ");
	if(enemy is MaidenVanae) output("<i>“Okay... I’m ready... go ahead.”</i>");
	else output("<i>“Ohh, yes! Fuck me!”</i>");

	output("\n\nYou obey, drawing back to the [pc.tailCockHead] ");
	if(enemy is MaidenVanae) output("and feeling the vanae’s cilia yield reluctantly, almost grudgingly, ");
	output("before pushing in again.");
	if(enemy is MaidenVanae) output(" The girl’s sharp intake of breath puts the lie to her claim; she continues to shiver, trying to accustom her lean body to the woman’s role. Her progress seems to be slow; every thrust is amazingly tight as her muscular pussy clamps down not from pain, but the anticipation thereof.");
	else
	{
		output(" The alien woman is more promiscuous than any two minds sharing one [pc.race] body could be, greedily leaning so far that she threatens to pull your cock free and then, as soon as the in-stroke begins, slamming her incorrigible pussy on your crotch hard enough to ");
		if(pc.balls > 0) output("knock your [pc.balls] into your taint.");
		else output("bruise.");
	}

	//if PC is taur
	//forkception
	if(pc.isTaur())
	{
		if(enemy is MaidenVanae) output("\n\nThe fear in this woman is making her clench tight enough to sharpen a pencil. With most of the force coming from your tail instead of your pelvis, you need more leverage to even move it inside.");
		else output("\n\nHer rampant ass is moving so wildly that it threatens to pull your ‘cock’ so far from your pelvis that even a blind woman could spot the hoax.");
		output(" You drop your fore half to its ");
		if(pc.hasKnees()) output("knees ");
		output("in desperation, pushing the vanae’s down with your bulk until her chest and cheek alike are pressed to the dirt. She protests at first, until your [pc.stomach] presses against her ass, pinning her tail between the two of you. It shivers, and a drop of warm liquid drools from it");
		if(!pc.hasScales() && !pc.hasChitin()) output(", spreading heat on your skin");
		output(". ");
		if(enemy is MaidenVanae) output("<i>“That feels kinda good...”</i> the girl mumbles, though a mouthful of grass. <i>“Do it harder...”</i>");
		else output("<i>“Oooh,”</i> the wild woman moans, <i>“yeahh. Squeeze me... milk my fucking tail!”</i>");
		output(" You oblige, modifying your stroke to press her tail from base to tip as your own spears her pussy.");
		if(enemy is MaidenVanae) output(" Distracted by it, the nervous virgin forgets to pinch the blood from your cockvine and, before too many more thrusts, has realized that she’s enjoying herself. A soft hum or moan wafts up from beneath your body.");
	}
	//if is taur and has cock, also add tailjob
	if(pc.isTaur() && pc.hasCock())
	{
		output("\n\nYour lover is enjoying herself so much that she seeks out even more milking pleasure. She gives up on raising her head and moves her hands to her breasts instead, squeezing and grunting as ");
		if(enemy is HuntressVanae) output("sweet-smelling ");
		output("liquid sprays through her fingers. The tentacles of her skirt hunt your belly for anything to rub against, and find [pc.oneCock]. On the next out-stroke, her sticky tail pulls away from your ");
		if(pc.hasFur()) output("matted stomach");
		else output("stomach");
		output(" and loops over your shaft. With each subsequent pump it makes another turn, until your hard cock and her tail both are squeezing and drooling on one another. The liquid builds until it becomes slippery enough that you can thrust in her coiled tail just like a pussy.");
	}
	//else if not taur
	if(!pc.isTaur())
	{
		if(enemy is MaidenVanae) 
		{
			output("\n\nYou decide to do a kindness by drawing her mind away from the penetration");
			if(pc.isAss()) output(", if only so you can actually enjoy it");
			output(", and take her twitching tail in hand.");
		}
		else output("\n\nThe vanae’s eager slaps threaten to disconnect your ‘cock’ from your pelvis, and you grab wildly, hoping for a handful of tentacle that will enable you to wrangle the feisty pussy. Instead, you come up with her twitching tail.");
		output(" It dribbles a runner of slippery, ");
		if(enemy is MaidenVanae) output("pink");
		else output("purple");
		output(" fluid as you squeeze, and the woman under you dips her back and hums as it tingles your skin. ");
		if(enemy is MaidenVanae) output("<i>“That feels nice... do it again?”</i> she asks, marshalling her bravery for the first sexual request of her life.");
		else output("<i>“Oh, yes!”</i> the slutty spearwoman shouts. <i>“Milk me! Milk my tail!”</i> She lifts one supporting hand to her breast, risking a mouthful of dirt to squeeze free even more sweet secretions, and moans as the goo sprays through her fingers.");
		output(" You oblige, starting at the base of her tail and forcing out another dollop of the alien ‘milk’ that drops onto her tight, ");
		if(enemy is MaidenVanae) output("pink");
		else output("purple");
		output(" ass. Her cunt finally calms from the distraction, allowing you to achieve a normal stroke");
		if(enemy is MaidenVanae) output(" and, as soon as she realizes it doesn’t hurt, the maiden reveals herself as the closet slut she is with cute little grunts");
		output(".");

		//if not taur and has cock, add jerkoff
		if(pc.hasCock())
		{
			output("\n\nYour [pc.cock] rubs against the vanae’s tentacle-salad skirt as you thrust your cockvine; with each push, it gets harder and harder to ignore. ");
			if(pc.cumQ() < 500) output("Drops");
			else output("Streams");
			output(" of precum flow from its slit, joining the mess of milk on the girl’s back and occasionally your [pc.cockHead] slides through it on a high-angle thrust, which only makes you harder and dribblier. It’s no longer just about satisfying the cock-vine’s desire anymore; your own lust is burning brightly in you. You take a short break from milking your lover and stroke your needy prick, but the vanae’s greedy tail demands attention again, brushing against your side and curling overtop your hard [pc.cockNounSimple].");
			//(girth > 4”</i>)
			if(pc.cocks[0].thickness() < 4) output(" Unable to ignore either, you push her tail under your cock and wrap your hand around both, jerking yourself off with a trembling, wet milk-tentacle licking the underside.");
			else output(" Unable to service both, you pin her tail under your girthy prick and resume masturbating, pressing it into her back with your knuckles.");
		}
	}
	//if maiden vanae
	if(enemy is MaidenVanae)
	{
		output("\n\n<i>“This... is... amazing,”</i> the girl pants, between the pounding blows of your [pc.tailCock] on her slight, ");
		if(enemy is MaidenVanae) output("pink");
		else output("purple");
		output("-white frame. <i>“Caught... my first male. Gonna get... my first load... gonna have... strong, healthy daughters...”</i>");
		if(pc.isAss()) output(" The naiveté strikes you as so pitiably funny that you don’t even stifle your response; deep, belly laughs transfer through your hips to the poor girl, jiggling her petite ass and breasts.");
		else output(" The girl’s naiveté is both sweet and funny, and you find it hard to control your laughter as she daydreams aloud about the family and social status your spunk will confer. Eventually you can stand it no longer and a single guffaw escapes.");

		output("\n\n<i>“What’s so funny?”</i> she asks, turning her head and trying to look stern despite the rogering that’s rocking her on her slender limbs like a canopy roof in a windstorm. When her pinched frown only provokes another laugh, her cilia clamp down in ‘retribution’, speaking to your cockvine in tongues as her expression shifts to silvery smugness. <i>“If you can give me strong daughters, I’ll remember you with a favor when I become matriarch. Go on... you want to, right?”</i> You make a show of agreement, eager for her to turn back around.");
	}
	//end maiden-only interlude

	output("\n\nYour tail-thrusts intensify against the nubby walls of the vanae’s pussy");
	if(enemy is HuntressVanae) output(" as her cries devolve into guttural nonsense and her tongue spills from her mouth");
	output(", grinding the glans into her so hard that you wouldn’t be surprised if a bump began moving along her fit little stomach in time with your stroke.");
	if(!pc.isTaur()) output(" You slip your hand underneath, just from curiosity, and begin feeling around the woman’s delta. The vanae laughs ticklishly. <i>“You’re so passionate,”</i> she murmurs, covering your hand with hers and interlacing your fingers.");
	output(" Orgasm builds in your parasite as you pump, translating through the major nerve and into you as its gonads prepare to release, and your tail strokes become faster while your other muscles weaken. Your lover-soon-to-be-victim feels your vinestalk trembling with imminent release, and braces herself....");
	output("\n\nYour tail spasms, filling your mind with the culmination of your dark impulse and filling the vanae’s cunt with a load of self-fertile, parasitic cockvine seed. The oblivious vanae moans and orgasms as the sticky spores splatter, curving her back to push her ass higher and your ‘cock’ deeper inside. Her hips lock in position as climaxing cilia wring the spunk from your [pc.tailCock] and wick it to the mouth of the womb, trying to give your invasive load some much-unneeded help in impregnating her. Her tail thrashes ");
	if(!pc.isTaur()) output("in your grip");
	else output("against you");
	output(", squeezing the last of its milk as her muscles lock and release independently");
	if(pc.hasCock())
	{
		output(", and your [pc.cocksLight] add");
		if(pc.cockTotal() == 1) output("s");
		output(" a load of [pc.cumVisc], [pc.cumColor] jism to the puddle of goo on the girl’s back.");
		if(pc.cumQ() >= 500) output(" So much spurts from you that it begins to escape the little valley of her back muscles, oozing down her abdomen in rivulets. Beneath you, the vanae senses the liquid bounty creeping along her sides, and laughs weakly.");
	}
	output("\n\nShe rests her tight dancer’s body against you for a moment while she recovers from the seeding. <i>“That was nice,”</i> the vanae says dreamily, swaying her hips with your parasitic vine still inside.");
	if(!pc.isTaur()) output(" Her hand squeezes yours one last time before brushing a stray tentacle from in front of her ear.");
	output(" Slowly, she separates from your tail and turns around to sit facing you in the jungle grass. A trickle of cockvine semen, green-tinged on her pale skin, drips from between her puffy, inflamed labia.");

	if(enemy is MaidenVanae) output("\n\n<i>“Um, thanks...”</i> she says. <i>“The older huntresses say you always remember your first catch. Now I understand why.”</i>");
	else output("\n\n<i>“That was great,”</i> the busty huntress grins. <i>“I’ll definitely try to catch you again if I see you.”</i>");
	output(" As she stands and collects her things, you ");
	if(pc.isNice()) output("twinge with guilt");
	else output("laugh quietly");
	output(". She probably will - but not for the reason that she thinks.\n\n");
	//end, do pc tail orgasm, do pc normal orgasm (if separate function), do appropriate loot and time as needed
	processTime(35);
	pc.orgasm();
	if(enemy is MaidenVanae) IncrementFlag("VINED_V_MAIDEN");
	else IncrementFlag("VINED_V_HUNTRESS");
	CombatManager.genericVictory();
}

//the combat descript easter egg
//random 0-99 and add the blurb when result < num of times scene was selected
/* Fukkit. Can't be arsed after all those variations. If Zeik or someone wants to fuck around with it lemme know.
output("\n\n//maiden descrip (new addition in Saints’ purple)");
output("\n\nYour opponent - a young vanae maiden - almost appears as if she’s dancing as she fights you. Her [enemy.hair] and short skirt, not to mention her tiny breasts, make her look almost girlish. The amazon’s tentacles and body markings are [enemy.hairColor] colored and bioluminescent{, apart from a single dull-green, phallic one in back that seems to have a mind of its own}. \n\nAs she swings her pointed spear around in her webbed hands, you can’t help but notice her tiny boobs bouncing about. Her inverted nipples are lactating a transparent, [enemy.milkColor] goo. Meanwhile her [enemy.tail] whips around as she ‘dances’, another weapon in the alien girl’s natural arsenal.\n\nHer eyes are closed. It’s always a little weird fighting someone who doesn’t even look at you.");

output("\n\n//huntress descrip");
output("\n\nYour opponent - a busty vanae huntress - almost appears as if she’s dancing as she fights you. Her [enemy.hair] and skirt, not to mention her sizable breasts, make her look incredibly feminine. The amazon’s tentacles and body markings are [enemy.hairColor] colored and bioluminescent{, apart from a single dull-green, phallic one in back that seems to have a mind of its own}.\n\nAs she swings her pointed spear around in her webbed hands, you can’t help but notice her bare boobs bouncing about. Her inverted nipples are lactating a transparent, [enemy.milkColor] goo. Meanwhile her [enemy.tail] whips around as she ‘dances’, another weapon in the alien girl’s natural arsenal.\n\nHer eyes are closed. It’s always a little weird fighting someone who doesn’t even look at you.");
*/
//This returns your preg score on a scale of 0-99999, or 0%-99.999%
public function vanaeKnockupChance():int
{
	var vir:Number;
	var chance:Number = -1.389; //base 75% for vanae huntress, maidens are 100 percent and skip the check
	var cumQ:Number = pc.cumQ();
	
	if(pc.virility() == 0 || enemy.fertility() == 0 || chance == 0) return 0;
	
	vir = (pc.virility() + enemy.fertility());
	
	//increase base virility by cum volume up to a max of +2 (at a certain point the rest is just excess and will never get near the egg and is irrelevant for preg chance)
	//plus this keeps player virility more important than volume for large preg change increases
	if (cumQ >= 2000) vir += 2;
	else if (cumQ > 0) vir += cumQ / 1000;
	
	vir = vir / 2;
	
	return (1 - Math.exp(chance * vir)) * 10000;
}
//simple preg function, steele will not ever know how many kids or met them, but they are out there...
public function vanaeSimplePreg(tries:int=1):void
{
	var chance:Number;
	if (pc.virility() == 0) chance = 0;
	else if (enemy is MaidenVanae) chance = 10000;
	else chance = vanaeKnockupChance();
	//fix for old saves
	if (flags["VANEA_MAIDEN_PREG"] == undefined && pc.virility() != 0)
	{
		flags["VANEA_MAIDEN_PREG"] = 0;
		if (StatTracking.getStat("characters/maiden vanae/cherrys popped") > 0) flags["VANEA_MAIDEN_PREG"] = StatTracking.getStat("characters/maiden vanae/cherrys popped");
	}
	if (flags["VANEA_HUNTRESS_PREG"] == undefined && pc.virility() != 0)
	{
		flags["VANEA_HUNTRESS_PREG"] = 0;
		if (flags["VANAE_HUNTRESS_BRED"] != undefined && flags["VANAE_HUNTRESS_BRED"] > 0)
		{
			for(var y:int = 0; y < flags["VANAE_HUNTRESS_BRED"]; y++)
			{
				for(var z:int = 0; z < 8; z++)
				{
					if (rand(10000) < chance)
					{
						IncrementFlag("VANEA_HUNTRESS_PREG");
						break;
					}
				}
			}
		}
	}	
	//current preg try
	for(var x:int = 0; x < tries; x++)
	{
		//rand returns 0 to 9999, chance returns 0 to 9999, 0 chance will never result in pregnancy obviously
		if(rand(10000) < chance)
		{
			//succesful impregnation
			if (enemy is MaidenVanae) IncrementFlag("VANEA_MAIDEN_PREG");
			else IncrementFlag("VANEA_HUNTRESS_PREG");
			pc.clearRut();
			break;
		}
	}
}