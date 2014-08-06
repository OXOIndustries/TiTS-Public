import classes.Characters.HuntressVanae;
import classes.Characters.MaidenVanae;
import classes.VaginaClass;
public function encounterVanae(isHuntress:Boolean):void
{
	clearOutput();

	if (isHuntress)
	{
		userInterface.showName("FIGHT:\n VANAE HUNTRESS");
		userInterface.showBust("VANAE_HUNTRESS");
	}
	else
	{
		userInterface.showName("FIGHT:\n VANAE MAIDEN");
		userInterface.showBust("VANAE_MAIDEN");
	}

	author("Jim T");

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

		output("\n\nThe vanae maiden that attacked you is sporting a pair of [vanaeMaiden.breastCupSize]s. This seems to be her first time hunting for a mate.");
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
	vanaeHeader("FIGHT:\nVANAE ");
	
	// SpearStrike:
	//Effect: Light physical damage, stun chance. Extra damage against tripped or stunned opponents. Small crit chance - higher against tripped or stunned opponents.
	
	// TailSwipe: 
	// Effect: Small Damage if hit, trip if connect. Vanae always attempts either a grapple or a melee strike on a tripped opponent. Small crit chance.
	
	// Grapple
	// Effect: Grapple chance. Failure leads to nothing, success/don't struggle leads to target grappled and consecutive "lubricate" attacks until the pin is broken or victory occurs.
	// Note: Written assuming the PC is already either stunned or tripped etc.
	// Continuing Effect: On failure or don't struggle, significant lust increase and stun/tripped period is extended. Success returns PC to normal (removes trip/stun effect).
	
	// Milkspray
	// Effect: If Hit, Lust Increase. Medium stun chance. If stunned, follows with a grapple attack.
	
	// Effect: When she does this move, her dodge and hit rate increases. It lasts for three rounds, including the one used to activate it. If she uses this move when it is already active, the timer is refreshed.
	// camoFunc(true) updates the effect, camoFunc(false) will apply it/refresh it
}

function vanaeSpearStrike():void
{
	//Effect: Light physical damage, stun chance. Extra damage against tripped or stunned opponents. Small crit chance - higher against tripped or stunned opponents.
	
	output("The blind huntress twirls towards you, bringing her spear head up to strike. Just when you think she's going to hit you, she flicks the blunt end around at the last moment.");

	// [Miss]: 
	if (combatMiss(foes[0], pc)) output(" You jerk out of the way and she connects with nothing but air. The alien girl spins around, returning to a neutral stance.");
	else
	{
		var isCrit:Boolean = false;
		var dMulti:Number = 1.0;
		var critChance:int = 15;
		
		if (pc.hasStatusEffect("Stunned") || pc.hasStatusEffect("Trip"))
		{
			dMulti += 0.25;
			critChance *= 2;
		}
		
		if (rand(100) > critChance)
		{
			// [Hit]: 
			output(" You're caught off guard, the flat end cracking against the side of your head. Pain shoots through your skull - her feint a success.");
		}
		else
		{
			// [Critical]: 
			isCrit = true;
			output(" One minute you're fighting, the next you're seeing stars as she drives the flat end right into your temple. Your world spins, your head feeling as if it suddenly exploded.");
		}
		
		var damage:int = foes[0].meleeWeapon.damage + 8;
		var randInf:Number = (rand(10) + 90) / 100;
		damage *= randInf;
		
		if (isCrit)
		{
			dMulti += 1;
			pc.createStatusEffect("Stunned", 1, 0, 0, 0, false, "Stunned", "Cannot act for a turn.", true, 0);
		}
		
		genericDamageApply(damage * dMulti, foes[0], pc, GLOBAL.KINETIC);
	}
	
	processCombat();
}

function vanaeTailSwipe():void
{
	// Effect: Small Damage if hit, trip if connect. Vanae always attempts either a grapple or a melee strike on a tripped opponent. Small crit chance.
	
	output("The lithe huntress dances up towards you, her [monster.hairColor], luminescent ‘skirt’ twirling about her body. Suddenly she crouches and her [monster.tail] sweeps at your [pc.feet] - it's a trip attack!");

	// [Miss]: 
	if (combatMiss(foes[0], pc)) output(" You read her movements and avoid being tripped. She only succeeds at sweeping the ground with her sneaky strike.");
	else
	{
		var isCrit:Boolean = false;
		var dMulti:Number = 1.0;
		var critChance:int = 15;
		
		if (rand(100) > critChance)
		{
			// [Hit]: 
			output(" You're struck by her tail, falling to the ground. She gives a victorious grin, closing in on you. She's leading into a follow-up attack...");
		}
		else
		{
			isCrit = true;
			dMulti += 1;
			
			// [Crit]: 
			output(" You're struck by her tail, falling to the ground and hitting your head - hard. Your world spins as she closes in on you. You're too disoriented to do anything about it...");
		}
		
		var damage:int = foes[0].meleeWeapon.damage;
		var randInf:Number = (rand(20) + 80) / 100;
		damage *= randInf;
		
		pc.createStatusEffect("Trip", 0, 0, 0, 0, false, "DefenseDown", "You've been tripped, reducing your effective physique and reflexes by 4. You'll have to spend an action standing up.", true, 0);
		
		genericDamageApply(damage, foes[0], pc, GLOBAL.KINETIC);
	}
	processCombat();
}

