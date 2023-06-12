//Running into Maike in the mines
//By SoAndSo
//Mostly coded by Fenoxo Fenbutte

public function pcHasSlaveOutfit():Boolean
{
	return (pc.armor is Slavesuit);
}

public function showMaike(nude:Boolean = false):void
{
	showName(flags["TIVF_MAIKE_TALK"] == 1 ? "OVERSEER\nMAIKE":"\nOVERSEER");
	showBust("MAIKE" + (nude ? "_NUDE":""));
}

public function maikeEncountered():Boolean
{
	return (flags["MAIKE_APPEARANCED"] != undefined || flags["MAIKE_SLAVES_RELEASED"] != undefined || flags["MAIKE_BLUFF_BROKE"] != undefined || flags["MAIKE_BLUFF_PEN"] != undefined || flags["MAIKE_BLUFF_UNPROCESSED"] != undefined);
}

//Plays if PC hasn’t defeated Maike yet, otherwise resume normal tile functions. Maike is a one-off boss: you either fight and win, bluff past (for a one-off repeat encounter) or lose and game over.
public function maikeEncounterFun():Boolean 
{
	if(flags["MAIKE_SLAVES_RELEASED"] == undefined && (flags["MAIKE_BLUFF_BROKE"] != undefined || flags["MAIKE_BLUFF_PEN"] != undefined || flags["MAIKE_BLUFF_UNPROCESSED"] != undefined))
	{
		cumBack2Maike();
		return true;
	}
	clearOutput();
	author("SoAndSo");
	output("Out from the twisting gloom of the mineshafts and twinkling minerals, a grand pit comes into your view. ‘Grand’ doesn’t quite do it justice: it must be at least 60 feet in diameter but what takes you back is the depth. " + (silly ? "It’s even deeper than all the fanfiction in the world." : "Starting from the walkway you’re planted on, a wide path twists around the inside of the pit and presumably to the bottom."));
	output("\n\nThere’s enough nearby artificial lighting to help you make out where to go: bluish white lamps and lights that cover the walkway and freshly chartered ore veins show you where you would go... but not where you’d go <i>to</i>.");
	if(flags["MAIKE_SLAVES_RELEASED"] != 1 && flags["MAIKE_SLAVES_RELEASED"] != 2) 
	{
		output("\n\nThere’s a constant <i>tnk-tnk</i> coming from below, a whole chorus of metal-on-rock that resonates upwards. You can barely make out hunched over slaves and machines hacking and grinding away at the rock along the lower pathways. With a cautious [pc.walk], you get close to the edge of the walkway and peer into the near-black below...");
		output("\n\nYep, that’s deep.");
		output("\n\nPretty deep.");
		output("\n\nDeep enough that the lights are merely dots on the greyish ground below.");
		output("\n\nNerves get the better of you and you can’t help but shuffle backwards to the wall. The footpath is comfortably wide, perhaps a good ten-or-so feet. Enough for a chain gang... and with a huff through the nose, you get back to examining the rest of this cavernous pit.");
		output("\n\nYour eyes are drawn to the lighting fixtures and you’re a little taken aback by just how high up they are. Must be at least as high as the pit is wide!");
		if(flags["MAIKE_SLAVES_RELEASED"] == undefined)
		{
			output("\n\nOne of the lights shines over your [pc.leg] and is unerringly hot against your [pc.skinFurScales].");
			output("\n\nYour codex beeps with an alert: perhaps it’s best not to stand under them for long. No wonder they’re up so high...");
			output("\n\nYou’re about to move out of the light when-");
			output("\n\n<i><b>TNGG, TNNGGG</b></i>");
			//[Oh Shi-]
			clearMenu();
			addButton(0,"Next",ohShitEncounterMaike);
			return true;
		}
		if(flags["MAIKE_SLAVES_RELEASED"] == -1)
		{
			output("\n\n<b>Maike’s remote is on the ground where you left it. You could still free the slaves, if you wished.</b>");
			addButton(0,"Release Slaves",lateSlaveRelease,undefined,"Release Slaves","You can unlock the slaves’ obedience collars. They’d certainly like it, but it might piss off some of the pirates. Then again, the extra trouble might keep them out of your hair.");
		}
	}
	else
	{
		output("\n\nSilence reigns below. The crowds of slaves have moved on. With a cautious [pc.walk], you get close to the edge of the walkway and peer into the near-black below...");
		output("\n\nYep, that’s deep.");
		output("\n\nPretty deep.");
		output("\n\nDeep enough that the lights are merely dots on the greyish ground below.");
		output("\n\nNerves get the better of you and you can’t help but shuffle backwards to the wall. The footpath is comfortably wide, perhaps a good ten-or-so feet. Enough for a chain gang... and with a huff through the nose, you get back to examining the rest of this cavernous pit.");
		output("\n\nYour eyes are drawn to the lighting fixtures and you’re a little taken aback by just how high up they are. Must be at least as high as the pit is wide!");
	}
	return false;
}

public function lateSlaveRelease():void
{
	clearOutput();
	author("SoAndSo");
	flags["MAIKE_SLAVES_RELEASED"] = 1;
	output("Well, the lives of many before the few. Without a second thought, you press the big red button that looks like it shouldn’t be pressed.");
	output("\n\nAlthough subtle, there’s a chorus of disbelief echoing from the mine shafts and the sounds of metal clinking against rock. The slaves of the pit quickly scamper to some unknown, unseen exit below and all that clinking metal from before falls silent.");
	output("\n\n<b>The mines are about to get a lot more interesting...</b>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Oh Shi-
public function ohShitEncounterMaike():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	output("Two heavy metal bolts hammer into the ground near your [pc.feet], the sheer heft of the impact almost enough to crumble the ground!");

	//pcNoSlaveOutfit:
	if(pcHasSlaveOutfit()) output("\n\nYou jump back on instinct and draw out your [pc.weapon], readying up for a fight.");
	//pcSlaveOutfit:
	else output("\n\nYou scramble backwards until you hit some solid surface, unsure of what this moment might hold.");

	output("\n\nLarge bands of energy form like chains from the tops of the bolts and the unnerving echo of what could be a hundred pairs of wings comes closer and closer!");

	output("\n\nWith a harsh billow of ore dust and warm air, a massive specter of a figure lands against the walkway. The blue glow of personal-repulsors shines faintly in the dark. Large, colorful wings flutter and flicker under the sporadic lighting and some snake-like limb circles behind the shadow-cloaked figure.");
	if(!pcHasSlaveOutfit()) output(" You keep your weapon close and readied, unsure of who this could be.");

	output("\n\nAlmost immediately, it lurches to its feet and a coiling, purplish energy whip unfurls from a darkness-sheathed arm. In alarm, you brace yourself and rush under one of the lights as it strides up to you with terrifying intent. The wide light merely casts another shadow of the creature as it leaps several metres into the air!");

	output("\n\nIt comes down as dramatically and as heavily as it entered, right on top of you!");
	output("\n\nYou cry out as the pain of getting flattened to your back takes hold. The creature regains its composure all too quickly and leans over your prone form.");
	output("\n\nUnder the light, you can make out a face.");
	output("\n\nFeminine and angular. Soft, royal-blue skin forms <i>her</i> features with a proud, straight nose and plush, purple lips to add to the picture. What completes it are the slanted eyes: blazing orange with three slits for pupils. Alien instinct toils underneath the predatory stare as she stands over you.");
	output("\n\n<i>“And what do we have here, I wonder?”</i> croons the rich, sophisticated voice. Your eyes adjust to the lighting and you take quick note of the entirety of this creature. One word that comes to mind is ‘moth.’ Three massive wings, six in all, on either side of her waft and waver in gentle accord while casting their wide shadows. The light passes through the membranous wings and the gentle tones of red and orange mingle with the shadows. From above even that, a long and thick tail snakes around. The tip is covered in chitinous, pale-green plates and puts you in mind of a deadly scorpion. What catches your eyes are the jewels studded onto her chest armor, no wait... her chest: exposed, cushion-soft E-cups barely supported by a silver, no-cup corset.");
	output("\n\n<i>“Speak! ");
	if(pcHasSlaveOutfit()) output(" Speak, slave!");
	output(" No speaking means worse pain!”</i> comes the terse command.");
	output("\n\nThe purple whip cracks with energy against the ground by your head, forcing you to wince.");
	output("\n\nThink fast!");
	if(CodexManager.entryUnlocked("Cylirians"))
	{
		output("\n\nMeanwhile, your Codex uselessly bleeps to alert you that it has unlocked an article on your captor’s race. Real useful.");
		output(" <b>(New Codex entry unlocked: Cylirians.)</b>");
		CodexManager.unlockEntry("Cylirians");
	}
	processTime(5);
	//[Appearance] [Fuck You] [Bluff]
	clearMenu();
	addButton(0,"Appearance",maikeAppearance);
	addButton(1,"Fuck You",fuckYouMaike,undefined,"You’re gonna kick her ass! Or attempt to at least!");
	if(pcHasSlaveOutfit()) addButton(2,"Bluff",bluffMaike,undefined,"Bluff","You’re dressed the part, all you have to do is sound vaguely convincing. It’s not soooo hard, right? Right.");
	else addDisabledButton(2,"Bluff","Bluff","You need to be dressed the part for this.");
}

//Appearance
//Always available, unlocks Cylirian codex if not already unlocked. One-off.
public function maikeAppearance():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	flags["MAIKE_APPEARANCED"] = 1;
	output("Presumably " + (flags["TIVF_MAIKE_TALK"] == 1 ? "Overseer Maike" : "one of the head slavers in the mine") + ", this towering insectoid woman has you pinned to the ground.");
	output("\n\nShe stands at 6\' 7\" with a graceful, subtly sexy posture. " + (pc.tallness > 6*12+7 ? " If you were side-by-side, her height wouldn’t mean so much but since you’re on the ground..." : "") + " What adds to this is the sheer size of her moth-like wings. Six thick wings flicker and waft in the warm air of the mine, bathed in a gentle orange-red glow as light passes through the patterned, translucent membranes. What’s left creates an ominous shadow that covers your prone form.");

	output("\n\nThe " + (flags["TIVF_MAIKE_TALK"] == 1 ? "Overseer’s":"slaver’s") + " body could only be described as athletic and wiry, an overt litheness to her limbs belying her raw physical strength and dexterity. She was able to plummet from heights unseen and handily knock you to the ground after all. " + (pc.PQ() >= 80 ? "Even with your strength, she took you to town. ":"") + "That said, she is clearly a bombshell: a toned hourglass shape with curvy hips, a bouncy, grabbable ass and a soft set of healthy, bare E-cup breasts on full display. An array of symmetrical silver piercings make artwork of her near-flat nipples, reflecting the light to become dozens of tiny twinkling dots in the darkness.");
	output("\n\nWhat takes away from her attention to the aesthetic are the chitinous plates that cover her insectoid frame. The sides of her hips, legs and arms are covered in bony, pale-green plates that glisten under the lights. Said plates are intermingled with softer, smooth-looking scales that blend from pale-green to purple and then to a sensuous blue. You think that there’s some serious mod-work going on: these plates look unnaturally strong. Her feet and hands could be interchanged if not for details: five digits a-piece with the appendages crested with more scales, tapering off into vicious claws. With one splayed foot planted flat against you, you don’t need to guess at its manual dexterity.");
	output("\n\nA long and thick tail swings and slithers around the air like a spectral snake. It’s easily the length of the slaver herself and the tip is covered in four pale-green plates that jitter and flap with some unknown intent. What could be hidden within there is anyone’s guess...");
	output("\n\nHer face is exceedingly feminine but still more alien than human. She has unusually straight and sharp features with slanted, blazing orange eyes. Those eyes bore into you with their 3-slit pupils, attempting to steal your attention in these brief moments. A tight bundle of long, silver quills hangs over her shoulder like something akin to hair but made of something more rigid. It’s all held in place by two long, elfin ears that sweep back much like her horns. Around her neck is a natural ‘scarf’ of downy grey fur, one that conforms to a V shape towards her cleavage and adds another layer of curious sophistication. Two sleek horns of greenish-white curve back from her forehead and add a devilish spin, another alien twist to her evolutionary biology. ");
	output("\n\nShe wears a complex suit of armor, although ‘armor’ could be stretching the word. An ornate corset of silver and black covers her hourglass middle, giving some minimal support for her exposed bust. The corset fails to cover much else, leaving a thong-like strip below the waist to cover the slaver’s nethers. Flexible, silk-like fabric connects it to her shoulder armor, which itself is quite bulky, almost spherical and made of a similar silver metal to the corset. You wonder what those strange shoulder-parts could be for. On her wrists are rather fetching cuffs that are connected to the shoulders by more loose fabric. The only armor below the hips comes in the form of two silver repulsors that fit seamlessly to the back of her calves. Explains how she was able to fly and land so swiftly and easily...");
	output("\n\nAround her waist is a wide belt with items of interest: card keys in holsters, a grey rod with some buttons on it, a strange hand cannon with two barrels, some satchell of bulging square objects.");
	output("\n\n<i>“Answer me!”</i>");
	output("\n\nAnother whip-strike cracks by your ear.");
	output("\n\nUhh, uhhh!");
	processTime(2);
	
	addDisabledButton(0,"Appearance","Appearance","You’re already doing that!");
}

//Bluff
//Only available if PC is wearing slave clothes.
//tooltip: You’re dressed the part, all you have to do is sound vaguely convincing. It’s not soooo hard, right? Right.
public function bluffMaike():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	output("Let’s hope this disguise works!");
	output("\n\n<i>“I’m just a slave. I got lost! I couldn’t see where I was going!”</i> you blurt out as you try to wriggle into a more comfortable breathing position. Damn claws are pressing on your chest!");
	output("\n\n<i>“A wriggler, like... bait on a hook. Oo, should I, shouldn’t I?”</i> she says out loud, seeming to disregard your answer. Her clawed foot slides ever closer to your exposed neck while her tail snakes above your gaze. The smooth, pale-green plates jitter and flap like perverse petals caught in unseen winds, and you can’t help but jerk your head from side to side as it ‘nips’ at your cheek and chin.");
	output("\n\nSuddenly a new tightness grips you by the throat! You panic and grasp at the force on instinct. " + (silly ? "Oh no, your most vital area! " : "") + "It <i>has</i> to be her foot, and sure enough, you quickly focus on the muscled thigh that very slowly begins lifting you up off of the ground. " + (pc.tallness >= 7*12 ? "Must be the work of those repulsors, especially with you being on the weighty side! " : "") + "You try to punch away, smack or knock the limb away but your hands just knock against unfeeling chitin and hardened scales.");
	output("\n\n<i>“Where... is your collar?”</i> comes a question so clear in malice that it blots out even the noise of the mining from below. The grip around your neck loosens just enough for you to blurt out an answer...");

	processTime(3);
	//[It Broke] [Unprocessed] [Pen] [Fuck You]
	clearMenu();
	addButton(0,"It Broke",myCollarBrokeMaike,undefined,"It Broke","Better than nothing, right?");
	addButton(1,"Unprocessed",unprocessedSlaveryForMePlease,undefined,"Unprocessed","Might not be as convincing. Also might lead to her taking advantage...");
	addButton(2,"Pen",unprocessedPenMaikeAttempt,undefined,"Pen","Probably very convincing. <i>Still</i> might lead to her taking advantage...");
	addButton(3,"Fuck You",fuckYouMaike,undefined,"You’re gonna kick her ass! Or attempt to at least!");
}

