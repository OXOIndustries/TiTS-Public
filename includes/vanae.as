import classes.Characters.MaidenVanae;
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
	if (foes[0] is HuntressVanae)
	{
		userInterface.showName("FIGHT:\n VANAE HUNTRESS");
		userInterface.showBust("VANAE_HUNTRESS");
	}
	else if (foes[0] is MaidenVanae)
	{
		userInterface.showName("FIGHT:\n VANAE MAIDEN");
		userInterface.showBust("VANAE_MAIDEN");
	}
	
	// SpearStrike:
	//Effect: Light physical damage, stun chance. Extra damage against tripped or stunned opponents. Small crit chance - higher against tripped or stunned opponents.
	
	// TailSwipe: 
	// Effect: Small Damage if hit, trip if connect. Vanae always attempts either a grapple or a melee strike on a tripped opponent. Small crit chance.
	
	// Grapple
	// Effect: Grapple chance. Failure leads to nothing, success/don't struggle leads to target grappled and consecutive "lubricate" attacks until the pin is broken or victory occurs.
	// Note: Written assuming the PC is already either stunned or tripped etc.
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

		pc.createStatusEffect("Grappled", 30, 0, 0, 0, false, "Constrict", "You're pinned in a grapple.", true, 0);
	}
	
	processCombat();
// Effect: Grapple chance. Failure leads to nothing, success/don't struggle leads to target grappled and consecutive "lubricate" attacks until the pin is broken or victory occurs.
}

function vanaeGrappleLubricate():void
{
	You are helpless as the vanae huntress rubs her [vanae.breasts] up and down your body, smearing her wonderful breast milk all over your body. You feel like you're being lubed up by her {meager/sizable} mounds, your [pc.groin] burning with arousal.

[Don't Struggle] You resign yourself, relaxing and enjoying her lube you up with her sensuous strokes. She senses your surrender and grins, enthusiastically rubbing her [vanae.breasts] against you even more. "{Maiden:"Nice! Now just lie back and relax, and I promise we'll have good time - okay?"}</i>{Huntress:"...Mmm, I like it when they give in. That means we can get to the fun bit that much faster...:}"

[Failure To Escape]: You wriggle in futility, helpless as she lubes you up with her sensuous strokes. This is serious!

[Successful Escape]: You finally break free of her grasp, pushing her off and getting back up. You're positively dripping with her sticky violet goo. That was a close one!

// IF VANAE HUNTRESS
{
The blind huntress picks up her spear once again. "By the Sky Mother; you're so slippery! You better be worth all the effort."
}
// IF VANAE MAIDEN
{
The blind huntress picks up her spear and stomps her foot. "Arghh, I was so close! Was I really that bad?"
}

Effect: On failure or don't struggle, significant lust increase and stun/tripped period is extended. Success returns PC to normal (removes trip/stun effect).
}

function vanaeMilkSquirtBreasts():void
{
	Suddenly, the {girlish/busty} huntress grabs the sides of her [vanae.breasts]. She squeezes them and squirts a stream of [vanae.milk] at you.

[Miss]: You dodge the [vanae.milk] as it shoots past your [pc.ear]. She steadies her spear, moving back into her fighting stance.

[Hit]: You are splattered with her [vanae.milk], unable to get it off. All of a sudden, your cheeks begin to flush and you start feeling quite aroused...

[Hit And Stun]: You are splattered with her [vanae.milk], unable to get it off. All of a sudden, your cheeks begin to flush and you lose control to your limbs, falling to the ground. She's leading into a follow-up attack...

Effect: If Hit, Lust Increase. Medium stun chance. If stunned, follows with a grapple attack.
}

function vanaeSpiralKick():void
{
	Suddenly, the lithe huntress is making a dash at you. Before you know what she's doing, she twirls and launches herself in the air like a sideways top - her foot arching at {if pc.height >= 80: your head}{else:your side} with an impressive spinning high kick!

[Miss]: The move is spectacular, but clearly telegraphed. You dart backwards as her [vanae.foot] whips past you, connecting with nothing but air. She lands and spins around, dissapointed that it didn't connect.

[Hit & Stun]: Her [vanae.foot] connects with all the velocity of her wind up, striking your [pc.face] with incredible force. You see stars as you are knocked back, stunned by her blow. She's leading into a follow-up attack...

Effect: Low hit chance. On hit, does large damage and auto-stun (if PC can be stunned). 
}

function vanaeCamoflage():void
{
	[Activate]: The octopus-like huntress stops and presses herself against the ground. Suddenly her [vanae.skin] starts shifting and she seems to slowly disappear. Her outline remains, but you have to concentrate to see it.

It seems she's changed her skin to match her surroundings like instant camouflage. You can still see her, but while she's camouflaged it is going to be harder to hit her and dodge her attacks.

[Already Active]: The octopus-like huntress takes a moment to stop and press against the ground, renewing her camouflage. Now she's back in synch with her surroundings.

[Runs Out]: She's moved around too much, and suddenly her camouflage is useless. She seems to realise that as well, changing back to her usual skin tones. Now she'll be easier to hit and dodge!

Effect: When she does this move, her dodge and hit rate increases. It lasts for three rounds, including the one used to activate it. If she uses this move when it is already active, the timer is refreshed.
}

