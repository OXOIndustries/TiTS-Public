function celiseIsCrew():Boolean {
	return (flags["RECRUITED_CELISE"] > 0 && flags["CELISE_ONBOARD"] > 0);
}
function celiseIsFollower():Boolean {
	return (flags["RECRUITED_CELISE"] > 0);
}

//Crewmember Celise’s Screen
function celiseFollowerInteractions():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	output("Celise has settled into your ship with remarkable enthusiasm, claiming a corner near near some heat transfer pipes. Her amorphous bottom half is molded tightly into the niches between the tubes for warmth. You can even see bubbles percolating through her transparent emerald shape as she takes in thermal energies that would singe creatures with lesser physiologies. Celise’s upper half sprouts seamlessly from the barely-controlled mass of goo below, looking entirely like a human woman from the waist up - that is, if human women were green and constantly dripping.");
	output("\n\nThe galotian woman’s face is framed by a mane of unruly hair, if it can even be called that. There aren’t individual strands, just carefully shaped body-mass formed in a way that would shame any model going for a wind-blown look. It hangs halfway down her back before it ends, fanning slightly out behind her. Celise’s eyes appear equally false. They have proper shape and even include darker colored irises and pupils, but they’re obviously made of the same stuff as the rest of her. A short, upturned nose graces the space between, and below that, a pair of pouting viridian lips purse in a half-pucker as if they’re ready to kiss something at any moment.");
	output("\n\nSurprisingly, the green woman appears flat chested when you first arrive. Her torso is slim, lithe, and completely unadorned with nipples or even a belly button. Once she sees you, however, Celise’s kiss-hungry lips quirk up into a smile, and her mass of reserve goo shudders with the effort of rearranging itself. Two dark caps resolve on her chest, gaining in cohesion until they appear as a pair of perfect, pointy nipples. A moment later, the flesh beneath them surges, swelling outward with the barest hint of domed shape. More and more of Celise’s base vanishes, and those two budding orbs engorge with new mass by the second, swelling into heavy, dripping melons, their areolae widening and nipples thickening proportionally. Large breasts do not seem to satisfy the galotian temptress though, expanding beyond reasonable size and into the realm of the absurdly sexual., and with a coo of pleasure, she begins to knead her swollen tits, sinking fingers deeper inside them as they grow out over her hands.");
	output("\n\nThe goo-girl watches you with a lusty smile while her breasts finish their absurd growth, eventually pulling her half-absorbed limbs out of her enormous bosom so that her fingers can regrow. She flutters eyelashes that have become so long that they drip to the floor in your direction while her mouth coos, <i>“Oh, is it snack time?”</i>");
	output("  Celise is as sexually focused as ever. Do you give her a feeding or something else?");
	this.userInterface.clearMenu();
	if(pc.hasCock() || pc.hasVagina()) {
		if(pc.lust() < 33) {
			output("\n\n<b>You aren't aroused enough to consider any sort of sexual situation with Celise.</b>");
			this.userInterface.addDisabledButton(0,"Feed");
		}
		else this.userInterface.addButton(0,"Feed",celiseFeedingRouter);
	}
	else output("\n\n<b>You do not have any suitable genitalia to feed Celise with.</b>");
	this.userInterface.addButton(14,"Back",crew);
}

//Leave Crewmember Celise’s Screen
function leaveCelisesMenu():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	output("You wave at the ever-hungry emerald woman and head off, hearing a sigh of disappointment behind you as you go.");
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",celiseFollowerInteractions);
}

function celiseFeedingRouter():void {
	if(pc.hasCock()) {
		if(!pc.hasVagina()) dudesFeedCelise();
		else {
			clearOutput();
			output("Would you like to feed her using your male or female genitalia?");
			this.userInterface.clearMenu();
			this.userInterface.addButton(0,"Male",dudesFeedCelise);
			this.userInterface.addButton(1,"Female",feedCeliseBySavin);
		}
	}
	else if(pc.hasVagina()) feedCeliseBySavin();
}

//Feed Celise (M)
function dudesFeedCelise():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	//Intro for prostate milking, urethral harvesting, and intense suction.
	if(!pc.isNude()) output("You start to undress with a knowing smile, reaching to remove your gear,");
	else output("You start to approach, reaching for your gear,");
	output(" but Celise’s body is on you before you can manage to undo half of it. Desperate, animal hunger is plain in her eyes as she surges around you, enveloping your ");
	if(pc.legCount > 2) output("fore-");
	output("legs in her slippery mass. Her body is warmer than a human’s, and letting her envelop you up to the waist is reminiscent of sinking into a bubbling hot-tub; only this hot-tub is rubbing your [pc.skinFurScales] with languid fluid gushes, massaging you from crotch to [pc.foot] in gentle yet insistent warmth.");
	output("\n\nCelise’s dripping eyelashes flutter innocently as your gear detaches from its fasteners and bobs in the sea of green. Your codex’s screen flashes on, but it seems to function just fine as it journeys to the ground. The rest of your equipment joins it a moment later, exiting the slimy prison without a drop of moisture to mar it. The giggling goo-woman sends surges of artificially enhanced warmth against [pc.eachCock], the tiny streams heating the tingling, sensitive flesh of your increasingly aroused skin. You sigh contentedly and stagger under the delightful, fluid caresses, pulsating in her grip while the heat goes to ");
	if(pc.cockTotal() == 1) output("both ");
	else output("all ");
	output("your heads. Cradling your " + pc.buttDescript() + ", Celise arrests your stumbles with nothing more than her own cushiony body. Her aqueous tendrils touch every part of you: your [pc.legs], the underside of your [pc.belly], ");
	if(pc.balls > 0) output("your [pc.sack], ");
	else if(pc.hasVagina()) output("[pc.eachVagina], ");
	output("and even your [pc.asshole]. She is careful not to slide inside ");
	if(pc.hasVagina()) output("any ");
	else output("your ");
	output("orifice just yet.");
	output("\n\nLuxuriating in an increasingly erotic massage, you slip further inside her, [pc.legs] twitching weakly inside her as the pleasure robs you of strength");
	if(pc.isGoo()) output(", your own goo mixing with hers until you can barely tell which of you is which, only that it feels wonderful");
	output(". Celise lustily wonders, <i>“Like, how do I feed this time, [pc.name]? Should I pull out all that yummy [pc.cumNoun] with suction alone?</i>");
	if(pc.cumQ() <= 1000) output("<i> I bet if I did that enough, you’d start making enough to properly feed me in no time!</i>");
	output("”  A rhythmic tugging starts on [pc.oneCock]. <i>“I could squeeze it out from behind....”</i> A tongue of liquid warmth circles your asshole, causing your hips to lurch forward hard enough to make [pc.eachCockHead] crest her surface, dripping with emerald slime. <i>“Hehehe... maybe I should just climb inside the the tip and drink it straight from your [pc.balls]</i>");
	if(pc.cumQ() >= 5000) output("<i>. I bet I could drink so much that way that your poor [pc.balls] wouldn’t be able to make as much afterward. That’s not a big deal, right? You’re too messy anyway. I get tired of mopping it up</i>");
	output("<i>....”</i>");
	
	output("\n\nCelise’s body surges up to recapture your escaping genitals, dragging you back inside her while you try to process her words. A dozen fingers tickle across your crotch while the spunk-drinking goo-girl ponders how best to harvest your seed. If you speak up now, she’d likely obey you, but if you wait, she’s going to pick one....");
	//[Suck Out] [Squeeze Out] [Go In] [Say Nothing]
	//9999
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Suck Out",celiseSucksYouDry);
	this.userInterface.addButton(1,"SqueezeOut",celiseDoesSomeAnalMilking);
	this.userInterface.addButton(2,"Go In",celiseGoesInYerBallsYo);
	this.userInterface.addButton(3,"SayNothing",feedCeliseSayNothing);
}