//It Broke
//tooltip: Better than nothing, right?
public function myCollarBrokeMaike():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	flags["MAIKE_BLUFF_BROKE"] = 1;
	output("<i>“It broke! I-I got lost looking for engineering! I really wanted to put it on but it wouldn’t fit!”</i> you force out in a high pitched voice, the strain on your throat relaxing as you sputter.");
	output("\n\n<i>“Damnable Urbolg, him and his... ‘prototypes’,”</i> she growls, a deep and animalistic secondary tone vibrating through her body like a true apex creature. <i>“And yet all of your middling brain matter led you here. How am I to ease my doubt of your claim, slave?”</i>");
	output("\n\nThe grip tightens once again and you whine as your [pc.face] flushes with heat.");
	output("\n\n<i>“Oh, is that hard enough for you, mmm? I can tell you’re <b>new</b> if you’re giving in that easily,”</i> she mocks with a sardonic grin. She even pulls a faux-pout and shakes her head at you. <i>“Mwaaah, the big bad Overseer is putting me in my place, waaah.”</i>");
	output("\n\nYou try to kick and flail at her other leg but hit only the bony plates covering the sides. Your efforts are met with the most indulgent and devilish of giggles.");
	output("\n\n<i>“Yesss, there’s fire in you! And here I was thinking to throw you off of the walkway here and now,”</i> she laughs and you’re promptly thrown back to the ground.");
	output("\n\nYou’re barely given time to breathe as you’re hoisted up to a wobbly standing stance by the scruff of your neck.");
	output("\n\n<i>“You’re going to go <b>back</b> to where you came and then up to the main elevator. I’ll <b>know</b> if you deviate. There will be nowhere that I can’t find you, nowhere for you to hide and shirk your reason for living,”</i> she growls from behind with her grasp pulling you down by the back of your head. <i>“You will learn that Overseer Maike <b>owns you</b>.”</i>");
	output("\n\nWith that, her hand swiftly darts to your neck with some sort of semi-circle in its grip. Maike slams it against your throat and at once, a tight metallic ring snaps around your neck! The laughing slaver pushes you away from her and you stagger forwards on your shaky [pc.footOrFeet].");
	output("\n\n<i>“Hurry hurry! If you stay on course, the mining bots won’t find you, ahahaha!”</i>");
	output("\n\nThe collar beeps and blurts out something in a synthetic voice: <i>“Signal Received. Collar Configured. Owner: Excavator Overseer Maike Erisu. Addendum: We Hope You Enjoy Your Stay At Zheng Shi Mines! We’re All a Part of The Plan!”</i>");
	output("\n\nYour breath catches as the cold metal fits to your neck and you can’t help but clutch at it in panic and in vain.");
	output("\n\n<i>“Oh don’t be like that, you’ll love it here! I’ll make sure of it. Or at least, the collar will,”</i> is what the slave-driver says in her most disarming of voices.");
	output("\n\nYour hands touch the metal ring all over to get a feel for it: not tight enough to choke but impossible to ignore. You can barely turn your head and if you did, the cold metal snags at your [pc.skinFurScales] sharply enough to discourage it. You prod a little more but <i>hrrrkk-</i>");
	output("\n\nYour throat closes up. Your body stiffens all over. Everything below your neck roils with flesh-sundering pain. You’re on your [pc.knees] before you even know it as if it were a throbbing, overwhelming vertigo.");
	output("\n\n<i>“Curiosity killed the [pc.race], or at least tried to. It never gets old, you know? Every silly creature with ideas like ‘freedom’ and ‘not being a slave’, eugh. I get it, fine, deal with it, just do the job and it’ll be over with,”</i> she quips while pushing your crumpled up form around with her foot.");
	output("\n\n<i>“If you’re curious enough to fiddle with this kind of reinforcement tech then I’m just going to have to remain unconvinced at your mental ability.”</i>");
	output("\n\nYour blood pumps louder than her voice, the inane monologue being nothing but a stab at your mind while the collar stabs at your body.");
	output("\n\n<i>“Time’s a-wasting,”</i> sighs the Overseer as she fiddles with her command rod. The full-body paralysis ends and you immediately fall on your elbows. Your head throbs as if it’s ready to burst with your blood and everything else is awash with sensitivity. Even the very fabric of your clothes weighs heavily against you.");
	output("\n\n<i>“Up!”</i>");
	output("\n\nYou’re harshly yanked back to your [pc.feet] with the shakiest footing in recent memory. There’s barely enough endorphin relief to keep you stable but pure inner fire keeps you standing.");
	output("\n\n<i>“Ah, ah, I’ve remembered: deliver this for me, slave. Another incentive to not wander. If I find you wearing it, I’ll do far worse than crush your back beneath my feet,”</i> she threatens and shoves an old-fashion space-suit helmet into your hands from out of the blue. Closer to a ball of high-grade glass than a proper protective piece, ‘panoramic’ is one word you would use generously to describe it. <i>“Take it to the nearest member of staff when you’ve made the descent or I don’t know, put it on your head and wait for them to beat it off of you, then they’ll know what to do with it.”</i>");
	output("\n\nWell, this could be very useful if you ever wanted to go into the vacuum of space... and if no one specific is missing a helmet, what’s one missing helmet? <b>You’ve acquired the space suit helmet!</b>");
	output("\n\n<i>“<b>What</b> are you standing around for? Go, go!”</i>");
	output("\n\nA violently swift whip-crack snaps against your shoulder!");
	//(pc takes 20 lust damage)
	applyDamage(new TypeCollection( { tease: 20 } ), chars["MAIKE"], pc, "minimal");

	output("\n\nTaking the hint, you rush back to the mouth of the walkway, watching the moth-like slaver take flight with unnatural, graceful ease into the dark reaches above. You’re not sure you want to hang around...");
	output("\n\n<b>Better get to that elevator!</b>");

	//[Leave]
	processTime(14);
	clearMenu();
	addButton(14,"Leave",getMarched2ZePen);
}

//Unprocessed
//tooltip: Might not be as convincing. Also might lead to her taking advantage...
public function unprocessedSlaveryForMePlease():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	flags["MAIKE_BLUFF_UNPROCESSED"] = 1;
	output("You slipped through the cracks, that’s all!");
	output("\n\n<i>“I never made it through processing! Caught up in the queue! I don’t know how I ended up here!”</i> you blurt out. You hope your watery eyes show enough sincerity, even if most of it is from lack of air.");
	output("\n\n<i>“Lies!”</i> growls the slaver with a crack of her energy whip. <i>“You were trying to escape, weren’t you? Hide from the guard or escape the pen? How dare you disrespect the collar we blessed you with! I’ll show you that none escape from me: Excavator Overseer Maike! My slaves, my mines...”</i>");
	output("\n\nWith an impressive yank upwards, you’re lifted onto your [pc.feet] only to then be thrown against the closest wall of uncomfortably warm minerals.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",fuckUpWithMaikeAnGetForceyed);
	//[Fuck!]
}

//Pen
//Only available if PC is wearing slave uniform.
//tooltip: Probably very convincing. <i>Still</i> might lead to her taking advantage...
public function unprocessedPenMaikeAttempt():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	flags["MAIKE_BLUFF_PEN"] = 1;
	output("<i>“I was told to go to the pen after the shift, the collar popped off before I could reach it! I didn’t know what to do!”</i> you blurt out automatically, hoping that it sounds convincing.");
	output("\n\n<i>“Hrmmmjust can’t get the. Fucking. STAFF!”</i> growls the slaver. In a flash, she smacks the ground with her powered whip and a visceral <i>snap</i> pierces through. You clutch at your [pc.ears] as the sharp pain makes your [pc.hair] raise. <i>“Janky, broken, flimsy garbage! If he were on my planet, we’d have skinned him alive as a charlatan!”</i>");
	output("\n\nThe Overseer cuts her rant short with a twisted snarl as if reminded of a nagging problem. She looks down at you with the light casting a broad, godlike shadow and leans in with all the devilish intent of a queen of venomous snakes.");
	output("\n\n<i>“Maybe I’ll take you there. Maybe you’ll trundle along, never poking your head out and avoiding that damned goo in a broken chassis all because I deigned to care. Maybe... or...”</i>");
	output("\n\nBefore finishing her sentence, she yanks you up by the neck, kicks off from the ground with her leg-jets and pins you to the closest wall!");
	processTime(3);
	clearMenu();
	addButton(0,"Next",fuckUpWithMaikeAnGetForceyed);
	//[Fuck!]
}

