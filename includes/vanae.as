public function encounterVanae(isHuntress:Boolean):void
{
	clearOutput();
	//First Encounter

	if ((isHuntress && flags["ENCOUNTERED VANAE HUNTRESS"] == undefined) || (!isHuntress && flags["ENCOUNTERED VANAE MAIDEN"] == undefined))
	{
		if (isHuntress) flags["ENCOUNTERED VANAE HUNTRESS"] = 1;
		else flags["ENCOUNTERED VANAE MAIDEN"] = 1;

		CodexManager.unlockEntry("Vanae");

		output("As you move through the jungle, your codex suddenly begins to beep out a warning. “<i>Vanae life-signs detected! Collecting all known extranet data on this species...</i>”");
		
		output("\n\nYou look around you and see nothing. Is the codex malfunctioning? The device is equipped with short-range sensors, but there’s nothing as far as you can see.");
		
		output("\n\nYou ready your [pc.weapon], your [pc.eyes] carefully scanning your surroundings...");
		
		output("\n\n“<i>Data Retrieved! The vanae are an all-female race that can change their skin to match the color of their surroundings. They are also tree-dwelling, [Master] Steele,</i>” your codex informs you, and just in time. ");

		// IF VANAE HUNTRESS
		if (isHuntress)
		{
			output("\n\nYou look up and see someone about to land on you! You dive out of the way and quickly turn to look at your opponent.They land as slick as a cat and level a pointed spear at you.");
			
			output("\n\nIt seems she was trying to hit you with the blunt end though - was she trying to knock you out?");
			
			output("\n\n“<i>... Whoops, I missed. You’re no ordinary");
			if(pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.race]");
			else output(" off-worlder</i>” the vanae woman exclaims. She looks fairly humanoid, except for her tentacle hair, tail, and organic skirt. Her tentacles are violet colored and bioluminescent, while the rest of her is pale as snow. Her body is covered in gorgeous glowing violet swirls and patterns, just like her hair.");
			
			// Please make sure the nipples parser always calls up the fact she’s lactating, if it doesn’t already. Couldn’t tell from the GIT info.
			output("\n\nThe other thing that immediately captures your attention are her sizable [vanaeHuntress.breastCupSize]s and [vanaeHuntress.milkyNipples]. She seems to be lactating a transparent violet liquid that is drooling down her [vanaeHuntress.breasts]. As you check her out, you can see her webbed hands gripping the handle of her spear.");
			
			output("\n\nWhen you look up, you notice her eyes are firmly shut. They have been all this time. Is she planning to fight you blind? ");
		}
		// ELSE IF MAIDEN VANAE
		else
		{
			output("\n\nYou look up and see someone about to land on you! You dive out of the way and quickly turn to look at your opponent. They hit the ground where you were seconds before, stumbling off balance and crashing spectacularly. ");
			
			output("\n\n“<i>Owww!</i>” You hear your attacker cry out pitifully. When she picks herself up, rubbing her head, you get a good look at her. She looks like a young humanoid woman, except for her tentacle hair, tail, and organic skirt. Her tendrils are pink and bioluminescent, while the rest of her is pale as snow. Her body is covered in gorgeous glowing pink swirls and patterns, just like her hair. ");
			
			output("\n\nThe other thing that immediately captures your attention are her small [vanaeMaiden.breastCupSize]s and [vanaeMaiden.milkyNipples]. She seems to be lactating a transparent pink liquid that is drooling down her [vanaeMaiden.breasts]. ");
			
			output("\n\nAs you check her out, you also notice she’s holding a pointed spear in her webbed hands. They are visibly trembling - she doesn’t look terribly experienced at this kind of thing.");
			
			output("\n\n“<i>... Um, hold it right there! Don’t make me hurt you, okay?”</i> the pink-haired alien pleads. You realise she was trying to hit you with the blunt end. Does she really want to fight?");
			
			output("\n\nYou also notice her eyes are firmly shut and have been this whole time. Is she planning to fight you blind? ");
		}

		// MERGE
		output("\n\nYour codex clues you in to what is going on.");
		
		output("\n\n“<i>Vanae have vestigial eyes, [Master] Steele, and exceptionally keen hearing. You’ll also want to avoid the liquid she sprays from her breasts; it incapacitates and arouses on contact.</i>”");
		
		output("\n\nBest. Present. Ever.");

		// IF VANAE HUNTRESS
		if (isHuntress)
		{
			output("\n\nMeanwhile, the vanae huntress looks a bit huffy. “<i>... I can’t believe I messed up my first strike. But I won’t make the same mistake twice your " + pc.mf("", "girl-") + "cum is mine!</i>”");

			output("\n\nWait, what?! She's after your ");

			// Man this took some thinking. Writes had the usual abuse of apparent gender == actual gender
			var gend:String = pc.mf("male", "female");

			if (gend == "male")
			{
				if (pc.hasCock()) output("[pc.cumNoun]?");
				else output(" cum?");
			}
			else if (gend == "female")
			{
				if (pc.hasVagina()) output("[pc.girlCumNoun]?");
				else output(" girl-cum?");
			}

			// If no cock & considered male, or no vag and considered fem, or no genitals
			if (!player.hasCock() && gend == "male" || !player.hasVagina() && gend == "female" || !player.hasCock() && !player.hasVagina())
			{
				output(" You don't even have any to give!");
			}

			output(" Do you even get a choice in the matter?");
		}
		// ELSE IF MAIDEN VANAE
		else
		{
			output("\n\n“<i>Your... your hip talked!</i>” The vanae maiden squeaks out in surprise. The Codex wasn’t joking about her keen hearing. “<i>... Listen, you. " + pc.mf("I won’t mess up my first hunt - I just won’t - so you’re going to take my virginity and like it - understand?", "You’re going to be my first, so I hope you like girls!") + "</i>”");
			
			output("\n\nWhaaaaaaat?! You barely have time to register as she swings her spear. Clearly, she’s regained her composure.");
		}
	}
	// REPEAT SCENE
	else
	{
		output("\n\nAs you move through the jungle, your Codex beeps out a warning. “<i>Vanae life-signs detected!</i>”");

		output("\n\nYou instinctively leap back and ready your");
		if (!(pc.rangedWeapon is EmptySlot)) output(" [pc.rangedWeapon]");
		else if (!(pc.meleeWeapon is EmptySlot)) output(" [pc.meleeWeapon]"); 
		else output(" fists. ");

		// IF VANAE HUNTRESS
		if (isHuntress)
		{
			output("You're glad you moved first, because a vanae huntress lands right where you were standing with a thud. She just came out of nowhere!");

			output("\n\n“<i>I missed? You're no ordinary"
			if(pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.race]");
			else output(" off-worlder");
			output(".</i>” She looks completely perplexed at your ability to sense her beforehand. You're pretty sure she wouldn't get it even if you explained it to her.");

			output("\n\nThe vanae huntress that attacked you is sporting a pair of sizable [vanaeHuntress.breastCupSize]s. She seems to be an experienced " + pc.mf("", "fem-") + "cum hunter.");
		}
		// IF MAIDEN VANAE
		else
		{
		output("You're glad you moved first, because a vanae maiden lands right where you were standing. She hits the ground awkwardly, toppling over and very nearly braining herself.");

		output("\n\n“<i>Owww! How’d you see me coming? That’s not fair!</i>” You hear your attacker cry out pitifully. She seems perplexed at your ability to sense her beforehand. You’re pretty sure she wouldn’t get it even if you explained it to her.");

		output("\n\nThe pink-haired vanae quickly pulls herself to her feet, levelling her spear at you. “<i>S-stop right there, you! You're going to " + pc.mf("take my virginity - and you better be gentle!", "be my first - so I hope you like girls!") + "</i>”");

		output("\n\nThe vanae maiden that attacked you is sporting a pair of [vanaeMaid.breastCupSize]s. This seems to be her first time hunting for a mate.");
		}
	}

	output("\n\nIt's a fight!");

	clearMenu();
	if (isHuntress)
	{
		addButton(0, "Next", startCombat, "HUNTRESS_VANAE");
	}
	else
	{
		addButton(0, "Next", startCombat, "MAIDEN_VANAE");
	}
}

function vanaeAI():void
{
	if (pc.lust() >= 60)
	{
		vanaeLustAttack();
		return;
	}
	if (pc.HP() <= pc.HPMax() * 0.4)
	{
		vanaeHPAttack();
	}

	if (foes[0] is HuntressVanae)
	{

	}
	else if (foes[0] is MaidenVanae)
	{

	}
}