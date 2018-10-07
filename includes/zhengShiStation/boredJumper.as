import classes.Characters.JumperBored;
//Random sweaty bunnygirl in a latex jumpsuit with a real craving for some hot, sweaty sex. Part of the “Jumper” gang.
	//Shapely! E-cups!
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
	if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) showBust("BORED_JUMPER_EQUINE" + (nude ? "_NUDE" : ""));
	else if(enemy.hasCock(GLOBAL.TYPE_FELINE)) showBust("BORED_JUMPER_FELINE" + (nude ? "_NUDE" : ""));
	else if(enemy.hasCock(GLOBAL.TYPE_CANINE)) showBust("BORED_JUMPER_CANINE" + (nude ? "_NUDE" : ""));
	else showBust("BORED_JUMPER_TERRAN" + (nude ? "_NUDE" : ""));
}

//Approach Proc Texts:
public function boredJumperAttackProc():Boolean
{
	var tEnemy:JumperBored = new JumperBored();
	setEnemy(tEnemy);
	showBoredJumper();
	//First time
	if(flags["BORED_JUMPER_JUMPED"] == undefined)
	{
		output("\n\nA faint creaking sound is the only warning you get before a latex-wrapped ");
		if(!CodexManager.entryUnlocked("Laquines")) output("bunny-girl");
		else output("laquine");
		output(" bounds into the room. She glances at you with sultry intent in her eyes and announces, <i>“You’ll do.”</i>");
		if(!CodexManager.entryUnlocked("Laquines")) output("\n\nA chirp from your Codex notifies you that she is a member of the ‘laquine’ race, known for their libido and single hermaphroditic sex.");
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

	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
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
	flags["BORED_JUMPER_CONSECUTIVE_LOSSES"] = 0;
	//HP
	if(enemy.HP() <= 1)
	{
		output("The bored Jumper tumbles to the ground, clutching one arm and looking up at you in... adoration? She smiles shyly and reaches into a pouch. You bring up your guard, but it’s unnecessary. She lifts the medical-grade injector to her neck and releases the payload with a hiss of discomfort. <i>“Okay hot s-s-tuff.”</i> The distention in her crotch jerks forward, stretching her suit. <i>“Mmmm, so warm.”</i> Her visible injuries knit before your eyes, but her nipples look firm enough to serve as improvised weapons. <i>“Was saving this for you, if I had to beat you down, but I guess uh... now you get to be in charge.”</i>");
	}
	//Lust
	else
	{
		output("The bored Jumper tumbles to the ground, arching her back and thrusting her crotch against her palm. Latex squeaks against latex as she assails her body with reckless abandon. The sweaty bunny roughly gropes her own breast, staring at you with wild, adoring eyes. <i>“F-f-fuck, you’re so fucking hot. You know that right? I don’t even care anymore. Fuck me how you want! Screw me so silly I sleep through my next job - just fuck me!”</i>");
	}
	//Merge
	//Now enough lust.
	if(pc.lust() <= 33)
	{
		output("\n\nUnfortunately for her, you’re far too sated to give a shit about giving her the struggle-cuddles she so desires.");
		
		clearMenu();
		addButton(0,"Next",leaveTheBoredJumperAfterWinning);
		return;
	}
	//Enough
	else output("\n\nYou aren’t sure why, but she seems more than into the idea of being your personal fuck-puppet for a few hours. What do you want to do with her?");
	
	clearMenu();
	//addDisabledButton(1,"Sex","Sex","These scenes haven’t been written yet. Sorry!");
	if(pc.hasCock())
	{
		if(pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(0,"FuckHerPussy",bunslutBigPussyBunFucking,undefined,"Fuck Her Pussy","You know what this is...");
		else addDisabledButton(0,"FuckHerPussy","Fuck Her Pussy","No way! That cunt’s wayyyyy too small for you.");
	}
	else addDisabledButton(0,"FuckHerPussy","Fuck Her Pussy","You need a penis for that.");
	if(pc.hasGenitals()) addButton(1,"Frottage",frottageVictoryVsBoredJumperByB,undefined,"Frottage","Grind your way to victory!");
	else addDisabledButton(1,"Frottage","Frottage","You need genitals for this scene.");
	if(pc.hasGenitals()) addButton(2,"Suit Burster",meanHandySuitBurster,undefined,"Suit Burster","Tease the laquine Jumper till she bursts out of her suit.");
	else addDisabledButton(2,"Suit Burster","Suit Burster","You need genitals for this scene.");
	if(pc.hasVagina()) addButton(3,"Get Licked",facePussyFuckJumper,undefined,"Get Licked","Put her mouth to work on your [pc.vaginas].");
	else addDisabledButton(3,"Get Licked","Get Licked","You need a vagina for this.");
	
	if(pc.hasCock())
	{
		if(pc.cumQ() >= 1000) addButton(4,"Fill ‘Er Up",fillErUpBBY,undefined,"Fill ‘Er Up","Open up her suit and give her a cream filling.");
		else addDisabledButton(4,"Fill ‘Er Up","Fill ‘Er Up","You’re not quite ‘potent’ enough to give a good stuffing during this.");
		if(pc.cockThatFits(700) >= 0) addButton(5,"Facefuck",penisRouter,[faceFuckTheLaquineJumperooni,700,false,0],"Facefuck","Grab a face and give it a fuck. Pretty self-explanatory.");
		else addDisabledButton(5,"Facefuck","Facefuck","You’re pretty sure she’s not a snake, so dislocating her jaw with your giant dick wouldn’t be the best idea.");
	}
	else 
	{
		addDisabledButton(4,"Fill ‘Er Up","Fill ‘Er Up","You need a dick to do this.");
		addDisabledButton(5,"Facefuck","Facefuck","You need a dick to do this.");
	}
	
	addButton(6,"TakeHerDick",takeTheBunnyDick,undefined,"TakeHerDick","The slut-bunny has powerful legs. More importantly, she has a big, juicy, gorgeous cock. You could get that furry futa ready and give her the perfect chance and place to use those assets.");
	
	if(!pc.hasCock()) addDisabledButton(7,"Cowgirl","Cowgirl","You’ll need a cock to fuck the tricksy rabbit with.");
	else if(pc.cockThatFits(enemy.vaginalCapacity(0)) < 0) addDisabledButton(7,"Cowgirl","Cowgirl","You would split her in half!");
	else addButton(7,"Cowgirl",boredJumperCowgirlWinByWilliam,undefined,"Cowgirl","Use the lewd leporine’s steamy mouth to get yourself ready before bouncing her on your lap and then some.");
	
	if(pc.hasVagina()) 
	{
		if(pc.hasItemByClass(BreedersBliss,2)) addButton(8,"Heat Sex",heatSexLaquineJumper,undefined,"Heat Sex","It’s as hot as any layer of Hell already, but you could really cook that bun until every sense but sex in her billowing brain melts away...");
		else if(pc.inHeat() && pc.hasItemByClass(BreedersBliss,1)) addButton(8,"Heat Sex",heatSexLaquineJumper,undefined,"Heat Sex","It’s as hot as any layer of Hell already, but you could really cook that bun until every sense but sex in her billowing brain melts away...");
		else addDisabledButton(8,"Heat Sex","Heat Sex","You’ll need some ‘breeding inducers’ to get ruined with the lusty laquine. " + (pc.inHeat() ? "One":"Two") + " Breeder’s Bliss ought to do...");
	}
	else addDisabledButton(8,"Heat Sex","Heat Sex","You’ll need a vagina for this.");
	addButton(9,"Blow Her",blowZatJumpah,undefined,"Blow Her","he jumper’s cock is bulging so temptingly against the latex. You could teach the libidinous lapine a very <i>blue</i> lesson... or immerse yourself. She does smell good...");
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
{	IncrementFlag("BORED_JUMPER_CONSECUTIVE_LOSSES");
	if(flags["BORED_JUMPER_CONSECUTIVE_LOSSES"] == 3) loseToJumpersStartBadEndsByWill();
	else if(flags["BORED_JUMPER_CONSECUTIVE_LOSSES"] == 4) fourthLossToBoredJumperBadEndProggo();
	else if(flags["BORED_JUMPER_CONSECUTIVE_LOSSES"] >= 5) badEndToThatJumperFinally();
	else if(pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched")) 
	{
		cumCumCoverLossForSweatquine();
		flags["BORED_JUMPER_CONSECUTIVE_LOSSES"]--;
	}
	else if(pc.isTaur()) taursLoseToSweatLaquineByWsan();
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
		else output("Her nimble fingers brush your [pc.cocks] by accident, enough to make your proud tumescence pulsate with pleasure.");
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
	//Potential pagebreak?
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
	output("\n\nFortunately the laquine actually smells sort of... nice. She’s a little musky, maybe, laced with a spicy note of alien scent that presume must be her long-stewed body odor. Nose wrinkling, you sniff again, too fascinated by the aroma in the do care when she shifts higher... and higher, presenting you with the twitching [enemy.cockHead] of her dick.");
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
	if(pc.canDeepthroat()) output(" Your nose nestles into her pheromonally drenched nut-fuzz.");
	else output("Your gag reflex doesn’t give you too much trouble this time, though you don’t take her the entire way.");
	output("\n\nMeanwhile, the slut-bun’s mouth is all over the lower half of your body. She’s already seen to licking your thighs, your [pc.belly], and even brought her maw down to visit your crotch. Boiling hot kisses pepper that sensitive flesh, all while her paw continues to tease and abuse your tenderest places");
	if(pc.hasCock()) output(", squeezing you until you ache with the need to cum");
	else if(pc.hasVagina()) output(", fingering you until you’re aching with the need to clamp down and cum");
	output(". Your [pc.hips] squirm around on autopilot, your brain fully occupied with tending to the bunny-bitch’s fragrant dong.");
	output("\n\n<i>“Fuck yeah, suck that cock!”</i> The lusty pirate cries, thrusting hard into your face");
	if(pc.canDeepthroat() || pc.isBimbo()) output(", not that it matters. Silly girl! You’ve sucked her so deep and so hard that there’s no position for her to take besides ‘balls-deep’.");
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
	else output("the biggest totem pole of a cock");
	output(". <i>“I had some other things in mind, but do you know what?”</i> She tweaks you just behind the [pc.cockHead " + x + "] with her toes. <i>“I think... I think I’m gonna fuck your cock.”</i> She slides it down your entire ");
	if(pc.isErect()) output(num2Text(Math.round(pc.cocks[x].cLength() / 12)) + "-foot");
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
	output("\n\n<i>“‘Kay!”</i> the bunny-girl chirps. She springs up, floppy ears twirling around her, flinging arcs of sweat at the walls as she rotates around into a better position. Her tail, the one bit of fluff her suit exposes, twitches happily. <i>“Now to just...”</i> She cups your bulging urethra in one hand and pumps it, redoubling the pressure. <i>“...pop the cork.”</i> A twist of the pirate’s wrist spins her dick-impaling finger wetly around. Pre chases it when she yanks it out, puddling prettily on her palm to display just how <i>slicked</i> the inside of your dick is for the sweaty bunny’s use.");
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
		output("\n\n<i>“Ohhh, somebody’s a milky momma, aren’t they?”</i> The lop-eared rabbit grabs one and squeezes, shooting thin arcs of [pc.milkNoun] into the air. <i>“Wow! Your eyes nearly rolled back the whole way! Do you need milked real bad?”</i> Her other hand falls on " + (pc.totalBreasts() == 2 ? "your" : "a" ) + " spare tit and joins in on abusing your sensitive teats, alternating firm tugs until you’re painted [pc.milkColor]. <i>“Or maybe you figured you’d make a few bucks on the side, getting off on being a sopping wet slut. But then you didn’t figure on how good it would feel puddling in your cleavage. How weak it would make you to a big, fat, pirate-cock.”</i>");
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
	output(" It’s everywhere");
	if(pc.hasHair()) output(", sliding into your hair");
	output(", spurting onto your face while the playful laquine teasingly pulls your tits wide to shoot a rope onto your [pc.lips]. Pearly goo sloughs into your simmering crotch, mixing with sweat on its way down to your [pc.legOrLegs].");
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

//Bunslut Big Pussy-Bun Fucking
//By QuestyRobo
public function bunslutBigPussyBunFucking():void
{
	clearOutput();
	showBoredJumper(true);
	author("QuestyRobo");
	output("The beaten-down bun bounces her breeding hips into the air as she begs you to fuck her. Her protruding package pendulously swings with her movements. As the sealed sex organs bounce it gives you a glimpse of the other half of her sexuality. A pair of fat pussy lips distends her shiny latex suit, so tight against their confines that you can make out almost every detail. Your [pc.cocks] rocket");
	if(pc.cockTotal() == 1) output("s");
	output(" to full hardness as you get a full look at the laquine slut’s womanhood.");
	output("\n\nThe bounding slut sees ");
	if(!pc.isCrotchExposed()) output("the distended state of your [pc.crotchCover]");
	else 
	{
		output("your member");
		if(pc.totalCocks() > 1) output("s");
		output(" shamelessly erect and swaying in the open");
	}
	output(" and coos in approval. <i>“Oh yeah, seeing something you like, big " + pc.mf("guy","girl") + "?”</i> She rolls over and pushes her big bunny booty out at you, squeezing her puffy cunt between her meaty thighs. The way her plush lips squeeze and compress between her legs is mesmerizing, and you start thinking about how... <i>“Bet you’re thinking about how that dick of yours is gonna feel when you’re fucking me?”</i>");
	output("\n\n<i>“... Maybe.”</i>");

	output("\n\n<i>“Then come and unwrap your present!”</i> The bunny slut reaches back and pulls her cheeks apart before releasing them, letting the bountiful, muscular globes bounce against each other as her hips continue to slide along her engorged outer lips. It’s an offer that’s too good to turn down and you strut up to the laquine whore, grab her by the jiggling bunny butt, and kneel down to get a nice closeup of her lower lips. Being this close makes the sheer tightness of her suit even more obvious. If you didn’t know any better, you’d say that this was actually her skin. A close inspection of her honeypot even reveals that the latex is so tight that it extends a few inches into her pussy!");

	output("\n\nShe takes you by the hand and guides you to the zipper of her suit. From there she leaves you to undress her. You do so with gusto, practically ripping her zipper off as you pass over her weighty tits. A wave of heat bellows out as you release the seal of her suit. Hours, maybe even days of built up heat and sweat are finally released as the bunslut lets out a hearty sigh.");

	output("\n\n<i>“Aaaah, that’s the good stuff. Feels almost as good to let it all out as it does to let it sit.”</i> You ignore it for now, even as your hand starts to sweat harder just from being close to her. The real obstacle comes with her [enemy.cock]. It’s fully, throbingly erect, and the suit is so tight against it that you have no end of trouble getting the zipper up and over it. She groans and huffs as you try, and the fact that she’s enjoying the struggle is painfully obvious as her [enemy.cockNoun] throbs shamelessly.");

	output("\n\n<i>“D-don’t be afr-afraid to, uuugh! To get real rough with that sucker. Yank it good, space [pc.boyGirl]!”</i> Honoring her request, you pull the zipper as hard as you can, hearing her moans build at an exponential pace as you yank. It slowly jerks up her shaft, working itself free of the pillar of hot meat. Her moans reach a crescendo as you near the tip, and a balloon of her cum starts filling before you can get it all the way over. Not wanting to get blocked from your prize by her jizz, you give the zipper one last yank, sending it all the way over and breaking the jizz balloon, creating a puddle of the stuff under her that she continues to contribute to.");
	output("\n\nYou finish unzipping her as she continues to cum. You have to practically dig the suit out of her pussy, an act that only serves to draw out the skank’s orgasm. Opening her suit around her honeypot is like busting open a dam. Her juices flow out in waves, mixing with her cum into a sexual slurry.");
	output("\n\nWith her zipper all the way down, you’re finally able to pull her suit completely off. There’s still a good bit of cling to it, but you’re eventually able to yank it clean off. Her body almost sizzles from the heat and aftermath of her orgasm. Her fat lips wink at you as her hips start wiggling at you again.");
	processTime(20);
	clearMenu();
	addButton(0,"Next",bunslutPussFuck2);
}
public function bunslutPussFuck2():void
{
	clearOutput();
	showBoredJumper(true);
	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0) * 2);
	if(x < 0) x = pc.smallestCockIndex();
	author("QuestyRobo");
	output("You press your face between her beefy bun thighs, barely an inch from her entrance. Stars, you thought it was hot before; just being this close to her overheated form is like going into a sauna! You swear the juices coating her lips are actually steaming, but that’s far down your list of priorities.");
	output("\n\nYou stick your [pc.tongue] into her cunt, recoiling slightly at first as the almost inhuman temperature near-singes your tongue. Once you’ve battered through the heat you dive as far into her as possible");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", which is quite deep, thanks to your anatomy");
	output(", feeling every overcooked fold and drop of boiling pussyjuice landing on your exploring oral organ. The laquine groans and squirts another drop of bunny cum from her still-hard member, adding to the sex-juice soup below her.");

	output("\n\nHer cunny squeezes down on your tongue like it were a cock, but the overexcited little hole is going to have to wait for that. Perhaps not as long as you’d want though. As she gets closer to orgasm, the muscles in her vagina pull harder and harder, to the point where you feel like she’s trying to rip your tongue clean out of your mouth! You pull out, though you still tipped her over enough that your tongue is followed by a torrent of hot ladyjuice that splatters all over your face.");
	output("\n\n<i>“Come on, I’m not done yet!”</i> And you haven’t even started!");
	if(!pc.isCrotchExposed()) output(" You undo your [pc.lowerGarments], letting them drop limply to the floor as you brandish your [pc.cockNounSimple]. You slap her pussy with it, causing the bun-bitch to groan out.");
	else output(" You slap her pussy with your [pc.cock], causing the bun-bitch to groan out.");

	output("\n\n<i>“Fuuuuuuuuck, do that again!”</i> You do so, grabbing the base of your member and mightily slapping her womanhood. There’s so much padding from her outer lips that it feels like beating your meat against a lavish pillow rather than a slut’s pelvis. You go and go until she screaming out in pleasure, her voice echoing off the walls as you pound on her. Eventually you tire of the teasing and rear back to start fucking her in ernest.");
	output("\n\n<i>“Hell yeah hot stuff! Don’t even think about that slow shit, we laquines like it <b>rough</b>!”</i>");
	if(pc.cockVolume(x) > enemy.vaginalCapacity(0)) output(" You get the feeling she <i>might</i> not know exactly what she’s getting into here, but you press on anyway.");
	else output(" That’s an invitation if you ever heard one, and you press on!");

	if(pc.cockVolume(x) > enemy.vaginalCapacity(0) * 1.5) 
	{
		output("\n\nHer lips open up surprisingly easily. You imagine laquines are made to take ‘em, but you’re more equipped to breed taurs. Your confusion fades as the initial ease turns into tightness, and she yells out.");
		output("\n\n<i>“H-holy fuck! Why are you so big?”</i>");
		output("\n\nYou mockingly shrug your shoulders with a smirk as her initial look of terror at your inhuman endowment turns to one of resolve.");
		output("\n\n<i>“Okay fuckmeat! I bet just cause you have that big, dumb thing it doesn’t mean you know how to use it. So FUCK me! Fuck me til I break! If you can of cooooooooooooooooooourseeeeeeeee!”</i> Her voice breaks as soon as you drive a foot of your monumental cock into her. You continue to cram yourself in until you feel yourself bottom out against her cervix. She claws at the hot ground below her as her eyes cross and her mouth hangs open. Looks like she was all talk.");
		output("\n\n<i>“I-i-is that all you got?”</i> she weakly stammers out. Evidently she still has some fight in her. Time to see how long that lasts! You pull out, feeling her muscles cling to you, just as powerless to stop you from leaving as they are at keeping you out. Proof of that comes when you bottom out again with minimal resistance. She groans and gurgles, still trying to goad you on, but finding it hard to even keep herself together.");
		pc.cockChange();
		output("\n\nEvery thrust breaks her down even more. You keep them slow and deliberate, if not to spare her sanity, than to spare your [pc.hips] of having to carry such a monumental package through rapid movements. That doesn’t mean you’re going easy on her, though. Every time you feel like the little cocksock is getting too used to you, you up the tempo just enough to beat her back down. If she wants you to break her, that’s damn well what you’re going to do!");
		output("\n\nAnother dozen, herculean thrusts later and she’s a broken mess on the floor, spasming in pleasure and babbling out barely-coherent reverence for your unbelievable monster. The beating heat of your [pc.cock] actually hammers you almost as much as it does her. Cramming so much fat, sensitive flesh in such a tight hole is a task in of itself, and it takes all of your willpower to keep yourself from blowing on the spot. The writhing of the brain-fucked bunslut only makes it harder to keep it together, and before long you feel the telltale tightness in your [pc.balls].");
		if(pc.cumQ() < 500) 
		{
			output("\n\nYour shaft shudders as it starts unloading into the laquine skank. Compared to the goliath size of your cock, your orgasm is pitiful in comparison. Despite being close to insensate, the bunny bitch still gets out one last jab.");
			output("\n\n<i>“All bark and no bite huh? weeeeeeeeeeeeeeeeeeeeeeeeeeeeak...”</i> She passes out with your mammoth member still lodged inside her.");
		}
		else if(pc.cumQ() < 5000)
		{
			output("\n\nYour shaft throbs heavily as your load funnels through your urethra into the laquine slut. Whatever small crevices there were that weren’t filled out by your monstrous meat are almost immediately filled with [pc.cum]. The furry cocksock groans as her body is even further reduced into a receptacle for your lusts; not like she seems to mind all that much. By the time you’re done, you’ve reduced her to a happily babbling little cum balloon, rubbing her doubly swollen belly in blissed-out reverence.");
			output("\n\nHer eyes flutter shut as your cock slowly starts softening inside her, passing out after the intense session.");
		}
		else
		{
			output("\n\nYour cock bloats as your mighty load distends your urethra. The laquine slut breaks out of her stupor for a moment as the explosive eruption of your orgasm rockets into her.");
			output("\n\n<i>“What the fuck are you!”</i> She screams out as her body is flooded in an instant. Her stomach swells out obscenely, every nanometer of empty space getting overstuffed with copious amounts of [pc.cum]. It’s enough that even the outline of your ridiculous dick is lost in it. The pressure is so great that you have to grab her and hold her down just to keep her from flying off. Huge ribbons of jizz fly out of the tight seal of her cunt, washing away her own cum puddle from earlier, in favor of you cum river.");
			output("\n\nThe laquine lost consciousness long before your orgasm subsided, contently snoozing despite being stuffed to the brim with cock and cum.");
		}
		output("\n\nYou pull out of the unconscious bunny slut and wipe the remaining residue off on her ass and thighs. With your [pc.cock] all cleaned up");
		if(!pc.isCrotchExposed()) output(" and shoved back into your [pc.crotchCover]");
		output(", you take your leave of her, letting fate decide what happens next.");
	}
	//Not stupid big dodongos:
	else
	{
		output("\n\nHer fat bunny pussy takes everything you have with ease, the thick lips hungrily throbbing against your skin as you find yourself balls-deep.");
		output("\n\n<i>“");
		if(pc.cockVolume(x) < enemy.vaginalCapacity(0) * .35) output("A little lacking, aren’t ya? I hope you weren’t expecting me to be impressed by this. You better at least know how to use it.");
		else output("Damn, you’re really packing aren’t you? You better know how to use it. It takes more than just a big dick to make a laquine squirt.");
		output("”</i>");
		pc.cockChange();

		output("\n\nYou assure her that you more than know what you’re doing as you rear back again. Her lips kiss your length all the way out, the soft outer folds feeling like a pair of warm massage pillows. It takes a good amount of resistance not to cum just from that, and she knows it.");
		output("\n\n<i>“Something wrong?”</i> She says with a huge grin. You grunt in irritation and give her butt a heavy slap to get her to shut up. She complies, for now, as you thrust back in with renewed force. The bounding bun matches each of your thrusts with one of her own, getting in sync with you in short order. She starts pushing you to go faster, increasing her own speed in order to force you to keep up. It’s quite the exercise, and you find that both of you are sweating like a pair of overworked animals in no time.");
		output("\n\nYou grit your teeth as the slut’s tunnel gets harder and harder to pull out of with each thrust. She’s getting close to cumming, and with how many times she’s cum already, it’s surprising that she lasted this long. You aren’t too far away yourself, if the rumbling in your [pc.balls] is anything to go by. Both of you decide to give it a big finish. You practically ram your bodies together, feeling the sheer impact force repelling you before you can even start rearing back.");
		if(pc.balls > 0)
		{
			output(" Your [pc.balls] slap");
			if(pc.balls == 1) output("s");
			output(" into hers with each thrust. The impact should be painful, but in your overstimulated state it almost crosses into pleasure!");
		}
		output("\n\n<i>“There you go, meat. This is some proper laquine breeding right here!”</i> Her words are lost in the rut as you feel your orgasm slipping into your mind. It’s too late to stop it now! You and her give one last thrust into each other and meet with an almost concussive bump as you both cum.");
		if(pc.cumQ() < 500)
		{
			if(pc.balls > 0)
			{
				output("\n\nYour [pc.balls] clench");
				if(pc.balls == 1) output("es as it unloads everything it has");
				else output(" as they unload everything they have");
				output(" into the laquine. Your cumvein burns at the effort it’s exerting, even going as far as to try and push out phantom loads after you’ve completely emptied.");
			}
			else 
			{
				output("You feel a great weight being lifted from your loins as your orgasm flows forth. Torrents of [pc.cum] bulge out of your cumslit and fill the bunny bitch to bursting. She doesn’t seem to mind your output, even when it rounds her belly out to about eight months pregnant.");
				output("\n\n<i>“Are you sure you’re not a laquine under all that? Cause that’s a laquine orgasm if I ever felt one.”</i> That has to be the first thing she’s said to you that wasn’t dripping in sarcasm.");
			}
		}
		else
		{
			output("\n\nYour vision blurs as your explosive orgasm bursts inside her. Her stomach distends almost immediately, your first shot more than enough to turn her trim belly into a cum-pregnant paunch. The rest of your shots only serve to push her limits, rounding her out into a little bunny beachball before spilling out in huge waves.");
			output("\n\nShe doesn’t seem that bothered by it though. <i>“Fuck, you really like to overdo it don’t you? I like that!”</i>");
		}
	}
	output("\n\nYou finally decouple, letting her fall to the ground in a heap of ");
	if(pc.cumQ() < 2000) output("her own");
	else output("both of your");
	output(" cum. She pants and waves you away as her eyes drift shut. Deciding that she’s fine down there, you put your gear back on and head out, leaving her to fate.");
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
	output("\n\n");
	CombatManager.genericVictory();
}

public function taursLoseToSweatLaquineByWsan():void
{
	showBoredJumper(true);
	author("Wsan");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("<i>“Jeez, you’re a big beasty, aren’t you?”</i> the sweaty laquine girl asks, looking down at you and tilting her head. <i>“Y’know... one of the captains looks a bit like you, and I’ve always wondered what it’d be like...”</i>");
	output("\n\nShe claps once like she’s decided something, the motion sending sweat droplets everywhere and setting her generous breasts jiggling in her suit.");
	output("\n\n<i>“Yeah!”</i> she says, smiling. <i>“I’m gonna fuck the hell outta you!”</i>");
	if(pc.HP() <= 1) 
	{
		output("\n\nYou groan, lying on your side. You’re not in much of a position to refuse, but if you could just reach a weapon...");
		output("\n\n<i>“Ah ah,”</i> the horny laquine says, lightly kicking at your hands. <i>“Don’t be a sore loser. Relax, I’m not gonna sell you into slavery or anything. Just have a bit of fun with that big round rump of yours!”</i>");
	}
	else
	{
		output("\n\nThat honestly sounds fucking amazing right now, and she can see as much in your expression.");
		output("\n\n<i>“Aw yeah, come to momma,”</i> she says, grinning. <i>“Atta[pc.boyGirl].”</i>");
	}
	output("\n\nShe bends down to give you a quick poke in the shoulder, then gives you a once over before another jab in your other shoulder, dosing you with something. <i>“I’d ordinarily just do the one but uh, you’re pretty big and you might need more, maybe?”</i> She shrugs. <i>“I dunno! I’m not a doctor.”</i>");
	output("\n\nYou can feel strength running through your body... along with some other sensation you can’t put a finger on yet.");
	output("\n\n<i>“C’mon bub, that should give you enough to get up,”</i> she says, pulling your arm. <i>“Up! Can’t get at that fat ass otherwise.”</i>");
	output("\n\nSurprising even yourself, you manage to stagger to your feet and steady yourself against a wall, breathing hard. The laquine, taking her time, crouches down to look at you from behind.");
	output("\n\n<i>“Wow, ‘taur bodies are something else!”</i> she exclaims,");
	if(pc.hasCock())
	{
		if(pc.ballDiameter() >= 4 && pc.balls > 1) output(" grabbing a handful of your balls from behind and giving them a light squeeze");
		else output(" reaching under to grab your [pc.cockBiggest] and squeeze it");
	}
	else if(pc.hasVagina())
	{
		output(" running her fingers");
		if(pc.vaginas[0].type == GLOBAL.TYPE_EQUINE || pc.vaginas[0].type == GLOBAL.TYPE_LEITHAN) output(" up and down the blackened lips of your dripping marecunt");
		else output(" between your pussy lips");
	}
	else output(" her fingers tracing around your [pc.asshole]");
	output(".");
	output("\n\n<i>“I- I,”</i> you gasp, starting to shiver and sweat. <i>“I don’t think you were m-meant to use t-t-two of those...”</i>");

	output("\n\n<i>“Oooh...”</i> the bunnygirl murmurs, rising back to her feet with a hand on your flank. <i>“Well, the good news is the side effects aren’t too heavy. Just a little bit of fever and heat.”</i> She rubs your butt in a manner that’s probably intended to be comforting but just makes you want to sit on her face. <i>“The bad news, though,”</i> she continues, exaggeratedly clicking her tongue in faux regret, <i>“is that it lasts a few hours. Hope you had a lot to drink, [pc.boyGirl], ‘cuz I’m gonna be making you sweat all that out.”</i>");

	output("\n\nYou should be angry about her misuse of drugs. You should be - but honestly, that’s too much effort. All you can muster the energy for right now is a desperate groan of lust as");
	if(pc.isHerm())
	{
		output(" your cock");
		if(pc.cockTotal() > 1) output("s stand");
		else output(" stand");
		output(" up impossibly hard, batting against your underside and dribbling while your [pc.multiCunts] slaver");
		if(pc.totalVaginas() == 1) output("s");
		output(" for attention");
	}
	else if(pc.hasCock())
	{
		output(" your prick");
		if(pc.cockTotal() > 1) output("s");
		output(" harden to the point of pain, slapping against your stomach in a desperate bid for stimulation");
	}
	else if(pc.hasVagina())
	{
		output(" your [pc.vaginas] juice");
		if(pc.totalVaginas() == 1) output("s itself");
		else output(" themselves");
		output(", dripping and dribbling with clear, pearlescent liquid to hopefully spur your partner to action");
	}
	output(".");
	output("\n\n<i>“Please enough taunting!”</i> you beg, spreading your hindlegs a little to demonstrate how willing you are. <i>“Just shut up and fuck me through this!”</i>");

	output("\n\n<i>“Fine,”</i> she says, giving you such a hard spank that you cry out in pain. Fuck, just having <i>any</i> stimulation near your hindquarters is enough to make you want to cum! You can hear her unzipping her suit, each second slipping by feeling like an hour until, suddenly, she’s poised at your ");
	if(pc.hasVagina()) 
	{
		if(pc.vaginas[0].looseness() < 3) output("tight, dripping");
		else output("wet, accommodating");
		output(" entrance");
	}
	else 
	{
		if(pc.ass.looseness() < 3) output("tight");
		else output("gaping");
		output(", round");
		if(pc.hasPlumpAsshole()) output(" and ridged donut of a");
		output(" ring");
	}
	output(".");

	output("\n\nShe doesn’t fuck around, something you’re intensely grateful for as she drives her entire length into");
	output(" you");
	if(pc.hasVagina()) output("r overeager cunt");
	output(", her");
	if(enemy.cocks[0].cType == GLOBAL.TYPE_EQUINE) 
	{
		output(" blunt, slightly flared head pressing against your");
		if(pc.hasVagina()) output(" cervix");
		else if(pc.hasCock()) output(" prostate");
		else output(" colon");
		output(" insistently.");
		output("\n\n<i>“H-horse,”</i> you gasp, taken in by the sensation of having a studly equine member inside your needy ");
		if(pc.hasVagina()) output("pussy");
		else output("asshole");
	}
	else if(enemy.cocks[0].cType == GLOBAL.TYPE_FELINE) 
	{
		output(" thick, barbed length stimulating you in all the ways a regular cock can’t.");
		output("\n\n<i>“C-cat,”</i> you gasp, the tiny spikes rubbing your ");
		if(pc.hasVagina()) output("pussy walls");
		else output("insides");
		output(" on the outstroke, exploiting your instincts to make you clench up on her");
	}
	else if(enemy.cocks[0].cType == GLOBAL.TYPE_CANINE)
	{
		output(" tapered tip slyly pushing up ");
		if(pc.hasVagina()) output("against the entrance to your womb, leaving a deposit of precum as a little ‘bitch-marker’");
		else output("into the depths of your behind, precum dripping from the end of it");
		output(".");
		output("\n\n<i>“D-dog”</i> you gasp, a little surprised - but grateful - she didn’t shove her accompanying knot inside, too");
	}
	else 
	{
		output(" swollen, pre-dripping cockhead nestled right up against the entrance to your womb.");
		output("\n\n<i>“H-human,”</i> you gasp, the size of it taking you off-guard. Most human cocks couldn’t hope to please your bestial form, but this one..");
	}
	output(".");
	if(pc.hasVagina()) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	output("\n\n<i>“Ah, yup! Expecting something else?”</i> she asks, apparently having a good time.");
	output("\n\n<i>“No, juh-just fucking </i>destroy<i> me,”</i> you plead, thrusting your rear back at her with your hindlegs. <i>“Please! I can take it, it’s what we’re good at!”</i>");
	output("\n\n<i>“You... fuckin’...”</i> she grunts, drawing back her powerful laquine hips. <i>“</i>Got it<i>!”</i>");

	output("\n\nThe ensuing thrust is so hard you");
	if(pc.isBimbo()) output("r eyes cross with the brain-melting pleasure");
	else output(" see stars for a second");
	output(".");
	
	if(pc.hasCock())
	{
		output(" Your [pc.cocks] wildly spray");
		if(pc.totalCocks() == 1) output("s");
		output(" [pc.cum] all over the wall you’re braced against, your fuckhole trembling in bliss as the bunnygirl hammers you");
	}
	else if(pc.hasVagina()) output(" Your stuffed-full pussy immediately clamps down on the bunnygirl’s dick, your walls trembling in pleasure while you grit your teeth and cum all over her");
	else output(" The sensation of her hammering your fuckhole, being <i>used</i>, is so intense you almost cum right on the spot");
	output(". The thought of being angry at her is gone from your mind, banished by the glee of penetration - whatever she injected you with, it’s some seriously good shit!");
	output("\n\n<i>“Uhhh! K-keep goooiing!”</i> you wail, pushing back into her with every stroke. She spanks you again, even harder this time, both your cheeks now reddened.");
	output("\n\n<i>“Relax, slut! I’m good to go more than once!”</i> she says, rubbing your [pc.ass]. <i>“Finally, someone I can really let loose on!”</i>");

	output("\n\nShe starts to fuck you so fast it would feel like her cock has never left your body if not for the intense, stomach-clenching pleasure emanating from your thoroughly conquered ");
	if(pc.hasVagina()) output("cunt");
	else output("asshole");
	output(". Those laquine hips have an insane amount of drive in them and you’ve got front row seats to witness just how hard she can pound your hole until it gapes for her.");

	output("\n\n<i>“Oohhh fuck </i>yes<i>,”</i> you groan, bowing your head. You’re ready to let her take over from here, submitting entirely and slowing your thrusts back into her before coming to a complete stop. It’s okay, the capable jumper has it handled.");

	output("\n\n<i>“Oh, good [pc.girlBoy]!”</i> she says, patting your flank while your hindlegs twitch, creating a groove in the ground as they stretch a little further outwards for her. <i>“You do learn!”</i>");

	if(pc.hasCock()) 
	{
		output("\n\nYou’re like a fountain, cum surging helplessly from the end of your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" as the hyperactive bunny fucks it out of you with an intensity you’ve come to crave");
	}
	else output("\n\nYour [pc.vagOrAss " + x + "] quivers, having held you in an almost perpetual state of orgasm since she first started pummeling you");
	output(". It doesn’t take long for her to cum, both of you groaning thankfully as rabbitjizz begins to flood into you, assuaging your heat just a little.");

	output("\n\nBarely even breathing hard but soaked in sweat, the bunnygirl withdraws from your spunked-up hole and begins fumbling for some of her equipment.");
	output("\n\n<i>“Thanks...”</i> you pant, looking back at her with unfulfilled desire in your eyes. <i>“You’re not </i>leaving<i>, right?”</i>");

	output("\n\n<i>“Nope,”</i> the bunny says, delicately injecting herself with something. You can see her flagging cock immediately begin to stand back up, angrily swelling with blood until she’s as stiff as diamond. <i>“Gotta take responsibility for my fuckups!”</i> Lining herself back up, she gives you a wink and adds, <i>“Miiight be a little bit of selfish pleasure in there, too. I don’t get to fuck a ‘taur everyday, y’know?”</i>");

	output("\n\nWhatever her reasoning, you’re <i>extremely</i> grateful for it and let her know by screaming in pleasure when she shoves herself back inside your ");
	if(pc.hasVagina()) output("cunt");
	else output("ass");
	output(". Barely even a drip of her cum escapes from you, the laquine having cum too deeply inside for it to leak outwards, but you’re pretty sure that at the rate she’s going");
	if(x >= 0 && !pc.isPregnant(x)) output(" your womb will be stuffed to the point of swelling outwards with her virile jizz when she’s done with you. Who knows, maybe you’ll end up delivering a litter of rabbits. Right now, the thought is more than a little enchanting.");
	else output(" you’re going to have a river of jizz between your hindlegs by the time she’s done.");

	output("\n\nHer second orgasm takes much longer, perhaps owing to the drug or just that it’s too soon after her first, but you’re not thinking so much about the reason. All you’re thinking about is how fucking good she is and wondering whether you’ll pass out from exertion before she’s truly done.");
	if(pc.isTreated()) output(" It’s a good thing you’re Treated, or else you really might.");

	output("\n\n<i>“Do,”</i> you pant, having to take long breaths, <i>“do you want me, to change positions?”</i>");

	output("\n\n<i>“Oh?”</i> the bunnygirl says, eyeing you with interest as she juices herself up again. You can’t tell if it’s your imagination, but every time she injects herself it seems like her cock gets bigger...");
	output("\n\n<i>“Can you lie on your back, then?”</i> she asks, curious. <i>“I wanna see this.”</i>");
	output("\n\n<i>“Fine,”</i> you nod, and gently lie down before rolling over.");

	output("\n\nIt’s a very vulnerable position, as even the most untrained of eyes can tell. Your soft underbelly is exposed and your [pc.legOrLegs] ");
	if(pc.legCount == 1) output("is");
	else output("are");
	output(" up in the air. If you wanted to recover from this to protect yourself, it would take you multiple seconds to get back up.");
	if(pc.hasCock())
	{
		output(" Not to mention your cock");
		if(pc.cockTotal() == 1) output("s is");
		else output("are");
	}
	output(" completely exposed, still drooling across your tummy.");

	output("\n\n<i>“Ooooh,”</i> the bunnygirl says, her eyes gleaming as she sinks to her knees with her veiny cock in hand. <i>“I </i>like<i> it.”</i>");

	output("\n\nThere’s no doubt about it now - that dick of hers is definitely larger. If you’re going to be here for a few hours like she said, you can only imagine how big she’s gonna get by the end of it. She notices your intent stare.");

	output("\n\n<i>“Oh, this?”</i> she says lightheartedly, pointing to her dick. <i>“It’s drug-induced and temporary. But uh, if you take multiple doses within a couple hours of each other, the effects kinda ‘stack up’. So this’ll go away, but not before we’re done here.”</i> She breaks into a predatory grin. <i>“Isn’t that nice for you?”</i>");

	output("\n\n<i>“Oh fffuuhh!”</i> you half-moan, half-scream as she violently re-enters you, not giving you any time to adjust to her size. <i>“Guh! Unh! Uhhh!”</i>");
	output("\n\n<i>“Remember, babe: you still tried to fight me and lost,”</i> she whispers under your pitiable groaning. <i>“So! You’ve got this coming.”</i>");
	output("\n\nYou turn this way and that, twisting in her grip while she plows your ");
	if(pc.hasVagina()) output("pussy");
	else output("asshole");
	output(" and moaning in the bliss of being dominated. She’s rough, but rough is exactly what you need right now. The way she’s stretching you out with her head is <i>amazing</i>, and already you can barely wait to feel it pulse and cum inside you once more.");

	output("\n\nWhen it does, you can’t help but cum yourself.");
	if(pc.isHerm()) output(" Your [pc.biggestCock] spurts all up your stomach and torso, covering you in spunk while your cunt hungrily sucks out all of the rabbitgirl’s cum while she moans in pleasure");
	else if(pc.hasCock()) 
	{
		output(" Your [pc.cocks]");
		if(pc.cockTotal() > 1) output(" splatter cum all over your stomach and chest, each one pulsing in time with the other");
		else output(" sprays seed all up your tummy and torso, cumming so hard it almost hits you in the chin");
	}
	else if(pc.hasVagina()) 
	{
		output(" Your [pc.pussy " + x + "] clamps down on her cock and sucks at her for all she’s worth, leaving your");
		if(pc.isPregnant(x)) output(" canal full of fertile spunk with nowhere to go");
		else output(" womb stuffed full even further");
	}
	output(". Gritting her teeth and holding your hindlegs apart, she rolls her hips into you and lets your nethers swallow down her spunk.");

	output("\n\n<i>“Guh, fuck, you’re good,”</i> she huffs eventually, sighing in satisfaction. <i>“I could keep this up all day if I had the time.”</i>");

	output("\n\nYou don’t know if you’d even be able to weather such a storm. An insensate moan is your only reply.");

	output("\n\n<i>“Aw, you can thank me later!”</i> she says cheerily, grabbing another syringe.");
	//Havepuss+notpreg:
	if(pc.hasVagina() && !pc.isPregnant(x)) 
	{
		output(" This one is colored differently from the rest, and she gently inserts it into your uprotected underside and depresses the top.");
		output("\n\n<i>“Wh-what was that?”</i> you pant, not feeling any different. Maybe a little twinge from deep inside, but you can’t tell amidst the sensations of post-orgasm and the aftermath of such rough sex.");
		output("\n\n<i>“Oh, just a hyperfertility drug,”</i> she says innocently, putting it away. <i>“I gotta get some payoff outta this, y’know? Makes me feel nice knowing your tummy’s gonna grow big and fat with my kids. Hell, you’ll prolly deliver thirty of ‘em!”</i>");
		output("\n\n<i>“You...”</i> you begin, but think better of it. She still has you at her mercy, and you know the moment she leaves you’ll be back to the nonstop itching of heat. You’d rather not go looking around the mine for someone to fuck who might end up being less charitable.");
		output("\n\n<i>“That’s riiight,”</i> she chirps in a singsong voice, patting your underside. <i>“Just relax and lemme fill you up some more, okay?”</i>");
	}
	else 
	{
		output(" She injects it into herself without even pulling out, and you can feel her hardening, widening, inside your depths. She gives you a meaningful look.");
		output("\n\n<i>“This is about when it gets to be too much to take for most. So don’t feel too bad if you pass out, okay?”</i>");
	}
	output("\n\n<i>“F-fuuuck,”</i> you groan, feeling your insides stretch to their utmost limits. <i>“Oh, god!”</i>");
	if(pc.hasVagina()) pc.cuntChange(x,enemy.cockVolume(0)*2);
	else pc.buttChange(enemy.cockVolume(0)*2);

	var stolenCreds:Number = 0;
	
	output("\n\nAs the pounding begins anew, you find yourself wondering if she actually killed you when you lost and now you’re stuck in limbo, here to get dicked down forever.");
	if(!pc.isTreated()) 
	{
		output(" Whether lucky or unlucky, you soon find her prophecy coming true, and you start to pass out while she reorganizes your insides. The last thing you see is her grinning face as your underside begins to bloat with spunk.");
		output("\n\nWhen you awaken, it’s a few hours later. True to her word, the jumper fucked you through your entire heat. You’re slightly sore between your hindlegs, but frankly it’s a small price to pay compared to going through that hell. You’re definitely missing ");
		//some gems/credits/whatever} 
		if(pc.credits > 1)
		{
			stolenCreds = pc.credits;
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
			output("a bunch of your credits");
		}
		else if(pc.hasItemByClass(Picardine) || pc.hasItemByClass(Satyrite) || pc.hasItemByClass(Savicite) || pc.hasItemByClass(Kirkite))
		{
			output("a gemstone");
			if(pc.hasItemByClass(Picardine)) pc.destroyItemByClass(Picardine);
			else if(pc.hasItemByClass(Satyrite)) pc.destroyItemByClass(Satyrite);
			else if(pc.hasItemByClass(Savicite)) pc.destroyItemByClass(Savicite);
			else if(pc.hasItemByClass(Kirkite)) pc.destroyItemByClass(Kirkite);
		}
		else output("your dignity");
		output(" though, and you suppose she took her prize as payment for services rendered. Sighing, you get to your feet and dust yourself off. Next time you’ll be a little more wary.");
	}
	else
	{
		output(" Whether unfortunate or fortunate, your Treated stamina keeps you awake for the entire duration of the hot, sweaty experience. You suffer her growing cock for <i>hours</i>, screaming louder and louder until your voice finally breaks and you let out nothing but a silent gasp of air on every rough instroke.");
		if(pc.hasVagina() && !pc.isPregnant(x)) output(" Your stomach has swollen to more than twice its original size, bulging outwards thanks to your newly-stuffed womb heralding the laquine’s virility");
		else if(pc.hasVagina()) output(" Your pussy has an almost endless stream of her spunk flowing from it, running down your backside and onto the ground");
		else output(" Your guts are stuffed full of laquine spunk, your stomach bloated with it to the point of ridiculousness");
		output(".");
		output("\n\nWhen all is finally said and done, she pulls her now-behemoth cock out of you with a happy moan and inspects your rump.");
		output("\n\n<i>“Yikes! I don’t think that’s gonna close up for a while,”</i> she says, whistling low. <i>“Oh well! This is gonna be a fun story for both of us! Pity I don’t have a camera on me...”</i>");
		output("\n\nShe daintily wipes herself off on your underside, carefully zipping herself back up before she inspects your belongings. Helpless to stop her, you watch her make off with ");
		// {gems/your credits/whatever}
		if(pc.credits > 1)
		{
			stolenCreds = pc.credits;
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
			output("a bunch of your credits");
		}
		else if(pc.hasItemByClass(Picardine) || pc.hasItemByClass(Satyrite) || pc.hasItemByClass(Savicite) || pc.hasItemByClass(Kirkite))
		{
			output("a gemstone");
			if(pc.hasItemByClass(Picardine)) pc.destroyItemByClass(Picardine);
			else if(pc.hasItemByClass(Satyrite)) pc.destroyItemByClass(Satyrite);
			else if(pc.hasItemByClass(Savicite)) pc.destroyItemByClass(Savicite);
			else if(pc.hasItemByClass(Kirkite)) pc.destroyItemByClass(Kirkite);
		}
		else output("your dignity");
		output(". She gives you a wave as she leaves.");

		output("\n\n<i>“Ugh,”</i> you groan, feeling the ache in your hips and back. She <i>really</i> did a number on you...");

		output("\n\nIt takes you a few minutes for you to unsteadily get to your shaking feet, but you manage it by leaning against the wall. It’s going to take even more time until your [pc.vagOrAss " + x + "] stops dripping with her spunk, too, but for now you’re back on the hunt.");
	}
	output("\n\n");
	processTime(65);
	for(var y:int = 0; y < 5; y++)
	{
		pc.orgasm();
		if(x >= 0) pc.loadInCunt(enemy,x);
		else pc.loadInAss(enemy);
	}
	sweatyDebuff(1);
	CombatManager.genericLoss();
}

// Victory scene against the Bored Jumper
// The PC undoes their suit and gets to frottin’ but refuses to let the Jumper penetrate/get penetrated. Has male/female variations.
public function frottageVictoryVsBoredJumperByB():void
{
	clearOutput();
	showBoredJumper(true);
	author("B");
	output("This horny laquine just wanted a quick and easy fuck, did she? Well, now you’re on top, and you have the say on who gets to fuck who. You tell the laquine that she could have just asked, if she was so horny");
	if(pc.lust() >= 50) output("; you were pretty horny, yourself, and you probably would have said yes");
	output(".");
	output("\n\n<i>“Sure, but where’s the fun in that?”</i> she asks, her hand stroking at her growing bulge, making her latex suit squeak with her motions. <i>“There’s nothing like a little rough-housing to make a good fuck all the more enjoyable. It establishes who’s who in the relationship pretty well, too.”</i>");
	output("\n\nThat’s an awfully mercenary attitude to have. If she likes things a little rough, you’re okay with indulging.");

	var cunted:Boolean = (pc.hasVagina() && (!pc.isHerm() || rand(2) == 0));
	// Continue here if PC is female/herm (randomly choose between this and male variant for herms)
	if(cunted)
	{
		output("\n\nYou put your hands on your [pc.hips] and motion to the zipper on her suit, wordlessly telling her to pull it down and expose her body to the heat of the mine. She does so, grinning up at you, her other hand still fondling her thick dick through the material; she starts at her neck, then slowly teases the zipper down the valley of her breasts, thrusting out her C-cups to fill the material before they inevitably pop out, jiggling from the thrust.");
		output("\n\nThe thick smell of her musk hits your nostrils, and you can see her [enemy.furColor] is matted and slick with sweat; you lick your [pc.lipsChaste] at the sight of her pebbly, hard nipples, begging to be pinched and sucked – but you’re here to give this horny bunny the rough time she was looking for, and giving her boobs a suck doesn’t sound very intense to you.");
		output("\n\nShe teasingly unzips her suit down the front, until it gets to her crotch; the bulge in her suit throbs before your eyes, her no-doubt impressive package threatening to burst out without provocation. She undoes the last of her zipper, rounding it over the crest of her cock, and it springs free: hard as could be; pre leaking down its sides and flinging to and fro with the its bobbing and bounding; and ready to fuck [pc.oneVagina] until it splits you in half.");
		output("\n\nYou take a moment to admire her dick: ");
		if(enemy.cocks[0].cType == GLOBAL.TYPE_HUMAN) output("she’s sporting the normal model, with a human-shaped helmet of a cock-head and a smooth, taut shaft");
		else if(enemy.cocks[0].cType == GLOBAL.TYPE_CANINE) output("with its telltale pointed tip, she’s rocking a canine-shaped cock, complete with blossoming, cunt-filling knot slowly inflating at its base");
		else if(enemy.cocks[0].cType == GLOBAL.TYPE_FELINE) output("its tip tapers sharply, and its shaft is covered in soft little nubs; typical traits of a perfect feline-cock");
		else output("it’s fat all the way from base to tip, and its tip bloats and flattens into a plateau, typical of a classic equine-shaped cock");
		output(". Your [pc.legOrLegs] clench");
		if(pc.legCount == 1) output("es");
		output(" at the idea of stuffing that meat inside of you");
		if(!pc.isCrotchExposed()) output(", and you instinctively begin undressing until your [pc.crotchCovers] are removed, and you’re just as exposed as she is");
		output(" – but you maintain your composure. You have something specific in mind... but, that said, it’s not like you can’t enjoy yourself in the meantime, of course.");

		output("\n\nYou ");
		if(pc.hasKnees()) output("drop to your knees");
		else output("lower yourself");
		output(", gripping her dick by its base tightly and giving it a few experimental strokes. Her skin feels hot, and, so close to her crotch, you can feel the humidity of her suit wash over your own [pc.skinFurScales]. You sigh through your nose, rousing yourself, and you thrust your [pc.hips] forward");
		if(pc.hasCock()) output(", angling your own [pc.cock] away; you have a better idea, and it doesn’t involve your own equipment. Not this time, anyway");
		output(".");
		output("\n\n<i>“Fuck yeah,”</i> the laquine muses as you point the tip of her dick towards your entrance, making her believe that you’re aiming to have yourself penetrated. But, you don’t do as she expects: instead, you glide your vulva down the fat of her cock, allowing her tip to kiss your [pc.clit] before sliding it down to her base.");

		output("\n\nYour slick [pc.girlCumNoun] coats the side of her bloated cock, cooling it against the searing heat of the mine’s air. Your crotch makes contact with the top of her bouncing, full nuts, and her scrotum clenches in delight at the sensory stimulation, readying her cum to breed you and seed you.");
		output("\n\nWith a slow, languid slide, you bring your body back up her shaft, slathering more of your own lube against her. Once again, you toy with her cock’s tip, using it to trace your pussy lips and teasing the laquine with what would undoubtedly be an incredible time, but you relent at the last second and slide yourself back down.");
		output("\n\n<i>“Come on,”</i> the laquine whines, her hands both resting on your [pc.hips] as her hips instinctively hump against you, making the frotting all the more intense. <i>“Quit it with the teasing. We’re both hot as hell; we’re both ready to fuck; I got a dick thick enough to make you walk bow-legged for a week, and you got a cunt that’s gonna snap my dick in half. We’re made for each other! Let’s just give each other what we want.”</i>");

		if(pc.lust() >= 50) 
		{
			output("\n\nYou have to admit, the laquine makes a convincing argument. It would just take a deft slip of the fingers to drive that meaty, succulent stick of pure masculine meat into you and drive you fucking wild. But");
			if(pc.WQ() <= 15) output(", for once in your life");
			output(", you steel yourself and resolve to have the discipline to not let her honeyed words get to you.");
		}
		output("\n\nGrinning, you release the base of her dick. She smiles back at you, confident that she’s convinced you – but you instead thrust your [pc.hips] forward, pinning her cock beneath the weight of your body and trapping it against hers");
		if(pc.hasCock()) output(". [pc.EachCock] flops around obscenely, your own pre-cum flinging into the laquine’s face with the single, hearty thrust");
		output(". She winces at the pressure being applied to her dick, and she tries to hump up and into your body, but you’ve got her stuck.");

		output("\n\n<i>“I guess you’re not in the mood to play with your food, huh?”</i> she asks good-naturedly.");
		output("\n\nYou don’t answer, and instead, you frot against her with not a little bit of pressure and effort: your hips jack harshly atop hers, stimulating your own cunt with every glide and press, especially with you lean forward enough so that your clit gets in on the action. But you’re careful not to go so far forward as to stimulate the laquine’s cock head, and you’re careful to keep the pressure on her dick, so that she can’t cum yet, even if the motions put her over the edge.");
		output("\n\nHer hands cling to your hips as you move, a little tighter than you would have liked, but you ignore her every flail and her every exhausted moan. You tell her that you thought she just enjoyed having it rough, and what’s rougher than having someone as hot as you giving her cock a hard time?");
		output("\n\nYou fuck yourself against her flesh, and despite your efforts, you can feel her getting hornier and harder beneath you: her shaft inflates with her heartbeat, and jets of pre shoot from her tip every time you slide yourself forward. Still, it was never your intention to keep her from cumming altogether; you just wanted her to feel the burn for it.");
		output("\n\nLeaning forward, your own hands clasp harshly onto her heaving chest. Your fingers sink into her fur with a wet squish while you continue to frot against her shaft. You’re close, and you just need a few more motions before you’re there; you ask her if she’s ready to blow yet.");
		output("\n\n<i>“This, hnng,”</i> she grunts, trying to match your high-speed rhythm, but she’s trapped beneath you and the floor of the mine. <i>“This coulda been better, you know. Does this feel good for you? It coulda felt so much better.”</i>");
		output("\n\nMaybe it could have, you acquiesce, but that’s not how you chose to do things this time. And besides, there’s more to sex and stimulation than just some penetration. As your bottom, she should understand that.");
		output("\n\nWith that established, you proceed with what you’re doing: your motions get more and more frenetic the closer you get. Your pussy-juices have polished the underside of her shaft to a marble-esque sheen");
		if(pc.hasCock()) output(", and [pc.eachCock] stands hard as could be, ready to pump your [pc.cum] across the room at a moment’s notice");
		output(". Your [pc.hips] quiver in excitement the closer you get, and with just another couple rocks forward...");

		output("\n\nYou detonate, clenching your body on top of the laquine as you cum your share between you. Your [pc.vagina] clamps onto the broad, hot sides of her dick, and you ");
		if(pc.isSquirter()) output("spray");
		else output("leak");
		output(" your [pc.girlCum] onto her shaft, coating it from base to crown with your fluids. Your fucking gets haphazard and uncontrollable; you hardly have the core strength to remain still and maintain your patterns while your feminine sex shudders, squirts, milks, and starts again beneath you, robbing your body of its strength");
		if(pc.hasCock()) output(". And, not to be outdone, [pc.eachCock] bloats and inflates with your rushing cum, spraying it through the air, just as promised. The first volley arcs high above the laquine below you, before it splashes down across her face and down her chest. And that’s only the first of many");
		output(".");

		output("\n\nThe girl you’re pinning down takes a deep breath through her nose, unable to contain herself as she cums right alongside you. Her ");
		if(enemy.cocks[0].cType == GLOBAL.TYPE_HUMAN) output("rounded");
		else if(enemy.cocks[0].cType == GLOBAL.TYPE_CANINE) output("tapered");
		else if(enemy.cocks[0].cType == GLOBAL.TYPE_FELINE) output("nubbed");
		else output("flat");
		output(" cock noticeably inflates beneath you as her testicles bunch up, ushering her bunny cum forward. With a hiss and a gasp, her jizz erupts from her body, spraying forward across her belly and painting the underside of her boobs, soaking against your clenching hands. You try to hump in time with her cum-sprays, using your body to massage her loads forward and spray herself as high up as she can. You’re hoping to get her in the face with her own jizz.");
	}
	// Continue here if PC is male/herm (randomly choose between this and male variant for herms)
	else
	{
		output("\n\nYou extend your finger and rotate your wrist, motioning for the laquine to roll over and properly present herself. Her eyes dip from you to your crotch; you’ve got an unsubtle bulge yourself, and, with a smile, you can tell she likes the direction you’re about to take this encounter.");
		output("\n\nShe does as you wordlessly command, flipping onto her front side and putting her knees underneath her body, propping up her heart-shaped bunny ass. She wriggles it back and forth in front of you as one of her hands reaches to her neck, and you hear the sound of her zipper sliding undone. The latex material across her back relaxes and crinkles slightly as the tension is relieved from the zipper, ruining its skintight appeal – but soon enough, you’ll have the real deal to ogle.");
		output("\n\nThe zipper reaches to her upper back after going all the way down her front and across her crotch. She teases the buckle over her own thick bulge, and when she gets it over the mound that is her bundled-up dick, her ");
		if(enemy.cocks[0].cType == GLOBAL.TYPE_HUMAN) output("human");
		else if(enemy.cocks[0].cType == GLOBAL.TYPE_CANINE) output("canine");
		else if(enemy.cocks[0].cType == GLOBAL.TYPE_FELINE) output("feline");
		else output("equine");
		output("-shaped cock flops out, its ");
		if(enemy.cocks[0].cType == GLOBAL.TYPE_HUMAN) output("helmeted, circular");
		else if(enemy.cocks[0].cType == GLOBAL.TYPE_CANINE) output("pointed, tapered");
		else if(enemy.cocks[0].cType == GLOBAL.TYPE_FELINE) output("tapered, nubbed");
		else output("thick and flat");
		output(" head reaching far enough down to bop onto the ground beneath her.");

		output("\n\nReleased from its confines, her musk permeates the air and assaults your nostrils, especially when you’re this close to her. Her cock dribbles a bit of her pre, proof of her excitement, and her dick throbs and grows larger with each heartbeat, ready to bury itself hilt-deep in the warmest, wettest hole nearby and release the payload that her bunched-up, sweaty balls are ready to shoot.");
		output("\n\nY");
		if(!pc.isCrotchExposed()) output("ou undress yourself, removing your [pc.crotchCover] and baring yourself to the hot air of the mine and adding your own brand of stank to the mix between you. Y");
		output("ou give [pc.eachCock] a stroke, enjoying the show before you – but the real prize your after is still obscured by her suit.");
		output("\n\nShe unzips the rest of the way, hooking the buckle of her zipper around her bubble-butt, and giving you a big eyeful of what it is you’re after: her winking, soaking cunt, surrounded by [enemy.furColor] fur, dripping with arousal, clit engorged and red, ready for you to fuck it and plough it like you own it.");
		output("\n\nYou waste no time and step forward, angling your [pc.cock] against her entrance and dragging the helmet of your [pc.cockHead] against her supple pussy lips. She’s drenched and scorching hot – honestly, she’s in a prime position to get absolutely railed into the mine’s floor until she’s little more than a satiated puddle of laquine.");
		output("\n\n<i>“Come on,”</i> she implores, using her other hand to reach back, hooking it underneath her bloated cock and heavy testicles, so she can use her fingers to spread herself open for you. She wants you bad, and the look and the smell is difficult to ignore. <i>“You won the fight. I’m allllllllll yours. Fuck me until I can’t remember where I am.”</i>");
		output("\n\nYou agree that you won the fight, but you had something else in mind. You tell her that this is how you want to enjoy her body, and she’ll lie there and accept it.");
		output("\n\nAt that, you start sawing your [pc.cock] against her steaming pussy, arcing your shaft upward so that the broad side of your meat slides warmly in between the folds of her cunt. Her juices coat you and drip down your dick");
		if(pc.balls > 0) output(", pooling at where your [pc.sheath] meets your nuts and collecting in there");
		output("; she gasps inwardly in pleasure with each hot, meaty press against her body, but outwardly grunts in frustration when you refuse to penetrate her.");
		output("\n\n<i>“Come onnnnnnnn,”</i> she begs, wiggling and pressing herself harder against your body. Her questing fingers tickle at your shaft, wrapping gently around it to pull it down just a little, so that you’d properly penetrate her. You slap her hand away, and for her punishment, you give her bouncy rear-end a hearty slap on the left cheek as well.");
		output("\n\n<i>“What’s the matter?”</i> she asks, and instead uses her hand to wrap around her own, thick dick to give it a tug in time with your frotting. <i>“Look, we’re both hot as fuck; you’re hard enough to smash diamonds and I’m wet enough to drown a man. You’ve got a wet pussy just, urrnggg,”</i> she pauses, stimulating herself with another few well-timed humps against your body, <i>“just</i> asking <i>you to fuck it. We’re both made for it. Fuck me already, would ya?”</i>");
		if(pc.lust() >= 50)
		{
			output("\n\nYou’ve got to admit, the request isn’t an awful one. You’ve got a bit of a rut going with yourself right now, and all it’d take to calm yourself down is to reposition your [pc.cockHead] and fuck the willing, horny bunny beneath you until she screams your name. But, you’re committed to what you’ve started – and besides, it’s not like you aren’t going to cum at the end of the day either way");
			if(pc.hasVagina()) output(". Still, from the way your own [pc.vagina] clenches sympathetically to the laquine’s, you’re not sure your cunt will ever forgive you for refusing to give another one what it wants");
			output(".");
		}
		output("\n\nYou respond that, the next time she wins the fight, she can decide how to fuck you. You’re taking your prize the way you want it, and if that means she doesn’t get a cock in a pussy, then she doesn’t get a cock in her pussy.");
		output("\n\nShe grunts in defeat and lies there, face-down in the dirt, one hand masturbating her turgid length and her hips moving and pressing against yours to eke out whatever pleasure she can from you. You decide to throw her a bone (but not the bone she wants).");
		output("\n\nYour hands roam over the meaty globes of her ass, your fingers coursing through the wet, sweaty fur. Whenever you squeeze down, you can hear the sweat audibly squish and collect between your fingers, soaking the fluid into your palms. One hand stays on the fat of her butt, groping and squeezing for your mutual pleasure, while the other reaches inward, your thumb finding the star of her anus and pressing in swiftly.");
		output("\n\nShe ‘eep!’s in surprise and her body straightens and stiffens, but then relaxes after a few cursory pumps into her anus. She starts to mouth something at you, but gives up and submits to the pleasures she’s feeling: a thumb in her ass; her own hand on her dick; and a stranger’s dick teasing her cunt relentlessly and refusing to give her the satisfaction of some penetration.");
		output("\n\nStill, despite her whining and her every attempt at getting you to fuck her, you can tell that she’s close. Her body shivers around you and your own, and her breathing is coming out unsteadily – telltale signs of a herm about to blow from both ends:");
		if(pc.isHerm()) output(". You can relate");
		output(". You’re about to go off in a little bit, too...");

		output("\n\nYour frotting gets more intense as the seconds tick by, and the thumb thrusting into her asshole has sunk to its second knuckle in your excitement. ");
		//PC’s skin is not scales:
		if(!pc.hasScales()) output("Sweat drips from your body, streaking watery lines down your [pc.chest] and [pc.belly] before adding to the sopping smorgasbord of fluids collecting at your crotch");
		else output("The heat energizes you, making you rowdier and hornier as the friction between you and the bunny gets more intense. Pre jets from your [pc.cock], streaking off-white lines down your shaft and adding to the sopping smorgasbord of fluids collecting between you two");
		output(". There’s a familiar tightness in your dick");
		if(pc.totalCocks() > 1) output("s");
		if(pc.hasVagina()) output(", and in your cunt, despite its loneliness");
		if(pc.balls > 1) output(", and <i>especially</i> in your balls");
		output(" as you get yourself closer and closer. Just a few more, and–");

		output("\n\nYou grunt, and your orgasm overtakes you: your [pc.cock] thickens as your [pc.cum] surges through it, erupting from your tip and arcing over the laquine’s upturned ass. ");
		if(pc.cumQ() < 400) output("Your each spurt reaches up maybe a solid foot from your [pc.cockHead] before raining back down onto the bunny’s soft bum, painting her [enemy.furColor] [pc.cumColor]. You thrust impiously against the velvety texture of her mons, feeling her pussy ripple against you in simultaneous orgasm, almost perfectly synced with your cum as it travels up your shaft.");
		else output("Your [pc.cum] jets high into the air, easily reaching well over the bunny’s butt and reaching as high up as her still-clothed upper-back and shoulders – some of it even lands on her head and in her hair. You use her soft, velvety body as a rag for your own pleasure, and you fuck yourself against her willing body, urging out every precious drop of your semen to coat her [enemy.furColor] [pc.cumColor]. And, if the clenching and rippling from her pussy is any indication, she loves being coated.");

		if(pc.hasVagina()) 
		{
			output("\n\nYour own [pc.multiCunts] clench");
			if(pc.isSquirter())
			{
				if(pc.totalVaginas() == 1) output("es and squirts");
				else output(" and squirt");
				output(" your [pc.girlCum] out from behind you, spraying");
			}
			else
			{
				if(pc.totalVaginas() == 1) output("es");
				output(", your [pc.girlCum] dribbling out from behind you");
			}
			output(" onto the floor of the mine. You’re overwhelmed from both sexes, neither of them getting the proper penetration that they crave, though it’s your pussy that makes you weak in the knees; you force yourself to lean over the laquine and put more weight onto her body so that you can maintain your balance. Halfway through your feminine orgasm, you aren’t sure whether this will even satisfy you; you’re going to need to put something in it, and soon.");
		}
		output("\n\nYou glance beneath the bunny’s body, and you see that the hand on her cock has kept still");
		if(enemy.hasKnot(0)) output(", wrapped around her beating knot");
		output(" her legs shiver and strain, and there’s a growing pool of white beneath her pelvis, an obvious sign that she enjoyed the time between you two more than she’d apparently like to admit. Her bouncing balls have bunched up against her, squirting out every drop she has into a growing puddle.");
	}
	// Merge here
	output("\n\nIt takes you both a moment to wind down, between the animalistic rutting and the constant, sweaty musk the laquine is giving off threatening to make you rowdy for a round two. By the time you’ve caught your breath and you’ve remembered where you are and what you were doing before you ran into this lady in a latex jumpsuit, you’ve mostly come down from your lust-addled high.");
	output("\n\nFrom the looks of things, the laquine beneath you have come to her senses as well, although she looks significantly more worn out than you, ");
	//female scene:
	if(cunted) output("and her poor dick is still trapped and pinched beneath your body");
	else output("and her poor cunt is still weakly trying to grasp, flex, and milk the first dick that finally has the gumption to penetrate it");
	output(".");
	output("\n\nYou ask her if it was rough enough for her. She lazily gurgles something in response – and she neither notices nor resists when you fondle at the belt of her suit for a credit chit, as spoils for your victory. You stand, leaving the laquine half-naked, satiated, and completely exposed to the air of the mine beneath you.");
	output("\n\nHopefully every laquine in a jump suit you run into is this easy to negotiate a good time with!");
	// reduce Lust to 0; add [x] credits to PC’s credit count
	output("\n\n");
	processTime(30);
	pc.orgasm();
	sweatyDebuff(1);
	CombatManager.genericVictory();
}

// Victory scene against Bored Jumper
// PC gives Jumper a mean ol’ handy-jay, teases her until she bursts out of her suit
public function meanHandySuitBurster():void
{
	clearOutput();
	showBoredJumper(true);
	author("B");
	output("Her cock bulges obscenely at the crotch of her suit, along the length of her zipper, which goes from her neck all the way down between her legs. It gets larger as the seconds tick by; you could set your watch to the rhythmic, excited pulsing of the laquine’s meat as it strains against the material of her suit.");
	output("\n\nIt gives you a naughty idea.");
	output("\n\nYou ");
	if(pc.legCount > 1) output("step next to your plaything, your [pc.legs] against her left side");
	else 
	{
		output("slither along your plaything’s side");
		if(pc.isNaga()) output(", exaggerating your exotic, serpentine movements for her");
	}
	output(". She whimpers and bites her lower lip, her eyes trailing from your [pc.footOrFeet] and up across your body, ");
	if(enemy.HP() <= 1) output("in a sort of mock-reverence for you and your prowess – but, hell, ‘mock’ reverence is still reverence");
	else output("drinking in your every sexy, taut detail and practically fucking your [pc.crotch] and your [pc.chest] with her eyes as she fantasizes about what you’re about to do to her");
	output(".");
	output("\n\nInstead of indulging any of the fantasies you’re sure she’s having, you instead gently fall to your own side next to her, and you prop yourself up with your elbow. Your [pc.eyes] are steadily on hers as you reach for the clasp at her neck and gently pull it down, letting the familiar sound of a zipper being undone be the only ambience between you two.");

	output("\n\nHer breath catches in her throat as the metal teeth of her suit come undone against her body. Her sweaty musk assaults your nostrils; you pause the zipper at just below her [enemy.furColor] pelvis, your knuckles brushing against the bulge of her suit teasingly. Her hot meat, and all the potent scent with it, is trapped in the unforgiving confines of her suit and one measly zipper.");

	output("\n\nShe whimpers, her hand flinching towards her crotch to pull it the rest of the way down, but you’re quick on the draw and, with your free hand, you slap hers away. She flinches at the impact and pulls back – she can give her cock some air when you say it can, and not a moment sooner.");

	output("\n\nTo that end, you work your hand through her bellyfur. The sweat from her body bunches and collects in the gaps between your fingers; you can faintly hear audible, wet squishes and squelches as your fingers roam over her body, patting her down and massaging her. She moans and grinds her stomach against your hand, pushing her abs upward, imploring you to touch her more.");

	output("\n\nAnd you do: the laquine’s C-cup breasts are exposed to the warm air of the mines, her nipples hard enough to cut glass. Confidently, you lean forward, your eyes still on hers, and you take her nipple into your mouth, giving her right boob a wet suck: you can taste the collected sweat along the meat of her titty, and her permeating musk is all the more potent when her sweat hits your [pc.tongue].");
	if(pc.lust() < 50) output(" It’s more than enough to arouse you. Good; you weren’t quite as horny as she was, and this will make things more entertaining for you both.");
	else output(" The scent and the taste of such a horny, willing, hot body so close to you is intoxicating: if you’re intent on doing what you’re about to do to her, you’d better move quickly, or else you’re liable to blow your own gasket before her.");

	output("\n\nYour tracing hand dips further south, towards her burgeoning cock. You can hear the latex of her suit creak with effort as it attempts to maintain her immensity. You dip the tips of your fingers beneath the zipper, making like you’re going to reach underneath the surface of her suit and give her dick some company – but you pull back at the last second and drape your hand over the topside of her suit.");

	output("\n\n<i>“You’re a sore winner, you bit–”</i> the laquine starts, but you nibble on her nipple, causing her to ‘eek!’ and shut her mouth in surprise.");

	output("\n\nYou heft her package through the latex: it’s thick and bloated enough to resist your pushes and pinches, but it’s packaged and contained enough that it bobbles under its own weight when you push it this way and that. Your mouth salivates, wetting your tongue as it lathers and suckles on the laquine’s chest, as you have some fantasies of your own about what sort of weaponry she’s packing under that suit.");

	output("\n\nIt’s folded over itself, confined within the suit, but you map your way around its anatomy well enough with your fingers: when you dip down far enough, your fingertips press into the tender, thick flesh of her testicles, and you prod at them just to make your laquine victim jump in pleasure; you trace upwards, along what must be her vas deferens, until it curves into itself; and from there, the telltale curve of ");
	if(enemy.hasCock(GLOBAL.TYPE_HUMAN)) output("a flat, rounded helmet of a human-shaped cock");
	else if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) output("a blunted, flattened tip of an equine-shaped cock");
	else if(enemy.hasCock(GLOBAL.TYPE_CANINE)) output("a pointed, tapered tip of a canine-shaped cock");
	else if(enemy.hasCock(GLOBAL.TYPE_FELINE)) output("a stubby, pointed tip, with telltale nubs along the sides, of a feline-shaped cock");
	output(". And you know it’s the tip because that’s where her suit is wettest.");

	output("\n\nYou switch nipples, leaning over the laquine and pressing your hot body against her hot body; you shuffle your shoulders and grind forward, your [pc.chest] against her, increasing the friction and sharing the heat between you two, making things all the wetter and succulent for your mouth to suck at. Your eyes haven’t left hers: she keeps licking her lips and she keeps fidgeting on her back, trying to do something about her mounting lust, but no matter what she tries, you won’t let her.");

	output("\n\nGently, you stroke at her dick, using your fingers to press at her cock’s head through the smooth texture of her latex suit, and you tickle them down the side of her growing meat, giving it as much tactile feedback as one hand can. You get the results you want: the material of her suit continues to creak and stretch and groan under the pressure as her dick gets harder and bloats thicker. Her latex suit feels sort of stringy – like it’s taut enough to be played like a stringed instrument. Shouldn’t take much longer now.");
	output("\n\nYou go in for the kill. First, your mouth opens wider, to suck in more of her wet, squishy boob and give it a love-bite: you suck on it like it were a meal, compressing your cheeks and cleaning it of its salty sweat. The laquine grunts in pleasure, her chest reflexively heaving into your face to feed you more of her chest.");
	output("\n\nBut it’s a distraction: your hand loops back towards the zipper of her suit, and it slithers underneath the latex, working towards the bulge of her crotch. It’s humid as could be in there, and it’s scalding hot, enough to make your fingers twitch, but you don’t stop: you find her cock, and you eagerly wrap your fingers around its turgid base, jerking it roughly with the scant few millimeters you have inside the overstuffed suit.");

	output("\n\n<i>“Fuck, aahh,”</i> the laquine groans as everything comes to a head against her. Her eyes keep blinking and focusing on other things in the room, but they’re inevitably drawn back to your confident, steely gaze every few seconds. Her body rocks against you asymmetrically: her chest first, shoving more boob into your face, followed by her pelvis, desperately trying to fuck your hand, but there’s just so little room in her suit...!");

	output("\n\nHer breathing quickens as her orgasm approaches, and the back of your hand is soaked with what you assume is her hot precum. She humps against you, her eyes slowly crossing–");

	output("\n\nAnd, just as you hoped, you hear the sound of a zipper’s teeth being pulled apart in quick succession. The ‘click-click’ of each individual tooth coming undone punctuates the cute, horny moans the laquine is making; the heat surrounding your hand is released into the air of the mine as the zipper gives way under her expanding flesh, and her cock springs to its full, proud mast, flicking its dribbling pre halfway across the room as it does so.");

	output("\n\nShe gives one, last, satisfied moan as you feel her dick bloat once more, this time with its payload: her wet flesh expands in your palm one final time as her creamy load blasts straight up into the air before raining back down onto your hand, and a bit reaching as high as your [pc.hair].");

	output("\n\nYou had gotten exactly what you wanted – to arouse the laquine so much that you get her to burst through her own suit – but it comes with a consequence you weren’t expecting. As soon as her suit gives way, it releases a cloud of her musk into the already-cramped and heated space between you, and soon, you’re smelling the same smell you had since you had first brought your mouth to her tit, but it’s <i>so</i> much more potent.");

	if(pc.lust() < 50) output("\n\nThe smell takes some modicum of control of you and your instincts, and you have a tougher time than you expected to focus on what you’re doing");
	else output("You were on a bit of a hair-trigger when you started, and now the musk is threatening to break the control you have over yourself and the laquine beneath you with its intensity");
	output(": what you smell is a fucking <i>potent</i> breeding ");
	//PC is male:
	if(pc.hasCock() && !pc.hasVagina()) output("bitch, even through all the cum and all the testosterone-laced sweat; you had spent all this time jerking her meat that you hadn’t considered that she might have a little bit extra, and you dip your fingers down, questing for where her cunt would be. Sure enough, she has one, and it’s spasming and squeezing in time with her throbbing dick – moreso now that you’re giving it a bit of attention. It takes everything you have to not rip off her suit and start ploughing that fertile hole for everything it’s got");
	else if(pc.hasVagina() && !pc.hasCock()) 
	{
		output("stud, her antenna of a cock broadcasting just how badly she needs something for all that <i>masculinity</i> to be put to use to. You drool on her chest a little bit as you resist the urge to glance back – hell, you resist the urge to crawl yourself over her and shove that cumming rocket of hers into your ");
		if(!pc.isPregnant()) output("fertile ");
		output("box and fuck you like the victor of the confrontation that you are. She’s so hard, and she’s got so much cum... it’s difficult to convince yourself against doing something you might regret, no matter how good it might feel");
	}
	else
	{
		output("body, equipped with everything you might need to sate a crossed-up hermaphrodite like yourself. You feel the heat of her cock pound against your palm and its cum splash onto your hand, and you can pick out the familiar tang of a fertile, willing cunt clenching in orgasm mingling with the masculine musk of a proper cock shooting its load. Your body clenches and flinches at the sensory overload, and it takes everything you have to not roll over the laquine and start properly fucking it with everything you have: to plough that cute, hungry cunt and, when you’re done, you pop a squat of your own on that rock-hard piece of delectable meat");
	}
	output(".");
	
	var cummies:Boolean = false;
	if(pc.lust() >= 50) 
	{
		cummies = true;
		output("\n\nThe fantasies start to get a little carried away, and you struggle with yourself to remain in control of not just yourself, but the both of you: you’re both in a pretty vulnerable position, and one slip-up could mean that the roles would be reversed between you. Nonetheless, you can’t help but grind your body against hers throughout it all, and ultimately, you bring yourself to your own wet, sticky orgasm, ");
		if(pc.hasCock()) output("[pc.eachCock] flexing and billowing against the laquine’s thigh as you soak her body from the stomach down");
		if(pc.isHerm()) output(", followed by ");
		if(pc.hasVagina()) 
		{
			output("your [pc.vaginas] winking and squirting ");
			if(pc.totalVaginas() == 1) output("its");
			else output("their");
			output(" juices down your [pc.thigh], adding to the hot mess the two of you are collectively making. You can feel it dribble down your body before it splashes audibly onto the floor beneath you");
		}
		output(".");
	}
	output("\n\nThe laquine rides out her orgasm for a few moments longer, her cum spraying down onto you both with each impish skyward thrust of her body. You continue to jerk her through it all, helping her gush the last of her juices onto her ruined, sticky latex suit. You can practically see the sweat, and soon the cum, evaporate off her body in the heat of the mines.");
	output("\n\nSatisfied with the display you’ve made, demonstrating your position over the defeated laquine, you disengage from her. Your [pc.skinFurScales] sticks to her sweaty, furry body, and you have to slowly peel yourself from her. Her nipples are puffy and red; her cock is flagging and leaking the last of her cum onto her stomach; and she’s completely out of breath and exhausted.");
	output("\n\n<i>“Hah,”</i> she gasps, looking up at you defiantly, <i>“is... is that your idea of... putting me in my place? Sucking my tits and giving me a handjob? Who... who really came out ahead between us?”</i>");
	output("\n\nYou tell her that she can brag to her friends that she ‘won,’ if she wants – but she has to include the parts where you had subdued her first; then, you had teased her until she had burst through her own suit; and, if she ever wants another ride like that again, she’ll just have to keep losing to you. If she keeps losing, she’ll keep winning.");
	output("\n\nHer eyes narrow and her lips mouth to herself as she tries to parse the logic behind what you had just said to her. You make it easier for her: you won, and she lost, between you two, and you can prove it – you withdraw a credit chit that you had managed to slip from her belt while you were giving her that handjob.");
	output("\n\nShe starts, trying to lunge up and grab it out of your hand, but she’s too exhausted, physically and sexually, to get very far. She laughs again, at herself and her predicament, her gaze on yours. <i>“Fine,”</i> she relents, waving you off. <i>“I’ll be sure to put up a better fight next time.”</i>");
	output("\n\nYou advise her to not try <i>too</i> hard.\n\n");
	enemy.credits += 150;
	// Give the PC [x] credits; if the PC entered the scene with less than 49 Lust, increase Lust by 50; else, reduce Lust to 0
	processTime(30);
	if(cummies) pc.orgasm();
	sweatyDebuff(1);
	pc.applyCumSoaked();
	CombatManager.genericVictory();
}

public function facePussyFuckJumper():void
{
	clearOutput();
	showBoredJumper(true);
	author("Fenoxo");
	//Bimbo
	if(pc.isBimbo()) output("<i>“‘Kay!”</i> you cheer, wiggling your hips with a friendly smile. <i>“But I hope you like, really like pussy!”</i>");
	//Bro
	else if(pc.isBro()) output("You smirk self-assuredly. <i>“Hope you like puss.”</i> Of course she likes pussy.");
	//Nice
	else if(pc.isNice()) output("<i>“Don’t worry. I’m not going to leave before we can have a bit of fun.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("<i>“Don’t fret. No way I’d leave a sweet little love bun behind before having a bit of fun.”</i> You wink at the squirming pirate. <i>“I just hope you like my cunt as much as the rest of me.”</i>");
	//Hard
	else output("<i>“Sucks to be you. Or at least it will in a second, once you’re stuffing your tongue in my cunt.”</i>");
	//Merge
	output("\n\nThe lusty laquine licks her lips and stares you square in the crotch, ");
	if(pc.isCrotchExposed()) 
	{
		output("drinking in the sight of your lust-swollen vulva");
		if(pc.totalVaginas() > 1) output("e");
		output(".");
	}
	else output("wishing she could peer through your [pc.crotchCover] to glimpse the beauty behind.");
	output(" <i>“Pussy?”</i> Her ears perk halfway up before slumping back down under their own sweat-soaked weight. <i>“I love pussy.”</i> She rolls over onto her front, crawling on hands and knees toward you. <i>“Sweet, supple, sweaty cunt on my face...”</i> Her eyes stare up at you, dilated with hunger. <i>“Gimme. Please!”</i>");
	output("\n\nWho are you to deny the horny minx her just rewards? You");
	if(!pc.isCrotchExposed()) output(" shuck your kit with obscene swiftness, revealing");
	else output(" cock your hips to better display");
	output(" your [pc.vaginas]. ");
	if(pc.totalVaginas() == 1) output("It");
	else output("They");
	output(" glisten in the mine’s faint light thanks to the clinging sweat");
	if(pc.wettestVaginalWetness() >= 4 || pc.lust() >= 80) output(" and [pc.girlCum]");
	output(", and their reflection fills the wide-eyed laquine’s gaze. Pussy dominates her mind with temptations of smooth, sapphic skin and ambrosial, feminine honey. Bare twat makes her eyes cross when she leans closer, and her breaths come out as rapid, near-hyperventilating pants. The mere sight of your dewy mound");
	if(pc.totalVaginas() > 1) output("s");
	output(" proves hypnotic enough to control the once-rapacious rabbit.");
	output("\n\nThe mesmerized Jumper’s tongue lolls out in supplication. It’s lined up perfectly. An inch closer, and it’d be swimming through your slick cuntlips, but the bunny-girl waits. She knows she’s lost, knows that if she wants taste the sweat-and-pussy mix you’re offering she’ll have to do it on your terms. <i>“Please?”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Get in there, silly rabbit!”</i> You rake your middle finger through the sopping slit, displaying the heady mixture to your defeated aggressor. <i>“The water’s fiiiine.”</i> You suck the digit clean, the scrumptious juice jogging your silly brain into thinking a bit. <i>“Course the water’s pussy, I guess. Even better!”</i>");
	//Hard
	else if(pc.isAss()) output("\n\n<i>“That’s what you should have started with, bitch.”</i> You slap her across the face. <i>“Instead of wasting my time and energy, you should’ve been on your knees, begging for cunt.”</i> You pause, glaring at the flinching rabbit. <i>“Now quit slacking and </i>lick<i>.”</i>");
	//Else
	output("\n\n<i>“So the feral savage has some manners buried under all the sweat and grime after all.”</i> You smile down at her. <i>“Good. Get started, and show me what a good girl you can be.”</i>");
	//Merge
	output("\n\nLike a centaur barreling out of a racetrack’s gates, the lusty pirate lunges forward with every muscle in her entire body. Those powerful lapine legs launch her with catapult-strength, driving her face-first into your [pc.vagina] with sufficient force to pin you into the wall. Her nose deflects off [pc.oneClit], sliding south and in even as the hungry tongue worms around the southern portions of your femininity, seeking out leaking [pc.girlCum] and sweat with unnerring accuracy.");

	output("\n\nYou push back, but your fingers just slip through the the laquine’s soaking fur. A spray of salty droplets sizzles on the stone behind. Changing tactics, you grab hold of her ears, one in each fist, squeezing out dribbles of sweat in the process, but this time, you don’t lose your hold. You wrench her muzzle backward, revealing frenzied eyes and a muzzle caked in your [pc.girlCumColor] [pc.girlCumNoun]. She strains against your grip twice before giving up and stretching out her tongue, subserviently licking.");
	output("\n\n<i>“Better,”</i> you coo, pulling away from the too hot stone. <i>“Not so hard.”</i> Relaxing slightly, you let an inch of her furry ears slide through your fingers - enough for her lips to kiss your hungry folds.");
	output("\n\nThis is more like it. Tentative licks and kisses are exactly what you need, not brutal face-fucking... at least, not to start. You don’t release her, however. The troublesome slut-bun hasn’t earned that luxury, not after how she started. Her tongue is yours to command, and her face with it. You firmly guide her mouth around your exterior, then tip her head back for another taste of her lips on [pc.oneClit].");
	processTime(20);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",boredJumperMuzzleFuck2);
}

public function boredJumperMuzzleFuck2():void
{
	clearOutput();
	showBoredJumper(true);
	//Huge
	if(pc.clitLength > 12) 
	{
		output("Your captive cunt-kisser moans as she slides down the enormous, feminine fuck-pole. <i>“Mmmmm,”</i> is about the only sound she manages to make, though you sense she wants to say more. Her tail flutters happily as she takes you deep, opening her throat to surround you in the suckling sweetness of her skilled clitoral fellatio. You can only endure it for a few moments before you’re forced to pull back by raw sensation, baring your spit-shined clit to sauna-like air.");
		output("\n\n<i>“I fucking love clit-dicks,”</i> the cooing captive gasps. <i>“Especially when they’re all sweaty and hard from fighting slutty, horned up pirates.”</i>");
	}
	//Dicksized
	else if(pc.clitLength > 3)
	{
		output("Your captive cunt-kisser moans, <i>“I looove cli-”</i> right up until you push your feminine fuck-pole into her lips, quieting her into a gently vibrating hum of pleasure. You sense she wants to say more, to keep talking, but with that much pussyflesh in her mouth, she has far better things to do. Her tongue swiftly adapts to its new lot in life even as her cheeks hollow. The magnificent muscle coils and slides across the sensitive underside while her sweat, suckling maw pulls tighter, embracing you in dizzyingly intense pressure. You pull out before the raw sensation overwhelms you, baring your spit-shined clit to the sauna-like air.");
		output("\n\n<i>“Clit-dicks are so much fun!”</i> the cooing captive gasps. <i>“Especially when they get all sweat and hard from fighting silly, horny pirates!”</i>");
	}
	//Else
	else output("Your captive cunt-kisser moans, <i>“I loooove clits.”</i> Her tail flutters in happiness as her tongue tries its best to show you the truth of her statement. It coils and slides, licks then laps. Finally, it drums gently on your button, teasing you with short, sharp spikes of pleasure. <i>“Especially after they get all big and swollen for me.”</i> She suckles it adoringly. <i>“Even better when they’re salty and sweaty from fighting big, mean pirates.”</i>");
	//Merge
	output("\n\nYou note that both the latex laquine’s hands are between her legs, rubbing her cock through the rubber of her suit. The sweat dripping from her head has rendered the surface slick for easy teasing, and in her current position, they have little to do but squeeze and caress. The play across the glossy surface with expert care and attention. No wonder the dual-sexed slut is behaving: she’s getting exactly what she wants, but... so are you. You tighten your hold on the bouncing bunny’s ears and guide her south further south.");
	output("\n\nShe gasps, <i>“A little harder, please?”</i> as her nose comes to rest against the source of your increasingly noticeable girlmusk. She mimes licking in a frenzy, bobbing her neck back and forth as much your grip allows.");
	output("\n\nYou nod graciously, satisfied with the foreplay. The frenzied desire she displayed before seems more and more appealing the longer she touches your [pc.vagina].");
	output("\n\n<i>“Yessss,”</i> she hisses, diving in, stuffing her nose deep inside. Faint squeaks from below indicate that her own masturbation has ramped up even while she presses most of her muzzle inside you, sliding her tongue into your deepest recesses to harvest the freshest, tastiest [pc.girlCumNoun]. You groan in delight and thrust back against her, tugging her ears to seat her deeper. The cunt-loving laquine’s eyes cross, then drift closed. Her tongue’s intensity increases, swirling around, probing and teasing. Her throat audibly gulps with the fruits of her perverted harvest.");
	output("\n\nYou pull the sweaty pirate back before she can bring you over the edge and look down. Her mouth is wide and panting. Her eyes are barely open and staring up at you in adoration. Her fingers squeak noisily as they tease a dick that looks hard enough to rip through her suit, but it’s clear that the self-pleasure is entirely secondary to her next to the taste of your ambrosial slit.");
	output("\n\n<i>“More!”</i>");
	output("\n\nYou pull her back in before she gets any ideas. She gets a single lick in before you drag her back out by her ears, setting a slow but forceful pace as you ramp up to fucking her face. Your [pc.hips] pump along with your hands as you take your pleasure from her, no longer allowing her any control over how she serves your [pc.vagina]. Her slutty, furry muzzle is your new dildo. You fuck it firmly, at first being careful not to hurt her, but as time passes, you’re less and less careful with how you manhandle her by the ears.");
	output("\n\nThe little slut loves it anyhow. Whenever your motions flag, she looks up stupidly, drooling pussy juice and spit everywhere. Her hands stroke, and her tail wags in happiness. The little minx clearly adores the rough treatment, so you let all pretenses drop and focus on what you really want: to cum.");
	output("\n\nYou push both her ears into one hand and put the other on the back of her head for better grip, then you really start to fuck her. The lurid squelches echo down the tunnel. She slobbers everywhere she can get at on her way in and out, and the friction of her sweat-impregnated fur sliding against the sides of your [pc.clits] is heavenly. With each face-fucking cycle, the pleasure grows more intense and demanding. Your muscles quiver at the edge of exquisite delight.");
	output("\n\nVibration ripples through your [pc.vagina] from your lapine dildo as she abruptly begins to scream in delight. The crotch of her suit bulges out obscenely from her orgasm. You can hear it squelch and creak. The forceful ejaculations briefly create forward-facing dents, though they fade into benign yet undoubtedly fragrant bubbles of creamy cum in no time at all.");
	output("\n\nYou cum right along with her, socketing her deep into your [pc.vagina] and crying out yourself.");
	if(pc.hasCock()) output(" [pc.Cum] rains down on the back of her head as your masculine equipment unloads.");
	if(pc.canMilkSquirt()) output(" Simultaneously, streamers of [pc.milk] gush out from your [pc.chest], let down as your body gives in to the overwhelmingly erotic release.");
	if(pc.isSquirter()) output(" The cunt-embedded laquine gurgles, her throat bulging. With her stuffed that deep, there’s nowhere for your squirting climax to go but straight into her belly. You hold her place through the entire orgasm, milking your climax into her slobbering, slutty maw.");
	else output(" The cunt-embedded laquine gurgles, struggling to vocalize the strength of her own climax and keep up with the juices yours produces. Ultimately, she winds up swallowing. You hold her in place through the entire thing, drizzling [pc.girlCum] into her maw until her teeth are drowning in it.");
	processTime(20);
	pc.orgasm();
	if(pc.canMilkSquirt()) pc.milked();
	clearMenu();
	addButton(0,"Next",boredJumperMuzzleFuck3);
}
public function boredJumperMuzzleFuck3():void
{
	clearOutput();
	showBoredJumper(true);
	output("Neither of you has much strength in the wake of those powerful orgasms. She slides out of your grip - and your [pc.vagina] - with a ");
	if(!pc.isSquirter()) output("pleased sigh");
	else output("heavy gasp and [pc.girlCumNoun] dribbling from her slack maw");
	output(". You stumble to the floor not long after, clutching your [pc.chest] and shuddering your way through a half-dozen aftershocks.");
	output("\n\nLooking over at your would-be conqueror, you can’t help but smile. She’s still rubbing her cock, squeezing more cum into her suit, inflating it by sheer force of lust. It looks good on her like that, lending her a thicker, more curvaceous appearance, up until the beads of white spill out of the seam at her neck, anyway. She glances your way, trying to lick your pussy-juice from her face and moaning, <i>“This was soooooo worth it!”</i>\n\n");
	processTime(10);
	CombatManager.genericVictory();
}

//Fuckin' Some Bunny Bunbuns
//By QuestyRobo
//[Fill 'er up] {Open up her suit and give her a cream filling./You need a dick to do this./You're not quite 'potent' enough to get a good stuffing out of this.}
//[Facefuck] {Grab a face and give it a fuck. Pretty self-explanatory./You need a cock to do this./You're pretty sure she's not a snake, so dislocating her jaw with your giant dick wouldn't be the best idea.}

//Fill 'er up
//Requires big cummies and a weiner.
public function fillErUpBBY():void
{
	clearOutput();
	showBoredJumper();
	author("QuestyRobo");
	var x:int = pc.biggestCockIndex();
	output("As you consider your options, you notice a bubble starting to form at the tip of her [enemy.cockNoun]. The over-excited bun is squirting sizable wads of pre into her suit, creating an increasingly filled bubble at the tip.");
	output("\n\nThere’s an idea! You saunter up to the prone cottontail and squat over her face. She coos, wondering what you’re getting up to. <i>“Open up,”</i> you command.");
	output("\n\nShe looks up at you, confused. <i>“Uh, ‘scuse me?”</i>");
	output("\n\n<i>“Your suit collar, open it up.”</i> ");
	if(!pc.isCrotchExposed()) output("You strip down, tossing your [pc.crotchCover] off to the side as you grab your chosen equipment. ");
	if(!pc.isErect()) 
	{
		output("You stroke your [pc.cock " + x + "] until it’s fully hard, letting it bounce freely in the air");
		if(!pc.isCrotchExposed()) output(" after you release it.");
	}
	else output("Your [pc.cock " + x + "] is already nice and hard, bouncing freely in the air.");
	output("\n\nA confused look runs across her face as she shrugs and pulls down her zipper to just below her collarbone. <i>“Like that?”</i>");
	output("\n\n<i>“Perfect.”</i>");
	output("\n\n<i>“What are you - ughf!”</i> Her question is muffled as you lower yourself down and smother her face with your ");
	if(pc.balls > 0) output("[pc.balls]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else output("groin");
	output(". Not worrying too much about her for now, you grab your [pc.cockNounSimple " + x + "] with one hand and her suit with the other. ");
	if(pc.cockVolume(x) < 500) output("You thread your manhood into her suit and then zip it up as far as it will go, encasing your member between her suit and body.");
	else 
	{
		output("Her suit bulges heavily at the sheer size of your cock. You keep going though, determined to shove as much of your member in as possible. The laquine groans under you as the pressure mounts but that only serves to egg you on as she softly vibrates your ");
		if(pc.balls > 0) output("sack");
		else if(pc.hasVagina()) output("pussy");
		else output("loins");
		output(". You sigh in satisfaction as you cram as much of yourself in as she’ll hold, feeling yourself sandwiched between her body and the slick suit.");
	}
	output("\n\nIt’s boiling in there! Between the heat and sweat on the suit itself and her own overheated body you feel like you just stuck your [pc.cock " + x + "] in a sauna.You’re tempted to take it out to check if your skin singed, but the sheer pleasure you’re getting from having it in there makes stopping an impossible proposition. The heat and lust pours into you like a jug under a waterfall, filling your ardor to such oversaturation that you can’t help but act on it.");
	output("\n\nYou pull back your [pc.hips], making sure to really rub your ");
	if(pc.balls > 0) output("[pc.balls]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else output("bare groin");
	output(" into her face. She reciprocates by lavishing you with her tongue as you rear back, getting a crotch full of slick spit and boiling-hot breath. The extra stimulation is like coals onto the already raging fire of your desires, merely stoking the flames with nowhere near enough power to influence them either way.");
	output("\n\nYou take your first thrust into her suit, feeling the material stretch around you, but never feel like you’re even coming close to pushing its limits. Meanwhile her luscious tits rub along the underside of your member, pressed so tightly against your [pc.cock " + x + "] that she’s almost giving you a hands-free titjob with each thrust.");
	if(pc.cockTotal() > 1) 
	{
		output(" Your other cock");
		if(pc.totalCocks() > 1) output("s bounce ");
		else output("bounces ");
		output(" against the outside of her suit, getting splashes of residual heat that radiate from the sweltering inside.");
	}
	if(pc.balls > 1)
	{
		output("\n\nThe slutty cottontail goes from just licking your sack to worshipfully sucking on one of your [pc.balls]. Your breath catches in your throat as she does. The heat from her mouth flows into your sack, turning your whole crotch into a single, super-heated lump of pleasure. She doesn’t let up, even when you start thrusting again. No matter how far or fast you move you always feel her hot lips on your ball skin, instantly polishing your sack until it feels rubbed raw.");
	}
	else if(pc.hasVagina()) output("\n\nYou gasp when you feel the cheeky cottontail shove her tongue into [pc.oneVagina]. It’s surprisingly long and flexible, digging deep inside you to scope out all of your most sensitive spots. The little lagomorph is adept at pleasing pussy it seems. The second she finds your G-spot she’s on it like glue. Even once you start thrusting again she never misses a beat.");
	else output("\n\nYou wince as you feel the lusty laquine bite down softly on your groin. It doesn’t hurt, in fact it feels strangely nice. You suppose there’s not really much to work with down there, but this is still just a bit... off. You have to admit though, when she brings her tongue in on the action it actually starts feeling really good. She even manages to keep steady after you start thrusting.");

	output("\n\nHer legs writhe as she reaches both of her hands down to her crotch and begins jerking off through her suit. The sight of her enjoying you using her so much drives you to go even faster. You grab the bunny bitch around the waist for leverage and really dig in. You use the lusty laquine like a proper fucksleeve while she struggles to keep from being knocked around by your frantic thrusts; all the while she continues to expertly please your ");
	if(pc.balls > 1) output("[pc.balls]");
	else if(pc.hasVagina()) output("[pc.pussy]");
	else output("over-stimulated crotch");
	output(", still determined to pleasure you despite, or maybe even because of your rough treatment.");

	output("\n\nYou have to admire the flexibility of her suit. No matter how violently you distend it, it always seems to bounce back into place right before you stretch it out again. A pocket of pre starts forming around her crotch, filled in equal parts from both of you as the tension ratchets up. Her feet dig into the ground as she humps the air in time with your thrusts, egging you on by showing you just how much she’s into this.");

	if(pc.balls > 1) output("\n\nYou feel your [pc.balls] start to tighten in the bunslut’s mouth, getting ready to unload their well-coaxed load into her suit.");
	else if(pc.hasVagina()) output("\n\nYou finally reach your limit. Her incessant tongue is determined to push you over the edge, and it’s succeeding!");
	else output("\n\nYou feel the familiar tightness in your gut of an approaching orgasm. It’s strange to think that getting your groin nibbled at would feel so good but this girl seems to know how to make it work.");
	output(" She seems right at her peak too. Her hands are blurs around her encased [enemy.cock] and throbbing bunny balls. The laquine slut moans shamelessly under you. Whether she’s doing it out of pleasure, to egg you on with the vibration, or a bit of both is beyond you at this point. Right now all you can think of is the wave of [pc.cum] rushing up your urethra.");

	output("\n\n");
	if(pc.cockVolume(x) < 5000) 
	{
		output("You go off inside her suit, throwing her into orgasm in the process. The copious amount of jizz that you’re both able to produce starts to flood the suit, lifting the bunny slut off the ground slightly as it settles around her butt and back. Both of you keep going, feeding each other’s orgasms through a delicious positive feedback loop. You go until you feel your loads start to wash over your [pc.cockNounSimple " + x + "]. At that point you pull out and rezip her collar, letting the rest of your load splash over her face, and the rest of hers top off her bloated suit.");
		output("\n\nThe bunny bitch takes a deep breath as you lift yourself off of her. She looks up at you with reverence as she pants in pleasure. <i>“Now <b>that’s</b> hot!”</i> the laquine says as she jostles around, moaning as the heavy liquid mass in her suit flows around her. She looks at least twice as big as before, the suit even retaining some of her natural curves.");
		output("\n\n<i>“Shit, I could get used to this.”</i> She struggles to sit up, letting the cummy weight all settle in her lower half. <i>“You can go now, do whatever, or something.”</i> Her voice is dreamy and far-away as she basks in the heat of the cum sack her suit has turned into. With nothing left to do here, you ");
		if(!pc.isCrotchExposed()) output("slip your clothes back on and ");
		output("move on.");
	}
	else
	{
		output("You explode in her suit, filling it with obscene amounts of your juices. She goes off too, but her orgasm is a trickle in the ocean of your release. Within seconds the latex suit loses all form as you pump it full, turning into some kind of obscene balloon. No crevice is left unfilled, right down to the tips of her toes.");
		output("\n\nYou do your best to hold it all in, but it starts leaking out almost immediately. When the pressure becomes so great that you can’t possibly fit any more [pc.cum] in, you yank out and quickly rezip the suit. You still have plenty left to give though. Grabbing your [pc.cock " + x + "], you rise up off of her and aim down to baste the bloated bunny bitch. By the time your orgasm finally starts to wane, she looks like a waterbed with a blissed-out bunny sticking out, basted completely [pc.cumColor] from head to toe.");
		output("\n\nThe bun is completely out of it by the time you actually check on her. She’s awake, but she seems so engrossed in the state of her suit that you doubt you’ll be able to get anything else out of her. You ");
		if(!pc.isCrotchExposed()) output("re-dress and ");
		output("get ready to head out, patting the obscene cum balloon bunny on the belly and watching her moan and jiggle as you leave.");
	}
	output("\n\n");
	processTime(30);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Facefuck
public function faceFuckTheLaquineJumperooni(x:int):void
{
	clearOutput();
	showBoredJumper();
	author("QuestyRobo");

	output("You take a look over the prone bunny whore. A suit like that makes it pretty hard to scope her out too well. Her [enemy.cockNounSimple] is jutting out plain as day, and thanks to the sheer tightness of the suit many details of it are very easy to make out. You’re not really in a dick mood though, at least not hers.");
	output("\n\nLet’s see; can’t do much with her tits, can’t even see her pussy, not in the mood for anal. As you run down your options, your [pc.cocks] grow harder and harder, ");
	if(!pc.isCrotchExposed()) output("bulging out your [pc.crotchCovers]");
	else output("rising higher and higher into the air");
	output(". The lusty lagomorph zeros in on your increasingly tumescent member");
	if(pc.cockTotal() > 1) output("s");
	output(" and starts licking her lips. Say...");
	output("\n\n<i>“Hungry?”</i>");

	output("\n\nThe cockhungry cottontail grins. <i>“Maybe. Been in the mood for some meat lately, and it looks like you got a fat, juicy sausage right there.”</i>");

	output("\n\nHer attention pushes a surge of blood into your cock");
	if(pc.cockTotal() > 1) output("s");
	if(!pc.isErect())
	{
		output(", rocketing ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" to full hardness in seconds");
	}
	else
	{
		output(", somehow making ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" even harder");
	}
	output(". You run a hand along your ");
	if(!pc.isCrotchExposed()) output("straining bulge");
	else 
	{
		output("shameless dick");
		if(pc.cockTotal() > 1) output("s");
	}
	output(", emphasizing your hardness. <i>“Want a taste?”</i>");

	output("\n\nInstead of answering verbally, she gets up onto her knees and opens her mouth wide. <i>“Yes please!”</i> Well, if she’s going to be <i>that</i> enthusiastic about this you might as well give her all you got! ");
	if(!pc.isCrotchExposed())
	{
		output("You toss off your equipment, letting it fall to the side as you strut up to her.");
	}
	else output("You let your [pc.cocks] jut straight forward, proud and rigid as you strut up to the begging bunny.");
	output(" Her eyes flit between ogling your member" + (pc.cockTotal() > 1 ? "s":"") + " and silently begging by meeting you eye to eye. You grab your cock and tap the tip to her nose, letting her savor it.");

	//Normal ween:
	if(pc.cockVolume(x) <= 200) 
	{
		output("\n\nHer tongue flicks along your shaft as she sniffs your [pc.cockHead " + x + "]. The cock-obsessed laquine’s eyes cross as she zeros in your member. Her breath is hot and ragged on your crotch, spilling onto your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("loins");
		output(" and fueling your ardor even more.");
		output("\n\n<i>“Looks real tasty,”</i> she says before giving your underside a long, exaggerated lick. <i>“Come on and give me a taste, big [pc.boyGirl], I’m <b>starving</b>!”</i>");
	}
	//Biggus wennus:
	else
	{
		output("\n\nShe marvels at the sheer size of your member, taking deep whiffs of your powerful scent and trying to cover as much of it as possible with her tongue. Her breath is ragged, almost panicked while she takes you all in, almost in disbelief at your size but not dissuaded.");
		output("\n\n<i>“Damn, you’re fucking huge! Oh baby, this thing’s gonna fuck up my throat so hard... Stick it in you fucking monster; wreck me!”</i>");
	}
	output("\n\nYou pull your [pc.cock " + x + "] down from her nose and rub it along her lips. She reverently kisses your [pc.cockHead " + x + "], impatient about getting you in her mouth. Her hands are busily jerking off her cock through her suit. If the sizable bubble at the tip is any indication, she’s already pretty close to cumming, and you’re sure what’s about to come is going to set her off more than once.");
	output("\n\nYou grab her drooping ears and hold them as tight as you possibly can. <i>“Open up,”</i> you cry as you yank her down on your member. ");
	if(pc.cockVolume(x) <= 200) output("She takes your inches like a champ, getting to your base on the first thrust and staying there for a few glorious seconds before you pull her off, only to slam her down again immediately after. The cock-loving bunny whore doesn’t complain, in fact, if her moans and the way her cum bubble expands is any indication, she’s enjoying it <i>a lot</i>.");
	else 
	{
		output("As hard as you push, there’s no way she’s going down all the way on the first go. Her eyes start pivoting up into her head as you try and you hear and feel her moaning hard around your stupidly huge member. The laquine cockslut cums hard, bucking her hips involuntarily while the rest of her body goes through a twitching fit. Her mouth still gapes open when you pull her off, strands of drool running down the sides. She regains just enough of her senses to wordlessly mouth <i>“more”</i> over and over again until you finally comply and shove her back down.");
		output("\n\nThis time goes more smoothly, and she nearly gets it all down. Her throat bulges out obscenely with the outline of your cock as he gleefully chokes it all down. The third push is when she finally gets it all down, her lips kissing your base.");
	}
	output("\n\nSpit drools out of the sides of her mouth as she surrenders to you completely. Her ears twitch in your hands, still flickering with life but entirely subservient to your whims. The feeling of having complete dominance over her drives you to go even faster, to bounce the bunny bitch on your cock so hard that in the back of your mind you worry about bruising your pelvis; but that’s a secondary concern right now. Despite only having a scant few moments of air, she seems pretty comfortable, at least as much as you can be when you’re ");
	if(pc.balls > 0) output("balls deep on a ");
	else output("hilt deep on a ");
	if(pc.cockVolume(x) > 200) output("massive ");
	output("cock.");
	output("\n\nTears stream down her face, but she never stops moaning around your dick, never stops cumming her brains out. Your rapid pace combined with the vision of a laquine fuckslut choking on your " + pc.mf("","wo") + "manhood drives you over the edge. Your gut feels heavy as cum rushes up your urethra, and you shove the bunny bitch down on your cock as far as she’ll go.");
	output("\n\n");
	if(pc.cumQ() < 500) output("You fire your load down her throat, a satisfying cap off to your intense throat-fucking as her moans finally die down and her body settles.");
	else if(pc.cumQ() < 10000) output("You fill the bunslut with a hearty helping of [pc.cum]. It flows into her stomach without resistance, bloating it out with the sheer amount you’re able to put out. She gives out one last groan at being so filled before she finally settles down after all the intensity.");
	else output("The bunslut groans out as you explode inside her. Her stomach bloats immediately as your biblical load floods into her gut. She goes still as your virility turns her into a living bunny cum balloon and even starts overflowing around your [pc.cock " + x + "], making a healthy puddle on the ground.");
	output("\n\nYou push her off your cock and watch her tumble to the ground. She takes long, deep breaths as she starts ro recover from your brutal facefucking. Her eyes flutter shut as exhaustion takes over, and she passes out.");
	output("\n\nSpent and with nothing else to do, you ");
	if(!pc.isCrotchExposed()) output("re-dress and ");
	output("go along your way.\n\n");
	processTime(30);
	pc.orgasm();
	enemy.loadInMouth(pc);
	CombatManager.genericVictory();
}

/* Some Bored Jumper Win Scenes
by William */

//Instantly liked this NPC when I first read about it and I want to add three scenes to the Bored Jumper when the PC wins. Not sure if variants of these have already been added (I’m not a backer) as Fen’s doc has no such win scenes reflected.
//Three scenes: TakeHerDick (PC can choose to catch Doggystyle Anal or Vaginal Missionary), Cowgirl (Bunny bouncing on you), and Heat Sex (Jumper & PC take Breeder’s Bliss and go at it like horny bunnies, must have a vagina. If PC is Herm, then the bunny gets filled too).
//There’s not too many places or ways to get sweaty in this game. I feel like wandering around the mines, as oppressively hot as they’re described, should cause it overtime. Especially if you rest. Therefore, after any of these scenes, the PC will end up Sweaty!


//[TakeHerDick]
// Tooltip: The slut-bunny has powerful legs. More importantly, she has a big, juicy, gorgeous cock. You could get that furry futa ready and give her the perfect chance and place to use those assets.
// PC can choose to be penetrated Vaginally or Anally, Missionary & Doggystyle respectively.

public function takeTheBunnyDick():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");

	// PC Bimbo
	if(pc.isBimbo()) output("<i>“Oh we’re gonna have some </i>real<i> fun, babe!”</i> you all but moan, rocking your hips and tits hypnotically. <i>“And have I got a treat for you!”</i>");
	// PC Kind
	else if(pc.isNice()) output("You eye the horny pirate with a little regret. The poor girl’s shuddering in cold ecstasy as her huge cock tents her jumpsuit with a grinding creak. Her feverish [enemy.furColor] paws struggle to masturbate, to relieve her pent up lust, as she hopes against hope you’ll join her. <i>“I can’t just leave you like this, come here...”</i> You smile, kneeling down to her.");
	// PC Misch
	else if(pc.isMischievous()) output("<i>“Yeah, I’m in charge, all right!”</i> You declare, grinning playfully, planting your foot against the lapine’s odorous crotch. Even through your toes you can feel the surging [enemy.cock] within the shiny black latex and the powerful heartbeat pulsing in every vein. <i>“You’re going to show me just what a jumping jackrabbit can do.”</i>");
	// PC Hard
	else output("You fold your arms at the pitiful pirate, furiously groping and masturbating herself as she looks up to you with pleading, [enemy.eyeColor] puppy eyes. <i>“You’re right, you’re going to do exactly what I say.”</i> You say, dropping down to the roiled rabbit’s fuzzy face and gripping her [enemy.furColor] chin. <i>“I cum first, got it?”</i> The horny bunny nods vigorously.");

	// PC Low Libido (<=33?)
	if(pc.libido() <= 33)
	{
		output("\n\nYou tug the zipper on the perky pirate’s jumpsuit, getting an earful of cute, arousing moans as you slowly expose inch after inch of perspiring [enemy.furColor] fur. You can feel the sweat dripping from your [pc.face] as you eye her crotch; you smell the pirate herm’s odorous pheromones spiced with musk rising up with her body heat. The huge cock sandwiched between fur and rubber is just waiting for you to free it from its lair, all too ready to grant your wish. You have, after all, been unable to look away from it. When you pull the zipper down that final distance, her proud [enemy.cock] pops free, already at full mast, and nearly bops you on the nose. You tentatively lick and suck at the [enemy.cockHead], giving her throbbing dick the attention it deserves.");
	}
	// PC Mid Libido (34-66?)
	else if(pc.libido() <= 66) output("\n\nYou grope at the slut-bun’s ample chest and tumescent cock, giving her a quick, chaste kiss before tugging her jumpsuit zipper all the way down. Her [enemy.cock] pounces from its smoldering lair right onto your eager [pc.face] with a sweat-wet pop. You wrap your [pc.hands] around the base of her turgid rod and jerk fast and hard, getting the blood flowing where it matters. When her foot-long prong is fully erect, you lick up and down the underside of the shaft like a sweet candy, before coiling it around the neck of her twitching [enemy.cockHead], enjoying the leporine’s sexy moans all the while.");
	// PC High Libido (>=67?)
	else output("\n\nYou pounce on the musky futa bunny, roughly groping those sinfully soft tits of hers before trailing down to what you’re really after. She squeals in excitement as your hands mirror the latex-curves of her hidden, bulging cock, begging you for more. You waste no time <i>rending</i> the zipper down and getting that damn jumpsuit out of the way. The second her [enemy.cock] tastes the air, you’re already tasting it, hollowing your cheeks as you suck and bob on her delicious [enemy.cockType] lollipop.");
	// Merge
	output("\n\nYou wrest your [pc.lipsChaste] from her dick and nestle your nose in a better place - her full, swollen sack. Her cock is amazing, but her dangling spheres are a much more erotic target for your affections, especially as her legs coil around your body to lock you into her powerful lap. Like a submissive slave, you kiss each nut before licking and nibbling at her perspirant plastered orbs, making sure your hands stay busy around her shuddering cock and in her sopping cunt as well. <i>“Ooohh..!! Oh fuck, fuck! So good so good so goooood!!”</i> She moans, her ginger paw now on your head.");
	if(pc.hasLongEars()) output(" The horny pirate scratches behind your [pc.ears] lovingly,");
	else if(pc.hasHair()) output(" The horny pirate lovingly rubs your hair,");
	else output(" The horny pirate lovingly rubs your head,");
	output(" gently ushering you further into her pheromone-drenched hermhood.");

	output("\n\n");
	if(pc.libido() <= 33) output("Even you have to admit, it tastes amazing. ");
	else if(pc.libido() <= 66) output("You take her encouragement happily. ");
	else output("You need no encouragement: it tastes phenomenal! ");
	output(" The salty, slightly musky taste of the juice between her [enemy.cockType] cock and churning balls makes you wriggle; it makes you intimately aware of your own building arousal for the fucking to come, and you");
	if(pc.legCount > 1) output("r [pc.legs]");
	output(" grind and squirm in anticipation of taking this monster, of your body permanently molding to its shape, you can’t shake these sumptuous spheres from your mind, only with your tongue. You coil your spasming [pc.tongue] around each orb, sucking and tugging on them with tender care, savoring the weight of them, just how packed they are. They <i>deserve</i> to be cleaned, to be the focus of your every ministration...");

	output("\n\nYour vision starts to blur and even blacken as the minute goes by just washing and worshiping those heavy nuts of hers, almost losing track of your real intention here. Your senses are inevitably overwhelmed by the miasma of libidinous desire emanating from her, becoming overridden by the salubrious brew of this distinctive rabbit’s sex drive and the building need in overheating loins. You can smell it all even through your mouth - and taste it too! You force your head up and inhale sharply, exhaling the hot air inflating your sore lungs on her trembling [enemy.cockHead]. You lick the dollops of fresh pre before restarting the blowjob, your mouth freshly lubed with her taste.");

	output("\n\n<i>“Oh fuck yessss! You’re so hot!”</i> She groans, staring at you pointedly. <i>“You’re nothing like the slaves here - you’re so eager to be my ball-slut, and you’re soooo good at it! I wish I could have a cutie like you all to myself! Unf, just thinking of you sucking my balls all day, <i>everrrryyy dayyy</i>, drinking every drop of my cum with that sexy tongue of yours, a nice collar on your neck with a leash in my hand I’d tug when I wanted your mouth... I betcha’d like that, huh?”</i> The pirate compliments, flashing you a toothy smile while her [enemy.cock] waterfalls pre into your mouth. The thought of her draping her [enemy.cock] over your face like that flips a submissive switch somewhere, and you feel ");
	if(pc.hasCock()) output("[pc.eachCock] jump");
	else if(pc.hasVagina()) output("[pc.eachVagina] flood");
	else output("your [pc.asshole] clench");
	output(" as such an image appears in your lust addled mind.");

	output("\n\nYou blow hotly on your descent down her length and suck loudly on your ascent. ");
	if(pc.hasTail()) output("Despite how debasing her comments are, you can’t help but wag your [pc.tails] in response. ");
	output("She giggles as she grabs your head again, moving her hips in tune with your jaw, grinding the [enemy.cockHead] against your inner cheeks as she pets you. <i>“Mmmm you’re so soft and wet, I love it! If I knew you were gonna be a good, cock hungry " + pc.mf("boy","girl") + " I’d have just showed you the goods to start with! I’m gonna have to remember - unnhh! - for next time I see you! Ohyes, keep swallowing that dick!”</i>");

	output("\n\nYou ");
	if(pc.libido() <= 33) output("roll your eyes at");
	else if(pc.libido() <= 66) output("feel proud hearing");
	else output("get hornier thanks to");
	output(" her words and ");
	if(pc.libido() <= 50) output("maintain your composure");
	else output("work even harder.");
	output(" The laquine’s head arches back when you lash your tongue against her cumslit. Her [enemy.cockNoun] distends one cheek and then the other before you take her deeper into your throat. You squint and suppress your gag reflex as her musky member invades deeper and deeper into you until you finally bottom her out in your steamy maw. With 13 inches of sweaty, tight, vellicating bunny cock in your mouth, you can feel the thumping of every heartbeat in her chest, and you can certainly hear her elated exultations. <i>“Wow!”</i> she cries, <i>“You’re amazing! Keep sucking, pleasepleaseplease! I’ll let you choose where I cum, I don’t caaaare, I wanna cum so badly please I’ll be your slut c’monc’mon!”</i>");

	output("\n\nYour vibrate your tongue against the underside of her dick, nearly gagging until you shift into a better position. You pull your head back and experiment with your capacity, setting a proper pace. ");
	if(pc.libido() <= 33) output("You remind yourself that this isn’t all you want to do with her.");
	else if(pc.libido() <= 66) output("You remind yourself you wanted to get laid, but just sucking her cock is nice.");
	else output("You barely remember that you planned to have her fuck you; sucking her cock is just too much fun!");
	output(" You spend the next few seconds deepthroating the flinching futa-bunny, but not too fast as to make her cum. You can feel your hands involuntarily drawn to your ");
	if(pc.hasCock()) output("[pc.cocks]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else output("[pc.asshole]");
	output(", now infected with the overwhelming desire your pirate lover displayed after you beat her.");

	output("\n\n<i>“Heeeyyy... Unfff... please don’t edge me, I’m so close to cumming! I know you won but... but...”</i> She whines, her paw still on your head. You smirk as best you can at her, what with your mouth overflowing with [enemy.cockNoun]. You ");
	if(pc.libido() >= 66) output("regretfully ");
	output("pull off of her throbbing dick, much to her dismay, and smile at her with sweat and saliva dripping from your [pc.lips].");
	if(pc.inHeat()) output(" It’s so hard to resist the urge to plunge her perfect cock down your throat, being in heat like this, but this is what you’ve been building her up for: to fuck your randy body the way it needs to be.");

	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Alright, hun!”</i> You address the lewd bunny with as sexy a voice as you can conjure, <i>“It’s time for you to return the favor!”</i>");
	// PC Kind
	else if(pc.isNice()) output("\n\n<i>“Sorry, but I don’t want you to cum yet. I need you to do something for me, too.”</i> You tell her with an innocent look that soon makes way for a desperate, lewd smile.");
	// PC Misch
	else if(pc.isMischievous()) output("\n\n<i>“Uh-uh,”</i> You mutter somewhat hoarsely, <i>“this isn’t all about you! It’s time for you to repay the debt in kind!”</i>");
	// PC Hard
	else output("\n\nYou slap the bunny’s groping hands away. <i>“I come first.”</i> You glower at her, and she shrinks back as you tower over her sitting form.");
	//Merge
	output("\n\n");
	if(!pc.isCrotchExposed())
	{
		output("You hurriedly throw off your [pc.crotchCovers], baring your naked body to the horny rabbit. ");
	}
	output("She stares at your form with wide-eyed lust, hypnotized by your every curve, but especially by your ");
	if(pc.hasCock()) output("throbbing [pc.cockNounSimple]");
	else if(pc.hasVagina()) output("drizzling [pc.vaginaNounSimple]");
	else output("[pc.chest]");
	output(". Before the mood is ruined, you have to decide where you want her to stick that [enemy.cock] of hers...");

	processTime(20);
	pc.lust(50);
	sweatyDebuff(1);
	clearMenu();
	if(pc.hasVagina()) addButton(0,"Vaginal",vaginallyFilledByJumperWiNSceneByWilliam,undefined,"Vaginal","Get this horny bunny to fuck you like one!");
	else addDisabledButton(0,"Vaginal","Vaginal","You need a vagina for this.");
	addButton(1,"Anal",getTheBunnyPirateToTakeYourBootyByWilliam,undefined,"Anal","Get the bunny-pirate to take your booty!");
}
//[Vaginal]
// Tooltip: Get this horny bunny to fuck you like one!
// PC will get ‘Bloated Belly’ from her sheer cum output.
// PC will get ‘Cum Drenched’ if they are a herm.
public function vaginallyFilledByJumperWiNSceneByWilliam():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	var x:int = rand(pc.totalVaginas());
	output("You give your sweaty sweetheart a provocative come-hither look, doing your damndest to not wince in pain at the too-hot rocks stinging your feet. The laquine crawls over on all fours, swooning at the sight of [pc.oneVagina]. When her nose touches your cunt, you stymy a giggle when her whiskers tickle your nethers. You grip her fuzzy head as she digs in with naught but a sexy moan, engulfing your crotch ");
	if(pc.balls> 0)
	{
		if(pc.ballDiameter() < 4) output("and [pc.balls] ");
		else output("and a fair portion of [pc.ball] ");
	}
	output("with her mouth. Her smooth, skillful tongue lunges into your muff, filling you like a vibrator");
	if(pc.hasCock()) output(" whilst her paws make sure not to leave your [pc.cocksLight] out of the equation");
	output(". You twist and groan as your own needs are being satisfied, though the heat of arousal radiating from your sopping loins is fast leaving you unable to stand, especially as one of many orgasms approaches.");

	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“You’ve got a good tongue, babe, keep it up!”</i> You squeal, lurching your hips in motion with her thrusting tongue to make sure she gets a good, lasting taste of your [pc.girlCum].");
	// PC Kind
	else if(pc.isNice()) output("\n\nYour [pc.eyes] shut, your mouth only capable of producing indecipherable words and erotically charged, weapons-grade moans. You grip the rabbit’s ears and rub her face against [pc.oneClit], forcing her to suck on it as well. <i>“Just like that...”</i> you murmur.");
	// PC Misch
	else if(pc.isMischievous()) output("\n\n<i>“Ohh, yes!”</i> You wail when her tongue hits the right spot. <i>“That’s it, that’s perfect! Keep going, you’re gonna get more than a taste at this rate!”</i>");
	// PC Hard
	else output("\n\n<i>“Right there, slut.”</i> You grip a little tighter to rein in her wild tonguing. The laquine eases up at your command, and gets her racing licker back where it matters.");
	// Merge

	output("\n\nYour mesmerized muff-muncher mewls as she nibbles on your [pc.clit], <i>“Love how you tashte... I love your pussy so mush....”</i> ");
	if(pc.balls > 0) output("You can’t help but grin as her happy face is obscured under your own [pc.balls], which she orally savors in much the same you did her. ");
	output("She jerks her head left and right in rapid motions, her greedy tongue hurling threads and beads of sweat and girl cream everywhere. Though as painted in perspiration as you are, what’s a little more mess for the mind-rocking kama-sudor to come? She coils and slides that oral organ through every crevice in your pussy, sometimes coming close enough to kiss the entrance to your cervix. All you can do is wail in pleasure-driven joy as she brings you to your first, long awaited orgasm.");
	output("\n\nYou groan hoarsely, about to collapse when a suffocatingly <b>hot</b> climax floods your body and pours out with the sweat caking your [pc.skinFurScales]. After your long-winded fellatio, you were too turned on to last long against her vigorous tongue-fucking.");
	output("\n\nThe twat-hungry bunny catches you and sets you down on her jumpsuit, after she takes it off");
	output(". You take a moment to catch your breath and regard her with some surprise. She looks at you with a glimmer of hope in her desperate eyes, her hands jerking her [enemy.cockNoun] in the meantime.");

	output("\n\nYou spread your [pc.legs] and open your [pc.thighs] to her, baring your [pc.vagina " + x + "] to her with a ");
	if(pc.libido() <= 33) output("hesitant");
	else if(pc.libido() <= 66) output("happy");
	else output("excited");
	output(" look on your reddened face. You can see the furry futa gulp and bite her lower lip, exposed this close to your fragrant aura and slick, femcum glazed pussy. Even from here in the dim light of the mine, you can see a burning, ravenous look in her [enemy.eyeColor] eyes. She direly wants to fuck you");
	if(pc.hasCock()) output(", maybe even be fucked by the flaring [pc.cockNounSimple] you’re packing");
	output(".");

	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“What’re you waiting for? Stick that [enemy.cockNounSimple] right in my pussy, you know you want to!”</i> You shake your hips and tilt your head cutely, spreading your glossy cunt for her.");
	// PC Kind
	else if(pc.isNice()) output("\n\n<i>“I’m ready for you, so make us both happy.”</i> You smile invitingly at the lusty laquine, parting your drenched vulva for her. <i>“I want your [enemy.cockNounSimple]...!”</i>");
	// PC Misch
	else if(pc.isMischievous()) output("\n\n<i>“Here you go, your reward for hanging on so long! Show me what you’ve got with that [enemy.cockNounSimple]!”</i> You challenge her, spreading your saturated slit for her.");
	// PC Hard
	else output("\n\n<i>“Right here.”</i> You spread your pussy for her and smirk. <i>“Put that [enemy.cockNounSimple] to use for both of us.”</i>");

	output("\n\nThe jumper pounces on you, gripping one of your ankles in her paw and rubbing her [enemy.cockHead] against your pussy. Looming over you, she inserts one of her fingers into your [pc.vagina " + x + "], causing it to secrete a trail of [pc.girlCumFlavor] slime-like juice. She smears her restless cock with your fluids at the tip, teasing you with an enamored look on her fuzzy face. You can <i>feel</i> her hips lurching, her lapine body ready to thump and hump, but she seems to be waiting for something else...");

	output("\n\n<i>“Mmm, you’re sexy and all, but I still don’t know how badly you want my dick...”</i> She teases you. What mockery is this!? You’re perfectly prepared with a mix of natural lube and a deluge of cold perspirant! She could take you in one easy thrust and start working now! Though, to be fair, you’re sure there’s a thundering, internal scream muffled underneath all that sex-soaked fur of hers. <i>“You gotta tell me how much you want this full frontal frolic, how much you want me filling your hot, cum-hungry pussy with every drop in my balls.”</i>");

	// PC Libido Low
	if(pc.libido() <= 33) output("\n\nYou groan in agony and exhibit a forlorn, miserable look to avoid having to shame yourself any further, but your body needs this. Badly. <i>And she knows it</i>. Damn it. You’ve never needed to cum harder, what’s wrong with saying a few words to get that [enemy.cock] to lift this fog of lust? <i>“I want your dick! I need that hard cock more than anything else in the universe! Come on, please fuck me!”</i> You wail.");
	// PC Libido Medium
	else if(pc.libido() <= 66) output("\n\nDamn this girl for teasing you! Of course you want it. How can she not see it in your [pc.vagina " + x + "] or in your [pc.eyes]? Oh well, there’s no shame in admitting you need this dicking, especially when just a couple of words will unlock a world of enviable bliss. You cry out, <i>“Fuck me with your [enemy.cock]! I need that dick in my [pc.vagina " + x + "] more than you even know! Fill me with your bunny cum until I can’t walk anymore!”</i>");
	// PC Libido High
	else output("\n\nYou’d be upset at her teasing you like this when you’re ready for a hot, steamy fuck, but humiliating yourself beneath her is just part of the fun! You proudly reply, <i>“Yeah! I’m readier than you are, I need that [enemy.cock] in my pussy like you wouldn’t believe! Fuck me so hard I won’t be able to stand! Empty your balls in my womb. Give me everything you’ve got, slut!”</i>");
	// Merge
	output("\n\n<i>“You got it!”</i> The bunny quips, and her [enemy.cockType] rod rams into your pussy with the speed of runner who just heard the starting gunshot. She batters the entrance to your womb in that sprinting thrust, already hilted in you before you can figure out what just happened. So shocked by the simultaneous ease and force of her skewering penetration, your [pc.vagina " + x + "] constricts around her invading member and floods her thick tool with fresh [pc.girlCum]. You, on the other hand, lose control of your [pc.legOrLegs] and howl emptily into the air as she watches your shaking body with an indulging expression.");

	//if suula/aphrodisiac cunt
	if (pc.vaginas[x].type == GLOBAL.TYPE_SIREN || pc.vaginas[x].type == GLOBAL.TYPE_ANEMONE) output("\n\nHaving lost control of your alien biology in the aftershock, the tentacles and venom-laced cilia in your vagina sting the jumper's cock, making her keel over with a surprised look on her face. <i>“Oh gosh, you've got <i>that</i> kind of pussy, huh? Bet I know why, you just want the hardest dick imaginable in 'ya !”</i> She smiles, righting herself with a ragged groan.");
	// PC Looseness 1-2
	else if(pc.vaginas[x].looseness() <= 2) output("\n\n<i>“Nice and tight, but that’ll change. I’m gonna make your pussy a cock sock just for me!”</i> The jumper declares, gripping your hips.");
	// PC Looseness 3-5
	else output("\n\n<i>“Been taking a lot of cock down here? Mmm, good thing I’m so big, bet you wouldn’t feel a lesser cock.”</i> The jumper muses, gripping your hips.");
	// Merge
	// PC Vaginal Virgin
	if(pc.vaginalVirgin)
	{
		output("\n\nBefore she starts fucking you good and proper, your laquine lover looks down to your pussy after noticing you whimper once. A trickle of blood bleeding out brings a cheshire grin to her lapine features. The laquine’s tone changes, <i>“First time, huh? Shoulda told me, cutie.”</i> She delicately cups your cheek with a strangely reassuring empathy. <i>“Letting me fuck you after you won, and being your first? Fuckin’ adorable. Nasty pirate girl gets first lay of the hottie who beat her, what a story!”</i> She licks her lips at you, <i>“One that I won’t forget.”</i>");
		output("\n\nYou urge her to continue.");
	}
	// Merge
	pc.cuntChange(x,enemy.cockVolume(0));

	output("\n\nThe futa bunny pulls out slowly, letting you savor every inch of the cock that’s about to mercilessly plow your cunny. <i>“Can’t believe how lucky I am,”</i> she sultrily intones as her [enemy.cockHead] is barely inside you, <i>“thought I’d find a cute slave to fuck today and I find you instead. Was gonna get you all horny and fuck your face...”</i> She thrusts back in slowly, swiveling her hips to grind against every side of your inner walls. <i>“But you let me take charge anyway. Now here we are, two hot, sweaty bitches fucking in a dark cave, dripping all over each other while who knows who or what’s listening! ...But who cares... this is what good sex is aaalll about! A good bitch on the end of a nice dick, begging for more!”</i>");

	output("\n\nYou quickly lose the ability to form meaningful vocabulary as the rabbit works her legs the way they were meant to be used, only able to act as she said: <i>“Harder, please!”</i> Soon, she’s humping you with the primal strength and speed of an oversexed animal, her [enemy.cock] filling every nook and cranny of your creaming cunny. All you hear now are her moans seasoned with the wet claps of her crotch and balls against your own. You grip at your her jumpsuit underneath you as she varies her movements, sometimes rubbing that huge dick of hers against your cervix, other times stopping short to fill you with copious amounts of pre that drizzle out with your [pc.girlCum].");

	//Pheromone Sweat
	if (pc.hasPerk("Pheromone Sweat")) output("\n\nThe jumper sniffs at the air purposely, her eyes unfocusing for a moment. <i>“Damn, how do you smell so fucking good?”</i> She leans down and licks at your glistening body, a gleeful moan following. <i>“You got modded sweat or something?! That's awesome, best taste ever!”</i> She licks a few more times just to get that flavor down. <i>“Wish everyone had that, but then... mmmm... Nobody else'd taste as good as you!”</i>");

	output("\n\nOne of her furry hands moves to your heaving chest, brazenly groping at your [pc.breasts], pinching the bulging [pc.nipples] on each of your ");
	if(pc.biggestTitSize() >= 1)
	{
		output("tits. ");
		if(pc.biggestTitSize() >= 4) output("She practically purrs as her paw sinks into your generous boobflesh, taking no small amount of delight in your reactions as she mixes a little playful pain with more sensual caresses. ");
		output("You press your ");
		if(pc.biggestTitSize() < 4) output("perky boobs");
		else output("malleable melons");
		output(" together and squeeze her probing hand while she focuses on fucking your pussy.");
	}
	else output("pecs. You press your chest back against her and squeeze her probing hand while she focuses on fucking your pussy.");

	output("\n\nBrought to another orgasm, your arms flop to the hot rocks around you, your brain being rendered insensate with every contraction below. <i>“Fuck yes! Watching you cum is hot!”</i> she says, <i>“You’re going to make mine all the better, babe!”</i> Despite how close the rabbit was to cumming earlier, she’s keeping herself in check. Through her turgid dick, you can feel the pounding of her heart with every thrust. All 13 inches of her [enemy.cockNoun] violate your unresistant hole with reckless abandon. With how wet you are thanks to all the sweat, girl, and herm lube, the rutting rabbit really has turned you into her personal cock-sleeve. She pounds you relentlessly, threatening to go a level deeper than balls deep while kneading handfuls of your [pc.butt].");

	output("\n\nFaster, somehow, she pounds your gaping pussy, spread wide by her impressive insertion. You yelp and moan, unable to get used to her uneven rhythms punctuated by random molestations. She occasionally reaches up to your tits, tweaking your stiff nipples as she immerses herself in the comfort of your spasming muscles");
	if(pc.hasCock()) output(", sometimes jerking your sweat-drenched [pc.cockNounSimple] too");
	output(". Your cries magnify in volume until you froth at the mouth with sweat and drool. You’re close to your last orgasm, and you can <i>feel</i> the slut-bunny’s hyper-climax fast approaching. Even this fuck-hungry pirate has her limits!");
	output("\n\nYou bite your lip, weakly looking up to your furry lover. She’s about to blow, you can sense it in every erratic movement. Thinking fast, you extend your arms up to her.");

	// PC Kind & Misch
	if(pc.isNice() || pc.isMischievous()) output("\n\nThe laquine pirate falls into your embrace and you pull her into head-cradling cuddle, sharing a kiss as your greatest orgasm washes over you. Your mouth is sealed tight; her tongue wraps around yours, a giggle rumbles up from her chest when you groan loudly into her mouth. You have no other recourse, after all, with you both on a climactic descent.");
	// PC Hard
	else output("\n\nWhen the laquine pirate falls into your embrace, you grab her ears tight and kiss her forcefully as your greatest orgasm washes over you. You seal her lips with your own and pin her tongue with yours. A low purr rumbles up from her chest when you groan loudly into her mouth. You have no other recourse, after all, with you both on a climactic descent.");

	// Merge
	output("\n\nAnnouncing your blissful joy at highest volume to anyone else in this cave, you cum all around the [enemy.cock] conquering your pussy.");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks], smothered between both of your humid abdomens, ");
		if(pc.cockTotal() > 1) output("are stimulated to their boiling points");
		else output("is stimulated to its boiling point");
		output(", erupting all over your [pc.skinFurScales] and her [enemy.furColor] coat of fur.");
	}	
	output("\n\n<i>“Ffffuckkk! Cumming!”</i> The rabbit screams. With one last mighty thrust of her hips, she pushes her dick as far as it will go into your [pc.vagina " + x + "] and lets your shameless body take it from there.");
	//jumper dog
	if (enemy.hasCock(GLOBAL.TYPE_CANINE)) output(" After an eye widening grind, the laquine slams her bulging knot into your cunt, dragging a pained moan from you as she buries her bone. <i>“Ah-ohh! There we go... Bet this is why you wanted my cock, you just wanted a chance to get impregnated by a pirate! Maybe you'll have twins!”</i> she moans, whipping her lop-ears in the shock of ejaculation.");
	output(" Heat blossoms in your nethers and your body flushes; she’s slathered, squeezed, and caressed by your abused pussy, soon bellowing a near feral roar of dominance. Her backed up sperm smashes you like a club, your eyes roll back as she pins you under her weight and cums hard.");


	output("\n\nThe jumper’s smooth, rhythmic thrusts splatter and paint your canal white. Her voluminous load soon spills out, splattering all over your crotch with every repetition. You hold tight to her as her churning balls empty what must be a few day’s worth of seed into and around you. Hyperventilating now, you lose what little strength you had, your limbs slumping to the ground unmoving. The rabbit falls face first into your [pc.chest] just before you’re lulled into unconsciousness.");
	processTime(45);
	for(var y:int = 0; y < 3; y++) { pc.orgasm(); }
	pc.loadInCunt(enemy,x);
	clearMenu();
	addButton(0,"Next",boredJumperFucksYourPussyWinSceneByWilliamEpilogue);
}

public function boredJumperFucksYourPussyWinSceneByWilliamEpilogue():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You awaken an indeterminate time later, sitting up with your head on the laquine’s shoulder. You still feel like you’re overheating, but at the same time, your fierce satisfaction helps you ignore the sweltering heat. Her cock, still smeared with every fluid under the lamp, bobs back and forth in her lap - coincidentally where your eyes open. You feel her warm arm around your shoulders keeping you close - and safe from any other roving, sex-starved rabbits. <i>“Hey,”</i> she nuzzles you. <i>“Loved it, betcha did too.”</i>");
	output("\n\nYou blush, only able to nod your exhausted head in assent. <i>“Won’t be thinking about sex for a half a day. At least.”</i> She laughs. <i>“Better get outta here, babe.”</i>");

	// PC Kind or Medium/High Libido
	if(pc.isNice() || pc.libido() > 33)
	{
		output("\n\nYou eye her messy dick and decide to clean her up before you go. The laquine coos as you swallow her flaccid member, licking up all the dried cum and feminine juice, giving her hardening pole a good spit shine before admiring your work - her glistening cock.");
	}
	output("\n\nThe naked laquine slaps your [pc.ass] when you stand and get ready to go. <i>“Better watch yourself around here, I’m not gonna forget how that felt.”</i>");
	output("\n\nYou shrug your shoulders, collecting your things before moving on. Which is made a bit more difficult by your cum-bloated belly. You could really use a shower right about now...\n\n");
	processTime(10);
	CombatManager.genericVictory();
}

//[Anal]
// Tooltip: Get the bunny-pirate to take your booty!
// PC will get ‘Bloated Belly’ from her sheer cum output.
public function getTheBunnyPirateToTakeYourBootyByWilliam():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	// PC Not Naked
	if(!pc.isAssExposed() || !pc.isCrotchExposed() || !pc.isChestExposed()) output("You plant yourself on your pile of clothes soaked with cold sweat and set down on all fours, pointing your bare [pc.ass] to the dick-bunny behind you, wiggling your butt like a coquettish whore.");
	// PC Naked
	else output("You order the dick-bunny to take her jumpsuit off and give it to you, which she does with some difficulty - having one paw always on your slippery cock is a bit of a handicap after all. Using that sweat-soaked, creaking latex suit as cover, you get on all fours and stick your [pc.ass] out to the dick-bunny, wiggling your butt like a coquettish whore.");
	// Merge
	output("\n\nHalf-gasping moans reach your [pc.ears], she must really, <i>really</i> like what she sees! You can hear the moist <i>schlucks</i> of her hands working her cock in frustration. You eye the fatuous futanari with a little confusion over your shoulder as she seems to lose focus on you and plunge into an abyss of lust that she can’t climb out no matter how furious her pawing. She better not cum before you do, and definitely not before she reams you! You clear your throat and whistle sharply at her.");

	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Come on babe, don’t get off yourself! I’ve got a nice ass right here for you!”</i> You cry, swiveling your [pc.hips] in a variety of teasing dances.");
	// PC Kind
	else if(pc.isNice()) output("\n\n<i>“I hope you don’t plan on leaving me out, come on, it’s all yours.”</i> You say, your [pc.hips] still rocking back and forth.");
	// PC Misch
	else if(pc.isMischievous()) output("\n\n<i>“Don’t you dare cum like that! You owe me this, so come on!”</i> You grouse, beckoning her with your hand and quivering [pc.hips].");
	// PC Hard
	else output("\n\nYou bark, <i>“I said, I cum first! You don’t want to know what happens if you don’t get over here.”</i>");
	// Merge

	output("\n\nThe drooling jumper shakes her head, crawling over with the gusto of someone walking on hot coals. She wordlessly buries her face in your [pc.ass], and you feel that sweat-laced tongue of hers tasting ");
	if(pc.hasVagina()) output("both ");
	output("your [pc.asshole]");
	if(pc.hasVagina()) output(" and [pc.vaginas]");
	output(". The sloven slut’s salivating stream soon has your nethers both glazed and ready for further appraisal. You clench your teeth when her tongue darts in, aided by the spreading of your cheeks.");

	output("\n\nYour eyes squint and you pant in half breaths, feeling her probing kisser leaving a lasting impression. When her tongue pulls out, she sticks her latex covered fingers in, spreading your supple sphincter with remarkable ease. <i>“Isn’t being so hot and sweaty just... convenient? Makes it so easy to fuck a butt slut like you. The best kind of lube, always available, and so, so sexy...”</i> The laquine muses breathily. <i>“Mmm, and I’m gonna fill you up so much...”</i>");
	// PC Butt <=5
	if(pc.buttRating() <= 5) output("\n\nYou can feel the laquine’s [enemy.eyeColor] eyes glossing over your petite tush, humming pleasantly as she rubs your [pc.ass]. <i>“A bit on the small end, dont’cha think? But there’s a plus... I’ll be able to see every inch of my dick entering you bit by bit until you bulge and squirm, what’s not to like?”</i>");
	// PC Butt 6-12
	else if(pc.buttRating() <= 12) output("\n\nThere’s an obvious satisfaction to the pirate herm’s voice as she gropes handfuls of your [pc.ass]. You feel her licking at your cheeks, cleaning off the sweat streaking down your [pc.skinFurScales], cooing in delight. <i>“A nice ass on a good butt slut. An ass this good is made to be fucked. Betcha just go around sticking it out to anyone who’ll look, hoping they’ve got a dick to give you the filling you need.”</i> She accentuates her points by giving you a few good slaps, reddening your ass to a shade similar to the one on your face.");
	// PC Butt >=13
	else output("\n\nStinging slaps echo through the mines, the lusty laquine reacting with glee as your huge ass jiggles in the dim light. She must <i>love</i> what she sees. She sure as hell loves the sound it makes between your pleasured yelps. <i>“Mmmm, what have you been taking to get an ass like this? And you’re just letting me use it?”</i> She smears the sweat streaking down your generous cheeks, groping so much buttflesh that her delicate paws can’t help to contain it. <i>“Fuckin’ hot... I can’t believe how lucky I am that you’re just begging for this.”</i>");
	// Merge
	output("\n\nYou feel the laquine’s cock nestle between your ass cheeks, a hard, painfully throbbing rod of [enemy.cockType] meat humping against your [pc.asshole]. She cups one of her tits, pinching a nipple, hissing <i>“Yessss...”</i> as she imagines the ways you’re going to writhe beneath her. A certain sense of submission courses through you when you feels your ass flesh ");
	if(pc.buttRating() >= 12) output("engulfing");
	else output("massaging");
	output(" her musky member, it spurting pre all over your butt");
	if(pc.hasTail()) output(" and [pc.tails]");
	output(", like you’re " + indefiniteArticle(pc.race()) + " toy that exists solely for her pleasure. Her alien fingers casually spread your hole, mixing sweat and femlube for an easy entrance, preparing you to take 13 inches of indomitable dick. It all feels just right.");

	output("\n\nWarmth born of that submissive notion and the arousal stirring within your pores floods through your body. You shiver as she says <i>“Too bad I can’t have you spreading whenever I want”</i>, the weight of her [enemy.cock] draped on your back ");
	if(pc.libido() <= 33) output("worrying");
	else output("exciting");
	output(" you for the fucking to come. She massages your left buttock, her cock still thrusting in and out of your canyon, whispering increasingly lewd thoughts into your [pc.ear] until you’re moaning in agony. Too turned on, your hips rock in her lap as you beg, <i>“Please, fuck me! I can’t wait anymore!”</i>");
	output("\n\n<i>“Uh-uh...”</i> The bunny giggles. <i>“Gotta tell me just how much getting this [enemy.cock] in there means to you first.”</i>");
	// PC Low Libido
	if(pc.libido() <= 33) output("\n\nAh, what the hell? Damn, there’s nothing for it. She’s got you right where she wants you, hot - very hot - and very bothered. You push your hips into her cock and sandwich it against her pheromonally-drenched abdomen and your pre smeared ass. She grabs your [pc.hips] and holds you still in response. Sighing, humiliated, you indulge the pirate, <i>“P..please, fuck my ass! I need your dick, I need you to fill me with every drop of cum!”</i>");
	// PC Medium Libido
	else if(pc.libido() <= 66) output("\n\nAgh, this fucking tease! You thrust your ass against her dick, sandwiching it between her sex-drenched abdomen and your smeared ass, grinding into her with a low groan. The lusty pirate slaps your ass, reminding you who has the dick pointed at the other’s ass, and holds you still. Quaking with lust, you shout, <i>“Fuck me! Please, fuck me, I’m a hopeless butt slut who needs [pc.hisHer] ass fucked by a horny pirate!”</i>");
	// PC High Libido
	else 
	{
		output("\n\nThat question can be answered just by looking at the absolute state of you! Who is she kidding? Your [pc.asshole] is <i>breathing</i> at the prospect of her penetrating it");
		if(pc.hasVagina()) output(", your [pc.vaginas] " + (pc.totalVaginas() > 1 ? "are":"is") + " drooling fem-slime");
		if(pc.hasCock())
		{
			if(pc.isHerm()) output(",");
			output(" and your [pc.cocks] " + (pc.totalCocks() > 1 ? "are":"is") + " aching at the thought of your bum molding to her cock");
		}
		output(". You grind your [pc.hips] forcefully against her [enemy.cock], trying to do the deed yourself, but a sharp slap later, you’re held still. Struggling in her grasp, you wail, <i>“I want your dick in my ass! Please fuck me hard, so hard, I don’t wanna walk straight! I’m a horny butt slut who needs to be fucked into the ground!”</i>");
	}
	// Merge
	output("\n\nYou brace yourself, feeling her [enemy.cockHead] kissing your [pc.asshole], droplets of pre and whatever else slipping through the door she’s knocking on. She purrs, <i>“Yeahhh... Gonna take this nice and slow. I wanna hear everything as I stretch you out.”</i> You grunt and groan as she presses ever more forcefully until a sharp, wet pop signals her penetration. Your body reacts harshly to that brief moment in time. Electric tingles surge up and down your spine and your toes curl painfully. Just from that, you’re cumming!");
	output("\n\n");
	// PC Vagina & Cock
	if(pc.isHerm())
	{
		output("You feel your hermaphroditic equipment strain and tug, your [pc.cocksLight] spurting [pc.cum] that about boils on contact with the ");
		if(!pc.isChestExposed() || !pc.isAssExposed() || !pc.isCrotchExposed()) output("equipment");
		else output("jumpsuit");
		output(" beneath you. Not to be left out, your [pc.vaginas] " + (pc.isSquirter() ? "squirt":"dribble") + (pc.totalVaginas() == 1 ? "s":"") + " a fresh helping of syrupy [pc.girlCumNoun] on her legs and yours, glazing you both with hot girl cum.");
	}
	// PC Vagina
	else if(pc.hasVagina())
	{
		if(pc.isSquirter()) output("Your [pc.vaginas] contract" + (pc.totalVaginas() == 1 ? "s":"") + " as [pc.girlCum] squirts out and drenches the herm bunny’s legs and your own, glazing you both in fresh, overheated feminine syrup.");
		else output("Your [pc.vagina] contract" + (pc.totalVaginas() == 1 ? "s":"") + " as [pc.girlCum] dribbles out and slicks the herm bunny’s legs and your own, glazing you both in fresh, overheated feminine syrup.");
	}
	// PC Cock
	else if(pc.hasCock())
	{
		output("Your [pc.cocksLight] spurt" + (pc.totalCocks() == 1 ? "s":"") + " sizzling loads into ");
		if(!pc.isChestExposed() || !pc.isAssExposed() || !pc.isCrotchExposed()) output("your clothes");
		else output("her jumpsuit");
		output(" beneath you, nearly boiling on contact with the ground.");
	}
	// PC No Cock & Vagina
	else output("Your whole body shivers in orgasm just from having your helpless butt penetrated, and you already feel more cresting the proverbial hill as she sinks further in...");
	// Merge
	output("\n\nYou whimper and half-whine being stretched wider and wider by the bunny’s thick cock, slowly easing each of those 13 inches in your overstuffed bum. She pats you on the butt and coos, taking it slower when she sees you shivering in more pain than pleasure. Once you calm, she gets over halfway in. She still has so much more to give, and you already feel so full! Gritting your teeth, you finally feel her furry balls caress your ");
	if(pc.hasVagina()) output("pussy");
	else output("skin");
	output(", her [enemy.cock] fully inserted into your rear, hilted inside your prostrate form.");

	// PC Anal Virgin
	if(pc.analVirgin)
	{
		output("\n\n<i>“Tighter than I’d expected... oooh... don’t tell me...”</i> The laquine leans over, her cock shifting in your butt as she does, and asks, <i>“First time getting butt fucked?”</i> You can only nod your head as she strokes your back, arching under her stimulating touch. <i>“That’s fucking adorable. To think, my day was going to be the same old boring wrangling, maybe a hunt for some decent sex... Not only do I get my ass kicked by a hottie like you, I get first lay of this ass of yours after you beg for a stuffing!”</i>");
		output("\n\nYou curse, telling her to hurry and do just that.");
	}
	pc.buttChange(enemy.cockVolume(0));
	// Merge
	output("\n\nThe laquine’s knees spread and plant, her hips swiveling up with her body as she mounts you. A ginger paw pushes your head down to the ground, your cheek pressed against the ground in submission. Your fingers crimp ");

	if(!pc.isChestExposed() || !pc.isAssExposed() || !pc.isCrotchExposed()) output("your shucked [pc.armor]");
	else output("her leaky jumpsuit");
	output(" as she pulls her dick back and thrusts in again, setting the pace with a few experimental humps. <i>“Oof...”</i> She groans. <i>“I can’t believe how good you feel... I don’t always get someone sticking their ass out at me.”</i> You hear her lick her lips. <i>“I’m gonna fuck you until we’re both drowning in a puddle of sweat!”</i>");

	output("\n\nYou ");
	if(pc.libido() <= 33) output("gulp");
	else output("encourage her");
	output(", feeling her [enemy.cockHead] brushing softly against your sensitive walls. Just as she wanted, you squirm in the pirate’s grasp as her bestial member plumbs your depths, sparing no inviolable inch as your insides are painted white with overflowing pre. <i>“Unhh... I’m glad you worked me up, can’t tell you how <b>hard</b> it is to hold back screwing you like this. Are you the type of person who likes to pretend they’re in charge by fighting but you really just love getting pounded? Coulda skipped the fighting but, damn... feels good working out all my kinks in you.”</i>");
	output("\n\nBlushing, you purse your lips at the question, staying silent as the horny herm picks up the pace, her [enemy.cock] jackhammering into your abused anus on those energetic leaper’s legs of hers. She babbles incoherently as her nuts clap against your skin, spraying cum and sweat every which way. Your whole body rocks in tune with hers, sometimes you involuntarily push back into her lap to magnify the mighty tremors that rattle your entire frame. You cum again, splattering whatever’s in the way with another ample helping of sexual effluence.");
	//Pheromone Sweat
	if (pc.hasPerk("Pheromone Sweat")) output("\n\nThe jumper sniffs the air purposely, her eyes unfocusing for a moment. <i>“Damn, how do you smell so fucking good?”</i> She leans down and licks at your glistening body, a gleeful moan following. <i>“You got modded sweat or something?! That's awesome, best taste ever!”</i> She licks a few more times just to get that flavor down. <i>“Wish everyone had that, but then... mmmm... Nobody else'd taste as good as you!”</i>");

	output("\n\nShe slaps you on the ass and you look back in half shock, seeing her ears dripping with a deluge of sweat as a result of her sexual workout. The jumper leans down until her tits are pressing into your shoulder blades, her upper half contouring to the curves of your back. Her whiskers tickle your skin as she nibbles and licks wherever her aimless tongue can travel, often on your [pc.face]. Her movements may have slowed down a bit in this position, but they’re no less simulating... It’s like everything is being rearranged down there...");
	output("\n\n<i>“This is fun, but you really fucked me up, edging me earlier... I’m gonna need a little more outta ‘ya.”</i> The herm whispers in your [pc.ear], then suddenly hooks her arms under yours. Yelping in surprise, you find yourself yanked up, her [enemy.cock] still in your ass, and ushered to the nearest wall. Her hands firmly on your [pc.ass], she rails you with unparalleled speed until all your brain comprehends are the sounds of bitches moaning in overwhelming pleasure.");
	output("\n\n<i>“Fuck yeah! This is what a butt slut is for!!”</i> The jumper cries, a relishing hand running through her soaking wet hair before grabbing your arm, <i>“Coming down here and sticking your butt out at the first girl with a dick, what’d ya think would happen?”</i> She eventually grabs both of your wrists together and holds them behind your back in one paw, her other slithering around to your [pc.breasts].");
	output("\n\nShe doesn’t wait for an answer, she merely slams into you faster, scraping you against the rock wall, but not harmfully. She roughly squeezes your [pc.nipple], doing whatever she can to stimulate you further even as your body still recovers in the aftermath of another minor orgasm. You can feel her building you up to the big one, and thank goodness she is, because her incoherent moaning is sounding more like grieving sobs! You squeeze her paw and shout that you’re about to cum!");
	output("\n\nHer [enemy.cock] pulls back only to spear you one last, powerful time. You shriek; your body implodes, fingers and toes spasming in the aftershock.");
	//jumper dog
	if (enemy.hasCock(GLOBAL.TYPE_CANINE)) output(" Her swelling, lumpy knot grinds against your [pc.asshole], stars explode in your eyes when it rams in, ensuring no drop of cum is wasted. <i>“Here you go, all the cum you want!”</i> she cries, lop-ears whipping back and forth in the shock of her turgid ejaculation.");
	output(" Her slippery hands press on your ass, squeezing as much of you around her erupting rod as possible. And erupt she does, thick ropes of jism flow through your intestine, fast distending your belly. Each jet of cum forces out the previous all around her ejaculating dick. Every load is precluded by a noticeable churn of her furry balls against your butt, soon depositing what must have been a few day’s worth of pent up seed right where it belongs.");
	output("\n\nThe laquine thrusts in and out of you slowly, making sure you take every last drop one way or the other. You slump against the walls ");
	if(pc.hasVagina() && pc.hasKnees()) output("when your pussy’s orgasmic contractions weaken your knees");
	output(", your fingers slowly losing strength");
	if(pc.cockTotal() > 1) output(" as your [pc.cocksLight] shoot" + (pc.cockTotal() == 1 ? "s":"") + " your [pc.cum] on the wall");
	output(". The last thing you feel, drifting into a nap, is someone drawing you into their embrace.");

	processTime(40);
	for(var y:int = 0; y < 3 ; y++) { pc.orgasm(); }
	pc.loadInAss(enemy);
	clearMenu();
	addButton(0,"Next",winAndGetButtPoundedByBunEpilogue);
}

public function winAndGetButtPoundedByBunEpilogue():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You come to a while later, sitting up against the wall with a lamp across the passage dangling lamely. You close your slack, drooling jaw and look around, soon coming face to face with the nude jumper next to you. She has a furry arm around your shoulder, having kept you safe from the other rapacious members of her gang. <i>“Hey,”</i> she whispers, licking the sweat off your cheek. <i>“Loved it. Thanks for the fuck, babe.”</i> She nuzzles you with a cute laugh. <i>“I won’t be thinking about sex for half a day. At least.”</i>");
	output("\n\nYou look down to see your cum-bloated belly, evidence of your orgasmic tryst, and her cock still messy with every fluid under the lamp.");
	// PC Kind or Medium/High Libido
	if(pc.isNice() || pc.libido() >= 33) output("\n\nWith a smile, you lean down to her crotch and take her flaccid dick into your mouth. The lustful rabbit coos delightedly, already getting hard again whilst you give her a good spit shine. Just before she’s raring to go again, you lift your head up and admire her glistening [enemy.cock], receiving a smooch on the cheek for your efforts.");
	// Merge
	output("\n\nYou feel a sharp slap on the ass when you stand. <i>“Better watch yourself around here. I’m not gonna forget how that felt.”</i> She winks at you.");
	output("\n\nShrugging your shoulders, you gather your stuff and get going, feeling slower thanks to your cum-bloated belly. You could really use a shower right about now...\n\n");
	CombatManager.genericVictory();
}

//[Cowgirl]
// Tooltip: Use the lewd leporine’s steamy mouth to get yourself ready before bouncing her on your lap and then some.
// Tooltip, no penis: You’ll need a cock to fuck the tricksy rabbit with.
// PC must have a penis.
// If PC has two cocks, then it can turn into DP as they get ready to cum.
// If PC’s cock is at or under 6 inches, the PC will be given some Throbb. There’s an argument to be made about her forcing it...

public function boredJumperCowgirlWinByWilliam():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	var x:int = pc.biggestCockIndex();
	// PC Bimbo
	if(pc.isBimbo()) output("<i>“Ooh, as eager as me! Alright, babe, get me ready, you’re going for a ride!”</i> You rock your hips, displaying your prominent bulge.");
	// PC Bro
	else if(pc.isBro()) output("You say gruffly, <i>“You bet, come on over, I’ve got the perfect treat for a girl like you.”</i> With that kind of incentive, she does!");
	// PC Kind
	else if(pc.isNice()) output("<i>“There’s something you could help me with.”</i> You smirk at the fallen bunny, blood flowing to your [pc.cocksLight], drawing her attention to your prominent bulge.");
	// PC Misch
	else if(pc.isMischievous()) output("You grin at the fallen rabbit, feeling your [pc.cocksLight] rising to the occasion. <i>“Just watching you’s getting me horny. Come here, I’ve got something you can do!”</i>");
	// PC Hard
	else output("You run a hand over your groin, drawing the rabbit’s attention where it matters. <i>“Come here, I’ve got a job for you.”</i>");
	// Merge
	output("\n\nThe laquine crawls to you on all fours, her black suit squeaking with every shift of her furry legs. Beneath you, she stares at you enraptured, a wide smile on her face, hoping for a good time whatever the case.");

	// PC Not Naked
	if(!pc.isCrotchExposed()) 
	{
		output("\n\nYou pull off your [pc.crotchCover] and bare your naked, perspiring [pc.skinFurScales] to her. She ogles the outline of your [pc.cocksLight]");
		if(!pc.isCrotchExposedByArmor() && !pc.isCrotchExposedByLowerUndergarment()) output(" snuggled behind your [pc.lowerUndergarment]");
		output(", her delicate hands trembling as she keeps herself from touching until she has your say so.");
		if(!pc.isCrotchExposedByArmor() && !pc.isCrotchExposedByLowerUndergarment()) output(" You slip them off with profound quickness, bringing her nose-to-tip with your [pc.cocks].");
	}
	// PC Naked
	else
	{
		output("\n\nThe hapless pirate soaks in your flaccid [pc.cockNounSimple " + x + "] with sheer reverence, her [enemy.eyeColor] eyes darting up and down its length. She licks her lips and quietly moans - lips parted - at your form, worshiping you with oversexed brain alone. Nose-to-tip with your [pc.cocks] now, she gives you a pitiful, begging look.");
	}
	// PC has 2 or more cocks
	if(pc.cockTotal() > 1)
	{
		output("\n\n<i>“Wooah...”</i> the pirate marvels, your " + (pc.cockTotal() == 2 ? "twin":"multiple") + " cocks aching just below her nostrils. She breathes in your potent scent, lancing tongue stealing a few tastes. <i>“Wouldn’t have thought a cutie like you was packing this kind of heat... mmmh, and it tastes good!”</i>");
	}
	output("\n\nYou lewdly smile, <i>“Go ahead”</i>, putting one [pc.hand] on your waist. Receiving your invitation loud and clear, and spurred on by the drops of perspirant dripping from your shaft, the rapacious rabbit inhales your [pc.cock " + x + "]. For a moment, you wonder if her pupils changed into hearts with how happy she sounds sucking on your dick");
	if(pc.balls > 0) output(" and licking your [pc.balls]");
	output(". Your free hand rests in the curly, lush fur passing for her hair, helping guide her pace.");

	output("\n\nThe laquine’s technique is astounding, and also a little much! If not for your forceful commands, she’d have gotten you to cum <i>fast</i>. The multi-pronged assault of her vibrating tongue, cascading mouth, and mighty lungs is to be commended, but you’re not about to let her get off with just a brief, sloppy blowjob. Needing no encouragement, she’s already taken your [pc.cockNounSimple " + x + "] to the hilt, ");
	if(pc.biggestCockVolume() < 400) output("having no issue with the size");
	else output("slightly gagging on the sheer size");
	output(" of your member. Grunting, you grab both of her big ears and bury her face in your crotch.");
	if(pc.cockTotal() > 1) output(" Despite being pinned, she manages to attend your extra " + (pc.cockTotal() > 2 ? "[pc.cocksLight]":"member") + ", jerking them with her free hands.");

	output("\n\nYou’re sure you’ve heard a few people passing by down the passages, and you’re definitely sure they can hear the sounds of your dominant lovemaking. The jumper on your cock, if anything, is doing what she can to make sure the sounds of tongue and throat against dick are heard for as far as they’ll carry. For how she acted earlier, it makes you wonder why you even had to fight her. She must enjoy taking as much as giving, the slut!");
	//suula cock
	if (pc.cocks[x].cType == GLOBAL.TYPE_SIREN || pc.cocks[x].cType == GLOBAL.TYPE_ANEMONE) output("\n\nThe alien tentacles lining the head and shaft of your cock brush against the horny jumper's throat and lips. You decide to let your venomous biology have its way there, stinging her sensitive face in and out with a healthy dose of chemical lust. She mewls and groans all around your [pc.cockNounSimple " + x + "], spittle flowing like a river from her maw. Guess she appreciated the gesture!");
	output("\n\nBending your knees and leaning over the laquine’s head, you let out a hot, tickling breath on her ears. You grab onto those floppy appendages of hers, bending them a bit to keep your grip in the swamp. You’re not even sure she would feel you scratching her ears! In response to your fondling, the cock-hungry pirate gives ");
	if(pc.hasVagina()) output("your [pc.vagina] a little teasing, pinching " + (pc.totalClits() == 1 ? "your erect [pc.clitNoun]" : "[pc.oneClit]") + ".");
	else if(pc.balls > 0) output("your [pc.balls] a little attention, squeezing the weighty orb" + (pc.balls > 1 ? "s":"") + " with a unique tenderness.");
	else output("you a wake up call, whipping your cumslit with her tongue.");

	output("\n\nYou take over, grabbing those sweat-soaked ears of hers and deepthroating her. You’re more worried about slipping off them than anything else. Her paws " + (pc.balls > 0 ? "cup your [pc.balls], helping to mix the protein shake she’s hoping to get.":"caress your inner thighs, smearing copious amounts of fluid down your [pc.legOrLegs].") + " Railing her mouth like the faux-pussy it is, you decide to give her the treat she’s been working so hard for. An appetizer for the main event, you think.");
	if(pc.cockTotal() > 1) output(" You free one hand to jerk " + (pc.cockTotal() > 2 ? "one of your extra cocks":"your extra cock") + ", making sure to rub it against her forehead every time you go all in.");

	output("\n\n<i>“Cumming!”</i> you announce, your crotch clapping one last time into her jaw. Growling as you ride this powerful orgasm with open eyes, you shoot line after rope of [pc.cum] into the slutty bunny’s throat, every pulse in your shaft accompanied by the lick of a coiling tongue that makes sure no tasty drop escapes.");
	if(pc.cockTotal() > 1)
	{
		output(" Your extra dick" + (pc.cockTotal() > 2 ? "s, sadly, shoot the most of their":", sadly, shoots most of its") + " loads over and around her, though as your orgasm dies down, you color part of her face [pc.cumColor].");
	}
	output(" Pulling yourself from her mouth, you watch her drinking the last of it.");
	output("\n\n<i>“Ooohhhh... that was great! I looooved that taste!”</i> She smiles up at you, still jerking her erect [enemy.cock]. Looks like she hasn’t cum yet. Good.");

	processTime(30);
	pc.orgasm();
	enemy.loadInMouth(pc);
	clearMenu();
	addButton(0,"Next",boredJumperCowgirlWinByWilliamII);
}

public function boredJumperCowgirlWinByWilliamII():void
{
	clearOutput();
	showBoredJumper(true);
	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = pc.cockThatFits2(enemy.vaginalCapacity(0));

	author("William");
	output("<i>“How’s that for a warm-up?”</i> You quip, <i>“What do you think about taking a ride, now?”</i> The jumper bounces even in her kneeled state, nodding eagerly as you get ready.");

	// PC Not Naked
	if(!pc.isCrotchExposed() && !pc.isChestExposed() && !pc.isAssExposed())
	{
		output("\n\nYou shuck the rest of your clothing into a spread pile on the cindery ground, using it as cover to lie back on. Your gleaming [pc.cocks] twitch" + (pc.cockTotal() == 1 ? "es":"") + " with every detail you absorb of the horny bunny, still enamored with the taste of your [pc.cumFlavor] seed on her tongue. Crooking a finger, you beckon her over but not before telling her to get that jumpsuit out of the way. With lightning speed she throws it off. You can’t help but giggle at the squeaky sounds it makes even after it lands on the ground.");
	}
	// PC Naked
	else
	{
		output("\n\nThe horny bunny, lost in reverie, is still enamored with the taste of your [pc.cumFlavor] seed on her tongue. Snapping her out of it, you tell her to get out of that jumpsuit and give it to you, which she does with lightning speed. Setting the soaked piece on the cindery ground, you use her clothing as cover to lie back on.");
	}
	// Merge

	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Ready to go for a ride, girl?”</i> You swoon, idly jerking your [pc.cocks]. <i>“Let me have a taste of your pussy!”</i>");
	// PC Bro
	else if(pc.isBro()) output("\n\n<i>“Nice and ready dick, for a nice and ready humper.”</i> You smile broadly, pointing at your lap.");
	// PC Kind
	else if(pc.isNice()) output("\n\n<i>“I’m curious how you’ll look on top. Come on, let’s have some fun.”</i> You smile invitingly, telling her to get on your lap.");
	// PC Misch
	else if(pc.isMischievous()) output("\n\n<i>“I want to see everything while you bounce, let’s do this!”</i> You grin, pointing the laquine to your lap.");
	// PC Hard
	else output("\n\nYou say nothing, merely beckoning her to your lap with a snap of your fingers. The jumper obeys without delay.");
	// Merge
	output("\n\nIndeed, you can’t wait to see what this drenched dope looks like on top. A horny rabbit all to yourself, bouncing on your lap and loving every second of it. You steal a grope on her rigid nipple, pinching it as she sets herself down on your abdomen, her [enemy.cock] ");
	if(pc.biggestTitSize() < 1) output("resting between your [pc.breasts].");
	else output("sitting on top of your [pc.chest], close to being engulfed by your ample bosom.");

	output("\n\nShe purrs, <i>“Haven’t had someone down there in a while. Lucky for me a lost little cutie is about to fuck me like [pc.heShe] means it, make me think about all I’ve been missin’.”</i> The laquine grips your [pc.cocksLight] in her paw, grinding her gushing horse-pussy against the shaft");
	if(pc.cockTotal() > 1) output("s");
	output(", smiling like a dope as she rocks back and forth on ");
	if(pc.cockTotal() == 1) output("it.");
	else output("them.");

	// PC Cock <=6
	if(pc.cocks[x].cLength() <= 6) output("\n\n<i>“Aww, you look like you could use a little more down there.”</i> The lusty laquine engulfs your [pc.cock " + x + "] in her hand. <i>“Don’t fret! I’m gonna fuck ‘ya good, then I’ll give you a little something to help with that.”</i>");
	// PC Cock >=7
	else if(pc.cocks[x].cLength() < 12) output("\n\nThe horny herm rings the tip of your [pc.cock " + x + "] with her delicate digits, rubbing your shaft against her own. <i>“Nice package, sexy.”</i> She smiles. <i>“Gonna teach this nasty pirate a lesson she won’t soon forget?”</i> You nod smoothly, telling her that’s just what’s about to happen.");
	// PC Cock >=12
	else if(pc.cocks[x].cLength() < 18) output("\n\n<i>“F-fuck... It’s gonna be like I’m fucking myself!”</i> She moans, albeit happily, at the size of your imposing [pc.cockNounSimple " + x + "] <i>“Aww yeah, this is gonna be <b>good</b>.”</i> You smirk, pinching her huge nipples as she loses herself in temporary excess again.");
	// PC Cock >=18:
	else output("\n\n<i>“You a porn star in the making?”</i> The laquine quips, hand-worshiping your imposing girth while she continues, <i>“Why else would you have a big, dumb, <b>hot</b> dick like this? Wonder if I’ll see you on my vids later? What would your name be... Whatever, feels good being part of somethin’ special!”</i>");
	// Merge
	output("\n\nThe rabbit runs a hand through her hair as she leans back, moving her supple sack out of the way to reveal the plush, puffy lips of her drizzling vulva. Wearing a lewd grin, she takes your dick, shifts her hips and legs, and readies herself to be speared on your [pc.cockType " + x + "] rod. She sighs dreamily, letting a moment pass by in blissful heat as her perspirant and femcum mix into a pleasant, fragrant, salty syrup that pours down on your cock. Your heart beats ever so much faster as her furry legs gingerly lower, her intoxicating cunt inches, moments, seconds away from enveloping you.");
	output("\n\n<i>“Here I come!”</i> She cries, letting herself drop on your lap with a wet smack, your [pc.cockNounSimple " + x + "] traveling all the way up through her accommodating snatch, encountering almost no resistance ");
	if(pc.cocks[x].cLength() <= 12) output("as you hilt her.");
	else output("batter against her womb.");
	output(" The laquine’s hands dart for her cock");
	if(pc.cockTotal() > 1) output(" and your extra equipment");
	output(", masturbating furiously as shriek-like moans escape her mouth. While her hands pump, her strong legs carry her athletic body up and down like a piston, and both of you are soon washed well away down the rivers of lust.");
	pc.cockChange();
	//suula cock
	if (pc.cocks[x].cType == GLOBAL.TYPE_SIREN || pc.cocks[x].cType == GLOBAL.TYPE_ANEMONE) output("\n\nYou can't hold back your venomous payload - the tentacles protruding from your alien dick sting at the jumper's horse cunt, forcing her to struggle with a fierce chemical rush the likes of which she was hardly prepared for. <i>“Holy ffffuck!”</i> she croaks. <i>“You've got that kind of dick? I need to get one of those, the machine doesn't output something like that!”</i>");
	output("\n\nHer tongue lolling now, she uses your stomach as support for her thumping crotch, slamming into you with uncontained sexual aggression. <i>“Fuckmefuckme yessss!”</i> she moans, ");
	if(pc.cocks[x].cLength() <= 12) output("your dick giving her wonderfully tight pocket the spreading it needs.");
	else output("your dick bulging noticeably through her abdomen just above her twirling [enemy.cock].");
	output(" Her paws travel to your [pc.chest], pinching at your [pc.nipples] as sweat and saliva both drip on to your [pc.skinFurScales]. It hasn’t even been that long and you can hardly feel your crotch, numbed by weight and force of her pulverizing motions.");

	output("\n\n<i>“F-f-fuck, this is awesome!”</i> The laquine squeals, a wide, ear-to-ear smile on her blushing face, <i>“Getting fucked once in a while ain’t bad!”</i> You sit up a few inches to grip her curvy hips, your hands sinking into the soaked [enemy.furColor] fur, and match your movements to hers. When the rabbit rises, you descend, and when she’s about to smack again you thrust up to meet her");
	if(y >= 0) output(", your extra cock" + (pc.cockTotal() > 2 ? "s":"") + " rubbing against her own when possible");
	output(". The shockwave of your thunderous breeding sprays beads of fluid every which direction, what is blasted back is replaced anew, and the cycle begins again, and again, and again...");

	output("\n\nYou can’t help but admire the moaning laquine on your lap, shining in refulgent splendor, glassy and panting, still working herself and your cock like a star athlete. One hand behind her head and the other on your gut, she boasts a confident, content smile on her cute lips. Her nose twitches in reaction to every dazzling scent that tickles her nostrils. Where her skin is softer and less defined, you can see the ripples in her body when her crotch unites with yours, her tits bouncing up and down with every impact of wanton sex. The ligaments in her powerful legs flex impressively, able to carry her weight with little difficulty; her vivacious [enemy.cock] oozing thick strands of pre and cum everywhere as she holds her orgasm back... She’s just... <i>gorgeous</i>.");

	output("\n\nNoticing you’d stopped to admire her more than help with the sex, the laquine grabs your shoulders and pulls you up into a sitting position, burying your [pc.face] into her creamy breasts. <i>“Like what you see? I know, I like me too.”</i> She husks. <i>“I like what I’m feelin’ too!”</i> Leaning back, she hilts herself again, grinding her cunt against the base of your shaft");
	if(pc.balls > 0) output(" and against your [pc.balls]");
	output(" using your knees as support.");

	//PC Has 1 Cock:
	if(y < 0)
	{
		output("\n\nTime for a change of pace, you think. You hug the laquine closer, enough for her [enemy.cock] to get sandwiched between your bellies, and grunt as you stand up. The bouncy bunny yelps as she’s hoisted off the ground, your [pc.cock " + x + "] still in her plush pussy. Seeing how things have changed, she wraps her legs around your waist and her arms around your neck without delay, cooing, <i>“Ooh! Wasn’t expecting this! You’re just a real bag of tricks, aren’tcha?”</i>");
		output("\n\nYou grin and carry her over to the wall, your body heat making it easy to ignore the too-hot jagged ground, pinning her against the rocks. She licks at your face as you start thrusting with renewed strength, looking straight into her [enemy.eyeColor] eyes and growling as your arousal boils out of your pores. You clench her bubbly butt tight and hammer into her like you’re striking metal on an anvil, your lower half floating numb in a fiery ball of libidinous need. <i>“Ohhhwaa... I’m gonna cum if you keep that up, cutie! You’re gonna cum inside, right?”</i>");
		output("\n\n<i>“Were you about to tell me not to?”</i> You ask.");
		output("\n\nThe jumper licks your cheek, <i>“Not a chance!”</i>");
		output("\n\nGasping a breath so thick it could be cut, you shiver and piston in and out of her faster than ever, your senses being overwhelmed by her constricting cunt and shrill, pleasured moans. No longer able to hold back, you bellow deeply and cum <b>hard</b>. Her hands clench around you, forced to scream as jets of hot [pc.cum] assail her wanton womb. Her head jerks backward, ears dragging across the wall, as your [pc.cumVisc] [pc.cumNoun] spills from her creaming, spasming pussy.");
		output("\n\nThe rabbit creams your dick one last time and herself - one of her hand’s aims her cum-erupting dick up her torso, making sure to lather herself in the basking warmth of an incredible orgasm.");
		output("\n\nHer licentious body wrings out every drop in your straining ");
		if(pc.balls == 0) output("cock");
		else output("sack");
		output(" only for the sheer load you’ve pumped into her to spill out around the two of you. You twist around, putting your back to the wall, and crumple to the ground");
		if(pc.hasKnot(x)) output(", the weight of your collapse shoving your inflated [pc.knot " + x + "] into her, eliciting a final, sharp cry from the spent slut in your lap. These next few loads won’t be going anywhere, you muse");
		output(".");

		output("\n\n<i>“Ohhhh that felt good, best fuck I’ve had in a long time!”</i> The jumper kisses you, a huge smile on her face. ");
		if(pc.hasKnot(x)) output("<i>“Guess we get to ‘stick’ together for a bit.”</i>");
		else 
		{
			output("<i>“Wanna stay like this a bit?”</i>");
			output("\n\nYou nod and kiss her back, mellowing in the afterglow as she gently snuggles. You’re able relax quite well, thanks to her tender caresses all over.");
		}
	}
	//PC Has 2 Cocks:
	else
	{
		output("\n\nThinking it’s time for a little variety, you tell the jumper to turn around, as you’ve got something special in mind. Understanding just what you mean, she pulls you out, lifts up, and turns herself around, pointing her huge, bubbly butt at you. Her tail wags with a blur just in front of her squeezable, furry cheeks, looking all the more enticing. You slap her rump on each side before putting your [pc.cockBiggest] at her breathing tailhole, obscured by copious amounts of laquine assflesh.");
		output("\n\nYour [pc.cockHeadBiggest] mixes pre into perspirant, soon engulfed into her supple butt. She takes your second, lonelier, [pc.cock] and bounces up on your lap reverse cowgirl style for a little longer, letting you enjoy an enviable buttjob as you fuck her. Like an amazonian beauty, she rides you with her back arched and hands on the back of her head laughing and smiling, so happy just being fucked silly. Still, you’ve got other plans, you’re going to double-stuff this rabbit!");
		output("\n\nYou rise up to your knees with your hands on her ass and pull ou needing to spread her cheeks just to find her sphincter. Target locked, you align your [pc.cockBiggest] with her sphincter and thrust in without difficulty. The effect you have is instantaneous: she howls in a mixture of pain and pleasure, unable to contain her intense orgasm any longer. She creams one of your dicks with orgasmic slime and massages the other with her bucking hips all while her cock sprays cum everywhere in front of her.");
		output("\n\nReasserting, you slap her ass once more and grab her wrists, shifting into a doggystyle position. Like this, you can use her entire slutty body as leverage! A fitting punishment, you remark, for cumming first! <i>“Yesyesyes! I’m a bad bitch cumming first, so fuck me in both my holes like I deserve it!”</i> The laquine squeals. Who are you to deny her that?");
		output("\n\nWith both [pc.cocks] nestled deep in her, you don’t give her any time to breathe or relax. Still in the throes of pleasure, you fuck her hard, her contracting muscles ushering you in with every visit. From the sounds she’s making, double penetration suits her just like the latex. You can’t last long, though, not after her previous performance. Time to make the most of what little self-control you’ve got, then!");
		output("\n\nThe pleasure of pussy and ass all at once can’t be appreciated enough. You rail both her holes at once, tugging on her wrists as hard as you thrust, wholly satisfied by the jumbled breaths attempting to pass for cogent commentary you force out of her. Soon, you’re hyperventilating much the same way, only able to grunt and groan as her sensitive holes clamp down on you once again, signaling her next orgasm just as fierce as the last. With your vision blurring, it’s now or never!");
		output("\n\nBoth [pc.cocksLight] hilted in your pirate cocksleeve, your moans turn into a feral roar as impossibly thick jets of [pc.cum] shoot from your pulsating shafts into her womb and colon both. Your knees buckle under the impact of orgasm and the oppression of sweltering temperatures as you fight to keep this roiling rabbit steady until you descend from your climax. Whatever’s coming out of her mouth, you can say with certainty, aren’t words in any entity’s language.");
		if(pc.hasKnot(x) || pc.hasKnot(y)) 
		{
			output(" Too bad for her, you’ve got one last surprise for her. Your knot");
			if(pc.hasKnot(x) && pc.hasKnot(y)) output("s");
			output(", swollen and prodding at her abused hole");
			if(pc.hasKnot(x) && pc.hasKnot(y)) output("s");
			output(", need a place to go. With a slightly painful grind, ");
			if(pc.hasKnot(x) && pc.hasKnot(y)) output("they slip");
			else output("it slips");
			output(" in, dragging a hoarse scream from the oversexed pirate as her pussy and ass are both stretched beyond their limit.");
		}
		output("\n\nThe laquine’s head slumps and her breaths normalize. You pull her back into your lap and fall to your ass again with all the grace of a dead leaf. ");
		if(pc.hasKnot(x) || pc.hasKnot(y)) output("You won’t be going anywhere for awhile,");
		else output("You’re pretty beat after a round like that,");
		output(" so you decide to keep her with you for the next few minutes in a surprisingly relaxing break.");
	}
	processTime(30);
	pc.orgasm();
	output("\n\n");
	enemy.loadInCunt(pc,x);
	if(y >= 0) enemy.loadInAss(pc);
	clearMenu();
	addButton(0,"Next",boredJumperCowgirlWinByWilliamIII,y);
}

public function boredJumperCowgirlWinByWilliamIII(y:int):void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("The laquine jumper stirs in your lap, yawning and stretching out before she realizes you’re still in her. She leans back into your shoulder and kisses you on the cheek. <i>“Hey,”</i> she nuzzles, <i>“You stayed for me? Awwhh...”</i>");
	output("\n\nShe licks you again with a wide yet dopey smile. <i>“Best way to ditch work <b>ever</b>. I loved it! You’ll be coming around again, right?”</i>");
	output("\n\nMore than likely, assuming she’s around ready to get fucked again. Giggling, she lifts herself off you only to have your [pc.cumVisc] [pc.cumNoun] drip from ");
	if(y >= 0) output("both ");
	output("her hole");
	if(y >= 0) output("s");
	output(". <i>“Aww yeah... Gonna get my suit all dirty, definitely won’t forget this.”</i> She moans, already getting horny again.");

	// PC has small penis - Bunny gives Throbb
	if(pc.biggestCockLength() < 12) 
	{
		enemy.inventory.push(new Throbb());
		output("\n\nBefore you go, she hands you a small vial of presumably illegal make and origins. <i>“Next time we fuck I’d like to be surprised.”</i> She winks.");
	}
	// Merge
	output("\n\nShe collects her jumpsuit and hops off, but not before giving you a provocative wave. Time to get going!\n\n");
	processTime(15);
	
	CombatManager.genericVictory();
}

//[HeatSex]
// Tooltip: It's as hot as any layer of Hell already, but you could really cook that bun until every sense but sex in her billowing brain melts away...
// Tooltip, no B.Bliss: You'll need some 'evolutionary inducers' to get ruined with the lusty laquine. Two Breeder's Bliss ought to do...
// Tooltip, no vagina: You'll need a vagina for this.
// PC must be carrying two Breeder's Bliss pills.
// PC must have a Vagina to initiate this scene.
// If PC is a herm, then the bunny will ride them.
// PC will get filled in every hole and splattered in male and female cum.
// PC will be in 'Heat' for a few days.
// PC will become 'Sore'
public function heatSexLaquineJumper():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	
	output("Looking down at the defeated rabbit, you briefly consider the situation. A hot, horny bunny all to yourself to use as you see fit... But maybe there’s something more you can do? Something... unique. You fold your arms as she furiously masturbates herself, still looking up to you with pleading [enemy.eyeColor] eyes. The laquine’s a fully capable breeder, able to take and give at a moment’s notice, how could you make this all the better?");
	
	if(!pc.inHeat())
	{
		output("\n\nAch, it’s fucking hot down here, and yet she looks just fine and dandy even in that sexy jumpsuit of hers. Wait... it’s hot... That’s it! You look into your bag and dig out a set of colorless pills - two very special capsules rest in your palm as you regard her with a devious mind. Before you continue, the question ‘why’ comes to mind, like your body or some foreign entity is telling you to <i>really</i> consider what you’re doing. Why <i>are</i> you thinking of this? Giving a lust-addled hermaphroditic laquine an extremely potent fertility pill and taking one yourself? You must be crazy. <b>Sex crazy.</b> Purposely inflicting breeding season on yourself and someone from a race of gifted breeders, what are they gonna say about you? Wait, who’s they?");
		output("\n\nNevermind. Whatever doubts you have wash away with the next emerging layer of sweat as you tell her to get up and hold out her hand. Warmth and pheromones both pour from every part of your body as you simply imagine the mind-blowing sex to come. Just how will the both of you end up when all’s fucked and bred in this dark, miserably hot cave? This... Oh <i>this</i> oughta be fun.");
		output("\n\nThe somewhat delirious rabbit eyes your madly blushing face curiously, then the pills in your [pc.hand], wondering what you’re up to. She says nothing, only able to guess at what lewd thoughts swim behind your [pc.eyes]. You take one pill between your thumb and finger and hold it out to her. Still confused, the stewing slut takes it, but seems... worried now.");

		// PC Bimbo
		if(pc.isBimbo()) output("\n\n<i>“Don’t fret, it’s all part of the plan. You wanna get reaaaallly hot don’t you..?”</i> You all but sing with a sexy undertone, giving her a celebrity class smile. <i>“Let’s both have a kind of fun nobody else ever will!”</i>");
		// PC Kind
		else if(pc.isNice()) output("\n\nYou flash the laquine a disarming smile. <i>“A fertility pill. We’ll both get really hot... So what do you say? Think you can handle a little extra heat while you give us both what we want?”</i>");
		// PC Misch
		else if(pc.isMischievous()) output("\n\n<i>“With this, you’ll fuck me so hard there’s no way I won’t get pregnant. How does that sound?”</i> You omit the part where she’ll probably become a real horndog for the next few weeks but what’s that got to do with pounding you into the next galaxy?");
		// PC Hard
		else output("\n\n<i>“Fertility agent, we’ll both take one. Think you can handle this much?”</i> You smirk, rolling yours between your digits suggestively.");
		// Merge
		output("\n\n<i>“You wanna breed with me that badly? I can do that normally, you know.”</i> The jumper grins. <i>“But! If you put like that, how can I say no?”</i> She happily drops the pill into her mouth, swallowing at exactly the moment you do.");

		output("\n\nFor a hot minute, nothing happens. You both size each other up waiting for the effects of this pill to kick in. And kick... Oh shit, <b>kick</b> they do. The laquine clutches her stomach and paws furiously at the squeaky latex, her fingers gliding right off every time they try to set down roots. You, on the other hand, gasp painfully, feeling an <i>itchy</i> tingling warmth on the back of your neck that dives down to your [pc.crotch]. Your breath comes out so hot that it turns to visible fog in your husky huffs. An animalistic scream breaks the low volume as your laquine assailant clutches her neck and desperately tries to <i>tear</i> that zipper off. Your codex mechanically intones that you’ve gone into heat just before you discard it.");

		// PC Not Naked
		if(!pc.isNude()) output("\n\nBetween your torturous throes, you hurriedly shuck your equipment, knowing you won’t be needing it for the fuckoning to come.");
		// Merge
		output("\n\nYou shudder painfully, your balance eroding from the intensity of fertility mode. Lewd imaginings overtake any rational thought that might have been floating in your mind; Vivid dreams of taking in an ocean of cum, sucking a field of cocks, and being rewarded with a never-ending supply of creampies let you know, full well, that you are now a waiting cumdump in desperate need of a mate or five. Your womb’s evolutionary instinct, fully unlocked and uninhibited, prepares your body to sire an army from the tiniest amount of seed. The swampy moistness in your nethers is unmistakable, undeniable - you have to fuck <i>now</i>, you won’t be satisfied with anything less than a ");
		if(silly) output("thousand rounds without pulling out.");
		else output("hundred orgasms spilling your liquefied brain on to the floor.");
		output("\n\nAs for that randy pirate, she hasn’t succeeded in her goal of ripping that jumpsuit off, only managing to expose her tits and stomach. Instead, her dick, veins rippling and hard as diamonds, has thrust right through the sealed zipper line, rending it apart and making her look very silly... and very horny. She’s positively <i>frothing</i> at the fuzzy mouth, her face twisting in something between existential dread and mind-numbing bliss. If you thought her [enemy.cock] would have been wet before, the entire shaft is utterly lubricated in a ludicrous amount of pre. The sweat and strands of premature ejaculation splattering everywhere notwithstanding.");
		output("\n\nWails that are surely carrying to the higher levels of this station reverberate through the mines as the laquine falls to her knees and clasps both furry hands around her rigid rod, her entire body wracked with what look to be uncomfortable aches and shakes. <i>“Fff-fffffffffff...”</i> She tries to speak, <i>“Fuck!!! Fuckfuckfuck oh goooooooood I wasnnntttt....”</i> She hoarsely screams, <i>“I wasn’t ready for that...! Urghh... Well, cutie, you’re not gonna... leave me like this are you?”</i>");
		output("\n\nIt’s far too late to back out, and your evolutionary impulses will <b>absolutely not</b> let you walk away from a dick that raw and ready. You think you can even hear your ovaries <i>crying</i> out for cum. You don’t even realize that your posture has changed - you instinctively raise your bare [pc.ass] into the air as you fall to your knees in front of her twitching tool");
		if(pc.hasTail()) output(", [pc.tails] wagging to a blur as you prepare to fellate her");
		output(". There was a distinctive scent about this laquine before, a spicy musk mixed with a brew of sweat and feminine quim. But now, that scent has turned into a literal haze of horniness that’s effectively brainwashed you as you can’t bear, for even a split second, to take your eyes off that magnificent [enemy.cock]. Even when this is over, you’ll be thinking about that smell for hours, maybe days... maybe weeks...");
		output("\n\nThe rutting rabbit, as well, can’t possibly shake the ultra-fertile scent of the ripe bitch in heat who fed her such a powerful pill in the first place. And you wouldn’t have it any other way.");
		//Add the "Heat" status, status duration 1 week or until pregnant in all wombs.
		//Yay, heat!
		//v1 - fertility boon
		//v2 - minimum lust boost
		//v3 - libido boost
		//v4 - tease bonus!
		pc.createStatusEffect("Heat",5,25,10,3,false,"LustUp","Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+500% Fertility\n+25 Minimum Lust\n+10 Libido\n+3 Tease Damage",false,28800,0xB793C4);
		pc.libido(1);
		pc.destroyItemByClass(BreedersBliss,2);
	}
	else
	{
		// PC in Heat
		output("\n\nA... fully capable breeder... That’s it! You dig into your bag quickly, your body only now realizing how close it is to a potentially perfect mate. Smiling deviously with a <i>very</i> special capsule in hand, you eye the rabbit’s delicious bulge as you think about inflicting breeding season on her. You’ll be filled in every hole so many times! First you’ll be ruined for marriage, then you’ll be ruined with her cum and then you’ll be weighed down by so many children you’ll need assistance to even stand up again holy shit why isn’t she fucking you right now wait what’s this pill-");
		output("\n\nShaking your head, drool flying onto hers, you order the laquine to her feet. You hand her the featureless pill without delay, struggling to resist the urge to shove her down and ride her until the wheels fall off. Although she can no doubt sense the need to fuck and breed in your thick scent alone, she seems understandably worried about accepting candy from strangers.");

		// PC Bimbo
		if(pc.isBimbo()) output("\n\n<i>“C’mooonnn”</i> You groan, <i>“It’s just a fertility pill... You know... So you can knock me up with all the kids you want!”</i>");
		// PC Kind
		else if(pc.isNice()) output("\n\nBlushing madly, you smile as innocently as you can at the laquine. <i>“It’s a fertility pill... And I’m already in heat. Think of the sex we’ll have if we’re both in breeding season.”</i>");
		// PC Misch
		else if(pc.isMischievous()) output("\n\n<i>“It’s a...”</i> You trail off, furiously masturbating already, <i>“It’s a fertility pill! Wanna go at it like a couple’a rabbits... and breed like ‘em?”</i>");
		// PC Hard
		else output("\n\nExhaling sharply, you hurriedly explain while self-servicing, <i>“Fertility agent. Take it, if you want to be able to handle me like this.”</i>");
		// Merge
		output("\n\n<i>“You wanna breed with me?”</i> She wears a face of genuine surprise that gives way to a lascivious grin. <i>“Feels like we could do it just fine right now... But, then again, you must be a real slut to be wandering around caves looking for mean pirates to fuck you full’a kids! So desperate to get knocked up you’re handing this out!”</i>");
		output("\n\nGroaning, you ask if she’ll take it or not, suggesting you won’t let her sate herself if she’s not game. That does the trick, as you see her pop the pill immediately.");
		output("\n\nFor a hot minute, nothing happens. Until you see her suffer the same kick you did. The laquine clutches her stomach and paws furiously at the squeaky latex, her fingers gliding right off every time they try to set down roots. An animalistic scream breaks the low volume as your laquine assailant clutches her neck and desperately tries to <i>tear</i> that zipper off. Panting all the while, she begins to shudder and collapse into an oversexualized wreck.");
		output("\n\nYou dive into her crotch, unable to contain yourself any longer, and help her undo that damn suit, yanking the zipper off until her [enemy.cock] busts free of its musk pocket. She’s positively <i>frothing</i> at the fuzzy mouth, her face twisting in something between existential dread and mind-numbing bliss. If you thought her [enemy.cock] would have been wet before, the entire shaft is utterly lubricated in a ludicrous amount of pre. The sweat and strands of premature ejaculation splattering everywhere notwithstanding.");
		output("\n\nWails that are surely carrying to the higher levels of this station reverberate through the mines as the laquine falls to her knees and clasps both furry hands around her rigid rod, her entire body wracked with what look to be uncomfortable aches and shakes. <i>“Fff-fffffffffff...”</i> She tries to speak, <i>“Fuck!!! Fuckfuckfuck oh goooooooood I wasnnntttt....”</i> She hoarsely screams, <i>“I wasn’t ready for that...! Urghh... Well, cutie, you’re not gonna... leave me like this are you?”</i>");
		output("\n\nIt’s far too late to back out, and your evolutionary impulses will <b>absolutely not</b> let you walk away from a dick that raw and ready. You think you can even hear your ovaries <i>crying</i> out for cum. You don’t even realize that your posture has changed - you instinctively raise your bare [pc.ass] into the air as you fall to your knees in front of her twitching tool");
		if(pc.hasTail()) output(", [pc.tails] wagging to a blur as you prepare to fellate her");
		output(". There was a distinctive scent about this laquine before, a spicy musk mixed with a brew of sweat and feminine quim. But now, that scent has turned into a literal haze of horniness that’s effectively brainwashed you as you can’t bear, for even a split second, to take your eyes off that magnificent [enemy.cock]. Even when this is over, you’ll be thinking about that smell for hours, maybe days... maybe weeks...");
		output("\n\nThe rutting rabbit, as well, can’t possibly shake the ultra-fertile scent of the ripe bitch in heat who fed her such a powerful pill in the first place. And you wouldn’t have it any other way.");
		pc.destroyItemByClass(BreedersBliss,1);
	}
	processTime(15);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",boredJumperHeatSexII);
}