function vanaeGrapple():void
{
	// Effect: Grapple chance. Failure leads to nothing, success/don't struggle leads to target grappled and consecutive "lubricate" attacks until the pin is broken or victory occurs.
	
	if (!pc.hasStatusEffect("Grappled"))
	{
		output("Sliding up to you as you are incapacitated, you feel her");
		if (foes[0] is MaidenVanae) output(" short");
		output(" tentacle skirt begin to");
		if (foes[0] is MaidenVanae) output(" awkwardly");
		output(" wrap around your waist");
		if (!(foes[0] is MaidenVanae)) output(" and lower body");
		output(". You can feel her suckers begin to stick to your skin - she's trying to pin you down!");
		
		// [Failure]:
		if (combatMiss(foes[0], pc)) output(" You forcibly shake her off of you; it's a close call. If she'd pinned you, who knows what would have happened!");
		else
		{
			// [Success/Don't Struggle]: 
			output(" You can't shake her off you as she wraps around your lower body and [pc.hips], pulling herself flush against your [pc.skin]. Her [monster.breasts] are rubbing against you, coating you in her [monster.milk]...");

			output("\n\nYou can feel your cheeks begin to flush. All of a sudden you start to lose the ability to move your limbs, but not the ability to feel what's happening to them. And what is happening feels <i>good</i>...");

			pc.createStatusEffect("Grappled", 0, 30, 0, 0, false, "Constrict", "You're pinned in a grapple.", true, 0);
			pc.lustDamage(8 + rand(8));
		}
	}
	else
	{
		output("You are helpless as the vanae huntress rubs her [monster.breasts] up and down your body, smearing her wonderful breast milk all over your body. You feel like you're being lubed up by her");
	if (foes[0] is MaidenVanae) output(" meager");
	else output(" sizable");
	output(" mounds, your [pc.groin] burning with arousal.");
		pc.lustDamage(8 + rand(8));
	}
	
	processCombat();
}

function vanaeWaitWhilstGrappled():void
{
	// [Don't Struggle] 
	output("You resign yourself, relaxing and enjoying her lube you up with her sensuous strokes. She senses your surrender and grins, enthusiastically rubbing her [monster.breasts] against you even more.");
	if (foes[0] is MaidenVanae) output(" “<i>Nice! Now just lie back and relax, and I promise we'll have good time - okay?</i>”");
	else output(" “<i>...Mmm, I like it when they give in. That means we can get to the fun bit that much faster...</i>”");
	pc.lustDamage(16 + rand(8));
}

function vanaeEscapeGrapple():void
{
	// [Successful Escape]: 
	output("You finally break free of her grasp, pushing her off and getting back up. You're positively dripping with her sticky violet goo. That was a close one!");

	if (foes[0] is HuntressVanae) output(" The blind huntress picks up her spear once again. “<i>By the Sky Mother; you're so slippery! You better be worth all the effort.</i>”");
	else output(" The blind huntress picks up her spear and stomps her foot. “<i>Arghh, I was so close! Was I really that bad?</i>”");
}

function vanaeMilkSquirtBreasts():void
{
	output("Suddenly, the");
	if (foes[0] is MaidenVanae) output(" girlish");
	else output(" busty");
	output(" huntress grabs the sides of her [monster.breasts]. She squeezes them and squirts a stream of [monster.milk] at you.");

	// [Miss]: 
	if (combatMiss(foes[0], pc)) output(" You dodge the [monster.milk] as it shoots past your [pc.ear]. She steadies her spear, moving back into her fighting stance.");
	else
	{
		var critChance:int = 33;

		if (rand(100) > critChance)
		{
			// [Hit]: 
			output(" You are splattered with her [monster.milk], unable to get it off. All of a sudden, your cheeks begin to flush and you start feeling quite aroused...");
		}
		else
		{
			// [Hit And Stun]: 
			output(" You are splattered with her [monster.milk], unable to get it off. All of a sudden, your cheeks begin to flush and you lose control to your limbs, falling to the ground. She's leading into a follow-up attack...");
			pc.createStatusEffect("Stunned", 2, 0, 0, 0, false, "Stun", "You are stunned and cannot move until you recover!", true, 0);
		}
		
		pc.lustDamage(8 + rand(4));
	}
	
	processCombat();
	// Effect: If Hit, Lust Increase. Medium stun chance. If stunned, follows with a grapple attack.
}

