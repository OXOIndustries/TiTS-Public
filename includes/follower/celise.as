import classes.Creature;

// Flags: 
// CELISE_ONBOARD        : TODO - FIXME
// RECRUITED_CELISE      : TODO - FIXME
// TIMES_CELISE_IN_BALLS : TODO - FIXME
// 

public function celiseIsCrew():Boolean {
	return (flags["RECRUITED_CELISE"] > 0 && flags["CELISE_ONBOARD"] > 0);
}
public function celiseIsFollower():Boolean {
	return (flags["RECRUITED_CELISE"] > 0);
}
public function showCelise():void
{
	showName("\nCELISE");
	showBust(celiseBustDisplay());
}
public function celiseBustDisplay():String
{
	if(flags["GIGACELISE"] != undefined) return "CELISE";
	return "CELISE";
}


//Celise In Tavros
public function celiseTavrosBonus(btnSlot:int = 1):void 
{
	output("\n\nCelise is lounging here, just as green as ever and chatting amicably with one of the station’s mechanics.");
	addButton(btnSlot, "Celise", approachNonCrewCelise);
}
//Crewmember Celise’s Screen
public function celiseFollowerInteractions():void {
	//Giga Celise has her own thing!
	if(flags["GIGACELISE"] == 1)
	{
		gigaCeliseRepeatApproach();
		return;
	}
	clearOutput();
	showCelise();
	output("Celise has settled into your ship with remarkable enthusiasm, claiming a corner near some heat transfer pipes. Her amorphous bottom half is molded tightly into the niches between the tubes for warmth. You can even see bubbles percolating through her transparent emerald shape as she takes in thermal energies that would singe creatures with lesser physiologies. Celise’s upper half sprouts seamlessly from the barely-controlled mass of goo below, looking entirely like a human woman from the waist up - that is, if human women were green and constantly dripping.");
	output("\n\nThe galotian woman’s face is framed by a mane of unruly hair, if it can even be called that. There aren’t individual strands, just carefully shaped body-mass formed in a way that would shame any model going for a wind-blown look. It hangs halfway down her back before it ends, fanning slightly out behind her. Celise’s eyes appear equally false. They have proper shape and even include darker colored irises and pupils, but they’re obviously made of the same stuff as the rest of her. A short, upturned nose graces the space between, and below that, a pair of pouting viridian lips purse in a half-pucker as if they’re ready to kiss something at any moment.");
	output("\n\nSurprisingly, the green woman appears flat chested when you first arrive. Her torso is slim, lithe, and completely unadorned with nipples or even a belly button. Once she sees you, however, Celise’s kiss-hungry lips quirk up into a smile, and her mass of reserve goo shudders with the effort of rearranging itself. Two dark caps resolve on her chest, gaining in cohesion until they appear as a pair of perfect, pointy nipples. A moment later, the flesh beneath them surges, swelling outward with the barest hint of domed shape. More and more of Celise’s base vanishes, and those two budding orbs engorge with new mass by the second, swelling into heavy, dripping melons, their areolae widening and nipples thickening proportionally. Large breasts do not seem to satisfy the galotian temptress though, expanding beyond reasonable size and into the realm of the absurdly sexual, and with a coo of pleasure, she begins to knead her swollen tits, sinking fingers deeper inside them as they grow out over her hands.");
	output("\n\nThe goo-girl watches you with a lusty smile while her breasts finish their absurd growth, eventually pulling her half-absorbed limbs out of her enormous bosom so that her fingers can regrow. She flutters eyelashes that have become so long that they drip to the floor in your direction while her mouth coos, <i>“Oh, is it snack time?”</i>");
	output(" Celise is as sexually focused as ever. Do you give her a feeding or something else?");
	clearMenu();
	if(pc.hasCock() || pc.hasVagina()) {
		if(pc.lust() < 33) {
			output("\n\n<b>You aren’t aroused enough to consider any sort of sexual situation with Celise.</b>");
			addDisabledButton(0,"Feed");
		}
		else addButton(0,"Feed",celiseFeedingRouter);
	}
	else output("\n\n<b>You do not have any suitable genitalia to feed Celise with.</b>");
	addButton(1,"Transform",gigaCeliseTransform,undefined,"Transform","Tell Celise that you’d like her to grow lots of gooey tentacles for you to have fun with.");
	if(flags["CELISE_NO_BED_SENPAI"] == true) addButton(3,"Allow Bed",celiseBedToggle,true,"Allow Goo Bed","Allow Celise to approach you before bed if she is in the mood.");
	addButton(4,"Send Away",sendCeliseAway,undefined,"Send Away","Send Celise off the ship to wait for you. She’ll be at the hangar in Tavros if you ever want her back.");
	addButton(14,"Back",crew);
}

//Leave Crewmember Celise’s Screen
public function leaveCelisesMenu():void {
	clearOutput();
	showCelise();
	output("You wave at the ever-hungry emerald woman and head off, hearing a sigh of disappointment behind you as you go.");
	clearMenu();
	addButton(0,"Next",celiseFollowerInteractions);
}

public function celiseFeedingRouter():void {
	clearMenu();
	showCelise();
	if(pc.hasCock()) addButton(0,"Male Feeding",dudesFeedCelise);
	else addDisabledButton(0,"Male Feeding");
	if(pc.hasVagina()) addButton(1,"FemaleFeed",feedCeliseBySavin);
	else addDisabledButton(1,"FemaleFeed");
	//Requirements: PC C-cup or above, lactates, and has junk of some kind
	if(pc.biggestTitSize() >= 3 && pc.isLactating() && (pc.hasCock() || pc.hasVagina())) 
		addButton(2,"Breastfeed",celiseSleezeLactation);
	else addDisabledButton(2,"Breastfeed");
	//available for every type of Celise and every PC except unsexed
	//sex menu addl. line should be something like below, modified for context
	var sinkInTooltip:String = "Celise’s gooey body looks soft and malleable enough that you could sink right into her... that might be fun, but no doubt she wouldn’t stop at ";
	if(pc.hasVagina()) sinkInTooltip += "filling <i>just</i> your pussy";
	else sinkInTooltip += "teasing <i>just</i> your cock";
	sinkInTooltip += " if you tried.";
	addButton(3,"Sink In",zeiksCeliseSubmersionTechnique,undefined,"Sink In",sinkInTooltip);
	if(pc.hasCock() || pc.hasVagina() || pc.hasTailCock()) addButton(4,"Use Her",zDomCeliseGo,undefined,"Use Her","Use Celise to get off. She might try to take charge, but you’ll show her who’s boss.");
	else addDisabledButton(4,"Use Her","Use Her","You need genitals for this act.");
	if(hasACumBubble()) addButton(5,"Cum Bubble",giveCeliseATreatSetup,undefined,"Cum Bubble","Celise loves cum right from the tap, but she’d probably enjoy a stored sample too.");
	else addDisabledButton(5,"Locked","Locked","You do not have the item required for this scene. Purchasing a Bubble Buddy may be a good place to start...");
	addButton(14,"Back",celiseFollowerInteractions);
}

