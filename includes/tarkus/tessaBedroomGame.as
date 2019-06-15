// “Bedroom” is added to Tessa’s flirt menu after achieving ending 5 or higher and plays Bedroom Scene.
//Also unlocks if “Review Scene” is played.

// Bedroom Scene:
public function tessaBedroomIntro():void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(2);

	output("Tessa turns and motions for you to follow, beckoning you with a clawed finger. Behind her you notice she gives her tail a sensual flick, drawing your gaze down to her impressive backside as she saunters towards her bedroom. Following behind her, eyes fixed on her ass, she leads you to her bedroom door, opening it with a few taps and leading you inside.");
	if (flags["TESSA_BED"] == undefined)
	{
		processTime(1);
		output("\n\nRealizing it’s your first time in Tessa’s bedroom, you take a look around. The first thing you notice is the amount of pink, which really doesn’t surprise you after seeing how she decorated her bathroom. Her bed, pillows, rugs and lamps are all some shade of pink. Everything else in the room either a soft colour or white. Your attention focuses on the centerpiece of the room, examining her bed for a moment. It’s quite large with decorated headboard, and looks soft enough you suspect if sat on you’d sink in. The room almost feels like it belongs to a pre-teen girl, not the quarters of an alcoholic space assassin. After a moment a few adult things in the room do catch your trained eye however.");
		output("\n\nBeer cans and bottles are present on almost every flat surface in the room. While they all look empty, clearly Tessa isn't one for recycling. Some of them even appear to have a thin layer of dust on them...");
		output("\n\nOn the headboard you notice two sets of holes on either end, with some scratching around them. Putting two and two together, you suspect a pair or two of handcuffs are stashed in a drawer somewhere nearby.");
		output("\n\nYou also take note of something in Tessa’s half open nightstand. While you can’t get a good look from where you’re standing, it appears to be some sort of long pink object. It seems her love for pink extends into her toy selection as well.");
	}
	else output("\n\nTessa’s bedroom is almost how you remember it: soft and pink. You can tell, however, she has cleaned up, as most of the beer empties are now gone, save for a few on her nightstand which you suspect are fresh. You suspect she tidied up because she knew you’d be coming over.");
	output("\n\nTessa moves across room and starts to undress. As her clothing hits the floor you take in the sight of her naked alabaster form. The ovir’s figure is as impressive as always, with her womanly curves on full display. She tilts her hips back and forth slightly, displaying herself off for you. Tessa gives you a lewd smirk, her sharp teeth on display.");
	output("\n\n<i>“Alright Steele. Ditch your shit and lay back. Let me take good care of you.”</i>");

	//Plays On Tessa’s Bed
	//PC must have a cock or a vagina
	//PC must be a non-taur and a biped
	if (!pc.isBiped() || !pc.hasGenitals()) addDisabledButton(0, "Get On Bed", "Get On The Bed", "You must be biped and have genitals.");
	else addButton(0, "Get On Bed", tessaBedroomPartOne);
	//Plays Tessa’s Turn
	//PC must have completed On Tessa’s Bed at least twice, getting both Soft and Hard End Credits
	//PC must have a cock or a vagina
	//PC must be a non-taur and a biped
	if (flags["TESSA_BED_SOFT"] == undefined || flags["TESSA_BED_HARD"] == undefined) { }
	else if (!pc.isBiped() || !pc.hasGenitals()) addDisabledButton(1, "Tessa's Turn", "Tessa's Turn", "You must be biped and have genitals.");
	else addButton(1, "Tessa's Turn", tessaBedroomTurnaroundPartOne);
	//Plays Leave
	addButton(14, "Leave", function():void
	{
		clearMenu();
		clearOutput();
		showTessa(true);
		processTime(6+rand(3));
		output("Giving it a second thought, you opt to leave instead.");
		output("\n\nAs you walk out the door you hear Tessa yelling after you. <i>“The fuck, Steele? Well FINE! I’m just going to fuck somebody else. I’m hot as shit, I don’t need you!”</i> After a moment's pause and a few paces, you hear her curse under her breath and sound of a drawer opening.");
		output("\n\nAs you leave the ship, you hear a faint buzzing sound echoing from Tessa’s room.");
		addButton(0, "Leave", move, shipLocation);
	});
}

// On Tessa’s Bed:
// Part 1:
public function tessaBedroomPartOne():void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(1);

	output("Unwilling to argue, you quickly ditch your gear and hop onto the bed, your weight immediately causing you to sinking in. It’s soft, almost too soft, and you can’t help but wonder how Tessa manages to fight her way out in the morning. After a moment, you hear a low and playful purring, as Tessa crawls up from the foot of the bed. The pale woman’s ruby orbs are fix on you as she slides along your body, to a halt at your waist, straddling you with her thick scaly thighs. She looks down at you and licks her lips.");
	if (flags["TESSA_BED"] == undefined) output("\n\n<i>“We’re gonna play a little game.”</i> The seductive woman bends over, resting her hands on either side of your head, her massive tits falling right in your face. <i>“I’m gonna ask you if you want me to go soft or hard. If you say soft, I’ll keep up what I’m doing. If you say hard, I’ll spice it up a little bit. Don’t worry.”</i> She lifts herself back up, then gives you a devious smile. <i>“I’ll make sure you know what you’re getting into before I let you answer. Most of the time. Understand?”</i>");
	else output("\n\n<i>“I assume you remember how to play the game?”</i> Tessa gives you a devious grin.");
	output("\n\nYou nod your head.");
	output("\n\n<i>“Excellent. So. Soft, or Hard?”</i>");

	addButton(0, "Soft", tessaBedroomPartTwo, [true]);
	addButton(1, "Hard", tessaBedroomPartTwo, [false]);
}

// Part 2:
public function tessaBedroomPartTwo(askedSoftInStage:Array):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(1);

	output("Tessa pulls herself up, lifting her chest away from your face. She gives your [pc.hips] a squeeze with her thighs, reminding you of how powerful they are. She looks down at you and smiles. <i>“As you desire.”</i>");
	if (askedSoftInStage[0]) output("\n\nThe pale ovir runs her long claws gently over your [pc.chest], gliding along your [pc.skinFurScales]. Her touch is delicate, her grazing claws sending tingles of pleasure through your body. Tessa’s touch starts to lazily trail southward, the pale ovir tracing a path down your belly.");
	else output("\n\nThe white ovir brings her clawed hands down hard on your shoulders, pinning you to the bed. Tessa digs her claws into you, not enough to draw blood, but hard enough for you to wince in pain. You feel the ovir clench her thighs, squeezing your midsection so tightly you feel some air being pressed out of your lungs.");
	output("\n\nTessa looks down at you and licks her lips. She glances at your left hand, then shifts her gaze over towards your right. Her red orbs flick to attention and lock on to your eyes. <i>“Soft or Hard?”</i>");

	addButton(0, "Soft", tessaBedroomPartThree, [askedSoftInStage, true]);
	addButton(1, "Hard", tessaBedroomPartThree, [askedSoftInStage, false]);
}