function vanaeSpiralKick():void
{
	output("Suddenly, the lithe huntress is making a dash at you. Before you know what she's doing, she twirls and launches herself in the air like a sideways top - her foot arching at");
	if (pc.tallness <= 80) output(" your head");
	else output(" your side");
	output(" with an impressive spinning high kick!");

	if (combatMiss(foes[0], pc, -1, 3)) output(" The move is spectacular, but clearly telegraphed. You dart backwards as her [vanae.foot] whips past you, connecting with nothing but air. She lands and spins around, dissapointed that it didn't connect.");
	else
	{
		// [Hit & Stun]: 
		output(" Her [monster.foot] connects with all the velocity of her wind up, striking your [pc.face] with incredible force. You see stars as you are knocked back, stunned by her blow. She's leading into a follow-up attack...");
		
		var damage:int = foes[0].meleeWeapon.damage + 25;
		var randInf:Number = (rand(20) + 80) / 100;
		damage *= randInf;
		
		genericDamageApply(damage, foes[0], pc, GLOBAL.KINETIC);
		pc.createStatusEffect("Stunned", 2, 0, 0, 0, false, "Stun", "You are stunned and cannot move until you recover!", true, 0);
	}

	// Effect: Low hit chance. On hit, does large damage and auto-stun (if PC can be stunned). 
}

function vanaeCamoflage(justUpdate:Boolean = true):void
{
	if (foes[0].hasStatusEffect("Camouflage"))
	{
		foes[0].addStatusValue("Camouflage", 1 -1);
	}
	
	if (!justUpdate)
	{
		if (!foes[0].hasStatusEffect("Camouflage"))
		{
			// [Activate]: 
			output("The octopus - like huntress stops and presses herself against the ground. Suddenly her [vanae.skin] starts shifting and she seems to slowly disappear. Her outline remains, but you have to concentrate to see it.");
			
			output("\n\nIt seems she's changed her skin to match her surroundings like instant camouflage. You can still see her, but while she's camouflaged it is going to be harder to hit her and dodge her attacks.");
			
			foes[0].createStatusEffect("Camouflage", 3, 0, 0, 0);
			foes[0].reflexesMod += 8;
			foes[0].aimMod += 8;
		}
		else
		{
			output("The octopus-like huntress takes a moment to stop and press against the ground, renewing her camouflage. Now she's back in synch with her surroundings.");
			
			foes[0].setStatusValue("Camouflage", 1, 3);
		}
	}

	if (foes[0].hasStatusEffect("Camouflage"))
	{
		if (foes[0].statusEffectv1("Camouflage") < 0)
		{
			foes[0].removeStatusEffect("Camouflage");
			foes[0].reflexesMod -= 8;
			foes[0].aimMod -= 8;
			
			output("She's moved around too much, and suddenly her camouflage is useless. She seems to realise that as well, changing back to her usual skin tones. Now she'll be easier to hit and dodge!");
		}
	}
	
	if (!justUpdate) processCombat();

	// Effect: When she does this move, her dodge and hit rate increases. It lasts for three rounds, including the one used to activate it. If she uses this move when it is already active, the timer is refreshed.
}

