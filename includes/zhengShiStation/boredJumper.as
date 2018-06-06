import classes.Characters.JumperBored;
//Random sweaty bunnygirl in a latex jumpsuit with a real craving for some hot, sweaty sex. Part of the “Jumper” gang.
	//Pert and perky: C-cups
	//13" Human Cock, sometimes horsecock. Figure they got a dong designer stashed up top, of course the mooks make use of it for funsies.
	//Big fat cuntlips that ache for a plowing.
	//Lop-eared in those hot hot mines.
	//Shieldbelt with jet boosters, dart gun, gas grenades, and a stealth field. Left her real firepower upstairs and only brought what she’d need to subdue a resisting slave...

//Fight shit:
	//Very evasive, resistant to heat and cold
	//Uses second wind if HP damaged much.
	//Uses a healing item if HP damaged much a second time.
	//Low lust defenses & “easy” fetishes. - Good contrast to the beefy robots that require HP damage.
	//Always takes extra lust damage from PCs with the sweaty flag
	//Cum covered PCs cause passive lust reduction each turn. She wants a fresh, sweaty fuck!

/*
output("\n\n//Combat");
output("\n\nThis bored laquine’s pirate affiliation is as plain as the glowing red letters on her glossy black zipsuit: they spell “Jumper” down the side. Beneath the lettering, a powerfully muscled thigh flexes with idle energy. Her wide hips and bubbly butt hint at her prowess as both a leaper and a breeder, but it’s the sizeable {equine/canine/feline/terran-shaped} bulge in the crotch that proudly declares what she’s here to get. You can drag your eyes up higher to take in her horny smile, but the outline of her turgid dick and perky, C-cup tits lingers behind.");

output("\n\nThe ambient warmth looks to be affecting her more than you, slicking her fur down until it shines just like her latex suit. It must be a sauna under that slick, creaking material. Her ears are droopy from the heat, oozing over her shoulders like half-melted wax, but she shows no sign of minding. This bored Jumper likes the heat!");


*/

public function showBoredJumper(nude:Boolean = false):void
{
	showName("BORED\nJUMPER");
	showBust("BORED_JUMPER" + (nude ? "_NUDE" : ""));
}
//Approach Proc Texts:
public function boredJumperAttackProc():Boolean
{
	showBoredJumper();
	//First time
	if(flags["BORED_JUMPER_JUMPED"] == undefined)
	{
		output("\n\nA faint creaking sound is the only warning you get before a latex-wrapped ");
		if(!CodexManager.entryUnlocked("Laquines")) output("bunny-girl");
		else output("laquine");
		output(" bounds into the room. She glances at you with sultry intent in her eyes and announces, <i>“You’ll do.”</i>");
		if(!CodexManager.entryUnlocked("Laquines")) output("\n\nA chirp from your Codex notifies you that she is a member of the hermaphroditic ‘laquine’ race, known for their libido and single hermaphroditic sex.");
		output("\n\nWhen you don’t fall to your knees, she sighs and draws a compact dart-gun from the holster on her shield belt. <i>“I guess you’re not a slave, huh?”</i>");
		output("\n\nYou nod");
		if(pc.isBimbo()) output(", kind of hoping you can just get straight to the fucking");
		else if(pc.isNice()) output(", hoping to avoid a fight.");
		else if(pc.isMischievous()) output(" and gesture at yourself. <i>“Do I look like a slave?”</i>");
		else output(", hoping for a chance to knock her down a peg.");
		output("\n\nThe end of a barrel swivels to point at your face. <i>“That just means we have a chance to work up a decent sweat before the real fun begins.”</i> She shudders and strokes her gloved fingers down her tight, squeaking suit. <i>“Awww yeaaah...”</i>");
		CodexManager.unlockEntry("Laquines");
	}
	//Repeat
	else
	{
		output("\n\nAnother bored Jumper bounces out of the darkness with a dart-gun in hand and a cocksure grin. <i>“Oooh, what have we here?”</i> she chirps, dragging her latex-encased fingers through her sopping wet fur. <i>“A lost little cutie all alone in these hot... hot... mines. Hope you’re not too tired to get fucked...”</i> She giggles and rubs her slick hand on the cock-shaped bulge in her crotch. <i>“Course if you are, that’s fine too.”</i>");
	}
	IncrementFlag("BORED_JUMPER_JUMPED");
	output("\n\nYou’ll have to fight!");
	//fight proc
	var tEnemy:JumperBored = new JumperBored();
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(winVsBoredJumper);
	CombatManager.lossScene(loseToBoredJumperRouting);
	CombatManager.displayLocation("BORED JUMPER");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
	return true;
}

//Win to Bunny
public function winVsBoredJumper():void
{
	//HP
	if(enemy.HP() <= 1)
	{
		output("The bored Jumper tumbles to the ground, clutching one arm and looking up at you in... adoration? She smiles shyly and reaches into a pouch. You bring up your guard, but it’s unnecessary. She lifts the medical-grade injector to her neck and releases the payload with a hiss of discomfort. <i>“Okay hot s-s-tuff.”</i> The distention in her crotch jerks forward, stretching her suit. <i>“Mmmm, so warm.”</i> Her visible injuries knit before your eyes, but her nipples look firm enough to serve as improvised weapons. <i>“Was saving this for you, if I had to beat you down, but I guess uh... now you get to be charge.”</i>");
	}
	//Lust
	else
	{
		output("The bored Jumper tumbles to the ground, arching her back and thrusting her crotch against her palm. Latex squeaks against latex as she assails her body with wild abandon. The sweaty bunny roughly gropes her own breast, staring at you with wild, adoring eyes. <i>“F-f-fuck, you’re so fucking hot. You know that right? I don’t even care anymore. Fuck me how you want! Screw me so silly I sleep through my next job - just fuck me!”</i>");
	}
	//Merge
	//Now enough lust.
	if(pc.lust() <= 33) output("\n\nUnfortunately for her, you’re far too sated to give a shit about giving her the struggle-cuddles she so desires.");
	//Enough
	else output("\n\nYou aren’t sure why, but she seems more than into the idea of being your personal fuck-puppet for a few hours. What do you want to do with her?");
	clearMenu();
	addDisabledButton(0,"Sex","Sex","These scenes haven't been written yet. Sorry!");
	addButton(14,"Leave",leaveTheBoredJumperAfterWinning);
}

//Leave (no sex!):
public function leaveTheBoredJumperAfterWinning():void
{
	clearOutput();
	showBoredJumper();
	output("You wave off the oversexed bunny-slut’s passionate exhortations and turn away.");
	output("\n\n<i>“Wait! No!”</i> She briefly reaches out for you before giving up and yanking down her zipper. <i>“I wanted to fuck yoooouuuuuu!”</i>");
	output("\n\nHer moans continue for some time.\n\n");
	CombatManager.genericVictory();
}