// Part 3:
public function tessaBedroomPartThree(args:Array):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(3);
	var askedSoftInStage:Array = args[0];
	askedSoftInStage.push(args[1]);
	
	if (askedSoftInStage[1])
	{
		output("Tessa’s hands start to move once more, her clawed fingers running up the length of your arms, trailing towards your wrists. She takes them in her hands, her thumbs rubbing against you palms as she takes a hold of them. Slowly, she lifts them up guiding them downwards, placing them so they lay on her wide hips.");
		output("\n\nYou give her waist a squeeze, your fingers gripping her scaled body tightly, thumbs tracing the contours of her pelvis. Her scales are smooth against your touch, and you feel more than a little give with the ovir’s body as you hold her.");
		output("\n\n<i>“You’re gonna wanna hold on tight.”</i> Tessa teases. <i>“The real fun starts now. So, Soft or Hard?”</i>");
	}
	else
	{
		output("Tessa turns and reaches towards her nightstand, straining to pull the top draw open further without compromising her position. After fishing around inside for a moment, she produces two pairs of pink fuzzy handcuffs and dangles them in front of you. Reaching over you, the devious woman fastens the cuffs through the holes cut into each side of the headboard. Without missing a beat, she takes your arms one at a time, lifting them up and clicking the metal loops around each of your wrists.");
		output("\n\nYou give the cuffs a curious pull, testing their hold on you. Whatever kind of wood her headboard is made out of feels very secure; you’re not quite sure you’d be able to escape without considerable time and a lot of effort.");
		output("\n\n<i>“I’ve got you right where I want you now.”</i> Tessa grins predatorily at you. <i>“The real fun starts now. Soft or Hard?”</i>");
	}

	addButton(0, "Soft", tessaBedroomPartFour, [askedSoftInStage, true]);
	addButton(1, "Hard", tessaBedroomPartFour, [askedSoftInStage, false]);
}

// Part 4:
public function tessaBedroomPartFour(args:Array):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(2);
	var askedSoftInStage:Array = args[0];
	askedSoftInStage.push(args[1]);

	if (pc.hasCock())
	{
		if (askedSoftInStage[2])
		{
			output("Tessa’s hands start to wander, moving down your body slowly, her claws gliding along. They come to a halt where your hips meet, fingers brushing teasingly against the [pc.cockhead] of your [pc.cockShape] member. A single scaled finger slowly starts to run around the crown of your cock head, her smooth digit making your manhood fatten and grow with its teasing touch.");
			output("\n\nA soft sigh escapes your lips, the white woman’s finger starting to move faster around your now hard and eager cock.");
			if (askedSoftInStage[1]) output(" Your grip on your curvaceous partner’s hips tighten, your hands wanting to wander and explore her more thoroughly.");
			else output(" You tug against your padded/plush restraints, reminded you are bound to the headboard.");
			output(" Tessa reaches down further, her smooth fingers wrapping around your thick mast delicately.");
			output("\n\nHer dexterous fingers start to artfully run along your rigid length, stroking your manhood in a tauntingly slow, light grip... Having felt the force of her grasp before, you know Tessa is trying to tease you, letting her scaly fingers glide along your sensitive flesh in an oddly stimulating manner.");
		}
		else
		{
			output("Tessa gives you a squeeze with her thighs, reminding you how powerful they are as she seems to try and pop you between them. With a chuckle, the playful woman reaches down to where your hip meet, clawed digits lightly pressing against your [pc.cockShape] manhood. Her fingers wrap around your girth, roughly seizing your cock and giving it a tight squeeze.");
			output("\n\nA sharp gasp escapes your lips, the ovir’s hand holding fast against your rock hard cock.");
			if (askedSoftInStage[1]) output(" Your grip on Tessa’s hips tightens, fighting the urge to throw the pale woman off of you.");
			output(" You tug against your restraints, reminded you are bound to the headboard and unable to act.");
			output(" You feel her grip loosen after a moment, the pressure on your cock relieved.");
			output("\n\nHer dexterous fingers start to run along your rigid length, stroking your manhood roughly with a tight grip. You let out a grasp of pleasure as her smooth digits run up and down your cockflesh, the harsh woman wrenching your meat mercilessly.");
		} 
		output("\n\nTessa lifts her hips up off of your waist, shifting her grip on your shaft as she does and positioning your mast of cockflesh upright. She lowers herself down, your [pc.cockHead] pressing against her waiting cunt. Your cock throbs eagerly, and");
		if (askedSoftInStage[1]) output(" you grip the curvy ovir’s hips tightly in anticipation.");
		else output(" you pull against your restraints, your hands unable to act.");
		output("\n\nTessa bites her lip, her cunt oozing down on your twitching manhood. <i>“Soft.”</i> She rotates her hips slightly, twisting her soaking pussy on the head of your [pc.cockShape] cock. <i>“Or Hard?”</i>");
	}
	else if (pc.hasVagina())
	{
		if (askedSoftInStage[2])
		{
			output("Tessa’s hands start to wander, moving down your body slowly, her claws tracing a lazy path down. They come to a halt down between her legs, her fingers running over the folds of your misted womanhood. A single smooth scaled thumb moves forward, pressing against your clit and rotating in small circles against it..");
			output("\n\nA soft sigh escapes your lips, your pale partner’s thumb tracing faster around your eager button.");
			if (askedSoftInStage[1]) output(" Your grip on Tessa's hips tightens, your hands wanting to wander and explore her more thoroughly.");
			else output(" You tug against your plush prison, reminded you are bound to the headboard.");
			output(" Slowly, you feel the rest of Tessa’s fingers start to press against you.");
			output("\n\nHer smooth fingers part your pliable folds, exposing your wet and quivering pussy. A single long digit slips inside of you, sending a shock of pleasure up your spine and out of your mouth in the form of a depraved grasp. Her finger slides deep inside, curling upward and locating your hidden G-spot with sinful precision.");
		}
		else
		{
			output("Tessa gives you a squeeze with her thighs, reminding you how powerful they are, as she seems to try and trap you between them. With a chuckle, the devious woman reaches down between her legs, her hand dragging down over the folds of your womanhood. Her palm pressed firmly against your clit, the pale ovir starts to jerk her hand up and down against you roughly.");
			output("\n\nA gasping moan escapes your lips as the pale woman tortures your quivering cunt roughly massaging your button with the heel of her hand.");
			if (askedSoftInStage[1]) output(" Your grip on Tessa's hips tightens, your fingers locking up from the power of her attack.");
			else output(" You tug against your restraints, reminded you are bound to the headboard and helpless to act.");
			output(" After a moment Tessa eases her rough teasing, and you feel her fingers start to move.");
			output("\n\nHer smooth fingers press against you, pushing between the folds of your wet and quivering pussy. Two long digits push their way inside of you, sending a shock of pleasure up your spine and out of your mouth in the form of a depraved grasp. Her fingers plunge deep inside of you, then start to work in and out of your cunt as the white temptress roughly finger fucks you.");
		}
		output("\n\nTessa pulls her hand off your twat and sits upright, lifting her fingers to her mouth and licking them. Her long tongue wraps around her scaly digits, the pale woman seemingly enjoying the taste of you.");
		output("\n\nThe pale woman pulls her hand away from her mouth. <i>“Soft.”</i> She leans over to her nightstand, pulling open the drawer wide and producing a large pink dildo shaped like a terran cock. <i>“Or Hard?”</i>");
	}

	addButton(0, "Soft", tessaBedroomPartFive, [askedSoftInStage, true]);
	addButton(1, "Hard", tessaBedroomPartFive, [askedSoftInStage, false]);
}

