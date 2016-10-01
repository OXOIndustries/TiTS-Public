import classes.Characters.Frostwyrm;

public function frostWyrmHeader():void
{
	author("Savin");
	showName("FROSTWYRM");
	showBust("FROSTWYRM");
}

//Encounter Text
public function encounterFrostwyrm():void
{
	clearOutput();
	frostWyrmHeader();
	
	//First time
	if (flags["MET_FROSTWYRM"] == undefined)
	{
		output("As you're moving across the broad, flat cliffs of the glacial coastlands, your eyes are constantly drawn to the beautiful vista to the east: the calm, icy ocean that stretches out as far as the eye can see. Mist is rolling across the water ");
		if(hours < 6 || hours > 18) output("tonight");
		else output("today");
		output(", billowing up against the frozen cliffs beneath you. It's eerily beautiful.");
		output("\n\nWhile you're gazing out across the waters, though, you start to think you can hear something odd over the sound of crashing waves. You squint out across the cliffs, trying to find the source of the noise...");
		output("\n\nThe source finds you, it turns out. A huge, flying shape rockets up from the cliffside just in front of you, soaring into the sky with a bellowing roar that cracks the ice around you. You leap back, desperately scrambling away from the behemoth creature as it tumbles in the air and dives back down. It slams into the icy ground just ahead of you, sending out shockwaves that nearly topple you over."); 
		output("\n\nWhen the dusty snow clears from the air, you can't help your eyes going wide as you're able to see the creature. Every fantasy holo you've ever seen comes rushing back to you all at once as the towering white-scaled reptile stalks forward, revealing a serpentine body propped up on six muscular legs, and a pair of leathery wings wrapping around it. The creature regards you with four red eyes, set deep behind a lizard-like face full of teeth, each as long and sharp as a broadsword."); 
		output("\n\nThe creature strides forward, growling with bestial menace. Your codex makes an alarmed bleeping noise, alerting you to the presence of a creature called a “Frostwyrm,” to be avoided at all costs."); 
		output("\n\nAll you can do is pull your [pc.mainWeapon] out and prepare to defend yourself from what could only be described as a motherfucking <i>dragon</i>.");
	}
	//Repeat encounter
	else
	{
		output("You hear a familiar, bestial roar overhead. Looking up, you can clearly see the outline of a massive winged creature soaring through the sky, circling you. Oh, shit. You get your [pc.mainWeapon] ready as the draconic frostwyrm does a barrel roll and dives down, slamming into the snow just a short ways ahead of you. It lets out a fearsome battle roar and stalks towards you, a dark shape through the haze of billowing snow.");
	}
	IncrementFlag("MET_FROSTWYRM");
	CodexManager.unlockEntry("Frostwyrm");
	
	clearMenu();
	addButton(0,"Fight",fightFrostwyrm); //Yes, please turn me into a dragon's slave
	addButton(1,"Flee",fleeFrostwyrm,undefined,"Run Away","Sometimes discretion is the better part of valor"); //No, I am sane
}

public function fightFrostwyrm():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(new Frostwyrm());
	CombatManager.victoryScene(frostwyrmPCVictory);
	CombatManager.lossScene(frostwyrmPCLoss);
	CombatManager.displayLocation("FROSTWYRM");
	CombatManager.beginCombat();
}