//Lose to Bunny
public function loseToBoredJumperRouting():void
{
	if(pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched")) cumCumCoverLossForSweatquine();
	else if(pc.biggestTitSize() >= 11 && rand(2) == 0) sweatBunSlickyslickTitbang();
	else if(pc.biggestCockLength() >= 36 && rand(3) <= 1) sweatBunHyperCockDock();
	else loseToSweatBunny69();
}
//Standard sweaty 69 loss:
public function loseToSweatBunny69():void
{
	showBoredJumper();
	output("The bored Jumper smiles longingly down at you. <i>“Isn’t it better to be nice and sweaty?”</i> She’s all but steaming with sweat herself. It drips from her ears and slides down her suit like rain, leaving it even shinier in its wake.");
	//HP loss
	if(pc.HP() <= 1) 
	{
		pc.createStatusEffect("SweatBunHealed"); //This is removed at the end of the scene. No sweat!
		output("\n\n<i>“Hrgg... no,”</i> you grunt in irritation, struggling to rise. You aren’t going to lose to some... some... slut-bunny!");
		output("\n\n<i>“No, no... don’t hurt yourself any worse!”</i> She gently but firmly pushes you down. <i>“Here!”</i> The cheerful laquine pirate pulls an injector from a concealed pouch. <i>“This’ll help you recover.”</i> There’s a slight pinch, followed by the sensation of your aches fading away, one by one. <i>“And as a nice bonus, it’ll help you get into the right mindset for what I’m going to do to you. Feeling it yet?”</i>");
		output("\n\n<i>“Feeling what yet?”</i> you ask, still sitting. You feel well enough to get up, but the motivation to do so has vanished. In its place is a growing inner warmth, one that grows faster the longer you let your eyes explore the laquines latex-enclosed form. You want to touch it, to feel the slippery latex and the sopping fur beneath. Touching her seems less like a desire and more like a physiological need.");
		output("\n\n<i>She’s incredibly attractive,</i> you realize. Hotter than a sun and slicker and wetter a bathtub full of lube.");
		output("\n\n<i>“Betcha wanna fuck now, don’t ya?”</i>");
		output("\n\nYou find yourself nodding, hissing, <i>“Yesss,”</i> through clenched teeth.");
		output("\n\n<i>“It feels so... so good to be sweaty, doesn’t it?”</i>");
		output("\n\nYour mouth salivates at the mention, suddenly craving the salt. <i>“Yes!”</i>");
		pc.HP(pc.HPMax());
		pc.lust(pc.lustMax());
	}
	//Lust loss
	else
	{
		output("\n\n<i>“Uhh... can we just fuck already?”</i> You moan, writhing on the ground.");
		output("\n\n<i>“Mmmm, maybe,”</i> the slut-bunny says, tapping her chin, <i>“but only if you really want to. If you really wanna snuggle up in these hot hot tunnels until we’re soaking in each other’s sweat and fucking like beasts.”</i>");
		output("\n\nDoesn’t she realize how horny you are? You’d do anything for exactly that scenario! <i>“Please! Please fuck me. I don’t care if you make me suck the sweat out of your fur, just do it!”</i>");
	}
	//Merge
	output("\n\n<i>“Then let’s get started!”</i> The perky laquine sits down on top of you and begins fidgeting with your equipment, tossing it aside one piece at a time. She pauses at your Codex, then shrugs and sets it on your pack. <i>“Nice tech, newbie. Too bad it didn’t do anything to help you wind up on top, huh?”</i> ");
	if(pc.hasCock())
	{
		if(!pc.isCrotchExposed()) output("Her nimble fingers have your [pc.cocks] free in short order, springing out into proud tumescence.");
		else output("Her nimble fingers brush your [pc.cocks] by accident, enough to your proud tumescence pulsate with pleasure.");
		output(" <i>“Working up a nice sweat down there, aren’t you? I could give you a handjob in these gloves without needing a single droplet of lube.”</i>");
	}
	else if(pc.hasVagina()) 
	{
		if(!pc.isCrotchExposed()) output("Her nimble fingers have your [pc.vaginas] free in short order, slick with a mixture of arousal and perspiration.");
		else output("Her nimble fingers slide across your [pc.vaginas] by accident, slickened by perspiration and arousal.");
		output(" <i>“Somebody’s wet! Wouldn’t these latex fingers feel so good sliding inside?”</i>");
	}
	else output("Her nimble fingers brush across your bare loins before stopping. <i>“Somebody’s got trick genitalia, huh? That’s fine. All I need is your mouth anyway.”</i>");

	output("\n\nYou sprawl, overheating. The stone you’re laying on is so incredibly warm, and the bunny on top of you is even hotter. Her thick thighs clutch you tightly, scissoring you into her sweltering embrace. You feel so moist that you’re sure you must be dripping too, something the laquines roving [enemy.eyeColor] eyes seem to approve of.");
	output("\n\n<i>“This is how sex is supposed to be! Two mammals all sweaty from the hunt, satisfying their bodies in a deep... dark... cave.”</i> One finger goes to the zipper at her neck, and the laquine’s [enemy.eyeColor] eyes twinkle merrily. <i>“Oooh, you’re such a hot fucking mess.”</i> She arches her back and yanks the fastener down, unveiling a curtain of creamy [enemy.furColor] fur and the swells of her pert breasts. They glisten under the mine’s cheap lights. <i>“And I am too.”</i> She yanks on one glove, peeling an arm free, then the other. Soaked latex flops down behind her, leaving the laquine’s upper body bare.");
	output("\n\nGlistening, heaving breasts thrust forward. Tight nipples jut even further out, a droplet moisture beading off the tip. Fingers curl up around them as the laquine brazenly gropes herself. <i>“Fuck yes. Can you see how hot you’ve gotten me?”</i> Her eyes flick down meaningfully.");
	//Potential pagebreak9999?
	output("\n\nFollowing her gaze across her taut tummy, you see exactly what she means. Her [enemy.cock] is jutting up out of the zipper, which is even now being worked lower by the pulsating, thickening organ. If you thought she was hard before, you were dead wrong. The horny bunny-pirate’s prong swells well past ten inches and well into footlong territory before your eyes, thrusting against the zipper until it slides itself underneath her fuzzy, drenched nutsack.");

	//Bimbo/cumslut
	if(pc.isBimbo()) output("\n\nYour mouth waters so powerfully that you drool a bit, eyes fixated on the dick.");
	//High libido
	else if(pc.libido() >= 66) output("\n\nYou dare not look away. It’s such a powerfully erotic sight that it would be a shame not to touch it, to stroke it, and kiss it.");
	//Medium libido
	else if(pc.libido() >= 33) output("\n\nYou can’t look away. It’s such a powerfully erotic sight that you can’t help but want to touch it, maybe it even suck it.");
	//Low
	else output("\n\nYou can’t look away. It’s such a powerfully erotic sight that it makes you feel a little uneasy... until your overwhelming lust reasserts itself, reminding you that you need to cum.");
	//Merge
	output("\n\nFortunately the laquine actually smells sort of... nice. She’s a little musky, maybe, laced with a spicy note of alien scent that presume must be her long-stewed body odor. Nose wrinkling, you sniff again, too fascinated by the aroma in the do care when she shifts higher... and higher, presenting you with the twitching [enemy.cockHeadNoun] of her dick.");
	//add sweaty
	sweatyDebuff(1);
	processTime(8);
	clearMenu();
	addButton(0,"Next",sweatBunny69Loss2);
}
public function sweatBunny69Loss2():void
{
	clearOutput();
	showBoredJumper(true);
	output("<i>“You like how I smell, huh?”</i> The Jumper bends low and licks your cheek, sliding her smooth tongue from your chin to your ear, collecting a load of salty, human-flavored sweat for her effort. <i>“I like how you taste and how you smell. Mmmm, something about aliens");
	if(pc.race() == "laquine" || pc.race() == "half-laquine") output(", even ones that look like me");
	output(", just fires my engines.”</i> She humps higher, smearing her sweaty balls across your chin until they come to rest on your face. <i>“How d’ya like them apples?”</i>");
	output("\n\nYour ");
	if(pc.isBimbo()) output("thirsty");
	else if(pc.libido() <= 50) output("traitorous");
	else output("eager");
	output(" tongue lashes out to lap at her fur, circling one then the other");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" before curling around both at once");
	output(". There’s the familiar salty base to the taste but overlayed with something else, something that makes you groan into those churning nuts and writhe with need. You figure that if you can’t get yourself off, you can at least get her off, but deep down, you know you’re simply rationalizing your own ");
	if(pc.isBimbo() || pc.libido() >= 80) output("typical");
	else output("sudden");
	output(" thirst to mop her weighty jewels until they’re soaked in spit instead of perspiration.");
	output("\n\n<i>“Oh fuck, you’re a real ball-slut when you’re horny!”</i> The floppy-eared rabbit pushes up off of your chest, dragging her shining spheres away. <i>“I can’t let you have all the fun!”</i> She turns around and kneels back down, resting her slippery balls on your face once more, filling your nostrils with what smells like a day’s worth of pheromones. Your head swims, and your tongue dances out. You lick, and you lick, and your muffled cries vibrate through the laquine’s freshly-cleaned nads when you feel her tongue sliding down your [pc.belly] to explore your [pc.skinFurScales].");
	output("\n\n<i>“Mmmm,”</i> the bunny-bitch moans into your loins");
	if(pc.hasCock()) output(", her delicate paw cupping [pc.oneCock] adoringly");
	else if(pc.hasVagina()) output(", her delicate paw cupping [pc.oneVagina] adoringly");
	else output(", her delicate paw sliding down to rub around your [pc.asshole]");
	output(". <i>“You ready to taste some cock, slave?”</i>");

	output("\n\n");
	if(pc.isBimbo()) output("You cry in out in pure, wanton need, delirious at the chance to press your [pc.lips] to her crotch.");
	else if(pc.libido() >= 50) output("Your murmur your assent.");
	else output("You shudder in sudden awareness of what’s about to happen, reeling your tongue back in it, but it’s too late.");
	output("\n\n<i>“Here you go.”</i> The bunny-slut’s tongue dips into your navel while her hips swivel up and back, planting her balls on your forehead and and directing her [enemy.cockNoun] toward your mouth. Pre and sweat dribble from the tip ");
	if(pc.isBimbo()) output("into your greedy, cum-hungry maw");
	else if(pc.libido() >= 50) output("into your wide-open, accepting mouth");
	else output("onto your [pc.lipsChaste], shocking you into a gasp");
	output(". The [enemy.cockHead] burrows right in after, pinning your tongue in place as it makes the exquisitely pleasurable trip toward your throat. ");
	if(pc.canDeepthroat()) output("You welcome it, working your jaw to squeeze it deeper, begging the laquine to take herself balls deep and unload straight into your cum-thirsty gut.");
	else output("You nearly gag, the sounds of your discomfort earning you a momentary reprieve as the laquine pulls an inch or two out.");
	output("\n\n");
	if(pc.isBimbo()) output("It tastes just as good as her balls, maybe even better. Head swimming, you lick and lap at it, swallowing hours of her collected sweat and leaking pre with eager gulps.");
	else output("It tastes... kind of nice, just like her balls. Before you know it, you’re licking her cock like it’s your favorite flavor of lollipop, savoring the dribbling pre and hours’ worth of collected sweat.");
	output(" You find your cheeks hollowing and your [pc.lips] sealing down to suck her a little harder, pulling her a little deeper.");
	if(pc.canDeepthroat()) output(" Your nose nestles into her pheromonally drenched bellyfur.");
	else output("Your gag reflex doesn’t give you too much trouble this time, though you don’t take her the entire way.");
	output("\n\nMeanwhile, the slut-bun’s mouth is all over the lower half of your body. She’s already seen to licking your thighs, your [pc.belly], and even brought her maw down to visit your crotch. Boiling hot kisses pepper that sensitive flesh, all while her paw continues to tease and abuse your tenderest places");
	if(pc.hasCock()) output(", squeezing you until you ache with the need to cum");
	else if(pc.hasVagina()) output(", fingering you until you’re aching with the need to clamp down and cum");
	output(". Your [pc.hips] squirm around on autopilot, your brain fully occupied with tending to the bunny-bitch’s fragrant dong.");
	output("\n\n<i>“Fuck yeah, suck that cock!”</i> The lusty pirate cries, thrusting hard into your face");
	if(pc.canDeepthroat() || pc.isBimbo()) output(", not that it matters. Silly girl! You’ve sucked her so deep and so hard that there’s position for her to take besides ‘balls-deep’.");
	else output(", painting your throat in pre as she burrows in. Tears well at the corners of your eyes while she goes balls-deep.");
	if(pc.hasCock()) output(" At the same time, she sucks down on your [pc.cock], ravishing it with oral attention. Her whiskers tickle your belly as she inhales inches like oxygen and begins to swish her tongue back and forth with the speed of a high quality vibrator.");
	else if(pc.hasVagina()) output(" At the same time, she kiss [pc.oneClit] and breathes it in like oxygen. Her whiskers tickle your belly as she goes wild around the pretty clusty of nerves, tongue vibrating with near-mechanical speed.");
	else output(" At the same time, she plunges two fingers deep into your [pc.asshole] and wiggles them back and forth with near-mechanical speed.");
	output("\n\nSalty hardness flexes on your tongue, then in your throat. The horny rabbit’s [enemy.cockHead] balloons as orgasm explodes out of her, spurting thick ropes into your gurgling gut. Each is at least as long and thick as an average terran’s entire climax. By the third eruption, you’re lightheaded from lack of oxygen. Pleasure cresting, you consign yourself to living out the last few minutes of your life as an increasingly stuffed cum-socket, too fuck-drunk to do anything but gurgle and lamely swallow more dick.");
	output("\n\nClimax hits you like a lightning bolt, shattering your thoughts to pieces and rushing down your spine to explode out of your crotch. Spittle froths around the [enemy.cock] in your mouth. Your [pc.belly] bulges, still filling with cum");
	if(pc.hasCock()) output(", and you fire right back into the laquine’s throat");
	else if(pc.hasVagina() && pc.isSquirter()) output(", and you squirt right back into the laquine’s maw");
	output(". Eyes rolling back, your vision fades to black as you cum and cum and cum, spasming in a puddle of sweat while the laquine’s slowly-emptying balls soothe you into unconsciousness with their rhythmic contractions.");
	processTime(30);
	pc.orgasm();
	pc.loadInMouth(enemy);
	clearMenu();
	addButton(0,"Next",sweatBunny69Loss3);
}
public function sweatBunny69Loss3():void
{
	clearOutput();
	showName("\nALONE...");
	output("You awaken absolutely soaked in sweat. The salty taste of your long-eared captor is still fresh on your tongue, and her uniquely appealing body odor clings tightly enough to make you feel an instantaneous twinge of arousal.");
	if(pc.isBimbo()) output(" Yum!");
	else if(pc.libido() >= 50) output(" It wasn’t entirely unpleasant, though you could do with a few more chances to breathe.");
	else output(" You’ll have to be a bit more careful next time...");
	if(pc.hasStatusEffect("SweatBunHealed"))
	{
		output("\n\nAt least your wounds are healed!");
		pc.removeStatusEffect("SweatBunHealed");
	}
	output("\n\n");
	CombatManager.genericLoss();
}