//Fuck!
//Different variants based on what the PC is packing downstairs.
public function fuckUpWithMaikeAnGetForceyed():void
{
	clearOutput();
	showMaike(true);
	author("SoAndSo");
	flags["MAIKE_SLAVEFUCKED_YOU"] = 1;
	var maike:Creature = new Maike();
	output("<i>“Dare I take you here and now? By the neck and off of that walkway? What’s that fitting Terran tale of Icarus flying too high?”</i> mocks the slaver as she holds her coiled whip under your chin. You keep silent through sheer will..." + (pc.WQ() < 60 ? " even if you’re trembling to the bone on the inside.":""));
	output("\n\nThose eyes of solar hatred - orange orbs imprinted with claw-like slits - course over your body with equal parts malice and intrigue. A perverse grin forms across her lips as she eyes up your nethers.");
	output("\n\n<i>“In this place, what’s yours is mine and what’s mine is mine. And I’m taking what’s mine now, slave,”</i> she hisses. Her free hand darts for your pelvis, a wide net of plated claws that lands just under your [pc.belly]. You tense up in her grasp, too slow to brace for this forced fondling.");
	//pcNoCock, has vagina:
	if(!pc.hasCock() && pc.hasVagina())
	{
		output("\n\nHer hand crawls lower and lower until an errant claw catches on your [pc.clit]. You can’t help but whine as something so harsh flicks against something so sensitive.");
		output("\n\nThe look of sinister intent sours into a sneer.");
		output("\n\n<i>“That’s no fun. You’re no fun. How disappointing that such a promising [pc.girlBoy] would betray my expectations with a distinct lack of the proper breeding tools. Ohoo, there’s nothing quite like the <b>scream</b> of an anal-whore with a dick ripe for abuse but you just had to disappoint me, didn’t you?”</i> threatens the slaver. The thick appendage of her tail swings over her shoulder, the pale-green plates in full bloom to exposed a fluid-soaked tailcock. Fuck, it’s <i>thick</i>, easily three inches wide and it only gets wider the further down it goes! You don’t need much more of a message than that...");
		output("\n\n<i>“What’re you...”</i> you begin, but-");
		output("\n\n<i>“You’ll be grateful if you even have a mouth left by the time I’m done with it,”</i> snarls the Overseer as she clutches your jaw in her claws. <i>“On your knees.”</i>");
		output("\n\nYou’ve little recourse but to obey her command. Keep in character, keep in character...!");
		output("\n\nShe gives you just enough space to be free of the rocky wall, thankfully away from the hot detritus and dirt the coats it in part. You quickly fall to your [pc.knees] and maintain what eye contact you can, wary of the humming whip that brushes and tingles against your chin.");
		output("\n\n<i>“Mouth. Open.”</i>");
		output("\n\nThe punctuated command is clear as day. You open your [pc.lipsChaste] and half-close your eyes as you expect the worst, knowing her impossibly long tail is only a thought away from filling your entire gullet.");
		output("\n\nThe slaver merely smiles as he tail flicks into the shadows. Instead, a <i>snap</i> catches you off guard and the thin thong that covered her nethers recedes into the corset. What’s presented is a glistening piece of art, a primed cunt studded with tiny gems and piercings. The curious fleshflower comes closer and closer until-");
		output("\n\n<i>“Mmmuurrfmfophfphf!”</i> is all you force out as the soft labia force themselves upon your lips. Powerful thighs surround your vision and a rough grip holds you by your [pc.hair]. Your mouth is filled with soft, fleshy folds and a worrying wash of feminine fluids but you daren’t do anything without a command. The coiling snake of her tail slips through her legs and wraps itself around your neck, forming a loose noose that catches against your [pc.skinFurScales] with its scale-hide.");
		output("\n\n<i>“I needn’t say more, hm? If you do a poor job, well...”</i> threatens the Overseer as she stares you down from on high. A powerful tension tightens around your neck, making you seize up as blood rushes to your head!");
		output("\n\n<i>“Now get to work. Your life depends on it, slave.”</i>");
		output("\n\nWith no other option, you gulp down any thought of resistance and set to work on giving the best damn oral you can. ");
		output("\n\nYou start off with just your [pc.lips] to get a feel for the soft, well-worn labia that dominate your mouths space. Almost immediately, a gentle trickle of alien juices seeps into your mouth and all over your teeth and [pc.tongue]. Just how pent up is she down there?? It’s a momentary thought but one you keep in the back of your head even as the strange, buttery-sweet taste of the slaver’s femjuice swamps your tastebuds. You gulp it down without pause, no thought to savoring <i>this</i> flavor when the owner has your neck in a vice.");
		output("\n\nYou can just about see the slavers face between her impressive, studded bust but it remains a deathly stare. You slide your mouth up and down the wetted slit from clit to taint, nuzzling your nose against her hooded pleasure button in an effort to get <i>some</i> positive reaction out of her.");
		output("\n\nNo reaction.");
		output("\n\nBut it’s okay, you’ve only just started on her. You hold your [pc.lips] wide open around the slavers entrance and slide your [pc.tongue] right inside.");
		//pcTongueLong:
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You’ve got a lot of tongue to give, of course. You push as much of as can fit inside the slaves surprisingly shallow slit. You can fit a good six inches in before reaching a complete stop.");
		//else:
		else output(" Extending its full length isn’t hard but you’re surprised by just how little space there is inside. If your tongue was longer, you’d fill her out like a real dick!");
		output("\n\nA harsh inhalation from above and a tremble of the thighs is all the positive reinforcement you need as you get a feel for her juicy cunt. And damn is it juicy! You couldn’t quite say whether it’s natural or some sort of mod effect but you’re pulling double duty with your tongue as you lap up femcum, swallow it and return to scooping the inside of her slit.");
		output("\n\n<i>“Mmm, someone who actually knows what’s what. Keep going,”</i> she murmurs, her voice becoming throatier and gentle as you treat her with your mouth. <i>“That airheaded bee would love your kind of training...”</i>");
		output("\n\nYou focus less on her words and more on her body, especially as the tight squeeze on your neck gets ever so tighter the more you continue. It takes all your focus to breathe in between tongue-dives and labia-massages but you still manage to keep your [pc.tongue] lodged deep into her hot fuckhole. The mixed moisture streams from the corners of your mouth as you continue but you’ve no clue if what you’re doing is getting her any closer. All that happens is a further tightening around your throat...");
		output("\n\nYou close your eyes to focus: up, down, roundiround, side-to-<i>sigghvkk</i>.");
		output("\n\nThe trembling domme giggles as her tail-choke hampers your airflow. Your head hurts something fierce as the trapped blood and lack of air combines into something horrible.");
		output("\n\n<i>“Mmmhmm, quick quick! If you don’t get me off, I’ll squeeze and <b>squeeze</b> until the end comes!”</i> she giggles, texturing her harsh exterior with sadistic glee. She... really might kill you!");
		output("\n\nYou can’t think of what else to do except lick.");
		output("\n\nYour eyes stream as much as your mouth fills with fluid, the slowly shrinking airflow causing genuine pain all over your body. With single-minded effort, you lick, lap, kiss and swirl with all the tools available to your mouth, even using the flat of your teeth against her clit as a rougher change of pace. Your eyes fuzz and ache as the lack of air takes its toll on your sense, the only thing you can see being the vague orbs of orange that stare you down. The slavers laughs and gasps of joy echo in your ears but this too is mangled with the thump of the blood in your veins. You’re so... close to... passing out...!");
		output("\n\n<i>“Mmmjussa lil’ more, lil’ more! Mmmm<b>FUH</b>-!”</i>");
		output("\n\nMaike’s thighs tremble and quake, wailing gasps flying from her grimacing mouth as thick gushes of hot, thick femcum fill your mouth and cover your [pc.face]. You’re resigned to gulping the hot torrent down but your lungs are so close to breaking from the lack of air already. The hand grasping your head tenses like an unfeeling vice as the sensation rocks the slavers body and she violently rubs your [pc.face] against her still quivering slit as her gushing dies down.");
		pc.applyPussyDrenched();
		output("\n\n<i>“What a nasty, filthy thing you are, bathing in my fluids. Ahehehe, disgusting!”</i> shouts the breathless slaver, your ears ringing with her sardonic laugh shortly after. Without a care, she staggers backwards and tosses you by your neck against the floor!");
		output("\n\nYou land flat on your back, gasping for air and thankful your neck survived such a toss. She’s not quite done yet, though...");
		output("\n\nThe shaky Overseer crouches over you and gives your [pc.face] another rough pussy-massage, a cascade of slippery folds sliding across your cheek and temples.");
		output("\n\n<i>“Nnngguh! What’s mine... is mine,”</i> she gasps, pushing herself off of you to admire the damage done. You’re just thankful for the warm air that graces your throat, no matter how thick, earthy or artificial it might be.");
		output("\n\n<i>“Up!”</i>");
		output("\n\nAt that command, the whip cracks against your [pc.thigh]. Fuck, she doesn’t let up!");
		processTime(20);
		pc.changeLust(20);
		pc.girlCumInMouth(maike);
	}
	//pcHasCock, scene priority:
	else if(pc.hasCock())
	{
		output("\n\nHer claw seems to know what it wants.");
		output("\n\nIn a flash, it grabs at your [pc.cocks] ");
		if(pc.balls > 0) output(" and [pc.balls]");
		output(" and digs into the soft, sensitive meat as if it were fresh clay. You wince and protest as you’re given an aggressive fondling yet those claws would need a little more pressure to start... <i>piercing</i>. Throughout, the slaver stares you down with those blazing orange eyes without a blink. You try to look away but there’s practically nowhere <i>to</i> look.");
		output("\n\n<i>“Now that’s what I want to find. A useless piece of meat that exists purely to make its owner scream. I’ve got some... alternative plans for you, slave,”</i> muses Maike in a lusty, knowing tone. Out of the periphery of your eye, you catch the writhing shadow of her impossibly dexterous tail. The strange, pointed plates that cover the tip flicker and jitter with some sort of anticipation and by the way it’s hovering closer and closer to both your [pc.lips] and [pc.ass]...");
		output("\n\n<i>“Eenie meanie minie...”</i>");
		output("\n\nBefore getting to ‘mo’, you’re pulled by the hip and shoulder and thrown to the ground! You fall flat on your front with your arms caught under your [pc.belly]. Adrenaline kicks in as you try to scramble to your feet but a heavy force pushes you back down into the dirt and detritus. You can’t help but yelp as the pressure plateaus on your back and holds you down, doubling the difficulty to breathe.");
		output("\n\n<i>“Pathetic, are you even trying? Where’s the will to live?”</i> taunts the slaver as she presses her weight on you. Your hands are splayed to either side of you but the pressure from Maike’s wide claw ensures that you could never push yourself up.");
		output("\n\n<i>“It’s your lucky day, slave. I have a self imposed rule on using ‘the help’ for my daily discharges. My usual squeeze, however, has been a bad bee boy and I’m very. Very...”</i>");
		output("\n\nHer tail tip swings around to within inches of your [pc.face]. With a visceral snap, its pale-green plates spread apart to reveal what’s within: a pointed, pre-dripping tailcock. Your eyes widen at the orchid-like display and it very quickly dawns on you where this might be going...");
		output("\n\n<i>“Pent up.”</i>");
		output("\n\nA spontaneous spurt of silver-white breeder’s syrup splatters against the ground before you. Hot flecks of the stuff scour your [pc.face] with their potent contents and you shy away from the sordid display." + (silly ? " NotLikeThis!":""));
		output("\n\n<i>“Eugh, <b>now</b> you show some spirit. Spirit does little, I’m afraid,”</i> gloats the alien moth as she pins your left arm under her other foot. You wince as the pressure feels like it doubles against your frame but it’s not quite enough to prevent you from breathing. The claw tightens and grips into your [pc.skinFurScales] with raptor-grade strength. If those talons were any sharper, your arm could be torn off...");
		output("\n\n<i>“Open wiiide.”</i>");
		output("\n\nThe pointed head of her tail-cock lances for your [pc.lips] and pushes insistently against them. You twist and turn your head in all directions but the snaking organ is one step ahead! In an instant, the head dives through your oral resistance and blitzes down your throat. The petal-plates of the slavers tail clamp harshly around your mouth and [pc.face], securing the seal. Your instinctual scream is muffled out completely by a twisting, writhing snake of a tail-cock that fills out your gullet in seconds. All you can think of is to breathe but this impossibly hot weight in your body is trying its hardest to fill you up!");
		output("\n\n<i>“Nnngggthat’s the <b>good</b> shit! I’ll use your body for all its worth, mark you as mine to all the other slavers!”</i> growls Maike from on high.");
		output("\n\nThe tail-cock kicks into high gear immediately, the fleshy shaft pumping from tongue to windpipe as if your throat were any other onahole. Your eyes roll back into your head as your focus locks onto only breathing, just enough to maintain awareness. Being violated in such an invasive way has already reduced you to a panicked mess but there’s that shred of Steele will left to keep you through.");
		output("\n\nAlready you’re tasting the slaver fiends breeding juices: some sort of buttery-salty cum that seeps out on its own accord, thicker and in greater quantities than pre-cum but without the expectant deluge from a potent orgasm. Regardless, you’re forced to drink, gulp and swallow it all as you’re used so wantonly.");
		pc.loadInMouth(maike);
		output("\n\n<i>“Nnnyeees, little Tiffy will be green in the face. He could only dream of such a gift!”</i> rants the growling Maike. The words mean nothing to you in this moment what with your sole reason to be in constant jeopardy from getting literally cock-blocked.");
		output("\n\nThe constantly spewing moth cum jumps in size as a visceral bulge of the stuff passes through your [pc.lips] and tightens the thick weight in your throat. You jitter and whine as the pressurized cumjet unloads into your stomach, bloating an already stuffed space with alien seed. The Overseer laughs and gasps as the load stretches your [pc.belly] out against the floor, a physical demonstration of her hidden potency.");
		output("\n\nAs hefty a load as it was, the fluid doesn’t stop...");
		output("\n\nWith a quick jerk of her hips, the Overseer’s tailcock gets pulled out of your thoroughly-used gullet and a messy, syrupy squirt of sweet, buttery jizz lands on your gasping [pc.face]. Your body can’t help but cough up more of the stuff and your [pc.belly] growls with discomfort at the sheer amount of ‘feed’ it’s been blessed with.");
		output("\n\n<i>“Ahhmmmmmmy my, what a trooper! An interesting fact about my race, slave: if I didn’t consciously restrain myself from draining my tail every waking moment, I would </i>never<i> stop. Being pent up for days is a fitting catharsis... but now that you’re here, unclaimed and prepped,”</i> explains Maike as she pivots on her foot. <i>“I’ve a perfect place to put it all!”</i>");
		output("\n\nYour slave’s uniform relaxes in tightness as some sort of zip or opening comes undone near your [pc.ass]. Oh no, she couldn’t mean...");
		output("\n\nAs you’re out of breath and holding back your newly ingested ‘filling’, you can do little but watch as the Overseers snaking tail - resplendent in its orchid-like perversion - lines up with your [pc.ass] and presses insistently against your [pc.asshole]." + (pc.tailCount > 0 ? " You try your best to bat away the thing with your [pc.tails]" : "You try to wiggle your lower body out of its reach") + " but all you end up doing is shaking your exposed tush for the slaver’s delight.");
		output("\n\nYour teased hole gives in before you do. The slathered up tailcock has no trouble in spreading you open with a slow, purposeful force.");
		pc.buttChange(maike.cockVolume(0));
		output("\n\nIt’s impossible to hold back a moan as the smooth mass of meat fills you up all the way. You wince as the petal-plates snap against your [pc.ass] and hold the seal in place.");
		output("\n\n<i>“I’m in a merciful mood. What sort of leader knows nothing of " + (silly ? "Merzi":"mercy") + " anyway? A quick cum, then back to the mines with you,”</i> quips the slaver. With a strained grunt, Maike’s tail gets to work.");
		output("\n\nThe snaking tail-cock - having buried itself with ease - slides back and forth in long and smooth rhythms. You wince and wail as the thick, pointy head bumps across your prostate only to be crushed by the just-as-thick, sliding tail-meat. Your body has little else to do but accept this anal invader and your [pc.belly] burbles away as it’s pounded from a different direction. Already there’s hot, syrupy spunk pooling in your hole and spewing at an alarming rate. As more deliciously hot fluid spurts out, the smoother and faster the tailcock pumps. The more it pumps, the more it milks your excited prostate.");
		output("\n\n<i>“Nnngdamn the Sun, I miss the breedwhores back home! You slaves are too loose and shallow for this,”</i> grunts Maike just as there’s a sudden jump in her cum-spurting. <i>“Wasted enough time on your useless sluthole...”</i>");
		output("\n\nYou groan under her feet as additional liquid weight forces itself into your innards. Your [pc.belly] fills up with literal gallons of alien seed and the bulges of the thick, syrupy cream that run through the tail-cock stretch out your [pc.asshole] with every passing. Maike’s grunts soften into gasps as she forces as much of her fresh seed into you she possibly can.");
		output("\n\nOut of nowhere, the pumping tailcock disgorges from within you and whips out of your [pc.ass]. A body-warm deluge of the slavers seed washes over your [pc.crotch] and pools into a sticky, sweet-smelling mess beneath. You cough up more and more of the buttery cum as your body rearranges its new liquid load.");
		output("\n\n<i>“Three. Fucking. Days worth. Tiffy will be so jealous when I tell him just how <b>fat</b> and useless you became. Now, to seal the deal.”</i>");
		output("\n\nHuhhh...??");
		processTime(20);
		pc.changeLust(20);
		pc.loadInAss(maike);
	}
	//pcNeuter:
	else
	{
		output("\n\nHer hand slides down to your pelvis with a fumbling haste and you brace yourself for the inevitable grip.");
		output("\n\n<i>“Aha! Ha, wait... where is...?”</i> she growls, perplexed by your lack of breeding biology. <i>“Who would let something so worthless into the shipments? Guh, detestable!”</i>");
		output("\n\nIn a fit of disgust, she yanks you forward and harshly turns you around on the spot.");
		output("\n\nWhat now?!");
		processTime(2);
	}
	//PC gains Cum Covered, Belly Filled and Ass Filled status effects ifCock or Pussy Drenched ifNoCock, HasVagina. Nothing if Neuter.
	clearMenu();
	addButton(0,"Next",maikeFucksYaUpPart2);
}

public function maikeFucksYaUpPart2():void
{
	clearOutput();
	showMaike(true);
	author("SoAndSo");
	output("Without a thought for you, Maike takes a step to the side and hauls your body to a desired stand with a quick flutter of her wings and surprisingly hefty yank.");
	if(pc.hasCock()) output(" You’re so packed up with seed that it takes a burst from her repulsors to get you in place.");
	output("\n\nIn a flash, she slaps a semi-circle of metal to your throat and the ring snaps into its full shape. The collar beeps and blurts out something in a synthetic voice: <i>“Signal Received. Collar Configured. Owner: Excavator Overseer Maike Erisu. Addendum: We Hope You Enjoy Your Stay At Zheng Shi Mines! We’re All A Part Of The Plan!”</i>");
	output("\n\n<i>“Another one for me! Show those damnable Jumpers... now you traipse along to that main elevator like a good little slave with the shred of dignity I’m blessing you with,”</i> exclaims the Overseer. As a show of ‘ownership’, she yanks you by the jaw and plants a kiss on your cheek. You swing your head away as soon as she lets go, keeping some semblance of defiance alive at least.");
	output("\n\n<i>“Oh don’t be like that, you’ll love it here! I’ll make sure of it. Or at least, the collar will,”</i> is what the slave-driver says in her most disarming of voices.");
	output("\n\nYour hands touch the metal ring all over to get a feel for it: not tight enough to choke but impossible to ignore. You can barely turn your head and if you did, the cold metal snags at your [pc.skinFurScales] sharply enough to discourage it. You prod a little more but <i>hrrrkk-</i>");
	output("\n\nYour throat closes up. Your body stiffens all over. Everything below your neck roils with flesh-sundering pain. You’re on your [pc.knees] before you even know it as if it were a throbbing, overwhelming vertigo.");
	output("\n\n<i>“Curiosity killed the [pc.race], or at least tried to. It never gets old, you know? Every silly creature with ideas like ‘freedom’ and ‘not being a slave’, eugh. I get it, fine, deal with it, just do the job and it’ll be over with,”</i> she quips while pushing your crumpled up form around with her foot.");
	output("\n\n<i>“If you’re curious enough to fiddle with this kind of reinforcement tech then I’m just going to have to remain unconvinced at your mental ability.”</i>");
	output("\n\nYour blood pumps louder than her voice, the inane monologue being nothing but a stab at your mind while the collar stabs at your body.");

	output("\n\n<i>“");
	//pcAnswered[ItBroke]or:
	if(flags["MAIKE_BLUFF_BROKE"] != undefined) output(" Oh stop curling up like that, you’ve already had a collar on, remember? Or was that a teensy <b>lie</b> on your part? Suppose it doesn’t even matter now.");
	output(" That’s enough from you,”</i> sighs the Overseer as she fiddles with her command rod. The full-body paralysis ends and you immediately fall on your elbows. Your head throbs as if it’s ready to burst with your blood and everything else is awash with sensitivity. Even the very fabric of your clothes weighs heavily against you.");
	output("\n\n<i>“Up!”</i>");
	output("\n\nYou’re harshly yanked back to your [pc.feet] with the shakiest footing in recent memory. There’s barely enough endorphin relief to keep you stable but pure inner fire keeps you standing.");

	//pcDid[ItBroke]or[Unprocessed]:
	if(flags["MAIKE_BLUFF_BROKE"] != undefined || flags["MAIKE_BLUFF_UNPROCESSED"] != undefined)
	{
		output("\n\n<i>“Ah, ah, I’ve remembered: deliver this for me, slave. Another incentive to not wander. If I find you wearing it, I’ll do far worse than crush your back beneath my feet,”</i> she threatens and shoves an old-fashion space-suit helmet into your hands from out of the blue. Closer to a ball of high-grade glass than a proper protective piece, ‘panoramic’ is one word you would use generously to describe it. <i>“Take it to the nearest member of staff when you’ve made the descent or I don’t know, put it on your head and wait for them to beat it off of you, then they’ll know what to do with it.”</i>");
		output("\n\nWell, this could be very useful if you ever wanted to go into the vacuum of space... and if no one specific is missing a helmet, what’s one missing helmet? <b>You’ve acquired the space suit helmet!</b>");
		output("\n\n<i>“Now off you go or else I’ll to throw you into the pen with nothing but that collar on. All those broken spirits, so aggressive and horny all in one place... I can only imagine what ravenous minds would do to <b>this</b> body,”</i> she hisses into your ear before pushing you towards the walkways exit.");

		//pcHasVagina, NoCock:
		if(pc.hasVagina() && !pc.hasCock()) output("\n\nYou hurry your way to the exit while wiping the slavers juices from your [pc.face]. A thought runs through your head that this could’ve been so much worse...");
		//pcHasCock, override:
		else if(pc.hasCock()) output("\n\nYou’re so stiff, used-up and full of alien seed that you can only waddle with a wonky footing towards the exit. You try to keep your sense of shame up by zipping up your slaves uniform." + (pc.exhibitionism() >= 66 ? " If it weren’t the mark of such a brutal and not exactly satisfying conquest, your voyeuristic mind might’ve left such a cum-trophy on full display...":""));
		//pcNeuter:
		else output("\n\nWell thank fuck you escaped the worst of it! You make your way over to the walkways exit.");

		output("\n\nA new thought crosses your mind: once I’m done with it, how am I getting this collar off...");

		output("\n\n<i>“Go!”</i>");

		output("\n\nShe gives you one last whipcrack to see you off.");
		//whip dammu.
		applyDamage(new TypeCollection( { tease: 20 } ), chars["MAIKE"], pc, "minimal");
		processTime(13);
	}
	//pcDid[Pen]:
	else
	{
		output("\n\n<i>“Quick-ly! One, two, one two, ahaha!”</i> shouts Maike as she snaps her whip at your [pc.feet]. You’re more than happy to keep in line if just to avoid those strikes. Even in your post-collar-pain haze, you jump to formation and rush towards the exit with the moth-domme barely a foot away behind you.");
		processTime(20);
	}
	//[Leave/To The Pen]*
	clearMenu();
	addButton(0,"Next",getMarched2ZePen);
}
//*’Leave’ if [Unprocessed] or [It Broke], ‘To The Pen’ if [Pen]. Leave dumps player outside previous tile.
//To The Pen
//Takes player to the slave pen tile.
public function getMarched2ZePen():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	eventQueue.push(bonusCollarAndHelmetHandouts);
	if(flags["MAIKE_BLUFF_PEN"] != undefined)
	{
		currentLocation = "ZS H40";
		generateMap();
		output("The march to the pen is quite the effort.");
		output("\n\nYour movements are rigid and alert, constantly wary of the Overseer’s whimsical ‘course corrections’ whenever she lifts her whip. You pass entire chaingangs being held in place or led to other parts of the mine by more pirates, noting that all pay a nod or salute to Maike as you walk past.");
		output("\n\n<i>“A runner?”</i> asks one, a snake-like slaver in a silver-green bodysuit.");
		output("\n\n<i>“Nooo, a little lamb who lost its way. Continue your duties, I’ve got this,”</i> she replies with a sigh, never once looking in the saluting slavers direction. The Overseer keeps your own distracted gaze in line with more and more whip cracks although you’re never actually hit by the coruscating energy lash.");
		output("\n\nAll the while, the collar ebbs and pulses a mild ache across your body. When you pass a zone of heavy activity, it relents and settles a little more comfortably against your skin. At all other times, it bites deep into your nerves and even makes [pc.walking] about a different struggle of its own.");
		output("\n\nYou stay strong but it’s not merely your body under assault as leering, envious eyes of ‘fellow’ slaves look at you with primal hunger. If you weren’t in the same boat as them, it wouldn’t be too far to think that they’d be on you like wolves. Maike sees this too, offering nought but a quick lash from her whip to the chancers amongst the chained slaves.");
		output("\n\nEventually, you come to familiar tunnels: somewhere near the exit at least.");
		output("\n\nYou’re walked by the Overseer’s office but the Overseer takes a moment to pause. She stares wistfully at the doors as if she were pining for something inside. You stand to attention as she does, mindful to at least appear focused as a timid slave should be. You might be getting <i>too</i> into this role says your nagging conscious.");
		output("\n\nA short march later and the two of you come up to the large door that blocks access to a holding camp. Maike holds a firm grip to your shoulder as she swipes the card around in the air. Unseen sensors beep and make light pleasantries as they address her as ‘Excavator Overseer Maike’. The door slides apart in no time at all and as soon as there’s enough room, the slaver pushes you straight into the gloom.");
		output("\n\nThe doors close behind.");
		output("\n\nWelp. Now what?");
		processTime(30);
		clearMenu();
		//[Hmm]*
		addButton(0,"Next",mainGameMenu);
		//*Go to who/whatever’s leading off on the slave pen stuff.
	}
	else if(rooms[currentLocation].southExit != "") move(rooms[currentLocation].southExit);
	else mainGameMenu();
}