// Part 5:
public function tessaBedroomPartFive(args:Array):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(3);
	var askedSoftInStage:Array = args[0];
	askedSoftInStage.push(args[1]);

	if (pc.hasCock())
	{
		if (askedSoftInStage[3])
		{
			output("Slowly, Tessa lowers herself down, your rock hard cock sliding into her wet twat with ease. In the back of your mind you note Tessa’s cloaca is clearly not like a normal cunt. It seems to mold to the shape of your [pc.cockShape] schlong, her hole tighter than you expected, yet somehow more spacious than you imagined. Your cock throbs in approval of her cunt’s tight embrace, a throbbing heat in your loins begins to build.");
			pc.cockChange();
			output("\n\nTessa lets out a content sigh, grinding her hips, slowly starting to ride your rigid member. You feel her ass start to lift and drop onto your lap with every tilt, her ample behind jiggling everytime it falls back down.");
			if (askedSoftInStage[1]) output(" Letting you hands wander, you reach around and take a hold of the ovir’s smooth rump, giving it a hard squeeze and drawing a passionate moan from the white woman.");
			else output(" You strain against your binds, your urge to engage your hands thwarted. Pleasure trembles along your outstretched arms, the restraining bite of the cuffs taunting you torturously.");
			output(" Your cock pulses inside the ovir’s tight hole, your cockflesh starting to burn as Tessa’s pace starts to build.");
			output("\n\n<i>“Oh fuck. You’re big.”</i> Tessa’s breath is heavy, the flushed woman panting between her words. You feel her thighs on either side of your hips clench against you, her ovir cunt tightening as well. Her hips start to move faster, sliding up and down your mast of cockflesh with hungry enthusiasm. Everytime her ass drops down now it slaps your lap, the wet sounds of sex filling the air. Tessa throws her head back and moans softly, her long studded tongue escaping from her mouth while her chest heaves rhythmically up and down.");
			output("\n\nTessa’s face tilts down, her red eyes locking on to you, still panting like a bitch in heat. <i>“Soft.”</i> Her eyes narrow deviously. <i>“Or hard?”</i>.");
		}
		else
		{
			output("As soon as the word leaves your mouth, Tessa lowers herself down, burying your rock hard cock into the deepest confines of her pulsing wetness. You can’t help but let out a deep groan, surprised by the sudden heat and tightness against your [pc.cockShape] shaft. In the back of your mind you note Tessa’s cloaca is clearly not like a normal cunt. It seems to mold to the shape of your [pc.cockShape] schlong, with her hole tighter than you expected, but somehow more spacious than you imagined. Your cock throbs in approval of her tight embrace, and a heat in your loins starts to build.");
			pc.cockChange();
			output("\n\nTessa lets out a depraved moan, then squeezes her thighs so tightly against you it almost winds you. Wasting no more time, the pale woman begins riding you hard and fast, her powerful hips working your cock over. You feel her ass smacking roughly against your lap, her ample behind jiggling with every rebound.");
			if (askedSoftInStage[1]) output(" Letting you hands wander, you reach around and take hold of the ovir’s round rump, giving it a hard squeeze and drawing a moan from the thick woman.");
			else output(" You strain against your binds, your urge to engage your hands thwarted. Pleasure trembles along your outstretched arms, the teasing bite of the cuffs mingling torturously with it.");
			output(" Your cock throbs as Tessa rides it, her hot cunt’s embrace tight against your sensitive flesh. At this rate you don’t think you can last much longer.");
			output("\n\n<i>“Hnn, fuck yeah. Don’t cum yet, bitch. I’m not done... ”</i> Tessa’s breath is heavy, the exhausted woman panting over her own words. You feel her thighs on either side of you clench once more, her ovir cunt seems to tighten  as well. The raw sounds of sex fill the air, as her wet cunt drools it’s appreciation over your lap. You feel sore from her rough riding, the power behind her egg bearing hips on full display. Tessa throws her head back and lets out a husky moan, her long studded tongue falling from her mouth while her chest heaves.");
			output("\n\nTessa’s face tilts down, her red eyes locking on to you, still panting like a bitch in heat. <i>“Soft.”</i> Her eyes narrow in deviously. <i>“Or hard?”</i>");
		}
	}
	else if (pc.hasVagina())	
	{
		if (askedSoftInStage[3])
		{
			output("Tessa holds the dildo in front of her, giving it a long lick with her metal-studded tongue. At the corners of her mouth a small smirk forms. <i>“As you wish.”</i>");
			output("\n\nShe lowers the tool and drops her hand between her thighs and out of your view. A moment later, you feel something girthy pressing against your eager twat. Slowly, it slides inside of you, stretching and filling you as the alabaster woman guides it all the way into your quivering pussy. Waves of pleasure surge from your loins, sending a shock of tension up your spine as you’re invaded.");
			if (askedSoftInStage[1]) output(" Instinctively you reach around and take a hold of the ovir’s round rump, giving it a hard squeeze and drawing a moan from the lusty woman.");
			else output(" You strain against your binds, your urge to engage your hands thwarted. Pleasure trembles along your outstretched arms, the bite of the cuffs mingling torturously with it.");
			output(" Gasping, you tilt your head up and look down between the ovir’s legs, watching her ease the pink toy into you.");
			output("\n\nTessa’s fingers move to the base of the toy, and you hear the ovir giggle. <i>“Brace yourself.”</i> Before you can contemplate her words, you faintly hear the sound of a dial turning. You cry out in shock and pleasure as the toy turns on, buzzing deep in your twat. No, not just buzzing, you realize; it’s moving. You feel the pink toy wiggling inside of you as it shakes, like a snake trying to slither deep inside of you. Your thoughts become clouded by as a powerful heat starts to rise in your cunt, radiating out powerful waves of pleasure and making you pant and moan.");
			output("\n\nTessa leans in close, her chest pressing up snugly against yours, her breath warm on your neck. You feel her arm moving against your body, her fingers positioned upwards towards her crotch. There is no doubt in your mind Tessa is playing with herself. <i>“Soft,”</i> Her voice is gentle, the seductive woman so close to your ear. You feel something warm dripping onto your crotch, likely juices from her drooling cunt. <i>“Or hard?”</i>");
		}
		else
		{
			output("Tessa holds the dildo in front of her and gives it a long lick with her metal studded tongue. At the corners of her mouth a small smirk forms. “As you wish.”");
			output("\n\nShe lowers the dildo and drops her hand between her thighs and out of your view. Tessa lets out a gasping moan, and a moment later you feel something powerful pressing against your eager twat. It prods against your slit, demanding entrance, before forcing its way into your quivering pussy with little resistance. Waves of pleasure surge from your loins, sending a shock of tension through your core as you’re invaded.{if Hands are Free:Instinctively you reach around and take a hold of the ovir’s round rump, giving it a hard squeeze and drawing a moan from the curvaceous woman.}{if Hands are Bound:You strain against your binds, your urge to engage your hands thwarted. Pleasure trembles along your outstretched arms, the bite of the cuffs mingling torturously with it.} Gasping, you tilt your head and look between the ovir’s legs, seeing the pink toy deep inside of Tessa’s twat and not your own. Something else, long and white, is instead buried deep inside of you own hole, and your eyes open wide as the truth of it hits you: Tessa is fucking you with her tail.");
			output("\n\nTessa chuckles to herself. <i>“You said you wanted it hard.”</i> Before you can contemplate her words, the powerful appendage inside of you starts to move. You cry out in shocked pleasure as her tail snakes around inside your slit. At first it just stirs around inside of you, testing the limits of your twat. After a moment you feel it start to slide in and out of your womanhood, thrusting in a way not unlike being fucked by a real cock. You let out a deep groan as the tail fucks you, panting like a slut as the fires of pleasure burns deep in your cunt. Your spine arches back and your legs start to seize, the intensity of the woman’s tail pushing you.");
			output("\n\nTessa leans in close, her chest pressing up snugly against yours, breath warm on your neck. You feel something vibrating against you lightly, down by her crotch. It seems like that toy of her’s is more than just a simple dildo. <i>“Soft.”</i> Her voice is husky and deep, and you feel her lick the side of your neck playfully; <i>“Or hard?”</i>");
		}
	}

	addButton(0, "Soft", tessaBedroomPartSix, [askedSoftInStage, true]);
	addButton(1, "Hard", tessaBedroomPartSix, [askedSoftInStage, false]);
}