//Alternate Loss to Bunny: Hyper Cocks Get Docked
public function sweatBunHyperCockDock():void
{
	showBoredJumper();
	output("You flop on the ground");
	if(pc.lust() >= pc.lustMax())
	{
		if(!pc.isCrotchExposed()) output(", furiously masturbating");
		else output(", furiously ripping at your [pc.crotchCovers] as you squirm around in insensate lust");
	}
	else output(", desperately trying to rise one last time before giving up");
	output(".");
	output("\n\nYou’re beaten.");
	output("\n\n<i>“Oh, whoah. What’s this?”</i> She gently drops a latex-covered footpaw onto your crotch, rubbing ");

	var x:int = pc.biggestCockIndex();

	if(!pc.isCrotchExposed()) output("at the monumental bulge");
	else if(pc.cockTotal() == 1) output("your disproportionately well-hung cock");
	else output("biggest totem pole of a cock");
	output(". <i>“I had some other things in mind, but do you know what?”</i> She tweaks you just behind the [pc.cockHead " + x + "] with her toes. <i>“I think... I think I’m gonna fuck your cock.”</i> She slides it down your entire ");
	if(pc.isErect()) output(num2Text(Math.round(pc.cocks[x].cLength())) + "-foot");
	else output("growing, increasingly monstrous");
	output(" length, all but drooling in anticipation. <i>“Gonna break it in till you come back here looking for me, asking me to dump another load into your ");
	if(pc.balls > 1) output("balls");
	else output("dick-pussy");
	output(".”</i>");
	//Wrapped present~
	if(!pc.isCrotchExposed())
	{
		output("\n\nYou squirm futilely against the pirate’s rubbery pressure, getting harder and hotter for your efforts, but she keeps you nicely pinned beneath her sole. <i>“Hold still. Wouldn’t want to hurt you.”</i> Her voice twists between sarcasm and genuine care as she knees down, fingers digging into your [pc.crotchCover]. Those wiggling toys stay right where they are while she works, tickling with you with heat and friction, making it easier for you to find excuses not to resist as removes all the barriers between herself and your dick.");
		output("\n\nIt takes a but a moment for her to lift her paw and yank the obstruction away, but it makes all the difference in the world.");
	}
	else if(!pc.isErect()) //else not entirely hard yet
	{
		output("\n\nYou squirm about ");
		if(flags["JUMPER_DOCKED"] == undefined) output("in a panic");
		else output("at the lurid memory");
		output(", but the pirate keeps you nicely pinned beneath her sole while your cock responds to the attention. It doesn’t care what you want. The blood rushing into it is proof of that. Your traitorous heartbeats add inch after inch to your swelling dick, sliding your sweaty, sensitive skin along her rubbery toes. They wiggle playfully, tickling you with heat and friction, coaxing you to grow stiffer and stiffer. Your [pc.cock " + x + "] is heavy on top of you before long, its weight all but pinning you to the floor.");
		output("\n\nThe she-rabbit barely needs to put any pressure down at this point. Your cock does a good enough job of keeping you in place.");
	}
	//Else
	else output("\n\nYou squirm about for all the good it does you. Your [pc.cock " + x + "] is so big by this point that its weight alone is nearly enough to keep you held in place. The pirate’s playfully wiggling toes barely need to press down. <i>You should have worn pants</i>. If you had done something to cover it up, maybe you wouldn’t be in this situation, your oh-so-hard dick flexing and straining for a few more caresses from this lucky rabbit’s foot.");
	//Merge
	output("\n\n<i>“There you go. Why fight it?”</i> the sweaty slut purrs, sliding her foot off your tool and down the other side of your body. Her cunt slaps down on top of your shaft. You can feel the lips bulging, even through the insulated wrapping. You can feel her balls too, but there’s something about the slight cleft of her pussy that makes your [pc.cock " + x + "] bloat with engorgement, surging forward so powerfully that the rabbit-woman is nearly thrown free. <i>“Mmmm, somebody’s rearing to go, but momma needs a taste first!”</i>");
	output("\n\nBending low, the boner-mounted bunny grabs you by the [pc.cockHead " + x + "] and kisses it. She starts with the gentle press of her lips, but after a few moments of stillness, her tongue flickers out experimentally. Your taste must satisfy her, because immediately after she’s given up on kissing your dick to furiously lick it, dragging her tongue up and down your urethral bulge as far as her neck will allow. The latex laquine shimmies from side to side to lap up fresh patches of sweat, dragging her sweet crotch along your [pc.knotOrSheath " + x + "] while using the rest of her face like your own personal sweat mop.");
	output("\n\n<i>“F-f-f-fuck it almost tastes too good to fuck.”</i> The deliriously aroused pirate kisses the edge of your [pc.cockHead " + x + "]. Pre bubbles at the tip, earning a coy smile. <i>“Almost.”</i> She wraps her hand around it and unceremoniously stuffs a finger into the oozing slit, blocking any more from escaping. <i>“Somebody’s pussy’s getting all wet for me, isn’t [pc.heShe]?”</i> Her hips pump back and forth. The rabbit’s suit creaks as her thighs squeeze tight, stimulating your body to flood more goo into the backed-up passage. <i>“Stars, look at it bulge!”</i> More kisses pepper your inflating urethra. <i>“It must feel so good, inflating like that, your dick stretching itself out to get ready for me...”</i>");
	output("\n\n<i>“Nnng!”</i> you cry, though you cannot say if it is out of pleasure or sheer stubbornness. The sensation of your [pc.cock " + x + "] getting plugged and filling with pre-cum is strange but almost sort of pleasant, especially when the rest of the pirate-slut’s body is doing everything it can to stimulate your exterior.");
	output("\n\nSpit and sweat are everywhere. The rabbit’s suit is so slicked with it that she all but glides back and forth on her see-sawing path along your pole. <i>“You ready, sweetness? Because Momma’s more than ready.”</i>");
	processTime(10);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",sweatBunHyperCockDock2,x);
}