public function bonusCollarAndHelmetHandouts():void
{
	clearOutput();
	showName("\nSUCCESS!");
	output("The collar placed around your neck tingles dangerously. <b>You’ll be unable to recover HP or energy from resting so long as it is equipped, owing to the <i>motivating</i> shocks.</b>");
	
	var newAccessory:ItemSlotClass = new MaikesCollar();
	var itemList:Array = [];
	if(pc.hasAccessory())
	{
		output(" Your old accessory is unequipped.");
		var oldAccessory:ItemSlotClass = pc.accessory;
		oldAccessory.onRemove(pc);
		itemList.push(oldAccessory);
		pc.accessory = new EmptySlot();
	}
	if(flags["MAIKE_HELMET_TAKEN"] == undefined)
	{
		flags["MAIKE_HELMET_TAKEN"] = 1;
		itemList.push(new SpacesuitHelmet());
	}
	if(itemList.length > 0)
	{
		output("\n\n");
		itemCollect(itemList);
	}
	
	pc.accessory = newAccessory;
	newAccessory.onEquip(pc);
	
}

//Fuck You
//tooltip: You’re gonna kick her ass! Or attempt to at least! Gonna have to use that [pc.class] knowhow to get out of this!
public function fuckYouMaike():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	output("You’ve got a more expedient idea to get what you want." + (flags["ZHENG_SHI_PASSWORDED"] == 1 ? " Hey, if it worked for the front door!":""));
	output("\n\n<i>“Ey, FUCK YOU!”</i>");

	//pcMerc:
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) 
	{
		output("\n\nYou aim your fist at the slaver’s exposed ankle, catch it as the limb weakens from the impact and yank your target to the ground. The unawares moth-alien crumples into a mess of wings and scaled limbs, caught off guard by your dirty play. It hasn’t quite taken her out though for in seconds, she’s already taken flight and hovers several feet above you.");
		output("\n\nWith keen combat reflex, you quickly get to your [pc.footOrFeet] and draw your");
		if(pcHasSlaveOutfit()) output(" cleverly stowed");
		output(" [pc.weapon].");
		if(pcHasSlaveOutfit()) output(" It’s amazing the space you can find in a slave’s uniform for this kind of gear!");
	}
	//pcSmuggler:
	else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		output("\n\nWith a shimmy of your wrist and fingers, you toss a miniature flashbang towards the slaver’s middle. Although her perception is sharp, her reflexes fail to knock the grenade away and with a quick push, she twists away from the near-instant flash! In seconds, she’s already taken flight and hovers several feet above you with malevolent intent.");
		output("\n\nYou’re already rolling out of the way and with quick, dexterous skill, you get to your [pc.footOrFeet] and draw your");
		if(pcHasSlaveOutfit()) output(" cleverly stowed");
		output(" [pc.weapon].");
		if(pcHasSlaveOutfit()) output(" It’s amazing the space you can find in a slave’s uniform for this kind of gear!");
	}
	//pcTech:
	else if(pc.characterClass == GLOBAL.CLASS_ENGINEER)
	{
		output("\n\nHitting a panic button on your codex, your shield crackles with a kinetic pulse and the unaware slaver is knocked several feet into the air! She very quickly manages to gain stability mid-flight and hovers high above you.");
		output("\n\nYou quickly get to your feet and draw your");
		if(pcHasSlaveOutfit()) output(" cleverly stowed");
		output(" [pc.weapon].");
		if(pcHasSlaveOutfit()) output(" It’s amazing the space you can find in a slave’s uniform for this kind of gear!");
	}
	output("\n\n<i>“So you’re going to struggle? Oh how I do love a <b>struggle</b>. You’ll fall to me and I’ll break you in mind <b>and</b> body!”</i> shouts the slaver as she readies herself up. Her whip re-ignites in hateful, purple energy and she draws a strange, double-barrelled hand cannon for her other hand.");
	output("\n\nOh you’ll give her something to struggle over alright.");
	processTime(3);
	var tEnemy:Maike = new Maike();
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(victoryAgainstMaike);
	CombatManager.lossScene(pcLosesToMaike);
	CombatManager.displayLocation("MAIKE");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//PC Victory
//PC gets an appropriate amount of XP, creds, x1 Excavator Overseer Keycard.
public function victoryAgainstMaike():void
{
	showMaike();
	author("SoAndSo");
	//CombatVictory:
	if(enemy.HP() <= 1) output("The battered up moth-domme crash lands into the rough stone walkway, naught but a tumble of askew wings and defeat.");
	//LustVictory:
	else 
	{
		output("An involuntary spurt of the slaver’s alien seed splatters against the walkway as she shakily lands on her knees.");
		output("\n\n<i>“Nooo, nooo, not noooow, why body whyyyyy,”</i> she whines into her arms as her failing self-control takes its toll and more of her cum dribbles into the dirt.");
	}
	output("\n\nNot that it wasn’t hard fought for you too. With a purposeful [pc.walk], you casually knock away the broken Overseer’s weapons from out of her shaking hands. You hold your [pc.weapon] out and point it right at her temple, stoic in the face of her glassy, defeated eyes. Those suns don’t shine much anymore...");
	output("\n\n<i>“I know how this goes... predator becomes prey. I’m done! A mess! You’ve ruined it all!”</i> she bites, only to bury her head in her hands. ");
	if(enemy.HP() <= 1) output("<i>“Now you’ll enact some... ‘vengeance’ and take everything from me...”</i>");
	else output("<i>“I can’t even... think! Fuck, being pent up for so looong....”</i>");

	output("\n\nTo the victor goes the spoils, but that pitiful mess of a beaten domme is exactly that. You’ve got other priorities instead of petty conquest: Dad’s probe. You eye the defeated form of the once-proud Overseer and spy a control rod. Even a quick glance at it tells you that it’s an important tool. You swipe it off of the slaver’s belt as well as her not-so-hidden keycard and palm both around, noticing the somewhat convoluted control panel along the side of the rod.");

	output("\n\n<i>“Careful. If you... tampered with it, all the slaves... but you wouldn’t! They’d be free and rampant! I’d be ruined...! The bosses would go after me...!”</i> she babbles. You warily keep an eye on her but can’t quite figure out what to do with this here control rod.");

	processTime(3);
	clearMenu();
	addButton(0,"Release",releaseTheSlaves,undefined,"Release","Free those slaves! It could be a good distraction!");
	addButton(1,"Leave Alone",leaveSlavesAlone,undefined,"Leave Alone","Don’t free the slaves! It could draw the wrong kind of attention!");
	//[Release] [LeaveAlone]
}

public function releaseTheSlaves():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	flags["MAIKE_SLAVES_RELEASED"] = 1;
	output("Well, the lives of many before the few. Without a second thought, you press the big red button that looks like it shouldn’t be pressed.");
	output("\n\nAlthough subtle, there’s a chorus of disbelief echoing from the mine shafts and the sounds of metal clinking against rock. The slaves of the pit quickly scamper to some unknown, unseen exit below and all that clinking metal from before falls silent.");
	continueMaikeVictoryChoices();
}

public function leaveSlavesAlone():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	flags["MAIKE_SLAVES_RELEASED"] = -1;
	output("Noble as it might be, it’s no good making rash tactical decisions like that. Or something. You simply toss the baton away, far out of the reach of the downed and flailing slaver.");
	continueMaikeVictoryChoices();
}

public function continueMaikeVictoryChoices():void
{
	output("\n\n<i>“What was I even expecting... all this toil, all these <b>drugs</b> just to keep me going, for what?! Damnit all, I can’t even stand up with all this <b>seed</b> in me! Heeelp!”</i> whines Maike as you casually toss the baton aside.");
	output("\n\nSeed, hmmm...");
	output("\n\nSure enough, you can see that her tail is still spewing a faintly sweet stream of moth-demon semen against the ground. What kind of species cums <i>forever</i>? And the way she’s wiggling that sensitive-looking derriere...");
	output("\n\nYou could help her in your own special way. Or you could just leave her to the slaves. Would you take pity on a slaver?");
	processTime(2);
	//[Quick Anal] [Spank Her] [Get Bloated] [Leave]
	clearMenu();
	//Quick Anal
	if(pc.cockThatFits(enemy.analCapacity() * 1.5) >= 0 || pc.hasHardLightEquipped()) addButton(0,"Quick Anal",penisRouter,[quickMaikeAnal,(enemy.analCapacity() * 1.5),true,0],"Quick Anal","Hey, if she’s that pent up, you’ve got the solution <i>riiiight</i> here. Here being your " + ((pc.hasHardLightEquipped() && !pc.hasCock()) ? "fake-":"") + "junk.");
	else if(pc.hasCock()) addDisabledButton(0,"Quick Anal","Quick Anal","Actually, it looks like what you got couldn’t fit in that ass. Shit.");
	else addDisabledButton(0,"Quick Anal","Quick Anal","Actually, You’ll need a crotch-mounted penetrator for this.");

	//Spank Her
	addButton(1,"Spank Her",spankDatMaike,undefined,"Spank Her","Cruel poetic irony. Why not break her in spirit too? She’s already been beaten in body and worn out in mind.");
	//Tail Feed
	if(pc.hasTailCunt()) addButton(2,"Tail Feed",tailFeedMaike,undefined,"Tail Feed","Goddamn, your [pc.cuntTail] won’t calm down! It sees a breeding partner and just wants to get in on that thing...!");
	else addDisabledButton(2,"Tail Feed","Tail Feed","You don’t gots a tail-cunt, friend.");
	addButton(14,"Leave",leaveDatMaikeBehind,undefined,"Leave","Well, if she managed an entire operations worth of slaves, she can sort herself out getting off of this rock. You got shit to do!");
}