// Part 6:
public function tessaBedroomPartSix(args:Array):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(4);
	var askedSoftInStage:Array = args[0];
	askedSoftInStage.push(args[1]);

	if (pc.hasCock())
	{
		if (askedSoftInStage[4])
		{
			output("Tessa throws back her head and moans, riding you like an animal. Your cock throbs and aches, your [pc.balls] on the verge of exploding. The ravenous ovir doesn't slow down, her chest heaving as she starts to tremble. Her hands explore her body, and you watch her rub her sides and tease her tits in a lewd display.");
			if (askedSoftInStage[1]) output(" You reach up and grab at her impressive chest, feeling their softness between your fingers. Tessa laces her fingers between yours, squeezing herself along with you in shared depravity.");
			output(" Her eyes start to flutter, and you watch her jaw twitch as her tongue starts to slowly unfurl from her mouth. You feel her already soaking cunt ooze even more, hot wetness pouring from her womanhood onto your lap. The heat in your loins turns into a fiery explosion, and you feel your [pc.balls] churn as your orgasm begins.");
		}
		else
		{
			output("Tessa leans in close, but does not stop, riding you like a wild animal. Your cock throbs and aches, your [pc.balls] on the verge of exploding. Your snowy lover reaches out, her clawed hands grasping your shoulders. With her hands braced against you, Tessa finds new leverage and rides you with even greater force. The whole bed rocks and shakes as she works her hips, her thick ass crashing down on your lap so hard her scales start to scratch against you. Sharp pain on your shoulders causes you to cry out in pain, as the pale ovir, lost in lust, starts to dig her claws in. You feel her already soaking cunt ooze, hot wetness pouring from her womanhood onto your lap. The heat in your manhood turns into a fiery explosion, and your [pc.balls] churn as your orgasm crescendos.");
		}
		output("\n\nA surge of [pc.cumColor] bliss erupts from your [pc.cockHead], ropes of thick cum filling the pale woman straddling you. Your cock nearly melts, completely buried in the boiling confines of your lover, as a deep groan from the depths of your belly escapes your lips. On top of you Tessa shivers violently, the white ovir seemingly unable to move as an orgasm of her own rocks her frame. You feel her cunt tighten and twitch against your cockflesh, milking your member for all the potent seed it can. Tessa’s eyes flutter and she takes a deep breath, collecting herself after a moment. Her red orbs look down at you, glazed over and heavy. Her mouth moves trying to form words, but no sound comes from her lips. After a moment, she whispers a single word. <i>“Amazing.”</i>");
	}
	else if (pc.hasVagina())
	{
		if (askedSoftInStage[4])
		{
			output("Tessa starts to kiss your neck, her soft lips feeling heavenly against you. Her kisses trail off to behind your ear, whispering  to you, <i>“Let’s finish together. Cum with me.”</i> Her chest presses tightly against you, massive white tits squashing on your [pc.chest].");
			if (askedSoftInStage[3]) output(" The toy buried in your cunt buzzes and moves, dragging you closer and closer to climax, each passing second blissfully agonizing.");
			else output(" The tail in your cunt wiggles and thrusts, dragging you to closer and closer to climax, each passing second agonizingly blissful.");
			output(" On top of you, Tessa start to shake and quiver, " + (askedSoftInStage[3] ? "the fingers" : "the toy") + " working away at her cunt seemingly bringing her to the edge as well. You hear her panting into your ear, the ovir’s heated breath against your neck making your [pc.skinFurScales] tingle. Her thighs squeeze against you as she starts to moan and shudder, the lusty cry of the ovir timed near perfectly with an explosion of ecstasy of your own.");
		} 
		else
		{
			output("Tessa runs her teeth over your neck, then giving you a playful bite. You let out a gasp of pain, but her light pressure only seems to amplify the pleasure burning through you. The pale woman’s chest is pressing down tightly against you, massive white tits squishing on your [pc.chest].");
			if (askedSoftInStage[3]) output("The toy in your cunt buzzes and writhes, bringing you closer to a shuddering climax, each passing second blissfully agonizing.");
			else output(" The tail in your cunt wiggles and thrusts, bringing to closer to your ultimate release, each passing second agonizingly blissful.");
			output(" On top of you, you feel Tessa start to shake and quiver, " + (askedSoftInStage[3] ? "the fingers" : "the toy") + " buried in her cunt seemingly bringing her to the edge as well. Her teeth release your neck and trail towards your ear, the seductive ovir whispering to you. <i>“Cum, for me. Cum for me now.”</i> Her thighs squeeze against you and you feel the playful woman’s tongue lick your ear, her metal stud brushing against you. She starts to shudder, the lusty cry of the ovir timed near perfectly with an explosion of ecstasy of your own.");
		}
		output("\n\nThe fire in your loins boils over, and you feel nothing but pure pleasure. The whole of your body tenses and shakes as every nerve in your body fires off at the same time, thousands of signals all fighting for dominance overtaking you with bliss. On top of you Tessa shakes and moans, your scaled lover seemingly unable to move as an orgasm of her own rocks her. {if Dildo path:You feel her hand slip from her twat, as the toy inside you falls free as well, ending the source of your quivering ecstasy.}{if Tail path: You feel her tail slip out from inside you, ending the source of your ecstasy, as the vibrating of her toy ceases as well.} You hear Tessa take a deep breath, collecting herself after a moment. She tries to speak, but only faint murmurs escape her lips. After a moment, she whispers a single word. <i>“Amazing.”</i>");
	}
	output("\n\nTessa rolls off of your exhausted body, landing on the soft bed and sinking into it next to you.");
	if (!askedSoftInStage[1]) output(" Absentmindedly, she reaches up and unbinds your hands, almost half asleep as she does so.");
	output(" She purrs into your ear and nestles up close to you, grabbing ahold of your arm and snuggling it between her prodigious tits. Her leg lifts up and drapes over your hip, spooning you while you lay prone on your back. The exhausted woman rests her chin against your shoulder, her eyes falling shut with a wide, goofy smile on her lips.");

	pc.orgasm();
	IncrementFlag("TESSA_BED_" + (askedSoftInStage[4] ? "SOFT" : "HARD"));

	//Plays Outro
	addButton(0, "Next", tessaBedroomFunOver);
}