function vanaeTFScene():void
{
	// These paragraphs are to be inserted wherever there is a part that says // (TF SCENE). Didn't want to keep copy and pasting it. Played in scenes where the Vanae would spray the PC's genitals with body altering amounts of her milk.
// Does not play for Neuters.

if (pc.hasCock)
{
Your [pc.groin] {tingle and throb/tingles and throbs}. Soon you feel an incredible pooling pressure in your loins becoming heavier and heavier and just aching to come out. You{r [pc.balls] swell with incredible weight as you} let out a deep guttural groan. When you can't hold it any longer, you cry out as {a small fountain of [pc.cumColor], [pc.cumVisc] [pc.cumNoun] spurts/small fountains of [pc.cumColor], [pc.cumVisc] [pc.cumNoun] spurt} uncontrollably from your [pc.cockHeads]. <b>Your cum production has increased!</b>

// Increase PC's ballEfficiency and cumMultiplier
}

if (pc.hasBalls)
{
As the slick fluid seeps into the pores of your [pc.sack]. You can feel even more of your hot [pc.cumNoun] surging and churning inside. You can feel your [pc.balls] swelling and stretching to abnormal proportions to contain your fiercely broiling spunk. The new weight catches you by surprise as they hang lower and larger than before. <b>The size of your [pc.balls] has increased!</b>

// Increase ball size of PC and cancel trap pouch effect.
}


if (pc.hasPussy)
{
Deep inside of your [pc.pussies], you feel a warm, pleasurable sensation begin to form. It builds and builds until the dams break, and a wellspring of [pc.girlCumVisc] juice comes flooding from your [pc.thighs]. Your legs quake and tremble as spurts of [pc.girlCumColor] jump from your soppy slit{s}. <b>Your vaginal wetness has increased {if pc.notasquirter: "and you are now a squirter"}!</b>

// Increase vaginal wetness of PC and make a squirter, if not already. If available, move wetness beyond squirter value and allow for collection/measurement like cum/milk.
}

}

function vanaePCVictory():void
{
	// HP WIN

You land the final blow on your opponent, sending her sprawling to the ground. She seems unable to continue the fight, coughing as she grabs her side. There is shock and fear written all over her face.

// IF VANAE HUNTRESS
{

"W-what manner of {if (pc.race = zil || pc.race = naleen) "[pc.race]"}{else: "creature"} are you? I've never failed at an ambush before!"/</i> the vanae huntress exclaims. Her spear is lying far away from her now. She's completely at your mercy...

"... I guess that's that, then. You're going to kill me, right? Go right ahead. I'm ready." 
}

// IF VANAE MAIDEN
{
"I-I-I lost! I can't believe it, I can't believe this is happening. I failed my first hunt, and now I'm going to die!</i> the vanae maiden babbles, clearly in a state of panic. She then curls up into a ball and begins to rock gently back and forth.

Her spear is lying far away from her now. She's completely at your mercy. What will you do with her?
}


// LUST WIN

The {virgin/busty} huntress can't take it any longer, letting out a sweet cry as she falls to the ground. All the while she's stroking her [vanae.clits], gazing at you as she masturbates furiously. 

// IF VANAE HUNTRESS
{
"Oh sweet Sky Mother, I can't take it any longer{if (pc.race = zil || pc.race = naleen) "- I don't care if you are a [pc.race]"}. Please, just fuck me!" she whimpers, plunging her index finger inside of her drooling snatch. She lewdly spreads her [vanaeHunt.legs] just so you can see just how sopping wet she is.
}

// IF VANAE MADEN
{
"Oh sweet Sky Mother, I've never been so horny in all my life! Please, can you fuck me--? I don't care where!</i> she whimpers, madly fingering her unsullied snatch. She lewdly spreads her [vanaeMaid.legs] just so you can see just how sopping wet she is. "... Please?"
}

She's so worked up right now, you're pretty sure you could get her to do just about anything. 

// MERGE ALL (HP & LUST)

Do you succumb to your darker, carnal desires and {not hard:ask to} fuck the other-worldly {maiden/woman}? Or do you just leave her be?

// VANAE HUNTRESS OPTIONS

[Vaginal Sex] [Tit Fuck] [Nipple Fuck] [Squirt & Jerk] [Cunnilingus] 
[Sixty Nine - BJ] [Sixty Nine - Cunni] [Tenta Sex - Vag] [Tenta Sex - Anal] [Milk Bath]


// VANAE MAIDEN OPTIONS

[Take Virginity, Bottom] [Cunni, Giving]

}