function vanaeTFScene():void
{
	// These paragraphs are to be inserted wherever there is a part that says // (TF SCENE). Didn't want to keep copy and pasting it. Played in scenes where the Vanae would spray the PC's genitals with body altering amounts of her milk.
	if (!pc.hasCock() && !pc.hasVagina()) return;
	// Does not play for Neuters.

	var options:Array = [];
	
	if (pc.hasCock()) options.push("cock");
	if (pc.balls > 0) options.push("balls");
	if (pc.hasVagina()) options.push("vagina");
	
	switch (options[rand(options.length)])
	{
		case "cock":
			// Increase PC's ballEfficiency and cumMultiplier
			if (pc.ballEfficiency < 5) pc.ballEfficiency += 0.1;
			if (pc.ballEfficiency < 4) pc.ballEfficiency += 0.1;
			if (pc.ballEfficiency < 3) pc.ballEfficiency += 0.1;
			
			if (pc.cumMultiplier < 3) pc.cumMultiplier += 0.1;
			if (pc.cumMultiplier < 2) pc.cumMultiplier += 0.1;
			if (pc.cumMultiplier < 1) pc.cumMultiplier += 0.1;
			
			output("Your [pc.cocks]");
			if (pc.cocks.length > 1) output(" tingle and throb");
			else output(" tingles and throbs");
			output(". Soon you feel an incredible pooling pressure in your loins becoming heavier and heavier and just aching to come out. You");
			if (pc.balls > 0) output("r [pc.balls] swell with incredible weight as you");
			output(" let out a deep guttural groan. When you can't hold it any longer, you cry out as");
			if (pc.cumQ() <= 200) output(" a small fountain of [pc.cumColor], [pc.cumVisc] [pc.cumNoun] spurts");
			else output(" small fountains of [pc.cumColor], [pc.cumVisc] [pc.cumNoun] spurt");
			output(" uncontrollably from your [pc.cockHeads]. <b>Your cum production has increased!</b>");
			
			break;
		
		case "balls":
			output("As the slick fluid seeps into the pores of your [pc.sack]. You can feel even more of your hot [pc.cumNoun] surging and churning inside. You can feel your [pc.balls] swelling and stretching to abnormal proportions to contain your fiercely broiling spunk.");
	
			// Increase ball size of PC and cancel trap pouch effect.
			if (pc.hasStatusEffect("Uniball") && rand(3) == 0)
			{
				pc.removeStatusEffect("Uniball");
				if (pc.ballSize < 3) pc.ballSize = 3;
				pc.balls = 2;
			}
			
			if (pc.ballSize < 6) pc.ballSize += 0.1;
			if (pc.ballSize < 4) pc.ballSize += 0.1;
			
			output("The new weight catches you by surprise as they hang lower and larger than before. <b>The size of your [pc.balls] has increased!</b>");
			
			break;
			
		case "vagina":
			// Increase vaginal wetness of PC and make a squirter, if not already. If available, move wetness beyond squirter value and allow for collection/measurement like cum/milk.
			
			output("Deep inside of your [pc.vaginas], you feel a warm, pleasurable sensation begin to form. It builds and builds until the dams break, and a wellspring of [pc.girlCumVisc] juice comes flooding from your [pc.thighs]. Your legs quake and tremble as spurts of [pc.girlCumColor] jump from your soppy slit");
			if (pc.vaginas.length > 1) output("s");
			output(". <b>Your vaginal wetness has increased"); 
			if (!pc.isSquirter()) output(" and you are now a squirter");
			output("!</b>");

			for (var i:int = 0; i < pc.vaginas.length; i++)
			{
				if ((pc.vaginas[i] as VaginaClass).wetnessRaw < 4) pc.vaginas[i].wetnessRaw = 4;
				else pc.vaginas[i].wetnessRaw += 0.1;
			}

			break;
	}
	output("\n\n");
}

function vanaeHeader(preName:String):void
{
	if (foes[0] is MaidenVanae)
	{
		userInterface.showBust("VANAE_MAIDEN");
		userInterface.showName(preName + "MAIDEN");
	}
	else
	{
		userInterface.showBust("VANAE_HUNTRESS");
		userInterface.showName(preName + "HUNTRESS");
	}
	author("Jim T");
}