public function sweatBunHyperCockDock2(x:int):void
{
	clearOutput();
	showBoredJumper(true);
	output("You whine in discomfort and arousal, every vein on your [pc.cock " + x + "] standing out, flexing and straining with the effort of holding in the growing pocket of pre. <i>“");
	if(pc.isBimbo()) output("Ooooh please! Fuck my fucking dick already, pleasepleaseplease!");
	else output("Fuck fuck fuck... just make me cum! I can’t take it!");
	output("”</i>");
	output("\n\n<i>“’Kay!”</i> the bunny-girl chirps. She springs up, floppy ears twirling around her, flinging arcs of sweat at the walls as she rotates around into a better position. Her tail, the one bit of fluff her suit exposes, twitches happily. <i>“Now to just...”</i> She cups your bulging urethra in one hand and pumps it, redoubling the pressure. <i>“...pop the cork.”</i> A twist of the pirate’s wrist spins her dick-impaling finger wetly around. Pre chases it when she yanks it out, puddling prettily on her palm to display just how <i>slicked</i> the inside of your dick is for the sweaty bunny’s use.");
	output("\n\nYou sigh in equal parts relief in arousal. The feeling of so much backed-up fluid flowing out of you is nearly orgasmic, and venting all that penile pressure produces the strangest kind of satisfaction. It’s almost a shame that your dick-hole is hanging open a little bit, dribbling an inviting curtain of goo, like it’s given up and decided to enjoy the idea of being fucked full of alien bunny-cock.");
	output("\n\nThe mechanical purr of a zipper’s rapid descent draws your eye upward just in time to see the Jumper’s [enemy.cockNoun] spill out of the metal teeth, so sweaty that it’s nearly as shiny as the latex it’s being pulled out of. It bounces heavily, dribbling pre onto your well-slimed [pc.cockHead " + x + "]. The hefty orbs underneath actually arrest the zipper’s progress for a moment, tugging the seam so tightly that the fastener becomes bound up in friction, but a grunt and a hard yank allow the apple-sized globes to pop free.");
	output("\n\nThey look so much larger now that there’s nothing to constrain them, and they sway with such heavy inertia that you can’t even begin to imagine how densely packed with cum they must be, how backed up the increasingly turgid, lop-eared dick-girl must be to come down here looking for a slave to fuck.");
	output("\n\n<i>“Hey, check it out.”</i> Pre-lubed latex squeezes your [pc.cockHead " + x + "], the slippery digits straining to hold it steady as it’s pulled up to meet with the horny rabbit’s foot-long prong. Her tip presses insistently against the urethral gap her finger prepared. <i>“Our dicks are kissing.”</i> She pets yours affectionately, earning fresh dribbles of dick-slime to shine her own cock with. The excess trickles wetly back the conjoined pricks’ lengths. <i>“Mmm... it’s practically sucking me in!”</i>");
	//Smallish
	//Hyper sluttery
	if(pc.cocks[x].thickness() >= 8)
	{
		output("\n\nStars, it’s true! The errant flexing and straining of your gigantic phallus inevitably opens your invitingly lubricated channel wider, beckoning the hermaphroditic outlaw to venture deeper. She plunges in with a slow but determined thrust of her hips, jaw slack and tongue hanging. <i>“Omigod this is the best fucking dick-pussy! It’s so stupidly huge that it’s meant to be fucked, isn’t it?”</i> Her grip shifts to squeeze it possessively. <i>“I’m gonna breed this big dumb monster sooo hard!”</i>");
		output("\n\nIt doesn’t hurt. It can’t, not when you’re packing this much dick for her to abuse, this much urethra seemingly waiting for the opportunity to have a smaller, firmer dong take it for a ride. It really feels like a big pussy. You find yourself so enamored of the strange new pleasure that you start nodding along with every word she says, unthinkingly prepared to have your [pc.balls] stuffed full of laquine cum.");
	}
	//Regular dick
	else
	{
		output("\n\nShe might be exaggerating, but your oversized phallus isn’t exactly putting up much of a struggle. The little bit of pressure she’s exerted thus far has been enough to pop her [enemy.cockHead] inside. It doesn’t hurt - quite the opposite: it’s quite good. You’re ready for this, so ready that as she eases in slowly but steadily, you find yourself whining in pleased agreement with her every word.");
		output("\n\n<i>“Fucking big dumb slut-cock just needs somebody to take charge, doesn’t it?”</i> The boner-taming bunny squeezes it possessively. <i>“Yeah it does! Somebody to stretch it out and teach it what it was meant for...”</i>");
	}
	//Merge
	output("\n\nThe final three inches are the hardest to take.");
	if(enemy.hasKnot(0)) output(" Not because of the knot, or");
	else output(" Not");
	output(" because you’re already stuffed so full, but because she’s started to leak too. Her dick is pumping pre into your urethra like a broken faucet, raising the pressure higher even as she goes deeper.");
	if(enemy.hasKnot(0)) output(" When her knot pops in, an avalanche of crystalline juices spray out around it.");
	else if(enemy.hasASheath()) output(" When her sheath finally touches down, an avalanche of crystalline juices sprays out to soak her musky crotch.");
	else output(" When she finally does bottom out, it is to an avalanche of crystalline juices. They squirt everywhere, soaking her musky crotch in mixed dick-juice.");
	output(" Your [pc.cock " + x + "] arches, straining and flooding. The cocoon of slick excitement around the bunny’s wiggling totem tamer only grows thicker as the moment’s tick by, and with it, the pleased expression on her lapine muzzle widens.");
	output("\n\n<i>“Sooo good.”</i> Her hands, no longer needed to hold everything in place, slide up and down your exterior, lavishing it in attention that only makes it feel that much harder and fuller. You ache with raw engorgement, feeling like some kind of overstuffed ordoeuvre. The pirate’s shining digits tenderly caress your rigid veins as if they were her own. <i>“Mmmm this is so much better than sixty-nining, isn’t it?”</i> An index finger traces your straining, stuffed urethra. <i>“To think I could’ve been wasting my time with my dick in your mouth!”</i>");
	output("\n\n<i>“Please,”</i> you moan, <i>“there’s so much!”</i>");
	output("\n\nA mischievous smile blossoms across the laquine’s blissed features. <i>“Aww. Maybe I’ll put it in your mouth afterwards, if you really want. Or did you want me to pull out, let all that backed up pre wash over me, and fuck you silly?”</i>");
	output("\n\nYou nod vigorously. At this point, it sounds incredible.");
	processTime(10);
	sweatyDebuff(1);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",sweatBunHyperCockDock3,x);
}
public function sweatBunHyperCockDock3(x:int):void
{
	clearOutput();
	showBoredJumper(true);
	output("<i>“Good. Hang on, cutie.”</i> With a cry of inarticulate bliss, the bunny-girl hauls her hips backwards, sliding her dick out in a rapid yank. Gushing, clear goo flows across its surface, bathing her in combined virility of two powerfully gifted hypersexuals. She stands there for a second, shuddering, and you’d be doing the same if you had been upright. The friction of her iron-hard intruder stroking your walls on its way out was <i>amazing</i>. You moan with her, [pc.hips] shivering, and are on the verge of begging for more when she answers your wordless want with exactly what you both need.");
	output("\n\nCock plows into your straining prick-cunt with no warning and even less care for your pleasure, not that any care was necessary for you to adore the bunny’s powerful dick-reaming. She fills you in ways you never knew you could be filled, strokes you in places not meant to be stroked. The thrusts out remind you of your own orgasms, of passing thick gobs of seed, only now you’re spurting out pre and the universe’s most adventurous dick. When it comes back in, your hands ball into fists and your eyes roll back. All the back-and-forth pressure is probably doing a number on your internal plumbing, but you don’t care.");
	output("\n\nYou can sort of feel it in your prostate when the rabbit-girl humps you, pushing the juices back in, making the pre-pumping organ swallow a little of its own medicine. Ecstasy and dizziness assail you as you lay there, little more than a cock-shaped pussy for your sexy laquine captor to abuse. You moan in mindless bliss as she humps away, flinging sex-juices everywhere. Your [pc.legOrLegs] ");
	if(pc.legCount == 1) output("is");
	else output("are");
	output(" soaked by this point and you hardly care.");
	output("\n\n<i>“Oh fuck yeah, it’s coming,”</i> the rapidly humping laquine says, stroking you off with both hands. <i>“I’m gonna cum so fucking haaaard!”</i> Her hips slap into your [pc.cockHead " + x + "] with enough force to make her weighty balls swing up and clap the underside. Again and again she drills home, each stroke faster and harder than the last, the girth inside you thicker each time, providing you with a greater sense of fullness. <i>“Yes!”</i> she cries, <i>“Yes! Yes! Yesssssssssss!”</i>");
	output("\n\nYou feel the bunny cum with every ounce of your [pc.cock " + x + "]. The swell of her urethra bulging stretches your own still wider. The warmth of her thick, virile laquine seed pumping into your length causes a brief spike of pain as it forces open piping that was never meant to flow both ways, but in its wake there is nothing but pleasure. The pirate’s eyes roll back as she pours her lusts into you. Her nuts clench and squeeze above. You can see them bouncing with every dick-stuffing load they dump into your body, and you can vaguely sense the gloriously warm goo’s passage through you, heating up your middle, making you feel more cum than [pc.manWoman].");
	//Balls
	if(pc.balls > 1)
	{
		output("\n\nInevitably, the torrential flood of seed completely saturates your internal plumbing and travels deeper and further, into your [pc.balls]. ");
		if(!pc.hasStatusEffect("Blue Balls")) output("You can’t help but wince at the sudden onset of blue balls.");
		else output("You can’t help but wince as your already blue balls tighten further.");
		output(" Alien sperm lends your spunk-bunkers a swollen, tight appearance, forcing the surrounding sack to swell along with them. Each squirt leaves you more engorged and sensitive, more overwhelmed by a virility greater than their own. Before long the tightness reaches a distracting peak, and they stop swelling, leaving the rest of your internal plumbing to take up the slack.");
	}
	//Merge
	output("\n\nThe creamy deluge has so completely overpowered you that when you climax, you don’t even have a proper cum. That part of you is bent backward by the laquine’s flood and glued in place by her sticky spunk. You no longer have your own sense of tightness and rhythmic ejaculation, just mind-bendingly powerful pleasure that flexes with every hot load you take. Your [pc.cock " + x + "] goes halfway soft midway through, but you don’t care. You’re too addicted to the feeling of being cream-filled to do anything by moan for more.");
	output("\n\nThe sweaty laquine gives you that and more. She crams your cock so full that excess drools out around her in sticky, white webs. When her torrents of pearly, penis-packing release finally slow, she caresses your hypersensitive, half-hard mast until you’re crying with joy. When she pulls out, a river of alabaster sloughs down in her wake, puddling lamely from your gaped cock-hole.");
	output("\n\n<i>“Fuck, you’re a mess,”</i> she pants, zipping herself back up. <i>“A real dick-stuffed mess.”</i> The pirate-girl kneels down next to you and kisses you on the cheek, her tongue flicking out once to taste your sweat. <i>“You be sure and hold onto that little present until you find somebody to cum inside, ‘kay? Maybe your kid’ll have rabbit ears.”</i>");
	output("\n\nUnconscious closes in as she walks away. Maybe just a little nap...");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",sweatBunHyperCockDock4,x);
}
public function sweatBunHyperCockDock4(x:int):void
{
	clearOutput();
	showBoredJumper();
	output("The Jumper is gone when you wake, and your [pc.cock " + x + "] has mostly recovered from its ordeals, though you feel tremendously backed up.");
	if(pc.cumQ() >= 10000)
	{
		output(" A slight twinge of pain informs you that all that ecstasy was not without consequence.");
		if(pc.cumQualityRaw > 1)
		{
			output(" <b>You doubt you’re as virile as you used to be.</b>");
			pc.cumQualityRaw -= 0.1;
		}
		else output(" <b>You doubt you’ll produce as much ejaculate as you used to.</b>");
		if(pc.cumMultiplierRaw >= 15) pc.cumMultiplierRaw -= 2;
		if(pc.ballEfficiency >= 30) pc.ballEfficiency = -6;
		if(pc.balls > 0)
		{
			pc.ballSizeRaw += 0.25;
		}
	}
	if(!pc.hasStatusEffect("Blue Balls")) pc.createStatusEffect("Blue Balls", 0,0,0,0,false,"Icon_Sperm_Hearts", "Take 25% more lust damage in combat!", false, 0,0xB793C4);
	pc.ballFullness >= 100;
	output("\n\n");
	IncrementFlag("JUMPER_DOCKED");
	CombatManager.genericLoss();
}