public function boredJumperHeatSexII():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("Salivating like a rabid dog, you seal your [pc.lipsChaste] around her [enemy.cock], drinking up the cocktail of perspirant and pre. What would normally be a very salty taste is like an ambrosial soup to your hyper-charged libidinous state, and your sloppy sucking only eases her further into your throat. It’s not long before all 13 inches of [enemy.cock] are brushing against your tonsil, about to plunge down your gut-pipe, but you don’t care. What’s a gag reflex? You feel right at home deepthroating her prodigious pole. The pre and cum waterfalling down your throat from the laquine’s incredibly hard dick is just a reward for being a good [pc.boyGirl]; it’s a sign from your mate’s nature to your body’s instincts that it’s doing <i>exactly</i> what it needs to do.");

	output("\n\nGosh, she must be in pain from how much blood has flowed to her nethers. She’s so <i>hot</i>, so <i>tasty</i>... The raw musk in her lubricant alone squeezes copious amounts of fem slime from your [pc.vagina]");
	if(pc.hasCock()) output(", even stimulating your [pc.cocks] to add their own to the air");
	output(". Your [pc.hips] grind together, your erect [pc.clitNoun] afflicting you with an inch only your hands can tend. You brazenly finger yourself, a task made all to easy by the torrential downpour of syrup oozing from your hot and ready cunt, moaning all over the bunny’s cock you suck so diligently.");
	
	output(". Your [pc.hips] grind together, your erect [pc.clit] afflicting you with an itch only your hands can tend. You brazenly finger yourself, a task made all to easy by the torrential downpour of syrup oozing from your hot and ready cunt, moaning all over the bunny’s cock you suck so diligently.");
	
	output("\n\n<i>“D-damn...”</i> The laquine grabs your head. <i>“I feel so hard I bet my dick could replace the mining bots down here..! Just what do you think I’m gonna do to you for this?”</i> She half-taunts. In all honesty, you can’t quite tell where her tone of voice is, all that matters is that she’s going to ravish, no, <b>ruin</b> you with her gorgeous [enemy.cock], that she’s going to do her very best to impregnate you with every ounce of cum churning in her fuzzy nuts.");
	output("\n\nShe yanks you down all the way on her cock so hard that tears form at the edges of your [pc.eyes], but you aren’t in pain. No, you understand, this is where you <i>need</i> to be right now, taking care of this studly specimen, your rightful mate. She uses your mouth like an onahole, and you’re all too happy to reciprocate, squeezing your cheeks around her shaft and lashing her mast with your [pc.tongue]. You coil around her [enemy.cockHead] and suck at her cumslit directly, hoping you’ll get a fresh batch before too long.");
	output("\n\nFor once, hope was not a step on the road to disappointment, and you moan in whorish glee as her dick throbs in your mouth. Her legs thump against the ground and her balls smack into your chin. One of many climaxes to come is precluded by the hypnotic rhythms of her pounding heart, its beating rapid, working in harmony with the rest of her body. Your eyes shut as you gag on the puddles of virile cum she fires straight into your gurgling gut. If only you could taste it...");
	//1 load in maw
	output("\n\n<i>“Yesss..!”</i> The laquine hisses, <i>“That clears it up a bit but... I still feel more down there, this is far from over!”</i> You hurriedly lick off what cum is left on her cock just before she pulls out, savoring it while you have the chance.");
	output("\n\nYou mimic her satisfaction, smiling around her rod still spasming in your maw. She has to drag you off her [enemy.cock]. Once she pops free, she stands and looms over you, still holding your head in place as she drapes her cock on your [pc.face]. Firmly in the shadow of her virile tower, she humps your face with a salacious grin on her otherwise cute, lapine face. <i>“I could’a done this without the drug b-but...”</i> she moans happily when her [enemy.cockHead] massages your forehead, smearing your [pc.hair] with cum. <i>“Unnhh... Getting this turned on is a real treat after all, since all I’m thinking about now is fucking you until cum leaks out every pore on your body... How’s that sound? I fill you up with so much cum that you start sweating it?”</i>");
	output("\n\nYou babble incoherently, her bulging urethra pressing into you from the underside of her rock-hard prick. All you can think about is taking it into your womb, the risk... <i>chance</i> of procreation is all that keeps you going right now. The lusty laquine’s grin widens as she jerks upwards, planting her fuzzy balls on your face, right over your eyes. Unbidden, your [pc.tongue] darts out to massage her straining, churning nuts. It knows its place just like the rest of your body.");
	output("\n\n<i>“Fuck yeah! Just like that, keep it up you little ball-slut!”</i> She paws her cock with one hand as you tend her testes. <i>“Wandering around caves just giving drugs to nasty pirates so they’ll fuck you into another reality, what kind of slut are you? Not like any slave... A shame I won’t be able to keep you around. I’m gonna be screaming this story to anyone who’ll listen, just like you’ll be screaming when I screw your brain wrong and all you think of is my dick!”</i>");
	output("\n\nYou suckle and kiss at her heavy, sweat-slicked balls, at the laquine’s mercy. You hope that she’ll bend you over and fuck you soon");
	if(pc.hasTail()) output(", your wagging [pc.tails] must have caught her attention by now");
	output(". Every drop of fluid, sweat, cum, pre... whatever the tip of your tongue laps up is another drop of fuel for the fire burning within you. Submissive, libidinous warmth suffuses your entire being just being able to worship her manhood, to prostrate yourself beneath what will quench the thirst that threatens to drain you of life. You groan into her sack, exhaling hotly, <i>“Pleeasee...”</i>");
	output("\n\nThat word was all you could muster in your oversexed stupor. To your joy, she pulls off your face and pushes you down, falling on top of you. Belly up, your legs are locked to either side of the roiled rabbit’s curvy hips, squirming and grinding against her for any kind of stimulation or release. Her [enemy.cock] flops on your crotch");
	if(!pc.hasCock()) output(", dragging against your abdomen");
	else output("rubbing against your [pc.cockBiggest]");
	output(". The jumper’s cute nose twitches just before she inhales sharply. Her exhalation is a husky groan that brings a smile to your lips.");
	output("\n\n<i>“That smell... Daaamn... I can’t wait to play in your garden, babe. Shame you can’t give me a call, I’d love to hear you begging for it.”</i> The horny humper snerks, a few drops of sizzling sweat plummeting on to your [pc.skinFurScales] from her head.");
	if(silly) output(" <i>“We’re gonna build a house of fire and I’m gonna walk right through your door of desire!”</i>");

	output("\n\nHer hands are all over you, roughly groping at whatever erogenous zone she can lay her aimless molestations at. You join her in this masturbatory affectation, but she doesn’t linger long. Soon, you’re flipped over on all fours, [pc.ass] pointed upwards and head down on the ground. Appropriately, your posture after the fact wasn’t her doing, but your eager body’s attempt to bring - and keep - her cum where it needs to go. You push back against her shaft, grinding your [pc.vagina] against her [enemy.cock] in the hopes you’ll insert it yourself.");
	output("\n\nA sharp slap echoes out through the cave, her hand swatting your [pc.butt] a few more times for good measure, to remind you of who’s dick is pointed at who’s leaking twat. <i>“All right slut, let’s see how you fare. I’m really curious myself how you’re gonna look ruined with my cum.”</i>");
	output("\n\nYou feel the laquine pirate rubbing her [enemy.cockHead] against your [pc.vagina], soaking it in your [pc.girlCumVisc] [pc.girlCumNoun]. She detours, perhaps intentionally, from your pussy and fucks your [pc.thighs] with an animalistic groan. You can’t take it anymore, you start screaming for her to fuck you already, <i>“I’m your sluuut! I’m a dumb girl that wanted to get bred by a mean pirate! Fuck meeeee!”</i>");
	output("\n\nAnticipation soars as you feel two latex-covered hands take hold of you, her [enemy.cockHead] perfectly aligned with your waiting pussy, you’re readier than ever!");
	if(silly) output(" You won’t tire if she’ll take you higher!");
	processTime(20);
	pc.lust(100);
	pc.loadInMouth(enemy);
	clearMenu();
	addButton(0,"Next",boredJumperHeatSexIII);
}