//Say Nothing
function feedCeliseSayNothing():void {
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
function celiseSucksYouDry():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	output("<i>“I’ll totally suck out every drop, " + pc.mfn("mister boss-man","miss boss-lady","mis... er... boss-person") + ",”</i>  Celise promises as her human-shaped torso shifts, bending down while your body is lifted on a column of slippery force. [pc.eachCock] crests through her goopy lower form, shedding strands of goo as it goes until only your " + pc.sheathDescript(pc.biggestCockIndex()));
	if(pc.balls > 0) output(" and [pc.balls] are");
	else output(" is");
	output(" enveloped in her embrace. Before your soaking wet dick");
	if(pc.cockTotal() > 1) output("s");
	output(" can feel the chill of exposure, Celise’s face cranes down over top of them. Her “hair” hangs over your crotch like a curtain, slapping against [pc.oneCock] so that you can feel a phantom tongue lick the side.");
	output("\n\nThe amorphous emerald enchantress grabs her long hair in both hands and crushes it around your [pc.cocks], smushing her glittering locks into column of syrupy pleasure centered solely on you. Suction assaults [pc.eachCock] almost immediately");
	if(pc.cockTotal() > 1) output(", starting so simultaneously that it shocks you into silence");
	output(", pulling more blood into your loins until your [pc.cocks] feel");
	if(pc.cockTotal() == 1) output("s");
	output(" fit to burst. You can feel her breasts pressing down on your [pc.legs], submerged into herself and yet still keeping their shape so well her nipples dig into your [pc.skinFurScales], slipping and sliding over you with every motion the galotian woman makes.");
	output("\n\nCelise licks her jade lips with a tongue too long for her mouth, shining the already reflective mouth-pillows into a glittering polish as she watches your face, measuring the effects her motions are having on your body. <i>“You like that, huh, Captain? Feeling your [pc.cocks] getting sucked on like that must be pretty good.”</i>  Celise lets her tongue hang down into the translucent prison, wrapping it around your " + possessive(pc.cockDescript(pc.biggestCockIndex())) + " " + pc.sheathDescript(pc.biggestCockIndex()) + " into a tight ring. Then, she starts to slide it around, twisting it in quick circuits of your cock that make your overfull shaft thicken further. <i>“Ahm ghunga ‘ake ‘oo ftheel tho ‘ood!”</i>");
	output("\n\nSlipping behind your back, Celise’s arms connect just above your spine and pull down into a tight, form-fitting seal. The definition of her fingers and knuckles fades into a smooth column of green restraint, holding you still while the suction increases. Your [pc.toes] twitch and your back arches when the vacuum pumps on your [pc.cocks] double the tug, pulling so hard that droplets of pre-cum wick out of your [pc.cockHeads] one after another to vanish directly into the galotian.");
	
	output("\n\nSudden motion assaults you, and the texture of the prisons around your [pc.cocks] change");
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
	output("\n\n<i>“Nuh uh! Just hang on and let it happen, [pc.name],”</i>  the smiling woman hungrily chides. As if there was anything you could do but hang by your trapped hands! Celise’s not-so-tender affections grow fiercer still, and spatters of warm moisture begin to fall across your [pc.belly] and ");
	if(pc.bRows() > 1) output("the lowest row of your [pc.fullChest]");
	else output("[pc.chest]");
	output(". You look up to see her drooling glops of green goo all over you. You can’t endure much more of this. Already, you can feel the warmth of an impending orgasm building in your [pc.balls]");
	if(pc.balls > 0) output(", making them feel full and heavy as they cling and twitch tightly against you. You can feel phantom tongues all over your [pc.sack]. They flick playfully every time your balls lurch");
	output(".");
	
	output("\n\nBefore your muscles can properly clench to release your lusty payload, you feel some of it sliding through your urethra, burning a hot, passionate trail through your not-quite-ready cock before spilling into the hot, wet slickness of the vacuum-chamber. The stream of [pc.cum] doesn’t come in spurts or jets, like a normal orgasm. Instead, it’s one long rope of [pc.cumColor] food for the galotian to devour. You haven’t even reached your peak, but your [pc.hips] and [pc.legs] are shaking wildly, almost like you’ve gone past orgasm without ever actually experiencing it. Pleasure washes through you, but it’s a needy, aching pleasure, the pleasure of orgasm without the salve of release.");
	//{Multivag}
	if(pc.vaginaTotal() > 1) {
		output("\n\nYour multiple vaginas, bereft of proper penetration, spasm against a multitude of unbound tongues that rove across their engorged vulvae. Sometimes, they touch your clits, other times, they remain firmly affixed to your labia, dexterously twirling across your sex maddenly, but never plunging in or connecting with a clit properly enough to set you off. You’re kept writhing and dripping on the edge of orgasm while the constant pulling upon your other genitals drains you dry. Right about now, you’ve give anything to be properly penetrated, to properly cum.");
	}
	//{Singlevag}
	else if(pc.hasVagina()) {
		output("\n\nYour [pc.vagina], bereft of proper penetration, spasms against a multitude of unbound tongues that rove across its engorged vulvae. Sometimes, they touch your clit, other times, they remain firmly affixed to your labia, dexterously twirling across your sex maddenly, but never plunging in or connecting with a clit properly enough to set you off. You’re kept writhing and dripping on the edge of orgasm while the constant pulling upon your other genitals drains you dry. Right about now, you’ve give anything to be properly penetrated, to properly cum.");
	}
	//{Tailcock}
	if(pc.hasTailCock()) {
		if(pc.tailCount == 1) {
			output("\n\nYour [pc.tailCock] is dripping, though it is not leaking ejaculate with the fervor of your bound erection{s}. That doesn’t stop Celise from noticing the way the heated droplets of pre-cum spatter across her insubstantial skin. Almost lazily, she extends a pseudopod behind you. You cannot see the rising, gooey enclosure, but you certainly feel it when it makes contact with your trembling tailcock, spreading juice-dripping lips around your thick tailboner. Inch after inch of your throbbing, posterior phallus passes into the suckling hole, and before you know it, it’s squirting out just like your other cock");
			if(pc.cockTotal() > 1) output("s");
			output(".");
		}
		//{Tailcocks}
		else {
			output("\n\nYour " + plural(pc.tailCockDescript()) + " are dripping, though they are not leaking ejaculate with the fervor of your bound erection");
			if(pc.cockTotal() > 1) output("s");
			output(". That doesn’t stop Celise from noticing the way the heated droplets of pre-cum spatter across her insubstantial skin. Almost lazily, she extends a pseudopod huge behind you. You cannot see the rising, gooey enclosure, but you certainly feel it when it makes contact with your trembling tailcocks, spreading juice-dripping lips around your thick tailboners. Inches and inches of the throbbing, posterior phalluses pass into the suckling holes, and before you know it, they’re squirting out just like your other cock");
			if(pc.cockTotal() > 1) output("s");
			output(".");
		}
	}
	//Resume
	output("\n\n<i>“Feels like, totally good, right?”</i>  Celise asks, squeezing her arms and constantly suckling dicksleeves tighter. <i>“Most bodies can’t handle this kind of suction, and they just let it all out without getting any kind of relief.”</i>  Spots of [pc.cumColor] are swimming inside her as she teases you. <i>“You taste so good, too! Captain, I could keep you like this all day long!”</i>");
	output("\n\nYou shudder, wracked by rising ecstasy and yet unable to hit the climax that feels so achingly close. The steady ejaculation continues well past when you thought you should have gone dry.");
	if(pc.cumQ() >= 5000) output(" Celise, meanwhile, is flush with fresh fluid, noticeably less cohesive and dripping uncontrolled moisture into a puddle of sex and goo at her base.");
	output(" She draws cum from you until the flow thins, turning runny, more water than protein, and an uncomfortably empty feeling grows even as your [pc.balls] ");
	if(pc.balls > 0) output("empty");
	else output("empties");
	output(". You " + pc.mf("growl","whine") + " in discomfort, lamely bucking your hips in an attempt to get off.");
	
	output("\n\n<i>“Ohhh, it’s drying up,”</i>  Celise sadly gushes. <i>“Wanna cum?”</i>");
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
	else if(pc.cumQ() <= 5000) output("<i>Oh wow, that was filling. You cum just the right amount for me, [pc.name]. You're so perfect....</i>");
	else output("<i>I think... you need to tone it back a bit, Captain. Maybe let me climb inside you and tune you to have just the right amount of cum for a girl like me. I’ll make it feel good, I promise.</i>");
	output("”");
	output("\n\nStretching languidly, you pull yourself out of her grasp and gather your things. She’s a little over-enthusiastic, but she leaves you with the most satisfying ache in your crotch after a nice suck.");
	if(pc.cumQ() < 1000) {
		output(" You can feel your body responding to her sexual training already if that wondrous throb is any indication.");
		if(pc.balls > 0 && pc.ballSize < 5) pc.ballSize++;
		if(pc.ballEfficiency < 400) pc.ballEfficiency++;
		if(pc.cumMultiplier < 150) pc.cumMultiplier++;
		if(pc.refractoryRate < 50) pc.refractoryRate += .5;
	}
	pc.orgasm();
	celise.orgasm();
	processTime(25+rand(4));
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Anal Milking
function celiseDoesSomeAnalMilking():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	output("<i>“Yeah, you need a nice, long milking. A " + pc.mfn("boy","girl","person") + " like you has so many things to worry about out here,”</i>  Celise soothingly prattles as her body shapes around your [pc.butt], sliding fingers of hot, wet heat through your crack. You gasp and shift inside her only to be pushed back into place by the unstoppable force of a liquid wave crashing over you. <i>“Hold still, Captain, it’s time you were milked. Just relax and I’ll make you feel very good.”</i> Squishy, half-formed fingers clasp [pc.eachCock], bouncing ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(" lightly. <i>“Very good,”</i>  she purrs.");
	//Jackass
	if(pc.isAss()) output("\n\nYou reply, <i>“I’m only doing this because you’d be insufferable otherwise,”</i>");
	//Mischievious
	else if(pc.isMischievous()) output("\n\nYou nervously ask, <i>“Are you sure you know what you’re doing back there?”</i>");
	//Good
	else output("\n\nYou politely ask, <i>“Just be careful, okay?”</i>");
	output("  but it is hard to keep the catch of anticipation out of your voice. The feeling of the aqueous woman’s form surging over the most intimate cracks and crevices of your body is sending pleasant tingles through your body, particularly as she massages the ring of your [pc.asshole]. Your [pc.cocks] give");
	if(pc.cockTotal() == 1) output("s");
	output(" an eager twitch at this, even constrained by the gelatinous mass as they are. Tender licks trace along ");
	if(pc.cockTotal() > 1) output("their forms ");
	else output("its form ");
	output("in response, affectionately rewarding you for the feeding to come.");
	output("\n\n<i>“I’ll be soooo careful,”</i>  Celise coos while slipping a thread-sized pseudopod through your pucker. <i>“You deserve to be pampered from time to time, to be massaged and caressed.”</i>  The gel-crafted intrusion thickens, forcing your sphincter to dilate wider. It’s now the size of a finger and pressing a few inches into your [pc.asshole]. Bubbling heat passes inside you, and you feel the tip of it thickening, shaping your internals to hold it. It feels like a fat bulb on the end, probably the size of an apple by the way you can feel it pushing on you, yet its insertion is as gentle the barest hint of friction on your ring.");
	output("\n\nGiggling, Celise watches your face as she works. <i>“Feeling it now, [pc.name]?”</i>");
	output("\n\nYou have to admit that you are. Your [pc.cocks] ");
	if(pc.cockTotal() > 1) output("are");
	else output("is");
	output(" harder than before. ");
	if(pc.cockTotal() > 1) output("Each of them are");
	else output("It is");
	output(" growing ludicrously hard, twitching powerfully as the weight inside you intensifies. You feel fully hard at this point, almost as hard as when you’re on the cusp of orgasm. Your body is responding the goo-girls internal pressure with arousal, and you have to admit that it feels good. The shape inside you is changing as it’s growing so that the pressure isn’t crushing the most pleasant place inside you too powerfully. Instead, it’s surrounding that tough, inner bulge (what can only be your prostate), squeezing down on it from three sides in a way that makes your [pc.cockHeads] expand.");
	
	output("\n\nThe rest of Celise isn’t idle either.");
	
	//{Nipple dick docking}
	if(pc.hasNippleCocks()) {
		output("\n\nYour nipples part as the pressure on its prostate affects all your penises, forcing your " + plural(pc.nippleCockDescript()) + " to emerge from your surprisingly sheath-like areola, parting the sensitive skin to expose new pillars of throbbing hardness. Celise doesn’t seem shocked by this at all, in fact, her smiling face displays nothing but delight. She leans forward, lifting her heaving bosom up toward your protrusions to press her own nipples against your exposed titmembers. Her supple, pebbly areolae part around you as she leans forward, giving a tiny bit before they flex inward, slowly, deliciously starting to part around your throbbing, leaking hardnesses.");
	}
	//{Nipplecunt dock}
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
	output(" around your [pc.cocks]. You [pc.legs] twitch from the pleasure, aching to fuck something, anything, but you’re waist deep in a goo woman who seems intent to milk you from behind. You gasp, <i>“More!”</i>");
	output("\n\n<i>“Are you sure you sure, Captain [pc.name]?”</i>  Celise moans in enjoyment. <i>“I - ohhhh - don’t think I’ll be able to stop once I start.”</i>  Her whole form jiggles with quakes of enjoyment.");
	output("\n\nNodding, you cry, <i>“Yes! I can’t wait any longer!”</i>");
	
	output("\n\nStarting at the base of the mound encircling you, vibrations begin ripple up the emerald cock-milker’s body. You can feel it rippling around your [pc.legs], squeezing and sliding over so fast that it feels like a constant massage. Then, it moves up to your crotch, rubbing every part of you so nicely except for your [pc.cocks], which ");
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
	output("\n\n<i>“Good " + pc.mfn("boy","cum-cow","cum-cow") + ",”</i>  Celise purrs as she works. <i>“Let it all out...”</i>  Your eyes roll back as your rectum is flooded with yet more of her warm vibrations, pushing more and more inside you until your belly bulges slightly. The orgasm you’ve been locked in for what feels like forever just drags on, not ending your waist goes numb and your squeezed-out prostate feels achy and pained.");
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
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Inside Milking
function celiseGoesInYerBallsYo():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	output("<i>“Yeah, going inside sounds super fun,”</i> Celise muses. ");
	if(pc.balls > 0) output("\n\nShe cups your [pc.sack] gingerly");
	else output("\n\nShe traces around your crotch gingerly");
	output(". <i>“A shame I can’t just crawl the whole way in there and slurp down on your yummy boysauce all day, but then you wouldn’t be able to run around having adventures would you? You’d just be stuck to the floor, </i>");
	if(pc.balls > 0) output("<i>cumming endlessly into me while you twitch ontop of your swollen sack.</i>");
	else output("<i>pulled down by weight of your belly. Your prostate would be so stuffed with me that you’d look pregnant with dozens of kids, cumming endlessly yet never letting any out of your own body.</i>");
	output("<i>”</i>  She stops her fantasizing to cup [pc.oneCock] and lick the [pc.biggestCockHead]. <i>“Mmmm, are you ready?”</i>");
	//These should be obvious where they go.
	//[Yep] [Nevermind, suck] [Nevermind, milk me]
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Yep",yepGetInMyBallsUBitch);
	this.userInterface.addButton(1,"No, Suck Me",celiseSucksYouDry);
	this.userInterface.addButton(2,"No, Milk Me",celiseDoesSomeAnalMilking);
}
function yepGetInMyBallsUBitch():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	output("You ");
	if(!pc.isAss()) output("bite your lip and ");
	output("nod.");
	output("\n\n<i>“Lets get you nice and big first. I want the journey in to be easy, and lubricated,”</i>  the emerald woman explains. Her hand reaches up to the [pc.biggestSheath] of your [pc.cockBiggest] and encircles it. Her thumb, index, and middle fingers merge together into a jade loop, wetly squishing as they seal into a tight right around you. Blood flows into your filling boner, but it doesn’t come back out, forcing the bulging bitch-breaker bigger and bigger with each passing second. You gasp at the sensation when Celise takes the [pc.biggestCockHead] straight into her mouth, plumping her lips bigger and fatter around you. Just like your penis, they get bigger and fatter with each passing second, swelling until your boner is wrapped in plump, juicy goopillows.");
	output("\n\nGasping out encouraging pants, you reach down towards Celise’s wobbling mounds, sinking your digits deep into the forgiving, semi-liquid surface of her barely-congealed melons. She gasps and moans while your fingers slip deeper, and the slippery surface fades into thick, viscous warmth around you. You swirl your hand around, feeling the inside of her tits and making the gelatinous female gasp at being fist-fucked in her own tit. She breaks from your [pc.cockBiggest] to whimpers, <i>“More,”</i>  arching her back encouragingly.");
	output("\n\nYou give her what she wants by pulling out and shifting down to her nipples, pressing your thumb down hard on the pebbly surface until it parts into a sopping-wet orifice. Celise’s entire body is like one big, juicy cunt just waiting to be penetrated. With your other fingers, you squeeze her nubs compressing them into nice tight slits that are sure to feel good as your thumb slides through them.");
	output("\n\nGlittering moist ringlets drop back down around your crotch in a semi-transparent veil, barely concealing the lewd suckling and muffled moans taking place within. Celise has returned to getting you ready, use her luscious lips and suddenly toothless maw to wrap your [pc.cockBiggest] in a syrupy tunnel of bliss. You jerk your hips in lewd little shakes against her while she works, feeling yourself clench and twitch within oral vice, already feeling a rush of warmth beginning within you that culminates in the expression of slick droplets of pre-cum.");
	output("\n\nAs soon as she tastes the beginnings of fluid release, Celise edges off your cock, connected by a web of glittering strands that hang from her chin to your " + pc.cockHead(pc.biggestCockIndex()) + " before breaking. Both of you sit there panting, joined together at your [pc.legs]. The goo-girl announces, <i>“It’s - ooohhh... ungh! It’s r-ready!”</i>  Her voice stutters while your hands continue to play with her immense tits, fucking her nipples while the rest of your fingers slip deeper into the emerald surface, eventually finding pleasant sinkholes of their own to plumb.");
	output("\n\nGathering herself, Celise shudders before holding your [pc.cockBiggest] in one hand, her own thumb curling up to press against your oozing cumslit. Hot pressure can be felt probing that leaking tip, compressing and distorting into the shape of your fluid-filled cumtunnel.");
	output("\n\n<i>“I hope you’re ready to cum,”</i>  she bubbles.");
	output("\n\nYou start to answer, but that pressure spikes, pushing the pre-cum back through your urethra and into your balls, turned back by a wave of emerald goo that’s filling every inch of your plumbing. It doesn’t hurt at all, surprisingly, it’s more like a tingle of warm, juicy goodness that slithers inside of you, forking off to touch every single cum-producing organ in your body. Your seminial vesicles are flooded. Your prostate is plugged. {Even your balls grow heavy and warm. }With each passing second, your sexual organs are more and more stuffed with the hungry goo-girl’s green goop until you wonder how you’ll hold it any more.");
	output("\n\nIt is at that point that Celise finally breaks contact with your [pc.cockBiggest], depositing a wet kiss upon its " + pc.cockHead(pc.biggestCockIndex()) + " as the last of her stuff disappears into your urethra. The strange tingles that her actions have filled you with cause your [pc.legs] to quiver slightly, and you nervously grab your slime-shined penis, examining it while your innards shift. You feel so full!");
	output("\n\nLong lashes flutter innocently as Celise watches you squirm. She idly runs her hands across the expansive curve of her chest before pulling you deeper into her base, snuggling your head between her tits and securely ensconcing your groin in the gentle mass. <i>“Wait for it,”</i>  she coos, stroking your back with one hand and your [pc.chest] with the other.");
	output("\n\n<i>“Wait for what?”</i>  you retort, finally starting to feel more at ease with the squirming inside you. Before the question leaves your mouth, the warmth inside you changes to a fervent stroking, caressing the entirety of your reproductive system from the inside. The heat in your [pc.balls] doubles in that moment, and you cry out in excitement, back on the cusp of cumming once more. An explosion of bliss explodes from deep within you, and you feel your body clenching and pumping, producing what feels a like a hot, messy orgasm. However, unexpectedly, nothing emerges into the waiting goo maiden’s mass.");
	output("\n\nSeeing your questioning look, Celise comfortingly caresses your ");
	if(pc.balls > 0) output("swelling balls");
	else if(pc.hasVagina()) {
		output("puss");
		if(pc.vaginaTotal() > 1) output("ies");
		else output("y");
	}
	else output("taint");
	output(" with warm pleasure and explains, <i>“</i>");
	if(flags["TIMES_CELISE_IN_BALLS"] > 0) output("<i>Don’t you remember? Well, let me explain again while you enjoy the pleasure. </i>");
	output("<i>The part of me that’s inside you right now is stimulating your body to orgasm, as you can surely feel.”</i>  You cry out a moan as an answer, unable to articulate anything more complex. Your body pumps the cum around inside itself, but it doesn’t seem to go anywhere. <i>“Yeah, I’m redirecting the yummy stuff back into your [pc.balls], but I’m tricking </i>");
	if(pc.balls <= 1) output("<i>it</i>");
	else output("<i>them</i>");
	output("<i> into thinking </i>");
	if(pc.balls <= 1) output("<i>it’s</i>");
	else output("<i>they’re</i>");
	output("<i> empty so that they’ll go into overdrive and make more. I’m just going to leave you cumming like this until your body wears itself out making cum. Then I’ll let it all out into these condoms,”</i>  she gestures toward a nearby pail of nanoweave condoms before continuing, <i>“for a snack later!”</i>");
	output("\n\n<i>“Whaaaa.... Ahhh!”</i>  you cry, arching your back and twitching your [pc.hips] around inside Celise, feeling her inside and outside, massaging your body to a tremendous orgasm. This time, you feel the [pc.cum] sliding around inside you, sliding into your [pc.balls] so heavily that you can feel ");
	if(pc.balls <= 1) output("it");
	else output("them");
	output(" expanding, filling with pleasant weight a moment before the next explosion of bliss rolls into. Your lids lazily droop as the consecutive cums take their toll on your consciousness, letting your mouth hang out while you’re brought to a third ");
	if(pc.balls > 0) output("ball-filling");
	else output("prostate-pumping");
	output(" orgasm. This time, there’s a definite sense of stretching - of filling beyond normal capacity, and you whimper as it concludes, immediately feeling the twinge of a fourth starting.");
	output("\n\n<i>“Shhhh, shhh,”</i>  Celise soothes. <i>“Don’t yell so loud, they’re just orgasms.”</i>  Despite her calm tone, the goo-girl is rapidly sliding herself all around you, bucking her amorphous base back and forth around [pc.eachCock]. She’s actually lost a bit of cohesion; her heavy breasts are merging back into the rest of her and dripping green moisture down into the rest of her. Clearly she’s enjoying herself as well, something she confirms when she cums, spouting green trickles from both her nipples as she does. You lack the capacity to capitalize on this, as you’re cumming for the seventh or eighth time. It’s getting too hard to keep track. Your ");
	if(pc.balls > 0) output("[pc.balls] feel like they’ve doubled in size, stretching your sack taut with their sloshing weight.");
	else output("prostate feels like it’s doubled in size, large enough that it’s actually formed a visible bulge in your belly.");
	output("\n\nCumming like that, wrapped in comforting goo and endlessly orgasming into your own spunk-reserves, you slip from conscious awareness, focusing entirely on how good it feels. Celise is similarly affected by the experience. Her green goop is splattering all over the walls with how hard she’s humping you, and she constantly prattles encouragingly to you.");
	output("\n\n<i>“Cum again, [pc.name]!”</i>");
	output("\n\n<i>“Ohhh, look at how big </i>");
	if(pc.balls > 0) output("<i>those</i>");
	else output("<i>you</i>");
	output("<i> are getting!”</i>");
	output("\n\n<i>“A little more, [pc.name], just cum a little bit more.”</i>");
	output("\n\n<i>“You don’t mind if I get a few more cums of my own in before I stop, do you?”</i>");
	output("\n\nYou lose track of her words soon enough, aware only of how your ");
	if(pc.balls == 0) output("[pc.belly]");
	else output("[pc.sack]");
	output(" is swelling out with all the unspent cum. Before long, you’ve grown so full of jizz that you don’t think could move if you wanted to. ");
	if(pc.balls > 0) output("Your immense, sloshing balls would keep your [pc.legs] from making contact with the ground, if at all, and the feeling of dragging them along would likely just set off a fresh orgasm.");
	else output("Your immense, sloshing middle is so heavy that you doubt you could lift it up, and the prostate contained within is so sensitive that dragging it along the floor would probably make you pop off a fresh orgasm.");
	output("..");
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	celise.orgasm();
	processTime(90+rand(5));
	//[Next]
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",celiseInBallsFinalEnding);
}