//Alternate Loss: Slickyslick Tittybang
public function sweatBunSlickyslickTitbang():void
{
	output("Midway through your tumble to the ground, you spot a dangerous gleam in the Jumper’s eyes.");
	output("\n\n<i>“Mmm, look at all that jiggle.”</i> She crouches down on her powerful hindlegs, her skin-tight outfit creaking as it strains to hold on to bubbly ass. A finger reaches out to gently prod your [pc.chest]");
	if(!pc.isChestExposed()) output(", pausing momentarily to free them from their confinement");
	output(". Your boobs obligingly wobble, so she does it again, leaning so close that it seems her short muzzle is going to dive into your cleavage at any second. <i>“There’s so much of it!”</i> The rabbit-woman presses on either side to squeeze your tits together, forcing them to bulge up toward her mouth.");
	output("\n\nYour mounds rise higher and higher. The laquine’s hot breath washes across your nipples. She doesn’t wait a moment later, diving down to suckle one [pc.nipple], then the other,");
	if(pc.totalNipples() > 2) output(" and so on,");
	output(" tongue lashing around in ravenous, sweat-seeking strokes. The coiling muscle flicks back and forth rapid fire, then her lips seal into a greedy, sucking kiss. Meanwhile, her hands continue to avail themselves of your copious breastflesh. They squeeze and press and bounce your tits about");
	if(pc.lust() < pc.lustMax()) output(" until your rebellious form is nearly as excited as she.");
	else output(" like fuckable toys.");
	output("\n\n<i>“Heyyy, titty monster...”</i> the sweat-soaked bunny-slut coos, <i>“How about instead of that other thing, we have a little fun with these?”</i>");
	//Lust
	if(pc.lust() >= pc.lustMax())
	{
		output("\n\nYou arch your back and cry out in encouragement. At this point, you don’t care what she does to you as long as it quenches the burning need");
		if(pc.legCount == 1) output(" below.");
		else output(" between your [pc.legs].");
	}
	//HP
	else
	{
		output("\n\nThat doesn’t sound too bad so far as you’re concerned. You meekly nod, hoping she’ll satisfy herself with your chest and leave the rest of you unmolested. The decision has absolutely nothing to do with the fluttering of your heart or the slow blush spreading");
		if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN) output(" across your cheeks.");
		else output(" beneath your [pc.skinFurScales].");
	}
	//Merge
	output("\n\nFloppy ears nearly lifting in delight, the grinning bunny cheers, <i>“That’s real good, hun. Because I really need </i>somewhere<i> to put all this cum, and I think I might fall in love with these sweater-puppies given the chance.”</i> She bounces them between her palms and audibly groans. <i>“These are weapons grade tits! Fuck!”</i> Shaking her head, the sweat-soaked laquine shudders. <i>“I can’t believe I dug up such a treasure down here. You belong upstairs, with all the drugs and dick a gifted [pc.boyGirl] like you deserves.”</i>");
	output("\n\nA flutter of pleasure ripples through you at the unashamed praise. However ");
	if(pc.lust() < pc.lustMax()) output("unfortunate this situation");
	else output("forceful she might be");
	output(", you can safely admit that your captor has tremendous regard for the quality of your cleavage and the shapeliness of your bosom.");
	output("\n\n<i>“Aww, you like it when I get all dreamy over these tits, huh? Well I can’t help it. They’re ambrosial sugarmounds.”</i> The lawless laquine squeezes one fondly. <i>“You’re in for it now.”</i> Her other hand presses something on her hip that allows the latex around her groin to split open, spilling a [enemy.cock] onto your [pc.belly]. <i>“Just because I’m pinning you down doesn’t mean I won’t try to please you too, you know.”</i> She tweaks a [pc.nipple] playfully. <i>“Especially since I can’t drag my eyes off these beauties. Look at how the glisten!”</i>");
	output("\n\nYou glance down. The expensive swells of your superlative chest occupy a fair portion of your view, and sure enough, they do gleam in the mine’s faint lighting, painted thick with sweat from your fight and residual spit from the bunny-woman’s tongue. You can certainly see the appeal, especially with how your [pc.nipples] shine from all the attention.");

	//Dicknipples
	if(pc.hasDickNipples())
	{
		output("\n\nSpeaking of those lovely nubs, now that you’re thinking about them, you can feel your [pc.dickNipples] rousing from all the attention, and rather than trying to hold them back, you let them free. Inch after inch of rigid tumescence rises out of your chest to stab accusingly at the laquine’s shocked face. Seeing her pretty lips parted in such surprise only encourages them to grow a little bit further, high enough to graze one of her glistening cheeks.");
		output("\n\nOh stars, you can’t believe you got this hard from the mere prospect of titfucking!");
		output("\n\n<i>“You have dicknipples?! Holy tits!”</i> The lop-eared rabbit recoils in shock before gingerly reaching out to touch one.");
		output("\n\nIt twitches in response, filling you with a pang of pure pleasure.");
		output("\n\nShe gently runs her fingers around the rim of its mammary sheath, exploring your exotic anatomy in lustful wonder. The joint between jiggling tit and firm cock seems of particular interest to her, yet she doesn’t stay there long. Slender, latex-gloved hands wrap around one and pump it a few times. They work your newly revealed organ with the sort of easy confidence that can only come from years of dick-stroking.");
		output("\n\nYou can hardly be blamed for moaning in whorish delight or arching your back to present her with the other side.");
		output("\n\nThe bunny-slut giggles and lets go with a smile. <i>“Whoah there, silly! Just ‘cause your bangin’ tits come with fun-shaped hand-holds doesn’t mean I’m going to let you get off first!”</i> She leans between them and kisses your nose, her whiskers tickling your exposed nipple-pricks. <i>“I won our little fight fair and square!”</i>");
	}
	//Fuckable Nipples
	else if(pc.hasFuckableNipples())
	{
		output("\n\nSpeaking of your lovely ");
		if(pc.hasLipples()) output("lip-nip");
		else output("nub");
		output(", it parts wetly around the pirate’s finger when she presses a bit too hard, accepting it with a pang of pure pleasure. You can hardly be blamed for arching your back to take her in to the knuckle.");
		if(pc.canMilkSquirt()) output(" [pc.Milk] spills out around the intruder.");
		output(" Your velvety tit tunnel squeezes its rubberized mate reflexively until your eyes cross.");
		output("\n\nThe laquine yanks her hand back in shock. <i>“");
		if(pc.hasLipples()) output("Those lips are real?");
		else output("You have fuckable nipples?");
		output("! Holy tit-mods!”</i> She stares at her slick finger for a second before plunging both her hands into your pillowy breasts, thumbs pressing themselves deep into your sensitive tunnels. She works them around in slow circles, watching your face the whole time. Once you begin to squeal and shudder, the giggly girl yanks them away. <i>“Whoah there, silly slut! Just ‘cause your bangin’ tits come with bonus ");
		if(!pc.hasLipples()) output("cunts");
		else output("suck-holes");
		output(" doesn’t mean you get to get off first!”</i> She leans down to kiss your nose, her whiskers tickling your [pc.nipples]. <i>“I won our fight fair and square!”</i>");
	}
	//Lactation
	if(pc.isLactating())
	{
		output("\n\nAll the attention on those lovely nubs has certainly had an effect. [pc.MilkGem] droplets appear at the very tips, rolling off the sides in perfectly curved lines along the edges of your soon-to-be-fucked swells. With all the squeezing and pressing and sucking, you can’t be blamed for your body deciding to let down. Those droplets were just the beginning. With the proverbial cork popped, your [pc.chest] are free to trickle [pc.milkColor] fluid to their heart’s content.");
		output("\n\n<i>“Ohhh, somebody’s a milky momma, aren’t they?”</i> The lop-eared rabbit grabs one and squeezes, shooting thin arcs of [pc.milkNoun] into the air. <i>“Wow! Your eyes nearly rolled back the whole way! Do you need milked real bad?”</i> Her other hand falls on {your/a} spare tit and joins in on abusing your sensitive teats, alternating firm tugs until you’re painted [pc.milkColor]. <i>“Or maybe you figured you’d make a few bucks on the side, getting off on being a sopping wet slut. But then you didn’t figure on how good it would feel puddling in your cleavage. How weak it would make you to a big, fat, pirate-cock.”</i>");
		output("\n\nWarm, wet bunny ears slide through the puddle while the laquine tenderly samples of your boobies’ bounty. <i>“That’s okay though, you can make my dick nice and slippery, and we can squeeze out all that silly juice together, can’t we, cow-[pc.boyGirl]?”</i>");
		output("\n\nFeeling horny and almost too compliant, you nod.");
		output("\n\n<i>“That’s good, ‘cause I won our fight fair and square. Just ‘cause you’re a walking snack stop doesn’t mean you get relief first.”</i>");
	}
	//Merge
	processTime(10);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",sweatBunSlickyslickTitbang2);
}
public function sweatBunSlickyslickTitbang2():void
{
	clearOutput();
	showBoredJumper(true);
	output("The laquine abruptly thrusts her [enemy.cock] deep into your ");
	if(!pc.hasDickNipples() && !pc.hasFuckableNipples() && pc.isLactating()) output("soaking");
	else output("sweat-slicked");
	output(" cleavage, holding your [pc.chest] still with her hands");
	if(pc.bRows() > 1) output(" and forearms. There’s almost too much boob for her to control, but she looks more than happy to try!");
	else output(".");
	output(" <i>“Ah!”</i> Her hips settle onto your [pc.belly], wiggling in delight as she adjusts to the sudden, soft compression. <i>“Mmmmm, good as a pussy and twice as pretty.”</i>");

	//Tits not I-cup or higher
	if(pc.biggestTitSize() < 24) output("\n\nJutting out of your cleavage, the laquine’s [enemy.cock] throbs demandingly.");
	//Else
	else output("\n\nBuried deep in your cleavage, the laquine’s [enemy.cock] throbs demandingly against your [pc.skinFurScales].");
	//Merge
	output("\n\n<i>“Hold onto your tits, sweetness,”</i> the pirate giggles, pleasure-drunk. <i>“No wait, I’ve got that covered!”</i>");
	if(pc.hasDickNipples()) output(" Her grip shifts to grab hold of your [pc.dickNipples], giving them a solid pump to seat her fingers solidly around the throbbing bases.");
	else if(pc.hasFuckableNipples())
	{
		output(" Her grip shifts to offer her thumbs access to your ");
		if(!pc.hasLipples()) output("[pc.nippleCunts]");
		else output("[pc.lipples]");
		output(". They slide into the wet, sensitive cavities with ease, wiggling once to seat themselves as deeply as possible.");
	}
	else if(pc.isLactating()) output(" Her grip shifts to stroke your [pc.nipples], expressing a fresh puddle of [pc.milkNoun] onto her submerged prick.");
	else output(" Her grip shifts slightly to allow her to playfully stroke your nipples.");
	output(" <i>“I swear that made you warmer. Okay, actually going this time...”</i>");

	output("\n\nThe heavy thickness of your pirate partner’s ");
	if(enemy.cocks[0].cType != GLOBAL.TYPE_HUMAN) output("inhuman");
	else output("swollen");
	if(!pc.hasDickNipples() && !pc.hasFuckableNipples() && pc.isLactating()) output(", milk-drenched");
	else output(", sweat-soaked");
	output(" cock slides through your cleavage in reverse. For a moment, you feel startlingly empty. Then it’s plowing back inside, splitting your [pc.chest] with latex-scented laquine dick.");
	if(pc.hasDickNipples()) output(" The motion causes your [pc.dickNipples] to twist in her grip, and the sensitive organs to drool liquid excitement all over the inky black fingers.");
	else if(pc.hasFuckableNipples())
	{
		output(" The motion causes her rubbery thumbs to twist in your ");
		if(!pc.hasLipples()) output("[pc.nippleCunts]");
		else output("[pc.lipples]");
		output(", making it next to impossible to think.");
	}
	else if(pc.isLactating()) output(" [pc.Milk] spurts out from all shaking, helped along by the ink-black fingers that love to tease and squeeze your [pc.nipples].");
	output(" You lie there helplessly, your cleavage bouncing around a pirate’s big dick, and... ");
	if(pc.isBimbo()) output("fucking loving it! Omigod, why didn’t you do this sooner?");
	else if(pc.libido() >= 50) output("sort of loving it.");
	else output("sort of liking it.");

	output("\n\n<i>“Yeah, you like that, doncha baby? My dick in stuffed so deep in there... I can feel your heartbeat all the way in my cock! God!”</i> She heaves back and plants her mast in once more, bracing for a moment before launching into an even faster rhythm. Powerful hips drive the laquine’s musky cock through your cleavage faster than you thought possible. Your tits flop around like crazy");
	if(pc.hasDickNipples()) output(", the friction on your [pc.dickNipples] the only thing to stabilize them");
	else if(pc.hasFuckableNipples())
	{
		output(", the pressure on your ");
		if(pc.hasLipples()) output("[pc.lipples]");
		else output("[pc.nippleCunts]");
		output(" reaching a toe-curling plateau");
	}
	else if(pc.isLactating()) output(", spraying milk into the air");
	else output(", little more than the bunny’s playtoy");
	output(".");
	output("\n\nAny reluctance you might have had is long gone, battered away by the bunny-slut’s powerful thrusts. Wanton enjoyment rises to take its place, and you find yourself cupping your arms around your [pc.fullChest] to hold them together. With a more stable channel to fuck, the laquine can screw you harder, driving her overpoweringly erect member into your cleavage with superhuman vigor. When she looks down at you, you can feel her cock throb and drool, its slime");
	if(pc.hasDickNipples()) output(" mixing with the drizzling fruit of your nipple-dicks");
	else if(pc.isLactating()) output(" mixing will all the [pc.milkNoun]");
	else output(" turning your [pc.skinFurScales] into slick, cock-pleasing pathway");
	output(".");
	output("\n\n<i>“Fuck, you look hot,”</i> the laquine moans");
	if(pc.hasDickNipples()) output(", jerking you off with every bone-burying thrust");
	else if(pc.hasFuckableNipples()) output(", fingering you with reckless abandon");
	else if(pc.isLactating()) output(", barely managing to keep up with her milking");
	output(". <i>“You’re going to look so nice covered in cum, and I’m going to drench you in it, honey. It’s going to be so hot!”</i> She takes a hand off to stroke one bouncing tit’s pillowy expanse, marvelling at how her fingers sink into the quivering flesh, at how every inch of your flushed body is hot and bothered by her rapid-thrusting dick.");

	output("\n\nYou nod");
	if(pc.biggestTitSize() < 24) output(" and lick her [enemy.cockHead] during one particularly penetrative thrust");
	else output(" and lick at some of the pre that’s leaking out of the top of your cushiony crevasse");
	output(".");
	if(pc.hasFuckableNipples() || pc.hasDickNipples() || pc.isLactating())
	{
		output(" You’re so close yourself. ");
		if(pc.hasDickNipples()) output("All that backed up pressure behind your [pc.dickNipples] is going to let loose soon! A bit more and you’ll be clenching and squirting and drenching yourself in a wave of your own nipple-bound seed.");
		else if(pc.hasFuckableNipples())
		{
			output("All the attention your ");
			if(!pc.hasLipples()) output("[pc.nippleCunts]");
			else output("[pc.lipples]");
			output(" are getting is driving you mad! A little more and you’ll be clamping down, clutching and squeezing and begging to have that hot cum wash over you.");
		}
		else 
		{
			output("All the bouncing, squeezing, and gushing you’re doing has you on the cusp of a lactic orgasm. A little more and you’ll be leaking");
			if(pc.bovineScore() >= 3) output(" and mooing");
			output(" while you squirt like a dairy slave.");
		}
	}
	output("\n\nThe bunny girl throws back her head and cries out at the top of her lungs, <i>“Yes!”</i> Her ears flip with her, spattering you with sweat and spittle. Yet that salty deluge is just the beginning. She slams her dick in to the hilt, balls slapping into the underside of your [pc.chest], and lets loose. Hot, bubbling, almost boiling bunny-cum surges ");
	if(pc.biggestTitSize() >= 24) output("into your slickened tits");
	else output("out onto your face and into your slickened tits on the outstroke");
	output(". Instead of holding in place, the ecstatic rabbit is jackhammering you faster.");

	output("\n\n<i>“Love these fat fucking unmmm... mmm... cow titties...”</i> she moans, tail blurring with the speed of its happy wagging. Jet after jet of seed impregnates your chest");
	if(pc.hasNippleCunts()) output(", perhaps literally as her fingers scoop some into a now-gaping nipple. Spunk");
	else output(". It");
	output(" bursts out with so much force that you can feel it pry apart your tits to pour down your neck and burst onto your [pc.belly]. Fortunately her hands are there to squeeze them back together");
	if(pc.hasDickNipples() || pc.hasFuckableNipples() || pc.isLactating())
	{
		output(", to drive you over the edge");
		if(pc.hasDickNipples()) output(" with ecstatic stroking, milking you into the mess, demanding you let loose every drop with her");
		else if(pc.hasFuckableNipples()) output(" with rabid pumping and the incredible heat of her jism");
		else output(" with a fervent squeeze that wrings every last drop from you");
	}
	output(".");
	output("\n\nYou smell her cum too, the musky odor filling your nostrils");
	if(pc.isBimbo()) output(" - too-yummy!");
	else output(".");
	output(" It’s everywhere, sliding into your hair, spurting onto your face while the playful laquine teasingly pulls your tits wide to shoot a rope onto your [pc.lips]. Pearly goo sloughs into your simmering crotch, mixing with sweat on its way down to your [pc.legOrLegs].");
	if(pc.hasDickNipples() || pc.hasFuckableNipples() || pc.isLactating()) output(" And you don’t care in the slightest. Your tit-based climax makes it all worth it. You’d let her fuck her way to another orgasm if she wanted to, so long as she could make your boobs glow with molten bliss like this once more.");
	else if(pc.isBimbo()) output(" And you don’t care in the slightest. You love cum! You’d take a bath in if you could, let her fuck you in a tub until bunny-spunk is sloughing over the edge.");
	else 
	{
		output(" And you don’t mind much at all. A deep sense of emotional satisfaction rises alongside the tide of bunny-spunk. The knowledge that your tits drove her to such a state is pleasing in a way that nicely compliments your unsated arousal. You have no doubt you’ll be masturbating to this once she’s gone, but for now, you revel in it, little more than ");
		if(pc.bRows() == 1) output("a set");
		else output("sets");
		output(" of too-happy boobs serving as a cum-dumpster.");
	}
	output("\n\n<i>“Ahh... ahh... so hot!”</i> The bouncing babe moans and jerkily works her hips, sending waves of pearly goo up your neck and chin. On the backstroke, a pocket of the superheated spooge develops in your tits, then bursts out when it overpowers the press of your hands, squirting onto a latex-girded thigh. <i>“So gooooood. You...”</i> She pants, jerking her thighs a few last times, the dregs of her orgasm individually greater than a typical terran’s. <i>“You look so wonderful like that, plastered in cum. I bet the other Jumpers won’t even touch you now.”</i>");
	output("\n\nThe short-furred futanari stands up, dick regrettably sliding free of your swampy titflesh. <i>“Let it soak in. Next time I come down here looking for a sweaty slut to bang, I’m gonna smell my way right back to you.”</i> She tucks away her cum-smeared cock, zipping up the side and stepping to the side. <i>“Right back to those magical tits. Don’t wait up.”</i>");
	output("\n\nYou watch her walk away, ass shining hypnotically. You... you’ll get up in a minute.");
	output("\n\n");
	processTime(20);
	if(pc.hasDickNipples() || pc.hasFuckableNipples() || pc.isLactating()) pc.orgasm();
	if(pc.isLactating()) pc.milked(100);
	pc.applyCumSoaked();
	CombatManager.genericLoss();
}