//Send Away
public function sendCeliseAway():void
{
	clearOutput();
	showCelise();
	if(flags["CELISE_EVER_SENT_AWAY"] == undefined)
	{
		output("You tell Celise that she’s going to have to leave the ship for a little while.");
		output("\n\n<i>“Awww, I’ve got to go?”</i> the voluptuous goo woman pouts, her lower lip swelling to exaggerated proportions.");
		output("\n\nYou nod.");
		output("\n\nShe flounces in place");
		if(flags["GIGACELISE"] == 1) output(", converging her tentacles into a semi-solid base that may as well be a massive deposit of green jello");
		else output(", shrinking her breasts down until they barely exist, the additional mass padding out her base");
		output(". The viridian galotian steadies her quivering and fixes you with a determined look that drags on for an uncomfortable amount of time. Her brows knit into an uncharacteristically serious glare.");
		output("\n\nThen, just when you’re about to say anything to break the tension, she sticks out her tongue and claps you on the back. <i>“You’re just like him - all serious and stuff! Don’t worry, Vic had me wait for him tons of times");

		if(shipLocation != "TAVROS HANGAR") output(" - I’ve still got the travel chit and everything");
		output(".”</i> She leans forward, her bust filling out to press meaningfully into your side as she does so. <i>“When you want to have fun");
		if(shipLocation == "TAVROS HANGAR") output(" you can find me here on Tavros Station, okay?");
		else output(", come pick me up on Tavros Station.");
		output("”</i>");
		output("\n\nYou’re left there, stunned, while the galotian disembarks.");
		output("\n\n(<b>Celise is no longer on your crew. You can find her again in Tavros Station.</b>)");
		flags["CELISE_EVER_SENT_AWAY"] = 1;
	}
	//Repeat Send Away
	else
	{
		output("You tell Celise that you’ll need her to wait at Tavros again.");
		output("\n\nWith a glittering green grin and a wink, the ");
		if(flags["GIGACELISE"] == undefined) output("buxom");
		else output("tentacled");
		output(" galotian gives you a super-sized thumbs up. <i>“Sure thing, boss! I wonder if I’ll run into that " + RandomInCollection([
			"cute kui-tan",
			"adorable blue rahn",
			"red-haired half-ausar",
			"moo-cow girl and her dick-girl friend",
			"weird merc with the crazy eyes",
			"weird man-herm guy",
			"egg-laying girl",
			"mean purple dick-girl",
			"fluffy panda",
			"cat-dog girl",
		]) + " again.”</i> She pauses and flashes saucer-sized eyes at you imploringly.");
		if(shipLocation != "TAVROS HANGAR") 
		{
			output(" <i>“You should come to Tavros sometime - there’s so many cool people on station!”</i>");
			output("\n\nYou smile back at her. <i>“I just might.”</i>");
			output("\n\nCelise giggles at that and flows past you, giving you a squeeze on the butt on her way past. She pulls a travel chit out from somewhere inside of herself on her way down the boarding ramp.");
		}
		else output(" With a short giggle, she flows past you, giving your [pc.butts] a squeeze before exiting the ship.");
		output("\n\n(<b>Celise is no longer on your crew. You can find her again in Tavros Station.</b>)");
	}
	processTime(2);
	//remove celise from crew!
	flags["CELISE_ONBOARD"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Approach Celise in Tavros
public function approachNonCrewCelise():void
{
	clearOutput();
	showCelise();
	output("As you get close, she breaks off from her previous conversation and surges toward you in a tidal wave of enthusiasm. <i>“[pc.name]!”</i> she shouts while her liquid weight crashes over and around you, enveloping you in the squishiest hug you could get on this side of the galaxy. <i>“I missed you! I bet you missed me too, didn’t ya?”</i>");
	output("\n\nA tendril of slippery moisture");
	if(pc.isCrotchGarbed()) output(" squeezes underneath your [pc.lowerGarments] and");
	output(" ");
	if(pc.hasCock()) output("gently encircles [pc.oneCock] in a familiar squeeze");
	else if(pc.hasVagina()) output("gently slides into an all-too sensitive crease");
	else output("gently circles your [pc.asshole]");
	output(". <i>“Let’s go back on the ship and have some fun, what do you say?”</i>");
	processTime(1);
	//[Join Crew] [Leave]
	clearMenu();
	addButton(0,"Join Crew",rejoinTheCrewCelise);
	addButton(14,"Leave",leaveCeliseOnTavrosYouMonster);
}

//Join Crew
public function rejoinTheCrewCelise():void
{
	clearOutput();
	showCelise();
	output("<i>“Sounds good to me!”</i> you answer with a welcoming hug, or at least what you think is one. It’s tough to hug someone who has most of your body ensconced within herself.");
	output("\n\nCelise’s face surges up to kiss you on the nose, her lips soft and remarkably solid compared to elsewhere. Pulling back, she giggles and withdraws herself from your body, leaving you surprisingly dry and clean in her wake. <i>“Race you to the ship!”</i>");
	output("\n\nShe jiggles off toward the ship without another word, moving with a surprising amount of speed and grace for one so mellifluent.");
	output("\n\n(<b>Celise has rejoined your crew!</b>)");
	processTime(1);
	//REJOIN CREW
	flags["CELISE_ONBOARD"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Leave
public function leaveCeliseOnTavrosYouMonster():void
{
	clearOutput();
	showCelise();
	output("You chuckle and tell Celise that you were just wanting to make sure she was okay for right now.");
	output("\n\nThe all-encompassing wetness gradually recedes, leaving you dry and remarkably clean in the galotian’s wake. <i>“Nuts.”</i> Celise’s disappointment lasts about as long an ice cube thrown into her star; she’s smiling again almost immediately. <i>“Well, at least I’ve got all the good people here to entertain me. Why just a little bit ago we had a cruise liner stop in. I got to eat with the captain, and the crew... and some of the passengers... and then the crew again.”</i> She licks her lips. <i>“It was so cool!”</i>");
	output("\n\nGiggling, the galotian bends ");
	if(pc.tallness <= 84) output("over");
	else
	{
		output("up");
		if(pc.tallness >= 100) output(", stretching her neck to giraffe-like proportions");
	}
	output(" to kiss your cheek. <i>“You better get going then! Don’t want your cousin to beat you to Vic’s secret stash, right?”</i> She purses her lips. <i>“Do you think that’s where he kept the sex toys?”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Feed Celise (M)
public function dudesFeedCelise():void {
	clearOutput();
	showCelise();
	//Intro for prostate milking, urethral harvesting, and intense suction.
	if(!pc.isNude()) output("You start to undress with a knowing smile, reaching to remove your gear,");
	else output("You start to approach, reaching for your gear,");
	output(" but Celise’s body is on you before you can manage to undo half of it. Desperate, animal hunger is plain in her eyes as she surges around you, enveloping your ");
	if(pc.legCount > 2) output("fore-");
	output("legs in her slippery mass. Her body is warmer than a human’s, and letting her envelop you up to the waist is reminiscent of sinking into a bubbling hot-tub; only this hot-tub is rubbing your [pc.skinFurScales] with languid fluid gushes, massaging you from crotch to [pc.foot] in gentle yet insistent warmth.");
	output("\n\nCelise’s dripping eyelashes flutter innocently as your gear detaches from its fasteners and bobs in the sea of green. Your codex’s screen flashes on, but it seems to function just fine as it journeys to the ground. The rest of your equipment joins it a moment later, exiting the slimy prison without a drop of moisture to mar it. The giggling goo-woman sends surges of artificially enhanced warmth against [pc.eachCock], the tiny streams heating the tingling, sensitive flesh of your increasingly aroused skin. You sigh contentedly and stagger under the delightful, fluid caresses, pulsating in her grip while the heat goes to ");
	if(pc.cockTotal() == 1) output("both ");
	else output("all ");
	output("your heads. Cradling your " + pc.buttDescript() + ", Celise arrests your stumbles with nothing more than her own cushiony body. Her aqueous tendrils touch every part of you: your [pc.legOrLegs], the underside of your [pc.belly], ");
	if(pc.balls > 0) output("your [pc.sack], ");
	else if(pc.hasVagina()) output("[pc.eachVagina], ");
	output("and even your [pc.asshole]. She is careful not to slide inside ");
	if(pc.hasVagina()) output("any ");
	else output("your ");
	output("orifice just yet.");
	output("\n\nLuxuriating in an increasingly erotic massage, you slip further inside her, [pc.legOrLegs] twitching weakly inside her as the pleasure robs you of strength");
	if(pc.isGoo()) output(", your own goo mixing with hers until you can barely tell which of you is which, only that it feels wonderful");
	output(". Celise lustily wonders, <i>“Like, how do I feed this time, [pc.name]? Should I pull out all that yummy [pc.cumNoun] with suction alone?");
	if(pc.cumQ() <= 1000) output(" I bet if I did that enough, you’d start making enough to properly feed me in no time!");
	output("”</i> A rhythmic tugging starts on [pc.oneCock]. <i>“I could squeeze it out from behind....”</i> A tongue of liquid warmth circles your asshole, causing your hips to lurch forward hard enough to make [pc.eachCockHead] crest her surface, dripping with emerald slime. <i>“Hehehe... maybe I should just climb inside the tip and drink it straight from your [pc.balls]");
	if(pc.cumQ() >= 5000) output(". I bet I could drink so much that way that your poor [pc.balls] wouldn’t be able to make as much afterward. That’s not a big deal, right? You’re too messy anyway. I get tired of mopping it up");
	output("....”</i>");
	
	output("\n\nCelise’s body surges up to recapture your escaping genitals, dragging you back inside her while you try to process her words. A dozen fingers tickle across your crotch while the spunk-drinking goo-girl ponders how best to harvest your seed. If you speak up now, she’d likely obey you, but if you wait, she’s going to pick one....");
	//[Suck Out] [Squeeze Out] [Go In] [Say Nothing]
	clearMenu();
	addButton(0,"Suck Out",celiseSucksYouDry);
	addButton(1,"SqueezeOut",celiseDoesSomeAnalMilking);
	addButton(2,"Go In",celiseGoesInYerBallsYo);
	addButton(3,"SayNothing",feedCeliseSayNothing);
}

//Say Nothing
public function feedCeliseSayNothing():void {
	//Pick one of the following scenes. If cum production is low, go in is not considered. If cum production is high, suck out is not considered. Low is considered less than a liter. High is consider more than five liters.
	if(pc.cumQ() < 1000) {
		if(rand(2) == 0) celiseDoesSomeAnalMilking();
		else celiseSucksYouDry();
	}
	else if(pc.cumQ() < 5000) {
		if(rand(3) == 0) celiseDoesSomeAnalMilking();
		else if(rand(2) == 0) celiseGoesInYerBallsYo();
		else celiseSucksYouDry();
	}
	else {
		if(rand(2) == 0) celiseDoesSomeAnalMilking();
		else celiseGoesInYerBallsYo();
	}
}

//Suck Out
public function celiseSucksYouDry():void {
	clearOutput();
	showCelise();
	output("<i>“I’ll totally suck out every drop, " + pc.mfn("mister boss-man","miss boss-lady","mis... er... boss-person") + ",”</i> Celise promises as her human-shaped torso shifts, bending down while your body is lifted on a column of slippery force. [pc.eachCock] crests through her goopy lower form, shedding strands of goo as it goes until only your " + pc.sheathDescript(pc.biggestCockIndex()));
	if(pc.balls > 0) output(" and [pc.balls] are");
	else output(" is");
	output(" enveloped in her embrace. Before your soaking wet dick");
	if(pc.cockTotal() > 1) output("s");
	output(" can feel the chill of exposure, Celise’s face cranes down over top of them. Her “hair” hangs over your crotch like a curtain, slapping against [pc.oneCock] so that you can feel a phantom tongue lick the side.");
	output("\n\nThe amorphous emerald enchantress grabs her long hair in both hands and crushes it around your [pc.cocks], smushing her glittering locks into a column of syrupy pleasure centered solely on you. Suction assaults [pc.eachCock] almost immediately");
	if(pc.cockTotal() > 1) output(", starting so simultaneously that it shocks you into silence");
	output(", pulling more blood into your loins until your [pc.cocks] feel");
	if(pc.cockTotal() == 1) output("s");
	output(" fit to burst. You can feel her breasts pressing down on your [pc.legOrLegs], submerged into herself and yet still keeping their shape so well her nipples dig into your [pc.skinFurScales], slipping and sliding over you with every motion the galotian woman makes.");
	output("\n\nCelise licks her jade lips with a tongue too long for her mouth, shining the already reflective mouth-pillows into a glittering polish as she watches your face, measuring the effects her motions are having on your body. <i>“You like that, huh, Captain? Feeling your [pc.cocks] getting sucked on like that must be pretty good.”</i> Celise lets her tongue hang down into the translucent prison, wrapping it around your " + possessive(pc.cockDescript(pc.biggestCockIndex())) + " " + pc.sheathDescript(pc.biggestCockIndex()) + " into a tight ring. Then, she starts to slide it around, twisting it in quick circuits of your cock that make your overfull shaft thicken further. <i>“Ahm ghunga ‘ake ‘oo ftheel tho ‘ood!”</i>");
	output("\n\nSlipping behind your back, Celise’s arms connect just above your spine and pull down into a tight, form-fitting seal. The definition of her fingers and knuckles fades into a smooth column of green restraint, holding you still while the suction increases. Your [pc.toes] twitch and your back arches when the vacuum pumps on your [pc.cocks] double the tug, pulling so hard that droplets of pre-cum wick out of your [pc.cockHeads] one after another to vanish directly into the galotian.");
	
	output("\n\nSudden motion assaults you, and the texture of the prison");
	if (pc.cockTotal() > 1) output("s")
	output(" around your [pc.cocks] change");
	if(pc.cockTotal() > 1) output("s");
	output(". Your point of view forcibly shifts to regard the ceiling, twisted that way by your hungry cum-drinking crewmate as she moves to get a better angle. You look down to see her smiling at you, tongue back in her mouth, but you can also feel a second oral organ wrapped ");
	if(pc.balls > 0) output("just above your [pc.balls]");
	else output("around your genitals");
	output(", clinging and twisting just as it did before. The tops of her sloshing cock-prison");
	if(pc.cockTotal() > 1) output("s press");
	else output(" presses");
	output(" down on your overhard head");
	if(pc.cockTotal() > 1) output("s");
	output(", giving slightly for a moment before pulling your body upwards, nesting [pc.eachCock] into a perfectly tight, jiggling sleeve of vacuum-pumping pleasure. The bottom of the dick-sucking orifce");
	if(pc.cockTotal() > 1) output("s");
	output(" squishes softly on your [pc.belly], unmistakably curved.");
	output("\n\nIt is in that reclining, body down, cock up posture that the leisurely suckling of your erection");
	if(pc.cockTotal() > 1) output("s");
	output(" stops, and the relentless, vacuum-tight tugging of your maleness");
	if(pc.cockTotal() > 1) output("es");
	output(" begins. The pull is so strong that it’s almost painful but so pleasurably good at the same time. Your hands reach down to try and slow or stop it, but they’re immediately trapped in prisons of the purest green, arrested up to the elbow by Celise’s improbable strength.");
	output("\n\n<i>“Nuh uh! Just hang on and let it happen, [pc.name],”</i> the smiling woman hungrily chides. As if there was anything you could do but hang by your trapped hands! Celise’s not-so-tender affections grow fiercer still, and spatters of warm moisture begin to fall across your [pc.belly] and ");
	if(pc.bRows() > 1) output("the lowest row of your [pc.fullChest]");
	else output("[pc.chest]");
	output(". You look up to see her drooling glops of green goo all over you. You can’t endure much more of this. Already, you can feel the warmth of an impending orgasm building in your [pc.balls]");
	if(pc.balls > 0) output(", making them feel full and heavy as they cling and twitch tightly against you. You can feel phantom tongues all over your [pc.sack]. They flick playfully every time your balls lurch");
	output(".");
	
	output("\n\nBefore your muscles can properly clench to release your lusty payload, you feel some of it sliding through your urethra, burning a hot, passionate trail through your not-quite-ready cock before spilling into the hot, wet slickness of the vacuum-chamber. The stream of [pc.cum] doesn’t come in spurts or jets, like a normal orgasm. Instead, it’s one long rope of [pc.cumColor] food for the galotian to devour. You haven’t even reached your peak, but your [pc.hips] and [pc.legOrLegs] are shaking wildly, almost like you’ve gone past orgasm without ever actually experiencing it. Pleasure washes through you, but it’s a needy, aching pleasure, the pleasure of orgasm without the salve of release.");
	// Multivag
	if(pc.vaginaTotal() > 1) {
		output("\n\nYour multiple vaginas, bereft of proper penetration, spasm against a multitude of unbound tongues that rove across their engorged vulvae.");
		if(pc.hasClit()) output(" Sometimes, they touch your clits, other times, t");
		else output(" T");
		output("hey remain firmly affixed to your labia, dexterously twirling across your sex maddenly, but never plunging in");
		if(pc.hasClit()) output(" or connecting with a clit properly");
		output(" enough to set you off. You’re kept writhing and dripping on the edge of orgasm while the constant pulling upon your other genitals drains you dry. Right about now, you’ve give anything to be properly penetrated, to properly cum.");
	}
	// Singlevag
	else if(pc.hasVagina()) {
		output("\n\nYour [pc.vagina], bereft of proper penetration, spasms against a multitude of unbound tongues that rove across its engorged vulvae.");
		if(pc.hasClit()) output(" Sometimes, they touch your clit, other times, t");
		else output(" T");
		output("hey remain firmly affixed to your labia, dexterously twirling across your sex maddenly, but never plunging in");
		if(pc.hasClit()) output(" or connecting with a clit properly");
		 output(" enough to set you off. You’re kept writhing and dripping on the edge of orgasm while the constant pulling upon your other genitals drains you dry. Right about now, you’ve give anything to be properly penetrated, to properly cum.");
	}
	// Tailcock
	if(pc.hasTailCock()) {
		if(pc.tailCount == 1) {
			output("\n\nYour [pc.tailCock] is dripping, though it is not leaking ejaculate with the fervor of your bound erection");
			if (pc.cocks.length > 1) output("s");
			output(". That doesn’t stop Celise from noticing the way the heated droplets of pre-cum spatter across her insubstantial skin. Almost lazily, she extends a pseudopod behind you. You cannot see the rising, gooey enclosure, but you certainly feel it when it makes contact with your trembling tailcock, spreading juice-dripping lips around your thick tailboner. Inch after inch of your throbbing, posterior phallus passes into the suckling hole, and before you know it, it’s squirting out just like your other cock");
			if(pc.cockTotal() > 1) output("s");
			output(".");
		}
		// Tailcocks
		else {
			output("\n\nYour " + plural(pc.tailCockDescript()) + " are dripping, though they are not leaking ejaculate with the fervor of your bound erection");
			if(pc.cockTotal() > 1) output("s");
			output(". That doesn’t stop Celise from noticing the way the heated droplets of pre-cum spatter across her insubstantial skin. Almost lazily, she extends a pseudopod huge behind you. You cannot see the rising, gooey enclosure, but you certainly feel it when it makes contact with your trembling tailcocks, spreading juice-dripping lips around your thick tailboners. Inches and inches of the throbbing, posterior phalluses pass into the suckling holes, and before you know it, they’re squirting out just like your other cock");
			if(pc.cockTotal() > 1) output("s");
			output(".");
		}
	}
	//Resume
	output("\n\n<i>“Feels like, totally good, right?”</i> Celise asks, squeezing her arms and constantly suckling dicksleeves tighter. <i>“Most bodies can’t handle this kind of suction, and they just let it all out without getting any kind of relief.”</i> Spots of [pc.cumColor] are swimming inside her as she teases you. <i>“You taste so good, too! Captain, I could keep you like this all day long!”</i>");
	output("\n\nYou shudder, wracked by rising ecstasy and yet unable to hit the climax that feels so achingly close. The steady ejaculation continues well past when you thought you should have gone dry.");
	if(pc.cumQ() >= 5000) output(" Celise, meanwhile, is flush with fresh fluid, noticeably less cohesive and dripping uncontrolled moisture into a puddle of sex and goo at her base.");
	output(" She draws cum from you until the flow thins, turning runny, more water than protein, and an uncomfortably empty feeling grows even as your [pc.balls] ");
	if(pc.balls > 0) output("empty");
	else output("empties");
	output(". You " + pc.mf("growl","whine") + " in discomfort, lamely bucking your hips in an attempt to get off.");
	
	output("\n\n<i>“Ohhh, it’s drying up,”</i> Celise sadly gushes. <i>“Wanna cum?”</i>");
	output("\n\nYou nod, perhaps a bit too vigorously");
	if(pc.isAss()) output(", growling, <i>“Let me cum, you cunt!”</i>");
	else output(".");
	
	output("\n\nCelise smiles and reduces the suction, cutting off the stream of [pc.cum] a moment before the cylindrical cock-traps start to lurch up and down, back and forth, jacking you off with hot, liquid weight. Your pumped-up, over-sized cock");
	if(pc.cockTotal() > 1) output("s engorge");
	else output(" engorges");
	output(" further, finally getting stroking you craved. You cry out, your muscles clench, and at long last, you cum. Your whole body trembles and shakes with the force of it, ");
	if(pc.cumQ() < 5000) output("even though barely a few drops escape your spasming [pc.cocks]");
	else output("launching huge blasts of previously reserved [pc.cumNoun] into the woman. Her tits, hips, and ass all expand under the deluge, filling until each new rope forces Celise to leak a river of [pc.cumColor]");
	output(".");
	output("\n\nPumping away, the cum-stuffed goo-girl barely seems to care. She expertly fondles [pc.eachCock] through your bliss, wracking you with bliss until every single drop of nutritious seed has been spent in her specially formed compartments");
	if(pc.cumQ() >= 5000) output(" and then summarily deposited on the floor");
	output(". Once you sag down, spent, you’re slowly lowered to the floor and gradually ejected from the goo-girl’s mass to recover. Your [pc.balls] ache");
	if(pc.balls <= 1) output("s");
	output(", but you feel deeply and completely satisfied by the experience.");
	output("\n\nCelise surges back over you and begins to caress your sore ");
	if(pc.balls == 0) output("loins");
	else output("[pc.balls]");
	output(" until you recover. She purrs, “");
	if(pc.cumQ() < 1000) output("<i>I think that was a pretty nice workout for you, huh? If we keep this up, you’ll be properly filling me in no time.</i>");
	else if(pc.cumQ() <= 5000) output("<i>Oh wow, that was filling. You cum just the right amount for me, [pc.name]. You’re so perfect....</i>");
	else output("<i>I think... you need to tone it back a bit, Captain. Maybe let me climb inside you and tune you to have just the right amount of cum for a girl like me. I’ll make it feel good, I promise.</i>");
	output("”");
	output("\n\nStretching languidly, you pull yourself out of her grasp and gather your things. She’s a little over-enthusiastic, but she leaves you with the most satisfying ache in your crotch after a nice suck.");
	if(pc.cumQ() < 1000) {
		output(" You can feel your body responding to her sexual training already if that wondrous throb is any indication.");
		if(pc.balls > 0 && pc.ballSize() < 5) pc.ballSizeRaw++;
		if(pc.ballEfficiency < 400) pc.ballEfficiency++;
		if(pc.cumMultiplier() < 150) pc.cumMultiplierRaw++;
		if(pc.refractoryRate < 15) pc.refractoryRate += .5;
	}
	pc.orgasm();
	celise.orgasm();
	celise.loadInMouth(pc);
	processTime(25+rand(4));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anal Milking
public function celiseDoesSomeAnalMilking():void {
	clearOutput();
	showCelise();
	output("<i>“Yeah, you need a nice, long milking. A " + pc.mfn("boy","girl","person") + " like you has so many things to worry about out here,”</i> Celise soothingly prattles as her body shapes around your [pc.butt], sliding fingers of hot, wet heat through your crack. You gasp and shift inside her only to be pushed back into place by the unstoppable force of a liquid wave crashing over you. <i>“Hold still, Captain, it’s time you were milked. Just relax and I’ll make you feel very good.”</i> Squishy, half-formed fingers clasp [pc.eachCock], bouncing ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(" lightly. <i>“Very good,”</i> she purrs.");
	//Jackass
	if(pc.isAss()) output("\n\nYou reply, <i>“I’m only doing this because you’d be insufferable otherwise,”</i>");
	//Mischievious
	else if(pc.isMischievous()) output("\n\nYou nervously ask, <i>“Are you sure you know what you’re doing back there?”</i>");
	//Good
	else output("\n\nYou politely ask, <i>“Just be careful, okay?”</i>");
	output(" but it is hard to keep the catch of anticipation out of your voice. The feeling of the aqueous woman’s form surging over the most intimate cracks and crevices of your body is sending pleasant tingles through your body, particularly as she massages the ring of your [pc.asshole]. Your [pc.cocks] give");
	if(pc.cockTotal() == 1) output("s");
	output(" an eager twitch at this, even constrained by the gelatinous mass as they are. Tender licks trace along ");
	if(pc.cockTotal() > 1) output("their forms ");
	else output("its form ");
	output("in response, affectionately rewarding you for the feeding to come.");
	output("\n\n<i>“I’ll be soooo careful,”</i> Celise coos while slipping a thread-sized pseudopod through your pucker. <i>“You deserve to be pampered from time to time, to be massaged and caressed.”</i> The gel-crafted intrusion thickens, forcing your sphincter to dilate wider. It’s now the size of a finger and pressing a few inches into your [pc.asshole]. Bubbling heat passes inside you, and you feel the tip of it thickening, shaping your internals to hold it. It feels like a fat bulb on the end, probably the size of an apple by the way you can feel it pushing on you, yet its insertion is as gentle the barest hint of friction on your ring.");
	output("\n\nGiggling, Celise watches your face as she works. <i>“Feeling it now, [pc.name]?”</i>");
	output("\n\nYou have to admit that you are. Your [pc.cocks] ");
	if(pc.cockTotal() > 1) output("are");
	else output("is");
	output(" harder than before. ");
	if(pc.cockTotal() > 1) output("Each of them are");
	else output("It is");
	output(" growing ludicrously hard, twitching powerfully as the weight inside you intensifies. You feel fully hard at this point, almost as hard as when you’re on the cusp of orgasm. Your body is responding the goo-girls internal pressure with arousal, and you have to admit that it feels good. The shape inside you is changing as it’s growing so that the pressure isn’t crushing the most pleasant place inside you too powerfully. Instead, it’s surrounding that tough, inner bulge (what can only be your prostate), squeezing down on it from three sides in a way that makes your [pc.cockHeads] expand.");
	
	output("\n\nThe rest of Celise isn’t idle either.");
	
	// Nipple dick docking
	if(pc.hasNippleCocks()) {
		output("\n\nYour nipples part as the pressure on its prostate affects all your penises, forcing your " + plural(pc.nippleCockDescript()) + " to emerge from your surprisingly sheath-like areola, parting the sensitive skin to expose new pillars of throbbing hardness. Celise doesn’t seem shocked by this at all, in fact, her smiling face displays nothing but delight. She leans forward, lifting her heaving bosom up toward your protrusions to press her own nipples against your exposed titmembers. Her supple, pebbly areolae part around you as she leans forward, giving a tiny bit before they flex inward, slowly, deliciously starting to part around your throbbing, leaking hardnesses.");
	}
	// Nipplecunt dock
	else if(pc.hasFuckableNipples()) {
		output("\n\nYour nipples begin to leak liquid lust as the prostate pressure pushes you into arousal overdrive. The areolae protecting your [pc.nipples] part ever so slightly, revealing their true nature to the busy galotian, who only smiles at the sight. She leans forward, lifting her heaving bosom up to be level with your own, her pebbly protrusions growing longer by the second, first extending an inch past her mammaries and then another... and another.... The dripping wet, nipples have become boners");
		if(pc.nipplesPerBreast > 1) output(", splitting lengwise into a number suitable to match your " + num2Text(pc.nipplesPerBreast) + " entrances");
		output(", and they brush your hungry holes for a second that seems to go on forever. Celise pushes forward, sliding inside of you, fucking you top and bottom in an attempt to get you off.");
	}
	//Either nipple fuck tree.
	if(pc.hasNippleCocks() || pc.hasFuckableNipples()) {
		output("\n\nCelise’s chest discolors with the fluids leaking from your chest, swelling the more you give them. She sways back and forth, easily pivoting on her liquid undercarriage in order to smash her tits flat against yours, smushing them out to the sides in a way that draws your eyes to her, watching the chesty nipplefuck as it progresses thanks to her unusual transparency. The goo-girl moans in sensuous enjoyment, smacking her lips against your own in kisses to punctuate each chest-deep fuck.");
	}
	//Resume
	output("\n\nThe gooshy juices surrounding your [pc.cocks] draw back a little, ceasing their stimulation for some reason unknown to you, but you drip pre-cum all the same. Deep inside your [pc.asshole] there’s a increase on the pressure around your prostate, forcing a steady strand of pre-cum to leak into the hollow chamber");
	if(pc.cockTotal() > 1) output("s");
	output(" around your [pc.cocks]. Your [pc.legOrLegs] twitch");
	if(pc.legCount == 1) output("es");
	output(" from the pleasure, aching to fuck something, anything, but you’re waist deep in a goo woman who seems intent to milk you from behind. You gasp, <i>“More!”</i>");
	output("\n\n<i>“Are you sure you sure, Captain [pc.name]?”</i> Celise moans in enjoyment. <i>“I - ohhhh - don’t think I’ll be able to stop once I start.”</i> Her whole form jiggles with quakes of enjoyment.");
	output("\n\nNodding, you cry, <i>“Yes! I can’t wait any longer!”</i>");
	
	output("\n\nStarting at the base of the mound encircling you, vibrations begin to ripple up the emerald cock-milker’s body. You can feel it rippling around your [pc.legOrLegs], squeezing and sliding over so fast that it feels like a constant massage. Then, it moves up to your crotch, rubbing every part of you so nicely except for your [pc.cocks], which ");
	if(pc.cockTotal() == 1) output("is hanging exposed in an empty chamber");
	else output("are hanging exposed in empty chambers");
	output(", dripping strands of pre-protein to feed Celise. Shaking its way past your [pc.asshole], the thrumming, massaging pressure spreads into the prostate-shrouding goo inside you, battering the sensitive organ with pleasure until your body is spurting tiny ropes of [pc.cum] into the ready goo-tank");
	if(pc.cockTotal() > 1) output("s");
	output(".");
	output("\n\nBlissfully cooing, Celise seems to be enjoying this just as much, if not more, than you, and you’re experiencing a wonderfully unusual orgasm. Every strong vibration squeezes out a thick dollop of your cock-cream into the hungry goo-girl, forcing you to experience blissful jet after blissful jet, but the climax is completely controlled by the constant, squeezing vibrations. It doesn’t feel like an end is coming, only more and more ejaculations. The portion of her in your colon is getting bigger with every passing second and squeezing more and more of your reserves out each time.");
	output("\n\nYou shudder and gasp, eyes rolling, mouth frothing, and [pc.hips] lurching spasmodically as you’re milked. [pc.Cum] drizzles out of [pc.eachCockHead], piling up in the bottom of Celise’s milking tube before wicking away. The goo-girl’s middle ");
	if(pc.cumQ() < 600) output("slowly colors [pc.cumColor] as she’s fed your juice.");
	else if(pc.cumQ() < 1200) output("slowly rounds, turning halfway [pc.cumColor] as feeding forces her to adopt a pregnant appearance.");
	else if(pc.cumQ() < 5000) output("quickly rounds with heavy, liquid weight. Her middle has turned [pc.cumColor], showing you quite clearly how well you’re feeding her.");
	else output("balloons out comically, actually pushing up against you as it’s filled with [pc.cumColor] deposits. The poor girl can barely contain it all, and you see some of your [pc.cum] leaking out around her base.");
	output(" She squeezes your prostate with vibrating strokes, filling your colon with warmth and pleasure until every single drop of potential food has exited your body.");
	//Tailcunt
	if(pc.hasTailCunt()) output("\n\nSeeing little action itself, your [pc.tailCunt] can do naught but clench hungrily and leak on the floor, jealous of the feeding that emerald slut is receiving.");
	//Tailcock
	if(pc.hasTailCock()) {
		output("\n\nSeeing little action itself, your [pc.tailCock] can’t quite get off with its brothers, forced to lamely drip into a puddle on the floor. Celise’s base is happy to collect the spilled pre-cum");
		if(pc.cumQ() >= 5000) output(", though she fails to retain it due to the massive fluid injections you’re forcing into her");
		output(".");
	}
	output("\n\n<i>“Good " + pc.mfn("boy","cum-cow","cum-cow") + ",”</i> Celise purrs as she works. <i>“Let it all out...”</i> Your eyes roll back as your rectum is flooded with yet more of her warm vibrations, pushing more and more inside you until your belly bulges slightly. The orgasm you’ve been locked in for what feels like forever just drags on, not ending your waist goes numb and your squeezed-out prostate feels achy and pained.");
	output("\n\nSensing this, the jade-eyed honey begins to exit your stuffed backdoor in much the same way that she entered - a narrow, painless thread of slippery biological matter that releases you from your forced spurting. You sag into her slick arms");
	if(pc.hasFuckableNipples() || pc.hasNippleCocks()) output(", feeling your nipples pop apart");
	output(", and the ");
	if(pc.cumQ() >= 1000) output("well-");
	else if(pc.cumQ() < 300) output("barely-");
	output("fed goo-girl guides you down next to your possessions with bubbles of [pc.cum] floating inside her, slowly dissolving.");
	output("\n\nCelise plunges her fingers into her nipples as she watches you recuperate, fucking herself through a number of orgasms as you rouse and re-dress. When you leave, the hungry galotian is slumping back into her heated pipes, cooing and rubbing her belly with an exhausted look on her face.");
	pc.orgasm();
	celise.orgasm();
	processTime(25+rand(4));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Inside Milking
public function celiseGoesInYerBallsYo():void {
	clearOutput();
	showCelise();
	output("<i>“Yeah, going inside sounds super fun,”</i> Celise muses. ");
	if(pc.balls > 0) output("\n\nShe cups your [pc.sack] gingerly");
	else output("\n\nShe traces around your crotch gingerly");
	output(". <i>“A shame I can’t just crawl the whole way in there and slurp down on your yummy boysauce all day, but then you wouldn’t be able to run around having adventures would you? You’d just be stuck to the floor,");
	if(pc.balls > 0) output(" cumming endlessly into me while you twitch on top of your swollen sack.");
	else output(" pulled down by weight of your belly. Your prostate would be so stuffed with me that you’d look pregnant with dozens of kids, cumming endlessly yet never letting any out of your own body.");
	output("”</i> She stops her fantasizing to cup [pc.oneCock] and lick the [pc.biggestCockHead]. <i>“Mmmm, are you ready?”</i>");
	//These should be obvious where they go.
	//[Yep] [Nevermind, suck] [Nevermind, milk me]
	clearMenu();
	addButton(0,"Yep",yepGetInMyBallsUBitch);
	addButton(1,"No, Suck Me",celiseSucksYouDry);
	addButton(2,"No, Milk Me",celiseDoesSomeAnalMilking);
}
public function yepGetInMyBallsUBitch():void {
	clearOutput();
	showCelise();
	output("You ");
	if(!pc.isAss()) output("bite your lip and ");
	output("nod.");
	output("\n\n<i>“Let’s get you nice and big first. I want the journey in to be easy, and lubricated,”</i> the emerald woman explains. Her hand reaches up to the [pc.biggestSheath] of your [pc.cockBiggest] and encircles it. Her thumb, index, and middle fingers merge together into a jade loop, wetly squishing as they seal into a tight ring right around you. Blood flows into your filling boner, but it doesn’t come back out, forcing the bulging bitch-breaker bigger and bigger with each passing second. You gasp at the sensation when Celise takes the [pc.biggestCockHead] straight into her mouth, plumping her lips bigger and fatter around you. Just like your penis, they get bigger and fatter with each passing second, swelling until your boner is wrapped in plump, juicy goopillows.");
	output("\n\nGasping out encouraging pants, you reach down towards Celise’s wobbling mounds, sinking your digits deep into the forgiving, semi-liquid surface of her barely-congealed melons. She gasps and moans while your fingers slip deeper, and the slippery surface fades into thick, viscous warmth around you. You swirl your hand around, feeling the inside of her tits and making the gelatinous female gasp at being fist-fucked in her own tit. She breaks from your [pc.cockBiggest] to whimper, <i>“More,”</i> arching her back encouragingly.");
	output("\n\nYou give her what she wants by pulling out and shifting down to her nipples, pressing your thumb down hard on the pebbly surface until it parts into a sopping-wet orifice. Celise’s entire body is like one big, juicy cunt just waiting to be penetrated. With your other fingers, you squeeze her nubs, compressing them into nice tight slits that are sure to feel good as your thumb slides through them.");
	output("\n\nGlittering moist ringlets drop back down around your crotch in a semi-transparent veil, barely concealing the lewd suckling and muffled moans taking place within. Celise has returned to getting you ready, use her luscious lips and suddenly toothless maw to wrap your [pc.cockBiggest] in a syrupy tunnel of bliss. You jerk your hips in lewd little shakes against her while she works, feeling yourself clench and twitch within oral vice, already feeling a rush of warmth beginning within you that culminates in the expression of slick droplets of pre-cum.");
	output("\n\nAs soon as she tastes the beginnings of fluid release, Celise edges off your cock, connected by a web of glittering strands that hang from her chin to your " + pc.cockHead(pc.biggestCockIndex()) + " before breaking. Both of you sit there panting, joined together at your [pc.legOrLegs]. The goo-girl announces, <i>“It’s - ooohhh... ungh! It’s r-ready!”</i> Her voice stutters while your hands continue to play with her immense tits, fucking her nipples while the rest of your fingers slip deeper into the emerald surface, eventually finding pleasant sinkholes of their own to plumb.");
	output("\n\nGathering herself, Celise shudders before holding your [pc.cockBiggest] in one hand, her own thumb curling up to press against your oozing cumslit. Hot pressure can be felt probing that leaking tip, compressing and distorting into the shape of your fluid-filled cumtunnel.");
	output("\n\n<i>“I hope you’re ready to cum,”</i> she bubbles.");
	output("\n\nYou start to answer, but that pressure spikes, pushing the pre-cum back through your urethra");
	if (pc.balls > 0) output(" and into your [pc.balls]");
	output(", turned back by a wave of emerald goo that’s filling every inch of your plumbing. It doesn’t hurt at all, surprisingly, it’s more like a tingle of warm, juicy goodness that slithers inside of you, forking off to touch every single cum-producing organ in your body. Your seminial vesicles are flooded. Your prostate is plugged. ");
	if(pc.balls > 1) output("Even your balls grow heavy and warm. ");
	else if(pc.balls == 1) output("Even your ball grows heavy and warm. ");
	output("With each passing second, your sexual organs are more and more stuffed with the hungry goo-girl’s green goop until you wonder how you’ll hold it any more.");
	pc.cockChange();
	output("\n\nIt is at that point that Celise finally breaks contact with your [pc.cockBiggest], depositing a wet kiss upon its " + pc.cockHead(pc.biggestCockIndex()) + " as the last of her stuff disappears into your urethra. The strange tingles that her actions have filled you with cause your [pc.legOrLegs] to quiver slightly, and you nervously grab your slime-shined penis, examining it while your innards shift. You feel so full!");
	output("\n\nLong lashes flutter innocently as Celise watches you squirm. She idly runs her hands across the expansive curve of her chest before pulling you deeper into her base, snuggling your head between her tits and securely ensconcing your groin in the gentle mass. <i>“Wait for it,”</i> she coos, stroking your back with one hand and your [pc.chest] with the other.");
	output("\n\n<i>“Wait for what?”</i> you retort, finally starting to feel more at ease with the squirming inside you. Before the question leaves your mouth, the warmth inside you changes to a fervent stroking, caressing the entirety of your reproductive system from the inside. The heat in your [pc.balls] doubles in that moment, and you cry out in excitement, back on the cusp of cumming once more. An explosion of bliss explodes from deep within you, and you feel your body clenching and pumping, producing all the sensations of a hot, messy orgasm. However, unexpectedly, nothing emerges into the waiting goo maiden’s mass.");
	output("\n\nSeeing your questioning look, Celise comfortingly caresses your ");
	if(pc.balls > 0) output("swelling balls");
	else if(pc.hasVagina()) {
		output("puss");
		if(pc.vaginaTotal() > 1) output("ies");
		else output("y");
	}
	else output("taint");
	output(" with warm pleasure and explains, <i>“");
	if(flags["TIMES_CELISE_IN_BALLS"] > 0) output("Don’t you remember? Well, let me explain again while you enjoy the pleasure. ");
	output("The part of me that’s inside you right now is stimulating your body to orgasm, as you can surely feel.”</i> You cry out a moan as an answer, unable to articulate anything more complex. Your body pumps the cum around inside itself, but it doesn’t seem to go anywhere. <i>“Yeah, I’m redirecting the yummy stuff back into your [pc.balls], but I’m tricking ");
	if(pc.balls <= 1) output("it into thinking it’s empty so that it");
	else output("them into thinking they’re empty so that they");
	output("’ll go into overdrive and make more. I’m just going to leave you cumming like this until your body wears itself out making cum. Then I’ll let it all out into these condoms,”</i> she gestures toward a nearby pail of nanoweave condoms before continuing, <i>“for a snack later!”</i>");
	output("\n\n<i>“Whaaaa... ahhh!”</i> you cry, arching your back and twitching your [pc.hips] around inside Celise, feeling her inside and outside, massaging your body to a tremendous orgasm. This time, you feel the [pc.cum] sliding around inside you, pouring into your [pc.balls] so heavily that you can feel ");
	if(pc.balls <= 1) output("it");
	else output("them");
	output(" expanding, filling with pleasant weight a moment before the next explosion of bliss rolls in. Your lids lazily droop as the consecutive cums take their toll on your consciousness, letting your mouth hang out while you’re brought to a third ");
	if(pc.balls > 0) output("ball-filling");
	else output("prostate-pumping");
	output(" orgasm. This time, there’s a definite sense of stretching - of filling beyond normal capacity, and you whimper as it concludes, immediately feeling the twinge of a fourth starting.");
	output("\n\n<i>“Shhhh, shhh,”</i> Celise soothes. <i>“Don’t yell so loud, they’re just orgasms.”</i> Despite her calm tone, the goo-girl is rapidly sliding herself all around you, bucking her amorphous base back and forth around [pc.eachCock]. She’s actually lost a bit of cohesion; her heavy breasts are merging back into the rest of her and dripping green moisture down into the rest of her. Clearly she’s enjoying herself as well, something she confirms when she cums, spouting green trickles from both her nipples as she does. You lack the capacity to capitalize on this, as you’re cumming for the seventh or eighth time. It’s getting too hard to keep track. Your ");
	if(pc.balls > 0) output("[pc.balls] feel like they’ve doubled in size, stretching your sack taut with their sloshing weight.");
	else output("prostate feels like it’s doubled in size, large enough that it’s actually formed a visible bulge in your belly.");
	output("\n\nCumming like that, wrapped in comforting goo and endlessly orgasming into your own spunk-reserves, you slip from conscious awareness, focusing entirely on how good it feels. Celise is similarly affected by the experience. Her green goop is splattering all over the walls with how hard she’s humping you, and she constantly prattles encouragingly to you.");
	output("\n\n<i>“Cum again, [pc.name]!”</i>");
	output("\n\n<i>“Ohhh, look at how big ");
	if(pc.balls > 0) output("those");
	else output("you");
	output(" are getting!”</i>");
	output("\n\n<i>“A little more, [pc.name], just cum a little bit more.”</i>");
	output("\n\n<i>“You don’t mind if I get a few more cums of my own in before I stop, do you?”</i>");
	output("\n\nYou lose track of her words soon enough, aware only of how your ");
	if(pc.balls == 0) output("[pc.belly]");
	else output("[pc.sack]");
	output(" is swelling out with all the unspent cum. Before long, you’ve grown so full of jizz that you don’t think could move if you wanted to. ");
	if(pc.balls > 0) output("Your immense, sloshing balls would keep your [pc.legOrLegs] from making contact with the ground, if at all, and the feeling of dragging them along would likely just set");
	else output("Your immense, sloshing middle is so heavy that you doubt you could lift it up, and the prostate contained within is so sensitive that dragging yourself along the floor would probably make you pop");
	output(" off a fresh orgasm...");
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	celise.orgasm();
	processTime(90+rand(5));
	//[Next]
	clearMenu();
	addButton(0,"Next",celiseInBallsFinalEnding);
}

public function celiseInBallsFinalEnding():void {
	clearOutput();
	showCelise();
	output("Abruptly, you’re aware of the feeling of the incredible, pleasant pleasure draining out of you, releasing the backed-up [pc.cumNoun] in a wave of ecstasy. There’s a snug tightness around [pc.eachCock] that grows tighter by the moment, and it isn’t nearly as warm or wet as the pressure you felt before. You pull your tongue back in your mouth, but you still cannot manage to suppress your pleasured moans, looking down to watch the pink surface of a condom bloating with [pc.cumColor] fluid. [pc.eachCock] is lurching powerfully, pumping out huge deluges into the beachball-sized balloon of condensed lust.");
	output("\n\nCelise plucks up fresh condoms to drop into herself. One after another, their wrappings open and their contents are drawn out. The discarded packaging ejects from her blobby undercarriage to land in a nearby trashcan. Your orgasm is once more arrested, redirected back inside yourself, causing you to give a high pitched whine of disappointment, but it does not last long. [pc.eachCock] has its condom pulled off, tied into a wobbling balloon, and then replaced with a fresh one. Once the new cum-receptacle is in place, your reproductive efflux is let free again.");
	output("\n\n<i>“Fill ‘er up!”</i> Celise giggles, stroking you encouragingly. <i>“");
	if(pc.cumQ() >= 5000) output("You cum too much normally anyway.");
	else output("This is a good way to make sure you make enough to feed me anyway.");
	output("”</i>");
	output("\n\nYou fill that balloon and more like it until there is a small mountain of stored cum bobbing under its own liquid weight next to you. At that point, Celise runs out of condoms and shrugs. She removes the last one and gingerly squeezes your [pc.cockBiggest], purring, <i>“I’ll take the rest, go on.”</i>");
	output("\n\nBoy, do you ever. Torrents of [pc.cum] wash into your pet galotian, flooding her body with [pc.cumColor] deposits. Her huge breasts distend, her belly expands to the point where she looks pregnant, and her asscheeks turn into two ginormous globes of barely-restrained spunk. Eventually, she can hold no more, and the force of your orgasm propels you out of her body. You lie there, gasping and crying from the immense ecstasy, painting her [pc.cumColor] with the last of your pent-up bliss. Even after you go dry, your [pc.cocks] ");
	if(pc.cockTotal() > 1) output("are");
	else output("is");
	output(" lurching wildly, still trying to cum. You don’t stop cumming until at long last, a few cups of green ooze slide out of your [pc.cockHeads].");
	output("\n\nYou sag down, experiencing relief at last. Your ");
	if(pc.balls == 1) output("ball has");
	else if(pc.balls > 1) output("balls have");
	else output("belly has");
	output(" shrunk back down to normal, leaving nothing but a dull, almost painful ache to remind you of the never-ending orgasm you seem to have experienced. Celise has busied herself moving the condoms towards a refridgeration unit, leaving you a moment to dry off, catch your breath, and get dressed.");
	if(pc.cumQ() >= 5000) {
		output(" With how hard you’re throbbing down there, you think you might have permanently lowered your ability to produce cum. Perhaps you’re a bit more productive than Celise would prefer?");
		if(pc.cumMultiplierRaw > 10) pc.cumMultiplierRaw -= 5;
		if(pc.ballEfficiency > 20) pc.ballEfficiency -= 10;
	}
	output("\n\nThe area is a total mess, but you’re sure the goo-girl will suck it up soon enough.");
	IncrementFlag("TIMES_CELISE_IN_BALLS");
	processTime(7);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Feed Celise (F)
//D-d-double MASSIVE Penetration. Waddle walk ftw.
//By Savin
public function feedCeliseBySavin():void {
	clearOutput();
	showCelise();
	author("Savin");
	output("With one look at the massively busty green beauty, so desirous in her sexual need, your hands move to ");
	if(pc.armor.shortName == "") output("discard your gear");
	else output("strip yourself from your [pc.armor]");
	output(". The galotian girl beams as you set your kit aside, and quickly surges toward you, her body literally stretching out to grab your arms, drawing you into her gooey embrace. Being drawn into her feels like falling continuously, your body half-enveloped in her gel-like mass that bubbles and sloshes around your [pc.legOrLegs]. Celise’s amorphous lower half ebbs and flows across your bare [pc.skin], seeking across every inch of flesh as her more human parts press against your [pc.chest], smearing you with her green quasi-liquid skin.");
	output("\n\nWarm and relaxing, you let the goo-girl wrap around you, stripping away the last of your kit. She giggles girlishly as her big, alien eyes gaze between your [pc.legOrLegs] to your [pc.pussies], and she makes a show of licking her lips as she bends her body almost double to put her face right in your crotch. You can’t help but shudder as Celise’s steamy breath washes over your bare sex");
	if(pc.hasCock() || pc.vaginaTotal() > 1) output("es");
	output(", her cute little nose practically brushing");
	if(pc.hasClit()) output(" [pc.oneClit]");
	else if(pc.vaginaTotal() > 1) output(" one of your slits");
	else output(" your slit");
	output(". The way she watches you, studying your cunt");
	if(pc.vaginaTotal() > 1) output("s");
	output(", soon has your own excitement building, and the hungry goo gives a delighted squeal as a little bead of lubricant escapes the lips of your [pc.pussy].");
	output("\n\n<i>“Wow, you’re already dripping just from me looking. Naughty!”</i> Celise laughs, her long tongue flicking out to lap the little drop up. The feeling of her gel-tongue sliding across your vulnerable twat, the very tip parting your lips to suckle up that lonesome drop, nearly has your [pc.knees] buckling under you. With a devilish grin, she adds, <i>“Mmm, tasty.”</i>");
	output("\n\nSeeing the galotian girl about to get busy, you try to lean back - standing’s no way to get eaten out, after all - but in the blink of an eye you’re tumbling down, caught at the last moment by the great shapeless blob of Celise’s lower half. She looks more like a beanbag chair than a human as you float and bob atop her, sinking several inches into her before she hardens up just enough to keep you steady. A shift in her gooey body spreads your [pc.legOrLegs] as she looms over you, licking her lips with a feral hunger. You shudder with involuntary pleasure as her gooey body shifts and squirms around your bare [pc.skin], the sensation alien and yet oddly comforting. You feel an odd, but not unpleasant sense of ease and calm whilst enveloped in the warm, sticky goo; though that hardly stops you from tensing as her delicate, slender fingers reach down to trail across your thigh, leaving wet streaks across your [pc.skin] as she slides her hands toward your bared [pc.pussies]. As her fingertips trail around your [pc.vagina]");
	if(pc.hasClit()) output(", one brushing the tip of your [pc.clit]");
	output(", you try and relax yourself, readying for penetration.");
	output("\n\nInstead, the playful goo just takes your " + possessive(pc.vaginaDescript()) + " lips and spreads them apart. You yelp as she stretches you out, peering down to look right into your gaping pussy. You start to ask what she’s doing, but she just giggles, <i>“Gotta make sure it’s juuuust the right size!”</i>");
	output("\n\n<i>“It?”</i>");
	output("\n\nShe gives you a grin. <i>“You’ll see!”</i>");
	output("\n\nYou gulp, but that quickly turns to a hiss of surprise as the galotian’s fingers slip down from your [pc.cunt], practically pouring into your [pc.asshole]. Your sphincter clenches instinctively, but it’s nowhere near enough to stop Celise’s advance: her fingers become so improbably thin that they can effortlessly pass through your shocked muscles, tickling the sensitive walls beyond. Your back arches instinctively, a sharp sigh of pleasure escaping your lips. Celise coos in delight, and suddenly you can feel the slim fingers inside you swelling, growing larger and larger, filling you until your hole seems to strain to accommodate the tremendous goo mass inside you.");
	output("\n\nCelise watches you writhe and moan on her gooey insertion with rapt attention, her lips locked in a silent, plush O that looks so perfect to kiss. You wring your arms free of the gooey mass around you and pull her down, [pc.legOrLegs] wrapping around her huge hips as you taste her. Sweet and hot on your lips, your tongue probes into the galotian’s open mouth, pulling her into a tight kiss; she responds with a quick thrust into your ass, shooting so deep into you that your stomach practically bulges between you.");
	output("\n\nJust as easily as she started, though, Celise withdraws, leaving you feeling so very, very empty. She breaks the kiss, her hands sliding up your body to caress your [pc.chest]. Through her transluscent arms, though, you can see her crotch shifting and twisting, the amorphous goo reforming into " + num2Text(pc.vaginaTotal() + 1) + " thick, dripping goo-cocks that flop down onto your thighs. God, they’re huge: made just for you, each more than big enough to stretch you to your limit. A soft whimper escapes your lips as the soft appendages drag down your thigh, each lining up with the hole it seems so perfectly made to match.");
	output("\n\nCelise hovers at the very edge of penetration, letting you feel the pressure of " + num2Text(pc.vaginaTotal() + 1) + " thick shafts pressing against your holes. The merest moment of this and your body practically seizes up with dread as the goo’s huge tools press against your [pc.pussies] and ass, ready to tear you apart. All you can do is brace yourself, try to relax your fearful muscles in the face of the massive penetration about to happen.");
	output("\n\nCelise hesitates for a moment, just long enough to give you a sultry wink and a hungry moan of anticipation before her big hips push forward. You bite your lip, fingers digging into the gooey bed around you as your [pc.pussies] and [pc.asshole] desperately try to accommodate the unrelenting force being ramming into them. You give a shrill cry of pleasure as the first of Celise’s massive goo-cocks plunges into your [pc.cunt], finally stretching your pussy-lips agape and ramming through. All at once, the momentum of the first cock carries the others through, battering through your spasming muscles. You scream, the pleasure absolutely overwhelming as ");
	if(pc.totalVaginas() == 1) output("both");
	else output("each of");
	output(" your holes are suddenly filled with thick, hot goo.");
	//STRETCH ALL PUSSIES AND BUTTHOLES GOOOOOOOOOO
	for(var x:int = 0; x < pc.vaginaTotal(); x++) {
		pc.cuntChange(x,pc.vaginalCapacity(x));
	}
	pc.buttChange(pc.analCapacity(),true,true,false);
	output("\n\nYour orgasm is almost instantaneous; your body is completely overwhelmed by the moment, your holes forced agape by the " + num2Text(pc.vaginaTotal() + 1) + " dripping hot rods Celise is fucking into you. Your [pc.pussies] and ass quiver in response, spasming and squeezing around the cocks forced inside them, your [pc.pussies] spasming and squirting, dousing the viscous goo-cocks with your fem-cum. Celise gives a quiet moan of satisfaction as she drinks it up, absorbing every drop of your orgasmic fluids");
	if(pc.cockTotal() > 0) output(", grabbing your [pc.cocks] and jerking them off until they, too, erupt in a salty stream right onto her face. She needn’t eat it, but simply absorbs the [pc.cumColor] smear on her cheeks right up, her face’s normally bright green hue shifting a touch [pc.cumColor]");
	output(".");
	output("\n\nBut that’s nowhere near enough to sate the goo’s lust. Celise just grins and coos happily, her fingers pinching around your [pc.nipples] as her hips push her cocks deeper and deeper. There’s no denying the bulge in your gut now, and your entire body feels like it’s being pulled apart by the tremendous amount of Celise’s body being forced into you, filling your [pc.pussies] up to the womb");
	if(pc.vaginaTotal() > 1) output("s");
	output(" and pouring into your bowels, slickening every inch of your myriad inner walls with her liquid essence.");
	output("\n\nStill recovering from your massive gut-wrenching orgasm, you can do nothing but float listlessly atop Celise’s gooey body as the galotian girl starts to thrust: her hips are utterly still, but you can feel the alien quasi-cocks inside of you flooding back from your depths... only to come ramming back a moment later, nearly making you cum again on the spot. The second thrust finishes the job, but the third has you screaming, head thrown back as your quiver and cum, body writhing helplessly in a sea of goo as Celise reams your every hole again and again.");
	
	output("\n\nCelise keeps you cumming again and again, endlessly crashing over the edge of bliss as her gooey dicks pound your [pc.asshole] and [pc.pussies]. She seems to swell and liven with every orgasm she fucks out of you, feeding on your sexual juices like a vampire. She uses you for what seems like eternity, pounding your holes until all you can think of is your massive, gaping fuck-holes filled with her alien goo. Your cries die out to pitiful, pleasured whimpers, your sex-addled mind unable to produce anything more throughout the ages of gooey intercourse until finally you feel the tendrils of slime withdrawing from you, leaving your entire body feeling loose, sore, and empty.");
	output("\n\n<i>“Sooo tasty,”</i> Celise purrs, licking her lips as the last tendril pops out of your [pc.asshole] with a wet squelch. <i>“Thanks, cap! That’ll last me a loooong time.”</i>");
	output("\n\nYou just groan weakly and roll off of her amorphous body, flopping onto the floor. Barely cognizant enough to pick up your gear");
	if(!pc.isNude()) output(" and clothes");
	output(" after the mighty railing you just got, your feel your [pc.legOrLegs] bowing, barely able to stand with how stretched you are. You waddle off, sexually and physically exhausted and feeling more loose than you could ever have imagined.");
	
	processTime(35 + rand(10));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//RoombaGoo
// Savin Author!
// Small chance to play after the PC masturbates w/ a cock OR fuck Kiro
public function celiseRoombaGoo(clearText:Boolean = true):void
{
	showCelise();
	if(clearText)
	{
		clearOutput();
		author("Savin");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else
	{
		output("\n\n");
	}
	output("As you’re lounging in your cabin, still recovering from your sexual bliss, you notice a strange... slurping sound coming from your door. You look down from the uberkitty video on your Codex’s screen to see a green goop pouring in through your lock");
	// First Time
	if(flags["CELISE_ROOMBA_GOO"] == undefined)
	{
		output(". In a moment of panic, you scramble back to the corner of your bed, grabbing your [pc.weapon] as the goo plops onto the floor... and congeals into a vaguely Celise-shaped blob. Apparently oblivious to your presence, the perky little goo-girl rolls around on your cum-splattered floor, happily absorbing the spunk smeared across the deck. You watch with awkward quiet as the galotian mops up after you, humming merrily to herself as she gobbles up your seed, turning a paler shade of green and leaving your floor spotless.");
		output("\n\nHuh. You always wondered how the ship stayed so damn clean.");
	}
	// Repeat Variant
	else
	{
		output(" and congeals into a vaguely Celise-shaped blob. Apparently oblivious to your presence, the perky little goo-girl rolls around on your cum-splattered floor, happily absorbing the spunk smeared across the deck. You watch with amused quiet as the galotian mops up after you, humming merrily to herself as she gobbles up your seed, turning a paler shade of green and leaving your floor spotless.");
		output("\n\nGood on her, keeping the ship nice and sparkly.");
	}
	IncrementFlag("CELISE_ROOMBA_GOO");
	processTime(30+rand(10));
}

//Celise Sleaze
//Requirements: PC C-cup or above, lactates, and has junk of some kind
public function celiseSleezeLactation():void {
	clearOutput();
	showCelise();
	author("Nonesuch");
	//First time
	if(flags["LACTATION_FED_CELISE"] == undefined)
	{
		flags["LACTATION_FED_CELISE"] = 1;
		output("You grin and shake your head to Celise ostentatiously filling out her chest as you approach, like some kind of obscene, gooey peacock. All her unsubtle action does is remind you of the weight of your own full boobs - how your [pc.chest] very often feels the way Celise looks when she sees you coming, engorging inexorably with [pc.milk] until they are plump with tight, warm pressure, your [pc.nipples] lavish and almost achingly sensitive, begging to be touched and sucked....");

		output("\n\nYou touch one of your [pc.nipples] absently and manage to refocus on your goo girl pet. Or more specifically on her soft, plump lips. The creature seems to have evolved specifically to lick, nurse, and imbibe - just looking at her mouth makes you want to stuff it with something, to fill her orifices completely until her eyes roll back in their sockets through sheer glut.");
		if(pc.intelligence() > 60) output(" It must be some form of subliminal suggestion, speaking to you wordlessly through the shape of her mouth and the wetness of her form. The galotians have spent millennia enticing other creatures to part with their fluids after all, and however dumb Celise might come across as, she clearly has an encyclopaedia of tricks she instinctively reaches for when she sees a big, fleshy milk float like you coming. Recognizing the urge as an outside animal will pressing on you doesn’t make it feel any less real, though.");
		output("\n\nAlthough it’s always difficult to read her facade of a human face, the way her mass quivers and roils, reforming her smooth hips over and over again, suggests she finds your long stare at her disquieting. She giggles nervously, fingering a tendril of hair. <i>“Is everything alright, [pc.name]?”</i>");
		output("\n\nYou smile. Holding her gaze you");
		if(!pc.isChestGarbed()) output(" slide your [pc.upperGarment] down, slowly releasing your [pc.chest] into the warm, dry air.");
		else output(" run your hands across the top of your [pc.chest] enticingly, slowly teasing your [pc.nipples] in the warm, dry air.");
		output(" Celise’s eyes move downwards and all worry evaporates from her face, replaced by a familiar all-encompassing look of hunger.");

		output("\n\n<i>“Ooh. Would it be alright if I - would you mind if I put my mouth on those? They look like something I’d like to, mmm, get to know.”</i>");

		output("\n\nYou say, with as much coyness as you can muster, that you’re not really sure. At the same time, you slowly sink to the floor, lowering yourself down until you are sitting comfortably. You allow your bare breasts to bounce, their heavy liquid weight making you sigh as they ripple, the smallest drop of [pc.milk] oozing from one of your engorged nipples. Like a filing drawn to a magnet, Celise puddles towards you");
		if(!pc.isTaur() && !pc.isDrider()) output(" and you don’t offer any resistance as she climbs onto your lap");
		output(". Her wet, warm bulk presses on your stomach as she manages to tear her eyes off your boobs, raises her head level to yours and adopts the most pathetic, hurt-eyed, lower lip-straining puppy-dog expression you have ever seen. <i>“Please?”</i>");

		output("\n\nLaughing, you tell her that she’s said the magic word. With a delighted giggle, the goo girl immediately sinks downwards, the beautiful warm softness of her mouth engulfing one of your nipples with uninhibited greed.");
	}
	//Repeat:
	else {
		IncrementFlag("LACTATION_FED_CELISE");
		output("Without a word you sit yourself down and ");
		if(pc.armor.shortName != "") output("shake off the top half of your [pc.armor]");
		else if(pc.isChestGarbed()) output("shake off your [pc.upperGarment]");
		else output("shake");
		output(", grinning at Celise as once again you let your movements accentuate the heaving and gentle quaking of your plump, full [pc.chest]. The goo girl is on you before you’ve even properly settled yourself, her wet bulk rolling over your belly as she slides up your front and engulfs one of your bared breasts, drooling small trails of warm slime, accepting your silent invitation with an eager and happy hum. You smile and curl your fingers into her hair, sighing as she begins her sucking and spreads radiant pleasure through your laden breasts.");
	}
	//[merge]
	output("\n\nAfter a few moments of furious kneading, during which time you think she might suck your boob right off, Celise calms down enough to set about her task with a bit more prudence. She looks up at you mischievously as she begins to kiss and nibble around the edges of your areola, pushing into your pliable flesh with her mouth, catching pinches of skin with her teeth before soothing them with her lips. Her physiology is so soft and wet that even when she bites at you like this you only feel a delightful pressure, like someone squeezing you gently with a moist pair of fingertips. The teasing treatment is making your nipple ");
	if(pc.hasFuckableNipples()) output("moisten");
	else output("harden");
	output(", becoming more and more sensitive, deepening the ever-present urge to nurse which thrums through you. You gasp as, with a knowing purr, Celise slathers her tongue upwards right across its peak, making warmth rush to the tips of your breasts and down to your groin. It’s time to take charge here. You coil your fingers into Celise’s gooey hair firmly and push your nipple right into her soft, teasing, hungry mouth.");

	//Dipples:
	if(pc.hasDickNipples())
	{
		output("\n\nYour [pc.dickNipples] are almost painfully hard by now, hard enough to slide slowly out from their pliable boob housing to reveal their true nature. Celise coos with delight and sets about the one you’ve pushed her face into with a vengeance, drawing it even further out with expert pulls of her lips, rolling her tongue along the sensitive underside as her own pseudo-boobs squish into your stomach, enticing you to bead and then drool precum into her hungry mouth. It’s obvious she’s very much at home sucking dick, wherever she might find it. Smirking, you keep hold of her head and push her into your boob, sliding right to the back of her throat, drawing your oozing nipple cock away before pushing in deep again, working her face against you into a nice rhythm, sighing blissfully and closing your eyes as the delicious drain on your straining breast deepens. The mouth at your teat is both impossibly soft and assiduously vigorous - it’s like you’re feeding and fucking at the same time. You gasp and open your eyes as you feel something equally smooth and wet creep up your second breast and encapsulate your other nipple. Celise grins up at you, still sucking away at your erect nipple with her mouth as she strokes its twin with her gooey hand, kneading it expertly until it is tenting, the contents of your full boob rising unstoppably to a point. You moan as you gush [pc.milk] into her translucent hand, which absorbs your rich fluid just as eagerly as her mouth.");
	}
	//Cupples:
	else if(pc.hasFuckableNipples())
	{
		output("\n\nYour [pc.nipples] are leaking precipitously by now, dribbling a needy mixture of [pc.milk] and lubrication down your front.");
		if(pc.milkType == GLOBAL.FLUID_TYPE_HONEY) output(" The goo girl hums with delight as you fill her mouth with your oozing, golden fluids. <i>“Sho shweet!”</i> she exclaims, pulling away to stare at the thick nectar beading freely from your breast. You pull her firmly back into your softness, impatient now that she has tapped your liquid wealth. In response she slides her hot tongue into your slit, drawing out long strokes of honey with expert laps of her mouth muscle yet continuing to suckle and squeeze on your areola.");
		//[Inedible Fluid (in case of later TF): The goo girl winces as the first taste of your unnatural mixture crosses her lips. <i>“Strange...”</i> she sighs, <i>“and a little slimy... kind of like cum!” With the association locked in her mind, Celise dives in again, plunging her tongue into your nipple-slit and swirling it around the insides, stimulating the entrance in her best impression of a sex toy.]
		//[Otherwise: 
		else output(" Celise drinks up the stream you’ve presented to her with vocal delight, humming into your flesh as she laps up your fluids before inserting her hot tongue into your slit, absorbing milk with expert rolls of her mouth muscle, yet continuing to suckle and squeeze on your areola.");
		output(" When you’re aroused like this you cannot help but simply drool liquid from your breasts - your cunt nipples have no valve function, and nothing stops your [pc.milk] from gushing out once someone is kneading at you in the way Celise is. It feels orgiastic to have someone eat your sensitive nipple out like this - it’s just a shame that you’re losing so much sensation from its twin. The moment that thought hazily forms, you gasp and open your eyes as you feel something equally smooth and wet creep up your second breast, following the trail of fluid up until it encapsulates your other nipple. You look down to find Celise grinning up at you, still suckling away at your breast with her mouth as she pushes into its twin with her gooey fingers, kneading your second nipple expertly until it is dribbling. The contents of your full boob rise unstoppably to a point and you moan as a sudden torrent of [pc.milk] gushes into her translucent hand, which absorbs your rich fluid just as eagerly as her mouth.");
	}
	//Normal nipples:
	else {
		output("\n\nYour [pc.nipples] are almost painfully hard by now and it takes only a few seconds for the one Celise has seized upon to open and begin to dribble [pc.milk] into hot, wet, roiling, licking pressure.");
		if(pc.milkType == GLOBAL.FLUID_TYPE_HONEY) output(" The goo girl hums with delight as you fill her mouth with your oozing, golden fluids. <i>“Sho shweet!”</i> she exclaims, pulling away to stare at the thick nectar beading freely from your breast. You push her firmly back into your flesh, impatient now that she has tapped your liquid wealth.");
		//[Inedible Fluid (in case of later TF): The goo girl winces as the first taste of your unnatural bounty crosses her lips. <i>“Bitter... but not bad,”</i> she sighs, settling back into her task and coaxing your strange fluid from you once again.]
		//Otherwise: 
		else output(" The goo girl hums with delight as she begins to suckle, drawing it out with expert pulls of her lips, rolling her tongue along the underside as her own pseudo-boobs squish into your stomach.");
		output(" Sighing blissfully and closing your eyes, you lose yourself in the delicious drain on your breast. The mouth at your teat is both impossibly soft and assiduously vigorous. Something equally smooth and wet creeps up your second breast and encapsulates your other nipple, and you gasp and open your eyes. Celise grins up at you, still suckling away at your breast with her mouth as she pushes into its twin with her gooey hand, kneading your second nipple expertly until it is tenting, the contents of your full boob rising unstoppably to a point. You moan as you gush [pc.milk] into her translucent hand, which absorbs your rich fluid just as eagerly as her mouth.");
	}
	//[merge]
	//[2> Boobs:
	if(pc.totalBreasts() > 2) 
	{
		output("\n\nObscured below heaving slime, you feel Celise form other suction pods, feel them slide across your chest until they fasten onto your other nipples, each more ");
		if(pc.hasFuckableNipples()) output("wet");
		else output("hard");
		output(" and desperate to release their [pc.milkColor] load than the last. You moan and writhe, but the goo girl is insistent and insatiable, locked into her need to feed now - within a few moments she is fastened securely to all of your teats, sucking at every sensitive, beading nipple until it is jetting into her, pushing you towards a plateau of sensation no human was meant to experience.");
	}
	//[merge]
	output("\n\nCelise’s wet bulk squishes into you, undulating over your [pc.belly], gently sticking to spots on your stomach intermittently as she grips your breasts in a velvety, never-ending moment of suction. As well as her own breasts, her stomach is beginning to push into your own as the [pc.milk] she is gorging herself on makes a pouch of it. You feel goo ");
	if(pc.isTaur()) output("creeping all the way along your lower body, brushing wetly across your barrel-like belly to finally push");
	else output("pushing");
	output(" between your [pc.thighs] as she adheres herself to you more and more tightly. You look down, expecting to find her mischievous eyes gazing back, looking for a reaction, but instead find them peacefully closed. She is curled into your breast, all attention on your sensitive, life-giving nipples, every part of her relaxed apart from her plump, hungrily-working mouth. The [pc.milk] you can see sloshing and sluicing through her form has evidently had a powerful calming effect on her, shutting down everything in her world apart from the base, overriding need to feed, and like the simple goo she is, she now instinctively reaches for every wet, warm crevice she can sense. Grinning, you spread your thighs wider and pull her even further, your sigh merging with her pleased, dozy moan.");

	//PC has both:
	if(pc.hasCock() && pc.hasVagina())
	{
		output("\n\nIt doesn’t take her long to find and envelop your semi-erect [pc.cockBiggest] in warm kneading gel, and as her flesh wraps around it she flows further into your delta, sliding and oozing over your");
		if(pc.balls > 0) output(" [pc.balls]");
		if(pc.balls > 0 && pc.hasClit()) output(" and");
		if(pc.hasClit()) output(" [pc.clits]");
		else output(" sex");
		output(" as she reaches your wet entrance and pushes hungrily into [pc.oneVagina]. Within a few seconds you are packed full of goo, working up and down your sensitive tunnel whilst a mound of slime coils around your cock until you are dribbling excitement and urgent with desire. The goo is insatiable - ");
		//High cum:
		if(pc.wetness() >= 3) output("though you are as ever tapping femcum eagerly, ");
		output("it is difficult not to lose control and buck against the warm softness of it because it absorbs every drop of wetness you produce the instant it forms, gently but insistently pressing on");
		if(pc.hasClit()) output(" your clit and");
		output(" your tunnel to force you to form more and more. All the while, she continues to lick and suckle on your [pc.nipples].");
	}
	//PC has cock:
	else if(pc.hasCock())
	{
		output("\n\nIt doesn’t take her long to find and envelop your semi-erect [pc.cockBiggest] in warm, kneading gel. You move your [pc.hips] with measured motion, letting Celise do most of the work. Her flood of slime coils your cock up and down, working it until it is bulging and you are urgent and straining with desire as she continues to lick and suckle on your [pc.nipples].");
		pc.cockChange();
	}
	//PC has vagina: 
	else if(pc.hasVagina())
	{
		output("\n\nThe warm, kneading gel flows deep into your delta, sliding and oozing over you");
		if(pc.hasClit()) output("r [pc.clits]");
		output(" as it reaches your wet entrance and pushes hungrily into [pc.oneVagina]. Within a few seconds you are packed full of goo, working up and down your sensitive tunnel until you are dribbling excitement, urgent with desire. You move your [pc.hips] with measured motion, letting Celise do most of the work. The goo is insatiable - ");
		if(pc.wetness() >= 3) output("though you are as ever tapping femcum eagerly, ");
		output("it is difficult not to lose control and buck against the warm softness of it because it absorbs every drop of wetness you produce the instant it forms, gently but insistently pressing on");
		if(pc.hasClit()) output(" your [pc.clits] and");
		output(" your tunnel to force more and more from you. All the while, she continues to lick and suckle on your [pc.nipples].");
		pc.cuntChange(rand(pc.totalVaginas()),5,true,true,false);
	}
	//[merge]
	output("\n\nThe effect of the slime’s stimulation is to push your body into a heat of production, and you begin to pant; blood rushes to your skin as your [pc.nipples] open wide and release their deepest, thickest [pc.milkNoun] into Celise’s tight, sucking maws. She makes a sound of complete contentment as your own higher cognition shuts down; you can only think of pumping more and more of your body’s bounty into your goo pet. The heat reaches a high as she ");
	if(pc.hasVagina()) output("packs [pc.oneVagina] as full as she can");
	if(pc.hasVagina() && pc.hasCock()) output(" and ");
	if(pc.hasCock()) output("clenches down on [pc.oneCock], sending ribs of wet tightness up and down");
	output("; you groan as you cum, ");
	if(pc.isSquirter() || pc.hasCock()) output("jetting");
	else output("guttering");
	output(" yet more fluid into the insatiable, warm slime.");
	if(pc.hasDickNipples()) output(" Your dick nipples tense and ejaculate again at the same time, spouting [pc.milk] in uncontrolled gouts into her mouths, and you throw your head back, squealing with joy as you are clenched in a multiple-point orgasm.");
	else if(pc.hasFuckableNipples()) output(" Your cunt nipples quiver and orgasm at the same time, spurting [pc.milk] in uncontrolled gouts into her mouths, and you throw your head back, squealing with joy as you are clenched in a multiple-point orgasm.");
	output(" Celise quivers herself as she cums to the thick fluid squirting into her, plumping her wide and full with her " + pc.mf("master’s","mistress’") + " rich liquid love, and the two of you writhe and thrust into each other for a long, mindless moment of pure, wet joy.");
	pc.orgasm();

	//Low lactation:
	if(pc.lactationQ() <= 5000) output("\n\nWhen you are finally spent and come back to yourself, you hazily realize there is still a mouth at your breast, still attempting to tease out more. You look down at Celise, still attached - you are completely empty and feel like you’ve poured several gallons of your [pc.milk] into her, and yet she still wants more? Gently, you pry her from your over-sensitive, aching [pc.nipples]. She makes a small noise of disappointment as you do, even though you can see the large amount of fluid she has imbibed from you sloshing heavily within her body. It’s not enough to change her green color but enough to fill her boobs and butt out, giving her an exaggerated bimbo form, enough to keep her going for days. You shake your head sternly at the galotian’s greed and she has the civility to blush turquoise and simper.");
	//High lactation:
	else {
		output("\n\nYou keep going and going, spurting more and more [pc.milk] into the goo girl, your body thrust upwards into an orgy of expression - not that a minute goes by usually when you aren’t thinking about how heavy your body is with the [pc.milk] that strains and tightens your [pc.chest], how full and needy they make you feel. It’s so goddamn good to relieve all of that pressure, to unload the deepest, creamiest [pc.milk] into multiple hungry mouths.");
		if(pc.bRows() > 1) output(" Your lower breasts in particular, every bit as engorged as your top row but so often sorely neglected, sing with delight as Celise’s suction pods pump their warm wetness away.");
		output(" You close your eyes as you continue to jet your warmth into the sucking slime, riding the goo stuffed ");
		if(pc.hasVagina() && pc.hasCock()) output("into and onto");
		else if(pc.hasCock()) output("onto");
		else output("into");
		output(" you, feeling yourself build towards a new peak - when you hear a wet, abject moan. You look down in surprise to see Celise slowly break off from your still-dribbling boob, her eyes rolling and mouth open, utterly stupefied. Her gooey body bulges at the seams with the amount of fluid you’ve stuffed into her, so much so that - and this makes you laugh in delight - her native green color has been obliterated, replaced by the rich [pc.milkColor] color of your [pc.milk]. And yet, you’ve still got more to give.");


		//fork, no new pg
		//(high empathy)
		if(pc.isNice() || pc.isMischievous())
		{
			output("\n\nYou feel a pang of sympathy for the overfed alien... but your aching breasts won’t allow you to leave her work undone. Taking your [pc.nipples] in your own hands, you ");
			if(pc.hasFuckableNipples()) output("slide two fingers into them");
			else output("jerk and pull on them");
			output(". Though Celise’s artisanal caresses are replaced with the workman-like efforts of your own pleasured stupor, it’s enough to tug another climax from you; your [pc.nipples] spurt [pc.milk] onto the prone woman");
			if(pc.hasGenitals()) output(" as");
			if(pc.hasVagina())
			{
				output(" [pc.eachVagina] twitches and ");
				if(pc.isSquirter()) output("squirts");
				else output("dribbles");
				output(" a new, fitful orgasm into the slowly-expanding puddle at Celise’s base");
			}
			if(pc.hasVagina() && pc.hasCock()) output(" and");
			if(pc.hasCock())
			{
				output(" [pc.eachCock] delivers another, weaker");
				if(pc.cumQ() <= 600) output(", but still massive");
				output(" load of semen that coats her body and seeps through her jellified skin");
			}
			output(".");
			pc.orgasm();
			output("\n\nCelise groans as your fluids slowly work their way through her membrane, a victim of her own body’s gluttonous design, and she slides her hand to her own crotch, frigging herself as vigorously as her torpid arm can manage. Her pussy quivers and clenches, and a stream of gooey girlcum runs from it, ejecting excess fluid. She rubs and teases until she’s fired off several more orgasms of her own, jetting multiple streams of slippery greenish lube a good few feet away, safe from the risk of being reabsorbed. Satisfied with the effects, she leans back and lets her shape relax into a vaguely feminine puddle with a low, burbling sigh.");
		}
		//(low empathy)
		else {
			output("\n\nShe should finish what she started, shouldn’t she? Smirking, you push her face and body back onto your oozing [pc.nipples], her meek, mumbled protest smothered by your soft flesh and then by the continuing streams of fluid, their all-conquering sweet warmth drowning her out.");

			output("\n\nYou watch in awe and rekindled arousal at her body as you force feed her. She tries to store the excess fluid on her butt and bust. They swell as you watch, filling out until she is sporting the kind of huge, smothering, quivering curves that would prevent her from moving were she human - but it’s not enough. Her belly expands into a pregnant bulge, tautening before she screams around your [pc.nipple], the obscene [pc.milkColor] goo girl you’ve created writhing her slimy form against you; she spurts fluid from her vagina as you push her over her limit, forced into an explosive orgasm to get rid of the excess [pc.milk] you’ve gorged her with. It’s so massive she simply parts around your fingers, sliding away to pool onto the floor in front of you, reduced to a quivering girl swamp, formed almost entirely from your own juices. You smile triumphantly as you stand over her, gently ");
			if(pc.hasVagina()) output("frigging");
			else output("stroking");
			output(" yourself.");
			pc.orgasm();
		}
		output("\n\nAs you watch, she manages to slowly gather herself, her weary eyes widening as she reforms an arm and sees that her green color has not returned. Not only that, but stuffed to the brim with your bounty, she has no choice but to take on the most lewd proportions possible, and she groans as she bends, straightens her back and reforms her round, jiggling backside. She’ll probably be stuck like that, with her thick thighs, heaving breasts and bouncing bubble butt for some time, all the while unable to taste anything but your [pc.milk]");
		if(pc.hasCock()) output(" and musky [pc.cumNoun]");
		output(". Absolutely delicious. You sigh in deep satisfaction while you propel yourself to your final peak, dribbling the very last of your [pc.milk] onto her");
		if(pc.hasGenitals()) output(" as you are clenched by orgasm once again, spattering her with yet more of your ");
		if(pc.hasCock()) output("[pc.cum]");
		else if(pc.hasVagina()) output("[pc.girlCum]");
		output(". She moans softly at the obscene rain, a treat she would have normally reveled in now just a reminder of how you have completely overwhelmed her.");
		pc.orgasm();
	}
	//[merge]
	output("\n\nAfter Celise has composed herself a bit she looks at you, frowning as if something were bothering her. Whatever she’s thinking slowly gathers pace; she opens her mouth and... burps richly. Her blush turns into an embarrassed titter when you laugh, shaking your head at your stuffed goo pet.");

	output("\n\n<i>“You taste sooooo good, [pc.name],”</i> she sighs. <i>“");
	if(pc.milkType == GLOBAL.FLUID_TYPE_HONEY) output("How lucky am I to have a captain who’s like a giant walking honey pot? ");
	output("You’ll never stop leaking nice stuff from your top, will you? Because I just want to keep drinking that forever, and ever, and...”</i> She pauses, and looks down at her bulging bimbo body. <i>“...well, maybe not </i>right<i> now, but you’ll come back with more, right?”</i> You tell her as long as she’s a good girl and keeps using her mouth like she does, you’ll always give her exactly what she needs. Her response to this is to reform herself so she is lying on her front with her ");
	if(pc.lactationQ() <= 5000) output("green");
	else output("[pc.milkColor], heavily-inflated");
	output(" bottom arched towards you, her face peering round it with a sultry, come-hither expression plastered on it. She’s insatiable. You leave her to satisfy the raging thirst that has taken hold of you, before arousal forces you into a decision she’ll probably regret.");
	//(If possible, have Celise retain the colour on her description screen for a day or two if it changed)
	if(pc.lactationQ() > 5000) output("\n\nAs you turn away, her [pc.milkColor] flesh is slowly changing back to green. She’ll be back to her old self in no time.");
	pc.milked(pc.milkFullness);
	//reset lust, add lust
	processTime(30+rand(10));
	pc.lust(5+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



/*Celise full body hugging bounty board scene
By: The Dark Master

Plan
Scene
Intro
Don’t let her in
Let her in
Don’t be naked
Be naked
Don’t let her drain you
Let her drain you
(old text that will not be used) Celise is hungry
(old text that will not be used) Break free


Plan
If the player ever chooses no, the scene ends fairly shortly afterwards with a quick summary of how the rest of the night passes.
Celise comes to your room and asks you if you’ll let her be your bed. (player choice)
Celise happily hops in and forms up into a blob on the floor with her breasts squished up to one side to be your pillow. Celise asks the player to undress. (player choice)
Lights are turned out
Celise wraps her body around the PC, hugging and caressing their whole body, the player notes she is a natural with massages.
Celise is not very hungry:
Celise suggests that while the two of you are together, that maybe you should let her do a gentle milking before you fall asleep? (player choice)
Celise gently milks all parts of your body she can.
Alternatively, Celise is hungry:
Celise tells you that since you haven’t feed her much lately, she’s going to have to use this opportunity to get what she needs. The player can choose to try and struggle against this. (player choice)
(maybe an alternative version where she is more forceful with her milking, otherwise same as above)

Scene
//requires that the PC not be sexless, and be humanoid in shape*/

//Intro
public function celiseOffersToBeYourBedSenpai():void {
	clearOutput();
	author("TheDarkMaster");
	showCelise();
	output("Just before you turn in, your door chimes, followed by the voice of Celise calling out to you. <i>“Hey there, I was wondering if maybe you wanted a little company tonight? Maybe a nice soft goo bed that will hug you and rub you all night?”</i> There is a pleading note in there. Do you let her in?");
	//Player chooses yes/no
	clearMenu();
	addButton(0,"Yes",letCeliseInForBed);
	addButton(1,"No",dontLetCeliseInForBed);
	addButton(3,"Disallow Bed",celiseBedToggle,false,"Disallow Goo Bed","Refuse and tell Celise you don’t want her to ask again until you allow it.");
}

public function celiseBedToggle(gooBed:Boolean = false):void
{
	clearOutput();
	author("Jacques00");
	showCelise();
	if(!gooBed)
	{
		if(pc.isNice()) output("You apologize");
		else if (pc.isMischievous()) output("You wave her off");
		else output("You shoo her away");
		output(" and tell her you would rather have some space to yourself.");
		output("\n\n<i>“Ah, O-okay...”</i> Celise frowns, almost melting into a puddle of sadness.");
		output("\n\nYou then add that you’ll let her know if you are ever in the mood again.");
		output("\n\nWith those words, she instantly perks up with eager thoughts of you allowing her to do kinky things with you in the future probably running through her mind. She then quickly shuffles off so you can finally be alone.");
		
		flags["CELISE_NO_BED_SENPAI"] = true;
		sleep(false);
	}
	else
	{
		output("You tap Celise and tell her that she is welcome to greet you any time you head off to bed");
		if(flags["CREWMEMBER_SLEEP_WITH"] != undefined) output(" and are without company");
		output(".");
		output("\n\nThe goo girl quickly bubbles up with a great <i>“YAY!”</i> and commences to give you a big, gooey hug. <i>“If you are feeling lonely, I’ll totally keep you company!”</i>");
		
		flags["CELISE_NO_BED_SENPAI"] = undefined;
		clearMenu();
		addButton(0, "Next", (flags["GIGACELISE"] == 1 ? gigaCeliseRepeatApproach : celiseFollowerInteractions));
	}
}

//Don’t let her in
public function dontLetCeliseInForBed():void {
	clearOutput();
	author("TheDarkMaster");
	showCelise();
	if(pc.isNice())
	{
		output("You apologize to her, saying tonight’s just not a good night for you. Maybe some other time?");
	}
	else if (pc.isMischievous()) {
		output("You tell her that that’s okay, you don’t need a goo bed tonight.");
	}
	else { //you’re mean
		output("You tell her to get lost, you don’t have time for her tonight.");
	}
	output("\n\n<i>“Okay...”</i> you hear her say sadly as she shuffles away from your room. You try not to let it bother you and continue getting ready for bed as before.");
	//end scene, normal rest messages after this
	sleep(false);
}

//Let her in
public function letCeliseInForBed():void {
	clearOutput();
	author("TheDarkMaster");
	showCelise();
	output("You open the door to invite the green goopy girl into your room. She screams, <i>“Yay!”</i> and happily bobs her way past.");
	output("\n\nThe Galotian circles around the room for a few moments before settling down near the center and reshaping her body. She reaches her arms down and firmly grabs the bottoms of her pornstar breasts, then heaves them up while simultaneously leaning her body back further and further. The secret to her technique eludes you until you notice how her lower body is stretching forward at the same time, giving the illusion that she is leaning back.");
	output("\n\nFinally she’s stretched out into a long oval pad of emerald goo, big enough that you could easily lie down on it. Satisfied, she drops her enormous assets onto the unusual bed and pats them proudly. <i>“Come on! Try out the best pillows in the universe!”</i> she proclaims, her upbeat mood still in full force.");
	
	// flag gets unset at the first mainGameMenu call, allowing other chars to intercept the end of
	// the sleep event, check the flag to react appropriately, and then clean up afterwards.
	flags["CELISE_BEDSTUFF_HAPPENED"] = 1;
	
	// if PC is not nude
	if(!pc.isNude())
	{
		output("\n\nHowever, when you make a move towards her she suddenly cries out, <i>“Wait! You should totally be naked before you try me out. It will be lots better, trust me!”</i>");
		output("\n\nWell, are you going to sleep in her naked?");
		//player chooses yes/no, if the PC is nude, automatically go to be naked
		clearMenu();
		addButton(0,"Yes",sleepWithCeliseNaked);
		addButton(1,"No",sleepWithCeliseNotNaked);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",sleepWithCeliseNaked,false);
	}
}

//Don’t be naked
public function sleepWithCeliseNotNaked():void {
	clearOutput();
	author("TheDarkMaster");
	showCelise();
	output("You tell her that you’re fine the way you are; you’d rather sleep in her clothed.");
	output("\n\nThe ditzy green girl pouts for a bit before grudgingly agreeing. <i>“Fine, but next time you gotta try it naked!”</i>");
	output("\n\nYou lower yourself onto the green bed of ooze, and lean back onto the Galotian’s massive mock mammaries. The owner of these mounds giggles as your head settles into the valley created by them");
	if(pc.hasHorns())
	{
		output(", and your [pc.horns] slip");
		if(pc.horns == 1) output("s");
		output(" inside her breasts");
	}
	output(". While a little wobbly, Celise’s body is incredibly comfortable to rest on; it’s essentially the ultimate water bed. You switch off the lights, and in no time at all, are drifting off into a pleasant rest atop a living pool of goo.");
	//scene ends
	sleep(false);
}

//Be naked
public function sleepWithCeliseNaked(disrobe:Boolean = true):void {
	clearOutput();
	author("TheDarkMaster");
	showCelise();
	// if PC is not nude
	if(disrobe) output("You remove your clothing at Celise’s suggestion, prompting happy applause from the green woman. It sounds rather like two wet towels slapping together. Once completely nude, you’re once again invited to lay down on the bed of ooze and rest your head between her appropriately sized pillowcase cup breasts.\n\n");
	output("Her gel is warm to the touch, and is quite pleasant on your skin. You let out a contented sigh as your head sinks partially into her bust and she puts her hands onto your chest, hugging you to her breast. You switch off the lights in your room and close your eyes, completely relaxed on the thick goopy body of the Galotian.");
	output("\n\nBefore you’re actually able to fall asleep, you feel the mat of goo suddenly run up your [pc.legOrLegs] and around your body, enveloping it in mere moments. Fear of being trapped is quickly banished from your mind as Celise’s goo begins caressing and vibrating on your skin. Long veins rub across your back and shoulders, working out the pains and knots from your muscles after a long day. Damn, this girl is a natural with massages!");
	output("\n\nCelise continues to work the tension from you for the next half hour or so. Just when you feel like every ");
	if(pc.isGoo()) output("bit of goo");
	else output("muscle");
	output(" in your body is relaxed enough to melt, she giggles suspiciously, and you feel her gel push against the entrance to your ass.");
	if(pc.hasVagina()) 
	{
		output(" Another protrusion rubs itself against the lips of your [pc.vagina]");
		//[if (more than one vagina)]
		if(pc.totalVaginas() > 1) output(", with more joining it at your other lower lips not long after");
		output(".");
	}
	//[if (cock = yes)]
	if(pc.hasCock())
	{
		output(" Simultaneously, Celise’s goo tightens into a tube about your [pc.cock], teasing you to full hardness.");
	}
	output(" <i>“You know, [pc.name], I was just thinking that while we’re here, you should totally let me milk and play with your entire body for the whole night....”</i> At this, her goo also rubs against and pinches your [pc.nipples].");

	output("\n\nShe’ll do it if you give her half the chance, but at the same time, she seems pretty relaxed right now so it will probably be a very gentle feeding session. Will you let her?");
	clearMenu();
	addButton(0,"Yes",getDrainedSexyTimes);
	addButton(1,"No",dontLetCeliseDrainAllYourBodilyFluidsWhileYouSleep);
}

//Don’t let her drain you
public function dontLetCeliseDrainAllYourBodilyFluidsWhileYouSleep():void {
	clearOutput();
	author("TheDarkMaster");
	showCelise();
	output("You clear your throat and tell the slime girl that you’ve had quite enough playing for the night, you’d rather just sleep. <i>“Aw, poo...”</i> Celise pouts, before trying once again to have her way with you. At your insistence that the two of you will be sleeping separately if she keeps this up, the horny puddle finally gives in and allows you to recline within her gooey embrace.");
	//scene ends
	sleep(false);
}

//Let her drain you
//sexy times
public function getDrainedSexyTimes():void {
	clearOutput();
	author("TheDarkMaster");
	showCelise();
	output("Joyful laughter reverberates through Celise’s body as a column of goo pushes through your [pc.asshole]. She gently strokes the exposed part of your face and neck. <i>“That’s so wonderful of you; I’ll be sure to ");
	if(pc.hasCock() || pc.isLactating()) output("milk");
	else output("please");
	output(" you lots tonight.”</i> Before you have a chance to respond, she shushes your lips, closes your eyes with her fingers, and gets to work.");
	pc.buttChange(5,true,true,false);
	//asshole
	output("\n\nThe tip of the column of gel embedded deep inside your backside swells up, growing bigger and bigger until there is a large ball of goo on the end of it. She tests this gel sphere against your backside’s ring with a tug, ");
	if(pc.ass.looseness() >= 5) output("and proves a bit disappointed when it slips out of your gaping rear. She promptly puts it back and increases the size a bit more to make sure it stays in there.");
	else output("and is quite pleased when it proves to be stuck in there.");
	output(" The great green globule begins an endless pumping motion deep inside your bowels, a piston that lasts the whole night.");

	//breasts (1)
	if (pc.biggestTitSize() >= 1)
	{
		output("\n\nThe goo around your [pc.chest] tightens up, cupping and feeling up your endowments. They move in circles, rubbing and teasing the tit-flesh. You can’t help but move along with the firm caresses, rocking back and forth inside the sloppy prison of slime. Celise catches on fast, and moves your body for you in time with her groping.");
		//[no paragraph end]
		if (!pc.isLactating())
		{
			if (pc.hasFuckableNipples()) //number of nipples doesn’t matter for this
			{
				output(" You give a small gasp as a pair of tendrils slip their way inside your [pc.nipples] and busy themselves by wiggling around inside the faux-vaginas. After a moment’s thought, you decide that it would be better to describe them as tiny tongues, given that it feels like a mouth is also sucking on the outside of your sensitive nubs of penetrable flesh.");
			} 
			//regular nipples
			else 
			{ 
				output(" There is a small, sharp bit of pain when a sucker appears inside the bed of gel just above your [pc.nipples] and pinches them. The pain quickly subsides and is replaced by a pleasant glow as the sensation switches to a gentle tugging on the sensitive nubs of flesh.");
			}
		}
		//they are lactating
		else 
		{
			output(" Almost immediately, Celise detects that your [pc.nipples] are giving her something that she wants, and she begins suckling. A mouths blooms into existence above each nipple to drain all of the fluids that they can from your [pc.fullChest]. Even when the source runs dry");
			if(pc.lactationQ() >= 5000) output("much later");
			output(", the mouths continue to suck in a loving manner.");
			pc.milked(pc.milkFullness);
		}
	} 
	//your breasts are too small, or are non-existent. You get nipple play instead.
	else 
	{
		output("\n\nThe goo that was flicking at your [pc.nipples] a few moments ago tightens up a bit, and pinches you rather hard. Your reaction sends a shudder through your encasement, and Celise lets up on the stimulation. She is simply content to tweak, flick, and tease the nubs of somewhat sensitive flesh on your chest.");
		//Oh boy, this will be weird
		if (pc.isLactating())
		{
			output(" Of course, when you start lactating, that all changes. Back come the rather sharp pinches for a few minutes, trying to get all the milk out of your [pc.chest] she can get. When you protest her poor treatment, she does fortunately let up and switch to a more relaxed pace.");
			pc.milked(pc.milkFullness);
		}
	}
	//tail cock
	if (pc.hasTailCock())
	{
		//n is the first tail that the PC has that is a tailcock
		output("\n\nGiven all the stimulation your body has received, your unusual endowment is quite easy to find and your [pc.tail] is led down");
		if(pc.legCount > 1) output(" between");
		output(" your [pc.legOrLegs]. The whole tail is surrounded in a thick sleeve of gel that promptly rocks forward and backwards down its full length. A small tendril of goo forms across the tip of your [pc.tailCock] and rubs its urethra, trying to draw out as much as possible with each orgasm you experience throughout the night.");
	}
	//tail vagina
	else if (pc.hasTailCunt())
	{
		//n is the first tail that the PC has that is a tail vagina
		output("\n\nWhen your [pc.tail] reveals its special treasure thanks to the situation you’re in, Celise immediately catches on and pulls said appendage up along your back so she has easier access to it. What feels like a thick cock of ooze forms at the entrance to your [pc.tailgina] and begins to thrust into it. This sends the breasts of goo on either side of your head bouncing slightly with the motion. Of course, rather than cumming into your tail mounted womanhood, this one sucks on your interior, draining all that it can out of you.");
	}
	//cock
	if (pc.hasCock() && (!pc.hasVagina() || rand(2) == 0))
	{
		output("\n\nThe tube surrounding your [pc.cockBiggest] begins to ripple pleasantly, turning into a ringed interior of firm, but flexible jelly.");
		//(if multiple cocks):
		if(pc.cockTotal() > 1) 
		{
			output(" In moments, ");
			if(pc.totalCocks() == 2) output("both");
			else output("each");
			output(" of your dicks are encased.");
		}
		output(" You groan and thrust your groin up to get a taste of those wonderfully shaped cock-sleeves, but her body moves along with you. <i>“No need to move, silly; I’ll take care of that for you...”</i> Celise whispers, and pulls you back down into her.");

		output("\n\nIt turns out that a mind-melting manhood massage is what she had in mind. A pleasant vibration spreads through the gel around your [pc.cocks], bringing with it a glow of pleasure that spreads around your body. Afterwards, a slow inexorable pull begins to work on your engulfed erect equipment, tugging on you with that marvelously ringed pipe of slime. Without warning it reverses course, and pushes down on you, rubbing you in the other direction in an ecstasy-inducing manner. There is no acceleration in her stimulation, just steady repetition of the cycle of pushing and pulling on your member again and again, slowly building you up to release.");
	
		//if (PC has balls)
		if(pc.balls > 0)
		{
			output("\n\nWhenever you reach your peak, and begin letting out another load into the ravenous gel girl, a tight case forms around your [pc.balls], which rub and squeeze them to coax out all the cum you have to offer her. Even after your release has subsided, you continue to be gently squeezed and fondled pleasantly for at least a few minutes before the ball cage relaxes and lets your [pc.balls] flop free once more.");
		}
		else output("\n\nWhen you’re finally brought to your first peak, the ravenous gel girl quickly changes the means of her assault from a gentle treatment to a vigorous pumping. She roughly coaxes everything she can out of your climaxing member through her rippling prison. Finally when you’re spent, her calm serene treatment starts anew, carefully bringing you back to full hardness and continuing her massage.");

		output("\n\nThroughout the night she draws out a multitude of orgasms with long build-ups and sudden releases that ooze out of you and are quickly absorbed by the hungry mass of goo surrounding your body. While she never lets you go soft, she paces you so that the period between each orgasm is at least thirty minutes, so you never feel uncomfortable from the continuous stimulation.");
		pc.cockChange();
	}
	//vagina
	else if(pc.hasVagina())
	{
		//if (PC has at least one vagina)
		output("\n\nThe protrusion rubbing against your [pc.vagina] pushes more and more firmly before finally passing inside you. The small invader splits into a multitude of filaments wriggling around inside your womanhood, eager to tease your insides.");
		if(pc.hasClit()) output(" Simultaneously, two of the tendrils grasp at the [pc.clit] above your invaded entrance to heighten your pleasure to the best of their ability.");
		output(" You’re certain that every drop of lubrication you release is being eagerly absorbed by the greedy green gelatinous girl.");
		//(if multi vagina):
		if(pc.totalVaginas() > 1)
		{
			output("\n\nYour [pc.vagina] is not the only womanhood you possess on your crotch, so of course Celise fills every hole she can in the same way. ");
		}
		else output("\n\n");
		output("The twisting, flipping, and vibrating cilia move deeper and deeper, while becoming more and more numerous until you’ve been jam-packed with the things all the way up to the entrance");
		if(pc.vaginaTotal() > 1) output("s of your wombs");
		else output(" of your womb");
		output(". Only then do they stop and are content rubbing every surface they can find inside you. The intense stimulation only becomes greater when you crest a hill of pleasure and ride it down. Your discharge sends the wormy appendages into overdrive to collect and entice as much of it from your body as possible. When you reach the bottom of the hill, you’re allowed to relax, and the gentle buzz of gooey pleasure begins anew.");
		for(var v:int = 0; v < pc.totalVaginas(); v++)
			pc.cuntChange(v,5,true,true,false);
	}
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	if(rand(3) == 0) pc.orgasm();
	pc.createStatusEffect("Milk Paused",0,0,0,0,true,"","",false,10000);
	sleep(false);
	pc.removeStatusEffect("Milk Paused");
	pc.orgasm();

	/*(old text that will not be used) Celise is hungry
	Suddenly, a chill runs down your spine when you feel Celise’s grip on your asscheeks tighten. <i>“You know, [pc.name], you haven’t been doing a very good job of feeding me...” she says to you rather nonchalantly as one of her protrusions pushes up against the entrance to your anus.  [if (vagina = yes)] Another protrusion rubs itself against the lips of your [vagina] [if (more than one vagina)] , with another joining it at your other lower lips not long after[/] . [/] [if (cock = yes)] Simultaneously, Celise’s goo tightens into a tube about your [cock], teasing you to full hardness.[/] “You really can’t blame me for milking your whole body now that I’ve got you inside me.” She continues the matter-of-fact tone, as she prepares to violate your entrapped form.
	
	You can probably still break free of her grip and kick her out of your room for trying this, but at the same time, she’s been pretty relaxed about the whole thing, so it will likely be a pretty gentle feeding too. Will you let her drain you all night?*/
	//(old text that will not be used) Break free
	//Your suspicions at how weak Celise’s grip is on your resting form are proven true quite quickly. It’s a simple matter to force yourself out of her “bed” and to escape her attempts to catch you again. She tries to apologize for what she did, begging you to let her feed, but you’ll have none of it. In another minute, you’ve removed the green girl from the room, and have settled into a proper bed for some shut eye.
	//end scene, normal rest messages after this
}

//available for every type of Celise and every PC except unsexed
//the scene
public function zeiksCeliseSubmersionTechnique():void
{
	clearOutput();
	showCelise();
	author("Zeikfried");
	output("“<i>Celise...</i>”");
	output("The galotian leans over and stretches lazily toward you, scooting her impressive breasts along the floor. Bulges form under her face and then shape into arms as she shifts forward. She comes to rest with her chin on her hands, the very picture of indolence.");
	output("\n\n“<i>Hiya, [pc.name]. What’s up with you?</i>”");
	output("\n\n“<i>You look comfortable.</i>”");
	output("\n\n“<i>Comfortable,</i>” she repeats, “<i>but hungry.</i>” She smiles broadly, and shades her eyes in a come-hither stare. <i>“Did you come here for yummy fun?”</i>");
	//if clothed
	if(!pc.isNude())
	{
		output("\n\nOf course. You remove your [pc.armor], taking care that she has a good view of your ");
		if(pc.biggestTitSize() > 1) 
		{
			output("chest as you unfasten. First setting your hands below your neck, you slowly slide them down, pushing the covering out of the way. Celise oozes even further forward, stretching out to get a closer view. You don’t make it easy for her, covering your [pc.nipples] with your hands as the last layer falls from them.");
			output("\n\n“<i>Hee,</i>” she giggles, giddy. “<i>Come on, wanna see.</i>”");
			output("\n\nYou smile and let your hands drop, exposing your [pc.breasts] completely. Each nipple ");

			if(pc.isLactating() > 1 || pc.hasCuntNipples()) output("leaks a little bit as she holds her hand up, intent on touching them");
			else output("stands up proudly to her scrutiny");
			output(", but you pull away from Celise’s exploring fingers, instead continuing downward to your ");
		}
		output("waistline. As your hands reach your lower half, Celise puts her palms to the ground and practically hoists her face up to your crotch, on tenterhooks while you expose yourself. She tries to sneak a finger into your [pc.lowerUndergarment]");
		if(!pc.isTaur()) 
		{
			output(", but you slap her hand away.");

			output("\n\n“<i>No touching.</i>”");

			output("\n\nCelise’s face lights at this new game; she folds her hands primly under her chin and bats her thick eyelashes at you as you resume stripping");
		}
		else output(", helping the process along as you reach the limits of your armspan");
		output(".");
		if(pc.hasCock())
		{
			output(" The base");
			if(pc.cockTotal() > 1) output("s");
			output(" of your shaft");
			if(pc.cockTotal() > 1) output("s");
			output(" appear");
			if(pc.cockTotal() == 1) output("s");
			output(" first, straining at your clothing until ");
			if(!pc.isTaur()) output("you lower");
			else output("she lowers");
			output(" your garments enough for your [pc.cocks] to spring free. Celise admirably restrains herself from grabbing at ");
			if(pc.cockTotal() == 1) output("it");
			else output("them");
			output(" - though, when you imagine what you’re about to do to her and ");
			if(pc.cockTotal() == 1) output("it starts");
			else output("they start");
			output(" to dribble pre-cum, she leans forward, holding out her hand to catch the drops");
			if(!pc.isTaur()) output(".\n\n“<i>No touching,</i>” she repeats with a wink,");
			else output(" and");
			output(" licking the liquid from her palm with a lascivious smile.");
		}
		//(cunts)
		if(pc.hasVagina()) 
		{
			output("\n\nYou turn away, pointing your butt at Celise before your waistband slips");
			if(!pc.isTaur()) output(" to your thighs");
			else output("down");
			//(no scales/fur)
			if(!pc.hasScales() && !pc.hasFur()) output(", and she giggles when the hot air of the engine room brings a blush to the [pc.skin]");
			output(". Your gooey lover parts her lips and reveals her green tongue, inching it from her mouth suggestively and curling the end while you watch, a window to her lewd thoughts. You make sure to ");
			if(!pc.isTaur()) output("bend at the waist when you slip the last scrap of clothing from your [pc.legs], pushing your [pc.butt] at Celise.");
			else output("push your [pc.butt] right up to Celise’s face as she helps you shed the last scrap of clothing.");
		}
		output("\n\nThe galotian is giddy with desire now, quivering and fidgeting with her hands. “<i>C’mon,</i>” she whispers breathily, “<i>let’s go already.</i>”");
	}
	//if nudist
	else
	{
		output("\n\nOf course. You turn your side away from the easy woman and run a hand over your breast, lingering on a [pc.nipple] just long enough to ");
		if(pc.isLactating() || pc.hasCuntNipples()) output("tease out a trickle of fluid");
		else output("bring it to semi-erectness");
		output(", and relish in the gawping galotian’s gaze. Celise involuntarily mimics your gesture, grasping her goopy breast and squeezing her own puffy nipple. You grin and capture her hand, pulling it away from her chest and to your own, sliding it down your [pc.belly] and enjoying the warm, sticky sensation of her touch.");

		output("\n\nShe giggles behind you, attempting to slip her fingers ");
		if(pc.hasCock()) output("around your [pc.cockBiggest]");
		else output("into your [pc.vagina]");
		output(", but you ");
		if(!pc.isTaur()) 
		{
			output("force them to keep traveling downward, depositing a thin sheen of moisture");
			if(pc.legCount > 1) output(" on the inside of your thigh");
			output(".");
		}
		else output("back into her, pressing your [pc.butt] up to her gooey chest and forcing her to trace a line of moisture along your flank.");

		output("\n\nCelise groans. “<i>Quit teasing me,</i>” she mumbles, not really angry so much as annoyed.");
		if(!pc.isTaur()) 
		{
			output("\n\nYou respond by grinding your backside against Celise’s voluminous breasts, smearing your ");
			if(pc.hasCock()) 
			{
				output("taint on her and feeling the blood rush to your erection");
				if(pc.cockTotal() > 1) output("s");
				output(". She shivers as you drop her hand and it brushes past your leaking [pc.cocksLight], coming away with a trail of goo and precum attached.");
			}
			else if(pc.hasVagina()) 
			{
				output("[pc.vaginas] with warm goo and feeling your womanhood");
				if(pc.totalVaginas() > 1) output("s");
				output(" heat up. She basks in the attention as you stare over your shoulder, biting your lip.");
			}
		}
		output("\n\nAny plans you might have had to continue tormenting her are lost when she rises from her seated position");
		if(pc.isTaur()) output(" and leans over you");
		output(", pressing her breasts into your back");
		if(pc.hasVagina()) output(" and sliding a gooey finger inside you. You pull away, half-unwillingly, before she can change your plans");
		else 
		{
			output(" and sliding a gooey finger inside your [pc.asshole]. Your stiff ");
			if(pc.cockTotal() == 1) output("prick streams");
			else output("pricks stream");
			output(" with [pc.cum] from the prostate stimulation, and below you, Celise’s gooey body oozes into position to catch it. You pull away before she can milk you dry");
		}
		output("; her finger pops free with a wet, sucking noise.");

		output("\n\n“<i>Aww,</i>” your lover sighs. “<i>I thought that’s why you were here?</i>”");
	}
	//merge nude/clothed
	output("\n\n“<i>Sit up.</i>”");
	output("\n\nCelise obediently pulls herself back into shape, snapping upright with such eagerness that her edges wobble. “<i>Like this?</i>” she asks, hopeful.");
	output("\n\nYou answer by backing into her, gradually bringing your [pc.butt] right to her chest");
	if(pc.isNude() && pc.isTaur()) output(" again");
	output(". She caresses the cheek lovingly, but before she can probe anything, you plop down in her lap. Leaning back, you glance over your shoulder; Celise ");
	//(taurs or height > 9ft)
	if(pc.isTaur() || pc.tallness >= 108) output("stretches her torso, dragging her syrupy nipples along your back, and ");
	output("looks you in the eye. You shift a bit, rubbing yourself against her breasts, enjoying the way her semi-sticky body clings to your [pc.skinFurScales]. The galotian hums pleasantly, still unaware of what you’re planning, but you decide not to draw it out any longer. With a push, you shove your back into her chest, forcing her emerald tits to part around you.");

	output("\n\n“<i>[pc.name]? W-what...</i>” Celise stammers as you squeeze through her gooey cleavage, sinking further and further into the mounds. You wiggle your ass a bit more, forcing it into her gooey undercarriage");
	//(giga celise option)
	if(flags["GIGACELISE"] == 1) output("; her tentacles squirm out from beneath you and reform along the edges of your body, making your submersion a ticklish affair");
	output(". “<i>Oh my,</i>” she gasps, finally on the same page as you. Her body flows to the sides, lowering you into the depression left behind, and the goo around you quivers, uncontrolled, as Celise emits a low moan.");

	output("\n\n“<i>Whoopsie,</i>” she giggles, hand over her mouth. It’s almost as if the unflappable woman were embarrassed at this surprising turn of events. You spoon her gooey flesh liberally over yourself as she lowers you the rest of the way, and, with a shift and a slurp, you’re completely inside. Her voluminous breasts ");
	//(PC < E-cup)
	if(pc.biggestTitSize() < 7) 
	{
		output("encompass your chest, coming back together until they once again take up position; a weight of gooey green cleavage presses down on your ribcage, rising and falling with it. This must be what it feels like to have Celise’s amazing endowment. Your lover kisses the back of your neck unexpectedly, and your new breasts wobble as your breath stops short.");
	}
	else 
	{
		output("drift back together, sliding into your own, piling up green flesh and parting around your huge rack like an enormously slow wave breaking over rocks. Your [pc.biggestBreastDescript] are painstakingly covered in a layer of warm, thick Celise, stopping just short of the areolae. Errant strands of goo creep from the rings to tweak and moisten your exposed nipples as Celise playfully bites your ear");
		if(pc.hasDickNipples() || pc.hasCuntNipples() || pc.isLactating()) 
		{
			output(" and your ");
			if(pc.hasDickNipples()) output("concealed nipplecocks");
			else if(pc.hasCuntNipples()) output("fuckable nipple-holes");
			else output("lactating teats");
			output(" muster a dribble of [pc.milk] to answer them");
		}
		output(".");
	}

	//for F and H
	if(pc.hasVagina())
	{
		output("\n\nThe gooey skin ");
		//(uniped)
		if(pc.legCount == 1) output("pools in your lap, filling it with warmth that makes you squirm.");
		//(non-uniped)
		else output("slides between your thighs, snaking tendrils that bring trails of warmth to your outer lips. With a gush, the fluid pressure forces your legs apart, exposing you.");
		output(" A strange column of darker green begins to take shape below you, growing outwards in a line from your pussy. At ten inches it stops growing and waits; the column wiggles enticingly and Celise stops teasing your neck, apparently waiting for something.");
		if(pc.isTaur()) output(" You spread your thighs for a better look, and Celise takes it as a signal. Hands emerge from the gooey covering of your own arms, grasping the green column and pushing it toward you. Try as you might to move them yourself, the gooey hands slide Celise’s toy through your outer lips at a lazy pace; it feels round and hard, thicker every second as it tests the edges of your depth. With more and more inches of warm, solidified galotian filling your [pc.pussy] and you powerless to speed or slow their advance, you can’t suppress a shudder that jiggles your massive green mammaries. Celise leans heavily on your neck, enjoying the feel of the first penetration. Only once it’s inside does she allow the movement of your own arms to influence the gooey hands she’s gifted you with.");
		//(nontaurs)
		else output(" The column taunts you with its closeness, and you reach for it. It’s wet and thick, hard in your hand, with a pleasant warmth, and it’s obvious what she intends you to do with it. Suppressing a sigh, you slide the green rod into your [pc.vagina], savoring the way Celise thickens it to a perfect fit. Each inch is better than the last as she refines the shape, and the tool grows new bumps and ridges whenever Celise finds a spot that makes you moan and shudder. Her head lolls against yours, and you suspect that she’s enjoying the initial penetration as much as you are.");
		//virgin check
		pc.cuntChange(0,pc.vaginalCapacity(0),true,true,false);
		output("\n\n“<i>How’s this?</i>” she asks, rolling the tool slightly. You hum in reply, finally pulling the toy back out. It slides back in easily, too easily, and Celise sighs as it does. It occurs to you that she must be ‘helping’ you on the in-stroke, eager to keep it inside you where your wetness is most concentrated, but this thought is chased away quickly.");
		if(pc.hasClit())
		{
			output(" [pc.OneClit] ");
			if(pc.clitLength < 1) output("rubs a groove");
			else output("fucks a hole");
			output(" in its surface when you change angle, and Celise thoughtfully peels her layer of goo away from your button to give you the full sensation.");
		}
		output(" A bulge forms above your ");
		if(pc.isTaur()) output("surrogate ");
		output("hand, preventing you from shoving the toy all the way in, but you pay it little mind... until the bulge branches and another rod presses up to your goo-slicked asshole. Celise giggles as you freeze, deciding whether to push, but soon makes the decision for you. The toy slides in again under her own impulse, giving you the incomparable sensation of having both holes filled with warm, firm, pulsing flesh.");
		//buttvirg check
		pc.buttChange(pc.analCapacity(),true,true,false);
		output("\n\n“<i>Guess that means you like it,</i>” she decides. You pull the toy out again, focusing on the way it fills to fit and tease your [pc.asshole], and groan.");
		output("\n\n“<i>Mmmmmh.</i>”");
	}
	//for M and H
	if(pc.hasCock())
	{
		//add to end of F fork if H
		if(pc.hasVagina()) 
		{
			output("\n\nCelise bites her lip behind you, and a sheen of green slides up your [pc.cockBiggest] in an instant. “<i>Yummy penis,</i>” she giggles. She wiggles your hips for you, and your erect ");
			if(pc.cockTotal() == 1) output("dick wobbles");
			else output("dicks wobble");
			output(" back and forth. “<i>Big and hard,</i>” she adds, enjoying the weight and heft of your tool as if it were part of her body. Clearly, she likes it.");
			if(pc.isTaur()) output(" Limbs of goo emerge from the bulk under your hips, forming hands that wrap around lovingly. One begins to stroke, pumping the shaft, while another licks at the frenulum and glans, tickling the opening.");
			else 
			{
				output(" Your free hand is drawn irresistibly to it by your green glove, and you wrap your fingers around the shaft");
				if(pc.hasSheath(pc.biggestCockIndex())) output(", just above the prepuce");
				output(". The sleeve glides along your cock as you begin to stroke.");
			}
			//(big dicks)
			if(pc.biggestCockLength() >= 12) output(" That alone is not enough to stimulate your monster meat, and another pair of gooey hands actually rise from the slime on your thighs, taking up more places on your [pc.cockBiggest] and jerking you off in tempo with the other strokes.");
		}
		//M only
		else
		{
			output("\n\n“<i>Mmm, you taste good,</i>” she mumbles, as precum dribbles into the goo sleeve. “<i>You have more, right?</i>” A slender finger pokes you in the asshole and your back arches automatically to avoid it, but can’t. The galotian’s body moves with your own, and the finger of goo penetrates your anus inexorably. So slim that it doesn’t hurt, nonetheless it’s long enough to tickle your prostate, and your ");
			if(pc.cockTotal() == 1) output("dick drools");
			else output("dicks drool");
			output(" more precum into the hungry goo-girl, turning the end of her slimy onahole ");
			if(pc.cumColor() == "green") output("an even deeper green");
			else output("[pc.cumColor]");
			output(".");
		}
	}
	//all sexes
	output("\n\nThe sensations build quickly; your back shifts and flexes as you thrust ");
	if(pc.hasVagina()) output("the toy into your [pc.vagina]");
	else if(pc.hasCock()) output("your cock through slippery, gooey hands");
	output(", rolling the slimy, chartreuse orbs on your chest around wildly.");
	//(tits >= E and nipcocks/nipcunts)
	if(pc.biggestTitSize() >= 7 && (pc.hasCuntNipples() || pc.hasNippleCocks()))
	{
		output(" The ");
		if(pc.hasNippleCocks()) output("erect, drooling pricks");
		else output("dribbling fuckholes");
		output(" in your exposed nipples splatter fluid on your chest with each contortion; you feel the rings of slime trying but failing to summit your dizzying rack, and Celise hums in frustration as they max out on the areolae with inches left to go. Her disappointment only makes your mutated nipples wetter with excitement.");
	}
	output(" You ");
	if(!pc.isTaur()) output("stop masturbating briefly to ");
	output("grasp your goo-enhanced breasts, sinking your fingers deep within them");
	if(pc.biggestTitSize() > 1) output(" to the flesh below");
	output(", squeezing and kneading for both Celise’s pleasure and your own.");
	if(!pc.isTaur()) output(" She, for her part, keeps her slimy toy at work at a slightly relaxed pace until your hands return.");

	//M and H
	if(pc.hasCock())
	{
		output("\n\nThe sensation of the gooey sex toy is more than orgasmic, and ");
		if(pc.balls > 1) output("your [pc.balls] tighten up as ");
		else if(pc.balls == 1) output("your [pc.ball] tightens up as ");
		output("you near your climax, fucking your slimy sleeve faster and faster. Goo shifts under your hand, sliding along your [pc.cockBiggest] and gathering at the tip just in time for the first stroke. ");
		if(pc.cumQ() < 1000) output("The impromptu condom balloons with [pc.cumColor] as you empty your load into the slimy sleeve, twitching. Celise giggles behind you as her gooey form redistributes the nutrients, and you can feel the hot cum sliding back down the outside your cock as it makes its way to Celise’s core. The sensation is enough to trigger aftershocks in your swollen, sensitive prick.");
		else
		{
			output("It’s not enough; the impromptu condom balloons with [pc.cumColor] and then bursts, freeing you to spray [pc.cumVisc] ejaculate into the air.");
			if(pc.isTaur()) 
			{
				output(" Celise gasps and moves her gooey hands over the tip to hold in the energetic spooge, but you blow through those as well with one powerful stroke, scattering [pc.cumNoun] and bits of goo. The next squirt hits your chest unimpeded; Celise’s slime is lined with your jizz as you fire stroke after powerful stroke into your ");
				if(pc.biggestTitSize() < 1) output("fake ");
				output("breasts and neck. She tries her best to control your twitching [pc.cockNoun], but your bucking hips point the last major spurt right at your face, where it impacts with a giggle from Celise and drips down your chin.");
			}
			//(non-taur)
			else
			{
				output(" Celise gasps and forces your arm forward, holding your free hand over the head of your penis while the other rubs out your orgasm. Warm, [pc.cumVisc] semen covers your palm, over and over, falling back to ooze down your spasming [pc.cockNoun] and into the gel below each time. She moans happily as your crotch turns into a ");
				if(pc.cumColor() == "green") output("deep green");
				else output("sickly, greenish-[pc.cumColor] swamp.");
			}
		}
	}
	//F and H
	if(pc.hasVagina())
	{
		output("\n\nCelise groans and shivers, and her gooey toy forces itself all the way into your vagina and asshole with barely any help from you. An odd sensation washes against the walls of your [pc.pussy] and [pc.asshole]; a hot, semi-fluid pressure that makes you feel stuffed and warm at the same time. The dildo begins to bend in your hands, and you realize what it is you’re feeling: Celise is orgasming and her loss of concentration is literally liquefying the toy inside you. As hot goo fills every bit of your interior, you shudder over the edge yourself. Your pussy squirts and dribbles [pc.girlCum] and is immediately licked clean again by Celise’s melting prick.");
		output("\n\n“<i>[pc.name],</i>” she moans, “<i>So good, [pc.name].</i>” The goo-girl’s girth pours into you as she tries to thrust again, turning to jelly as soon as it passes your entrances and simulating another squirt of jizz that warms your insides. Celise’s rod collapses completely and she releases control of your hands, freeing you to heighten your orgasm by pinching your [pc.nipples] and fingering your sloppy, slimy pussy. You absently play with yourself like this for a while as Celise recovers, and almost become aroused again when she finally collects herself enough to slide out of you.");
		output("\n\n“<i>So tasty... you’re the best,</i>” she sighs, satisfied.");
	}
	//all sexes
	output("\n\nYou turn to look over your shoulder at the galotian’s face; she’s completely blissed-out on your ");
	//(M and H)
	if(pc.hasCock()) output("[pc.cum]");
	else output("[pc.girlcum]");
	output(". She looks lovingly into your eyes, and with a wink from her, your arm raises up to your chest. The sucking sensation of Celise’s slime receding from your upper body draws your attention; the gooey hand she holds over you is ");
	//(small cum/no squirter)
	if(!pc.isSquirter() && pc.cumQ() < 1000) output("partially");
	//(big cum/squirter)
	else output("completely");
	if(pc.hasCock()) output(" [pc.cumColor]");
	else output(" [pc.girlCumColor]");
	output(". ");
	if(pc.libido() < 40) 
	{
		output("You hesitate to move it away, and Celise loosens her grip on the accumulated fluids, allowing them to fall onto your chest. The hot ");
		if(pc.hasCock()) output("jizz");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) output("girl juice");
		output(" oozes ");
		if(pc.biggestTitSize() >= 2) output("between the cleavage of your [pc.fullChest]");
		else output("down your [pc.skinFurScales]");
		output(" and back into the pool of slime at your navel as Celise kisses your neck, murmuring admiration for her captain. When her hand is completely empty, her body surges over yours once again, collecting every last ");
		if(pc.hasCock()) output("[pc.cumVisc]");
		else output("[pc.girlCumVisc]");
		output(" drop from your [pc.skinFurScales] before she releases you.");
	}
	//(lib >= 40)
	else
	{
		output("Your lips part slightly as you examine the product of your lovemaking, and Celise’s head leans forward, over your shoulder. Her opaque eyes glitter as she dances the ");
		if(pc.hasCock()) output("jizz");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) output("lube");
		output("-soaked hand in your field of vision, watching you follow it. She brings it up to your mouth, tittering, and when you make no move to push it away, pops a slimy finger inside. The strange, slightly ");
		if(pc.hasCock()) output("[pc.cumFlavor]");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) output("[pc.girlCumFlavor]")
		output(" flavor of the mixture fills your mouth as her digit paints a small puddle of fluid onto your tongue. Celise turns your head toward hers with her other hand, enjoying the expression on your face, and then suddenly pulls the finger out and kisses you deeply. Her tongue covers your own, slurping up every bit of fluid her finger left behind and departing just as abruptly.");
	}
	output("\n\n“<i>Yummy cummy, all mine. Can we do it again?</i>” she grins, shamelessly.");
	//end scene; increase sensitivity and decrease libido
	processTime(20+rand(15));
	celise.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function zDomCeliseGo():void
{
	clearOutput();
	showCelise();
	author("Zeikfried");
	output("“<i>Oooh, Captain,”</i> whispers Celise. “<i>It’s been too long since you fed me.”</i> The easy galotian slides up to you, running her hands over your [pc.chest].");
	//(high sens)
	if(pc.libido() >- 50) output(" The warmth of her touch brings a flush to your [pc.skin], and her eyes narrow voraciously.");
	output(" The rest of her liquid form follows, and soon every inch of her is pressed against you.");
	if(pc.biggestTitSize() >= 5) 
	{
		output(" She drags her cushiony rack along your torso until it bumps the bottoms of your own jiggling breasts, resting her head in your cleavage and looking up at you with an exuberant smile. Arching her back, she brushes your ");
		//(multi-rack)
		if(pc.bRows() > 1) output("lowest ");
		output("nipples with her soft tits.");
	}
	//(tall PC)
	else if(pc.tallness > 75) output(" She drags her beautiful breasts as high up your body as her chest will go, squeezing them together until you can barely see anything except canyons of cleavage under her predatory lips.");
	else output("She drags her bodacious bosom right up your torso, stretching higher until your face is buried between her melon mountains, then jiggles her breasts until they lap at your [pc.ears].");
	output(" “<i>You know you want to let off some of those burdens of command,”</i> she sings.");

	output("\n\nThe weight pressed against you increases as her gooey undercarriage shifts up into her voluminous ass, and she grabs your hands, holding them to her backside as it swells, filling your palms with supple galotian.");
	if(pc.hasCock() || pc.hasTailCock()) 
	{
		output(" Under the onslaught of breast and butt, your ");
		if(pc.hasCock()) output("[pc.cocks]");
		else output("[pc.tailCock]");
		if(pc.cockTotal() == 1 || pc.hasTailCock()) output(" swells");
		else output(" swell");
		output(" with blood, straining and staining ");
		if(!pc.isCrotchGarbed()) output("the yielding skin of your lover");
		else output("your [pc.lowerGarment]");
		output(" with the [pc.cumColor] of your precum.");
	}
	//(PC no penis)
	if(!pc.hasCock()) 
	{
		output(" As the woman’s slippery flesh caresses yours, it’s no time at all before your [pc.nipples] are ");
		if(pc.hasFuckableNipples() || pc.hasInvertedNipples()) output("puffy");
		else output("erect");
		output(" with pleasure and your [pc.vaginas] ");
		if(pc.wettestVaginalWetness() < 3) output("dribble");
		else if(pc.wettestVaginalWetness() < 5) output("drool");
		else output("gush");
		if(pc.totalVaginas() == 1)
		{
			if(pc.wettestVaginalWetness() >= 5) output("e");
			output("s");
		}
		output(" with excitement.");
	}
	output(" Celise takes notice, pushing more of her mass toward her ass until the weight of the well-appointed woman begins to drag you down. She leans harder as your arousal intensifies, until it’s easier to let her bear you onto the floor than to try to keep standing as your arms overflow with horny goo-girl.");
	output("\n\n“<i>Oh, you’re such a beast,”</i> Celise teases");
	if(!pc.isNude()) output(", unfastening your [pc.gear] with the precision of one who has thought a lot about you naked");
	output(". “<i>Are you going to make me eat off of the floor?”</i>");

	output("\n\nThe galotian’s ass shifts and slides atop you");
	if(pc.hasTailCock()) output(", pinning your [pc.tails] between your bodies");
	output(", and Celise straddles your crotch so closely that ");
	if(pc.hasCock() || pc.hasTailCock()) 
	{
		output("the warm, wet skin of her stomach is pressed against the underside of your ");
		if(pc.hasTailCock() && !pc.hasCock()) output("now-unfolding tail-");
		output("prick. Her open-mouthed smile widens even further as she slides up the tumescent shaft, moving her wet slit into position");
	}
	else
	{
		output("the hot, wet skin of her groin grinds against you");
		if(pc.hasClit()) output("r [pc.clits]");
	}
	output(". The ravenous woman’s mouth opens slightly as her crotch contacts the heat of your own.");

	//females with no cocks anywhere split
	if(!pc.hasCock() && !pc.hasTailCock())
	{
		output("\n\nAs Celise massages her gooey fingers ");
		if(pc.biggestTitSize() < 1) output("along your chest");
		else if(pc.biggestTitSize() < 4) output("over your small breasts");
		else output("over the curves of your shapely bust");
		output(" and ");
		if(pc.hasFuckableNipples() || pc.hasInvertedNipples()) 
		{
			output("dips her slippery, hot fingertips into your aching");
			if(pc.canMilkSquirt()) output(", milky");
			output(" nipples");
		}
		else 
		{
			output("pinches your ");
			if(pc.canMilkSquirt()) output("dribbling ");
			output("nipples in her slippery, hot grip, it becomes clear that the hungry alien isn’t going to offer you any control over the fuck unless you take it.");
		}
		output("\n\nGrasping her wrists in your hands, you unbalance Celise with a mighty pelvic thrust and roll over until the galotian is pinned underneath you, eyes wide with surprise. Before she can speak, you lean in and press your lips together. Her shock fades as your tongue slides over hers, and her arms reflexively push against your grip, trying to drape around your neck. When you pull back from the kiss, Celise’s eyes open slowly.");
		output("\n\nYou place a finger over her lips to shush her, and sit up atop your lover. Straddling a goopy thigh, you begin to slide back and forth along it, teasing your [pc.vaginas] with Celise’s slick skin. She even gets into it as the heat of your crotch begins to radiate through her. Small, soft nodules and ridges pop into existence along her thigh while her newly-freed hands play with her tits. It feels as though Celise’s leg is lapping at your");
		if(pc.hasClit()) output(" clitoris");
		else output(" sex");
		output(" with a carpet of tiny cillia, and your [pc.tongue] lolls from your mouth as you grind her thigh over and over.");
		output("\n\nSuddenly, a pair of cool hands break you from your trance - Celise has gripped your hips to hold you even closer and is staring at your crotch like it’s bringing her a cold lemonade. You know that she would gladly and inevitably tease your puss");
		if(pc.totalVaginas() == 1) output("y");
		else output("ies");
		output(" to orgasm like this, but though arousing, the thought leaves you wanting more. As much fun as Celise’s nodules offer, your spacious cunn");
		if(pc.totalVaginas() == 1) output("y throbs");
		else output("ies throb");
		output(" with a lust to be filled.");

		output("\n\n“<i>Not yet,”</i> you warn. Celise blinks at you innocently and the slimy cillia recede into her thigh as quickly as they appeared.");
		output("\n\n“<i>Whatever you say,”</i> your lover giggles. She stops pinching her nipples and folds her hands coquettishly over her collar as you slide forward. Your sweltering crotch bumps the bottom of her breasts, and Celise eyes you curiously as you lift yourself up and away, hovering over her right nipple. ");
		if(pc.isTaur()) 
		{
			output("She quickly comes to an understanding as you press [pc.oneVagina] onto the erect nub, trying to force it inside your ");
			if(pc.vaginas[0].looseness() < 4) output("stretched");
			else output("gaping");
			output(" hole. As you rise up again, her hands wrap around her breast, squeezing the malleable goo into a more tubular shape that fills you as you sink again.");
		}
		else output("Understanding is forced upon her as you reach down and squeeze her breast into a roughly tube-shaped tit, then lower [pc.oneVagina] onto the end, swallowing the erect nub. More and more of Celise slides inside you as you rock into position.");
		pc.cuntChange(0,300);
		output("\n\nThe woman clenches up as her sensitive breast-flesh is forced into you, releasing a moan in time with your own as her nipple brushes against your cervix. “<i>Oh my,”</i> she marvels, staring at the one breast now deep inside you. “<i>It’s so warm and wet...”</i> Celise arches her back and bites her lip as you begin to bounce up and down, and her other breast jiggles violently as you land on her chest with muffled thumps.");

		output("\n\n“<i>Make those bumps again,”</i> you demand.");

		output("\n\nShe giggles at you and the surface of her squishy skin is once again covered with velvet ridges. “<i>Like this?”</i> she asks breathily. You only grunt in reply, swiveling your [pc.hips] to savor the fullness of your pussy. Every nodule feels like a tiny wet mouth as it passes through your opening. It’s so hot, and you’re still so horny from rubbing against her leg, that your orgasm races up faster than you can control. Celise’s eyes roll back and she thrusts her chest toward you as your vaginal walls clamp down on her breast, clearly enjoying it almost as much as you are. A ");
		if(pc.wetness() < 3) output("trickle");
		else if(!pc.isSquirter()) output("dribble");
		else output("stream");
		output(" of fluid seeps down her chest as you climax");
		if(pc.isSquirter()) output(", your usual squirts of femcum arrested by the absorbent boob filling you");
		output(".");
		output("\n\nSatisfied for now, you rise from your galotian lover. Her breast pulls free with a wet ‘sllllurp’. “<i>Hee hee... docking clamp released,”</i> she titters. Breathless, you reach down and squash her sopping, tubular boob back into its normal shape. You smile, and she smiles coyly back.");
		//end, adjust time and lust
	}
	//cock/tailcock fork
	else
	{
		var cockSum:Number = 0;
		if(pc.hasCock()) cockSum += pc.cockTotal();
		if(pc.hasTailCock()) cockSum += pc.tailCount;
		var cumQ:Number = pc.cumQ();
		
		output("\n\nThe ravenous look in Celise’s eye is as good as a guarantee that unless you take control of the fuck, she’ll roll over you like a runaway glazed donut, leaving you sticky everywhere but ultimately unfulfilled. ");
		if(pc.biggestCockLength() > 60) output("She practically oozes her way up your [pc.cockBiggest], stretching her body to match your enormous meat and stopping when the tip is just under her breasts. Her stomach ripples and parts around the gargantuan tool, engulfing it in her hot, gooey flesh.");
		else 
		{
			output("Her stomach ripples around your ");
			if(pc.hasCock() && pc.hasTailCock()) output("mutant tail and [pc.cocks], half-coaxing and half-sucking their secret out");
			else if(!pc.hasCock() && pc.hasTailCock()) output("mutant tail, half-coaxing and half-sucking its secret out");
			else output("[pc.cocks]");
			output(", drawing the hot shaft");
			if(cockSum > 1) output("s");
			output(" right through her body wall.");
		}
		output(" She pauses with ");
		if(cockSum > 1 && pc.biggestCockLength() < 60) output("one");
		else output("the");
		output(" crown exposed and, when you look up at her, gives you a sly wink and uses her fingertips to push your tool the rest of the way through her hot, velvety skin. You groan as the sides of the opening lick at your too-aroused cockhead.");
		if(pc.cumColor() != "green") output(" A small string of [pc.cumColor] precum floats suspended in Celise’s green stomach, marking the point of entry.");

		output("\n\n“<i>The package is secured,”</i> she giggles, pleased with herself. Your horny galotian begins to gyrate around your shaft, swirling her fluid hips. This is it: take control now, before she builds up momentum. You buck fiercely, startling Celise. She stops rolling her gooey ass over your crotch, and you seize the moment by thrusting powerfully upward into her. Her head rolls back as ");
		var x:int = pc.biggestCockIndex();
		if(pc.hasCock() && pc.cocks[x].cLength() > 40) output("40 inches");
		else if(pc.hasCock()) output(num2Text(Math.floor(pc.cocks[x].cLength())) + " inches");
		else output(" inches");
		output(" of dick slide deeply into her, touching parts of her yet unstimulated.");

		//hyper fork - for biggest dicks longer than 40in - assign biggest cock to x
		if(pc.hasCock() && pc.cocks[x].cLength() > 40)
		{
			output("\n\nWith her already stretching herself just to fit your [pc.cockBiggest], every new thrust deforms Celise’s body further, until she resembles a slimy cast of ");
			var doubleGigantoDick:int = -1;
			var y:int = pc.biggestCockIndex2();
			if(y >= 0 && pc.cocks[y].cLength() > 40) doubleGigantoDick = y;
			//(one 40in+ cock)
			if(doubleGigantoDick < 0) output("your unwieldy [pc.cockNounSimple " + x + "]");
			//(2+ 40in+ cock)
			else output("your enormous penises");
			output(". She burbles, unable to speak as the [pc.cockHeadBiggest] presses up to the back of her lips, and her taut breasts wobble against the side of your freaky phallus, making it bob slightly every time you pound it into her slick hole. Seizing her gooey hips and pulling down, you shove deeper into the sex-crazed woman until her head is stretched over your crown like a slippery foreskin. You briefly make eye contact with the galotian, whose formerly-coquettish green face now resembles a [pc.cockHeadBiggest].");
			pc.cockChange();
			output("\n\n“<i>How does it feel, being my dick?”</i> you taunt. Rolling your hips, you bounce Celise in the air, causing air to rush over the surface of the galotian-turned-[pc.cockNounSimple " + x + "]. Celise rubs anxiously at her throat, tickling your shaft, and it sends you over the edge.");
			if(pc.balls > 0) output(" Her eyes widen as your [pc.sack] tightens up, mashing against her abused labia.");
			output(" With one more push, the green foreskin opens and her mouth is stretched wide, exposing your slit. Releasing a great moan, you orgasm, ejaculating [pc.cum] through Celise’s lips as her eyes roll. Her tongue caresses the underside of your crown and laps at the slit as your seed bubbles forth, trying vainly to intercept the ");
			if(cumQ < 10) output("dribble of jizz from your exhausted [pc.balls].");
			else output("stream of [pc.cumColor] jizz arcing across the engine bay.");
			if(cumQ >= 1000) 
			{
				output(" A tiny alarm sounds in your mind as your hyper-fertile [pc.balls] ");
				if(pc.balls > 1) output("empty");
				else output("empties");
				output(" onto the bay floor. With difficulty you aim your spasming groin straight up, causing the semen to rain down on Celise’s creamy skin.");
			}
			output("\n\n“<i>Ah... ah...”</i> the woman moans, causing vibrations around your slit. “<i>It feels good... when you cum.”</i> Her hands fall to hang limply at her sides as the last globs of spunk dribble from her lips. Carefully, you stand up and aim your [pc.cockBiggest] toward the floor. Celise, too drunk on pleasure and jizz to control her form or anything else, slides slowly off the end");
			if(cumQ >= 500) output(" and lands face-down in the puddle of semen");
			output(", resembling nothing so much as a used condom in her insensible stupor.");
			//end, adjust time and lust
		}
		//non-hypercocks and tailcock fork
		else
		{
			output("\n\n“<i>Ohhh...”</i> she sighs. “<i>I love it when you push deep inside.”</i>");
			output("\n\nNot relenting, you squeeze her tightly and thrust again and again, with the aim of going even deeper. The force of your crotch impacting hers actually staggers Celise, and her usually-shapely ass actually begins to splay and lose cohesion as your ");
			if(cockSum < 2) output("dick literally parts");
			else output("dicks literally part");
			output(" her fluid form in a quest to touch the deepest reaches of her sex.");
			if(pc.hasCock()) pc.cockChange();
			output("\n\nCelise flops forwards, ");
			if(pc.biggestTitSize() < 1) output("barely able to hold herself upright through your savage strokes by pressing against your [pc.chest]");
			else output("smooshing your tits as she tries to hold herself upright through your savage strokes");
			output(". Eventually she gives up, laying her head on your chest as you continue to knock the jelly from her frame - the puddle of shapeless galotian goo around you grows in time with her moans as the lust for more dick drains the willpower needed to maintain her form. Before you have a chance to reduce her to a quivering puddle of needy slut, though, you cum. Your ejaculation ");
			if(cumQ < 5) output("drops a little bubble of [pc.cum] right behind her tits.");
			else if(cumQ < 2000) 
			{
				output("shoots right up into her throat, the journey made easy by the distance she has sunk down onto your ");
				if(!pc.hasCock()) output("[pc.tailCock]");
				else output("[pc.cocks]");
				output(".");
			}
			//(much cum)
			else 
			{
				output("blows through the exhausted galotian like a fire suppression system, filling every corner of her torso");
				if(pc.cumColor() != "green") output(" with [pc.cumColor] slime");
				output(". She doesn’t have the focus to hold her shape, and her body bloats out as your monster load presses against every edge. Celise actually gags, spilling a small river of jizz from her mouth as she tries to speak.");
			}
			output("\n\nYou slide out from under the thoroughly-fucked woman, leaving her a pair of tits and a face floating in a satisfied puddle on the floor.");
			//end, adjust time and lust
		}
		celise.orgasm();
	}
	processTime(33);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