//Quick Anal
//Requires strapon or a cock less than 22" long and less than 4" wide, greyed out otherwise. Orgasm event.
//tooltip: Hey, if she’s that pent up, you’ve got the solution <i>riiiight</i> here. Here being your {/pcOnlyStrapon: fake-}junk. {/pcTooBig: Actually, it looks like what you got couldn’t fit in that ass. Shit.}
//USE COCK ROUTAH
public function quickMaikeAnal(x:int):void
{
	clearOutput();
	showMaike(true);
	author("SoAndSo");
	output("You’ve seen that bountiful behind of hers and have a sneaking suspicion it might be related to her constant cumming. Not just that but ass is <i>ass</i>. A big, pale-blue booty that’s extra sensitive. No way you’re passing <i>that</i> conquest up.");
	output("\n\n<i>“I have a feeling you’d have done this to me in another timeline,”</i> you smirk as rest your [pc.foot] on her back. <i>“So give me a show with that whore’s ass of yours and maybe I’ll help you out.”</i>");
	output("\n\nThe slaver sighs as if finally coming to terms with her acceptance. She sinks against the ground and presses her soft, lovely chest against it. Then she pulls her legs inward to rest on her knees thus forcing her plush derriere into the air. Her tail coils up and hangs at her side, still spewing trickles and strings of her alien seed into the ground. With a <I>shwihpp</i> sound, the faux-thong covering her feminine nethers snaps into her corset armor and exposes a blue-lipped cunt dripping with needy juice. Above is the tight ring of her tailhole and it flexes for your viewing pleasure. Maike wiggles this shameless display of her needy holes from side to side, her wings spread wide and lax from her sides. Now that’s what you want to see.");
	output("\n\n<i>“Now that’s what I want to see!”</i>");
	output("\n\nGood work, brain.");

	if(pc.isCrotchExposed()) output("\n\nAlready lewd and in the nude: time to dive into the dirt with this bitch");
	else output("\n\nYou strip from your [pc.crotchCovers], setting it all nearby in case of unwanted interruption");
	output(". That whole fight has put you in quite the elevated mood and jerking your [pc.cockOrStrapon " + x + "] gets it fit and ready.");

	//pcTaur:
	if(pc.isTaur()) output("\n\nYou [pc.walk] around her to get into the proper mounting position for your tauric body, admiring the view of the blue moth-domme now crouched under your massive form.");
	//else:
	else output("\n\nYou [pc.walk] on your [pc.knees] to get into a more intimate position behind her and line yourself up with her jiggling behind, eager to fill her and feel her clench around your [pc.cockOrStrapon " + x + "].");
	output("\n\nYou lay your [pc.cockOrStrapon " + x + "] against her taint and grind it across her asshole, smiling to yourself as her warm skin teases your mast. ");
	var cLength:Number = 9;
	if(x >= 0) cLength = pc.cocks[x].cLength();
	if(x == -1) output("<i>“Hardlight...? Needs must, I guess,”</i>");
	//pcCock<7":
	else if(cLength < 7) output("<i>“Mm, thank the sun that you’re not using a can opener for a cock, even if you could do with a bit... more,”</i>");
	else if(cLength < 13) output("<i>“Ooo, packing back there. I hope you know how to go <b>deep</b> and not just hard,”</i>");
	else output("<i>“Oh fucking... why is every spacer packing so much meat these days? You better be... nice...”</i>");
	output(" groans the slaver as she gets a feel for your length. <i>“You know what, make it easier for us both. Ever bred a Cylirian before...?”</i>");
	
	if(x >= 0) pc.cockChange();

	output("\n\nYou can’t say that you have and shake your head. The slaver takes the initiative and leans forward enough so that your [pc.cockOrStrapon " + x + "] slips between her legs and rubs against her wettened gash. Immediately, tension and deep heat spread throughout your tool as if you were already close to orgasm! There’s no sensation of climax though, just the reaction from your shaft... interesting!");

	output("\n\n<i>“Mmmyeah. Cylirian breeding lasts for </i>hours<i> at a time cuz of our more... feminine fluids. We don’t really have hours but a quickie on the side couldn’t hurt, right?”</i> she says with a grin as she rocks her dripping slit against your [pc.cockOrStrapon " + x + "]. As if you could say no to that.");

	output("\n\nOnce satisfied with lubing your shaft and [pc.cockOrStraponHead " + x + "], she does her little leaning trick and realigns cock-to-ass. Jeez, for such a domme, she really does know her way around pleasing cock. Pushing that ephemeral thought away, you guide your [pc.cockOrStraponHead " + x + "] to her hole and sink your weight. The needy pucker gives instantly and you’re treated to the sounds of a whining moth-domme taking your length. ");
	if(x == -1) output("<i>“Mmmmnot bad for fake cock. Now if you know how to use it...”</i>");
	else if(cLength < 7) output("<i>“Thaaaat’s it Tiff- I mean, yeah... that’s the stuff,”</i>");
	else if(cLength < 13) output("<i>“Ngggg, that’s good cock. Gotta bully Tiffy into growing his later,”</i>");
	else output("<i>“C-careful! I’m not used to big ones,”</i>");
	output(" comments the Overseer, hastily biting her lower lip as you fill her out. You keep going until your [pc.hips] bump against her delightfully soft ass and the <i>most</i> pained wail escapes Maike’s curled up lips!");

	output("\n\n<i>“Yesssss! I-It’s all in there, just keep smmmacking your hips!”</i>");

	output("\n\nNot like you didn’t plan to but you’re in charge here. " + (pc.isTaur() ? "You press your taur body against her so that your pelvis presses against her sensitive ass, careful not to actually crush her.":"You take the flat of your palm and smack her sensitive cheek like every good asswhore deserves."));

	output("\n\n<i>“Ohguuuhhhh...!”</i> is all the slaver whines as her body tenses up in your grasp. Just how sensitive is this ass?! Taking the moment, you draw back your [pc.hips] then thrust deep into her asshole. As expected, the pained note of her whine is drawn out with every impact of your body against her asscheeks. The wet, warm confines of her body squeeze against your [pc.cockOrStrapon " + x + "] with every hump and you make sure to bottom her out each and every time, delighting in burying your [pc.cockOrStraponHead " + x + "] where it belongs.");

	output("\n\nYour [pc.belly] tingles as her tail unfurls and wraps around your middle with a gentle, smooth motion. The flowering tip of her tailcock dribbles with yet more seed and you become strangely hooked with the bulging, visceral squirt of the stuff with every pump and hump you make. You’re compelled to rub the comfortably warm snake of her tail while keeping your other hand on her cheek. On top of deep-fucking her hole so that your [pc.hips] always <i>smack</i> against her juicy tush, you massage the cheeks one at a time to temper the sensitive flesh with a gentle set of fingers.");

	output("\n\nA dirty, <i>filthy</i> thought comes up: just how much can you squeeze out of her at once? You pause mid-thrust and then lean your weight on the bent over moth, sinking your [pc.cockOrStrapon " + x + "] as deep as it can go. Naturally, she pushes back against it, some hint of resistance still flaring in her head. However, you’re up here and she’s down there... inevitably, her back curves in as your insistent pressure squeezes against her sensitive body. In a chorus of algedonic wails, the slavers tail shoots a thick, bulging streak of her hot seed across the ground, far thicker and juicier than the gooey steam it’s been spewing before. You can’t help but laugh to yourself as you realize just how much control you have with your hips.");

	output("\n\nNow cock-deep inside, another filthy thought crosses your mind: why not keep her hilted and just <i>squeeze</i> as much as you possibly can? " + (pc.isTaur() ? "Should be easy with this body, after all. ":"") + "Now she’ll be the one to get her face buried into the dirt.");

	//pcTaur:
	if(pc.isTaur()) output("\n\nLeaning on your forelegs, you lower yourself down so that Maike’s entire body is pressed into the ground and her legs splay out from the sides. You’re so hilted inside her that it wouldn’t be too difficult to pull her up by your shaft! But no, you’ve got things to do aside from the actual ‘thing’ you’re ‘doing’. The compromised Overseer whines under the physical pressure and grabs your forelegs ankles for support.");
	else output("\n\nYou rise to a squat with your [pc.cockOrStrapon " + x + "] still buried within her. Then, you lean your weight forward and plant your palms onto the ground just before her shoulders. Your bodyweight lays on top of the hapless moth-domme and presses her further into the ground. The compromised Overseer whines under the physical pressure and digs her claws into the ground.");

	output("\n\nNow in the right position - hilted deep within her booty and with your body pressed on her - you recapture the deep rhythm you began with in seconds and use her physical resistance to force as much of her juice out of her as possible. Although that natural lube she slathered your shaft with has mostly worn off, you’re still intent on giving her the ‘Bred By Steele’ brand. You mumble all kinds of slurs and dirty thoughts about ‘breeding ass’ and cumbuckets as you plow away, your heart racing with adrenaline and energy as you pound this once-proud domme into the ground. Fuck, you’re getting pretty close!");
	output("\n\nIn a miss-matched chorus of your rough grunts and Maike’s delirious moans, your orgasm bubbles up from deep within! " + ((x >= 0 && pc.hasKnot(x)) ? "With one last hump, you bury your [pc.knot " + x + "] into her and give in to the moment!" : "With one final hump, you press your body against her as you give in to the moment!"));

	//pcHasCock:
	if(x >= 0) 
	{
		var cumQ:Number = pc.cumQ();
		output("\n\n[pc.Cum] erupts from the [pc.cockHead " + x + "]: hot pulses of overwhelming sensation thump across your body as you bless her with your seed! ");
		if(cumQ >= 300) output("The tight confines fill out all-too-quickly and it’s only a moment before your shaft is bathed in your own sauce.");
		else output("It pools against the tight confines and warms your [pc.cockHead " + x + "] in sensuous, liquid heat.");
		if(cumQ >= 4000) output(" Of course, you’re a special case. Your juicy orgasm continues as you just keep filling her up with more and <i>more</i>, adding genuine weight and shape to her ground-kissed belly.");
	}
	//pcStrapon:
	else output("\n\nThe hardlight sends wave after wave of sensuous feedback up your spine, forcing your mind and body into a heady convulsion that buckles you over.");

	output("\n\nMaike’s tailcock jerks limply on the ground by both of your sides, nothing left to give after that last hump forced a genuine pool of the syrupy breeding juice out of the wilting tip. As to Maike herself, she simply gasps in exhaustion underneath with her eyes rolling back into her head, both completely spent and completely filled" + (x >= 0 ? " by your [pc.cum]":"") + ".");

	output("\n\nYou hold yourself against her as the heady, post-coital wash slackens your bodies. Your [pc.face] is in a constant smile as your combined bodyheat spreads through your tender nerves like a gentle balm. And to think that you were at each other’s throats not so long ago.");

	output("\n\nYou keep her held to until your [pc.cockOrStrapon " + x + "] wilts on its own accord. With a groggy step, you pull your shaft out of Maike’s well used tailhole and sit down for a breather. You take in the messy picture of [pc.cum] and a gaping moth-hole, satisfied with your efforts in plowing ass- uhh, doing the right thing in the face of inequality, yeah that. The spread-flat, panting form of the moth-domme barely moves save for a few limp flicks of her wings and tail. By her side is the syrupy thick pool of her pure-white seed: must be a good two or three gallons going on there...! She really <i>was</i> pent up, to the point where you wonder how she was able to sit down, walk, rest easily or-");
	output("\n\n<i>“Mmmheeeey Tivfff, where’s Tivf, Tiffy,”</i> moans the Overseer as she tries to get to her feet. <i>“Make sure he’s... okay... gotta get out of here...”</i>");
	output("\n\nAs she lays there in a gooey mess, you consider whether you should help. Quickly though, you realize that a slaver’s still a slaver: you’re not gonna help her more than you already have. She just can just sort herself out. You re-equip your gear, then ready up.");
	output("\n\n");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",maikeNextThing);
}

//Spank Her
//No requirements. Raises PC lust by 30 points.
//tooltip: Cruel poetic irony. Why not break her in spirit too? She’s already been beaten in body and worn out in mind.
public function spankDatMaike():void
{
	clearOutput();
	showMaike(true);
	author("SoAndSo");
	output("You rub your hands together in glee: perhaps to most, a spanking would be nothing so special but to a beaten domme with <i>quite</i> the sensitive behind? One so desperate to get off? You can’t pass that up.");
	output("\n\n<i>“Sure, I’ll help. If your body works the way I think it does, that is. Keep those hands where I can see them,”</i> you instruct to your defeated foe. She’s quick to comply: the Overseer folds her arms under her chin and stretches herself out along her front. Her wings splay out to the sides and lie motionless while her snaking tail stretches out to the right. The plated cock-tip wilts against the ground and trickles of fluid continue to spool in strings. The moth-domme says nothing all the while, as if ready to accept whatever it is you have in mind.");
	output("\n\n<i>“What’s all this? Where’s the proud warrior spirit gone? Now you’re just turning over at the slightest push,”</i> you taunt, kneeling by the spread out slaver.");
	output("\n\n<i>“Just do it! Whatever it is, just do it!”</i> she wails into her arms. <i>“I cah... can’t even think being all pent up...! This is distressing enough as is...”</i>");
	output("\n\n<i>“Say please,”</i> you chuckle. A simple ploy but you know it’s going to ruffle her.");
	output("\n\n<i>“Nnnnffmmmpleeeeeheheheeeease!”</i> she whines as her legs kick against the ground like a true brat. Damn, you didn’t even have to <i>try</i> to make this one beg. It’s too easy to grin at her sudden change in personality but to be fair, you did put her through your own version of hell to do it. Even so, you know how to start this: she’s had such a <i>hard day</i> at work ensuring the forced servitude of who knows how many poor souls, let’s start easy.");
	output("\n\nYou start at her shoulders and trail your fingertips across the muscle lines. Despite her soft-looking skin, there’s a genuine, wiry muscle underneath that seems to connect to her wings. You dab and press it gently out of curiosity and the wings do indeed flutter for a split second. You draw lines across their shape and follow the light bulge down to her spine. There’s a tiny, muffled murmur from the owner, encouraging you to keep going. Your tips continue to trail down her spine until it reaches the lip of her corset armor. The sleek, ultra-flexible material is only skin-thin so the transition from blue flesh to silver surface is smooth. You continue down her spine until you reach the base of her coiled up tail, noticing that her corset does practically nothing to cover her behind. It merely acts as a connective for her thin thong but you reconsider trying to remove it: there’s something strangely appealing about <i>not</i> touching the needy moth’s nethers.");
	output("\n\nFinally, your [pc.hands] reach the true prize and come to rest atop it: the slavers jiggling, soft ass. You notice that it’s a slightly lighter shade of blue than the rest of her and the way it wobbles as you brush your hands against it... not quite like a more typical tush.");
	//pcReadCylirianCodex: 
	if(CodexManager.entryViewed("Cylirians")) output(" Oh duh, that’s where the cum’s kept! Biology sure is a strange and fickle beast. The realisation hits you that you were subconsciously planning this route all along...");
	else output(" It’s almost like a bag of warm gel, something you think of when your fingertips depress ever so slightly into her skin.");

	output("\n\n<i>“Ahmmmm...! Mmm...”</i> moans Maike as you brush your digits against her skin. You’re barely touching her now but what you have planned would make her <i>scream</i> for sure. <i>“You’re just torturing me, you... filth...”</i>");

	output("\n\nYou hear ‘filth’ but the way she says it - softly and with a ‘flick’ of a feminine squeak - seems more needy and desirous than anything. You don’t say a word and simply press your fingers into the same spots again, drawing another muffled whine out of the moth-domme’s covered mouth. Her thighs tremble and shake as you keep your fingers pressed into the squishy mass, the surprising heat being all too inviting to shy away from.");

	output("\n\n<i>“Stoooppmmmmm,”</i> whines the slaver, desperately trying to cling to some dignity as she gives in to your fondling. You add in your thumb to the motions, using the flat side to massage large circles across the super-soft ass flesh. It’s quite the sight to see a once-superior foe lose purely to her own inhibitions and you can just imagine the reaction when you roll out the next phase of the plan.");
	output("\n\n<i>“Hey, slut-butt,”</i> you call out with a tender squeeze of her cheeks. The glassy eyed slaver turns her head to you with the all the timid motions you’d expect from a well-trained sub. There’s uncertainty and weariness across her face and it’s made all the sweeter as you hold out the flat of your palm. <i>“You didn’t think I’d pass this up, right?”</i>");
	output("\n\nThe Overseer winces and goes back to burying her face into her arms.");
	output("\n\n<i>“Jusssst do it. You’ve grounded me, taken my tools of office, mocked and taunted, now you’re torturing me. Torture! Awful, mean, nasty, cruel... painful... whatever,”</i> sighs Maike, her tail flicking and beating against the ground insistently. From the way the exposed cock rubs against the soft earth amid its own pooling juices, it seems the slaver... might just be getting off on this.");
	output("\n\nYou snap your gaze on the bundle of fibres and spines that make up her ‘hair’ and get the notion to grip it. With a free hand, you grapple the long bundle and let it slide along your palm until you reach the middle, giving you a good foot of ‘hair’ to work with. You test her reaction by pulling on it firmly but slowly and then holding it in place. The slaver goes with the momentum but doesn’t make a sound: she merely turns her head to show the annoyance marbling her face.");
	output("\n\n<i>“Unlike you, whoever the <b>fuck</b> you are, we don’t have pain receptors in our quills. All you’re doing is giving me a sore neck,”</i> comes the terse response. <i>“Save us the tedium and embarrassment and just... do it alre-!”</i>");

	output("\n\nAt that, you strike her right cheek with a hefty palm. The Overseer squeals in a high pitch mid-sentence and kicks her claws against the ground as your palm slaps against her inner testes. You keep her hair pulled so that her head is held high and her voice rings ture through the cavernous pit. Maike whimpers as the shock of being hit in such a sensitive place sends jitters through her nerves but what it does to her cum output is <i>quite</i> the show: the body-length appendage slaps against the ground and a thick, globular string of her syrupy seed shoots across the earthy ground!");

	output("\n\nYou’re quick to follow up. With your hand drawn back, you realign with her other cheek and bring another powerful <i>smack</i> to her rear. Caught in her second whine, you grip the same cheek with your fingers and squeeze the soft, jiggling peak like it was your own. The more you squeeze, the more her legs tremble and shake. Your fingers catch onto muscled tubes buried within the skin and you trace your thumb to where they end: the base of the tail. Sure enough, squeeze her ass not only draws out more of a pained whine but forces a thick burst of her aromatic breeding juices out of her snaking tail. The oozing liquid has now created a mushy puddle that slowly snakes towards the walkways incline, a testament to just how much she’s got stuffed in that body of hers. Even with the sizable, juicy cheeks in your palms, draining her fully might take a while... but what if you spanked her <i>really hard</i>?");

	output("\n\nYou ready up another strike and let loose. <i>Smack, smack, smack</i>. It’s an alternate rhythm of methodical, precise spanks that leaves gel-like imprints against Maike’s light-blue flesh. <i>Smack</i>. Each time you land a hit, the slaver whines and kicks her legs up and with each pump of cum, her behind shrinks in size. <i>Smack, smack, smack</i>. The precise intervals generate an easy, pleasing flow of her sperm along with more of her tartish moans. <i><b>SMACK</b></i>. This one hit has enough power to shunt her further into the dirt. Even so, the ear-splitting scream she makes is tinged far more with lust than with pain. You temper the strike with a gentle follow up, eager to massage the reddening, sumptuous posterior. Gentle turns into a fondle, her supple booty-flesh becoming as addictive as a stress ball.");

	output("\n\n<i>Smack, smack, smack, smack, smack</i>. Right and left, always ending with a firmer squeeze of her cheek each time. Those whines of hers choke midway with gasps of arousal as the Overseer is fully immersed her hidden weakness and passion.");

	output("\n\nYou keep the pace up of the intermittent smacks, stringent in your rhythmical timing. Three, gap, one, gap, three, gap, hard one, fondle, five. Aside from the warm sting building in your palm that makes you grunt with every new strike, you keep yourself silent while your moth-bitch begs for your firm hand. It’s not long before you’ve built up a healthy red burn against her blueish cheeks and you’re even more surprised by how much darker they’ve become. You look over to Maike’s mindlessly swaying tail and the ungodly stream of her wasted cum has splayed into a piece of wild, abstract art.");
	output("\n\nYeah, she’s probably done. <i>Probably</i>.");
	output("\n\nWith a combined yank on her hair and one bone-heavy, brutal smack against her now-firm cheek and push her head into her arms.");
	output("\n\n<i>“Annggggg! Guhh!”</i> growls the slaver as your final blow hits home. You immediately go into ‘tender’ mode, using your palms to kneed and massage the purplish-red bruising that’s quickly taken up the fleshier parts of her curvy derriere. The thoroughly defeated slaver whimpers in a high pitch, completely limp and drained in your hands. You keep the tender fondling to only the least-bruised areas, a little remorseful that you effectively busted her balls.");
	output("\n\nYou exhale slowly as you flex your " + (silly ? "pimpin’ ":"") + "hand and wrist, mindful of the sting but comfortable knowing you did the most damage. Seeing that she’s done and thoroughly burned out by it all, you push yourself off of the ground to leave.");

	output("\n\n<i>“Mmmmtiffy, gotta find Tivf... show him how to use a... paddle... and get off this rock,”</i> mumbles the downed moth-domme, lost to her body’s own sensations. There’s a slight niggle in the back of your mind prodding you to ‘help’ yet... frankly, you just did.");
	output("\n\nHey, if she can handle a hordes worth of slaves day in and day out, she can handle herself.");
	processTime(30);
	pc.addHard(2);
	pc.changeLust(30);
	output("\n\n");
	clearMenu();
	addButton(0,"Next",maikeNextThing);
}