//Cum Covered Loss - No sex!
public function cumCumCoverLossForSweatquine():void
{
	output("The victorious Jumper gets a bit closer, bending over you. Her nose wrinkles from the smell of your fluid-soaked form. <i>“Somebody else really did a number on you.”</i> She sighs. <i>“Maybe I’ll uh...”</i> You note that the cock-shaped distention in her jumpsuit is a little smaller. <i>“...find someone else. Yeah. Course you can pay me back for wasting my time, can’t ya?”</i> She rifles through your equipment without much care.");
	//Credits:
	if(pc.credits >= 2)
	{
		output("\n\n<i>“Ah, cold hard credits.”</i> The sweating bunny holds up a ");
		if(pc.credits >= 200) output("fistful of credit chits");
		else output("a credit chit");
		output(". <i>“Almost as good as sex.”</i>");
		var stolenCreds:Number = pc.credits;
		if(stolenCreds > 1000) stolenCreds /= 2;
		if(stolenCreds > 5000) stolenCreds /= 2;
		if(stolenCreds > 10000) stolenCreds /= 2;
		if(stolenCreds > 20000) stolenCreds /= 2;
		if(stolenCreds > 40000) stolenCreds /= 2;
		if(stolenCreds > 80000) stolenCreds /= 2;
		if(stolenCreds > 200000) stolenCreds /= 2;
		stolenCreds = Math.ceil(stolenCreds);
		if(stolenCreds > pc.credits) stolenCreds = pc.credits;
		pc.credits -= stolenCreds;
	}
	//Gems
	if(pc.hasItemByClass(Picardine) || pc.hasItemByClass(Satyrite) || pc.hasItemByClass(Savicite) || pc.hasItemByClass(Kirkite))
	{
		output("\n\n<i>“Oooh, sparkly!”</i> The sweating bunny holds a gem aloft. <i>“Not as good as a sack full of credits, but I’m sure I can pawn it to someone.”</i>");
		if(pc.hasItemByClass(Picardine)) pc.destroyItemByClass(Picardine);
		else if(pc.hasItemByClass(Satyrite)) pc.destroyItemByClass(Satyrite);
		else if(pc.hasItemByClass(Savicite)) pc.destroyItemByClass(Savicite);
		else if(pc.hasItemByClass(Kirkite)) pc.destroyItemByClass(Kirkite);
	}
	else
	{
		output("\n\n<i>“Awww, just my luck. You’re broke, and more broken in than the village hover-cycle.”</i> The sweating bunny rears up for a kick, then glances back down, stopping herself.");
	}
	//Merge: no new pg:
	output("\n\nShe steps away from you, careful not to get any of the caked-on juices on her suit. <i>“Grab yourself a shower, and I’ll give you a real welcome to Zheng Shi, but uh... don’t be afraid to work up a sweat while you wait for me. ‘Kay?”</i>\n\n");
	CombatManager.genericLoss();
}