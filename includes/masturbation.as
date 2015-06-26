import classes.GameData.CommandContainers.FapCommandContainer;
import classes.Items.Armor.GooArmor;
import classes.Items.Miscellaneous.MilkBag;
import classes.Items.Miscellaneous.MagicMilker;

public function availableFaps(roundTwo:Boolean = false):Array
{
	var faps:Array = new Array();
	var fap:FapCommandContainer;
	
	// Overrides
	// If any of these are true, do whatever you need and return after pushing a single function into the array
	// We can then autoexecute on the only available option
	if (pc.hasCuntTail() && pc.hasCock && !pc.isTaur() && (pc.cockThatFits(pc.tailCuntCapacity()) >= 0) && flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined && flags["DAYS_SINCE_FED_CUNT_TAIL"] >= 7)
	{
		clearOutput();
		output("An insatiable hunger from your tail overwhelms you. You have to feed it!");
		addButton(0, "Next", cuntTailFapScene);
		
		return null;
	}
	
	if (pc.milkFullness >= 150 && pc.isLactating() && flags["SUPRESS_TREATED_MILK_FAP_MESSAGE"] == undefined)
	{
        // Super-lactation, must resist urge to fap!
        if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk"))
        {
            clearOutput();
            output("<b>You feel a strong urge to relieve the unbearable pressure your lactating mammaries are experiencing; but thanks to the enhancements to your [pc.fullChest], you are confident they won't ever stop - or even slow down - [pc.milk] production, and you find it easy to resist.</b>");
            clearMenu();
            addButton(0, "Next", function():void 
			{
				flags["SUPRESS_TREATED_MILK_FAP_MESSAGE"] = 1;
				masturbateMenu(false);
				flags["SUPRESS_TREATED_MILK_FAP_MESSAGE"] = undefined;
			}, undefined, "Masturbate", "Choose something else...");
            addButton(1,"Milk",milkturbation, undefined ,"Milk Anyway","Release the pressure now!");
            addButton(14,"Back", mainGameMenu);
        }
        // Your will is weak, now it's milky fun tiems, yay!
        else milkturbation();
        return null;
    }
	
	// Previous fap has moved to consumers of the faps array.
	// This enables us to check if the LAST_FAP targetted command is available (it'll be in the array), otherwise hide repeat.
	
	// List all the faps!
	if (currentLocation == "SHIP INTERIOR" && celiseIsCrew() && pc.hasTailCock())
	{
		fap = new FapCommandContainer();
		fap.text = "Porn&Celise";
		fap.func = tailCockCeliseFaps;
		faps.push(fap);
	}
	
	if (pc.hasVagina())
	{
		fap = new FapCommandContainer();
		fap.text = "Vaginal";
		fap.func = vaginalFap;
		faps.push(fap);
	}
	
	if (pc.hasCock())
	{
		fap = new FapCommandContainer();
		fap.text = "Penis";
		fap.func = singleDickFap;
		faps.push(fap);
	}
	
	if (pc.cockTotal() >= 2)
	{
		fap = new FapCommandContainer();
		fap.text = "Penises";
		fap.func = multiCockFap;
		faps.push(fap);
	}
	
	if (((pc.canLactate() || pc.milkQ() >= 200) && !roundTwo) || (pc.isLactating() && pc.milkFullness >= 70 && roundTwo))
	{
		if (pc.hasItem(new MagicMilker(), 1))
		{
			fap = new FapCommandContainer();
			fap.text = "Magic Milker";
			fap.func = joyCoMagicMilker7Sucks;
			fap.ignoreRandomSelection = true;
			faps.push(fap);
		}
		
		fap = new FapCommandContainer();
		fap.text = "Hand Milk";
		fap.func = milkturbation;
		fap.ignoreRandomSelection = true;
		faps.push(fap);
	}
	
	if (hasFeedableMimbranes() && currentLocation == "SHIP INTERIOR")
	{
		if (pc.hasCock())
		{
			fap = new FapCommandContainer();
			fap.text = "Penis Feed";
			fap.func = feedMimbranesWithCock;
			faps.push(fap);
		}
		
		if (pc.hasVagina())
		{
			fap = new FapCommandContainer();
			fap.text = "Vaginal Feed";
			fap.func = feedMimbranesWithPussy;
			faps.push(fap);
		}
	}
	
	if (pc.hasCuntTail())
	{
		fap = new FapCommandContainer();
		fap.text = "Tailingus";
		fap.func = tailingusFapReqsCuntTail;
		faps.push(fap);
		
		if (pc.hasCock() && !pc.isTaur() && (pc.cockThatFits(pc.tailCuntCapacity()) >= 0))
		{
			fap = new FapCommandContainer();
			fap.text = "TailFuck";
			fap.func = cuntTailFapScene;
			faps.push(fap);
		}
	}

	if (!pc.isTaur())
	{
		fap = new FapCommandContainer();
		fap.text = "ButtFinger";
		fap.func = wutwutindabuttbuttFap;
		faps.push(fap);
	}

	//tentacle massage fun
	//Accessed from masturbate menu on ship. Req's genitals.
	if(celiseIsCrew() && flags["GIGACELISE"] == 1&& (pc.hasCock() || pc.hasVagina()) && currentLocation == "SHIP INTERIOR")
	{
		fap = new FapCommandContainer();
		fap.text = "GooMassage";
		fap.func = tentacleMassageFunShit;
		faps.push(fap);
	}

	//Boobswell pads. Need a way to exclude this from random selection sometime.
	if(pc.hasStatusEffect("Boobswell Pads")) 
	{
		fap = new FapCommandContainer();
		fap.text = "Remove B.Swell";
		fap.func = removeBoobswellPads;
		fap.ignoreRandomSelection = true;
		faps.push(fap);
	}
	
	if (pc.armor is GooArmor)
	{
		fap = new FapCommandContainer();
		fap.text = "Goo Dicks";
		fap.ttHeader = "Goo Dicks";
		fap.ttBody = "Have [goo.name] fill all of your holes and fuck you.";
		fap.func = gooDickFap;
		fap.ignoreRandomSelection = false;
		faps.push(fap);

		if (pc.hasCock())
		{
			fap = new FapCommandContainer();
			fap.text = "GooSleeve";
			fap.ttHeader = "Goo Cocksleeve";
			fap.ttBody = "Have [goo.name] jack you off.";
			fap.func = grayGooCockSleeve;
			fap.ignoreRandomSelection = false;
			faps.push(fap);
		}
	}
	//PANTY FAPS!
	if(pc.hasCock()) 
	{
		//Has panties for faps:
		if(pantyFapCount() > 0)
		{
			fap = new FapCommandContainer();
			fap.text = "Panty Fap";
			fap.ttHeader = "Panty Fap"
			fap.ttBody = "Use a pair of panties that you've collected as a cumrag.";
			fap.func = futaBabePantyfapsRouter;
			fap.ignoreRandomSelection = false;
			faps.push(fap);
		}		
	}
	//PANTY SCHLICK!
	if(pc.hasVagina())
	{
		//Has panties?
		if(pantyFapCount() > 0)
		{
			fap = new FapCommandContainer();
			fap.text = "PantySchlick";
			fap.ttHeader = "PantySchlick"
			fap.ttBody = "Use a pair of panties that you've collected as fuel for feminine masturbation.";
			fap.func = futaBabePantySchlicksRouter;
			fap.ignoreRandomSelection = false;
			faps.push(fap);
		}
	}
	return faps;
}

public function pantyFapCount():Number
{
	var count:int = 0;
	if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) count++;
	if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) count++;
	if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) count++;
	if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink.")) count++;
	return count;
}

public function selectRandomFap(faps:Array):void
{
	// Don't allow milk scenes to be selected randomly
	var filtFaps:Array = faps.filter(function(item:*, index:int, array:Array):Boolean {
		if ((item as FapCommandContainer).ignoreRandomSelection == true) return false;
		return true;
	});
	
	filtFaps[rand(filtFaps .length)].execute();
}

public function masturbateMenu(roundTwo:Boolean = false):void {
	clearOutput();
	clearMenu();
	var aborted:Boolean = false;
	//Masturbation prevention
	if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP))
	{
		clearOutput();
		output("Masturbating here would be impossible.");
		aborted = true;
	}
	if(rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL))
	{
		clearOutput();
		output("Public masturbation is illegal here. Trying to masturbate would almost certainly land you in jail.");
		aborted = true;
	}
	//Exhibitionist fap! - overrides all other faps
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.exhibitionism() >= 66)
	{
		clearOutput();
		output("Out here? In public?\n\n...Yeah, that'll do nicely.");
		clearMenu();
		addButton(0,"Next",goddamnitJimTAndYourExhibitionism);
		return;
	}
	//Low Exhibitionist fap! - overrides all other faps
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.exhibitionism() >= 33)
	{
		clearOutput();
		output("Out here? In public?\n\n...<b>it'll have to do</b>.");
		clearMenu();
		addButton(0,"Next",moderateExhibitionOmniFap);
		return;
	}
	//Pussy out, unless you're being force-fapped.
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.libido() < 70)
	{
		clearOutput();
		if(pc.libido() < 10) output("You'd never even consider masturbating in public!");
		else if(pc.libido() < 20) {
			output("No way. You aren't the kind of person that would masturbate in public");
			if(pc.lust() >= 75) output(", no matter how horny you are!");
			else output(".");
		}
		else if(pc.libido() < 30) output("The galaxy may be a wide-open place with all kinds of different social norms concerning publicly self-satisfying sexual needs, but you're too nervous to engage in that sort of thing yourself.");
		else if(pc.libido() < 40) output("This is a public place! You aren't keen on the idea of masturbating here. Maybe slip back to somewhere a little more private.");
		else if(pc.libido() < 50) output("You aren't the kind of person to just drop trou and take care of business in public, even if it would be kind of hot.")
		else if(pc.libido() < 60) 
		{
			output("Yeah, you definitely want to masturbate, but this is a public place! Everyone would be able to see you there with your [pc.butt] in the dirt, ");
			if(pc.hasCock()) output("jacking off like wild.");
			else if(pc.hasVagina()) output("grinding your [pc.vaginas] like wild.");
			else output("playing with yourself like some kind of wild animal.");
			pc.lust(5);
			output(" Fuck! Now you're even hornier.");
		}
		else 
		{
			output("You consider masturbating here, but ultimately, you can't. It doesn't matter that having people watching you masturbating would be totally hot. You're still too nervous about it all. What if someone took a picture and put it up on the extranet? You can imagine the tabloids now: some garish headline plastered above a picture of you with both hands");
			if(pc.hasCuntTail() && pc.hasCock()) output(" pumping your cunt-tail up and down on [pc.oneCock].");
			else if(pc.hasCock() && pc.canAutoFellate(-1)) output(" aiming your wildly orgasming cock into your own mouth, your [pc.lips] sealed tightly about the head.");
			else if(pc.hasCock()) output(" vigorously pumping at [pc.oneCock].");
			else if(pc.hasVagina()) output(" doing your level best to fist [pc.oneVagina], your other hand toying with a [pc.nipple].");
			else output(" roaming licentiously across your own body.");
			output("\n\nYou whimper. The idle thoughts have you feeling even hotter now. You'd better find a good place to relieve yourself.");
		}
		output("\n\n(70 libido or sufficient exhibitionism experience is required to masturbate in public spaces.)");
		aborted = true;
		if(pc.perkv1("'Nuki Nuts") > 0) 
		{
			output("\n\n<b>No! You have to do this! You're getting too swollen not to!</b> You'll have to just blush and bear it!");
			aborted = false;
		}
		else if(roundTwo)
		{
			output("\n\n<b>No! You have to - you're too turned on from milking yourself!");
			aborted = false;
		}
	}
	if(aborted)
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	// Get available faps
	var faps:Array = availableFaps(roundTwo);
	var btnOffset:int = 0;
	
	// If we got back a null array from the listing functor, it should have created the button for us.
	if (faps == null)
	{
		return;
	}
	
	if (roundTwo == true)
	{
		//If anything on the screen, do as a next
		if(userInterface.outputBuffer != "")
		{
			clearMenu();
			addButton(0,"Next",selectRandomFap,faps);
		}
		else selectRandomFap(faps);
		return;
	}
	
	// If only one fap came back, just execute it
	if (faps is Array && faps.length == 1)
	{
		faps[0].execute();
		return;
	}
	
	// If last is available, show repeat button
	var showRepeat:Boolean = false;
	
	if (flags["LAST_FAP"] != undefined)
	{
		var filtFaps:Array = faps.filter(function(item:*, index:int, array:Array):Boolean {
			if (flags["LAST_FAP"] == item.text) return true;
			return false;
		});
		
		// Available, show repeat
		if (filtFaps.length > 0)
		{
			showRepeat = true;
		}
		// Unavailable, so we'll just not show the button (in case player backs out and comes back later when the scene is available)
	}
	
	// Repeat button
	if (showRepeat)
	{
		addButton(btnOffset, "Repeat", filtFaps[0].func);
		btnOffset++;
	}
	// Random button
	if (faps.length > 0)
	{
		addButton(btnOffset, "Random", selectRandomFap, faps);
		btnOffset++;
	}

	// Generate all the buttons for the available funcs
	for (var i:int = 0; i < faps.length; i++)
	{
		if (i + btnOffset <= 13)
		{
			addButton(i + btnOffset, faps[i].text, faps[i].execute, undefined, faps[i].ttHeader, faps[i].ttBody);
		}
		else
		{
			addButton(i + btnOffset + 1, faps[i].text, faps[i].execute, undefined, faps[i].ttHeader, faps[i].ttBody);
		}
	}

	this.addButton(14,"Back",mainGameMenu);
}