function vanaeVictorySexIntro():void
{
	Clicking on any Sex Option

You can't help it, she is just too damn hot. There's no way you are going to just leave without {not hard: seeing if she's up for a tumble/else: hitting that}.


// if (HP DEFEAT)
{

if (pc.nice)
{
You tell her you're not planning to kill her because you're just not that kind of person. Instead, you'd like to patch things up by having sex instead. You make sure to make it a request and not a demand, since you don't want to force her into anything.
}

if (pc.mischievous)

{
You tell her you're not going to kill her, but you <i>would</i> really like to fuck her. Seems like a fair enough trade since she did try to beat you senseless, after all. 
	}
if (pc != hard)
{
The {vanae.hairColor]}violet headed huntress appears completely floored. Instead of ending her life you are letting her live and, on top of that, politely asking to have sex with her. 

// IF VANAE HUNTRESS
{
"Y-you want to breed with me willingly, after I tried to attack you? Um... sure!\</i> Her cheeks flush. Suddenly she's acting quite coy. "...{if (pc.race = zil || pc.race = naleen) "You're really strange, for a [pc.race]. You're quite different from others of your kind"}{else: "You really aren't from around here, are you? I've never met an off-worlder like you before"}.\</i>
	}

//IF VANAE MAIDEN
	{
"Y-you're serious? Really? You're not just messing with me?" The girly huntress lifts her head and releases her legs. You'd swear she was looking at you, but her eyelids are firmly closed. "... You're not a normal {{if (pc.race = zil || pc.race = naleen) "[pc.race]"/else: "off-worlder"}, are you? I mean, I don't have much experience to speak of, but I'm pretty sure this isn't normal. You're supposed to eat me or something."
}
}

if (pc.mischievous)
{

/// IF VANAE MAIDEN
{
You quip that it's still early, and there's plenty of time left to eat her. She giggles a little at the innuendo, clearly letting her guard down. In turn, you let down yours. You're pretty sure she's not going to try anything.
	}

// IF NOT VANAE MAIDEN
{
You quip that it's understandable, since you're one of a kind. She doesn't seem to get the joke, though. Your gut tells you she's not going to try anything funny, so it's okay to let your guard down.
}
}

if (pc.hard)
{
You give her a menacing stare and tell her you're not going to kill her, but she better make reparations for trying to brain you - sexually. And if she tries anything funny, you'll make damn sure she regrets it. 
	
// IF VANAE HUNTRESS
{
The violet headed huntress quivers as you stare at her. She seems glad that you're letting her live, but at the same time, terrified by the tone of your voice. "Y-you want to breed with me willingly, after I tried to attack you, off-worlder? Um... sure! W-what would you like me to do?" 
}

// IF VANAE MAIDEN
{
The pink headed huntress quivers as you stare at her. She seems glad that you're letting her live, but at the same time, terrified by the tone of your voice. "Y-you're serious? You're not going to eat me? What would you like me to do, then?" 
}
	}
}

You inform the conquered amazoness that you {hard: are going/else: would like} to {fuck her [vanae.pussy]/fuck her [vanae.breasts]/eat out her [vanae.pussy] while she returns the favor/have her fuck your {[pc.vagina]/[pc.ass]} with that tail of hers/}have her squirt her [vanae.milk] all over [pc.eachCock] and jerk you off with her tentacles/have her bathe you in her [vanae.milk]}{Maiden Only:take her virginity {Virgin Sex (Bottom):with her on top/Virgin Sex (Top):with her on bottom}. {LUST LOSS: "She seems to shiver with anticipation, clearly willing to {pc.hard: carry out your command}{else:fulfil your request}"}

// if Vanae Maiden & not 69 Cunni & not lust loss.
{
"I've never done that sort of thing before. So be patient with me, okay?" she meekly requests, looking you up and down. She seems uncertain how to proceed, hindered by her lack of experience. 
}

// MERGE

if (pc.gear != null)
{
"Um, you're wearing clothes... so I should..." Her words trail off as you begin to strip off your [pc.gear], causing her to lose her train of thought. {PC has upper torso clothes: As your [pc.chest] {is/are} exposed her}{else: Her} breathing becomes quite ragged, clearly aroused by the sight of your half naked body. 

if (pc.sex != neuter)
(
Even more blood rushes to her cheeks as {[pc.eachCock]} {if (pc.sex = herm) and} {pc.eachPussy] is exposed. Her [vanae.lips] part with fervent anticipation, each breath heavy with {Maiden: "indescribable/else: "carnal"} longing.
)

else
{
When your [pc.groin] is exposed you can see she looks a little disappointed and more than a little confused. It's clear she's never come across someone like you before. 

You tell her that you're going to enjoy her efforts even though you don't have anything down there, and she seems to take your word for it. 
}

}
}