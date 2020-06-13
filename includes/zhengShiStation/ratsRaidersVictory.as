/*
 *	Check ratsRaiders.as
 */

// [TripleService]

public function ratsTheReasonWeAreHere(useCock:Boolean):void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(5);
	
	var lastRat:RatsRaider = flags["RAT_LAST_DOWN"];

	output("Your gaze beats down on the defeated rats like a harsh ray of sunlight. A certain thought crosses your mind as you inspect their glossy mouths: one pair of lips slightly parted, another being caressed by a sweat-slicked tongue... and the third swaddled in a haze-like glow of irradiating warmth, begging to be pressed against an equally supple crotch.");
	output("\n\nTheir audible breaths have become careful, albeit slightly tense and heavy, and you find the rhythm of your heartbeat matching that of their adrenaline-filled lungs the more you focus on their soft... luscious... lips.");

	if (flags["RATS_TRIPLE_SERVICED"] == undefined) output("\n\n<i>What would it feel like... to have three cute little mice all over " + (useCock ? "[pc.eachCock]" : "[pc.eachVagina]") + "?</i>");
	else output("\n\n<i>Blood has never shunted faster as you think about putting those warm, greedy mouths to use again...</i>"); 

	// PC taur
	if (pc.isTaur())
	{
		output("\n\nHands drawing " + (pc.hasBreasts() ? "over your [pc.breasts]" : "up and down your [pc.chest]") + ", you, feel your");
		if (useCock) output(" [pc.cockBiggest] stretching, swelling, and growing beneath your hindquarters, leveled perfectly with the prostrate thieves and demanding their affections.");
		else output(" drizzling [pc.pussy] coating your back legs in mare-musk.");
	}
	// PC not taur
	else
	{
		if(pc.isNude()) 
		{
			if (useCock) output("\n\nYour [pc.cocksLight] spring to attention, oozing " + (pc.hasCocks() ? "urethras" : "urethra") + " aimed directly at the feisty rodenian beneath you.");
			else
			{
				output("\n\nYour [pc.vaginas] " + (pc.hasVaginas() ? "slather and drool" : "slathers and drools") + " at being seen, moistening " + (pc.hasVaginas() ? "themselves" : "itself") + " for what’s coming. You");
				if (pc.balls > 0) output(" heft your [pc.balls] and");
				output(" pry apart the");
				if (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) output(" puffy");
				output(" lips to display your [pc.vaginaColor] tunnel, giggling at the mouse boy’s instant enchantment.");
			}
		}
		else 
		{
			output("\n\nYou slip your [pc.crotchCovers] aside with profane speed,");
			if (useCock) output(" letting your [pc.cocksLight] flop out into raw tumescence, [pc.cockHeads] aimed directly at the " + (lastRat.HP() <= 0 ? "beaten" : "horny") + " pirates.");
			else output(" revealing your [pc.vaginas], drooling ever more at the thought of getting attention. You force the" + (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE) ? " puffy" : "") + " lips apart with two fingers, presenting your [pc.vaginaColor] interior to the drooling pirates.");
		}
	}

	output("\n\nLewd images crash upon your heat-addled mind like a tsunami of raw lust. The hormonal weight on your brain, the thick lump in your throat, and the quickened rate of your heart narrate to the outlaws an erotic short story. " + (useCock ? "The musky " + (pc.hasCocks() ? "threads" : "thread") + " of pre dribbling from your [pc.cockHeads] " + (pc.hasCocks() ? "draw" : "draws") + " out ‘fin’ on the last page." : "The " + (pc.hasVaginas() ? "cords" : "cord") + " of aromatic slime drooling from [pc.eachVagina] " + (pc.hasVaginas() ? "draw" : "draws") + " out ‘fin’ on the last page.") + " Judging by the cover, they know how this story ends without the need to open the book. But you’re going to make them anyway.");

	if (pc.isBimbo()) output("\n\n<i>“Now, helmets off, get undressed and come here! If you want some treasure, I’ve got it riiiiight here!”</i> you beckon," + (useCock ? " helicoptering your [pc.cocksLight]." : (pc.balls > 0 ? " moving your [pc.sack] aside and" : "") + " fingering your [pc.pussies] idly."));
	else if (pc.isBro()) output("\n\n<i>“Get those helmets off and come get a real treasure,”</i> you grunt, running your hands over your " + (useCock ? (pc.balls > 0 ? "[pc.balls]." : "[pc.cocksLight].") : "[pc.pussies]" + (pc.balls > 0 ? " after lifting your [pc.sack]." : ".")));
	else if (pc.isNice()) output("\n\n<i>“You three love getting rewarded, right?”</i> you ask, running a few fingers delicately over your " + (useCock ? (pc.balls > 0 ? "[pc.balls]." : "[pc.cocksLight].") : "[pc.pussies]" + (pc.balls > 0 ? ", moving your [pc.sack] out of the way." : ".")) + " A fierce blush spreads across your face. <i>“If you take those helmets off and do something for me, you’ll get more than you could ever ask for!”</i>");
	else if (pc.isMisch()) output("\n\n<i>“I’ve got a treat for you three </i>right here<i>,”</i> you say, patting your " + (pc.balls > 0 ? "[pc.balls]" : (useCock ? "[pc.cocksLight]" : "[pc.pussies]")) + " with a sexy moan, <i>“get those helmets off and come and get a taste, I’ll pay well!”</i>");
	else output("\n\n<i>“If you three want something to brag about, then get undressed and come get a filling reward right from the source,”</i> you grin," + (useCock ? " your [pc.sack] hanging low like tempting fruit." : (pc.balls > 0 ? " lifting your [pc.sack] and" : "") + " pointing to your [pc.pussies]."));

	if (flags["RATS_TRIPLE_SERVICED"] == undefined)
	{
		output("\n\n<i>“Wha...”</i> the rodenian girl scoffs; <i>“Alright...”</i> they grumble in acknowledgement.");
		output("\n\nThey");
	}
	else
	{
		switch (ratputation())
		{
			default:
			case RatsRaider.RAT_REP_NONE:
			case RatsRaider.RAT_REP_LOW:
				output("\n\n<i>“We understand what you’re asking, don’t you dare do anything else!”</i> the lead rodenian scowls at you.\n\nThey slowly");
				break;
			case RatsRaider.RAT_REP_MID:
				output("\n\n<i>“Fine, whatever you say, but don’t think you’re going to get away with this!”</i> the [rat0.furColor] rat girl scoffs.\n\nThey begrudgingly");
				break;
			case RatsRaider.RAT_REP_HIGH:
				output("\n\n<i>“Okay, you won I guess, but don’t get used to that, or this!”</i> the [rat0.furColor]-furred rodenian mumbles.\n\nThey eagerly");
				break;
			case RatsRaider.RAT_REP_GOOD_CEO:
				output("\n\n<i>“Sure!”</i> comes their abrupt response, betraying their past behavior. <i>“We’ll work harder than anyone else!”</i>\n\nThey eagerly");
				break;
		}
	}
	output(" pull off the fastenings of their matte-black armor, letting it fall to the ground. The thin layer of a grimy dark undersuit they wear for comfort, tattered and coming apart at the seams, is exposed. Any amount of rough fucking would definitely tear those suits apart even further. The" + rat2.mf(" rat", " two rat") + " girl’s breasts, despite being ample and well-rounded C-cups, are so barely contained that even the slightest movement looks like it’ll leave " + rat2.mf("her", "them") + " very exposed.");
	
	output("\n\nThey each let out a deep sigh, glad to have the weight of their gear off their shoulders for a bit... and in that motion, hard nipples do rip through clothes, followed by " + rat2.mf("a pair", "pairs of") + " squeezable tits. The snapping of cheap fabric precludes embarrassed moans and squeals. It’s " + (flags["RATS_TRIPLE_SERVICED"] == undefined ? "certainly" : "always") + " entertaining that your presents unwrap themselves!");

	if (pc.hasPheromones()) output("\n\nUnfortunately (fortunately?) for them, their ensuing gasps inhale the heady, arousing aura that permeates your immediate vicinity.");
	
	// PC taur, cock
	if (pc.isTaur())
	{
		if (useCock)
		{
			output("\n\nYou [pc.walk] over the rats, folding your arms and presenting them with your swelling " + (pc.hasCocks() ? "cocks." : "cock."));
			if (pc.isBimbo()) output(" <i>“You oughta know what to do when you see it,”</i> you giggle.");
			else if (pc.isBro()) output(" <i>“You’ll have no trouble taking this on together. Unity is strength, as they say,”</i> you grin."); 
			else if (pc.isNice()) output(" <i>“Please do your best.”</i>");
			else if (pc.isMisch()) output(" <i>“I have a big job for you three. Nobody else around to handle it, either,”</i> you laugh.");
			else output(" You scowl and plant your [pc.feet]. <i>“Make it up to me. Suck " + (pc.hasCocks() ? "them" : "it") + ".”</i>");
			
			output("\n\nIncredulously, the rats titter at your order. <i>“Bet you’re a big [pc.boyGirl] back there,”</i> the [rat0.furColor] rodenian grins. <i>“We’re not about to back down!”</i> Good for them? You sigh and aim your thumb that-a-way, your [pc.cocks] in dire need of attention so close to " + (pc.hasCocks() ? "their" : "its") + " full girth. They brush your [pc.skinFurScalesNoun] with their tails as they crawl in, peppering your sensitive underbelly with pilfering caresses.");
			output("\n\nFeet stamp when a lusty shudder courses through your body. You spread your [pc.legs] into a position of horniness and expectation. The quietly yammering trio sit around your [pc.cocksLight], already groping and exploring your nearly rock solid lengths. Gumballs of pre are smeared across your [pc.cockType " + pc.biggestCockIndex() + "] length, the first time, and the second they’re slurped up. The only indication of their pace, their presence even, is how quickly their tails thresh in peripheral vision.");

			if (pc.longestCockLength() < 13) output("\n\n<i>“Hah, that’s a little small for a horse, don’t you think?”</i> comes a somewhat muffled voice. A denigrating finger beneath your [pc.cockHeadBiggest] rubs the distance between crown and base. It’s a halting sensation leaving you panting for more. <i>“Aww, look at that! I bet you could even fuck one of us with that!”</i> You’re not sure whether that was an insult or compliment...");
			else if (pc.longestCockLength() < 18) output("\n\n<i>“Eeeeeh...”</i> you hear the muffled marvelings of the little rats below you. <i>“What else should we have expected..?”</i> they murmur. Three fingers rub the underside of your [pc.cockHeadBiggest], <i>“Bet those damn rabbits would be jealous. That’s good enough for me!”</i>");
			if (pc.longestCockLength() < 24) output("\n\n<i>“Aaahh... Look at this stupidly huge dick!”</i> the rodenian grouses, but there’s a certain determination in her voice, muffled as it is down there. You feel six hands struggle to connect index finger to thumb around the sheer mass of [pc.cockType " + pc.biggestCockIndex() + "] meat you’re packing. <i>“Okay, let’s show this silly " + (ratsPCIsKnown() ? "CEO" : "[pc.boyGirl]") + " what we’re made of!”</i>");
			else output("\n\nThe gaggle of pirates under your ‘tauric half laugh like a family at the dinner table, rubbing and groping all over the absolutely ridiculous size of your [pc.cockBiggest]. <i>“How do you even carry this thing around?”</i> one yells out to you. You feel them struggling to even grip your mountainous girth with hands alone, having to jerk you with their entire bodies. <i>“All of this just for us? Bet you’re gonna regret that!”</i> a girlish voice rings.");

			output("\n\n<i>“Time to take you down a peg!”</i> they declare, and six dainty mits grab all around your [pc.cockHeadBiggest]. You grunt and just about cum on the spot; twenty-four fingers pave their own individual routes up and down your [pc.cockBiggest], and three equally long tongues trail cock-drool in in their wake. <i>“At least [pc.heShe] tastes good...”</i>");

			output("\n\nYou clench your fists and grit your teeth, shuffling about uncomfortably. It doesn’t end there: you soon feel three satiny lips press against the underside of your outmatched boner, blazing down the delineation of your rubbery urethra. <i>“Haha, look how hard [pc.heShe]’s bouncing, already so close to cumming!”</i> Their voices, further muffled by aerosolizing libido, are a <i>wonderful</i> vibration against your girth too.");

			output("\n\nScuffles reach your ears - repositioning. Two coarse coils slither around the " + (pc.hasCocks() ? "[pc.knot]s of your phalli" : "[pc.knot] of your phallus") + ", rings of pressuring rat tail swelling and rippling to the beat of your heart.");
			if (pc.cocks.length > 2) output(" To better control your tensing " + (pc.cocks.length > 3 ? "dicks" : "dick") + ", the second tail unwinds and wraps around " + (pc.cocks.length == 3 ? "the other" : "each") + " dick in your brace, pinning them together so that [pc.eachCockHead] rubbing against one another in an extremely pleasurable way.");
			output(" Those skilled hands get back to work, pampering your " + (pc.hasCocks() ? "poles" : "pole") + " with expert precision, one particularly eager mouth making it a personal duty to suck up every fat dollop of musky pre spurting from the " + (pc.hasCocks() ? "tips" : "tip") + ". After all this, they repeat their activity up to this point now that your " + (pc.hasCocks() ? "manhoods" : "manhood") + " are glistening with sexual effluence.");
		}
		// PC taur, vagina
		else
		{
			output("\n\nYou fold your arms");
			if (pc.hasBreasts()) output(" under your [pc.breasts]");
			output(" and order the rats to your backside.");
			if (pc.isBimbo()) output(" <i>“I need you to eat me out, badly! My pussy needs all the attention three little rats can provide!”</i>");
			else if (pc.isBro()) output(" <i>“Get to it, that pussy needs your attention.”</i>"); 
			else if (pc.isNice()) output(" <i>“Eat me out, please, all at once.”</i>");
			else if (pc.isMisch()) output(" <i>“While you’re eating me out, make sure to get your tongues in deep.”</i>");
			else output(" <i>“Get back there.”</i>"); 
			
			output("\n\nPreeminently smarmy, the mouse-bandits quickly stand and walk to your hindquarters, brushing your [pc.chest] cutely with their ribboned tails as they go. Your [pc.pussies] " + (pc.hasVaginas() ? "were" : "was") + " drooling minutes ago, but consigning " + (pc.hasVaginas() ? "them" : "it") + " to a band of cocksure thieves has your heart racing like never before. The " + (pc.hasVaginas() ? "exteriors" : "exterior") + " of your " + (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE) ? "chubby " : "") + (pc.hasVaginas() ? "twats" : "twat") + " shines with flecks of [pc.girlCumNoun] dotting " + (pc.hasVaginas() ? "their" : "its") + " lips, to say nothing of the sweet scent of girl-musk entering the air.");

			output("\n\nYour [pc.lipsChaste] spread into an ‘O’ of pleasure when one paw, two hands, then three");
			if (pc.hasLowerGarment()) output(" slip past your [pc.lowerUndergarment] and");
			output(" unanimously touch and explore your [pc.pussyNoun], smearing copious amounts of juice over [pc.oneClit]. Your [pc.vaginaColor] " + (pc.hasVaginas() ? "tunnels are" : "tunnel is") + (pc.wettestVaginalWetness() < 4 ? " so wonderfully moist" : " so beautifully drenched") + " that nobody could turn away from " + (pc.hasVaginas() ? "their pulsing deltas." : "its pulsing delta."));
			output("\n\n<i>“Oohh, that’s a big, fat pussy, " + ratsMisterCEO() + "!”</i> the sharp-voiced rodenian remarks, the other two near her, blissed out by the potent scent billowing from your juice-oozing " + (pc.hasVaginas() ? "cunts" : "cunt") + ", lamely add their voices to the slit-hypnotized choir. The cast are already drunk on your mare-signature. <i>“Bet I could...”</i> you faintly hear, and something not unlike a suitable penetration rocks your every sense. <i>“...Fit my entire hand in there!”</i> And it’s not just her. The outlaw’s friends slide their hands in next to her fist, leaning closer to lap at your glazing folds, using their free hands to thumb and tug your [pc.clits].");
			output("\n\nOn wobbling [pc.legOrLegs], your [pc.pussy] constricts, slathers, and squeezes the criminals breaking into your ambrosial slit. Unable to expel the invaders, your vaginal lips part wider to accept the many implements of vaginal appreciation knocking at its door. Drenched fingertips finally pull out, and those skilled hands trail up and down your [pc.ass], even teasing at your winking [pc.asshole]. <i>“Ooohhhh, bet you can’t stand much longer, " + ratsMisterCEO() + "! Why not just give up now? We’ll let you off with just <i>one</i> orgasm!”</i>");
		}
	}
	// PC not taur, cock
	else
	{
		if (useCock)
		{
			output("\n\nStepping forward, you let your bobbing boner settle above the [rat0.furColor]-furred rodenian girl’s head whose ears pivot and flex out of confinement. She looks up to your [pc.cockBiggest] hesitantly, trying to shift you away from her chubby ears. <i>“Well?”</i> you ask, watching a languid wad of pre drop onto her twitching snout with a grin. The salty treat trickles down to her lip where it’s licked up nonchalantly.");

			if (pc.longestCockLength() < 7) output("\n\n<i>“I guess that’s alright. So many big <b>dicks</b> around here as is...”</i> she grumbles, regarding your ample [pc.cocksLight] with some relief. <i>“Better than having to deal with one of those freaky cats or horny rabbits...”</i>");
			else if (pc.longestCockLength() < 13) output("\n\n<i>“Geez, you’re a big [pc.boyGirl]...”</i> the thieving pirate mumbles, unable to avert her gaze from your [pc.cocksLight]. She simpers, licking her lips, <i>“You better have plenty to give us with a size like that!”</i>");
			else if (pc.longestCockLength() < 18) output("\n\n<i>“You’re bigger than those damn rabbits...”</i> They marvel at the size of your erect [pc.cocksLight], then flash you toothy grins. <i>“Guess this is just another challenge to overcome!”</i>");
			else output("\n\n<i>“W-what’s with this monstrous dick? You some throbb addict?!”</i> The rats express a mixture of fear and awe, but finally settle on a decidedly determined tone, <i>“We’re not gonna lose to such a big dumb cock!”</i>");

			output("\n\nSwallowing, she leans up and licks at your [pc.cockHeadBiggest], and she does it well - her [rat0.lipColor], cushiony lips, hugging her extended tongue, press against the underside of your cock as she trails the tip abreadth the delineation of your urethra, soft moans vibrating your girth exquisitely. She pulls back to more closely inspect your hotly pulsing " + (pc.hasCocks() ? "masculinity" : "masculinities") + ", humming a low sibilance of pleasure before getting back to it.");
			if (pc.longestCockLength() < 13) output(" Your " + (pc.longestCockLength() < 6 ? "small" : "ample") + " size is to her liking, and she lets you know by rocking her mouth back and forth in the places that make you moan the loudest.");
			else output(" Your " + (pc.longestCockLength() < 18 ? "huge" : "mammoth") + " dick is having an obvious effect on her. She squints and adoringly caresses the underside with her paws, smearing you and her with flowing dick-goo.");
			if (pc.hasCocks()) output(" Your second [pc.cockType " + pc.biggestCockIndex2() + "] cock throbs distractingly against the brim of her round ear, its twitchiness teasing out enough precum to lather her messy [rat0.hairColor] hair.");

			output("\n\nThe mouse-pirate writhes underneath your [pc.cockNounBiggest], slurping at its glistening shape. Phallic adoration oozes out of her pores like the next wad of salty pre from your [pc.cockHeadBiggest].");
			if (ratsPCIsGood()) output(" <i>“It tastes really good... I could just lick it forever...”</i>");
			else output(" <i>“I guess it tastes fine... Better than some others...”</i>");
			output(" she murmurs, her thick tongue squelching noisily against your thickening rod.");
			output("\n\nThe flanking rodents inch closer, planting their dainty mits on your [pc.thighs], completely mesmerized by cock. Beatific eyes gaze enviously at their sexy leader’s sensuous tongue-job, letting your dominant aroma run its course through them.");

			output("\n\nWhen her short-muzzled face flows to the heath of your groin where " + pc.sheathOrKnot() + " meets crotch, her jaw slackens to");
			if (pc.balls > 0) 
			{	output(" envelope and suckle on your [pc.balls]. She licks and nibbles on each, dense nut in your");
				if (pc.hasFur()) output(" fuzzy");
				else if (pc.hasScales()) output(" scaly");
				else output(" seed-filled");
				output(" sack before smooching the diameters of its sensitive contents.");
			}
			else if (pc.hasVagina()) output(" service your [pc.pussy], rubbing her moist mouth against your drizzling slit until " + (pc.wettestVaginalWetness() < 4 ? "strands of femslime" : "torrents of girljuice") + " are coating her chin in a fine sheen of you");
			else output(" suck on your [pc.base], swishing her tongue where cock meets groin.");

			output("\n\nHer friends, dominated by your musk, join in, the half-rat [rat2.boyGirl] nuzzling against " + (pc.hasCocks() ? "your extra [pc.cockNoun " + pc.biggestCockIndex2() + "], mimicking the [rat0.furColor]-furred slut’s tongue action on your lonelier member" : "the [rat0.furColor]-furred slut to lick up and down your [pc.cockBiggest]") + " while [rat2.hisHer] obedient fuzzy hand");
			if (pc.balls > 0) output(" tenderly grips and gently fondles your [pc.balls].");
			else if (pc.hasVagina()) output(" rubs against [pc.oneClit].");
			else output(" jerks the [pc.base].");
			output(" The mouse-boy to your right " + (pc.cocks.length > 2 ? "takes your third [pc.cockType " + pc.biggestCockIndex3() + "] boner in hand, pressing his smooth lips to the [pc.cockHead " + pc.biggestCockIndex3() + "], tonguing it lovingly." : "presses his sweaty nose to your spit-dripping mast.")); 
			if (pc.cocks.length > 3) output(" Your extra " + (pc.cocks.length == 4 ? "dong flops" : "dongs flop") + " ineffective over their heads, drooling bounties of pre atop their heads.");
		}
		// PC not taur, vagina
		else
		{
			output("\n\nYou " + (pc.hasLegs() ? "spread your [pc.thighs]" : "stick your crotch out") + " to better expose [pc.eachVagina], capturing the rats’ distracted gazes with bare, glistening twat before sinking a [pc.hand] into its [pc.girlCumNoun]-glazed nethers. Fingers pry lewdly into " + (pc.hasVaginas() ? "a" : "your") + " supple slit, caressing [pc.oneClit] for good measure. After a few seconds of finger-pumping, it comes away with " + (pc.wettestVaginalWetness() < 4 ? "strands of translucent girljuice clinging to" : "gushing waves of femslime oozing from") + " its digits.");
			output("\n\nYou present your aromatic " + (pc.hasArmFlag(GLOBAL.FLAG_PAWS) ? "paw" :" hand") + " to the mischievous trio, wheeling your fingers enticingly under the light in an enchanting display. Their arousal <i>ignites</i> as [pc.girlCumColor] beads drip from your nails in heart-gripping delight, sparkling on their fall into wastedness. No better way to tease a bunch of materialistic rodents!");
			
			output("\n\nThe near-hyperventilating mouse-boy to your right is first to pounce, anxiously pushing forward to suck on your tasty [pc.skinFurScalesNoun]. His servile tongue wraps around every inch of two fingers, slurping tasty girl juice and polishing the savory surface with respect to your comfort and position above him -- he’s even massaging you!");
			output("\n\n");
			if (pc.isBimbo()) output("<i>“Mmm-hm, betcha can’t wait to get more of that, huh?”</i>");
			else if (pc.isBro()) output("<i>“Knew you’d like that...”</i>");
			else if (pc.isNice()) output("<i>“Good boy,”</i>");
			else if (pc.isMisch()) output("<i>“Love the eagerness,”</i>");
			else output("<i>“Not bad...”</i>");
			output(" you " + (pc.isBimbo() ? "sing" : "murmur") + ", swabbing his mouth with your [pc.girlCumFlavor] girljizz. The freckled outlaw lets you do that and more, simply happy to be worth a taste of your freshest lust.");
			
			output("\n\nNot to be left out, the other two thrust their faces into your groin with lusty yelps, " + (pc.vaginas.length < 3 ? "fighting for more space on your [pc.pussies]. Their dueling tongues only add to the aggressive pleasure." : "each pressing their noses to your wet cunts and capping clits, drawing their rough tongues against the honeyed openings of your labial folds."));
			if (pc.balls > 0)
			{
				if (pc.hasFur()) output(" Your furry");
				else if (pc.hasScales()) output(" Your scaly");
				else output(" Your taut");
				output(" nutsack sits atop their heads like an unpolished crown. Though they’re focused on your [pc.vaginaNoun], they don’t forget to lick at your masculine pouch too.");
			}

			output("\n\nFrisky hands rake the " + (pc.hasVaginas() ? "exteriors of your muffs" : "exterior of your muff") + ", and you feel your [pc.clits] being teased, pinched, and tugged so hard you think they’re trying to steal <i>" + (pc.totalClits() == 1 ? "that" : "them") + "</i> too!");
			if (pc.clitLength > 4) output(" And dammit, they must be. Your obscene growth of clitoral flesh is wide and long enough for hands that small to get around. It almost makes you seize and collapse when you feel a brave mouth <i>suck</i> on " + (pc.totalClits() == 1 ? "one of those bulged-out fuck-poles!" : "your bulged-out fuck-pole!"));

			output("\n\nYou tousle and grip locks of mouse-hair as you grind your quim against the rodenian’s face, easing her thick tongue into your pussy proper with a jerk and clench. She, too, submits to your domination, letting you fuck her muzzle gently. ");
			output("\n\nThe halfbreed [rat2.boyGirl] mewls in your grip, [rat2.hisHer] ears quivering. The mouse-boy, too, has pressed his blushing face to your groin, worshiping your body and especially your pussy, devoting himself to your pleasure with tender caresses and energetic suckles. You barely stifle a happy squeal when you look down seeing three hungry heads of unkempt hair clumped together, all focused on eating you out and slaking their thirst on girly juice.");
		}
	}
	
	addButton(0, "Next", (pc.isTaur() 	? (useCock ? ratsHandlingTaurcock 	: ratsEatingTaurTuna)
										: (useCock ? ratsKneelingForService	: ratsThreeMiceEatOutTwoLegs)));
}

public function ratsCumComments():void
{
	switch (pc.cumType)
	{
		// Regular Cum and anything else not specifically listed
		default:
			output("\n\n<i>“Nice taste, " + (ratsPCIsKnown() ? "[pc.mister] CEO!" : "stranger") + "”</i> the rats blurt, licking their fingers and your limp [pc.cocksLight], clearly savoring the taste of your [pc.cumVisc] seed. Though you’re not <i>entirely</i> sure if they love the taste or think they’re winning by getting more of it...");
			break;
		case GLOBAL.FLUID_TYPE_MILK:
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
			output("\n\n<i>“Didn’t know people could cum milk of all things, love this taste...”</i> the rats all stare pointedly, licking up the smooth streaks of [pc.cumColor] painting their heads and your limp [pc.cocksLight].");
			if (pc.cumType == GLOBAL.FLUID_TYPE_STRAWBERRY_MILK) output(" <i>“I really love the taste of strawberries!”</i> the mouse-boy swoons, the others voicing similar satisfactions.");
			else if (pc.cumType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output(" <i>“It’s so rich and yummy... Oohhh I wish I could have more...”</i> the half-rat [rat2.boyGirl] squeals in delight, the others voicing similar satisfactions.");
			break;
		case GLOBAL.FLUID_TYPE_VANILLA:
			output("\n\n<i>“Oohhhh... this taste is so gooood! So sweet and delicious!”</i> the rats squeal in happiness, almost fighting for the [pc.cumColor], [pc.cumVisc] trickles of [pc.cumNoun] on your spent [pc.cocksLight]. They even start licking it off each other! The gratified trio chatter and murmur happily as they drink up every savory drop, leaving you polished and their bellies full.");
			break;
		case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
			output("\n\n<i>“So thick, you’ve got awesome cum! I didn’t know you could get a mod like this!”</i> the mice slather you with praises. Your [pc.cumVisc], [pc.cumColor] seed drips off their faces - and your [pc.cockHeadNoun " + pc.biggestCockIndex() + "] - in thick, globule-like treacles. <i>“It’s so sweet and tasty! I hope there’ll be more!”</i> they say in unison, licking each other clean.");
			break;
		case GLOBAL.FLUID_TYPE_FRUIT_CUM:
			output("\n\n<i>“What is this... Your cum tastes like fruits! Berries! This is... so good!”</i> the excited trio lick up your [pc.cumVisc] [pc.cumNoun] with zealous desire. <i>“Haven’t had anything that tasted like this in so long... thank you...”</i> one murmurs, the others expressing similar thoughts.");
			break;
		case GLOBAL.FLUID_TYPE_VANAE_CUM:
			output("\n\n<i>“Umf...”</i> they moan, cheeks flushing as they lick up your [pc.cumColor] seed. Your [pc.cum] is having a lust-fattening effect on them. <i>“It’s getting me turned on just feeling it on my tongue, but this taste is <i>amazing</i>!”</i> the half-rodenian [rat2.boyGirl] moans, and the others are clearly in agreement. They lick everything off you and each other.");
			break;
		case GLOBAL.FLUID_TYPE_HONEY:
			output("\n\n<i>“So <i>sweet</i>!”</i> the rodenian girl cups her furry cheek, cooing with every tongue full of [pc.cumVisc], [pc.cumColor] [pc.cumNoun] that trickles into her gut. <i>“Your taste is sooo good, " + ratsMisterCEO() + "! This honey is better than any I’ve had, it’s just too delicious!”</i> The other two nod furiously, stars in every eye, cleaning themselves and you of your seed.");
			break;
		case GLOBAL.FLUID_TYPE_SUGAR:
			output("\n\nCheeks hollow at every taste of your [pc.cum]. The preening trio lick their lips once, twice, and several times more, trying to cope with the sheer <i><i>“Sweetness!”</i></i> they shout, <i>“your cum is so sweet!”</i> they say again, licking your soft [pc.cocksLight] to a mirror shine. <i>“Wherever did you get this taste? You better come around again, we need more of this!”</i>");
			break;
		case GLOBAL.FLUID_TYPE_PEPPERMINT:
			output("\n\nVery clear, deep breaths preclude the protrusion of greedy lips, your crisp-scented seed as pleasing to their noses as it is their palate. <i>“G-geez, this makes me feel like I’m not even on Zheng Shi...”</i> the rodenian licks her lips. <i>“Very... clean? It’s a little weird, but it tastes great. Refreshing!”</i> She and her friends nuzzle you for more.");
			break;
	}
}

public function ratsGirlCumComments():void
{
	switch (pc.girlCumType)
	{
		// PC girl cum and anything else not listed
		default:
			output("\n\n<i>“Mmmm...”</i> the mouse laps at her lips, <i>“tangy... bitter... slightly salty. Maybe my taste buds are jus’ shot at the moment, but you taste good, " + ratsMisterCEO() + ". What do you think?”</i> she turns to her friends. They love it.");
			break;
		// Honey girl cum
		case GLOBAL.FLUID_TYPE_HONEY:
			output("\n\n<i>“Sooo sweeet! So nice! I love it! Just love it!”</i> the rodenian squeals, her partners in crime expressing similar feelings. <i>“Would that we could make you cum all the time, " + ratsMisterCEO() + ", but we’ll work for it again and again! Just you wait!”</i>");
			break;
		// Fruit Girl Cum
		case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
			output("\n\n<i>“Mmh!”</i> the mouse eagerly licks at her lips. <i>“So good! So tasty, it tastes just like fruit! Where did you get a mod like that?");
			if (ratsPCIsKnown()) output(" Oh wait, do I even need to ask a CEO that question?");
			output("”</i> The other two express similar feelings, wriggling back and forth from the appreciable taste. <i>“We’re gonna make you cum harder next time, just you wait!”</i>");
			break;
		// Sugar Girl Cum
		case GLOBAL.FLUID_TYPE_SUGAR:
			output("\n\n<i>“Oh! That’s... that’s really sweeeeet!”</i> the rodenian smacks her lips, licking frenziedly at her mouth. <i>“Wherever did you get a taste like this? You must want everyone to eat you out if it’s that good!”</i> The other two mice are far too preoccupied with your flavor to comment, but they don’t need to. They love it.");
			break;
	}
}

public function ratsKneelingForService():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(25);
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";
	
	output("<i>“You’re going to have to work a lot harder than that,”</i> you smirk, folding your arms" + (pc.hasBreasts() ? " under your [pc.breasts]." : ".")); 
	output("\n\nThe rodenian girl squeaks affirmatively, leaning back to kiss the head of your [pc.cockBiggest], stretching her lips over its shape. The suction on your cum-vein is eye-crossingly sublime. Your motions flag as you throb mightily against her face, unable to resist thrusting into her pursing lips. Her sinfully warm cheeks hollow around your [pc.cockHeadNoun " + pc.biggestCockIndex() + "], and you feel her thirsty tongue lapping up the abundant dollops of musky pre.");
	if (pc.hasACockFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" You don’t hold back either, letting the tentacles lining your alien cock sting the petty crook’s mouth. You can <i>feel</i> her spit waterfall over your rod just before draining past her lips.");
	
	switch (pc.cocks.length)
	{
		case 1:
			output("\n\nThe other rats squeeze in on either side, peppering submissive, slave-like kisses up and down your [pc.cockNoun], keeping it polished and clean of pooling sweat. <i>“Too bad you don’t have two...”</i> the halfbreed [rat2.boyGirl] quips, smiling at you when your [pc.cockType] dick rubs against [rat2.hisHer] cheek. <i>“Make sure you cum lots, okay?”</i>");
			break;
		case 2:
			output("\n\nYour second [pc.cockNoun " + pc.biggestCockIndex2() + "] is already well entrenched in the half-rodenian [rat2.boyGirl]’s hot mouth; you tremble when you feel those velvety cheeks hollow out and squeeze your prodigious [pc.cockType " + pc.biggestCockIndex2() + "] prick adoringly. <i>“Mmm, you’re well equipped for one lover, aren’t ‘ya?”</i> the mouse-[rat2.boyGirl] simpers. <i>“Wonder how good this would feel if you had three?”</i>");
			output("\n\nYou’re wondering that yourself now...");
			break;
		case 3:
		default:
			output("\n\nAll of your [pc.cocks] are soon swallowed up by the thieving trio, and three obedient heads bob and suck on your dicks like it’s their favorite pastime. You’re certain that your thrumming erections are their new favorite lollipops! In their multi-colored eyes, all gazing upwards into your own, you see only a desire to please");
			if (ratputation() <= RatsRaider.RAT_REP_LOW) output(", though it’s tempered by a bit of stubbornness");
			output(".");
			if (pc.cocks.length > 3) output(" Their paws stay just as busy as their tongues and lips, jerking your extra, flopping pricks and coating themselves in your scintillating slime.");
			break;
	}

	output("\n\nThree long tails curl around your legs and your abdomen, gripping affectionately with every vigorous bob and blow from bloated " + (pc.hasCocks() ? "crowns" : "crown") + " to " + (pc.balls > 0 ? "swollen jewels" : "[pc.base]") + ". Pointed tips tease the softer parts of your body. The fervently fellating rats stare expectantly into your [pc.eyes], watching for any sign of pleasure or satisfaction to derive from their targeted, prehensile molestations.");
	output("\n\nThe soft fabric of the ribbons wrapped around their tails smoothly crests your [pc.chest] and slightly tickles when brushed against your vulnerable glutes. In the glory of it all, you feel one tail finally curl around the base of " + (pc.hasCocks() ? "an" : "your") + " adamantine erection - the tight squeezing feels <i>unspeakably good</i>");
	if (pc.hasAKnot()) output(", especially as your knot swells obstinately against the coil");
	output(".");
	output("\n\n" + (ratputation() <= RatsRaider.RAT_REP_LOW ? "<i>“Enjoy this for now, because you’ll be paying extra for thish nexsh time...”</i>" : "<i>“Haw doesh it feel?”</i>") + " the rodenian girl sputters between hollow suctions, drooling over your shaft while her head jerks briskly back and forth. <i>“You’ll cum shoon! Jush you wait! We’ll geth your treashure and then we’ll win!”</i> Is that so? The other two fight for your attention, nuzzling their flush cheeks against your [pc.thighs] " + (pc.cocks.length <= 2 ? "while they lick and suck you." : "while your [pc.cockHeads] bulge against their cheeks."));
	if (pc.hasVagina()) output(" Their fingers are busy just below, running up and down the folds of your [pc.pussy] and [pc.oneClit], keeping your feminine side company and using its [pc.girlCumFlavor] secretions to enhance the taste of your [pc.cocksLight].");
	output("\n\nYour hands fall to their heads, rubbing furiously against their messy locks of hair. Their large, quivering ears enjoy the most rhapsodizing of your motions. <i>“Good rats get headpats,”</i> you say tacitly, fuzzy warmth blossoming when their happy squeals echo through the room.");
	if (pc.balls > 0)
	{
		output("\n\nSeeing your");	
		if (pc.ballSize() < 8) output(" weighty");
		else if (pc.ballSize() < 16) output(" heavily sagging");
		else output(" tremendous");
		output(" nutsack wobble back and forth makes your jostling maleness a too-tempting target. Smooth and furry fingers noticeably combine their efforts to coax an even larger orgasm from you, caressing the underside of your swelling spunk-tanks. Those virile orbs are claimed as possessively as your [pc.cocksLight], each rodent taking turns smothering their faces into your ‘nads, breathing deep of your ball-musk while massaging them imploringly with tongue and cheek. Their efforts are certainly not in vain: the more they play with your scrotum, the fatter it feels with a heavier load of [pc.cumNoun].");
	}

	if (catPC && pc.hasTail()) output("\n\nYour [pc.tails] swirl around, the fuzzy " + (pc.hasTails() ? "tips" : "tip") + " caressing their scalps in appreciative circles. You can’t help but think how fitting a position this is: you, [pc.aRaceShort], catching three mice and getting them to service you. It’s enough to make you purr!");

	switch (pc.cocks.length)
	{
		case 1:
			output("\n\nThe [rat0.furColor] rat takes your [pc.cockBiggest] to the back of her mouth, " + (pc.biggestCockVolume() < 50 ? "mewling quietly as it massages her tonsil" : "not choking at all when she spears her neck with [pc.cockType " + pc.biggestCockIndex() + "] meat") + ". Incredibly, she slides it all the way into her throat without so much as a clench! Guess she has no gag reflex! You rock your hips experimentally, testing the moistened tunnel, and she doesn’t cough but once. However, the others whine impatiently that they cannot please you, so you pull back enough to expose a serviceable amount of cockflesh.");
			break;
		case 2:
			output("\n\nYou feel both of your [pc.cocks] eased deeper into the pirate’s gushing maws, soon bulging against the fronts of their necks -- the mouse-boy redoubles his efforts, licking and kissing your slotted members");
			if (pc.balls > 0) output(" and [pc.sack]");
			output(" with desperate aplomb. When your [pc.cockBiggest] slides into the rodenian girl’s throat, you are mighty impressed that she doesn’t cough or gag, like her throat was made to suck dick. Whatever the explanation, she has no gag reflex!");
			break;
		case 3:
		default:
			output("\n\nAn otherworldly sensation overwhelms your lust-addled mind as you feel all three of your [pc.cocks] slipping into three sensitive throats of varying acceptance. Your");
			if (!pc.hasSamecType()) output(" mismatched");
			output(" phalli are clamped down on by the rodent trio, and the pleasure-seizing signals of three dicks being pleased all at once bombard your mind. Convulsing in half-minded awareness is all you can do; one rat gags, one barely chokes, and the other - the rodenian girl - giggles with your most straining erection shoved balls-deep into her gullet. Holy shit... the rat mustn’t have a gag reflex!");
	}
	
	output("\n\nThe rat’s lips close tight enough to seal all the spit inside and add a delightful friction to your"); 
	if (pc.isBro() || pc.isBimbo() || pc.isNice()) output(" gentle");
	else if (pc.isMisch()) output(" eager");
	else output(" rough");
	output(" facefucking. Hot breath washes over your " + (pc.hasCocks() ? "members" : "member") + " from every direction; flaring nostrils tickle the veins atop your shafts. You can’t help but press out another blissful sigh, fingers curling around locks of their hair in complete ecstasy.");
	output("\n\nUndulating tongues cling tightly, lapping up the salty treat coating your [pc.cocksLight]. The [rat0.furColor] rat on your dick, determined to prove herself right and get your cum, takes your [pc.cockBiggest] so deep so fast that she begins to squirm in the throes of orgasm.");
	if (pc.balls > 0) output(" Before withdrawing, she uses the tip of her pinned tongue to lap at your bouncing nuts, the wobbling spheres gorging against your" + (pc.ballSize() >= 8 ? " weighty," : "") + " suckable sack delivering a taste of minutes-old pre in return.");
	output("\n\nIf you bust now, they’ll probably think this is over! You lunge <i>hard</i>, ramming your " + (pc.hasCocks() ? "cocks" : "cock") + " to the hilt to put pause to " + (pc.cocks.length == 1 ? "her" : "their") + " wild affections and control your lust. Mewling and moaning");
	if (pc.balls > 0 ) output(" against your [pc.balls]");
	output(", the " + (pc.hasCocks() ? "rats begin" : "rat girl begins") + " to whimper for you to stop. And you do -- when you pop free, " + (pc.hasCocks() ? "they shiver" : "she shivers") + " and gasp for air.");
	
	if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“We’re nowhere near done " + (pc.isBimbo() ? "cuties!" : "!") + " You’re doing fine, but you’ll need to do more!”</i>");
	else if (pc.isNice()) output("<i>“I need more than that,”</i> you smile convincingly, rubbing your [pc.cocksLight] against their faces to smear them with sexual effluence, <i>“now come here.”</i>");
	else if (pc.isMisch()) output("<i>“Good effort, but you three can do better than that!”</i> you say with a wince, playfully slapping them with your messy [pc.cocksLight].");
	else output("<i>“Good start, but you know someone like me needs more,”</i> you say levelly, slapping them with your [pc.cocksLight].");
	
	output("\n\nYou almost plunge to the ground just trying to sit. Sultry rodent tails swing and curve to follow you down, easing your descent. Their panting tells you they’re close, too, if the throbbing " + (pc.hasCocks() ? "erections" : "erection"));
	if (pc.hasVagina()) output(" and flooding pussy");
	output(" weren’t enough.");
	output("\n\nA moment of thought later, you snap your fingers and order them around into more suitable positions. The rodenian girl and the mouse-boy " + (pc.hasLegs() ? "lay on their fronts atop your [pc.legOrLegs]" : "remain kneeled in front of your [pc.legOrLegs]") + ", jerking and licking beneath the " + (pc.hasCocks() ? "shadows" : "shadow") + " of your virile " + (pc.hasCocks() ? "towers." : "tower.") + rat2.mf(" The [rat2.furColor]-furred halfbreed boy shuffles into position. Before he can take off his crotch wear, you tear apart the fabric to reveal his bulging length just as he slides underneath your left [pc.arm]. You tease his throbbing member as he returns to yours", " The [rat2.furColor]-limbed half-rat girl slides underneath your left [pc.arm], letting you yank her stained tights off - her yelps are fucking adorable. You waste no time shoving every finger into her honeyed snatch. Her pussy easily inhales you to the knuckle thanks to how much she loves sucking your dick."));
	
	output("\n\nPerfect! Now for something a little different. You declare a challenge whilst " + rat2.mf("jerking", "fingering") + " your little rat: <i>who will cum first?</i> It’s highly amusing to watch them act more frantically than before.");
	output("\n\n" + (flags["RATS_TRIPLE_SERVICED"] == undefined ? "<i>“You may haff beaten ush in a fight but you’ll not lasht long with ush!”</i>" : "<i>“You know how thish is gonna end, right?”</i>") + " the rodenian grins and glares with a mouthful of [pc.cockBiggestNoun]. Water streams down her eyes " + (pc.hasCocks() ? "and the others." : ".") + " Nothing left to do but enjoy it. A contented sigh drifts from your [pc.lipsChaste], observed by colorful and half-lidded eyes.");
	output("\n\nThree silky smooth mouths sweetly suckle at your [pc.cocks] from every angle, kissing, sucking, blowing, squeezing, tail squeezing all so rhythmically... You begin to drift off on a cloudy pillow, daring to close your eyes from the pleasure. You almost forgot, right away no less, that you made it a little game to them."); 
	output("\n\nBut damn... how can you care? Three lush, satiny, glossy lips, rubbing up and down, left and right, tonguing and kissing your magnificent member, the voices behind those eager mouths goading and boasting, each demanding, telling, <i>begging</i> you to cum. <i>“Hey!”</i> they all shout, bringing you back to reality. <i>“You can’t pass out yet" + (ratsPCIsKnown() ? ", [pc.mister] CEO!”</i>" : "!”</i>"));
	
	output("\n\nNo... you wouldn’t pass out. The audible tumult of their tempestuous oral performance keeps you well awake. Having your [pc.eyes] closed allows you to concentrate on their earnest attempts in a way otherwise impossible.");
	if (pc.balls > 0) output(" Your freshly cleaned balls jiggle back and forth in the active hands of your cocksuckers. They play with your sack like a cat plays with yarn, caressing and licking to coax out its tasty contents.");
	output(" Just <i>feeling</i> the mouths of those covetous rodents tending to your maleness");
	if (pc.balls > 0) output(" and the contractions of your oh-so-tight balls");
	output(" is a relaxation you aren’t willing to move on from yet."); 
	
	output("\n\nMaybe forever? The tongues around your [pc.cockHeadBiggest] work diligently to earn your [pc.cumVisc] bounty, sending arcs of pleasure through your loins and spine. The fingers around your [pc.base] stroke cunningly in ways that are sure to milk you dry. The enchanting caresses on your [pc.thighs] are... who would want to wake up from this?");
	output("\n\nWhen your [pc.eyes] do reluctantly open, you behold only the cheery-looking rodents, scarfing down all the fat loads of pre and cockmeat you have.");
	if (pc.balls > 0) output(" They’re pulling up your [pc.sack], polishing it with fat and caring licks, not letting your [pc.cocksLight] go unattended in any way as they gladly take on the roles of ball-sluts.");
	var yugeKnot:Boolean = false;
	for (var i:int = 0; i < pc.cocks.length; ++i) if (pc.hasKnot(i) && pc.knotThickness(i) > 10) yugeKnot = true;
	if (pc.hasAKnot()) output(" Your [pc.knots] aren’t left out either, and those " + (yugeKnot ? "obscenely" : "monstrously") + " inflated " + (pc.totalKnots() > 1 ? "orbs" : "orb") + " of breeding flesh swell angrily the closer climax comes.");
	
	output("\n\nYou thrust against their palms, faltering in your attempt to please the halfbreed [rat2.boyGirl]. <i>“You close to cumming? Bet you are,”</i> the rodenian grins, palming your [pc.cockHeadNoun] in a way that makes your [pc.hips] lurch dynamically to her touch. <i>“You ready to lose" + (ratsPCIsKnown() ? ", [pc.mister] CEO?" : "?") + "”</i> The girl and the boy both grin at you now, a cheesy cackle rumbling up their throats " + (pc.hasVagina() ? "as they casually assault your [pc.pussies]." : "."));
	output("\n\nIn between your blissful keening, you steal back some muscle control from your too-pleased loins and grip her head. Your ministrations on the half-rodenian become stronger and so does the volume of [rat2.hisHer] pleasured squeaks."); 
	
	if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“Soon! You’ll all be getting your [pc.cumFlavor] treat <b>real</b> soon, don’t worry!”</i>");
	else output("\n\n<i>“Almost, I’m just deciding who’s getting the most of it.”</i>");
	output(" You push your rod back into the [rat0.furColor] rat’s face, and you could swear by the sound she doesn’t mind if you get rough at all. Her throat now adjusted to your size, she’s fully prepared to suck you off from [pc.cockHeadBiggest] to [pc.base " + pc.biggestCockIndex() + "] without the tiniest of struggles. Gliding in and out of her wet fuck-hole is an effortless task, and one that’s bringing you nearer to sweet release.");

	switch (pc.cocks.length)
	{
		case 1:
			output("\n\nThe three eagerly dive back in on your [pc.cock], delighting in the thrum of every rapid heartbeat thumping your rod against their mouths. They wantonly kiss one another around your swollen girth. ");
			break;
		case 2:
			output("\n\nAs the rodenian girl and the mouse-boy tend your [pc.cockBiggest], the halfbreed [rat2.boyGirl] rubs your [pc.belly] and thigh, bobbing back and forth on the second and moaning like a first-class bimbo.");
			break;
		case 3:
		default:
			output("\n\nEach rat inhales their selected phallus, deepthroating you with admirable adaptation. Three craving mice rub your [pc.legOrLegs], your tummy, and three tails also swirl firmly around you"); 
			if (pc.cocks.length > 3) output(" and your extra poles, jerking off the " + (silly ? "swiss-army crotch" : "brace") + " of dicks on display");
			output(".");
			break;
	}
	
	output("\n\nOrgasmic tremors surge inwardly to your groin. Every suckle, stroke, and shudder waves a red blanket over your eyes. The foundation of pure joy transforms to one of thrumming ecstasy. It’s easy to let go now. Tension drains through your [pc.cocksLight], a comforting smother of pleasure that evaporates the thought of losing your own little bet.");
	output("\n\nBesides, it made them work harder. Can you really say you’ve lost?");
	
	var cumQ:Number = pc.cumQ();
	switch (pc.cocks.length)
	{
		// PC 1 cock
		case 1:
			output("\n\nAll three tongues synchronize in the final moments, trailing up and down the three sides of your [pc.cock]");
			if (pc.balls > 0) output(" while desirous paws help mix the contents of your [pc.sack]");
			output(". You loose an inelegant scream and detonate, triggering their orgasms through your moans. " + rat2.mf("Cock throbs and spurts in your hand, the ring between thumb and finger massaged by powerfully clenching nuts. ", " Pussy dominates your hand with limb-soaking squirts of rat-juice."));
			
			output("\n\nThe first ropes of [pc.cum] fly up and land on their heads, soaking into their hair. Before anymore is wasted, the rodenian girl denies her friends the taste of your flavorful seed, hilting herself on your numbing phallus.");
			if (pc.hasAKnot()) output(" Well that’s a bit rude... and fortunately, your knot agrees. With your last bit of strength, you ram your cum-corking flesh into her mouth just as it spreads out to its fullest, making sure the little jaw-locked spunk-bandit gets everything she wants.");
			
			if (cumQ < 100) output("\n\nYour [pc.balls] " + (pc.balls < 2 ? "works" : "work") + " hard to give the rodent her ill-gotten reward. Her spasming throat eases out long, thick cords of [pc.cumNoun], though you can tell she’s a bit disappointed by the output. The tongues and fingers on your [pc.cock]" + (pc.balls > 0 ? " and [pc.sack]" : "") + ", however, help urge out every last drop of seed, making sure that at least one of their number acquires the most of your [pc.cumVisc] bounty.");
			else if (cumQ < 500) output("\n\nYour [pc.balls] " + (pc.balls < 2 ? "strains and tenses" : "strain and tense") + (pc.balls > 0 ?", jostling in the hands of the other rats" : "") + " as thick loads of [pc.cumVisc] [pc.cumNoun] are pumped into the rodenian’s thirsty gullet, the visible lumps traveling down her gut-pipe. As if their tongues are high quality sex toys, the other two viciously slather your " + (pc.balls > 1 ? "[pc.sack] and [pc.cockNoun]" : "[pc.cockNoun]") + " with encouraging rubs, making sure the cum flows until the spunk-tanks are empty.");
			else output("\n\nThe volume of your load is making the rat thief regret her spunk stealing ways. Maybe. You can’t really tell with your eyes so blurry, but you can see her pretty neck bulge out with fat loads of seed. Endless, thick spurts of [pc.cum] clog her throat, traveling slowly down into her fast distending belly. She can’t swallow enough, and it soon rises up to trickles out from her lips" + (pc.hasAKnot() ? " around your knot" : "") + " and through her nostrils. What she loses on her matting face is licked up by the others.");
			
			output("\n\n" + (pc.hasAKnot() ? "As soon as your knot deflates, y" : "Y") + "ou yank your cock from the rodenian’s mouth. The other two rats hastily clean your [pc.cockNoun]" + (cumQ >= 500 ? " and even drink the leftovers pooled in her mouth" : "") + ". Still so energetic after just having cum themselves!");
			break;
			
		// PC 2 cocks
		case 2:
			output("\n\nThe rodenian half of the group swallow your [pc.cocks], denying the mouse-boy a taste from the tap. They nibble and suckle imploringly, fingers squishing against your bulging-out urethras, making it all too easy to reward them.");
			output("\n\nThe first ribbons of [pc.cum] are pumped into their mouths, provoking hot little moans");
			if (pc.balls > 0) output("; the mouse-boy nestles his nose in your tensing sack, licking and tending your overproducing cum-factories");
			else if (pc.hasVagina()) output("; the mouse boy nestles his nose in your [pc.pussy] just before you slather him with [pc.girlCum]")
			output(".");
			if (pc.hasAKnot()) output(" That’s a bit unfortunate for him, but a wicked thought comes to mind - your [pc.knots] look close to popping... Your cum-corking bulges of breeding flesh may not get a pussy, but a mouth is pretty much like one! You ram your [pc.cockBiggest] into the [rat0.furColor]-furred rodenian’s mouth, and shove the halfbreed bandit’s head onto the other, <i>howling</i> as you lock their jaws in keening orgasm."); 
			
			if (cumQ < 100) output("\n\nThey each get one or two ropes of [pc.cumVisc], seed-filled warmth before your cock dribbles the rest down their throats, much to their disappointment. Your pulses are strong, but their sucking is stronger - they suck the [pc.cumFlavor] [pc.cumNoun] right out without you needing to worry about ejaculating after a while!" + (pc.balls > 0 ? " For all the mouse-boy’s efforts, he isn’t able to wring much else out of your [pc.balls]." : ""));
			else if (cumQ < 500) output("\n\nTheir rough, pumping hands jerk out a veritable deluge from your spunk-tanks, and they each get refreshing mouthfuls of hot, [pc.cumVisc] [pc.cumNoun] right from the source. The bulging of your urethras and the impression of their sucking lips on it doubles your virile output. Searing hot ropes pour down pirate gullets, filling out their toned bellies nicely." + (pc.balls > 0 ? "Your [pc.balls] bounce in the mouse-boy’s hands, and he makes sure that no drop is left inside." : ""));
			else output("\n\nYou cum and you cum... Your thick, unending spurts of [pc.cumVisc] [pc.cumNoun] are to be envied. You fill the rodenian’s mouths to the brim with [pc.cumColor] seed, delighting in their frantic gulpings until your copious deposits spill out from their lips with nowhere else to go");
			if (pc.hasAKnot()) output(", even around your [pc.knots]");
			output(". A jet of seed-filled fluid spills from the rat girl’s nose, and the mouse-boy does his damndest to catch it all " + (pc.balls > 0 ? "while helping your [pc.balls] churn out the rest." : "."));

			output("\n\n" + (pc.hasAKnot() ? "When your [pc.knots] deflate, y" : "Y") + "ou tug your [pc.cocksLight] from the rat’s hungry maws, watching them sputter but immediately clean and spitshine your masts with airy purrs, even kissing each other to share your [pc.cumVisc] leftovers. Despite having cum next to you, they’re still fired up!");
			break;
			
		//PC 3+ cocks
		case 3:
		default:
			output("\n\nWhen all three of your [pc.cocks] are swallowed up by the trio of deepthroating rodents, your eyes roll back and a pink-hued miasma of lust draws you into its embrace, a wrap of arms not unlike the wrapping of slutty lips around your tumescent pricks. Your [pc.balls] " + (pc.balls < 2 ? "tenses" : "tense") + "... you grunt... shudder... grunt again... and the next thick heartbeats in your chest feed these rats every drop of [pc.cumVisc] treasure" + (pc.balls > 0 ? " right from your lust-fattened cum-sack." : ".")); 
			output("\n\nThree mouse-like noses press into your groin");
			if (pc.hasAKnot()) output(", the eagerness in effect making you buck your [pc.knots] into their mouths. They’ll get everything they want, alright!");
			else output(".");
			output(" All you can really make out as cum " + (cumQ >= 100 ? "flows" : "surges") + " are the coiling tongues around your pulsating prongs.");
			
			if (cumQ < 100)
			{
				output("\n\nWith your cocks buried deep in their throats, your urethras balloon with [pc.cum], squirting and spurting in between every lovely mewl and moan, though they do sound a little disappointed by the paltry output.");
				if (pc.cocks.length > 3) output(" As some sort of consolation, your weakly cumming " + (pc.cocks.length > 4 ? "cocks" : "cock") + " outside their mouths " + (pc.cocks.length == 4 ? "dribbles" : "dribble") + " some seed over their cheeks. Something to be claimed after you’re done.");
			}
			else if (cumQ < 500)
			{
				output("\n\nYou feel every rope of [pc.cum] churning through your urethra. You feel hot strands pouring into greedy thief’s gullets and see visible lumps distending their necks with every swallow. Bellies swell from leonine output, soft curves disappearing in cumflation. As it is, all you’re able to do is sigh happily, content with the knowledge that you’ve filled your cock-sluts with their rewards of [pc.cumVisc] [pc.cumNoun], and they won’t have to fight over it.");
				if (pc.cocks.length > 3) output("\n\nNot only have you filled them, but your unslotted " + (pc.cocks.length > 4 ? "pricks" : "prick") + " have been painting their heads [pc.cumColor]. They may wash it off, but they’re not going to be escaping your musk any time soon.");
			}
			else
			{
				output("\n\nThe rats begin to groan in what sounds like mite regret, your unmatched output rising up their cum-clogged throats");
				if (pc.hasAKnot()) output(" and back around your [pc.knots]");
				output(". They swallow hard and frequently, shaking their heads and groaning in discomfort and pleasure.");
				output("\n\nThe weight of your [pc.cumVisc] [pc.cumNoun], and the strength with which it floods, pries apart gut-holes and dry lips on its race to where it belongs. Your unmatched virility will go exactly where it needs to be, and while their muscles are swallowed up by the swelling of their bellies all you can do is sigh and grunt, waiting for your balls to be drained.");
				if (pc.cocks.length > 3) output(" Alas, with nowhere else to go, your extra " + (pc.cocks.length == 4 ? "dick has" : "dicks have") + " sadly been wasting their loads on heads of rat hair and your own stomach. But you’re not worried about that...");
			}
			
			output("\n\n" + (pc.hasAKnot() ? "When your [pc.knots] deflate, t" : "T") + "he rats slide your [pc.cocksLight] out of their mouths, sputtering and panting with stretched jaws. They grumble about the strain but dutifully clean and polish your spunk-stained rods before tending to each other.");
			if (pc.cocks.length > 3) output(" They hurriedly lick off whatever landed on your body, too.");
			break;
	}
	
	ratsCumComments();
	
	switch (pc.cocks.length)
	{
		case 1:
			output("\n\n<i>“Was it worth it?”</i> you grin at the complacent mouse who hoarded your cum.");
			switch (ratputation())
			{
				default:
				case RatsRaider.RAT_REP_NONE:
				case RatsRaider.RAT_REP_LOW:
					output("\n\n<i>“You lost, of course it was worth it!”</i> she sputters."); break;
				case RatsRaider.RAT_REP_MID:
					output("\n\n<i>“What do you think?”</i> She casts a fiery look to you. <i>“You lost, [pc.mister] CEO! I’ve got your treasure right here!”</i> She pats her belly, making you groan and cum just a tad bit more.");
					break;
				case RatsRaider.RAT_REP_HIGH:
					output("\n\n<i>“More than you think, [pc.mister] CEO, that was a good donation,”</i> she grins, rubbing her furry belly suggestively.");
					break;
				case RatsRaider.RAT_REP_GOOD_CEO:
					output("\n\n<i>“Mmmh, it was,”</i> she replies all coy. She looks aside and whispers, <i>“it was yours, how could it not be?”</i> Mmf... Now you’re ready to go again.");
					break;
			}
			break;
			
		case 2:
			output("\n\n<i>“So, I lost by cumming in your mouths?”</i> you ask with a grin.");
			switch (ratputation())
			{
				default:
				case RatsRaider.RAT_REP_NONE:
				case RatsRaider.RAT_REP_LOW:
					output("\n\n<i>“Of <b>course</b> you lost! You came first!”</i> the rodenian girl glowers confidently."); break;
				case RatsRaider.RAT_REP_MID:
					output("\n\n<i>“You definitely lost, [pc.mister] CEO!”</i> She pats her" + (cumQ >= 500 ? " bloated" : "") + " belly, <i>“your treasure’s all ours.”</i> Mnf, is she trying to get you horny again?");
					break;
				case RatsRaider.RAT_REP_HIGH:
					output("\n\n<i>“Depends on the meaning of loss, you still paid the toll in treasure, [pc.cumVisc] as it was,”</i> the rodenian grins, rubbing her" + (cumQ >= 500 ? " gravid" : "") + " belly.");
					break;
				case RatsRaider.RAT_REP_GOOD_CEO:
					output("\n\n<i>“No... You didn’t lose,”</i> the rodenian shakes her head, then looks aside bashfully, whispering, <i>“but we won because we have you to ourselves.”</i>"); 
					output("\n\n<i><b>Shit</b></i>, that’s precious - you ruffle their sweaty hairs extra hard.");
					break;
			}
			break;

		case 3:
		default:
			output("\n\nYou’re far too preoccupied with catching your breath to really appreciate their attentiveness to your sensitive genitals, but looking at the [rat0.furColor] rodenian, you softly say, <i>“I guess I did lose, three cocks weren’t much of a match for three rats...”</i>");
			switch (ratputation())
			{
				default:
				case RatsRaider.RAT_REP_NONE:
				case RatsRaider.RAT_REP_LOW:
					output("\n\n<i>“That’s right! And next time we find you, you’re going to lose more and more!”</i> the rodenian simpers."); break;
				case RatsRaider.RAT_REP_MID:
					output("\n\n<i>“We all got our share from you, you definitely paid well, [pc.mister] CEO!”</i> the rat girl grins, rubbing her furry belly.");
					break;
				case RatsRaider.RAT_REP_HIGH:
					output("\n\n<i>“Oh yeah, you sure lost a lot this time,”</i> the rat slut licks her lips, <i>“and you’re going to lose <i>much</i> more next time.”</i>");
					break;
				case RatsRaider.RAT_REP_GOOD_CEO:
					output("\n\n<i>“Well, no... I wouldn’t say you lost...”</i> the rodenian looks aside coyly, <i>“you, uh... have us around ‘n all to do this.”</i>"); 
					output("\n\nLaughing, you rub each of their heads.");
					break;
			}
			break;
	}
	
	if (ratsPCIsGood()) output("\n\nRather than get on with... whatever it is they do, the rats clamber around and over you, the rodenian lying atop your [pc.chest] with a too-innocent smile. They cuddle and hug you around your [pc.arms], giving you an affectionate kiss on the cheek. You can only smile like a dope as they snuggle for a spell. When they reluctantly disentangle, they collect their gear with profane quickness, then turn to wave at you. <i>“See ya ‘round, [pc.mister] CEO. Make sure you’re ready to pay up <i>next</i> time!”</i>\n\nYour wallet’s already opening again.");
	else output("\n\nThe rats all disentangle from your prone body, standing and hurriedly gathering their gear - even smacking each other if they think the other is applying a little casual kleptomania. Their quibblings make you laugh as you, too, rise to your [pc.footOrFeet]. <i>“See ya ‘round, " + ratsMisterCEO() + "! Get ready to pay up next time!”</i> they all grin before bounding off, batons crackling in their tail-threshing wake.");

	pc.orgasm();
	IncrementFlag("RATS_TRIPLE_SERVICED");
	
	ratsVictoryFinish();
}

public function ratsThreeMiceEatOutTwoLegs():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(10);
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";
	
	if (pc.isBimbo() || pc.isBro()) output("<i>“" + (pc.isBimbo() ? "Come onnn, g" : "G") + "et your tongues in there, I want to feel <i>alllll</i> of what you’ve got!”</i>");
	else if (pc.isNice()) output("<i>“For a pair of thieves you’re not working as hard as I think you can. Make some room... and get your tongues in there.”</i>");
	else if (pc.isMisch()) output("<i>“Don’t leave out my clit, get your fingers in there too! For a pair of thieves you’re sure not making an effort to steal my breath!”</i>");
	else output("<i>“You’re not even trying. Do you prefer cock more? Get your fingers in there, and give each other some room!”</i>");
	output(" The outlaw’s grumblings are little more than moans that rattle your groin in such a way that they can legally be considered vibrators.");
	output("\n\nTheir urgent enthusiasm catches you off guard.");
	output("\n\nFirst come cunt-contracting kisses, gentle and exploratory. Those tender touches elicit a cute gasp from you. The rats snerk; you feel three thick muscles impale " + (pc.hasVaginas() ? "one" : "your") + " [pc.vagina] all at once," + (pc.hasLegs() ? "and you spread your [pc.legOrLegs] just to give them the space they need" : "and you thrust your crotch out further just to give them room to operate") + ". Twitching noses vanish into your bare twat, your labia, your [pc.vaginaColor] tunnel, their frenzied licks and suckles robbing you of muscle control.");
	output("\n\n" + (pc.hasHymen() ? "There’s a twinge of halting shock when they unanimously discover your hymen." : "Their long tongues reach far enough to caress the nerves closest to your womb.") + " The mind-bending sensation of their deep exploration makes you gasp and recoil amidst a faint cackle among the gaggle of pirates. Their manhandling of your [pc.pussyNoun] leaves you speechless.");

	if (pc.hasHymen()) output("\n\n<i>“Doohh-hooo, a virgin! A silly virrrrginnn!”</i> they laugh, but not out of spite. <i>“Are you afraid we’re going to steal that, " + (ratsPCIsKnown() ? "[pc.mister] CEO? That’d be the greatest robbery of all time!" : "stranger?") + "”</i> the [rat0.furColor] mouse grins widely, then folds her arms cheekily. <i>“But, we’re not those types of thieves, ‘less you really want to give your first time up that easy!”</i>\n\nWell that’s... reassuring...");
	
	output("\n\nYour movements are arrested by the pirate’s prehensile tails, which have wound worshipfully around your [pc.hips]. Rough coils squeeze tightly in tune with their slobbering mouths on your mons; those tremendously affectionate and sometimes breathtaking grips on your body make it impossible not to vocally fold when the first orgasm of many scrubs that silly piece of meat you call a brain. Hearing the call of pleasure, your [pc.nipples] engorge");
	if (pc.isLactating()) output(", and a heavy trickle of [pc.milk] flowing down your [pc.skinFurScalesNoun]");
	output(".");
	if (pc.hasCock()) output(" Throbbing just above the rat’s noses are your [pc.cocksLight], close to their own climax. They aren’t paid much attention in favor of your sweet, supple " + (pc.hasVaginas() ? "cunts." : "cunt."));

	if (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) output("\n\nYour pussy-sluts struggle with the very chubby folds of vagina available to them. Vibratory squeals and incautious rubs wring out warm juice from your [pc.pussyNoun]. Supple " + (pc.hasVaginas() ? "mounds" : "mound") + " absorb ruthless faces before they can get to your deliciously wet interior. It amuses you to no end watching them struggle with your rubbery exterior, clearly not used to servicing someone with plenty to lick.");

	output("\n\n" + (pc.isSquirter() ? "A sparkling stream of [pc.girlCumNoun] oozes out - is pressed out - from your gash by captivated slit servants" : "You squirt more than a few times, plastering your dutiful muff munchers with [pc.girlCum]") + ". The mix of excited bandits, now wearing aromatic smears and tangy sheens of you, keep licking even as you try to catch your breath, doing exactly as you asked. Their fingers dive in all the way");
	if (pc.hasVaginas()) output(", and not just in one [pc.pussy] either");
	output(". From sultry strokes to erotic, circular rubs onto [pc.oneClit], they are determined to wear you out, but also determined to get fresher and fresher tastes from your deepest regions.");

	// PC big clits
	if (pc.clitLength >= 1)
	{
		output("\n\nYour [pc.clits], like " + (pc.totalClits() > 1 ? "perches" : "a perch") + " for sly criminals, " + (pc.totalClits() > 1 ? "are" : "is") + " viciously nibbled and tugged like fat nipples. The excessive pleasure on your too-sensitive clitoral flesh drives you over the edge yet again. You can’t catch your breath. [pc.GirlCum] is flowing in an endless river, contrasting with the emptying depth in your blissful wails.");
		pc.orgasm();
	}
	// PC cocksize clit (add on)
	if (pc.clitLength >= 4)
	{
		output("\n\nAn excessive third orgasm slaps you as silly as your overteased fem-cock slaps the bandit’s wide ears. Spittle rains down with hoarse cries, your legs just about giving away now. Sensing your distress, two of them hold your [pc.legOrLegs] steady... while also mercilessly jerking the clitoral " + (pc.totalClits() > 1 ? "fuck-poles" : "fuck-pole") + " protruding close to round ears.");
		pc.orgasm();
	}
	
	output("\n\n<i>“Nice [pc.girlCumVisc] taste,”</i> the rodenian moans; <i>“This [pc.girlCumFlavor] flavor is awesome!”</i> the other two agree.");
	if (pc.vaginaCanSting()) output(" The cilia lining your venom-pussy sting its invaders with every insertion, working them into an even greater frenzy and afflicting them with profane amounts of pussy-thirst. Filled with chemical lust they moan louder and work harder.");
	output("\n\nTwo sticky-fingered hands swap out frequently in between fuckdrunk boasts");
	if (pc.hasVaginas()) output(", and you soon find that " + (pc.vaginas.length == 2 ? "neither" : "none") + " of your [pc.pussies] are being given a chance to rest");
	output(". They curl and flex their paws in your spasming " + (pc.hasVaginas() ? "cunnies" : "cunny") + ", damn near making your [pc.vaginaNoun] explode from inelegant strokes deep and shallow. You struggle not to collapse when their fingers bulge faintly against the [pc.skinFurScalesNoun] of your belly, and just to make their point (quite literally) they press even harder.");
	
	output("\n\n<i>“Careful what ‘ya wish for, " + (ratsPCIsKnown() ? "[pc.mister] CEO!" : "stranger!") + "”</i> the [rat0.furColor] rodenian grins, a crystalline layer of beading femslime on her brow. <i>“Think we’re gonna let you get off with");
	if (pc.clitLength >= 4) output(" three");
	else if (pc.clitLength >= 1) output(" two");
	else output(" one");
	output("? We’re just getting started" + (pc.tallness >= 6*12 ? ", big [pc.boyGirl]!" : "!") + "”</i> The smug pirates let your knees vanish out from under you.");
	output("\n\nBut you don’t collapse painfully. They wrap you in their arms and bring you down slowly, letting their tails guide you into a comfortable position. The half-rodenian [rat2.boyGirl] shuffles to your left and the freckled mouse-boy shuffles to your right, idling under your [pc.arms]. The [rat0.furColor]-furred rodenian herself stays " + (pc.hasLegs() ? "right between your spread [pc.legOrLegs]" : "right in front of you") + ", her [rat0.eyeColor] eyes dilated with hunger for pussy and her lips flecked with ropes of [pc.girlCumNoun].");
	output("\n\nYour cheeks burn brighter red in this position, wholly at their mercy. They dial the pace back, softly licking up and down your [pc.legOrLegs], caressing the supplest parts of your [pc.skinFurScales].");

	if (catPC) output("\n\n<i>“I love the irony in this, three mice petting a " + (pc.tallness > 6 ? "big" : "little") + " kitty,”</i> the halfbreed [rat2.boyGirl] croons. <i>“Heh heh, you’re just like any other cat, all you need is a good rub-”</i> that’s what [rat2.heShe] does between your legs, watching your reaction, <i>“and you’re just lyin’ back for us!”</i>\n\nYou’re lucid enough to keep a playful hand away from your things at least.");

	output("\n\nGinger massages are applied to your aroused and slightly numb body, so serene and sincere that you briefly consider hiring them for more of that. Their moan-coaxing adulations are so professional and hotly erotic that you wonder why they can’t find steady employment at a luxury spa. Maybe they did, and they just got fired for robbing the customers at the same time.");
	output("\n\nRibbon-adorned tailtips twirl around your [pc.nipples], pinching and brushing your bulging teats with expert control.");
	if (pc.hasBreasts()) output(" They then wrap around your [pc.breasts], squeezing your sugar-mounds outwardly until they’re " + (pc.isLactating() ? "squirting [pc.milk] and jutting towards the ceiling. <i>“Aww, should have told us you had milk!”</i>" : "jutting towards the ceiling."));
	
	output("\n\nYou find yourself unable to focus on one area of pleasure over the other, not with three voracious tongues blazing trails up and down [pc.eachVagina] again, and not with");
	switch (pc.vaginas.length)
	{
		case 1: output(" two hands spreading your sensitive, [pc.girlCumFlavor] snatch for four sets of fingers to invade."); break;
		case 2: output(" so many pairs of hands spreading and exploring your sensitive, [pc.girlCumNoun]-scented snatches."); break;
		case 3:
		default: output(" your [pc.girlCumNoun]-scented pussies being spread, teased, and orally cleaned all at once."); break;
	}
	
	output("\n\nRat-like fangs roll [pc.oneClit] between upper and lower - another head takes its place. Whilst they service you, the outlaws service each other, fingering and jerking themselves but making sure their heads stay in the game: sucking and nibbling your [pc.clits], never forgetting to share.");
	if (pc.balls > 0) output(" It’s another laugh when you see your [pc.sack] lifted up and out of the way, the weighty " + (pc.balls > 1 ? "orbs" : "orb") + " sympathetically teased while being being worn like a hat.");
	output("\n\nEven though you’re little more than a prisoner to pleasure, you at least make sure to reward them. <i>“Good rats get headpats,”</i> you say tacitly, ruffling their messy heads of hair. They squeal against your touch, eagerly accepting that frictious reward.");
	output("\n\nYou cum again, shivering so much that they have to pin you down as you ride out the next cascade of pleasure. By the sounds you can make out, they’re <i>enjoying</i> it! Every time they’re painted in your next batch of hot, [pc.girlCumColor] juices, they laugh in unison, then shower you with compliments and praises! <i>“Good [pc.boyGirl]!”</i> the rodenian purrs; <i>“Bet that felt nice!”</i> the other two smirk lopsidedly at you.");
	
	output("\n\nBut they aren’t slowing down anymore. When things around you blur to blissful imperceptibility, you’re able to focus on the 24 fingers and 6 thumbs acting stridently between your [pc.thighs]. You’ve become so hypersensitive, so very aware of each beading ball of lubricant trailing down your [pc.skinFurScalesColor] mound. Every ardent touch is a sensual caress to the cluster of pretty, girlish nerves now laid bare, sensitive strings that are tugged but often stroked; played like " + (silly ? "a damn fiddle" : "a violin") + "...");
	output("\n\n<i>“Hey, stop moving so much! Damn, [pc.boyGirl]!”</i> the half-rodenian [rat2.boyGirl] shouts. <i>“You silly slut!”</i>"); 
	output("\n\nOne pair of fingers dances along your most vulnerable muscles, ticklish, but instead of laughing you can only shake. An energetic hand drags its fingers over your " + (pc.hasVaginas() ? "slits" : "slit") + ", up and down, slow, fast, faster, and slow again, spreading it to allow another’s hand in to play along your spasming walls. A third, rough hand rubs all around your [pc.clits], traveling past your [pc.pussy] to tease your [pc.asshole]. In between these torturous fondlings are enthusiastic licks, rough and laugh-trembling tongues forage in your bitter swamp. Your entire crotch thrusts up, bucking all the rats in the process, and inadvertently shoving their probing digits deeper.");
	output("\n\n<i>“Hey, sit still! How many times do I have to say it!?”</i> the rodenian barks, <i>“We’re just getting to the good part!”</i> Wait, that... that wasn’t it!? As if to answer your half-rational muse, you involuntarily thrust upward again, screaming and falling to your back, muscles locking and spasming in the aftermath of another spine-tingling climax.");
	
	output("\n\nTheir rough tails uncurl from your body and weave towards your crotch. The pointed tips tease your unresistant " + (pc.hasVaginas() ? "openings" : "opening") + ", threatening to lance you. They lather and lubricate themselves in your fragrant secretions. Now ready for penetration like any penis, they snuggle against your wet and waiting " + (pc.hasVaginas() ? "holes" : "hole") + ", pressing their thicker hafts to your " + (pc.hasVaginas() ? "cunts" : "cunt") + ", giving you ample indication of how thick their dildo-tails are. The rats crane their heads to gaze at you, faces slick with [pc.girlCumNoun] and beaming with joy."); 
	output("\n\n<i>“Wanna take a ride, " + ratsMisterCEO() + "? Think you can handle that part of us too?”</i> the coy rodenian asks.");
	if (pc.hasHymen()) output(" <i>“Even though you’re a virrrrgiiinnn!”</i>");
	output("\n\n<i>“But it’s up to you!”</i> the mouse-boy proceeds."); 
	output("\n\n<i>“C’mon c’mon, give us an answer!”</i> the [rat2.furColor]-furred [rat2.boyGirl] finishes.");

	addButton(0, "Tail Peg", ratsTailsAndOralAndFuckNamingFucntions, undefined, "Tail Peg", "Let them use their tails, you can take it!");
	addButton(1, "No Tails", ratsMouthsOnlyFinalPusstination, undefined, "No Tails", "No! You wanted tongues and fingers in there, not tails!");
}

public function ratsTailsAndOralAndFuckNamingFucntions():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(15);
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";
	var pcWasVirgin:Boolean = pc.hasHymen();
	
	if (pc.isBimbo()) output("<i>“Mmmmyeaahhh, do it! I need it!”</i> you shout.");
	else if (pc.isBro()) output("<i>“Go for it, all the better,”</i> you reply.");
	else if (pc.isNice()) output("<i>“Y-yeah... go ahead, but go slowly at first...”</i> you moan.");
	else if (pc.isMisch()) output("<i>“Ohhh.... Y-yes! Yes, yes! All at once!”</i> you stammer.");
	else output("<i>“I can handle all of you and then some. Try me,”</i> you reply. But you’re not <i>quite</i> ready for it.");

	output("\n\n<i>“Ha! What did I say about being careful?”</i> the mouse-girl laughs, suddenly pouncing on you. She");
	if (pc.hasLegs()) output(" grabs your ankles and");
	output(" crawls up your chest, wasting no time bringing you into a kiss and leaving your candied crotch fully exposed to everything and everyone."); 
	output("\n\nThe rat slut takes control, forcing her tongue past your [pc.lipsChaste] as three tendrils lunge into your [pc.pussies] at the same time. Slithering in inch by inch, your velvety walls are spread beyond their limit to accommodate the raw, wiggling aggression of tactile tails.");
	if (pc.hasHymen()) output(" Your hymen offers up no resistance as their sharp tips break through to tease the entrance of your gagging " + (pc.hasVaginas() ? "wombs" : "womb") + ", but they undulate in a way that reduces the pain.");
	var notified:Boolean = false;
	for (var i:int = 0; i < pc.vaginas.length; ++i) notified = notified || (pc.holeChange(i, 50, !notified));

	if (pc.hasVaginas()) output("\n\nYour poor holes, " + (pc.tightestVaginalLooseness() < 3 ? "tight as they were" : "despite their ample space") + ", were not ready for this.");
	else output("\n\nYour poor hole, " + (pc.tightestVaginalLooseness() < 3 ? "unstretched as it was" : "despite being loose") + ", was not ready for this.");
	output(" You can’t help but scream feeling more and more mouse tail force its way into your seething nethers, gently pulling out when it hurts too much. Even though they’d lubed up, it still stung like hell!");
	output("\n\nYou remind yourself that most of the pain is that of [pc.eachVagina] being forced to spread so wide. Soothing massages help ease this process. Your muscles quiver as your body adjusts. Pleasure seeps in as the seconds go by, until finally the sudden agony is replaced with something decidedly sublime. Your breathing normalizes, and you start to cry for more.");
	
	output("\n\nPulling away from the sloppy kiss, your rodenian lover smiles while your slimy " + (pc.hasVaginas() ? "tunnels" : "tunnel") + " clench down around their invaders. That effect has them all squirming and moaning a little bit louder."); 
	if (flags["RATS_TAILED"] == undefined) output(" <i>“Getting used to it yet?”</i> she asks, and you nod.");
	else output(" <i>“Bet you can’t get enough that!”</i> she exclaims, and you smile back, telling her it’s nothing if not unique.");
	
	output("\n\nThe sultry rat grinds her buxom body against yours in fulsome, wave-like motions, squeaking and simpering when arousal spikes. Those thrusts of joy are always followed by floods of girljuice."); 
	if (pc.hasBreasts())
	{
		output(" Your [pc.breasts] are an easy target; she rubs her face in your");
		if (pc.biggestTitSize() < 8) output(" ample");
		else if (pc.biggestTitSize() < 16) output(" vast");
		else output(" head-smothering");
		output(" cleavage, licking at the forgiving flesh");
		if (pc.isLactating()) output(" and especially the milk-drizzling peaks");
		output(". The lust-fattened nipples of her " + (CodexManager.entryViewed("Rodenians") ? "chest-wombs" : "sizeable chest") + " dock with your own, jousting in their erect ways.");
	}
	else output(" She smoothly caresses your [pc.chest], nuzzling her cheeks against your [pc.skinFurScales], licking your [pc.nipples] with long, sensual rubs.");
	
	if (catPC) output("\n\n<i>“Looks like the cat got dragged in, huh?”</i> the rat titters. She happily rubs your [pc.ears] when your [pc.tails] wind firmly around her waist. You merely respond that it’s only temporary.");

	output("\n\nA lovely pace is maintained between your legs. Tails, tongues, and tips of fingers simultaneously worship and desecrate your splayed feminine altar. You came again some time ago, but focused as you are on the masturbatory-minded mouse straddling you, that kind of stimulation sailed right over your arousally submerged heads."); 

	output("\n\nYour fingers thread the genial mouse-alien’s messy hair, delicately rubbing her head");
	if (CodexManager.entryViewed("Rodenians")) output(", teasing her leaky aural vaginas,");
	output(" before gripping tight and guiding those seductive, purring lips back to yours.");
	output("\n\nThis time you kiss her back, forcing your");
	if (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) output(" venom-laced");
	output(" tongue in, pinning hers");
	if (pc.hasLongTongue()) output(", and throatfucking her with your advantageous length");
	output(".");
	if (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) output(" The effect of your aphrodisiac-laced saliva is readily apparent, s");
	else output(" S");
	output("he squirms in your embrace before wrapping her arms around your neck - you hug her close, too. Both rough hands on her plush, furry ass, you palm blissful patterns in her majestically smooth and supple globes. You play her like she played you when you pet the base of her tail, squeezing that rolling foundation before dipping down into the warm, inviting enclosure of her ass-cleavage.");

	output("\n\n<i>“W-wait,”</i> she smiles shyly, punctuating another thrust in your [pc.vagina]. She reaches back and firmly grabs your hands, bringing them to her ears and sliding your fingers right into her most sensitive places. Her [rat0.eyeColor] eyes roll back and a farway look dominates her snout. The insensate pirate encourages you to fingerfuck her head-cunts with incoherent babbles."); 
	output("\n\nThe shock of it all on her, and you, makes the next raw thrust of tail the last you need. Your hands slip down well past the knuckles into alien ear-pussies, trapped by the membranous walls of her frictionless pink tunnels.");

	output("\n\nAs well as you can, you hug your rat tight, crushing her against your body as you fall back and cum for the last time. The two moaning faces at your crotch are coated in the spatter of [pc.girlCum] once more, their tails finally pulling free of your spasming " + (pc.hasVaginas() ? "pussies" : "pussy") + " after being padlocked.");
	if (pc.hasCock()) output(" Your [pc.cocksLight] ooze pathetically over themselves in the aftermath of your feminine climax.");
	output(" Rodenian girlcum pours from the slant rat-thief’s ears, giving herself a good shine before it spills onto you from her limp chin and neck. The smell of four scintillating orgasms wafts into the air - you can almost taste your [pc.girlCum]");
	if (pc.hasCock()) output(" and [pc.cum]");
	output(" from here.");

	output("\n\nSlumping " + (pc.hasBreasts() ? "in your [pc.breasts]" : "on your [pc.chest]") + ", the [rat0.furColor]-furred outlaw pants worse than an exhausted dog, her mouth wide open and her breaths thicker than steam belching from the station’s forges. You withdraw your hands and look over to see the other two rats peeling away from your numb but satisfied crotch, certain they had to hold you down in your final, vigorous climax. The rodenian stirs quickly, shaking her head and regarding you like she hadn’t even gasped delirious."); 
	output("\n\nThe diligent bunch clean the evidence of your tryst away; the rodenian’s tail swims to the front of her face for her to suck, cleaning herself of your [pc.girlCumColor] [pc.girlCumNoun].");

	ratsGirlCumComments();

	// Rats respect PC (goodCEO)
	if (ratsPCIsGood()) output("\n\nBefore they dismount, the trio of thieves crawl up to your neck, peppering kisses along your exhausted body before planting their most genuine on your [pc.face]. They cuddle and hug for a whole minute, nuzzling against you, doing anything they can to help you relax and recover. When they’re ready to go, they quickly gather their gear, redress, and get ready to go back to... whatever it is that they do.\n\n<i>“See ‘ya later, [pc.mister] CEO! Let us know if you’d like to make a <i>donation</i> again!”</i> You smile warmly as they run off, thinking you just might want to do that sooner rather than later.");
	// Rat Rep Low,Med,High
	else output("\n\nThe rats, after cleaning you - and themselves - of your orgasmic fluids, hurriedly stand and collect their gear. They spend a minute redressing, recriminating, and gearing up for their next job. Whatever that could possibly be. You sit up with a smirk, entertained by their backbiting.\n\n<i>“Be careful on Zheng Shi, okay!? You still have so much left that you owe!”</i> they wag their iniquitous fingers and disappear down the corridor.");
	
	pc.orgasm();
	IncrementFlag("RATS_TAILED");
	IncrementFlag("RATS_TRIPLE_SERVICED");
	if (pcWasVirgin) flags["RATS_STOLE_VIRGINITY"] = 1;
	
	ratsVictoryFinish();
}

public function ratsMouthsOnlyFinalPusstination():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(15);
	
	var catPC:Boolean = pc.catDog("a", "b", true) == "a";

	output("<i>“No...”</i> you start, beckoning the wide-eared girl forward, ");

	if (pc.isBimbo()) output("<i>“I wanted those sexy lips of yours...”</i>");
	else if (pc.isBro()) output("<i>“No tails, sweetie.”</i>"); 
	else if (pc.isNice()) output("<i>“I specifically asked for those soft mouths of yours.”</i>");
	else if (pc.isMisch()) output("<i>“I only want those warm, wet lips, and I want them here...”</i>");
	else output("<i>“I want your mouth, not your tail.”</i>");

	output("\n\nSmiling wide, the rodenian pounces on you. She");
	if (pc.hasLegs()) output(" grabs your ankles and");
	output(" crawls up your chest, splaying your seething nethers to everything and everyone. You waste no time wrapping your [pc.arms] around her neck and bringing her into a molten kiss that tastes of your quim.");
	if (catPC) output("\n\nYour [pc.tails] wind and grasp firmly around the coy rat’s waist. <i>“Ironic I’m jumping on a cat isn’t it?”</i> she quips, and you both giggle.");

	output("\n\nWith your mouse-slut straddling you, the other two rodents assume positions on all fours " + (pc.hasLegs() ? "between" : "in front of") + " your [pc.legOrLegs] and put their untiring tongues back to work on your [pc.pussies]. Their tails don’t leave you alone, and while they don’t thrust inside, they still grind at your " + (pc.hasVaginas() ? "slits" : "slit") + ". The trio begin servicing each other with their now moist appendages, grinding the tips against one another’s loins.");
	output("\n\nPulling away from the sloppy kiss, your rodenian lover smiles as her tail fiercely squirms against your crotch, no different than the rough edge of a wooden horse. When your slit is assaulted all together, you shudder in a vision-blurring orgasm. " + (flags["RATS_TRIPLE_SERVICED"] == undefined ? "<i>“You enjoying yourself, " + ratsMisterCEO() : "<i>“Ooh, I felt that one through my butt!”</i> she laughs stupidly, <i>“are you ready to give up yet, " + ratsMisterCEO()) + "?”</i> the mouse-slut asks, rubbing her accessorized rudder all over your crotch " + (pc.hasLegs() ? "and inner thighs." : ".") + (flags["RATS_TRIPLE_SERVICED"] == undefined ? " You shriek affirmatively. Of course you’re enjoying yourself!" : " <i>“Mmm... I think I can hold on to <b>this</b>,”</i> you start, roughly gripping the mouse-girl’s ass, <i>“just a bit longer.”</i>"));

	output("\n\nThe sultry rat grinds her lovely body against yours in fulsome, wave-like motions, groaning huskily at every shared pang of joy.");
	if (pc.hasBreasts())
	{
		output(" She plays happily with your [pc.breasts], rubbing her face in your");
		if (pc.biggestTitSize() < 8) output(" ample");
		else if (pc.biggestTitSize() < 16) output(" vast");
		else output(" head-smothering");
		output(" cleavage");
		if (pc.isLactating()) output(" until milk squirts from your [pc.nipples] - she eagerly drinks up that [pc.milkFlavor] snack");
		output(". The fat nipples of her " + (CodexManager.entryViewed("Rodenians") ? "chest-wombs" : "sizeable chest") + " dock with yours.");
	}
	else output(" She smoothly caresses your [pc.chest], nuzzling her cheeks against your [pc.skinFurScales], licking your [pc.nipples] with long, sensual rubs.");

	output("\n\nA heavenly pace is maintained beneath the two of you: The brunts of tails, the tips of fingers, and two <i>very</i> passionate tongues simultaneously worship and desecrate your splayed feminine altar. You don’t remember the last time you <i>haven’t</i> cum. Those kinds of thoughts drown in the arousal you’re both submerged in.");
	output("\n\nThreading the mouse-alien’s hair between your fingers is an easy and heartwarming gesture; you tease her special ears and pull her back into a kiss -- her tail immediately wraps around both of you, squeezing your bodies tighter together. ");

	output("\n\nYou lock your [pc.lipsChaste] with her purring mouth");
	if (pc.hasLongTongue()) output(", even thrusting your advantageous length down her throat");
	output(".");
	if (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) output(" You lace your tongue with venomous lust and rinse her mouth thoroughly, reveling in the cute moans that follow.");
	output(" Both hands then fall to her majestically smooth, sweat-damp ass, palming circles in her delectable, furry globes. She looses a muffled squeal into your mouth when you squeeze and caress the base of her tailbone, making those adorable constrictions around your torso all the better.");

	output("\n\n<i>“Wait, h-hold on...”</i> she stops you, reaching for your [pc.hands]. She gently grips them and guides you to her ears, forcing your fingers into her aural cunts. Her [rat0.eyeColor] eyes roll back almost immediately and a faraway look dominates her face. The satiny walls of her twin orifices wetten and squeeze harder the further you go. You’re not sure how deep they are, but the pressure and temperature are fantastic, to say nothing of the blissfully vacant expression meeting yours.");
	output("\n\nAs best you can in this position, you hug your mouse tight, crushing her against your body and strenuously stroking her innards. You lie back and cum one last time, letting the whole of Zheng Shi dissolve as the four of you cry out in simultaneous climax.");
	output("\n\nThe two moaning faces at your crotch are fast coated in the largest spatter of [pc.girlCum] you’ve put out. Their tails withdraw from your groin dripping with [pc.girlCumVisc] [pc.girlCumNoun], flinging beads of the stuff when they flex.");
	if (pc.hasCock()) output(" Your [pc.cocks] ooze all over themselves in the aftermath of your feminine climax, like dessert past the main course.");
	output(" Rodenian-juice pours from the slant rat-thief’s ears, giving her cheeks a good shine before it spills onto you from her limp chin and neck. The smell of four scintillating orgasms wafts into the air - you can almost taste each flavor in your tranquilized state.");

	output("\n\nSlumping " + (pc.hasBreasts() ? "in your [pc.breasts" : "on your [pc.chest]") + ", the [rat0.furColor]-furred outlaw pants worse than an exhausted dog, her mouth wide open and her breaths thicker than steam belching from the station’s forges. You rub her head and look over to see the other two rats peeling away from your numb crotch, certain they had to hold you down in your final, vigorous climax. The rodenian stirs quickly, shaking her head and regarding you like she hadn’t even gasped delirious."); 
	output("\n\nThe diligent thieves clean the evidence of your tryst away; the rodenian’s tail swims to the front of her face for her to suck, cleaning herself of your [pc.girlCumColor] [pc.girlCumNoun].");
		
	ratsGirlCumComments();
	
	// Rats respect PC (goodCEO)
	if (ratsPCIsGood()) output("\n\nBefore they dismount, the trio of thieves crawl up to your neck, peppering kisses along your exhausted body before planting their most genuine on your [pc.face]. They cuddle and hug for a whole minute, nuzzling against you, doing anything they can to help you relax and recover. When they’re ready to go, they quickly gather their gear, redress, and get ready to go back to... whatever it is that they do.\n\n<i>“See ‘ya later, [pc.mister] CEO! Let us know if you’d like to make a <i>donation</i> again!”</i> You smile warmly as they run off, thinking you just might want to do that sooner rather than later.");
	// Rat Rep Low,Med,High
	else output("\n\nThe rats, after cleaning you - and themselves - of your orgasmic fluids, hurriedly stand and collect their gear. They spend a minute redressing, recriminating, and gearing up for their next job. Whatever that could possibly be. You sit up with a smirk, entertained by their backbiting.\n\n<i>“Be careful on Zheng Shi, okay!? You still have so much left that you owe!”</i> they wag their iniquitous fingers and disappear down the corridor.");
	
	pc.orgasm();
	IncrementFlag("RATS_TRIPLE_SERVICED");
	
	ratsVictoryFinish();
}

public function ratsHandlingTaurcock():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(25);
	
	output("You have to plant your [pc.footOrFeet] and curl your toes to stay upright against the cock-wringing twists and turns below. The pleasure threatens to sit you down atop the rats. Well, <i>crushing</i> them is the correct way to put it. While that is an amusing thought, you’d rather not scare off your dick worshiping trio.");
	if (pc.balls > 0) output(" A hand on your wobbling ballsack soothes you into placitude with imploring caresses.");
	output("\n\n<i>“Hey, big [pc.boyGirl],”</i> you hear the rodenian call, <i>“you gotta talk to us! Let us know how we’re doing, okay?”</i>");
	output("\n\n<i>“We can’t see your eyes from here, so you need to tell us when it feels <i>just</i> right!”</i> the halfbreed [rat2.boyGirl] finishes.");

	output("\n\nIf they’re that willing... why not see how it goes? Your first order is an easy one. ");
	if (pc.isBimbo()) output("<i>“Hands fingers around the tip, cuties, go niiceee and slowww at first!”</i> you giggle, cupping one cheek and pinching a [pc.nipple].");
	else if (pc.isBro()) output("<i>“Focus on the tip,”</i> you grunt.");
	else if (pc.isNice()) output("<i>“Hands and fingers on the tip, then. Go slow. Unless you want me to fall...”</i> you titter.");
	else if (pc.isMisch()) output("<i>“First things first then! Hands, fingers, tongues, all of those on the tip. You do a good job, there might be something in it for you!”</i> you explain, shuffling comfortably.");
	else output("<i>“Start with the tip, and make it good,”</i> you grunt.");
	
	output("\n\nRight away, you get exactly what you asked for. You’re not sure where fur and skin begins and tongue ends as your [pc.cockHeads] are gripped, rubbed, squeezed, and sucked from multiple sides. It’s not long before you can feel a warm coating of lube smeared across the surface of your [pc.cocksLight].");
	output("\n\nMouse mits play erotically along vast stretches of sensitive [pc.cockType " + pc.biggestCockIndex() + "] cockflesh. Lips kiss and tongues lick your musky member, polishing your " + (pc.hasCocks() ? "poles" : "pole") + " as pre spurts out in huge, tasty globs, usually into a mouth but sometimes on the faces of others. Between the quibblings you feel two tongues lap almost abusively at your " + (pc.hasCocks() ? "cumslits" : "cumslit") + ", your urethras obliging them with a steady stream of the salty treat they so badly want.");
	output("\n\n<i>“Hey, don’t steal it all!”</i> you hear one shout."); 
	output("\n\n<i>“Shut up!”</i> the sharp-voiced rat girl barks."); 
	
	output("\n\nWith your [pc.cocks] squeezed");
	if (pc.hasCocks()) output(" together");
	output(" by the rat’s tails, you feel their appendages lubing up thanks to the eager tongues and mouths down there. You call out for them to use their tails - gently. You crane your neck for any sight of the action going on below your imposing frame, only able to see the occasional foot or fuzzy ankle sticking out as they swap places with one another.");
	output("\n\nYou’re not quite sure where the most pleasure comes from, hearing the loudest cock-slurp in the galaxy or the intense pressure on your [pc.balls]. Those lungs are fully dedicated to milking your liquid bounty and leaving you high and dry.");
	output("\n\nAll of a sudden, your vision blurs and a hot breath is forced up your throat. You paw at your [pc.chest] furiously and slump forward, raising your [pc.ass] into the air. A pair of hands push back up, <i>“Hey, don’t you dare fall on us!”</i>"); 
	
	output("\n\nIt takes a mighty effort to raise yourself back up, and a herculean one to not laugh at them. <i>“If you can’t stay up then you’re not going to cum, " + ratsMisterCEO() + "! Don’t forget that!”</i>"); 
	output("\n\nYou grin, " + (pc.isBimbo() || pc.isBro() || pc.isMisch() ? "<i>“Maybe I’ll just forget what balance is, then!”</i>" : "<i>“I think you’re underestimating how close I am...”</i>"));
	output("\n\n<i>“We’ll see about that!”</i> Their sweaty efforts redouble. Your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " jerked every which direction, the tip finding itself at one mouth then another, varying degrees of warmth cooking [pc.eachCockHead]. Robber’s hands grip around your " + (pc.hasCocks() ? "urethras" : "urethra") + ", staunching the flow of pre. You let out a long, stinging sigh, your pleasured grunts and groans interrupting the flow of oxygen.");
	
	if (pc.balls > 0) output("\n\nTails smack against your wobbling ballsack like a friendly clap on the ass. The intrusion of wiggling fingers soon tells you that your nuts have are being checked and inspected by oh-so-possessive hands. The load of [pc.cumNoun] you’re mixing right now churns up faster with the help of admiring attentions. What feel like mouse-ears brush against your orgasmic pouch, and from the sounds (and feeling in your [pc.cockHeadNoun " + pc.biggestCockIndex() + "]), they must be getting what they want: thicker, more freely leaking globs of pre.");
	
	output("\n\nThe first involuntary thrust into your outlaw onahole is weak, and most people would have stopped themselves after such a lapse.");
	output("\n\n...But seeing as how they’re not complaining, you let yourself fall into that bliss. Their blunted nails are just as good as a ribbed cunt, the mix of fur and skin, matted and dry, around your [pc.cocksLight] is positively divine, as is the constant feeling of it being bared to the warm air over and over. Tails that seemed harmful are just another layer of sexual stimulation, like medial rings that squeeze inwards. You can’t fuck them in any hole, but when united these rats are all <i>themselves</i> a hole to fuck!");
	output("\n\nYou make sure to dress your next words in as rough a tone as you can: you tell them to go all in. To your delight, <i>they oblige</i>. You squeal out, telling them to hold still, to stay in... whatever the hell they are doing. You’re not exactly sure how they’re positioned, but you feel like all three of them have formed some kind of cock-sock out of each other. There’s just something tube-shaped about it all down there, and was that a foot pressing up by your crotch?");
	output("\n\nYou thrust your [pc.cocks] forward experimentally, putting your [pc.arms] into the act. A deluge of tangy pre doesn’t find its way into a willing receptacle, but... is that hair? Just what are they doing?");
	output("\n\n<i>“Are you gonna do this or what?”</i> you hear. Well, if all you need to do is thrust, then that’s just what you’re going to do!");
	
	output("\n\nYou swivel back and push forward again, feeling the strange shape made of undulating outlaws rhythmically bob in tune with your frustrated pump. You do it again, and this time you hear a bunch of yelps followed by a cacophony of squeaky moans and backbiting insults directed at each other."); 
	output("\n\nYou silence them with another impassioned thrust and spread your [pc.legOrLegs]. It’s like they’re all <i>hugging</i> you down there, but you’re not <i>quite</i> sure, are they using their entire bodies for this? What you are sure of, however, is that those pneumatically grinding tongues haven’t stopped, nor have those wheeling fingers. Your movements are primitive compared to the exquisite writhings against your [pc.cockType " + pc.biggestCockIndex() + "] prick; where your girth goes, the pleasure follows."); 
	output("\n\nOr in this case, the pleasure is jostled about");
	if (pc.balls > 0) output(" like your heavy [pc.balls], being kneaded by a tail and two hands");
	output(".");
	if (pc.balls > 0 && pc.ballSize() >= 8) output(" Your swinging balls are so full and heavy that even two of them together can’t lift one nut in your [pc.sack]. You wince when a tongue tickles your [pc.ball], raking upwards before a wet nose presses into your [pc.skinFurScalesNoun] ballflesh. Mmf.");
	
	output("\n\nYou hammer and arch back, the buzz in the back of your mind subsuming the rest of your brain. You let your [pc.tongue] fall from your mouth, spilling a torrent of saliva where it may, and let your muscles handle it from here - your body knows what it wants. Your front legs collapse, lending their strength to your backmost limbs. The tendons in your hind begin to burn as brightly as your ligaments shine with sweat; all that matters is pounding whatever faux-pussy has been custom made for your [pc.cocks]! You don’t have to worry about this station, your cousin, the task at hand, all you have to do is just <i>fuck these rats</i>!");
	output("\n\nWith your throat bulging against the warm air of the station");
	if (pc.hairLength > 4) output(" and your [pc.hair] hanging like spaghetti over your face");
	output(", you stretch back so hard that all you can comprehend is the puddle of pleasure you’re dipping your dick in and out of. It’s a collection of sex that deepens on every piston, the pleasure escalating to greater levels");
	if (pc.balls > 0) output(" as your [pc.sack] thwomps against one of their heads");
	output(".");

	var cumQ:Number = pc.cumQ();
	output("\n\nOn a deeper level you know that when you lurch all the way forward and submerge your shaft in that pit of raw depravity, you will cum. Even though you acknowledge it, the fact that it’s a spreading prospect in your mind doesn’t prolong the situation. All you’re doing is bounding across the edge of release, making the most of it while you can.");
	output("\n\nYour arousal spills over the edge of that euphoric pool, and in your blissed out state, you cry out. You cry as ropes of cum surge up your puffed out cum-tubes");
	if (pc.hasVagina()) output(", you shriek as your [pc.pussies] squirt hard, slathering the station in a long-lasting scent of you");
	output(", and you howl as all your rear half can do is keep thrusting into those tender hands, gently easing out every");
	if (cumQ < 200) output(" soaking");
	else if (cumQ < 1000) output(" blanketing");
	else output(" massive");
	output(" load of [pc.cumVisc] [pc.cumNoun] you’ve got. All unnecessary bodily functions cease or dim to better help you enjoy this climax.");
	
	output("\n\nYou crash upon a thick puddle of your own making, your wasted [pc.cumNoun] splattering outwardly in moist, [pc.cumVisc] beads. You seek to catch your breath while the rodents share and drink up what’s left, shaking your [pc.cumFlavor] seed from their faces and hair to your side. They make a show of savoring your taste, and the [rat0.furColor] rodenian in particular seems to enjoy it the most.");

	ratsCumComments();

	output("\n\nAs you relax and recuperate, the extricated rodents redress and quibble amongst themselves. <i>“So... What were you up to down there?”</i> you ask breathily, and the rodenian turns to you with a beaming grin.");
	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW: output("\n\n<i>“Like I’m gonna tell someone who lost such important information,”</i> she wags her finger."); break;
		case RatsRaider.RAT_REP_MID: output("\n\n<i>“That’s for us to know and you to wonder about, [pc.mister] CEO!”</i> she shakes her head."); break;
		case RatsRaider.RAT_REP_HIGH: output("\n\nShe blushes and starts laughing. <i>“Not a chance we’d give our secrets away so easily, [pc.mister] CEO! Just you worry about coming back with more to share!”</i> she winks."); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("\n\n<i>“Come on, do you really care about that? You should uh... worry about giving us plenty of [pc.cumNoun]...”</i> Those last words came out like a whisper, but it doesn’t fail to make you smile."); break;
	}
	
	// Rats Respect PC (goodCEO)
	if (ratsPCIsGood()) output("\n\nThe rats walk up to you and each give you an affectionate kiss on the cheek. You can only smile like a dope as they cuddle for a few seconds and finally disentangle. Before leaving, they wave at you. <i>“See ya ‘round, [pc.mister] CEO. Make sure you’re ready to pay up <i>next</i> time!”</i>\n\nYour wallet’s already opening again.");
	// Rat Rep Low,Med,High
	output("\n\nEach mouse-eared bandit gives you a silly salute before running off, waving to you as they go. At least they can be gracious losers.");
	
	pc.orgasm();
	IncrementFlag("RATS_TRIPLE_SERVICED");

	ratsVictoryFinish();
}

public function ratsEatingTaurTuna():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(25);

	output("The rats are dragged along for a ride on your next contraction. You stumble to and fro, moaning after they found your sweet spot. Locked together in your constricting cunt, they yelp and pedal against one another to stay upright."); 
	output("\n\n<i>“The hell, stop moving so much!”</i> the rodenian girl stammers. You look back");
	if (pc.hasHair() && pc.hairLength > 4) output(", sweaty [pc.hair] noodling over your [pc.eyes]");
	output(", grinning and chuckling softly at the trio desperately trying to stay upright. Tails wrap around your two backmost [pc.legs] and hold you still. As if to complement their actions, you feel the flexing of a fist inside your [pc.pussy], and you slump forward. " + (silly ? "Face down, mare-ass up, just the way the galaxy likes it." : "Face-down, the near-hyperventilating thieves release exasperated sighs."));
	output("\n\n<i>“Better, now sit still so we can work. Unless you’d prefer we leave you like this?”</i> the [rat0.furColor]-furred rodenian scoffs.");

	output("\n\nOh whatever would you do if three tiny rats made the ill-conceived attempt to leave you alone and frustrated? It’s not like you can’t... <i>push them back against that wall, thus trapping them between a hard and a <i>very</i> moist place</i>. An almost sadistic sensation courses through your spine after smothering them with your [pc.ass]. The meek struggles rippling through your hindquarters only make you writhe against the noses buried in your [pc.pussyNoun] harder.");
	output("\n\nTheir vituperative squeals, muffled by your swampy horse-cunt, barely reach you. Before giving them air, you press them against the surface until their arms go limp, intent on grinding your dominant scent into their skin and fur, just to make extra sure they know who they belong to right now. You may not walk on two legs like most in the universe, but that doesn’t mean you aren’t in control of the situation.");
	output("\n\nAnd that situation, right now, is an emergency need for pussy worship.");

	output("\n\nYou shuffle forward, smirking as they fall forward against your groin, noses burrowed in your plush");
	if (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) output(" and puffy");
	output(" vulva, their slack mouths and supplicating tongues lapping up the juice your [pc.pussies] " + (pc.hasVaginas() ? "have" : "has") + " produced. <i>“D-don’t do that, come on, it was a joke!”</i> the halfbreed [rat2.boyGirl] whines, wiping her eyes of translucent webbing.");
	output("\n\n<i>“Y-yeah we would never do that!”</i> the mouse-boy whines. " + (pc.isBimbo() || pc.isBro() ? "<i>“That’s right!”</i> you declare." : "<i>“Good,”</i> you say."));

	if (pc.isBimbo()) output("\n\n<i>“Hehe, I’m glad I don’t have to use you like a couple of dildos, that’d have been, like, too much work for me! Now get those tongues nice and deep, I need to cum a lot more before I’m satisfied!”</i>");
	else if (pc.isBro()) output("\n\n<i>“Now get those tongues in there. Deep,”</i> you murmur.");
	else if (pc.isNice()) output("\n\n<i>“I was worried you were going to need some sort of punishment. Now, put those tongues to work,”</i> you wink. <i>“Nice and deep.”</i>");
	else if (pc.isMisch()) output("\n\n<i>“You three would make good dildos the way you are, but I don’t feel like frotting against a couple of ingrates,”</i> you huff. <i>“Now, slide those tongues inside as far as you can, really get into it. Or, you know...”</i>");
	else output("\n\n<i>“Next time you get any ideas, I’ll be rewriting your sense of smell.”</i> They visibly quiver, rapidly glancing between you and your cunny. <i>“Now, get to work, tongues in deep.”</i>");

	output("\n\nNot interested in cracking a joke now, the rodents take up position in and around your crotch");
	if (pc.hasCock()) output(", even attending your [pc.cocks] with their tails");
	output(". One tongue finds its way to the bottom of your labia, one to the top, and the other to the side. No amount of beading moisture is left unclaimed by frenzied mouths. Soft lips iron out the wrinkles of your dewy cuntlips, coming away gleaming with feminine syrup polluting the oxygen they circulate.");
	output("\n\nThe most tempting heist of all" + (pc.totalClits() > 1 ? " are your [pc.clits], beautiful [pc.vaginaColor]" : " is [pc.oneClit], a beautiful [pc.vaginaColor]"));
	if (pc.clitLength < 1) output(" bud");
	else if (pc.clitLength < 4) output(" protrusion");
	else output(" pseudo-cock");
	if (pc.totalClits() > 1) output("s");
	output(" of wonderfully sensitive flesh. You pinch your [pc.nipples]");
	if (pc.isLactating()) output(", squirting milk with lewd kneadings");
	output(", delighting in how hot you’re getting, waiting for the right moment to give yourself over to that awesome reserve of pleasure building inside. White-hot flashes from such teases make every flutter of your eyes a pleasant one.");

	output("\n\nYou grind your [pc.ass] against the rats faces, making it impossible for them to inhale any scant molecule of air that isn’t flavored with your [pc.girlCumNoun]. At this rate, you think you just might make them into permanent pussy worshipers who will want for nothing but fem-juice instead of things like food and water! <i>“Come on, harder!”</i> you laugh, but it’s hard not to moan like a whore between words.");
	output("\n\nYou slump forward again, human half crumpling to the floor and your [pc.ass] raised nice and high for those runts to get at. Your [pc.tongue] falls from your mouth as you feel all their fingers dive back into your oscillating interiors, tracing letters, shapes, numbers... basically, muscles flex and [pc.pussies] " + (pc.isSquirter() ? "squirt" : "drool") + ". There’s so much cunt to please and so many [pc.girlCumVisc] strands spurting out, dangling from the edges their faces.");
	output("\n\n<i>“Gahh... I can’t even breathe...”</i> one of them murmurs, and that makes you cum yet again. Another " + (pc.isSquirter() ? "forceful squirt" : "splash") + " of [pc.girlCumFlavor] fem-fluid marks them. Beads of [pc.girlCum] drizzle down your [pc.clits], also being sucked and nibbled on like sweet candied treats. Your");
	if (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) output(" pumped");
	output(" pussylips smother their smooth and furry faces with every new orgasm.");
	if (pc.isBimbo() || pc.isBro() || pc.libido() > 66) output(" Maybe when you get done here on Zheng Shi, you can keep these dutiful cunnilinguists as your desk-sluts? You’ll need plenty of ‘em when you get those probes!");
	
	output("\n\nTheir ribboned tails brush and squirm against your [pc.pussies], lathering themselves up to make the twirl around your [pc.clits] all the better. You cup your cheeks and let your wanton voice out. One rat has to dive between your legs just to keep you steady now, your backside wobbling and jiggling as if to entice a proper stud to fill your cunt with an unceasing flow of womb-squelching seed. Too bad for the rat-" + rat2.mf("boys", "boy") + ", you’re not interested in their meager cocks right now!");
	output("\n\n<i>“Cuh... come on... how have you not been satishffi-”</i> the rodenian’s snark trails off, silenced by your hypnotizing snatch. You’re as hot as a sun and as soaking wet as a galotian in a rainstorm. Everything’s so numb, but you can feel their skilled hands inside you, reaching for your cum-covetous baby factory, doing whatever they can to tease the hell out of your body and get you to finally calm down.");
	output("\n\nYour insatiable [pc.pussyNoun] is quite content with squeezing and caressing return, milking what it thinks is a cock. Skillful care falls apart into desperate attempts to force orgasm. You scream like an animal when two of them push down and your body instinctively jerks upward, the opposite pressures on your G-spot. You’re not sure what’s a finger, an arm, or a muzzle in your slobbery interior. As it is, you can’t care, because your love-tunnel is robbing the rest of your body of strength to fuel its voracious vacillations.");
	output("\n\nTheir efforts are seemingly about to pay off.");

	output("\n\nYou can no longer speak save for a bunch of incoherent gargles and weird half-sobs. " + (pc.hasHair() ? "You throw your [pc.hairs] out, shaking your head." : "You shake your head wildly.") + " <i>“Yesyesyes! That’s it!”</i> you shout. Your eyes seal shut along with your velveteen walls around the flesh and limbs of your entreated slit-servants. You squirt harder than ever, with the strength of a tidal wave, plastering the bandits with [pc.girlCum]");
	if (pc.hasCock()) output(" as your [pc.cocks] dribble underneath your belly, a puddle of musky [pc.cumNoun] forming in the throes of your feminine climax");
	output(".");
	output("\n\nEverything feels like you’re rocking on an ocean wave. A fist balls into a lump, knocking the wind out of your lungs. A finger rakes across the top of your vaginal muscle, and you spasm to its indelicate touch."); 
	output("\n\nYou finally fall to your knees, hyperventilating, basking in the potent scent you’ve filled this area with. It’s hard not to laugh as the spunk-scented bandits come marching around you again, absolutely drenched in [pc.girlCumVisc] [pc.girlCumType] from head to toe. If you didn’t know better, you’d think they just stepped out of a shower."); 
	output("\n\nIn a way, they did! They were just the ones to fix your leaky plumbing!");
	output("\n\nTheir faces are bright red and the expressions they wear tell a sexy story, but they all look pleased with themselves. The quick-witted bunch clean each other as best they can of your [pc.cumVisc] juices, glancing at you with a certain twinge of happiness in their colorful eyes.");

	ratsGirlCumComments();

	output("\n\n<i>“So, who do you think won this little game?”</i> you ask.");
	
	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW: output("\n\n<i>“Bah! With how many times you came, it’s a wonder you’re even asking that question!”</i> the rodenian waves you off. Isn’t that something?"); break;
		case RatsRaider.RAT_REP_MID: output("\n\n<i>“It’s not about thinking, it’s about knowing, and you know you’ve lost, [pc.mister] CEO!”</i> she scoffs. Yeah, whatever."); break;
		case RatsRaider.RAT_REP_HIGH: output("\n\n<i>“I’m not going to dignify that with a response!”</i> she grouses, but a knowing, cute wink tells you how she really feels."); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("\n\n<i>“Who cares about winning when we can just have a good time?”</i> she smiles, the other two doing the same."); break;
	}

	// Rats respect PC (goodCEO)
	if (ratsPCIsGood()) output("\n\nWhen they’re ready to go, they quickly gather their gear, redress, and get ready to go back to... whatever it is that they do. Before leaving, each of the rats gives you a wet kiss on the cheek, and you give them a headpat in return. <i>“See ‘ya later, [pc.mister] CEO! Let us know if you’d like to make a <i>donation</i> again!”</i>\n\nSoon sounds good.");
	// Rat Rep Low,Med,High
	else output("\n\nThe rats, after cleaning you - and themselves - of your orgasmic liquids, hurriedly collect their gear. The rodents spend a minute redressing, recriminating, and gearing up for their next job. Whatever that could possibly be. You sit up with a smirk, entertained by their backbiting.\n\n<i>“Be careful on Zheng Shi, okay!? You still have so much left that you owe!”</i> they wag their iniquitous fingers and disappear down the corridor.");
	
	pc.orgasm();
	rat0.loadInMouth(pc);
	rat1.loadInMouth(pc);
	rat2.loadInMouth(pc);
	IncrementFlag("RATS_TRIPLE_SERVICED");
	ratShower(pc);
	
	ratsVictoryFinish();
}

// [Fuck Them]

public function ratsOfMiceAndDoggystyle():void
{
	clearMenu();
	clearOutput();
	showRats();

	output("An idea already in mind, as imaginative as one of a timeless bonding between individuals can be, you reach down and start relieving the rats of their gear, blood rushing to your seething loins. You’re already intensely aroused at the prospect of lining them up on their hands and knees and having an all-access pass to ass.");
	if (ratsPCIsGood()) output("\n\nYou lean down to the half-rodenian [rat2.boyGirl]’s level and, mindful of [rat2.hisHer] big ears, you lift the rat’s helmet clean off. <i>“Oh, I see what you want,”</i> [rat2.heShe] quips. The [rat0.furColor] rodenian and the freckled mouse-boy both pull theirs off too, regarding you cutely while their ears wobble in the light. Since they’re so eager, you press your palms together.");
	else output("\n\nYou yank the helmet in your hands to immediate protest. <i>“Hey! At least watch the ears!”</i> the half-rodenian [rat2.boyGirl] cries, rubbing [rat2.hisHer] wobbly auricles with misty eyes. " + (pc.isAss() ? "Carrying on regardless of what they want, you pull the [rat0.hairColor]-haired rodenian girl’s off just the same," : "Acknowledging that request, you smile as you pull the [rat0.hairColor]-haired rodenian girl’s armor off with a little more care,") + " though the femmy mouse-boy to her left is quick to do the job for you. He tucks his hands and tail between his ample thighs, timidly shrinking back. Divested of their headgear, you toss the helmets in your arms aside and press your palms together.");

	if (pc.isBimbo()) output("\n\n<i>“Now that we’ve gotten past the boring parts, time for you to get that armor off and whatever’s under it!”</i> you order, wagging a finger" + (pc.isNude() ? "." : "as you shake out of your [pc.gear].") + " <i>“We’re going to have some fun!”</i>");
	else if (pc.isBro()) output("\n\n<i>“How’s about you get out of that armor and I make a better kind of donation?”</i> you grin" + (pc.isNude() ? "." : ", already tossing your [pc.gear]."));
	else if (pc.isNice()) output("\n\n<i>“Alright, now get undressed. This is the least you three can do to make up for trying to mug me. And, I do mean everything...”</i> you gently command" + (pc.isNude() ? "." : ", already squirming out of your [pc.gear]."));
	else if (pc.isMisch()) output("\n\n<i>“Listen up, I expect you all to get out of that armor and whatever’s under it. Time for you three to give back a bit yourselves!”</i> you grin" + (pc.isNude() ? "." : ", already tugging your [pc.gear] off."));
	else output("\n\n<i>“Get naked”</i> is all you say, pointing ominously at the trio." + (pc.isNude() ? " You are out of your [pc.gear] before they are." : ""));

	output("\n\nRunning a lusty hand down to your crotch, you grip and gently pump your [pc.cockOrStraponFull] to raw and ready horniness. You aim the " + (pc.hasCock() ? "[pc.cockHeadNoun]" : "translucent tip") + " at them");
	if (pc.hasCock()) output(", musky leakage draining from your " + (pc.hasCocks() ? "cumslits" : "cumslit") + " in long, telltale threads");
	output(".");

	if (flags["RATS_POUNDED"] == undefined) output(" <i>“Ugh... fine, whatever...”</i> the lead rodenian scoffs. <i>“Just... don’t go near my ears! Don’t you dare!”</i>");
	else
	{
		switch (ratputation())
		{
			default:
			case RatsRaider.RAT_REP_NONE:
			case RatsRaider.RAT_REP_LOW: output(" <i>“Right... we understand. Just don’t do anything else! And don’t bring that thing near my ears!”</i> the lead rodenian barks."); break;
			case RatsRaider.RAT_REP_MID: output(" <i>“Yeah, I guess we should have seen that coming, but don’t think you’re going to be able to do as you please in the future!”</i> the rodenian girl quips."); break;
			case RatsRaider.RAT_REP_HIGH: output(" <i>“Alright alright, but just you remember, [pc.mister] CEO, that we’re not easily discouraged by defeat!”</i> the rodenian grins, as if accepting your challenge."); break;
			case RatsRaider.RAT_REP_GOOD_CEO: output(" <i>“Oh, you want us that badly?”</i> the rodenian smiles and blushes. <i>“Alright, I guess you earned this...”</i>"); break;
		}
	}
	
	output("\n\nThe " + (ratsPCIsGood() ? "joyful rats" : "fussy outlaws") + " stand and fidget obsessively with the fittings and fastenings of their armor, which they have to take apart piecemeal in some places. First they remove their shoulder pads, then their arm and leg coverings, and finally slip out of the main suit itself, letting it all fall to the ground with a noisy clank. Left in their black undergarments, tight fitting one-piece suits, you note the grunginess and poor state of that ‘comfort’ wear as they carefully peel it off. In defiance of their meticulous undressing, the worn out suits rip and split in the right spots, leaving them appropriately exposed. " + (ratsPCIsGood() ? "<i>“Crap... Well uh...”</i> they murmur before deciding to take it all off." : "<i>“Dammit...”</i> they grumble, realizing they have to take everything off now."));
	output("\n\nSweat-glistening skin, damp fur, and engorged genitals are soon bared to you " + (ratsPCIsGood() ? "in an impromptu strip-tease by the flirtatious bunch. Cute." : "after an impatient tossing of now useless gear.")); 
	output("\n\nWith the weight of their gear off them, they all shiver and sigh in relief, at the very least happy to be unburdened as they sink to their knees again.");
	if (pc.hasPheromones()) output(" On their next breath, however, you get the feeling they just caught a particularly potent wind of your hormone-igniting aura, and you can see nipples and dicks hardening at the libidinous scents in the air.");
	output(" They stare pointedly at your [pc.cockOrStraponFull] with wide pupils, mentally prepping themselves.");

	if (pc.hasCock())
	{
		if (pc.longestCockLength() < 7) output("\n\n<i>“At least you’re not like one of those smelly rabbits with the huge cocks... so whatever you’re planning...”</i> The rodenian’s voice trails off watching a rope of pre drip from your [pc.cocks]. <i>“Just... Just get this going!”</i>");
		else if (pc.longestCockLength() < 13) output("\n\n<i>“G-geez... Are you going to put that in one of us? Be careful, please... We’re not like those weird robot cats or those stupid, smelly rabbits.”</i> Despite their timid requests, they can’t look away from your [pc.cocks]. Their gleaming eyes give away their excitement.");
		else output("\n\n<i>“You’re not... Hey, listen, just watch how you use that, okay? I don’t want to be walking weird after this! We’re not like those smelly rabbits or robo-cats!”</i> the rodenian girl barks. They look nervously at your sheer girth, watching a tempting strand of pre drip to the ground. Behind their apprehension, however, you think you see a hint of anticipation...");
	}

	output("\n\nTime to set them up... Where to begin, where to begin?");

	addButton(0, "Doggystyle", ratsFuckThemOneRatAtATime, undefined, "Doggystyle", "Line the rats up on all fours, inspect the goods, and see which one’s worth a ride.");
	// PC has three or more 13in cocks 
	var fittingCocks:int = 0;
	for each (var cock:CockClass in pc.cocks) if (cock.cLength() > 12) ++fittingCocks;
	if (fittingCocks > 2)
	{
		output("\n\nA profoundly exciting thought hits your brain like a brick. Three rats, three holes... and three dicks twitching and dribbling wasted pre beneath your [pc.legOrLegs]. They all look just small enough to stack on top of each other... <i>and fuck them all at once</i>. You’ve probably got the length to make it work!");
		
		addButton(1, "Stack ‘Em", ratsOnRatsForVoraciousFucks, undefined, "Stack Them", "You’ve got three well-endowed dicks. There are " + rat2.mf("at least three", "four") + " holes available to you between each mouse-ass. If you’re feeling creative... you could stack the rats on top of each other and take ‘em all at once!");
	}
	else addDisabledButton(1, "Stack ‘Em", "Stack Them", "You need three sizeable dicks swinging between your [pc.legOrLegs] to be able to attempt this.");
}

//Doggystyle

public function ratsFuckThemOneRatAtATime():void
//and it didn’t cost me a dime...
{
	clearMenu();
	clearOutput();
	showRats(-2, true);
	processTime(5);
	
	if (pc.isBimbo()) output("<i>“Alright cutie, come here!”</i> you smile happily.");
	else if (pc.isBro()) output("<i>“Now just sit right there, and let me handle this,”</i> you gruffly order.");
	else if (pc.isNice()) output("<i>“Before we start...”</i> you whisper, making no effort to hide the silly smile on your [pc.face].");
	else if (pc.isMisch()) output("<i>“Three little obedient mice all to me, whatever will I do to satisfy all of them?”</i> you grin.");
	else output("<i>“At least you can follow directions,”</i> you husk.");

	output("\n\nYou lean down to the rodenian girl, running a hand across her head, delighting in her soft coos at your libertine touch from muzzle to chest. You gingerly grope the rat’s perky boobs, lifting, squeezing and cupping before pulling those pert mounds of pillowy goodness by the erect [rat0.nippleColor] nipples capping them. Her ratty tongue lolls in the pleasure of it, and for a moment, it seems like she’s forgotten all about the previous scrap.");
	output("\n\nEagerness shines in her [rat0.eyeColor] eyes as she gives herself over to you right away, thrusting her hand-filling chest into your expert fingers. The [rat0.furColor] rat wordlessly - but not quietly - enjoys your body too: the lilting slut can’t keep her hands off your [pc.cockOrStrapon]!");
	if (pc.balls > 0) output(" When her warm fingers adoringly grasp your [pc.sack], you step forward just a bit, helping her get both paws on your [pc.balls].");

	output("\n\nFor just a few seconds longer you molest her. After all, you’re not here for a handy. You catch her off guard - <i>“Wha-!”</i> she yelps - when you lift and spin her around by those small shoulders. You gently push her down so that she has her head a bit lower than her plump ass, those furry, rippling globes now raised and perfectly aligned with your [pc.cockOrStrapon]. It’s... It’s just a beautiful ass, bigger than the others by lusciously noticeable margins."); 
	output("\n\nYou look to the mouse-boy and the half-rodenian to either side and tilt your head at the anxious thief below. <i>“You two!”</i> you " + (pc.isAss() ? "bellow" : "announce") + ", breaking the other two from their enchantment. <i>“Get nice and close to her, on all fours.”</i>");
	output("\n\n" + (ratsPCIsGood() ? "<i>“Alright!”</i> they beam, hurriedly taking up position next to their leader." : "<i>“Umm, okay...”</i> they murmur, flipping over and getting into position.") + " The cute rodenian, now sandwiched between her partners in crime, moans and wiggles her ass in your direction, trying to inch it closer to " + (pc.hasCock() ? "your musk-dripping [pc.cockNounSimple]" : "your holo-dong") + ".");

	output("\n\nHer forceful wriggling encourages the others to join in, and you soon have three rats presenting their asses to you, coarse tails weaving sensuously around them; three hypnotic butts sway to a gorgeous rhythm that makes your " + (pc.balls > 0 ? "[pc.balls]" : "loins") + " clench. Back and forth; soft skin swells and swishes... Back and forth they whine for your attention, impatient tails smacking against submissive butts. The way that skin molds when two butts sink into each other...");
	if (flags["RATS_POUNDED"] != undefined) output("Damn... it looks better in person than it did in your imagination!");
	else output("You almost don’t want to interrupt, the building pressure could make you cum just from watching this long enough...");

	output("\n\nYou give those delicious derrieres a playful slap, making the trio yelp and squeak as droplets of sweat fly off after thunderous impact. They’re just asking for it! <i>SMACK</i> - your hand rebounds off the left hemispheres, and then the rights with a dominant <i>THWACK</i> of skin against [rat1.skinColor] assflesh and short [rat2.furColor]-furred rump. ");
	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW: output("<i>“Ohh come on... Don’t tease us forever, " + ratsMisterCEO() + "! If you’re gonna do something, do it now!”</i> the rodenian girl groans, her sultry voice betraying her masochistic wants."); break;
		case RatsRaider.RAT_REP_MID: output("<i>“Come on, this isn’t fair, [pc.mister] CEO! Just fuck us already, th... this is just cruel!”</i> the rodenian girl whines, but the way she thumps her thick ass into your dick betrays her desires."); break;
		case RatsRaider.RAT_REP_HIGH: output("<i>“Yeah! Uh, keep that up!”</i> the mice all shout together, then burrow their heads. <i>“Ummm, wait... Just fuck us!”</i> they say."); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("<i>“[pc.Mister] CEO, you can hit harder than that!”</i> the rodenian girl yells. She lifts up and looks back at you with the sexist grin you’ve ever seen. <i>“And I better be first!”</i>"); break;
	}

	output("\n\nYou give them each a gentle rub, kneading the soreness away from appreciative butts before teasing their tailholes. One finger adventures over each hole" + rat2.mf(".", " and the half-rodenian’s moist, pink slit.") + " The mouse-boy jerks his dripping phallus, using his tail to caress his partners, and vice versa. They exchange arousing affections as they wait for yours, the most important of all."); 
	output("\n\nTaking your [pc.cockOrStraponFull] in hand, you slap the rodenian girl’s butt with it - chuckling at her pleading gyrations - and decide...");

	ratsDoggystyleChoices();
}

	//If you have to read this function, I am so sorry -lighterfluid
public function ratsDoggystyleChoices(cockId:int = 0, rounds:int = -1, lastRat:RatsRaider = null):void
{
	if (++rounds > 0)
	{
		pc.orgasm();
		if (lastRat == rat2 && lastRat.isFemale()) lastRat.loadInCunt(pc, 0);
		else lastRat.loadInAss(pc);
		processTime(10+rand(11));
		addButton(14, "All Done", ratsEnoughRatFuckingForNow, rounds, "All Done", "You’ve had your fun, so it’s time to move on.");
	}
	
	if (lastRat)
	{
		lastRat.createStatusEffect("Rat Fucked");
		if (lastRat == rat0)
		{
			addButton(5, "Round Two", ratsWeMustGoDeeperIntoRodenianButt, [cockId, rounds]);
			IncrementFlag("RATS_POUNDED_RODENIAN");
		}
		else if (lastRat == rat1)
		{
			addButton(6, "Round Two", ratsOhNoImStuckInMouseBoy, [cockId, rounds]);
			if (flags["RAT_ANUSES_TAKEN"] == undefined) flags["RAT_ANUSES_TAKEN"] = 0;
			flags["RAT_ANUSES_TAKEN"] |= 1<<lastRat.ratVariety;
		}
		else if (lastRat == rat2) addButton(7, "Round Two", (rat2.isMale() ? ratsKeepPlayingFaccaratBoy : ratsGettingFuckedInThePussyForever), [cockId, rounds]);
	}
	
	if (rounds > 0 && false)
	{
		addDisabledButton(0, "Roden. Girl", "Rodenian Girl", "The spirit may be willing, but you need rest.");
		addDisabledButton(1, "Mouse Boy", "Mouse Boy", "The spirit may be willing, but you need rest.");
		addDisabledButton(2, "H.Roden." + rat2.mf("Boy", "Girl"), "Half-Rodenian " + rat2.mf("Boy", "Girl"), "The spirit may be willing, but you need rest.");
		return;
	}
	
	if (rat0.hasStatusEffect("Rat Fucked")) addDisabledButton(0, "Roden. Girl");
	else addButton(0, "Roden. Girl", penisRouter, [function(cockId:int):void { ratsRodenianal((pc.hasCock() ? cockId : -1), rounds); }, rat0.analCapacity(), false], "Rodenian Girl", ["Fuck the [rat0.furColor]-furred slut in her butt. Take her first just like she wants!", "It’s the [rat0.furColor]-furred slut’s turn, now!", "You saved the best for last!"][rounds]);
	
	if (rat1.hasStatusEffect("Rat Fucked")) addDisabledButton(1, "Mouse Boy");
	else addButton(1, "Mouse Boy", penisRouter, [function(cockId:int):void { ratsBoyStealsCockIntoHisButt((pc.hasCock() ? cockId : -1), rounds); }, rat1.analCapacity(), false], "Mouse Boy", ["Fuck the mouse-boy’s butt. Gently.", "It’s his turn now!", "You saved your last load for him!"][rounds]);
	
	if (rat2.hasStatusEffect("Rat Fucked")) addDisabledButton(2, "H.Roden." + rat2.mf("Boy", "Girl"));
	else if (rat2.isMale()) addButton(2, "H.Roden.Boy", penisRouter, [function(cockId:int):void { ratsFuckASlutBoy((pc.hasCock() ? cockId : -1), rounds); }, rat2.analCapacity(), false], "Half-Rodenian Boy", ["The half-rodenian boy needs some butt loving.", "This slutty mouse needs some love, too.", "One more butt... can you do it?"][rounds]);
	else addButton(2, "H.Roden.Girl", penisRouter, [function(cockId:int):void { ratsFuckedRightInThePussy((pc.hasCock() ? cockId : -1), rounds); }, rat2.vaginalCapacity(), false], "Half-Rodenian Girl", ["You’ve got your eye on that gleaming cunt...", "You can’t quite get your eyes off this girl’s moist crotch...", "This girl’s got two holes to stuff. Hopefully you’ve got enough left!"][rounds]);
}

public function ratsRodenianal(cockId:int, rounds:int):void
{
	clearMenu();
	clearOutput();
	showRats(0, true);

	switch (rounds)
	{
		// First choice
		case 0:
			output("Why not give the cock-hungry bandit what she wants? The rat-slut wants to be first! <i>“Haayesss!”</i> the rodenian squeals as you grip her hips; she bounces up and down, immediately curling her aroused tail around your [pc.belly] to close the gap. Your [pc.cockOrStrapon " + cockId + "] thrusts into the sinfully warm valley of her ass-cleavage");
			if (cockId != -1) output(", lubricating her furry canyon with copious amounts of boiling pre-seed");
			output(". She cranes her neck to meet your [pc.eyes], bitten lower lip and all! <i>“Come on, I can take you, " + ratsMisterCEO() + "!”</i> she winks.");
			break;
		// Second choice
		case 1:
			output("Perking up at your touch, the rodenian girl winds her arousally-weakened tail around your [pc.belly]. She squeals at the sensation of your [pc.cockOrStrapon " + cockId + "] thrusting between her fuzzy ass-cheeks");
			if (pc.hasCock()) output(", [rat0.furColor] fur already matting from the deluge of sticky pre you’re lubricating her with");
			output(". <i>“I wanted to be first...”</i> she murmurs, looking back to you mournfully. <i>“B-but... I’m still horny! Come on, " + ratsMisterCEO() + ", just do it already!”</i> she cries, thrusting her curvy butt into your crotch with a shrill moan, putting some blood-pumping pressure on your girth.");
			break;
		// Third choice
		case 2:
			output("Despite having cum once or twice, the rodenian girl remains upright and prostrate with pearly cords dripping from her ears. She about screams for joy when you grip her supple, furry globes and thrust your [pc.cockOrStrapon " + cockId + "] into the hot and damp shroud of her fuzzy ass-cleavage. You drag your nails against her skin, shaking her from her orgasmic stupor. The rat’s aroused tail winds around your [pc.belly] in a flash, clinging to you like a lost puppy. <i>“F-finally... P-please don’t leave me out, I need to cum for real!”</i> she whines, desperately bumping her ass into your crotch.");
			break;
	}

	output("\n\nOne [pc.finger] dips into her canyon and swirls around her sphincter -- sliding in is easy thanks to the accrued sweat. The throbbing tip of your tool hovers so close to plugging her, a pleasant rush of warmth flows through your loins every passing second.");
	output("\n\nYou push two fingers in, spreading your rodenian wider just inches away from your [pc.cockOrStraponHead " + cockId + "]. Suddenly, the rat-slut pushes back, spearing herself on your straining " + (cockId < 0 ? "holo-phallus" : "phallus") + " and smushing her ass into your pheromone drenched belly");
	if (pc.hasFur()) output(" fur");
	else if (pc.hasScales()) output(" scales");
	output(". Caught off guard");
	if (flags["RATS_POUNDED_RODENIAN"] != undefined) output(" again");
	output(", you flounder and inhale through clenched teeth. Her shudderingly satisfied butt swallows up more of your member, and you hastily take her by the shoulders to mount her, pressing her head down further as she grinds your [pc.cockOrStrapon " + cockId + "] deep into her cavern."); 
	
	pc.cockChange();
	
	output("\n\n<i>“Ohhh, bet you weren’t ready for that, " + ratsMisterCEO() + "!”</i> she moans, the constrictions of her tail matched with those of her tightening rectum.");
	output("\n\n");
	if (flags["RATS_POUNDED_RODENIAN"] == undefined) output("You tacitly admit you weren’t. <i>“A thousand credits s-s-says you won’t be able to handle me!”</i> she giggles. You’ll definitely see about that.");
	else output("<i>“Oh, but I was. I know how much you rats like it in the ass,”</i> you reply, chuckling with her.\n\n<i>“Well then don’t waste any time!”</i> she exclaims.");
	output("\n\nYour [pc.cockOrStraponHead " + cockId + "] brushes against her innermost walls. A pervasive heat envelops your whole body, not just your [pc.cockOrStrapon " + cockId + "]. Every light jerk, every powerful pulse, every relaxed, idle motion stokes a fire in every nerve of your body all at once. You haven’t even started railing this mouse-bitch and you feel like you’ve been fucking her for... <i>hours</i>. Although you’re buried in her butt, a compelling buzz in the back of your mind makes you perceive this as the raunchiest sex imaginable. A slow thrust is somehow five rapid pumps.");
	output("\n\nIt’d be unnerving if it wasn’t so erotic.");
	
	output("\n\nWhen you blink, that once benign fantasy becomes <i>exquisitely</i> real in the darkness of your eyelids. Her [rat0.furColor] fur seems to glow <i>brighter</i> in your sightlessness, and your vision is overwhelmed by the shape of her figure against an inky, sexual void. Droplets of cum, girlcum, lube, all the effluent you can imagine rain down around you. Sound fades into a murky dissonance, replaced by the lurid impacts of [pc.raceShort] crotch against rodenian assflesh, driving in and pumping out with reckless abandon.");
	output("\n\nHallucinations that <i>feel</i> and <i>look</i> like the real thing..."); 
	output("\n\nNext to you, the same rat-girl stands stark naked, smiling sweetly at you. Her face twists when your groins slaps into her, but her expression is full of love - for you, and for what you’re doing. Wherever you turn your head, the mesmerizing glow of her radiant fur is there. Every twitch in your eye is steadied when [rat0.eyeColor], dizzying eyes meeting yours, bond with yours... <i>Become yours.</i>");

	output("\n\nWhen you open your [pc.eyes], you’re simply still, and the twinge of fear vanishes. The coy rat is rolling her hips, taking you on a hyper-smooth, spellbinding ride");
	if (rounds < 2) output(" cushioned by the other " + (rounds == 0 ? "two who shamelessly grope her and themselves via anus-seeking tails" : "rat who shamelessly gropes her and masturbatory-minded fingers" + (rat1.hasStatusEffect("Rat Fucked") ? rat2.mf("himself", "herself") : "himself") + " via an anus-seeking tail and masturbatory-minded fingers"));
	output(". The eye-crossing pressure morphs into a relaxing tingle that fades when you shake your head, leaving you feeling utterly satisfied.");
	if (pc.hasVagina())
	{
		output(" You realize part of the warmth you feel came from the spine-shivering orgasm evidenced by the streams of [pc.girlCumNoun] flowing down your [pc.legOrLegs]."); 
		if (rounds < 2) output(" The fruits of your [pc.pussyNoun] are delivered to " + (rounds == 0 ? "hungry mouths by expertly controlled tails." : "a hungry mouth by an expertly controlled tail."));
	}

	output("\n\n" + (flags["RATS_POUNDED_RODENIAN"] == undefined ? "Confused" : "Befuddled") + ", but no less " + (cockId >= 0 ? "erect" : "horny") + ", your gentle outstroke evokes a lengthy whine from the chubby-eared pirate. The insensate minx mauls her chest, pinching and tugging [rat0.nippleColor], lust-swollen nipples as if to milk herself. Twinkling buds of perspirant leap from her peaks as more roll down and over. She successfully drains her lungs of air in a louder scream. <i>“Yeahyeahyeah fuck meeeeeeeeeeeee”</i> she cries, tail tensing and claws digging into the ground.");
	output("\n\nYour first real thrust into the rodenian fills your mind with lurid images. Her accommodating ass makes it easy for you to settle into a pleasantly moist rhythm");
	if (cockId >= 0 && pc.cocks[cockId].volume() > 150) output(", even for your " + (pc.cocks[cockId].volume() < 300 ? "immense" : "monstrous") + " size");
	output(".");
	if (pc.balls < 0) output(" Your [pc.sack] is hardly left alone: your mouse-slut’s tail juggles your [pc.balls] insistently, giggling when she feels your pouch sag like a " + (pc.ballSize() >= 8 ? "rock" : "boulder") + ".");
	output(" Her fur glows vividly... <i>divinely</i>! The shimmering [rat0.furColor] keeps your breathless gaze locked on her. Are you fucking a goddess? Who knew heaven would be so mouse-like...");

	// PC has pussy
	if (pc.hasVagina())
	{
		output("\n\nThe rodenian’s tail");
		if (rounds < 2) output(" (and those of her friends)");
		output(" dip between your [pc.thighs], caressing the delicate clusters of muscles therein. Coarse tendrils frot against your [pc.pussies], threading your glazed pussylips like its a runway. Your [pc.clits] " + (pc.totalClits() == 1 ? "receives" : "receive") + " equal attention in the form of loving prods");
		if (pc.clitLength >= 1) output(", though the size of your ultra-sensitive clitoral nub" + (pc.totalClits() == 1 ? " serves as a fine ledge for " : "s serve as fine ledges for ") + (rounds >= 2 ? "it" : "them") + " to wrap around");
		output(". You moan from the brutishness, wrenching under the wild assault.");
		if (rounds >= 2) output(" It winds in and out on either side, lubricating its entire length in your juice.");
		else output(" They take turns going in and out, their paces uneven. You feel as if you’re riding a wooden horse with every thrust...");
	}

	output("\n\nYou ream her, faster, faster, and faster still");
	//PC has unused cock
	if ((cockId == -1 ? pc.hasCock() : pc.hasCocks()))
	{
		output(", your extra [pc.cocks] bouncing uselessly around her ass");
		if (rounds < 2) output(", though " + ((cockId == -1 ? pc.hasCocks() : pc.cocks.length > 2) ? "they are" : "it is") + " at least frequently serviced by the other rat’s tails. Those stimulations add further offerings of [pc.cumColor] pre-seed to the fire");
	}
	output(". You feel every part of your rat’s silky walls clenching down on your [pc.cockOrStrapon " + cockId + "]; a euphoric cocktail of bliss, of dominance, and of a fuzzy, syncopathic connection explodes out of your brain.");

	output("\n\n<i>“I feel sooo good");
	if (ratsPCIsKnown()) output(", [pc.mister] CEO");
	output("...”</i> she murmurs, though what is a whisper to others is a thought beamed directly to your brain. <i>“I be... bet you think... that... umf,”</i> she cranes her head, looking at you from the front and certainly every other angle. There’s an afterimage in her eyes that captures and cages concentration, <i>“that you won. Haaaa you didn’t!”</i>");
	output("\n\nSynapses overwhelmed by her angelic signature, you become one with her in this very moment. It’s not a powerful effect by any means, you think you could even dispel it as easily as a lucid dream... but why would you do that? Why wouldn’t you take hold of her delicious curves, surrender yourself to the bliss with her?");
	if (flags["RATS_POUNDED_RODENIAN"] == undefined) output("\n\nYou’re now certain that something is not as it seems with this rodenian. You’re");
	else output("\n\nSomething isn’t quite as it seems with this rodenian, though you’re still");
	output(" not sure if that’s intentional. Besides, it feels much too good to put a stop to!");

	switch (rounds)
	{
		//First choice
		case 0:
			output("\n\nThe other rat’s revelries break you from your momentary trance as they climax next to you, brought to orgasm by milking tails. White hot cum spurts from the mouse-boy’s cock, " + rat2.mf("and the half-rodenian boy to your left groans as his balls churn out a sad load that puddles beneath his healthy body", "and the halfbreed girl to your left squirts once, then twice, howling in satisfaction as a prehensile dildo wriggles free of her gushing gash") + ". You find yourself wound up in rat tail again, the sex-coated tips working around your crotch");
			if (pc.balls > 0) output(", kneading your [pc.balls]");
			output(" and teasing their leader’s spread hole.");
			break;
		// Second choice
		case 1:
			if (rat2.hasStatusEffect("Rat Fucked")) output("\n\nThe mouse-boy’s orgasm breaks you from your mental fixation, cum firing off between his legs spurred on by the rodenian’s girth-encompassing tail. You thrust a few fingers into the mouse-boy’s asshole, making him cum again at the abrupt intrusion.");
			else output("\n\nThe " + rat2.mf("mouse-boy’s", "mouse-girl’s") + " orgasm breaks you from your mental fixation, " + rat2.mf("cum firing off between his legs spurred on by the rodenian’s girth-encompassing tail", "girl-cum splattering legs and ground both, arousal stirred by two pussy-penetrating tails") + ". You thrust a few fingers into the half-rat [rat2.boyGirl]’s " + rat2.mf("asshole, making him", "cunt, making her") + " cum again at the abrupt intrusion.");
			break;
	}
	
	output("\n\n<i>“H-here, w-wait...”</i> Your anal-puppet looks back to you, eyes half rolling back. She grabs one of your hands and guides it to her ear. The bandit keeps her head still as your fingers, no, your entire knuckle slips into her aural canal. <i>“Ohhhh yessss oh that’ssssssssssssshhhh-”</i> she moans herself hoarse, tongue tumbling out past her big front teeth."); 
	output("\n\nHer ear-gina squeezes and slathers your hand in its uniquely alien way, undulating inward just like any other pussy would on what it hopes is a cum-bearing visitor. When you plunge deep inside its smooth and frictionless tunnel, your wrist is held in place by her contracting head-cunt. The strangeness of that and her mental effect makes your whole body into an erogenous zone.");
	output("\n\nThe rat’s ears, her butt, they’re simply pleasure-passages that have no end. The further you sink into her, the closer you feel to her on a level that you just can’t define...");
	
	output("\n\nRising up, you steady her shoulder with your other hand and pressing her closer to the ground by proxy. Her stretched ass is easily hammered, spreading more and more with every balls deep thrust. You shift again just a bit, wrapping " + indefiniteArticle(pc.armDescript()) + " around her chest, hugging her boobs (and her of course) close as you fist her ear and pump your [pc.cock] into her moistened butt-pussy. Breathlessly, you submit to the carnal aura coaxing your brain to one action: pounding this sopping mouse into the dirt.");
	
	output("\n\nThe rodenian’s charming glow strengthens, and with it the soothing effect it has on you. You rail the mesmerizing rat with unparalleled speed - each thrust is multiplied by the minutes that have passed, the tightness of her colon lending to the painful swell you feel in your " + (pc.hasCock() ? "[pc.cocksLight]" : "[pc.cockOrStrapon]") + ". You snuggle closer, breathing in her perfume-like scent" + (pc.hasBreasts() ? ", grinding your [pc.breasts] into the contours of her back" : ", your [pc.chest] contouring to the curves of her back") + "; you jerk your hand in any direction within her slathering ear-cunt, doing your damndest to satisfy her cum-gushing fuck-tunnel while diaphragm-rending squeaks spiral down your [pc.ear].");
	output("\n\nEvery breath you take is strangely clear and cool, but not cold enough to dull your insatiable lust for more of her. Fucking her ass becomes less of a sexual desire and more of a neurological need. You submerge yourself in the erotic sensations arcing between your horny neurons, trying your best to meet the [rat0.eyeColor] eyes of the [rat0.furColor] buttslut on the end of your distended " + (cockId >= 0 ? "[pc.cockType] " : "holo-") + "tumescence. You dive straight into her, nuzzling her head with yours, pushing your [pc.cockOrStrapon " + cockId + "] all the way in as you fall into your arousal now boiling over");
	if (pc.hasKnot(cockId)) output(", careful to avoid knotting her");
	output(".");
	
	var cumQ:Number = pc.cumQ();
	// PC hardlight
	if (cockId == -1)
	{
		output("\n\nYour hardlight strapon is designed to send powerful signals to your nerves with even the slightest touch. But incredibly, you don’t feel that pressure, you don’t wince nor do you struggle with your pliant mouse. Your otherworldly orgasm is matched perfectly with hers, and your bodies rock together as if floating on a pleasant wave");
		if (pc.hasVagina()) output(", your [pc.pussies] " + (pc.isSquirter() ? "thrusting sizzling shots of [pc.girlCum] out onto the ground" : "oozing [pc.girlCum] in the background of it"));
		output(". You and she both sigh, closing your eyes, basking in the closeness you share fleeting as it might be...");
	}
	// PC low cum
	else if (cumQ < 100)
	{
		output("\n\nYou sigh happily - there is no intense pressure in your ejaculation. Every spurt of [pc.cum] out of your [pc.cocksLight] is... easy. Maybe in reality it isn’t. Maybe you’d be grunting appreciatively, flexing and jerking inside her. But by some strange power you’ve melded with her, and your orgasms are mutual and incomparably satisfying. You pump slowly, cradling her head");
		if (pc.tallness >= 6*12) output(" to your chest");
		output(" as cum spills out from her unfucked ears, painting her colon [pc.cumColor] with [pc.cumVisc] [pc.cumNoun].");
		if (pc.hasCocks()) output(" Your extra " + (pc.cocks.length > 2 ? "dicks" : "dick") + " push out their ample loads on and around her curves, the seed-filled fluid soaking into her fur and the other mice surrounding you.");
	}
	// PC plenty of cum
	else if (cumQ < 500)
	{
		output("\n\nThe volume of your ejaculation is enviable. You don’t feel at all pressured by the thick ropes forcing their way out of your ballooning tip. You don’t grunt, you merely sigh contentedly, softly moaning as you cradle her juice-dripping head"); 
		if (pc.tallness >= 6*12) output("to your [pc.chest]");
		output(". Your [pc.cock " + cockId + "] flexes powerfully inside, coloring her bowels [pc.cumColor] with [pc.cumVisc] [pc.cumNoun] while creamy rat juice spills from the brims of her ears. Your orgasms are perfectly synced, and inexpressibly pleasant.");
		if (pc.hasCocks()) output(" Your unholstered " + (pc.cocks.length > 2 ? "dicks grind and press" : "dick grinds and presses") + " at her ass, dumping long, girthy lines of [pc.cumFlavor]-flavored seed onto her ass and the other rats nearby.");
	}
	// PC lots of cum
	else
	{
		output("\n\nYou expected a powerful orgasm, but in its place is an equally powerful sense of tranquility. Your [pc.cocks] throb rigidly, the sensations thick and breathtaking. Yet... you don’t feel pressured at all; you neither grunt nor groan. Together with this rat, you sigh softly, feeling her belly swell into a shapely bump, an outcome that fulfills a primal need somewhere in your mind.");
		output("\n\nHer synced orgasm is an ethereal joy without equal. Her emissions are as noticeable as yours; your [pc.cocksLight] blast out a deluge of [pc.cumVisc] [pc.cumNoun]. Ropes of spooge surge without pause, acting as a wave you and she float on atop an orgasmic ocean.");
		if (pc.hasCocks()) output(" Your unslotted " + (pc.cocks.length > 2 ? "cocks" : "cock") + " pump puddles of [pc.cumFlavor]-flavored seed out onto the other mice, flooding the local area with a musky scent of you.");
	}

	output("\n\nUpon withdrawing your hand from the spent rodenian, you find it glazed like a caramel apple in her sweet-smelling alien jizz. She falls off your [pc.cockOrStrapon " + cockId + "], crashing to the ground with mad pants, her body going limp from exhaustion. The mental influence you felt disperses in the way it came, leaving you feeling somewhat hollow, especially with that lovely smile having diffused with it...");

	addButton(0, "Next", function():void
	{
		clearMenu();
		clearOutput();
		showRats(-2, true);
		
		output("When you catch your breath,");
		switch (rounds)
		{
			case 0: output(" you glance at the other two mice, wondering if you’re ready for round two...\n\nIn the middle of sizing up your other options,");break;
			case 1: output(" you glance at the last mouse, wondering if you’ve got it in you for one last round.\n\nIn the middle of sizing up your other options,");break;
			case 2: output(" you glance proudly at the crumpled bandits, totally worn out by your ironclad endurance.\n\nAnyone else would move on after plowing three lovers so thoroughly. However,");break;
		}
		output(" you can’t help but feel you want to go again with this rodenian. The terrifically fuzzy feeling conjured during coitus begs you back. Still, you get the feeling if you embraced her like that one more time you’d not stop fucking until you were both passed out. But that wouldn’t be so bad, would it?");	
		
		ratsDoggystyleChoices(cockId, rounds, rat0);
	});
}

public function ratsWeMustGoDeeperIntoRodenianButt(args:Array):void
{
	clearMenu();
	clearOutput();
	showRats(0, true);
	var cockId:int = args[0];
	var rounds:int = args[1];
	processTime(5);

	output("No two ways about it, you want her again, and you want her now.");
	output("\n\nWhen you touch [pc.skinFurScalesNoun] to rodenian curves, her ears flare and her tail flexes to life again. <i>“W-w-what...?”</i> she whimpers. <i>“W-woah, b-but I...”</i> You pull her up on all fours again, huffing through your nostrils. You stare at her");
	if (cockId != -1) output(" cum-dripping");
	output(" colon and line yourself up again, silencing her with a quick and sore motion.");
	output("\n\n<i>“Ah! You’re not-”</i> You hammer her balls deep, forcing a yelp up her throat that mingles with a prolonged grunt. Muscles ache and beg for rest, but your mind yearns for that heavenly contact again. Regardless of what the body wants, the heart and soul wish to intertwine with that what made it feel so good. The friction of your outstroke is a little painful on your [pc.cockOrStrapon], but what you want comes right away.");

	output("\n\n<i>“");
	if (ratsPCIsKnown()) output("[pc.Mister] CEO, ");
	output("I-I don’t think I can...”</i>");
	output("\n\nYou can. Your prong glides in and out of her wrinkled ring, fucking out the creases");
	if (cockId != -1) output(" and gliding through the residual [pc.cumNoun] drying there. Your internal plumbing gets to work lubing your [pc.cock " + cockId + "] again, knowing it has an arduous journey ahead of it");
	output(". Using spit");
	if (pc.hasVagina()) output(" and some pussy-drool");
	output(" is a necessity to get comfortable in there again, and before long it’s like you hadn’t cum nor left her");
	if (pc.inRut()) output(", something you thank your bout of rut for");
	output(".");

	output("\n\nWith that distinct comfort returns the afore felt vivacity. A feeling of hyper-awareness tingles and vibrates through your mind, and you surrender to it right away. You reach out, grab its formless shape, and pull it over yourself like a blanket. The glows, the sensitivities, it all rushes back to welcome you in much the same you rush to fuck her as roughly as you were before.");
	output("\n\nBut most importantly, she’s right there under the cover of with you.");
	output("\n\n<i>“I love it!”</i> her hunger-ridden voice rings out, drowning out your surrounding perception");
	if (rounds < 2) output(" and the nervous onlookers’ " + (rounds == 0 ? "expressions" : "expression"));
	output(". <i>“As much as you want, I don’t care, please! Keep going!”</i> Sexual collisions amplify; you wonder if you should be quivering, nervous, or tired, because those needs don’t exist. Lips mouth words of encouragement.");
	
	output("\n\nYou hug her close again, [pc.hands] around her sweat-heavy breasts, taking possession of her body like she takes possession of your mind. It’s an intensely sweet pleasure. No dominance, no submission, only raw passion that exists to power your equalized exuberance -- it doesn’t last long before it devolves into heedless hedonism. Her butt seemingly tightens enough to constrict your movements and your blood flow, but you know you’re still moving");
	if (cockId >= 0 && pc.cocks[cockId].volume() > 150) output(", shoving your [pc.cockType " + cockId + "] distension through her body and stretching it to your masculine shape.");
	output("\n\nYou know more intimately than most things that your cock is being drained.");
	
	output("\n\nA restless gasp forces open your mouth and you grip tighter, too many images douse your thoughts with more of her being. There’s a kiss on your cheek, a tail clenching around your midsection, and there’s the acute knowledge that what you’re doing is more pleasurable than physically possible. You can only want more of this, that’s all you want to devote yourself to.");
	
	output("\n\nIt’s not long before you cum again.");
	if (pc.isHerm()) output(" [pc.Cum] flows in higher quantities than before, swelling your [pc.cockNoun " + cockId + "] to settle in her butt with all the breeder’s authority; your [pc.pussies] " + (pc.hasVaginas() ? "are" : "is") + " also driven to " + (pc.isSquirter() ? "squirt" : "sprinkle") + " [pc.girlCumNoun], though that effect is a distant thunder to your masculine release.");
	else if (pc.hasVagina()) output(" [pc.GirlCum] " + (pc.isSquirter() ? "squirts like an erotic missile" : "sprinkles ecstatically") + " from your [pc.pussyNoun].");
	else if (pc.hasCock()) output(" A torrid wave of [pc.cum] impregnates the rodenian’s loins with the absolute authority of a capable breeder. [pc.CumVisc] seed flows painlessly and effortlessly, seemingly without end.");
	else output(" There’s an equalization of pressure, and it’s so very calming.");
	output(" <i>“You can’t stop, so just keep going, okay!?”</i>");
	
	output("\n\nYou weren’t thinking about giving her anything less.");
	
	addButton(0, "Next", ratsEnoughRatFuckingForNow, 4);
}

public function ratsBoyStealsCockIntoHisButt(cockId:int, rounds:int):void
{
	clearMenu();
	clearOutput();
	showRats(1, true);
	
	var ratVirgin:Boolean = rat1.analVirgin;

	switch (rounds)
	{
		// First choice
		case 0:
			output("Ignoring the rodenian girl’s griping, you shuffle behind the [rat1.skinColor]-skinned mouse-boy who tucks his tail at your coming. A pat on his butt has the smooth tail between his legs ease up and wrap around you. " + (ratVirgin ? "<i>“Errr, I’ve never done this before, so uhm...”</i>" : "<i>“I won’t ask you to stop but please be careful, it’s not easy for me.”</i>") + " he looks back with some endearing shyness while you bring your [pc.cockOrStrapon " + cockId + "] to his asshole. You’ll be gentle. At first.");
			break;
		// Second choice
		case 1:
			output("Having already cum once, the [rat1.skinColor]-skinned mouse-boy seems more welcoming to your approach. His dick, pulsing thickly after orgasm drips with the leftover loads that pool beneath him. It throbs stubbornly under the corkscrew attack of the " + (rat0.hasStatusEffect("Rat Fucked") ? "half-" : "") + "rodenian’s cheeky tail and currents of warm air. You squeeze his plump butt affectionately, kneading and spreading his cheeks whilst aligning your [pc.cockOrStrapon " + cockId + "] with his hole. <i>“P-please be gentle... " + (ratVirgin ? "I haven’t done this before" : "I’m not really used to this...") + "”</i> he whimpers, his own tail wrapping around you now.");
			break;	
		// Third choice
		case 2:
			output("The [rat1.skinColor]-skinned mouse-boy, trembling and barely staying upright, yelps at your stimulating touch. You knead and squeeze his supple butt, spreading his cheeks as his tail eagerly curls around you. His cock throbs between his legs, his balls clenching as more");
			if (pc.isBimbo()) output(" wasted terran spunk dribbles out into a puddle of his own make. <i>“I’m still sensitive so be gentle please..! " + (ratVirgin ? "I’ve never had anything back there..." : "But only at first...") + "”</i> he says, looking back to you with hooded eyes.");
			break;
	}

	output("\n\nFaced with his reticence, you tenderly rub his soft cheeks together, chuckling when his fully erect cock twitches in response. He shuffles shyly, an accompanying needy arch bringing him nearer to your [pc.cockOrStrapon] and his impending butt-stuffing. You assure him that you will go slow");
	if (ratVirgin) output(" and let him get used to it");
	output(". Those few words greatly assuage his fear, and he nods.");
	output("\n\nYou lower yourself to where his chubby balls sag against the underside of his " + (rounds < 2 ? "tail-wrapped" : "unattended") + " erection, dragging your [pc.tongue] from taut nutsack to hesitant hole. You giggle when he squeaks; you start laughing as you ring his sphincter with the tip of your organ and eventually slip it past. <i>“Oh!”</i> he arches back, the muscular spasm leaving you behind. <i>“That was..!”</i> A rope of cum shoots from his cock on to the ground.");
	output("\n\nThere’s a certain fresh yet much too salty taste to his skin, and his manhood too. There’s ample liquid delight to smear around his ring, to even out all the creases in his supple skin. His lower half vibrates like his body is fizzing, and it’s impossible to ignore the way his cock swells and his balls clench. <i>“Y-you really know what you’re doing, " + ratsMisterCEO() + "...”</i>");
	
	if (ratVirgin) output("\n\nYou bring your [pc.cockOrStraponHead " + cockId + "] to his butthole, clenching and widening rhythmically. You give him a distracting handjob, the squeaky-voiced reaction letting you slip the tip of your " + (cockId >= 0 ? "dick" : "holo-dick") + " inside, aided by the sweat on his rump and the pre sputtering out of your cumslit.");
	else output("\n\nThe freckled pirate’s colon looks accommodating enough that you could skewer him in one go, but you promised to be less of a prick than that. You jerk his cock twice and slip through in the confusion, your entrance made better thanks to the sweat on his rump and the pre dribbling from your cumslit.");
	
	pc.cockChange();
	rat1.buttChange((cockId < 0 ? 100 : pc.cocks[cockId].volume()));
	
	output("\n\nHis fingers and toes curl instantly, a mix of some pain and a lot of pleasure. The outlaw’s lips purse and whine; he pushes himself back into you, the rapid beat of his heart bouncing his ample cock up and down beneath his girly legs. The speared mouse’s moans die down when his body adapts to your");
	if (cockId == -1) output(" hardlight");
	else if (pc.cocks[cockId].thickness() > 5) output(" oversized");
	else output(" girthy");
	output(" infiltration. " + (ratVirgin ? "<i>“Ouch... That hurt just a bit...”</i>" : "<i>“Ah, that didn’t hurt as bad as I thought it would...”</i>") + " Fuck, that’s precious - you reach over and pat him on the head");
	if (pc.hasBreasts()) output(", pressing your [pc.breasts] into his back as you rest your body on");
	else output(" pressing your body to");
	output(" his cute curves."); 
	
	output("\n\nYou whisper into his ear, <i>“Were you worried?”</i>");
	output("\n\nHe shakes his head, looking to you with big [rat1.eyeColor] eyes as he responds in his sonorous voice. <i>“No, we don’t really do these kinds of things. We’re not like the others.”</i>");

	if (pc.isBimbo()) output("\n\n<i>“Aww, that’s a shame!”</i> you squeal disappointedly. <i>“Well don’t you worry anymore, because I’m here! Now sit still and get ready to enjoy this...”</i> You push another few inches of " + (cockId < 0 ? "holographic" : "[pc.cockType " + cockId + "]") + " prick in with a delighted giggle, massaging his muscles for comfort. <i>“We’re gonna have some real fun now, cutie!”</i>");
	else if (pc.isBro()) output("\n\n<i>“Now that’s no way to go about life,”</i> you muse sympathetically. <i>“But right now, you worry about enjoying this. You’ll be coming back to me for more, I guarantee it.”</i> You buck your hips, inserting a few more inches of " + (cockId < 0 ? "holographic" : "[pc.cockType " + cockId + "]") + " meat inside with a satisfied grunt, running your hand over his head. <i>“Ready for this, little mouse?”</i>");
	else if (pc.isNice()) output("\n\n<i>“I see... I can’t imagine you have many opportunities around a place like this,”</i> you answer empathetically, rubbing his ears lovingly. <i>“You just sit still, and I’ll take care of your needs.”</i> You roll your hips softly, moaning with him as you get a few more inches of your " + (cockId < 0 ? "glowing" : "[pc.cockType " + cockId + "]") + " shaft inside. <i>“Are you ready to start?”</i>");
	else if (pc.isMisch()) output("\n\n<i>“Must suck, you’re just a bunch of little rats surrounded by huge dicks. Literally and figuratively!”</i> you chuckle, pushing a few more inches of " + (cockId < 0 ? "shimmering" : "[pc.cockType " + cockId + "]") + " girth into the mouse-boy’s butt, rubbing his messy hair. <i>“No problem, though. I’m right here, and I’m going to take care of you.”</i>");
	else output("\n\n<i>“Tough life. Sure you chose right?”</i> you scoff, sharply thrusting your " + (cockId < 0 ? "light refracting" : "[pc.cockType " + cockId + "]") + " dick further in the effete boy’s widening asshole. <i>“You don’t have to answer, because it put you on your knees in front of me.”</i>");
	
	if (pc.isAss()) output("\n\nThe mouse-boy shivers, ruefully glancing your way before bracing himself.");
	else output("\n\nHe nuzzles against your palm and braces himself.");
	output(" Swiveling your hips up, you mount him and let your [pc.cockOrStrapon " + cockId + "] fall " + (silly ? "inside" : "into his mouse trap"));
	if (cockId >= 0 && pc.cocks[cockId].cLength() > 6) output(", still having length to spare as you bottom out in his asshole");
	output(".");
	if (pc.cocks.length > 2) output(" Your multiple unholstered cocks have nowhere else to be, but they still slap against the wannabe rogue’s petite butt and your legs, trailing cords of sticky [pc.cumColor] pre as they sway.");
	output("\n\nYour thick and heavy outstroke from the pirate boy’s butt is a firm, squelching slide. A cry of pleasure erupts from his mouth; you heave back until the tip is just barely inside, pressing your fingers into his skin and pushing again. Plugging him takes all your effort now, as the moistness of his body has your [pc.hands] sliding off.");

	if (cockId >= 0 && pc.cockCanSting(cockId)) output("\n\nControlling your venomous cilia is too much of a burden at this point, and it’s not fair to keep that kind of good feeling out of action. Stingers slap the mouse-boy’s vulnerable walls and force their loads of aphrodisiac upon him. There’s a razor-sharp inhalation on his part, and when he glances astonished at you, saliva rains down his chin. Gotta love that instant effect.");

	output("\n\nThe prehensile constrictor around your [pc.belly] grips");
	if (pc.hasBreasts()) output(" and teases your [pc.breasts] with remarkable expertise, considering he can’t see you");
	output(". Your [pc.cockOrStrapon " + cockId + "] glides in and out of his ever-moistening pucker");
	if (cockId >= 0) output(", spurting out increasing quantities of pre to aid its passage");
	output(". It’s not hard to settle into a gentle, perpetual rhythm that he’s clearly enjoying, lifting him when you thrust in, lowering and spreading him when you pull out. You locate his cum-button in record time, sliding over his prostate with a grin on your face.");

	switch (rounds)
	{
		// First choice
		case 0: output("\n\nThe two rodenians to your left wantonly kiss, their tails busily working in and around their overwhelmingly aroused crotches. The halfbreed [rat2.boyGirl] squeals in [rat2.hisHer] leader’s mouth when they cum together, " + rat2.mf("the ground being doused in off-white rat spunk", "the ground being doused in slutjuice") + ". Climax does nothing to quench their needs, so they grind and rub against each other even harder, their tails caressing your [pc.ass] and [pc.hip] in the process."); break;
		// Second choice
		case 1: 
			var maleRat:Boolean = rat0.hasStatusEffect("Rat Fucked") && rat2.isMale();
			output("\n\nThe " + (rat0.hasStatusEffect("Rat Fucked") ? "rodenian girl" : "half-rodenian [rat2.boyGirl]") + " to your left struggles to stay upright. Your partner’s tail unravels from you to tend " + (maleRat ? "him" : "her") + ". A little sexual camaraderie goes a long way, and " + (maleRat ? "he" : "she") + " squeals hoarse as another wave of ecstasy overwrites [rat2.hisHer] train of thought, " + (maleRat ? "another sympathetic jet of mouse cum splattering the ground." : "streams of girlspooge splattering the ground."));
			break;
	}

	output("\n\nBottomed out and digging in, his glistening hole has almost stretched comfortably to your shape. You roll your hips and take him on a ride: <i>“Oaah!”</i> he twists, wriggling in your grasp and baying to your rhythmic motions against his rectal nerves. <i>“That felt good..! I-I uh, that really did-”</i> You push his head down to quiet him into a hum of satisfaction, pinching his rodent ears");
	if (pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE)) output(" and teasing his lonely dong with your [pc.tail], chuckling when you feel another cum-rope churn out");
	output(".");
	output("\n\nReaching down and grabbing his prick, your [pc.fingers] trail up the side before jumping to his salty spunk bunkers, the flesh of his ‘nads spilling between your fingers as you coax out yet another ribbon of boymusk. The stimulation makes your mischievous toy drop to his spit-shined chin, ass all the way up in the air to better help you plumb his depths - his fall tugs you along, the turgid shift of pleasure slamming you both into the next star system.");
	
	output("\n\nHe articulates most of his incoherent euphoria by rocking his body, but it’s up in the air if he’s actually doing that and it’s not some autopilot powered by pulsing pleasure. Obedient hips gyrate in tune with your increasingly powerful thrusts");
	if (cockId >= 0) output(", so much pre spurting inside that it spills out around your [pc.base " + cockId + "]");
	output(".");
	if (pc.clitLength >= 4) output(" You idly wonder if you should pull out and stick your obscenely large pseudo-cock of clitoral flesh inside. Bet he’d love that!");
	
	if (pc.hasVagina())
	{
		output("\n\n[rat1.EyeColor] eyes fluttering, your rodent reaches a hand to his tensing cock and his tail to your [pc.pussy], rubbing the broadside of the manhandling appendage into your nethers");
		if (pc.hasCocks() || pc.clitLength >= 4)
		{
			output(", wrapping around your");
			if ((cockId == -1 ? pc.hasCock() : pc.hasCocks()))
			{
				output(" extra " + (pc.cocks.length > 2 ? "cocks" : "cock"));
				if (pc.clitLength >= 4) output(", and");
			}
			if (pc.clitLength >= 4) output(" bulging clitoral flesh");
		}
		output(". The lips of your [pc.pussyNoun] are parted insistently, the pretty muscles of your [pc.vaginaColor] interior soon lathering their makeshift masseuse in enough lubricant that the heft of his smooth tail bulges upwards, widening your " + (pc.wettestVaginalWetness() > 3 ? "glazed" : "gushing") + " cunt enough to trigger rapturous tremors throughout your body.");
	}

	var cumQ:Number = pc.cumQ();
	output("\n\n<i>“Yes!”</i> you cry out");
	if (pc.balls > 0)
	{
		output(", your");
		if (pc.hasStatusEffect("Blue Balls") || cumQ >= 500 || pc.ballSize() >= 16) output(" packed and");
		output(" weighty ball sack " + (pc.ballSize() < 8 ? "clapping" : "swinging heavily") + " against his spread cheeks");
	}
	output(". A white band of pleasure draws along the back of your eyelids, originating from the thrill of your " + (cockId < 0 ? "holographic" : "[pc.cockType " + cockId + "]") + " flesh ravaging his fucked-silly body. " + (cockId < 0 ? "Techno cock" : "[pc.CockNounSimple " + cockId + "]") + " plows his colon with no further warning and even less care than what you started with. And yet, the rapidly babbling and dizzy mouse can only seem to beg for more!");
	output("\n\nHis straining hole tightens around your girth following an imploring whine of ineloquent bliss. The boi’s cum factories squeeze of their own volition between your fingers; greater successive blasts of spunk make noticeably more mess. Tiny hands ball into fists as desirous urges beg you to cum. You can’t get a grip around him by hand, only your [pc.arms]. He looks back to you with lust-filled eyes, tongue hanging from his sweat-saturated jaw, tail falling limp to the side and undulating only to the maneuvers of coitus.");
	if (pc.balls > 0) output(" As your [pc.balls] tighten just beneath his, you slow your pace to a few last vigorous thrusts.");
	
	if (cockId >= 0)
	{
		output("\n\nWithout your input, a [pc.cumVisc] deluge spurts out from [pc.eachCockHead], painting the rat boi’s bowels [pc.cumColor] in rhythmically pumped ribbons of [pc.cumNoun] churned out from your [pc.sack]");if (pc.hasKnot(cockId)) output(". You’re careful to avoid knotting him");
	}
	else output("\n\nThe mind-altering signals flaring from your hypersensitive holocock desynchronize your pleasure from his. The detonation of virility happening between the mouse boy’s legs distracts you enough that you don’t feel anything but a red-purple wave of pleasure pass over you");
	if (pc.hasVagina()) output("; you feel the [pc.girlCum] " + (pc.isSquirter() ? "squirting" : "flowing") + " from your " + (pc.hasVaginas() ? "cunts" : "cunt") + " in controlled bursts");
	output(".");
	
	output("\n\nThe indelible hew of orgasm misses your brain by inches, but that only makes the action of hilting the outlaw all the more sugary as you latch onto its tail. An unsurprisingly mouse-like one...");
	if (cockId >= 0)
	{
		if (cumQ < 100)
		{
			output("\n\nYou grit your teeth and apply pressure to your internal plumbing, mentally and physically thrusting it into action. [pc.CumFlavor]-flavored spunk spurts deep inside his body, splattering the sides of your dick and his colon with [pc.cumNoun], and you’re able to bask in the act of filling him. The spasms of his ass around your [pc.knotOrSheath " + cockId + "] help churn out what you’ve got, the thickest loads pooling in places unknowable.");
			if (pc.hasCocks()) output(" Your extra " + (pc.cocks.length > 2 ? "dicks pulse" : "dick pulses") + " pitifully outside, dribbling hot [pc.cumNoun] all over his backside and legs.");
		}
		else if (cumQ < 500)
		{
			output("\n\nEven though you weren’t swept up in the tide, you have plenty of [pc.cumVisc] [pc.cumNoun] to pump into the rat boy’s butt. The pressurizing spasms of his ass in contrast to the throbs of your still-cumming [pc.cockNoun " + cockId + "] help your [pc.balls] churn out enough thick and fresh loads to bloat his taut tummy and spill out around your [pc.base " + cockId + "].");
			if (pc.hasCocks()) output(" You pay little attention to your unholstered " + (pc.cocks.length > 2 ? "pricks" : "prick") + ", which pour puddles of [pc.cum] onto the ground and your mouse-boi’s lower half.");
		}
		else
		{
			output("\n\n[pc.Cum] spills into the mouse-boy’s tight ass, spurting dully at first. But after the spasms of his swelling colon collide with the pulses of your throbbing [pc.cockNounSimple " + cockId + "], your mighty erection is maintained, and you’re able to rouse your lazy spunk-brain. Your [pc.balls] battle for the opportunity to contribute their loads of [pc.cumVisc] [pc.cumNoun] to the effort - that is, filling his ass with enough cum to swell his belly with sheer, unmatched virility.");
			if (pc.hasCocks()) output(" Most of that effort, however, is wasted outside his ass as molten-hot hot ropes of [pc.cumNoun] land on his damp butt and thighs.");
		}
	}
	
	output("\n\nThoroughly claimed and spent, every vein on his dick flexing out the post-orgasmic pleasure, the mouse-boy slumps to the side, hyperventilating. <i>“That was... That wasn’t so bad");
	if (ratsPCIsKnown()) output(", [pc.mister] CEO...");
	output("”</i> he mutters, finally catching his breath.");

	addButton(0, "Next", function():void
	{
		clearMenu();
		clearOutput();
		showRats(3, true);
		
		output("When you’re ready, ");
		switch (rounds)
		{
			case 0:
			case 1:
				if (rounds == 0) output("you glance at the other two rats, considering the possibility of round two.");
				else output("you glance at the last standing rat, wondering if you can keep it up for one last go.");
				output("\n\nYou again regard the mouse boy’s now empty asshole winking at you");
				break;
			case 2:
				output("you gaze proudly at the crumpled bandits, each one worn out by your ironclad endurance.");
				output("\n\nAfter taking care of three needy mice, anyone would move on. Still, his empty butt");
				break;
		}
		output(", " + (cockId < 0 || pc.cocks[cockId].thickness() < 5 ? "slightly" : "heavily") + " gaped by his anal pounding");
		if (cockId >= 0 && pc.cumQ() >= 100) output(" and dripping with cum");
		if (rounds == 2) output(" still looks so fuckable");
		output(". Something feral in nature compels you to go one more time, to go the extra mile and make him a real cock-sock...");

		ratsDoggystyleChoices(cockId, rounds, rat1);
	});
}

public function ratsOhNoImStuckInMouseBoy(args:Array):void
{
	clearMenu();
	clearOutput();
	showRats(1, true);
	var cockId:int = args[0];
	var rounds:int = args[1];
	processTime(5);
	
	output("You want him again. You can’t place the need, but you know you can’t ignore it.");
	output("\n\nWhen you set him to all fours and lift him up again, the spent thief nearly collapses from the weight of exhaustion, but you keep his hips in the air and close to your [pc.cockOrStrapon " + cockId + "]. <i>“H-h-huh?”</i> the muddled mouse whines. The insistent grind of your tool to his tailhole restores his energy long enough for him to figure out where this is going again. <i>“W-wha... N-no! I c-can’t-”</i> His attempt to speak is silenced by an insistent thrust.");
	output("\n\nYour nerves scream their awareness to you.");
	if (cockId >= 0) output(" You haven’t even had time to properly lubricate yourself with fresh pre.");
	output(" But you don’t quite care. When you’re done, when you’ve truly had your fill, the mouse-boy will be permanently gloved to your " + (cockId < 0 ? "projected" : "[pc.cockType " + cockId + "]") + " shape, unable to derive satisfaction in that hole from anyone else.");
	if (cockId >= 0) output(" Knowing it has a true tribulation ahead of it now, your [pc.cock " + cockId + "] begins oozing and spurting pre.");
	output(" It doesn’t take long to resume the session from before");
	if (pc.inRut()) output(", likely thanks to your overwhelming need to rut");
	output(".");

	output("\n\n<i>“");
	if (ratsPCIsKnown()) output("[pc.Mister] CEO... ");
	output("P-please, this is too much!”</i>");
	output("\n\nYou get a moist hand in the channel between his ears, rubbing slick circles into his head. It calms him halfway, and your balls-deep thrusts take care of the rest. No matter how he feels, his body ceaselessly squirms against yours, yet high-pitched whines of acceptance slip off his tongue nonetheless. [rat1.LipColor] lips shape into all new sounds of blissful sensation.");
	output("\n\nHis visage breaks apart into something slutty. There’s no other way to put it. The sounds he makes, the way he returns your pumps with his own, he can’t wait to blow again. Already you can smell fresh ropes of boy-jizz sizzling out on the ground, one rope forced out with every push and pull into pliant rat ass. Every cycle and roll of the [pc.hip] throws out droplets of salty-sweat");
	if (pc.isLactating()) output(" and torrents of [pc.milk] from your so very hardened nipples");
	output(".");
	
	output("\n\nAgain you match the contours of his back with your [pc.chest]");
	if (pc.hasBreasts())
	{
		output(", grinding your diamond-cutting teats into his spine like nails");
		if (pc.isLactating()) output(" and painting his frame [pc.milkColor] with lactic runoff");
	}
	output(". His tail, once flailing in excitement, falls limp the closer another orgasm approaches. You share in his climax only so much. While his hanging prick recklessly blasts out a proper pool to bathe in, you’re marking his ass with your [pc.cumNoun]-scent. The corners of your mouth quirk up at the idea. A mouse-boy no better than a puppy when he sees or thinks about your bitch-" + (cockId >= 0 && pc.hasKnot(cockId) ? "breaker" : "boner") + ".");
	if (rounds < 2) output("\n\nIt only leaves the other " + (rounds == 0 ? "rats" : "rat") + " to look on in dismay, realizing that your attentions end with him.");
	output("\n\n" + StringUtil.capitalize(indefiniteArticle(pc.armDescript())) + " around his collarbone and a hand scritching behind his ears, you finally feel your next brisk orgasm approach. With gusto you ream him just a bit faster, finding your voice only to spend that air on a keening cry of excess release. You squeeze his ears, stroking slowly.");
	if (pc.isHerm()) output(" There’s a burst of [pc.cumVisc] finality, a relieving sign you haven’t missed this orgasm. You and he both cum and cum and cum, though the " + (pc.isSquirter() ? "squirting of" : "creaming inside") + " your [pc.vaginas] is just as pleasurable.");
	else if (pc.hasVagina()) output(" Your [pc.vaginas] tense up and " + (pc.isSquirter() ? "squirt in fiery bolts" : "spray in euphoric flashes") + " of pleasure, adding your scent to the air while the freckled pirate squirms out the last, thickest loads of boy-jizz.");
	else if (pc.hasCock()) output(" A detonation of [pc.cumVisc] finality crackles in your hormonally-dizzied mind. [pc.Cum] spurts and spurts into the mouse-boy’s rear while boy-jizz fires out in long, thin ropes to the ground between his thighs.");
	else output(" A rush of sweat and a shock of relieved pressure is all you personally feel, the rest the squirming of a jizz-shooting rodent.");

	output("\n\n");
	if (pc.isLactating()) output("Effluence flows from your body in higher quantities than before. ");
	output("Although your rat has been drained, and although your muscles are finally getting their signals for reprieve through to your mind, you can’t stop.");
	output("\n\nYou won’t stop. Not until everyone knows what he is to you.");

	addButton(0, "Next", ratsEnoughRatFuckingForNow, 5);
}

public function ratsFuckedRightInThePussy(cockId:int, rounds:int):void
{
	clearMenu();
	clearOutput();
	showRats(2, true);
	
	//This cock goes in butt
	var cockId2:int = pc.cockThatFits(rat2.analCapacity());
	if (cockId2 == cockId) cockId2 = pc.cockThatFits2(rat2.analCapacity());
	
	switch (rounds)
	{
		// First choice
		case 0: output("The most traditional sight to see is the [rat2.furColor]-furred half-rodenian girl with an oozing, pink fuckbox and a big, suckable clit. She tenses up at your approach, squeaking cutely when you manhandle her half-fuzzed ass. Running two fingers up her slit, you collect a tasty load of tangy femjuice and rat-flavored sweat, finding the taste very much to your liking. As you align " + (cockId >= 0 ? "your [pc.cocks]" : "hardlight dick") + " with her " + (cockId2 >= 0 ? "holes" : "hole") + ", she glances at you expectantly. <i>“I haven’t had sex in sooo long, I can’t wait! C’mon, take me!”</i>"); break;
		// Second choice
		case 1: output("You turn your attention to the [rat2.furColor]-furred half-rodenian girl to see her tail rubbing vigorously against her bubblegum-pink slit, lathered in enough sexual runoff that it’s forming puddles wherever it goes. Blissed out and unfocused on what’s coming, she cums again, squirting hot rat-cum all over the floor, shamelessly spreading the scent of rat-slut as clock ticks on. She squeaks sexily when you grip her cushy tush and spread her half-fuzzed ass, aligning " + (cockId >= 0 ? "your [pc.cocks]" : "hardlight dick") + " with her dripping " + (cockId2 >= 0 ? "holes" : "hole") + ". <i>“Ohh, awesome! I haven’t had sex in a whiiiiiileeee! But that’s no big deal, I’ll just be screaming louder!”</i>"); break;
		// Third choice
		case 2: output("The last rat standing - presenting, rather - is the [rat2.furColor]-furred halfbreed girl. She looks unsteady, shaky, and far more appealing than before. Her desperate attempts to stay upright only make that curvy ass all the more captivating. She looks back with a sweaty and cum-splattered face, pulling her sex-coated tail from her mouth while moaning <i>“Aaaahh come on, please fuck me! I can’t stand the teasing anymore please please please!”</i> You’ve no other reason to level " + (cockId >= 0 ? "your [pc.cocks]" : "hardlight cock") + " with her " + (cockId2 >= 0 ? "holes." : "hole.")); break;
	}

	output("\n\nThe fuzzy-limbed rat regards you with a sultry as hell look while you explore her easily-parted folds with your [pc.cockOrStraponHead " + cockId + "]. Her wetness would put most ausar to shame. As it stands, it’s making the prospect of brutally fucking her less a concern and more an unsubtle desire.");
	output("\n\n<i>“About time, " + ratsMisterCEO() + "! Hey, I don’t care what you’ve got, just shove it right in my pussy, I’m so turned on I could fuck myself with my baton! Heyyyy,”</i> she shamelessly grinds her sopping scent-box into you now, pushing your " + (cockId >= 0 ? "[pc.cocksLight]" : "holocock") + " down and slathering the topside of your " + (cockId < 0 ? "techno-girth" : "[pc.cockType " + cockId + "] girth") + " with aromatic rat-slime. What doesn’t get you ready to " + (cockId >= 0 ? "breed" : "pound") + " her drips from her mouthwateringly curvy buttflesh." + (cockId2 >= 0 ? "<i>“You’ve got two dicks, " + ratsMisterCEO() + "... Gimme! You can’t understand how badly I want that!”</i>" : "<i>“Show me just what " + (ratsPCIsKnown() ? "a CEO can do!”</i>" : "you’ve got, stranger!”</i>")));
	output("\n\nThe slut wants you to rush, " + (pc.libido() > 33 ? "and boy do you kind of want to now" : "but you’ll go at your own pace") + ". You slap her on the ass - which only seems to make her more inconsolable - and shove your crotch against hers, one hand busy between the collision of half-rodenian derriere and [pc.raceShort] [pc.skinFurScalesNoun].");
	output("\n\nThumb and index finger cinch the oversized bud of her clit together, fine details present in the silky texture of your lubricated digits. Girlishly undignified wails of " + (cockId >= 0 ? "pre-provoking pleasure" : "pleasure-provoking volume") + " are received clearly by your [pc.ears] after firm tweaks to that labial distension. <i>“Aawww! Yeeeeesss!! Yes Yes!”</i> she squeals, her cute tail smacking dumbly against your [pc.belly], the ribbon-adorned tip poking at your thrumming equipment.");
	output("\n\n<i>“You want this that badly, huh?”</i> you ask, rubbing your [pc.cockOrStraponHead " + cockId + "] against her juice-streaming pussy. Her ripe pheromones give you an undiluted taste of the warmth suffusing her petite body through smell alone");
	if (cockId >= 0) output(", and it gives your [pc.cocks] the signal they’re always waiting for");
	output(".");
	output("\n\n<i>“Yes! Gimmegimmegimme!”</i> She chews her lip, moaning with every thick scrape against your body. She glances to you, puppy-like need glowing incandescent in her [rat2.eyeColor] eyes. Both of her furry hands move to her backside, spreading her rippling ass cheeks while her head falls to the ground. The horny minx couldn’t possibly look any more like a bitch in heat, whose " + (silly ? "whorifices" : "orifices") + " look made to guzzle down waves of jizz. <i>“It’s been so long since I’ve had any fun! Don’t tease me, okay? Use those holes as much as you want!”</i>");
	
	if (pc.isBimbo()) output("\n\n<i>“Kay!”</i> you announce, thrusting " + (cockId < 0 ? "your hardlight cock" : "your [pc.cocks]") + " unceremoniously into her pussy" + (cockId2 >= 0 ? " and ass simultaneously." : "."));
	else if (pc.isBro()) output("\n\n<i>“Alright, sweetie,”</i> you grin, bucking your [pc.hips] and eagerly sinking " + (cockId < 0 ? "your holodong" : "your [pc.cocks]") + " into her cunt" + (cockId2 >= 0 ? " and ass simultaneously." : ".") + "<i>“Let’s see how loud you can get!”</i>");
	else if (pc.isNice()) output("\n\n<i>“If you say so,”</i> you smile, grunting softly when you feel her pussy absorb " + (cockId < 0 ? "your techno-cock" : "your [pc.cock " + cockId + "]") + (cockId2 >= 0 ? ", your second slipping through her slick pucker." : "."));
	else if (pc.isMisch()) output("\n\n<i>“How can I turn a cutie like you down? Hold still,”</i> you say, immediately groaning when her pussy " + (cockId2 >= 0 ? "and ass absorb" : "absorbs") + " " + (cockId < 0 ? "your glow-dick" : "your [pc.cocks]") + ", <i>“because I’m not going slow.”</i>");
	else output("\n\n<i>“No problem.”</i> You grip her shoulders, " + (cockId < 0 ? "glow-dick" : "[pc.cocks]") + " sliding in just seconds later.");

	pc.cockChange();

	output("\n\nYou press your groin forward; the whorish thief’s curled feet spasm against the ground, little ‘tap-tap’ noises coming from the toe-claws. The she-rat’s voice rings out, inlaid with undefinable satisfaction. The sounds only make you shudder with every burgeoning inch you push into her lust-aquiver body. There’s an undeniable increase in girlmusk saturating the air and wettening your frame, but that’s probably just her masturbatory tail nestling into your lower neck.");
	// suulaDick
	if ((cockId >= 0 && pc.cockCanSting(cockId)) || (cockId2 >= 0 && pc.cockCanSting(cockId2))) output("\n\nBefore you ram the rat-bitch’s core, your cilia lined hard-on unleashes its venomous payload. <i>“Woah, woah!!”</i> she screams, body jerking in several directions, high pitched inhalations signaling her struggle to deal with the rush of chemical arousal. <i>“Oh my god, you’ve got that kind of dick!? Oh, yesyesyes, that’s so hot! Give me all of that!”</i>\n\nCan do!");
	
	output("\n\nYou bottom out");
	if (cockId >= 0 && pc.cocks[cockId].cLength() >= 13) output(", some [pc.cockColor " + cockId + "] cockflesh still protruding from her " + (cockId2 >= 0 ? "holes," : "hole,"));
	output(" and bask in the muscled impressions squeezing and sucking on your [pc.cockOrStraponHead " + cockId + "] in cum-hungry desperation. <i>“Oh noo, a big mean " + (ratsPCIsKnown() ? "CEO" : "stranger") + " is fucking me! I’m being robbed!”</i> she cries, but laughs in the process");
	if (rounds < 2) output(", the laughs of her " + (rounds == 0 ? "friends" : "friend") + " joining in too");
	output(".");
	
	output("\n\nHer fat cord of a tail winds around your upper body, pulling you down on her and squeezing while brushing the nape of your sweaty collar. Nuzzling her back with your [pc.face], you thrust your throbbing " + (cockId2 >= 0 ? "tools" : "tool") + " in breathlessly, closing your [pc.eyes] to better enjoy the pressurizing spasms of her cunny around your " + (cockId < 0 ? "fancy strapon." : "[pc.cock " + cockId + "]."));
	if (cockId2 >= 0) output(" Your [pc.cockType " + cockId2 + "] shaft in her ass pulses in tune with the one in her pussy, ignoring the thin walls separating the two of them and vibrating her entire lower half.");
	output(" <i>“I think you’re getting off easy,”</i> you grunt on your outstroke, transitioning to a rough, bone-shaking pace.");
	
	output("\n\nYou hammer the joyous half-mouse");
	if (pc.hasLongTongue()) output(", letting your tongue fall to the small of her back and draw blissful circles against her vulnerable spine");
	output(". Your thrusts are nothing short of savage, muscles working overtime to claim fertile, barely used cunt and do it in a way that leaves no doubt to others who she belongs to. It’s not long before you’re going at it like a pair of depraved rabbits, dripping with every fluid a body can output.");
	output("\n\nShe shuffles closer to your body, probably wanting her womb to be closer to your [pc.cockOrStraponHead " + cockId + "]. <i>“I can feel your bulge everyWhEERE-kk!”</i> she squeaks, <i>“Harderharderharder!”</i> You pull back until your " + (cockId2 >= 0 ? "tips" : "tip") + " are barely inside and slam your [pc.hips] into hers. The she-mouse’s head flies back, unkempt bangs throwing sweat everywhere in a raunchy display of dewy arousal.");

	output("\n\n<i>“Aaach!”</i> she yelps when you feel a particularly strong grip on your dick, a warm jet of mouse-jizz lancing your [pc.legOrLegs]. What a slut! You carry on even harder, fucking her through post-orgasmic susceptibility. <i>“Yes!!!!!!”</i> she cries at the top of her lungs, eagerly <i>smashing</i> her hips back into yours on every thrust. It only makes her cream your rod again and again.");
	if (cockId >= 0) output(" <i>“I’m a slut for a " + (ratsPCIsKnown() ? "CEO’s" : "stranger’s") + " [pc.cockNounSimple " + cockId + "]!”</i>");
	output(" She’s so turned on that she’s zooming ahead of your pace! <i>“EeyeaaahAAaaaAAa! " + (ratsPCIsKnown() ? "[pc.Mister] CEO" : "Stranger") + ", you havin’ trouble there? You can’t keep up with me?”</i> she sings, her provocative giggles only " + (cockId >= 0 ? "hardening your furious " + (cockId2 >= 0 ? "erections." : "erection.") : "deepening your ecstatic resolve."));

	switch (rounds)
	{
		// First choice
		case 0: output("\n\n<i>“I hope you’re enjoying yourself!”</i> the rodenian snarks, tickling the side of your cheek with her tail before kissing your subby little slut on her spit-flecked lips. She’ll get her turn if you feel like it! The mouse-boy to her right peeks innocuously, working his tail in your direction, making earnest attempts to touch and pleasure your body from a distance. More than one tail, however, finds its way to your crotch, looping around your " + (cockId < 0 ? "faux-phallus" : "[pc.cockNoun " + cockId + "]") + " and jerking lightly during your velveteen strokes."); break;
		// Second choice
		case 1:
			if (rat1.hasStatusEffect("Rat Fucked")) output("\n\n<i>“Please tell me I’ll be next...”</i> the rodenian girl whines, using her tail to stroke your " + (cockId < 0 ? "faux-phallus" : "[pc.cockNoun " + cockId + "]") + " during your velveteen strokes. She’ll get her turn if you’re up to it! ...Still, those [rat0.eyeColor] eyes are very tempting...");
			else output("\n\nThe mouse-boy, still making out with his over-aroused leader, looks meekly toward you, wondering if he’s going to be next. In those [rat1.eyeColor] eyes, you see the want clear as day!");
			break;
	}

	output("\n\nPutting a hand to the back of the half-rat’s neck, you loom over the cloying mouse and plumb the deepest depths of her beautifully gushing cunt");
	if (cockId2 >= 0) output(" and tightening asshole");
	output(". Every thrust causes a backwash of femslime");
	if (pc.hasKnot(cockId) || pc.hasKnot(cockId2)) output(", there’s enough here that you’re able to fuck her with your knot!");
	else output(".");
	if (pc.tallness > 6*12) output(" Due to your height, you end up lifting her legs just off the ground.");
	
	output("\n\nWith every vigorous thrust now, the shockwaves of sex splatter girlcum, pre, and sweat all over you and the others. Her vice" + (cockId2 >= 0 ? "-like tunnels squeeze" : " squeezes") + " harder the more fuck-crazed nerves you slam, intent on milking your cock of all the seed it " + (cockId < 0 ? "sadly doesn’t have" : "has sealed away") + ". Climactically slathering walls ruthlessly mash against your girth, your mind burning up in proximity to explosive orgasm, so very close to filling her womb with life.");
	output("\n\nDextrous thief’s fingers reach further down, struggling to grasp the turgid length that fills her");
	if (cockId >= 0 && pc.cocks[cockId].volume() < rat2.vaginalCapacity()/2) output(" well");
	else if (cockId < 0 || pc.cocks[cockId].volume() < rat2.vaginalCapacity()*3/4) output(" perfectly");
	output(" past the breaking point");
	output(". The [pc.cockOrStrapon " + cockId + "] that threatens to punch into her cervix and deliver fresh loads right to her eggs.");

	output("\n\n" + (cockId >= 0 ? "<i>“P-please, I want you to cum inside so badly...!”</i>" : "<i>“When you cum, please do it as hard as you can! Hold me!”</i>") + " she shouts, her once-excited tail falling pathetically to the side. All of her strength wanes in the moment, the energy in her body now devoted to pleasing your [pc.cockOrStraponFull " + cockId + "]");
	if (cockId >= 0 && pc.balls > 0) output(" and draining your [pc.balls] of every virile drop");
	output(".");
	if (cockId >= 0) output(" <i>“I-I want it on me, too! Please! You really have no... no... umf!”</i>");
	
	output("\n\n<i>“Needy girl, aren’t you?”</i> you whisper, slipping both [pc.arms] around her waist, balancing yourself on your knees, and humping away like an animal. You steal a few scritches behind her wobbly ears, quieting her down into a concentrated placitude. Your jaw clenches from the pressure, the air in your lungs spreading out elsewhere as needed. Your unimportant muscles lock or pleasure-seize, joining up with the ones that matter more in this hour of breed.");

	output("\n\nThe erotic sightlessness of peaking arousal dulls your vision, speckled bands of sexual thrill light up the darkness. So much clear goo flows across your crotches, making you feel as though you’re plowing the rodent knee-deep in a river, all water replaced by pussy-drizzle");
	if (cockId >= 0) output(" and " + (pc.isHerm() ? "herm-spooge" : "spooge"));
	output(". Your [pc.cockOrStraponFull " + cockId + "] easily glides in and out of");
	if (cockId >= 0 && pc.cocks[cockId].volume() >= rat2.vaginalCapacity()*3/4) output(" overstretched");
	output(" human pussy, and you know that with every thrust she is <i>in love with the way you treat her</i>. She fucking <i>adores</i> this, and her oozing love tunnel makes sure to display that affection in every forceful suction.");
	
	output("\n\nIn this ferally dominant position your muscles ache and burn, and you begin to lose grip in your [pc.footOrFeet]. You cup her perky breasts, redoubling the pleasure with vicious molestations. Pinching her tits, forcing sexy whines of euphoria out of her, you thrust, thrust, thrust, you don’t stop... It just keeps getting faster, harder...");
	output("\n\nGrowling in her ear, you inhale deep through your nose and rise, clutching her hand-filling hips and bellowing on your final, ejaculate-smearing thrust");
	if (pc.hasKnot(cockId) || pc.hasKnot(cockId2)) output(", careful to avoid knotting her");
	output(". She cums again, her hot fem-goop " + (pc.hasVagina() ? "mixing with the tide of [pc.girlCumNoun] trailing down your [pc.pussyNoun] and [pc.legOrLegs]." : "glazing your [pc.legOrLegs], trailing down in fragrant patterns."));
	if (pc.balls > 0) output(" Your [pc.sack] clenches, the swollen nuts inside bumping against each other as you let loose.");
	
	output("\n\nThere’s a moment of cold sweat, a single solitary second of gently pulsing pleasure buzzing... rippling throughout your soul. Your");
	if ((cockId >= 0 && pc.cocks[cockId].cLength() >= 13) || (cockId2 >= 0 && pc.cocks[cockId2].cLength() >= 13)) output(" lengthy");
	output((cockId2 < 0 ? " intruder is" : " intruders are") + " squeezed and clamped down upon by the molten-hot confines of slurping mouse-" + (cockId2 < 0 ? "cunt. It stretches" : "holes. They stretch") + " at the last moment, rhythmically pressing upon what claims " + (cockId2 < 0 ? "it" : "them") + ", inducing a sensory collapse that pushes you over the edge.");
	
	var cumQ:Number = pc.cumQ();
	// PC hardlight
	if (cockId < 0) output("\n\nYou clutch tightly to the soaking rat, knowing she’s a little disappointed you’ve got no cum. Honoring her request, your eyes nearly roll back from the clenching on your ultra-sensitive nerve-numbing holocock. " + (pc.hasVagina() ? "A rush of [pc.girlCum] spills from [pc.eachVagina], the warm juices sizzling on the ground next to her final, most powerful squirt." : "A shuddering heat blossoms through your body feeling a projectile squirt of [pc.girlCum] splash the ground underfoot with hers.") + "");
	// PC low cum
	else if (cumQ < 100)
	{
		output("\n\nMoaning ecstatically, an outpouring of [pc.cum] surges up through your [pc.cock " + cockId + "], spurting into the she-rat’s womb");
		if (cockId2 >= 0) output(" and colon equally");
		output(". You wiggle your hips just a bit, flexing your bulge to plaster her G-spot with [pc.cumVisc] [pc.cumNoun] in ample amounts, but also do your best to work it into her womb.");
		if (cockId2 >= 0) output(" Your [pc.cockNounSimple " + cockId2 + "], burrowed in her ass, pulses with every squirt into her bowels.");
		output(" On your outstroke, you smear [pc.eachCockHead] across her ass, shooting the rest of your loads on her back until a small puddle forms.");
	}
	// PC plenty of cum
	else if (cumQ < 500)
	{
		output("\n\nGrunting loudly, you feel [pc.eachCock] swell and throb mightily, stretching her pussy");
		if (cockId2 >= 0) output(" and ass");
		output(" just a bit wider to make room for the sheer volume of [pc.cumVisc] [pc.cumNoun] you’re now bloating her belly");
		if (cockId2 >= 0) output(" and colon");
		output(" with. You and the she-rat moan softly, enraptured by the mutual warmth you apply to one another, and especially what you provide her womb with. Before your [pc.balls] " + (pc.balls > 1 ? "runs" : "run") + " dry, you withdraw and shoot jet after jet of [pc.cum] across her back, her ass, even landing a few ribbons of [pc.cumColor] seed in her hair!");
	}
	// PC lots of cum
	else
	{
		output("\n\nYour gasps are shudderingly hot and concerningly debilitating. [pc.EachCock] " + (pc.hasCocks() ? "throb" : "throbs") + " powerfully, unyieldingly. The strength of it forces her sodden " + (cockId2 >= 0 ? "holes" : "hole") + " to spread wider, to accept your monstrous virility one way or the other. Rivers of [pc.cumVisc] [pc.cumNoun] surge through your rigid " + (cockId2 >= 0 ? "rods" : "rod") + ", the vibrations of your heart and the pulsings in your cock making the slutty rat beneath you rattle and shake in the abrupt pleasure your jerking motions bring. Her soft-muscled belly swells out into a cute little baby bump. Remembering her request, you struggle to pull your still-cumming [pc.cocksLight] from her, aiming your flaring cumslits at her back, thoroughly painting and claiming her with every masking shot of [pc.cumColor] seed.");
	}

	output("\n\nYou fall to your left, still holding on to the rat girl, struggling to find the strength to keep going after an orgasm like that. The want for rest is so great you almost pass out as the big spoon. You yank her off your body and reluctantly sit up. Exhausted, the halfbreed girl curls up into a ball, panting quietly. <i>“Mmmmsooogood.”</i>");
	
	addButton(0, "Next", function():void
	{
		clearMenu();
		clearOutput();
		showRats(3, true);
		
		output("Taking another breath, you glance to her friends.");
		switch (rounds)
		{
			case 0: output(" They’ve clearly been helping each other get off this whole time. Maybe they’re also worth your time?"); break;
			case 1:
				output(" Your eyes cross seeing the last standing rat, having trouble standing " + (rat0.hasStatusEffect("Rat Fucked") && rat2.isMale() ? "him" : "her") + "self. You wonder if you can go just one more time..."); break;
			case 2:
				output(" A shock of significant pride claims you when you see the");
				if (pc.hasCock()) output(" cum splattered");
				output(" rats all worn down by your iron clad endurance.");
				break;
		}
		output("\n\nYou’re still raring to go another round though. You’d be lying to yourself otherwise. Thinking about taking her again keeps your mind in the game.");
		if (rounds < 2) output(" You probably wouldn’t have the strength to fuck the " + (rounds == 0 ? "others" : "other") + " if you made that halfbreed girl really yours, but she fucks like a champ...");
		
		ratsDoggystyleChoices(cockId, rounds, rat2);
	});
}

public function ratsGettingFuckedInThePussyForever(args:Array):void
{
	clearMenu();
	clearOutput();
	showRats(2, true);
	var cockId:int = args[0];
	var rounds:int = args[1];
	processTime(5);
	
	//This cock goes in butt, again
	var cockId2:int = pc.cockThatFits(rat2.analCapacity());
	if (cockId2 == cockId) cockId2 = pc.cockThatFits2(rat2.analCapacity());
	
	output("Fuck it. That pussy is downright scandalous. You need it again!");
	output("\n\nYou run a [pc.hand] through the border of fur and skin on her thigh, smiling down at the tired rat. <i>“That was amazing, " + ratsMisterCEO() + "!”</i> she grins. You airily suggest that you’re not at all satisfied, and you hope she isn’t either.");
	output("\n\nLike a bolt of lightning her eyes shoot open, pupils dilating with the fantasy of climbing to another orgasm. <i>“Really!? You want me that badly?! Oh my gosh yes! Just hold tight and...”</i> she crunches into a position that gets her big beautiful butt right up where it needs to be. She spreads her cheeks and well-fucked labia both, a heat-fog billowing from her pheromone-mitten. <i>“Take me");
	if (ratsPCIsKnown()) output(", [pc.mister] CEO");
	output("! I’m all yours, if you can handle me!”</i>");
	
	output("\n\nHer teasing giggle is like a feather stroke to your heart. Its inner caress " + (cockId >= 0 ? "resuscitates your [pc.cocks] with" : "causes your holo-cock to throb with") + " pleasure, new anticipations surging and soaring. She’s already whimpering, and you haven’t crammed your respite-seeking " + (cockId2 >= 0 ? "tools" : "tool") + " back in yet! <i>“B-but just so you know, heh heh, you only get this if you win! I’m not that easy- Hya!”</i>");
	output("\n\nYou clap your hand to her delicious derriere, humming in delight as the skin and sweat-impregnated fuzz massages the gaps between your fingers. You wonder aloud that she’d probably let you win. It’s like you hadn’t pulled out before. The ease at which you return to your lashing, rhythmic pumps in and out of her indescribably silky " + (cockId2 < 0 ? "cunt" : "holes") + " only excites you further. There’s some strain in your loins");
	if (pc.hasCocks()) output(", especially your [pc.cockBiggest]");
	output(", but nothing you can’t handle.");
	
	output("\n\nCertainly not with the way she picks back up. Girlhoney squirts over you again, and that lusty rat slime washes over your");
	if (cockId < 0) output(" artificial");
	output(" boner and soothes away the aches in its heat. You were sure you’d fucked every cluster of nerves in her ecstasy-imbued pussy, but the appreciative squeaks she makes in a sensory-muddled haze tell you that you don’t quite know everything about her " + (cockId >= 0 ? "spunk-stained" : "cum-starved") + " channel.");
	if (cockId2 >= 0) output("\n\nThe dual pleasure of pussy and ass, skewered by your duo of pre-spurting prongs, is a mental ravishing. The pressure from her sealing holes, the exchanged throbs inside those petite enclosures... it flattens out further conversation in a lurid tempo.");
	else output("\n\nYou jam a thumb into her winking asshole, smearing her juice all around it. As you iron out the light wrinkles between her cheeks, further conversation is flattened out by a lurid tempo.");
	output("\n\nLike before you cradle the vivacious outlaw, smashing her head to your [pc.chest] while you hump and grind. It’s your only way of speaking now, you just want to tell her all sorts of things, and be told in turn how she feels. Into her");
	if (silly) output(" mail");
	output(" slot you squirm");
	if (pc.balls > 0) output(", [pc.balls] grinding against her bulged-out clitty");
	output(". The tail once limp finds its way around you");
	if (pc.hasTail()) output(" and your [pc.tail] as well");
	output(", bankrupt for cuddles.");
	
	output("\n\nHer well-fucked vagina erupts in another impossibly thick gout of passion, seemingly no end to the juices that could fill a swimming pool by now. Squishing sounds combine with the weak cries for more, and it just becomes too much to bear.");
	if (pc.inRut()) output(" Even for being in rut, her thirst for cock and insatiable ardor is successfully milking your body.");
	
	if (pc.isHerm())
	{
		output("\n\n[pc.EachCock] blow again, splattering her interior");
		if (pc.cocks.length > 2 || (cockId2 < 0 && pc.hasCocks()) || (cockId < 0 && pc.hasCock())) output(" and exterior");
		output(" with [pc.cum]. The orgasm lasts much longer than you think is healthy, but there’s no way you can give a damn with your [pc.pussies] also straining in an unexpectedly powerful climax - [pc.girlCumNoun] trickles down your inner thigh to join hers.");
	}
	else if (pc.hasVagina())
	{
		output("\n\n[pc.EachVagina] " + (pc.hasVaginas() ? "flex and clench" : "flexes and clenches") + " in an unexpectedly powerful orgasm, the transmissions from your hardlight strapon whipping " + (pc.hasVaginas() ? "them" : "it") + " with the kind of voltage needed to erupt.");
		if (pc.isSquirter()) output(" Not just drizzle or sprinkle, but fire like a gunshot.");
	}
	else if (pc.hasCocks()) output("\n\n[pc.EachCock] " + (pc.hasCocks() ? "balloons" : "balloon") + " and splatters. Orgasm would feel painful if not for the knowledge you’re pressed against her womb, dumping another fresh load of baby batter right where it belongs.");
	else output("\n\nThere’s a change from fullness to emptiness, indicating a relief of pressure.");
	
	output("\n\nThis time, you don’t pull out. You just keep fucking her.");
	if (rounds < 2) output("\n\nThe other " + (rounds == 0 ? "rats stare" : "rats stare") + " on in dismay, knowing " + (rounds == 0 ? "they" : (rat0.hasStatusEffect("Rat Fucked") ? "he" : "she")) + " won’t be getting any. Too bad, you think, this pussy is just too good.");
	output("\n\nYou probably won’t remember anything about this after you wake up.");
	
	addButton(0, "Next", ratsEnoughRatFuckingForNow, 6);
}

public function ratsFuckASlutBoy(cockId:int, rounds:int):void
{
	clearMenu();
	clearOutput();
	showRats(2, true);
	
	switch (rounds)
	{
		// First choice
		case 0: output("The [rat2.skinColor]-skinned half-rodenian boy catches your eye the most. Unlike the other effete mouse lined up, he doesn’t tuck his tail or shrink away from you. No, he seems to be enticing you much the same way his curvy leader is. He idly masturbates as you shuffle behind him, taking hold of his sumptuous rear, spreading those cheeks, and pushing your [pc.cockOrStrapon " + cockId + "] up to the hole betwixt. <i>“Finally, I need to cum too, just so you know!”</i> he calls."); break;
		// Second choice
		case 1: output("Trembling and unsteady, the [rat2.skinColor]-skinned half-rodenian boy wobbles as you slither up behind him, catching him off guard, and chuckling at the small puddle of wasted seed you spy between his legs. The girthy cock hanging between his legs dribbles out an orgasm despite the valiant attempts of his tail to staunch it. He shivers when you expose the hole nestled between his cheeks, pressing your [pc.cockOrStrapon " + cockId + "] to his asshole. <i>“A-ahh, I’ve been waiting..! B-but go easy, huh?”</i>"); break;
		// Third choice
		case 2: output("Barely afloat, his thighs thumping together, the [rat2.skinColor]-skinned half-rat boy squeals when you grip his ass, giving his throbbing tumescence a quick jerk. At your stimulations, a thin line of cum is expelled from his clenching balls. He falls chin-first to the ground, raggedly whimpering <i>“I can’t... O-oh please b-b-be gentle, I’ve cum twice...”</i> as you pull him back up."); break;
	}

	output("\n\nRocking his hips, the [rat2.hairColor]-haired halfbreed glances coyly");
	if (rounds == 2) output(" and shivers out exhaustion with the sweat");
	output(". There’s a positively slutty look writ upon his flushed face, but you can’t quite put your finger on it...");
	output("\n\nHe bares his teeth to you in a gleaming, snarky grin, perhaps daring you to thrust your [pc.cockOrStraponFull " + cockId + "] forward. His mischievous tail weaves around your body like a serpent, going from your [pc.arms] to your [pc.legOrLegs] before settling around your [pc.belly]. He dares to pull on you, nearly drawing you into his slick pucker. You recoil and grip him hard enough that he whimpers.");
	output("\n\n<i>“What, nervous about something, " + ratsMisterCEO() + "?”</i> he snerks. <i>“I’m not like him, you know!”</i> He jabs a look to the freckled mouse-boy. <i>“Or are you afraid you can’t handle this?”</i> he taunts, slapping his butt at you. <i>“Hurry up!”</i> he chides, snickering the whole time.");
	output("\n\nYou remind him he’ll get it when you’re ready, not the other way around - your [pc.cockOrStrapon " + cockId + "] glides through his [rat2.skinColor] valley and over the border of silken fur and moist skin. A displeased cry bursts from hips lips; he pushes his thick butt into your crotch, squirming his cock, balls, and breathing sphincter into the underside of your " + (cockId >= 0 ? "bulging urethra" : "holodong") + ". <i>“Come on... we don’t get to have much fun around here, why do you have to bully me...”</i>");
	output("\n\nUndoubtedly the smarmy bandit enjoys this, but you need to set a ground rule.");
	
	output("\n\nSoftly moaning, you lean forward, rolling your [pc.hips] in tune with his. Your [pc.hand] wraps around his needily twitching cock, and you press his tender balls into the sides of his modest girth while whispering in his quivering ear:");
	if (pc.isBimbo()) output(" <i>“Hun, you gotta be patient. You gotta <i>want</i> this!”</i>");
	else if (pc.isBro()) output(" <i>“You’ll be spreading soon, boy-toy, but only when you’re truly for it.”</i>");
	else if (pc.isNice()) output(" <i>“You can’t rush good things. I won’t start until I know you’re ready.”</i>");
	else if (pc.isMisch()) output(" <i>“Don’t sweat it, we’re going to get to the good part soon enough, but you’re kinda lagging behind.”</i>");
	else output(" <i>“It’s not bullying, it’s disciplining.”</i>");

	output("\n\nYour fingers glide through his messy hair, scritching at the sensitive base of his round ears, the obvious weak spot to any animal-eared individual! He whines in your grasp, waves of pleasure jolting through his scalp and down through his spine. The rat boy whimpers ceaselessly, but begs you for more.");
	if (cockId >= 0) output(" Pre spurts from your [pc.cocksLight] the more his spasms bounce your member.");
	output("\n\nThe already lust-swollen tip grows an inch or two bigger, hardening in your callous palm.");
	if (pc.hasVagina()) output(" The more you knead his full cum-tanks, the more your [pc.pussies] " + (pc.hasVaginas() ? "strain." : "strains."));
	output(" A jet of rat-spunk fires off between his legs, and a wail of displeasure follows his pitiful orgasm that fast fades into a dribbly white mess. <i>“L-look, I really want it, okay? I do, I do! Please, can’t you see I’m ready?”</i>");

	output("\n\nYou can see it just fine. Smirking, you wipe up a rope of halfbreed spunk and thrust your finger into his ass without warning, the walls fast encasing your digit in its warm, cavernous embrace, smearing that warm cream into his walls. A keening and very pleasured cry breaks out, <i>“Oh fuck! Yeaaah! That’s it! That’s what I wanted!”</i> he shouts, fists balling and constricting tail squeezing ever tighter. Yep, he’s ready.");
	output("\n\nAnd so are you.");
	output("\n\nNo longer interested in foreplay, you rub the [pc.cockOrStraponHead " + cockId + "] all around the ring of his asshole, slowly sinking your hips into his remarkably patient butt. The creases of too-supple skin flatten out into a perfectly moist insertion. A wet pop signals your entrance, the head of your " + (cockId < 0 ? "techno-strapon" : "[pc.cock " + cockId + "]") + " resting just inside his anus."); 
	output("\n\nHe can’t help but cum again, grunting and thrusting his body back into yours. Your crotches unite and you bottom out inside");
	if (cockId >= 0) output(", though some of your [pc.cockColor " + cockId + "] girth still throbs noticeably outside his dick-hungry bowels");
	output(".");
	if (pc.hasCocks()) output(" Your extra [pc.cocksLight] dangle helplessly, but the pre they spurt smear his fuzzy limbs with warm goo.");
	
	pc.cockChange();

	output("\n\n<i>“Ahh, it’s... Oh, it’s been a while...”</i> he murmurs, shuddering against your body. He sighs in relief, and you realize he’s already stretched out comfortably to your " + (cockId < 0 ? "holo-" : "[pc.cockType " + cockId + "] ") + "shape. With an experimental tug, you find it very easy to slide in and out of his butt without an excess of lube! <i>“Hell, it feels great! Now get to it, " + ratsMisterCEO() + "!”</i> he about orders you! The temerity of this little rat...");

	if (cockId >= 0 && pc.cockCanSting(cockId)) output("\n\nYou don’t bother holding back your arousing payload. The stingers lining your alien dick sting the feisty pirate’s innards, injecting copious amounts of lust-drug through his rectum and, sure enough, his whole body. A shrill shriek bursts from his lips and he looks to you nervously. All of a sudden your movements feel less constricted, and everything about him feels so delightfully hot.");

	output("\n\nIt gets even easier. Your next impassioned gyrations make him squeal at varying volumes. You flex your cocks left and right to bounce off his cum-button and claim other inches of unfucked thief-ass. Sympathetic droplets of potent cum join the bubbling puddle under his crotch, and more soon follow now that you know the target! " + (cockId >= 0 ? "The amount of pre you’re putting out makes it all too easy to pound his hole, and t" : "T") + "he sweat trailing down his sumptuous backside glides through the pliable gate, keeping you well lubricated and pumping savagely.");
	
	switch (rounds)
	{
		// First choice
		case 0: 
			output("\n\n<i>“That’s not fair...”</i> the rodenian girl grumbles, her tail and the mouse boy’s tail joining the action. She wraps around the halfbreed boy’s cock and the second tail angles for your");
			if (pc.balls > 0) output(" [pc.balls], lifting and squeezing your nuts and the straining sack containing them.");
			else if (pc.hasVagina()) output(" [pc.pussies], thrusting itself between your pussy lips and letting you grind against it on every squelching hump into half-rodenian ass.");
			else
			{
				output(" [pc.base], the thinner pointed end");
				if (pc.hasSheath(cockId)) output(" prodding at your [pc.sheath " + cockId + "].");
				else if (pc.hasKnot(cockId)) output(" wrestling with your [pc.knot " + cockId + "].");
				else output(" jerking the point where phallic flesh meets crotch.");
			}
			break;
		// Second choice
		case 1:
			if (rat0.hasStatusEffect("Rat Fucked"))
			{
				output("The meek mouse to the right of the exhausted rat-girl trembles as he tries to work his tail towards your");
				if (pc.balls > 0) output(" [pc.balls], eagerly teasing your [pc.sack].");
				else if (pc.hasVagina()) output(" your [pc.pussy], grinding the flat across your moist slit, making every squelching thrust into half-rodenian ass that much more satisfying.");
				else output(" [pc.baseOrSheath " + cockId + "], the thinner end working it’s way around the shape of your [pc.cockOrStrapon " + cockId + "].");
			}
			else output("\n\n<i>“D-dammit... I wanted to be next...”</i> the rodenian girl mutters, her agitated tail weaving around the halfbreed’s cock and jerking. <i>“Don’t wear [pc.himHer] out too fast, I need this just as badly!”</i> she barks to the moaning mouse.");
			break;
	}

	output("\n\nYour rhythm impels the horny half-rat to greater volume. Not willing to sit back and take it, nor merely cooperate, the roguish boi digs in, jerking himself with one hand and keeping upright with the other. You let one [pc.hand] join his, teasing the crown of his sticky tumescence, but the majority of the work is handled by his furiously jerking wrist. He moves with a blur, focused on controlling his orgasm while you climb nearer to yours with each powerful, hungry lunge.");
	output("\n\n<i>“Fuck yes... Gah... I’m just a slut!”</i> he cracks, giggling uncontrollably. He looks back to you with ever-failing strength in the face of his arousal, losing himself to the pleasure of his pounded prostate. His smile fills you with pride. <i>“Oh-oh, oh...”</i> he moans, <i>“d-d-damn, it feels so good... You really know how to work, " + ratsMisterCEO() + "...”</i> he says. <i>“Think you can make me cum so hard I won’t be standing for a while? Been awhile since that, too.”</i>");
	output("\n\nOf course you can.");
	if (cockId >= 0 && pc.cocks[cockId].volume() >= rat2.analCapacity()*3/4) output(" Your impressive endowment is already stretching him to the point he’ll be begging for just your cock in the future!");
	
	output("\n\nHunching forward, you slump on to the rat boy’s back");
	if (pc.hasBreasts()) output(", [pc.breasts] smushing against his shoulder blades");
	output(". You wrap both [pc.arms] under his, clasping to his neck and front.");
	if (pc.hasLongTongue()) output(" Your long tongue wheels around his sweat-dotted cheek by the tip, entering his accepting mouth.");
	output(" Nuzzled into his neck, breathing in the alien aroma of a horny mouse, you sense the control fading from your limbs. For however stronger your thrusts become, the slower your " + (cockId < 0 ? "faux-cock" : "[pc.cock " + cockId + "]") + " plumbs his constraining depths.");
	if (pc.balls > 0) output(" Your [pc.balls] " + (pc.balls > 1 ? "clench" : "clenches") + " at the feeling, and you know it won’t be long before you cum.");
	
	output("\n\nYou whisper lewdly into his rounded ear, feeling his swinging balls impact with");
	if (pc.balls > 0) output(" yours");
	else if (cockId >= 0) output(" your dick");
	else output(" your strapon");
	output(" after several body-shaking pumps back and forth. You both fly back and forth, crotches clashing above a widening pool of alabaster splooge. Beads of bodily fluid fly off in the shockwaves of skin-rippling impacts. Deprived for something, perhaps closeness, the [rat2.furColor]-limbed rodent makes the effort to shift his neck to face you.");
	
	output("\n\nTaken aback, you return his abrupt kiss, immediately pinning his affectionate tongue");
	if (pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.hasPerk("Myr Venom")) output(" while slathering his mouth with a helping of venomous saliva. Gods, that squeak was fucking adorable");
	output(". Muffled mewls reverb through the trench of your palate and gums, traveling down your nerves into places where they can provide just a bit more pleasure.");
	output("\n\nIt’s harder to move, but no less pleasurable. His actions mean that even the slightest movements brush your [pc.cockOrStraponHead " + cockId + "] against his satiny walls. The moans evoked vibrate your jaw and indeed your heat-blossoming body. He gags, gargles, and chokes out that he’s about to cum again. <i>“Gllrkk, I’m cuhmm...”</i> he manages before his [rat2.eyeColor] eyes shut and he falls away from your mouth.");
	
	output("\n\nThe distinction is readily apparent. In that rapturous moment of all-consuming euphoria, you press your crotch as tightly as possible to his");
	if (pc.hasAKnot()) output(", careful to leave your " + (pc.totalKnots() > 1 ? "knots" : "knot") + " outside");
	output(". He writhes in your grasp, using what little self-control he has to churn out his loads. Cum begins to spurt from his uncorked dick. The rhythmic contractions in his lower body push you over the edge - he takes your hands and squeezes his tail, holding tight to you when you join him.");
	if (pc.hasVagina()) output(" Your [pc.pussies] " + (pc.hasVaginas() ? "herald" : "heralds") + " the onset of eye-blurring contractions, " + (pc.isSquirter() ? "squirting" : "spraying") + " all along the floor.");
	output("\n\nClaiming a boy has never felt so fucking good.");
	
	var cumQ:Number = pc.cumQ();
	if (cockId < 0) output("\n\nGripping your plate-eared rascal, you feel the shock of orgasm smash your nervous system to atoms, you cry out from every erotic sensation " + (pc.hasVagina() ? "forcing your [pc.pussies] to clamp down, rivers of [pc.girlCum] flooding your connected legs" : "rewriting the receptors of your body to feel only pleasure") + ". Your violent tremors outdo his. Riding the waves was one thing, but lying on top of him makes the comedown simply phenomenal.");
	else if (cumQ < 100)
	{
		output("\n\nThe tightening of his climaxing body eases out the first rope of several. [pc.CumVisc] [pc.cumNoun] squirts and spurts into the half-rat. His raspy moans join yours with every throb of your twitching tool. Your [pc.cockHead " + cockId + "] twitches, massaged from all angles, making every surge from your [pc.balls] an easy and relaxing experience.");
		if (pc.hasCocks()) output(" The lonely, unholstered [pc.cocksLight] squatting outside " + (pc.cocks.length > 2 ? "makes" : "make") + " meager deposits of [pc.cum] onto the rat-boy’s fuzzy legs, and you smear the heads against his smooth rump, drawing a brand new border of [pc.cumColor] seed along his mixed heritage.");
	}
	else if (cumQ < 500)
	{
		output("\n\nThe half-rat’s sputtering body becomes the vibrator that makes every shot of [pc.cumVisc] [pc.cumNoun] come with gusto. The swell of your urethra against his spasming hole, the very intimate feeling of your depositing virility forcibly spreading him on every spurt makes you cum <i>harder</i>. Massaged from all angles, every seed-filled wave that distends his belly is a relaxing if straining experience.");
		if (pc.hasCocks()) output(" [pc.EachCock], lonely and unfulfilled, paints the halfbreed’s furry legs with [pc.cum], and you make sure to smear the head against his ass, grinning as you finally run dry. You don’t forget to draw a [pc.cumColor] line on his thigh to mark a new border between his mixed heritage.");
	}
	else
	{
		output("\n\nYou’re not sure what the boi is expecting from you, but you’re sure that he’s pleasantly surprised by his bulking belly. [pc.CumVisc] [pc.cumNoun] pries apart his asshole, your cum-tube filling with an unmatched volume of virility, hosing his innards with the molten-hot spunk he’s been craving. Heart and cock unite, pulsing in sync as you rock back and forth, the amount of jism you’re outputting beginning to spill out around your [pc.cockColor " + cockId + "] pillar.");
		if (pc.hasCocks()) output(" Making sure he looks claimed, your unholstered [pc.cocksLight] twitch violently with every eruption of [pc.cum], his ass, his back, and his legs all being drowned in [pc.cumColor] sperminess.");
	}

	output("\n\nExhausted by the encounter, the half-rat slumps and crashes into a puddle of his own making. You lie on top of him for a few seconds, breathing into his ear, whispering a few sweet nothings before rising. You withdraw your [pc.cockOrStrapon " + cockId + "] from his loose bum");
	if (cockId >= 0) output(", the evidence of your tryst leaking out");
	output(".");

	addButton(0, "Next", function():void
	{
		clearMenu();
		clearOutput();
		showRats(3, true);
		
		output("Collecting your breath,");
		switch (rounds)
		{
			case 0: output(" you glance at his friends, wondering if you can handle them, too."); break;
			case 1: output(" you glance at the last upright rat, considering your stamina..."); break;
			case 2: output(" you eye up the defeated trio, who lost to you in a fight and then succumbed to your ironclad endurance. Nice."); break;
		}
		output("\n\nIt takes some effort to keep your eyes off the rat boy’s leaking bum. You’re strongly considering one more go with this buttslut of a rogue, really asserting yourself on him even if it means your audience is going to be left alone...");

		ratsDoggystyleChoices(cockId, rounds, rat2);
	});
}

public function ratsKeepPlayingFaccaratBoy(args:Array):void
{
	clearMenu();
	clearOutput();
	showRats(2, true);
	var cockId:int = args[0];
	var rounds:int = args[1];
	processTime(5);
	
	output("Come to think of it, he gave you some snark when you started. If he wants a good reaming, then you’ll give him all you’ve got.");
	output("\n\n<i>“H-huh?”</i> he shifts his weight in resistance, but setting him up on all fours is of course no problem. <i>“W-w-w-wait you’re kidding!”</i> he protests, trying to scooch away from you. <i>“Oh stars no, that was enough!”</i> You grip his [rat2.skinColor] ass cheek, squeezing until he flinches. <i>“Ouch!”</i> The sultry inhalation and lust-laced voice both betray his arousal, as does the straining cock swaying between his legs.");
	output("\n\nYour own body protests too, and you can feel the burn on every bulging tendon. There’s a moment where you reconsider what you’re about to do. But on the next moment, you shove your [pc.cockOrStrapon " + cockId + "] right back into his agape boy-hole.");
	output("\n\n<i>“Ach!”</i> he winces");
	if (rounds < 2) output(", the other " + (rounds == 0 ? "rats" : "rat") + " looking on in envy");
	output(". Both you and the half-furred rodent boy arch back gasping more than anything else");
	if (cockId >= 0) output(" -- you didn’t even give yourself time to bead up a fresh coat of pre");
	output(". <i>“Mmmf,”</i> his entire body spasms like a girth-encapsulating vibrator around your");
	if (cockId >= 0) output(" pre-oozing");
	output(" tool, sending the pleasure right back. <i>“Fuck it. Do what you want! If I get you to myself that’s fine by me!”</i>");
	
	output("\n\nYou pat his butt");
	if (pc.hasBreasts()) output(" and pinch the [pc.nippleColor] erections on your [pc.breasts]");
	output(", hissing through your teeth waiting for the pressure to equalize downstairs.");
	if (pc.isLactating()) output(" [pc.Milk] sprinkles out onto his back. <i>“Ah, so warm...”</i>");
	output(" You draw your hand back to his head, planting it firmly between his ears and in the knotty locks of [rat2.hairColor] hair he has, telling him to get ready.");
	if (pc.hasVagina()) output(" The longer you wait, the more your [pc.pussies] " + (pc.hasVaginas() ? "drip." : "drips."));
	output("\n\nThe rodent’s rectal ring widens on every thrust");
	if (cockId < 0 || pc.cocks[cockId].volume() < rat2.analCapacity()/2) output(", and you add enough weight to your [pc.hips] to go balls-deep");
	output(". You’re fucking him as deep as " + (cockId < 0 || pc.cocks[cockId].volume() < rat2.analCapacity() ? "possible" : "your admittedly monstrous length can go") + ". Husky yelps of delight bounce off the walls and probably reach others on the station. You briefly wonder if others might show up and join the orgy - it’s almost like he wants that to happen.");
	
	output("\n\nTaking him by his wrists, you plow the little bandit, uninterested in a slow, tentative pace. The slaps of [pc.skinFurScalesNoun] against flesh are all you care to hear, and the blossoming orgasm down below. You can’t identify the smells in the air, and you’ve no time to figure out much past the fact it smells like salt, sweat, and sex. Thief’s ass cushions aggressive collisions, but not nearly as well as that gifted rodenian’s might.");
	output("\n\nSweat " + (cockId < 0 ? "runs" : "and cum run") + " down his ass in thick rivulets, making it impossible to hold on now. It doesn’t hinder you at all. While searching for another handhold you press him into the ground, forcing the limp rat to go prone while you hump his spine as much as you rearrange his innards. His squirming is utterly stilled below your body weight, and his anus can’t hope to stretch back around your invading " + (cockId < 0 ? "holo-dick." : "dick."));
	output("\n\nGirly hips in the air, the mouse-runt’s hands are on autopilot, protecting his junk from the abrasions of the floor while also jacking in constant, aching motions. Your [pc.cockOrStrapon " + cockId + "] has absolutely no difficulty gliding through his well-lubed and loosened ass, squeezing into entirely different or far deeper butt-nerves. Panting like a dog you cradle his head, deliriously running a hand down his glutes to his ass, his cock, whatever you can do to help him climax, because you’re about to be carried away by your own.");
	output("\n\n");
	if (pc.isLactating()) output("Your [pc.milkyNipples] smear [pc.milkNoun] into the rodent’s back, so stiff that they first scratch with the rigidity of their erection and soothe with the warmth of their [pc.milkVisc] filling. ");
	output("A minor orgasm shatters your sense of coherency.");
	output("\n\nThe same can be said for him.");

	var cumQ:Number = pc.cumQ();
	if (pc.isHerm()) output("\n\nYou " + (cumQ < 500 ? "singe" : "bloat") + " his belly with another hearty deposit of [pc.cum], urethra squishing outwards to help stretch him out just another inch or two. While your next messy load fills his guts, your [pc.pussies] " + (pc.isSquirter() ? (pc.hasVaginas() ? "squirt" : "squirts") + " [pc.girlCum] in searing arrows" : (pc.hasVaginas() ? "sprinkle" : "sprinkles") + " [pc.girlCum] in hot flashes") + " of mind-numbing effluence.");
	else if (pc.hasVagina()) output("\n\nThe hardlight strapon bombards your loins with another nerve-exciting payload. [pc.EachVagina] " + (pc.hasVaginas() ? "clench" : "clenches") + " around phantom penetrations and " + (pc.isSquirter() ? "squirt [pc.girlCumNoun] in searing arrows" : "spray [pc.girlCumNoun] in hot flashes") + " against the ground.");
	else if (pc.hasCock()) output("\n\nThe little thief’s stomach " + (cumQ < 500 ? "is singed" : "bloats") + " with a fresh deposit of [pc.cum]. The stretching of your squishy spunk-tube helps spread him a little wider.");
	else output("\n\nYour brain is forced to restructure to handle the sensory bombardment, and the stress on your nervous system equalizes.");
	output("\n\nSputtering like a hose, the [rat2.furColor]-furred outlaw slumps, tongue hanging from his slack face. After that, he <i>has</i> to be permanently stretched. At the very least, it’ll be a long time for this hole to tighten up naturally.");
	output("\n\nBut you aren’t done with him just yet.");
	
	addButton(0, "Next", ratsEnoughRatFuckingForNow, 7);
}

public function ratsEnoughRatFuckingForNow(rounds:int):void
{
	clearMenu();
	clearOutput();
	showRats(3);
	processTime(5);
	
	switch (rounds)
	{
		case 1: 
			output("Whether they like it or not, you’re done here. Satisfied with");
			if (rat0.hasStatusEffect("Rat Fucked")) output(" the rodenian experience");
			else if (rat1.hasStatusEffect("Rat Fucked")) output(" the mouse-boy’s pounding");
			else if (rat2.isMale()) output(" the halfbreed boy’s eagerness");
			else output(" the half-rat girl’s two holes");
			output(", you stand and get ready to go.");
			output("\n\n<i>“W-wait... Are you leaving already? Aw, no!”</i> one calls in dismay");
			if (!pc.isNude()) output(", watching you throw your clothes back on");
			output(".");
			output("\n\nThey set upon each other, anxious to relieve their pent up lusts, having expected you to take care of them all.");
			if (ratsPCIsGood()) output("\n\n<i>“F-fine, but please don’t leave us like this again, [pc.mister] CEO!”</i>");
			else
			{
				output("\n\n<i>“W-whatever... Next time you want to do this you better not waste our time...”</i> the");
				if (rat0.hasStatusEffect("Rat Fucked")) output(" spent");
				output(" rodenian girl barks before her lust-addled friends set upon her.");
			}
			output("\n\nTheir moans carry on for quite some time.");
			break;
		case 2: 
			output("Deciding it’s for the best, you calm yourself down before collecting your belongings. As the only one left standing, the");
			if (!rat0.hasStatusEffect("Rat Fucked")) output(" rodenian");
			else if (!rat1.hasStatusEffect("Rat Fucked")) output(" mouse-boy");
			else if (rat2.isMale()) output(" halfbreed boy");
			else output(" half-rat girl");
			var maleRat:Boolean = (rat2.hasStatusEffect("Rat Fucked") ? !rat1.hasStatusEffect("Rat Fucked") : rat2.isMale());
			output(" doesn’t seem all that perturbed by your passing. Sure, " + (maleRat ? "he" : "she") + " squeaks disappointedly seeing you getting ready to leave, but " + (maleRat ? "he" : "she") + " got " + (maleRat ? "his." : "hers."));
			if (ratsPCIsGood()) output("\n\n<i>“T-that was f-fun, [pc.mister] CEO...”</i> the rodenian sputters, her bright [rat0.eyeColor] eyes on yours. <i>“But please try and finish your meal next time, huh?”</i>");
			else
			{
				output("\n\n<i>“N-next time, you better be able to handle us all at once, don’t make us waste our time, " + ratsMisterCEO() + "!”</i> the");
				if (rat0.hasStatusEffect("Rat Fucked")) output(" spent");
				output(" rodenian husks.");
			}
			output("\n\nYou’ll see.");
			break;
		case 3:
			if (pc.isTreated() || pc.isBimbo() || pc.isBro() || pc.hasPerk("Snu-Snu Queen") || pc.hasPerk("Energizing Libido") || pc.hasPerk("Amazonian Endurance") || pc.libido() > 100) output("You’ve thoroughly fucked three rats and you feel like you could keep going, but considering the state of ‘em, you’re not interested in putting them in some sexual-induced coma! They got off just fine.");
			else output("You struggle to catch your breath after sexually subduing three rats, and you can hardly think about continuing in this state. Your groin is so fucking numb and lifeless that standing is a challenge.");
			output("\n\nOnce you collect your things");
			if (!pc.isNude()) output(" and throw your clothes back on");
			output(", you watch the trio, lying in puddles of your making and theirs, slowly come to and sit up. They’re not really all there, but they’re lucid enough to recognize you.");
			if (ratsPCIsGood()) output("\n\n<i>“F-fuck, that was so much fun, [pc.mister] CEO..!”</i> the rodenian squeals, throwing her head back. <i>“We didn’t expect anything less from a" + (pc.tallness >= 6*12 ? " big" : "n") + " awesome [pc.guyGirl] like you!”</i> Aww.");
			else output("\n\n<i>“That was... really good, " + ratsMisterCEO() + "...”</i> the rodenian husks. <i>“D-damn... You really know how to show people a good time...”</i> Hell yes you do!");
			output("\n\nYou give them a little wave as you head on, their quiet moans fading into the background.");
			break;
		case 4:
			output("Your body’s just as sensitive in your sleep, if not more, than when you’re horny. You don’t know when or how you passed out, but those thoughts washed away on currents of sanity-eroding euphoria. You fucked a rat girl, a petty thief, and were gifted with something inexplicably wonderful for it. When your [pc.eyes] flutter apart and the quiet background thrums of Zheng Shi at work return, you find yourself lying behind that [rat0.furColor] mouse");
			if (pc.isNaga()) output(", and she’s coiled up in your [pc.leg] for safety");
			output(".");
			output("\n\nBreathing has also never felt so easy. After taking stock of your situation, you find the other two rats snoozing incapacitated. You run a [pc.hand] through the rodenian’s [rat0.hairColor] hair to wake her, already unraveling from the tryst. Her wobbly ears flare while she scrabbles to her feet, shaking her head and looking fiercely satisfied.");
			output("\n\n<i>“That was something else wasn’t it?”</i> she says in her sharp voice, grinning. ");
			switch (ratputation())
			{
				default:
				case RatsRaider.RAT_REP_NONE:
				case RatsRaider.RAT_REP_LOW: output("<i>“But don’t get any ideas, " + ratsMisterCEO() + "! You got your reward for this battle, but we’re not through!”</i>"); break;
				case RatsRaider.RAT_REP_MID: output("<i>“I bet you think you’re something else, [pc.mister] CEO! But this isn’t over, not by any means. You’ll be paying up soon!”</i>"); break;
				case RatsRaider.RAT_REP_HIGH: output("<i>“Just because you’re a good lay doesn’t mean anything. Next time, you’re still gonna be payin’ up!”</i>"); break;
				case RatsRaider.RAT_REP_GOOD_CEO: output("<i>“I really enjoyed that. Thanks, [pc.mister] CEO!”</i>"); break;
			}
			output("\n\nShe goes about waking the other two in a uniquely unpleasant manner, not too far off from the attitude of a drill sergeant. When they have their armor back on and are holstering their weapons, they " + (ratsPCIsGood() ? "wave cutely at you" : "wag their fingers at you") + ", <i>“Don’t get hurt, okay? We’ll be back for more, just you wait!”</i>");
			output("\n\nThe rats dart down a random corridor, leaving you to get going.");
			break;
		case 5:
			output("All you can do when consciousness returns is breathe. It’s not too difficult, thankfully. There’s no constant pressure, no firmness in anything. Awakening is somehow relaxing in its own way, and when your [pc.eyes] thrust open, half-blurred, you see why. The mouse-boy is lying next to you, head snug to your [pc.chest] and an arm around your neck. You " + pc.mf("rub a hand over his head", "kiss him on the forehead") + " to wake him");
			if (pc.isNaga()) output(", slowly uncoiling your [pc.leg] from around his lower half");
			output(".");
			output("\n\nBefore he opens his mouth a rush of red dominates his cheeks, a blush that deepens the longer he stares at you. When his tail comes to life and his ears begin to flex, he bashfully" + pc.mf("", " kisses you back and") + " decouples, shivering naked but quite satisfied.");
			if (ratsPCIsGood()) output("\n\n<i>“I hope you enjoyed that, [pc.mister] CEO!”</i>");
			else
			{
				output("\n\n<i>“That was fun");
				if (ratsPCIsKnown()) output(", [pc.mister] CEO");
				output(",”</i> he smiles.");
			}
			output("\n\nHe goes about waking his friends, who jump back to attention like they heard the morning bugle. After they redress and rearm, the rodenian girl stares you down while the mouse-boy waves and smiles out of her view. <i>“Don’t get hurt, okay? We’ll be back for you, just wait! And when we do, you’re gonna be paying us with interest!”</i>");
			output("\n\nShe wags a finger cutely before dashing into the dark with her friends, leaving you alone.");
			break;
		case 6:
			output("Your dreams are filled with depraved fantasies of unleashing payloads into pussies");
			if (pc.hasVagina()) output(", and having some fired right into yours");
			output(". It’s only natural you have such vivid lusts after ravaging a mouse-girl’s cunt. For how thoroughly you fucked and claimed her, there’s a part of you that feels like the job just isn’t done. Whatever the case may be, you’re finally washed up on shore by that tidal wave of need, and the noises of Zheng Shi, for better or worse, return to you.");
			output("\n\nThe half-rodenian girl is snoozing happily, head snug to your [pc.chest]. Even her ears seem intent on hugging you. Unsurprisingly the air reeks of sex and rat-jizz. After running a [pc.hand] through her hair, her [rat2.eyeColor] eyes flutter open and she titters at you. She plants a hard smooch on your collar and kisses you on the cheek, even drifting to your [pc.lipsChaste]. It’s getting you in the mood all over again.");
			output("\n\n<i>“You fuck so well");
			if (ratsPCIsKnown()) output(", [pc.mister] CEO");
			output(",”</i> she huffs between fat, adoring licks of your neck and cheek.");
			if (ratsPCIsGood()) output(" <i>“You gotta meet our boss as soon as possible. When you get upstairs you’re gonna stay with me in my bed for a day! I’ll be thinkin’ about " + (pc.hasCock() ? "your dick" : "you") + " until you come ‘n ravage me real proper, ‘kay?”</i>");
			else output(" <i>“I don’t care if you’re a " + (ratsPCIsKnown() ? "stuffy CEO" : "random [pc.guyGirl]") + ", I hope you win again. You inside me is the best thing ever. But don’t tell them that, ‘kay?”</i>");
			output("\n\nShe kisses you, stands, and you slap her on thickest part of her ass. The sound wakes the other two, who jump to readiness as if roused from the barracks. Once they’re geared up again, the halfbreed girl blows a kiss while her de-facto leader " + (ratsPCIsGood() ? "simpers" : "glowers") + " at you. <i>“You be careful, okay? Zheng Shi isn’t safe unless you’re a big dumb fuckbunny. See you later");
			if (ratsPCIsKnown()) output(", [pc.mister] CEO");
			output("!”</i>");
			output("\n\nWhen they go, you get ready too.");
			break;
		case 7:
			output("There’s such a brief moment of unconsciousness that you are left struggling with recollection more than your position. How long were you out? How long did you go? Whatever the case, the half-rodenian boy is curled into a ball and snuggled into you, snoozing with his tail wrapped around your body.");
			if (pc.isNaga()) output(" Your tail, however, is wrapped around his entire lower half, and the rhythmic squeezes of your [pc.leg] soon wake him from slumber.");
			output("\n\n<i>“Hey,”</i> he says, slightly hoarse. Before anything else he plants a kiss on your [pc.lipsChaste]. <i>“Not bad at all, I felt every bit of it. Wonder if... that’s your best?”</i> He grins, but you pinch his ear and tell him to get going before you leave him gaping even wider. You see the blush spread across his face as he wakes the other two.");
			if (ratsPCIsGood()) output("\n\n<i>“I-I don’t think that’ll be necessary. But keep me in mind. I’ll </i>always<i> be ready to play,”</i> he winks.");
			else
			{
				output("\n\n<i>“I’ll be looking forward to it again");
				if (ratsPCIsKnown()) output(", [pc.mister] CEO");
				output(", if you can win!”</i>");
			}
			output("\n\nThe trio gear up again, and while the cocksure rodent-boy glances provocatively at you, the rodenian simply stares and folds her arms. <i>“When we get back, you’ll be paying more, each and every time. So you get ready");
			if (ratsPCIsKnown()) output(", [pc.mister] CEO");
			output("!”</i> She points a finger, winks too, and flees into the unknown with her friends.");
			output("\n\nNothing left to do but do the same.");
			break;
	}

	if (rounds > 3)
	{
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		processTime(2*60 + rand(116));
	}
	
	IncrementFlag("RATS_POUNDED");
	
	ratsVictoryFinish();
}

//Stack 'Em

public function ratsOnRatsForVoraciousFucks():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);

	output("No way you’re going to miss this chance.");
	if (pc.isBimbo() || pc.isBro()) output(" Think of how much you would have to pay to get this kind of service anywhere else! And why else did you grow all those dicks anyway!?");
	output(" Your [pc.multiCocks] resonate powerfully with the supremely lewd idea blazing trails through your hypercharged cerebrum. Stacking these three rats on top of each other, and ramming your turgid boners in them all at once... You’ve got the length to make it work, and there are " + rat2.mf("three", "four") + " holes waiting for you. Why go one by one, when you can go <i>all in</i>?");
	output("\n\nStupidly thick ropes of prejaculate ravage the floor as an unyielding sexual curiosity assumes control of your body. The rodents identify with your hunger straight away,");
	if (flags["RATS_POUNDED_ALL"] == undefined) output(" so much so they become a little nervous.");
	else output(" and they know exactly what you’re thinking.");
	output("\n\nYou fall to the bandit’s levels, your uncontrollable excitement beaming on your face. Before the thieves can say anything, you grip the rodenian girl’s shoulders and pull her towards you. Yelping, her ample bosom crashes into yours before you twirl her around. Blinking twice, her big ears twitch in the aftermath as you look to her friends.");

	if (pc.isBimbo()) output("\n\n<i>“I’ve got some sweet, sweet plans for you three! Lie face down, and keep your legs spread!”</i> You usher the bandit boy into position, then the half-rat [rat2.boyGirl] next to him. <i>“Just like that!”</i> Watching the [rat2.furColor]-limbed mouse lie atop [rat2.hisHer] friend is adorable! You push the rodenian in your hands down until she’s docked on the halfbreed’s back. <i>“Fucking beautiful, omigod!”</i> you squeal. It’s just like in the mags!");
	else if (pc.isBro()) output("\n\nA big dumb grin on your face, you point at the mouse-boy, <i>“Face down, flatten yourself now. And you, on top. Keep those legs spread.”</i> The orders are followed, and soon you have two little rogues stacked on top of each other. Satisfied, you throw the rodenian leader on top and admire the image. <i>“Good, good. You three are about to enter a world of pleasure. Oh wait, that’s my job...”</i>");
	else if (pc.isNice()) output("\n\n<i>“Do me a favor... lie down there, stay flat,”</i> you say to the mouse-boy, who quickly follows your command. <i>“Now you,”</i> you glance at the half-rat [rat2.boyGirl], <i>“lie on top, and mind your legs, okay?”</i> In seconds, the two rats are now pressed against each other, and to finish your little pirate sandwich, you nudge the rodenian girl down until she’s lying atop the halfbreed’s back. <i>“That is... perfect!”</i> you say.");
	else if (pc.isMisch()) output("\n\n<i>“There’s no way I’ll be able to satisfy you three fully unless we get creative. So, why don’t we put ourselves together? You,”</i> the trappy freckled boy perks up, <i>“face down, lie flat and spread your legs. You, get on top!”</i> The rogues comply, the half-rat [rat2.boyGirl] soon lying atop meek mouse. Nodding, you foist the rodenian on top, completing the position. <i>“Nice...”</i> you whisper. It’s almost too good to believe.");
	else output("\n\n<i>“You three are in for a treat... You, face down, and you, on top.”</i> Meekly submitting to your orders, the effete mouse-boy lies down and spreads his legs, the half-rat [rat2.boyGirl] following suit. Now on top of each other, you throw the rodenian girl atop the rat sandwich, grinning. <i>“Now you’re ready.”</i>");

	if (ratsPCIsGood()) output("\n\n<i>“You know best [pc.mister] CEO, but are you sure you can handle us like this? If you can’t, we’re gonna take our consolation prize when you pass out!”</i> the rodenian says, smirking at you.");
	else output("\n\n<i>“G-geez, we’ll give you points for the set-up but are you sure you can handle something like this?”</i> the rodenian asks, her feet hovering above ground.");
	output("\n\nYour reply is a silent touch to the art you’ve created, a smooth, respectful caress. You run your [pc.hand] across one ass to the next, and to the one above it, then fall to your knees. You moan into their loins, licking one hole, the next... There’s so much ass to go around" + rat2.mf(".", ", and a pussy too!"));
	output("\n\nThere’s a hint of salt in the strange base of rat sweat ");
	if (rat2.isFemale()) output(" and mouse-cunt");
	output(". You lap at the half-rodenian’s " + rat2.mf("butt", "pussy") + " and finger the other two. The tower of crime wobbles back and forth as legs and clawed toes curl and frequently vie for comfortable space. " + rat2.mf(" Cocks strain against discarded suit and boyflesh; the mouse-boy jerks himself beneath his friends, though the halfbreed boy has no such luxury. He relies on the energy surrounding him to handle his pleasure now.", "The mouse-boy whimpers, jerking himself beneath his friends. "));
	output("\n\nYou knead one pair of cheeks, slap the other, and hump the third; arousal builds, reaching another purple-hued level. Your [pc.cocks], polished like spears, thrust between thigh, leg, crotch, whatever gap in this cake needs filling.");
	if (pc.hasLongTongue()) output(" Your [pc.tongue] is all over the " + rat2.mf("three", "four") + " presented holes, slobbering like a dog in heat. Often times the length twitches against your dicks.");
	output(" Hips thrust back into your [pc.face], " + rat2.mf("smearing sweat and some pre.", "smearing sweat, pre, and some pussyjuice."))
	output("\n\nStrained moans squeeze past dry lips, breathy whispers and murmurs follow. Held horizontally by each other’s cushioning bodies, the rats try to hold themselves steady. The crisp scent in the air finalizes your self-lubrication.");
	output("\n\nThere’s no better time to start.");

	processTime(5);
	pc.changeLust(pc.libido()/10+5);
	addButton(0, "Next", ratsRatsRatsStackedStackedStacked);
}

public function ratsRatsRatsStackedStackedStacked():void
{
	clearMenu();
	clearOutput();
	showRats(3, true);
	processTime(55);
	
	var vagFuck:Boolean = rat2.isFemale() && pc.cocks.length > 3;

	output("You take a deep breath and start manhandling your [pc.multiCocks]. You’re so hard that moving them around applies obscene amounts of pressure to your groin, like they’re firmly set pipes. Not only that, they’re uncooperative. The closer you get to penetrating one of the rats, the faster your heart beats and the more they throb away from the booty you aim to plunder. Gulping, you ignore the squirming tails brushing their ribboned tips around your prickflesh, and press the rodenian girl down. Needy mice arch up or down to help you get an angle, but it’s not going to get any easier from here.");
	output("\n\nBowing your [pc.legOrLegs], you direct your first [pc.cockNoun] to the [rat1.skinColor]-skinned boy’s butt, the [pc.cockHeadNoun] spreading his softest flesh. Your cumslit dribbles enough slick preseed into his supple entrance that you can tell your prostate is on overdrive, too.");
	output("\n\nHolding that position, you swivel your [pc.hip] up and level your other cocks with the remaining " + (vagFuck ? "three" : "two") + " holes. <i>“F-fuck, I can’t wait, c’monnnnn”</i> the half-rat [rat2.boyGirl] whines. <i>“I’m gonna cum before you even start!!”</i>");
	output("\n\nYou mischievously squeeze the " + rat2.mf("pair of balls", "fat clit") + " poking out at you from the center of the rat pile before moving " + (vagFuck ? "one dick" : "two dicks") + " closer. Cock-drool runs like rain all over their backsides. Lust boils away the edges of your vision, leaving narrow strips of orgiastic color. It takes a lot of self control not to cum, to not even think about what you’re about to do long enough to start fucking. The pulses of spurting [pc.cumColor] dickjuice upset your balance");
	if (pc.balls > 0) output(", the jiggling and jostling of your [pc.sack] against your throbbing mouse-breakers disrupts your concentration to an extreme fault");
	output(".");

	output("\n\n");
	if (pc.hasVagina()) output("Your [pc.pussies] " + (pc.hasVaginas() ? "make" : "makes") + " a habit of assailing your rationality as " + (pc.wettestVaginalWetness() < 3 ? "thin streams of fem-drool run down your [pc.thighs]." : "rivers of girljuice pour into an imaginary bucket underfoot."));
	output(" Finally, you inch your third dick up to the rodenian’s loose asshole, her tail shooting up and around your shoulders. The other two can’t see you from their positions, but she can, and she watches you <i>intently</i>. <i>“You gonna do it or what, " + ratsMisterCEO() + "?”</i> she snerks. <i>“Or you just gonna cum all over us and call it quits?”</i>");
	output("\n\nHer spiteful, raspy purrs bounce your members. The squeezes around your [pc.belly] help balance you. The promise of penetration contrasted against the harassment of their hypnotic hips... Fuck... Here goes nothing...");
	output("\n\nInhaling, <i>shivering</i>, you grip your lowermost [pc.cockNoun] and bite your lip. You push your lube-glistening rod forward. Your [pc.cockHeadNoun] coaxes the mouse-boy’s sphincter open. The lacquered tip, aided by buckets of glide-slime, powers through his ring with a wet pop. It doesn’t take long for your girth to spread him wide.");
	output("\n\nLow moans overtake the air waves, ");
	if (rat1.analVirgin)
	{
		output("<i>“T-that was, oh... I’ve never done that before!”</i>");
		if (flags["RAT_ANUSES_TAKEN"] == undefined) flags["RAT_ANUSES_TAKEN"] = 0;
		flags["RAT_ANUSES_TAKEN"] |= 1<<rat1.ratVariety;
		rat1.buttChange(pc.cocks[1].volume());
	}
	else output("<i>“Ah, that was... That was easy...”</i>"); 
	output("\n\nYour " + (vagFuck ? "your centered cocks" : "next dick") + " spearing the half-rodenian [rat2.boyGirl], " + (vagFuck ? "claiming her pussy and ass in sync" : "claiming " + rat2.mf("his tail", "her pussy")) + ". Shuddering, blissed out, and nearly there, your teeth chatter between loud grunts. Ramming your [pc.cockNoun] into the [rat0.furColor] rat’s butt is the final act of this prelude.");
	
	pc.cockChange();

	// PC is amazonian/treated/bimbo
	if (pc.isTreated() || pc.isBimbo() || pc.isBro() || pc.hasPerk("Snu-Snu Queen") || pc.hasPerk("Energizing Libido") || pc.hasPerk("Amazonian Endurance") || pc.libido() > 100)
	{
		output("\n\nYou’re no stranger to sex, and you’re definitely no stranger to the more obscene acts of lewdness in this universe. But when you push deep into all three rats at once, when you claim the asses");
		if (vagFuck) output(" (and pussy!)");
		output(" of three silly criminals, a wave of pleasure that can only be described as cataclysmic slams into you from every direction.");
		output("\n\nSomething tells you that this kind of pleasure was never meant to be experienced by a lower life form, but <b>holy fuck</b> is being the snake in three gardens worth the threat of losing yourself to an exotic leisure experience without equal. United in orgasmic stupor, the vibrations of their bodies drain your mouth of spit and your cocks of pre. Your wails are enough to shake the station and the asteroids around it.");
		output("\n\nAnd it’s fucking worth every second of feeling like your entire body is about to explode from the gargantuan sexual pressure now crushing it.");
	}
	else
	{
		output("\n\nThat thrust pushed you deeper into all of them at once. Feelings that were never meant to be experienced by mortal life trigger a nuclear reaction in your hormones. The collective friction of three butts");
		if (vagFuck) output(" and a tight, clenching pussy");
		output(" are in no way describable, least of all by you: the incoherent babbles fleeing your slavering mouth have the trio extending their sympathies. Innate functions such as remembering to stand, being able to see and hear, to recognize and interact with reality around you are either no longer applicable or fast getting to that point. The unanimous contractions you trigger in the wide-eared bandits shunts the breathing world away, leaving you desperate for more.");
	}
	
	output("\n\nIt takes... It takes more than a moment to adapt. Monumental effort is required to control your lusts, and what you spend on that takes away from other overstressed bodily functions. Their holes tighten around your thickened brace of manmeat so much that pre backs up inside your cocks, sloughing inside. Frustrated that they have nowhere else to go, those prostate puddles take their anger out on you by fighting against their searing prison, pushing outwardly from your poor crotch and scaling the pressure by a few mathematical magnitudes.");
	output("\n\nIt’s nothing short of penile oppression.");
	if (silly) output(" It’s all in the numbers. Number one, that’s terror. Number two, that’s terror.");
	output("\n\nYou slump " + (pc.tallness < 5*12 ? "face-first into the mouse-alien’s ass" : "down on to the rodenian’s back") + ", gargling like some mental patient. Spittle froths at your [pc.lipsChaste] and you nearly bite the [pc.tongue] wildly slapping in your mouth. Your pants devolve into hoarse whines by the time you’re able to take another step inside. The brain and the body can adapt");
	if (pc.lustQ() > 75) output(", and fortunately it’s getting closer faster than anyone else might experience.");
	else output(", but it sure as hell isn’t adapting fast enough.");
	output("\n\n<i>“G-gahhh!!”</i> one squeals. <i>“T-this is... Not being able to move make this so much harder!”</i> the half-rat whimpers. They may not be able to move, but you can.");
	output("\n\n<i>“T-there’s no way this is going to work!”</i> the mouse-boy cries. <i>“This won’t woooaackk-”</i>");
	output("\n\nYou didn’t shove all this cock in just to stop now! It’s going to work, it has to!");
	output("\n\nSteam billows from your flaring nostrils, a sign of the effort it takes just to hold your ground. The musk billowing through the air doesn’t help much past lurching you into the next thrust, deep as you possibly can, their bodies tightening around you again. Pre-seed plummets through the six-rippling-cheeked channel of smooth and fuzzy derriere, flooding the area you’re in. It has to equalize, somewhere, somehow...! <i>Fuck!!</i>");
	output("\n\n<i>“G-guys... We need to... We need-!!”</i> the [rat0.furColor] rodenian husks, <i>“...TO CALM DOWN! If we just sit here cumming our brains out we’re not gonna get anywhere!”</i>");
	output("\n\n<i>“Y-y-y-eah... Oh stars, it feels so good as is... It’s too hard to-”</i>");
	output("\n\n<i>“Yes, I know, <b>IT’S FUCKING HARD!</b>”</i> she barks, fists slamming into the half-rat’s sides with tiny wet smacks. <i>“Y-yooooou <i>ughh</i> know what else was hard? Snatching those expensive dildos from that Tamani courier! I wish we kept them, because those would have been good practice in the off-chance some " + (ratsPCIsKnown() ? "stranger" : "CEO") + " came stomping around to stick [pc.hisHer] huge dicks in us!”</i>");
	output("\n\n<i>“B-but I can’t feel my legs, how is this going to feel good at all!?”</i> the mouse-boy timidly asks, more like a girly cry.");
	output("\n\n<i>“Well if you... if youahhhhhhhHAAA”</i> she growls at the raking of your overindulging boners. <i>“Ugh! If you’d STOP CRYING- and STOP- worrying about the size then we might actually get this over with!");
	if (ratsPCIsGood()) output(" N-not that I want it over with quickly, [pc.mister] CEO!”</i> she corrects, glancing at you cutely.");
	else output("”</i>");
	output("\n\nIncredibly, their quibbling eases the fluid-blocking compression on your [pc.multiCocks], your plumbing finally having a chance to push out the obstructed flow. The bathtubs of dick-slime finally pumping into three rat’s nests makes the back and forth easier, easier, and fuuuuck now this is getting somewhere. The mood changes for the better, and you feel like you’re getting a grip on everything!");
	output("\n\nYou’re certainly getting a grip on rodenian ass. It doesn’t matter if it’s the [rat0.hairColor] rat’s, the half-rat’s... You just need to hold on, because this ride is about to start.");
	output("\n\nUnthinkingly, you withdraw until [pc.eachCockHead] are just barely inside your conquests, reveling in the hellishly frictious stroke of [pc.cockHead] against capacitous colon, then push back in. When you exhale, your body is again overwhelmed, but not to the previous extent. Focusing on other concepts and not on claiming " + (vagFuck ? "four" : "three") + " glory-holes is what made it so hard. Your [pc.multiCocks] feel ten times as sensitive. Now that you think in emotions and images, all you feel is pure bliss.");
	output("\n\n<i>“Mmmhh... Love that...”</i> the rodenian coos. <i>“Now that’s somethin’!”</i> She writhes on your mast, squealing when you reorganize her pelvis into a proper cock-mitten.");
	output("\n\n<i>“Oh, me too!”</i> the halfbreed [rat2.boyGirl] calls, a long moan flowing over [rat2.hisHer] lips. <i>“It’s not like normal sex either, I can feel it in you too!”</i>");
	output("\n\nAnd the bottom boi? <i>“It’s kind of strange, but not uncomfortable. It’s really warm...”</i> he whispers, still clutching and rubbing his prick.");
	output("\n\nThe lurid amount of " + (pc.hasVagina() ? "herm-" : "dick-") + "lube moistening the thieves’ nethers has you pistoning back and forth in no time. The pirate skyscraper rocks like a ship at sea. You dare not waste your energy on speaking, you just focus on humping and moaning. Those two things you do <i>extremely well</i>. Your [pc.multiCocks] squelch loudly against swampy skin and fur. [pc.Hips] haul in rapid succession, tugging and yanking with barely consistent gyration.");
	output("\n\nIn your holstered cocks you feel the drum beats of your heart, those vibrations spreading throughout the rat’s backsides. The greatest pleasure is most certainly felt on the outstroke, what with the translucent waterfall channeling between their cracks, parted by the presence of thrumming dick. Thickening streams of effluent runoff find their own way on the ground, puddles growing larger each time you pull out.");
	output("\n\nCoarse tails course around your torso, your [pc.arms], and even your [pc.thighs]. It’s not much of a surprise that the rats are so horny they’re adding to the strength of your thrusts. Now when your hips ram into theirs, the whole stack is in some danger of collapsing. Better not let them think they’re in control!");
	if (pc.isNaga()) output(" You finally muster up the lower body strength to help steady the stacked sluts using your [pc.leg]. The mouse-boy sounds the most appreciative of that!");
	
	if (rat2.isFemale()) output("\n\nYou feel out the half-rat girl’s pussy, circling for the lacquered gumball obscured by phallic muscle; there’s a cock-compressing shock that quakes the pile when you tweak that pleasure-bud at the hood of her cunt. Target locked, you pinch that fem-buzzer between thumb and index finger, wriggling your hand like a military-grade vibrator. <i>“Ackkkggahaaa!”</i> she screams, her tail falling limp from your body like stretched rope.");
	else output("\n\nObscured beneath your enviable girths is the halfbreed boy’s balls. You cup one nut then the other before squeezing that taut rat-sack. From all the jostling in his weighty nuts you can tell he just spurted out another load of jizz! <i>“Gggaaah!”</i> he squeaks, grunting appreciatively as off-white goop oozes out the cock nestled between his belly and the mouse-boy’s back; his tail falls limp from your body like stretched rope.");
	
	output("\n\nThese rats are not going to be walking straight for the rest of the day. You doubt the trail of preseed leading back to their treasure troves’ll prevent any petty purloining in the future. Maybe you’ll find them sooner rather than later when you need to empty your [pc.balls] later?");
	output("\n\nYour [pc.multiCocks]");
	if (pc.cocks.length > (rat2.isFemale() ? 4 : 3)) output(", and the ones without a place to go,");
	output(" rearrange their already strained pelvises.");
	if (pc.cocks.length > (rat2.isFemale() ? 5 : 4)) output(" Those extra useless fuck-poles slide between layered ass and thigh in their inconsiderate adventures.");
	else if (pc.cocks.length > (rat2.isFemale() ? 4 : 3)) output(" That extra useless fuck-pole slides between layered ass and thigh in its inconsiderate adventure.");
	output(" Moving faster is a process of inches, too fast and you’ll cum, and too slow you’ll be back to where you were: getting crushed by uncontrolled lust.");
	output("\n\nThe breaths you take are so thick that the inner conflagration can’t be totally ignored on your cloudy climb to the top of bliss mountain. Painfully hot air hounds your ragged intakes; you pet the rats by the bases of their tails, and even catch one tip in your mouth as it swims by, sucking on its tip to its owner’s fuck-crazed satisfaction. To be honest, you’ve completely forgotten the recency that led to this. The flawless skin rubbing against your violently throbbing pricks is all you’re glad to feel and know.");
	output("\n\nThe ruinous pleasure felt throughout your " + (vagFuck ? "four" : "three") + " slotted cocks is still not something you can get a handle on. Very rarely does it feel like sex, it’s more like you’ve been slotted up to a series of milking machines made for those with too much action downstairs. The orgasms you trigger in the now insensate gaggle of rats treat your cocks to hellishly varied pressures that clamp down on your members, intent on harvesting your loinfruits.");
	if (pc.balls > 0) output(" The mini-climaxes either forcibly suck or gently coax the " + (pc.ballSize() < 8 ? "wobbling" : "tremendously weighty") + (pc.balls > 1 ? "nuts" : "nut") + " in your ballsack to offer up greater loads of pre and seed. They’re so tight" + (pc.ballSize() < 8 ? "" : " and heavy") + " that the batch you’re brewing seems like expulsion’ll cause a permanent deleterious effect on your sanity when you blow."); 
	output("\n\nThere’s not an ounce of space you haven’t mapped in the quieted trio. The gentle rocking back and forth casually elevates you to the point where nearly all control is lost. " + (vagFuck ? "As the half-rat’s pussy creams your cock once again, y" : "Y") + "ou realize that you <i>need to cum</i>.");
	output("\n\nThat need has become more than a biological function. It’s become an all-encompassing desire. You’ve held it off for long enough, you’ve fucked these rats senseless - and yourself too. It’s the last step to claiming them, and ruining them for anyone else. You abandon rationality as you thump noisily into their bodies. Heads hang, tongues loll, eyes have rolled back, and the only thing coming from them now are moans of dull bliss. Are they ready? But, can you say you are, too?");
	output("\n\nIt’s time to find out.");
	output("\n\nYou slam your [pc.hips] into theirs one more time");
	if (pc.hasAKnot()) output(", the awkward state of your penetration and the size of your plundering pricks keeping your [pc.knots] out");
	output(". There’s a hollow feeling when your lungs deflate, and then... Nothing. Perceptible reality distorts and dissolves into muddiness, evaporating like water.");
	output("\n\nNothing but red, purple, anything remotely associated with peaked lust remains as faded colors in your unseeing universe.");
	if (pc.hasVagina()) output(" You don’t even feel your [pc.pussies] going off. Everything has gone so... numb...");

	var cumQ:Number = pc.cumQ();
	if (cumQ < 100)
	{
		output("\n\nYou’re not entirely sure where the thickest loads of [pc.cum] are pumped, which of these rats can really say they got the greater amount of [pc.cumVisc] treasure. Your [pc.eyes] are so blurred that you can’t see a damn thing. Closing them does nothing to alleviate the very colorful sensory assault overloading your peripheries in much the same way you make a modest deposit into the bank of rat. " + (vagFuck ? "Pussy and ass" : "Asses") + " hungrily milk out the [pc.cumFlavor] seed surging through " + (vagFuck ? "four" : "three") + " separate dicks all the same, though this oddly lurid experience doesn’t last long.");
		output("\n\nIt’s almost a little tragic with how little you have left to splatter their bodies with as they slide off each other and fall to the ground, utterly exhausted by your hypersexual dominance.");
	}
	else if (cumQ < 500)
	{
		output("\n\nThere’s so much [pc.cumNoun] flowing through your " + (pc.cocks.length == 3 ? "triple" : "several") + " cum-veins and so many different assaults on your peripheral senses that you have no chance in hell of knowing who’s milking the most [pc.cumVisc] treasure from your loins. You press down on the rats, using their entire bodies to help squeeze out the vast loads yet to be churned out of your loins, your " + (vagFuck ? "four" : "three") + " holstered cocks thanking you. Somehow. Your [pc.eyes] are so damn blurry that you can’t see anything. Closing them doesn’t help much, but it lets you sink into the feeling of three covetous bodies sucking you dry.");
		output("\n\nWhen you yank your [pc.cocksLight] from their cum-hungry guts, the last ropes of jism fly out over their collapsing forms, splattering them with a [pc.cumColor] reminder of your hypersexual dominance.");
	}
	else if (cumQ < 2000)
	{
		output("\n\n[pc.Cum] flows like a torrential storm, blasting the pirate’s innards with endless quantities of [pc.cumColor] spunk. They won’t have the gumption to argue about who got more of your [pc.cumVisc] treasure, as the sheer amount of seed your ballooning rods are pumping into them is filling out their soft bellies and giving them each a lasting reminder of you in the form of a nice cum bump. You can’t scream, you can’t feel anything, save for your voluminous virility forcing apart " + (vagFuck ? "pussy and ass" : "three asses") + " in a long lasting climax.");
		output("\n\nWhen you pull out, the bandits collapse and slide off each other, and your [pc.cocksLight] don’t forget to cover them in a cartoonish blanket of sperminess. It can hardly be called dominance at this point, just gratuity. Utterly exhausted and plastered with [pc.cumColor] seed, they rub their bellies as they seek to catch their breaths.");
	}
	else
	{
		output("\n\nWhen you feel the first load of [pc.cum] blast through your [pc.multiCocks], you and the rats shake so violently that you nearly fall back. It’s such an intense load, and it wasn’t felt in just one cock: it was felt in all of them.");
		output("\n\nAnd it just keeps coming.");
		output("\n\n[pc.CumVisc] [pc.cumNoun] doesn’t just shoot in plebeian jets out of your dicks, it pours. It’s as if on a planet made entirely of water, gravity ceased to be as a concept, and every drop flowed into the vacuum of space. There’s no other way for your dizzied and addled mind to comprehend - to compare - the force, volume, and raw masculine power of your unmatchable orgasm. Soft bellies fill out immediately. The second " + (vagFuck ? "quadruple" : "triple") + " eruption splatters your crotch with [pc.cumNoun], and the trio are balancing like some exotic desk ornament on their big round stomachs.");
		output("\n\nAnd it keeps going. You’re cumming so hard and so fast that their sputtering isn’t lost on you. [pc.CumColor] seed spurts from their nostrils and their mouths. They gag on the amounts flowing all the way through their bodies by the time your kui-tan shaming balls have finished churning out their galactic loads. Pulling out of " + (vagFuck ? "pussy and ass" : "their asses") + " only has you dumping one last smothering load of hypersexual musk on them as they collapse, bathing them in so much seed that they will never wash you off again.");
	}

	output("\n\nYou fall to your knees, absolutely no energy left in your body. Opening your eyes seems impossible, they’re sealed shut like airlocks. Breathing is an absolute chore, and it’s like you’re trying to pass boulders through your tubes. Your [pc.multiCocks], even as they soften, bounce vibrantly with every chest-punching pound of your heart. Fortunately, feeling does return to your limbs, but you’re riddled with needles and pins.");
	output("\n\nCycling oxygen gets easier though, and you’re able to start seeing again. The mouse pirates are splayed out, looking as if they’ve been pulled from the capacious vastness of the galaxy’s largest freighter, and it was filled to the breaking point with effluvium. Even the rodenian, a spitfire in her own right, can’t exercise the strength to speak or even look at you. The four of you sit there for a while, passing the blissful relaxation.");
	
	if (flags["RATS_POUNDED_ALL"] == undefined) output("\n\n<i>“C-c-can’t ssss...”</i> the rodenian groans, <i>“...say that wasn’t good... Never had anything like that before...”</i>\n\nNeither can you!");
	else if (ratsPCIsGood()) output("\n\n<i>“D-d-didn’t expect any less from you, [pc.mister] CEO...”</i> she moans, then smiles at you. <i>“I hope you’re satisfied...”</i>\n\nOf course you are!");
	else output("\n\n<i>“H-how much money did you spend on that stamina, " + ratsMisterCEO() + "?”</i> she whimpers.\n\nThat would be telling!");
	
	output("\n\nThe long awaited moment that you can stand and gather yourself arrives, though the rats are still a bit worse for wear. They at least sit up and flash you a few grins as you head past them, shaky as hell. <i>“Better be ready to pay up next time, too. You’ve raised the bar!”</i>");
	output("\n\nTails tickle your [pc.footOrFeet] on the way.");
	
	pc.orgasm();
	rat0.loadInAss(pc);
	rat1.loadInAss(pc);
	rat2.loadInAss(pc);
	if (pc.cocks.length > 4 && rat2.isFemale()) rat2.loadInCunt(pc, 0);
	
	IncrementFlag("RATS_POUNDED");
	IncrementFlag("RATS_POUNDED_ALL");

	ratsVictoryFinish();
}

// [Ride Him/Them/Ride Them]

public function ratsIWannaGetOffOnMrMousesWildRide(vagId:int):void
{
	clearMenu();
	clearOutput();
	showRats((rat2.isMale() ? 6 : 1), true);
	processTime(5);

	// PC herm
	if (pc.isHerm())
	{
		output("Tails and ears flex in tune with your firing synapses. [pc.EachCock] " + (pc.hasCocks() ? "throb" : "throbs") + " and [pc.eachVagina] " + (pc.hasVaginas() ? "tingle" : "tingles") + " in defiance of each other. Femininity and masculinity vie for control of your decision making");
		if (pc.isCrotchGarbed()) output(" by making a mess of your [pc.crotchCover]");
		output(". There’re holes to plow and cocks to take... but you know what you want out of these rats. There’s only one way they can apologize for trying to mug you.");
	}
	// PC vagina 
	else if (pc.hasVagina())
	{
		output("There’s only one way they can make up their thievery to you. Your " + (pc.hasVaginas() ? "wombs tingle" : "womb tingles") + " and a blush spreads when you glance at the mouse-boy, a half-erect dick visible beneath his undersuit. But through the splitting fabric, you catch the scent of his pre. It makes the prospect of coming fuck all the sweeter");
		if (pc.hasVagina() && vagId < 0) output(", though your [pc.pussies] " + (pc.hasVaginas() ? "are" : "is") + " going to be sad to be left out");
		output(".");
	}
	// PC cock or neuter
	else
	{
		output("\n\nYou eye up the femmy mouse-boy’s crotch, a half-erect dick pushing against the stretching fabric of his undersuit. You wriggle in delight when you imagine the ways he’s going to squirm under you");
		if (pc.hasCock())
		{
			output(", and your [pc.cockNoun] dribbles its liquid commentary");
			if (pc.isCrotchGarbed()) output(" against your [pc.crotchCover]");
			output("in assent");
		}
		output(".");
	}

	output("\n\nYou sidle up to the trappy, freckled rogue and bend down in front of him, grasping the ratty helmet he wears and lifting it cleanly off his head. Messy [rat1.hairColor] bangs spill out like noodles from their confines, including those big,");
	if (pc.isBimbo()) output(" super");
	output(" cute ears of his. He shakes and tilts his face at you, unsure of what you’re planning. Sensing his nervousness, you stroke his cheek, a");
	if (pc.isBimbo() || pc.isBro()) output(" sultry smile spreading across");
	else if (pc.isNice()) output(" very warm smile cresting");
	else output(" predatory grin widening on");
	output(" your [pc.face].");

	if (pc.isBimbo())
	{
		output("\n\n<i>“Heya cutie, how’s ‘bout you let me take care of that?”</i> Your fingers dance energetically across his turgid boner. <i>“Bet you’re a little horny after all that pointless fighting!”</i> you giggle, scritching his ears with intense friction. <i>“Get undressed and let’s have some fun!");
		if (rat2.isMale()) output(" Oh, and you too, of course!”</i> you motion to the [rat2.furColor]-limbed rat boy.");
		else output("”</i>");
	}
	else if (pc.isBro())
	{
		output("\n\n<i>“What’s that look there? You’ve got nothing to worry about. Get that armor off, so I can take you for a ride.”</i> You grin and pat his shoulder once.");
		if (rat2.isMale()) output(" <i>“You too,”</i> you stare at the halfbreed boy.");
	}
	else if (pc.isNice())
	{
		output("\n\n<i>“Do me a favor and get yourself out of that armor. I’ve got a little treat for you, and you’re not going to get it until you’re naked.”</i> You pat his head warmly, undoing the first fastener you see with an erotic touch.");
		if (rat2.isMale()) output(" <i>“And your friend as well,”</i> you say, glancing at the half-rat boy.");
	}
	else if (pc.isMisch())
	{
		output("\n\n<i>“Nothing to worry about except getting naked,”</i> you chuckle. <i>“Go ahead and slip out of that so I can show you how to have a good time.”</i> You trail across the rim of his ear and yank out the first fastener you see.");
		if (rat2.isMale()) output(" <i>“And you too, fuzzy boy!”</i>");
	}
	else
	{
		output("\n\n<i>“Trust me, you’ll know when to get worried,”</i> you scoff. <i>“But for now, undress. You’re going to do me a favor, rat-boy.");
		if (rat2.isMale()) output(" Both of you.");
		output("”</i>");
	}

	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW: output("\n\nAlthough he looks reassured, he still moves a little timidly in the process."); break;
		case RatsRaider.RAT_REP_MID: output("\n\nNodding, he smiles a little while undressing, shaking himself out of that burdensome black armor."); break;
		case RatsRaider.RAT_REP_HIGH: output("\n\nHe nods eagerly, standing and flinging off the pieces of his black armor with respectable quickness."); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("\n\n<i>“Okay, [pc.mister] CEO!”</i> he beams, jumping up and undoing his black armor with admirable efficiency."); break;
	}

	output("\n\n<i>“W-wait a sec, what about " + rat2.mf("me", "us") + "!?”</i> the sharp accented rodenian whines. " + (ratsPCIsGood() ? "<i>“C-come on, [pc.mister] CEO, you can’t just leave " + rat2.mf("me", "us") + " out! F-fine, whatever, I don’t care if you like it or not " + rat2.mf("I’m", "we’re") + " not just gonna stand still!”</i>" : "<i>“You can’t just leave " + rat2.mf("me", "us") + " out of this, why do" + rat2.mf(" they", "es he") + " get the attention?”</i>"));
	output("\n\nYou weren’t planning on that, but before you can speak your mind, she " + rat2.mf("has", "and the halfbreed girl have") + " also hopped up and begun fidgeting with " + rat2.mf("her", "their") + " gear. It’s kind of adorable, actually. Meanwhile, the modded mouse has already gotten his armor off, hard to miss with how noisy the act was. He goes to unwrap himself from an inky undersuit, but the fabric around his crotch splits and his eager manhood thrusts through the cloth with a loud snap of fabric");
	if (rat2.isMale()) output(", the other rat-boy suffering similarly");
	output(".");
	output("\n\nYelping embarrassed, he hurriedly shucks the rest before more damage is done to the worn out attire, and soon his cock, his balls, and his sweaty frame are laid bare. The boy-thief’s bobbing manhood, 8-inches long, beads with pre the longer he stares at you");
	if (pc.hasBreasts()) output(", though his eyes are certainly never too far from your [pc.breasts]. " + (pc.isChestExposed() ? "The " + (pc.biggestTitSize() > 6 ? "perky mounds" : "wobbling mountains") + " of titflesh captivate him, and he can’t keep himself from drooling" : "Fantasizing about what’s under your [pc.chestCovers] only bounces his cock harder"));
	output(". He looks " + (pc.tallness >= 6*12 ? "up and" : "across and") + " gives you a silly smile, not daring to touch your or himself without permission. <i>“What do you want us to do?”</i> he asks.");

	// Two female rats
	if (rat2.isFemale()) output("\n\nThe only dick in their party is throbbing between his legs, and you’re not letting that go to waste. The other two will have to make due with tails, perhaps your fingers. Maybe even your tongue? Disappointed, the girls frustratedly eye-hump you when you turn your full attention to the dick-wielding boy in their company.");
	// Two male rats
	else
	{
		output("\n\nYou tug the halfbreed boy over, and his equally endowed prick spurts pre in anticipation of being used. No way were you leaving him out of the arrangement, ");
		if (pc.hasVaginas()) output("you have plenty of holes to go around");
		else if (pc.hasVagina()) output("you have two holes that need filling");
		else output("though they’re going to have to share");
		output(". The rodent girl is visibly distraught by this, and her [rat0.eyeColor] eyes shine with molten envy.");
	}

	// PC wearing armor/clothes
	if (pc.hasArmor())
	{
		output("\n\nYou have your " + rat2.mf("mouse-boys", "mouse-boy") + " help remove your [pc.armor], anxiously tossing it aside.");
		if (pc.hasLowerGarment() && pc.hasUpperGarment()) output(" You let the oh-so innocent " + rat2.mf("thieves", "thief") + " have some extra fun with your [pc.lowerUndergarment] and [pc.upperUndergarment].");
	}

	// PC low libido <=33
	if (pc.libido() <= 33) output("\n\nNo better way to start then gently asserting yourself: you grip " + rat2.mf("their thrumming shafts", "his thrumming shaft") + ", exploring the goods with tentative flicks and pumps. Fingers dance around the " + rat2.mf("rings of their fleshy crowns", "ring of his fleshy crown") + ", tips vibrating against the frenulum" + rat2.mf("s. They squeak", ". He squeaks") + " in adulation, hands balling into fists just above " + rat2.mf("plump waists", "his plump waist") + ". Gumballs of rat-pre churn out of " + rat2.mf("their", "his") + " ample " + rat2.mf("cocks", "cock") + ". First you taste it, then you smear it over " + rat2.mf("their shafts", "his shaft") + ". The hefty balls hanging full and ripe beneath " + rat2.mf("them", "it") + " are coated too, making sure " + rat2.mf("their", "his") + " loins are wet, warm, and very, <i>very</i> ready.");
	// PC medium libido 34-66
	else if (pc.libido() <= 66) output("\n\nSmirking, you wrap your hands around " + rat2.mf("their", "his") + " delightfully warm prick" + rat2.mf("s. They squeak", ". He squeaks") + " at the eagerness of your waggling wrists. Sonorous moans break out, happy with this pace. Your palms now smeared with pre, you catch a wad of the translucent goo and bring it to your [pc.lipsChaste], licking it up and cooing at its salty base. There’s a heave in your groin, and you involuntarily thrust out towards " + rat2.mf("them", "him") + ". You can’t wait any longer; your " + rat2.mf("rats are", "rat is") + " right there waiting to be ridden.");
	// PC high libido >=67
	else
	{
		output("\n\nYou drop down to your knees and give the oozing " + rat2.mf("cocks", "cock") + " on display a thorough taste test. " + rat2.mf("Their heads are", "His head is") + " thrown back the second your breath and tongue wash over " + rat2.mf("their cumslits", "his cumslit"));
		if (pc.hasLongTongue()) output(", and thanks to the length of your muscle, all the way around " + rat2.mf("their broad girths, including their", "his broad girth, including his") + " big, wobbling nuts");
		output(". Your hands take possession of " + rat2.mf("their bouncing sacks", "his bouncing sack") + ", and in no time at all your mouth is moistened with their yummy taste. Greater loads of pre flow behind the fat drippings you hungrily swallow up. " + rat2.mf("Cocks", "Cock") + " coated in pre and hanging ropes of saliva, " + rat2.mf("they’re", "he’s") + " nice and ready to give you <i>just</i> what you need!");
	}

	output("\n\nYou take the grimy-haired mouse-boy right then and there. Putting your arms around his neck, you push him down until he falls to the ground, giggling as you tumble. The petite outlaw’s cock ends up squished between your [pc.thighs].");
	if (pc.hasVagina()) output(" Your [pc.pussy] demonstrates its longing to be filled by a young and virile male, slathering his arrested phallus with " + (pc.isSquirter() ? "streams" : "ribbons") + " of girlslime that make it very clear who he belongs to.");
	output("\n\nHe’s not big, but he’s not too small either. Every throb of passion down there fills you with an intense and decidedly primitive warmth. Holding him like this, leading him on with the promise of taking you... It just makes you feel so shameless as you moan");
	if (pc.hasCock()) output(", and it makes your [pc.cocksLight] drool a puddle on his body");
	output(".");
	output("\n\nAfter " + (pc.hasVagina() ? "your [pc.pussyNoun] has had its fun kissing cum-vein" : "you’ve had your fun asserting") + ", you lift your body up and take his aching phallus in hand. Just holding that firmly erect mouse-member is a pleasure. You feel more appreciative of his shape, his length, how slippery it is, how stiff it is. Bliss radiates from it in a tangible heat");
	if (pc.hasVagina()) output(", mixing with the powerful air billowing from your [pc.pussyNoun]");
	output(".");

	// Two male rats
	if (rat2.isMale()) output("\n\nThe [rat2.furColor]-limbed rat boy walks behind you, gingerly squeezing your [pc.ass] before stuffing his shudderingly warm cock between your cheeks, teasing your [pc.asshole] with the underside of his girth. His sticky fingers slide into your drenched nethers" + (pc.hasVagina() ? ", coming away with strands of pussyjuice clinging to the modest mast." : "coming away with strands of pre connected to your inner thighs."));
	// Two female rats
	else output("\n\nThe [rat2.furColor]-limbed rat girl shuffles to your rear, cooing happily when she squeezes your [pc.ass], thrusting her tail between her thighs and up your ass-cleavage. She grinds the flat of her appendage to your [pc.asshole], humming her multi-tasking enjoyment close to your [pc.ear].");

	output("\n\nThe [rat0.furColor]-furred rat stomps over too, arms folded and fully naked. She leans down - her chest thrusting closer to your [pc.face] - an expression of agitation writ on her lustful snout. Her tail slithers between you and the cock you crave. <i>“You either have all of us or none of us, " + ratsMisterCEO() + "!”</i>");
	if (ratsPCIsGood()) output(" Her features soften into a smile before she kisses you on the cheek. <i>“You should know that by now...”</i>");
	output("\n\nYou accept the terms, of course!");
	output("\n\nMeeting the straddled mouse boy’s [rat1.eyeColor] gaze, you settle comfortably on his small, well-toned form, ready to enjoy your prize -- you fall on his cock, breathy moans escaping your mouth. The exquisite glide of his pulsating thickness into your " + (vagId >= 0 ? "[pc.pussy " + vagId + "]" : "[pc.asshole]") + " is trivial, " + ((vagId < 0 ? pc.ass.looseness() : pc.looseness(vagId)) < 3 ? "surprising for how tight you are" : "perhaps more so with how loose you are") + ". His tender hardness is " + (vagId >= 0 ? "squeezed deeper, as if being invited by your womb as a guest of honor." : "almost sealed into your tailhole, but you relax enough for him to enjoy the pleasure of your ass."));
	
	// PC vaginal virgin
	if (vagId >= 0 && pc.vaginas[vagId].hymen)
	{
		pc.holeChange(vagId, rat1.biggestCockVolume());
		output("\n\nAfter your hymen is penetrated, the escaping whine alarms your diminutive partner, and the other rats too. <i>“What’s wrong? Are you hurt!?”</i> he asks, arousal fading fast into fear. You allay him with a grin, pointing to the trickle of blood down below. His [rat1.eyeColor] eyes predictably widen. <i>“W-w-w-whaaa..!! I... I’m sorry, I’m sorry, I didn’t know! W-we’d, I’d never have done that to you if I knew! I Uh... I don’t know what to say... I’ve stolen that from you...”</i>");
		output("\n\n<i>“W-wow...”</i> the rodenian girl marvels, <i>“W-we would never have done that to you...”</i>");
		output("\n\nBut you knew, and you made your choice. Before he shuts down, you tap his cheek and breathily smile.");
		if (pc.isBimbo() || pc.isBro()) output(" <i>“Have to get broken in sometime...”</i>");
		else if (pc.isNice()) output(" <i>“Make my first time something special, okay?”</i>");
		else if (pc.isMisch()) output(" <i>“Don’t act like there’s nothing you won’t steal,”</i>");
		else output(" <i>“Don’t make me regret it,”</i>");
		output(" you whisper, shuddering as your [pc.vaginaNoun] clenches around his prick again, keeping it hard while the pain fades away.");
		if (ratsPCIsKnown()) output(" <i>“Besides, you should be thankful that you’re a CEO’s first.”</i>");
		if (pc.isBimbo() || pc.isBro()) output("\n\nHe glares determinedly. <i>“I’ll do my best!”</i>");
		else output("\n\n<i>“I promise!”</i> he glares. <i>“I’ll make this up to you, I swear!”</i>");
		output("\n\nYou’re looking forward to it.");
		flags["RATS_STOLE_VIRGINITY"] = 1;
	}
	else
	{
		pc.holeChange(vagId, rat1.biggestCockVolume());
		output("\n\nHe’s all yours now.");
	}
	
	addButton(0, "Next", ratsTheRideNeverEnds, vagId);
}

public function ratsFemBodyComments():void
{
	// PC butt <=5
	if (pc.buttRating() <= 5)
	{
		output("\n\n<i>“Hummm it could be a bit bigger...”</i> the rueful rat slaps your [pc.ass], her leader following suit on the other cheek. You tush holds firm, not a ripple to be found in your [pc.skinFurScalesNoun], but those smacks certainly reach the mouse-boy busily plumbing your desirous cavern, vibrating his length into a muscle-locked seizure.");
		output("\n\n<i>“Ch’yeah, not nearly as good as mine!”</i> the rodenian grips your butt.");
		output("\n\n<i>“Oh well, it’s not like that can’t be fixed with a pill these days, right?”</i> the half-rat quips. <i>“Nah. We’ll always know this was the natural state of " + (ratsPCIsKnown() ? "[pc.mister] CEO’s" : "[pc.hisHer]") + " butt though, ha ha!”</i> You blush red in embarrassment, yet despite their biting commentary they haven’t stopped teasing.");
	}
	// PC butt 6-12
	else if (pc.buttRating() <= 12)
	{
		output("\n\n<i>“Ohohoho, mmmm... watch!”</i> the halfbreed girl giggles, slapping your [pc.ass] on either side, the mouse-boy crying out and jerking upwards when she does. Your jiggling ass captivates her and the rodenian with every wobbling ripple through its wide and pillowy hemispheres. <i>“Bigger than you!”</i> she quips at her scoffing leader, lavishing your hand-filling derriere with near-worshipful caresses and squeezes.");
		output("\n\nThe alien rodent’s tail smacks against your ass in annoyance. <i>“I guess it’s a pretty good ass...”</i> you hear, but you hear the envy a little more in your blissed out state.");
	}
	// PC butt >=13
	else
	{
		output("\n\n<i>“Fuck! Look at it!”</i> the [rat2.furColor]-limbed girl swoons, two hands clapping off both sides of your [pc.ass]. <i>“Ummm, ohmygosh look at it ripple!”</i> she squeals, rubbing her ecstatic face into your generous backside, framing herself with as much of you as she can. Those high-impact ministrations pleasure-seize the mouse-boy’s cock inside."); 
		output("\n\n<i>“Could use this as a pillow all day, fuck those bunks, it’s sooo sofffttttttt...”</i> she murmurs into your tush. She twists and turns, wedging herself deeper into the relaxing abyss of your smothering rear, breathy, awed pants warming your [pc.asshole].");
		output("\n\nThe [rat0.furColor]-furred rodenian huffs and slaps you a little more violently, making you arch back. <i>“Yeah, whatever, it’s just a big dumb ass on a big dumb " + (ratsPCIsKnown() ? "CEO" : "stranger") + ", size isn’t everything.”</i> The half-furred girl quickly kneads out the soreness, litanies of high regard tumbling out her butt-overwhelmed brain.");
	}

	//What whims do:
	if (flags["RATS_LAST_BUTT_SIZE"] != undefined && pc.buttRating() > Math.max(5, flags["RATS_LAST_BUTT_SIZE"]) && rand(6) < pc.buttRating()-flags["RATS_LAST_BUTT_SIZE"])
	{
		if (flags["RATS_LAST_BUTT_SIZE"] <= 5)
		{
			output("\n\n<i>“I’m so glad you made it bigger, too! Thick thighs save lives and big butts... well they don’t really save lives they just make life better for girls like me!”</i> the slut-rat laughs uproariously.");
		}
		else
		{
			output("\n\n<i>“I can’t believe you made it even bigger, god! It’s so fucking hot, thankyouthankyouthankyou, " + ratsMisterCEO() + "! I love big juicy butts on cute [pc.guyGirl]s!”</i>");
		}
	}
	flags["RAT_LAST_BUTT_SIZE"] = pc.buttRating();

	// PC thighs >=10 (add on after any of the above)
	//thighs isn't a thing, I think? so just check if they're thiccable in thighDescript
	if (pc.thickness >= 25 && pc.hipRating() >= 5) output("\n\n<i>“And these, they’re so " + (pc.tone < 30 ? "smooth" : "firm") + ", I could sleep so well here, hehe,”</i> the lovable rascal moans, licking up and around your " + (pc.hasVagina() ? "[pc.girlCumNoun]" : "sweat") + "-drenched [pc.legs]. <i>“H-hey ummm, can I apologize for all of them? Maybe you can let me you sleep on these later?”</i> she asks, palming circles in your [pc.skinFurScalesNoun]. You’ll think about it. Or at least, you’ll try to when you’re not walking the hair-thin orgasmic line...");
}

public function ratsTheRideNeverEnds(vagId:int):void
{
	clearMenu();
	clearOutput();
	showRats((rat2.isMale() ? 6 : 1), true);
	processTime(40);
	
	output("What starts out as a quiet gasp escalates to a breathy moan from the horny mouse-toy. His powerfully hard dick familiarizes itself with your spasming " + (vagId >= 0 ? "cunt" : "butt") + " in little time, splitting you with its glorious presence.");
	output("\n\nVelvety fuzziness rockets up your spine as " + ((vagId < 0 ? pc.ass.looseness() : pc.vaginas[vagId].looseness()) < 3 ? "the tightness of your pocket provokes a deep groan" : "he moans reactively to the ease of passage through your accommodating tunnel") + ". Every claimed inch of rat-phallus dumps another load of hormones on your addled mind. Husky voices join in erotic chorus; the iron veins on his dick spread cushiony vaginal muscles into their shapes. Inner walls squeeze conquering terran cock deeper, goading the invader into cumming straight away.");
	output("\n\nFlexible hands grip your [pc.hips], the voice behind them growling from the effort it takes not to blow a thick load. Hilted and wholly immersed in you, the underside of his cocktip pulses " + (vagId >= 0 ? "against your G-spot" : "against your most sensitive nerves") + ", and any thought other than getting plowed is shoved away by its insistent vibrations. The dirty pirate-boy rolls his waist to free his pinned tail and rob you of some muscular control.");
	output("\n\nWhich is fine, because that prehensile passenger still wraps you in itself, helping keep you steady while showing respect for your wants.");
	if (pc.hasTail()) output(" Your [pc.tails] " + (pc.hasTails() ? "begin" : "begins") + " to wag in mutual happiness, and it even receives a few love-taps from his!");
	output("\n\nYou are only partially aware of your body’s subtle tempo during these satiny moments, acting of its own accord to please its scrappy mate while you relish each other. Your nails rake across his chest after a powerful spike of joy, the scrapes making your lawless lover squeak adorably. The pulsing flesh squirming around inside tickles your body with an addictive pleasure... it makes you realize how empty you were before he was there, and it makes your eyes flutter at the fullness he will soon provide.");
	output("\n\nThe mouse-boy stares up at you, needful affection swimming in his [rat1.eyeColor] eyes. When you stop squinting, you are hopelessly swept away by the raw sincerity twinkling there. His genuine look melts your thrumming heart in much the same way your " + (vagId >= 0 ? "[pc.vagina " + vagId + "]" : "[pc.asshole]") + " melts with pleasure");
	if (vagId >= 0 || pc.ass.wetness() > 0) output(", slathering his prick with another silken stream of " + (vagId >= 0 ? "girlspooge" : "lube") + ". " + (ratsPCIsGood() ? "Everything he does is so worshipful that you find it hard to believe they treated you like a dirty bureaucrat not too long ago." : "After knocking the klepto out of them, their real selves are laid bare, and you secretly hope this lasts longer than your encounter here."));
	output("\n\n<i>“W-whenever you’re ready,");
	if (ratsPCIsKnown()) output(" [pc.mister] CEO,");
	output("”</i> he says, punctuating it with a trembling upwards thrust. He can’t go anywhere without leverage, but the seism it triggers in your body is felt everywhere in its stead. That electrical surge is transmitted to every working receptor in your body, and all you can feel is contentment.");

	var cumQ:Number = pc.cumQ();
	// PC chose vaginal, two male rats
	if (vagId >= 0 && rat2.isMale())
	{
		output("\n\nAs precious as he is, it’s not enough to enjoy the modded thief remaining balls deep inside you");
		if (pc.hasCock()) output(", and the idle handjob your erection" + (pc.hasCocks() ? "s are getting are" : " is getting is") + " no better than what you could do yourself");
		output(". There’s a scrambling thrill to turning this doe-eyed loot-rat into your fuckpuppet. Although he’s not as big as others might be, his lovely tool and boundless spirit are sure to exemplify the merits of modesty. His unpinned tail squeezes tight to your [pc.thigh], pointed tip stroking your [pc.skinFurScalesNoun] with adulation enhanced by a nosebleed-inducing smile.");
		output("\n\nYour sloven honeypot squelches loudly with the smallest movements, marking his manhood with your [pc.girlCumNoun] signature. The slick and rubbery delta of your [pc.vaginaNoun " + vagId + "] grinds against his crotch on a forward lurch; you press against the slightly muscular rogue and rise, his tight outstroke through your");
		if (pc.hasPlumpPussy(vagId)) output(" puffy");
		output(" cunt the stuff of legends. Zheng Shi blends together in the pleasant haze billowing from your pores. The next layer of sweat is thrust out lunge for lunge with the halfbreed boy’s cock between the " + (pc.buttRating() < 6 ? "cheeks of your petite" : "globes of your pillowy") + " backside.");

		// PC butt <=5
		if (pc.buttRating() <= 5)
		{
			output("\n\nYou can feel the two rats behind you glossing over your [pc.ass], wondering if they’re disappointed. The pleasant hums that flow from their lips in between the provocative rubs to your ample rump suggest otherwise. <i>“Heh, not as big as me!”</i> the rodenian girl snerks, her playful palm clapping off your butt.");
			output("\n\n<i>“It’s fine the way it is!”</i> the [rat2.furColor]-limbed rat quips. <i>“Not everyone needs to be a cow...”</i> He is further teased by the [rat0.furColor] mouse, who makes a suggestion that he’s too small for real butts. Poor boy!");
		}
		// PC butt 6-12
		else if (pc.buttRating() < 13)
		{
			output("\n\nExcited yelps and moans accentuate the respectful fondling two rats lavish your [pc.ass] with. Rapturous thrusts parade the rat boy’s cock through the sweaty channel of your butt-cleavage, the tip threatening to penetrate with every vigorous pump. <i>“Huh, you’ve got a nice ass " + ratsMisterCEO() + "...”</i> the rodenian girl compliments, though you identify the hint of envy even in your blissed out state. The halfbreed boy groans, <i>“It’s really soft and big... Er, it’s not weird to say you’ve got a perfect ass, is it?”</i>");
			if (pc.isBimbo() || pc.isBro()) output("\n\nNo it isn’t! You’ve got an awesome butt!");
			else output("\n\nNot at all!");
		}
		// PC butt >=13
		else
		{
			output("\n\nA loud and rousing slap strikes like thunder, the amorous duo at your rear in absolute awe of your rippling, jiggling derriere. You can feel the humps of their eyes as much as you can feel the humps of the [rat2.furColor]-limbed boy’s cock between your huge cheeks. They are absolutely in love with your butt. <i>“How can you even get around with an ass like that?”</i> the rodenian giggles. <i>“You’re so big, and sooo squeezable, ha!”</i>");
			output("\n\nYou feel four hands doing just that, sinking into the tremendous amount of buttflesh available and smearing sweat all over your");
			if (pc.hasFur()) output(" fuzzy");
			else if (pc.hasScales()) output(" scaly");
			else output(" etc");
			output(" mountains. <i>“I... Um, thank you for this,”</i> the halfbreed boy murmurs, cock fully enveloped by your tush. <i>“I’m really glad you’re letting me back here...”</i>");
			if (pc.isBimbo() || pc.isBro()) output("\n\nSo sweet!");
			else output("\n\nWere you really fighting them?");
		}

		output("\n\nBouncing up and down on the terran boy’s crotch is your body’s only purpose. Rising slowly and falling fast, you smash into his pelvis with progressively stronger bucks of the hip. The [rat2.furColor]-furred half-rat struggles to keep his twitching dong buried between your stubborn rump, groaning and sometimes wailing with every sexual dive.");
		if (pc.hasPlumpAsshole()) output(" It’s not just his prick that’s squeaking against flesh, it’s your inflated asshole, too. The fat ring of anal entrance has the texture of a pocket pussy, and while it’s not trying to suck his cock inside it makes his hotdogging one to savor.");
		output("\n\nYour [pc.hands] fall to your sweetheart’s waist in support of your hammering crotch. When you see the outline of his cock against your abdomen on the next liquid-splattering crash, a content smile brightens your shuddering features.");
	
		if (pc.hasBreasts())
		{
			output("\n\nHis hands wander up to your [pc.breasts], pinching at your [pc.nipples]");
			if (pc.isLactating()) output(" and drawing some fresh [pc.milkNoun] from your teats");
			output(". <i>“I hope that feels good,”</i> he winks, <i>“your boobs are um, really beautiful.”</i> You thrust your");
			if (pc.biggestTitSize() < 8) output(" mounds");
			else if (pc.biggestTitSize() < 16) output(" melons");
			else output(" marshmallows");
			output(" closer to his palms, gyrating your hips to keep things going while he kneads your tits");
			if (pc.biggestTitSize() >= 16)output(", though with their size they’re the ones kneading him");
			output(". The other two squeak affectionately before joining in; three hands plant on " + (pc.bRows() > 1 ? "each pair of your [pc.fullChest]" : "your [pc.breasts]") + ", pushing up, down, wherever they feel like!");
		}

		output("\n\nThe [rat0.furColor] rodent kneels next to you, sliding your left arm between her breasts with a coy grin. Nimble fingers dart for [pc.oneClit]");
		if (pc.totalClits() > 1) output(" and the others beside it");
		output(". Your vision shifts into a dimension of white lust, and your [pc.pussies] " + (pc.isSquirter() ? (pc.hasVaginas() ? "cream" : "creams") : (pc.hasVaginas() ? "squirt" : "squirts") + " violently") + " against rodent belly. <i>“Ooh that’s awesome, you came already!”</i> she exclaims, licking your [pc.girlCumNoun] off one finger. <i>“Nice, warm and tasty! Let’s see how many more times you cum, " + ratsMisterCEO() + "!”</i>");
		
		if (pc.hasCock())
		{
			output("\n\nHer paws wrap around your [pc.cockBiggest], jerking the bulging [pc.cockType] faucet until a jet of [pc.cumNoun] fires out onto the rat-boy’s cheek. He licks the edge of the erotic line closest to his lip, gazing into your [pc.eyes] with a sinfully sweet smile. Rodenian paws shuffle to your " + (pc.balls < 1 ? "[pc.base]" : "[pc.balls]") + ", eager to keep you guessing where the thigh-clenching pleasure comes from next -- another");
			if (cumQ < 100) output(" string");
			else if (cumQ < 500) output(" stream");
			else if (cumQ < 2000) output(" spurt");
			else output(" waterfall");
			output(" of precum is wrung out to their mischievous glee.");
		}
	
		output("\n\nYou fall forward another inch, those energetic molestations becoming yet wilder, wresting motor function from you and running into the sloppy sunset with it. You could assert yourself, but you’re having too much fun in this drunk-like trance of wandering between three paths on an intersection, unsure of which road to walk. You crane your head, winking at the [rat2.furColor]-limbed rat behind you who happily fucks your ass cheeks.");
		
		output("\n\nThere’s an idea. You slow your vertical oscillations to lean forward, spreading your smeared ass to reveal the " + (pc.ass.looseness() < 3 ? "tight" : "loose") + " pucker just above your claimed cunt.");
		if (pc.isBimbo()) output(" <i>“Here you go! Put it right in, nice ass for a nice rat!”</i> you squeal" + (pc.hairLength > 3 ? ", your [pc.hairs] flopping over your face." : "."));
		else if (pc.isBro()) output(" <i>“Your turn, go ahead, and show me what you can do,”</i> you grunt, eyes barely open.");
		else if (pc.isNice()) output(" <i>“Go on, I can’t wait to see what you can do...”</i> you wink good-naturedly, one finger on the cusp of insertion.");
		else if (pc.isMisch()) output(" <i>“Get right in there, did you think I’d leave you out?”</i> you smirk, wiggling your tush.");
		else output(" <i>“Hurry up, or forget about it,”</i> you murmur impatiently.");

		output("\n\n<i>“No problem!”</i> the rat boy exclaims");
		if (pc.hasTail()) output(", gripping your furiously wagging " + (pc.hasTails() ? "tails" : "tail"));
		output(". <i>“If this is what you want, " + ratsMisterCEO() + ", then I won’t hold back!”</i>");
		if (pc.libido() >= 33) output(" You brace yourself. His dribbling cock, backed by firm, constant pressure wiggles itself into position. You wonder if he’s going to thrust in all at once or take it slow.");
		else if (pc.libido() >= 66) output(" You push back into him, cooing as you squash that cock between your pheromonally drenched " + (pc.isHerm() ? "hermhood" : (pc.isMale() ? "manhood" : "femininity")) + " and his soft abs. In a surprising, distinct show of dominance, he slaps your ass and realigns himself.");
		else output(" You gasp and thrust back, hoping to spear yourself on his wonderfully hard dick.");
		output(" An audible ‘pop’ signals his entirely expected entrance, and there’s a mounting strain the more dick he pushes inside.");
		
		pc.buttChange(rat2.biggestCockVolume());
		
		output("\n\nYou inhale sharply and cum again, leaking pathetically over the bandits. He hilts himself in your ass, and the tip of his swollen dick throbs communicatively against the one in your pussy, sending messages of encouragement and friendship. Your walls are massaged from either end by the bottomed out boys; the shuddering pleasure of being taken from pussy and ass obliterates your self-control. They both move so easily thanks to their humble, fluid-slick sizes. It’s an ease that makes you feel far more usable than before.");
		output("\n\nThere’s only one thing left to do: <i>“Fuck me!”</i> you shout.");
		output("\n\nThe halfbreed groans, " + (pc.tallness < 6*12 ? "knees spreading and planting" : "standing on his tiptoes") + " so that he can pound away. <i>“I-It uhhmm... feels even better than just humping it...”</i> he stammers, humming between exhortations as sweat flies off his big ears, plodding on the groove of your back. His hands fill themselves with your [pc.ass], holding tight so that he can rhythmically fuck you balls deep while leaving long-lasting indents on your [pc.ass]. Those heavy nuts clap off your [pc.skinFurScalesNoun] with every impassioned collision of two hips.");
		output("\n\nNew levels of wetness are reached in your rectum, the [rat2.eyeColor]-eyed trap jerks his waist against yours, fucking the top and both sides of your colon while spurting copious amounts of warm pre. It’s the only way he can maintain some self-control while you bounce against the bottom-boy and take him along for the ride. You’re left swooning at the fuzzy-limbed rat’s cute, straining groans when you complete another cycle. Every rub of cockflesh against unstruck veins brushes an anticipatory feather over your heart, making you wonder if those gurgling balls are about to unload in your guts.");
		output("\n\n<i>“Make room!”</i> the rodenian declares, mounting and smothering the mouse-boy’s face with her ass and leveling her head to yours. The pirate’s hands stroke your cheeks");
		if (pc.hasHair()) output(" and thread your [pc.hair]");
		output(", bringing your face up to hers. She plants a tingling kiss on your lips, her tongue forcing its way in to meet yours. There’s almost no technique to this, because as soon as she locked lips she went into a frenzy. Alert eyes spin full circuits, unfocused from lust, likely due to the airless licks around her butthole. The rat-slut’s already cumming, and when she flicks her neck to dance deeper in your mouth, strings of alien-juice wick from her ears.");
		
		if (pc.hasPerk("Myr Venom") || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nMore likely, however, her orgasmic state is a result of your venom injection. Your aphro-saliva rinses her palate thoroughly, and now she reaches a new level of kiss-craze that most romanticists can only fantasize about.");

		output("\n\nGripping on to anything is impossible with two mouse-dicks sliding in and out of your [pc.vaginaNoun " + vagId + "] and [pc.asshole] in consistent, euphoria-fueled beats. Your bliss is enabled by the combined love of three rats and stoked by the studly twisting of crotches and cock-swiveling hips. Their heartbeats vibrate the deepest parts of your overheating body. This pleasure is felt nowhere more keenly than your crotch, and it’s a numbing presence that makes itself more familiar with every gyration.");
		output("\n\nYour arousal boils over, cum leaks from the rodenian’s glistening ear-ginas in greater amounts. The moans desynchronize and grow ever more incoherent and forceful. Your tongue is extracted from your mouth by the slurping and suckling mouse-slut");
		if (pc.hasBreasts())
		{
			output(", whose hands have not left your [pc.nipples]");
			if (pc.hasCock()) output(" or [pc.cockNoun]");
			output(" alone");
		}
		output(". You’re not sure whose hands are on your [pc.clits]. Only one thing seems correct: you are experiencing nothing less than complete sexual anarchy.");
		output("\n\nThe four of you sway to each other’s current; the thrusting accelerates, your eyes roll back, her eyes roll back, and the keening cry of ratgasm delivers you to yours. Both mouse pirates abruptly hilt and blast, their overfull cum factories bouncing against the top and bottom of your rear end in fluctuating nearness to orgasm.");
		output("\n\nTheir bodies tense and relax in sequence, and the sloshing you feel through the skin of their rhythmically contracting ballsacks is the last notice you get. Spurts streams and ropes of molten-hot cum paint your innards with off-white goo, flooding your [pc.pussyNoun " + vagId + "] and your colon. To your surprise, they don’t cum just a bit, they fill you so much that it begins to pour out the sides of your well-used holes.");
		output("\n\nYour supplicating cervix dilates in preparation to receive such unmistakably potent virility, as if it’s kneeling before its honeyed conqueror. Every drop of your bottom’s balls is welcomed into your core, coaxed out by your undulating cunny, and for a brief, hormonal moment, you almost hope he gives you children, that he claims you so utterly you belong to him. That thought, and the heat, carve new pathways on your brain that weren’t there before. All you can do is whimper and hold tight to those who’ve pleased your heart and soul so utterly.");
	
		if (pc.isHerm())
		{
			output("\n\nPressure swells in your loins, in your [pc.base], in your [pc.pussies]. Fingers strum your [pc.clits]");
			if (pc.balls > 0) output(" and [pc.balls]");
			output(" in an ocean of slicky-slick need; your " + (pc.hasVaginas() ? "cunts" : "cunt") + " deliver a hot " + (pc.isSquirter() ? "splattering projectile of [pc.girlCum]" : "stream of [pc.girlCum]") + " to its arouser. Your [pc.cocksLight] twitch and bounce, the tips rubbing against the alien’s belly, slowly shooting jet after jet of [pc.cum] into her ropy abdomen.");
			if (cumQ >= 500) output(" So much [pc.cumNoun] fires off that the mouse-boy’s stomach is utterly obscured by the ridiculous puddle of [pc.cumColor] herm-goo that cascades in musky webs down his glutes.");
			output("\n\nThey don’t stop thrusting until you and they are dry.");
		}
		else
		{
			output("\n\nYour [pc.pussy " + vagId + "] seals the mouse-boy’s cock, the cum-spewing tip in kissing distance of your gagging womb. The vibratory teases force you to groan wantonly into the frenching rodenian’s mouth. Your fingers wheel and flail while your [pc.thighs] quake in the grasp of your dutiful lovers. " + (pc.isSquirter() ? "Lance-like squirts of" : "Streams of") + " [pc.girlCum] anoint the rats in your pheromonal signature. Every flex of your unresponsive tendons conjures up another wave of girlspooge, the [pc.girlCumVisc] fluids draining from your climaxing form.");
			output("\n\nThey don’t stop thrusting until you and they are completely dry.");
		}

		output("\n\nHips squirm and spasm to force out the last of their backed up spunk; the halfbreed slumps over your backside while you fall forward and to the side, the rodenian girl tumbles off in an orgasmic stupor.");
		output("\n\nGasping for air, cords of sweat and spit trickle down the spent mouse-boy’s cheeks. He weakly turns and reaches around your neck, hugging you with tight insistence, humming and nuzzling against your [pc.face] and [pc.chest]. <i>“T-that was really fun. You felt so good...!”</i> he whispers in that adoring voice of his. <i>“I’m glad you felt so good");
		if (ratsPCIsKnown()) output(", [pc.mister] CEO");
		output("...”</i> he says, finally succumbing to exhaustion.");
		output("\n\nThe [rat2.skinColor]-skinned half-rat pulls out, alabaster seed leaking in his wake. He slumps to his knees and crawls over to your back, resting his exhausted head behind yours and becoming the other spoon. The rodenian also finds her place as close to you as possible, until the four of you are lying there in the richly textured aftermath of passionate sex.");
	}
	// PC chose anal, two male rats
	else if (rat2.isMale())
	{
		output("\n\nThe modded thief’s innocent yet grimy face contorts in a variety of pleasurable ways: broad smiles and laughs, teeth gritting groans... He is so utterly precious that keeping him balls deep in your [pc.asshole] for the duration of the sex would be quite relaxing, but it wouldn’t be enough to cum. The salty-sweat scent in the air puts a certain feeling in " + (pc.hasVagina() ? "your [pc.pussies], a unique pressure that forces " + (pc.hasVaginas() ? "them" : "it") + " to secrete more juice on his crotch." : "your loins, a unique pressure that makes every shift extremely pleasurable."));
		output("\n\nYou lean back and rise on the ligaments of your [pc.legOrLegs], hands on his plush thighs for support. The world as you perceive it dulls in an instant when the swollen crown of his maleness pulses pleasantly against your abdominal walls. Your head arches back");
		if (pc.hairLength > 3) output(", [pc.hair] noodling over your face");
		output(", and you cry out when the next layer of sweat thrusts from your pores, leaving behind a cool vivaciousness. To your rear, the [rat2.furColor]-limbed halfbreed boy takes firm hold of your [pc.ass], sinking his cock into the valley of your derriere proper.");
		
		if (pc.buttRating() <= 5)
		{
			output("\n\nYou can feel the two rats behind you glossing over your [pc.ass], curious if they’re disappointed. The pleasant hums that flow from their lips in between the provocative rubs to your cock-claiming rump suggest otherwise. <i>“Heh, not as big as me!”</i> the rodenian girl snerks, her palm playfully clapping into your butt and nearly forcing the cock inside to ejaculate.");
			output("\n\nIt’s actually kind of magical how you both gasped and shuddered there. <i>“It’s fine the way it is!”</i> the halfbreed boy quips. <i>“There are enough cows on this station as is...”</i>");
		}
		else if (pc.buttRating() <= 12)
		{
			output("\n\nExcited yelps and moans accentuate the respectful fondling two rats lavish your [pc.ass] with. Mouse-dick conquers and parades through the sweaty channel of your butt cleavage, the twitching phallus threatening to join the other in making you a proper buttslut. <i>“Gosh, you’ve got a nice ass "+ ratsMisterCEO() + "...”</i> the rodenian girl compliments, though you identify the hint of envy even in your blissed out state."); 
			output("\n\nThe halfbreed boy groans when his balls caress your taint. <i>“It’s really soft and big... Er, it’s not weird to say you’ve got a perfect ass, is it?”</i>"); 
			if (pc.isBimbo() || pc.isBro()) output("\n\nNo it isn’t! You’ve got an awesome butt!");
			else output("\n\nNot at all.");
		}
		else
		{
			output("\n\nA loud slap strikes like thunder, the lusty duo at your rear in absolute awe of your rippling, jiggling ass. You can feel the humps of their eyes as much as you can feel the humps of the rat-boy’s prick against your asshole and the cock within. <i>“How can you even get around with a butt like that?”</i> the rodenian giggles. <i>“You’re so big, and sooo squeezable, ha!”</i>");
			output("\n\nYou feel four hands doing just that, sinking into the tremendous amount of buttflesh available and rubbing sweat all over your plush mountains. <i>“I... Um, thank you for this,”</i> the halfbreed boy murmurs, cock fully enveloped by your tush. <i>“I’m really glad you’re letting me back here...”</i>");
			if (pc.isBimbo() || pc.isBro()) output("\n\nSo sweet!");
			else output("\n\nWere you really fighting them?");
		}

		output("\n\nThief cock plunders your sensitive depths");
		if (pc.hasCock())
		{
			output(", coming so excitingly close to your prostate. The next thrust pounds your cum-button, forcing up another");
			if (cumQ < 100) output(" string");
			else if (cumQ < 500) output(" rope");
			else output(" spurt");
			output(" of cock-drool from your [pc.cocksLight]");
		}
		output(". The amount of rat-pre squirting and squelching inside leaks out on every slow rise, and when you smash back into his hips, the rectal shockwave flings strings of sticky juice through the air. Your uncooperative hips " + (pc.hipRating() > 15 ? "pleasure" : "engulf") + " the half-rat boy’s phallus regardless of input, and all he can do is struggle to hold on.");
		output("\n\nEvery gyration of your hip brings the mouse-boy’s exploring cock-tip to a new pleasure center, accelerating your bounce between the zones of lust and edging you rapidly to the precipice of release. When you get there, you’re already seeing stars");
		if (pc.totalClits() > 0) output(" shooting with the throbs in [pc.oneClit]");
		output(". [pc.SkinFurScales] squeaks against rodent-flesh,");
		if (pc.hasFur()) output(" matting");
		else if (pc.hasScales()) output(" polishing");
		else output(" shining");
		output(" with eflluence.");
		if (pc.hasPlumpAsshole()) output(" It’s not just rat-prick that’s squeaking against your squirming crotch, it’s your inflated asshole too. The fat ring of anal entrance makes his hotdogging as pleasurable as the inside of a pocket pussy.");
		
		if (pc.hasCock() && pc.balls > 0)
		{
			output("\n\nThe [rat1.hairColor]-haired boi underneath reaches up to your [pc.cockType] boner, elegant fingers tracing down the patterns of your veins like they’re his own. Indeed, the expertise at which he handles your prick speaks volumes of how often he’s jacked his own. He chirps happily when tasting the lacquering gumballs that bead at your [pc.cockHead], using it to coat your manhood all the way to the " + (pc.ballSize() < 8 ? "dangling sack" : "swinging nutsack") + " at your crotch. <i>“You taste really good,”</i> he muses, another");
			if (cumQ < 100) output(" string");
			else if (cumQ < 500) output(" spurt");
			else output(" stream");
			output("of pre masking him with [pc.cumVisc] gratitude.");
		}
		if (pc.hasVagina())
		{
			output("\n\n");
			if (pc.hasCock()) output("His fingers, with some stretching,");
			else output("With some stretching, the mouse boy’s fingers");
			output(" reach");
			if (pc.balls > 0) output(" behind your [pc.balls] to");
			output(" your unfilled [pc.pussyNoun] and the [pc.clit] capping it. Dextrous digits clinch around your unsated femininity, focusing on that fem-boner’s backed up sensitivity; a single finger makes it inside your cunt. The doe-eyed mouse establishes an impressive rhythm, tending cock");
			if (pc.balls > 0) output(", balls");
			output(", [pc.clits], and [pc.pussyNoun] with unerring accuracy, and you can only look down in awe at his beet-red face, determined eyes full of interest in your satisfaction. <i>“I hope you like this, " + ratsMisterCEO() + "!”</i>");
			output("\n\nHow could you not?");
		}

		output("\n\nThe [rat0.furColor] rodenian smushes your [pc.arm] between her boobs");
		if (pc.hasBreasts())
		{
			output(", one hand playing across your [pc.breasts] and tugging the erect nipples capping them");
			if (pc.isLactating()) output(", a torrent of [pc.milk] spilling into [pc.milkVisc] puddles on your lay’s chest and relieving some lactic pressure");
		}
		output(". She snickers and kisses you on the cheek, nuzzling against your neck while a paw dives into your crotch with sultry intent");
		if (pc.hasVagina()) output(", joining the modded thief’s ministrations on your [pc.pussies]");
		output(". Wherever the wild and adoring trio can reach on your body they ruthlessly molest. Your [pc.thighs], your [pc.hips]");
		if (pc.hasBreasts()) output(", your [pc.breasts]");
		output("...");
	
		output("\n\n<i>“Gonna cum soon?”</i> she husks in your [pc.ear]. <i>“I like watchin’ people cum their brains out more than once but you’re trying so hard!”</i> She licks along your cheek, a quiet, sibilant purr tickling your [pc.skinFurScalesNoun].");
		if (ratsPCIsGood()) output(" <i>“We’re gonna make you cum so hard, [pc.mister] CEO, that you’ll be beggin’ us for more.”</i>");
		else output(" <i>“Let’s make you cum really hard, then maybe you won’t put up a fight next time.”</i>");
		
		output("\n\nYou end up lurching forward after a smooth stroke along your [pc.leg], hands on the soft-muscled chest of your innocuous mouse-lover. He gains more leverage with your shift in weight, giving his tail and fingers more room and space to work. The nimble rats manage to share their wriggly affections to your entire nervous system, to the point that any applied affection forces a cry of inarticulate pleasure up your throat.");
		output("\n\nMotor function continues to peter out, and you’re reduced to lamely bouncing your crotch up and down on his. The impacts are positively electrifying now that you don’t have to concern yourself with the unnecessary features of your body.");
		if (pc.hasCock())
		{
			output(" You can think about your [pc.cocksLight] growing stiffer");
			if (pc.hasVagina()) output(" and your [pc.pussyNoun] getting wetter");
			output(" in this placitude. Less to worry about makes it much easier to relax, after all!");
		}
		output("\n\nYou find yourself dipping into a fuck-drunk state, almost forgetting that there’s a poor mouse behind you with only an ass to hump and no hole to snuggle into. You crane your head, wink at the [rat2.furColor]-limbed boy, and stop to spread your smeared ass cheeks. The cock inside violently pulses on the edges of your spread hole. The raw hedonism of the act you’re about to propose makes your whole body shudder in a mixture of fear, excitement, and arousal.");
		
		if (pc.isBimbo()) output("\n\n<i>“Why don’t you go ahead and... get in there? You can both fuck my ass!”</i> you squeal, your lips sore from the smile you wear.");
		else if (pc.isBro()) output("\n\n<i>“You too, get in there,”</i> you grunt, eyes barely open.");
		else if (pc.isNice()) output("\n\n<i>“I could use another in there, if you catch my meaning...”</i> you wink good-naturedly, one hand rubbing across your ass.");
		else if (pc.isMisch()) output("\n\n<i>“Wanna try something new? Why don’t you stick your dick in right next to his!”</i> you smirk, wiggling your tush.");
		else output("\n\n<i>“You get in there too, I’m not going to say it twice,”</i> you grunt, spreading your ass.");
		output("\n\n<i>“Oh-ho! Kinky [pc.guyGirl] aren’tcha?”</i> the rodenian giggles.");

		output("\n\n<i>“W-what... Are you sure that’s going to work? " + (pc.ass.looseness() < 3 ? "You don’t look that loose..." : "I guess it might work but...") + " I don’t want to hurt you,”</i> the halfbreed boy whimpers, his cock vibrating against your back. You assure him it’s no problem");
		if (pc.hasPerk("Buttslut")) output(", and that you’ve needed a good reaming for a while");
		output(". <i>“Alright, then I’m not gonna hold back, " + ratsMisterCEO() + "!”</i>");
		output("\n\nYou’re pushed forward slightly, the mouse-boy’s eight-inch prong pushed hard in the direction you shift. He cries out when the half-rat’s cock comes knocking, and your [pc.asshole] resists at first. The standing rat humps harshly, as if to get it over with quick, but his moist cockhead flops away. He resets himself, and tries something different.");
		
		// PC buttslut
		if (pc.hasPerk("Buttslut"))
		{
			output("\n\nWithdrawing and realigning, they both move together. <i>“Slowly, now,”</i> the trappy outlaw instructs. Their slender pricks glide cautiously towards your");
			if (pc.hasPlumpAsshole()) output(" inflated");
			output(" anus, and you almost buck your hips impatiently. The moment their glans touch your ring, your eyes roll back. Anal pleasure subsumes your nerves when they spread your sphincter in unison; your butt stretches beautifully. The aching of your ass, the straining of every muscle, your body’s desperate attempt to suck those cocks in, fuck, it’s AWESOME! You just about cum from the effect, and your whole body pulses amazingly, nearly making them cum! Could they just fill you with cum already!?");
		}
		// PC not buttslut
		else
		{
			output("\n\nYour bottom boy withdraws. Both cocks come together, aligned with your asshole. <i>“Now, slowly,”</i> the trappy outlaw instructs. Twin slender cocks glide towards your");
			if (pc.hasPlumpAsshole()) output(" inflated");
			output(" anus. It makes you wince, then squint, when you feel both of them stretching your poor ass just a bit further. If they were any bigger, it’d hurt like hell, but it... actually feels kind of nice, all the sweat and pre making it a ‘so far, so good’ deal.");
			output("\n\nAnd then their girth begins to spread you <i>wide</i>. Your perspective changes immediately, and you understandably wail. " + (pc.ass.looseness() < 3 ? "If you weren’t loose before, you are now, and it’s going to last! Your body undergoes its own mini-earthquake as it frantically tries to accommodate the two mice." : "Even though you were already loose, this sensation is far different than what you expected, and puts you on the brink of orgasm. The effect it has on you is inexpressibly mind-blowing."));
		}
		
		pc.buttChange(rat1.biggestCockVolume() + rat2.biggestCockVolume());
		
		output("\n\n<i>“Wow, it worked!”</i> the rodenian girl snarks approvingly. <i>“I’ve learned a lot about you today, " + ratsMisterCEO() + "!”</i> she laughs. Her chortling would be a lot more malicious if she had a straighter voice and wasn’t playfully smothering your mouse-boy’s face with her ass. <i>“I’ve learned that you just might be bigger on butt stuffings than I am.”</i> She grabs your head and plants her [rat0.lipColor] lips to yours, tongue shoving its way past your teeth. She keeps one hand on your [pc.face] while the other");
		if (pc.hasBreasts()) output(" works your [pc.breasts] over.");
		else if (pc.hasCock()) output(" pumps your [pc.cockBiggest].");
		else output(" goes after the [pc.nipples] dotting your tits.");
		

		if (pc.hasPerk("Myr Venom") || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nThe moment her tongue dances energetically across your palate, she gets a full taste of your aphro-saliva. A gout of it forces its way past her lips to thoroughly rinse her gums in chemical arousal. Her mind explodes, entering into a kiss-based frenzy, slobbering all over your [pc.face] in search for more of that addictive treat.");

		output("\n\nIt doesn’t do much to distract you from the joy of being stuffed by two cocks in one hole. The outlaw’s slender diameters allow them space to move; their movements are more like saws that pry you even further open, but because their musky cocks are grinding against each other like that, they hit the previously unreached parts of your butt. Reasoning pours out your [pc.ears] like crystalline slime spills from the horny rodenian’s when her neck flicks. Your [pc.arms] fall limp, palms weakly pushing back against the mouse-boy’s belly.");
		output("\n\nAs they worked together in the fight, the rat boys work together in coitus. Their matching members travel inwards and outwards in long, undeniably addictive strokes. Flows of preseed splatter against every possible inch of your too-sensitive walls. Their full, squeezable ‘nads press suggestively against the fat of your ass, noticeably jostling, keeping you on edge and always bracing for the first shot of robber’s spunk roiling in those sloshing sacks.");
		output("\n\nThat relishing kiss is broken and you’re pushed down, dully moaning when brought closer to the mouse-alien’s tits. You don’t need to vocalize your pleasure in this: driven by instinct you suckle from her pointed nipples, although she bears no milk. One of her ecstatic paws runs circles on your scalp");
		if (pc.hasEmoteEars()) output(", focused on your delicate [pc.ears]");
		output(", and the other dives into her ear-pussy.");
		if (pc.hasTail()) output(" The only " + (pc.hasTails() ? "parts" : "part") + " of your body able to move with anything resembling strength now " + (pc.hasTails() ? "are" : "is") + " your pheromone-spraying [pc.tails].");
		output("\n\nAll you can comprehend are rapturous cries as your partners come ever so much closer to stuffing your ass full of rat jizz. You cum, though it’s minor, and you can’t tell from where while preoccupied with those pebbly [rat0.nippleColor] teats. Tails wind around your waist like restraining rope to halt the frame-rattling quakes, and to keep you steady for their accelerating motions.");
		output("\n\nTaken for the ride of your life, nothing but pleasure dominates your mind; saliva drips in elongated teardrops from your hanging tongue. Hips swivel and gyrate to better plumb your colon, searching out untapped pockets of pleasure. Hairs raise with every ticklishly lewd whisper the rodenian squeaks into your blissed-out skull. The mouse boys, having cried themselves hoarse from what must be incomprehensible pressure on their pricks, lose their once controlled pace and slam into your [pc.asshole] with reckless abandon.");
		output("\n\nSomething scintillating hits you, something torrid sloughs inside... They’re cumming.");
		output("\n\nYou’re not sure who came first, but when the first searing rope of mouse-spooge paints your asshole, another follows, and then another. The first sensation was a dull indicator, but the next pull your stubborn levers. You gasp shrill as your bum is filled and stretched apart by inflating urethras. You can feel their hefty balls against your ass");
		if (pc.balls > 0) output(" and your own [pc.sack]");
		output(", busily churning out a body-flooding load right into your abused hole, right where it belongs.");
	
		if (pc.isHerm())
		{
			output("\n\n[pc.EachCock] and [pc.eachVagina] spurt and " + (pc.isSquirter() ? "squirt" : "spray") + " [pc.cum] and [pc.girlCum] in");
			if (cumQ < 100) output(" middling");
			else if (cumQ < 500) output(" great");
			else output(" monstrous");
			output(" amounts, drenching yourself and the rats in the way only a");
			if (cumQ >= 500) output(" gifted");
			output(" hermaphrodite could. The painful tensing in your cock, and the rhythmic tingles in your pussy and womb force their way to the front of your mind, making sure you add your fluids to the tryst one way or the other.");
			if (cumQ >= 500) output(" All the [pc.cumNoun] surging against the rodenian’s abdomen pools on to the mouse-boy’s gut, cascading down his waist in [pc.cumVisc] webs.");
		}
		else if (pc.hasVagina())
		{
			output("\n\nAlthough your [pc.pussies] " + (pc.hasVaginas() ? "have" : "has") + " been left unfilled this whole time, " + (pc.hasVaginas() ? "they make themselves" : "it makes itself") + " known as grandly as they can. You [pc.vaginaNoun] clamps down against an invisible invader, " + (pc.isSquirter() ? "several fierce projectiles of [pc.girlCum]" : "rivulets of [pc.girlCum]") + " soak your [pc.thighs] and the cock-wielding outlaw’s legs, matting fur and leaving a lasting scent of you. The instinctive flexing in your lower half helps wring out every fresh drop, protracting your relief.");
		}
		else if (pc.hasCock())
		{
			output("\n\nWhen you feel yourself swelling from the pent up virility being pumped into your colon, your [pc.balls] " + (pc.balls < 2 ? "is" : "are") + " urged to action. Your cock twitches up and down in great leaps of throbbing verticality, long,");
			if (cumQ < 100) output(" dribbly");
			else if (cumQ < 500) output(" thick");
			else if (cumQ < 2000) output(" fat");
			else output(" obscene");
			output(" ropes of [pc.cumVisc] [pc.cumNoun] firing off into the rodenian’s nethers and across the mouse boy’s face");
			if (cumQ >= 2000) output("; you unload with such force that he has to throw his hands up for cover, unable to do anything but get blanketed with sperm over your long, tensing and relaxing orgasm");
			output(".");
		}
		else
		{
			output("\n\nThe pressure that had been mounting inside for so long dissipates, though the heaviness of the seed being pumped inside you remains.");
		}

		output("\n\nThe half-rat boy whines and pulls out first, the last of his cum firing off on your ass cheeks. He falls to his knees in exhaustion, panting, still cumming, emptying his balls like a good boy. The rodenian girl in front of you tumbles off with half-lidded eyes. Tails slip from your waist like rope no longer taut. You collapse to the side, your lawless lover hyperventilating as his pulsing cock dribbles out the rest of his climax, emptiness finally arresting the flow.");
		output("\n\nThe first move is made by the meek little boy you all rode into the ground: he turns over and reaches out for you, arms wrapping around your neck, tired face nuzzling into your [pc.fullChest]. <i>“T-that was really good... thank you so much...”</i> he whispers before his [rat1.eyeColor] eyes seal.");
		output("\n\nYou weave an arm around his head too, the others crawling to join in the aftersex cuddles. You and they spend the next few minutes together completely winded, but in utter bliss.");
	}
	else if (vagId >= 0)
	{
		output("\n\nIt’s difficult to focus on the cock buried in your [pc.pussy " + vagId + "]");
		if (pc.hasVaginas()) output(" with the half-rat girl’s fingers inside the " + (pc.vaginas.length == 2 ? "other" : "rest"));
		else output(" with the half-rat girl’s hands swimming between your [pc.thighs] looking for anything to tease");
		output(". Her playful giggles are a sensory caress straight to your heart. Her simultaneously loving and adorable tone of voice threatens to steal the show!");
		output("\n\nThe effect of it is no less impressive, she knows just how to please the feminine form: the facial tics when a spike of pleasure nails the both of you are magazine-worthy. Your bottom boy’s dirty face makes the cutest expressions!");
		if (pc.isBimbo() || pc.isBro() || pc.libido() > 66) output(" You kinda wanna take a pic of that for ‘relief’ efforts later!");
		output("\n\nThere’s a distinct thrill, too, of turning the puppy-eyed mouse boy into your personal fuckpuppet, because even the smallest tremble in his body manages to reach every muscle in yours, coaxing you into atmospheric levels of pleasure. Availing yourself of the round-eared raider’s cock, all you can do is moan in a voice of exquisite satisfaction.");
		output("\n\n<i>“Um, I hope it’s not too small for you,”</i> he murmurs, looking away shyly. <i>“T-there’s a lot bigger on the station...”</i>");

		if (pc.isBimbo()) output("\n\n<i>“What!? No way! It feels great, and it’s about to get even better!”</i> you all but shout in support, poking his cheek. No dick is too small to please!");
		else if (pc.isBro()) output("\n\n<i>“Don’t think that, because it’s about to get even better,”</i> you pat his chest.");
		else if (pc.isNice()) output("\n\n<i>“No, not at all,”</i> you smile, heart fluttering from the bashful poise on his face. <i>“You are a perfect fit.”</i>");
		else if (pc.isMisch()) output("\n\n<i>“Yeah, I can’t believe I’m riding a silly small boy, why do that when I can find a rabbit or two to fuck me instead?”</i> you grin, but he does look a bit perturbed. Your face softens and you caress his cheek, <i>“No, you’re doing great. Now it’s time for you to do better!”</i>");
		else output("\n\n<i>“Would I be doing this if you were? Don’t worry about stupid things and just accept this,”</i> you flash him a thin smile.");

		output("\n\nYour");
		if (pc.tone < 30) output(" plush");
		else if (pc.tone < 70) output(" soft muscled");
		else output(" powerfully muscled");
		output(" thighs bow to carry you up the hotly pulsing pillar of rat meat scissored between them. You stop just before the egg-shaped tip pops free of your juice " + (pc.isSquirter() ? "gushing" : "drizzling") + " crease, its [pc.vaginaColor " + vagId + "] interior barely visible in the furnace of girlmusk and pussy-warmth. You fall hard when the klepto-rodent on your back finds [pc.oneClit] and tweaks it; the abruptness makes your body shiver and your legs lock in hypersensitive ecstasy.");
		output("\n\nSopping wet cunt rains an endless shower of [pc.girlCum] on his manhood, intent on marking him for future use. You groan when the furry-limbed slut behind you breathes over and nestles her face in your [pc.ass], tongue raking across your [pc.skinFurScalesNoun] down to your thigh, " + (pc.hasFur() ? "sucking out" : "slurping") + " the salty sweat collecting on your backside with parched fervor. Those fat licks have you creaming the rogue’s dick again -- another whorish moan flies from your lips.");

		ratsFemBodyComments();

		output("\n\nWith some energy and a lot more effort, you push the thirsty rat girl (and her cleavage humping tail) out of your mind and try to attend the poor mouse underneath. Hot flashes of pleasure swirl into a storm, the eye of it being a rat’s wonderfully filling dick. Every time you bury him in your snatch, the swell of his oval cockhead always comes so close to kissing your womb, and indeed, so close to pumping a few loads right inside. Alas, you’ll just have to squeeze him a little harder and formally introduce his prick to your G-spot.");
		output("\n\nKnowing you’ve found the best position, your body acts of its own accord now, pumping and jerking in an area that makes you howl. Sweat drips from your chin");
		if (pc.hasHair()) output(" and your [pc.hair]");
		output(" in endless beads, coming close to stinging your eyes. You’re taken aback by a surprise hand reaching up to your face, one finger tenderly wiping away the salt before caressing you to the chin. <i>“S-sorry, I thought you’d like that,”</i> the messy rogue smiles innocently. You’re seeing stars when you blink at the next erotically respectful touch.");
	
		if (pc.hasBreasts())
		{
			output("\n\nThat shaky hand drops to your [pc.breasts], slick fingers coursing across your");
			if (pc.biggestTitSize() < 4) output(" pert and perky tit");
			else if (pc.biggestTitSize() < 8) output(" bountiful bosom");
			else output(" mountain of titflesh");
			output(" before spreading at the [pc.nipple]. He takes it in hand with the same care he would any other valuable");
			if (pc.biggestTitSize() >= 8) output(", excess boobflesh spilling between his digits");
			output(". You swallow, a fuzzy warm feeling radiating in your spine as you bring his free hand to " + (pc.totalBreasts() == 2 ? "the other" : "another") + " of your tits, watching him squeeze and knead with sensual veneration");
			if (pc.isLactating()) output(", sprinkling himself with [pc.milk] when he rubs just hard enough");
			output(".");
		}

		output("\n\nThe she-rat’s tail glides effortlessly in the slick channel of your ass, the flat of it " + (pc.hasPlumpAsshole() ? "sliding over the exquisitely soft flesh of your inflated anal ring" : "brushing against your shuddering pucker") + ". Fiery red and lustful purple colors fray at the edges of your vision when she hops on your back, shoving you down on the mouse-boy’s cock in defiance of your rhythm. Her hands swim for your [pc.nipples] while her accessorized tail slides in and out of your thigh-gap like a decorated dick. <i>“I love how warm you are...”</i> she murmurs, sweetly giggling");
		if (pc.hasBreasts()) output(" with your [pc.breasts] like putty in her hands");
		output(".");

		output("\n\nThe rodenian girl steps to your side, smushing your [pc.arm] between her round boobs, her hand latching around your " + (pc.hasCock() ? "[pc.cockBiggest]" : "[pc.clits]") + ". She nuzzles against the left side of your neck, letting her breath wash down your shoulderblade while snuggling into your [pc.skinFurScales]. The half-rat reaches down, and the moist sounds of fingered pussy are barely discernible over the shocks of bliss-bubbles being popped by grinding cock.");
		output("\n\nYou cum again, your [pc.pussies] " + (pc.isSquirter() ? "thrusting out more liquid lances of" : "waterfalling") + " [pc.girlCum]");
		if (pc.hasCock()) output(" while your [pc.cocksLight] dribble their sympathetic payloads into furry hands and on your lay’s [rat1.skinColor] abdomen");
		output(". You can’t keep yourself upright, so you plunge forward towards the criminal’s face. <i>“Ha! See? Even though you won the fight, look at the state of you!”</i> the rodenian laughs, kissing your cheek.");
		if (ratsPCIsGood()) output(" <i>“We’ll make you cum really hard, [pc.mister] CEO, don’t worry,”</i> she whispers into your [pc.ear].");
		output("\n\nToo fucked to " + (ratsPCIsGood() ? "understand" : "care") + ", you lamely chase more pleasure. Your brave lover-rat throws his arms around you, interlocking his hands behind your neck and bringing you into a hug. He peppers your [pc.face] with kisses before locking his peach lips to yours, inviting you to dance.");
		output("\n\nYou hungrily return those tender caresses, closing your eyes before barreling past those gentle lips");
		if (pc.tallness >= 6*12) output(", though you quickly pin his smaller flesh with your superior size");
		output(". You groan and writhe into each other’s mouths, not really feeling the rodenian pirate dragging your hand up to her head. It slips into a moist and hot place before a rubbing, clenching sensation clamps down. It’s an alien sensation, but not a painful one.");
		output("\n\nQuite the opposite, it’s an immensely temperate passage that masks your hand in sticky juice, likely girlcum, and the heat is rather pleasant.");
		output("\n\n<i>“M-me too!”</i> the halfbreed calls, her tail gyrating harder than before");
		if (pc.clitLength >= 1) output(", wrapping around your oversized [pc.clits] and giving them an expertly controlled series of jerks");
		output(". Her ribboned appendage slides along the slathering channel through her legs, against your [pc.asshole], worming between your [pc.legs] in a fanciful show");
		if (pc.hasCock()) output(" that ends around your [pc.cocksLight], which are tied together, twitching in sync with pumping mouse tail");
		output("."); 
		output("\n\nShe lies atop your back, paws clasped " + (pc.tone < 30 || pc.bellyRating() > 5 ? "in the folds of" : "beneath the abs") + " of your [pc.belly], all effort in that molesting tendril. Her lengthy hair wafts over your straightened back; the coolness of stringy [rat2.hairColor] pitter-pattering across your spine makes you gasp and buck harder into the freckled boy’s hips. She operates with an implicit desire for you to cum and for herself to cum right there with you. You abandon yourself to their orgasm-compelling efforts, body incandescent with ecstasy.");
		output("\n\nSex-minded hands and paws roam across your biceps and particularly your scalp");
		if (pc.hasEmoteEars()) output(", petting the in and out of your [pc.ears] with urgent ministrations");
		output(". Your right arm, your only free limb, clutches the rat-rogue’s head, smushing him against your breast as you hold for dear life. He’s maneuvered into a careful enough position that he can thrust all the way through your [pc.pussy " + vagId + "] and hit your womb, splaying his aching legs. The head of his phallus battering against your cervix and the taut scrotum bouncing against the slobbery foldings of your");
		if (pc.hasPlumpPussy() || pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) output(" puffy");
		output(" mons elevate you to a higher plane of pleasure, allowing you to soar through heavenly euphoria on wings of spirited bliss, cradled by three");
		if (silly) output(" outlaw");
		output(" stars.");
		output("\n\nThe first one to yowl is the rodent on your back, followed by the delighted squealing of the self-fingering rodent to your left. Their tails tighten around your waist and their voices clamor all at once, <i>“P-please cum!”</i>");
		output("\n\nThat magnificent cock that’s strummed every vaginal nerve grows fatter when his thrusting slows. His hands dip to your sides, pushing your [pc.ass] down and slapping his cumslit a centimeter into your cervix: the first shot of virility rams into the over-aroused clusters of nerves at your contracting core.");
		output("\n\nEyes cross, eyes shut. Nothing is experienced but the fine detail of rhythmically clenching cunt. The sudden growth of his blunt hardness as it swells with cum is just another mind-scrubbing detail in cacophonous and tempestuous climax. In the space of three spunk-shots, you already feel a few months pregnant. The heat of his seed forces its way into your womanly core, painting your most sacred place white; another rope, two shots, three... it’s undeniably wonderful...");
		output("\n\nHe rubs all along your [pc.skinFurScalesNoun] to the maximum limit of his arms, easing out your [pc.girlCumVisc] contributions. Your mouth falls open, and your [pc.pussies] happily " + (pc.hasVaginas() ? "pulse and " + (pc.isSquirter() ? "squirt" : "cream") : "pulses and " + (pc.isSquirter() ? "squirts" : "creams")) + " him in explosive finality.");
		output("\n\nThe biological function of cumming is the only one that works now, and you’re doing that like a star. You didn’t think you could ever get this wet, nor did you think you could ever put out this much [pc.girlCum].");

		if (pc.hasCock()) output("\n\nYour [pc.cocks], confined to a musky lair at the center of the orgy are able to dump the contents of your [pc.balls] between your [pc.belly] and the mouse boy’s thanks to the pumping rat tail around " + (pc.hasCocks() ? "them" : "it") + ". The smell of [pc.cum] joins the aerosolized miasma of your tryst soon after.");
	
		output("\n\nThe groaning girl on your back slumps off into a midden heap to your right, yelping and <i>thudding</i> onto the floor. By the time your wide-eared lover’s orgasm diminishes to a tensing and relaxing dribble, you fall in much the same way, keeping him close to your pounding heart. The rodenian... wherever she went during that, crawls weakly up to the three of you and plops herself next to your heads.");
		output("\n\n<i>“You felt really good " + ratsMisterCEO() + "... I hope that was... that was good for you...”</i> he whispers, snuggling even closer. The three of you bound together, broken down together, buzzing together... you just let your eyes shut. Who cares who or what finds you, because you need a bit of a rest after that. Besides, if anyone tries to take these rats out of your hands, <i>there will be hell to pay</i>.");
	}
	else
	{
		output("\n\n‘Interesting’ is one way you’d describe the head-swimming sensations coursing in your [pc.asshole]. <i>Fucking awesome</i> is the other, more preferred descriptor. You’ve not just bottomed out on a cute mouse boi’s cock, you’ve put all your weight on his crotch. The intense pressure on his pre-spurting dick makes him writhe into your seething body with need. Those jerks and twitches reach every working nerve in your body, and they’re enhanced by the rat slut behind you.");
		output("\n\nYou bask in your position of authority, " + (pc.libido() < 66 ? "softly sighing" : "whorishly moaning") + " while");
		if (pc.isHerm()) output(" your [pc.cockBiggest] is pumped just above [pc.oneClit]; your hermhood gets plenty of attention from the duo.");
		else if (pc.hasVagina()) output(" your [pc.pussies], dripping in anticipation are massaged, spread, and fingered by gentle thief’s hands.");
		else if (pc.hasCock()) output(" your [pc.cockBiggest] is jerked by four hands. Gentle moans fly when fingers trace the veins on your tender hardness.");
		else output(" tingles run through your spine.");
	
		output("\n\nYou begin to rise, those two greedy palms on your [pc.ass] all but imploring you to stay, the squeaking face behind them not even close to satisfied with how much time she’s had exploring the [pc.skinFurScalesNoun] of your [pc.ass]. The half-rat girl " + (pc.hasFur() ? "sucks out" : "slurps") + " the sweat pooling on your rump, those eager gulps quickly followed by pleased gasps. The flat of her tail vibrates against the twitching cock that again burrows into your colon, even teasing the boy’s sloshing ‘nads as your");
		if (pc.tone < 30) output(" plush");
		else if (pc.tone < 70) output(" soft muscled");
		else output(" powerfully muscled");
		output(" legs carry you up and down in sex so impactful that he can’t help but wail on every collision of ecstasy-imbued crotch.");
		
		ratsFemBodyComments();
		
		output("\n\nIt takes more effort than you care to admit to ignore the butt-loving runt, what with her expert massages and lust-laced praises. The slutty thief is compelled to play her tongue along the " + (pc.buttRating() <= 5 ? "petite" : "vast") + " expanse of your ass, sometimes leaning down to give the base of her friend’s pre-glistening cock a taste!");
		output("\n\nGrunting, hands on your bottom boy’s softly-muscled belly, you moan contentedly when you angle his prick to the right spot, right beneath an ass-adoring hand. You don’t ride him for a moment, you just bask in that feeling of your anal nerves being rhythmically strummed in that one spot. Electric lashes of pleasure whip your body into loving it the longer you stay.");
		output("\n\nBut your body’s a bad listener. You clutch your head, sweat flying off your shoulders");
		if (pc.hasHair()) output(" and [pc.hair]");
		output(", laughing as you ride the rogue like a horse, his hands instinctively gripping your [pc.thighs]. His face twists into a variety of magazine-worthy facial shots. He makes the cutest expressions!");
		if (pc.libido() >= 66) output(" They’d all look good with cum, digitally-applied or not, smattered all over them too!");
		output("\n\nKnowing just where the <i>real</i> pleasure is, your body makes sure his swollen tip gets there on every pelvis-busting fall. [pc.Asshole] squelches against modest rigidity, pre and sweat pouring out of your stretched hole in obscene volumes; your voices much the same way.");
		if (pc.isHerm()) output(" Your [pc.cocksLight] and your [pc.pussies] tighten and relax after every tremulous insertion, oozing just a bit more of their hot payloads in a collapsing tempo.");
		else if (pc.hasVagina()) output(" Your [pc.pussyNoun] clenches and relaxes after every wanton impact, more and more juice drizzling out begging his dick to elope with it.");
		else if (pc.hasCock()) output(" Every thunderous impact of [pc.raceShort] ass against rat-crotch makes your [pc.cocksLight] bounce up, slapping against your midriff and rebounding back to his, spurting musky pre in large quantities.");
		output("\n\n<i>“Ohh, you’re just a big ‘ol buttslut huh?”</i> the rodenian girl laughs, closing in on you and smushing your [pc.arm] between her breasts. <i>“Thought only I could hit those notes.”</i>");
		if (pc.hasPerk("Buttslut"))output(" That’s cute, but you’re just getting started! She has no idea what you can take and how much you love it!");
		else output(" You’re not a buttslut, but if it’d put her to shame you might consider it...");
		output("\n\nHer effluent-soaked paw falls to your crotch");
		if (pc.hasCock()) output(", gripping your [pc.cockBiggest] and playing so very roughly with it, jacking it in directions that stick you with masochistic prick-pressure.");
		else if (pc.hasVagina()) output(" fingers already playing on your unfilled [pc.vaginaNoun]’s field, breaking the wires of webbed girlspunk.");
		else output(" caressing the supple skin of your inner thigh.");
		
		// PC breasts
		if (pc.hasBreasts())
		{
			output("\n\nThe two rat girls catch you off guard when you’re straighten your back. The half-rat’s arms snake beneath yours, joining the rodenian girl’s on your " + (pc.biggestTitSize() < 5 ? "perky globes" : "tremendous mounds") + ". The two of them just about cackle when they drop everything else to take possesion of your [pc.breasts], the touch of titflesh making them groan with compulsive need. They rub towards your [pc.nipples] with more force than care, only interested in making you cry out");
			if (pc.isLactating()) output(" with the [pc.milkNoun] that sprinkles from your tits");
			output(". You gleefully shove your chest forward, exposing your [pc.fullChest] to further abuse.");
		}

		output("\n\nRibboned tails wind around your [pc.belly], and the rodenian girl maneuvers atop your boi. She sits her ass on his chest and pulls you into a brazen kiss, her lewd voice filling your boiling mouth just before tongues crisscross. Your brave lover-rat’s hand rebounds off her fuzzy, plump bum in a weak little spank, but she refuses to budge.");
	
		if (pc.hasPerk("Myr Venom") || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nTaking the kiss-crazed rodent by surprise, you inject her hollowing cheeks with a smattering of aphrodisiac-laced saliva. You can feel the heat of her fur intensify the nearer it courses to her core. Flush with liquid libido she works herself into a frenzy, fighting your tongue for more.");

		output("\n\nThe half-rodenian’s tail grinds effortlessly in the warm, slick channel of your [pc.ass], the flat of it " + (pc.hasPlumpAsshole() ? "squirming noisily across the inflated ring of your donut-pucker and his cock" : "brushing against his cock and your tailhole") + ". She snuggles with you, breathing over your neck, the innate snark replaced with neediness and desire for closeness. <i>“You’re so warm, " + ratsMisterCEO() + "... I wish you could hang out a bit more...”</i>");
		
		output("\n\nYou’re rocked closer to senseless by orgasm, pleasured from three angles and pulled in twice as many directions.");
		if (pc.isHerm()) output(" Paltry amounts of [pc.cum] dribble from your cocks, followed by weak secretions of [pc.girlCum] from your cunny.");
		else if (pc.hasVagina()) output(" A middling secretion of [pc.girlCum] drains from your cunny, trickling down your thighs.");
		else if (pc.hasCock()) output(" Two ropes of cum shoot from your [pc.cockHeadsNoun], plastering the rodenian’s belly with [pc.cumColor] seed.");
		output(" The eye-crossing sensations unhinge your grip and you slump face-first into the alien rat’s cleavage, [pc.hands] holding tight to her curves. You’re at the center of the sweltering triangle, cock and tails driving feverishly into and around your body.");
		output("\n\nTaking matters into his own hands, the mouse-boy thrusts of his own accord, ramming the deepest parts of your bowels, surely against his muscular comfort limits. You have to admire the rogue’s endurance and strength, battling against the weight of two sluts to pleasure you, to make sure you get the cock you need and desire. You can’t imagine how much he has to pump into you, the shaking in his balls getting stronger as time goes by. An erotic thrill courses through your veins, suddenly so curious about his output.");
		output("\n\n<i>“D-dammit...”</i> the rodenian girl sputters, feeling a tongue against her butt. <i>“H-hurry up and cummmm alreadyyyyy...”</i> she mewls into your maw.");
		output("\n\nTails lash in search of anything on your quavering frame, the heat radiating from their bodies coming close to suffocating you. <i>“P-please, I wanna cum together...”</i> the half-rat moans in your [pc.ear].");

		output("\n\nIn the hopes of accomplishing that, her decorated tail gyrates and swivels with purpose. The tip of her prehensile molester slithers through her own scent-soaked nethers, pushing against her gushing slit and threading your thigh gap in a fanciful show.");
		if (pc.isHerm()) output(" She wraps around your [pc.cocks], clinching them together and grinding against your [pc.clits] with the spare skin.");
		else if (pc.hasVagina()) output(" She grinds the flat of it into your [pc.pussyNoun], using the tip to assault your [pc.clits].");
		else if (pc.hasCock()) output(" She wraps around your [pc.cocks], clinching them together and pumping slowly.");
		else output(" She fucks your legs, bouncing back and forth.");
		output("\n\nThrill-seeking hands and paws travel far and wide on your body, focusing on your [pc.arms] and [pc.legs], and especially your head.");
		if (pc.hasEmoteEars()) output(" Your [pc.ears] receive no end of bullyish scritches, the inside and outside bathed in hot breaths.");
		output(" Your scalp is massaged, your cheeks are stroked, your nerves are kicked into overdrive spurred on by restless groping. You’re not sure how many times you’ve climaxed on the way to the big one, but the increasing incoherency among the trio tell you that they’re reaching their limit.");
		output("\n\nAs are you.");
		output("\n\nStrength rapidly fading, you clutch the rodenian girl and pull her into you, deepening the kiss and thwumping her slack butt into the mouse-boy’s face. Sore legs splay beneath you, and despite all the bodyweight that deliciously hard cock thrusts into your furthest recesses, growing harder as the humping slows. Brain destabilized, you’re unable to concentrate on rat tongue, rat cock, or rat tail, and then it has a fourth concern.");
		output("\n\n<i>“H-here, I need this...”</i> the rodenian husks, but you can’t really see what she’s doing. You feel her guiding your [pc.hand], and then the entire end of your arm is drawn into a vice very moist and very warm vice. You feel frictionless walls seal around your wrist, a sloughing feeling of sticky goo spreading across your [pc.skinFurScalesNoun]. It’s an alien feeling, but it’s not uncomfortable, nor is it painful.");
		output("\n\nInstead, it’s indescribably pleasant.");
		output("\n\nThe rat-boy underneath has squirmed into an entirely new position, able to fuck you with wild abandon, the tip of his cock claiming uncharted territory in the seas of pre pooled in your anal stretches. Daggers and nails of pleasure rake your very soul, and you cry out for more in delirious need. Every thrust splatters effluent out and simultaneously pumps fresher, hotter loads back in.");
		output("\n\nThe trio yowl. The battering of your innards, the work of a tail, the jaw-encompassing tongue you suckle, and those undulating constrictions around your hand...");
		output("\n\nAn unfettered squeal of delight spirals down your [pc.ears]. The rodent on your back howls in rapturous climax, the sloppy self-servicing becoming more apparent as projectile squirts of horny mouse slather the ground in her scent. Their voices all ring out just before you’re struck from every direction by the raw heave of orgasm: <i>“Please, cum!”</i>");
		output("\n\nYou do. They do. The rigid dick that’s conquered every inch of your anal interior hilts and balloons. The first rope of rat spunk isn’t felt at all, like it was merely giving your nerves a handshake to introduce the second which hits even harder. You gasp, shudder, and scream, head arching back. You’re so debilitatingly aroused that your spine bends painfully with every thick shot of mouse-spunk against your searing clusters.");
		output("\n\nYou see where your hand is, too: inside the rodenian’s ear-gina. Ample amounts of shining alien cum spill from the rims of her carnal canals while her head tilts. She glazes your arm in a fine sheen of fragrant girl slime, a fucked-silly expression worth a score of ten-out-of-ten bare on her snout. The biological function of cumming is the only that works now, and they make sure you perform like a porn star, doing everything they can to coax a riotous conclusion down there.");
		
		if (pc.isHerm())
		{
			output("\n\n[pc.EachCock] and [pc.eachVagina] tense up together, fluids surging through your internal plumbing in boiling desperation. Confined to a musky lair, your [pc.cocksLight] fire off");
			if (cumQ < 100) output(" thin");
			else if (cumQ < 500) output(" thick");
			else output(" monstrous");
			output(" jets of [pc.cumVisc] [pc.cumNoun] into fuzzy rat belly, the leftovers pooling with your " + (pc.isSquirter() ? "squirts" : "streams") + " of [pc.girlCum] on the aching boy’s gut.");
			if (cumQ >= 2000) output(" Jizz gushes from your orifices in near never-ending spurts and blasts; you’re fountaining them and yourself in effluent that streams across the room.");
		}
		else if (pc.hasVagina())
		{
			output("\n\nYou didn’t know you could get as wet as you feel, nor did you think such a deluge of [pc.girlCum] was possible from your own output. The " + (pc.isSquirter() ? "splattering projectiles" : "gushing streams") + " you’re depositing on your dish-eared lovers is heralded by a shocking tingle that shakes your brain, squeezing [pc.girlCumVisc] [pc.girlCumNoun] out of you like a rag. Every flex of your legs has another shot of wasted girlspunk firing from your cum-starved channel. The only one tending your feminine orgasm is the rat-slut on your back, whose own long-ignored cunt is as noisy as yours.");
		}
		else
		{
			output("\n\nIt takes all of them together to hold you in place, an anal-produced climax exploding out of you. Every bone seems to tingle in the wake of this sex-fest.");
			if (pc.hasCock())
			{
				output(" Your [pc.cocks] make their presence known,");
				if (cumQ < 100) output(" thin");
				else if (cumQ < 500) output(" thick");
				else output(" monstrous");
			}
			output(" ropes of [pc.cumVisc] [pc.cumNoun] surging up from your [pc.balls] to leave their mark on fuzzy rat belly, to collect in a pool on an outlaw boy’s stomach.");	
			if (cumQ >= 2000) output(" The amount of jizz gushing from your " + (pc.hasCocks() ? "urethras" : "urethra") + " is seemingly constant and never-ending; you fountain them and yourself, spreading a far-reaching puddle of effluence indicative of supreme masculine release.");
		}

		output("\n\nThe groaning girl on your back slumps off into a midden heap to your right, yelping and <i>thudding</i> onto the floor. By the time your wide-eared lover’s orgasm diminishes to a tensing and relaxing dribble, you fall in much the same way, keeping him close to your pounding heart. The rodenian... wherever she went during that anarchic peak of joy, crawls weakly up to the three of you and slumps next to your heads.");
		output("\n\n<i>“That was so much fun, " + ratsMisterCEO() + ", you felt so good...”</i> he whispers, curling even closer. <i>“I hope that made you happy...”</i> The three of you... bound together, broken down together, buzzing together... you just let your eyes shut. Who cares who or what finds you, because you need a bit of a rest after that. Besides, if anyone tries to take these rats out of your hands, <i>there will be hell to pay</i>.");
	}
	
	pc.orgasm();
	if (vagId < 0) pc.loadInAss(rat1);
	else pc.loadInCunt(rat1, vagId);
	if (rat2.isMale()) pc.loadInAss(rat2);
	
	addButton(0, "Next", ratsEndOfTheRide, vagId);
}
	
public function ratsEndOfTheRide(vagId:int):void
{
	clearMenu();
	clearOutput();
	showRats();
	processTime(60+rand(2*60+1));

	output("There’s an almost oppressing heat when you come to, you sense it long before your eyes open. You blink slowly, everything coming into focus, including the stained face of the mouse you took on a ride. Still fast asleep in a nap, his quiet breathing makes you long for more amicable relations. But alas, they’ll still be coming after your wallet again, so you simply enjoy this moment while it lasts.");
	output("\n\nThe tails stir before the bodies do, prehensile antennas thrusting into the air as the rodenian half of the group jump up, groaning, stretching, cracking their knuckles. <i>“Wakey, wakey!”</i> the furry [rat0.furColor] mouse claps.");
	output("\n\nMurmuring in discontent, the freckled mouse-boy begrudgingly pries his [rat1.eyeColor] eyes apart, eyelashes disentangling like snapping cobwebs. He looks at you mournfully, but eventually smiles, pushing forward just a bit to peck you on the lips. When he rises, so do you.");
	output("\n\nYou watch them all get dressed, intimately aware of the seepage in your " + (vagId < 0 ? "ass" : (rat2.isMale() ? "pussy and ass" : "pussy")) + ". The rodenian girl stares pointedly, a smirk on her face.");

	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW: output("\n\n<i>“Hope you had your fun, " + (ratsPCIsKnown() ? "[pc.mister] CEO" : "weirdo") + "! But we’re not friends, and you’re still unaffiliated. A one night stand gets you nowhere around here!”</i> she says, wagging a nimble finger."); break;
		case RatsRaider.RAT_REP_MID: output("\n\n<i>“So what if you know how to have a good time, [pc.mister] CEO! You uh, you fuck good and all, and I guess you’re cute, but we aren’t buddies! So keep that in mind, you’ll be donating sooner or later!”</i> Your chuckling seems to add another contemptuous layer to her brow."); break;
		case RatsRaider.RAT_REP_HIGH: output("\n\n<i>“Alright, you know what, that was fun I’ll admit. But you’re still <i>our</i> mark, don’t you forget who you have to pay up to around here!”</i> She sticks her tongue out, but she’s still blushing like mad."); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("\n\n<i>“That was worth it...”</i> She looks a little bashful. <i>“But we’re not just gonna let you walk over us, okay? You gotta earn that again and again if you want it! And don’t forget, you’re <i>definitely</i> going to pay next time!”</i> Yep, you sure are.");
	}
	
	if (ratsPCIsGood())
	{
		output("\n\nAfter donning their worn out undersuits again, the rats suddenly pounce on you. They lick up and down your [pc.arms], your [pc.legOrLegs], cleaning you of all the dried cum");
		if (pc.hasVagina()) output(" and fem juice");
		output(" to be found marring your complexion. After doing so, they hug you tightly and snuggle for a while longer, finally standing and waving at you. <i>“See ‘ya later, [pc.mister] CEO! Hope you stick around!”</i> they say in unison, blowing you a kiss.");
		output("\n\nTwo dash off, though the mouse-boy stays a little longer. When you finally stand, you pat him on the head and send the petty thief on his way. You just might stick around if that’s what you can look forward to.");
	}
	else
	{
		output("\n\nAfter easing into their frayed and torn undersuits again, the rats check you for any stains then clean you off quickly, damn near getting you ready for another round in the process. They lick their slovenly lips, smiling so proudly that you’re not sure how to take that gesture. Armor goes back on, and they’re ready to get back to... the things they do.");
		output("\n\n<i>“See ‘ya around, " + ratsMisterCEO() + "! Don’t forget, we’ll be watching for you!”</i> They each give you some weird salute before running off. The mouse-boy, however, winks and half-bows before trailing after them. Fucking cute.");
	}
	
	IncrementFlag("RATS_WINRIDDEN");
	
	ratShower(pc);
	ratsVictoryFinish();
}

public function ratsWhenInRodenian(cockId:int):void
{
	clearMenu();
	clearOutput();
	showRats(0, true);
	processTime(5);

	output("The [rat0.furColor]-furred rodenian meets your unrelenting gaze, half-lidded [rat0.eyeColor] staring into yours. But you’re not looking back into those inquisitive gems, you’re looking right through the plating on her helmet -- you’re looking straight at her ear.");
	output("\n\nA sensation only describable as mischievous thrill seeps from every pore on your body. It’s a thrill that slithers all the way down to your [pc.cockNoun " + cockId + "].");
	if (flags["RATS_SEXED_EAR"] == undefined) output(" You’ve read about their reproductive system, and there’s a world of pleasure to explore in either canal...");
	else output(" You won’t forget what it was like to fuck one, as that euphoric world has left a permanent mark on you.");
	output(" There’s a world of joy, too, in how " + (flags["RATS_SEXED_EAR_" + (rat0.ratVariety == 0 ? 0 : 1)] == undefined ? "they behave when you press on their" : "she behaves when you press on her") + " special button.");
	if (ratsPCIsGood()) output("\n\nA powerful blush spreads across the mouse girl’s snout. She fidgets obsessively, meeting your gaze cutely.");
	else output("\n\nThe mouse girl, naturally protective and naturally wary, shrinks back. Her bluster fades with the flush spreading across her snout.");
	
	switch (ratputation())
	{
		// low Rat Rep 
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW:
			output("\n\n<i>“Y-you’re not... What are you looking at");
			if (flags["RATS_SEXED_EAR_" + (rat0.ratVariety == 0 ? 0 : 1)] != undefined) output(" again");
			output("? If... If you’re actually thinking what I think you are, don’t you dare! You can’t do that to me! L-look, I like it anywhere else, but that’s not gonna happen!”</i> she shakes her head, though it’s not very convincing. <i>“I can suck your dick better than any slut on this station, I’ve got no gag reflex! Just use that, huh? I can be a real cock sucking star when I need to be, I could even beat you in a fight with a pregnant belly of the stuff!”</i>");
			output("\n\nShe sticks her tongue out, but you don’t think she’s really keen on keeping you away. That contradictory outburst already has blood engorging out your [pc.cockType " + cockId + "] pole. <i>“Fine... Fine, not like you can get away with anything here. If you tried anything then it’s not like I’m alone!”</i>");
			output("\n\nWhether out of resignation or hidden excitement, she still takes her helmet off to reveal that alien cavern. If you squint, you can see a sheen of fluid painting those pink walls betraying her arousal.");
			break;
		// med
		case RatsRaider.RAT_REP_MID:
			output("\n\n<i>“W-wait... You can’t be... Hey, don’t do that");
			if (flags["RATS_SEXED_EAR_" + (rat0.ratVariety == 0 ? 0 : 1)] != undefined) output(" again");
			output("! I don’t have a gag reflex, you can fuck my face really hard! How can’t you be satisfied any way else?”</i> She chews her lower lip and shakes her head, but she can’t stop smiling, and she definitely can’t stop feeling for her nipples. <i>“B-but I don’t... Come onnn can’t you just fuck me in my butt? I’ve got a nice butt, you know! I can be a bigger slut than anyone else on this station!”</i>");
			output("\n\n<i>That</i> is what you intend to find out. Your response makes her quiver, though not out of fear.");
			break;
		// high
		case RatsRaider.RAT_REP_HIGH:
			output("\n\n<i>“Aw, come on! You’re not really thinking of that");
			if (flags["RATS_SEXED_EAR_" + (rat0.ratVariety == 0 ? 0 : 1)] != undefined) output(" again");
			output(", right? Why would anyone want to do that? We can all just suck you off! I don’t even have a gag reflex! Look, I’ve got a big butt{, bigger than yours}! Do you really... have to do that...”</i> Her voice trails off, but she’s already moving that helmet out of the way. She begins to mumble and scoff. There’s something so quiet you barely hear it, <i>“Well, if I get you all to myself that can’t be so bad...”</i>");
			break;
		// goodCEO 
		case RatsRaider.RAT_REP_GOOD_CEO:
			output("\n\n<i>“I umm... I see what you’re looking at, I mean... You’re nice and all but please don’t tell me to do weird things. A-anyway,");
			if (flags["RATS_LAST_EARSEX_" + (rat0.ratVariety == 0 ? 0 : 1)] != undefined) output(" last time felt great so do what you did again");
			else output("I guess I can let you try that");
			output("...”</i> She gingerly removes her helmet, and both big ears stand at attention without a hint of reticence marring their perfectly round, fuckable shapes. They ebb and flow to her mental stimuli, flaring towards you. <i>“I like having you to myself anyway, [pc.mister] CEO.”</i>");
			break;
	}

	output("\n\nYou step forward");
	if (pc.hasArmor()) output(", slipping out of your [pc.armor] on the way");
	output(". Your waiting rodenian partner shoos the other two away, telling them that it will be fine");
	if (!ratsPCIsGood()) output(", while also telling them to be on guard for any suspicious behavior");
	output(". She holds a hand up to stop you, then moves it to her armor, shucking the weight of that cumbersome uniform. You can see the ripples in her chest even through the dark undersuit, the heaves of her pert breasts and the jutting of her teats; she breathes a sigh of inarticulate relief, humming and shivering in the beginnings of pleasure.");
	output("\n\nThe rascal’s clearly excited, brushing [rat0.hairColor] bangs from her face,");
	if (flags["RATS_SEXED_EAR_" + (rat0.ratVariety == 0 ? 0 : 1)] == undefined) output(" but there’s still some kind of nagging uncertainty behind it all");
	else output(" and she caresses the rim of her chubby ear with a seductive finger to emphasize it");
	output(". The " + (silly ? "pi-rat" : "mouse pirate") + " also looks expectant and determined, the fight yet to be fully knocked out of her, seemingly intent on making you work for this.");
	output("\n\nStill grappling with the idea that you’re about to stick your [pc.cock] in her ear and grind");
	if (pc.hasKnot()) output(" your knot");
	output(" against her skull, maybe her brain, you pause and revel in that tingling emotion.");
	if (flags["RATS_SEXED_EAR"] != undefined) output(" It’s not the first time you’ve done this, but there’s this unrelenting thrill about the whole thing that keeps you firmly erect and dripping.");
	output("\n\nShe grins at your building arousal, little paws slinking into her ears. Lithe arms are swallowed up like a cock in a cowgirl’s throat, and just a few seconds after, you see her face twist into an obscenely lewd expression. The sight is enough for [pc.cumColor]-hot preseed to " + (pc.cumQ() < 500 ? "slough in your nethers" : "spurt from your [pc.cockHeadNoun " + cockId + "]") + ". She pulls her arms out and shakes her head, looking far more turned on and a little air-headed at that.");
	if (!ratsPCIsGood()) output(" Maybe she was hoping you’d cum from the sight.");
	if (pc.isCrotchGarbed()) output("\n\nArousal threatening to peak, you toss your [pc.crotchCover] aside too, letting your raging " + (pc.hasCocks() ? "boners" : "boner") + " spring free and dribble just like one.");
	
	switch (ratsLastEarSex())
	{
		// First time
		default:
		case -1:
			if (!ratsPCIsGood()) output("\n\n<i>“S-so what are you going to do?”</i>");
			output("\n\nYou assure her that you don’t plan on enslaving her or making her into something she’s not");
			if (ratsPCIsGood()) output(" and it does assuage a lot of her fear. She even flexes her ear just to expose more of that tempting sleeve to you! <i>“Then, um, I’ve never done it there before, so do what you want. Just... be <b>mindful</b> of what you’re doing, okay?”</i>\n\nYou promise.");
			else output(", though they certainly don’t buy a word of that. <i>“If you do anything to me, you’ll regret it. We don’t hurt or kill anyone, but my friends and my boss won’t let you get away with something shitty!”</i> she shakes her fist at you, then huffs. <i>“You won, so have your fun, but this is all you get.”</i> Guess you’ll just have to prove yourself.");
			break;
		// PC was nice or neutral last time
		case 0:
		case 3:
			output("\n\nYou smile, reminding her of what you said last time. There’s a noticeable shiver that runs through her fur. An abrupt yet genuine smile completes the glazing sensation. <i>“Ohh, that was so good, I’d never forget. Pleasepleaseplease tell me you’re gonna do that again! You’re so good with that dick!”</i> she squeals, eyes focused on your swelling [pc.cocksLight] more than anything else, tongue lapping up the saliva now suddenly pouring from her lips.");
			output("\n\nThe other two look at her like she’s a complete stranger, bewildered by their leader’s sudden change of tone and behavior. While squirming and wiggling, she shuffles forward slightly. The rat-girl tilts her left ear toward you, cheek nuzzling the air where your [pc.thighs] should be.");
			break;
		// PC was assertive last time
		case 1:
			output("\n\nYou smirk, telling her that you intend on continuing the lesson from last time. She clenches and curls, but those ears stay wide open, even pivot towards you. Thin streams of lubricant wash their pinkish interior as her mouth trembles over words, <i>“Y-yeah, that sounds awesome! You gonna tell this... this... ummm...”</i> she wiggles and whispers, <i>“rat slut what to do again?”</i> The obedient rogue lifts her head and cranes her neck; a submissive warmth subsumes her as she nuzzles the air where your [pc.thighs] should be.");
			output("\n\nJust for that, you might give her a reward!");
			break;
		// PC was slutty/bimbo/bro last time
		case 2:
			output("\n\nYou chuckle, patting your [pc.cocks]");
			if (pc.balls > 0) output(" and fondling your [pc.balls]");
			output(" as she shakes giddily. You tell her to remember what you said last time, and she starts crawling toward you with a whorish moan pressing up her throat. Eyes fixated on your dick, she loses herself momentarily on the way. <i>“Mmhmmm, that was really hot last time, you’re gonna do that again right? You don’t need to bring that cock to me, you jus’ sit there and let me get nice and close to it!”</i>");
			break;
	}

	addButton(0, "Next", ratsDoRodeniansAsTheyDo, cockId);
}

public function ratsDoRodeniansAsTheyDo(cockId:int):void
{
	clearMenu();
	clearOutput();
	showRats(0, true);
	processTime(5);
	
	var ratEarFlag:String = "RATS_SEXED_EAR_" + (rat0.ratVariety == 0 ? 0 : 1);
	
	output("The horny pirate nestles her small head against your [pc.thigh], cooing softly when she’s face-to-broadside of your [pc.cocksLight].");
	if (ratsPCIsGood()) output(" Before anything else, she sighs softly, rubbing her entire body into your [pc.leg], desperate to satisfy her blatant desire for closeness.");
	output(" She rubs her nose into the most prominent vein she can find, tracing the bulged-out nerve’s shape all while her tongue drags along the outline of your cum-tube.");
	if (pc.balls > 0) output(" A dainty paw settles on your [pc.sack], fondling the testes sloshing inside with the utmost care.");

	// First Time
	if (flags[ratEarFlag] == undefined)
	{
		output("\n\n<i>“You know I haven’t done this yet, I always get by letting people use my butt if things happen, or I lie about my ears. I like using my butt, though...”</i> she grips and jerks, and your moan is just a simple reaction to that lovely pressure. <i>“But, I like you. I hope for your sake I’ll like your plan, too. You ever fuck a rodenian before?”</i> she bares her big incisors at you");
		if (ratsPCIsGood()) output(", smiling and giggling afterward");
		output((false /* pc hasn't earfucked rats */ ? ". You shake your head again" : ". You nod") + ", clenching when she suckles around the tip. ‘A’ight, I guess that means you won’t " + (false /* pc hasn't earfucked rats */ ? "be doing too much damage." : "be useless."));
	}
	// Repeat Time
	else 
	{
		// threshold <5
		if (flags[ratEarFlag] < 5) output("\n\n<i>“You know, I might actually start enjoying this.... There’s something about you that’s really hot,”</i> s");
		//threshold >= 10 and GoodCEO
		else if (flags[ratEarFlag] >= 10 && ratsPCIsGood()) output("\n\n<i>“I’m looking forward to this, [pc.mister] CEO, you’re the only one who knows how to do this...”</i> S");
		else output("\n\n<i>“I’m uh, I’m really starting to enjoy all this. I guess you must really like it in my ear,”</i> s");
		
		output("he sucks so hard on your [pc.cockHead " + cockId + "] that you nearly blow; it takes all your willpower to stay cool.");
		if (!ratsPCIsGood()) output(" Probably not hard to seem cool to them, you might be the only one who cares to interact with them this much!");
		output(" You gasp quietly, a sensual reaction to her devilish handjob. <i>“Wonder what ‘yer gonna do today,”</i> she says in her rare sharp voice, then smiles up at you. <i>“Welllll, so long as you make it feel good I don’t care... And I know you can, " + ratsMisterCEO() + "!”</i>");
	}

	output("\n\nShe finally grips your musky erection and laps the fat wad of pre sitting on the [pc.cockHeadNoun " + cockId + "], stealing it before it drips into obscurity. She gazes up at you affectionately but mostly concentrates on your " + (pc.hasCocks() ? "goods" : "tasty dong") + ". The mouse purrs, <i>“Mmhmm, you suuurrreee you don’t want a blowjob?");
	switch (ratsLastEarSex())
	{
		//firstNeutral
		default:
		case -1:
		case 3: output(" I wouldn’t mind showing you what I can do!”</i>"); break;
		//wasNice
		case 0: output(" You made me feel so good last time, wouldn’t you just like to cum so much you make my throat smell like you forever? Isn’t that fair?”</i>"); break;
		//wasMean
		case 1:
			output(" This is just the place I like to be when you’re around, [pc.master]");
			if (ratsPCIsKnown()) output(" CEO");
			output("...”</i>");
			break;
		//wasSlutty
		case 2:
			output(" Just look at this big yummy dick");
			if (pc.hasStatusEffect("Blue Balls")) output(", and your balls are so full");
			output("! I could just drink your cum allll day, " + ratsMisterCEO() + "! We can just run off and fuck in a closet for a few hours, who needs money when you got cummiesss...”</i>");
			break;
	}

	output("\n\nStroking her ear and grunting is all you manage, trying hard " + (pc.isBimbo() || pc.isBro() ? "to save your lusts for the main event" : "to be fair with her and to get what you want") + ". <i>“Okayyyyyy, but I’m still gonna get you ready first,”</i> she simpers; her sensual voice suddenly lilts: <i>“If you blow the second you put it in I’ll fucking kill you, so you better appreciate this, " + ratsMisterCEO() + "!”</i> You nod furiously, and she drops the act, resuming her enjoyment of your [pc.cocks].");
	output("\n\nYou’re all too happy to placate, to let her luxuriate in intimate proximity to your throbbing, pre-shined " + (pc.hasCocks() ? "manhoods." : "manhood."));
	if (flags["RATS_SEXED_EAR"] != undefined) output(" It’s not like she’ll be that way for long!");
	output(" The angle from where you stand and her own coquettish tilts give you ample view of her inner ear-ginas, already wettening at the prospect of squeezing a dick tight - your dick.");
	output("\n\nShe handles your boner with care and gulps it down with relative ease");
	if (pc.cocks[cockId].volume() >= 100) output(", an impressive display of oral ability considering your size");
	output(". [rat0.EyeColor] eyes look up to you around your");
	if (InCollection(pc.cocks[cockId].cType, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_DRACONIC, GLOBAL.TYPE_FROSTWYRM, GLOBAL.TYPE_KUITAN, GLOBAL.TYPE_GRYVAIN, GLOBAL.TYPE_EQUINE)) output(" bestial");
	output(" cockflesh, twitching as fast as the nose in front of them. Whiskers tickle your glossy shaft, making you gasp instead of laugh. Lusty irises absorb every blissed out face you make and nostrils flare with every whiff of musk emanating from your overheating loins while still licking. Lick up- lick down- lick... <b>Clench</b>; she has masterful technique...");
	output("\n\nHer cock-obsessed tongue pokes out from beneath her lips, expertly swirling around the tip");
	if (pc.hasCocks()) output(" while free hands work on your extra " + (pc.cocks.length > 2 ? "dicks" : "dick") + "");
	output(". She dives deeper, breathing when she can, dutifully fellating you without so much as a light cough. You nearly lose yourself to this wanton pleasure, but thankfully your senses prevail. You grab her head,");
	if (pc.libido() > 33) output(" already regretting this, and tousle her [rat0.hairColor] hair.");
	else output(" tousling her [rat0.hairColor] hair.");
	
	output("\n\nDragging the rapacious, obstinate rat off your dick is a hard thing to do. Just before the [pc.cockHead " + cockId + "] pops free from her stretched lips, she groans miserably, and it takes even more effort to push her lancing tongue away from the violently twitching crown. You bare your mast to the air of Zheng Shi, a veneer of spittle coating it. <i>“Aw, I was so close...”</i> she murmurs, the rapid trembling of her snout bringing you to the orgasmic line.");
	switch (ratsLastEarSex())
	{
		//first
		default:
		case -1: output("\n\nDeciding it’s time to finally experience what rodenian ear-cunt is like, y"); break;
		//nice
		case 0:
			output(" <i>“I wanted you to feel good, " + ratsMisterCEO() + "...”</i>");
			output("\n\nYou’re not going to cum just from her blowjob, you’ve saved all your love for her pussy! Y");
			break;
		//mean
		case 1: 
			output(" <i>“I wanted [pc.master]");
			if (ratsPCIsKnown()) output(" CEO");
			output("’s cum...”</i>");
			output("\n\nYour little slut isn’t going to get you off that easy! Y");
			break;
		//slutty
		case 2:
			output(" <i>“Pleeeeease? I wanted that...”</i>");
			output("\n\nAs much as you want to paint her with your cum, her hungry ear-pussy needs it more than her belly does! Y");
			break;
		//neutral
		case 3: output("\n\nDeciding you’ve had enough, y"); break;
	}
	output("ou lurch back, rubbing your [pc.cockNoun " + cockId + "] over her nose, and turn her head so that her warm, fuzzy cheek rests against your [pc.thigh], clinging like a magnet.");
	switch (ratsLastEarSex())
	{
		//firstNeutral
		default:
		case -1:
		case 3: output(" <i>“Mmm, go slow, okay?”</i> she purrs."); break;
		//nice
		case 0: output(" <i>“It makes me feel so safe when you do this...”</i> she whispers."); break;
		//mean
		case 1: output(" <i>“Ohh umm... [pc.master], teach your little slut a lesson!”</i> she mumbles air-headedly."); break;
		//slutty
		case 2: output(" <i>“Mmm you’re gonna stick that cock inside me againnnn I can’t wait! Fuck me even harder so I only think of your dick!”</i>"); break;
	}

	output("\n\nPushing her away like this is an utterly painful thing to do. Denying her your body warmth and vice versa... but there’s no other way you’re going to get inside. You bring your oozing and well-licked [pc.cockHeadNoun " + cockId + "] to her ear, [pc.cumVisc] precum dripping inside. When sensitive earflesh is singed by warm juice she howls in delight. The hood of her flaring canal wobbles enticingly; her swishing tail wraps around your [pc.leg] like a lonely puppy, tightening enough to obstruct blood flow.");
	output("\n\nYou buck your hips gently, pushing the tip past her hearing tunnel. Your thumping heartbeat bounces your dick into her sensitized walls, giving the horny thief an idea of what to expect when you really start drilling her. You descend deeper, deeper...");
	output("\n\nAnd then, you feel it.");
	output("\n\n");
	if(rat0.ratVariety == 0) showImage("OctoEarfuck");
	output("Vaginal muscles squeeze down around your [pc.cock " + cockId + "], gushes of rodent-cream excitedly slathering your [pc.cockType " + cockId + "] implement as it penetrates her inviting ear-cunt, going even deeper into her skull. So many thoughts rush through your mind, the outright exoticness of this making you question your ideas of sex before. You just stuck it in a rat girl’s ear");
	if (flags["RATS_SEXED_EAR"] != undefined) output(" again");
	output("... and it feels fucking incredible. Warm, smooth tightness swaddles you in the embrace of this lovely creature, almost making you forget what else you can do from here.");
	output("\n\nThe carnal volumes at which you voice your blissful gratification are drowned out by her’s; you clash with your desire to rut her head, to skullfuck her into a sexual stupor that she’ll never wake up from. This position gives you such absolute power over your partner, and recalling what you’ve read about these mice, it gives you so much more than that.");
	output("\n\nRegardless of that, you " + (flags["RATS_SEXED_EAR"] == undefined ? "begin to understand the raw sensuality of rodenian mating" : "appreciate the raw sensuality of rodenian mating, glad to have her trust") + ". You could stand there forever thinking about the raw emotion and physicality of what you’re doing. Most of the galaxy spends its time spreading legs, engaging in sexual congress face to face.");
	output("\n\nBut with this rat... She places all her trust in you, and you, in turn, have the power to vindicate that. The ideas surrounding this act are just as powerful as the vice you’ve entered.");
	
	output("\n\nYou bottom out, though you’re not sure if you can go further or you’ve hit the depraved limit.");
	if (pc.cocks[cockId].cLength() > 12) output(" And to be honest, you’re almost wondering if your sizeable endowment wouldn’t come out her other ear.");
	output(" Desirous wails assail the nearby rock while lusty squeaks tickle your heart with ethereally-light caresses. <i>“Aaaahhhhddd don’t jush wait thereeee " + pc.mf("mishhterrr", "mishhh"));
	if (ratsPCIsKnown()) output(" CEO");
	output(",”</i> she mumbles.");

	output("\n\nThe addled mouse rubs her head into your [pc.cocks], instinctually helping you descend that much deeper.");
	if (pc.hasCocks()) output(" Your other " + (pc.cocks.length == 2 ? "prick rests" : "pricks rest") + " on or around her head, moistening her hair with rivulets of precum - they at least cradle her in phallic security. What droplets of lube blaze trails down her fuzzy cheeks mats fur in lewd lines reminiscent of ruined makeup.");
	output("\n\nPulling out of that sodden hole leads you to stagger, and balance isn’t easy to maintain with her cunt-equipped head desperately smushed to your lap. <i>“Come onnnnn,”</i> she moans again, pushing you back in. You look down to see her tongue dangling, her eyes rolling back, and the biggest smile on her face. <i>“I’m gonna rob you if... if this...”</i> she giggles stupidly. <i>“I’ll totally get your money, " + ratsMisterCEO() + "...”</i>");
	output("\n\nBeatitude dominates her face and the pressure she puts on you disappears. Drool runs like a stream down her chin and thin lips. You only just get used to this wickedly perverse position and now she’s ready for you to use her any way you’d like. In total control, you pull out and thrust back in, varying tones of voice filling your [pc.ears]; you grind your [pc.base] into the nethermost recesses of her ear-cunt to satisfy your most selfish and transient desires. Her tunnels hollow greedily, fully intent on milking your [pc.cockType " + cockId + "] maleness of all the cum stored away in your");
	if (pc.balls <= 0) output(" loins.");
	else if (pc.ballSize() < 8) output(" sack.");
	else if (pc.ballSize() < 16) output(" overflowing sack.");
	else output(" heavily swinging nutsack.");
	output("\n\nYou thread locks and grip tufts of her lengthy hair, shivering when unkempt clumps brush into your [pc.skinFurScalesNoun]");
	if (pc.balls > 0) output(", your [pc.sack] tensing when it’s also graced");
	output(". The other two rats merely observe on the cusp of mindless masturbation. <i>“Is this oookaaayy?”</i> she mumbles, shocking you from your trance.");
	
	output("\n\nYou shake your head, some strange... crackle in the back of your brain.");
	if (pc.isBimbo() || pc.isBro()) output(" <i>“Sure is!”</i>");
	else if (pc.isNice()) output(" <i>“Of course!”</i>");
	else if (pc.isMisch()) output(" <i>“More than okay!”</i>");
	else output(" <i>“Should it not be?”</i>");
	output(" you blurt, shuddering so close to orgasm.");
	output("\n\n<i>“Mmyeah but... am I doing okay?”</i>");

	output("\n\nHer innocuous question shocks you into hyper-awareness. It reminds you that you’ve pressed on her hedonary gland, and that every gentle thrust so far has spurred her unique biology into action.");

	if (pc.isBimbo() || pc.isBro())
	{
		output("\n\nYou couldn’t be more excited to tell her what a fantastic little slut she is, that just after one or two sessions, you and her are going to be having so much fun and sexy times that the whole galaxy will be envious!");
		
		addButton(0, "Next", ratsPsychicHypnoSluttify, cockId);
	}
	else
	{
		output("\n\nWhatever you choose to say will be like mantra to her, and there are a few things you can think of to make this experience one to remember...");
		
		addButton(0, "Gentle", ratsTenderPsychicSurrender, cockId, "Gentle", "Be really, <i>really</i> nice to her. She obviously loves what’s going on, and she might appreciate a little kindness!");
		addButton(1, "Assert", ratsBeingTrained, cockId, "Assert", "Treat her like your favorite pet and make her experience pleasure just from seeing you happy.");
		addButton(2, "Horny", ratsPsychicHypnoSluttify, cockId, "Horny", "You could make her love sex more than any pleasure slave on this station, make her cum buckets from seeing any dick hard!");
		addButton(3, "Neutral", ratsImTooVanillaForThisHypnoShit, cockId, "Neutral", "While there’s a few things you could say to make this better, you can just leave her mental state mostly alone and focus on sex.");
	} 
}

public function ratsTenderPsychicSurrender(cockId:int):void
{
	clearMenu();
	clearOutput();
	showRats(0, true);
	processTime(30);
	
	output("<i>“You know what?”</i> you ask, trying to draw her eyes up to you. She mumbles while glancing slowly up, the effect carrying your [pc.cock " + cockId + "] into an unfucked cluster of pussy nerves. <i>“You’re doing more than okay, you’re wonderful. You’re a good girl. Everything you’re doing-”</i> Your voice trails off in a pant. No! You’ve got a duty now, you’ve got to tell her! <i>“You’re an amazing girl. Nobody else would-”</i> you gasp and throb powerfully, pounding her head hard enough for your [pc.skinFurScalesNoun] to ripple.");
	output("\n\n<i>“<b>Nobody else,</b>”</i> you speak firmly, <i>“would have the courage to do what you do! Think about what you’ve got now, what you’ve done. You have friends, you have people who care about you, and you’re all working to help others!”</i>");
	output("\n\n<i>“Yyeahhh! You know um, on Ronasca I never told anyone this- eek!”</i> she squeaks cutely when cock pumps her again. You tell her to go on, to focus! <i>“On Ronasca when we shared our latest heist, we gave out a lot of money and I remember this guy was sooo happy, he showed me a picture of his kids. It was soo cooooll... We just robbed a transport in system and made so much money fenc-ING-”</i> she mewls, licking her lips rapidly; her voice breaks with every hump. <i>“B-b-ut th-that... mmf so goood... Um, it made me feel like this, what you’re doing...”</i>");
	output("\n\nIt’s almost impossible to not give in to the shameless pleasure going on, the way her cranial pussy is hugging and sucking like a cum-hungry organism with an insatiable appetite. Ardor billows from either cock-mitten, and no matter how hard you work to please her or yourself it just... doesn’t... seem to be enough!");
	output("\n\nDilated [rat0.eyeColor] look up to yours, the rat’s smile a palpating light shining on your heart, maybe your soul. She coos girlishly, hugging your [pc.legOrLegs], relishing the delicate stroke of your palm against her head. There’s an unnatural ease at which you lash her innards with whips of pre and strikes of cockflesh. <i>“He gave me a hug and I jus’ wanted to hug back but we gotta look cool and tough! So... I didn’t...”</i>");
	output("\n\nThere’s something... not quite right here. Not wrong but... the station around you is dissipating. The other two rats fade into darkness, and when you look down again, the petite mouse is squirming wildly, cumming again... cumming so hard that she’s glowing. [rat0.FurColor] fur consumes your vision; you shake your head, the erotic energy dissipating like a lucid dream, but there’s some pervasive fuzziness spreading like a tight-fitting uniform over every muscle and bone.");
	output("\n\nYou feel indescribably relaxed, and in that relaxation you feel your climax waiting just a little more patiently...");
	output("\n\n<i>“Hhh... He showed me a picture and I got sad...”</i>");
	output("\n\n<i>“Why did you get sad? Weren’t you both smiling? Weren’t you really proud? You’re such a good girl. Good girls should be smiling!”</i> You quake, feeling like your knees are about to give out, like you’re about to collapse on her. On your next deep breath, everything simultaneously comes into focus... and blurs. Her [rat0.eyeColor] eyes leave an afterimage of color when she blinks airily, and her lusty voice becomes like shimmering glitter. Your own focus is lost just following the wisps of misfiring neurons.");
	output("\n\n<i>“Because I wanted that toooooo!”</i> she whimpers, <i>“I have friends b-but it’s not like that...”</i> she shivers from head to toe, both ears somehow flaring even wider. Your rock-hard and slime-soaked dick inside is almost totally visible in the gloving embrace of her sopping wet fuck-hole. <i>“I’m a good girl, right?”</i>");
	output("\n\n<i>“Yes you are!”</i> you roar, vigorously pumping her head in rapid bursts. It all comes natural now -- there’s a deific gravitas propelling your words and your hips! <i>“You’re a good girl, you love helping others, and <b>you love when others reward you!</b> You love when people are happy, and you definitely love when someone shares their love with you!”</i>");
	output("\n\n<i>“I looooove being useful...”</i> she whimpers, glistening eyes shutting. <i>“But people don’t really share their love much. Are you...?”</i>");
	output("\n\n<i>“Yes! I’m right here with you! There’s no other place I want to be more than with you! You’re a pretty girl, a strong girl, and above all, a very good girl!”</i>");

	// Gentle Maximum (If she was already set to 'gentle')
	if (ratsLastEarSex() == 0)
	{
		output("\n\nWhen that unyielding force pressures your lust-ridden cortex again, you welcome it. This is exactly why you wanted her again, and why you reminded her what a good girl she was. Whatever strains you feel are soothed away by her heat and her being.");
		output("\n\nYou dive into another world, a place of positive emotion that is a fantasy nonetheless. But, it’s one that you can share so intimately with your love-craving partner.");
		output("\n\nYou fall into a place that can only be described as heaven, and before you hit the ground you are caught by the [rat0.furColor]-furred mouse. The lovable rodent sets you down in a glowing field and nuzzles first against your [pc.face] and then your [pc.cockNoun " + cockId + "], the highest point in this area.");
		output("\n\nLike before, you know that somewhere else you’re still fucking her, you’re still telling her everything you want her to hear physically... but now’s your chance to do it mentally, to connect in a way that only her kind is capable of.");
		output("\n\nThe ecstasy you feel churning all throughout your body destroys your sense of relaxation. She coos in satisfaction, looking straight into your eyes, imploring you to cum, imploring you to make her yours. The smile on her face burns itself into your retinas and emblazons itself on your brain. It forges its own unique patterns and paths on your cortex, like you yourself are being subject to what she’s been.");
		output("\n\nIt’s something so sweet that you can’t hope to shake it nor would you want to. You hold her tight, and she does too; you’re slamming your hips so hard into her head that it feels violent, yet she doesn’t tell you to stop. Her loud moans shake the august environment vibrantly. Colors and sounds suffuse you with contentment, with a place of belonging. They become part of your nervous system. Those waves of bliss are simply a reaction to your reciprocation, not an assertion of control.");
		output("\n\nEvery spike of lust, every pang of elation, every rapturous romantic high you two climb together is experienced mutually on a level that nobody else could hope to match. All you’re doing is fucking a mouse-girl’s ear, but that reality is smoothed away by a telepathic influence that coats the two of you in passion indescribable."); 
		output("\n\nYou hold on to that thought, and to the mouse too, intent on making this connection one she’ll never forget. <i>“You’re a good girl, and this is your reward,”</i> you whisper, <i>“...no matter what anyone else says, you deserve to be loved.”</i>");
	}
	// Gentle Minimum (If she was not set to 'gentle' before)
	else
	{
		output("\n\nThat omnipotent force from before reasserts. There’s a snap - how else can you describe the mental whiplash? You’re foggy-minded. When this pressure renders into clarity, you are somewhere else entirely.");
		output("\n\nThere are tall oaks and fields of flowers for miles, a blue sky stretching infinitely over it all and bordering in cloudy white. Your breathing normalizes; you look down again. You <i>feel</i> as though you are moving, like you’re still back on Zheng Shi fucking a random mouse pirate in her ear. And you are. Your [pc.hips] are moving somewhere else, you can feel them but they aren’t <i>here</i> in paradise.");
		output("\n\nThe compliant rat comes back into focus, and every breath you take in this safely hidden copse the closer she comes to joining you. She walks forward, and in the blink of an eye you’re holstered in her coaxing pussy-tunnel, sitting against the tree with her head cradled in your lap, her body wrapped around your [pc.leg]. Auguries dart across your rapidly moving eyes: she’s hugging you, she’s kissing you, following closely to you, in numerous transient visions. Whatever those fantasies are, they are as momentary as this enchantment.");
		output("\n\nThe mouse-girl smiles innocently, laughs sweetly; she’s always looking up to you no matter how fast or slow you go. She’s there wherever you look, or at least some figment of her is. When you shake your head the strange illusion threatens to dispel, and that terrifies you. Accepting sanity again is to refuse her, and to refuse the conjoining of your lusts. She devotes herself wholly to you in this place, and you only want to do the same.");
		output("\n\nIn an effort to reject reality, you grab onto her head one last time, clutching it close to your lap, pounding your [pc.cockNoun] in as deep as you can, now intent on splattering her thoroughly. <i>“This is your reward for being a good girl,”</i> you say, voice like a ghost’s breath, <i>“don’t let anyone else take this from you.”</i>");
	}

	output("\n\nYour fingers dig into the rat girl’s fur, leaving prints on her skeleton. Sweat suddenly stings at your eyes, and everything goes white hot with lust. Light flashes in two directions; your emotional being is tugged between realities that you barely have a hold on. You plummet through the gap, tingles of euphoria and niceness coasting behind. Lewd and wholesome images flash on some overstimulated brainwave. All energy and force is concentrated at your crotch. Unshakable unity is achieved through [pc.cockNoun], and a silent command all but bids you to baptize it.");
	
	var cumQ:Number = pc.cumQ();
	if (cumQ < 100)
	{
		output("\n\nFresh ropes of [pc.cum] are finally milked from your [pc.cocks], and the velvety ease at which this happens is remarkable. You close your eyes, breathing on every gentle spool of [pc.cumNoun], letting the delirious rodent’s vaginal muscles drink up every string and rope and direct it to where it needs to go.");
		if (pc.hasCocks()) output(" What you shoot out on her head may be untaken, but it glazes her nicely.");
	}
	else if (cumQ < 500)
	{
		output("\n\nYou thought you’d be grunting, that your orgasm would be something proudly bellowed to the galaxy, but you’re not at all stressed. Fresh, voluminous spurts of [pc.cumNoun] flow through your [pc.cocksLight] unimpeded, tension eliminated by a higher power. A feeling of wellness blankets you; a sigh drifts out from your lips while creamy orgasm spills from the brims of her broad ears, wicking away down her fur like the pre before it.");
		if (pc.hasCocks()) output(" What you shoot over or on her head does the same, glazing the delirious rodent a fine [pc.cumColor].");
	}
	else
	{
		output("\n\nYou are almost shocked from your blissful enchantment when orgasm detonates out of you. In just three blasts of [pc.cumNoun] your [pc.cumColor] seed spills out from not just one, but both ears. You pant, struggling to <i>struggle</i>, because at least that would be normal. Instead, you can only watch cum engorge her tits, spray from every orifice, and even leak out her nipples! All with no strain, no impact to you! Her tits grow at least two cup-sizes before your [pc.balls] " + (pc.balls < 2 ? "is" : "are") + " drained");
		if (pc.hasCocks()) output(", to say nothing of her getting an impromptu dyejob from the hot loads you’ve dumped on her head");
		output(".");
	}

	output("\n\nYou’re aware of your lungs inflating, deflating. There’s nothing but blackness, and it makes sense... she’s been fucked right into unconsciousness. The rat’s a complete mess. You close your eyes to meet the lingering visions from before. With the shake of your head those memories dissipate and the whirrs and clangs of Zheng Shi return. The other two pirates are keeled over, half naked with faces as red as tomatoes, obviously having enjoyed the show.");
	output("\n\nYou’re sitting pretzel-legged with the precious rodenian scissored in your lap, sighing soft, sibilant breaths. You exhale, tenderly stroking her hair while cum spills out around your softening member.");
	if (pc.isNaga()) output(" Just to bring her closer, you wrap your [pc.leg] around her body, cradling her in snake-like security.");
	output("\n\nThe thought of leaving her defenseless doesn’t cross your mind. When you look down, you feel a primal need to stay right where you are.");
	
	pc.orgasm();

	addButton(0, "Next", ratsMindfuckDone, 0);
}

public function ratsBeingTrained(cockId:int):void
{
	clearMenu();
	clearOutput();
	showRats(0, true);
	processTime(30);
	
	output("The hedonary gland you’re battering is making her more impressionable with every pump of your hips. You smile impishly, something mischievous already in mind. <i>“You’re doing okay, but I think you could be doing better. You want me to feel good, don’t you?”</i> She gasps and jerks her head upwards, looking fearful; the sudden movement scrunches your [pc.cockNoun " + cockId + "] into a previously unfucked pocket of pussyflesh and throws you off you with mind-scrambling pleasure.");
	output("\n\n<i>“Yesss! I want you to feel good! Am... Am I not good enough?”</i> she mumbles, a rationally-vacant look in her [rat0.eyeColor] eyes.");
	output("\n\nYou shake your head ruefully, but you maintain an edge of optimism in your trembling criticism, <i>“I’m a-afraid not. I’m wondering if you really want me to feel good, if you want me to cum in your ear-cunt, if you want my dick to make you happy.”</i> Your [pc.knot " + cockId + "] slips all the way in with an obscenely loud squelch, prying the mouse’s thin lips apart even further.");
	output("\n\nThe pirate girl’s buck teeth dig into her lower lip; her face twists from sad to despondent... and to determined. <i>“I want you to be happyyy!");
	if (ratsLastEarSex() == 1) output(" I want [pc.master]’s cum!");
	output("”</i> That’s a start.");
	output("\n\nYou pant, thrusting in and out of her euphorically tight head-pussy, the muscles coaxing out every ounce of bliss from your [pc.cockNoun " + cockId + "]. <i>“I want to believe that a good rat slut like you knows what she’s doing, so I’m going to " + (ratsLastEarSex() == 1 ? "see if you’ve learned anything from last time" : "teach you a lesson") + ".”</i>");
	output("\n\n<i>“Mmmm,”</i> she moans into your loins, hugging your thigh, squeezing her ribboned tail around your " + (pc.hasLegs() ? "ankle" : "[pc.leg]") + ". <i>“" + (ratsLastEarSex() == 1 ? "I diiid, I learned lots! Are you gonna teach me something new?" : "Kayyy, what’s the lesson?") + "”</i> she asks innocently enough, your next withdrawal evoking a long-winded gasp.");
	
	output("\n\n<i>“" + (ratsLastEarSex() == 1 ? "Prove it to me, show me what a good cock-pleasing slut you are" : "I can’t teach someone with bad manners") + ",”</i> you grunt, leaning down to push a [pc.hand] into her other ear. The second you strum her untouched vaginal muscles, The chittering and shaking just about makes you drain your [pc.balls] into that divine junction. Her birth-tooth slaps down on her lower lip, a breathy groan splitting against it like water against a rock. <i>“");
	if (ratsLastEarSex() == 1) output("You remember how to make me feel good, right? Remember, you are to call me-”</i>\n\n<i>“I’mmmm a good rat slut and I want to be better for [pc.master]!");
	else output("When I fuck you now, when I make you feel good, I want you to make me feel good by calling me [pc.master]. If you can’t do that-”</i>\n\n<i>“M-m... [pc.Master]! I want [pc.master] to feel good and happy!")
	output("”</i> she squeaks, the words tumbling out of her addled mouth, contrails of saliva and sincerity sparkling behind them. Satisfied, you finger and fuck her in an even more awkward position than when you started, fucking a series of praises and chemically induced admissions out of her while pounding your initials on her mind.");
	
	output("\n\nWith the way she acts even when you’re not in her aural honeypot, you wonder if there isn’t some guilty pleasure behind what she’s saying.");
	output("\n\nA strange scratching sensation chips away at the back of your mind, bringing you to such intent focus on her that the rest of Zheng Shi disappears. <i>“F-fuck!”</i> you scream, <i>“Your ear pussies feel great! You’re better than anyone I’ve ever been with!”</i> You can’t <i>not</i> praise her performance, not when she’s creaming herself senseless around your dick and digits. " + (ratsLastEarSex() == 1 ? "<i>“You’re s-s-such a good girl, you’re so r-reliable and compliant!”</i> Y" : "<i>“I k-knew you w-w-were a good little slut at heart,”</i> y") + "our mouth trembles over the words while you lose grip and fall straight into the moist mesh of cranial cunt.");
	output("\n\n<i>“It feels soooo niiiice,”</i> she says looking up, giggling while staring into your [pc.eyes]. Your heat-numbed shaft is sucked deeper and your fingers are squeezed so hard that you lose feeling in them. <i>“Am I a good slut for [pc.master]?”</i> she asks again, lazy tongue trying to reach up to your chin.");
	output("\n\n<i>“Yes you are!”</i> you cry. <i>“You’re my favorite slut! I love being with you, and you love being with me!”</i> You can’t help what you’re saying, not with the world slipping away while you slip further into depravity. <i>“When you see me, when you see my cock and only my cock, you’ll always want more of it! You’ll want to show me what a wonderful slut you are, you’ll want me to make you feel better than anyone else could hope to! That’s how you will always make me happy!”</i>");

	// Dom maximum (if she was already set to being your personal toy)
	if (ratsLastEarSex() == 1)
	{
		output("\n\nYou know what this feeling is, and you let it sweep you away to that chamber of fantasy. Familiar parallelism strikes, and you feel more in control than last time. In control of your movements on the station, in control of your lusts and your mind, and most certainly in control of the vividly glowing rat slut " + (pc.hasLegs() ? "in between your [pc.legs]." : "sat in front of you."));
		output("\n\nThe thief-girl shivers, nods, staring at you behind eyes glazed by subservience, loudly suckling and licking your [pc.cocks]. Her peerless dick-pleasing fervor dangles you over every pit of release you can think of. Nimble fingers trace and wind around every bulging vein on your [pc.cockType " + cockId + "] shaft, stroking them to greater levels of horniness. Moist nose draws ropy lines on the delineation of your swelling cum-vein, unwrinkling the passage her [pc.cumVisc] reward will travel.");
		
		if (pc.balls > 0)
		{
			output("\n\nThose fingers land on your [pc.sack]");
			if (pc.ballSize() >= 8) output(", more than adjusted to the tremendous size of your heavy balls");
			output(". She kneads and fondles your aggressively jostling cum pouch like she’s drawing a web of pleasure across it, the threads pulsing with every tense in your bloated testes. Her tongue dances out, thirsty for a taste of minutes-old pre and the salty droplets");
			if (pc.hasFur()) output(" matting your furry");
			else if (pc.hasScales()) output(" shining your scaly");
			else output(" dotting your");
			output(" balls. Obedient flesh flattens out all the creases in your dangling maleness, leaving it shined and wobbling dangerously with a fatter load -- a greater reward.");
		}
	
		output("\n\nOnly what matters is clear: her horny face, her cum-leaking ears, and the... collar around her neck? Good addition, you think. The way she reacts... it’s like she heard your internal musing. The word on the hasp is faded, but when it’s taken out of view and replaced with glistening ear-cunt, you stop worrying about it. Your [pc.cockNoun " + cockId + "] is jacked, readied, and pushed inside, and that wonderful feeling of fucking her in two different realities craters your senses once again.");
		output("\n\nIt’s an intoxicating feeling, and one with endless thrill. She submits herself wholly to you, thoughts transmit across sexy hallucination, sharing pleasure and signaling her trust, her love, just how much she enjoys it. She hugs your waist, grinding her cheek into your groin and your [pc.cockNoun " + cockId + "] further inside, smiling contently.");
		output("\n\nYou reach out and stroke her head, pushing a [pc.hand] into the other widened canal. Suddenly everything shakes, the room you’re in vibrantly rasterizing to the flagging motions of cranial orgasm. Ethereal moans echo off the borders of the pocket augury. So many thoughts not your own flash before your eyes, desperate to share with you so many things. Of course you submerge yourself in them -- in her. She is happy, she feels safe.");
		output("\n\nAnd above all, she feels nothing but ecstasy knowing how close you are to cumming again. [pc.LipsChaste] trembling, you hold tighter to her mentally, physically, emotionally, and whisper, <i>“When I’m with you, this is what you will always feel.”</i>");
	}
	// Dom minimum (if she wasn't already set to being your personal toy)
	else
	{
		output("\n\nA strange energy dominates your senses as easily as you dominate hers. There’s a mental whiplash that forcibly asserts itself, dragging you from one reality to the next. You shake your head, finding yourself in limbo, your body moving in Zheng Shi and your mind moving with hers in a comfortable room. A room full of pillows, cushions, warmly painted walls, and a beautiful bed, big enough for you and a certain mouse.");
		output("\n\nNo details are clear in this filtered fantasy, but you know you’re sitting on that bed");
		if (pc.hasLegs()) output(" and your [pc.legOrLegs] are spread");
		output(".");
		output("\n\nThe servile thief is " + (pc.hasLegs() ? "scissored between your legs" : "sat in front of you") + ", licking up and down your [pc.cock " + cockId + "], jerking it, and wrapping her jutting tits around its matchless shape. Her whole body is thrust into phallic worship; the rat’s jiggly, furry cleavage is a perfect cushion for the throbbing of your member.");
		if (pc.hasCocks()) output(" Her tongue scooches up to your next dick, wrapping around its head and giving it a submissive lick.");
		output(" [pc.CockType " + cockId + "] flesh squishes against her slave-like suckles and kisses.");

		if (pc.balls > 0)
		{
			output("\n\nSumptuous ballflesh spreads against sensitive lips, the virile orbs inside poked and prodded by erect nipples. For but a moment she lets your [pc.cockNoun " + cockId + "] fall from the ache-soothing embrace of her breast to bury her twitching nose in your [pc.sack]. The mouse licks up, down, all the way around each nut in your pouch, groaning into your freshly cleaned balls with need, pre spurting in greater quantities on her hair. Whatever you’re brewing up is noticeably thickened by obedience, and the roiling contents jostle your");
			if (pc.hasFur()) output(" fuzzy");
			else if (pc.hasScales()) output(" scaly");
			output(" maleness against her snout.");
		}
		
		output("\n\nBoth ears flaring, the rat girl stares into your eyes before jacking your [pc.cockNoun " + cockId + "] and directing it to her ear-cunt. You instinctively reach out - is it really you doing it? - your [pc.hand] is on her head, threading her soft hair, pulling her slowly into your lap. You know you’re still fucking her on Zheng Shi, you know that you’re still thrusting your hips, whimpering and moaning in some far off place, but what you feel is much different. The sensation makes it impossible to trust anything you’re seeing.");
		output("\n\n...Except the loyal, lilting mouse-girl in front of you.");
		output("\n\nWhat you’re seeing is what she wants you to see. What you’re seeing is your favorite slut prostrating herself, servicing you, drawing you deeper into her and devoting herself to your cock and your pleasure. Her unerring eyes watch your [pc.face] clench, churn, cyclone. Although this is an illusion, you feel like you’re fucking both of her ears now. Pleasure doesn’t just crest or maximize, it <b>transcends</b>. You’re carried higher on her wings, [pc.eyes] locked to enveloping [rat0.eyeColor] eyes.");
		output("\n\nAll you can do is clutch her head tight in both worlds. <i>“You’ve earned your reward,”</i> you whisper.");
	}
	
	output("\n\nThe strength and ferocity at which you rail her head, the stings in your eyes and the detail of sweat dripping down your skull is nothing compared to the pleasure rewriting her common sense, and by proxy yours. Your gyrations are a manifestation of your superior position over the rodenian girl. You concentrate all your strength in your [pc.hips], lewd images blazing across the back of your eyelids. When she feels ashamed or inadequate, you reassure her with another brain squelching thrust.");
	output("\n\nYou tell her she’s a good girl, a very good slut, that you’ll take care of her needs whenever she wants if she’ll present herself. You tell her that she’ll always be your slut, and that if she behaves this is what she has to look forward to. A searing wave of girlcum splatters over your cock again, more potent in scent than all before it. Not only does it wash away the pain, it’s enough to make you cum, too.");
	
	var cumQ:Number = pc.cumQ();
	if (cumQ < 100)
	{
		output("\n\nAlthough your output of [pc.cumNoun] isn’t monstrous, and perhaps below average in this galaxy, the mental effect the rodenian is having on you makes you feel like an alpha with every spurt. Fresh loads of [pc.cumVisc] seed pour into her ear, the cum-hungry pressure on your [pc.cockNoun " + cockId + "] making the transit of spunk felt throughout your body... and hers too.");
		if (pc.hasCocks()) output(" Middling loads dribble out from your extra " + (pc.cocks.length > 2 ? "dicks" : "dick") + " all over her head, funneling down past her ears like the pre before it.");
	}
	else if (cumQ < 500)
	{
		output("\n\nYour orgasm is powerful. The explosion of [pc.cumNoun] from your harshly milked [pc.cockNoun " + cockId + "] reverberates through every fiber of your being, and you’re sure your feral roars are bouncing off the walls on Zheng Shi. You can’t hear it or feel it however, focused as you are on breeding your favorite toy, stuffing her so hard with [pc.cum] that the excess splatters outward from her cranial cunt and dribbles down from the rim of her auricle.");
		if (pc.hasCocks()) output(" What you shoot over and on her head glazes her in a fine cascade of [pc.cumColor] " + (pc.hasVagina() ? "hermspooge." : "spooge."));
	}
	else
	{
		output("\n\nYour virility was always something to admire, but somehow, copulation with this rodenian elevates it to another plane entirely. [pc.Cum] fires off in violent bursts, thicker and greater than a laquine’s, and in the space of three shots, [pc.cumVisc] seed blows back, splatters you, and launches out her other ear. Your spunk-spulsion inflates her perky tits with all the volume a gifted mate like you has to offer. Engorged a few cup sizes larger, the rodenian’s nipples squirt [pc.cumNoun] like lactic fluid, only adding to the obscene display.");
		if (pc.hasCocks()) output(" Your extra " + (pc.cocks.length > 2 ? "dicks flex" : "dick flexes") + " mightily above, dying her hair a brand new color to match your [pc.cumColor] " + (pc.hasVagina() ? "hermspooge." : "spooge."));
	}

	output("\n\nWhen you finally calm down, and when you shake the illusory world she conjured in your superbly satisfied mind, you find yourself welcomed back to Zheng Shi by the whirr and buzz of illicit activity. In your lap the rodenian rests heaving and snoozing, knocked unconscious by the ferocity of your sexual encounter. [pc.CumNoun] and rat-slime ooze out from her ear, dribbling into a puddle below your softening [pc.cocksLight].");
	output("\n\nYou glance over to the other rats, themselves passed out and half-naked, likely having masturbated during your encounter. You glance again to the tired mouse pirate and hold her closer,");
	if (pc.isNaga()) output(" wrapping your [pc.leg] around her body and");
	output(" cradling her head. It’s all you want to do, and it’s all you need to do.");

	pc.orgasm();

	addButton(0, "Next", ratsMindfuckDone, 1);
}

public function ratsPsychicHypnoSluttify(cockId:int):void
{
	clearMenu();
	clearOutput();
	showRats(0, true);
	processTime(30);

	output("<i>“You’re doing awesome!”</i> you blurt, big dopey smile on your face. Her head twists upwards, acidically pleasurable vaginal muscles squirming around your [pc.cock]. She jerks her head in the direction of your crotch, desperately licking at your");
	if (pc.balls > 0) output(" [pc.balls]");
	else if (pc.hasVagina()) output(" [pc.pussy]");
	else output(" [pc.knot]");
	output(". The submissive rat’s sultry moans ripple across your " + (pc.hasVagina() ? "leaky twat" : "masculine endowments") + ", her snout writhing with need");
	if (pc.balls > 0) output(" in your ballflesh");
	else if (pc.hasCocks()) output(" against your flexing shaft");
	output(".");
	output("\n\nShe’s very much interested in your pleasure, and you’re curious if there’s something more to it you can coax out of her. <i>“You love sucking dick, don’t you? At heart, you’re just the best jizz-sucking slut there ever was. " + (pc.isBimbo() || pc.isBro() ? "You know what I think? There’s a lot more to your love of dick than you’re letting on!" : "What do you really like doing?") + "”</i> You reach down and jam your [pc.hand] into the other ear, stroking against the lonelier half of her aural orifice, a smattering of rat-slime warming your [pc.hand] and running down your arm.");
	output("\n\n<i>“I like helping ooootherrrssss!”</i> she whines, head bouncing back and forth between your [pc.arm] and groin. Although your thrusts have become even more awkward, her entire body rattles, leaving no doubt to her enjoyment of this. Delightfully hot ribbons of rodent nympho-cream baste your [pc.cockNoun " + cockId + "] and fingers; the naughty mouse coos ever more lewdly when you rail her sweet spots. <i>“I like taking things that others don’t need, I wanna make others happy!”</i>");
	output("\n\n<i>“See, I was right!”</i> you gasp, [pc.cockHeadNoun " + cockId + "] smacking against her brain-washing gland, the torrents of bliss and euphoria glazing her [rat0.eyeColor] eyes as you look down at her from your dominant position. <i>“You’re just fooling yourself... Or m-maybe you’re being fooled! You don’t need to steal and give to others just to make them happy! Look at what you’re doing now, trying so hard to make me happy, licking, sucking, and giggling just waiting for my cum!”</i>");
	output("\n\n<i>“Cummmm?”</i> she drools, blissfully licking her surely-sensitive lips. The pirate girl nods, subconsciously applying more pressure to your overwhelmed shaft.");
	output("\n\nYou flail in white hot lust when her ear-cunt clamps down and twists your [pc.cockType " + cockId + "] manhood, screaming <i>“Yes!”</i> Bulging veins indent the walls of her swampy interior, pulsing at your nearness to being forcibly milked. <i>“You want to help others, I get that, but the way you’re going about it- The way...”</i> Your voice trails off in a pant, and you start moaning with her in wanton enjoyment."); 
	output("\n\nIt feels wrong to push away what makes you feel so good, but you’re onto something here! <i>“You can help others just by getting horny when they drop their pants, you can help even better by giving them orgasms, nothing makes someone’s day or night like a good slut!”</i>");
	output("\n\nThe horny rat’s big teeth dig into her thin lips, a chittering purr rumbles up her throat to vibrate your thoroughly slimed cock. You focus on making her just a bit more impressionable with intensifying head-banging.");
	if (pc.isBimbo() || pc.isBro()) output(" After all, she can’t truly accept the lovely slut that she is if she’s not paying attention! If you can’t show her what true pleasure is, and how that makes everyone happy, then you’re not [pc.name] Steele!");
	output("\n\nYour own tongue falls out like a limp noodle; you bend your wrist against pussy-walls so far untouched. A grunt interrupts your words, some strangely pleasant buzz digging into the back of your head like the point of a knife. Libidinous intonations tumble from your mouth as easily as precum spurts into her fuck-hole: <i>“You wanted something from me to help others with, but don’t you see what you can be doing? Can’t you <b>feel</b> it? You sucked my dick like a champion and you spread your ear nice and wide. When I " + (pc.balls > 1 ? "empty my balls" : "cum inside") + ", you’re going to know exactly what you can do for others, they’ll know exactly how happy you are that they’re happy...”</i>");
	output("\n\n<i>“Ohhhhh that’s... I love that!”</i> she cries, another clench of internal muscle totally locking you in place.");
	output("\n\nToo turned on to stop, you indulge again, <i>“When you see me, when I tell you I’m horny, that’s gonna get you horny too. You’ll love to relieve people of not their wallets, but their desires!”</i> She looks up, eyes brightening like a light bulb. <i>“Relieve people of their cum, keep them nice and docile with a good blowjob! You’ll do so much good if you focus on that, and nobody would ever turn down a slut as skilled, as cute, and as determined as you!”</i>");

	// Horny maximum (only for bimbos and bros, hyper intense, turns into a 3some/4some)
	if (pc.isBimbo() || pc.isBro())
	{
		output("\n\nUnnatural neurological impulses slam against your oversexed cranium. You quirk an eyebrow, feeling like your already impressive libido and desire for sex and love of cumming is being... tested. No, more than tested! It’s like something is trying to make you sluttier! When you close your eyes it all becomes crystal, luridly clear: strange shapes and figures in the likeness of humanoids are fucking all around you in an orgy designed to test the limits of known depravity. It’s so... <b>hot!</b>");
		output("\n\nAnd so distracting!");
		output("\n\nThe rodenian’s sinuous ear-pussy twists and turns, clenching all around your [pc.cockNoun " + cockId + "] desperate for cum. Movement speeds up but becomes more difficult, you can only start wiggling and whining as she goes through her most intense orgasm yet! It shakes the colors from the sky and the walls, blinding you with the light of vivid orgasm.");
		output("\n\nYou cry out, calling for the other rats. You can tell she wants more, that your little slut <i>needs</i> more! You open your eyes, half in a dimension of wanton fantasy and half on Zheng Shi. About all you can make out on the pirate’s station are both rats standing, nervously approaching. You can’t hear, only direct.");
		output("\n\nThey drop their outfits while you pound away at your squealing sub, pulling your hand from her other ear. Rivers of rat juice drip from your hand and wrist, the now unstuffed ear begging for attention again. The smell and heat radiating from that needful cavern knocks you over, bowing your [pc.cock] into an all new pleasure-zone. Exploring her head-pussy is a neverending paradise of sexual stimulation, as that unknowable passage promises greater euphoria with every inch claimed.");
		output("\n\nEmissions from the unfucked slickness work their way through the mouse-boy’s bloodstream, and you can see his boner throb in delight. You tell them in no uncertain words that their leader needs a fuck, that she’s embracing a whole new world of pleasure, and that only they can help you satisfy her! Help her, help them! Help everyone, by giving out the best orgasms!");
		output("\n\nIt all starts by filling her, after all!");
		output("\n\nThe mouse-boy’s cock slides in all the way, his face twisting in half anguish and delight. You’re sure spunk is being milked right now the way his nuts churn! " + rat2.mf("The halfbreed boy shoves his cock into his leader’s face, consumed by lust himself and likely spurred on by the insensate demands for dick.", "The halfbreed girl plants her bare, sweet-smelling twat on the fuzzy mouse’s face, making sure that engorged clit gets all the attention it deserves."));
		output("\n\nBasking in pleasure, feeling every drop of off-[pc.cumColor] pre being drained from your fully dilated cum-vein, you know you won’t last much longer. Sultry delirium transmits to her, forcing indescribably lewd images upon her wildly shifting mind. Orgasmic moans dominate your hearing as fountains of cum rain all around. You dive into the ocean of lust mouth agape, dragging your well-clutched and sopping mouse-girl down with the others, frotting, grinding, and plowing her into a permanent fuck-craze.");
		output("\n\nYou loose one final breath, eyes half rolling back, holding on so hard to the well-fucked thief that you, for some reason, know you’ll be thinking of when you find your next lay.");
	}
	// Horny minimum (only for non bimbos and bros)
	else
	{
		output("\n\nVisions not your own batter your mind, intent on inserting themselves. Bizarre and lurid details overtake what you see on Zheng Shi and rip you straight out of your body, bringing you to a dimension that only be described as an elemental plane of lust. Clouds and shapes in the likeness of humanoids fuck on beds and cum across vast expanses of pink-hued environs. Cowgirls get filled with comically large loads that swell ludicrously endowed cocks. Screams of orgasm control the air. Wet holes await equally wet visitors all around, begging for creamy, sticky discharges.");
		output("\n\nYou shake your head out of nervousness, but the raw and sensual display only jostles. Another press, another clinch, and you start to enjoy it. The musk and scent of raw sex straight out of some debauched holovid assaults your senses; ball stench and feminine quim vie for space in your nostrils, fighting for sensory territory. It’s... quite nice. More than nice. Whatever’s affecting you wants you to enjoy this. It spikes your libido, it quickens your heart and the motions of your [pc.hips] (wherever those are).");
		output("\n\nIt’s hard to dislike any of this when you look down.");
		output("\n\nYou’re still hilted in your little fuck-toy. She’s still moaning, she’s still crying for more. Opposite you stands a simulacrum in your image, blank and foggy white, pounding her other ear. Looking in any direction you only find another sexual act underway, all being performed by a variety of mismatched racial limbs and sexual endowments. Pussies are pounded, butts are stuffed, but the most important act of all is happening right " + (pc.hasLegs() ? "between your [pc.legs]." : "below you."));
		output("\n\nThat assertive tingle gloves your mind like latex, transforming every synapse into one solely dedicated to sex and to the enjoyment of it. You feel your body moving somewhere else. You’re thrusting, you’re fingering her, but it’s not what’s happening here. Another image is conjured up and the glowing rat’s mouth is stuffed by a phallic-shaped object. Your attention is drawn unerringly to her. Everyone around her is happy, they’re all cumming buckets.");
		output("\n\nAll that’s left is for you to add your energy to this orgy.");
		output("\n\nClutching her head, your lips form words that are not heard. Although you fear she can’t understand you, that she can’t sense your intention, you instinctively <b>feel</b> that you are understood. Her pleasure is somehow yours. More thoughts float around your addled cerebrum, begging you to cum, begging you to cum again after that. Voices clamor telling you to keep fucking while simultaneously speaking to your [pc.cockNoun " + cockId + "], telling it to stay hard and churn out even more.");
		output("\n\nWith more clarity than all others, the rodenian tells you that she’ll do anything to make anyone happy like this, and you especially.");
		output("\n\nYou shut away the orgiastic realm, only intent on driving in and out of her ear-cunt -- you’ll make this fantasy her reality. You want to drain every drop of [pc.cumNoun] into her until it spills out, and then you’ll come back to do it again. Fur glows brighter; an unsubtle force like the meshing of rat tails impel you to greater speed. Effluent-smeared cocks react to attention real and unreal, squelching loudly inside rodenian sex-mittens. Nerves cry out to deafened breeders for rest. Every heartbeat adds inches to your erection, an imagined swell that threatens to split her apart.");
		output("\n\nFor all this effort, you’re no closer to your goal. Instead of trying to stay ahead of it, you realize your mistake in trying to cum with her. The alien slut is only waiting for you to join her. The epiphany elicits a bubbly giggle, she was letting you have your fun, waiting for you all along! You sink into her lust, and your [pc.hands] crisscross with hers. It’s not seen, but it’s <i>felt</i>; you surge forward so powerfully, once, twice, and finally... you cum.");
	}

	var cumQ:Number = pc.cumQ();
	if (cumQ < 100)
	{
		output("\n\nYour limp and dribbly orgasm is a little sad, but whatever’s going through your head makes it feel a lot stronger and a lot less inadequate. What are small and average ropes of [pc.cumNoun] being eased and coaxed into rat ear-cunt feel like powerful jets. You melt away into her, her orgasm as intimately felt as if it were your own.");
		if (pc.hasCocks()) output(" The remainder of your [pc.cumVisc] expulsion pools in her hair, puddling and leaking down around her well-fucked ears.");
	}
	else if (cumQ < 500)
	{
		output("\n\n[pc.EachCock] " + (pc.hasCocks() ? "throb and swell" : "throbs and swells") + " with virility, even more than you’re used to. Your [pc.balls] " + (pc.balls < 2 ? "vibrates, clenches; it forces" : "vibrate, clench; they force") + " out [pc.cumNoun] with such force and strength that it sprays from your [pc.cockHeadNoun " + cockId + "] in a uniquely appealing way that leaves you breathless. Muscles and nerves numbing, you watch through a tiny slit of vision her tits swelling up another cup-size from the sheer amount you pump into her.");
		if (pc.hasCocks()) output(" Your extra " + (pc.cocks.length > 2 ? "dick throbs and fires" : "dicks throb and fire") + " off enough to change her hair color if it settles into her scalp!");
	}
	else
	{
		output("\n\nWhen your [pc.cocks] " + (pc.hasCocks() ? "swell" : "swells") + ", when the geyser blows and jism surges, it does so with inelegant might. <i>Might</i> is the only word that affirms how powerful, how filling, how perverse your orgasm is. [pc.Cum] sprays, backwashes, and splatters out of both ears. What finally makes it into her nipple-wombs fills her tits with so much spunk that she grows a few more cup-sizes. [pc.CumNoun] squirts from her teats like mutant lactation, painting the ground and the rest of her body in your rich-smelling semen.");
		if (pc.hasCocks()) output(" Overhead, your extra " + (pc.cocks.length > 2 ? "dongs" : "dong") + " thoroughly coat her hair in a blanket of virility that will take serious effort to wash away.");
	}

	output("\n\nWhen you finally calm down and open your eyes again, you’re sitting on Zheng Shi. Eventually you realize that you can hear the distant thunders of construction and mining between the bellows. You look down to see the overfucked rat fast asleep in your lap, heaving and snoozing, the other two rats also knocked out by their " + (pc.isBimbo() || pc.isBro() ? "own libidos" : "intense masturbations") + ". You stroke her hair, whispering sweet nothings");
	if (pc.isNaga()) output(" while wrapping her in the rhythmically hugging embrace of your [pc.leg]");
	output(".\n\nYou aren’t going to leave her in this position. She needs to rest, and so do you.");
	
	pc.orgasm();

	addButton(0, "Next", ratsMindfuckDone, 2);
}

public function ratsImTooVanillaForThisHypnoShit(cockId:int):void
{
	clearMenu();
	clearOutput();
	showRats(0, true);
	processTime(5);

	output("<i>“Yes, you’re doing okay,”</i> you whisper, fingers trailing on the edge of her ear between your slow pumps. You haven’t hit her hedonary gland that hard... yet.");
	if (pc.isNice()) output(" <i>“I’m happy that you trust me enough to do this.”</i>");
	else if (pc.isMisch()) output(" <i>“I can tell you’re a sweet thing, you trust me enough to let me do this.”</i>");
	else output(" <i>“You’re a little trusting, though. I could just tell you to go out and be a porn star.”</i>");
	output("\n\n<i>“Ha-haaaaaa,”</i> the rat girl nuzzles your [pc.thigh], her warm and soft fur feels lovely against your");
	if (pc.hasFur()) output(" own");
	else if (pc.hasScales()) output(" scales");
	else output(" skin");
	output(". <i>“");
	if (pc.isNice()) output("Well, you seem nice.");
	else if (pc.isMisch()) output("Don’t be so sure of yourself!");
	else output("You wish!");
	output("”</i> she giggles. <i>“But you’re not like anyone else around here. Besides, now that I know- Ah!”</i> the [rat0.furColor]-furred thief yelps when you slam into her head; she looks up, meeting your eyes gleefully. That motion also brings another pleasant scrunch of pleasure to your [pc.cockNoun " + cockId + "]. A playful laugh barrels out of her lips when you silently scream out, caught off guard. <i>“Heh heh, you look really cute when your dick is bein’ teased, " + ratsMisterCEO() + "...”</i>");
	output("\n\nRat-jizz pools and splatters outwards on your crotch with increasing rapidity. Slow and tentative strokes are what you need, and they’re certainly what she wants most right now. You could just lose yourself to the ease at which you fill her gushing hole. You cradle her in a distinctly alien way, but the way her ear-pussy cradles you back humbles your effort. That vagina clings tightly to your girthy intrusion, and its girlspunk-stained interior warms and beckons you deeper on every gyration.");
	output("\n\n<i>“Buuuuuuut, as I was say-ing,”</i> she hums, putting her arms around your [pc.legOrLegs] to steady her rocking head, <i>“now that I know how easy you are when anyone spreads a pussy for ‘ya, I’ll get you off then come back and get your money later!”</i>");
	output("\n\n<i>“Can’t we just do this again?”</i> you blurt, every pulsing vein being glazed and massaged so, so thoroughly...");
	output("\n\n<i>“Don’t get... Don’t get used... uhm, feels so good...”</i> she moans");
	if (pc.hasCocks()) output(", licking upwards at your extra [pc.cockNoun]");
	output(". <i>“I’m the one enjoying you, not the other way around!”</i> she chirps almost. <i>“Gonna make you cum so hard you won’t be able to stop me from getting your money! We’ll help sooo many people!”</i>");
	output("\n\nGrinning, you pull back to leave her hanging, a temporary moment of peace broken by you pounding her hard enough that ratcum backwashes in a turgid spatter. The rodenian’s irises spin a full 360 and her tongue falls from her mouth.");
	output("\n\n<i>“I think...”</i> you start, hitting that deliciously warm sweet spot again");
	if (pc.hasKnot(cockId)) output(", grinding your [pc.knot] all throughout her tunnel of love");
	output(". <i>“...That you’re gonna want to give me your ear again. Maybe we can make a little contest out of this? ");
	if (pc.isNice()) output("I cum first, I’ll give you something. But if you cum first, we can do this again.”</i>");
	else if (pc.isMisch()) output("If I cum first I’ll help ‘ya out, but when you cum first I’m going to want to use this ear-pussy again. You feel great, you know that?”</i>");
	else output("When you cum, I’ll expect another go with your ear-cunt. A slut like you wouldn’t mind, I’m sure.”</i>");
	output("\n\n<i>“Mmm, you’re gonna loooooseeee,”</i> she giggles, <i>“we never lose, we’ll get your donation, " + ratsMisterCEO() + "...”</i> Despite her lackadaisical tone of voice, she accepts your challenge and swivels her head this way and that, carrying your [pc.cock " + cockId + "] somewhere deeper than before. The overwhelmed thief runs her nimble fingers all along your [pc.knot " + cockId + "]");
	if (pc.balls > 0) output(" and around the diameters of your [pc.balls]");
	output(".");
	if (pc.totalClits() > 0) output(" She even takes the time to tease [pc.oneClit] from your labial hood!");
	output("\n\nYour [pc.cockHead " + cockId + "] tightens and balloons in her deepest recesses, " + (pc.cocks[cockId].cLength() < 12 ? "still so far from reaching her chest-womb" : "long enough that it must be nearing her chest-womb") + ". When her saucer-shaped ear swivels and flexes, you’re taken along for the ride, nearly losing your balance. In this awkward position, the girlcum splattering across the exterior of your [pc.cockNoun " + cockId + "] heals the strain on your body.");
	output("\n\nShe’s not fighting you so much as egging you on, desperate for you to fuck her senseless. A weirdly pleasurable tingle crops up in the back of your mind, helping speed you along to the right state of mind to do that. <i>A state of mind loaded with hormones and wild sexual desire.</i>");
	output("\n\nYou lean over the rat’s head, swirling your [pc.hips] to massage the full radius of her ear-pussy. The spasming interiors grip your [pc.cockNoun " + cockId + "] tight enough to block pre yet suck so forcefully that you are left gasping hoarse. Not to be outdone, you whisper a few sweet nothings in her ear while snaking a [pc.hand] to the opposite orifice. <i>“Noooo that’s cheaaaating...”</i> she murmurs, leaning right into your fingers anyway!");
	output("\n\nThe rodenian’s being fucked in two different, incongruent ways, pretty much ensuring she has no chance of ‘winning’. How could she, when you’re rhythmically strumming one set of vaginal nerves and battering the others? The eager pirate’s smile stretches, her blush brightens; she jacks your exposed cockmeat and squeezes your [pc.thigh] with her tail, helping you drag her to the next level of pleasure.");
	output("\n\n<i>“Harder... I need moooooreeee,”</i> she says, <i>“push it all the way in!”</i> she barks.");
	output("\n\nYou lurch backwards, feeling her cranial cunt seal to keep you from leaving. The friction generated by that sudden seizure makes makes you scream, it makes you want to cum, and for a moment you feel like it’s about to happen. There’s a wickedly thick beat of pleasure that smashes into you, one that opens your cum-plumbing and all but bids your spunk-reactors to go critical.");
	output("\n\nThey would have... until that pervasive mental anodyne calms you. You softly sigh, but see that Zheng Shi has faded away to the point that it’s only you and the rodenian on a cylindrical platform -- the only light in a void. The station is there, but it’s blacked out, faded and muddy, and all you can focus on is the glowing [rat0.furColor] fur of the rat in your lap. You stretch two fingers in her other ear, everything tenses and goes out of focus, and when you thrust your [pc.cockNoun] back inside the pressure equalizes.");
	output("\n\nBefore you can wonder what’s going on, the same unerring force eases your fear. Anxiety is quelled as you’re spurred back inside those cum-leaking ears, your passage easier than ever. You feel an irresistible compulsion to stroke her head, to run your fingers through her hair, to do anything you can to satisfy and please her. All she does is giggle airily and moan for more. You hear her voice, but you also... don’t. It’s like you’re in two separate places, that you’re not only fucking her in the real world but also in some hyper-fixated way.");
	output("\n\nOthers might be concerned with that, but when you shake your head and see how easy it is to dispel it, you return to that lucid realm and <i>revel</i> in the out of body experience. One squashing thrust is may, and every vibration is like an electric lash of sensation. The scents tickling your nostrils, the courses of pleasure along your [pc.cock " + cockId + "], the sense of belonging... whatever’s happening, you don’t want it to end. You want to take this slower, almost, to keep this strange phenomenon going for a little longer.");
	output("\n\nBut you can’t. When you feel your rigid rod smattered by another expulsion of mouse-slime, when your ear-conquering rod is infused with the irradiating heat of a well-fucked partner, you thrust harder, harder, intent on depositing every [pc.cumVisc] drop in your [pc.balls] in that alien pocket. Those head-ginas have robbed the scoundrel of all her muscle control through many sequences of climax. The thieving rodent is now yours to manhandle, yours to claim.");
	output("\n\nTilting her head to the side, you absorb every detail of her strange biology, watching your skull-fucking shaft glide in and out with reckless abandon. Her voice touches and massages every muscle in your body, it fills your mind with her... is she doing it purposefully? Whatever the case, it’s about to be silenced. You grip her sensitive ears, dragging the last air kicking from her lungs just before you hilt her. It all comes rushing out...");
	
	var cumQ:Number = pc.cumQ();
	if (cumQ < 100)
	{
		output("\n\n[pc.Cum] fires off smoothly, the averagely-sized strings and ropes of [pc.cumNoun] searing whatever passes for a cervix in her body. Your cum-spurts aren’t tense or pressuring, they’re just... easy. You feel no shame in how little you put out, because you’ve joined her on a deeper level than any other partner. Her orgasm is something you feel more than intimately when your orgasm reduces to a relaxing dribble.");
		if (pc.hasCocks()) output(" Your extra " + (pc.cocks.length > 2 ? "dicks push" : " dick pushes") + " out one or two small ropes of cum that leave a tiny reminder of their presence in her hair.");
	}
	else if (cumQ < 500)
	{
		output("\n\nYour enviable ejaculation is all the rodenian could ever hope for. Wondrously thick ropes of [pc.cum] surge through your spunk-tube, forcibly prying apart her cock-milking cunt and drenching her innermost walls with what might possibly be a permanent reminder of your presence and virility. Her boobs swell slightly with the build-up of [pc.cumVisc] seed, so close to leaking out.");
		if (pc.hasCocks()) output(" Even the outside isn’t left unmarked, [pc.cumVisc] spunk rinsing her hair, leaving a musk signature not easily washed out.");
	}
	else
	{
		output("\n\nYour orgasm is feral, something that an impressionable individual dreams about receiving from the man or herm of their dreams. Monstrously thick and long jets of [pc.cum] <i>spray</i> from your [pc.cockHeadNoun " + cockId + "], rocking the little rat’s body with the sheer weight and strength of your spunk. After the third eruption, you see a few droplets fly out of her other ear, to say nothing of the backblast now pouring from the side you’re slotted in. Her tits even swell up a few [pc.cumNoun]-assisted cup sizes, spurting from her nipples like perverse lactation.");
		if (pc.hasCocks()) output(" Your extra " + (pc.cocks.length > 2 ? "dicks" : "dick") + " don’t forget to leave a mark on her head, painting her hair and ears with ample servings of your spunk.");
	}
	
	output("\n\nYou finally breathe again. You feel so <b>alert and alive</b>, there’re plenty of words to describe the fierce satisfaction that’s empowering you now. When you open your eyes, you’re in Zheng Shi, sat pretzel-legged with a coy rat thief snoozing against your loins. Her partners in crime rest half-naked, likely having masturbated during the ordeal.");
	output("\n\nThe thought of leaving them like this doesn’t cross your mind. You aren’t about to just get up and leave the rodent defenseless, not with cum still leaking out her ear. You’re not a hundred percent sure what’s really influencing your decision to stay just like this, but you can’t shake the feeling that you want to be with her more and more every time you glance down.");
	if (pc.isNaga()) output(" To that end, you wind her up in your [pc.leg] and keep the furry girl safe and secure.");

	pc.orgasm();

	addButton(0, "Next", ratsMindfuckDone, 3);
}

public function ratsMindfuckDone(scene:int):void
{
	clearMenu();
	clearOutput();
	showRats();
	processTime(5);
	
	var ratEarFlag:String = "RATS_SEXED_EAR_" + (rat0.ratVariety == 0 ? 0 : 1);
	
	output("A few minutes after your unique tryst, the rodenian yawns and stretches her arms and tail before sitting up. The feisty mouse whips and turns nervously before settling on your [pc.eyes]. " + (ratsPCIsGood() ? "She wastes no time grabbing you by the head and pulling you into a deep kiss on the lips. The ribbon around her tail twitches as fast as her nose against yours." : "She smiles, to your surprise, leaning up to kiss you on the cheek.") + " Before slinking back, she moves closer to your [pc.ear], breathing over the delicate [pc.skinFurScalesNoun].");
	if (ratsPCIsGood())
	{
		switch (scene)
		{
			case 0: output("\n\n<i>“I... I really wish... If you want to do that again... Never mind. I hope Mikky likes you, then maybe we don’t have to fight anymore...”</i>"); break;
			case 1: output("\n\n<i>“[pc.Master] CEO... Hehe, I like that. You make me feel so safe and secure. I don’t mind being your little um, rat slut.”</i>"); break;
			case 2: output("\n\n<i>“Ohhh you really know how to fuck, don’tcha [pc.mister] CEO... You lemme know whenever you’re feelin’ horny!”</i>"); break;
			case 3: output("\n\n<i>“[pc.Mister] CEO, thanks for the sex. I really enjoyed it. If you wanna do it again though, you gotta win! And umm, please don’t tell anyone we did that, ‘kay?”</i>"); break;
		}
		output("\n\nShe titters cutely, <i>“You’ve got such a good dick,”</i> playfully nibbling your [pc.ear] before disentangling.");
	}
	else
	{
		switch (scene)
		{
			case 0: output("\n\n<i>“Thank you so much,”</i> she nuzzles you again. <i>“If... If you ever wanna... Just so you know, we’re not friends. But you’re uh... heh... fun,”</i> she smirks."); break;
			case 1: output("\n\n<i>“That was the most fun I’ve ever had, but don’t think this rat... Err... Don’t- I won’t be calling you anything but " + ratsMisterCEO() + "!”</i>"); break;
			case 2: output("\n\n<i>“Mmmm, you just remember to um... show me your dick. If you win, of course!”</i>"); break;
			case 3: output("\n\n<i>“That was a lot of fun, " + ratsMisterCEO() + ", but don’t tell anyone we did that, ‘kay? If... If you want, you can do that again if you win!”</i> she whispers."); break;
		}
	}

	// threshold < 5
	if (flags[ratEarFlag] == undefined || flags[ratEarFlag] < 5) output("\n\nWhen she pulls back, she stares at you just a little longer. Her eyelids close almost seductively, unsure of whether to fully close or open. You smile almost nervously, wondering what she’s thinking, about to ask before she turns and walks away.");
	// threshold > 5
	else if (flags[ratEarFlag] < 10 || !ratsPCIsGood()) output("\n\nYou expected her to get going right away, but the mouse-girl simply stares at you, smiling and nuzzling. She sits with you a moment longer, tail wrapped around your waist and herself, quietly breathing. You’re unsure of what to think, but before you can say anything else, she kisses you again on the [pc.ear] and giggles, walking away.");
	// threshold > 10 goodCEO
	else if (flags[ratEarFlag] < 15 || flags["RATS_EARMARK_" + (rat0.ratVariety == 0 ? 0 : 1)] == undefined)
	{
		output("\n\nBefore she walks away, the rodenian looks at you square in the eyes, moistness gleaming against her [rat0.eyeColor] irises. <i>“W... Would you...”</i> she whispers, lips trembling. <i>“I really like you, you know? P-please, let’s do this again soon, okay...?”</i> She walks away before you can give an answer.");
		flags["RATS_EARMARK_" + (rat0.ratVariety == 0 ? 0 : 1)] = 1;
	}
	// threshold > 15 goodCEO
	else output("\n\nThere’s a pregnant pause when the rodenian stares at you. A fire in her [rat0.eyeColor] eyes leaves you in mystery until you see a small sigh pass through her lips -- a squeak. The ecstatic rat-girl tackles you to the ground in a hasty approach, thrusting her tongue past your [pc.lipsChaste] in a surprise kiss. You interlock your hands around her waist, returning her desirous affections for a spell. <i>“[pc.Mister] CEO... I... I wish you didn’t go...”</i> she pulls back, moist, puppyish eyes staring down as a string of saliva beaks. <i>“Please come back soon, okay? I don’t like when you’re not here...”</i>\n\nYou rub the side of her head, simply smiling in response. The mouse finally pulls away, casting several needy glances your way before shaking her head.");

	output("\n\n<i>“Alright dummies, let’s get going!”</i> the rodenian barks, waking her two friends and rousing them to action. After she puts her gear back on, she regards you one last time. <i>“See you later, " + ratsMisterCEO() + "!”</i> she shouts, pointing a tiny finger at you. <i>“Don’t forget, you’re gonna be paying up next time!”</i>");
	if (ratsPCIsGood()) output(" She nods, blowing a kiss before disappearing into the shadows. You wonder when you’ll see her again...");
	else output(" She grins and waves, bounding down the corridor into the shadows. You’ll be seeing her again, certainly...");
	
	IncrementFlag("RATS_SEXED_EAR");
	IncrementFlag(ratEarFlag);
	flags["RATS_LAST_EARSEX_" + (rat0.ratVariety == 0 ? 0 : 1)] = scene;
	
	switch (scene)
	{
		case 0: pc.addNice(2); break;
		case 1: pc.addMischievous(2); break;
		case 2: pc.libido(2+rand(4)); break;
	}
	
	ratsVictoryFinish();
}

public function ratsThievesDeserveSpanking(thiefRat:Creature):void
{
	clearMenu();
	clearOutput();
	showRats(-2, true);
	processTime(30);
	
	var remainingRat:RatsRaider = (thiefRat == rat1 ? rat2 : rat1);
	setTarget(remainingRat);

	if (pc.isBimbo() || pc.isBro())
	{
		output("They took your money, so it’s only fair that you get their cum as compensation! You’ll punish them and get what you need all at once!");
		output("\n\n<i>“Now, you two get to make up for what you did!<i>“ you declare, ”</i>Don’t even try to run, because you owe <i>me</i> a lot, too!”</i> You come to loom over them like a sexual statue, leering down and self-servicing as they shrink an inch into the ground.");
	}
	else if (pc.isNice())
	{
		output("<i>“You two are going to answer for this,”</i> you say, shaking your head, stoking the embers inside. <i>“Bad rats get punished. No exceptions, no excuses.”</i> You tower over them, arms folded, and glare harshly.");
		if (ratsPCIsGood()) output(" <i>“I like you, so I’ll go a bit easier...”</i>");
		output(" For what it’s worth, they do seem a lot more regretful, but you’ll never be certain if that’s because they’re about to face disciplinary action or they are genuinely remorseful about mugging you.");
	}
	else if (pc.isMisch())
	{
		output("<i>“Did you think I’d just leave you two be after that?”</i> you say, words as sharp as broken glass. <i>“No, think again. " + (ratsPCIsGood() ? "I can’t quite let you get away with this, you know, even if I kind of like you." : "I’m taking what I want from you, and you’re going to answer for this.") + "”</i> The two rats shiver and cover their heads, shying away as far as the ground will give from your towering presence, dripping with contempt and authority. Part of you wonders if their expressions are sincerely regretful, but you’re only interested in venting by this point.");
	}
	else
	{
		output("Your heavy footfalls are so packed with anger that even lifers in prison would shy away from you. Just looking down at the defeated duo is enough to blow wind against the inner conflagration. <i>“You two are going to pay for this, and if you try to run, it’s only going to get worse.”</i> They shudder in such terror that their hands are frozen by fear.");
		if (ratsPCIsGood()) output(" <i>“You knew the risks when you decided to keep this up, after all...”</i>");
	}

	output("\n\nYou wrench the [rat0.furColor]-furred rodenian’s helmet off unceremoniously, pitching it down the corridor like you’re performing for a grav-ball team. You do the same to the " + (thiefRat == rat2 ? "mouse-boy" : "half-rat [rat2.boyGirl]") + " next to her, your dissatisfaction more than merely apparent. Wide-ears flex and strain in that sudden removal, the rats below groaning the dull aches away. You’re just getting started.");
	output("\n\nYou " + (pc.isNice() ? "cautiously" : "impatiently") + " undo the buckles and fasteners on her armor, kicking away the pieces that clatter to the ground. Too " + (rat0.HP() <= 0 ? "weak" : "turned on") + " to resist, she can only lie back as you render her down to that pungent undersuit. You soon do the same to her insensate friend, making [target.himHer] squeak. Now semi-nude in their seam-straining undersuit, you twist them each around.");
	output("\n\nYou don’t have any rope. But tails that long are a good substitute.");
	
	switch (ratputation())
	{
		default:
		case RatsRaider.RAT_REP_NONE:
		case RatsRaider.RAT_REP_LOW: output("\n\n<i>“S-screw you!”</i> the rodenian girl barks as soon as you grip her tail. <i>“We wouldn’t have gotten into that if you’d have just been a bit more coope- Ouch! Dammit!”</i> she whines."); break;
		case RatsRaider.RAT_REP_MID: output("\n\n<i>“D-do you really have to do this? If you care that much we have mouths, you know! W-why are you- Ow! W-wha-”</i> she whimpers, your hands on her tail."); break;
		case RatsRaider.RAT_REP_HIGH: output("\n\n<i>“W-what are you doing? If you just want to fuck us then do that, this is unne- Ow...!”</i> she winces at your touch."); break;
		case RatsRaider.RAT_REP_GOOD_CEO: output("\n\n<i>“F-fine... You won, I guess this is just how you want to have your fun. But go ea- Ah!”</i> she squeaks, your hands wrangling her tail."); break;
	}

	output("\n\nWhen you tug on her ribboned extremity, you also yank her butt upwards just to steady the abrading line. Her tenting nipples puncture the front of her suit, the snapping of fabric against alien dermis prompting an arousing yelp.");
	output("\n\nYou grab both her small forearms together and weave the appendage around the matting fur. You finish by knotting the tip so that she can’t wiggle free, " + (pc.isAss() ? "making it so tight she can’t move without her eyes crossing" : "at least for the duration of this") + ". The " + (thiefRat == rat2 ? "quivering mouse-boy" : "trembling halfbreed [rat2.boyGirl]") + " is next, and it’s not long before both of them are struggling against themselves, squinting in the ache it brings to their overstretched appendages.");
	output("\n\n<i>“Are you satisfied?”</i> she grouses, already feeling the strain of self-bondage. A near silent flurry of curses directed inwardly and outwardly is visible on her lips.");
	output("\n\nYou remind them that this is only the first step of their punishment. Before they protest further, you shuffle behind her.");
	if (pc.isTaur()) output(" You sit behind her and splay her out over your two front legs, keeping her ass higher than her head.");
	else if (pc.isNaga()) output(" Your [pc.leg] winds around her, slowly contorting her into a face-down ass-up position, backside fully exposed and mouth close to the ground.");
	else output(" You take a knee and hoik the scoundrel over it, adjusting her head low and her ass high. Her abdomen crunches against your [pc.thigh].");
	output(" It brings you some small pleasure seeing - and feeling - her writhe with pervasive warmth. Vain grumblings morph into low moans, something she frantically tries to speak over.");
	output("\n\n<i>“A-are you kidding me..?”</i> she stammers.");
	output("\n\n<i>“Nope!”</i> you grin, your right [pc.arm] already diving from on high.");
	output("\n\n<b>THWACK</b> - your heavy hand bounces like a mace off the [rat0.furColor] rat’s left buttcheek. Her lungs deflate in a shrill, rattling scream while her body vibrates. The mouse pirate’s partner watches dolorously, jumping in shock when that snapping echo reverberates again. Your hand cracks against her ass, violent jiggles and turgid ripples spreading in perfect circles along an equally perfect rump.");
	output("\n\nThe rodenian’s diaphragm goes sore from the following squeak-provoking strikes, your wrist already stinging from the strength of sadomasochistic revengeance.");
	output("\n\n" + (pc.isBimbo() || pc.isBro() ? "<i>“I hate doing this ‘ya know, but maybe you’ll learn your lesson.”</i>" : "<i>“I wonder how many people I’m doing a favor for...”</i>") + " you murmur, chortling when her big ears wobble from the next hit. She doesn’t answer, so you hit the other side, and then the last, fingers bouncing and pinging off her apple-shaped butt. Then she does something you don’t expect: she wiggles her tush and pushes it back to your [pc.hand], squirming towards your digits.");
	output("\n\nSomething tells you she finds this incredibly hot. You’re not sure if she likes being dominated, to be at the casual mercy of another. Maybe it’s the fuck-scented air");
	if (pc.isHerm()) output(", the rich musk and blissful pheromones emanating from your hermhood");
	else if (pc.hasVagina()) output(", the lurid squelching of your [pc.pussy]");
	else if (pc.hasCock()) output(", the potent musk of your [pc.cocksLight]");
	output(" having an effect on her. Maybe she just likes you. Or maybe <i>it’s because she’s just a slut who likes to be held down and spanked?</i>");
	output("\n\nImmobilized and horny, she seems content feeling your [pc.skinFurScales] rubbing against her. Her limbs buck when you pummel her again, again, and again, shameless moans of pleasure escaping her lips.");
	output("\n\nThere is very little suggestion of pain in her voice, and no indication she’s uncomfortable. You smack each cheek of [rat0.furColor] fur equally, sometimes kneading her assflesh, sometimes teasing the ring of her asshole. You grunt");
	if (pc.hasCock()) output(", feeling your [pc.cocks] harden");
	output(", at the bounce of her crotch against your own. You go a step further and sink your nails into her outfit, splitting the undersuit apart seam-by-stretching-seam to reveal the reddening ass underneath, delighting at the salty damp smell of horny rat.");
	output("\n\nA potent smell smell reaches your nose. You squeeze her ass and pause, turning to see thick cords of translucent liquid dripping from her quirking ears. You wipe a finger along the wobbly brim and " + (pc.isBimbo() || pc.isBro() ? "eagerly" : "gingerly") + " taste it, the flavor of tangy alien girlspooge readily apparent. You give her shuddering tush an appreciative squeeze, rubbing your knuckles into skin.");
	output("\n\nShe’s about to cum from this. Her bulging nipples have left momentary " + (pc.hasScales() ? "outlines on" : "indents in") + " your [pc.skinFurScales], and whether or not she likes being treated like a bitch her body is imploring you to own it. The sound of fluid tapers down to a slow drip of mouse-slime accompanied by a needful arch of the back and a long moan.");

	// PC genitals
	if (pc.hasGenitals())
	{
		output("\n\nYou can’t deny how horny this is making you, all the " + (pc.isBimbo() || pc.isBro() || !pc.isAss() ? "annoyance" : "anger") + " from before fast being replaced with the red hot rush of " + (pc.isBimbo() || pc.isBro() || !pc.isAss() ? "mischievous" : "domineering") + " arousal. You push her away just a bit to make room");
		if (pc.isCrotchGarbed()) output(", then move your [pc.crotchCovers] out of the way");
		output(".");
		if (pc.isHerm()) output(" Your [pc.cocks] and [pc.pussies] pump pre and aerosolized sluttery into the air, eager for attention.");
		else if (pc.hasVagina()) output(" Your [pc.pussies] " + (pc.hasVaginas() ? "billow" : "billows") + " with heat and pheromones, [pc.clits] engorging and dying for some action.");
		else if (pc.hasCock()) output(" Your [pc.cocks] " + (pc.hasCocks() ? "throb" : "throbs") + " powerfully, fat wads of musky pre pitter-pattering against thigh and leg.");
		output(" You could almost cum just from this, without any direct stimulation...");
	}

	output("\n\nYou grab the " + (thiefRat == rat2 ? "rogue boy" : "fuzzy-limbed [rat2.boyGirl]") + " and bend [target.himHer] into that submissive, unstable position. [target.HeShe] tries to play along, perhaps in an effort to make this hurt a lot less than it’s going to, but really it just looks shameful. The untouched outlaw is unable to resist while you tear off that pesky suit and punish [target.himHer] in much the same way: aching hand zeros in on bare thief’s flesh, thumping against reddening buttock. The splayed robber-rat wobbles under [target.hisHer] own weight, dangerously close to falling at a moment’s notice.");
	output("\n\nThe shame [target.heShe] feels is washed away by the pleasure, " + remainingRat.mf("urethra appreciatively flexing out another gumball of pre", "pussy straining as another sheen of girljizz moistens its exterior") + ". A single finger’s touch to exposed genitalia is all it takes for another mini-orgasm to rock the tensing rat. A further series of spanks and strokes has [target.himHer] hungrily clenching and creaming one ecstatic splurge to the next. It’s unclear what’s more sensitive at this point: [target.hisHer] ass, or the " + remainingRat.mf("bobbing, sensitive tool between his legs.", "puffy bitch-hole that falls in love with anything that happens to it."));
	output("\n\n<i>“P-please, no more... I can’t...”</i> the " + (thiefRat == rat2 ? "rat-boy" : "halfbreed [rat2.boyGirl]") + " cries, " + remainingRat.mf("his cock and balls throbbing so hard that it bobs back and forth", "her pussy parting and secreting rivers of fragrant lubrication") + ". <i>“I-I’m sorry, we’re sor- Aack!”</i> Your hand crashes once more on [target.hisHer] plush rump, then again, building up another disciplinary rhythm of consistent wind-ups and bone-shaking impacts.");
	output("\n\nYou won’t stop until they’ve learned their lesson.");
	output("\n\nTears have formed at the edges of their eyes. Their tongues hang over their lips with every yelp. Saliva drips like raining pre. The local area is layered in coats of pheromones so thick that you can only describe it as a zone of " + remainingRat.mf("rut and heat", "heat"));
	if (pc.hasPheromones()) output(", one you’re also adding copiously to");
	output(".");
	output("\n\nYou wouldn’t have blamed them if they were shuddering in pain, but they can definitely be blamed for groaning like wanton whores. You press down harder on your rat’s crotch, a twinkle in your eye when [target.heShe* writhes into your body. Tremulous");
	if (remainingRat.isMale() || pc.hasCock())
	{
		output(" manhoods");
		if (remainingRat.isFemale() || pc.hasVagina()) output(" and");
	}
	if (remainingRat.isFemale() || pc.hasVagina()) output(" femininities");
	output(" stretch and strain, desperate to release their pent up loads regardless of how this situation unfolded.");
	
	output("\n\nDominant thrill blossoms through your brain, soothing the soreness in your wrist and the needling in your beet-red palm. Every impact forces out a hot dribbly mess of aural pussyjuice and " + remainingRat.mf("cock slime", "regular pussyjuice") + ", the respective owners on the edge of collapse. High-pitched whines form in the backs of their throats, guilty eagerness spilling out in greater quantities the more they learn to let go of their pride.");
	if (pc.isHerm()) output("\n\nYour [pc.cocks] and [pc.pussies] are no different, each ready to mark these rats in a liquid reminder of you. ");
	else if (pc.hasVagina()) output("\n\nYour [pc.pussies] flush with sadistic arousal, inner walls grinding close enough to touch one another. You’re closing in on orgasm bit by bit. ");
	else if (pc.hasCock()) output("\n\nYour [pc.cocks] wobble incessantly, ready to churn out the [pc.cumVisc] contents of your loins. ");
	else output("\n\n");
	output("Their heinies are so red and sore, so sensitive to touch now, that you doubt they’ll be able to sit again for quite some time. That would almost make you regret this, if not for their blatant enjoyment of it.");
	output("\n\nThe ear slapping into your bicep jolts you from your rhythmic reverie, the blissed out rodenian mumbling words broken by the slap of your hand. She wriggles her cheek into your arm, rivulets of sticky pre spilling from her downturned ear. The rat’s close to release, evidenced by the dripping and the drooling. Flecks of hapless passion mat her fur on their way to her jawline and the floor.");
	output("\n\nThe next strike on her ass gives the spasmic slut just what she wants.");
	output("\n\nYou steady the pirate with one arm, daring to tease her ear-cunt as the frictionless walls inside clench and churn, ample fluid leaking from those cock-sockets. Your touches line up perfectly with the most incandescent zones of ecstasy, helping her budding, roiling orgasm surface. It’s not just her, the " + (thiefRat == rat2 ? "femmy rogue" : "half-rat [rat2.boyGirl]") + " cums just the same, " + remainingRat.mf("his turgid eight-inch prick ballooning into climax and plastering the ground below with hard, near limitless spurts of goopy white cum.", "her fat clit twitching at the hood of her sloven delta, a spear of girl cum jetting out of her supremely wet pussy, and another, and another -- she shakes so violently that you can’t stop her from falling to the side."));
	
	var cumQ:Number = pc.cumQ();
	if (pc.isHerm()) output("\n\nAnd that pushes you over the edge, too. The buzz of your hermhood’s climactic descent overwhelms your thought process. You jerk your [pc.cockBiggest], " + (cumQ < 500 ? "thin" : "thick") + " ropes of [pc.cumVisc] [pc.cumNoun] " + (cumQ < 500 ? "spurting" : "streaming") + " from your rent cumslit, launching towards the two splayed mouse-butts. When [pc.cumColor]-hot spunk lands on their sore rumps, they whimper. You yourself moan like a whore as your [pc.pussies] " + (pc.isSquirter() ? "squirts out darts of [pc.girlCum]" : (pc.hasVaginas() ? "pour" : "pours") + " rivers of [pc.girlCum]") + " against your [pc.legOrLegs]" + (pc.balls > 0 ? " and [pc.balls]." : "."));
	else if (pc.hasVagina())
	{
		output("\n\nAnd that pushes you over the edge, too. Your eyes cross and you nearly slump back when your feminine desires reach their apex.");
		if (pc.isSquirter()) output(" Powerful darts");
		else if (pc.wettestVaginalWetness() > 3) output(" Raging rivers");
		else output(" Moist streams");
		output(" of [pc.girlCum] " + (pc.isSquirter() ? "squirt" : "flow") + " from your [pc.pussies] in rapid succession, that purple-hued throb in your nethers an indisputable presence in your mind. Clenching your [pc.thighs] forces load after load out, bringing you down slowly from your libidinous high.");
	}
	else
	{
		output("\n\nAnd that pushes you over the edge, too.");
		if (pc.hasCock())
		{
			output(" Your [pc.cocks] slap against the rodenian’s ass and thigh, your " + (pc.hasCocks() ? "urethras" : "urethra") + " swelling with");
			if (cumQ < 100) output(" thin");
			else if (cumQ < 500) output(" thick");
			else output(" monstrous");
			output(" loads of [pc.cumVisc] [pc.cumNoun], " + (cumQ < 500 ? "painting" : "splattering") + " the bandits with your seed-filled spooge. They are shocked to life by the rain of cum on their too-sore asses, bouncing up in place with cold, shivering groans.");
		}
		else output(" Your whole body rattles in excessive arousal, and the balancing of pressure in your body tells you that you’ve achieved something resembling orgasm.");
	}

	output("\n\nAfter catching your breath, you let the rats fall to their sides, panting madly as cum drips from their curves. It doesn’t take long for you to figure out what to do next.");
	if (ratsPCIsGood())
	{
		output("\n\nSatisfied with your fun, you untie the bandits from their own tails and take your reward all the same, patting them on their heads with some amount of condescension. The rodenian girl is the first to shake her stupor, staring at you with moist eyes and pursed [rat0.lipColor] lips. <i>“Y-you done, [pc.mister] CEO? H-h-heh... You could have hit harder,”</i> she prods.");
		if (pc.isBimbo() || pc.isBro()) output("\n\n<i>“You’ll be spreadin’ for me sooner or later, why beat you up?”</i> you grin.");
		else if (pc.isNice()) output("\n\n<i>“Can’t stay mad forever. I’ll earn all of that back in due time,”</i> you smile.");
		else if (pc.isMisch()) output("\n\n<i>“Eh, you do that again and I might. But you try that again, I’ll be taking more, count on it,”</i> you wink.");
		else output("\n\n<i>“Don’t test me, now get out of here,”</i> you grunt.");
		output("\n\nThe two rats stand and start collecting their things, eager to get away before anyone finds them so vulnerable. You don’t stick around for it.");
	}
	else
	{
		output("\n\nYou got what you wanted out of this, and you had a little fun too, so all that’s left is to have them stew in it. You collect your reward and drag them by their shoulders over to the nearest wall, well away from their armor and weapons, and lean them upright. Hisses and silent screams surge when they’re forced to sit on their abused cheeks. The rodenian pirate shakes off her stupor and stares at you with wide eyes. <i>“H-hey, wait a second, what are you doing!?”</i>");
		output("\n\n<i>“I told you already,”</i> you shrug.");
		output("\n\n<i>“N-no you can’t do this, you can’t leave us here, " + ratsMisterCEO() + "! If we’re caught like this then-”</i>");
		output("\n\nYou give her a " + (pc.isAss() ? "dismissive" : "simple") + " wave.");
		if (pc.isBimbo() || pc.isBro()) output(" You got what you needed, anyways! Maybe someone else can have some fun with ‘em?");
		else if (pc.isNice()) output(" You stopped listening when the insults began again.");
		else if (pc.isMisch()) output(" They should have thought about that before they accosted you.");
		else output(" You are beyond caring.");
		output("\n\nThe struggles fade quickly into the background static. They dare not scream for help, which is probably smart. You never know who’s listening around here.");
	}

	IncrementFlag("RATS_SPANKED");
	
	pc.orgasm();
	pc.addHard(2);
	ratputation(-8);
	
	ratsVictoryFinish();
}