//Tailcock Fapping w/ Celise
//By Savin
//{Accessed from Masturbate menu whilst shipboard}
public function tailCockCeliseFaps():void {
	clearOutput();
	author("Savin");
	output("God damn you're horny.");
	output("\n\nYou breathe a lusty sigh as the heat of arousal courses through your body, demanding release. You ");
	if(pc.armor.shortName != "") output("strip out of your [pc.armor] and ");
	output("toss your gear aside before flopping down on your bed, ");
	if(pc.isTaur()) output("your [pc.legs] curled up under your belly");
	else output("your [pc.legOrLegs] kicked up behind you");
	output(" as you grab your codex tablet and hook it into its stand at your bedside. Opening up the extranet, you flick through a quick search for free porn. Your hand idly reaches around as you scroll, grabbing your [pc.tailCock] and gently stroking it to hardness as you search, browsing past a dozen quick vids of buxom women and chisel-chested men of a dozen races, all oiled up with bodies entangled in myriad erotic poses. Hot. Your stroking slowly picks up in pace");
	if(pc.biggestTitSize() > 1) output(", your hand occasionally trailing from the tablet to grope and squeeze your [pc.chest], pinching the hardening teats atop them");
	output(".");
	output("\n\nIt takes a good long while to finally find a good vid: one you think you can actually stomach all the way through. One of the actors is a little butter-faced, but hey, the curves on the other one... damn. Oh, that's nice....  You stroke harder and faster as the foreplay starts in earnest, a meaty cock finding a nice sheath in an alien girl's mouth, making her throat bulge with the gene-spliced boy's massive girth. Your tail-wang writhes in your hand, straining against your grasp as you jerk it, the first pearly beads forming at your tip.");
	output("\n\nThe way it pools and dribbles in your hand makes you think of a certain galotian who's probably about ready for a snack. Getting a nice and dirty thought forming in your mind, you key the ship's intercom and call the goo-girl up to your quarters for a meal at the captain's mess. She's quick on her... uh... gooey amorphus mass... and before the first blowjob scene's over, you hear a faint knock on your door. About as heavy as a goo-girl can manage, given her make-up. You call, <i>“Enter,”</i>  shooting the green girl a grin, making sure she can see exactly what's on screen and just how hard your [pc.tailCock] is.");
	output("\n\nShe may not be a genius, but Celise's cock-hungry nature takes the fore as she slithers over, her blobby mass of green gel rolling over itself as she approaches, a great big smile on her face. <i>“Oooh, I don't get to come up here much,”</i>  she says, looking around your cabin with mock interest, her eyes never leaving the cock in your hand. <i>“But if I knew there were going to be treats like that, I'd be up here like, every day.”</i>");
	output("\n\nYou feel a surge of affection at her eagerness, and quickly lay back down on your belly, tail wagging enticingly at the galotian in the closest facsimile to a <i>“come hither”</i> waggle as you can manage with a rock-hard pre-dripping tail-cock. Celise hops into your bed, snuggling up next to you, her flank sticking wetly to your [pc.skin]. <i>“Oooh, whatcha watching?”</i>");
	output("\n\nYou hover a finger over the name of the vid, but the sudden insertion of a huge cock into a huge-titted bimbo's asshole opposite the two in her mouth gets the point across pretty quickly. Celise licks her lips as she watches the holo-vid progress, but you've got more in mind than just snuggling with a porno. You reach your tail around and nuzzle it against her cheek, letting it practically submerge in the hot, viscous gel of her body. With a squeal of delight, Celise rolls onto her back, taking your tail-cock in her mouth as her eyes keep trained on the vid. You let out a contented little sigh as your [pc.tailCock] finds a nice, warm, wet sheathe to hold it, but that turns into a low moan of pleasure as Celise's mouth starts to work its wonders, gyrating and washing over and around your cock rather than simply fellating it, getting the most out of her alien biology as her semi-liquid body churns around your member.");
	output("\n\nMmmm, that's niiiiice. Your breath comes heavier as Celise suckles from your cock, little droplets of pre starting to float listlessly in her transparent head. You see a hand vanish down into her crotch, pleasuring her one constant feature -- her big, loose, gooey cunt - as she watches the porno progress from DP to cowgirl as the busty alien rides a huge cock, giving handies to two other males and a hung hermaphrodite pleasures herself with the whore's big tits. Following along herself, Celise pops your [pc.tailCock] out of her mouth, shifting it downward to her big, bouncy teats and locking it between them, binding your dick in a prison of soft warm goo-tit. Still raptly watching the orgy onscreen, Celise starts to squeeze and move her tits, wanking you off between the two huge orbs. You moan, hips wiggling happily as your cock is coated in green slime, slipping easily through her cleavage again and again, with just enough resistance to let you feel the cum bubbling up through your prick, making you even harder as your seed comes up to feed your gooey friend.");
	output("\n\nWith your cock submerged in Celise's gooey tits, your orgasm mounts toward the inevitable, spurred on by her slick sliding tits as she moves them faster and faster. But just before your climax can come, the pornstar's position changes, the girl rolling onto all fours to be pounded in every hole by her lovers. A moment later, she slides up onto your back, flopping down atop you with breasts pressing into your back, hands stroking your shoulders soothingly as her big, bubbly buttcheeks lock around your [pc.tailCock], squeezing it ever so smoothly. Celise flexes her cheeks, massaging your prick as she works your shoulders, cheek nuzzling against your own as you watch the money shot, cum splattering everywhere on the bimbo's body, three cocks all coating her in a multi-colored spunk parade.");
	output("\n\n<i>“You wanna cum, too?”</i>  Celise asks, her breasts pressing down into your back, practically folding around you. Her ass never stops jacking you off, harder and faster until she's leaving you with little choice but to join in on the on-screen debauchery. With a grunt and a lusty moan, you feel the spunk traveling up your tail as you finally reach the pinnacle of pleasure, and a moment later Celise yelps with sudden glee as the first of many great [pc.cumColor] globs burst out from between her ass cheeks, raining down onto her back. She rolls over, mouth open wide as your spunk falls all over her, absorbed into her gooey body as she feeds on your sexual release.");
	output("\n\nYou ride the orgasm out, humping your hips against her quivering body as Celise sucks up every drop you have to give her; soon she's got your cock plugged into her twat, wringing out anything that didn't burst onto her back moments before. When the [pc.cumColor] explosion comes to an end, Celise seems awfully pleased, rolling back onto her belly, practically wrapping your head in her giant tits as she plants a kiss on your head. <i>“That was a nice snack, cap'n. We should do this again sometime, like, soon.”</i>");
	output("\n\nYou nod, yawning powerfully as your tailcock slithers out of her, wrapping back around");
	if(pc.legCount > 1) output(" one of");
	output(" your [pc.legOrLegs]. To your surprise, though, the goo's already curled up on you, snoring softly. You sigh and reach back, patting her jiggling ass cheek before locking your arms under your own [pc.face] for a quick nap in the afterglow.");
	processTime(45 + rand(5));
	pc.orgasm();
	celise.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Vaginal Fap
public function vaginalFap():void {
	clearOutput();
	output("You ");
	if(pc.isNude()) output("lazily twist what little gear you wear to the side so as not to bump your arm into it while masturbating and smile to yourself about the practical advantages of being nude.");
	else {
		clearList();
		if(pc.armor.shortName != "") addToList("wriggle out of your [pc.armor]");
		if(pc.lowerUndergarment.shortName != "") {
			addToList("push your [pc.lowerUndergarment] down");
			trace("LOWER ON LIST");
		}
		if(pc.upperUndergarment.shortName != "") {
			addToList("pull your [pc.upperUndergarment] off over your head");
			trace("UPPER ON LIST");
		}
		output(formatList());
		trace("UP SHORT: " + pc.upperUndergarment.shortName);
		trace("LOW SHORT: " + pc.lowerUndergarment.shortName);
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
	if(pc.vaginas[0].wetness() <= 1) output("slightly damp entrance your fingers slide against");
	else if(pc.vaginas[0].wetness() <= 2) output("sticky, simmering delta your fingers slip against");
	else if(pc.vaginas[0].wetness() <= 3) output("unmistakably wet and ready slit your fingers almost slip into");
	else if(pc.vaginas[0].wetness() <= 4) output("oozing, overly-lubricated entrance that nearly sucks your fingers in");
	else output("soaking-wet, crotch-drenching entrance that would be oh so easy to enter");
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
	if(rooms[currentLocation].hasFlag(GLOBAL.BED)) output(" You're thankful to have a bed, and you lean back against the headboard, letting your [pc.legOrLegs] splay wide and twitch in a visible display of your enjoyment.");
	else if(currentLocation == "SHIP INTERIOR") output(" You're thankful to be in the comfort of your ship and splay your [pc.legOrLegs] out as much as the ship will allow, flexing your muscles in rapacious enjoyment.");
	else
	{
		output(" You slump down against the nearest upright surface since your [pc.legOrLegs] seem");
		if(pc.legCount == 1) output("s");
		output(" to be too busy quivering to properly support you.");
	}
	
	//Second coochie touches!
	if(pc.vaginaTotal() > 1) {
		output("\n\nIf one is this good... you thrust your other hand down to your crotch as fast as you can, brushing past your other wrist as you find your way to your [pc.vagina 1] and stroke it with eager, feverish need. Paroxysms of pleasure rock your body, alternately locking and convulsing your muscles but not quite bringing you off yet; this is still mere foreplay. You curl your hand into a fist and drag your knuckles up and down that slit, spreading its lips slightly around your digit, rubbing yourself with both hands and letting out quiet little moans of enjoyment. This taste of ecstasy is almost too much and yet not nearly enough, and you plunge two sets of fingers into your eager openings.");
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
	output("\n\nYou moan, loud and low but inexorably rising higher with each touch and caress, each thrusting slip through your needy crevice. Arching your [pc.hips], you hump against your hand, grinding back into your quickly moving fingers");
	if(pc.totalClits() > 0) output(", some plunging inside while others tend to [pc.oneClit]");
	output(", your body practically on autopilot at this point - a quivering, pre-orgasm wreck. It's no surprise to you; this is what you wanted after all. A high pitched, keening whine escapes your [pc.lips] as you climb towards the peak of pleasure, and your fingers are rapidly becoming soaked with your [pc.girlCum].");
	
	output("\n\nThen, it comes all at once, an explosion of ecstasy strong enough to make your eyes roll back and your body go on autopilot: fingers thrusting, [pc.hips] lurching, [pc.legOrLegs] quivering. Your wail turns into a lurid moan every bit as sloppy as your spasming [pc.vaginas]");
	if(pc.isSquirter()) output(", just before you squirt out ribbons of [pc.girlCum]");
	output(".");
	if(pc.hasFuckableNipples()) output(" Your [pc.nipples] react similarly, and you wind up pulling your soaked fingers free in the throes of your passion.");
	output(" Drool from your lolling tongue drips to your [pc.chest], warm on your heaving [pc.skinFurScales] as you shudder one last, climactic time, letting the supernova-hot explosion of bliss roll up from your crotch to your brain. It bursts across your consciousness like a plasma-bolt comprised of pleasure, rolling back your eyes and turning your thoughts to nothing more than animal pleasure.");
	
	if(pc.hasCock()) {
		output("\n\nYour male anatomy goes off as well, triggered by the squelching blissplosions in your [pc.vaginas]. [pc.Cum] launches out of [pc.eachCock] in thick ropes onto your [pc.belly] and [pc.chest].");
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
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}


//Single Dick Fap
public function singleDickFap():void {
	clearOutput();
	clearList();
	if(pc.isNude() || (pc.armor.shortName == "" && pc.lowerUndergarment.shortName == "")) output("You sigh and stretch, letting [pc.eachCock] hang free. Sometimes, it's good to be nude. You");
	else {
		if(pc.armor.shortName != "") {
			output("You go ahead and pop open the bottom half of your [pc.armor]");
			if(pc.lowerUndergarment.shortName != "") output(" and [pc.lowerUndergarment]");
			output(" to free [pc.eachCock], and you");
		}
		else output("You go ahead and pull down your [pc.lowerUndergarment] to free [pc.eachCock], and you");
	}
	output(" idly reach down to toy with [pc.oneCock], grabbing hold and feeling it fill out in your palm, stiffening in anticipatory lust - not that you needed any more. You're plenty horny, and you begin to stroke, working yourself towards greater levels of pleasure with great vigor, pumping hard and fast on your ");
	if(pc.cockTotal() > 1) output("chosen ");
	output(" phallus. The [pc.cockHead] plumps up nice and full in your grip, already swelling out to its full size");
	if(pc.hasCockFlag(GLOBAL.FLAG_FLARED)) output(", the flare dangerously expanding already");
	output(", hot, lusty, and ready for action.");
	//In ship? Pull up porno!
	if(currentLocation == "SHIP INTERIOR") {
		output("\n\nWith your other hand, you manipulate the ship's computer to pull up some pornography from the extranet. At first, all you get are a bunch of pop-up holos about getting a space-order bride, pirating music, and cleaning malware off your computer systems, but eventually, you hit the jackpot");
		if(silly) output(": XMiniatureGiantSpaceHamster.com");
		output(". There's four breasted whores from Omikron Perseus VI, three-cocked trannies masturbating, and even missionary sex in the missionary position for the sole purpose of procreation. You scroll through, picking video after video, watching increasingly debauched activities until [pc.eachCock] feels so full that it could burst.");
	}
	//Bottom of dick intro
	var selector:Array = new Array();
	if(pc.hasCockFlag(GLOBAL.FLAG_KNOTTED)) selector[selector.length] = GLOBAL.FLAG_KNOTTED;
	if(pc.hasCockFlag(GLOBAL.FLAG_SHEATHED)) selector[selector.length] = GLOBAL.FLAG_SHEATHED;
	if(pc.hasCockFlag(GLOBAL.FLAG_STINGER_BASED)) selector[selector.length] = GLOBAL.FLAG_STINGER_BASED;
	if(selector.length == 0) selector[selector.length] = GLOBAL.TYPE_HUMAN;
	var temp:int = selector[rand(selector.length)];
	//Knotted
	if(temp == GLOBAL.FLAG_KNOTTED) {
		output("\n\nYou start by gently feeling around the bottom of your ");
		if(pc.cocks[0].knotMultiplier <= 1.4) output("dutifully swelling");
		else if(pc.cocks[0].knotMultiplier <= 1.6) output("nice, thick");
		else if(pc.cocks[0].knotMultiplier <= 1.9) output("bloated");
		else if(pc.cocks[0].knotMultiplier <= 2.5) output("obscenely swollen");
		else output("ridiculously fat");
		output(" knot, feeling the swollen cocklump pulse with every beat of your heart. The many veins visible around its circumference tingle pleasantly as they drum against your palm.");
	}
	//Sheath
	else if(temp == GLOBAL.FLAG_SHEATHED) output("\n\nYou start by gently feeling around the sheath, rubbing the sensitive skin that would usually conceal your organ were it not so erect, and even let your fingers dip down into the folds between, running them around the inside, feeling your hands on your dick and yet at the same time penetrating you. By the time you pull them free, your heady, musky aroma is thick in the air. You move up to the shaft a nano-second later, eager to get into the real action.");
	//Anemone Wavy
	else if(temp == GLOBAL.FLAG_STINGER_BASED) {
		output("\n\nYou start by gently feeling around the base of your shaft, letting your wriggling tendrils brush your knuckles, their stinging venom both painful and pleasant all at once. A chemical excitement spreads up your arm, darkening the [pc.skin]");
		if(pc.skinType != GLOBAL.SKIN_TYPE_SKIN) output(" under your [pc.skinFurScales]");
		output(", exciting your heart until you feel it's about to thud its way out of your chest. A ripple of sensual pleasure spreads out from your crotch as the venom circulates through your bloodstream to its goal.");
	}
	//Nothing special:
	else output("\n\nYou start by gently caressing yourself, twisting your fingers around your dick, caressing the sensitive underside of your dick as your lasciviousness mounts. Every contact of [pc.skinFurScales] on skin sends electric currents of pleasure shooting through your body.");
	
	//Top of dick intro
	selector = new Array();
	if(pc.hasCockFlag(GLOBAL.FLAG_TAPERED)) selector[selector.length] = GLOBAL.FLAG_TAPERED;
	if(pc.hasCockFlag(GLOBAL.FLAG_FLARED)) selector[selector.length] = GLOBAL.FLAG_FLARED;
	if(pc.hasCockFlag(GLOBAL.FLAG_PREHENSILE)) selector[selector.length] = GLOBAL.FLAG_PREHENSILE;
	if(pc.hasCockFlag(GLOBAL.FLAG_STINGER_TIPPED)) selector[selector.length] = GLOBAL.FLAG_STINGER_TIPPED;
	if(selector.length == 0) selector[selector.length] = GLOBAL.TYPE_HUMAN;
	temp = selector[rand(selector.length)];
	
	//Pointed
	if(temp == GLOBAL.FLAG_TAPERED) {
		output("\n\nSoon, you're panting with excitement, thrusting against your hand when your fingers touch the sensitive point to bury yourself back to down to your [pc.knot] in your hand's reflexively tight grip. You stroke up again, fondle yourself, and whine as your body forces you to thrust, embedding your pointed prick deep into your hand once more, pleasuring yourself with rapid humps and vice-like squeezes.");
	}
	//Flared
	else if(temp == GLOBAL.FLAG_FLARED) {
		output("\n\nSoon, you're panting with excitement, your [pc.hips] quivering as you dance your touches up past the middle of your flexing member. Your member gives a mighty shudder when you approach the flare, and that masculine ring thickens in response, engorging with fresh blood and becoming even more responsive to your touches.");
		if(pc.isTaur()) output(" You fail to suppress a muted whinney as your body gives in to its animalistic instincts.");
	}
	//Anemone Wavy
	else if(temp == GLOBAL.FLAG_STINGER_TIPPED) {
		output("\n\nSoon, you're panting with excitement and stroking your hand up and down your length. It's hard and sensitive as you've come to expect, but on your upstrokes, you get to your favorite part: the squirming tendrils that ring your crown. They have all the sensitivity of your cocktip, but at the same time, they also move with their own independant skills and desires, slipping between your fingers and dosing you with even more of your own venom.");
	}
	//Prehensile
	else if(temp == GLOBAL.FLAG_PREHENSILE) {
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
		output(" The sound of your masturbation takes on a decidedly moist quality, schlicking hard and fast as you rise towards your peak.");
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
		output(formatList() + ".");
	}
	else if(pc.cumQ() <= 250) output(" Thick spurt after thick spurt emerges from your cumslit, painting you from your [pc.belly] to your [pc.hair] in [pc.cumColor] relief.");
	else if(pc.cumQ() <= 500) output(" Big squirts of [pc.cum] fire out one after another, each easily thicker and larger than an average human's by far. They splatter across nearly every inch of your body, so thick that runnels of your spent goo drip down the sides of your [pc.chest] and [pc.face].");
	else {
		output(" Large torrents of [pc.cum] spray out of your cumslit with such vigor that you're able to watch them arc through the air before they rain down around you, each many times the size of a normal orgasm in its own right. The [pc.cumColor] rain slicks you from [pc.feet] to [pc.face], staining you the proof of your incredible virility");
		if(pc.cumQ() < 1000) {}
		else if(pc.cumQ() < 2000) output(", never mind the growing puddle below");
		else if(pc.cumQ() <= 5000) output(", never mind the inch-deep puddle below");
		else if(pc.cumQ() <= 10000) output(", never mind the deep, wide puddle below");
		else if(pc.cumQ() <= 20000) output(", never mind the small, growing lake below");
		else if(pc.cumQ() <= 30000) output(", never mind the rapidly-deepening lake below");
		else if(pc.cumQ() <= 50000) {
			if(rooms[currentLocation].hasFlag(GLOBAL.OUTDOOR)) output(", never mind the swimming pool-like lake below");
			else output(", never mind the room-flooding pool you've created");
		}
		else output(", never mind the physics-defying amount in the lake below");
		output(".");
	}
	if(pc.libido() <= 33) output("\n\nYou exhale a few long, slow pants as you come down from that glorious, orgasmic high");
	else if(pc.libido() <= 66) output("\n\nYou let out a dazed, happy smile now that you're sexually sated");
	else output("\n\nYou groan, wish you had time for a repeat performance");
	output(", straighten yourself up a little, and prepare to resume your journeys.");
	processTime(45 + rand(5));
	pc.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

public function multiCockFap():void {
	clearOutput();
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
	if(pc.cockTotal() > 2) {
		output("\n\nYour groin seems almost too bountiful, if such a thing is possible. There's all these wonderfully erect phalluses aching to be touched and yet you only have two hands to tend to them with.");
		if(pc.hasTailCunt() && pc.tailCount >= pc.cockTotal() - 2) {		
			output(" Without a single thought from you, your ");
			if(pc.cockTotal() > 3) output("tails snake around and cover");
			else output("tail snakes around and covers");
			output(" every single unclaimed cock with a tight, fleshy sleeve");
			if(pc.biggestCockVolume() > pc.tailCuntCapacity()) output(", even though at least one of your members is far too thick for a tail to handle more than the head");
			output(". You whimper as feelings of fucking and being fucked war with the sensation of doubled masturbation at the forefront of your mind. The only winner here is pleasure, and you subsume yourself in it, stroking like wild while trying to hold back the mother of all orgasms.");
			tailPussied = true;
		}
		else if(pc.tailCount >= pc.cockTotal() - 2 && pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.tailType != GLOBAL.TYPE_HUMAN) {
			output(" Lucky for you, you've got [pc.tails] that are more than capable of wrapping around an unclaimed tool and stroking up and down, letting you please every single cock at once in a symphony of pleasure ");
			if(pc.cockTotal() >= 7) output("with so many different harmonies that it almost overloads your mind");
			else output("so powerful that it's hard not to slip away into the ecstasy immediately");
			output(".");
		}
		else output(" You aren't one to give up on a challenge, and you stroke yourself in earnest, letting each cock have a few strong pumps up and down before moving to the next of your many penises. You circle around, never staying on one cock too long, always moving to the next once it's aching for a touch, so much more sensitive after tasting a moment of denial.");
	}
	
	
	//precum options!
	if(pc.ballFullness >= 33 || pc.cumQ() >= 500) {
		output("\n\n");
		if(pc.cumQ() <= 25) output("After a while of this, single pearls of pre-cum bead on your tips to shine in the light, begging to be touched and smeared over your sexy, throbbing fuck-sticks.");
		else if(pc.cumQ() <= 150) output("After a while of this, single droplets of pre bead from your cumslits. They are the vanguard of a small contingent of lubricating leakages that rolls down the surfaces of your [pc.cockHeads] in a delightful way.");
		else output("After a while of this, big droplets of pre-cum emerge from your cumslits, one after another. Each is hot on the heels of its predecessor, and in moments, your multitudinous masts are wreathed in eager cock-slime. There's so much that the rest of your crotch grows sticky with the wet-hot mess.");
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
	var x:int = pc.longestCockIndex();
	if(pc.hasFuckableNipples() && pc.biggestTitSize() >= 3 && pc.cocks[0].cLength()/pc.tallness >= 1/6) 
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
		if(pc.cocks[0].cLength()/pc.tallness >= 1/5) output("plenty ");
		output("long enough to pull it off.  Bending forward, you lower your [pc.fullChest] to line up ");
		if(pc.cockTotal() > 2) output("the pulsating phalluses lucky enough to be in your hands");
		else output("the dual phalluses");
		output(" with your chest-mounted dick-pleasers. When the paired pairs of sexual organs make contact, the resulting electric tingle nearly causes you to jerk them out of alignment. You manage to hold firm... barely, leaning down and pushing one [pc.cockHead] in your left side and one [pc.cockHead 1] in the other. Once you've sunk a few inches of phallic flesh directly into your ");
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
		if(pc.cocks[x].cLength()/pc.tallness < 1/2.5) output("at the bottom of your view, desperate for attention.");
		else output("in front of your [pc.face], so hard and needy, practically begging for attention.");
		output(" You humor it by ");
		if(pc.cocks[x].cLength()/pc.tallness >= 1/2.5) output("bending the anxious, phallic peak toward your mouth");
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
		output("\n\nAt first, you try to keep your pace fairly steady, but the longer you go, the longer you stroke, the more anxious and jerky your hands become. Your [pc.hips] occasionally twitch as well, and your [pc.legOrLegs]");
		if(pc.legCount == 1) output(" is");
		else output(" are");
		output(" soon shaking in excitement. Moaning, you pick up the tempo, pumping [pc.eachCock] with long, furious strokes. You feel almost possessed by the building pleasure (and consummately increasing pressure), forced past the point where you could stop if you wanted to. Now, the brake handle has snapped off, and you're on a one-way train to ecstasy.");
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
		else if(pc.cumQ() <= 200) output("flooding your cheeks with so much that you have to hurriedly gulp to keep it from leaking out your [pc.lips].");
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
		else if(pc.cumQ() <= 100) output("[pc.Cum] shoots out in thick ropes of creamy bliss, splattering across your [pc.fullChest] and [pc.belly] in such quantity that it would shame a human.");
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
	output(" Your [pc.legOrLegs] quiver");
	if(pc.legCount == 1) output("s");
	output(" and involuntarily thrust");
	if(pc.legCount == 1) output("s");
	output(" until you are spent, and then, you lie there, coated with your goo and grinning a sated smile.");
	if(pc.libido() <= 25) output("\n\nYou wipe up as best you can and gear up after a few minutes of rest, feeling like you can take on the world.");
	else if(pc.libido() <= 50) output("\n\nYou make a half-hearted attempt to wipe up before getting your gear back on and getting ready go back to exploring.");
	else if(pc.libido() <= 75) output("\n\nYou barely bother to clear your sexual juices from your body before getting dressed and getting back to exploring the universe for sexy aliens to fuck.");
	else output("\n\nYou get your gear back on without bothering to clean up. You're just going to find something to fuck anyway.");
	processTime(45 + rand(5));
	pc.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//*Tailingus
public function tailingusFapReqsCuntTail():void {
	clearOutput();
	output("Figuring that you may as well blow off some steam while you have time, you shuck out of your gear and arrange it in a nearby pile, careful with your possessions even though you’re planning on getting some lewd self-satisfaction in. Your [pc.tail] curls ");
	if(pc.isTaur()) output("up your back and shoulder to place itself against your [pc.chest]");
	else output("around your [pc.legOrLegs] and [pc.hips] to place itself against your [pc.belly] when you seat yourself");
	output(", nuzzling gently at your [pc.skinFurScales] as if to entice you to grab it. Pulses of pleasant, soothing warmth emanate from the appendage. The euphoria is almost addictive; perhaps you should hang onto this tail.");
	output("\n\nThe end of your [pc.tailCunt] dilates slightly and its clit engorges nicely into a visible nub. Your heart beats faster as barely-controlled sexual excitement wells up inside you, bringing a blush to your [pc.skin] as you admire the way your undulating opening leaks clear lubricants all over you. The trail of slime it leaves on your [pc.chest]");
	if(pc.biggestTitSize() >= 1) {
		output(", snaking through your bosom");
		if(pc.bRows() > 1) output("s");
		output(",");
	}
	output(" is just so... strange and erotic that you can’t help but giggle in anticipation, licking your lips and grabbing hold of your [pc.tail] with both hands to steady it.");
	
	output("\n\nYour slit wobbles unsteadily on its pillar of flesh, and you work your muscles to angle it more perfectly towards your other lips, the ones barely concealing your mischievous tongue. Guiding it a little closer, you breathe in its scent, admiring the almost sweet tang that your [pc.tailCunt] gives off. Unable and unwilling to restrain yourself, you dive into the picture-perfect pussy in front of you, letting the lubed-up clit bounce off your nose and mark your face with your own fragrant juices.");
	
	output("\n\nA shudder of involuntary pleasure works through your body, and you begin to cunnilingate yourself even more eagerly, attacking your pussy with your tongue. You lick with eager, unrestrained strokes, plunging deeply before circling around the outer lips. Sometimes, you break up the tempo by suckling the clit into your mouth and whimpering in bliss; the vibrations make the wondrous feelings that much more intense. A gush of girlish goo splatters into your mouth, and you drink it without complaint. You swoon and lick your labia as clean as you can, but your [pc.tailCunt] just keeps leaking, dripping all over your [pc.chest].");
	
	output("\n\nOne of your hands begins to caress the length of your [pc.tail], stroking the [pc.skin] like some kind of pretend phallus, but it feels good all the same. The pressure squeezes the internal walls together, sliding fold against fold and nerves and nerves. You jerk your tailcunt compulsively while you eat it out, soaking yourself as the desire for more and more pleasure overwhelms you. Soon you’re grunting like an animal in heat, pumping so fast your hand is a blur and cramming as much of your [pc.face] into your [pc.tailCunt] as you can.");
	
	output("\n\nThe orgasm is almost a surprise when it comes. Your eyes roll back halfway, buried under your drooping eyelids. Your hand strokes down powerfully, gripping the wriggling, spasmatic appendage it begins to gush waves of lady-spunk across your face and tongue. You swallow a few gulps before you lose control and it pulls back, gushing girl-goo across your [pc.chest], [pc.belly], and crotch.");
	if(pc.hasCock()) {
		output(" [pc.EachCock] spurts semen fitfully as it’s doused with cunt juice, getting off in pure sympathy. The stuff drizzles all over your [pc.legOrLegs], turning you into quite the mess.");
	}
	if(pc.hasVagina()) output(" At the same time, [pc.eachVagina] clenches and cums as well, hungrily fluttering and squeezing, aching for penetration.");
	
	output("\n\nYou flop down onto your back and pull the [pc.tailCunt] back onto your face, licking the last of your libertine secretions from the well-served orifice. You bet it will feel even better to feed it cum.... Where did that thought come from?");
	output("\n\nCleaning up as best you’re able, you get geared back up and ready to move, though you can’t seem to get the smell of pussy off your breath.");
	processTime(10+rand(15));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//*Cunt tail fap replacement B
//Not 4 Hoarses.
public function cuntTailFapScene():void {
	clearOutput();
	var x:int = pc.cockThatFits(pc.tailCuntCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	if(pc.cockTotal() > 1) {
		for(var z:int = 0; z < pc.cockTotal(); z++) {
			if(z != x) y = z;
		}
	}
	output("You figure that now is a good time to give into your erotic urges and shuck your gear, assembling it into a neat pile beside you. Your [pc.tail] slithers up over your shoulder almost of its own volition, clearly thirsting for a fresh dose of cum, and you intend to give it exactly what it deserves. Thickening nicely, [pc.eachCock] engorges to a hard and ready state. You idly fondle your tentacle-like tail, slipping a finger into its moist opening to test its readiness. It’s soaking wet, of course, and ready to fuck.");
	
	if(pc.cockTotal() > 1) output("\n\nSelecting [pc.oneCock]");
	else output("\n\nGrabbing your [pc.cock]");
	output(", you idly fondle yourself");
	if(pc.balls > 0) output(", playing your fingers across your [pc.balls] whenever you have a spare moment");
	output(", slowly enjoying the sensitivity of your skin. It pulses with ardor and thickens slightly, growing ever more tumescent thanks to your skilled fondles. You sigh and relax, leaning back while you pump a dollop of pre out from your " + pc.cockDescript(x) + ". It trickles down only to be caught by your fingers and turned into slippery lube. You stroke faster and faster, barely noticing as your [pc.tailCunt] moves downward, spattering its natural secretions across your lower body.");
	output("\n\nYour [pc.tail] slows as it nears your " + pc.cockDescript(x) + ". Slippery soft wetness envelops your " + pc.cockHead(x) + " a quarter of an inch at a time as it engulfs your boner, slurping down the drops of pre-cum you start leaking in response. Your tool is immersed in soft, slippery coils of flesh as the outside of your tail ripples and squirms around in ways that make you dizzy with lust.");
	
	//{One other dick}
	if(pc.cockTotal() == 2 && y != -1) 
	{
		output("\n\nLuckily, you have an extra " + pc.cockDescript(y) + " to handle while your tail works to coax your orgasm free");
		if(pc.balls > 0) output(" from your [pc.balls]");
		output(". The pleasure from your prehensile pussy increases in response to that thought, and you settle into stroking your spare dick, jacking yourself off with strokes that are perfectly timed to the slurping tempo next door. It’s soon dripping out as much pre-cum as your snatch-snared mast, and you smear the clear juice over yourself, masturbating with long, hot, wet strokes. You bite your lip and try to endure the pleasure, but it feels sooo good.");
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
	output("\n\nYour [pc.tailCunt] clamps down at your [pc.sheath " + x + "], and the rippling motions its squeezing innards make as they roll up intensify, coming faster and stronger before. The nub of your clit rubs against your pubic region when your beast-like tail wiggles around your " + pc.cockDescript(x) + " violently. It suctions harder and harder, pumping your prick up with fresh blood. Your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" twitching wildly from the pleasure, and you struggle to hold yourself still as a wave of excitement rises up in your middle.");
	if(pc.balls > 1) output(" Twitching against you, your [pc.balls] bounce in their [pc.sack] as they ready a deluge of liquid love.");
	else if(pc.balls == 1) output(" Twitching against you, your [pc.balls] bounces in its [pc.sack] as it readies a deluge of liquid love.");
	
	output("\n\nPleasure slams into your skull with cannon-like force, launched from your tail, straight up your spine, and into your brain where it shatters into a concussive explosion of ecstasy. Your abdominals clench with your orgasm and move your creamy payload towards its eventual terminus, causing warm pressure to build and then release. A huge rope of [pc.cum] launches from you, and at the same time you get to feel the wonderful, blissful experience of having your tail stuffed with a juicy, delicious payload. Each ejaculation causes it to suck harder and faster, dragging your orgasm on longer");
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
	pc.loadInCuntTail(pc);
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Gettin' Ready
public function milkturbation():void
{
	clearOutput();
	var milked:Boolean = false;
	author("Fenfen MilkCo.");
	//Passing time first for cheatsiedoodles.
	processTime(10+rand(5));
	//No top
	if(!pc.isChestGarbed())
	{
		output("Going around uncovered certainly makes it easier to get ahold of your ");
		if(pc.milkFullness >= 200) output("achy, leaking teats");
		else if(pc.milkFullness >= 150) output("[pc.milkNoun]-bloated teats");
		else if(pc.milkFullness >= 100) output("swollen nips");
		else if(pc.milkFullness >= 75) output("engorged tips");
		else if(pc.milkFullness < 25) output("sore nips");
		else output("[pc.nipples]");
		output(", something you're more than thankful for since you started lactating.");
	}
	//Clothed
	else
	{
		output("Modesty is all well and good, but it's a pain in the ass to strip out of your [pc.upperGarments] just to drain your ");
		if(pc.milkFullness >= 200) output("achy, leaking teats");
		else if(pc.milkFullness >= 150) output("[pc.milkNoun]-bloated teats");
		else if(pc.milkFullness >= 100) output("swollen nips");
		else if(pc.milkFullness >= 75) output("engorged tips");
		else if(pc.milkFullness < 25) output("sore nips");
		else output("[pc.nipples]");
		output(".");
	}
	//Merge
	if(currentLocation != "SHIP INTERIOR")
	{
		output(" Looking around to ");
		if(pc.libido() >= 75) output("make sure you've got an audience");
		else output("make sure no one is looking too closely");
	}
	else output(" Setting comfortably in a quiet corner");
	output(", you grab your [pc.chest] and squeeze, rubbing gently towards your [pc.nipples] to coax yourself into letting down. The lactating flesh feels wonderful in your hands, and you shudder with barely suppressed delight at how good it feels to get yourself ready.");

	//No Milk, Bra. Try but fail. Minor lust increase.
	if(!pc.isLactating() && pc.milkQ() < 200) 
	{
		output("\n\nYou work your chest with rhythmic, ");
		if(flags["TIMES_HAND_MILKED_SELF"] == undefined || flags["TIMES_HAND_MILKED_SELF"] < 4) output("almost ");
		output("practiced motions again and again, pinching your [pc.nipples] to try to squeeze out some [pc.milk]. However, all that you manage to do is make yourself irritated and sore. Whining in frustration, you tug harder at yourself, desperate to squeeze even a little bit of your [pc.cumColor] tit-cream out. It doesn't work though; you'll have to give your body time to build some up first.");
		pc.lust(5+rand(3));
		pc.boostLactation(1);
	}
	//Milk Success!
	//Look at all these bitchin' options
	else
	{
		milked = true;
		//Holy shit yer tits are full intro
		if(pc.milkFullness >= 125)
		{
			output("\n\n[pc.Milk] beads on your [pc.nippleColor] teats at the first touches, and just like that, your saturated bosom lets loose. An eager sigh slips through your [pc.lips] at the sudden release of pressure. You feel like a ");
			if(pc.totalBreasts() == 2) output("pair");
			else if(pc.totalBreasts() == 3) output("trio");
			else if(pc.totalBreasts() == 4) output("quartet");
			else output("army");
			output(" of soda bottles that have been shaken and had the caps unscrewed - so full of potential energy needing to leak and spray everywhere. That's precisely what you do: spray. Liberal amounts of [pc.milk] are rushing out in thin streams, but they're too fine to vent all of your pressure any time soon. You'll have to milk it all out by hand.");
		}
		//Fuck you needed some relief intro
		else if(pc.milkFullness >= 175)
		{
			output("\n\nIt does not take more than a second or two to make your [pc.nipples] shine with their own moisture, but you keep working yourself all the same. [pc.MilkColor] droplets hang from the tips of your tingling teats. You catch them in your palms and use them to lubricate your hands’ motions across your [pc.fullChest]. Soon, thin streams are spraying out even when you aren't squeezing. Your chest is clearly overdue for a good milking.");
		}
		//It was about time you tended to these tits intro
		else if(pc.milkFullness >= 90)
		{
			output("\n\nJudging by how full they feel, you've left them untended a little too long. It doesn't take long to tap the swollen milk-tanks; [pc.milk] bubbles out into a few pendulous droplets as you tug. You smear it over your [pc.nipples] as you work them, tugging and pulling until thin streams of [pc.milkColor] are arcing through the air with every movement of your hands. There's no disguising your sigh of relief or the mess you're starting to make now that you've gotten started.");
		}
		//Normal milking intro
		else if(pc.milkFullness >= 40)
		{
			output("\n\nPerhaps a minute passes; you can feel the liquid slowly moving inside of you, letting down towards your [pc.nipples]. You groan when the moisture hits your questing fingertips, lubricating their busy strokes across your bust. The [pc.milk] is soon leaking out enough to form droplets on the ends of your teats. You smile down at yourself, gloating over your own [pc.milkColor]-leaking chest as you get ready to drain your [pc.fullChest].");
		}
		//Gotta work pretty hard to start intro
		/*else {
			output("\n\nNo amount of tugging, squeezing, and pulling seems to be making any difference. You know you have some [pc.milk] inside you, not much but certainly enough to lactate. If only you could get it started! Groaning softly as your efforts turn your [pc.nipples], you keep at it with a persistence born of lactic desire. Dribbles of moisture trickle out eventually. To you, they're the texture of success, and you beam with enjoyment as you prepare to drain the rest.");
		}*/
		//Middle: Express a small amount of milk for a human
		if(pc.milkQ() < 300)
		{
			output("\n\nThe [pc.milk] comes out in slow dribbles and occasional squirts, running down your fingers to your knuckles before dripping off. Deciding to have a little fun with it, you start milking yourself more vigorously, spraying thin streams of the stuff this way and that, " + pc.mf("chuckling","giggling") + " in delight.");
			if(pc.biggestTitSize() >= 5) output(" You even lift a [pc.chest] to your [pc.lips] and suckle some of your bounty from the tap.");
			else output(" You find yourself wishing your [pc.chest] were big enough to bring to your [pc.lips]. You'd like a taste, however brief.");
		}
		//Middle: Express a normal amount of milk for a human
		else if(pc.milkQ() <= 1000)
		{
			output("\n\nThe [pc.milk] comes out in steady streams and squirts, running down your fingers ");
			if(pc.biggestTitSize() >= 1) output("and [pc.chest] ");
			output("before dripping off. There seems to be plenty of it there, enough to feed a baby for sure, and you tend to your dripping nipples with consistent, busy pressure, making [pc.milkColor] puddles form by your [pc.feet].");
			if(pc.biggestTitSize() >= 5) output(" You lift one to your [pc.lips] and drink deeply of your bounty. It floods your cheeks with its [pc.milkFlavor] flavor, and you greedily gulp it down.");
			else output(" You kind of wish you were big enough to drink it directly, just to sample it.");
		}
		//Middle: Express a large amount of milk for a human
		else if(pc.milkQ() <= 1600)
		{
			output("\n\nThe [pc.milk] comes out under your attentions in heavy drops and thick streams, splattering wetly on the floor with each exaggerated pump of your hands. It runs over your arms in thick streams. There's no way to avoid making a mess when you're producing this much, so you go with it, letting the [pc.milkColor] fluid run down your chest and [pc.belly]. Most terran mothers couldn't come anywhere close to your lactic prowess unaided.");
		}
		//Middle: Express milk like a cow (low)
		else if(pc.milkQ() <= 3000)
		{
			output("\n\nThe [pc.milk] forms into puddles between your [pc.feet] while you're still getting started, and as you settle into giving yourself a proper milking, they only get bigger. Streams of [pc.milkColor] spill down your forearms to your elbows before falling off in rivers. You groan in animal pleasure, unable to help yourself; there's just so much coming out of you, and it feels like such a relief. The human body wasn't made to gush like this, but isn't science wonderful?");
			if(pc.biggestTitSize() >= 5) output(" Grabbing a teat, you lift it to your [pc.lips] for a sample. The flow is strong enough to flood your cheeks in spite of your gluttonous swallowing. Eventually you have to let go. Streamers of [pc.milk] come out in a spray.");
			else output(" Wishing you could lift a teat to your mouth to sample from, you tug with wild abandon, squeezing heavier and heavier flows from your body.");
		}
		//Middle: Express milk like a fucking cow
		else if(pc.milkQ() <= 7000)
		{
			output("\n\nThe [pc.milk] almost immediately gathers into deep puddles around your [pc.feet] as you extract the wondrous fluid. Cows and cow-like creatures are your only competition when it comes to unbridled lactation, and even then, you're sure such base creatures could never appreciate the heavenly sensations of it rolling down the underside of your [pc.chest] and arms. ");
			if(pc.biggestTitSize() >= 5) output("Lifting one of your udders to your [pc.lips], you gleefully gulp the [pc.milkFlavor] liquid down. You let it fall away after a few swallows with a satisfied 'ahhh,' sating both your hunger and your need to empty your chest.");
			else output("Aiming down, you splatter more and more of your lactic cargo into the budding lake while wishing you could sample it yourself. If only your chest was bigger!");
		}
		//Middle: Express milk like a pent-up cow-girl
		else if(pc.milkQ() <= 10000)
		{
			output("\n\nThe [pc.milk] is expressed with blatantly super-human speed, puddling around your [pc.feet] with such speed that it splatters all over your [pc.legOrLegs]. The highly-modified indentured servant-girls of Venusia and their legendary milk-making capabilities would find themselves in a run for their money if pitted against you. As the fluid spills over your arms and [pc.fullChest] in small, frothy rivers, you realize that you could probably retire to such a life right now, if you wanted.");
			if(pc.biggestTitSize() >= 5) output(" You mull it over as you lift a heavy teat to your lips, inadvertently hosing yourself down while trying to seat your mouth, managing a tight seal just in time to receive a mouthful of [pc.milkFlavor] flavor. You guzzle for a little while to fill your belly and burp noisily when you finish, still pouring more into the lake.");
		}
		//Middle: Express milk like a milk machine in the cafeteria
		else if(pc.milkQ() <= 20000)
		{
			output("\n\nThe [pc.milk] sprays out like soda from a fountain, foaming from its own incredible pressure as it escapes you. You ");
			if(pc.legCount <= 1) output("shift position");
			else output("spread your [pc.legs]");
			output(" to stop the inevitable splatters from soaking your lower body as you express the stuff with machine-like efficiency, flooding the area with more [pc.milk] than an organic has any business creating. There's so much that you can't help but stifle a smile; there isn't a cow-girl or alien in the galaxy that could keep up with you.");
			if(pc.biggestTitSize() >= 5) output(" Lifting one weighty teat to your lips, you coat your chin and mouth immediately, getting a nice full draught of [pc.milkFlavor] to sample for your troubles.");
		}
		//Middle: Express milk like a someone in a furry's hyper story
		else if(pc.milkQ() <= 100000)
		{
			output("\n\nThe [pc.milk] gushes out of you in ");
			if(pc.totalNipples() == 2) output("twinned");
			else output("matched");
			output(" geysers, foaming and splattering from the liquid force, so powerful and yet so pleasant-feeling all at once. Holding onto your [pc.chest] for dear life, you give tentative, encouraging squeezes whenever your firehose-like lactation slows, instantly restarting the flagging [pc.milkColor] deluge. Your fingers sometimes find their way to your [pc.nipples] where they can playfully tug and caress the milk-slicked spouts, ignorant of the lake rising up around your [pc.legOrLegs]. Someone is going to have to clean all this up, but that's a problem for someone who isn't experiencing the incredible relief of squeezing out gallons of delicious [pc.milkNoun].");
		}
		//Middle: Express milk like you have debug mode on
		else
		{
			output("\n\nThe [pc.milk] explodes out of you like matter from a quasar, the overwhelming lactic mass practically a singularity of liquid fulfillment. You barely have to touch your [pc.chest] to keep it going once it starts. Your [pc.nipples] quiver and pulse as they disgorge the torrential [pc.milkColor] rivers. So much flows from you that you're soon lifted on a tide of your own making, floating in blissful relaxation while you shower yourself with even more, listening to the gentle patter of your rain impacting your new-born lake. Tugging nonstop, your fingers do their best to keep the milk eruptions going, or perhaps you're merely reveling in the sensation, stimulating yourself to a plateau of gushing bliss.");
		}
		//Orgasm Odds
		//10% per 400 mLs over 1L. So: 2L: 25%, 4L: 75%, etc
		var orgasmOdds:int = 0;
		if(pc.milkQ() >= 1000) orgasmOdds += (pc.milkQ() - 1000) / 40;
		if(pc.isTreated()) orgasmOdds = 100;
		var orgasmed:Boolean = (rand(100) + 1 <= orgasmOdds);
		//End: Didn't orgasm due to not enough milking (20% or less chance of orgasm)
		if(!orgasmed && orgasmOdds <= 20)
		{
			output("\n\nSlowing to a trickle as your supply exhausts itself, your " + possessive(pc.chestDesc()) + " flow finally gives up in spite of your relentless tugging. You've milked out as much as you can by hand, leaving yourself with sore, glossy nipples and a moistened front. Tending to such a sensitive area has left you with a certain residual warmth in your [pc.crotch]");
			pc.lust(10+rand(4));
			if(pc.lust() < pc.lustMax()) output(", but it's not unmanageable.");
			else {
				output(", and you're going to have to masturbate immediately if you want to have any chance of thinking straight in the near future.");
			}
		}
		//End: Got really close to orgasm but couldn't quite get there -> Immediately choose a random fap scene for next (had a chance above 20%)
		else if(orgasmOdds > 20 && !orgasmed)
		{
			output("\n\nMoaning as your flow gradually tapers off, your fingers go wild on your [pc.chest], tugging, squeezing, and pulling in an effort to take you to orgasm. Milking has felt so good, so wonderfully, sensuously swell, that you've let yourself grow aroused beyond reason. Your slick teats ache from the constant stimulation, but it's a wonderfully satisfying ache that sends tingles of ");
			if(pc.hasVagina()) output("crotch-dampening ");
			else if(pc.hasCock()) output("cock-thickening ");
			else if(pc.balls > 0) output("ball-teasing ");
			output("warmth to your most sensitive areas. You grind your [pc.hips] and cry out in need as the last droplets of [pc.milk], leaving you unfulfilled and delirious with need.");
			output("\n\n<b>You start masturbating before the thought even reaches your brain. You have to.</b>");
			pc.lust(9001);
		}
		//End: Minor orgasm all up in
		else if(pc.milkQ() <= 5000)
		{
			output("\n\nGroaning as the pleasure of it all wells up in your breast, you let your hands do as they will, mauling your [pc.chest] with eager squeezes, wringing every last drop of [pc.milk] out. Each tug on a sore teat is a percussive pleasure note against the backdrop of your chest's sensuous symphony, building inexorably towards what can only be a climax. You moan");
			if(pc.hasPerk("Ditz Speech") || pc.hasPerk("Brute Speech")) output(" brainlessly");
			output(" as the last few drops fall away, pinching harder, the pain and pleasure all mixing together to make you quiver with bliss. You sag back in the wake of it, a satisfied smile on your [pc.lips].");
		}
		//End: Mooing cow-gasm all up in
		//This one is for cow-girls. Requires boobs.
		else if(pc.race() == "cow")
		{
			output("\n\nMooing at the ecstatic release that only milking can provide, your body responds to the sensation of emptying its [pc.milk] reservoirs in the only way it knows: bombarding you with blissful tremors of bovine pleasure. You moo again, louder and firmer than the first time. The first time was an instinctual vocalization. This time, it's a intentional declaration of your very purpose. Your [pc.chest] and the pleasure are gifts given to you so that you can make as much [pc.milk] to share with the galaxy as possible. Your eyes roll back, ");
			if(pc.hasVagina())
			{
				output("your [pc.vaginas] gush");
				if(pc.totalVaginas() > 1) output("es");
				output(", ");
			}
			if(pc.hasCock())
			{
				output("your [pc.cocks] squirt");
				if(pc.cockTotal() > 1) output("s");
				output(", ");
			}
			output("your [pc.legOrLegs] quiver");
			if(pc.legCount == 1) output("s");
			output(", and your flow finally ends, leaving you messy but totally sated. You can't wait to lactate again.");
		}
		//End: Shuddering, milky messgasm - non-cow
		else
		{
			output("\n\nTwitching whenever your fingers pinch particularly aggressively, you feel the pleasure rising up in inverse proportion to the amount of [pc.milk] left inside you. You maul your own [pc.chest], panting, your eyes rolling back as the ecstasy overwhelms your consciousness.");
			if(pc.hasPerk("Ditz Speech")) output(" Airheaded giggles mix with your moans, declaring your status as a climax-addled milk-slut for the universe to see.");
			output(" The oiled slickness of your [pc.chest] makes your gropes all the more pleasant. Your misused nerves fire spasmodically, feeding your immense boobgasm until you're panting and gasping, your whole body shuddering in wild convulsions.");
			//Dick
			if(pc.hasCock())
			{
				output("\n\n[pc.Cum] sprays from your [pc.cocks] in lewd waves, unable to hold back with how good you're feeling. The hands-free ejaculation seems to keep going as long as you can keep your breasts cumming");
				if(pc.cumQ() <= 100) output(", though it rapidly diminishes to little more than dick-shakes and slow-leaking droplets.");
				else output(", spurting quite a bit of [pc.cum] everywhere.");
			}
			//Pussy
			if(pc.hasVagina())
			{
				output("\n\nDespite being entirely left out, your [pc.vaginas] reach");
				if(pc.vaginaTotal() == 1) output("es its");
				else output(" their");
				output(" own pleasure plateau. [pc.GirlCum] ");
				if(pc.isSquirter())
				{
					if(pc.lowerUndergarment.shortName != "") output("floods your " + pc.lowerUndergarment.longName + " with sticky love");
					else 
					{
						output("floods out of your uncovered entrance");
						if(pc.totalVaginas() > 1) output("s");
						output(", squirting sticky love into the air in glittering arcs");
					}
				}
				else 
				{
					if(pc.lowerUndergarment.shortName != "") output("soaks your " + pc.lowerUndergarment.longName + " with fragrant feminine love");
					else output("soaks your [pc.thighs] with your fragrant feminine love");	
				}
				output(". Your lower lips and [pc.clits] feel positively swollen as ");
				if(pc.totalVaginas() > 1) output("each of ");
				output("your canal");
				if(pc.totalVaginas() > 1) output("s");
				output(" squeezes around phantom intruders, climaxing back to back.");
			}
		}
		if(flags["TIMES_HAND_MILKED_SELF"] == undefined) flags["TIMES_HAND_MILKED_SELF"] = 0;
		flags["TIMES_HAND_MILKED_SELF"]++;
		if(orgasmed) pc.orgasm();
		pc.milked(pc.milkFullness);
	}
	//Force faps
	if(!orgasmed && milked && pc.lust() >= pc.lustMax())
	{
		clearMenu();
		addButton(0,"Next",masturbateMenu,true);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//JoyCo Magic-Milker 7
//Tooltip:
//"For expectant mammalian mothers or personal use. Please consult an expert in your species' physiology before inducing lactation."
//The JoyCo Magic Milker 7 looks like little more than an apple-sized sphere with an activation stud and two tiny, clear cups hanging off of metallic tubes. It seems that in order to use it, one nearly needs to hold it near exposed nipples and press the button. The machine will do the rest, even reshaping the cups to accommodate multiple nipples or revealing more in the case of particularly boobilicious users.
//Intro
public function joyCoMagicMilker7Sucks():void
{
	clearOutput();
	var milkProduced:Number = pc.milkQ();
	output("Grabbing the Magic-Milker 7, a product of JoyCo, in your hand, you can't help but marvel at the sleek, engineered surface. Two small, clear cups hang down from the glittering orb on umbilicals of polished metal, dangling limply, though you know they'll spring to life as soon as you push the button on the central ball.");
	//No Top
	if(!pc.isChestGarbed()) output("\n\nYour " + pc.allBreastsDescript() + " are already bare to the world, and your [pc.nipples] have grown hard and a little crinkly from the chill. You're not going to get any more ready for a quick, machine-assisted milking.");
	//Has Top
	else output("\n\nYou peel your [pc.upperGarments] away from your " + pc.allBreastsDescript() + " and shiver as your [pc.nipples] immediately perk up, crinkling in the chill air. There's nothing between you and a quick, machine-assisted milking now.");
	//Intro Pt II
	output("\n\nThe button audibly clicks under your thumb, and the miniaturized milker whirrs. Like someone waking from a long sleep, the machine's tubes writhe and lift, barely coordinated. After a few seconds of this, they lift the cups up before you.");
	if(pc.totalBreasts() > 2) output(" A hatch on the Magic-Milker's main body opens, and " + num2Text(pc.totalBreasts()-2) + " more milking cups emerge to compliment the original pair, one for every single one of your breasts.");
	output(" The ");
	if(pc.totalBreasts() > 2) output("many ");
	output("milkers arrange themselves so that they're hovering a scant few inches from your soon to be sucked nipples and pause as if considering their options or calculating something.");
	output("\n\nYou sigh in anticipatory boredom; nothing slows the passage of time like waiting for a pleasant activity. In this case, time seems to be slogging through molasses, though only a few seconds have passed. The Magic-Milker 7 activates just as you're inhaling a breath of fresh air, the cups snapping forward");
	if(pc.nipplesPerBreast > 1 || pc.nippleLength() > 1 || pc.nippleWidth() > 1.5) 
	{
		output(", expanding as they go to ");
		if(pc.nipplesPerBreast > 1) output("handle the multiple nipples your breasts house");
		else if(pc.nippleLength() > 1) output("handle the lengthy teats");
		else output("fat areolae");
	}
	output(". They feel warm and wet on your [pc.skinFurScales] hissing softly as they suck down against you, forming a perfect seal.");
	output("\n\nGasping, you let go of the machine and cup yourself, feeling your [pc.nipples] hardening from the gentle, almost imperceptible vacuum. It's enough to support the weight of the whirring device as it activates, but the spherical device is only getting started. Rising to a higher-pitched whine, the milker smoothly cranks the suction up until your [pc.nipples] start swelling, immensely hard");
	if(pc.canMilkSquirt()) output(" and already dripping [pc.milkNoun]");
	else if(pc.milkFullness >= 50) output(" and glossy with barely-leaking [pc.milkNoun]");
	output(".");
	if(pc.totalBreasts() > 2) output(" With all the tubes hanging off your front, you find yourself wondering if this is what a cow feels like.");
	output("\n\nThe pump pulls tighter and tighter until it hits some kind of predefined vacuum-ceiling. Then, it starts stuttering the tugs into a staccato rhythm designed to maximize lactic stimulation. ");
	//No new PG
	//Teats B' Dry Yo
	if(milkProduced < 100)
	{
		output("It makes your pumped-up teats tingle more than a little as it tries to pull the [pc.milk] out of you, but nothing is coming. You sit there squirming for at least fifteen minutes, [pc.nipples] sweating only the barest residue of [pc.milk] before you're forced to give up and press the deactivation button.");
		output("\n\nThe cups detach and shrink back to their passive size");
		if(pc.totalBreasts() > 2) output(", the extra arms withdrawing into the main chamber");
		output(", leaving your [pc.chest] bare and sore. A single, blue-tinged holographic display briefly emerges above the spent sphere. It reads:\n\n<b>0 mL.</b>");
		//Pass 20m + rand(5)
		processTime(20 + rand(5));
		//Raise lust by 10-15
		pc.lust(10+rand(5));
		//BoostLactation by a tiny amount.
		pc.boostLactation(1);
		//Nipples Enlarged
		if(pc.nippleWidthRatio < 2 && rand(5) == 0)
		{
			output("\n\n<b>All that nipple-work has left your areolae looking a little more prominent. They're wider for sure.</b>");
			pc.nippleWidthRatio += .1;
		}
		//Nipples Lengthened
		else if(pc.nippleLengthRatio < 3 && rand(3) == 0)
		{
			output("\n\n<b>Your [pc.nipples] remain a little longer after the ordeal. This gleaming breast-pump seems determined to give you cow teats.</b>");
			if(pc.nippleLengthRatio < 1) pc.nippleLengthRatio = 1;
			if(pc.nippleLengthRatio < 2) pc.nippleLengthRatio += .2;
			pc.nippleLengthRatio += .2;
		}
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	else
	{
		//Lactation Success: quantity low
		if(milkProduced < 300)
		{
			output("It makes your [pc.nipples] visibly swell and distend, quickly gaining a moist shine as your body begins to let down. Trickles of liquid leak out one lazy drop at a time, hanging on your engorged tips before falling into the cups to be whisked away by the machine.");
			output("\n\nSome of the harder tugs earn tiny sprays of [pc.milk], but the streams are thin and insubstantial. Your [pc.fullChest] just aren't very full right now, ");
			if(pc.biggestTitSize() >= 6) output("no matter how enormous they are or how they jiggle from the application of suction.");
			else output("perhaps if they were larger you could hold more.");
			output(" Still, it feels nice to be doing something, even if that something is leaning back and ensuring that every single drop of your body's [pc.milk]-supply is thoroughly extracted. A small [pc.milkColor] baggie dangles from the back of the Magic-Milker 7 to hold it all.");
			pc.lust(10);
		}
		//Lactation Success: quantity decent
		else if(milkProduced < 700)
		{
			output("It makes your [pc.nipples] swell with soon-to-be released [pc.milkNoun], turning shiny and glossy a second before they start drooling into the cups. Those trickles turn into a series of rapidly expressed droplets and occasional squirts.");
			output("\n\nYou sigh at the feeling of release and watch the cups fill with the sloshing liquid. It foams slightly before the motor pulls it down the silver tubes to the main sphere. There, it iss collected into a clear bag that dangles from the back of the device, turning [pc.milkColor] as it hangs against your [pc.belly], filling. You groan from the feeling of having your sensitive flesh so aggressively worked over and do the only thing you can in such a situation: enjoy every second of it.");
			pc.lust(25);
		}
		//Lactation Success: quantity good
		else if(milkProduced <= 1000)
		{
			output("It makes your [pc.nipples] swell up a moment before they finally let down, gushing steady streams of [pc.milk], filling the cups while leaking drops from the tips. The flow seems steady and reliable, above terran norms by a decent amount.");
			output("\n\nYou groan at the intensity of the sensations you're presented with, cupping your [pc.chest] behind the device and squeezing to coax out more, shuddering at each exquisite spurt of [pc.milk] only to have the next well up before you finish. Reveling in the act of giving and producing becomes your entire focus, and it subsumes you while the device whisks your body's juice away. On the rear of the milker, a [pc.milkColor] bag has emerged. It hangs against your [pc.belly], half full and only getting fuller.");
			if(pc.hasCock()) output(" Down south, [pc.oneCock] has risen up, throbbing with hot desire and pressing against the bag, pinning it to your body while it expands.");
			output(" You whimper and tremble. Being milked is too damned good.");
			pc.lust(50+rand(10));
		}
		//Lactation Success: quantity superhuman
		else if(milkProduced <= 4000)
		{
			output("It makes your [pc.nipples] swell obscenely just before they finally burst, spraying streams of [pc.milk] into the accommodating cups, flooding them in superhuman amounts of liquid. Honestly, it could cut the suction in half, and you would gush just as hard. Your [pc.chest] are better at giving than most charities.");
			output("\n\nYou can't stifle a " + pc.mf("groan","moan") + ", nor do you want to. You lean back, chest quivering, and give your full attention to the fluttering suckles of your [pc.nipples], rubbing along the undersides of your [pc.chest] to encourage the fluid-filled organs to release even more. Sharp tingles of sensation rise up with every staccato suck, and even when they relax, your [pc.nipples] thrum with tingles of titty-pleasing pleasure. If everyone in the galaxy knew how good they can feel, you're certain you'd be surrounded in mooing milkmaids in no time.");
			output("\n\nWatching the [pc.milkColor] fluid vanish into the silvery tubes, you marvel at the engineering might displayed by the Magic-Milker. Someone at JoyCo did their job very - you gasp at a particularly potent surge of ecstasy - very right. A heavy, [pc.milkNoun]-filled bag has fallen out of the far side of the device to rest against your [pc.belly], and it's rapidly filling with the [pc.milk] you're producing.");
			if(pc.hasVagina() || pc.hasCock()) 
			{
				output(" You barely notice ");
				if(pc.hasVagina())
				{
					output("the [pc.girlCum] dripping from ");
					if(pc.legCount == 1) output("above your [pc.leg]");
					else output("between your [pc.legs]");
					if(pc.hasCock()) output(" or ");
				}
				if(pc.hasCock())
				{
					output("the turgid stiff");
					if(pc.cockTotal() > 1) output("ies");
					output(" pressing up against the underside of the bag, pulsating as ");
					if(pc.cockTotal() == 1) output("it's");
					else output("they're");
					output(" wreathed in barely-contained [pc.milk]");
				}
				output(".");
			}
			pc.lust(100);
		}
		//Lactation Success: quantity good for everybody else
		else
		{
			output("It makes your [pc.nipples] nearly double in size before they gush out [pc.milk] like fire hoses, spraying against the inside of the cups with enough force to nearly pop them off. The durable little milker hangs on for dear life in spite of your torrential lactation.");
			output("\n\nThere's no way to describe the pleasure and relief that expressing so much [pc.milk] gives you. Instead, you slump down to the ground and moan, writhing in place, your hands feverishly groping and squeezing encouragingly at your [pc.chest]. The gurgling sounds the Magic-Milker makes as it works are drowned out by your own vocalizations of pleasure, and your eyes roll back from bliss, not bothering to watch the [pc.milkColor] fluid drain away into a bag on the back-end of the device. Shocks of ecstatic pleasure jostle and jiggle your leaking teats as you stagger through one boobquaking orgasm after another, leaving your head fuzzy with pleasure-static and thoughts of giving your [pc.milk] again and again.");
			pc.orgasm();
			pc.orgasm();
			pc.orgasm();
		}
		//Bag Pops Cause Yer Hyper Milky
		if(milkProduced >= 3000)
		{
			output("\n\nThe plastic bag expands and expands... and expands, every wrinkle on its surface vanishing while it's pulled tight by the voluminous fluid inside. It audibly creaks, and for a second, you think it's going to pop. Then, it springs a leak in the corner, gushing [pc.milk] out onto the ground. That leak is rapidly joined by another in the opposite corner, and then the whole bottom of the bag gives out, soaking you from the waist down in your own [pc.milkColor] liquid.");
			output("\n\nOf course, the pump keeps going on as if nothing happened, and you're too into it to mind a little mess.");
		}
		//Liter readout for cool kids that don't look at explosions.
		output("\n\nThe Magic-Milker 7 tugs your teats until they're inflamed and sore. Every single drop that you have to give has been taken");
		if(milkProduced < 3000) output(" and bagged.");
		else output(", bagged, and spilled.");
		output(" Detecting this, it turns off and withdraws the cup-tipped arms from your [pc.fullChest]. A blue-tinged holographic appears above the orb, reading:\n\n<b>" + Math.round(milkProduced) + " mLs.</b>");
		//Nipples Enlarged
		if(pc.nippleWidthRatio < 2 && rand(5) == 0)
		{
			output("\n\n<b>All that nipple-work has left your areolae looking a little more prominent. They're wider for sure.</b>");
			pc.nippleWidthRatio += .1;
		}
		//Nipples Lengthened
		else if(pc.nippleLengthRatio < 3 && rand(3) == 0)
		{
			output("\n\n<b>Your [pc.nipples] remain a little longer after the ordeal. This gleaming breast-pump seems determined to give you cow teats.</b>");
			if(pc.nippleLengthRatio < 1) pc.nippleLengthRatio = 1;
			if(pc.nippleLengthRatio < 2) pc.nippleLengthRatio += .2;
			pc.nippleLengthRatio += .2;
		}
		//Get Milk Item
		if(milkProduced < 3000)
		{
			var foundLootItems:Array = new Array();
			foundLootItems[foundLootItems.length] = new MilkBag();
			output("\n\nThe bag seals off, leaving you with a ");
			if(milkProduced < 700) 
			{
				output("small");
				foundLootItems[0].longName = "small bag of " + pc.fluidNoun(pc.milkType);
				foundLootItems[0].basePrice = 2;
				foundLootItems[0].tooltip += "\n\n<b>Fullness:</b> Not Very Full";
			}
			else if(milkProduced <= 1400) 
			{
				output("medium");
				foundLootItems[0].longName = "medium bag of " + pc.fluidNoun(pc.milkType);
				foundLootItems[0].basePrice = 4;
				foundLootItems[0].tooltip += "\n\n<b>Fullness:</b> Somewhat Full";
			}
			else if(milkProduced <= 2100) 
			{
				output("large");
				foundLootItems[0].longName = "large bag of " + pc.fluidNoun(pc.milkType);
				foundLootItems[0].basePrice = 6;
				foundLootItems[0].tooltip += "\n\n<b>Fullness:</b> Mostly Full";
			}
			else 
			{
				output("dangerously full");
				foundLootItems[0].longName = "dangerously full bag of " + pc.fluidNoun(pc.milkType);
				foundLootItems[0].tooltip += "\n\n<b>Fullness:</b> Dangerously Full";
				foundLootItems[0].basePrice = 10;
			}
			foundLootItems[0].description = "a " + foundLootItems[0].longName;
			output(" bag of [pc.milk].  ");
			//Milk items probably just good for selling. Value relatively low for normal milk but honey is worth 2x milk, and maybe other more exotic lactations could also get value boosts?
			//Set value and adjust descs
			if(pc.milkType == GLOBAL.FLUID_TYPE_HONEY)
			{
				foundLootItems[0].basePrice *= 2;
			}
			itemScreen = mainGameMenu;
			lootScreen = mainGameMenu;
			useItemFunction = mainGameMenu;
			//Start loot
			itemCollect(foundLootItems);
		}
		else {
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		pc.milked(pc.milkFullness);
		processTime(20+rand(5));
	}
}


public function removeBoobswellPads():void
{
	clearOutput();
	author("Fenoxo");
	pc.removeStatusEffect("Boobswell Pads");
	output("You peel the pads off your chest and breathe a sigh of relief now that the constant moisture and vibration is no longer rubbing at your [pc.nipples].\n\n<b>The boobswell pads shut down, their use expended.</b>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function wutwutindabuttbuttFap():void
{
	clearOutput();
	author("Couch/Gedan");

// {Clothes:
	if (!pc.isNude())
	{
		output("Your gear quickly finds itself thrown into an assorted pile of all manner of equipment, item after item being discarded to a soundtrack comprising of clattering metal and hollow thunks;");
		if (pc.hasArmor())
		{
			output(" your [pc.armor] finds itself added to the pile at a rapid pace");
			if (pc.hasLowerGarment() || pc.hasUpperGarment()) output(", closely followed by");
		} 
		if (pc.hasUpperGarment()) output(" your [pc.upperUndergarment]");
		if (pc.hasUpperGarment() && pc.hasLowerGarment()) output(" and");
		if (pc.hasLowerGarment()) output(" your [pc.lowerUndergarment]");
		if (!pc.hasArmor())
		{
			output(" quickly find");
			if (pc.hasUpperGarment() && pc.hasLowerGarment()) output(" themselves");
			else output(" itself");
			output(" added to the pile")
		}
		output(".");

		output("\n\nFreshly free from the confines of your clothes, y");
	}
	else
	{
		output("A quick fiddle with your [pc.gear], and a muted clatter soon follows as it finds itself hastily discarded. Finally you're free to truly enjoy being nude; not a single scrap of material clinging to your frame. No unsightly claps, no constricting holsters... freedom.");

		output("\n\nY");
	}

	if (pc.hasCock() && !pc.hasVagina())
	{
		output("our gaze wanders over [pc.eachCock]. You idly give [pc.oneCock] a teasing tug with one of your hands,");
	}
	else if (pc.hasVagina() && !pc.hasCock())
	{
		output("ou can feel [pc.eachVagina] wet and ready for something to pound");
		if (pc.vaginas.length == 1) output(" it");
		else output(" them");
		output(". You idly give [pc.oneVagina] a tantilizing stroke,");
	}
	else if (pc.hasCock() && pc.hasVagina())
	{
		output("our gaze wanders over your [pc.cocks] as a trickle of arousal meanders down the inside of your thigh, only serving to remind you that there's no shortage of choices to be made when it comes to relieving a little... tension.... You give [pc.oneCock] a teasing tug with one hand and [pc.oneVagina] a tantalizing stroke with the other,");
	}
	else
	{
		output("ou briefly rub your hand over the smooth and featureless mound between your [pc.thighs].");
	}
	
	if (pc.hasCock() || pc.hasVagina())
	{
		output(" but there's an itch that's been bothering you for the last few hours, and it's time to take care of it.");
	}

	output("\n\nYou draw your hands away from");
	if (pc.hasCock()) output(" your half-rigid cock");
	if (pc.cocks.length > 1) output("s");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina())
	{
		output(" your");
		if (pc.wettestVaginalWetness() <= 2) output(" damp");
		else if (pc.wettestVaginalWetness() <= 4) output(" sodden");
		else output(" drooling");
		output(" cunt");
		if (pc.vaginas.length > 1) output("s");
	}
	if (!pc.hasCock() && !pc.hasVagina()) output(" your groin");
	output(" and move them behind you, your digits nestling themselves between your [pc.butts].");

	//{pc.ass.looseness() <= 3
	if (pc.ass.looseness() <= 2)
	{
		output("\n\nOwing to your lack of");
		if (silly) output(" butt-stuff");
		else output(" anal");
		output(" experience,"); 

		if (pc.hasVagina())
		{
			output(" you take advantage of your [pc.vagina " + pc.highestWetnessIndex() + "] and coat your fingers with a");
			if (pc.wettestVaginalWetness() >= 3) output(" liberal");
			output(" quantity of [pc.girlCum]; you have a feeling you'll need all the help you can get.");
		}
		else if (pc.hasCock())
		{
			output(" you take advantage of your [pc.cock] and trail your fingers lazily along its length; scooping up some of the [pc.cumColor] pre-cum drooling from its [pc.cockHead].")
		}
		else
		{
			output(" you divert one of your hands to your mouth and take a moment to");
			if (pc.ass.looseness() <= 1) output(" liberally");
			output(" slaver a finger with spittle; you have a feeling you'll need all the help you can get.");
		}

		if (pc.ass.looseness() <= 1)
		{
			output("\n\nProperly prepared, you use a solitary, lubricated finger to gingerly ply at the ring of your [pc.asshole], encountering plenty of resistance in the process.");
		}
		else
		{
			output("\n\nProperly prepared, you gently prod at your [pc.asshole] with your lubricated fingers, gently easing the tips past the tight ring.");
		}
	}
	else if (pc.ass.looseness() <= 4)
	{
		output("\n\nYour fingers tease at your [pc.asshole], slipping inside your cock-hungry ass with little effort.");
	}
	else
	{
		output("\n\nYour fingers poke at your [pc.asshole], swallowed whole in short order by your well-trained and cock-famished ass. You could probably slip your whole hand in without much effort....");
	}

	output("\n\nYou've soon");
	if (pc.ass.looseness() <= 2) output(" worked");
	else output(" slipped");
	output(" your finger");
	if (pc.ass.looseness() > 1) output("s");
	output(" in all the way, the bulk of your palm now stopping any further progress as you start to wriggle the invading digit");
	if (pc.ass.looseness() > 1) output("s");
	output(" around inside your [pc.asshole]");
	if (pc.hasCock())
	{
		output(", searching for the bump of your prostate. With a little stretch from");
		if (pc.ass.looseness() > 1) output(" one of");
		output(" your finger");
		if (pc.ass.looseness() > 1) output("s");
		output(", you find your target and tease out a fresh dollop of precum from the tip of [pc.eachCock]");
	}
	output(".");
	if (pc.hasVagina())
	{
		output(" [pc.GirlCum] dribbles freely from [pc.eachVagina],");
		if (pc.vaginas.length > 1) output(" each of them");
		output(" clenching as if wrapped around");
		if (pc.vaginas.length == 1) output(" a");
		output(" phantom cock");
		if (pc.vaginas.length > 1) output("s");
		output(".");
	}

	if (pc.biggestTitSize() >= 1)
	{
		output("\n\nYour free hand slips up to your [pc.fullChest], grabbing hold of one of your breasts and squeezing in time to the fingering of your ass.");
		if (pc.isLactating())
		{
			output(" A dribble of [pc.milk] escapes from your [pc.nipple]; a sight that only spurs you to lick your lips and pull your tit toward your mouth for a quick taste.");
			if (pc.milkQ() >= 500) output(" Soon you're suckling greedily from your [pc.nippleColor] teat, gulping down mouthful after mouthful of [pc.milkNoun].");
		}
		else if (pc.biggestTitSize() <= 3)
		{
			output(" Your tits are just the right size for one hand; perfect for groping and squeezing whilst you play with your [pc.asshole].");
		}
		else if (pc.biggestTitSize() > 3)
		{
			output(" Working your finger deeply into your ass has your whole body twisting and writhing in just the right way to make your tits jiggle and quake, every muscle, every inch of skin touched by the building pleasure.");
		}
	}

	output("\n\nYou moan");
	if (pc.isLactating() && pc.milkQ() >= 500) output(", muffled as you are with a mouthful of your own tit,");
	output(" as your pleasure builds. Your [pc.hips] involuntarily twist back and forth as you drive your finger");
	if (pc.ass.looseness() > 3) output("s");
	output(" with increasing fervor into your [pc.asshole], trying to inch");
	if (pc.ass.looseness() > 3) output(" them");
	else output(" it");
	output(" just a little bit deeper.");
	if (pc.hasCock()) output(" Precum dribbles from [pc.eachCockHead], a stream that gets thicker every time you brush against the sensitive bulb of your prostate.");
	if (pc.hasVagina())
	{
		output(" You can feel [pc.eachVagina] squeezing even harder, milking");
		if (pc.vaginas.length == 1) output(" a phantom cock for all it’s worth");
		else if (pc.vaginas.length > 1) output(" those phantom cocks for all they’re worth");
		output(" and drenching your wrist in [pc.girlCum].");
	}
	output(" You can almost taste the release just over the horizon, and you make one final push to drive yourself over the edge.");

	output("\n\nWith one final wiggling thrust it finally hits, and you");
	if (pc.isLactating() && pc.milkQ() >= 500) output(" let your breast fall from your mouth as a scream of ecstasy rips itself from your throat");
	else output(" scream in ecstasy");
	output(". Your [pc.legOrLegs] lash");
	if(pc.legCount == 1) output("es");
	output(" out uncontrollably as a bolt of pleasure wracks your body, every muscle convulsing in shared bliss."); 
	if (pc.hasCock())
	{
		output(" All that attention to your prostate triggers [pc.eachCock] to usher forth their own proof of your pleasure,");
		if (pc.cumQ() < 20)
		{ 
			output(" though only a single weak spurt of [pc.cumNoun] escapes [pc.eachCockHead]");
		}
		else if (pc.cumQ() <= 100)
		{
			output(" a few weak spurts of [pc.cumNoun] spray from [pc.eachCockHead] to run down the sides of your dick");
			if (pc.cocks.length > 1) output("s");
		}
		else if (pc.cumQ() <= 1000)
		{
			output(" [pc.cumNoun] spurting freely from [pc.eachCockHead] to splatter across your abdomen");
		}
		else if (pc.cumQ() <= 2500)
		{
			output(" thick sprays of [pc.cumNoun] geysering from [pc.eachCockHead]");
		}
		else
		{
			output(" covering you in the flood of [pc.cumNoun] that sprays from [pc.eachCockHead] as you laugh in delight at your astounding, inhuman volume");
		}
		output(".");
	}
	if (pc.hasVagina())
	{
		output(" [pc.EachVagina] gushes with [pc.girlCum] that slathers your thighs");
		if (pc.hasCock() && pc.cumQ() > 100) output(", adding to the fluids already covering your body");
		output("."); 
	}
	if (pc.hasTailCock())
	{
		output(" A spray of [pc.cum] issues from the tip of your tail-mounted dick, angled to shoot all over your");
		if (pc.isLactating() && pc.milkQ() >= 500) output(" [pc.milkNoun]-covered");
		output(" [pc.chest].");
	}
	if (pc.hasTailCunt())
	{
		output(" Your parasitic tail-cunt lets out its own squirt of feminine juices, wishing it was dousing a real dick with its [pc.girlCum].");
	}
	if (!pc.hasCock() && !pc.hasVagina() && !pc.hasTailCock() && !pc.hasTailCunt())
	{
		output(" Without any sexual organs you don’t really orgasm, but you feel a sensation of release wash over your body as if you had.");
	}

	output("\n\nYou’re left awash in thoughts of pure, base pleasure");
	if ((pc.hasCock() && pc.cumQ() >= 2500) || (pc.isLactating() && pc.milkQ() >= 500))
	{
		output("... not to mention");
		if (pc.hasCock() && pc.cumQ() >= 2500) output(" cum");
		if ((pc.hasCock() && pc.cumQ() >= 2500) && (pc.isLactating() && pc.milkQ() >= 500)) output(" and");
		if ((pc.isLactating() && pc.milkQ() >= 500)) output(" milk");
	}
	output(".");

	output("\n\nIt’s a good while before your senses return to you, with your lusts, and your ass, sated.  For the moment at least.");

	processTime(20);

	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function gooDickFap():void
{
	clearOutput();
	author("Savin");
	
	output("You pat your own goo-coated backside and ask [goo.name] if she’s up for a little fun. Wordlessly, the goo surrounding you squirms and writhes across your [pc.skinFurScales], caressing your [pc.nipples] and [pc.crotch] in ways that make your [pc.knees] tremble.");
	if (!(pc.lowerUndergarment is EmptySlot) || !(pc.upperUndergarment is EmptySlot))
	{
		output(" Tendrils of goo peel off your");
		if (!(pc.lowerUndergarment is EmptySlot)) output(" [pc.lowerGarment]");
		if (!(pc.lowerUndergarment is EmptySlot) && !(pc.upperUndergarment is EmptySlot)) output(" and");
		if (!(pc.upperUndergarment is EmptySlot)) output(" [pc.upperGarment]");
		output(", taking time to");
		if (pc.hasCock() || pc.hasVagina())
		{
			if (pc.hasCock()) output(" envelop your [pc.cocks]");
			if (pc.hasCock() && pc.hasVagina()) output(" and");
			if (pc.hasVagina()) output(" tease the bud of your [pc.clit]");
		}
		else
		{
			output(" tease the pliant flesh of your asshole")
		}
	}
	else
	{
		output(" [goo.name] takes the time to");
		if (pc.hasCock() || pc.hasVagina())
		{
			if (pc.hasCock()) output(" envelop your [pc.cocks]");
			if (pc.hasVagina() && pc.hasCock()) output(" and");
			if (pc.hasVagina()) output(" tease the bud of your [pc.clit]");
		}
		else
		{
			output(" tease the pliant flesh of your asshole")
		}
	}
	output(", making you gasp and groan with pleasure. You shimmy down onto the ground, getting comfortable as [goo.name] massages you all over. You feel a slight pressure on your [pc.lips], and notice goo congregating around your mouth. She slips right between your lips and floods your mouth. You don’t have a choice in the matter, but have your mouth forced open as [goo.name] forms herself a big, thick cock for you to suck on. You give the playful goo-girl what she wants, and are instantly rewarded by a squirming all across your body as she clearly enjoys your gentle suckling. The goo-cock even starts to thrust before long!");
	
	output("\n\nBehind you, the gooey bodysuit shifts, and suddenly you feel a harsh <i>smack</i> right on your [pc.butt]. You yelp, but find your voice utterly muffled by the goo shoved in your gob. Looking back, you see that most of [goo.name] has sloughed off of you, forming a half-person shape behind you with her hand raised up to smack your ass. You take it, moaning as she playfully abuses your backside.");
	
	output("\n\n<i>“Like it when I’m rough?”</i> she teases, slipping a few fingers between your [pc.legs]");
	if (pc.hasVagina()) output(" and into your [pc.cunt]");
	else if (pc.hasCock()) output(" and wrap them around your half-hard [pc.cockBiggest]");
	if (pc.hasVagina() || pc.hasCock()) output(" and starts to tease her fingertips around your [pc.asshole], just short of penetration");
	else output(" and starts to probe around your [pc.asshole], just short of penetration");
	output(". Now that’s more like it... you push back against her hand, cooing as her long, wet digits explore your");
	if (pc.hasVagina() || pc.hasCock()) output(" sex");
	if (pc.hasVagina() && pc.hasCock()) output("es");
	if (!pc.hasVagina() && !pc.hasCock()) output(" ass");
	output(". <i>“You totally do, dontcha?”</i>");
	
	output("\n\nYou wink at her, wrapping your [pc.tongue] around her gooey prick. Her body quivers in delight, and");
	if (pc.hasVagina()) output(" fingers reach deeper into you - far deeper than a human ever could, probing to the depths of your womb and back again, finding every sensitive spot along your inner walls and giving them just enough attention to make you squeal.");
	if (pc.hasCock() && !pc.hasVagina()) output(" s");
	if (pc.hasCock() && pc.hasVagina()) output(" S"); 
	if (pc.hasCock()) output("he starts to pump your shaft, wrapping your wang in a silken cocksheath of goo that squirms and writhes around your length.");
	output(" The finger pressing against your [pc.asshole] finally pops in, flooding into your bowels in a wave of cold wetness that has you moaning like a whore and arching your back against the gooey babe. The gooey anal-probe quickly expands once its secured a beach-head in your backside, stretching you wonderfully wide and filling you with so much of her chilly goo.");
	
	output("\n\nThe fingers lodged in your");
	if (pc.hasVagina()) output(" cunt and");
	output(" ass");
	output(" begin to expand and change shape, merging together into a");
	if (!pc.hasVagina()) output(" big, thick cock");
	else output(" pair of big, thick cocks");
	output(" to fuck you with. Your eyes go wide, mouth twisting into a silent scream of ecstasy, feeling the cock");
	if (pc.hasVagina()) output("s");
	output(" swelling up inside your straining hole");
	if (pc.hasVagina()) output("s");
	output(".");
	
	var tLooseness:Number;

	if (pc.hasVagina()) tLooseness = pc.gapestVaginaLooseness();
	if (pc.ass.looseness() > tLooseness) tLooseness = pc.ass.looseness();

	output("\n\n<i>“Mmm, you’re");
	if (tLooseness >= 4) output(" nice and loose for me!”</i> [goo.name] giggles, shifting her goo like a hand caressing your asscheeks. <i>“Been finding some big, fat cocks to sit on? Or are you just loosening up until I can fit, like, all the way inside you?”</i>");
	else if (tLooseness <= 1) output(" sooooo, like, tight and squeezy!”</i> the goo giggles, pumping her slick hips against your [pc.butt]. <i>“We’re gonna have to loosen you up a little!”</i>");
	else
	{
		output(" all kinds of amazing back here!”</i> [goo.name] grins, wiggling her dick");
		if (pc.hasVagina()) output("s");
		output(" inside you. <i>“Tight enough to be super squeezy, but loose enough to ram sooooo much in you!”</i>");
	}
	
	output("\n\n[goo.name] sure seems to be enjoying herself... as are you. The feeling of that much goo straining your body, opening you wide to her advances, keeps you gridlocked in moans and cries of desperate pleasure. Her facsimilie hips buck against your ass, pounding her swollen dick");
	if (pc.hasVagina()) output("s");
	output(" deeper and harder into you.");
	if (pc.hairLength >= 3) output(" Seeing you looking, [goo.name] grins and pulls your hair, making your back arch low to the ground.");
	output(" Now that’s the stuff...");
	
	output("\n\n<i>“Are you gonna cum for me?”</i> [goo.name] asks, slamming herself in to the hilt - and filling you with goo until your gut seems to grow like it’s");
	if (pc.isPregnant()) output(" even more");
	output(" pregnant. <i>“You totally are! Come on and");
	if (pc.hasCock()) output(" blow your load all over me!");
	else if (pc.hasVagina()) output(" squirt those pussyjuices all over me!");
	else output(" cum already!");
	output(" I am sooo ready for a snack.”</i>");
	
	output("\n\nThe way she’s treating you, the poor goo must be starving for ");
	if (!pc.hasCock()) output("fem-");
	output("cum!");
	
	output("\n\n[goo.name] leans forward, squeezing her big, squishy tits against your back and wrapping her arms around your [pc.chest] and holding you tight... and putting her in a better position to rapid-fire hammer your ass");
	if (pc.hasVagina()) output(" and pussy");
	output(", pounding you with fast, hard strokes. The gooey prick in your mouth begins to throb and sputter, drooling grey faux-spunk onto your [pc.tongue] in simulated orgasm - [goo.name]’s really going all out to give you the complete fucked-into-submission experience!");
	
	output("\n\nYou groan appreciatively around her twitching goo-cock, feeling your body approaching climax. With a final cry, surrendering to the pleasure, your [pc.asshole]");
	if (pc.hasVagina()) output(" and cunt");
	output(" contract");
	if (!pc.hasVagina()) output("s");
	output(" around [goo.name]’s gooey cock");
	if (pc.hasVagina()) output("s");
	if (pc.hasCock())
	{
		output(", and your [pc.cocks] erupt");
		if (pc.cocks.length == 1) output("s");
		output(" in a geyser of jizz within");
		if (pc.cocks.length == 1) output(" its");
		else output(" their");
		output(" gooy confines.");
	}
	output(" Your eyes cross, body going limp as you’re fucked hard, filled with gooey jizz and forced to reciprocate in kind");
	if (pc.hasCock() && pc.hasVagina()) output(", feeding your amorous goo-girl with your ejaculate");
	output(".");
	
	output("\n\nBy the time she’s done with you, you’re nothing but an insensate mess on the ground, squirming and twitching as [goo.name] pounds you raw, screaming triumphantly as she brings you to climax.");
	
	output("\n\n<i>“Whoo! That was awesome!”</i> [goo.name] cheers, sliding out of you - and almost making you cum again from the sheer, alien pleasure of it. <i>“You are </i>such<i> a great fuck, [pc.name]! We gotta do this again and again and again!”</i>");
	
	output("\n\nYou might need to catch your breath first...");

	processTime(20);

	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function grayGooCockSleeve():void
{
	clearOutput();
	author("Savin");

	output("You reach down to your pent-up [pc.cock] and give yourself a stroke through the gooey coating hugging your body. Grinning, you ask [goo.name] if she’s up for a little fun.");
	
	output("\n\nThe answer comes as a squirming, writhing sensation of cool, wet goo around your [pc.cock]. You suck in a sharp breath, almost collapsing as your gooey bodysuit gives her response. When you hobble a little nearer to the ground, some of the goo starts to drain off of your upper body, splattering to the ground and congealing into a humanoid shape. [goo.name]’s face forms, overtop a pair of gigantic tits that would make a New Texan porn-star jealous, and wraps her hands around them with a couple of inviting pats.");
	
	output("\n\n<i>“I thought you’d never ask!”</i> [goo.name] giggles, jiggling her goopy tits at you. <i>“");
	if (flags["GOOARMOR_SLEEVE_FUCK"] != undefined) output("Well, again, anyway. ");
	output("I just knew you’d wanna play with my big ol’ tits! C’mon and put that [pc.cock] of yours right between ‘em and gimme some cum!”</i>");
	
	output("\n\nConsidering she’s already got your prick wrapped up in squirming goo, that seems like an odd request. Still, you start to move your [pc.hips] towards the wide, deep cleavage between [goo.name]’s tits and find that the gray sheathe around your [pc.cock] moves with you, running like cool lube around your schlong all the way. [goo.name] giggles as your dick slips in between her jiggling boobs, sill encased in goo that blends seamlessly into [goo.name]’s chest. It looks like you’ve got a wet little goo-pussy open between her tits, ready for you to fuck. You slide in deeper, hips thrusting your prick down into her welcoming torso, and she giggles and wraps her tremendous tits around your shaft as you go, all the better to enhance your pleasure.");
	
	output("\n\nYou start to fuck the gooey cock-sleeve, hammering your [pc.hips] into [goo.name]’s cleavage. <i>“Ooh, yeah, fuck me </i>rough<i>!”</i> she cheers, clapping her hands together - which just makes a wet patting sound. [goo.name] gives you a toothy smile and wiggles her bubbly assets, making the goo encasing your dick slosh around. Fucking goo never gets old, such a strange and alien sensation, like thrusting into a sea of lube that’s just tight enough to try and milk the cum out of you.");
	
	output("\n\nWhile you’re busy fucking the hole between [goo.name]’s tits, the goo still hugging tight to your lower body shifts and squirms. You start to feel a very slight pressure welling up against your [pc.asshole], and your eyes quickly good wide. [goo.name] gives you a cheeky grin, moving her tits faster around your shaft as the pressure grows more and more urgent against your backside.");

	clearMenu();
	addButton(0, "Allow It", grayGooCockSleeveII, true);
	addButton(1, "Deny Her", grayGooCockSleeveII, false);
}

public function grayGooCockSleeveII(allowIt:Boolean = false):void
{
	clearOutput();
	author("Savin");

	if (allowIt)
	{
		output("With a gasp, you feel the slender tendril of goo slip inside you. [goo.name] keeps it short and small, focusing more on control that just filling you with goo-cock. She hones in on the tiny little bulb of your prostate with unerring accuracy, putting just enough pressure on it to make your [pc.cock] leap and start to leak. The moment a drop of pre-cum pours into her, your gooey companion coos happily, licking her lips hungrily.");
	}
	else
	{
		output("You give [goo.name] a very stern look and tell her to <i>“Stop that!”</i>");
		
		output("\n\n<i>“Aww!”</i> she groans, easing the pressure off your behind. <i>“I guess I’ll just have to work harder on that [pc.cock] of yours!”</i>");
		
		output("\n\nAnd does she ever. Her tits start flying around your shaft, and her whole chest contorts around your thrusting cock. She’s like a vacuum sucking on you, ready to drain every drop from your [pc.balls]. It doesn’t take more than a moment for pre to start pouring out of your cock, heralding the inevitable. The moment the first droplet stains her grey body, your gooey companion coos happily, licking her lips hungrily.");
	}

	output("\n\nUnder this kind of treatment, you’re not going to last much longer. You clench down, trying to hold back, but [goo.name]’s sucking, writhing motions are as intense as an expert whore’s, purpose-built to suck every drop of cum from you. There’s not a lot you can do to keep it from happening - just to try and give as good as you get, making sure [goo.name] has every bit as much enjoyment from your lovemaking as you do. She squeals delighted as you redouble your efforts, wiggling and moaning with every thrust.");
	
	output("\n\nA few moments later, and you reach your limit. With a grunt of effort, you feel your [pc.cock] swell for a moment, then unload into the goo-girl’s expectant hole. She shrieks in pleasure, smiling at you inhumanly wide as you pump her full of spunk, filling her gooey innards with [pc.cumNoun].");
	
	output("\n\nWith a heavy sigh, you roll off the sated goo-girl, watching as your spunk sinks away into the hungry gray goo.");
	
	output("\n\n<i>“Oooh, you’ve been saving that up for me, haven’t you?”</i> [goo.name] giggles, running a finger around her well-fucked chest pussy. <i>“Delicious!”</i>");
	
	output("\n\nYou give her a grin and extend an arm to her, inviting your gooey bodysuit to envelop you once again. Back to business!");

	processTime(20);

	pc.orgasm();

	if (flags["GOOARMOR_SLEEVE_FUCK"] == undefined) flags["GOOARMOR_SLEEVE_FUCK"] = 0;
	flags["GOOARMOR_SLEEVE_FUCK"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


//Masturbation (Public)
// By JimThermic
// Libido req: 30+
// Need to be in public place, obv.
// Taurs play with their tits. Non-taurs play with their cocks, pussies, or ass, searching for their existence in that order. This is an everybody scene with a number of 'if' statements.

public function goddamnitJimTAndYourExhibitionism():void
{
	clearOutput();
	showName("BLOWING\nOFF STEAM");
	if(silly) author("JimThermite the Termite");
	else author("JimThermic");

	//GotLowerGarment - armor or underwear:
	if(pc.isCrotchGarbed())
	{
		output("Void, you're so damn horny! Beneath your [pc.lowerGarment], your loins ache needily.");
		if(pc.hasCock() || pc.hasVagina()) 
		{
			output(" Throbbing with need,");
			if(pc.hasCock()) 
			{
				output(" your [pc.cocks] ");
				if(pc.cockTotal() == 1) output("is pitching a tent");
				else output("are pitching tents");
				if(pc.hasVagina()) output(", and ");
				else output(" in");
			}
			//GotPussies:
			if(pc.hasVagina()) 
			{
				output(" your [pc.pussies] ");
				if(pc.totalVaginas() == 1) output("is");
				else output("are");
				output(" rubbing wetly against");
			}
			output(" the all-too constricting fabric.");
		}
	}
	//else / Bottom Nudefucker:
	else
	{
		output("Void, you're so damn horny! Your loins ache with need, your bare crotch begging to be attended to.");
	}

	output("\n\nWith a flushing face, you look around. You're still in public. Could you masturbate... here? In front of all these people?");

	output("\n\nYou look into their eyes as the ");
	//Tavros:
	if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
	else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbethian citizens");
	else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
	else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
	else output("onlookers");
	output(" peer at you curiously, wondering what's the matter. The longer they look, the fiercer the forbidden flame burns between your loins. You yearn to stroke it, <i>expose</i> it, display it in front of everyone....");

	//PCWearingArmor:
	if(!(pc.armor is EmptySlot))
	{
		output("\n\nBefore their eyes, you begin slowly stripping off your [pc.armor]. They watch on with wide open eyes and mouths as you peel it off your [pc.skinFurScales], exposing your bare body to the gaping onlookers. You can feel their looks lingering on and roaming around your body, causing you to shiver with delight.");
		//GotUpperUndergarment:
		if(!(pc.upperUndergarment is EmptySlot)) output(" Sliding your fingers up your bare flesh, you sensuously slide off your [pc.upperUndergarment]. The slowly gathering crowd gazes upon your [pc.chest] and you shiver with delight.");
		if(!(pc.lowerUndergarment is EmptySlot)) output(" Making a show of it, you hook your thumbs under your [pc.lowerUndergarment]. With a long, pointed bend, you strip them off, poking your bare [pc.skinFurScalesColor] buttocks at any watching bystanders. You try to control the quiver in your [pc.thighs] as you do so; it's hard to contain your mounting excitement!");
	}
	//Else if (PCNoArmor but wearing Upper and/or Lower Undergarment):
	else if(!pc.isNude())
	{
		output("\n\nBefore their gaze, you begin touching yourself. Of course, they're already <i>looking</i>, what with you traipsing around in nothing but your ");
		if(pc.isChestGarbed()) output("[pc.upperGarment]");
		if(pc.isChestGarbed() && pc.isCrotchGarbed()) output(" and ");
		if(pc.isCrotchGarbed()) output("[pc.lowerGarment]. The gaping onlookers look upon your exposed [pc.skinFurScales] with ");
		if(rooms[currentLocation].planet == "PLANET: NEW TEXAS" || rooms[currentLocation].planet == "PLANET: MYRELLION" || rooms[currentLocation].planet == "PLANET: TARKUS") output("obvious lust");
		else output("a mixture of scandal and lust");
		output(". You can feel their looks lingering on and roaming around your body, causing you to shiver with delight.");
	}
	//Else // PC is nude:
	else
	{
		output("\n\nYou're already butt-naked, of course, wearing nothing but your [pc.skinFurScales]. ");
		if(rooms[currentLocation].planet == "PLANET: NEW TEXAS" || rooms[currentLocation].planet == "PLANET: MYRELLION" || rooms[currentLocation].planet == "PLANET: TARKUS") output("Even here, such blatant nudity is met with lusty looks.");
		else output("The shocked and scandalized looks on their faces gives you a thrill - what you are doing is really, obviously <i>naughty</i>.");
		output(" They watch on with wide open eyes and mouths as you begin touching your bare body before the gaping onlookers. You can feel their looks lingering on and roaming around your body, causing you to shiver with delight.");
	}
	output("\n\nAs a number of ");
	if(rooms[currentLocation].planet == "TAVROS STATION") output("station visitors");
	else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("frontier folk");
	else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("the rabbit-like aliens");
	else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("curious New Texans");
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("female myr");
	else output("onlookers");
	output(" gather around you, you ");
	if(pc.biggestTitSize() > 2) output("heft");
	else output("stroke");
	output(" your [pc.chest] for their benefit. They're totally fixated on every detail of ");
	if(pc.biggestTitSize() < 1) output("it");
	else output("them");
	output(" and your [pc.nipples]. You grin and slide your hands down and along your [pc.belly]. Their ");
	if(rooms[currentLocation].planet == "PLANET: NEW TEXAS" || rooms[currentLocation].planet == "PLANET: MYRELLION" || rooms[currentLocation].planet == "PLANET: TARKUS") output("longing looks");
	else output("scandalized and stirred-up stares");
	output(" follow.");
	if(!pc.isTaur()) output(" You reach to your loins, drawing their attention <i>there</i>.");

	if(pc.isTaur())
	{
		output("\n\nGrabbing your [pc.nipples] once more, you tease and pinch them before their very eyes.");
	}
	else if(pc.hasCock()) output("\n\nGrabbing [pc.oneCock], you stroke it before their eyes.");
	else if(pc.hasVagina()) output("\n\nYou begin to stroke [pc.oneVagina] before their eyes.");
	else output("\n\nReaching behind you, you begin to finger your [pc.ass] before their eyes.");
	//NewTexas/Myrellion/Tarkus: 
	var lustPlanet:Boolean = (rooms[currentLocation].planet == "PLANET: NEW TEXAS" || rooms[currentLocation].planet == "PLANET: MYRELLION" || rooms[currentLocation].planet == "PLANET: TARKUS");
	if(lustPlanet) output(" A number of them lick their lips.");
	else output(" There are a few loud gasps and <i>lots</i> of whispering.");
	output(" You can feel all of them staring at your ");
	if(pc.isTaur()) output("[pc.chest]");
	else if(pc.hasCock()) output("[pc.cockHead]");
	else if(pc.hasVagina()) output("[pc.pussyColor] slit");
	else output("spread buttocks");
	output(", burning each and every detail of your ");
	if(pc.isTaur()) output("erect buds");
	else if(pc.hasCock()) output("swelling crown");
	else if(pc.hasVagina()) output("snatch");
	else output("fingered pucker");
	output(" into glorious memory.");

	output("\n\nYour sense of excitement skyrockets as they begin to whip out recording devices. Here you are, [pc.name], ");
	if(pc.isTaur()) output("playing with your [pc.nipples]");
	else if(pc.hasCock()) output("jerking");
	else if(pc.hasVagina()) output("frigging");
	else output("fingering your ass");
	output(" in public, and everyone can see it - it's such a rush!");

	output("\n\n<i>“Go on, record me - spread it around!”</i> You cry out. The idea of a whole ");
	if(rooms[currentLocation].planet == "TAVROS STATION") output("station");
	else output("planet");
	output(" seeing you wildly masturbating makes you tremble and quake with delight. No matter how they look at you, you know half of them will be taking it home later, masturbating themselves to your ");
	if(pc.isTaur()) output("[pc.chest]....");
	else output("[pc.groin]....");

	output("\n\nYou simply lack the self control to keep it up. You let out a loud, lewd cry and the crowd of ");
	if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
	else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbeth citizens");
	else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
	else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
	else output("onlookers");
	output(" gasp.");

	if(pc.hasCock())
	{
		output(" [pc.EachCock] flexes and fires");
		if(pc.cumQ() < 5) output(" blank shots, only the smallest droplets of [pc.cum] escaping your [pc.cockHeads]");
		else if(pc.cumQ() < 100) output(" thick spurts of [pc.cum] up and into the air. Some of shoot into the crowd. Your spunk splatters on one of their faces, and they let out a shocked noise!");
		else output(" fountainous gushes of [pc.cum]. It surges forth from your [pc.cockHeads], splattering into the crowd and raising shocked cries.");
	}
	if(pc.hasVagina())
	{
		output(" Clenching your quaking thighs, you utterly cream yourself in front of them. Your [pc.thighs] are utterly drenched in your [pc.girlCum] as you tremble and twitch");
		if(pc.hasVagina()) output(", even squirting a little");
		output(" in delight.");
	}
	else 
	{
		output(" You tremble and dry-orgasm from your ");
		if(pc.isTaur()) output("tit-play");
		else output("ass fingering");
		output(", [pc.thighs] quaking in delight.");
	}
	output("\n\nDimly, you're aware of flashing around you as the assembled voyeurs take photos of your [pc.skinFurScalesColor], ");
	if(pc.hasCock() && pc.cumQ() >= 5) output("[pc.cumNoun]-splattered");
	else output("sweaty");
	output(" body. You bask in the afterglow for a good long while. Once you start getting cold, you pick yourself up and gather your things, feeling a fuzzy sense of fulfillment.");
	output("\n\nYou smile brightly and slip on your [pc.gear]. Sex really is better when you've got an audience, even when it's with yourself.");
	processTime(20);

	pc.orgasm();
	pc.exhibitionism(1);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Futa Babe Pantyfaps
//Add [PantyFap] to masturbation menu. PC must have a dick + waifu panties. Open sub-menu to select which waifu's panties to jerk it into. 
public function futaBabePantyfapsRouter():void
{
	//Just one? Figure out which and send to the scene:	
	if(pantyFapCount() == 1) 
	{
		if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) futaBabePantyfaps("Kiro");
		if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) futaBabePantyfaps("Penny");
		if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink.")) futaBabePantyfaps("Saendra");
		if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) futaBabePantyfaps("Syri");
	}	
	//More than one pair? Build a menu.
	else
	{
		clearOutput();
		output("You've collected " + pantyFapCount() + " of 4 possible pairs of ladies' underwear. Which will you use?");
		clearMenu();
		var button:int = 0;
		if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) 
		{
			addButton(button,"Kiro's",futaBabePantyfaps,"Kiro","Kiro's Panties","Use Kiro's lacy, crotchless panties for a quick wank.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) 
		{
			addButton(button,"Penny's",futaBabePantyfaps,"Penny","Penny's Panties","Use Penny's blue (but crotchless) panties for a quick fap.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink."))
		{
			addButton(button,"Saendra's",futaBabePantyfaps,"Saendra","Saendra's Panties","Use Saendra's tight, pink panties to stroke one out.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) 
		{
			addButton(button,"Syri's",futaBabePantyfaps,"Syri","Syri's Panties","Use Syri's sky-blue, silky bloomers for a little self-pleasure.");
			button++;
		}
		addButton(14,"Back",masturbateMenu);
	}
}
public function futaBabePantySchlicksRouter():void
{
	//Just one? Figure out which and send to the scene:	
	if(pantyFapCount() == 1) 
	{
		if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) futaPantiesFapInPussy("Kiro");
		if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) futaPantiesFapInPussy("Penny");
		if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink.")) futaPantiesFapInPussy("Saendra");
		if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) futaPantiesFapInPussy("Syri");
	}	
	//More than one pair? Build a menu.
	else
	{
		clearOutput();
		output("You've collected " + pantyFapCount() + " of 4 possible pairs of ladies' underwear. Which will you use?");
		clearMenu();
		var button:int = 0;
		if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) 
		{
			addButton(button,"Kiro's",futaPantiesFapInPussy,"Kiro","Kiro's Panties","Use Kiro's lacy, crotchless panties for a quick jill-off session.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) 
		{
			addButton(button,"Penny's",futaPantiesFapInPussy,"Penny","Penny's Panties","Use Penny's blue (but crotchless) panties for a quick bit of self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink."))
		{
			addButton(button,"Saendra's",futaPantiesFapInPussy,"Saendra","Saendra's Panties","Use Saendra's tight, pink panties to stroke one out.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) 
		{
			addButton(button,"Syri's",futaPantiesFapInPussy,"Syri","Syri's Panties","Use Syri's sky-blue, silky bloomers for a little self-pleasure.");
			button++;
		}
		addButton(14,"Back",masturbateMenu);
	}
}

public function getPantyColor(waifu:String = ""):String
{
	var pantyColor:String = "some dickgirl";
	if(waifu == "Kiro") pantyColor = "black";
	else if(waifu == "Penny") pantyColor = "blue";
	else if(waifu == "Syri") pantyColor = "blue";
	else if(waifu == "Saendra") pantyColor = "bright pink";
	return pantyColor;
}

public function futaBabePantyfaps(waifu:String = ""):void
{
	clearOutput();
	showName("PANTY\nNAUGHTINESS");
	author("Savin");
	var pantyColor:String = getPantyColor(waifu);
	
	output("Overcome by your mounting lusts and the yearning desire for the warm touch of your lover, you pull out the underthings you got from " + waifu + ", eyes wandering over the " + pantyColor + " fabric. Memories of your prior entanglements, the tender embraces and lusty encounters you’ve shared in the past. Your [pc.cocks] start");
	if(pc.cockTotal() == 1) output("s");
	output(" to stiffen with excitement at the fond memories, and your hand slowly works its way down to your crotch. Smiling to yourself, you gently stroke yourself and slink down ");
	if(currentLocation != "SHIP INTERIOR") output("onto the ground");
	else output("onto the edge of your bed");
	output(".");

	output("\n\nReclining back, you bring " + waifu + "’s panties up to your face and drink deep of the rich, musky scent of them, smelling so wonderfully of your lover that you could easily imagine her here with you, her crotch pressed into your face with a big, throbbing hard-on for you to worship. The thought of your lover’s tumescent cock rubbing against your face, her body wrapped around yours in a passionate embrace... her hands around your [pc.cock], stroking you... yeah, that’s enough to get you going.");

	output("\n\nYou pull off your [pc.gear] and get comfortable, stopping to run your tongue along the palm of your ");
	if(silly) output("fapping ");
	output("hand before reaching back down to encircle your prick, starting to jack off nice and easy, pretending that it’s " + waifu + "’s mouth instead. Chewing your lip, you sigh into the wonderful little shockwaves of pleasure spilling up from your dick. <i>“Ah yeah,”</i> you murmur to yourself, moving a little faster, caressing every inch of your stiffening cockflesh.");

	output("\n\nYou take a last, long sniff of your lover’s panties - and the intoxicating, masculine aroma clinging to them - before taking them down and wrapping the " + pantyColor + " fabric around your cock. You can’t help but smile at yourself, grinning at the perverse shame of using your lover’s cute " + pantyColor + " panties to jerk yourself off. Still, they feel wonderful on your sensitive cockflesh, and you let out a sultry little moan as you strike yourself with " + waifu + "’s panties.");

	output("\n\nThe longer you go, the heavier your breathing gets, and the more your cock throbs in its sheath of silky panty. You move them faster and faster, gliding along your [pc.cock] as your lust builds ever higher. Your [pc.hips] buck into the " + pantyColor + " panties, drooling thick streaks of [pc.cumColor] pre across the fabric with every thrust and adding your own flavor to your lover’s well-used underthings.");

	output("\n\n<i>“Gonna... gonna...”</i> you murmur under your breath, trying to hold back... and failing miserably. The perversion and pleasure and smell of sex all combine to overwhelm your senses, and your cock bulges with a rush of seed waiting to stain the " + pantyColor + " fabric [pc.cumColor]. With a final, exhilarated moan, you arch your back and thrust deep into the wadded mass of " + waifu + "’s panties, busting your nut into the musky crotch, right where she’d want it...");

	output("\n\nMoaning, panting, and cumming, you ");
	if(pc.cumQ() < 10) output("spurt trickles of [pc.cumFlavor] spooge all over " + waifu + "’s panties");
	else if(pc.cumQ() < 50) output("squirt thick load after load all over the panties");
	else if(pc.cumQ() < 250) output("blast the panties with cum, soaking them in your [pc.cumNoun]");
	else output("unleash an ungodly torrent of [pc.cumNoun] into the poor, abused panties, soaking them in what looks like buckets of [pc.cum]. They definitely are carrying <i>your</i> smell more than " + waifu + "’s now.");

	output("\n\nYou flop back and take a deep, satiated breath, mind flooded with fantasies of a pleasant afterglow in " + waifu + "’s arms. Slowly, [pc.eachCock] deflates from inside her bunched-up panties, and you eventually pick yourself up and ");
	if(currentLocation != "SHIP INTERIOR") output("do what you can to clean your lover’s underwear off");
	else output("dump the panties into your clothes washer");
	output(" before you leave.");
	processTime(17+rand(4));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function futaPantiesFapInPussy(waifu:String = ""):void
{
	clearOutput();
	showName("PANTY\nFUN");
	var pantyColor:String = getPantyColor(waifu);
	output("Feeling a touch naughty, you dig into your possessions for one of your favorite, naughty prizes - " + waifu + "’s panties, complete with lingering traces of her scent");
	if(waifu != "Syri") output(" - male and female");
	output(". If you look carefully, you can even see the remnants of an old cumstain, resilient despite repeated washings. Fuck, you wish you had her in your hands instead of this elastic trophy. You could squeeze her ass, kiss her full on the lips, and feel her aching hardness press against your chest, so full of need for you... and the gathering wetness");
	if(pc.legCount > 1) output(" between your thighs.");
	else output(" below.");

	//CrotchGarbed
	if(pc.isCrotchGarbed())
	{
		output("\n\nOoh, you’re getting a little hot to be penned up inside the confines of your [pc.lowerGarments]. Sometimes a [pc.boy]’s got to let [pc.hisHer] inner flower bloom, and quite frankly, your petals are already soaked with dew. You kick the offending equipment off with a few deft twists of your fingers and contemptuous snap of your [pc.foot]. Your heart races. It’s just you, " + waifu + "’s panties, and your eagerly wiggling fingers, now.");
	}
	//Nakkers
	else output("\n\nOoh, it’s a good thing you’re already naked. It wouldn’t do to have your own underwear as fragrant with lust as " + waifu + "’s. You’re not nearly that libidinous - you’re just a [pc.boy] whose needs have risen to the point where they need taken care of, like any normal U.G.C. citizen. Left to your own devices, you’ll need to pollinate your delicate, dewy flower with naught but your fingers and the too-rich scent of your absent lover. Good thing you’ve such a wonderfully stimulating aid.");
	//Merge
	output("\n\nYou run your palms down the [pc.skinFurScales] of your [pc.fullChest], pausing at each ");
	if(pc.hasInvertedNipples()) output("inverted nipple to gently probe the perfectly concealed nub");
	else if(pc.hasLipples()) output("pouting lipple to press your fingers inside, allowing the delightfully fuckable angel bows to clamp down for a little suck");
	else if(pc.hasFuckableNipples()) output("sensitive nipple to gently slip inside, discovering the wetness that is the hallmark of your delightfully fuckable chest");
	else output("stiff teat to gently pinch at flick at the pebbly flesh");
	output(". A thrill of delight shivers down your spine when your hands reach your [pc.belly], one still dragging the used underthings with them. Sighing dreamily, you pull the panties away just as the other set of questing digits nears their simmering target");
	if(pc.totalVaginas() > 1) output("s");
	output(". You can feel the heat sizzling close to your fingertips, a simple plunge away.");
	if(pc.totalVaginas() > 1)
	{
		output(" They’re spread to position themselves evenly across your expanse of womanly folds. Your body truly is a smorgasbord of sapphic-themed delights");
		if(pc.totalVaginas() > 2) output(",  gifted with more glittering pussy than most lesbian couples");
		output(".");
	}
	output("\n\nHolding the soft fabric close to your face, you inhale. Somewhere, long ago, you learned that scent is powerfully bound to the terran memory, and it never seemed more true than at this very moment. The aroma of " + waifu + " conjures up her imagine in your mind’s eye, complete with a cunt-wrecking cock and a feverishly desirous gaze. You ought to pay her a special visit, the next time you have a chance, maybe sink to your knees and polish her with slow licks until she’s forced to give you the fucking you so crave.");
	output("\n\nAn audible squelch accompanies the riveting sensation of burying fingertips knuckle deep in your most feminine places. Something " + pantyColor + "-colored and silky soft muffles your joyous croon. You can only assume that you brought " + waifu + "’s panties closer whilst lost in the electric delight of labial friction, and now that you’re breathing through them, you can’t really be bothered to pull them away. " + waifu + " smells as good as you remember, giving your fingers all the reason they need to fly between your folds or feather your [pc.clits].");
	output("\n\nOpening your mouth, you stuff the panties inside, turning your lover’s underthings into an impromptu gag. It does quite an effective job of muffling your cries of pleasure, and an even better job of reminding you just what she tastes like. Your fingers squish and squelch on their way through your entrance, slipping on the warm, wet bounty that oozes from within.  Pleasure races through your overactive nerves like data through quantum entangled relays, instantly transmitting the intense euphoria to your hormone-drenched mind.");
	output("\n\nWhimpering and quivering, you try to keep your [pc.legs] from quivering. You can practically feel " + waifu + "’s dick inside you, the veiny girth trembling with its own unspent need. It throbs with sympathetic desire, rubbing your most sensitive spots just as you desire them touched. Carefully, you wad up the spit-drenched panties and shove them inside just as your thumb begins to anxiously circle [pc.oneClit], its shaking loosing thrills of ecstasy from the red-hot pleasure buzzer.");
	output("\n\nYou cum around those panties,");
	if(pc.isSquirter())
	{
		output(" drenching them in absolute torrent of [pc.girlCum].");
		if(pc.girlCumQ() >= 1000) 
		{
			output(" There’s so much even the sodden panties can’t plug your gushing quim");
			if(pc.totalVaginas() > 1) output("s");
			output(", and torrents of passionate fluid flood down your [pc.thighs]");
		}
	}
	else output(" your muscles clamping down around them as the " + pantyColor + " underwear darkens with absorbed [pc.girlCum]");
	output(". It’s an exquisitely satisfying orgasm, almost as the ones you could wring from " + waifu + ". The fullness, artificial as it may be, feeds your clenching, spasming bliss until you go limp, utterly drained.");
	if(pc.hasCock())
	{
		output(" Only now do you realize that your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("was");
		else output("were");
		output(" spurting ropes of [pc.cum] into the air.");

		if(pc.cumQ() > 30 && pc.cumQ() < 500) 
		{
			output(" Your [pc.chest] ");
			if(pc.biggestTitSize() < 1) output("is");
			else output("are");
			output(" soaked.");
		}
		else if(pc.cumQ() >= 500) output(" You’re absolutely soaked.");
	}
	output("\n\nYour eyes cross a little when you pull the sodden underwear from your [pc.vagina]");
	if(pc.hasCock())
	{
		output(", and your [pc.cocks] dribble");
		if(pc.cockTotal() == 1) output(" a little more, lurching visibly");
	}
	output(". The panties smell more like you than " + waifu + " for the moment, but a quick wash ought to help solve that");
	if(currentLocation != "SHIP INTERIOR") output(", once you get back to the ship");
	output(".");
	if(currentLocation == "SHIP INTERIOR") 
	{
		output(" You guiltily glance around, then sneak one last sniff before tossing them in the wash.");
		if(crew(true) > 0) output(" Wouldn’t want your crew to walk in on you in a compromising position... at least not <i>that</i> compromising position.");
	}
	processTime(22);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

		
// By JimThermic
// Exhibition Score: Whatever 'moderate' is. Somewhere between won't publically masturbate at all and total exhibition whore.
// Need to be in public place, obv.
// Taurs and Neuters play with their tits.  Males and Herms play with their dicks. Women play with their pussies. This is an everybody scene with a number of 'if' statements.

public function moderateExhibitionOmniFap():void
{
	clearOutput();
	author("JimThermic");
	showName("PUBLIC\nMASTURBATION");
	// PC is crotch garbed, not a neuter && not a taur OR a chestgarbed taur OR chestgarbed neuter.
	if((pc.isCrotchGarbed() && pc.hasGenitals() && !pc.isTaur()) || (pc.isTaur && pc.isChestGarbed()) || (!pc.hasGenitals() && pc.isChestGarbed()))
	{
		output("Void, it's so hard to <i>think</i> right now! Instead, your senses are reeling, your head filled with an all-consuming, lusty haze. Your ");
		//TaurOrNeuter:
		if(pc.isTaur() || !pc.hasGenitals()) output(" [pc.breasts] and [pc.nipples]");
		//Else if PC.GotCock: 
		else if(pc.hasCock()) output("[pc.cocks]");
		else output("[pc.vaginas]");
		output(" deliciously rub");
		if(!pc.isTaur() || pc.cockTotal() == 1 || (pc.totalVaginas() == 1 && !pc.hasCock())) output("s");
		output(" against your ");
		if(pc.isTaur() || !pc.hasGenitals()) output("[pc.upperGarment]");
		else output("[pc.lowerGarment]");
		output(". You sigh with pleasure - the subtle, sensuous friction is slowly driving you nuts!");
	}
	// else
	else
	{
		output("Void, it's so hard to <i>think</i> right now! Instead, your senses are reeling, your head filled with an all-consuming, lusty haze. Walking around ");
		if(!pc.isNude()) output("half-");
		output("naked has wound you all up - now your lewdly exposed ");
		if(pc.isTaur() || !pc.hasGenitals()) output("[pc.chest]");
		else if(pc.hasCock()) output("[pc.cocks]");
		else output("[pc.vaginas]");
		if(pc.isTaur() || !pc.hasGenitals() || pc.cockTotal() > 1 || (!pc.hasCock() && pc.totalVaginas() > 1)) output("are");
		else output("is");
		output(" thrumming with pent-up pleasure.");
	}
	output("\n\nShould you walk back to the ship to deal with it? Find somewhere private to touch yourself? Both of these options are going to take so long! In the meantime, your ");
	if(pc.isTaur()  || !pc.hasGenitals()) output("[pc.nipples]");
	else output("aching loins");
	output(" are practically <i>begging</i> to be attended to - you’re not sure how much longer you can hold out");
	if(pc.isCrotchGarbed() && pc.hasGenitals()) output(" before you’re creaming in your [pc.lowerGarment]");
	output("!");


	output("\n\nWhat if... you weren’t to hold out? Just play with yourself here, in front of everyone? The mere thought sends a delicious shiver down your spine. You’ll just touch yourself ... just a <i>little</i> bit to calm yourself down.. then you’ll stop...");

	output("\n\n");
	if((pc.isTaur() || !pc.hasGenitals()) && pc.isChestGarbed()) output("You groan and quickly strip off your [pc.upperGarments].");
	//Crotchgarbed && Non-Neuter && Non Taur:
	else output("You groan and quickly strip off your [pc.lowerGarments].");
	output(" With trembling fingers, you slide your hands down ");
	var taurNeuter:Boolean = (pc.isTaur() || !pc.hasGenitals());
	//TaurORNeuter:
	if(taurNeuter) output("and stroke your [pc.chest]");
	else
	{
		output("your [pc.belly] and ");
		if(pc.hasCock())
		{
			output("wrap them around ");
			if(pc.cockTotal() > 2) output("a pair of ");
			output("your needy [pc.cocks]");
		}
		else output("seek out your needy [pc.pussies]");
	}
	output(". You can’t believe you’re really going to do this, out here where anyone could catch you!");

	output("\n\nYou’re definitely attracting the attention of ");
	if(rooms[currentLocation].planet == "TAVROS STATION") output("various station-goers");
	else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("the Esbethian citizens");
	else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("the raskvel");
	else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("the local bulls and cows");
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("the myr");
	else output("those around you");

	output(". They peer at you, blinking as you begin to shyly stroke yourself before their curious gaze. They’re staring right at your ");
	if(taurNeuter) output("[pc.chest] and [pc.nipples] as you pinch and squeeze them.");
	else if(pc.hasCock())
	{
		output("[pc.cocks] as you wring and jerk ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(", pre-cum already lazily dribbling down your turgid shaft");
		if(pc.cockTotal() > 1) output("s");
		if(pc.balls > 0) output(" and rolling over your [pc.balls]");
		output(".");
	}
	else
	{

		output("[pc.vaginas] as you finger ");
		if(pc.totalVaginas() == 1) output("it");
		else output("them");
		output(", plunging your digits inside and wiggling it around inside of your wetness.");
	}
	output("\n\nYou flush as they");
	if(rooms[currentLocation].planet == "PLANET: TARKUS" || rooms[currentLocation].planet == "PLANET: NEW TEXAS") output(" stare lustily at");
	//else if Myrellion: 
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output(" stare in awe of");
	else output(" stare, utterly scandalized, at");
	output(" your ");
	if(taurNeuter) output("bared chest");
	else output("loins");
	output(". You can feel them burning each and every detail of your ");
	if(taurNeuter) output("[pc.nipples] and [pc.skinFurScalesColor] body");
	else
	{
		if(pc.hasCock()) output("[pc.cockHeads]");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) output("[pc.pussies]");
		output(" into glorious memory as you ");
		if(pc.hasCock()) output("stroke");
		if(pc.hasVagina() && pc.hasCock()) output(" and ");
		if(pc.hasVagina()) output("finger");
		output(" yourself!");
	}

	//pc.notTaur:
	if(!pc.isTaur())
	{
		output("\n\nThe excitement makes you bolder, more confident. Driven by lusty need, you impulsively lay down on the ground");
		if(pc.legCount > 1) output(" and spread your [pc.thighs] wide");
		output(". With one hand, you ");
		if(pc.hasCock()) output("continue to jerk off [pc.oneCock]");
		else if(pc.hasVagina()) output("spread your pussy lips for all to see, winking your wetness at them");
		else output("continue to tease your [pc.chest]");
		output(". With the other, you press two fingers inside of your [pc.asshole] and wiggle them lewdly about - naughtily ");
		if(pc.hasCock()) output("jerking off and fingering your [pc.butt]");
		else if(pc.hasVagina()) output("fingering [pc.oneVagina] and [pc.ass] at the same time");
		else output("fingering your [pc.ass] in front of them");
		output("!");

		output("\n\nBucking your hips wildly in the air, you groan and shiver, hearing the clicking and flashing of ");
		if(rooms[currentLocation].planet != "PLANET: MYRELLION") output("holo-");
		output("cameras around you. You can’t believe you - [pc.fullName] - are finger-fucking yourself in front of all these people");
		if(pc.hasCock()) output(", wildly jerking yourself off");
		output(" and show showing them just how much of a slut you are!");
	}
	else
	{
		output("\n\nYou groan and shiver as you tease your [pc.chest], hearing clicking and flashing of ");
		//notMyrellion:
		if(rooms[currentLocation].planet != "PLANET: MYRELLION") output("holo-");
		output("cameras around you. You can’t believe you - [pc.fullName] - are lewdly pinching your [pc.nipples] in front of all these people, showing them just how much of a slut you are!");
	}
	//pc is taur or Neuter:
	if(taurNeuter)
	{
		output("\n\nThat naughty little thought pushes you right over the edge. With a sharp, high-pitched cry, you shiver and ");
		if(pc.hasCock()) output("shoot your [pc.cum] all over the ground");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) 
		{
			if(pc.isSquirter()) output("squirt your");
			else output("gush");
			output(" [pc.girlCum] from your [pc.pussies]");
		}
		if(pc.hasGenitals()) output("utterly cream yourself");
		output(". ");
		//pc.lactating:
		if(pc.isLactating())
		{
			output("At the same time, [pc.milkVisc], [pc.milkColor] [pc.milkNoun] lewdly shoots from your [pc.nipples] as you boob-gasm in front of everyone! ");
		}
		output("You can hear the ");
		if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
		else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbethians");
		else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
		else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
		else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
		else output("onlookers");
		output(" gasping as you groan and tremble, riding out your glorious orgasm for all it’s worth.");
	}
	else if(pc.hasCock())
	{
		output("\n\nThat naughty little thought pushes you right over the edge. With a sharp, high-pitched cry, you shiver and shoot your [pc.cumVisc], hot [pc.cumNoun] all over your [pc.belly], ");
		if(pc.cumQ() < 50) output("lightly splattering it with [pc.cumColor]");
		else if(pc.cumQ() < 250) output("coating it in glistening [pc.cumColor]");
		else if(pc.cumQ() < 1000) output("utterly coating it in glistening [pc.cumColor] as well as your [pc.chest] and chin.");
		else output("utterly dousing it, your [pc.chest] and [pc.face] in gallons of glistening, glorious [pc.cumColor].");
		//pc.lactating:
		if(pc.canMilkSquirt() && pc.isLactating()) output(" At the same time, [pc.milkVisc], [pc.milkColor] [pc.milkNoun] lewdly shoots from your [pc.nipples] and up in the air as you boob-gasm in front of everyone!");
		output(" You can hear the ");
		if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
		else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbethians");
		else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
		else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
		else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
		else output("onlookers");
		output(" gasping as you groan and milk your [pc.cocks] for all ");
		if(pc.cockTotal() == 1) output("it’s");
		else output("they’re");
		output(" worth, perversely milking ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" and your prostate until you’ve fired every last drop.");
	}
	else // pc.hasPussy:
	{
		output("\n\nThat naughty little thought pushes you right over the edge. With a sharp, high-pitched cry, you shiver and ");
		if(pc.isSquirter()) output("squirt your");
		else output("gush");
		output(" [pc.girlCum] from your [pc.vaginas]");
		output(".");
		if(pc.isLactating() && pc.canMilkSquirt()) output(" At the same time, [pc.milkVisc], [pc.milkColor] [pc.milkNoun] lewdly shoots from your [pc.nipples] and up in the air as you boob-gasm in front of everyone!");
		//ElseNotLactating:
		else 
		{
			output(" It’s not long before your [pc.ass] is utterly covered in your lady juice, not to mention the floor ");
			if(pc.legCount > 1) output("between your [pc.thighs]");
			else output("underneath");
			output(".");
		}
		output(" You can hear the ");
		if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
		else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbethians");
		else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
		else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
		else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
		else output("onlookers");
		output(" gasping as you groan and rub your [pc.vaginas] and [pc.asshole], perversely stretching out your orgasmic high for as long as you can!");
	}
	output("\n\nAfter the afterglow wears off, your cheeks burn as you realise just how much of a spectacle you made. You really didn’t mean to touch yourself that much! For some reason, you’re filled with a fuzzy sense of fulfilment. You’d better not do this kind of thing too often - it feels like it could be addictive!");
	if(pc.exhibitionism() >= 75) output(" Could... could you secretly be an exhibitionist, perhaps-?");
	processTime(20+rand(10));
	pc.exhibitionism(1);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