// Outro:
public function tessaBedroomFunOver():void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(2);

	if (flags["TESSA_BED"] == undefined)
	{
		output("A few minutes pass and Tessa’s eyes flutter open and she looks over at you. Registering you for a moment, her eyes suddenly grow wide and she releases you, pulling her leg away and releasing your arm. Scrambling away from you, she accidentally falls out of the bed and onto the floor with a loud thump. <i>“FUCK!”</i>");
		output("\n\nYou lift yourself up and peer over the side of the bed, looking down at the fallen woman laying on the floor. She glares up at you, her face a mix of embarrassment and anger. <i>“What the fuck are you still doing here, shit stain?”</i> She sits upright and faces you. <i>“What the fuck were you doing to me?”</i>");
		output("\n\nYou explain to her that she was the one cuddling you, using no uncertain terms.");
		output("\n\nTessa stares at you a moment, her left eye twitching. <i>“If you tell anybody, I swear to fucking god…”</i> She presses her lips together tightly, and points to the door. <i>“Go. Just fucking go before I say something stupid.”</i>");
		output("\n\nChuckling, you pull yourself out of Tessa’s bed, a task which takes more effort than it should due to how soft it is. As you collect your gear, Tessa stays seated on the floor, eyes fixed on you. Making your way to the exit, you hear her call to you from the floor.");
		output("\n\n<i>“Hey, I didn't… Say anything while I was… Um.. Laying there did I?”</i>");
		output("\n\nYou think for a moment, then shake your head no.");
		output("\n\n<i>“Ah.”</i> Tessa seems surprisingly relieved by that. <i>“Well. Good.”</i> She crosses her arms over her chest and turns her head away from you, signaling she’s done with this conversation.");
		output("\n\nLeaving the prideful woman on the floor, you roll your eyes and disembark.");
	}
	else
	{
		output("A few minutes pass and Tessa’s eyes flutter open and she looks over at you. Registering you for a moment she frowns, pulling her leg off of you and releasing your arm. Rolling over, she turns away from you in a huff. <i>“Again? For fucks sake…”</i>");
		output("\n\nChuckling, you pull yourself out of Tessa’s bed, escaping its soft confines still takes more effort than it should. As you collect your gear, Tessa remains on the bed, feigning sleep. Making your way to the door, you hear her call to you.");
		output("\n\n<i>“I didn't say anything did I? I know you said I didn't last time…”</i>");
		output("\n\nYou think for a moment, then shake your head no once more.");
		output("\n\n<i>“Ah.”</i> Tessa shifts on the bed, seemingly getting comfy. <i>“Good. Nice to know I don’t talk in my sleep.”</i>");
		output("\n\nYou stare at her in silence for a moment before you clue in the conversation is over.");
		output("\n\nLeaving the prideful woman to her own devices, you roll your eyes and head out.");
	}

	processTime(6+rand(4));
	IncrementFlag("TESSA_BED");
	//PC is left in the Tarkus Hangar
	//Lust set to 0

	addButton(0, "Next", move, shipLocation);
}

// Tessa's Turn
public function tessaBedroomTurnaroundPartOne():void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(3);

	output("Having a better idea, you ditch your gear and stand next to bed, telling Tessa to get on instead.");
	if (flags["TESSA_BEDSWITCH"] == undefined)
	{
		output("\n\n<i>“Uh, no. This isn't how it works. My ship. My room. My rules.”</i> Tessa crosses her arms over her chest defiantly. ");
		output("\n\nYou give the woman a soft chuckle. <i>“What, are you scared?”</i> You get the feeling teasing her is just the kind of motivation she needs. ");
		output("\n\nTessa glares at you a moment then rolls her eyes and sighs. <i>“Fucking fine. I’ll get on the damn bed.”</i> She turns and places her hands on the soft mattress, but glances back and glares. <i>“But if you try anything funny I’ll strangle you, got it?”</i>");
		output("\n\nYou get it.");
		output("\n\nShe turns back to the bed for a moment, before snapping her attention back at you. <i>“And nothing goes in my ass!”</i>");
		output("\n\nYou roll your eyes and agree.");
	}
	else
	{
		output("\n\n<i>“Ah.”</i> Tessa shifts slightly, rubbing the back of her neck. <i>“My turn… Okay. Fine. Just remember the rules okay?”</i>");
		output("\n\nYou tell her you do.");
		output("\n\nThe pale ovir clears her throat turns to the bed, placing her hands on the mattress. <i>“Alright. Let’s do this.”</i> ");
	}
	output("\n\nOn her hands and knees, Tessa climbs onto the bed. She crawls along the mattress a moment, then stops to turn to you, she gives you a devious smile and shakes her perfectly round ass in your direction. ");
	output("\n\nYou smile and ask the first question of the game <i>“Soft or Hard?”</i>");
	output("\n\nTessa doesn't even think about it, answering immediately.");
	output("\n\n<i>“Hard.”</i>");

	IncrementFlag("TESSA_BEDSWITCH");

	addButton(0, "Stroke Her Ass", tessaBedroomTurnaroundPartTwo, false);
	addButton(1, "Spank Her", tessaBedroomTurnaroundPartTwo, true);
}

// Tessa's Turn Part 2
public function tessaBedroomTurnaroundPartTwo(spankedButt:Boolean):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	var gaveSoftInStage:Array = [!spankedButt];
	processTime(4);

	if (spankedButt)
	{
		output("With a devious smile of your own, you reach out and give Tessa’s rear a powerful smack. She lets out a howling crying as your hand connects against her supple backside, an odd mix of pain and pleasure ringing in the air. You feel her tense at your smack, but she doesn't seem to object or retaliate. She turns back to look at you, a concerned look on her face.");
		output("\n\n<i>“Holy fuck. I know I’m a bitch, but you don’t need to take it out on my poor ass. Damn.”</i>");
	}
	else
	{
		output("You reach out and gently caress her scaly backside. Her cheeks are smooth to the touch, but have ample give when pressed into. You run your fingers along the curve of her ass, feeling its rounded form and appreciating its size. Tessa purrs at your touch, the tip of her tail waving back at forth. After a moment you pull your hand away, much to the dismay of the pale woman.");
		output("\n\n<i>“That all? Fucking tease.”</i>");
	}
	output("\n\nTessa continues to crawl across the bed, coming to a stop at the headboard where she flips over. Now on her back, she leans her back against her headboard, her ample chest on full display before you. She lifts a leg and moves it to the side, exposing her ovir slit. From what you can see she’s already wet and ready down there. <i>“Something you want to ask me, Steele?”</i> She runs her hand along the inside of her thigh, teasing you to come closer.");
	output("\n\nInstead of her cunt, you focus in on her clawed hands for a moment. If you really want to have your way with the her, taking care of those first would be a good place to start… You ask the question a second time. <i>“Soft or Hard?”</i>");
	output("\n\nTessa stays silent a moment, contemplating.");

	//Plays Part 3
	//Adds “Hands are Bound”
	//If Selected when Tessa says “Soft”, Adds Annoyance.
	if (rand(2) == 0)
	{
		output("\n\n<i>“Soft.”</i>");
		addButton(1, "Cuff Her Up", tessaBedroomTurnaroundPartThree, [gaveSoftInStage, false, true]);
	}
	else
	{
		output("\n\n<i>“Hard.”</i>");
		addButton(1, "Cuff Her Up", tessaBedroomTurnaroundPartThree, [gaveSoftInStage, false, false]);
	}
	//Plays Part 3
	//Adds “Hands are Free”
	addButton(0, "Leave Her Hands", tessaBedroomTurnaroundPartThree, [gaveSoftInStage, true, false]);
}