function vanaePCVictory():void
{
	clearOutput();
	vanaeHeader("VICTORY:\nVANAE ");

	// HP WIN
	if (foes[0].HP() <= 1)
	{
		output("You land the final blow on your opponent, sending her sprawling to the ground. She seems unable to continue the fight, coughing as she grabs her side. There is shock and fear written all over her face.");

		if (foes[0] is HuntressVanae)
		{
			output("\n\n“<i>W-what manner of");
			if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.race]");
			else output(" creature");
			output(" are you? I've never failed at an ambush before!</i>” the vanae huntress exclaims. Her spear is lying far away from her now. She's completely at your mercy...");

			output("\n\n“<i>... I guess that's that, then. You're going to kill me, right? Go right ahead. I'm ready.</i>”");
		}
		else
		{
			output("\n\n“<i>I-I-I lost! I can't believe it, I can't believe this is happening. I failed my first hunt, and now I'm going to die!</i>” the vanae maiden babbles, clearly in a state of panic. She then curls up into a ball and begins to rock gently back and forth.");

			output("\n\nHer spear is lying far away from her now. She's completely at your mercy. What will you do with her?");
		}
	}
	else
	{
		if (foes[0] is HuntressVanae)
		{
			output("\n\nThe busty huntress can't take it any longer, letting out a sweet cry as she falls to the ground. All the while she's stroking her [monster.clits], gazing at you as she masturbates furiously.");

			output("\n\n“<i>Oh sweet Sky Mother, I can't take it any longer");
			if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" - I don't care if you are a [pc.race]");
			output(". Please, just fuck me!</i>” she whimpers, plunging her index finger inside of her drooling snatch. She lewdly spreads her [monster.legs] just so you can see just how sopping wet she is.");
		}
		else
		{
			output("\n\nThe virgin huntress can't take it any longer, letting out a sweet cry as she falls to the ground. All the while she's stroking her [monster.clits], gazing at you as she masturbates furiously.");

			output("\n\n“<i>Oh sweet Sky Mother, I've never been so horny in all my life! Please, can you fuck me? I don't care where!</i>” she whimpers, madly fingering her unsullied snatch. She lewdly spreads her [monster.legs] just so you can see just how sopping wet she is. “<i>... Please?</i>”");
		}

		output("\n\nShe's so worked up right now, you're pretty sure you could get her to do just about anything.");
	}

	// MERGE ALL (HP & LUST)

	output("\n\nDo you succumb to your darker, carnal desires and");
	if (!pc.isAss()) output(" ask to");
	output(" fuck the other-worldly");
	if (foes[0] is HuntressVanae) output(" woman");
	else output(" maiden");
	output("? Or do you just leave her be?");

	// VANAE HUNTRESS OPTIONS
	clearMenu();
	if (foes[0] is HuntressVanae)
	{
		addButton(0, "Vaginal Sex", vanaeVictorySexIntro, "vaginal");
		addButton(1, "Tit Fuck", vanaeVictorySexIntro, "titfuck");
		addButton(2, "Nipplefuck", vanaeVictorySexIntro, "nipplefuck");
		addButton(3, "Squirt n Jerk", vanaeVictorySexIntro, "squirtnjerk");
		addButton(4, "Cunnilingus", vanaeVictorySexIntro, "cunnilingus");
		addButton(5, "69 - BJ", vanaeVictorySexIntro, "69bj");
		addButton(6, "69 - Cunni", vanaeVictorySexIntro, "69cunni");
		addButton(7, "TentaSex - Vag", vanaeVictorySexIntro, "tentacunt");
		addButton(8, "TentaSex - Ass", vanaeVictorySexIntro, "tentabutt");
		addButton(9, "Milk Bath", vanaeVictorySexIntro, "milkbath");

		// [Vaginal Sex] [Tit Fuck] [Nipple Fuck] [Squirt & Jerk] [Cunnilingus] 
		// [Sixty Nine - BJ] [Sixty Nine - Cunni] [Tenta Sex - Vag] [Tenta Sex - Anal] [Milk Bath]
	}
	else
	{
		if (pc.hasCock() && pc.cockThatFits(217) != -1 && (pc.genitalSpot == 0 || pc.genitalSpot == 1))
		{
			addButton(0, "Cowgirl", vanaeVictorySexIntro, "maiden_virginity", "Cowgirl", "Pop her cherry by having her ride your cock, cowgirl style.");
		}
		else
		{
			if (!pc.hasCock()) addDisabledButton(0, "Cowgirl", "Cowgirl", "You'd need to a cock to allow the Vanae to ride you.");
			else addDisabledButton(0, "Cowgirl", "Cowgirl", "Your cock is simply too big for the Vanae to take.");
		}

		addButton(1, "Cunnilingus", vanaeVictorySexIntro, "maiden_cunni", "Cunnilingus", "Claim her alien pussy with your mouth and eat her out.");
	}
}