public function boredJumperHeatSexIII():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You needn’t wait long. The jumper spears you in one mighty thrust, battering your smoldering womb after a dash through the scorching tunnel of your [pc.pussy]. Your tongue falls from your slack mouth as your eyes nearly roll back into your head, your body unable to comprehend the penetration it just experienced, its only response to constrict around the invader and slather it with more [pc.girlCumVisc] [pc.girlCumNoun] to make its future visits easier. You pant in half-gasps, fists clenched, gritting your teeth just to not lose consciousness.");
	pc.cuntChange(0,enemy.cockVolume(0));
	output("\n\n<i>“That’s right!”</i> The laquine coos, swatting your tush again. <i>“I don’t even need to move, your body’ll do it all for me if I want!”</i> She’s not wrong, your wanton body is doing everything it can to satisfy its subjugator.");
	output("\n\nJust when you thought the worst of it was over, she starts moving in earnest. You can feel her ligaments stressing as they settle into her rapid pace, helping her hump your pussy with the strength and skill of a rapacious rabbit. You cry out deliriously, happy to have your cunny filled with bunny, happier that it’s a capable breeder like this pirate who tends your [pc.oneClit] while she rails you. Could she actually impregnate you? What kind of kids would you have? Ahh... It doesn’t matter. As long as you aren’t expected to leave without a belly full of cum, you don’t care at all what happens.");
	output("\n\nYour moans join her own melody, your [pc.pussy] being filled to the brim with laquine love. You’ve already cum three times, and the fourth is approaching. Despite how turned on you’ve gotten, despite how inescapable the haze of pheromone-laced heat is, you manage to stay awake. Her hips smack into yours with the booming strength of an erupting volcano, each backblast splattering sweat and strands of natural lube in every direction. All the while, your muff massages and tightens around the laquine’s cock, desperate to make it cum.");
	output("\n\n<i>“Urk... I’m gonna cum!”</i> The jumper howls. While the words tumble out of her mouth, you already feel cum striking your cervix: Ropes as thick as what went down your throat. Your nails scrape against the rocks below as you cry out once again. Despite cumming twice, and despite <i>still</i> cumming, her relentless pace doesn’t falter. Her fuzzy balls have plenty to give thanks to the pill you convinced her to take. Soon enough, you feel a veritable waterfall of cum spill out of your pussy all around her hilted [enemy.cock], painting your [pc.legOrLegs] white.");
	if(pc.hasCock()) output(" Not to be left out, your lonely [pc.cocksLight] sputter all over your [pc.knees] and [pc.chest], your [pc.cum] forming a debauched puddle for you to simmer in.");

	output("\n\nYour legs go limp and your whole body numbs in the aftershock, but the laquine isn’t done. No, she’s far from finished with you. <i>“I think we should make sure I have the best chance, right? You’re not the type satisfied with one go, I bet.”</i> You gasp again as she resumes her previous pace, her dick still as hard as it ever was and ever so close to actually piercing your now cum-flooded womb. You whine and whimper just hearing the sloppy sounds coming from your crotch.");

	output("\n\nHer sopping wet hands are soon around your wrists, yanking you upwards. Now you have no sense of control as she leverages your limp body in pounding your cum-smeared canal. She barks obscenities and praises in equal measure as a method of coping, so close to losing herself to this bestial rut she agreed to. Soon, she cums again, whiting your brain out to the point the only breaths coming up from your mouth are husky moans that excite your dominant partner further.");

	output("\n\nA loud groan later, you feel the laquine jumper pull free from your gaping pussy now perfectly molded to her shape. Her cum follows as you slump on the ground, tongue lolling, breathing heavily. Geez, it’s still so hot... You haven’t calmed down at all with just having your pussy filled. Fortunately, neither has the pirate, rubbing out another load on your butt as she wonders how next to take you. Judging by her fatuous laughter and loud movements, she must have decided.");

	output("\n\nYou’re flipped onto your back, face to face with the lapine herm. She tears yanks her suit apart before picking you up off the ground. You soon find yourself pinned against the nearest wall. She spreads your legs by the thigh, leaning you forward a bit until her [enemy.cockHead] slips past your [pc.clit] Is she...? Oh no...");
	processTime(30);
	pc.orgasm();
	pc.loadInCunt(enemy,0);
	clearMenu();
	addButton(0,"Next",boredJumperHeatSexIV);
}