function celiseInBallsFinalEnding():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	output("Abruptly, you’re aware of the feeling the incredible, pleasant pleasure draining out of you, releasing the backed-up [pc.cumNoun] in a wave of ecstasy. There’s a snug tightness around [pc.eachCock] that grows tighter by the moment, and it isn’t nearly as warm or wet as the pressure you felt before. You pull your tongue back in your mouth, but you still cannot manage to suppress your pleasured moans, looking down to watch the pink surface of a condom bloating with [pc.cumColor] fluid. [pc.eachCock] is lurching powerfully, pumping out huge deluges into the beachball-sized balloon of condensed lust.");
	output("\n\nCelise plucks up fresh condoms to drop into herself. One after another, their wrappings open and their contents are drawn out. The discarded packaging ejects from her blobby undercarriage to land in a nearby trashcan. Your orgasm is once more arrested, redirected back inside yourself, causing you to give a high pitched whine of disappointment, but it does not last long. [pc.eachCock] has its condom pulled off, tied into a wobbling balloon, and then replaced with a fresh one. Once the new cum-receptacle is in place, your reproductive efflux is let free again.");
	output("\n\n<i>“Fill ‘er up!”</i>  Celise giggles, stroking you encouragingly. <i>“</i>");
	if(pc.cumQ() >= 5000) output("<i>You cum too much normally anyway.</i>");
	else output("<i>This is a good way to make sure you make enough to feed me anyway.</i>");
	output("<i>”</i>");
	output("\n\nYou fill that balloon and more like it until there is a small mountain of stored cum bobbing under its own liquid weight next to you. At that point, Celise runs out of condoms and shrugs. She removes the last one and gingerly squeezes your [pc.cockBiggest], purring, <i>“I’ll take the rest, go on.”</i>");
	output("\n\nBoy, do you ever. Torrents of [pc.cum] wash into your pet galotian, flooding her body with [pc.cumColor] deposits. Her huge breasts distend, her belly expands to the point where she looks pregnant, and her asscheeks turn into two ginormous globes of barely-restrained spunk. Eventually, she can hold no more, and the force of your orgasm propels you out of her body. You lie there, gasping and crying from the immense ecstasy, painting her [pc.cumColor] with the last of your pent-up bliss. Even after you go dry, your [pc.cocks] ");
	if(pc.cockTotal() > 1) output("are");
	else output("is");
	output(" lurching wildly, still trying to cum. You don’t stop cumming until at long last, a few cups of green ooze slide out of your [pc.cockHeads].");
	output("\n\nYou sag down, experiencing relief at last. Your ");
	if(pc.balls == 1) output("ball has");
	else if(pc.balls > 1) output("balls have");
	else output("belly has");
	output(" shrunk back down to normal, leaving nothing but a dull, almost painful ache to remind you of never-ending orgasm you seem to have experienced. Celise has busied herself moving the condoms towards a refridgeration unit, leaving you a moment to dry off, catch your breath, and get dressed.");
	if(pc.cumQ() >= 5000) {
		output(" With how hard you’re throbbing down there, you think you might have permanently lowered your ability to produce cum. Perhaps you’re a bit more productive than Celise would prefer?");
		if(pc.cumMultiplier > 10) pc.cumMultiplier -= 5;
		if(pc.ballEfficiency > 20) pc.ballEfficiency -= 10;
	}
	output("\n\nThe area is a total mess, but you’re sure the goo-girl will suck it up soon enough.");
	processTime(7);
	pc.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//Feed Celise (F)