function vanaeVictorySexIntro(scene:String):void
{
	// Clicking on any Sex Option
	clearOutput();
	vanaeHeader()
	output("You can't help it, she is just too damn hot. There's no way you are going to just leave without");
	if (!pc.isAss()) output(" seeing if she's up for a tumble");
	else output(" hitting that");
	output(".");


	// if (HP DEFEAT)
	if (foes[0].HP() <= 1)
	{
		if (pc.isNice())
		{
			output("\n\nYou tell her you're not planning to kill her because you're just not that kind of person. Instead, you'd like to patch things up by having sex instead. You make sure to make it a request and not a demand, since you don't want to force her into anything.");
		}
		else if (pc.isMischievous())
		{
			output("\n\nYou tell her you’re not going to kill her, but you <i>would</i> really like to fuck her. Seems like a fair enough trade since she did try to beat you senseless, after all.");
		}
		if (!pc.isAss())
		{
			output("\n\nThe [monster.hairColor] headed huntress appears completely floored. Instead of ending her life you are letting her live and, on top of that, politely asking to have sex with her. ");

			// IF VANAE HUNTRESS
			if (foes[0] is HuntressVanae)
			{
				output("\n\n“<i>Y-you want to breed with me willingly, after I tried to attack you? Um... sure!</i>” Her cheeks flush. Suddenly she's acting quite coy. “<i>...");
				if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" You're really strange, for a [pc.race]. You're quite different from others of your kind");
				else output(" You really aren't from around here, are you? I've never met an off-worlder like you before");
				output(".</i>”");
			}
			//IF VANAE MAIDEN
			else
			{
				output("\n\n“<i>Y-you're serious? Really? You're not just messing with me?</i>” The girly huntress lifts her head and releases her legs. You'd swear she was looking at you, but her eyelids are firmly closed. “<i>... You're not a normal");
				if (pc.zilScore() >= 4 || pc.naleenScore() >= 5) output(" [pc.race]");
				else output(" off-worlder");
				output(", are you? I mean, I don't have much experience to speak of, but I'm pretty sure this isn't normal. You're supposed to eat me or something.</i>”");
			}
		}

		if (pc.isMischievous())
		{
			// IF VANAE MAIDEN
			if (foes[0] is MaidenVanae)
			{
				output("\n\nYou quip that it's still early, and there's plenty of time left to eat her. She giggles a little at the innuendo, clearly letting her guard down. In turn, you let down yours. You're pretty sure she's not going to try anything.");
			}
			else
			// IF NOT VANAE MAIDEN
			{
				output("\n\nYou quip that it's understandable, since you're one of a kind. She doesn't seem to get the joke, though. Your gut tells you she's not going to try anything funny, so it's okay to let your guard down.");
			}
		}

		if (pc.isAss())
		{
			output("\n\nYou give her a menacing stare and tell her you're not going to kill her, but she better make reparations for trying to brain you - sexually. And if she tries anything funny, you'll make damn sure she regrets it.");
			
			// IF VANAE HUNTRESS
			{
				output("\n\nThe violet headed huntress quivers as you stare at her. She seems glad that you're letting her live, but at the same time, terrified by the tone of your voice. “<i>Y-you want to breed with me willingly, after I tried to attack you, off-worlder? Um... sure! W-what would you like me to do?</i>”");
			}

			// IF VANAE MAIDEN
			{
				output("\n\nThe pink headed huntress quivers as you stare at her. She seems glad that you're letting her live, but at the same time, terrified by the tone of your voice. “<i>Y-you're serious? You're not going to eat me? What would you like me to do, then?</i>”");
			}
		}
	}

	output("\n\nYou inform the conquered amazoness that you");
	if (pc.isAss()) output(" are going");
	else output(" would like");
	output(" to");

	var action:String = "";
	var functor:Function = null;

	switch(scene)
	{
		case "maiden_virginity":
			action = "take her virginity with her on top";
			functor = vanaeMaidenTakeVirginity;
			break;
		
		case "maiden_cunni":
			action = "take her virginity with her on bottom";
			break;
		
		case "vagina":
			action = "fuck her [monster.pussy]";
			break;

		case "nipplefuck":
		case "titfuck":
			action = "fuck her [monster.breasts]";
			break;
		
		case "squirtnjerk":
			action = "have her squirt her [monster.milk] all over [pc.eachCock] and jerk you off with her tentacles";
			break;
		
		case "cunnilingus":
			action = "do stuff"; // Placeholder, fuck off
			break;

		case "69bj":
		case "69cunni":	
			action = "eat out her [monster.pussy] while she returns the favor";
			break;
		
		case "tentacunt":
			action = "have her fuck your [pc.vagina] with that tail of hers";
			break;
		
		case "tentabutt":
			action = "have her fuck your [pc.ass] with that tail of hers";
			break;
		
		case "milkbath":
			action = "have her bathe you in her [monster.milk]";
			break;
		
		default:
			action = "Couldn't find action text for " + scene;
			break;
	}

	output(" " + action);

	if (monster.lust() >= monster.lustMax())
	{
		output(" She seems to shiver with anticipation, clearly willing to"); 
		if (pc.isAss()) output(" carry out your command");
		else output(" fulfil your request");
		output(".");

		// if Vanae Maiden & not 69 Cunni & not lust loss
		if (foes[0] is MaidenVanae && scene != "69cunni")
		{
			output("\n\n“<i>I’ve never done that sort of thing before. So be patient with me, okay?</i>” she meekly requests, looking you up and down. She seems uncertain how to proceed, hindered by her lack of experience. ");
		}
	}

	// MERGE

	if (!pc.isNude())
	{
		output("“<i>Um, you're wearing clothes... so I should...</i>” Her words trail off as you begin to strip off your [pc.gear], causing her to lose her train of thought.");
		if (!(pc.armor is EmptySlot) || !(pc.upperUndergarment is EmptySlot)) output(" You expose yourself to her, momentarily holding your breath, waiting for her response. At the sight of your bare [pc.chest], her breathing grows shorter, heavier, and you can feel the warmth of her breath on your half-naked body.");

		if (pc.hasCock() || pc.hasVagina())
		{
			output(" Even more blood rushes to her cheeks as");
			if (pc.hasCock()) output(" [pc.eachCock]");
			if (pc.hasCock() && pc.hasVagina()) output(" and");
			if (pc.hasVagina()) output(" [pc.eachPussy]");
			if (pc.hasCock() && pc.hasVagina() || pc.cocks.length > 1 || pc.vaginas.length > 1) output(" are");
			else output(" is");
			output(" exposed. Her [monster.lips] part with fervent anticipation, each breath heavy with");
			if (foes[0] is MaidenVanae) output(" indescribable");
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
	addButton(0, "Next", functor);
}

function vanaeMaidenTakeVirginity():void
{
	clearOutput();
	vanaeHeader("VICTORY:\nVANAE ");

	var selCock:int = pc.cockThatFits(217);

	// Won fight
	if (foes[0].lust() >= foes[0].lustMax() || foes[0].HP() <= 1)
	{
		output("Getting down on all fours, the youthful huntress reaches down and tentatively touches [pc.oneCock]. She lets out a surprised noise as her slender fingers dance along your length. It is clearly the first time she’s ever felt a cock, let alone one like yours.");

		output("“<i>...");
		if (pc.cocks[selCock].cLength() <= 5) output(" It's smaller than I thought");
		else if (pc.cocks[selCock].cLength() >= 10) output(" It feels so large");
		else output(" It feels so soft");
		output(" and so strangely shaped! I've never touched a male sex organ before.</i>” her cheeks flush. As you begin to swell and stiffen she jumps back in surprise. “<i>... It moves?! Mine doesn't do that!</i>”");

		output("\n\nYou tell her that it's perfectly normal, and she seems to settle down. She then begins to position herself above your [pc.cock " + selCock + "].You can see right up her short tentacle skirt, getting an eyeful of her bald [monster.pussyNoun] and [monster.clits].");

		output("\n\nSlowly crouching down on top of you, she grabs your [pc.cock " + selCock +"] with one hand and rubs it against her moist, virginal slit. Since she's rushed to put you inside of her, you're not hard enough, and your [pc.cockHead " + selCock + "] keeps refusing to press inside of her entrance.");

		output("\n\n“<i>Um, it's not going in...?</i>” the virgin huntress questions you, clearly not getting the problem. After you explain you need to be more aroused first, she flushes harder. “<i>Oh! You're not aroused? Don't you find me attractive enough? What if I do this?</i>”");

		output("\n\nShe leans forward and presses her [monster.breasts] against your [pc.face]. Her [monster.nipples] drag across the [pc.skinFurScales] of your cheek as she tries her hand at seduction. The floral aroma of her [monster.skin] fills your nostrils, innocently accompanied by the sweet scent of her arousal.");

		output("\n\nHer silky unblemished skin and awkward attempts at arousal are cute and still have the desired effect, [pc.eachCock] becoming steadily more rigid. The amateur huntress lets out a delighted noise as you jerk and stiffen between her webbed fingers, her [monster.breasts] pressing eagerly against you.");

		output("\n\n“<i>... Good! I knew I could be sexy, at least if I really tried.</i>” The young woman smiles triumphantly, your erect [pc.cockNoun " + selCock + "] gripped in her slender fingers. “<i>So... this bit I'm not so sure about.");
		if (pc.cocks[selCock].cLength() <= 5) output(" But you're small enough, it should be okay...");
		else if (pc.cocks[selCock].cLength() >= 10) output(" You're pretty big, I'm not sure you'll even fit...");
		else output(" Be gentle, okay?");
		output("</i>”");
	}

	// NOTE: Both Win and Loss versions of this scene are identical from this point on. When putting in the Loss Scene, merge here and take everything below this line.
	output("\n\nThe virgin huntress descends nervously on your [pc.cock " + selCock + "] and presses your [pc.cockHead " + selCock + "] against her [monster.pussy]. You let out a low moan as you feel her narrow entrance slowly part around your");
	if (pc.cocks[selCock].hasFlag(GLOBAL.FLAG_TAPERED) <= 5) output(" equally tiny");
	else if (pc.cocks[selCock].hasFlag(GLOBAL.FLAG_FLARED) || pc.cocks[selCock].hasFlag(GLOBAL.FLAG_BLUNT)) output(" massive");
	else output(" swollen");
	output(" tip, kissing and squeezing your sensitive flesh.");
	if (pc.cockVirgin == true) output(" It's a first for both of you.");
	
	// Virginity check.
	pc.cockChange(true, false);

	output("\n\nYour [pc.cockHead " + selCock + "] presses against her maidenhead, and you can see her wince.");
	if (!pc.isAss()) output(" To make things easier, you grab her [monster.ass] and stroke it, distracting her from the pain. When you're sure she's ready, you ease your [pc.cockNoun " + selCock + "] forward and claim her womanhood. As gentle as you are, she still lets out a sharp cry");
	else output(" You know she's going to feel pain either way, so you don't screw around. With a single thrust you claim her womanhood, causing her to let out a sharp cry");
	output("."); 

	output("\n\nYou feel a warm trickle down your [pc.cock " + selCock + "] from her deflowering as she wraps her [monster.arms] around your neck. “<i>It's okay - keep going. I can take it.</i>”");
	if (!pc.isAss()) output(" At her insistence, you");
	else output(" You");
	output(" do just that, sliding your [pc.cock " + selCock + "] deeper into her virgin [monster.pussyNoun]. Her untraversed insides part around your swelling cock and mold freshly to your [pc.cockShape " + selCock + "] cocks shape.");
	
	// Note: Type means "equine", "terran", or maybe "knotted". Something along those lines. Hope that's the right parser. Maybe set it up?

Her pussy is lined with hundreds of little bumps which pleasurably stroke your [pc.cockNoun] as you push further inside of her. Finally your [pc.cockHead] is resting against her deepest point. You swell with the knowledge you have completely deflowered and claimed her amazonian [vanaeMaid.pussyNoun], every inch now squeezing around your throbbing length. 

<i>\"It stings a little, but at the same time, feels really good.</i> the young huntress breathily exclaims, wiggling her [vanaeMaid.ass] in your lap. Her movements cause your [pc.cock] to churn around deep inside of her [vanaeMaid.pussy], forcing a girlish moan from her [vanaeMaid.lips].

All of a sudden there is a shifting sensation around your [pc.cock] and it feels as if it is being licked by hundreds of tiny tongues. You realise that her [vanaeMaid.pussy] is not lined with bumps, but feelers lying flush. Now awake for the first time, they lap eagerly at your length inside her incredibly narrow passage. As alien as it is, it feels <i>sooo good</i>. 

You reel and wonder how after this you're ever going to {if pc.virgin "go back to sex with regular, terran women"}{else: "be able to use your hand to get off ever again"}. You're utterly hooked on her wriggling alien [vanaeMaid.pussyNoun]{Silly Mode: and now that you've gone vanae, you're not sure you'll ever keep away}!
 
She seems just as excited by you as she grinds her hairless mound against your {[pc.sack]/[pc.base]/[pc.sheathe]}. Her juices excitedly dribble down your length, and her velvety soft feelers lick your length from point blank range. Meanwhile, she hugs your neck and presses her [vanaeMaid.breasts] excitedly against your [pc.face].

Soon the inexperienced huntress is bouncing and wiggling madly on your lap, losing herself to pleasure as she rides your [pc.cock]. <i>\"I've never felt anything like this before, it feels as if I'm flying!</i> she whimpers.  All the while, her alien insides lash, clench, and drool excitedly around your length.

In your mind, you can't believe an alien virgin is bouncing up and down on your [pc.cock], about to gush all over your throbbing length. The image of you spurting your [pc.cum] deep inside of her unclaimed [vanaeMaid.pussyNoun] gets you incredibly hot, and soon you find yourself utterly losing control.

Your body moves on instinct as you seize her hips in your hands. Both of you frantically and feverishly grind against each other, pushing each other to even greater heights. She reaches the peak first, creaming herself in your lap as she shudders and jets her [vanaeMaid.girlCum] around your [pc.cock]. It's not long before you follow, shooting your load inside her unsullied, virgin depths and marking her insides with your [pc.cumNoun].

You {splatter and spurt tiny dribbles/gloriously shoot spasmic jets/gloriously unload thick jets} of hot, [pc.cumVisc] jism deep inside of her, sullying her untouched womb with your [pc.cumNoun]. All the while she trembles in your lap and receives your spunk inside of her, feeling it spatter blissfully inside her inner walls.

When she pulls away from you, you can see a definite glow to her features and a bright smile on her face. <i>\"... My first time... I never thought it would be so good. And because you came inside of me, I'm going to be pregnant!</i>

// IF FIRST TIME
{
The deflowered huntress rubs her belly and realization hits you like a ton of bricks. Pregnant?! Your Codex brings you up to speed.

<i>\"Vanae breed by hunting males and engaging in vaginal intercourse, [Master] Steele. Due to their incredible fertility, pregnancy is almost always assured. A vanae maiden is exceptionally fertile compared to others of her species.\"</i>

In other words, there's a ridiculously high chance that you just got her pregnant. Your Codex asks if you want it to add a name to the Steele family register.

When you turn your attention back to the amazonian huntress, however, she's nowhere to be found. Did she take off when you weren't looking? You wonder if you'll ever see her again.
}

// else
{
Your Codex tentatively asks if you'd like to add <i>another</i> entry to the Steele family register. You chew it out for its sass, and when you look up you realise the amazonian huntress is nowhere to be seen. You wonder if you'll ever see her again.
}

}