// Tessa's Turn Part 3
public function tessaBedroomTurnaroundPartThree(args:Array):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(3);
	var gaveSoftInStage:Array = args[0];
	gaveSoftInStage.push(args[1]);
	var annoyed:Boolean = args[2];

	if (gaveSoftInStage[1])
	{
		output("You decide to leave her hands alone, letting the scaly woman continue to stroke the inside of her thigh. The other hand runs along her side, trailing upwards towards her chest. <i>“You just gonna stand there?”</i> She grabs a handful of white tit, squeezing it, and playing with herself in front of you. <i>“Or are you just going to watch?”</i>");
		output("\n\nThe hand on her thigh inches closer to her cunt, fingers closing in on her wet ovir snatch. Tessa bites her lip, gripping her massive white orb harder as her fingers run over her oozing hole. Before her fingers can slip inside you hear her giggle. <i>“I think you should try asking again.”</i>");
	}
	else
	{
		output("You decide your next course of action, and stalk over to the pale woman’s nightstand. Her red orbs follow as you stride over, widening slightly as you pull open the drawer.");
		if (annoyed) output(" <i>“You’ve got a funny definition of ‘Soft’, Steele…”</i>");
		else output(" <i>“Oh… Well, I guess I asked for it.”</i>");
		output(" Tessa lifts her hands and offers you her wrists, giving you no resistance.");
		output("\n\nYou fasten the cuffs to her headboard, then lock in the pale woman’s wrists. You ensure the cuffs are a shade on the tighter side, just to make sure Tessa is truly restrained. The ovir gives the cuffs a tug, wiggling her wrists around as you make your way back to the foot of the bed. <i>“Well. Looks like you’ve got me right where you want me.”</i> Tessa gives you a playful smirk. <i>“Now what?”</i>");
	}
	output("\n\nYou eyes return to Tessa exposed twat, her sex dripping wet and looking positively tasty. Shifting your gaze back  to your bedmate, you ask her the question again. <i>“Soft or Hard?”</i>");

	if (gaveSoftInStage[1])
	{
		output("\n\nTessa doesn't even think about the question. ");
		output("\n\n<i>“Hard.”</i>");
		addButton(1, "Be Rough", tessaBedroomTurnaroundPartFour, [gaveSoftInStage, false, annoyed]);
	}
	else
	{
		output("\n\nTessa thinks about the question for a moment, her eyes looking over at her restraints.");

		//Plays Part 4
		//If selected while Annoyance is already active, Plays “Early End”
		//If Selected when Tessa says “Soft”, Adds Annoyance.
		if (annoyed || rand(4) != 0)
		{
			output("\n\n<i>“Soft.”</i>");
			if (annoyed) addButton(1, "Be Rough", tessaBedroomTurnaroundEndEarly);
			else addButton(1, "Be Rough", tessaBedroomTurnaroundPartFour, [gaveSoftInStage, false, true]);
		}
		else
		{
			output("\n\n<i>“Hard.”</i>");
			addButton(1, "Be Rough", tessaBedroomTurnaroundPartFour, [gaveSoftInStage, false, annoyed]);
		}
	}

	//Plays Part 4
	addButton(0, "Be Gentle", tessaBedroomTurnaroundPartFour,  [gaveSoftInStage, true, annoyed]);
}

// Tessa's Turn Part 4
public function tessaBedroomTurnaroundPartFour(args:Array):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(5);
	var gaveSoftInStage:Array = args[0];
	gaveSoftInStage.push(args[1]);
	var annoyed:Boolean = args[2];

	output("You climb up onto the bed, crawling over towards your pale lover. Upon reaching her, you flash a smirk and lower your head down between her legs. Coming face to face with her twat, you feel the heat radiating off of it. For somebody who so reluctantly gives up control, Tessa seems to be enjoying this quite a bit already.");
	if (gaveSoftInStage[2])
	{
		output("\n\nYou slowly part your lips and move forward, giving the woman’s cunt a kiss. Flavor fills your mouth as you press against her, Tessa’s sweet juices already flowing freely. Above you the ovir moans softly, enjoying the sensation of your mouth on her folds. Your [pc.tongue] slips from your mouth, lapping away at the exquisite tasting meal before you, making Tessa moan more powerfully.");
		if (gaveSoftInStage[1]) output(" Tessa grabs your head, gently pulling you in tighter against herself.");
		else output(" You hear Tessa pull on her restraints. A moment later, the delicious woman hooks a leg over your shoulder, pulling you in tighter against herself.");
		output(" You don’t really mind, losing yourself in the heavenly aroma of her unique ovir cunt. You stick your tongue out further, trying to lick as much of her cunt as possible, savoring the flavor of her girl-cum as you do.");
		output("\n\n<i>“Oh that’s it, right there. Ooooo.”</i> Tessa starts to twitch, the white ovir enjoying having her delicious pussy eaten. Your face grows flushed and your");
		if (pc.hasCock()) output((pc.hasCocks() ? " cocks" : " cock") + " throb.");
		else output((pc.hasVaginas() ? " pussies" : " pussy") + " quiver.");
		output(" You free a hand and touch yourself, feeling how " + (pc.hasCock() ? "hard" : "wet") + " you’ve already become. Tessa’s moans become a little louder, and you feel her cunt ooze out more of its sweet juices. You think it’s time to move on to the next step.");
	}
	else
	{
		output("\n\nYou move your hands to Tessa’s thick scaly thighs, wrapping around them and pulling the curvy woman’s lower half up towards you. Tessa lets out a small yelp as you lift her by the legs, her ass coming completely up off the bed.");
		if (gaveSoftInStage[1]) output(" Tessa throws her hands out behind herself, trying to catch herself.");
		else output(" Tessa pulls against her restraints, struggling to find something to hold onto.");
		output(" Staring down at her soaked pussy, you lick your lips and dig in. Tessa releases a depraved cry of pleasure as your [pc.tongue] invades her. Selfishly, you drink her sweet cunt nectar, losing yourself in its heavenly aroma. You plunge in, pressing your face tight against her snatch, spearing her womanhood with a rabid hunger. You hear Tessa cry out, motivating you to push in a little harder.");
		output("\n\n<i>“Oh fuck, you’re in so deep. Eat me. Eat my fucking pussy.”</i> Tessa begs, whining like a bitch in heat as you feast on her. You feel your face grow flushed and your");
		if (pc.hasCock()) output((pc.hasCocks() ? " cocks" : " cock") + " throb.");
		else output((pc.hasVaginas() ? " pussies" : " pussy") + " quiver.");
		output(" Freeing a hand, you reach for your crotch and  feel just how " + (pc.hasCock() ? "hard" : "wet") + " you’ve already become. Tessa’s moans become near screams, and you feel her cunt ooze out more of its sweet juices. You think it’s time to turn it up a notch.");
	}
	output("\n\nYou pull your face of the white woman’s cunt and smile. <i>“Soft or Hard?”</i>");
	output("\n\nTessa looks at you, her red eyes filled with lust and wanting. She takes a few heavy breaths, then answers.");
	
	//Plays Part 5
	//If selected while Annoyance is already active, Plays “Early End”
	if (annoyed)
	{
		output("\n\n<i>“Soft.”</i>");
		addButton(1, "Take Her Hard", tessaBedroomTurnaroundEndEarly);
	}
	else
	{
		output("\n\n<i>“Hard.”</i>");
		addButton(1, "Take Her Hard", tessaBedroomTurnaroundPartFive, [gaveSoftInStage, false, annoyed]);
	}
	//Plays Part 5
	addButton(0, "Take Her Slow", tessaBedroomTurnaroundPartFive, [gaveSoftInStage, true, annoyed]);
}