public function boredJumperHeatSexIV():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("<i>“Oh, yes!”</i> The laquine shouts, her [enemy.cockHead] rubbing against your [pc.asshole], probing your tailhole for entry. Spreading your legs apart, she skewers your bum on her cock, her rigid tool sliding in with ease. Both hands against the rock wall and both legs wrapped around your laquine lover, you cry hoarsely at her intrusion, sinking further down her shaft until half of it disappears inside you. You shiver as she pauses, running a hand down under her balls and into her cunt. You hear the lewd sounds suggesting she’s fingering herself, watching intently as her now sex-soaked hand travels to your groin.");
	pc.buttChange(enemy.cockVolume(0));
	output("\n\nHer thumb trails up a line of cum trailing down your inner thigh, collecting it and your [pc.girlCum] too. ");
	if(pc.hasCock()) output("Before climbing, she collects a thick line of [pc.cum] from your [pc.cockHeadBiggest]. ");
	output("Her thumb’s final destination: your mouth. She cups your cheek and shoves her stained digit into your maw. <i>“A treat just for you.”</i> She smiles adoringly, watching you suckle at her thumb stained with your collective juices. While you do so, the breeding bunny fucks your ass at a relatively slower pace so as to not grind you harmfully against the crags. You focus your mind on this fingerjob as she plumbs your depths.");
	output("\n\nAll you can taste is cum and more cum, and all you can feel is a foot-long prong filling your butt in long, rub-like motions. With a surge of strength, you reach out and grip the laquine’s shoulders, moaning all the while in your sex-stupefied state. Even for her attitude, the pirate is as lost in excruciating, sweaty pleasure as you are. She humps at you like it’s the last thing she can do with her life, making every clashing of bone and dick count.");
	output("\n\nShe bounces you in her lap for a few moments longer, but this time she can’t announce her orgasm. You feel a thick heartbeat pulse in her [enemy.cock] just before she paints your sensitive tush the same color as the rest of you. You gasp and croak, holding tightly with all the strength in your fuck-hungry body. Growling ferally, the laquine pulls free from your [pc.asshole] with a wet pop, her seed spilling out and sizzling on the rocks below. She’s still oh-so-hard, and you’re still burning up from the inside...");
	processTime(20);
	pc.orgasm();
	pc.loadInAss(enemy);
	clearMenu();
	addButton(0,"Next",boredJumperHeatSexV);
}

