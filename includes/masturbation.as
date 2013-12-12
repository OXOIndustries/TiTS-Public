function masturbateMenu():void {
	this.userInterface.clearMenu();
	var texts:Array = new Array();
	var funcs:Array = new Array();
	var args:Array = new Array();
	texts[texts.length] = "Random";
	funcs[funcs.length] = randomFapSelect;
	args[args.length] = undefined;
	if(flags["LAST_FAP"] != undefined) {
		texts[texts.length] = "Repeat";
		funcs[funcs.length] = flags["LAST_FAP"];
		args[args.length] = undefined;
	}
	if(currentLocation == "SHIP INTERIOR" && celiseIsCrew() && pc.hasTailCock()) {
		texts[texts.length] = "Porn&Celise";
		funcs[funcs.length] = tailCockCeliseFaps;
		args[args.length] = undefined;
	}
	if(pc.hasVagina()) {
		texts[texts.length] = "Vaginal";
		funcs[funcs.length] = vaginalFap;
		args[args.length] = undefined;
	}
	if(pc.hasCock()) {
		texts[texts.length] = "Penis";
		funcs[funcs.length] = singleDickFap;
		args[args.length] = undefined;
	}
	if(pc.cockTotal() >= 2) {
		texts[texts.length] = "Penises";
		funcs[funcs.length] = multiCockFap;
		args[args.length] = undefined;
	}
	//*Tailingus
	if(pc.hasCuntTail()) {
		if(pc.hasCock() && !pc.isTaur()) {
			if(pc.cockThatFits(pc.tailCuntCapacity()) >= 0) {
				texts[texts.length] = "TailFuck";
				funcs[funcs.length] = cuntTailFapScene;
				args[args.length] = undefined;
			}
		}
		texts[texts.length] = "Tailingus";
		funcs[funcs.length] = tailingusFapReqsCuntTail;
		args[args.length] = undefined;
	}
	for(var x:int = 0; x < texts.length; x++) {
		if(x <= 13) {
			this.userInterface.addButton(x,texts[x],funcs[x],args[x]);
		}
		else 
			this.userInterface.addButton((x+1),texts[x],funcs[x],args[x]);
	}
	this.userInterface.addButton(14,"Back",mainGameMenu);
}

//THERE HAS GOT TO BE A BETTER WAY TO DO THIS BESIDES COPY/PASTING SO MUCH CODE
//BUT I'M DAMNED IF I KNOW HOW. THIS WILL WORK. DA
// -Heavy
function randomFapSelect():void {
	userInterface.clearMenu();
	var texts:Array = new Array();
	var funcs:Array = new Array();
	var args:Array = new Array();
	if(currentLocation == "SHIP INTERIOR" && celiseIsCrew() && pc.hasTailCock()) {
		texts[texts.length] = "Porn&Celise";
		funcs[funcs.length] = tailCockCeliseFaps;
		args[args.length] = undefined;
	}
	if(pc.hasVagina()) {
		texts[texts.length] = "Vaginal";
		funcs[funcs.length] = vaginalFap;
		args[args.length] = undefined;
	}
	if(pc.hasCock()) {
		texts[texts.length] = "Penis";
		funcs[funcs.length] = singleDickFap;
		args[args.length] = undefined;
	}
	if(pc.cockTotal() >= 2) {
		texts[texts.length] = "Penises";
		funcs[funcs.length] = multiCockFap;
		args[args.length] = undefined;
	}
	//*Tailingus
	if(pc.hasCuntTail()) {
		if(pc.hasCock() && !pc.isTaur()) {
			if(pc.cockThatFits(pc.tailCuntCapacity()) >= 0) {
				texts[texts.length] = "TailFuck";
				funcs[funcs.length] = cuntTailFapScene;
				args[args.length] = undefined;
			}
		}
		texts[texts.length] = "Tailingus";
		funcs[funcs.length] = tailingusFapReqsCuntTail;
		args[args.length] = undefined;
	}
	var x:int = rand(funcs.length);
	if(args[x] == undefined) funcs[x]();
	else funcs[x](args[x]);
}