// Tessa's Turn Part 5
public function tessaBedroomTurnaroundPartFive(args:Array):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(7);
	var gaveSoftInStage:Array = args[0];
	gaveSoftInStage.push(args[1]);
	var annoyed:Boolean = args[2];

	if (gaveSoftInStage[3])
	{
		output("You decide to take this slow.");
		if (pc.hasCock())
		{
			output("\n\nYou adjust yourself, pulling your face away from Tessa’s delectable cunt, and positioning your [pc.cockShape] to the ready. You feel yourself throb in anticipation, already rock hard and more than a little eager to spear the ovir. Restraining yourself, you simply ease your cock forward, pressing your [pc.cockHead] against Tessa’s soaking wet twat.");
			pc.cockChange();
			output("\n\nThe white ovir lets out a soft gasp, her womanhood quivering against you, responding to the pressure of your cockhead. You feel yourself ease in, Tessa’s eager cunt sucking you in on its own. Applying slightly more pressure, you push yourself into her warm wetness. A shiver of pleasure runs up your spine as Tessa’s cunt tightens around you, hugging your cockflesh with its warm embrace. You let out a soft moan while you push in deeper, working against the constraining tightness.");
			if (gaveSoftInStage[1]) output(" Tessa wraps her arms around your shoulders, pulling you in tight against her. Her soft tits press against your [pc.chest], squished between the two of you.");
			else output(" Tessa pulls against her restraints, trying to move. Her scaly legs wrap around your hips, holding you in tight against her.} <i>“Fuck me, Steele. Please fuck me.”</i>");
		}
		else
		{
			output("\n\nYou look over at Tessa’s nightstand, spotting her pink virator in the slightly open drawer. Leaning over, you retrieve it, brandishing it before the pale woman. Tessa’s eyes focus in on the toy, following it intently. You position the toy in front of her cunt, pressing it against her lightly. You feel it start to ease in, Tessa’s eager pussy seemingly sucking the toy in on its own. Applying some pressure, you push the toy in. Tessa lets out a soft gasp, her head falling back against her headboard as you push the pink vibrator inside.");
			if (gaveSoftInStage[1]) output(" Tessa grabs ahold of her sheets, gripping them tight.");
			else output(" Tessa pulls against her cuffs, unable to move her hands.");
			output(" Your fingers move to the base of the vibrator and the small knob on its end. Carefully, you switch it on to its lowest setting. Tessa’s back arches, and she lets out a shuddering moan. <i>“Oh fuck. More. More.”</i>");
			output("\n\nThe scene before you is more than a little arousing, and you feel your own [pc.vagina] hunger for attention. You slip a hand between your legs and feel yourself already wet with lusty wanting. Not wanting Tessa to have all the fun, you slip a finger inside of your wet and ready slit. Keeping one hand on the toy while you play with yourself, you watch the ovir next to you writhe on the bed. You turn the knob up slowly, taking more than a little pleasure in watching Tessa respond to the increased sensation. Her whole body starts to tense up, and her moans rise in pitch. She’s close, very close.");
		}
	}
	else
	{
		output("You decide to just go for it.");
		if (pc.hasCock())
		{
			output("\n\nYou adjust yourself, pulling your face away from Tessa’s delectable cunt, and positioning your [pc.cockShape] to the ready. You feel yourself throb in anticipation, and with a small grunt of effort press into the ovir’s quivering pussy. Tessa lets out a throaty moan as you invade her, the pale woman’s whole body tensing up as you plunge in. Her twat burns, her warm wetness gushing all over your mass of sensitive cockflesh. You push in as far as you can go, the lusty woman moaning every inch of the way.");
			output("\n\nLust takes over, and you start to buck your hips, putting your [pc.cockShape] cock to work. You let out a groan as you fuck her hole, feeling the ovir’s cunt tighten against you. Tessa’s moans become gasping cries, the scaled woman howling as you rail her. You press your hands against the insides of her scaly thighs, forcing the curvy ovir’s legs as far apart as you can. The whole bed starts to shake to the rhythm of your thrusts, sweat starting to build on your [pc.skinFurScales]. Below you Tessa writhes,");
			if (gaveSoftInStage[1]) output(" her arms wrapping around your neck and holding on for dear life.");
			else output(" the sounds of her pulling at her cuffs ring in your ear.} You feel her tense up, edged right to the brink of climax.");
		}
		else
		{
			output("\n\nYou look over at Tessa’s nightstand, spotting her pink virator in the slightly open drawer. Leaning over, you retrieve it, brandishing it before the pale woman. Tessa’s eyes focus in on the toy, following it intently. You position the toy in front of Tessa’s cunt, and without waiting or warning, shove it in her soaking snatch. Tessa lets out a gasp as you push it in, whole body tensing up and jerking.");
			if (gaveSoftInStage[1]) output(" She grabs ahold of her sheets, gripping them tight.");
			else output(" She pulls against her cuffs, unable to move her hands.");
			output(" Wasting no time, you move to the base of the toy and turn the knob up to full blast. Tessa’s moans become gasping cries, drowning out the sounds of her toy buzzing. You watch her writhe, overcome with torturous ecstasy.");
			output("\n\nThe scene before you is more than a little arousing, and you feel your own [pc.vagina] hunger for attention. You slip a hand between your legs and feel yourself already wet with lusty wanting. Wanting to enjoy yourself even more, you slip a finger inside of your wet twat. Keeping one hand on the toy while you play with yourself, you watch the lusty woman shake and convulse on the bed. Her eyes glaze over and her head falls back, the pale woman at her limit.");
		}
	}
	output("\n\nIt’s time to finish her off. <i>“Soft or Hard?”</i>");
	output("\n\nTessa doesn't answer at first. After asking a second time you hear her gasp out her answer. ");
	if (annoyed || gaveSoftInStage[3]) output("\n\n<i>“Hard”</i>");
	else output("\n\n<i>“FUCK ME!”</i>");

	//Plays Part 6
	addButton(0, "You Heard Her", tessaBedroomTurnaroundPartSix, !gaveSoftInStage[1]);
}