//Tail Feed
//Requires tail-vagina, greyed out otherwise. Raises lust to max, PC gets appropriate status effect for a filled tailcunt. 
//tooltip: {/pcNoTailVagina: You don’t gots a tail-cunt, friend. //else: Goddamn, your [pc.cuntTail] won’t calm down! It sees a breeding partner and just wants to get in on that thing...!}
public function tailFeedMaike():void
{
	clearOutput();
	showMaike(true);
	author("SoAndSo");
	output("<i>“‘Sup, girl?”</i> you say out loud as your [pc.tailCunt] swings around hungrily. There has to be something it senses from the grounded moth-domme and - with a little inner intuition - you’re quite sure it’s the slaver’s tail cock. Now wouldn’t that be a twist: dominate her by <i>receiving</i> her. <i>“We’re on the same wavelength, eh?”</i>");
	output("\n\nYou step over Maike and ");
	if(pc.isNaga()) output("balance yourself over her with your naga body");
	else if(pc.legCount == 1) output("spread yourself out over her");
	else output("plant your [pc.feet] to either side of her hips");
	output(". You lower yourself onto your palms so that your body gently presses against her back, [pc.chest] with loins lined up across her back muscles and spine.");
	output("\n\n<i>“Peekaboo,”</i> you chirp over shoulder as the slaver tries to turn her head to meet you. <i>“Sure I’ll help, sure. Absolutely. As long as you play along.”</i>");
	output("\n\n<i>“What do yo-</i>ACH!<i>”</i>");
	output("\n\nBefore she finishes her words, you wrap your hands around her swept-back horns and yank them down. The most she manages is a gasp as your assert control over her head and thus, her entire body.");
	output("\n\n<i>“Mine now, right in my hands,”</i> is what you whisper into her membranous ear. <i>“But hey, they’re good hands. You’ll be fiiiiine.”</i>");
	output("\n\nThe Overseer grumbles about ‘ideas above your station’ and other blue-blooded idioms through gritted teeth. You merely giggle all the way through her developing monologue and it’s simply making her build on it if anything. All the while, your wild-minded tail slinks around on impulse and hoops itself around the slavers blooming tail-orchid. Like some sort of reptilian predator, it wastes no time in teasing its prey with ‘bites’ and ‘strikes’, although it’s something more akin to kisses and aggressive labial massages. Your [pc.face] flushes as the sensitive organ sends its feedback straight down your spine and Maike is already whimpering as her sensitive, spewing cockhead is teased. It’s quite the bold move: her tail is easily a good deal longer to yours, an anaconda compared to your king cobra.");
	output("\n\n<i>“Better know h-how to handle me,”</i> grimaces the slaver as you pull back on her horns. <i>“I can feel what you’re doing and you’re beyond crazy...”</i>");
	output("\n\nCrazy but in control, a dangerous outlook for her. It’s difficult to stop your [pc.tailCunt] though as it’s already sopping at the slit for that moth-cock. Without even thinking, you plunge the needy orifice right onto the pointy head and bathe in the sensation of being stretched by her alien appendage. You can’t help but groan in delight as the parted hole sinks down the thick, undulating tail and stretches out to accommodate the width. Conversely, the Overseer sounds more like she’s in pain than anything as your tail-pussy tightens around her surprisingly sensitive shaft.");
	output("\n\n<i>“Fuucckkkkk, it’s the bearers coming back to haunt me! Draining me dry and stealing my... my seed!”</i> is what Maike babbles as the puffy, lubed folds of your hungry tail-cunt bump against her orchid-bloom of a cock. The plates that protect it close loosely around your tail, as if fearful of upsetting or disrupting your charge to drain this needy moth-bitch dry. What a curious reaction.");
	output("\n\n<i>“Sooohohoho, what’s with this sudden turn? I never thought a pussy could be </i>too<i> tight but I guess if you’re tightening up this much in your shoulders...”</i> is what you say to mock her, giving her right shoulder a pretend massage to rub your point in.");
	output("\n\n<i>“Goddamn knew anyfuh- thing... you ever met a ‘bearer’ of my race, fucknut?! They train their tails just to ensnare and control the sires at their weakest! Every breeding is a fight for the top spot and you already <b>nggg-</b>... you already beat me down! Just take what you w-want out of me,”</i> sputters Maike in between pained moans. You’re feeling the stretch in your tail of course but it’s not something you’ve really ‘trained’ it for. Maike might just be revealing a deeply personal fetish...");
	output("\n\n<i>“You’re really eager to admit that, even more so to let me just throw around this bombshell body of yours. Just admit it already: you like it,”</i> you half-whisper as you pull on her horns. You pull all the way until your [pc.eyes] meet her glassy, sun-kissed orbs and look her dead in the face as the question is left hanging in the air.");
	output("\n\n<i>“Fffuck you, I donnnnnnggggnuh-”</i> is all she can wail as you slow your tails massaging. Up until now, her output has been as steady as before but your slower movements squeeze big, syruppy globules of her seed as if it were a natural cause and effect.");
	output("\n\n<i>“Hmmhmm, your tail says it all even if you won’t. Do you dream of going back home, getting beaten to the ground while a big femme takes you to town?”</i> you taunt, squeezing your tail down around the drooling tailcock to punctuate your point. The slaver doesn’t even respond as her eyes roll back into her head: how could her admission be any more clear? You regulate the rhythm of your tail’s massaging motions and grind your [pc.crotch] against Maike’s back as if you own that shit." + (pc.hasCock() ? " There’s a serious urge to just whip out your [pc.cocks] to take her buuut that would defeat the point of your display.":""));
	output("\n\nThere’s an addictive quality to admonishing this criminal while she squirms beneath you. You’re aware of how quickly she’s filling your miss-matched tailcunt with her juices but who are you to deny its urges? If you can still move it, you can still use it. Your hungry tail sucks and squeezes on its ensnared moth-meat as if it were starved for cum, groaning away behind you as it takes its fill. It’s a real effort to hide your arousal from your temporary sub but keeping your gaze locked to hers while you pull on those horns helps.");
	output("\n\nA sudden twinge, a <i>painful</i> one, hits you at the base of your spine. Your [pc.legOrLegs] jitter" + (pc.legCount == 1 ? "s":"") + " and tremble" + (pc.legCount == 1 ? "s":"") + " from the strange sensation while the twinge turns into an ache. With a quick look over your shoulder, it’s plain to see the culprit: your tailcunt is so stuffed with alien seed that it’s bulging against your spine with nowhere to go! You groan out of disappointment, secretly wishing that you could just keep more and <i>more</i> to rub it in her face.");
	output("\n\nRubbing it in her face... <i>ohohoho</i>, yes.");
	output("\n\nYou slowly wrestle your gorging tail free from its food source, the tight seal caused from all the " + (silly ? "SUCCCCC":"sucking") + " proving difficult to pull away from seamlessly. It comes free with a splatter of thick juices that spool between the slavers inner thighs, barely contained by your well-stretched and well-stuffed tail-pussy.");
	output("\n\nMaike simply gasps in relief. Her body goes limp underneath as her drained tail flops and coils against the earth in a jerking heap. You keep ahold of her horns but shimmy yourself a little further up her back while she takes a breather. With what you’ve got in mind, she’ll need it.");

	output("\n\n<i>“Bottoms up,”</i> you chirp after a quick minute, carefully swinging your cum-bloated tail around to the Overseer’s gasping mouth. She can barely get a sound out before you smash that cum-slick entrance of a [pc.tailCunt] against her purple lips! Maike whines and kicks her legs against the ground as you tip her horns back, allowing a smooth, slick flow of her own seed to gush across her face and lips. Her tongue lashes against your still-sensitive folds in some instinctual effort to drink the free-flowing fluid and you swear she’s just protesting with moans to hide her dirty, debased passion.");

	output("\n\nHowever, half a minute in and you realize there’s an awful lot more stuffed inside your tail than you first considered. Out of frustration, you let go of one of her horns and instead squeeze down on the gooey, internal lumps that bulge through your tails length. Each squeeze feels like some mini-orgasm that you bite down with disdain: you beat her, gotta look strong, gotta not give in. Maike’s recycled seed pools under her white-bleached chin and one last idea pops into your head.");

	output("\n\n<i>“Didn’t <b>finish</b>, bitch,”</i> you grunt as your force her face into the puddle with a push on her horns. <i>“Eat it!”</i>");

	output("\n\nThe slaver can only whine as her still-hanging tongue is pulled out of your tail-slit and pushed into the mixed-fluid cum puddle. Still in lick mode, she just keeps at it! Hungry lapping intersperses with her murmuring approval and you can only chuckle at how much she’s into eating her own defiled cum.");
	output("\n\nBreathless and satisfied, you finally let go of her horns. A sense of mild accomplishment colors your mood: beating down a big bad Overseer and forcing her to eat her own cum out of your tail-pussy... in a way, it was meant to be.");
	output("\n\nYou dust yourself down and tenderly push yourself off of the slaver’s spread out body. She says nothing as you do, still lost to her newfound need for her own cum. Your tail is satisfied having retained some of her sweet-smelling seed, that’s what matters here. She can handle herself, right? Or at least once she gets over her new obsession.");
	pc.changeLust(100);
	output("\n\n");
	pc.addHard(1);
	processTime(20);
	feedCuntSnake(enemy);
	clearMenu();
	addButton(0,"Next",maikeNextThing);
}

//Leave
//tooltip: Well, if she managed an entire operations worth of slaves, she can sort herself out getting off of this rock. You got shit to do!
public function leaveDatMaikeBehind():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	output("You probably could do something to her but the satisfaction you’d gain wouldn’t even be worth the energy used to take it from her. Just a scummy slaver after all.");
	output("\n\n<i>“Nah, not even worth it,”</i> you say with a shake of your head.");
	output("\n\n<i>“Ngggnooo! Help meeeee, I cah... can’t even think!”</i> is all Maike can repeat. Her wilting tail snakes around to her mouth and the spirit of desperation talks hold of her as she kisses, licks and sucks at her own tail tip.");
	output("\n\nHow pathetic... you can only imagine what would happen if the slaves found her like this.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",maikeNextThing);
}

//[Next]
//30 Mins in-game time passes.
//Im not sure where this connects.
public function maikeNextThing():void
{
	clearOutput();
	showName("THE\nSPOILS");
	author("SoAndSo");
	output("Dusting yourself down, you do a quick recon of the area. It’s all quiet aside the gentle hum of a dozen light generators. The closest one is not even ten feet away and there’s... ooo, something on it: a small box");
	//pcReturnInteraction:
	if(flags["MAIKE_HELMET_TAKEN"] == undefined) 
	{
		output(" and some spherical glass thing");
		output(".");
		output("\n\nYou approach the thrumming yellow machine and see that the round object is actually a space helmet. It looks functional if a little old-fashioned what with the big glass dome that makes up its bulk. Even so, you take it from its lonesome spot. <b>You got the space helmet!</b>");
		output("\n\nUnderneath is the black box");
	}
	output(".");
	output(" It’s unmarked and you’re not exactly sure what it could be for. A small slither of paper juts out from the tight seal. Naturally, you pull it out and read.");
	output("\n\n<i>For Tivf - If and when you feel ready.</i>");
	output("\n\n<i>-M</i>");
	output("\n\nHmm. Seems like a gift she left behind...");
	output("\n\nOh well, yours now.");
	//pcNotBoughtIllumorphemeBefore:
	if(flags["USED_ILLUMORPHENE"] == undefined)
	{
		output("\n\nThe lock isn’t even a lock, more of a latch: designed to be opened easily. You flip the lid and the interior is... four vials and some sort of injector. There’s a symbol of a moth-shaped creature on the inside of the white lid. There’s a text disclaimer and descriptor underneath: ‘Illumorpheme - A Moth transformative’.");
		output("\n\nHuhhh. So someone wanted to become a moth...");
		output("\n\nLooks expensive, might as well take it!");
	}
	//else:
	else
	{
		output("\n\nHang on, you’ve seen this before: it’s Illumorpheme. A moth transformative... but the slaver didn’t look like any true moth you’ve seen. A gift for Tivf, hmmm?");
		output("\n\nWell, this stuff is pricey so... might as well take it!");
	}
	output("\n\nHowever, that’s not all. The Overseer’s keycard is laying at your feet. Dislodged during the fight. It’s all yours.");
	output(" (<b>Key Item Gained:</b> Maike’s Keycard!)");
	pc.createKeyItem("Maike’s Keycard");

	/*output("\n\nHowever, that’s not all the treasure there...");
	output("\n\nUnder a dirty cleaning rag is the outline of some sort of device. You lift it up and find a strange gauntlet-type weapon that could easily wrap around your wrist. It has a circular plate that could fit into your hand and seems to be some sort of repulsor. Kind of like the Overseers jets... hmm.");
	output("\n\nWelp, doesn’t hurt in taking it!\n\n");*/
	output("\n\n");
	if(flags["MAIKE_HELMET_TAKEN"] == undefined)
	{
		flags["MAIKE_HELMET_TAKEN"] = 0;
		enemy.inventory.push(new SpacesuitHelmet());
	}

	//[Exit]*
	//*PC gains x1 Space Helmet (if not received before), x1 Hand Repulsor and x1 Illumorpheme.
	currentLocation = rooms[currentLocation].southExit;
	CombatManager.genericVictory();
}