public function boredJumperHeatSexV():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You have no earthly idea how much time has passed since those pills were taken. Breeder’s ‘Bliss’ indeed, as you aren’t sure you’ll even remember what’s happened to you today. The nude, horny rabbit’s fucked you no less than seven times, leaving your pussy a ruined, sloppy mess. You can’t figure out how many times she pounded your ass doggystyle nor can you guess at how many loads of cum you’ve drunk.");
	output("\n\nYour belly is bulging out, however, as ample proof of your sexcapades, and while you feel like the heat is subsiding for a much welcome mellowing out period, the slut-bunny still has one last need for you to fulfill.");
	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	//PC has no penis:
	if(x < 0)
	{
		output("\n\nOpening your [pc.eyes] slowly, you see her crotch just above your face, her puffy vulvae drizzling an intoxicating slime into your opened mouth. The taste reinvigorates you just in time for her to set down on you, her balls obscuring your vision.");
		output("\n\nKnowing what is required of you, your tongue darts into her horse-pussy, desperate for nourishment after how dry you’ve gotten. In her cuntlips it finds purchase, soon she’s drenching your [pc.face] and your [pc.chest] with her potent quim. She grinds her crotch on your head like it’s the end of a desk, the breath for moaning long since vanishing from her.");
		output("\n\nIt doesn’t take long for her to cum, drenching you with femcum. Let her, you’re already splattered with so much seed that you’ll probably need two showers to deal with it all. At the end of her rope, the laquine pirate finally succumbs to her exertions and crumples to the ground, tumbling over and heaving loudly next to you. In due time, you both pass out in the mine, your overcharged minds and bodies finally tranquilized by the impact of primordial breeding.");
	}
	//PC has penis:
	else
	{
		output("\n\nOpening your [pc.eyes] with some serious effort, you see the furry futa lowering herself over your tenting [pc.cock " + x + "], twitching out of unfulfilled need just beneath her fat cuntlips. The feeling of her ambrosial honey drizzling from her horse-pussy invigorates you just in time as she brings the [pc.cockHead " + x + "] to her puffy vulva, ready to impale herself on you and return the favor.");
		output("\n\nUnlike her, you still have air left in your lungs for displaying pleasure, albeit exhausted pleasure. Your hips soon unite, and she bounces up and down wordlessly with a slack smile on her face. Even after your previous sexcapades, you admit it’s rather nice to see her attending to your unmet need. There’s no way she’s going to be standing after getting filled with [pc.cum].");
		output("\n\nOne would think in your listless state you were incapable of enjoying this, but you manage to sit up and touch her. Although you don’t have much strength in your hands, you caress her thighs as her sweat-drenched legs carry her weight up and down your [pc.cock " + x + "]. In much the same way you felt her inside of you, you can feel your [pc.cockHead " + x + "] brushing against the rabbit’s womb and drowning in a downpour of laquine femlube.");
		output("\n\nShe idly jerks her sore, spent [enemy.cock] whilst riding you, soon bringing herself to one final climax");
		if(pc.cockTotal() > 1 && pc.biggestCockIndex() != 0) output(" by rubbing it against your [pc.cock " + x + "]");
		output(". Her orgasm contains more water than protein, but you on the other hand have plenty left. She moans in a gruff voice, her nails digging into your [pc.skinFurScales], as you cum inside her");
		if(pc.cockTotal() > 1) output(" and deposit yet another load of [pc.cum] on each other");
		output(". The jumper rocks her hips back and forth, bending your rod like it’s a mere dildo.");

		output("\n\nSeconds later, she rises up off your cum-covered cock and flops over to the side, tumbling down with the finesse of a frying pan. Thoroughly cooked by the heat she was subjected to, her heaving breaths soon normalize as she drifts off to sleep. You, too, are also tranquilized by the impact of primordial breeding.");
	}
	processTime(4*60);
	pc.loadInAss(enemy);
	pc.loadInAss(enemy);
	pc.loadInCunt(enemy,0);
	pc.loadInMouth(enemy);
	pc.loadInMouth(enemy);
	for(var y:int = 0; y < 8; y++)
	{
		pc.loadInCunt(enemy,rand(pc.totalVaginas()));
		pc.orgasm();
	}
	for(y = 0; y < pc.totalVaginas(); y++) 
	{
		var display:Boolean = false;
		if(display == false) display = pc.cuntChange(y,enemy.cockVolume(0));
		else pc.cuntChange(y,enemy.cockVolume(0),false);
	}
	pc.applyCumSoaked();
	pc.applyPussyDrenched();
	clearMenu();
	addButton(0,"Next",boredJumperHeatSexVI);
}

