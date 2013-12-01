function masturbateMenu():void {
	clearMenu();
	var texts:Array = new Array();
	var funcs:Array = new Array();
	var args:Array = new Array();
	if(location == 99 && celiseIsCrew() && pc.hasCock()) {
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
	for(var x:int = 0; x < texts.length; x++) {
		if(x <= 13) {
			addButton(x,texts[x],funcs[x],args[x]);
		}
		else addButton((x+1),texts[x],funcs[x],args[x]);
	}
	addButton(14,"Back",mainGameMenu);
}

//Tailcock Fapping w/ Celise
//By Savin
//{Accessed from Masturbate menu whilst shipboard}
function tailCockCeliseFaps():void {
	clearOutput();
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
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Vaginal Fap
function vaginalFap():void {
	clearOutput();
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
	if(rooms[location].hasFlag(GLOBAL.BED)) output("  You're thankful to have a bed, and you lean back against the headboard, letting your [pc.legs] splay wide as twitch in a visible display of your enjoyment.");
	else if(location == 99) output(" You're thankful to be in the comfort of your ship and splay your [pc.legs] out as much as the ship will allow, flexing your muscles in rapacious enjoyment.");
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
			if(rooms[location].hasFlag(GLOBAL.BED)) output("bed");
			else if(location == 99) output("deck");
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
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Single Dick Fap
function singleDickFap():void {
	clearOutput();
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
	if(location == 99) {
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
			if(rooms[location].hasFlag(GLOBAL.OUTDOOR)) output(", nevermind the swimming pool-like lake below");
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
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	