//PC Loss
//Bad End.
public function pcLosesToMaike():void
{
	author("SoAndSo");
	output("It’s no use: despite your skill and bodily ability, the power and ability of the Overseer has left your body a quivering mess of sexual lust. You think nothing of her immediate response as you collapse on the ground: you’re just <i>so horny</i> that your focus fades to a surreal, muted world of bright colors and rather fuzzy hands...");
	output("\n\nThe hands pull at your limp wrists and clamp them together in grav-cuffs. You’re yanked up by the forearms and casually slung over the shoulder of the increasingly blurry Overseer with minimal effort. Something sharp jabs your [pc.skinFurScales] and numbers the area. All the while, epithets and calls of ‘pathetic slave bodies’ echo around as your sex-addled mind is overwhelmed with your own biological urges. You can barely move and thinking... is...");
	//output("\n\n[Uh... Next]");
	processTime(3);
	clearMenu();
	addButton(0,"Next",losingToMaikeHereWeGo);
}
public function losingToMaikeHereWeGo():void
{
	clearOutput();
	showMaike(true);
	author("SoAndSo");
	output("Faces of all kinds.");
	output("\n\nMasks, collars, voice comms.");
	output("\n\nBlack and red outfits, silver suits, robotic limbs, generic uniforms.");
	output("\n\nYou’re dimly aware of all this that passes you by as you’re taken away by the Overseer to somewhere within the pirate port. The harsh grey of the hallways turns into a surprisingly warm palette of reds and pinks as you’re whisked away into some new realm entirely.");
	output("\n\nAnother pair of hands joins in the effort, placing you dead in the center of this narrow and mirror-dotted room. All of your possessions are stripped away in a methodical and invasive flurry of dainty fingers and clawed talons. Someone grabs you by the jaw and comments on your glazed, grinning expression while holding a syringe to your arm. There’s the familiar dull ache of a needle jab and nothing more. You’re still so heady from being overstimulated that it’s simply another ‘thing’ that flashes past your eyes, its meaning lost in a haze of self-indulgence and unfulfilled need. You can’t help but rub your [pc.legs] together as deep, deep euphoria sets in the more you dwell on it all. It’s all quite nice, being head over heels with your own body in such a detached way.");
	output("\n\nYou can only laugh.");
	output("\n\nAnd touch. And feel. You plant your fingers onto the ground and the soft, strange material teases your tips with plush, airy fabric. Just feels nice across the skin...");
	output("\n\n<i>“Uff, look at this filth. Tiffy, cover [pc.himHer] up for me, I can’t bear to look at this scum,”</i> comes a familiar, sophisticated and articulate voice from above you.");
	output("\n\n<i>“Of course, Mistress. I’ll make [pc.himHer] thoroughly dreadful, ahehe,”</i> comes a nervous giggle from a softer, male voice. <i>“Would you prefer the ‘the morning after’ or ‘rejected on the dancefloor’?”</i>");
	output("\n\n<i>“Mm, ‘morning after’. This whore isn’t at all classy, perhaps not even worth the effort. Still, it’s anything goes,”</i> comments the other, female voice. <i>“‘Test run’ and then send [pc.himHer] to the pen, like the last one.”</i>");
	output("\n\n<i>“Right away,”</i> giggles the male voice.");
	output("\n\nA golden, adorable face comes into view as a pair of dainty hands clasp your dopily grinning cheeks.");
	output("\n\n<i>“Let’s get you ready for the slaves.”</i>");
	processTime(50);
	clearMenu();
	addButton(0,"Next",losingToMaikeHereWeGo2);
}

public function losingToMaikeHereWeGo2():void
{
	clearOutput();
	showMaike(true);
	author("SoAndSo");
	output("You’re not quite sure of what happens afterwards. It’s a blur of hands massaging, dabbing and poking various parts of your perpetually grinning face. It’s all cold and vaguely wet, as if something was using your face for some slapdash, abstract art piece.");
	output("\n\nAt some points, an overhead light is shone into your [pc.face] and overwhelms your vision for a few seconds. Harder, pinpoint lines trace across various parts of your face as if the artist had switched drawing medium halfway through the artwork. You’re just too giggly to care, taken by an unnatural euphoria that fuels your ambient horniness. You just want to fuck something so bad, or get fucked, either, <b>no, both</b>. Anything just to feel like this for longer or even forever.");
	output("\n\nYou’re briefly brought into the real world with a harsh slap the cheek.");
	output("\n\n<i>“Slave, wake up. Do. You. Have. A. Naaaaame?”</i> asks the feminine voice. You can’t see much other than a... hehe, a great big pair of tits. Big and blue. With twinkly bits.");
	output("\n\nYou simply laugh in spite of the sting that’s left across your [pc.face].");
	output("\n\n<i>“I think [pc.heShe]’s out for the count, Mistress. Shall I continue?”</i>");
	output("\n\n<i>“Oh yes, definitely. I’ll shuffle [pc.himHer] under ‘unclaimed’, not really interested in keeping this one after all. Cuz I’ve got yooooooou, bee boy,”</i> giggles the feminine voice followed by the sounds of a rather aggressive sounding kiss. Your eyes just about make out two fuzzy figures embraced and a very hands-on fondle: one short and yellow, one much taller and bluish purple. Both have wings... if you ever knew who they were, you mind isn’t willing to play along. Maybe you knew their names, maybe you knew... your name...");
	output("\n\n<i>“Mmm, hands here Tiffy, gentle...”</i>");
	output("\n\n<i>“YesmmmMistressmmm...!”</i>");
	output("\n\nFrom nowhere, you take another slap to the cheek. It stings much more than before or maybe the cloudy euphoria is weaker. The hands and movements of the two figures appear clearer and more defined, elegant and distracting.");
	output("\n\n<i>“Focus, slave! How damned weak is that tiny brain of yours?”</i>");
	output("\n\nThe voice suddenly gains a face: blue, feminine and scowling at you with harsh, orange eyes. There’s a name for that face, you’re sure of it... but whatever it is seems like some distant, blurry echo.");
	output("\n\n<i>“I swear, these ‘adventure’ types just close up when you just slap them about. Is that you, slave? Some sort of roaming vigilante? Bounty hunter? Potential ruiner-of-my-plans? Whatever. Tiff, the cuffs,”</i> mocks the blue femme, ordering her subordinate to perform with a snap of her claw-like fingers. Wait... claws. Moth. Wings. Boobs... Overseer.");
	output("\n\nYou’re in the clutches of the Overseer. Uh oh. Yeah, something overseen... bad stuff. You shake your head from side to side as the euphoria melts away. Your limbs are still weak and moving anything, even your jaw, feels more like everything is ‘floating’.");
	output("\n\n<i>“Iiiiiiuhhhh...”</i> is all you can slur, making a similar noise when the svelte bee boy pulls your hands into your lap and ties your wrists together. He pulls down on a hitherto unseen rope and binds it to the wrist-tie. He pulls on the makeshift pulley with all his bee-boy strength and manages to get your wrists to dangle far over your head.");
	output("\n\n<i>“Done, Mistress,”</i> he chirps while standing to attention.");
	output("\n\nThe blue femme clears her throat and twirls her finger at your cheek.");
	output("\n\n<i>“Oo-oohh. Yes...”</i>");
	output("\n\nThe bee-boy timidly pulls his hand over his shoulder, only to let loose and backhand your other cheek. The sharp stab of skin-on-skin hurts more than the actual slap, not even enough to make you wince. He hums in frustration and rubs the back of his hand: apparently it really did hurt him more than it hurt you.");
	output("\n\n<i>“Ehhh, it was an attempt, my sweet. Definitely an attempt. Thing is, how are you going to be the Prince of Spanklandia with such a weak form in slapology? You’ve still much to learn from the Queen.”</i>");
	output("\n\nOn ‘Queen’, a nasty, quick slap hits you on the same cheek. The sting and heat from the impact flushes your face with endorphin-rich warmth, setting you into a light giggle once again. Pain feels real good right about now...");
	output("\n\n<i>“See? Needs bite and intent. That’s all for another day, however. We’re not allowed to damage these goods. So how do <b>you</b> want to use [pc.himHer]?”</i> comes a direct question for the timid bee.");
	output("\n\n<i>“Ummmm...”</i>");
	output("\n\nThe bee boy’s dainty pair of hands prod and poke at your extremities as if testing for something. Tivf. Tivf is... is that the name? You heard Tivf somewhere, you’re sure of it. That thought is quickly derailed as he just keeps poking, especially at your [pc.chest].");
	output("\n\n<i>“Ahehe, soft. Not tough like </i>my<i> chest. Silly starfarer thingies. Ummmm, I would like tooooo use the mouth?”</i> he says after a pause. A finger slips into your agape mouth and runs across the [pc.lip] as if to test it for some other purpose. Mmm, you slowly close your [pc.lips] and suckle on the slim digit as it easily glides across your tongue.");
	output("\n\n<i>“Ohoooo, yes, the mouth! [pc.heShe] is very good, verrrry good,”</i> chimes the bee boy as he openly gropes his bulge.");
	output("\n\nYour vision clears up enough to take in the full view of what you’re seeing. The gold-and-black bee holds his fingers to his lips as he yanks and fiddles with a burgeoning stiffy, the skin-tight bottoms covering his cutesy bulge being all too easy for him to just slip out from.");
	output("\n\n<i>“There’s my big boy, ready for a royal suck,”</i> giggles the much larger moth-queen as she reaches around his girly, curvy hips and takes over fondling duty. ");
	output("\n\n<i>“Mmmmuhmistressmmm,”</i> is all the willowy bee murmurs as she steals his painted lips with hers. In her expert hands, his golden boy-cock throbs into its full stride to a tasty 5\" and gets its full fill of her skill with each pump. Satisfied with how ready her sub is, the blue moth guides him forward and lines him up with your [pc.lips]. On his own accord, he sinks his girlish hips forwards and spreads your mouth apart with his pulsing rod. You’re in much to addled a state to say anything but even so, the gentle push and alien flavor is more like an invitation to suck than anything. His hands come to rest on your cheek and [pc.hair] which helps him balance as he slides his his boyshaft all the way to the hilt with a little ‘Iiihh!’ sound. You keep your eyes focused on his blushing face all the while, innately wishing to please this cute little intruder.");
	output("\n\n<i>“Good <b>boy</b>,”</i> grunts the moth as she penetrates his tight trap-hole with her thumb. He squeals aloud as his plump butt is explored by his moth-mistress and a dribbly spurt of pre-cum hits the back of your mouth. You find that the moth-femme is now at eye level and she grins at you with her devilish visage. She licks the side of her bee’s hip with an uncomfortably long, thin tongue and you spy the claws of her penetrating hand cupping and fondling his tight trap-sack from underneath.");
	output("\n\nNow in several different clutches, the bee-trap has no choice but to hump your [pc.face]. With his hands gripping your head, he pushes and pulls you backwards and forwards with immediacy. His soft head constantly hits the back of your [pc.tongue] as he works your mouth like a pro, almost as if he had owned you for years and knew how your body works. His little gasps and moans dot with squeaks as his leering mistress hits a sensitive spot deep in his boyhole, treating you to a tiny spurt of his salty-sweet honey cream each time. You do your best, of course: [pc.lips] squeeze against his veiny shaft and you can’t help but murmur in delight as his head slides so cleanly and smoothly against your [pc.tongue]. Mmmm, cooooooock...!");
	output("\n\nThe bee’s shaft massages your tongue with such a regular rhythm that deep down inside, you just wish it was another breeding hole. <i>Feeling</i> such a nice, tasty tool fill your mouth-cunt is a fantasy so wild you become lost to it while he and his mistress thrust into you.");
	output("\n\n<i>“I think you and [pc.himHer] are ready, mm? We’re on a timer, soldier, so a break-neck test is needed,”</i> croons the moth as her subby bee rolls his cock out of your mouth. You savor the flavor of what little of his honey-tinted juices rest against your [pc.tongue], happily lost in a familiar moment of fuzzy euphoria.");
	output("\n\nOut of nowhere, your lower body is yanked forward and stretched out across the ground. Some sort of mechanism or anti-grav device smooths the transition but now you’re hanging by your wrists and ankles in the air! Another tight bond forms around your [pc.belly] as the moth-domme and her bee boy suspend you on a horizontal plane. Once finished, the two peer over your face like curious cats over a fish pond.");
	output("\n\n<i>“What next, Tiffy? What does your cock say?”</i> giggles the femme.");
	output("\n\n<i>“Mm that tongue. I just want that tongue! It’s like Mistresses most delicious pussy but just... nggg, it moves too! I want tooo sit on her face,”</i> he giggles in accord, quickly turning around on the spot so his shadow blots out the light. What rears up is a peachy, plump boy bottom that jiggles and flexes as he plants his spread cheeks onto your agape mouth. His tight bee-hole is the only place for your [pc.tongue] to go thus your mouth muscle slides into his sphincter without deviation. You hear and <i>feel</i> his squeals of delight shake him down to the bone and he immediately sets to work with using your face as his personal seat. The soft weight of two tight balls smother your sight and you’re left with naught else to do but take his joyous booty-grinding.");
	output("\n\n<i>“Yesssssssnnnng! Mmmistress, it’s so good! " + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "It’s so big and thick like a dick!":"[pc.heShe]’s all warmed up and squiggly, it’s so niiiicccce!") + "”</i> whines the girly boy-slut as you’re officially mandated as the royal seat for His Highness.");
	output("\n\n<i>“Delightful, I’m glad you approve. Now if you have one end, I’ll take the other...”</i>");
	processTime(30);
	clearMenu();
	addButton(0,"Next",badEndingWithMaikePartWhatever);
}
public function badEndingWithMaikePartWhatever():void
{
	clearOutput();
	showMaike(true);
	author("SoAndSo");
	output("You’re pulled down by the waist as an entire body clambers over your [pc.belly]. You sink under this new weight and it very quickly... gets... heavy!");
	output("\n\nYour air flow quicks and thins as the moth-domme quickly gets settle with you as her new seat. With a mouthful of boy butt and a whole moth-woman holding you down, your mind ramps from gentle pleasure to a fight for breath!");
	output("\n\nSomething long and snake-like wraps itself around your [pc.legOrLegs] and brushes its smooth, scaly exterior over your [pc.ass]. In seconds, the thick appendage roots out your [pc.asshole] and pushes against it with an even thicker head. Your body tenses up on instinct but it’s not enough to stop the intruder from spreading your ill-prepared pucker from such a quick penetration.");
	output("\n\nYour cries are muffled beneath a wide spread of boy butt as your body struggles to accommodate such the thick snake burying itself into your [pc.asshole]. Something rigid and slimy snaps against your cheeks to seal the writhing appendage inside you and it wastes no time in using all the space your ass can give. New, wet warm constantly spews into your guts from the meaty head and keeps your back passage nice and slick for the invader.");
	output("\n\nThere’s giggles and moans from up above as the two lovers quip and comment about your body.");
	output("\n\n<i>“Mmm, a tight one, I think the boys are going to love this new slut! How about you, Tiffy? What does Her Highness Tivffany think of her new toilet-slave?”</i>");
	output("\n\n<i>“T-Told you not to call me that, M-Mistress! I-I’m a male! A manly m-male”</i>");
	output("\n\n<i>“Oh shush, Princess Tivffany loves it when I spank <b>her</b> and fondle <b>her</b> balls! C’mere!”</i>");
	output("\n\nThe two devolve into laughs and giggles as you can only hear talk of ‘touch me there’ and ‘yeah’ as you’re outright ignored. But your [pc.tongue] just doesn’t let up! It was meant to please His highness, HER Highness, who...what...? It doesn’t matter: you’ve got a taste for bee butt and you’re already tongue-deep." + (silly ? "Remember my friend, the only way you’ll win at life is if you eat ass.":""));
	output("\n\nYour insides strain and groan as they’re not only filled up ever so gradually with hot, oozing liquid but the ache from your lungs numbs you to all else save your cloying, tight body-on-body bondage. Not a single part of you is left unused: no vision, no sight, only the taste and smell of a prim, breathy zil boy. Your arms and legs hold you, your middle supports you and the moth-domme physically crushes you. All the while, your [pc.asshole] is bred by a writhing, snaking tail-cock and bloated with the moths alien seed.");
	output("\n\nCompletely dominated.");
	output("\n\nYou don’t even care for their names, nor even your own. Some softening in your memory kicked in after you took a shot to the arm. You can only think on instruction, desperate for the direction given by the two giggling lovers.");
	output("\n\n<i>“Nggg, I’m cloossse! Wanna cummm!”</i> whines the male voice as his plush ass rocks across your entire [pc.face]. <i>“Plisplispleeease may I use [pc.hisHer] slut mouth?!”</i>");
	output("\n\n<i>“Of course you may, Princess,”</i> jokes the breathy voice and immediately, you’re greeted by the lights of the pink-red room flooding your once-dark vision. It’s a brief moment of cool air before the golden rod of the zil plunges through your [pc.lips]!");
	output("\n\nThe wailing bee hilts his pulsing cock to your mouth and lets loose his orgasm. Delicious, fragrant globules of salty honey pump into your throat from his throbbing shaft and you readily gulp down the precious fluid as if a gift from the gods. His tight sack twinges and tightens with audible groans as he empties his built-up load straight down your gulping gullet. At the same time, the thick tailcock buried in your ass slides out with extreme ease and a gush of hot seed pours out of your stretched-thoroughly used sluthole. Your two ‘friends’ rest breathlessly atop your body, giggling to themselves as their sexual highs meld and mingle into slurred declarations of love.");
	output("\n\n<i>“Tiiiimes up,”</i> exclaims the moth-domme with a hearty spank on her bee boys ass. You can even feel the vibration rock through his rapidly softening cock and into your spine...");
	output("\n\nWith a sigh, he lets his wilted shaft slip free as he rises off of his thoroughly-used seat. He wipes the excess honey juice all over your gasping face and your tongue just can’t help but lick it up. Anything for the princes cum...!");
	output("\n\nA huge weight lifts from your middle and the grinning moth peers over you.");
	output("\n\n<i>“One more pacifying dose for this one and then it’s down to the pen...”</i>");
	output("\n\n<i>“What’s in that medipen, Mistress? Looks spicy!”</i>");
	output("\n\n<i>“Pure, concentrated Dumbfuck.”</i>");
	processTime(60);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",badEndingWithMaikePartWhatever2);
}
public function badEndingWithMaikePartWhatever2():void
{
	clearOutput();
	showMaike(true);
	author("SoAndSo");
	output("You’re not sure of what happens next. Your arm goes numb as if you were lanced with multiple injections and shots but your sense of being, self, awareness... it all fades until all you can think of is... pleasing, heat, wetness, <b>hardness</b>, cum, lots of it!");
	output("\n\nYou come to from this numbed vision to find yourself in a pit, a row of figures in uniforms all standing to attention.");
	output("\n\nSomeone gives a command.");
	output("\n\nAt once, an array of cocks and shafts spill out from tight uniforms and point themselves at you.");
	output("\n\n<i>“Cuh... cooock?”</i>");
	output("\n\nIt’s all you can say.");
	output("\n\nYour tongue slides out of your [pc.lips] and just hangs there as if it expected something.");
	output("\n\n<i>“Cuuuuhhh! Cooock!”</i>");
	output("\n\nThick ones, long ones. You grip them all, taste each one. So juicy, so hard, so many...");
	output("\n\nSucking feels so good.");
	output("\n\nYou can’t wait to go fucking!");
	output("\n\nSucking!");
	output("\n\nFucking!");
	output("\n\nSuhhh....");
	output("\n\nFuh...");
	output("\n\n.....");
	badEnd("(Game Over!)");
}