//D-d-double MASSIVE Penetration. Waddle walk ftw.
//By Savin
function feedCeliseBySavin():void {
	clearOutput();
	this.userInterface.showBust("CELISE");
	author("Savin");
	output("With one look at the massively busty green beauty, so desirous in her sexual need, your hands move to ");
	if(pc.armor.shortName == "") output("discard your gear");
	else output("strip yourself from your [pc.armor]");
	output(". The galotian girl beams as you set your kit aside, and quickly surges toward you, her body literally stretching out to grab your arms, drawing you into her gooey embrace. Being drawn into her feels like falling continuously, your body half-enveloped in her gel-like mass that bubbles and sloshes around your [pc.legs]. Celise's amorphous lower half ebbs and flows across your bare [pc.skin], seeking across every inch of flesh as her more human parts press against your [pc.chest], smearing you with her green quasi-liquid skin.");
	output("\n\nWarm and relaxing, you let the goo-girl wrap around you, stripping away the last of your kit. She giggles girlishly as her big, alien eyes gaze between your [pc.legs] to your [pc.pussies], and she makes a show of licking her lips as she bends her body almost double to put her face right in your crotch. You can't help but shudder as Celise's steamy breath washes over your bare sex");
	if(pc.hasCock() || pc.vaginaTotal() > 1) output("es");
	output(", her cute little nose practically brushing [pc.oneClit].  The way she watches you, studying your cunt");
	if(pc.vaginaTotal() > 1) output("s");
	output(", soon has your own excitement building, and the hungry goo gives a delighted squeal as a little bead of lubricant escapes the lips of your [pc.pussy].");
	output("\n\n\"<i>Wow, you're already dripping just from me looking. Naughty!</i>\" Celise laughs, her long tongue flicking out to lap the little drop up. The feeling of her gel-tongue sliding across your vulnerable twat, the very tip parting your lips to suckle up that lonesome drop, nearly has your [pc.knees] buckling under you. With a devilish grin, she adds, \"<i>Mmm, tasty.</i>\"");
	output("\n\nSeeing the galotian girl about to get busy, you try to lean back - standing's no way to get eaten out, after all - but in the blink of an eye you're tumbling down, caught at the last moment by the great shapeless blob of Celise's lower half. She looks more like a beanbag chair than a human as you float and bob atop her, sinking several inches into her before she hardens up just enough to keep you steady. A shift in her gooey body spreads your [pc.legs] as she looms over you, licking her lips with a feral hunger. You shudder with involuntary pleasure as her gooey body shifts and squirms around your bare [pc.skin], the sensation alien and yet oddly comforting. You feel an odd, but not unpleasant sense of ease and calm whilst enveloped in the warm, sticky goo; though that hardly stops you from tensing as her delicate, slender fingers reach down to trail across your thigh, leaving wet streaks across your [pc.skin] as she slides her hands toward your bared [pc.pussies]. As her fingertips trail around your [pc.vagina], one brushing the tip of your [pc.clit], you try and relax yourself, readying for penetration.");
	output("\n\nInstead, the playful good just takes your " + possessive(pc.vaginaDescript()) + " lips and spreads them apart. You yelp as she stretches you out, peering down to look right into your gaping pussy. You start to ask what she's doing, but she just giggles, <i>\"Gotta make sure it's juuuust the right size!\"</i>");
	output("\n\n<i>\"It?\"</i>");
	output("\n\nShe gives you a grin. <i>\"You'll see!\"</i>");
	output("\n\nYou gulp, but that quickly turns to a hiss of surprise as the galotian's fingers slip down from your [pc.cunt], practically pouring into your [pc.asshole]. Your sphincter clenches instinctively, but it's nowhere near enough to stop Celise's advance: her fingers become so improbably thin that they can effortlessly pass through your shocked muscles, tickling the sensitive walls beyond. Your back arches instinctively, a sharp sigh of pleasure escaping your lips. Celise coos in delight, and suddenly you can feel the slim fingers inside your swelling, growing larger and larger, filling you until your hole seems to strain to accommodate the tremendous goo mass inside you.");
	output("\n\nCelise watches you writhe and moan on her gooey insertion with rapt attention, her lips locked in a silent, plush O that looks so perfect to kiss. You wring your arms free of the gooey mass around you and pull her down, [pc.legs] wrapping around your huge hips as you taste her. Sweet and hot on your lips, your tongue probes into the galotian's open mouth, pulling her into a tight kiss; she responds with a quick thrust into your ass, shooting so deep into you that your stomach practically bulges between you.");
	output("\n\nJust as easily as she started, though, Celise withdraws, leaving you feeling so very, very empty. She breaks the kiss, her hands sliding up your body to caress your [pc.chest]. Through her transluscent arms, though, you can see her crotch shifting and twisting, the amorphous goo reforming into " + num2Text(pc.vaginaTotal() + 1) + " thick, dripping goo-cocks that flop down onto your thighs. God, they're huge: made just for you, each more than big enough to stretch you to your limit. A soft whimper escapes your lips as the soft appendages drag down your thigh, each lining up with the hole the hole it seems so perfectly made to match.");
	output("\n\nCelise hovers at the very edge of penetration, letting you feel the pressure of your " + num2Text(pc.vaginaTotal() + 1) + " thick shafts pressing against your holes. The merest moment of this and your body practically seizes up with dread as the goo's huge tools press against your [pc.pussies] and ass, ready to tear you apart. All you can do is brace yourself, try to relax your fearful muscles in the face of the massive penetration about to happen.");
	output("\n\nCelise hesitates for a moment, just long enough to give you a sultry wink and a hungry moan of anticipation before her big hips push forward. You bit your lip, fingers digging into the gooey bed around you as your [pc.pussies] and [pc.asshole] desperately try to accommodate the unrelenting force being ramming into them. You give a shrill cry of pleasure as the first of Celise's massive goo-cocks plunges into your [pc.cunt], finally stretching your pussy-lips agape and ramming through. All at once, the momentum of the first cock carries the others through, battering through your spasming muscles. You scream, the pleasure absolutely overwhelming as ");
	if(pc.totalVaginas() == 1) output("both");
	else output("each of");
	output(" your holes are suddenly filled with thick, hot goo.");
	//STRETCH ALL PUSSIES AND BUTTHOLES GOOOOOOOOOO
	for(var x:int = 0; x < pc.vaginaTotal(); x++) {
		cuntChange(x,pc.vaginalCapacity(x));
	}
	buttChange(pc.analCapacity(),true,true,false);
	output("\n\nYour orgasm is almost instantaneous; your body is completely overwhelmed by the moment, your holes forced agape by the " + num2Text(pc.vaginaTotal() + 1) + " dripping hot rods Celise is fucking into you. Your [pc.pussies] and ass quiver in response, spasming and squeezing around the cocks forced inside them, your [pc.pussies] spasming and squirting, dousing the viscous goo-cocks with your fem-cum. Celise gives a quiet moan of satisfaction as she drinks it up, absorbing every drop of your orgasmic fluids");
	if(pc.cockTotal() > 0) output(", grabbing your [pc.cocks] and jerking them off until they, too, erupt in a salty stream right onto her face. She needn't eat it, but simply absorbs the [pc.cumColor] smear on her cheeks right up, her face's normally bright green hue shifting a touch [pc.cumColor]");
	output(".");
	output("\n\nBut that's nowhere near enough to sate the goo's lust. Celise just grins and coos happily, her fingers pinching around your [pc.nipples] as her hips push her cocks deeper and deeper. There's no denying the bulge in your gut now, and your entire body feels like it's being pulled apart by the tremendous amount of Celise's body being forced into you, filling your [pc.pussies] up to the womb");
	if(pc.vaginaTotal() > 1) output("s");
	output(" and pouring into your bowels, slickening every inch of your myriad inner walls with her liquid essence.");
	output("\n\nStill recovering from your massive gut-wrenching orgasm, you can do nothing but float listlessly atop Celise's gooey body as the galotian girl starts to thrust: her hips are utterly still, but you can feel the alien quasi-cocks inside of you flooding back from your depths... only to come ramming back a moment later, nearly making you cum again on the spot. The second thrust finishes the job, but the third has you screaming, head thrown back as your quiver and cum, body writhing helplessly in a sea of goo as Celise reams your every hole again and again.");
	
	output("\n\nCelise keeps you cumming again and again, endlessly crashing over the edge of bliss as her gooey dicks pound your [pc.asshole] and [pc.pussies]. She seems to swell and liven with every orgasm she fucks out of you, feeding on your sexual juices like a vampire. She uses you for what seems like eternity, pounding your holes until all you can think of is your massive, gaping fuck-holes filled with her alien goo. Your cries die out to pitiful, pleasured whimpers, your sex-addled mind unable to produce anything more throughout the ages of gooey intercourse until finally you feel the tendrils of slime withdrawing from you, leaving your entire body feeling loose and sore and empty.");
	output("\n\n<i>\"Sooo tasty,\"</i>  Celise purrs, licking her lips as the last tendril pops out of your [pc.asshole] with a wet squelch. <i>\"Thanks, cap! That'll last me a loooong time.\"</i>");
	output("\n\nYou just groan weakly and roll off of her amorphous body, flopping onto the floor. Barely cognizant enough to pick up your gear");
	if(!pc.isNude()) output(" and clothes");
	output(" after the mighty railing you just got, your feel your [pc.legs] bowing, barely able to stand with how stretched you are. You waddle off, sexually and physically exhausted and feeling more loose than you could ever have imagined.");
	
	processTime(35 + rand(10));
	pc.orgasm();
	this.userInterface.clearMenu();
	this.userInterface.addButton(0,"Next",mainGameMenu);
}