public function boredJumperHeatSexVI():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You awaken... eventually... smelling of every possible sexual effluence known to the galaxy. Before you even open your eyes, you can smell the morass of dried cum surrounding you, this area permanently tainted by a tryst dedicated to procreation. It’s still hot as hell in these mines, but as your strength returns, you feel... powerful. It’s hard to describe just how <i>right</i> everything feels at this moment.");
	output("\n\nYou cough, sitting up slowly and looking around. The jumper who laid you is still splayed on her back, covered in as much cum as you are. One would think that whatever happened here was the result of several participants, not two people...");
	output("\n\n<i>“Oh fuck!”</i> The laquine shoots upward, cursing. <i>“Ughhh...”</i> She clutches her head and shakes wildly before settling her [enemy.eyeColor] eyes on you. <i>“Mmmh... Look at us, all dirty from the best sex for light years.”</i>");
	output("\n\nYou smirk, slowly standing with regards to your overstuffed belly. She’s already grabbed her suit and is ready to go well before you. <i>“That was fuckin’ fun, cutie. Let me know if I’m a dad, would ‘ya?”</i>");
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) output("\n\nOr to let <i>you</i> know she’s a mother, you suggest.");
	output("\n\nShe waves at you as she hurries off around a dimly lit corner, still trailing cum all the way. Now, to get the hell out of here and take a shower or three... Maybe get a massage too, you’re feeling awfully sore...");
	processTime(55);
	pc.applyCumSoaked();
	pc.orgasm();
	pc.energy(100);
	soreChange(1);
	output("\n\n");
	CombatManager.genericVictory();
}