// Part 6:
public function tessaBedroomTurnaroundPartSix(cuffed:Boolean):void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(4);
	
	output("Time to end this.");
	if (pc.hasCock())
	{
		output("\n\nYou grit your teeth and go hard, fucking the snowy ovir with bestial vigor. The whole bed is rocking, moving in time with your inhuman pace. Air burns in your lungs and every muscle in your body aches. But the fire in your loins makes it all worth it. You feel your cock throb rhythmically, each pulse a small wave of ecstasy. Tessa’s cunt has oozed all over your crotch, and the wet sounds of sex fill the air with each powerful thrust. The impassioned woman herself is moaning like the well-fucked bitch she is, her eyes half closed and mouth agape. Her body alternates between being tense when you thrust and limp when you pull back. A smile forms on the corners of your mouth. You’ve got her.");
		output("\n\nWith one final push and a groan, you feel yourself topple over the edge. Your [pc.balls] churn and an explosion of bliss erupts from your [pc.cockHead]. Your cock burns as a jet of hot [pc.cumColor] fills the pale ovir’s tight wet cunt. Tessa shakes and moans, drowning in a sea of ecstasy and cum. You feel her cunt tighten and twitch against your cockflesh, milking your member for all the seed it can. She shudders, screaming out a silent cry of pleasure. After a moment you feel her go limp beneath you as the last few pumps of seed leave your now spent cock.");
	}
	else
	{
		output("\n\nYou hold on tight to the toy, watching it buzz inside of the Tessa’s cunt. Not wanting to be left behind, you slip a second finger inside of yourself, trying to catch up to the writhing ovir. The visual stimulus in front of you more than stokes the heat in your loins. You moan softly, your pussy coming alive with pleasure as you finger yourself, the smell of girlcum and sweat thick in the air. The intoxicating aroma fuels the raging fire of lust inside of you, making you quiver from the depravity of it all. The pale ovir is moaning like the well-fucked bitch she is, her eyes half closed and her mouth agape. She squirms around on the bed, unable to control her muscles as she drowns in sinful bliss. A smile forms on the corners of your mouth. You’ve got her.");
		output("\n\nYou feel your womanhood clench against your fingers as a powerful wave of heat runs through your body. Doubling over, you collapse against Tessa, quivering at your self-induced climax. You feel Tessa shudder below you, the small woman gasping for air in a sea of bliss. Reaching down, you turn off the toy buried deep in her cunt, pulling it out along with a river of girlcum. Tessa moans like a bitch as the toy leaves her, then goes limp beneath you. You lay on top of the satiated women for a moment longer, enjoying the last vestiges of your blissful high.");
	}
	output("\n\nExhausted, you roll off of Tessa, landing on the soft bed and sinking into in.");
	if (cuffed) output(" Barely remembering, you reach up and unbinds the ovir’s hands, watching them fall free onto the bed.");
	output(" After a moment, Tessa nestles up to you, grabbing ahold of your arm and snuggling in close once more. Her leg lifts up and drapes over your hip, assuming her instinctive spooning position. The white woman rests her chin against your shoulder, her eyes fall shut and a wide, goofy smile stretches her lips.");

	pc.orgasm();

	//Plays Outro
	addButton(0, "Next", tessaBedroomTurnaroundEndProperly);
}

// Outro:
public function tessaBedroomTurnaroundEndProperly():void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(8);

	var tessaPanties:String = "Panties - Tessa's - A sleek black thong, with a delicious aroma.";

	output("After many minutes you hear Tessa speak. <i>“Well that was something.”</i> Her voice is clear, and she sounds thoughtful.");
	output("\n\n<i>“Not going to yell and fall out of bed again?”</i>");
	output("\n\nTessa’s eyes roll about as hard as you’ve ever seen. <i>“I’m too fucking tired now. How the fuck is it more exhausting to get fucked than it is doing the fucking?”</i>");
	output("\n\nYou offer the snowy woman a shrug, not really sure how to answer. The two of you lay there for many minutes, your scaled partner still draped over you. You have to admit, it feels kind of nice.");
	output("\n\n<i>“Alright, any more of this and my teeth might rot.”</i> Tessa pulls herself off of you and sits on the edge of the bed. She lets out a loud yawn and stretches, her back cracking slightly.");
	output("\n\nYou pull yourself up as well and stand, moving to collect your gear.");
	if (!pc.hasKeyItem(tessaPanties))
	{
		output("\n\n<i>“Hey Steele.”</i> You turn to face Tessa, the pale woman hopping off of the bed and moving towards her dresser. <i>“I got something for ya.”</i>");
		output("\n\nYou watch Tessa fish around for a moment, looking for something while muttering under her breathing. <i>“Where the fuck…”</i> In a huff, she slams the drawer closed and starts to sniff the air, sticking her tongue out and wiggling it slightly. The pale ovir moves around the room, swishing away at the air with her metal studded tongue. Her head jerks towards the bed, and she drags in a big exaggerated sniff. Curiously, she drops down to her hands and knees and crawls towards the bed, sticking her head completely underneath of it. You watch her move until half her body is under the bed, the white woman’s ass and tail wiggling in the air in front of you in a ridiculous display. From under the bed you hear her exclaim. <i>“Aha!”</i>");
		output("\n\nTessa pops out and stands in front of you, holding in her hand a familiar black pair of panties. <i>“Here, for the collection. In case you haven't noticed, I tend to go commando anyways.”</i> She holds them out, offering you the fistful of fabric. <i>“You’ve earned it.”</i>");
		output("\n\nYou take it from her and unfold them, confirming they are indeed the black pair she wore to the wedding. The sleek black thong is soft between your fingers, and as you examine them a familiar scent wafts up to your nose. Lifting them up to your face, your give the panties a sniff, the smell of Tessa’s sweet smelling girlcum soaked deep into its fabric. You feel your mouth start to wetten ever so slightly, the aroma reminding you of the ovir’s addictive taste.");
		output("\n\n<i>“Really?”</i> Your attention snaps up to Tessa, who’s giving you an unimpressed frown. <i>“For fuck’s sake. At least wait until you’re out of the room before you start sniffing it. Fuck.”</i> Tessa turns and returns to the bed, sitting on the edge of it. You clear your throat and stuff away the underwear.");
		output("\n\n<b> You have acquired Tessa’s Panties </b>");
		//First time completed, Tessa’s Panties are added to the Key Item Menu, and Panty Masturbation Scenes. Tooltip on Key Item Menu ‘Panties - Tessa’s - A sleek back thong, with a delicious aroma.’ Tooltip on Masturbation Scenes ‘Use Tessa’s black, sweet scented panties for a little self-pleasure.’
		pc.createKeyItem(tessaPanties);
	}
	output("\n\nAs you make your way out of the room, you hear Tessa call out to you. <i>“If anybody asks I’m gonna lie about us cuddling.”</i>");
	output("\n\nYou roll your eyes, not surprised in the least.");

	//PC is Left in Tarkus Hangar
	addButton(0, "Next", move, shipLocation);
}

public function tessaBedroomTurnaroundEndEarly():void
{
	clearMenu();
	clearOutput();
	showTessa(true);
	processTime(1);

	output("Ignoring her, you take one too many liberties… ");
	output("\n\nIn a flash, Tessa’s tail wraps around your neck, catching you by surprise and cutting off your breathing. <i>“STEELE, WHAT THE FUCK?!”</i> The white woman’s powerful tail yanks you down, leaving you gasping for air.");
	output("\n\nAfter a moment Tessa releases you, and a few minutes later you two are sitting on the edge of her bed.");
	output("\n\nTessa sighs, rubbing her eyes. <i>“What the fuck was that about? I mean, I know I’m a fucking bitch, but you can’t just do shit like that. When we’re in bed trust is everything, ya know? If I can’t trust you when we’re fucking…”</i> Tessa’s hand drops from her face and she turns to look at you. <i>“Fuck. Sorry I choked you.”</i>");
	output("\n\nYou rub your neck, and accept her apology. You in then offer one of your own for overstepping.");
	output("\n\n<i>“Right, well don’t let it happen again.”</i> Tessa falls backwards, laying on her bed. <i>“Alright. That killed my buzz.”</i> She turns her head to face you. <i>“Now get outta here before I come to my senses and choke you more.”</i>");
	output("\n\nYou’re not sure if she’s joking or not, and knowing Tessa it can go either way. You pull yourself up and start to gather your things, pulling your gear back on and exiting her bedroom and ship.");

	//PC is left on the Tarkus Hangar.
	addButton(0, "Next", move, shipLocation);
}