public function fleeFrostwyrm():void
{
	clearOutput();
	frostWyrmHeader();
	author("Neoptolemus")
	
	output("You've gone toe to toe with some terrifying foes in your time. But there's no way you're going to fight <b>that</b>. Instead, adrenaline pumping, you break into a desperate sprint away from the gigantic lizard behind you. When you hazard a glance back over your shoulder the frostwyrm doesn't seem to have given chase at all, although those four draconic eyes are still fixed on you.");
	output("\n\nWhat feels like an eternity latter, the wyrm beats its wings and takes off again, flying back the way it came. You take a few minutes to recover your breath, by then the beast is completely out of sight.");
	
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function frostwyrmPCVictory():void
{
	clearOutput();
	frostWyrmHeader();
	
	output("With a pathetic groan, the beast finally collapses. It topples onto its side, surrounded by a billow of snow that spews into the air. Its tail thrashes, wings beating weakly as it slips out of consciousness.");
	output("\n\nTentatively, wary of a trap, you approach the defeated creature with weapon at the ready. Waving snow out of your face, you manage to lock gaze with a pair of small black eyes, looking up at you with what you can only imagine is fear. ");
	if (silly) output("It's afraid!");
	else output("The creature knows it has lost, and is utterly at your mercy");
	output("\n\nWhat do you do?");
	
	IncrementFlag("FROSTWYRM_VICTORY_COUNT");
	
	processTime(5);
	
	addButton(0,"Kill It",slayFrostwyrm,undefined,"Kill It","This creature will only threaten you again. Kill it now, and save yourself from future battles.")
	addButton(1,"Leave It",leaveFrostwyrm,undefined)
}

public function slayFrostwyrm():void
{
	clearOutput();
	frostWyrmHeader();
	
	pc.createKeyItem("Frostwyrm Scales");
	flags["FROSTWYRMSLAIN"] = 1;
	
	output("You will not be threatened by this creature again. You bring your weapon to bear and finish it quickly. The frostwyrm dies with a pathetic screech, and then falls still and silent.");
	output("Once it's gone, you spend a few minutes harvesting some of its scales and leather -- you could probably get something cool made out of it.\n\n");
	
	processTime(15);
	CombatManager.genericVictory();
}

public function leaveFrostwyrm():void
{
	clearOutput();
	frostWyrmHeader();
	
	output("You turn away from the creature and head back into the snow-blasted glaciar, leaving it to its fate. A few moments later, you hear a roar behind you and the sound of the great beast taking flight.");
	output("\n\nSomething tells you you'll see it again, once it's had time to lick its wounds.\n\n");
	
	processTime(1);
	CombatManager.genericVictory();
}

public function frostwyrmPCLoss():void
{
	if (flags["FROSTWYRMWARNING"] == undefined)
	{
		clearOutput();
		frostWyrmHeader();
		
		flags["FROSTWYRMWARNING"] = 1;
		
		output("With a final gasp, you crumple to the ground, utterly defeated. Your life, short that it's been, flashes before your eyes as the behemoth of frost and scales lumbers toward you, fangs bared and slavering with bestial hunger.");
		output("\n\nYou scramble back, but a single stride of the creature's six huge legs brings it so close that you can feel its breath hot against your [pc.face]. It growls, regarding you with its four black eyes. Rather than open wide to devour you, though, the creature snorts in your face, and you feel a sudden pressure on the back of your head. Your vision swims as an unwelcome force burrows into your mind.");
		output("\n\nA pounding pain thunders through your mind, feeling like your head is about to be wrent apart. You wrap your hands around your head, a feeble effort to ward off the psychic assault drilling through your consciousness. Your attempts are futile, utterly insufficient in your state of ");
		if (pc.HP() <= 0) output("physical defeat.");
		else output("overwhelming sexual arousal.");
		output(" Your defenses are compromised, and you can feel them slowly peeled apart, stripped layer by layer like an onion until you're suddenly aware of another presence in your mind, a worming coldness squirming through your brain.");
		output("\n\nA voice pounds between your ears, bestial and guttural, yet soft as a whisper. <i>You did not run</i>, it says, as the frostwyrm snorts a frigid breath across your face. <i>Most run.</i>");
		output("\n\n“W-what?” you groan, not sure if you're speaking aloud or just thinking back at the voice burrowing in your brain.");
		output("\n\n<i>Are you brave, or foolish, I wonder?</i> the voice says. <i>Your kind come to slay me with their great machines of fire and war... and yet here you stand alone. Ah, a word in your language: hubris.</i>");
		output("\n\nThe creature snorts again and withdraws, rising to its full and terrifying height. With an ear-piercing bellow, the wyrm turns away from you, looking back across the misty sea to the east. <i>Never again come to my domain, creature. Keep your distance from the coastlands. I will not be so forgiving a second time.</i>");
		output("\n\nGlancing at you over its shoulder, the wyrm takes wing and dives beneath the glacial cliff and out of sight.");
		
		processTime(5);
		clearMenu();
		addButton(0,"Next",frostwyrmPClossEpil)
	}
	else
	{
		clearOutput();
		frostWyrmHeader();
	
		output("\n\nWith a final gasp, you crumple to the ground, utterly defeated. Your life, short that it's been, flashes before your eyes as the behemoth of frost and scales lumbers toward you, fangs bared and slavering with bestial hunger.");
		output("\n\nYou scramble back, but a single stride of the creature's six huge legs brings it so close that you can feel its breath hot against your [pc.face]. It growls, regarding you with its four black eyes. Rather than open wide to devour you, though, the creature snorts in your face, and you feel a sudden pressure on the back of your head. Your vision swims as an unwelcome force burrows into your mind.");
		output("\n\nA pounding pain thunders through your mind, feeling like your head is about to be wrent apart. You wrap your hands around your head, a feeble effort to ward off the psychic assault drilling through your consciousness. Your attempts are futile, utterly insufficient in your state of ");
		if (pc.HP() <= 0) output("physical defeat.");
		else output("overwhelming sexual arousal.");
		output(" Your defenses are compromised, and you can feel them slowly peeled apart, stripped layer by layer like an onion until you're suddenly aware of another presence in your mind, a worming coldness squirming through your brain.");	
		output("\n\nA voice pounds between your ears, bestial and guttural, yet soft as a whisper. <i>You did not run</i>, it says, an echo of your prior defeat. <i>I warned you once to never again darken my door. Yet not only do I find you here again, but you lack the sense to flee when confronted.</i");
		output("\n\nThe frostwyrm looms down on you, billowing icy breath across your face. You shiver, scrabbling back away from it... until one of its huge, bestial claws reaches out and grabs you around the waist, pinning you to the ice.");
		output("\n\nThe beast seems to consider you for a moment, its four black eyes drilling into you before it exudes a long breath and clutches its claws around you. For a moment, you feel as if you'll be crushed to pulp, but then find that its claws are wrapping around you, lifting you up off the ground. With a roar, the wyrm takes wing, hefting you up and flying off with you.");
		output("\n\nA scream tears from your threat as you're whisked away through the freezing wind, over the edge of the glacial rift and out over the vast, icy ocean below. The wyrm roars, a thunderous sound that echoes across the rift for miles around and all but deafening you in the process. You can't hear, the icy wind is burning you eyes, and you're completely incapable of movement crushed between the wyrm's talons.");
		output("\n\nYou try and hold on, futile as that is against the tide of agony that assails. you. You last mere moments before consciousness slips away from you.");
		
		processTime(5);
		clearMenu();
		addButton(0,"Next",frostwyrmBadEnd)
	}
}

public function frostwyrmPClossEpil():void
{
	clearOutput();
	
	
	output("You spend several minutes on your back, reeling from the violent invasion of your psyche. After a while, you roll onto your hands and [pc.knees] and retch across the ice, heaving until your chest burns.");
	output("\n\nIt takes a while to get yourself in any condition to move. Once you've caught your breath, you check your gear and stumble off, away from the sheer cliff at the edge of the glacial rift.\n\n");

	processTime(15);
	CombatManager.genericLoss();
}

public function frostwyrmBadEnd():void
{
	clearOutput();
	frostWyrmHeader();
	
	output("You claw your way back to consciousness, groaning as sensation floods back into you. You're freezing cold, and everything aches: it takes several seconds to blink the accumulated frost out of your eyes, and you struggle to a sitting position, your back pressing against something cold and slick -- ice?");
	output("\n\nYour eyes finally open, revealing palatial cavern of ice. Dozens of spires surrounding the open chamber, holding the ceiling aloft in all its glittering glory. Light flickers across the ice crystals hanging above you, creating a chandelier-like effect that illuminates the chamber as well as candle-light might, almost blinding to your battered eyes.");
	
	output("\n\nAfter taking a few moments to adjust, you stagger up ");
	if (pc.hasFeet()) output("to your feet");
	else output("to your full height");
	output(", using the ice wall for support.");
	
	output("\n\nIt's only then that you hear the clinking of metal, and feel a tug against your neck. ");
	output("\n\n<i>“Oh, no,”</i> you murmur, running a hand along your neck and finding a leather collar firmly affixed there, pulling against a chain that clinks like glass behind you. The memory of your capture, being beaten and battered by the psychic frostwyrm and dragged off to.. what you imagine must be its lair.");
	output("\n\nYou give an experimental tug on the chain binding you to the wall, and manage to give yourself perhaps three feet of give from the wall. Sighing, you try and tug against the chains, and find them as sturdy as steel, with no lock or device in sight. ");
	if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output("It's so cold you can't even work your gooey magic to escape -- you're too solid in the frigid cold. "); 
	output("You are, for all purposes, trapped in the wyrm's lair.");
	output("\n\n<i>Ah, you stir,</i> comes the now-familiar voice in your head, softer and sweeter than ever before. What was once an agony assailing your senses now comes as an otherworldly coolness that worms along your spine, twisting and coiling through the avenues of your brain. It's almost pleasurable, in a way, making you shiver with the alien sensation.");
	output("\n\nYou gaze out across the open chamber, and see the wyrm for the first time since waking: moving with serpentine grace, flowing like liquid across the ice. It approaches you slowly, taking you in with its four dark eyes.");
	output("\n\n<i>Chains suit you,</i> the voice whispers, in beat with the frostwyrm's bestial breath. <i>Very well indeed.</i>");
	output("\n\nYou start to protest, to strain against your bonds. Every instinct in your invaded mind screams that you do not belong in chains... until a cool pressure builds in the back of your mind, stirring your thoughts into incoherent mush. It takes what little willpower you have left not to merely go limp, surrendering to the mental miasma. ");
	output("\n\nAfter a few moments, a thought congeals in your mind: a single word forming in a rush of shivering, cool control: <i>“Yes,”</i> you say aloud, running your fingers along the icy chains. The way your collar rubs against your [pc.skinFurScales] sends waves of pleasure through you, almost orgasmic. The wyrm's maw twists into something like a grin and it nods approvingly.");
	output("\n\nThe frostwyrm slinks right up to you, and draws one of its blade-like talons across your cheek. You whimper, pressing your back against the wall as the wyrm caresses you. Yet you find his touch oddly pleasurable, almost sensual. It breathes a cloud of misty frost across your face, and the chain behind you snaps away from the wall, slipping down your back. Your [pc.legOrLegs] quaver, nearly bucking you onto your hands were it not for the sudden appearance of the wyrm's claws around your body. Again, you're overcome with an unbeckoned pleasure hammering through you until you're limp in the creature's powerful grasp.");
	output("\n\nThe volition drains out of you in the wyrm's cold embrace: this time it lays you out across a table of ice at the back its lair, you can't find the will to move... nor the desire. The cold weight on your mind leaves you placid and mewling when the wyrm releases you, hands brushing languidly across its claws.");
	output("\n\nSome base and primal part of your brain screams that this isn't right, that you're being controlled.");
	output("\n\nThe rest of you doesn't mind at all");
	output("\n\nThe wyrm rises to its full height, its long neck coiling over the altar-like block he's laid you out on, staring at you for a long moment. For the first time, you realize that you're naked and bereft of your equipment; your sex is bared for the creature's inspection, and you become quickly aware that its stare is firmly focused there.");
	
	output("\n\n<i>In truth, I am glad you did not heed my warning,</i> the voice says, and the cool, queer feeling in your mind tingles with sensual suggestion. Unbidden arousal flushes through your body, brought forth by the probing thoughts coursing through your mind. ");
	if (pc.hasCock()) output("You watch your [pc.cock] slowly rise to half - mast, reaching up towards the snowy wyrm."); 
	else if (pc.hasVagina()) output("You feel your [pc.cunt] wink invitingly at the creature, wide open and beading with lustful juices.");
	output("The wyrm's face twists into something like a smile. <i>Good, your body agrees. It has been many years since a proper mate has wandered into my territory. We are so few, now... you will have to do instead. I require someone to</i>");
	if (pc.hasVagina()) output("<i>bear my young. I will fill your body with eggs, again and again. You will be mother to my brood.</i>"); 
	else if (pc.hasCock()) output("<i>be father to my brood. You will give life to my eggs, again and again, until my lair sings with life.</i>"); 
	//default to female
	else output("<i>bear my young. I will fill your body with eggs, again and again. You will be mother to my brood.</i>"); 
	output(" <i>It will be pleasurable for you, if you let it.</i>");
	
	output("\n\n<i>“I... will,”</i> you answer, ");
	if(pc.legCount > 1) output("and you find your [pc.legorLegs] spreading invitingly, "); 
	output ("as if begging the wyrm to proceed with its inevitable plans for you.");

	processTime(90)
	pc.lust(pc.lustMax());
	addButton(0,"Next",frostwyrmBadEndII);
}

public function frostwyrmBadEndII():void
{
	clearOutput();
	frostWyrmHeader();
	
	//vagwielder
	if (pc.hasVagina())
	{
		output("<i>I am glad</i>, the wyrm coos, taking a single stride forward, wrapping its foremost four legs around the shelf of ice so that it is completely overtop you. You can't see its face anymore, nor the cavern around you: nothing but the armored underbelly of the great white wyrm. Something long, hard, and unbearably thick presses against your thigh, starting to move towards your [pc.cunt]. Your whole body seizes up as the behemoth wyrm moves himself overtop you, and his equally huge member towards your pussy.");
		
		output("\n\nYou look down the length of your body, and at the tree-trunk of red meat that's appeared between the frostwyrm's haunches, angling towards your sex." );
		//Max height or taur
		if ((pc.isTaur() || pc.tallness >= 96)) output("Even as big as you are, there's no way you could take something like that!");
		//Really loose?
		else if (pc.biggestVaginalCapacity() >= 2000) output("You've taken some massive dicks before, but even your breath catches when you see what the wyrm's packing.");
		//Other
		else output("The wyrm is packing what looks like a tree trunk, aiming for your utterly unprepared sex with obvious intent. ");
		output("You give a panicked whimper, unable to do anything to avoid your fate.");
		
		output("\n\nYou hear the wyrm snort from somewhere overhead.Overtop you, the wyrm snorts. <i>Relax yourself,</i> it commands, and you quickly find your body becoming languid and heavy, hard to move. <i>I would not risk harming you, my mate.</i>")
		output("\n\nYou try to answer, but your voice comes as nothing more than a simpering moan. You reach up and run a hand along the wyrm's underbelly, a feeble attempt to arrest its progress turning into a lover's caress. The beast's psychic dominion over your mind leaves you utterly helpless -- and some primal, animalistic part of your mind screams with pleasure as the titanic crown of its cock teases the lips of your womanhood.");
		output("\n\nWith a vicious growl, the frostwyrm's hips grind forward, and its cockhead soon comes flush with your [pc.cunt], pulling apart your lips and aligning with the hole beneath them. Relentlessly it pushes forward, forcing the first inches into you. Your body strains against it, belly tentpoling with the massive insertion. You scream -- not with pain, but with pleasure. The sensation is all-consuming, shaking you to your bones: the wyrm's cock feels <i>amazing</i>, a fist of purest ecstasy pushing inside you.");
		output("\n\nThe wyrm's insertion stops quickly, bottoming out at the end of your channel: it's barely crowned you, and there's no more room for its monstrous erection. You scream again, begging for more: you don't care if it breaks you, ruins you forever -- you need <i>more</i> of the wyrm's dick inside you.");
		
		output("\n\nInstead of tearing you apart, the frostwyrm begins to move its hindquarters, drawing itself almost out of you, and grinding back in again. It's not everything you wanted, but the thunderous pleasure that crashes through you erases any sense of deprivation. Conscious thought gives way to cries of animalistic pleasure, followed by orgasm as the wyrm hammers you, filling you utterly and completely. Your head lolls back, insensate as you climax around the beastial member, spraying it with [pc.girlCumNoun]");
		if (pc.hasCock()) output(" and hosing your belly with your own spunk as your [pc.multiCock] erupts.");
		else output (".");
		
		output("\n\nThe wyrm follows you a mere moment later, bellowing a triumphant roar as its cock swells with impending need. You have but a moment to brace yourself before the flood of cold, sticky wetness floods into your womb, bloating your gut as a monstrous load of wyrm-spunk takes root.");
		output("\n\nAfter a long minute, the frostwyrm withdraws from you with a wet, resounding squelch. The moment it does, you feel like you're a balloon deflating with gallons of spunk leaking out of your abused hole. The sensation is as frightening as it is amazing.");
		output("\n\n<i>Hmm,</i> the wyrm's voice coos in your mind, sending shivers of pleasure through you even as the creature's body moves off of you, and its claws wrap around your limp frame. <i>You will serve. Yes... a fine mother for my brood indeed. Now rest. We must ensure your body plays home to many fine eggs once you recover.</i>");
		output("\n\nYou nod meekly as your captor carries you back to the cavern's edge, and reattaches your chain to its pedestal. <i>Now rest,</i> it repeats, and you begin to feel your eyes becoming leaden. You drift off to sleep, completely content in the tight hug of your collar around your neck, a constant reminder of your servility.");
		output("\n\nYou can't wait to be a mother to such magnificent creatures.");
		
		pc.loadInCunt();
	}
	//cockwielder
	else if (pc.hasCock())
	{
		output("<i>I am glad</i>, the wyrm coos, taking a single stride forward, wrapping its foremost four legs around the shelf of ice so that it is completely covering you. You can't see its face anymore, nor the cavern around you: nothing but the armored underbelly of the great white wyrm. Its serpentine tail wraps around your [pc.legOrLegs], brushing tenderly against the underside of your [pc.cock]. You're at full mast instantly, all thoughts of the cavern's chill forgotten at the smooth caress of your captor.");
		output("\n\n<i>Relax yourself,</i> the voice murmurs as its tail strokes your cock, gently guiding it towards the source of a subtle, wet warmth on its body. It takes you a moment to recognize that you're being drawn into the creature's sex, a silken-smooth gash that reaches down to kiss your [pc.cockHead]. The wyrm makes a gravelly growl as you slide into it -- into <i>her</i>? -- and you feel wet warmth wrap around your [pc.cock].");
		output("\n\nThe wyrm makes a shuddering snort, and you hear its voice echo in your mind <i>Good, good. It's been so long since I felt the touch of a male. So long...</i>");
		output("\n\nIts great body slowly descends on you, swallowing up every inch you have to offer it. The whole of your shaft is quickly consumed by the slavering maw of reptilian sex, wrapped in soft warmth that begins to contract rhythmically. The hole is much too big for you, you know that instantly, but the wyrm still floods your mind with an overwhelming sense of pleasure -- despite the great difference in size, your cock feels like it’s being slid into a vice-like grip, tight as a virgin's hole.");
		output("\n\nPsychic pleasure overwhelms you, creeping through your body from the cock upwards until you're arching your back and digging your fingers into the ice.");
		output("\n\n<i>Relax.</i> the voice in your mind commands, and you immediately fall flat on your back. The great beast begins to hump itself forward and back, clenching hard around your [pc.cock], making itself into the perfect living milker to drain the seed from your [pc.balls]. <i>I will drain you dry.</i>");
		output("\n\nThe moment to wyrm utters that into your mind, you feel yourself letting go, surrendering to the alien ecstasy gripping your mind. A rush of pleasure hammers through you, culminating in an orgasmic scream as your [pc.cock] erupts inside the wyrm's sex. The creature roars triumphantly as you fill its sex with your [pc.cumNoun]. You shoot every drop you've got as deep into the wyrm's belly as you can, basting the sultry walls of its bestial cunt a sticky [pc.cumColor].");
		output("\n\nGasping for breath, you collapse back against the icy altar. Your [pc.cock] slowly wilts, drooping out from inside the wyrm's warm embrace accompanied by a waterfall of spooge trickling out of its hole.");
		output("\n\n<i>Hmm,</i> the wyrm's voice coos in your mind, sending shivers of pleasure through you even as the creature's body moves off of you, and its claws wrap around your limp frame. <i>You will serve. Yes... a fine father for my brood indeed. Now rest. We must make sure your seed takes once you recover.</i>");
		output("\n\nYou nod meekly as your captor carries you back to the cavern's edge, and reattaches your chain to its pedestal. <i>Now rest,</i> it repeats, and you begin to feel your eyes becoming leaden. You drift off to sleep, completely content in the tight hug of your collar around your neck, a constant reminder of your servility.");
		output("\n\nYou can't wait to be a father to such magnificent creatures.");
	}
	//neuter - just a rough modification of vag
	else
	{
		
		output("<i>I am glad</i>, the wyrm coos, taking a single stride forward, wrapping its foremost four legs around the shelf of ice so that it is completely overtop you. You can't see its face anymore, nor the cavern around you: nothing but the armored underbelly of the great white wyrm. Something long, hard, and unbearably thick presses against your thigh, starting to move towards your [pc.asshole]. Your whole body seizes up as the behemoth wyrm moves himself overtop you, and his equally huge member towards your pussy.");
		
		output("\n\nYou look down the length of your body, and at the tree-trunk of red meat that's appeared between the frostwyrm's haunches, angling towards your ass. ");
		//Max height or taur
		if ((pc.isTaur() || pc.tallness >= 96)) output("Even as big as you are, there's no way you could take something like that!");
		//Really loose?
		else if (pc.analCapacity() >= 1500) output("You've taken some massive dicks before, but even your breath catches when you see what the wyrm's packing.");
		//Other
		else output("The wyrm is packing what looks like a tree trunk, aiming for your utterly unprepared ass with obvious intent.");
		output(" You give a panicked whimper, unable to do anything to avoid your fate.");
		
		output("\n\nYou hear the wyrm snort from somewhere overhead.Overtop you, the wyrm snorts. <i>Relax yourself,</i> it commands, and you quickly find your body becoming languid and heavy, hard to move. <i>I would not risk harming you, my mate.</i>")
		output("\n\nYou try to answer, but your voice comes as nothing more than a simpering moan. You reach up and run a hand along the wyrm's underbelly, a feeble attempt to arrest its progress turning into a lover's caress. The beast's psychic dominion over your mind leaves you utterly helpless -- and some primal, animalistic part of your mind screams with pleasure as the titanic crown of its cock teases your rim.");
		output("\n\nWith a vicious growl, the frostwyrm's hips grind forward, and its cockhead soon comes flush with your [pc.asshole], aligning with the hole beneath them. Relentlessly it pushes forward, forcing the first inches into you. Your body strains against it, belly tentpoling with the massive insertion. You scream -- not with pain, but with pleasure. The sensation is all-consuming, shaking you to your bones: the wyrm's cock feels <i>amazing</i>, a fist of purest ecstasy pushing inside you.");
		output("\n\nThe wyrm's insertion stops quickly, bottoming out at the end of your channel: it's barely crowned you, and there's no more room for its monstrous erection. You scream again, begging for more: you don't care if it breaks you, ruins you forever -- you need <i>more</i> of the wyrm's dick inside you.");
		output("\n\nInstead of tearing you apart, the frostwyrm begins to move its hindquarters, drawing itself almost out of you, and grinding back in again. It's not everything you wanted, but the thunderous pleasure that crashes through you erases any sense of deprivation. Conscious thought gives way to cries of animalistic pleasure, followed by orgasm as the wyrm hammers you, filling you utterly and completely. Your head lolls back, insensate as you climax around the beastial member.");
		output("\n\nThe wyrm follows you a mere moment later, bellowing a triumphant roar as its cock swells with impending need. You have but a moment to brace yourself before the flood of cold, sticky wetness floods into you, bloating your gut as a monstrous load of wyrm-spunk takes root.");
		output("\n\nAfter a long minute, the frostwyrm withdraws from you with a wet, resounding squelch. The moment it does, you feel like you're a balloon deflating with gallons of spunk leaking out of your abused hole. The sensation is as frightening as it is amazing.");
		output("\n\n<i>Hmm,</i> the wyrm's voice coos in your mind, sending shivers of pleasure through you even as the creature's body moves off of you, and its claws wrap around your limp frame. <i>You will serve. Yes... a fine mother for my brood indeed. Now rest. We must ensure your body plays home to many fine eggs once you recover.</i>");
		output("\n\nYou nod meekly as your captor carries you back to the cavern's edge, and reattaches your chain to its pedestal. <i>Now rest,</i> it repeats, and you begin to feel your eyes becoming leaden. You drift off to sleep, completely content in the tight hug of your collar around your neck, a constant reminder of your servility.");
		output("\n\nYou can't wait to be a mother to such magnificent creatures.");
		
		pc.loadInAss();
	}

	processTime(30)
	pc.orgasm()
	badEnd();
}