//RoombaGoo
/*Savin Author!
{Small chance to play after the PC masturbates w/ a cock OR fuck Kiro}

{First Time}
As you're lounging in your cabin, still recovering from your sexual bliss, you notice a strange... slurping sound coming from your door. You look down from the uberkitty video on your Codex's screen to see a green goop pouring in through your lock. In a moment of panic, you scramble back to the corner of your bed, grabbing your [weapon] as the goo plops onto the floor... and congeals into a vaguely Celise-shaped blob. Apparently oblivious to your presence, the perky little goo-girl rolls around on your cum-splattered floor, happily absorbing the spunk smeared across the deck. You watch with awkward quiet as the galotian mops up after you, humming merrily to herself as she gobbles up your seed, turning a paler shade of green and leaving your floor spotless.

Huh. You always wondered how the ship stayed so damn clean.

{Repeat Variant}
As you're lounging in your cabin, still recovering from your sexual bliss, you notice a strange... slurping sound coming from your door. You look down from the uberkitty video on your Codex's screen to see a green goop pouring in through your lock and congeals into a vaguely Celise-shaped blob. Apparently oblivious to your presence, the perky little goo-girl rolls around on your cum-splattered floor, happily absorbing the spunk smeared across the deck. You watch with amused quiet as the galotian mops up after you, humming merrily to herself as she gobbles up your seed, turning a paler shade of green and leaving your floor spotless.

Good on her, keeping the ship nice and sparkly.*/