//PC comes back to the boss tile
//Triggers if the PC ever decides to come back to tile and hasn’t beaten Maike in combat.
public function cumBack2Maike():void
{
	clearOutput();
	showMaike();
	author("SoAndSo");
	output("Aha, you’re back at the big dig pit. Exactly what you’re doing here is your own guess but you can’t help but dwell on some vague, bubbly reason you can’t qui-");
	output("\n\n<i><b>THNK, THNKK</b></i>");
	output("\n\nOh crap.");
	output("\n\nTwo metal rods crash into the ground at your feet and the all-too-familiar flutter of insectoid wings drones closer and closer!");
	output("\n\nFeeling the deja vu kick in, you instinctively back away from the impact zone ");
	if(pcHasSlaveOutfit()) output(" and ready your [pc.weapon]. You’ve got a new way of getting around her now");
	output(". The Overseer lands as dramatically as her first entrance and wastes no time in reeling her grapples in, cycling the ammo with a flick of the wrist and firing a hefty bolas shot towards your middle!");
	output("\n\nAt such short range, there’s no way it can miss and the energy-threaded weights swing around your middle.");
	clearMenu();
	addButton(0,"Next",ohShitMoreMaike);
}

public function ohShitMoreMaike():void
{
	clearOutput();
	showMaike();
	output("Ah Shit!");
	author("SoAndSo");
	//pcWearingSlaveOutfit:
	if(pcHasSlaveOutfit()) 
	{
		output("\n\nWith no immediate protection against such an attack, you’re knocked flat on your back with the bolas wrapped around your [pc.hips]. You struggle to resist the binding, for while it does depower quickly, the Overseer is already on top of you!");
		output("\n\nAs you try to push yourself up by the elbows, she pushes straight back down with her splayed foot forcing you down from your sternum. The air is knocked out of your lungs by the force alone but as she leans on you, it becomes more and more difficult to breathe.");
		output("\n\nThe leering Overseer grins right at you with her whip unfurled in its purple splendour.");
		output("\n\n<i>“Now isn’t this a treat, a slave who actually breaks the rules. What’s running through that head of yours, huh? Why didn’t you obey orders?");
		if(!(pc.accessory is MaikesCollar)) output(" And where the <b>fuck</b> is your collar, slave?!");
		output("”</i> growls Maike with her whip pointed to your throat.");
		output("\n\n<i>“I-I-”</i> you try to force out, only to be cut off by your lack of air.");
		output("\n\n<i>“I don’t even care. You’ve violated our trust, our benevolence and our rules so now I must decide how you’re going to make up for it,”</i> bites the slaver with a hammer of her foot. <i>“Equality in the workplace is a paramount first hurdle for all businesses and it wouldn’t do if I didn’t extend the same violation to you...”</i>");
		output("\n\n<i>“Uhh-”</i>");
		output("\n\nBefore you can protest, you’re flipped onto your back by dextrous claws and the tight clinch of anti-grav cuffs lock around your wrists. The Overseer wastes no time in turning it to a lighter setting and your entire body is wrenched from the ground with effortless grace. In the kerfuffle, she slips a needle of some sort into your skin and the immediate numbing starts... messing... with.... ehh...");
		processTime(10);
		clearMenu();
		addButton(0,"Next",losingToMaikeHereWeGo);
	}
	//else:
	else
	{
		output("\n\nIt’s such a short ranged attack that it’s impossible to avoid, and you’re pushed back to a stagger. As you try to regain your balance while the energy bolas dissipate, the Overseer leaps up with her repulsors and wings only to lunge at you with her feet-claws spread wide!");
		output("\n\nLike a hawk hunting a rodent, you’re pinned underneath two sets of talons with a demonic-moth alien leering over you.");
		output("\n\n<i>“Ahhh, you’re back! I take it you did what I asked, took the suit helmet and went straight to the elevator like a good, little slave? No? Did you instead <b>lie</b>? No matter, I’ll simply <b>make</b> you my slave, my personal stress-tester, something to brrreak,”</i> growls the Overseer with her energized whip help under your chin.");
		output("\n\nAhh shit, what ya gonna do!");

		clearMenu();
		addButton(0,"Fuck You",fuckYouMaike,undefined,"You’re gonna kick her ass! Or attempt to at least!");
		addButton(1,"Ah... Shit",losingToMaikeHereWeGo,undefined,"Giving up probably isn’t the best idea.");
	}
}

/*
output("\n\nSlave Outfit");
output("\n\nLevel 8 armor");

output("\n\nName: Slave Uniform");
output("\n\nShort Name: Slave.U");
output("\n\nType: Armor");
output("\n\nSlot: Armor");
output("\n\nBase Price: 7000");

output("\n\nDefense: 1");
output("\n\nSexiness: 3 (4 with 1 zip undone, 5 with 2 zips undone, 6 with 3 zips undone)");
output("\n\nEvasion: 10");
output("\n\nFortification: 10");
output("\n\nBonus Resistances:");
output("\n\nBurning +20%");
output("\n\nCorrosive +10%");
output("\n\nElectric +10%");
output("\n\nFreezing -30%");
output("\n\nLust -20%");

output("\n\nDescription:");
output("\n\nWhile it’s true that slavery is rife with suffering and brutality, a discerning company will take the proper precautions for health and safety. This sleeveless, orange and dark blue bodysuit is a generic, unbranded uniform for intense manual labor. It’s light and has three, thin layers: an outer weave for tears and rips, a middle layer for electrical currents/corrosive substances/fire and heat protection with an inner cooling layer that adheres to the skin and provides a comfortable, form fitting support for long work hours.");

output("\n\nUnfortunately, this particular suit has rather loose zippers across the chest, pelvis and rear end, adding an incentive for the more ‘hands-on’ slavers.");

*/

//Appearance Description:
public function slavesuitOptionsDisplay():void
{
	clearOutput2();
	if(pc.isChestExposedByArmor() && pc.isCrotchExposedByArmor() && pc.isAssExposedByArmor()) output2("Your chest, pelvic and butt zippers are undone, exposing your [pc.ass], [pc.chest] and loins have to the world.");
	else if(pc.isChestExposedByArmor() && pc.isCrotchExposedByArmor()) output2("Your chest and pelvic zippers are undone, exposing your [pc.chest] and [pc.crotch] to the world.");
	else if(pc.isChestExposedByArmor() && pc.isAssExposedByArmor()) output2("Your chest and butt zippers are undone, exposing your [pc.chest] and loins to the world.");
	else if(pc.isCrotchExposedByArmor() && pc.isAssExposedByArmor()) output2("Your pelvic and butt zippers are undone, exposing your crotch and [pc.ass] to the world.");
	else if(pc.isChestExposedByArmor()) output2("Your chest zipper is undone, exposing your [pc.chest] to the world.");
	else if(pc.isCrotchExposedByArmor()) output2("Your pelvic zipper is undone, exposing your [pc.crotch] to the world.");
	else if(pc.isAssExposedByArmor()) output2("Your butt zipper is undone, exposing your [pc.ass] to the world.");
	else output2("The zippers on your slave uniform are currently done up.");
	output2("\n\n<b>Current Sexiness Bonus: </b>" + pc.armor.sexiness);
	clearGhostMenu();
	if(pc.isChestExposedByArmor()) addGhostButton(0,"Zip Chest",zipSlavesuit,"chest");
	else addGhostButton(0,"Unzip Chest",unzipSlavesuit,"chest");
	if(pc.isCrotchExposedByArmor()) addGhostButton(1,"Zip Crotch",zipSlavesuit,"crotch");
	else addGhostButton(1,"Unzip Crotch",unzipSlavesuit,"crotch");
	if(pc.isAssExposedByArmor()) addGhostButton(2,"Zip Butt",zipSlavesuit,"ass");
	else addGhostButton(2,"Unzip Butt",unzipSlavesuit,"ass");
	addGhostButton(14,"Back",appearance,pc)
}

public function unzipSlavesuit(area:String = "chest"):void
{
	clearOutput2();
	if(area == "chest")
	{
		output2("You pull open the top zippers open to expose your [pc.chest]");
		if(!pc.isChestExposedByUpperUndergarment()) output2(", though you’ll have to do something about your undergarments if you really want to show off.");
		else output2(", letting your [pc.nipples] free.");
		pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
		pc.armor.sexiness++;
	}
	else if(area == "crotch")
	{
		output2("You pull open the crotch’s long zipper to expose your loins,");
		if(!pc.isCrotchExposedByLowerUndergarment()) output2(" though you won’t be showing off much so long as you’ve got underwear on! It’ll probably still with teasing your foes, though.");
		else output2(", letting your [pc.crotch] free in a display of brazen sexuality.");
		pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
		pc.armor.sexiness++;
	}
	else
	{
		output2("You unzip the back of your jumpsuit to display your [pc.ass]");
		if(!pc.isAssExposedByLowerUndergarment()) output2(", but with the underwear you’re wearing, you won’t be offering easy access to your [pc.asshole] just yet.");
		else output2(" and [pc.asshole] to the world. Whatever mischief you get into, you’ll be ready for a quick anal pounding!");
		pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
		pc.armor.sexiness++;
	}
	pc.armor.hasRandomProperties = true;
	clearGhostMenu();
	addGhostButton(0,"Next",slavesuitOptionsDisplay);
}
public function zipSlavesuit(area:String = "chest"):void
{
	clearOutput2();
	if(area == "chest")
	{
		output2("You zip up the chest of your slave uniform.");
		pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
		pc.armor.sexiness--;
	}
	else if(area == "crotch")
	{
		output2("You zip up the crotch of your slave uniform.");
		pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
		pc.armor.sexiness--;
	}
	else
	{
		output2("You zip up the ass half of your slave uniform. Probably shouldn’t leave that hanging out where anyone can grab it, right?");
		if(pc.isBimbo()) output2(" Well, you totes should, but sometimes you gotta wrap a present before you like, open it up!");
		pc.armor.deleteFlag(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
		pc.armor.sexiness--;
	}
	pc.armor.hasRandomProperties = true;
	clearGhostMenu();
	addGhostButton(0,"Next",slavesuitOptionsDisplay);
}

/*
output("\n\nGeneral Idea:");
output("\n\nBasically add an [Interact] menu to the outfit when wearing it to expose the stated bits of the body. Adds exhibitionism when worn as such, etc, follows the same rules/flags. I don’t know anything about balancing exhibitionism numbers. ");
output("\n\nHand Repulsor");
output("\n\nLevel 8 Melee weapon");

output("\n\nName: Hand Repulsor");
output("\n\nShort Name: H.Repulse");
output("\n\nType: Melee Weapon");
output("\n\nSlot: Melee Weapon");
output("\n\nBase Price: 36000");
output("\n\nPhysical Damage: 10");
output("\n\nLust Damage: 0");
output("\n\nDetailed Damage: 10 Kinetic");
output("\n\nAccuracy: 10");
output("\n\nCrit Bonus: 0");
output("\n\nEvasion: 12");
output("\n\nFlags: NoCrit, Stun Chance");
output("\n\nShields: 30");

output("\n\nDescription:");
output("\n\nA curious, sleek gauntlet device that at first seems to be some sort of weapon or projector. Actually testing it shows it to be some sort of field repulsor, similar to personal jump jets. Using it to propel yourself off of the ground could be useful, much like a jetpack. It even has reserve shield batteries for a cushioned impact.");

output("\n\nWhile it does have combat utility in the form of kinetic force, it seems more designed to put distance between you and a melee attacker, allowing you to shoot with the other hand. The force given from the impact is minimal in terms of damage but you’d send the target flying with the right angle!");

output("\n\nCustom Attack Text (if possible):");
output("\n\nYou attempt to press your [pc.weaponMelee] against the [target.CombatName] and then let loose a bolt of kinetic energy!");
*/