//Tailcock Fapping w/ Celise
//By Savin
//{Accessed from Masturbate menu whilst shipboard}
function tailCockCeliseFaps():void {
	clearOutput();
	flags["LAST_FAP"] = tailCockCeliseFaps;
	author("Savin");
	output("God damn you're horny.");
	output("\n\nYou breathe a lusty sigh as the heat of arousal courses through your body, demanding release. You ");
	if(pc.armor.shortName != "") output("strip out of your [pc.armor] and ");
	output("toss your gear aside before flopping down on your bed, ");
	if(pc.isTaur()) output("your [pc.legs] curled up under your belly");
	else output("your [pc.legs] kicked up behind you");
	output(" as you grab your codex tablet and hook it into its stand at your bedside. Opening up the extranet, you flick through a quick search for free porn. Your hand idly reaches around as you scroll, grabbing your [pc.tailCock] and gently stroking it to hardness as you search, browsing past a dozen quick vids of buxom women and chisel-chested men of a dozen races, all oiled up with bodies entangled in myriad erotic poses. Hot. Your stroking slowly picks up in pace");
	if(pc.biggestTitSize() > 1) output(", your hand occasionally trailing from the tablet to grope and squeeze your [pc.chest], pinching the hardening teats atop them");
	output(".");
	output("\n\nIt takes a good long while to finally find a good vid: one you think you can actually stomach all the way through. One of the actors is a little butter-faced, but hey, the curves on the other one... damn. Oh, that's nice....  You stroke harder and faster as the foreplay starts in earnest, a meaty cock finding a nice sheath in an alien girl's mouth, making her throat bulge with the gene-spliced boy's massive girth. Your tail-wang writhes in your hand, straining against your grasp as you jerk it, the first pearly beads forming at your tip.");
	output("\n\nThe way it pools and dribbles in your hand makes you think of a certain galotian who's probably about ready for a snack. Getting a nice and dirty thought forming in your mind, you key the ship's intercom and call the goo-girl up to your quarters for a meal at the captain's mess. She's quick on her... uh... gooey amorphus mass... and before the first blowjob scene's over, you hear a faint knock on your door. About as heavy as a goo-girl can manage, given her make-up. You call, <i>\"Enter,\"</i>  shooting the green girl a grin, making sure she can see exactly what's on screen and just how hard your [pc.tailCock] is.");
	output("\n\nShe may not be a genius, but Celise's cock-hungry nature takes the fore as she slithers over, her blobbly mass of green gen rolling over itself as she approaches, a great big smile on her face. <i>\"Oooh, I don't get to come up here much,\"</i>  she says, looking around your cabin with mock interest, her eyes never leaving the cock in your hand. <i>\"But if I knew there were going to be treats like that, I'd be up here like, every day.\"</i>");
	output("\n\nYou feel a surge of affection at her eagerness, and quickly lay back down on your belly, tail wagging enticingly at the galotian in the closest facsimile to a <i>\"come hither\"</i> waggle as you can manage with a rock-hard pre-dripping tail-cock. Celise hops into your bed, snuggling up next to you, her flank sticking wetly to your [pc.skin]. <i>\"Oooh, whatcha watching?\"</i>");
	output("\n\nYou hover a finger over the name of the vid, but the sudden insertion of a huge cock into a huge-titted bimbo's asshole opposite the two in her mouth gets the point across pretty quickly. Celise licks her lips as she watches the holo-vid progress, but you've got more in mind than just snuggling with a porno. You reach your tail around and nuzzle it against her cheek, letting it practically submerge in the hot, viscous gel of her body. With a squeal of delight, Celise rolls onto her back, taking your tail-cock in her mouth as her eyes keep trained on the vid. You let out a contented little sigh as your [pc.tailCock] finds a nice, warm, wet sheathe to hold it, but that turns into a low moan of pleasure as Celise's mouth starts to work its wonders, gyrating and washing over and around your cock rather than simply fellating it, getting the most out of her alien biology as her semi-liquid body churns around your member.");
	output("\n\nMmmm, that's niiiiice. Your breath comes heavier as Celise suckles from your cock, little droplets of pre starting to float listlessly in her transparent head. You see a hand vanish down into her crotch, pleasuring her one constant feature -- her big, loose, gooey cunt - as she watches the porno progress from DP to cowgirl as the busty alien rides a huge cock, giving handies to two other males and a hung hermaphrodite pleasures herself with the whore's big tits. Following along herself, Celise pops your [pc.tailCock] out of her mouth, shifting it downward to her big, bouncy teats and locking it between them, binding your dick in a prison of soft warm goo-tit. Still raptly watching the orgy onscreen, Celise starts to squeeze and move her tits, wanking you off between the two huge orbs. You moan, hips wiggling happily as your cock is coated in green slime, slipping easily through her cleavage again and again, with just enough resistance to let you feel the cum bubbling up through your prick, making you even harder as your seed comes to the feed your gooey friend.");
	output("\n\nWith your cock submerged in Celise's gooey tits, your orgasm mounts toward the inevitable, spurred on by her slick sliding tits as she moves them faster and faster. But just before your climax can come, the pornstar's position changes, the girl rolling onto all fours to be pounded in every hole by her lovers. A moment later, she slides up onto your back, flopping down atop you with breasts pressing into your back, hands stroking your shoulders soothingly as her big, bubbly buttcheeks lock around your [pc.tailCock], squeezing it ever so smoothly. Celise flexes her cheeks, massaging your prick as she works your shoulders, cheek nuzzling against your own as you watch the money shot, cum splattering everywhere on the bimbo's body, three cocks all coating her in a multi-colored spunk parade.");
	output("\n\n<i>\"You wanna cum, too?\"</i>  Celise asks, her breasts pressing down into your back, practically folding around you. Her ass never stops jacking you off, harder and faster until she's leaving you with little choice but to join in on the on-screen debauchery. With a grunt and a lusty moan, you feel the spunk travelling up your tail finally reach the pinnacle of pleasure, and a moment later Celise yelps with sudden glee as the first of many great [pc.cumColor] globs burst out from between her ass cheeks, raining down onto her back. She rolls over, mouth open wide as your spunk falls all over her, absorbed into her gooey body as she feeds on your sexual release.");
	output("\n\nYou ride the orgasm out, humping your hips against her quivering body as Celise sucks up every drop you have to give her; soon she's got your cock plugged into her twat, wringing out anything that didn't burst onto her back moments before. When the [pc.cumColor] explosion comes to an end, Celist seems awfully pleased, rolling back onto her bellt, practically wrapping your head in her giant tits as she plants a kiss on your head. <i>\"That was a nice snack, cap'n. We should do this again sometime, like, soon.\"</i>");
	output("\n\nYou nod, yawning powerfully as your tailcock slithers out of her, wrapping back around one of your [pc.legs]. To your surprise, though, the goo's already curled up on you, snoring softly. You sigh and reach back, patting her jiggling ass cheek before locking your arms under your own [pc.face] for a quick nap in the afterglow.");
	processTime(45 + rand(5));
	pc.orgasm();
	celise.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Vaginal Fap
function vaginalFap():void {
	clearOutput();
	flags["LAST_FAP"] = vaginalFap;
	output("You ");
	clearList();
	if(pc.isNude()) output("lazily twist what little gear you wear to the side so as not to bump your arm into it while masturbating and smile to yourself about the practical advantages of being nude.");
	else {
		if(pc.armor.shortName != "") addToList("wriggle out of your [pc.armor]");
		if(pc.lowerUndergarment.shortName != "") addToList("push your [pc.lowerUndergarment] down");
		if(pc.upperUndergarment.shortName != "") addToList("pull your [pc.upperUndergarment] off over your head");
		output(formatList());
		output(".");
	}
	output(" Exposed to the air, your [pc.vaginas] ");
	if(pc.vaginaTotal() == 1) output("simmers");
	else output("simmer");
	output(" with latent, low-level arousal that is soon to bloom in an inferno of ardor and desire. The feminine scent of girlish arousal reaches your nose a moment before your fingers reach ");
	if(pc.vaginaTotal() == 1) output("your");
	else output("a");
	output(" cleft, and you let out a happy, contented sigh as you start to deal with your baser needs.");
	
	output("\n\nThe ");
	if(pc.vaginas[0].wetness <= 1) output("slightly damp entrance your fingers slide against");
	else if(pc.vaginas[0].wetness <= 2) output("sticky, simmering delta your fingers slip against");
	else if(pc.vaginas[0].wetness <= 3) output("unmistakably wet and ready slit your fingers almost slip into");
	else if(pc.vaginas[0].wetness <= 4) output("oozing, overly-lubricated entrance that nearly sucks your fingers in");
	else output("the soaking-wet, crotch-drenching entrance that would be oh so easy to enter");
	output(" quivers deliciously at your touch, the folds engorging as they fill with unspent desire, their flesh sensitive and achy.");
	if(pc.totalClits() > 0) {
		output(" You slide your palm across the slowly-stiffening surface of your clitroral hood");
		if(pc.totalClits() > 1) output("s before they swell");
		else output(" before it swells");
		output(" enough to become exposed.");
	}
	output(" Your body gives a gentle shudder at that");
	if(pc.hasTail()) output(", your [pc.tail] flicking wildly behind you");
	output(".");
	if(rooms[currentLocation].hasFlag(GLOBAL.BED)) output("  You're thankful to have a bed, and you lean back against the headboard, letting your [pc.legs] splay wide as twitch in a visible display of your enjoyment.");
	else if(currentLocation == "SHIP INTERIOR") output(" You're thankful to be in the comfort of your ship and splay your [pc.legs] out as much as the ship will allow, flexing your muscles in rapacious enjoyment.");
	else output(" You slump down against the nearest upright surface since your [pc.legs] seem to be too busy quivering to properly support you.");
	
	//Second coochie touches!
	if(pc.vaginaTotal() > 1) {
		output("\n\nIf one is this good.... You thrust your other hand down to your crotch as fast as you can, brushing past your other wrist as you find your way to your [pc.vaginaDescript 1] and stroking it with eager, feverish need. Paroxysms of pleasure rock your body, alternately locking and convulsing your muscles but not quite bringing you off yet; this is still mere foreplay. You curl your hand into a fists and drag your knuckles up and down that slit, spreading its lips slightly around your digit, rubbing yourself with both hands and letting out quiet little moans of enjoyment. This taste of ecstasy is almost too much and yet not nearly enough, and you plunge two sets of fingers into your eager openings.");
	}
	//Nipple fucky
	if(pc.hasFuckableNipples()) {
		output("\n\nYour other hand finds its way up to your [pc.chest], and more importantly, to one of your ");
		if(pc.nipplesPerBreast > 1) output("clusters of ");
		output("[pc.nipples]. The ");
		if(!pc.hasLipples()) output("tender slit");
		else output("tender lips");
		output(" easily part around your intruding digit, letting you into another ecstatically clenching tunnel. Trembling contractions run up and down the interior of your sensitive, penetrable nipple as you plumb its moist depths. You slip a second finger in after the first, squelching noisily, shaking your [pc.chest] with the force of it, and you cannot resist mimicking the action down at [pc.oneVagina], thrusting inside, pumping your pussy with lewd, wet squelches of female bliss.");
	}
	//Regular Nips
	else {
		output("\n\nYour other hand finds its way to your [pc.chest], and more importantly, to one of your ");
		if(pc.nipplesPerBreast > 1) output("clusters of ");
		output("[pc.nipples]. You pinch and tweak at your sensitive bud, really working it back and forth as you toy with your nethers, tugging it from time to time to shoot darts of pleasurable agony through your licentiously contorting form. With one back-arching plunge, you work a pair of fingers into your needy slit, thrusting again and again, so hard that the wet squelches of female bliss are distinctly audible.");
	}
	output("\n\nYou moan, loud and low but inexorably rising higher with each touch and caress, each thrusting slip through your neady crevice. Arching your [pc.hips], you hump against your hand, grinding back into your quickly moving fingers");
	if(pc.totalClits() > 0) output(", some plunging inside while others tend to [pc.oneClit]");
	output(", your body practically on autopilot at this point - a quivering, pre-orgasm wreck. It's no surprise to you; this is what you wanted after all. A high pitched, keening whine escapes your [pc.lips] as you climb towards the peak of pleasure, and you're fingers are rapidly become soaked with your [pc.girlCum].");
	
	output("\n\nThen, it comes all at once, an explosion of ecstasy strong enough to make your eyes roll back and your body go on autopilot: fingers thrusting, [pc.hips] lurching, [pc.legs] quivering. Your wail turns into a lurid moan every bit as sloppy and as your spasming [pc.vaginas]");
	if(pc.isSquirter()) output(", just before you squirt out ribbons of [pc.girlCum]");
	output(".");
	if(pc.hasFuckableNipples()) output(" Your [pc.nipples] react similarly, and you wind up pulling your soaked fingers free in the throes of your passion.");
	output(" Drool from your lolling tongue drips to your [pc.chest], warm on your heaving [pc.skinFurScales] as you shudder one last, climactic time, letting the supernova-hot explosion of bliss roll up from your crotch to your brain. It bursts across your consciousness like a plasma-bolt comprised of pleasure, rolling back your eyes and turning your thoughts to nothing more than animal pleasure.");
	
	if(pc.hasCock()) {
		output("\n\nYour male anatomy goes off as well, triggered by the squelching blissplosions in your [pc.vaginas]. [pc.Cum] launches out of [pc.eachCock] in thick ropes onto your [pc.belly] and [chest].");
		if(pc.cumQ() < 25) output(" By the time you finish, you've got a nice little puddle there.");
		else if(pc.cumQ() <= 100) output(" By the time you finish, you've soaked yourself and have thick ribbons of [pc.cumColor] goo rolling down either side of your [pc.hips].");
		else if(pc.cumQ() <= 300) {
			output(" By the time you finish, you've soaked yourself in [pc.cumColor] from the waist to the neck in your lovegoo, and huge streamers of the stuff are running off you to puddle on the ");
			if(rooms[currentLocation].hasFlag(GLOBAL.BED)) output("bed");
			else if(currentLocation == "SHIP INTERIOR") output("deck");
			else output("ground");
			output(".");
		}
		else {
			output(" It never really seems to end, not until you've splattered huge [pc.cumColor] gobs across your [pc.face] a half-dozen times and thoroughly painted the whole of your body with the seed-filled fluid.");
			if(pc.cumQ() >= 10000) output(" Warm wetness rises up around you as you finish out, blissed out and semi-conscious.");
		}
	}
	output("\n\nYou come to a little later, reeking of sex, your fingers stained with girlish goo, and smile, sated... for now.");
	processTime(45 + rand(5));
	pc.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}


//Single Dick Fap
function singleDickFap():void {
	clearOutput();
	flags["LAST_FAP"] = singleDickFap;
	clearList();
	if(pc.isNude() || (pc.armor.shortName == "" && pc.lowerUndergarment.shortName == "")) output("You sigh and stretch, letting [pc.eachCock] hang free. Sometimes, it's good to be nude. You");
	else {
		if(pc.armor.shortName != "") {
			output("You go ahead and pop open the bottom half of your [pc.armor]");
			if(pc.lowerUndergarment.shortName != "") output(" and [pc.lowerUndergarment]");
			output(" to free [pc.eachCock], and you");
		}
		else output("You go ahead and pull down your [pc.lowerUnderarment] to free [pc.eachCock], and you");
	}
	output(" idly reach down to toy with [pc.oneCock], grabbing hold and feeling it fill out in your palm, stiffening in anticipatory lust - not that you needed any more. You're plenty horny, and you begin to stroke, working yourself towards greater levels of pleasure with great vigor, pumping hard and fast on your ");
	if(pc.cockTotal() > 1) output("chosen ");
	output(" phallus. The [pc.cockHead] plumps up nice and full in your grip, already swelling out to its full size");
	if(pc.hasCockFlag(GLOBAL.FLARED)) output(", the flare dangerously expanding already");
	output(", hot, lusty, and ready for action.");
	//In ship? Pull up porno!
	if(currentLocation == "SHIP INTERIOR") {
		output("\n\nWith your other hand, you manipulate the ship's computer to pull up some pornography from the extranet. At first, all you get are a bunch of pop-up holos about getting a space-order bride, pirating music, and cleaning malware off your computer systems, but eventually, you hit the jackpot");
		if(silly) output(": XMiniatureGiantSpaceHamster.com");
		output(". There's four breasted whores from Omikron Perseus VI, three-cocked trannies masturbating, and even a missionary sex in the consensual position for the sole purpose of procreation. You scroll through, picking video after video, watching increasingly debauched activities until [pc.eachCock] feels so full that it could burst.");
	}
	//Bottom of dick intro
	var selector:Array = new Array();
	if(pc.hasCockFlag(GLOBAL.KNOTTED)) selector[selector.length] = GLOBAL.KNOTTED;
	if(pc.hasCockFlag(GLOBAL.SHEATHED)) selector[selector.length] = GLOBAL.SHEATHED;
	if(pc.hasCockFlag(GLOBAL.STINGER_BASED)) selector[selector.length] = GLOBAL.STINGER_BASED;
	if(selector.length == 0) selector[selector.length] = GLOBAL.HUMAN;
	var temp:int = selector[rand(selector.length)];
	//Knotted
	if(temp == GLOBAL.KNOTTED) {
		output("\n\nYou start by gently feeling around the bottom of your ");
		if(pc.cocks[0].knotMultiplier <= 1.4) output("dutifully swelling");
		else if(pc.cocks[0].knotMultiplier <= 1.6) output("nice, thick");
		else if(pc.cocks[0].knotMultiplier <= 1.9) output("bloated");
		else if(pc.cocks[0].knotMultiplier <= 2.5) output("obscenely swollen");
		else output("ridiculously fat");
		output(" knot, feeling the swollen cocklump pulse with every beat of your heart. The many veins visible around its circumference tingle pleasantly as they drum against your palm.");
	}
	//Sheath
	else if(temp == GLOBAL.SHEATHED) output("\n\nYou start by gently feeling around the sheath, rubbing the sensitive skin that would usually conceal your organ were it not so erect, and even let your fingers dip down into the folds between, running your them around the inside, feeling your hands on your dick and yet at the same time penetrating you. By the time you pull them free, your heady, musky aroma is thick in the air. You move up to the shaft a nano-second later, eager to get into the real action.");
	//Anemone Wavy
	else if(temp == GLOBAL.STINGER_BASED) {
		output("\n\nYou start by gently feeling around the base of your shaft, letting your wriggling tendrils brush your knuckles, their stinging venom both painful and pleasant all at once. A chemical excitement spreads up your arm, darkening the [pc.skin]");
		if(pc.skinType != GLOBAL.SKIN) output(" under your [pc.skinFurScales]");
		output(", exciting your heart until you feel it's about to thud its way out of your chest. A ripple of sensual pleasure spreads out from your crotch as the venom circulates through your bloodstream to its goal.");
	}
	//Nothing special:
	else output("\n\nYou start by gently caressing yourself, twisting your fingers around your dick, caressing the sensitive underside of your dick as your lasciviousness mounts. Every contact of [pc.skinFurScales] on skin sends electric currents of pleasure shooting through your body.");
	
	//Top of dick intro
	selector = new Array();
	if(pc.hasCockFlag(GLOBAL.TAPERED)) selector[selector.length] = GLOBAL.TAPERED;
	if(pc.hasCockFlag(GLOBAL.FLARED)) selector[selector.length] = GLOBAL.FLARED;
	if(pc.hasCockFlag(GLOBAL.PREHENSILE)) selector[selector.length] = GLOBAL.PREHENSILE;
	if(pc.hasCockFlag(GLOBAL.STINGER_TIPPED)) selector[selector.length] = GLOBAL.STINGER_TIPPED;
	if(selector.length == 0) selector[selector.length] = GLOBAL.HUMAN;
	var temp:int = selector[rand(selector.length)];
	
	//Pointed
	if(temp == GLOBAL.TAPERED) {
		output("\n\nSoon, you're panting with excitement, thrusting against your hand when your fingers touch the sensitive point to bury yourself back to down to your [pc.knot] in your hand's reflexively tight grip. You stroke up again, fondle yourself, and whine as your body forces you to thrust, embedding your pointed prick deep into your hand once more, pleasuring yourself with rapid humps and vice-like squeezes.");
	}
	//Flared
	else if(temp == GLOBAL.FLARED) {
		output("\n\nSoon, you're panting with excitement, your [pc.hips] quivering as you dance your touches up past the middle of your flexing member. Your member gives a mighty shudder when you approach the flare, and that masculine ring thickens in response, engorging with fresh blood and becoming even more responsive to your touches.");
		if(pc.isTaur()) output(" You fail to suppress a muted whinney as your body gives in to its animalistic instincts.");
	}
	//Anemone Wavy
	else if(temp == GLOBAL.STINGER_TIPPED) {
		output("\n\nSoon, you're panting with excitement and stroking your hand up and down your length. It's hard and sensitive as you've come to expect, but on your upstrokes, you get to your favorite part: the squirming tendrils that ring your crown. They have all the sensitivity of your cocktip, but at the same time, they also move with their own independant skills and desires, slipping between your fingers and dosing you with even more of your own venom.");
	}
	//Prehensile
	else if(temp == GLOBAL.PREHENSILE) {
		output("\n\nSoon, you're panting with excitement and handling the [pc.cockTip], twitching excitedly as it squirms against your hand, wrapping around your wrist and tugging it to make it move faster. Your own cock is encouraging you to jack off, driving your arm with pistol-like speed, forcing you to drive your need even hire, until it becomes a palpable, almost tangible thing. You cry out and jack harder, faster, and your cock straightens out under the assault, letting you pleasure its entire length unimpeded.");
	}
	//Nothing special
	else output("\n\nSoon, you are panting with excitement, your hips giving little upward lurches when you fondle your [pc.cockHead], letting your fingers play over it while you imagine it's actually some cute alien doing the touching.");
	
	//Precum addendum: requires high ball fullness or production!
	if(pc.ballFullness >= 33 || pc.cumQ() >= 500) {
		if(pc.cumQ() <= 25) output(" A single droplet of pre beads from your cumslit, and you gather it up to smear along your length, lubricating your playful fingertips.");
		else if(pc.cumQ() <= 150) output(" A single droplet of pre beads from your cumslit, but it turns out to be the first of many when that droplet turns into a river of lubricating cockslime. You gather up the musky, sexual efflux and smear it over your shaft in a lubricating layer.");
		else if(pc.cumQ() <= 150) output(" A single droplet of pre beads from your cumsit, but it turns out to be the first of many when that droplet turns into a river of lubricating cockslime. You gather up the musky, sexual efflux and smear it over your shaft in a lubricating layer.");
		else output(" Fat droplets of pre roll out of your cumslit one after another, so fast that your crotch soon becomes sticky with the leaking sexual stuff. You gather up a handful of the stuff and smear it over your shaft, lubricating yourself for your playful fingertips.");
		//Precum finisher
		output(" The sound of your masturabtion takes on a decidedly moist quality, schlicking hard and fast as you rise towards your peak.");
		if(pc.balls > 0) {
			output(" Grabbing your [pc.balls] with one hand, you gently rub and caress your [pc.sack], massaging it to make yourself even harder, even more erect.");
			if(pc.balls == 1) output(" It churns");
			else output("They churn");
			output(" in needy anticipation, clinging tighter to your body in the moment before you explode.");
		}
		else output(" A lusty heat surges through your core, pumping and squeezing as pressure grows, and you realize that you're about to explode.");
	}
	//Cumming!
	output("\n\nAt that moment, your climax hits you, fissuring through your brain in cerebellum-cleaving tremors of pure bliss. Your [pc.cock]  bloats as your rational thought shuts down, twitching in wild, uncontrolled spasms.");
	if(pc.cumQ() <= 3) output(" Only a single droplet of [pc.cum] escapes. Perhaps you should give your [pc.balls] a break?");
	else if(pc.cumQ() <= 10) {
		output(" A few weak spurts of [pc.cum] emerge from your cumslit");
		if(pc.ballFullness <= 10) output(", way below your normal output. It might be worth taking a day or two off from all the sex");
		output(".");
	}
	else if(pc.cumQ() <= 100) {
		output(" A few thick spurts of [pc.cum] shoot out to paint your ");
		clearList();
		addToList("[pc.belly]");
		if(pc.cumQ() >= 35) addToList("[pc.chest]");
		else if(pc.cumQ() >= 65) addToList("[pc.face]");
		output(".");
	}
	else if(pc.cumQ() <= 250) output(" Thick spurt after thick spurt emerges from your cumslit, painting you from your [pc.belly] to your [pc.hair] in [pc.cumColor] relief.");
	else if(pc.cumQ() <= 500) output("Big squirts of [pc.cum] fire out one after another, each easily thicker and larger than an average human's by far. They splatter across nearly every inch of your body, so thick that runnels of your spent goo drip down the sides of your [pc.chest] and [pc.face].");
	else {
		output("Large torrents of [pc.cum] spray out of your cumslit with such vigor that you're able to watch them arc through the air before they rain down around you, each many times the size of a normal orgasm in its own right. The [pc.cumColor] rain slicks you from [pc.feet] to [pc.face], staining you the proof of your incredible virility");
		if(pc.cumQ() < 1000) {}
		else if(pc.cumQ() < 2000) output(", nevermind the growing puddle below");
		else if(pc.cumQ() <= 5000) output(", nevermind the inch-deep puddle below");
		else if(pc.cumQ() <= 10000) output(", nevermind the deep, wide puddle below");
		else if(pc.cumQ() <= 20000) output(", nevermind the small, growing lake below");
		else if(pc.cumQ() <= 30000) output(", nevermind the rapidly-deepening lake below");
		else if(pc.cumQ() <= 50000) {
			if(rooms[currentLocation].hasFlag(GLOBAL.OUTDOOR)) output(", nevermind the swimming pool-like lake below");
			else output(", nevermind the room-flooding pool you've created");
		}
		else output(", nevermind the physics-defying amount in the lake below");
		output(".");
	}
	if(pc.libido() <= 33) output("\n\nYou exhale a few long, slow pants as you come down from that glorious, orgasmic high");
	else if(pc.libido() <= 66) output("\n\nYou let out a dazed, happy smile now that you're sexually sated");
	else output("\n\nYou groan, wish you had time for a repeat performance");
	output(", straighten yourself up a little, and prepare to resume your journeys.");
	processTime(45 + rand(5));
	pc.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

function multiCockFap():void {
	clearOutput();
	flags["LAST_FAP"] = multiCockFap;
	output("There's no time like the present to deal with the insistent pulsations originating down south. You ");
	if(!pc.isNude()) {
		output("strip out of your ");
		clearList();
		if(pc.armor.shortName != "") addToList("[pc.armor]");
		if(pc.lowerUndergarment.shortName != "") addToList("[pc.lowerUndergarment]");
		if(pc.upperUndergarment.shortName != "") addToList("[pc.upperUndergarment]");
		output(formatList() + " to expose your [pc.cocks]. With the multiple endowments that you bear, there's no doubt that this is going to be a very messy, if enjoyable, experience.");
	}
	else output("find yourself a good spot to settle your nude form and remove the few pieces of kit you keep with you. There's no point in making a mess of your equipment after all.");
	if(pc.libido() <= 33) {
		output(" Your [pc.cocks] don't seem to react much to the changing environs, ");
		if(pc.lust() <= 50) output("aside from slowly stiffening thanks to a few quick pumps");
		else output("aside from getting a little harder when your hands make contact with one of them");
	}
	else if(pc.libido() <= 66) output("Your [pc.cocks] react like slowly-rousing beasts, each one getting thicker, harder, and eager for contact as though they're aware of what's to come");
	else output("Your [pc.cocks] react like well-trained animals, stiffening to firm, full mast in seconds, so eager for pleasure that they bob in place excitedly whenever your hand comes close");
	output(", and you sigh as your hands commence true self-pleasure.");
	
	//Two cocks: The ol' double-stroke
	if(pc.cockTotal() == 2) {
		output("\n\nYour groin seems perfectly made for you to masturbate; your [pc.cock 0] is in your right hand and your [pc.cock 1] is in your left. There's no worry of having a penis left out and trying to juggle it into some kind of rotation. You don't need to double-up both hands on one dick to try and increase the sensation. You can just... lie back and stroke. Up and down, you slide your hands on the slow journey, sometimes keeping them in a steady, matched rhythm, and other times alternating so that you jack up one while the other is on an oh-so-pleasurable downstroke.");
	}
	var tailPussied:Boolean = false;
	var titFucked:Boolean = false;
	var nippleFucked:Boolean = false;
	var sucked:Boolean = false;
	//Three dicks+
	if(pc.cockTotal() >= 2) {
		output("\n\nYour groin seems almost too bountiful, if such a thing is possible. There's all these wonderfully erect phalluses aching to be touched and yet you only have two hands to tend to them with.");
		if(pc.hasTailCunt() && pc.tailCount >= pc.cockTotal() - 2) {		
			output(" Without a single thought from you, your ");
			if(pc.cockTotal() > 3) output("tails snake around and cover");
			else output("tail snakes around and covers");
			output(" every single unclaimed cock with a tight, fleshy sleeve");
			if(pc.biggestCockVolume() > pc.tailCuntCapacity()) output(", even though at least one of your members is far to thick for a tail to handle more than the head");
			output(". You whimper as feelings of fucking and being fucked war with the sensation of doubled masturbation at the forefront of your mind. The only winner here is pleasure, and you subsume yourself in it, stroking like wild while trying to hold back the mother of all orgasms.");
			tailPussied = true;
		}
		else if(pc.tailCount >= pc.cockTotal() - 2 && pc.hasTailFlag(GLOBAL.PREHENSILE) && pc.tailType != GLOBAL.HUMAN) {
			output(" Lucky for you, you've got [pc.tails] that are more than capable of wrapping around an unclaimed tool and stroking up and down, letting you please every single cock at once in a symphony of pleasure ");
			if(pc.cockTotal() >= 7) output("with so many different harmonies that it almost overloads your mind");
			else output("so powerful that it's hard not to slip away into the ecstasy immediately");
			output(".");
		}
		else output(" You aren't one to give up on a challenge, and you stroke yourself in earnest, letting each cock have a few strong pumps up and down before moving to the next of your many penises. You circle around, never staying on one cock too long, always moving to the next once it's aching for a touch, so much more sensitive after tasting a moment of denial.");
	}
	
	
	//precum options!
	if(pc.ballFullness >= 33 || pc.cumQ() >= 500) {
		if(pc.cumQ() <= 25) output("After a while of this, single pearls of pre-cum bead on your tips to shine in the light, begging to be touched and smeared over your sexy, throbbing fuck-sticks.");
		else if(pc.cumQ() <= 150) output("After a while of this, single droplets of pre bead from your cumslits. They are the vanguard of a small contingent of lubricating leakages that rolls down the surfaces of your [pc.cockHeads] in a delightful way.");
		else output("After a while of this, big droplets of pre-cum emerge from your cumslit, one after another. Each is hot on the heels of its predecessor, and in moments, your multitudinous masts are wreathed in eager cock-slime. There's so much that the rest of your crotch grows sticky with the wet-hot mess.");
		output(" You gather up the distilled eagerness in the palm of each hand and firmly smear it down your lengths");
		if(pc.cockTotal() > 2) {
			output(", repeating the action ");
			if(pc.cockTotal() == 3) output("once more");
			else output("over and over");
		}
		output(" to ensure that every single shaft has a thick coating of its glorious ooze. The nerves inside [pc.eachCock] alight with pleasure at these touches, and you find yourself milking bigger and bigger deposits of liquid lust with each stroke until your masturbation fills the air with sloppy-sounding schlicks.");
		//{tailcunt sucking going down}
		if(tailPussied) {
			output("Of course, the pre-cum from your member");
			if(pc.cockTotal() >= 4 && pc.tailCount >= 2) output("s");
			output(" subsumed in tail-mounted pussy is quickly devoured by your symbiotic appendages, but ");
			if(pc.cockTotal() >= 4 && pc.tailCount >= 2) output("those dicks get");
			else output("that dick gets");
			output(" a coating of much slicker, more feminine fluids.");
		}
		//PRECUM END
	}
	//Vaginal blurb
	if(pc.hasVagina()) {
		output("\n\n[pc.EachVagina] is hot and wet ");
		if(pc.balls > 0) {
			output("enough to soak the underside of your [pc.sack], but you're far too busy to give ");
			if(pc.vaginaTotal() == 1) output("it");
			else output("them");
			output(" the fucking ");
			if(pc.vaginaTotal() > 1) output("they deserve");
			else output("it deserves");
			output(" right this minute. The sinful friction of your ball-skin against your vaginal lips will have to remain a simmering undercurrent of additional enjoyment while you focus on pleasing your pricks.");
		}
		else output("enough to look puffy and enticing, begging to be fucked, but you're far too busy with your pricks to divert into a simmering snatch right now.");
	}
	var choices:Array = new Array();
	//Randomly select from available!
	var x:int = pc.longestCock();
	if(pc.hasFuckableNipples() && pc.biggestTitSize() >= 3 && pc.cocks[0].cLength/pc.tallness >= 1/6) 
		choices[choices.length] = 1;
	if(pc.hasTailCunt() && !tailPussied) choices[choices.length] = 2;
	if(pc.canAutoFellate(x)) 
		choices[choices.length] = 3;
	if(pc.biggestTitSize() >= 5) choices[choices.length] = 4;
	if(choices.length == 0) choices[choices.length] = 0;
	var select:int = choices[rand(choices.length)];
	//Nipplefuck
	if(select == 1) {
		nippleFucked = true;
		output("\n\nThe excitement builds inside you, but you aren't yet ready to cum. You've got wonderful little [pc.nipples] perfectly made to assist in this task, and you're ");
		if(pc.cocks[0].cLength/pc.tallness >= 1/5) output("plenty ");
		output("long enough to pull it off.  Bending forward, you lower your [pc.fullChest] to line up ");
		if(pc.cockTotal() > 2) output("the pulsating phalluses lucky enough to be in your hands");
		else output("the dual phalluses");
		output(" with your chest-mounted dick-pleasers. When the paired pairs of sexual organs make contact, the resulting electric tingle nearly causes you to jerk them out of alignment. You manage to hold firm... barely and lean down, pushing one [pc.cockHead] in your left side and one [pc.cockHead 1] in the other. Once you've sunk a few inches of phallic flesh directly into your ");
		if(!pc.hasLipples()) output("squeezing cunt-nipples");
		else output("suckling, fellating lipples");
		output(", you hold your position, jacking up and down the exposed lengths while shifting your posture slightly to ensure there's a constant deluge of sensation assaulting the sensitive, paired glans.");
		if(pc.totalNipples() > 2) output(" If only you had more hands to guide the rest into your other unoccupied tit-twats.");
	}
	//Single tailpussy, assumes the earlier tailpussy thing didn't happen. Requires a cock that fits.
	else if(select == 2) {
		tailPussied = true;
		output("\n\n");
		if(pc.tailCount > 1) output("One of y");
		else output("Y");
		output("our [pc.tail] arcs around while you are handling your [pc.cocks] in a way that reminds you vaguely of a snake's sinuous slithering, only with dripping pussy-juice in place of baleful hissing. It quickly snaps down onto [pc.oneCockHead], butting its outstretched folds against it before parting them with a quick thrust downward, devouring much of the shaft. You throw back your head and moan out at the overwhelmingly blissful gratification of fucking a pussy and having an overly-sensitive pussy fucked all at the same. Meanwhile, the greedy tail-twat pushes down until it hits your fast-pumping knuckle, and there, it stops, squeezing tight and beginning to ripple in heavenly contractions that threaten to milk every drop of pre-cum from your body.");
	}
	//Hugecock lick - 1/6th body height and less than 1/2 body height or prehensile!.
	else if(select == 3) {
		sucked = true;
		output("\n\nAs you stroke, the gleaming, sensitive [pc.cockHead " + x + "] of your [pc.cock " + x + "] bounces ");
		if(pc.cocks[x].cLength/pc.tallness < 1/2.5) output("at the bottom of your view, desperate for attention.");
		else output("in front of your [pc.face], so hard and needy, practically begging for attention.");
		output(" You humor it by ");
		if(pc.cocks[x].cLength/pc.tallness >= 1/2.5) output("bending the anxious, phallic peak toward your mouth");
		else output("bending down toward the anxious, phallic peak");
		output(", planting a gentle kiss upon it. It immediately returns the kiss with a dollop of warm, wet pre-cum, sliming your [pc.lips] in a cock-gifted shine. You playfully extend your [pc.tongue] and lick around the circumference of your crown in slow circuits of wonderfully fellatic pleasure, swallowing whatever juices your member sees fit to express its joy with.");
	}
	//Titfuck - needs DD cups or higher and a dick at 1/6th height
	else if(select == 4) {
		titFucked = true;
		output("\n\nYou decide to help yourself out by squishing ");
		if(pc.totalcThickness() <= 6) output("all of your tools");
		else {
			if(pc.cockTotal() == 2) output("both");
			else output("two");
			output(" of your [pc.cocks]");
		}
		output(" into your cleavage and wrapping your arms around the whole mass, pinning the pre-leaking pricks into a valley of soft, supple [pc.skinFurScales] that you never want them to escape from. Once secure, you bounce yourself up and down along your lengths by leaning forward and back, letting your heavy breasts jiggle and shake around their charges, smothering yourself in the warm heaven of a bountiful bosom. It's so damn good that you have a hard time hanging to your senses - excepting touch, of course.");
	}
	//Can't quality for anything special, get half-assed scene.
	else {
		output("\n\nAt first, you try to keep your pace fairly steady, but the longer you go, the longer you stroke, the more anxious and jerky your hands become. Your [pc.hips] occasionally twitch as well, and your [pc.legs] are soon shaking in excitement. Moaning, you pick up the tempo, pumping [pc.eachCock] with long, furious strokes. You feel almost possessed by the building pleasure (and consummately increasing pressure), forced past the point where you could stop if you wanted to. Now, the brake handle has snapped off, and you're on a one-way train to ecstasy.");
	}
	//Stock pre-orgasm message
	if(pc.balls > 0) {
		output("\n\nYour [pc.balls] ");
		if(pc.balls > 2) output("start to lurch and churn");
		else output("starts to lurch and churn");
		output(" in your tightening [pc.sack] as a satisfying warmth spreads through your core, squeezed through internal passageways by involuntary clenching and contracting muscles.");
	}
	else output("\n\nThe muscles in your abdomen abruptly begin to tighten and contract, squeezing in ways that make your [pc.cocks] jump in your hands, and you feel a building sense of warmth that's spreading through your core.");
	output(" The further the heat spreads, the better it feels, and at the same time, the more you feel like you NEED to cum... to release all that pent-up, rising wave of passion before it overwhelms you.");
	//JIZZBOMB!
	output("\n\n");
	//Bits for tailpussies/tailpussy
	if(tailPussied) {
		var singular:Boolean = (pc.tailCount == 1 || pc.tailCount < pc.cockTotal() - 2);
		if(!singular) {
			output("Your [pc.cum] erupts into the suckling, fluid-hungry entrances your [pc.tailCunts] provide, ");
			if(pc.cumQ() <= 5) output("giving them a tiny appetizer.");
			else if(pc.cumQ() <= 10) output("giving them a tasty snack.");
			else if(pc.cumQ() <= 50) output("filling them with a tail-filling meal.");
			else if(pc.cumQ() <= 150) output("flooding them with a tail-bloating feast.");
			else output("filling them to such a degree that much of your ejaculate backwashes out the entrances as they weakly detach, too full for more.");
		}
		else {
			output("Your [pc.cum] erupts into the suckling, fluid-hungry entrance your [pc.tailCunt] provides, ");
			if(pc.cumQ() <= 5) output("giving it a tiny appetizer.");
			else if(pc.cumQ() <= 10) output("giving it a tasty snack.");
			else if(pc.cumQ() <= 50) output("filling it with a tail-filling meal.");
			else if(pc.cumQ() <= 150) output("flooding it with a tail-bloating feast.");
			else output("filling it to such a degree that much of your ejaculate backwashes out the entrance as it weakly detaches, too full for more.");
		}
		output(" ");
	}
	//Bits for titfuck
	else if(titFucked) {
		if(pc.cumQ() <= 5) output("A few weak droplets of cum leak into the space between your breasts, the only proof of your ecstasy.");
		else if(pc.cumQ() <= 30) output("Splashes of [pc.cum] splatter across the tops of your quivering jugs as you unload, [pc.cumColor]-washing your chest with your passionate fluid.");
		else if(pc.cumQ() <= 150) {
			output("Large spurts of [pc.cum] fire out of [pc.eachCock], to drench your chest with a coat of [pc.cumColor] that drips off the sides in long rivulets. Some even lands ");
			if(pc.isBald()) output("on your head");
			else output("in your [pc.hair]");
			output(" to drip down over your eyes.");
		}
		else {
			output("Torrential geysers of [pc.cum] erupt from each of your tit-enclosed [pc.cockHeads], painting you in thick cock-juice from your head to your waist.");
			if(pc.cumQ() >= 1000) output(" It drips everywhere, and yet there always seems to be more shooting out of your tit-enclosed phalluses.");
		}
	}
	//Bits for suckin dat shit
	else if(sucked) {
		output("Your orgasm bursts right out of your [pc.cockHead] and into your mouth");
		if(pc.cumQ() <= 5) output(", leaving a drop of [pc.cum] for you to savor as you ride out the culmination of your masturbation session.");
		else if(pc.cumQ() <= 15) output(", leaving you with a few nicely-sized blobs of [pc.cum] to swallow as you ride out the culmination of your masturbation session.");
		else if(pc.cumQ() <= 50) output("filling your cheeks with a hot load of liquid bliss for you to hurriedly gulp down.");
		else if(pc.cumQ() <= 200) output("flooding your cheeks with so much that you have you to hurriedly gulp to keep it from leaking out your [pc.lips].");
		else if(pc.cumQ() <= 750) output("stuffing your cheeks with so much that even with you hurriedly gulping there's still blobs of [pc.cumColor] squrting at leaking out of the corners of your mouth, making a mess of your face and your cock.");
		else output("flooding your cheeks so effectively with the first pulse that the second pushes your mouth clean off your [pc.cockHead], forcing you to get a head-drenching facial so thick that you're likely unrecognizable.");
		output(" ");
	}
	//Bits for nipplefucking
	else if(nippleFucked) {
		output("Your [pc.chest] becomes sensuously, perfectly warm as your [pc.cocks] unload into your [pc.nipples], slicking their internal passages with a ");
		if(pc.cumQ() <= 5) output("dainty");
		else if(pc.cumQ() <= 50) {}
		else if(pc.cumQ() <= 150) output("large");
		else output("tunnel-flooding");
		output(" deposit of your liquid love. ");
	}
	//Everybody gets dese
	if(!titFucked) {
		output("You slam your hands down to your ");
		if(pc.hasSheath(0) && pc.hasSheath(1)) output("sheaths");
		else if(pc.hasSheath(0) || pc.hasSheath(1)) output("base and sheath");
		else output("bases");
		output(" and squeeze tight as you orgasm. ");
		if(pc.cumQ() <= 5) output("[pc.Cum] shoots out in tiny, droplet-sized volleys. There's so little that you have to wonder if you should give your body time to recuperate or perhaps investigate something to decrease your refractory period.");
		else if(pc.cumQ() <= 25) output("[pc.Cum] launches out in average volleys, spilling droplets all over your [pc.belly] that combine into a fair-sized pool.");
		else if(pc.cumQ() <= 100) output("[pc.Cum] shoots out in thick ropes of creamy bliss, splattering across your [pc.fullChest] and [pc.belly] in such quantity that would shame a human.");
		else if(pc.cumQ() <= 500) {
			output("[pc.Cum] fires out of your [pc.cockHeads] in such huge, long ropes that you practically end up painting your [pc.belly] and [pc.chest] in a thick layer of the stuff.");
			if(pc.cumQ() >= 250) output(" Small rivers of goo roll down your sides to puddle below you as your orgasm drags on.");
		}
		else {
			output("[pc.Cum] erupts in torrents, each shot easily as big as the totally ejaculate of a normal man and then some. It not only splatters your [pc.belly], but also your [pc.chest], shoulders, and [pc.face]. Again and again, the huge pulses of goop fire, not stopping until you are suitably soaked and your [pc.balls] ");
			if(pc.balls <= 1) output("is");
			else output("are");
			output(" significantly drained.");
		}
	}
	//Wrap-up, no new PG
	output(" Your [pc.legs] quiver and involuntarily thrust until you are spent, and then, you lie there, coated coated with your goo and grinning a sated smile.");
	if(pc.libido() <= 25) output("\n\nYou wipe up as best you can and gear up after a few minutes of rest, feeling like you can take on the world.");
	else if(pc.libido() <= 50) output("\n\nYou make a half-hearted attempt to wipe up before getting your gear back on and getting ready go back to exploring.");
	else if(pc.libido() <= 75) output("\n\nYou barely bother to clear your sexual juices from your body before getting dressed and getting back to exploring the universe for sexy aliens to fuck.");
	else output("\n\nYou get your gear back on without bothering to clean up. You're just going to find something to fuck anyway.");
	processTime(45 + rand(5));
	pc.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//*Tailingus
function tailingusFapReqsCuntTail():void {
	clearOutput();
	flags["LAST_FAP"] = tailingusFapReqsCuntTail;
	output("Figuring that you may as well blow off some steam while you have time, you shuck out of your gear and arrange it in a nearby pile, careful with your possessions even though you’re planning on getting some lewd self-satisfaction in. Your [pc.tail] curls ");
	if(pc.isTaur()) output("up your back and shoulder to place itself against your [pc.chest]");
	else output("around your [pc.legs] and [pc.hips] to place itself against your [pc.belly] when you seat yourself");
	output(", nuzzling gently at your [pc.skinFurScales] as if to entice you to grab it. Pulses of pleasant, soothing warmth emanate from the appendage. The euphoria is almost addictive; perhaps you should hang onto this tail.");
	output("\n\nThe end of your [pc.tailCunt] dilates slightly and its clit engorges nicely into a visible nub. Your heart beats faster as barely-controlled sexual excitement wells up inside you, bringing a blush to your [pc.skin] as you admire the way your undulating opening leaks clear lubricants all over you. The trail of slime it leaves on your [pc.chest]");
	if(pc.biggestTitSize() >= 1) {
		output(", snaking through your bosom");
		if(pc.bRows() > 1) output("s");
		output(",");
	}
	output(" is just so... strange and erotic that you can’t help but giggle in anticipation, licking your lips and grabbing hold of your [pc.tail] with both hands to steady it.");
	
	output("\n\nYour slit wobbles unsteadily on its pillar of flesh, and you work your muscles to angle it more perfectly towards your other lips, the ones barely concealing your mischievous tongue. Guiding it a little closer, you breathe in its scent, admiring the almost sweet tang that your [pc.tailCunt] gives off. Unable and unwilling to restrain yourself, you dive into the picture-perfect pussy in front of you, letting the lubed-up clit bounce off your nose and mark your face with own fragrant juices.");
	
	output("\n\nA shudder of involuntary pleasure works through your body, and you begin to cunnilingate yourself even more eagerly, attacking your pussy with your tongue. Your lick with eager, unrestrained strokes, plunging deeply before circling around the outer lips. Sometimes, you break up the tempo by suckling the clit into your mouth and whimpering in bliss; the vibrations make the wondrous feelings that much more intense. A gush of girlish goo splatters into your mouth, and you drink it without complaint. You swoon and lick your labia as clean as you can, but your [pc.tailCunt] just keeps leaking, dripping all over your [pc.chest].");
	
	output("\n\nOne of your hands begins to caress the length of your [pc.tail], stroking the [pc.skin] like some kind of pretend phallus, but it feels good all the same. The pressure squeezes the internal walls together, sliding fold against fold and nerves and nerves. You jerk your tailcunt compulsively while you eat it out, soaking yourself as the desire for more and more pleasure overwhelms you. Soon you’re grunting like an animal in heat, pumping so fast your hand is a blur and cramming as much of your [pc.face] into your [pc.tailCunt] as you can.");
	
	output("\n\nThe orgasm is almost a surprise when it comes. Your eyes roll back halfway, buried under your drooping eyelids. Your hand strokes down powerfully, gripping the wriggling, spasmatic appendage it begins to gush waves of lady-spunk across your face and tongue. You swallow a few gulps before you lose control and it pulls back, gushing girl-goo across your [pc.chest], [pc.belly], and crotch.");
	if(pc.hasCock()) {
		output(" [pc.EachCock] spurts semen fitfully as it’s doused with cunt juice, getting off in pure sympathy. The stuff drizzles all over your [pc.legs], turning you into quite the mess.");
	}
	if(pc.hasVagina()) output(" At the same time, [pc.eachVagina] clenches and cums as well, hungrily fluttering and squeezing, aching for penetration.");
	
	output("\n\nYou flop down onto your back and pull the [pc.tailCunt] back onto your face, licking the last of your libertine secretions from the well-served orifice. You bet it will feel even better to feed it cum.... Where did that thought come from?");
	output("\n\nCleaning up as best you’re able, you get geared back up and ready to move, though you can’t seem to get the smell of pussy off your breath.");
	processTime(10+rand(15));
	pc.orgasm();
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}
//*Cunt tail fap replacement B
//Not 4 Hoarses.
function cuntTailFapScene():void {
	clearOutput();
	flags["LAST_FAP"] = cuntTailFapScene;
	var x:int = pc.cockThatFits(9999);
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	if(pc.cockTotal() > 1) {
		for(var z:int = 0; z < pc.cockTotal(); z++) {
			if(z != x) y = z;
		}
	}
	output("You figure that now is a good time to give into your erotic urges and shuck your gear, assembling it into a neat pile beside you. Your [pc.tail] slithers up over your shoulder almost of its own volition, clearly thirsting for a fresh dose of cum, and you intend to give it exactly what it deserves. Thickening nicely, [pc.eachCock] engorges to a hard and ready state. You idly fondle your tentacle-like tail, slipping a finger into its moist opening to test its readiness. It’s soaking wet, of course, and ready to fuck.");
	
	if(pc.cockTotal() > 1) output("\n\nSelecting [pc.oneCock]");
	else output("Grabbing your [pc.cock]");
	output(", you idly fondle yourself");
	if(pc.balls > 0) output(", playing your fingers across your [pc.balls] whenever you have a spare moment");
	output(", slowly enjoying the sensitivity of your skin. It pulses with ardor and thickens slightly, growing ever more tumescent thanks to your skilled fondles. You sigh and relax, leaning back while you pump a dollop of pre out from your " + pc.cockDescript(x) + ". It trickles down only to be caught by your fingers and turned into slippery lube. You stroke faster and faster, barely noticing as your [pc.tailCunt] moves downward, spattering its natural secretions across your lower body.");
	output("\n\nYour [pc.tail] slows as it nears your " + pc.cockDescript(x) + ". Slippery soft wetness envelops your " + pc.cockHead(x) + " a quarter of an inch at a time as it engulfs your boner, slurping down the drops of pre-cum you start leaking in response. Your tool is immersed in soft, slippery coils of flesh as the outside of your tail ripples and squirms around in ways that make you dizzy with lust.");
	
	//{One other dick}
	if(pc.cockTotal() == 2 && y != -1) 
	{
		output("\n\nLuckily, you have an extra " + pc.cockDescript(y) + " to handle while your tail works to coax your orgasm free");
		if(pc.balls > 0) output(" from your [pc.balls]");
		output(". The pleasure from your prehensile pussy increases  in response to that thought, and you settle into stroking your spare dick, jacking yourself off with strokes that are perfectly timed to the slurping tempo next door. It’s soon dripping out as much pre-cum as your snatch-snared mast, and you smear the clear juice over yourself, masturbating with long, hot, wet strokes. You bite your lip and try to endure the pleasure, but it feels sooo good.");
	}
	//{Two+ other dicks}
	else if(y >= 0) {
		output("\n\nLuckily, you’ve got enough extra dicks to go around. You grab ");
		if(pc.cockTotal() > 3) output("two");
		else output("both other");
		output(" dongs to work while your tail tries to coax your orgasm free");
		if(pc.balls > 0) output(" from your [pc.balls]");
		output(", figuring you can climax harder and feed your tail the cum it craves sooner. In response, a wave of euphoria rolls up your vaginal appendage and tickles at your consciousness, rewarding you for your aid. The pleasure of your lewdly pumping tail grows stronger with each lurid squelch from your sexual congress. Pre-cum oozes out of your " + num2Text(pc.cockTotal() - 1) + " leaky cum-slits, slicking your palms as you stroke yourself, bubbling around your fingers with each subsequent pump.");
	}
	output("\n\nYour [pc.tailCunt] clamps down at your [pc.sheath " + x + "], and the rippling motions its squeezing innards make as they roll up intensify, coming faster and stronger before. The nub of your clit rubs against your pubic region when your beast-like tail wiggles around your " + pc.cockDescript(x) + " violently. It suctions harder and harder, pumping your prick up with fresh blood. Your [pc.legs] are twitching wildly from the pleasure, and you struggle to hold yourself still as a wave of excitement rises up in your middle.");
	if(pc.balls > 1) output(" Twitching against you, your [pc.balls] bounce in their [pc.sack] as they ready a deluge of liquid love.");
	else if(pc.balls == 1) output(" Twitching against you, your [pc.balls] bounces in its [pc.sack] as it readies a deluge of liquid love.");
	
	output("\n\nPleasure slams into your skull with canon-like force, launched from your tail, straight up your spine, and into your brain where it shatters into a concussive explosion of ecstasy. Your abdominals clench with your orgasm and move your creamy payload towards its eventual terminus, causing warm pressure to build and then release. A huge rope of [pc.cum] launches from you, and at the same time you get the feel the wonderful, blissful experience of having your tail stuffed with a juicy, delicious payload. Each ejaculation causes it to suck harder and faster, dragging your orgasm on longer");
	if(pc.cockTotal() > 1) {
		output(", while your other dick");
		if(pc.cockTotal() > 2) output("s launch their contributions");
		else output(" launches its contribution");
		output(" into the air. The [pc.cumColor] globules hang at the zenith of their parabolic arc for a perfect, blissful moment before they fall down in sexy splatters");
	}
	output(".");
	if(pc.cumQ() >= 500) output(" Your prehensile protuberance bloats from your large deposits, eventually giving up on milking you and pulling off to lamely drool [pc.cum] from its gaped orifice on the ground.");
	if(pc.cumQ() >= 1000) output(" You keep squirting even after all that, painting your [pc.belly] and [pc.fullChest] with the leftovers");
	if(pc.cumQ() >= 2000) output(", even though there’s so much that it puddles and runs off of you, collecting into a small lake around your [pc.butt]");
	if(pc.cumQ() >= 1000) output(".");
	output("\n\nSatisfaction radiates from your entire body in response, but the amount coming from your tail is disproportionately large, enough that you lie there panting while your [pc.tail] digests its load, dreamily toying with [pc.eachCock] until you settle down.");
	
	pc.orgasm();
	processTime(20+rand(10));
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",mainGameMenu);
}

