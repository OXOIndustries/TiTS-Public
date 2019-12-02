// Notes for possible elaboration:
//Feed Bubble: Huge - mating press. knot her pussy with the bubble-tap and smother her under the condom
//Get a ponytail jack off and just straight up bukkake on her

public function cherrysAptBonus():Boolean
{
	showCherry(true);
	output("The intimate room belonging to the rahn pirate is surprisingly crowded. She has a technical console set up in one corner illuminated by a holoscreen loaded with surveillance and maintenance details for the Tap-Hall. A large, lumpy bed occupies another corner, a rubber sheet loosely draped across it and " + (flags["CHERRY_HUGE_BUBS"] == undefined ? "two":"three") + " beach ball sized latex pillows at the head. The third corner has a docking station for her cybernetic legs, a bevy of spidery metal devices arranged in a wall-mounted toolbox to repair and modify the limbs as needed.\n\nThe final corner of the room is devoted entirely to a floor-to-ceiling display shelf filled entirely with Bubble Buddy toys. The rubbery cock sheath never struck you as being a collector’s item, but Cherry has over three dozen of them arranged with obvious pride.");
	//first time
	if(flags["CHERRYS_ROOM_SEEN"] == undefined)
	{
		output("\n\nThe red rahn seems a little embarrassed to have you here, but ");
		//if pc gave her a Large or Huge bubble:
		if(flags["CHERRY_HUGE_BUBS"] != undefined || flags["CHERRY_LARGE_BUBS"] != undefined) output("considering how she’s clutching your gift, ");
		output("apparently her appetites trump her privacy. She steps to the docking station and gingerly lifts herself out of the cybernetic legs, swinging forward and hopping onto her bed. The impact sends a ripple through the surface of the waterbed. For some reason, you doubt that’s actually water the condom-obsessed girl sleeps on.");
		output("\n\n<i>“All this generosity is enough to make a girl suspicious,”</i> she teases. <i>“How about we do something nice to you for a change?”</i>");
		flags["CHERRYS_ROOM_SEEN"] = 1;
	}
	//repeat normal
	else if(!cherryCumflated())
	{
		output("\n\nCherry’s robotics are locked in their docking corner and the legless goo is perched on her bed, eager to see what what you’ve got in mind.");
	}
	//repeat cumflated
	else
	{
		output("\n\nSwollen with cum and unable to maintain her toxin’s potency, Cherry lounges atop her bed, keen for a fresh fill-up.");
	}
	//player options
	cherryRoomMenu();
	return true;
}

public function cherryRoomMenu():void
{
	clearMenu();
	
	//Doesnt work for small bubs or the first large bub.
	if(flags["CHERRY_LAST_BUBBLE_GIFT"] != undefined && flags["CHERRY_LAST_BUBBLE_GIFT"] != 0 && (flags["CHERRY_LAST_BUBBLE_GIFT"] != 3 || (flags["CHERRY_HUGE_BUBS"] != undefined && flags["CHERRY_HUGE_BUBS"] > 1))) addButton(1,"Feed Bubble",feedCherryABubble,undefined,"Feed Bubble","The gel girl’s usually got room for a bubble or two, and what better bubble than your most recent gift?");
	else addDisabledButton(1,"Feed Bubble","Feed Bubble","You need to have given her a fresh bubble for this..." + (flags["CHERRY_HUGE_BUBS"] == 1 ? " And that huge bubble you gifted her is apparently sentimental...":""));

	
	if(pc.lust() >= 33)
	{
		// {Fuck her/Fuck Her?/Fuck Her!} [Feed Bubble] [Blow Bubble] [Leave]
		if(!pc.hasCock()) addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis for this.");
		else if(flags["CHERRY_SEX_INTRO"] == undefined) addButton(0,"Fuck Her",fuckCherryYo,undefined,"Fuck Her","Try your luck, and maybe get all up in that gel...");
		else if(!cherryCumflated()) addButton(0,"Fuck Her?",fuckCherryAnywayYo,undefined,"Fuck Her?","Damn the consequences, you’re hungry for a big slice of Cherry pie.");
		else addButton(0,"Fuck Her!",fuckCherryExclamationPointo,undefined,"Fuck Her!","With Cherry nice and bloated, she’ll be safe to the touch for a while.");

		//[Blow Bubble]
		if(!pc.isTaur()) addButton(2,"Blow Bubble",cherryBlowBubbleScene,undefined,"Blow Bubble","Use a Bubble Buddy and feed Cherry right from the tap.")
		else addDisabledButton(2,"Blow Bubble","Blow Bubble","Your body shape is incompatible with this scene.");
	}
	else 
	{
		addDisabledButton(0,"Fuck Her","Fuck Her","You aren’t turned on enough for this.");
		addDisabledButton(2,"Blow Bubble","Blow Bubble","You aren’t turned on enough for this.");
	}

	addButton(14,"Leave",leaveCherrysPlace);
}

//[Fuck Her/ Fuck Her?/ Fuck Her!]
//[Fuck Her]
//[Fuck Her] only appears for first time, then switch option to [Fuck Her?] if Cherry is normal or [Fuck Her!] if she is cumflated
//mouseover: Get all up in that gel.
public function fuckCherryYo():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	//cherry is normal
	if(!cherryCumflated())
	{
		output("You move closer to the gel girl, ");
		if(pc.isNice()) output("suggesting that maybe the two of you could get a little more intimate.");
		else if(pc.isMischievous()) output("wondering aloud just how much jiggle she’s got going for her.");
		else output("murmuring about what a lovely red cock sheath she’d make.");
		output(" Cherry holds a gloved hand up to stop you from closing the distance and tilts her head in exasperation. <i>“Didn’t I mention the whole ‘paralytic toxin’ thing? Maybe that was to somebody else. You hard-bodied aliens all look the same to me,”</i> she teases.");
		output("\n\nThe rahn girl grabs hold of her ponytail and holds it out like a weapon. <i>“A little touch might just leave you feeling weak, but any kind of real contact is gona get you stiffer than steel plating.”</i>");
		output("\n\n<i>“It’s not lethal, is it?”</i> you ask, just to be sure.");
		output("\n\n<i>“You’re adorable. No, nothing like that. Just locks down the voluntary muscles. All your auto-pilot junk keeps on trucking, like breathing or your heart beat.”</i> She shoots you an amused look, dropping her gaze to groin-level. <i>“Among other things.”</i>");
		output("\n\nShe folds her arms under her breasts and glances off into the distance. <i>“But I try not to do that anymore. Not that I didn’t enjoy myself plenty back before the Cyber Punks.”</i> She bites down on her lower lip and fails to suppress a crooked smile. <i>“Just finding a tasty treat with huge, luscious balls... wrapping my tongue around theirs until they’re little more than a warm fuck doll... riding em till they’re dry...”</i> A trickle of toxin-laden sweat drips down her brow.");
		output("\n\n<i>“Isn’t there anything you could do to suppress it?”</i>");
		output("\n\n<i>“In a short time frame? Not really. Well...”</i> she trails off, thumbing a pointed, elfen ear absently. <i>“I guess it depends. How much spunk you got on you?”</i>");
		
		var cumQ:Number = pc.cumQ();
		//if PC has balls and cum production over 10,000mL
		if(pc.balls > 0 && cumQ >= 10000)
		{
			output("\n\nYou gently pat your [pc.groin], a confident smile spreading across your face. <i>“Oh, plenty.”</i>");
		}
		//if PC doesn’t have balls and cum production over 10,000mL
		else if(cumQ >= 10000)
		{
			output("\n\nYou put your hands on your [pc.hips] and flash a grin. <i>“More than you’d expect.”</i>");
		}
		//if PC has under 10,000mL cum production
		else
		{
			output("\n\n<i>“Why? What does that matter?”</i>");
		}
		//merge
		output("\n\n<i>“Well, if I could dilute the anesthetic to a safe level... I won’t bore you with the chemistry, but basically with enough cum in me, I’m mostly harmless. But we’re talking a LOT of cum. Pretty much everything I’ve got on my belt and then some. Gallons of the stuff.”</i>");
		output("\n\nLeave it to a rahn to expect a full meal before the main course even arrives!");
		processTime(7);
		
	}
	//cherry is cumflated
	else
	{
		output("You get nice and close to the well-fed rahn, ");
		if(pc.isNice()) output("suggesting that maybe the two of you could get a little more intimate.");
		else if(pc.isMischievous()) output("wondering aloud just how much jiggle she’s got going for her.");
		else output("murmuring about what a lovely red cock sheath she’d make.");
		output(" She still seems a bit dazed by the volume of her meal, but a wicked smile crosses her face at the suggestion of a second helping.");
		output("\n\n<i>“Big talk for somebody in tit-smothering range. How bout a test?”</i> she shoots back, taking your hand in hers and pulling your palm to the glistening surface of her smooth breasts. Your fingers close on her warm, gelatinous skin, to the immense, sighing delight of the ruby woman. A tingle travels up your forearm and lingers at the back of your elbow before radiating outward. Your jaw clenches and a warm weakness flickers across you like a candle flame.");
		output("\n\n<i>“Still moving?”</i> Cherry asks, pulling your free hand to her un-groped tit, giving you a double dose. Your muscles feel like drying cement, but you push through, forcing each finger to squeeze harder, her pliant pillows bulging between your fingers. The more you flex, the less effect her toxin seems to have. Before long, you’re fondling her hefty mounds vigorously enough to send quivering waves all the way down her ponytail.");
		output("\n\n<i>“I’d call that a successful test,”</i> she pants with a warm laugh, practically putty in your hands. <i>“Feed the amorph, win a prize,”</i> she teases, running her palm across the puffy swell of her blushing pussy.");
		output("\n\nIt seems as long as she’s got a few gallons of cum in her, the zel’rahn is safe to the touch. An important lesson to remember for the future!");
		processTime(5);
		pc.lust(20);
	}
	flags["CHERRY_SEX_INTRO"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	return;
}

//[Fuck Her?]
//Cherry isn’t cumflated
//mouseover: Damn the consequences, you’re hungry for a big slice of Cherry pie.
public function fuckCherryAnywayYo():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	IncrementFlag("CHERRY_VENOM_TANKED");
	//first time
	if(flags["CHERRY_VENOM_TANKED"] == 1)
	{
		output("<i>“I’ve dealt with my fair share of alien biology,”</i> you assure the gel girl confidently. You wouldn’t have gotten very far if you were worried about a few hazardous chemicals here and there. Stripping your [pc.gear] aside, you move to Cherry’s bedside and reach out to pull the half-sized girl closer. She shrugs and leans into your embrace with a small, pursed smile.");
		output("\n\nAs your [pc.skinFurScales] touch" + ((!pc.hasScales() && !pc.hasFeathers()) ? "es":"") + " the zel’rahn’s warm, slick curves, you feel an odd coolness traveling up your fingertips. Mere inches from your frame, the voluptuous woman’s jelly body practically smoulders with the heat of her arousal, but nothing seems to warm your palms. A faint tingle tickles its way up your arms and lingers at your elbows before radiating into your core. You try to rise to your [pc.feetOrFoot], but find a sense of heaviness weighing on your [pc.chest]. You sit right back down, trying to speak but finding your [pc.tongue] sluggish and unable to form intelligible words.");
		output("\n\nYour hands still cling to Cherry’s gelatin curves, unable to pull away by any strength you can muster. <i>“Looks like I caught a big one. Lucky me,”</i> the ruby girl remarks, pulling off a glove. She puts her palm against your forehead and gently pushes you back. It feels almost as if a windless breeze sweeps through your flesh and takes your muscles with it. Though your mind remains alert and your nerves tense at every sensation, your body is utterly paralyzed and completely at the mercy of the legless pirate.");
		output("\n\n<i>“I did warn you,”</i> she notes, putting her glove back on and bouncing to your side. " + (pc.isTaur() ? "With the strength of someone who regularly has to deal with bulky alien bodies, she hauls your tauric frame over until you’re leaning against the side of her waterbed. She gently lays your upper torso on the rubber sheets, the fluid mattress wobbling under you like a lazy wave at a beach.":"With surprising strength, she hauls your [pc.legOrLegs] up and lays you out lengthwise on her bed. The rubber covering of her bed wobbles under you like a lazy wave at a beach, liquid warmth rising to caress your back."));
		output("\n\n<i>“So, here we are.”</i> Cherry lays down on her side next to you, propping her head up on her palm. <i>“Ya know, if we’d met a few years ago, you might not have been quite as safe as you are now.”</i> She turns her gaze upward, remembering bygone days. The rahn shivers at an memory, tracing her fingers idly up your [pc.hips] and across your [pc.chest]. A shock of rising panic at your helplessness begins growing in your breast, but the semi-solid girl’s narcotic nearness and the bed’s rippling undulation helps soothes away the impotent anxiety.");
		output("\n\n<i>“Not to worry,”</i> she adds in a tranquilizing tone, <i>“that ain’t me. Not anymore. I’m a legitimate businesswoman. The days of raping and pillaging my way through the stars are in the past.”</i> She wiggles closer, cuddling up against you in a warm snuggle.");
		output("\n\nAnesthetic paralysis keeps you from moving or speaking, but Cherry seems to be enjoying your company all the same. The moist, curvesome frame squishing up against you feels almost like a solid woman, if not for the regular sensation of her sweat-like toxin beading on her surface and dripping onto your [pc.skinFurScales]. It’s almost like the two of you are sharing a low-heat sauna. Her reassuring contact is enough to lull you off into a dreamy, pink-hued oblivion.");
		output("\n\nWhen you wake, Cherry has already mounted her cybernetic legs and outfitted herself to return to the Tap-Hall. <i>“Ah, awake at last? You were out for a whole day.”</i> It still feels as if your body is being restrained, but burgeoning strength tells you the toxin is almost out of your system. Moving takes a conscious effort, but the paralysis begins to crack and shatter, like a thin layer of ice. One limb at a time, you manage to get your body moving again.");
		output("\n\n<i>“Hit ya harder than you thought it would, huh? I guess it was your first time and all,”</i> she muses, tapping her chin. <i>“I guess you could say I popped your Cherry-cherry?”</i>");
		output("\n\nYou groan. The last thing you need after being paralyzed and unconscious for twenty-four hours is to wake up to a pun.");
		output("\n\n<i>“Don’t worry, I didn’t get up to any mischief while you were out,”</i> the red rahn teases. <i>“I can’t make any promises about next time, though,”</i> she adds, licking her lips. <i>“The temptation was terrible.”</i>");
		output("\n\nYou grab your [pc.gear] and step just a bit more carefully around Cherry as the two of you leave her quarters.");
		processTime(24*60+rand(25));
		restHeal();
		clearMenu();
		addButton(0,"Next",leaveCherrysPlace);//actually direct exit to tap hall.
		//return to Tap-Hall, advance 24 hours, restore energy appropriate to a 24 hour rest
	}
	//repeat
	else
	{
		var x:int = pc.biggestCockIndex();
		output("<i>“I can’t say I’ve found anyone quite as thrilled by the taste of toxin as you are,”</i> Cherry marvels as you strip off your [pc.gear] and go in for another round of zel’rahn anesthetic. ");
		if(pc.isNice()) output("You reach out to take her slender shoulders in both hands and bend forward to place a kiss on her forehead. The sensation of cold water spreads across your lips and palms but her body heat grows ever hotter in your embrace.");
		else if(pc.isMischievous()) output("Diving forward, you bury your face between the gelatin mounds of her heavy breasts, mammoth E-cups squishing against your cheeks. Your arms already feel heavy, but you wrap them around her slender waist all the same, pulling her as close as her ample cleavage will allow.");
		else output("Sliding one hand behind her slender waist and yanking her ponytail down with the other, you pull the girl toward you until her black cherry lips are level with yours. Tingling spreads through your fingers, but you ignore it and envelop the rahn in a passionate kiss that very nearly lifts her off the bed.");
		output(" She breathes a torrid sigh and wiggles closer to you.");
		output("\n\n<i>“I’d be lying if I said I didn’t enjoy the feeling of the chemicals between us,”</i> she murmurs, a gloved hand grabbing squeaking fistfulls of rubber bedding as she leans into your embrace.");
		output("\n\nDespite your prior experiences, you still haven’t been able to acclimate to the pirate’s paralytic touch. Weakness spreads like wildfire, burning away strength and leaving your mind alert but no longer in command. You manage to " + (pc.isTaur() ? "sit next to the bed and roll onto your side":"sit on the bed") + " just before you’re completely overtaken. <i>“And down [pc.heShe] goes,”</i> Cherry remarks as you freeze in place.");
		output("\n\n<i>“Girl, you’re bigger than this,”</i> the ruby girl scolds herself, reclining next to you and taking stock of your helpless body. She licks her ebony lips " + (pc.isTaur() ? "as she pulls one of your hands up to cup the puffy lips of her dripping sex.":"as she pulls one of your arms around to drape over her narrow waist.") + " <i>“I’m a reformed girl, you know.”</i> Though you’re powerless to act on it, you can feel the heat of her needful curves squashed against your [pc.skinFurScales].");
		output("\n\nThe narcotic nearness of the oil-slick rahn works its way into your helpless libido. Like a feast presented to a starving " + (pc.mf("","wo") == "wo" ? "wo":"") + "man, the girl’s glistening figure rouses an inner passion that begs indulgence from your deafened muscles. Even through the chemical straightjacket, your lower body floods with the hot rush of organic desire, [pc.cocks] stiffening instinctively.");
		output("\n\nCherry’s ponytail seems to notice your erection before her eyes do, looping around to coil about your root. <i>“Oh, what’s this?”</i> she notes with mock reproach as her semi-solid gel squeezes at your [pc.cock " + x + "]. <i>“I’d never take advantage of a poor, paralyzed captive,”</i> she protests, her tentacle-like hair fondling your thickness.");
		output("\n\nLubricated by the sheen of her drugged moisture, the zel’rahn’s extra appendage caresses your [pc.groin] with slippery, slurping strokes. Though she wears a guise of pouting distress, you can clearly see her eyes grow wide with a glutton’s greed as your " + (pc.isErect() ? "too-firm flesh bobbles from her touch.":"firming flesh rises to full mast.") + " The gel taps her inky lips anxiously, weighing the situation. <i>“On the one hand, I’ve given up that life. On the other...”</i> " + (pc.isTaur() ? "She tightens her thighs around your fingers, squeezing her pussy against you hard enough to leave your hand drenched.":"She pulls your powerless arm down, to squish your fingers against her puffy pussy, drenching them in her excitement."));
		output("\n\nThe amorph bends down to holds out her arm against your length, measuring the size of her catch.");
		//PC biggest < 7
		if(pc.cocks[x].cLength() < 7) output(" She places her palm against her abdomen and raises an eyebrow in consideration.");
		else if(pc.cocks[x].cLength() < 13) output(" She places her forearm against her abdomen and raises both eyebrows in delight.");
		else output(" She places one hand at her inner thighs and stretches the other up past her abdomen, over her chest, and up to her throat. She looks a bit intimidated, but her ponytail begins wagging like a bitch in heat.");
		output(" <i>“Fuck it. Once a pirate, always a pirate.”</i>");
		processTime(15);
		pc.lust(50);
		clearMenu();
		addButton(0,"Next",druggedSteeleGetSlurped2,x);
	}
}

public function druggedSteeleGetSlurped2(x:int):void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");

	output("Using both hands and her ponytail, the legless girl " + (pc.isTaur() ? "rolls you on your back and lowers herself onto your undercarriage,":"climbs onto your midsection,") + " steading herself like a tripod atop your recumbent form. Slick wetness drips like sweat off of her body and onto your [pc.skinFurScales] in a warm, pinkish oil that leaves you nearly as glistening as the woman mounting you. The plump upper thighs of Cherry’s missing trunks straddle your " + (pc.isTaur() ? "lower body":"[pc.hips]") + " as best they can while her gloved hands circle just under your [pc.chest]. Despite her her prodigious E-cups swaying above you, the half-girl feels surprisingly light.");
	output("\n\nTender, supple pussy lips press at your erection’s base as she slides back and forth on your body. <i>“Mmm, not bad,”</i> she purrs, dragging the thickness of her puffy peach along your hardness. Her limb-like hair gives one her bubble butt cheeks a smart slap that leaves " + (pc.isTaur() ? "the girl gently wobbling all the way up to her collar.":"the two of you gently bouncing on the waterbed.") + " Using the rippling momentum, she slides forward, across your abdomen and up to your [pc.chest], the firm pearl of her crimson clit tracing a fervid path up your torso. Every swell of the " + (pc.isTaur() ? "girl’s":"bed’s") + " undulating waves sends the wine-red gel sliding pussy-first across your " + (pc.isTaur() ? "barrel-like trunk,":"midsection,") + " her pliant, gushing slit oozing warm passion all over you.");
	output("\n\nAs she blissfully grinds against you, the girl’s ponytail circles around your [pc.cock " + x + "]. Cherry’s coiling tendril encircles inch upon inch of your throbbing mast, dragging her head backwards. Her face flushes with a deep, rubicund rose as her hips ride your lust-slick body. <i>“F- f- fuuuuuck,”</i> she moans, tightening her grip on your sides. A shudder of heat blooms against you as a rapid pulse of vibrating pleasure surges through the girl’s gelatin body. Her ponytail loses its grip for a moment before squeezing down even tighter, holding onto your manhood as if it were a life raft.");
	output("\n\nThe zel’rahn lunges forward, her glossy raven lips locking onto your with a hungry passion that leaves your head swimming. Her long, slender tongue slips into your mouth and curls around yours as tightly as her hair clings to your cock. Heaving globes of hot gel squish against your [pc.chest] and Cherry’s mostly missing thighs release their deathgrip from your flanks. Your vision is filled with the pirate’s hedonistic excitement, but you can feel the tug of her needy tendril pulling your [pc.cock " + x + "] down to the horizontal level of her trembling core. The rahn pulls back from the kiss but not before sucking your lower lip into her mouth and leaving a slimy trail of saliva connecting your [pc.lips] to hers.");
	output("\n\nGuided by her ponytail’s instinctive aptitude, Cherry slides back, plunging herself onto your thickness. Orgasm ripples through her " + (pc.isTaur() ? "like a rising tide,":"like the waterbed’s waves,") + " the rahn’s wetness clenching tightly but offering little true resistance. Swallowing your [pc.cockHead " + x + "] with carnal relish, she spreads herself around you with impatient haste. Lubricated by her dripping dew, the gelatinous girl mounts your mast and engulfs your inches with single-minded euphoria.");
	pc.cockChange();
	output("\n\nCherry " + (!pc.isTaur() ? "grabs hold of your upraised [pc.legsNoun]":"interlocks her fingers around your unresponsive digits") + " and holds fast as she bucks atop your cock with moaning relish. The tightness around you is so wet that sputtering streams of the gel’s nectar drench your loins and pool around your [pc.ass]. Every thigh-jiggling slam sends wobbling impact waves cascading up her body" + (!pc.isTaur() ? " and tidal shudders rippling down into her bed. Though unable to move, the bouncing rubber cushion under you propels your hips upward, driving your throbbing body along for the ride":"") + ".");
	processTime(15);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",druggedSteeleGetSlurped3,x);
}

public function druggedSteeleGetSlurped3(x:int):void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");

	output("Inner muscles as weak as the rest of your body, pre-cum flows freely from your peak, feeding the girl’s appetites to ever greater excesses. " + (silly ? "<i>“Ahhhhhh, what’s that taste?”</i> she laughs between gliding strokes. <i>“Sweet cream, oh it sings to me.”</i> ":"") + "She tightens around you and takes a series of caressing plunges to drive your leaking lust deeper into her body. Rocking her hips in a shallow, circular motion, her body grows ever warmer, as if savoring the feel of your appetizer.");
	output("\n\n<i>“I can... hardly wait... for the... full meal...”</i> she whispers, voice nearly lost in the squelching, slapping clamor of her indulgent ride. Cherry pants and moans, her breath hot on you as she bounces her bubble butt atop your [pc.knotBallsHilt " + x + "]. <i>“So much inside you... so much to come... it’s enough to drive a goo mad.”</i>");

	
	//pc cock over 9"
	if(pc.cocks[x].cLength() >= 9) 
	{
		output("\n\nThe rahn mounting you shudders with another orgasmic thrill at the thought of your imminent release, spearing herself to inhuman depths. You can feel her interior stretching upward and outward at the relentless pace of her uninhibited, animal appetites. Your eyes water from the suckling, tensing sensation around your cockflesh. Even reclined and incapacitated, the bulge of your shaft is all too evident within the rahn’s slender midsection. Her gut, filling to obscenity with the girth of your [pc.cock " + x + "], looks very nearly like a red-hued version of the Bubble Buddies she loves so much.");
		output("\n\n<i>“Ah! Ah! I’m going to... take everything,”</i> she pants, tightening her grip around your " + (pc.isTaur() ? "forelegs":"fingers") + " almost painfully. <i>“Every. Last. Drop.”</i> Cherry’s eyes are unfocused but her pace is as rapid as a cock milker on overdrive.");
	}
	//pc cock over 18"
	if(pc.cocks[x].cLength() >= 18)
	{
		output("\n\nA few more long, heavy thrusts down onto your belly-bulging mast drives your cock’s bulge up past the amorph’s stomach. The peak of the phallus-stuffed distension batters against the bottom of her plentiful cleavage as she buries ever more of you inside her pliant, jelly cunt. Heavy breasts bounce atop the rahn’s gravid, gelatinous skin and squeeze your [pc.cockHead " + x + "] with their weight. She takes a series of rapid, shallow strokes while tightening her bosom between her forearms, compressing glistening E-cups around your cyclopean length. Every drop of her hips drives your [pc.cockHead " + x + "] further into the cushioning grip of her curvaceous vale.");
		output("\n\n<i>“Ffffffffuck!”</i> Her body clenches down in climactic urgency, cumming her brains out in full bodied shudders. Despite her cascading orgasms, Cherry doesn’t slow her stride even for a moment. Your body aches from her pace, but she seems to have forgotten you’re not one of the captive slaves she used to use and abuse. <i>“Womb-fuck me, you monster-cocked " + pc.mf("bastard","bitch") + ",”</i> she screams. <i>“Fuck my tits! Fuck my throat! Fuck me till my tongue wraps around your tip! Just f- f- fuuuuuu-!”</i>");
	}
	//merge
	output("\n\nRobbed of your muscle control, the rahn’s frantic, famished tempo is far too much for you to withstand. The weight of raw, organic stimulation pushes down on your impotent mind, glazing higher thought with the gushing lacquer of breeding instinct. The bloom of your climax sends suffocating bliss through your paralyzed body, so intense it feels as if your hips are bucking upward, even through your toxic helplessness.");
	if(pc.balls > 0) output("Unencumbered by trivial considerations like restraint, your [pc.balls] churn" + (pc.balls <= 1 ? "s":"") + " with bestial abandon. The gurgle of your peaking ecstasy is all the warning you have before your bloated sack shifts into overdrive, liquid ignition pulsing through your loins.");
	//if pc has horsecock:
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE || pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(" The peak of your [pc.cock " + x + "] flares outward in anticipation, billowing flesh fattening in a thick saucer of bestial virility.");

	output("\n\nThe engorged shaft deep inside the ruby red rahn throbs with the rush of your heartbeat before loosing its [pc.cumVisc] payload. The eagerly sought [pc.cum] spurts in a thick wellspring of rich seed that feeds Cherry’s volcanic hunger with your fluid heat.");
	if(pc.hasKnot(x)) output(" As your spunk rushes upward, your [pc.knot " + x + "] balloons outward, inflating within the goo girl’s loins. The bulge in her abdomen, already noticeable, becomes downright obscene as your fleshy bulb seals your mast inside the pirate’s depths.");
	output(" Cherry’s face turns upward, her eyes dilating at the streams of spunk fountaining inside her. The gel’s pussy clenches in mindless rapture, bursts of orgasmic exhilaration pulsing in rapid succession up and down the length of her sopping depths.");

	var cummies:Number = pc.cumQ();
	//if cum volume 4,000mL+
	if(cummies >= 4000)
	{
		output("\n\nYour load surges through the thirsty girl’s clutching inner walls, jetting jizz fooding into her in moments. Without your ability to control or hold back, the fullness of your release is less a series of blissful spurts and more a full-on fluid eruption. Your [pc.cock " + x + "], gorged to cum-fattened excess with the urethral-bloating climax, pours torrid waves of unrestrained [pc.cum] into Cherry’s suckling womb. Her gut positively glows with the fertilizing revel of your plentiful ejaculate.");
	}
	//ALSO if cum volume 10,000mL+
	if(cummies >= 10000)
	{
		output("\n\nNo matter how much [pc.cum] your inflamed libido pours into the rose red girl, it’s never enough. A geyser seemingly without end stretches seconds into minutes, straining your overwrought nerves with seething torrents. The girl’s trembling interior drinks deeply and greedily, widening until it feels as if your mast is just about swimming in your own seed. Your vision blurs, but in your state, you can no more hold back than you could pass through a solid wall.");
		output("\n\nThe pirate riding your gushing phallus heedlessly rocks her head back and forth from her penetrated perch, huge tits swaying in her gluttonous, cum-drunk indulgence. Oblivious at first, she slowly seems to realize her meal has not yet ended. Half veiled eyes widen at the squelching, gurgling effluence swelling her midsection to pregnant thickness. She loosens her grip on your " + (pc.isTaur() ? "upstretched legs":"hands") + " as, fingers trembling, she pulls her gloves to hold the gravid opulence you’ve bestowed upon her." + (pc.hasKnot(x) ? " Despite the volume inside her, not a drop manages to find its way past the plug of your [pc.knot " + x + "].":" Even her stretchy frame and passion-tightened muscles can’t keep your spunky volume from splattering virile ooze between the two of you."));
	}
	//ALSO if cum volume 70,000mL+
	if(cummies >= 70000)
	{
		output("\n\nCherry’s back arches when, at the very limits of her amorphic elasticity, you still have not finished your ceaseless release. Her eyes contract to narrow points, an expression of shock overtaking bliss. Trembling like jelly in an earthquake, she quivers bonelessly atop your geyser. Her tongue hangs limply out of the side of her mouth as she rolls her head back in a silent, thunderstruck whoop. The girl gasps and reaches out to steady herself before freezing in place, as paralyzed as her victim for once. Eyes rolling back, she gives in to the mindless deluge of her cum-drunk crescendos.");
		output("\n\nPale pink tendrils of fatigue fill your vision confusing sensation for sight. In your daze, you notice seemingly random sections of the rahn’s body clenching and expanding. It’s as if her entire form had been transformed into one large extension of her blissfully spasming pussy. Already glutted to broodmother size, her abdomen swells even further past her hips before tightening and pushing the liquid weight upward, the orgasm inflating her breasts even larger than her sperm-stuffed womb. As if every empty cavity of her body were being filled with your seed, the climax rises up past her shoulders and even forces her cheeks puff out. It’s as if she so much as opened her mouth to speak, your passion would burst from her lips.");
		output("\n\nShe barely manages to swallow back the ballooning engorgement for but a moment before it rises again, faster and more violently, nearly lifting her right off you! She shudders breathlessly, seized by body-rippling, liquid elysium. In your taut, trembling trance, the rahn seems to have become a living condom, filled to such saturation that she resembles her spherical namesake.");
	}
	//merge
	processTime(10);
	new Cherry().loadInCunt(pc,0);
	feedCherry(cummies);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",druggedSteeleGetSlurped4,cummies);
}

public function druggedSteeleGetSlurped4(cummies:Number):void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	output("Rocked up and down with the white-hot intensity of ecstatic waves you succumb at last to the zel’rahn’s soporific embrace. When you wake, the muscle-numbing effects of the Cherry’s toxin seem to have left you. You find yourself seated next to a shelf of colorful latex Bubble Buddies. Your body has been washed clean of the faint pink fluid your host bathed you in during her ride.");
	//if cum volume was under 10,000 mL
	if(cummies < 10000)
	{
		output("\n\nIt seems you’re somewhat more resistant to Cherry’s toxin than your first time; a mere four hours has passed. Cherry is perched atop her filled condom pillows, ");
		//if pc has given her a huge bubble:
		if(flags["CHERRY_HUGE_BUBS"] != undefined) output("clenching the huge bubble with your likeness printed on it tightly and ");
		output("watching smut on her visor. Her slender midsection still has the clear bulge from the tryst, your heat swimming inside her grateful womb.");
		output("\n\nShe notices you’ve come to and lowers her screen to give you a look-over. <i>“You look in one piece. Nice to get a home-cooked meal,”</i> she laughs, apparently still a little giddy from the frenzied fuck. <i>“Hope you don’t mind, I had Molli clean up around here while you were out. She was so pleased to have the opportunity, I’d swear she even sucked the toxin out of you.”</i>");
		output("\n\nCherry smiles with delight and lounges indolently atop her rubber-bound bed. <i>“So, you’ve had your rest. What’s next?”</i>");
		//Advance four hours and rest PC appropriately
		//return to Cherry’s Quarters menu
	}
	//if cum volume was 10,000 mL+
	else
	{
		output("\n\nIt seems you’re somewhat more resistant to Cherry’s toxin than your first time; a mere four hours has passed. Glancing around, you spot Cherry, sitting on her fluid-soaked bed trying not to fall asleep. <i>“Oh! You’re awake? Good, good,”</i> she mutters woozily. <i>“Wanted... sure you were... good... before going... sleep.”</i>");
		output("\n\nShe looks exhausted, and you’re not surprised. She went a little berserk, riding you like the last shuttle out of an exploding starship.");
		if(cummies < 40000) output(" Her belly has a pronounced bulge that, in most other races, you could mistake for pregnancy. It seems she’s still digesting the sheer volume of your latest donation.");
		else output(" Utterly engorged with your [pc.cum], the rahn’s midsection is at least three times thicker than it was before she had her way with you. You’re not sure how long she’ll be digesting that for, but you expect Molli’s going to have to have to pull an extra shift at the Tap-Hall.");
	}
	output("\n\n<i>“Nice to get... a home-cooked meal.... From time to time,”</i> she sighs in her giddy daze. Cherry smiles with delighted fatigue, collapsing atop the small ocean of sexual fluids the two of you have made of her rubber-bound bed. <i>“Maybe I should keep you,”</i> she murmurs in dreamy satisfaction, grabbing one of the huge, cum-filled bubble condoms at the head of her bed to snuggle against. <i>“My own... personal... sex doll.”</i> She hugging the giant ‘pillow’ tightly between her hefty, teatless breasts before drifting off to sleep. As you look at " + (flags["CHERRY_HUGE_BUBS"] != undefined ? "the huge cum bubble with your picture printed on it, ":"the huge cum bubble with a generous patron’s face printed on it, ") + "you’re not entirely sure she’s kidding.");
	// Advance four hours and return player to Tap-Hall
	// if cum volume was over 70,000 mL, set Cherry to cumflated for 24 hours.
		//Done via feedCherry(cummies);
	// Return Cherry to Tap-Hall after 4 hours
	processTime(4*60);
	sendCherryToHerRoom();
	restHeal();
	clearMenu();
	//to the taphall
	addButton(0,"Next",leaveCherrysPlace);
}

//[Fuck Her!]
//Cherry is cumflated
//mouseover: With Cherry nice and bloated, she’ll be safe to the touch for a while.
public function fuckCherryExclamationPointo():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	output("The Tap-Hall’s amorph owner has lost some of her cool, standoffish demeanor, the mask of self-control burned away by the heat of her undisguised lust. Body well-fattened with the weight of your belly-bloating passion, the gel girl’s natural toxin is no more dangerous than a stiff breeze. Rather than appearing anxious at the loss of her innate defense, Cherry seems as keyed up as you’ve ever seen her, exhilarated at being reduced to a squishy, stretchy, pocket pussy.");
	output("\n\nThe ruby rahn is completely at your mercy and getting off on every moment of it. The only question left is how you’ll use " + (silly ? "her fertilized frame for further fornication.":"the cream-drunk pirate’s pliable curves."));
	processTime(4);
	clearMenu();

	var fits:Boolean = (pc.cockThatFits(cherryCapacity()) >= 0);
	//[Lift] [Row] [Bench]
	if(pc.physique() >= 20) 
	{
		if(fits) addButton(0,"Lift&Fuck",cockSelect,[liftFuckDatRedgoo,cherryCapacity(),false,0],"Lift & Fuck","Hold Cherry in your arms and fuck her pussy. Requires moderate strength.");
		else addDisabledButton(0,"Lift&Fuck","Lift & Fuck","Stretchy as she is, even Cherry has limits to how much phallus she can survive.");
	}
	else addDisabledButton(0,"Lift&Fuck","Lift & Fuck","You aren’t strong enough for this. Try building up your physique. Maybe hit the gym or beat up some aliens somewhere...");
	
	addButton(1,"Titfuck",rowFuckCherry,undefined,"Titfuck","Lay Cherry on the bed and titfuck her.");
	
	if(pc.isTaur()) addDisabledButton(2,"Cowgirl","Cowgirl","You cannot participate in the “Cowgirl” position with your current body type.");
	else
	{
		if(fits) addButton(2,"Cowgirl",cockSelect,[benchFuckCherry,cherryCapacity(),false,0],"Cowgirl","Lift Cherry onto your dick and fill her pussy from below.");
		else addDisabledButton(2,"Cowgirl","Cowgirl","Stretchy as she is, even Cherry has limits to how much phallus she can survive.");
	}
}

//[Lift]
//mouseover: Hold Cherry in your arms and fuck her pussy. Requires moderate strength.
//requires pc to have at least 20 strength

//reset Cherry’s 24 hour cumflated tag
//Return player to Cherry’s Quarters menu,
//Maybe if the PC’s Strength is under 40, drain their Energy from the fatigue of lifting so much?
public function liftFuckDatRedgoo(x:int = 0):void
{
	clearOutput();
	showCherry(true);
	author("Wsan");
	//requires dick, no taurs. Need middling strength to lift her.
	output("You reach out and gently cup Cherry’s chin, the rahn smirking up at you while you revel in the ability to feel her <i>without</i> being numbed.");

	output("\n\n<i>“Go on, get a good grope in,”</i> she says, nodding down at herself. Her soft skin jiggles as her delicate hands glide up her voluptuous breasts, pressing them together and creating a lush valley of goo cleavage. <i>“You know you want to, and it’s what they’re for anyway.”</i>");
	output("\n\nCan’t miss that chance. Dropping your hand to her big red titties, you cup them and squeeze, drawing out a raunchy moan from the red-hued rahn. It’s amazing just how soft and supple they are beneath your fingers, like they’re imploring you to continue your exploration of her body. You grasp and stroke, running your hands along the underside of their rippling mass before placing your fingers over hers and making them wobble.");

	output("\n\n<i>“Aah, it’s so nice to have someone else appreciating them!”</i> Cherry says, smiling as she leans back and thrusts her oversized chest out for you. <i>“You can keep going if you like, [pc.name]. I absolutely don’t mind.”</i>");
	if(pc.isNice()) output("\n\n<i>“Actually, I’ve got an idea I think you’ll enjoy,”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Au contraire, there’s something different I had in mind,”</i>");
	else output("\n\n<i>“I’ve got something a bit more fun planned,”</i>");
	output(" you say, dropping your hands lower.");

	output("\n\nWith a heave and a grunt of effort you grip the wiggly zel’rahn around her wasp-narrow waist and lift her up, enormous breasts and all. She gasps quietly and grips your arms for comfort as her soft body gently slaps against your [pc.chest], gazing up at you with a mix of mirth and eroticism.");
	output("\n\n<i>“Well! This is nice and intimate, isn’t it?”</i> Cherry teases, her rubbery black lips pulled into a grin. <i>“I doubt just anyone could do this, you big, strong " + pc.mf("stud","shestud") + ". And what do you intend to do with <b>that</b>, hm?”</i>");
	output("\n\nShe presses her wide, womanly hips forwards and her thick pussylips brush against the [pc.cockHead " + x + "] of your [pc.cock " + x + "], a smear of precum wicked away into her body.");
	output("\n\n");
	if(pc.isNice()) output("<i>“Like I said, I think you’ll enjoy it,”</i>");
	else if(pc.isMischievous()) output("<i>“I bet you’ve got a good guess,”</i>");
	else output("<i>“Like I said, something a bit more fun,”</i>");
	output(" you reply, grinning back at her.");

	output("\n\n");
	if(pc.cocks[x].cLength() < 7) output("<i>“You don’t say,”</i>");
	else if(pc.cocks[x].cLength() < 14) output("<i>“Ooh, I can hardly wait,”</i>");
	else output("<i>“Please please please don’t keep me waiting,”</i>");
	output(" she murmurs, looking down and biting her lower lip. You can feel her squirming wetly against you, cool to the touch and oh-so-eager.");
	if(pc.cocks[x].cLength() < 7) output(" <i>“I hope I find out soon.”</i>");
	else if(pc.cocks[x].cLength() < 14) output(" <i>“There’s a lot on offer...”</i>");
	else output("<i>“Taunting me with something that <b>big</b> and v-virile is just cruel...”</i>");

	output("\n\nShifting one of your hands to grip the gooey zel’rahn’s big, jiggling ass, you hold her tight and slide the head of your cock into her soft, narrow canal and enjoy the way her eyelashes flutter for a few seconds. She’s made herself so tight for you that it’s little wonder she’s feeling it so much - just getting inside her is going to be a challenge, but it’s one that you’re prepared to meet. Her shiny black lips stretch into an ‘O’ of pleasure as you slowly dig deeper into her squeezing cunt, a groan of decadent pleasure escaping them.");

	pc.cockChange();

	output("\n\n<i>“Oh, stars, [pc.name],”</i> Cherry huffs, looking up at you with mock reproach. <i>“Warn a lady before you penetrate her like that. I can hardl- hha- hhnnn-”</i>");
	output("\n\nShe begins to slur as you slowly draw back out and slide yourself back in, her ");
	if(cherryCumflated()) output("cum-inflated stomach pressing against your body");
	else output("taut stomach pressing into you");
	output(" as she arches her back in pleasure, little shivers running through her entire form. Her breath slow and deep, she firmly wraps her arms around your upper back and looks up at you, eyes half-lidded. You know what that look says.");

	output("\n\nDigging her stumpy legs into your [pc.hips], Cherry lets out a moan of bliss as you sheath yourself [pc.knotBallsHilt " + x + "]-deep inside her, big, curvy breasts shifting up and down when you begin bouncing her on your hard cock. Her insides clench and stroke you by instinct, hungrily seeking all the pleasure you have to give her, but you’re just getting started. You walk while fucking her, taking firm steps forward until you have the lusty googirl pressed up against a wall with nowhere to go.");
	output("\n\n<i>“Oh, g-god,”</i> she moans quietly, panting in pleasure. <i>“Fuck me, [pc.name]. Give it to me as hard as you can-nnn!”</i>");
	output("\n\nFar be it from you to betray those expectations. With a grunt you lift her up by the hips and slam her into your groin, her entire body squishing and compressing with the force of your penetration. Sweat breaks out on your body as you ravage the wildly moaning rahn, each upward thrust etching the pleasure into her jiggling form until she’s crying out in ecstatic orgasm every time her ass bounces.");
	output("\n\nHer pussy clamps down and coils around you, inner walls shuddering in bliss, massaging your pumping cock in search of Cherry’s true desire. Your cock flexes and pulses, " + (pc.balls > 0 ? "your [pc.balls] drawing taut":"your stomach tightening") + " as [pc.skinFurScales] slaps against bright red goo, ringing out in her room.");
	output("\n\nIt all comes to a crashing crescendo as you groan in pleasure, pressing Cherry into the wall and rolling your hips up to grind into her clenching slit. She lets out a hoarse scream of carnal bliss into your chest as ");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 4000) 
	{
		output("[pc.cum] pumps up into her suckling womb, gooey lips wrapping around the head of your cock to draw it all out. It feels so good your [pc.legOrLegs] shake" + (pc.legCount == 1 ? "s":"") + ", and you have to lean against Cherry just to stay standing as you finish ejaculating deep inside her pussy.");
		output("\n\nShe’s so out of it by the time you’re done you have to carefully place her back down on her squeaking rubber bed, the woman completely incapable of handling it herself. Cherry looks up at you with a drunken smile, her cheeks a darker hue than usual.");
		output("\n\n<i>“You... are great,”</i> she puffs, spreading her arms and reclining backwards, her ponytail limply flopping to the side. <i>“Hhooo... gonna take a while for me to come down from this one. But hey, if you wanna go again,”</i> she says, a grin spreading across her face as she rubs her stomach and gazes lovingly at your dick, <i>“I’ve always got room for more of <b>you</b>.”</i>");
		output("\n\nYou can’t say you’re surprised.");
	}
	else if(cumQ < 10000) 
	{
		output("a deluge of [pc.cum] pours upwards into her suckling womb, gooey lips wrapping around the head of your cock to eagerly swallow it all inside her. The force of suction draws stream after stream of [pc.cumVisc] spunk from your throbbing dick, your [pc.legOrLegs] shaking with the effort of staying standing as you ejaculate deep into her pussy, over and over.");
		output("\n\nNot a single drop of your enormous load escapes her, Cherry’s stomach swelling outwards to contain your essence until she’s limply draped over you in your arms, panting and moaning in post-coital excitement. Even her ponytail has the fight taken out of it, swinging freely behind her, fine motor control forgotten in favor of appreciating the cum swimming inside her body. You have to carry her to the bed and gingerly place her down, making sure you don’t pop the squeaky rubber beneath her.");
		output("\n\n<i>“You are <b>such</b> a fucking stud,”</i> Cherry laughs tiredly, looking up at you from the bed as she reclines. <i>“Oh, stars... the first thing I want to do after that is do it a second time.”</i>");
		output("\n\nYou can’t say you’re too surprised.");
	}
	else if(cumQ < 70000)
	{
		output("a geyser of [pc.cum] jets up into her hungry womb, swelling her stomach outwards in a matter of seconds. Rivers of [pc.cumVisc] spunk surge into her burgeoning body as she pants in delighted lust, your [pc.legOrLegs] shaking as you strain to stay standing amidst the unbridled pleasure. Her clenching pussy is so intent on getting every last drop out of you that her sensitive inner walls are all but massaging your throbbing, spurting length, seeking out what she loves most.");
		output("\n\nShe’s so passionate about getting all of you inside her you can hardly resist, groaning deeply as stream after stream of [pc.cumColor] jizz swells her overfull womb outwards. The zel’rahn cum-addict is still panting and moaning in ecstasy by the time you lay her down on the bed and grunt atop her, thrusting deeply into her wobbling gooflesh to ensure she feels it as hard as possible. When you finally withdraw she’s got a glutton’s midriff, the liquid load protruding so far outwards she looks to be incredibly pregnant.");
		output("\n\n<i>“Oh,”</i> Cherry gasps, laying a hand to her breasts. <i>“Oh, stars. Oh, [pc.name].”</i> Her chest rising and falling rapidly, it seems like she’s struggling just to get the words out as she gazes up at you adoringly. <i>“That was - nothing short of, amazing. And if you - by any chance - want to do it all over again...”</i> she huffs, waving an arm lackadaisically before it slaps onto her bed, <i>“you know where I’ll be. All tired and full of your cum, <b>totally</b> unable to resist your advances a second time...”</i>");
		output("\n\nYou find yourself not only wholly unsurprised but turned on by the lusty rahn’s obvious need. Seeing your obvious ardor, she winks and spreads her stumpy thighs, holding her stomach back so you can see her well-fucked cunt. It looks just as tight as it was when you started - the advantage of being an amorph...");
	}
	else
	{
		output("a geyser of [pc.cum] jets up into her hungry womb, swelling her stomach outwards in a matter of seconds. Rivers of [pc.cumVisc] spunk surge into her burgeoning body as she pants in delighted lust, your [pc.legOrLegs] shaking as you strain to stay standing amidst the unbridled pleasure. Her clenching pussy is so intent on getting every last drop out of you that her sensitive inner walls are all but massaging your throbbing, spurting length, seeking out what she loves most.");
		output("\n\nShe’s so passionate about getting all of you inside her you can hardly resist, groaning deeply as stream after stream of [pc.cumColor] jizz swells her overfull womb outwards. The zel’rahn cum-addict shudders in bliss as you bear her to the bed, her stumpy little thighs grabbing at your hips to ensure you stay hilted within her - and then she coughs, her shiny black lips trembling as her eyes go wide. In a panicked display of urgency, she uses her ponytail and arms to spin herself around on your cock and grab a nearby limited edition Bubble Buddy.");
		output("\n\nPutting her mouth to the opening, she gags as a stream of thick, bubbling cum streams from between her lips and into the stretchy container, her entire body a clenched, quivering conduit for the gargantuan amount of seed you’re pouring into her. She fights to keep her eyes from rolling into her head and passing out as you strain and flex, emptying yourself inside her until she has to hastily tie off the current cum-stretched bubble and grab a new one. You can tell she’s got a lot of practice handling them, though you doubt she finds herself in <i>this</i> situation too often...");
		output("\n\nBy the time you withdraw your dripping cock from her soaked-through cuntlips, streams of semen running down her short little thighs, Cherry’s filled three of her collector’s edition Bubble Buddies with excess cum. She gasps and pants, trying to suck down and swallow the remainder, but her body won’t allow for it. Lying atop her wet, squeaky bed with cumstreaks running all through her swollen, jiggling body, she gazes at you with a fiery lust while her hands stroke and rub her engorged tummy.");
		output("\n\n<i>“I know what you’re thinking,”</i> she murmurs. <i>“You’re thinking ‘there’s no way this salacious little rahn wants to go a second time after that display’. Well, newsflash, [pc.name]. My entire room is waterproof.”</i> Cherry fixes you with a carnal grin. <i>“So if you were further inclined to lay this tired, unresistant woman already full to the brim with your seed... there’s <b>definitely</b> some room on the schedule.”</i>");
		output("\n\nAmorphs are really something else...");
	}
	processTime(30);
	new Cherry().loadInCunt(pc,0);
	feedCherry(cumQ);
	sendCherryToHerRoom();
	pc.orgasm();
	clearMenu();
	//Stay in room, I guess?
	addButton(0,"Next",mainGameMenu);
}

//[Row]
//mouseover: Lay Cherry on the bed and titfuck her.
public function rowFuckCherry():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	var x:int = pc.biggestCockIndex();
	output("With Cherry stuffed to the brim from her last feeding, you decide it’s time to give the girl’s enormous tits a little loving. E-cups at least, the hefty orbs atop her bloated belly glisten with a natural sheen, as if just oiled up. Bending to the gel’s level, you sweep your arms down her shoulders and across her sides, squishy skin dimpling under your fingertips. With her toxin neutralized, the red girl’s body feels warm and wet, trembling slightly at your touch.");
	output("\n\n<i>“Admiring your handiwork?”</i> Cherry asks, rubbing her cum-stuffed belly. <i>“Or maybe just looking for a fistfull of goo?”</i> She grabs your hands at the wrists and pulling them up to her breasts. Though she’s chosen not to manifest any nipples, the smooth orbs overflowing your palms have all the soft, pliant weight of normal breasts. Despite each tit being larger than the girl’s head, the amorph’s physiology keeps them positively perky, as if the natural sag of gravity were an alien concept to her.");
	output("\n\nYour caressing circuit across the plentiful expanse of Cherry’s melons leaves her ponytail wagging like a playful pet. You tighten your grip just enough to squeeze her supple skin between your fingers, fondling the scarlet spheres more vigorously. The girl in your grasp coos with delight, cupping her peaks and shifting her hips anxiously. Stroking and rolling the immense mammaries against one another, you note just how tightly they squish, the cleavage between them very nearly vanishing in the taut embrace. The hidden path between her prodigious assets brings a wave of desire washing over you: the hot need to plunge her mountains’ glistening depths.");
	output("\n\nFor her part, Cherry seems to be enjoying the tit massage even more than you are. Her eyes are closed to help savor the sensations, mouth open in a voiceless O. She rests her gloved hands atop yours and follows your motions, gliding over slick, curvaceous endowments. Even her ponytail gets in on the rub-down, following the path of one of your hands, then the other, squishing against her lust-fattened chest with wet, serpentine relish.");
	output("\n\nAt first, you mistake the tremor of wobbling gel in your hands for Cherry’s naturally jiggly nature. When the tremble reaches her arms a moment later and her ponytail afterwards, you realize she’s getting off on even just a light massage. Body shuddering in ecstatic delight, the pirate grips your hands and pushes them against her orbs, nearly hard enough to pancake the spheres. The quaking tension flits around your gel-buried wrists as the rahn breathes a long, ragged, climactic sigh. Aftershocks flutter over her surface like ripples in a pond as she recovers from the shuddering boobgasm. If she’s that sensitive already, you can understand why she didn’t form nipples: even a small pinch would leave the top-heavy girl cumming her brains out!");
	output("\n\nThat kind of sensitivity is exactly what you’re looking for, however. Before she can fully regain her presence of mind, you rise and grab the gel around her hips, lifting her above the bed. Even without legs, your liquid burden makes the zel’rahn a hefty cargo indeed! Turning her around, you lower the cumflated pirate onto her back, head dangling off the edge of the bed. She glances around, catching your intent when " + (pc.isTaur() ? "you raise your forelegs to mount the bed, eclipsing the girl’s vision with the fullness of your [pc.groin].":"to the shadow of your [pc.groin] falls across her face."));

	//cocksize <7:
	if(pc.cocks[x].cLength() < 7)
	{
		output("\n\nYour [pc.cock " + x + "] flops down on the crimson girl’s cheek, the heat from her body radiating up your cockflesh like a warm invitation. <i>“Ah, the eternal question: fuck the rahn’s mouth or her tits? I’m all atitter with anticipation.”</i> She squeezes her chest, rolling her orbs against one another temptingly while nuzzling your shaft with the polished ebony of her black lacquered lips.");
	}
	//7-14:
	else if(pc.cocks[x].cLength() < 14)
	{
		output("\n\nYour [pc.cock " + x + "] flops down across her cheek and over her collar. Heavy flesh throbbing against her throat and [pc.cockHead " + x + "] nuzzling the peak of her recumbent breasts, Cherry’s needs a moment to take it all in. <i>“What a monster of a pick-up line,”</i> she pants, running a hand down your length. <i>“Picking on me when I’m down, huh? Better not go easy on me, now; I’m a bad girl and deserve a real pounding,”</i> she teases, kissing your [pc.knotBallsHilt " + x + "].");
	}
	//14+:
	else
	{
		output("\n\nYou flex your abdomen, rising your [pc.cock " + x + "] up above the crimson girl’s head before dropping it down atop her. The weight of the impact sends a ripple through the gel’s body. From brow to the furthest reaches of her chest, your colossus of a fuck-stick presses her even deeper in the bowed waterbed.");
		output("\n\nThe masculine mast has the pirate girl drooling. <i>“Now THIS is why I keep my girls this huge,”</i> she murmurs in awed appreciation. <i>“A hard, throbbing cock fucking its way through every inch of cleavage I’ve got? It’s enough to make a girl want to kick up her chest up a few more cup sizes.”</i> Unable to hold herself back, the gel’s tongue start lapping at your girth, all too eager to get your monster between her tender teats.");
	}
	//merge

	output("\n\n");
	if(pc.legCount <= 1) output("Moving forward to drag your shaft across the gelatinous girl’s throat, she obligingly leans her head back so you can mount her mammaries properly.");
	else if(pc.isTaur()) output("Bracing your front [pc.footOrFeet] against the far end of the bed and stepping forward, you drag your shaft across the gelatinous girl’s throat to mount her mammaries properly.");
	else output("Stepping forward to brace your legs around the gelatinous girl’s head, you drag your shaft across her throat, positioned perfectly to mount her mammaries.");
	output(" Cherry’s breath is hot on your [pc.thighs], her juicy chest jiggling at the touch of your [pc.cockHead " + x + "]. The rahn’s ever helpful ponytail coils around your girth to aid your aim, pumping the thickening hardness in long, slow strokes that leave tingles dancing up your [pc.hips]. She folds her arms together under her breasts, squeezing the mounds together until they wobble precariously with every breath she takes.");

	processTime(10);
	pc.lust(150);
	clearMenu();
	addButton(0,"Next",rowFuckCherry2,x);
}

public function rowFuckCherry2(x:int):void
{
	clearOutput();
	showCherry(true);
	author("Fenoxo");
	output("Rocking back and forth against the pirate’s semi-firm bosom, you find the cleft of her cleavage even tighter than you expected. The taut surface of her gel membrane has pillowy softness all around the vale, but the space between her compressed tits has the clenching modesty of a virginal pussy. Thankfully, the wet polish of her diluted toxin serves perfectly to lubricate your entry. " + (pc.isTaur() ? "Leaning forward to brace a forearm against Cherry’s wall,":"Leaning forward to bury your hands in the puffed peaks of the girl’s tremendous bust, you push forward, parting the fastness between her arm-squashed globes an inch at a time."));
	output("\n\nThe straining pressure around your [pc.cockHead " + x + "] is enough to tighten the muscles in your [pc.legOrLegs], sucking wetness stretching around your invading girth with moist, slurping sounds that almost make you think you’ve missed the hole and are forcing your way through the rahn’s thirsty throat. " + (pc.isTaur() ? "You kick one of your rear legs back, trying to relieve the building excitement in your hindquarters, the movement adding a little extra thrust to your forward momentum.":"Hands full of the ruby jelly’s tits, you paw them toward you, the slick spheres all too happy to swallow your throbbing pole into their narrow seam.") + " The salacious snugness of the rahn’s voluptuous chest fills with a pulsing ardor that, in most other races, you might take for a racing heartbeat.");
	output("\n\nWith an ass-clenching pump, you drive your [pc.cock " + x + "] through the tunnel of Cherry’s mountainous tits all the way to your [pc.knotBallsHilt " + x + "]. ");
	if(pc.cocks[x].cLength() < 7) {}
	else if(pc.cocks[x].cLength() < 14) output("The crest of your [pc.cockHead " + x + "] peaks out the other side, nerves thrumming at the sudden release from the over-endowed girl’s squishing sanctum. ");
	else output("Clearing the length of the girl’s copious chest, the fullness of your stroke bumps your [pc.cockHead " + x + "] against the rahn’s over-filled belly. The rounded mound jiggles at the impact, sending a tidal tremor through her whole body. ");
	output("Pulling back slowly enough to let your girth savor the hugging grip of her cleavage, you begin stroking inside her, dragging the legless pirate a few inches off the bed before pushing her back on.");

	output("\n\nCherry laughs at the reckless ride, voice tight with pleasure, cheering you to a faster pace. Before long, you’re riding the buxom girl’s breasts for all you’re worth. Rubber bedding squeaks in protest as she scoots back and forth with each full-length stroke. It doesn’t take long before the rahn shudders and moans in the throes of another orgasm, girl-cum spurting across her bed and pooling under her ample ass. The gel’s climax gives her body a vibrating quality that eggs you on to an even faster pace. To keep from being dragged off entirely, Cherry reaches out to hold onto the bed’s frame with both arms, her ponytail taking their place in squeezing her tits tightly around your [pc.cock " + x + "].");
	output("\n\nThe extra limb lacks the strength of her arms, however, loosening the gelatinous resistance of her cavernous vale just a touch. As the pressing firmness ebbs, ner natural softness blooms around you in a supple, quivering embrace. Globs of leaking pre drool into the cum gutter of her chest, your strokes rubbing the [pc.cumVisc] goo into her skin like a fresh coat of oily polish. Her back arching, Cherry moans with [pc.cumGem]-anointed abandon, her ponytail alternating its pressure in time with your thrusts until you reach the precipice of your climax. Burying yourself to the hilt in the pirate’s cleavage, you stop thrusting and just holding the tender, trembling, fist-clenching moment for as long as possible.");

	//pc has balls
	if(pc.balls > 0)
	{
		output("\n\nThe kindling inner flames build with every shaft-stuffing moment until her membrane reaches a glowing, trembling fever. Head perfectly aligned with your [pc.balls], the zel’rahn presses her jet black lips to the surface of your hanging pouch, kissing the churning sac with the passion of a lover. <i>“Ah, the the taste of you,”</i> she sighs, rolling her face across your supple swell and showering you with epicurean kisses.");

		output("\n\nHer lips stretch to a broad ‘O’ against your [pc.balls], her panting desire hot on your [pc.skinFurScales].");
		if(pc.ballDiameter() < 3) output(" Cherry’s tongue snakes out to coil around your teste" + (pc.balls > 1 ? "s":"") + ", dragging the whole pouch into her mouth. The wet, sucking pressure of her cheeks alongside the thirsty winding of her oral organ is nearly enough to knock you on your ass. All too soon, however, she lets your nuts slip back out with an impassioned gurgle, her tongue still playing across their girth.");
		else if(pc.ballDiameter() < 6) output(" The suction of Cherry’s mouth closes around your ballsack, thirsty zeal melting your endurance. The gel’s vacuuming kiss manages to hoist " + (pc.balls > 1 ? "one of ":"") + "your hefty ball" + (pc.balls > 1 ? "s":"") + " into her maw, her cheeks bloating with the girth of your spunk factory. She noisily sloshes the churning mouthful before her trembling lips let it slip from the moist embrace.");
		else output(" Cherry’s long tongue makes as much of a circuit as it can around the incredible girth of your spunk factor" + (pc.balls == 1 ? "y":"ies") + " as she squeezes her pillowy lips against orbs larger than her head. Suck as she might, however, the ambitious rahn’s mouth is simply not large enough to swallow your nut" + (pc.balls > 1 ? "s":"") + " whole. As if recognizing the supremacy of your girth, she turns her suckling pucker to the task of total ball worship. With the single mindedness of a prayer, she covers every inch she can reach with a wet whisper of drooling desire, consecrating her face with your churning heat while bathing your " + pc.mf("kingly","queenly") + " nuts in her slavish submission.");
		output(" <i>“Almost... as delicious... as your cum...”</i> she gasps between bouts of desperately tongue-polishing your [pc.balls].");

	}
	//pc has no balls, but does have a pussy
	else if(pc.hasVagina())
	{
		output("\n\nThe kindling inner flames build with every shaft-stuffing moment until her membrane reaches a glowing, trembling fever. Unable to keep boiling lust back a moment longer, Cherry’s lips press deeply against the swell of your [pc.pussy] in a sucking kiss that you feel all the way up to your abdomen. <i>“Mmmmm, your flavor is enough to make me want seconds...”</i> Squishing her face against your groin, she breathes in a deep, gratified sigh. <i>“Make that thirds.”</i>");
		output("\n\nFrom the caressing embrace of her lips, the zel’rahn’s tongue slips across your [pc.skinFurScales] with the sinuous resolution of a serpentine huntress. The lengthy organ snakes its way across the bounds of your lower lips and coils possessively around your [pc.clits]. A burst of sensitive tightness cracks up your spine, making you grind against the gel’s face. Her lips find your [pc.pussy], obsidian pillows nibbling on the cushions of your labia while she sucks the dripping [pc.girlCum] from your slit. You can’t help but buck and moan, squeezed at both tender ends by the gel’s tits and tongue.");
	}
	//merge
	output("\n\nIt’s too much. With Cherry’s silky-smooth cushions around your [pc.cock " + x + "], every impulse in your body ignites with the dizzying crescendo of rutting release. Shameless, bestial need floods your [pc.chest] with carnal heat. Overcome by a lustful haze, your liquid passion bursts free, pouring from you in [pc.cumColor] gouts on the ruby rahn’s obscenely bloated body. You buck deeply into her tits, dragging your [pc.cockHead " + x + "] through her pillowy peaks, mixing the delicious ache of your orgasmic bliss with the soothing embrace of her jelly breasts.");
	output("\n\nThe streaming rush running between the pirate’s nippleless udders apparently feels as euphoric to her as it does to you. Caught once more in the exhilaration of organic rapture, the amorph squirts the thin, pink goo of her helpless bliss between her plump trunks. As you pump your load into the girl’s bountiful bosom, she drenches the interiors of her rounded stumps with an equal volume of glistening femme cum. <i>“F- fuuuuuuuuuck,”</i> she moans out of the side of her mouth, unable to articulate anything more complicated through the undulating ecstasy of having her tits fucked full of [pc.cumGem] spunk.");

	var cumQ:Number = pc.cumQ();
	//if 10,000 – 70,000mL output:
	if(cumQ < 10000) {}
	else if(cumQ < 70000)
	{
		output("\n\nAll too quickly, the deep vale of the girl’s bosom fills to overflowing with your spunk, stray gouts of [pc.cumVisc] goo spurting free. Thick ropes of [pc.cum] arc up over her curvy frame, splattering across the peaks of her breasts and out, over her arched abdomen. Jism builds against the girl’s gravid belly, flowing in liquid curtains around the obtrusive swell and pooling around her bulk-broadened hips. Your steadily gushing seed unloads in fountaining spurts across the girl. Deep sheets of spoo bathe her with drenching layers of fat, dripping jizz like an oil derrick, pumping out of all control.");
	}
	//if 70,000mL+: instead output:
	else
	{
		output("\n\nThe sheer volume of your release is far greater than anything Cherry’s cleavage can hope to contain. With your second load, a geyser of [pc.cum] lances free from the wobbling prison of her slick, scarlet orbs and splatters heavily against the intervening bulk of her goo-inflated belly. Like a blocked hose, the impact scatters the fat, liquid streams in all directions, sending a wild cascade of [pc.cumVisc] jizz all across the rahn’s quarters.");
		output("\n\nA shimmering curtain of thick cum paints the far wall of the pirate girl’s quarters with a sopping, [pc.cumColor] backdrop. Stray globs slap against Cherry’s docked metal legs, hot seed polishing the alabaster cybernetics and pooling in the recesses meant for her stumpy thighs. Some of the torrential issue even manages to arc across her tall shelf of latex collectables, gooey webs of dripping bliss messily heaped atop rare trinkets and toys. The vast majority of the teeming deluge finds its way onto the gel girl herself, either bathing her curves in flowing waves of thick nut or streaming down to pool in the waterbed’s rahn-filled furrow, excess overflowing around your [pc.footOrFeet].");
	}
	//merge
	output("\n\nBy the time you’ve run dry, the ruby rahn is a sticky mess. If nothing else, you can appreciate her choice in rubber bedsheets. Lazily rubbing the softening length of your [pc.cock " + x + "] between her gooped breasts, Cherry runs her tongue across your [pc.knotBallsHilt " + x + "] to gather up a mouthful of your seeping excess." + (cumQ >= 70000 ? " <i>“I’ll have to send Molli in here for cleanup,”</i> she notes between gooey gulps.":"") + " <i>“With this kind of mess, you’d think I was filling in for one of my employees!”</i>");

	output("\n\n");
	if(pc.isNice()) output("<i>“If that was anything to go by, I can see why you’re the boss,”</i> you pant in spent satisfaction. You pull back enough to slip free from the gel girl’s cleavage but before you can disentangle yourself, she starts to slurp straight from the drooling slit of your [pc.cockHead " + x + "], thirsty for your seed even now.");
	else if(pc.isMischievous()) output("<i>“Well, you’ve certainly got the biggest booth, and an appetite to go with it,”</i> you add, pulling back from the girl’s gooey embrace. As if rising to the challenge, she leans into your retreating length, smearing her blushing face against your drooling cum-slit with an indulgent moan.");
	else output("<i>“The cheapest one, at that. Afterall, you work for nuts,”</i> you laugh, gesturing at the gooey mess around her. You pull back just enough to free your mast from the girl’s tits, bouncing your [pc.cockHead " + x + "] against her face on the way out.");
	output(" You have to force yourself to " + (pc.isTaur() ? "dismount":"step away") + " from the bed, before the pirate’s endless appetite can pull your drained and aching body in for another round.");
	output("\n\n<i>“You know just how to spoil an amorph. I should install a private booth in here just to keep you as my personal slime-slut,”</i> she chuckles. Scooping handfuls of your cream from between her breasts and pouring them into her lips, the zel’rahn contentedly feeds herself at a leisurely pace, oblivious to the world around her. Now seems as good a time as any for you to head back. No need to let her think too much about that private booth!");
	//[End]
	//boot player to Tap-Hall
	//return Cherry to Tap-Hall after 4 hours
	sendCherryToHerRoom();
	processTime(15);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",leaveCherrysPlace);
}

//[Bench]
//mouseover: Lift Cherry onto your dick and fill her pussy.
//Does not support taurs
//Pick dicku size :3
public function benchFuckCherry(x:int):void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");

	output("<i>“Well? What are you going to do with your bubbled buddy?”</i> she asks, slapping her rut-thickened hips. <i>“I’m a one-of-a-kind collectable, you know. The only condom around that begs for more.”</i> Jiggling her near-spherical girth, the rahn flashes a lusty grin and fingers her sopping sex invitingly. Though her anesthetic touch has been neutralized, the girl’s skin still beads with a glistening, inviting wetness.");
	output("\n\nDespite still being stuffed with spunk, the girl still has a manic liveliness about her. It’s as if the energy from her prior meal were being fed directly into her libido, carnal desires rippling through her gelatin like a powerline in a pond. It’d be best if you put the rahn’s vibrating vigor to work before the rahn’s sex drive gets out of hand.");
	output("\n\n<i>“How about you take top this time?”</i> you suggest as you climbing onto Cherry’s waterbed. Laying on the supple, rubbery sheets and feeling the fluid-filled bunk’s cloying warmth reminds you just how cum-crazed Cherry can get when she cuts loose." + (flags["CHERRY_HUGE_BUBS"] != undefined ? " The jizz-filled pillow with your picture on it at the head of her bed helps drive the lesson home.":""));
	output("\n\nThe half-sized girl at your side wiggles up against your [pc.skinFurScales], her ponytail stroking your [pc.groin] absently. <i>“Sure your hips can take the weight?”</i> she teases, giving her hefty cum-gut a wobbling shake.");
	output("\n\nBy way of an answer, you grab hold of her squat thighs. The broad tracts of her flexible softness squish between your fingers, just tense enough for a grip but so malleable that your hands very nearly vanish into her yielding thickness. With a grunt of effort, you lift the ballooned girl up enough to plop down on your midsection in a cowgirl position. The impact sends an tidal swell of undulating waves through the bed, the two of you oscillating vigorously enough that Cherry is obliged to wrap her stubby trunks around your waist to keep from being tossed off. Rocking back and forth atop your [pc.hips], the zel’rahn’s puffy pussy gushes liquid excitement so profusely, you’d swear she orgasmed just from the ascent.");
	output("\n\n<i>“I ought to get you a saddle,”</i> she laughs, one hand stretched across your [pc.chest] for balance, the other thrown up in the air like a bull rider. Her seed- glutted stomach slaps over your frame with every wheeling motion she makes, filling you with an aching to add more to that inflated goo girl.");
	output("\n\nYou grow harder with each passing moment, pumping between her cheeks until the girl’s bubble butt has stroking you to full mast. <i>“If only there were a nice, hard pommel for support,”</i> you muse, scooting her ample booty backwards to squish up against your [pc.cock " + x + "]. Dollops of pre drip from your [pc.cockHead " + x + "] and run down the small of her back and into the cleft of her generous backside.");

	//cocksize <7:
	if(pc.cocks[x].cLength() < 7)
	{
		output("\n\nCherry wiggles her ass against your drooling hardon. <i>“I see how it is. Ask and I shall receive? Well, how about you help me mount up properly and I’ll see if I can’t break this stallion.”</i> No sooner asked, you tighten your grip once more and heave the spunk-stuffed slut a half foot into the air. She squeals in delight, her ponytail curling around your [pc.cock " + x + "] and aiming it right for her dripping lower lips.");
	}
	//cocksize 7-14:
	else if(pc.cocks[x].cLength() < 14)
	{
		output("\n\n<i>“Oooooh... that’ll do. That’ll do nicely,”</i> she purrs, clamping your girth between her asscheeks tight enough to feel the veins pulsing up your shaft. <i>“No risk of losing my seat with this many inches inside me. Give a girl a lift, won’t you? I’ll make it worth your while,”</i> she promises with a tantalizing lilt.");
		output("\n\nTaking stock of Cherry’s inflated core, you slide your palms across her wide hips and up her fattened waist. Gripping the girl under her arms, you bend upwards and hoist her into the air. She sloshes with fluid weight, but you manage to get her high enough to free your mast from the clutching embrace of her ass. The rahn’s ponytail, swishing impatiently, takes hold of your [pc.cock " + x + "] and aims it right for her dripping lower lips.");
	}
	//cocksize 14+:
	else
	{
		output("\n\n<i>“Forget the pommel,”</i> Cherry gasps, <i>“you’ve got a full bull’s horn back there! No need for a saddle when I’ve got over a foot of cock to keep me upright. I’m going to need this monster inside me right the fuck now,”</i> she demands in a steamy gasp.");

		output("\n\nYou sit up and adjust your grip to cup the legless rahn around her opulent ass. With a grunt of effort, you raise her off your lap, dragging the slick curvature of her porn-star bosom across your [pc.chest]. The well-fed girl’s breeding-bloated belly bulges against your fingers as she rises. Gelatinous girth smooshes across your body all the harder as she drapes her arms over your shoulders and interlocks her fingers behind your shoulder blades.");
		output("\n\nThe effort is ");
		if(pc.physique() < 25) output("monumental,");
		else if(pc.physique() < 50) output("a small labor,");
		else output("relatively trivial,");
		output(" but eventually you’ve hauled the pirate’s jizz-swollen bulk high enough to slap her undercarriage with the bubbling pre dripping down your [pc.cockHead " + x + "]. The pirate girl’s ponytail, acting on its own good instincts, coils around your [pc.cock " + x + "] and aims it right for her dripping lower lips.");
	}
	//merge
	processTime(10);
	pc.lust(25);
	clearMenu();
	addButton(0,"Next",benchFuckCherry2,x);
}

public function benchFuckCherry2(x:int):void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");

	output("Lowering Cherry down onto your length is more difficult than you would’ve imagined. Her vaginal tightness is so intense, that were it not for the gushing flow of her lubricating nectar, you doubt so much as your pinkie could pass the taut slit. As it is, your cock is caught in the shudderingly sweet clasp of suckling gelatin. The girl’s amplified gravity drags her fattened frame down your inches at a glacial pace, tensed depths parting further only after sampling your girth with a connoisseur’s leisure.");
	output("\n\nGlobs of tension-teased ardor bubble up your jelly-suckled mast and you lay back to restrain the urge to flip her around and drill the gel girl’s face into her bedsheets. Resting your head against " + (flags["CHERRY_HUGE_BUBS"] != undefined ? "the massive, purple bubble with your likeness printed on it,":"one of the massive, filled condoms Cherry keeps at the head of her bed,") + " you can see why she uses the bloated latex bubbles as pillows. A comforting lake of body heat washes over you, the rubbery package cuping and shaping itself around your neck and shoulders.");
	output("\n\nA passing worry about accidentally popping the ballooned pillow is driven from your mind when Cherry’s pink-oiled posterior slips out of your grip, dropping her the rest of the way down your shaft. Piercing her constricting cunt all the way to your [pc.knotBallsHilt " + x + "] in one, sudden plunge shocks you as much as the girl. The impact of her gravid gut on your diaphram just about knocks the wind from you.");
	pc.cockChange();

	output("\n\nBreathless and seeing stars, you try to process the moist, quivering ripples Cherry’s body is sending up and down your length. Her midsection further fattened by your throbbing phallus, the rahn gapes in her own bliss-blindness for a long moment. Before she’s even recovered, the gel girl’s hips begin to move, the stumps of her thighs rowing her back and forth along your penetration." + (pc.balls > 0 ? " The hefty weight of crimson ass cheeks rub down the the swell of your [pc.balls], demanding just that little bit extra of your galloping libido.":""));
	output("\n\nSquished as much under the prodigious girth of cumflated girl’s stomach as by the ceaseless cravings of her ravenous cunt, it’s all you can do to hold back the pounding passions roaring in your [pc.ears]. You sink your fingers deeply into Cherry’s gelatin love handles and lift her a few inches off of you before dropping her down once more. The impact draws another smothering clench from the rahn’s sumptuous pussy, tight enough that you have to arch your back just to keep from surrendering to the heat.");
	output("\n\n<i>“F- fuck! You feel t- t- that...?”</i> she moans, rubbing her seed-swollen abdomen. <i>“All your delicious spunk, more than one girl can eat, just flopping against you.”</i> She leans forward, smooshing her over-cushioned core across your torso, the rahn’s body as warm and soft as the massive condom-pillow you’re laying on.");
	output("\n\nGlossy black lips press wet kisses over any inch of your body she can reach. <i>“I bet I can fit more of you inside me,”</i> Cherry whispers in hot excitement. <i>“Even more gallons, pumped womb-deep.”</i>");
	output("\n\nYou deliver an open-palmed slap across her ruby rear, jolting her upright. Muscles numbed by the heat of your boiling lust, you continue lifting the jumbo-sized gel, thrusting up as she drops back down. <i>“Is that what gets you going? Filling girls till they can’t move and just letting them smother you with their nut-fattened bellies? Well, bubble me with that sweet cream, you beautiful " + pc.mf("bastard","bitch") + "! This condom wants more!”</i>");
	output("\n\nYour ");
	if(pc.balls > 0) output("cum-bloated ball" + (pc.balls > 1 ? "s":"") + ", churning with the rapid pace of your racing heart,");
	else output("body");
	output(" reacts to the desperate plea with a breeder’s exuberance. The heat from Cherry’s spunk-stuffed stomach seems to flow with each slapping impact back into your body. Tendrils of tingling tightness wrap across your [pc.chest] as a cascade of sweet release hits you. Surging through your [pc.hips] and up your [pc.cock " + x + "], the redoubled lust pours into the bloated pirate squirming in your lap with all the restraint of a burst dam.");

	var cumQ:Number = pc.cumQ();
	// <4,000 mL cum
	if(cumQ < 4000)
	{
		output("\n\nThrobbing, bliss-tender flesh spurts lances of ecstasy into the red girl. Voracious and insatiable depths drink in your load like a siphon, splashing the [pc.cumGem] plunder across her feminine nadir like the spoils of rich campaign. Vibrating coils of inner muscle - drunk with trembling orgasm from the fresh, [pc.cumVisc] seed - speak to the rahn’s indulgent relish.");
		output("\n\nStroke by gushing stroke pump, you loose your heat into her, expanding a belly already at the limits of her biology. Cherry’s hands paw at your [pc.chest], drooling and insensate in her bliss. The girl’s vibrating interior draws a breathless tension from your frame, pleasure rising like a cresting tsunami until your deep, rahn-shaking impacts descend into rapid, shallow slaps.");
		if(pc.hasKnot(x)) output("\n\nThe inflation of your [pc.knot " + x + "] inside her pussy is met with an equally intense pressure of the girl’s echoing orgasm. The ballooning girth of your [pc.knot " + x + "] leaves the overstimulated girl bucking in wild abandon, saddle-bound against your lap. Plugged by the girth of your [pc.cock " + x + "] and filling with your liquid heat, Cherry’s gelatinous body stretches further than you would’ve believed possible. Her ponytail cracks like a whip against her ass, your fleshy plug keeping every waistline-stretching load inside her, down to the last [pc.cumVisc] ounce.");
		output("\n\nEvery hip-thumping, cum pumping, goo-feeding moment that passes siphons a little bit more of Cherry’s fervor, until her eyelids grow heavy and a euphoric smile flutters across her lips.By the time you run dry, she seems to have regained some small measure of self-control. With fresh jizz in her to replace what the two of you burned off in the exertion, the gel girl looks no smaller than before, but certainly more satisfied.");
		output("\n\nWhen she rolls off of you, the ruby-hued pirate wears a fresh flush of dark red. Sated, but who knows for how long? For your part, your hips feel bruised and your body is soaked in rahn sweat, but the exhaustion is a well earned one. You take your leave before she talks you into another pelvic-crushing ride.");
		//[End]
		//boot player to Tap-Hall
		//return Cherry to Tap-Hall after 4 hours
		processTime(35);
		feedCherry(cumQ);
		new Cherry().loadInCunt(pc,0);
		pc.orgasm();
	}
	// 4,000-70,000 mL cum
	else if(cumQ < 70000)
	{
		output("\n\nThrobbing, bliss-tender flesh spurts lances of ecstasy into the red girl. Voracious and insatiable depths drink in your load like a siphon, splashing the [pc.cumGem] plunder across her feminine nadir like the spoils of rich campaign. Vibrating coils of inner muscle - drunk with trembling orgasm from the fresh, [pc.cumVisc] seed - speak to the rahn’s indulgent relish.");
		output("\n\nStroke by gushing stroke pump, you loose your heat into her, expanding a belly already at the limits of her biology. Cherry’s hands paw at your [pc.chest], drooling and insensate in her bliss. The girl’s vibrating interior draws a breathless tension from your frame, pleasure rising like a cresting tsunami until your deep, rahn-shaking impacts descend into rapid, shallow slaps.");
		if(pc.hasKnot(x)) output("\n\nThe inflation of your [pc.knot " + x + "] inside her pussy is met with an equally intense pressure of the girl’s echoing orgasm. The ballooning girth of your [pc.knot " + x + "] leaves the overstimulated girl bucking in wild abandon, saddle-bound against your lap. Plugged by the girth of your [pc.cock " + x + "] and filling with your liquid heat, Cherry’s gelatinous body stretches further than you would’ve believed possible. Her ponytail cracks like a whip against her ass, your fleshy plug keeping every waistline-stretching load inside her, down to the last [pc.cumVisc] ounce. Practically yowling in climactic, body-stretching bliss, the goo-slut somehow finds room for your gallons, your [pc.knot " + x + "] refusing to let so much as a drop escape her enjoyment.");
		output("\n\nAs load follows load, the taut tunnel suckling so dearly on your [pc.cockHead " + x + "] expands under your volume. Cherry’s posterior trembles against your [pc.groin], climax-tender nerves quivering in the delicious ache of her swelling midsection. The cum-fat rahn, already gorged with your abundance, rides your pumping profusion with gluttonous euphoria.");
		output("\n\nEven after burning through all the energy of the fuck, by the time your " + (pc.balls > 0 ? "[pc.balls]":"throbbing shaft") + " has run dry, Cherry is just that much wider than when the two of you started. Eyelids heavy and an addict’s grin plastered on her face, Cherry wears a fresh flush of dark red by the time she rolls off of you. The weight removed, your lungs suddenly remember how to breathe, deep, cold gasps working to make up for the momentary crush of the rahn’s over-filled belly. Exhausted and possibly bruised, you can’t help but bask in the afterglow for a moment, lounging against the pirate’s huge " + (flags["CHERRY_HUGE_BUBS"] != undefined ? "you-printed ":"") + "latex pillow.");
		output("\n\nBefore she can recover enough to ply you for yet more, you gather your belongings and head out. If you don’t leave now, there’s no telling when she’ll let you go!");

		//[End]
		//boot player to Tap-Hall
		//reset Cherry’s 24 hour cumflated tag
		//return Cherry to Tap-Hall after 4 hours
		processTime(35);
		feedCherry(cumQ);
		new Cherry().loadInCunt(pc,0);
		pc.orgasm();
	}
	// >70,000mL cum
	else
	{
		output("\n\nThrobbing, bliss-tender flesh spurts lances of ecstasy into the red girl. Voracious and insatiable depths drink in your load like a siphon, splashing the [pc.cumGem] plunder across her feminine nadir like the spoils of rich campaign. Vibrating coils of inner muscle - drunk with trembling orgasm from the fresh, [pc.cumVisc] seed - speak to the rahn’s indulgent relish.");
		output("\n\nStroke by gushing stroke pump, you loose your heat into her, expanding a belly already at the limits of her biology. Cherry’s hands paw at your [pc.chest], drooling and insensate in her bliss. The girl’s vibrating interior draws a breathless tension from your frame, pleasure rising like a cresting tsunami until your deep, rahn-shaking impacts descend into rapid, shallow slaps.");
		if(pc.hasKnot(x)) output("\n\nThe inflation of your [pc.knot " + x + "] inside her pussy is met with an equally intense pressure of the girl’s echoing orgasm. The ballooning girth of your [pc.knot " + x + "] leaves the overstimulated girl bucking in wild abandon, saddle-bound against your lap. Plugged by the girth of your [pc.cock " + x + "] and filling with your liquid heat, Cherry’s gelatinous body stretches further than you would’ve believed possible. Her ponytail cracks like a whip against her ass, your fleshy plug keeping every waistline-stretching load inside her, down to the last [pc.cumVisc] ounce. Practically yowling in climactic, body-stretching bliss, the goo-slut somehow finds room for your gallons, your [pc.knot " + x + "] refusing to let so much as a drop escape her enjoyment.");
		output("\n\nThough she rocks in ecstasy on top of you with all the weight of her first meal, your latest climax dwarfs even that body-bloating banquet. The speed and volume of your geysering expulsion is like a hose set to full blast, releasing a reservoir of limitless passion into the thick rahn. Her womb stretches with the seemingly endless loads, pussy clenching greedily at the wealth of hot [pc.cum] inside her. Gelatinous body as slick at her rubbery toys, the girl’s abdomen heaves outward, burying your [pc.chest] under its girth and even swelling large enough to pin your arms at your sides.");
		output("\n\nCherry groans in the blissful ache of her engorged glut, the pressure inside her hitting its gurgling peak. " + (pc.hasKnot(x) ? "Even with your [pc.knot " + x + "] tying the two of you together, the endless cascade of body-flooding ejaculate manages to push her free with a suckling plop. ":"") + "In the next moment, Cherry is thrown off of you, launched by your ceaseless eruption like a slime-sputtering cum balloon. The over-inflated girl is propelled backward, sliding across cum-slick rubber and rolling head-over-ass, before finally slapping against the abutting wall. Wobbling from the impact and leaking thick gouts of [pc.cumColor] seed from her climax-dazed body, she seems almost like a life-sized onahole, discarded and pouring out its overfilled load.");
		output("\n\nWith your [pc.cock " + x + "] no longer contained by the bubbled slut, the rest of your copious cream discharges in wild spree. You fill your hands with rubber sheets and buck into the air, your body still throbbing with rahn’s shared heat. Gasping with each release, your [pc.ass] rises and falls, clenching with each long, shuddering spurt. Arcing shafts of [pc.cum] splatter all across the pirate’s quarters, from ceiling to floor, until dripping nut has washed the room in a gooey shellac of your seed.");
		output("\n\nWhen you catch your breath and take stock of your surroundings, a ");
		if(pc.libido() < 33) output("flush of embarrassment heats your face");
		else if(pc.libido() < 66) output("moment of startled awe settles over you");
		else output("giggle of light-headed pride bubbles up");
		output(" at the sheer scale of the mess you’ve made. With her quarters drenched and the pirate herself swooning amid your oceanic discharge, you decide it would probably be best to take your leave.");
		output("\n\nGathering your [pc.gear] and heading for the Tap-Hall, you wonder if you should send Molli in to help clean up. You decide to let Cherry handle the mess herself. With a gut that big, she won’t be going anywhere for awhile and it might be best if she had something to keep her busy. Or just a meal for later.");
		//[End]
		//boot player to Tap-Hall,
		//reset Cherry’s 24 hour cumflated tag
		//player gains cum-soaked
		//return Cherry to Tap-Hall after 4 hours
		processTime(35);
		feedCherry(cumQ);
		new Cherry().loadInCunt(pc,0);
		pc.orgasm();
		pc.applyCumSoaked();
	}
	sendCherryToHerRoom();
	clearMenu();
	addButton(0,"Next",leaveCherrysPlace);
}
	

//[Feed Bubble]
//mouseover: The gel girl’s usually got room for a bubble or two.
//only available once per visit and only if Cherry is not cumflated
//the scene that plays is linked to which type of Bubble the player gave her to access her quarters
//this option is not available if the player enters Cherry’s Quarters through any means other than by giving her a bubble in the Tap-Hall

public function feedCherryABubble():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	// {Medium}
	// pc gave Cherry a Medium Bubble to get in
	if(flags["CHERRY_LAST_BUBBLE_GIFT"] == 1)
	{
		flags["CHERRY_LAST_BUBBLE_GIFT"] = undefined;
		output("Reaching over to Cherry’s discarded belt, you hoist the bubble-filled loop and give it an appraising look. <i>“Seems like you should really stop playing with your food and eat what’s on your plate,”</i> you scold.");
		output("\n\n<i>“I prefer to savor the flavors.”</i> She crossing her arms under her breasts. <i>“Besides those are barely a snack each.”</i>");
		output("\n\n<i>“Aren’t you a greedy girl,”</i> you chide, plucking a warm latex ball from its harnesses.");
		output("\n\nCherry leans forward, her ponytail swishing back and forth on the bed. <i>“It’s in my nature to want more than I’m given,”</i> she notes, buoyantly. <i>“Practically the space pirate’s code.”</i>");
		output("\n\n" + (pc.tallness > 5*12 ? "Stooping down, you bring yourself face to face with the spoiled slime. ":"") + "Rolling the two inch sphere between your fingers, you consider the brightly colored, ");
		//player hasn’t given Cherry any S. Bubbles:
		if(flags["CHERRY_SMALL_BUBS"] == undefined) output("anonymous");
		else output("violet");
		output(" condom. Holding it between your forefinger and thumb, you raise the small balloon to the wine-hued woman. <i>“Open wide.”</i>");

		output("\n\nLips like wet obsidian part and she extends a rose-red tongue patiently. No sooner do you place the rubber on her moist dias, but her tongue curls around it and pulls the ball into her mouth. You tut before she can swallow and hold a commanding finger up. <i>“No swallowing till I say so.”</i>");

		output("\n\nAmused by the rule, the rahn compiles, swishing the sphere from cheek to cheek, gnawing at it impatiently while you pluck another small bubble from her belt. This time, you place it directly against her pucker and push gently. By gradual degrees, her mouth opens wider and wider, the golf ball sized prophylactic sliding past the cushioned brim of her kisser. Joining the first, the two small bubbles give the rahn’s face a plumper look, her lips drawn to an ‘O’ by the balls in her mouth.");
		output("\n\nThe next one you hold between your fore and middle finger, with your arm extended. Cherry leans toward to the next treat, arms bracing her tripod body. She presses a black-lipped smooch on the cum bubble and sucks in air at the same time. The bubble is drawn from your fingers by the suction of her mouth and slurped into the goo’s increasingly crowded maw.");
		output("\n\nHer attitude of cool poise is somewhat undercut by the escalating silliness of her expression as you plop a half-dozen squishy orbs in her mouth. Cheeks bloated past human proportions and lips no longer able to close, she looks downright ridiculous. The ruby beads forming on her brow, however, suggest she’s feeling the stimulating heat of the individually packaged loads far more than any embarrassment.");
		output("\n\n<i>“Hrm, it seems like we’ve run out of room up here,”</i> you muse, looking at the half-empty belt with a shrug. <i>“Any idea where we could put the rest of these bubbles?”</i> While she gurgles and tries unsuccessfully to answer through a mouthful of rubbers, you grab for a spare pair of waterproof gloves on her bedside table. Putting them on and pulling the cuffs until they’re snug around your hands, you turn back.");
		output("\n\n<i>“Don’t you know better than to speak with your mouth full?”</i> You wave a scolding finger back and forth in front of her. Placing the same finger on her forehead, you give the light-headed girl a little push. The rahn topples onto her back, the stubby half-thighs that comprise all she has for real legs wiggling uselessly.");
		output("\n\nYou run your gloved hands down her thighs and across her semi-firm abdomen before perching both thumbs on the fat lips of her labia. <i>“Ah, that’ll do.”</i> You give her puss an appreciative plap with your palm before turning back to the condom belt. Cherry, cheeks stuffed like a squirrel, peaks up over the blockade of her hefty chest, looking more and more flushed with every passing minute.");
		processTime(5);
		pc.lust(8);
		clearMenu();
		addButton(0,"Next",feedCherryMediumBubs2);
	}
	// {Large}
	// pc gave Cherry a Large Bubble to get in
	else if(flags["CHERRY_LAST_BUBBLE_GIFT"] == 2)
	{
		flags["CHERRY_LAST_BUBBLE_GIFT"] = undefined;
		output("You take the large cum bubble back from her and hoist the bowling ball-sized orb suggestively. <i>“Any idea what we could do with this?”</i>");
		output("\n\nThe tips of Cherry’s ears flush burgundy, but she arches an eyebrow and puts her fists on her hips. <i>“Well, it’s certainly not going to fit with my collar on, if that’s what you’re thinking.”</i>");
		output("\n\n<i>“Don’t worry, it’s not.”</i> Squeezing the bubble in the middle with both hands, you squish it into a vaguely phallic shape, like a wobbly cylinder. You tilt your head to one side to admire the gel girl’s bubbly backside.");
		output("\n\nThis time, both eyebrows go up as she laughs at the implication. <i>“Uh... I thought we were doing something for you?”</i>");
		output("\n\nOh, you’ll enjoy it plenty, you assure her as you grab a spare pair of her waterproof gloves from the bedside table.");
		output("\n\nCherry optimistically lowers herself onto her back, spreading her stubby upper thighs. Between the rounded boles of the rahn’s legless lower body lies one of the plumpest pussies you’ve ever seen, glistening with passionate polish. Her vulva is so thick, it almost seems like her lower lips are joined down the middle. The gel girl’s ponytail curls around her hips, the tip thumbing at her fat twat in preparation for the latex-bound liquid load. <i>“Ready when you are.”</i>");
		output("\n\nYou give the offer a moment of thought before reaching down, cupping one of her ass cheeks, and flipping the goo onto her front. She slaps against the bed’s rubber sheets and sends a ripple through its fluid-filled mattress. Glancing over her shoulder, she traces your line of sight straight to her rotund, wobbling ass. <i>“You can’t be serious.”</i>");
		if(silly) output("\n\n<i>“This is kinda your fault for having an asshole to begin with. What do goos even need one of these for?”</i>\n\nCherry shrugs. <i>“We don’t, I just felt like that’s where one belonged.”</i>");
		output("\n\nDepositing the head-sized condom on the small of her back, you reach down and grasp the amorph’s rump with both hands. Like the rest of her body, the rahn’s dermis is exceedingly soft and slick from her paralytic sweat. With the benefit of her gloves, however, you’re able squeeze her cheeks until they bulge up between your fingers and roll the globular orbs in wide circles. You lower one hand to let your thumb flit between her pussy lips while the other takes an open-handed slap across the slime’s sweet cakes. The impact claps her ass cheeks together, gelatinous body retaining the swaying force of the stroke, clapping again on the return quake.");
		output("\n\nThe Tap-Hall’s owner starts squirming under your enthusiastic rump appreciation. She grabs her ponytail and bites down on the tip of the gooey appendage, jutting her ass a bit higher as you lay into her again. Before long, Cherry’s already prodigious posterior is swollen pink with your treatment, her pussy suckling at your thumb like it were a second mouth. When you pull your hand free, the digit is practically dripping with the girl’s warm fluids. You move the lubricant to her diminutive pucker and begin polishing the idle sphincter to a glossy finish.");
		output("\n\nCherry’s breathing gets a bit faster, her shoulders rolling with anxious tension. <i>“You’re going to want to relax,”</i> you caution, sliding your thumb into her asshole without any additional warning. Even without legs, she very nearly jumps right out of bed, her ponytail trying to whip around to strike you. Luckily, her polished black lips have a firm grasp on tentacle-limb’s tip. You ");
		if(pc.isNice()) output("shush and soothe her, running your free hand down her hips");
		else if(pc.isMischievous()) output("tease and tweak her, filling your free hand with her jelly love handles");
		else output("punish the outburst with your free hand, spanking her again and again until your palm throbs");
		output(", the girl plaintively mewling as you press your digit in to the second knuckle. Slowly, you pull back and push in, gradually acclimating her to the sensation.");
		output("\n\nWhen you pull both hands away to take hold of the hefty, melon-sized bubble, the garnet-hued girl’s breathing has steadied. Despite her outward calm, Cherry’s sticky excitement has leaked into a small but growing puddle between her thighs. Scooping up a handful, you pour the warm girl-cum across the bubble’s rubber surface and into the vale of her ass cleavage. Using both hands to squeeze the condom into a bulging, phallic shape, you lower the fat pole and level it with the zel’rahn’s lust-lacquered hindquarters.");
		processTime(5);
		pc.lust(8);
		clearMenu();
		addButton(0,"Next",feedCherryALargeBubble2);
	}
	// {Huge}
	// pc gave Cherry a Huge Bubble to get in
	// Not available on the first Huge Bubble - she keeps it as a pillow/trophy
	else if(flags["CHERRY_LAST_BUBBLE_GIFT"] == 3)
	{
		flags["CHERRY_LAST_BUBBLE_GIFT"] = undefined;
		IncrementFlag("CHERRY_HUGE_BUBS_FED");
		//first time
		if(flags["CHERRY_HUGE_BUBS_FED"] == 1)
		{
			output("<i>“So, what exactly where you planning on doing with that,”</i> you inquire, giving her latest, torso-sized bubble a poke.");
			output("\n\n<i>“I suppose I only really need the first one you gave me for my collection,”</i> she admits, defensively. <i>“But there’s no way this thing is going inside me in one piece. There’s only so much pressure these things can take!”</i>");
			output("\n\nIt’s unclear if she’s talking about the prophylactic or her own body.");
			output("\n\n<i>“You know,”</i> she muses, looking at her shelf of collectable Bubble Buddies,”</i> I did get that proto-type Bubble Spout a little while back. Never tried it on something this big, though.”</i>");
			output("\n\nYou follow her gaze and pull what appears to be cylindrical dildo from among the wobbling, collector’s onaholes. The devices is a factory-grey with a number of joint markings around its base and a thumb-thick metal rod sticking out of the backside. The rod has a sharpened tip and hollow interior, like a ludicrously thick syringe. In any other context, such a device would seem outright sinister, but among the condom-obsessed gel girl’s collection, its intent becomes clearer.");
			output("\n\n<i>“Let me guess: stick the pointy end in a bubble and the spunk comes out the other end?”</i> you hazard, waving the dong-like shaft in the direction of your rubber-bound largess.");
			output("\n\n<i>“That’s the idea, anyway.”</i> She shrugs. <i>“It’s just a prototype, though. Generously donated by a TamaniCorp scientist after the Cyberpunks dropped in on her transport ship.”</i>");
			output("\n\n<i>“Wouldn’t the needle pop the bubble?”</i>");
			output("\n\n<i>“You’d think! I dunno what they made it from, but it slides right into the latex and seals the hole around it. When it comes to cum, that Tamani really knows her stuff,”</i> Cherry insists, unable to hide the breathless hero-worship from her voice. You’re not sure if it’s ironic or appropriate that a pirate would idolize the megacorp CEO.");
			output("\n\n<i>“Anyway, I tried it on some mid-sized bubbles and it worked pretty well. Good for when you’ve got all day and nobody to share it with,”</i> she adds with an arched eyebrow. <i>“But this guy,”</i> she jiggles the giant condom with both hands, <i>“that’s anybody’s guess. Worth a try, though!”</i>");
		}
		//repeat
		else
		{
			output("As you retrieve the stolen Bubble-Tap from Cherry’s TamaniCorp collectables shelf, the rahn folds her arms under he breasts gamely. <i>“You know, it’s a good thing I don’t have cameras in here. Getting fed like this would absolutely ruin my reputation. We amorphs are already thought of as being cum-obsessed sluts.”</i>");
			output("\n\nYou head back to her bed with the spout and simply gesture at the gigantic spunk-sack by her side.");
			output("\n\n<i>“Okay, sure, but they don’t need MORE evidence,”</i> she maintains, blushing as her ponytail curls possessively around your gargantuan cum cache.");
		}
		//merge
		output("\n\nCarefully, the two of you insert the Bubble-tap into the huge condom. Sliding the slender tube embedded in device’s base through the rubbery bubble, both of you brace for a [pc.cumVisc] explosion. Luckily, the needle’s peculiar alloy breaches the orb without as much as a squeak of protest. Once the backside lies flush with the prophylactic, the surrounding latex thickens around the needle holding the spigot in place.");
		output("\n\nThe jointed base of the plasticy dildo expands outward, inflating like a small knot. Cherry gives it a slight squeeze and a dribble of [pc.cumGem] goo oozes from the rounded tip like eager pre-cum. Both of you relax, the crimson girl letting out an anxious laugh. <i>“Thought I was going to have to put Molli on full-time bedroom cleaning duty for a second there,”</i> she grins, bouncing the bubble in her cradling embrace. <i>“So: how do we get this in me?”</i>");
		processTime(10);
		pc.lust(8);
		clearMenu();
		if(pc.physique() >= 20) addButton(0,"Keg Stand",cherrykegStandLetsGOOOOOO,undefined,"Keg Stand","Hold Cherry over the bubble and have her drink right from the tap.");
		else addDisabledButton(0,"Keg Stand","Keg Stand","You aren’t strong enough to hold her up for this.");
		addButton(1,"Ass Pound",cherryAssPoundInflationGOOOO,undefined,"Ass Pound","Jam the tap into Cherry’s booty and thrust the packaged cum into her.");
	}
}

public function feedCherryMediumBubs2():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	output("Pulling the rest of the small condoms from the belt, you deposit them atop the ruby rahn’s taut tummy. She shivers in lust-smothered anticipation, her shaking sending a few of the glossy spheres rolling down her waist and off of her hips. You round up the stray bubbles, warm latex squeaking as you roll them across the girl’s plush gel skin. Cherry spreads her squat, rounded upper thighs, lowering her head in rubber-gorged, drooling approval. She restlessly rubs the featureless mounds of her wobbling E-cups, noisily squishing and slurping at the half-dozen cum balls filling her gob.");
	output("\n\nStarting with the smallest of the warm bubbles, you drag the pouch of liquid passion down the rahn’s abdomen and through the plush, pliable humps of her shamelessly fat pussy. As you part the thick lower lips, you take a moment to twist the spunk sphere against the crimson girl’s rubicund clit. Her long ponytail slaps the rubber bedding in response, sending waves through the waterbed’s surface. Taking that reaction as a measure of approval, you tracing the supple sphere in in circles, polishing the reclined girl’s firm pearl with the heated latex until Cherry’s back arches, wholly un-ladylike gurgling drifting up from her tit-obscured face. Her ponytail gathers up a section of the sheets, clenching as tightly as a fist.");
	output("\n\nWhile she’s in the throes of swaying bliss, you scoot the bubble just a bit further down and thumb it easily into the gushing wetness of the goo girl’s slippery slit. You take two more, one in each hand, and scoot them across what little she’s got for upper thighs, squashing the elastic sacs against her semi-firm gelain. She kicks futility at the tickling sensation, adding to the ripples in her liquid-filled ‘mattress.’ Gently positioning one of the condoms in the embrace of her chubby puss, you place a palm against the ball and push against the girl’s loins until a wet ‘plop!’ tells you the bubble has found its way home.");
	output("\n\nAll it takes is setting a third orb against the cushions of Cherry’s cunny to get the girl shaking with fresh rapture. The rahn bucks at the vulgar warmth between her hips, as if to help you feed the cum bubbles into her faster. With one hand against her swelling midsection and the other plucking scattered balls from the bed, you push one filled condom after another into her already-stuffed sweetness. The hand on her midsection rises with each addition, the girl’s jelly belly growing from the sheer surfeit of spunk-filled sacs.");
	output("\n\n<i>“Well, just one left,”</i> you remark, pulling the largest, fist-sized bubble off the center of Cherry’s belt. ");
	if(pc.isNice()) output("<i>“You’re doing great! Hold on just a little longer.”</i>");
	else if(pc.isMischievous()) output("<i>“This one’s a doozy! Grab onto something and brace for impact.”</i>");
	else output("<i>“Seems like you’re pretty stuffed already. Don’t worry, I’ll make it fit.”</i>");
	output(" Over the cherry-red mountain range of the rahn’s heaving tits, you can just barely make out the impatient nodding of her hard-blushing cheeks. Her ponytail coils around one of her breasts and then the other, as if trying to find something firm to take hold of in preparation.");
	output("\n\nUsing both hands, you hoist the bulk of the final, ballooned condom up against the gelatinous girl’s nexus. Her stubby thighs squeeze the package impatiently, but offer no resistance as you slide the rounded peak into the clenching embrace of her latex-gorged depths. The bubbles squeak in protest as Cherry tightens against the weighty, cream-stuffed rubber. Using the biggest gift to push the smaller ones deeper doesn’t make much headway into the girl’s packed puss at first. Using both hands to give the straining ball a shove, you can just about make out a wet gulp over the squeaks of straining latex as one of the small condoms slips past the goo’s permissive cervix and into her womb. You give another prod and several more squelch their way into her deepest recess, rubber-wrapped cum globs forced all the way into her core.");
	output("\n\nBy the time you’ve managed to fit the biggest condom inside her, the gut bulge has moved so far upward that the gel girl has the appearance of early pregnancy. You pat the shallow, latex-ballooned stomach and reach around to help raise the girl back to a sitting position. At some point, she seems to have lost all traces of her former demeanour, her expression overwrought and desperate, virtually vibrating in womb-stuffed ecstasy. Using the back of your gloved hand, you gently stroke one of her bulging cheeks and run an appreciative thumb over her feverishly dripping brow.");
	output("\n\n");
	if(pc.isNice()) output("<i>“That’s everything! You’ve earned this.”</i>");
	else if(pc.isMischievous()) output("<i>“Good girl. You get a treat!”</i>");
	else output("<i>“What an obedient slut.”</i>");
	output(" Cupping your hand under her chin, you lift slightly and say the word she’s been ravenously waiting for: <i>“Swallow.”</i>");
	output("\n\nWith palpable relief, Cherry tilts her head back and begins gulping down her long delayed meal. One by one, the semi-firm, golf ball-sized lumps in her cheeks slide down her throat, squeak past her collar, and vanish into her stomach. The pirate’s mouth gradually empties until, at last, she’s guzzled every last condom. With a loud, hot gasp, she fills her mouth with fresh air. Her tongue licks its way around the perimeter of her black lips before the rahn holds her maw wide open to show that she’s swallowed everything you’ve given her. She wears a look of fatigued, manic pride at the debasing accomplishment, as satisfied in her feat as in your feast.");
	output("\n\nWith all the excess weight in her midsection, Cherry’s ponytail has to make itself into a kickstand, supporting her woozy attempts at remaining upright. <i>“That... that’s not half bad,”</i> she pants, rubbing her filled belly. <i>“Of course, now I’ve got nothing to wear in the Tap-Hall. Guess I’ll have to slut around for more.”</i>");
	output("\n\nNot a bad problem to have, as far as you’re concerned.");
	feedCherry(10000);
	//return to Cherry’s menu
	//set Cherry to Cumflated for 24 hours
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function feedCherryALargeBubble2():void
{
	clearOutput();
	showCherry(true);
	author("Fenoxo");
	output("Despite its fluid contents, the makeshift dildo is firm enough for you to force its well-lubed tip past the girl’s narrow rectum. She gasps, both hands grabbing at the bedding. You slide an inch of the tension-lengthened condom into her ass, its trapped heat radiating even through your thick gloves. Cherry’s hands tighten to fists and she buries her face in the rubber sheets, jutting her ass up as high as her thick trunks allow.");
	output("\n\nUsing one hand to keep the bubble thin, you spoon up the girl’s gushing juice and pour it onto her reluctantly dilating rear until she gleams with a mirror shine. Latex squeaking in protest at every inch, you gradually manage to feed half a foot of the pressure-narrowed prophylactic into her before the rahn’s anal-orgasm hits. Cherry shudders like a one-woman earthquake, bliss rippling through her with tidal insistence. She gasps, releasing the breath she’d been holding and struggles to take another one. Her fingers spread wide for a trembling moment only to tighten again, hard enough to make her gloves creak. Her back arches to an angle that would be impossible if she had a spine and for a moment you’re worried that she’ll clench hard enough to pop the bubble in her ass.");
	output("\n\nWisely, you step back a moment before her ponytail whips around. Rather than trying to strike you or to pull the bubble free, the ruby appendage gives a sound stroke to her wobbling caboose. The slap is so loud you ");
	if(pc.isNice()) output("wince in sympathetic pain,");
	else if(pc.isMischievous()) output("worry that she’ll pop her own bubble butt,");
	else output("can’t help but grin with approval,");
	output(" her body immobilized in a crystalized moment of rapturous climax. She very nearly vibrates, frozen almost as if her toxic touch had turned against her. Her pleasure paralysis loosens by degrees before she flops back down onto her stomach. Panting and dazed, Cherry seems pretty out of it. Her ponytail, however, wiggles at you in a beckoning motion.");
	output("\n\nNever one to leave a job unfinished, you crack your knuckles and step up once more. Grabbing the miraculously intact cum bubble, you knead the exposed half back into a seed-stuffed tube. The latex whines in taut protest, but you push deeper, unwilling to let even the slightest bit of your gift go unappreciated by the gel girl’s back passage. Through the mostly opaque red of her body, you can only just barely make out the shadow of your hefty condom, like an overly ambitious dildo plunging into virginal depths an inch at a time.");
	output("\n\nAs you near the final stretch of the squished spunk-sac, her body finally relaxes. Cherry opens her mouth, as if to say something, but the rahn’s black lips just curl in a startled O. The bulging, violet peak of your cum bubble is sucked into her suddenly willing body with such force that it very nearly takes one of your gloves off. Eyes unfocused, hands opening and closing at air, only Cherry’s ponytail seems to know what to do. The semi-sentient appendage glides into her rump with aplomb, giving a new meaning to ‘tail hole.’");
	output("\n\nThe gelatinous hair-tentacle pumps her ass shallowly but dutifully. Cherry’s tongue lolling out of her mouth as she tries unsuccessfully to vocalize anything more than gurgling moans. With her perfectly rounded rump rocking in slow, mesmerizing oscillations, you realize there really is only one thing left for you to do. Gathering up the girl’s drooling pussy nectar, with both hands, you rub down your palms, carefully raising one hand up high. Twisting your [pc.hips] and swinging with all your strength, you deliver a final, spanking stroke across the goo girl’s rump loud enough to echo around the room.");
	output("\n\nThe second sound you hear, almost immediately afterwards, is a distinctive latex pop. Cherry’s eyes go wide, her irises crossing as much from the blow as from the unexpected deluge of cum rushing out of the burst bubble. No longer under the pressurized containment of the high tech TamaniCorp condom, gallons of your spunk surge through the rahn’s interior. Her ponytail plug keeps most of the [pc.cumVisc] spunk inside, but a few stray strands spurt in [pc.cumColor] jets across her still-wobbling ass. The flood of your goo reaches her stomach and fills out her gut with enough to leave her belly squishing out from her sides like one of her torso-sized condom pillows.");
	output("\n\nWhen you flip the pirate onto her back, her tummy jiggles nearly as much as her jelly-firm breasts. She looks like she’s in the late stages of pregnancy. It takes a minute for her to recover herself and a minute further to extract her anal-loving ponytail from her hindquarters. <i>“Not... not the easiest way to get a meal,”</i> she pants, stroking her bloated belly. <i>“But I can’t complain about the portions.”</i>");
	processTime(20);
	pc.lust(50);
	feedCherry(10000);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Keg Stand]
//mouse over: Hold Cherry over the bubble and have her drink right from the tap.
//requires minimum str of 20
public function cherrykegStandLetsGOOOOOO():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	output("You explain your plan to Cherry, who listens with the patience of a stone. <i>“That’s idiotic,”</i> she points out. <i>“I love it. Grab some gloves and let’s do this.”</i>");
	output("\n\nAs you pull on a pair of waterproof mitts, the zel’rahn hauls her desk chair to her bedside with her exceedingly long ponytail. Locking the wheels, she hefts the torso-sized cum bubble into the seat, spigot up. The condom is just about as large as she is, you muse as the ambitious girl pulls off her visor and grabs hold of the armrests.");
	output("\n\n<i>“Let’s bury this treasure,”</i> she cheers with cum-hungry enthusiasm. Wrapping your fingers around the half-sized gel’s stumpy trunks, you bend and rise, hauling her into the air, ass-first. Digits sinking into the scarlet alien’s plump thighs, you do your best to maintain the grip as she flexes her slender arms against the chair’s handles. Her titanic tits bap against her chin, the impact almost knocking her over, but her tentacle-like ponytail grabs the back of the chair to steady the pirate’s top-heavy frame.");
	output("\n\nBetween the two of you, the gooey girl reaches an equilibrium, hoisted upside down over the magnificent, violet-sealed banquet. Slowly, she lowers herself face-first onto the smooth, cock-like nozzle. Lips wrapping around the ashen plastic, Cherry tilts her jaw forward to open her throat as she swallows the dildo down to its cumflated, knotted base. Gulping hard, she spreads her mouth as wide as she can and slips the knot fully into her maw, the peak of the shaft bulging all the way to the middle of her throat.");
	output("\n\nKeeping your gloved grip steady, you watch the rosey rahn rock atop the jiggling seed sack as the first taste of your bubble-fresh cum spurts up, into her esophagus. One of Cherry’s arms goes weak for a moment and you have to move to keep her upright, but she recovers quickly enough. With slow, almost nursing motions, she squeezes the knot of the Bubble-Tap, sending a few pints of nut into her thirsty frame. Her body’s internal suction pulls the cream straight up to her stomach, where a very slight paunch begins to form.");
	output("\n\nFor most, this meal would be plenty, but with the mass of your humongous cum bubble barely diminished, Cherry soldiers on, one swallow at a time. With her legless thighs right at head level, you have an ample view of the goo’s puffy pussy. If not for the girl’s paralytic, you’d be tempted to bury your face in the lust-glistening muff. Teased by the toxic lips, you content yourself to squeezing her pudgy loins with your stroking digits.");
	output("\n\nYour massaging grip does not go unnoticed. Cherry wiggles in your grip, losing her focus and gargling on the spigot. Unsuckled, the load she was swallowing gushes right back down her throat and pours into her cheeks. The knot at her lips keeps more than a few dribbling drops from leaking out, but she shoots you an sharp glance past the obscuring bulk of her breasts. She’d almost look angry if it weren’t for the dark burgundy blush covering most of her face and the drooling line of [pc.cumColor] trickling down her forehead.");
	output("\n\nDespite the reprimand, you keep up your kneading rub-down and note with some satisfaction that her gulps grow deeper and faster. Shameless, obscene swallowing noises gurgle from the seed-stuffed slime as her stomach keeps expanding. The girl’s narrow waist and slender abdomen are engulfed by the liquid weight of her ballooning torso. Her guzzling pace begins to visibly shrink the torso-sized condom, its oceanic abundance drawn ever upward into the greedy gel’s gullet.");
	processTime(10);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",cherrykegStandLetsGOOOOOO2);
}

public function cherrykegStandLetsGOOOOOO2():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	output("By the time the bubble has been reduced to half its original size, Cherry’s belly has bloated to the size of her porn-star tits. The fattening pirate becomes increasingly difficult to hold, even with her three-limbed assistance. Her breathless, chugging pace and full-bodied gulps send ripples through the whole of her gelatinous form. The pirate’s pussy is swollen with defenseless titillation from your incidental caressing. Her juices flow unchecked through her nether lips, washing her expanding midsection and wobbling bosom with a glossy pink glaze. Even the small, pursed ring of her asshole squishes with delighted satiation at the gluttonous overindulgence.");
	output("\n\nWith her distended gut nearly triple its original size, Cherry’s swallows begin to slow and you can’t help but wonder if she’ll be able to polish off the whole thing. By now, she’s at least a third cum by volume The trembles radiating up and down her swollen figure suggest she’s slipped into the oblivious throes of cum-drunk bliss. She’ll need some help to polish off the last few gallons! Luckily you’ve got just the solution.");
	output("\n\nWith both hands tightly gripping the rahn’s hips, you hoist her a few inches higher before letting her drop, face-first, directly onto the diminishing latex cushion. Unprepared for the short distance piledriver, Cherry’s grip on the chair’s armrests slips and her she squishes into the bubble with all her weight. Her mouth tightening from the drop, she reflexively squeezes down on the knotted plug of the spigot, opening it as wide as it can go.");
	output("\n\nWith her body compressing the bubble and the plastic tap firmly locked in her throat, the remaining cum is forced upward in a gushing, geyser of spunk. Her already well-stretched belly surges outward, bloated to blimp-like girth, putting even the gel girl’s body to its limits. You keep your grip on her stumpy thighs so that she remains upside down, but she’s given up trying to lift herself off of the violet rubber, instead holding the titanic circumference of her stomach, every inch of her body tensed with the vibrating rapture of orgasmic overindulgence.");
	output("\n\nThe sheer pressure of the gooey profusion forces your seed through every inch of her inner passages until, at last, it has nowhere else to go. Cherry’s diminutive trunks wiggle in your hands and her narrow anus bulges up, dilating as a rushing font of your jizz cascades from her backside. The [pc.cumColor] goo arcs up like a perverse fountain, splashing down and coating the ruby zel’rahn - along with your upper arms, her chair, and a sizable section of her floor - in [pc.cumGem].");
	output("\n\nWhen your luxuriant excess has finally run its course and Cherry is as saturated inside as out with your creamy plenty, you haul her off the chair and back onto her bed with a grunt of effort. Even with a rahn’s exceedingly efficient digestion working overtime, Cherry’s cum-inflated figure is the stuff of fertility idols. Belly bloated to inhuman girth, it almost looks like she’s heavy enough to pop her waterbed. You pull the now knotless dildo from her mouth, a thick profusion of [pc.cum] spilling past her stuffed cheeks and flooding her cleavage.");
	output("\n\nEyes rolled up in the back of her head, fingers twitching irregularly, Cherry is utterly incoherent. Even her normally playful ponytail just hangs limply on the rubber bedding. She’s going to need some time to recover, if you wanted to excuse yourself.");
	processTime(15);
	pc.lust(30);
	clearMenu();
	addButton(0,"Stay",stayForCummyGoos);
	addButton(1,"Leave",leaveCherryAfterSheKegStandsAHugeLineOfCum);
}

//[Ass Pound]
//mouseover: Jam the tap into Cherry’s booty and thrust the packaged cum into her.
public function cherryAssPoundInflationGOOOO():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	output("You’ve got a good idea of which hole you’d like to see get a little more loving and your suggestively raised eyebrow is all the hint Cherry needs. Giving a little huff of exasperation, she shuffles around on the bed, turning around and laying down on her bed, ass-up. Looking back over her shoulder, the red rahn can’t quite keep the anxious tension from her face. <i>“Just... take it slow, okay?”</i>");
	output("\n\nYour attention, however, is fixed firmly on the almost perfectly spherical cheeks facing you. Slick with her native body oil, the girl’s bubble butt has a mirror shine that reflects your appreciative expression along with the entire room behind you. Sculpted by her alien biology, the globes seem as untouched by gravity as her equally tremendous breasts. Making sure you’ve got on a pair of Cherry’s waterproof gloves, you reach down to lightly stroke the curvaceous peak of her rump. The gel girl might not have any legs, but with an ass like that, who needs em?");
	output("\n\n<i>“Yeah yeah, the gel girl’s got a fat ass,”</i> she mutters as you caress her pliant humps. <i>“Come on, I’m starving here. Don’t make me beg.”</i> Her ponytail flits restlessly along the small of her back, its tip gentle rocking in and out of her ass cleavage.");
	output("\n\nYour attention momentarily distracted from the hypnotic sway of Cherry’s derriere, you grab hold of her hips and drag her back to the edge of the bed until the shallow trunks of her thighs hang over the side. Retrieving the dildo-equipped bubble with both arms, you gather up the beach ball-sized bulk and take a knee. Rolling the massive, violet orb up to the pirate girl’s backside, you guide the prototype bubble-tap’s rounded peak up to her diminutive pucker.");
	output("\n\n<i>“You’re going to lube that thing up, right?”</i> she asks, craning her head to try to see what’s happening behind her. The mountain peaks of her considerable booty blocks your maneuvers from view, however, leaving the girl guessing as to what comes next.");
	output("\n\nPlacing the cool tip of the dildo against the zel’rahn’s ruby ring excites a shiver from the girl, but you hold off on insertion for a moment longer. Taking the segmented knot of the spigot in one hand, you give it a little squeeze. The plug unseals enough to spurt a thin line of [pc.cumColor] goo across Cherry’s ass, the spunk as warm and fresh as the moment you put it in the high tech latex. The condom wobbles at the slight release, so you give it another, longer squeeze, spraying a fat rope across the gel’s undercarriage.");
	output("\n\nA third and fourth spurt spread your seed across the pirate’s ass like the spatter of rain before a deluge. Glazed with thick globs of [pc.cumGem] and shivering from the dripping heat coating her bottom, Cherry puffs in exasperation. <i>“Alright, enough lube! Fuck. If you’re going to paint me [pc.cumColor], I’d rather you work inside-out. Just... just jam it in already.”</i> Folding her arms under her breasts, the rahn wiggles in place, arching her back to present herself.");
	output("\n\nThe booty wants what it wants and who are you to deny so pressing a need? Pushing the smooth, slender peg against the rahn’s narrow pucker, you find far less initial resistance that you would’ve thought. She stifles a moan as you slide the plastic spigot into her nethers all the way up to the knot. You give a helping push, but her asshole remains obstinately taut. Squeezing the base a bit to send some lubrication inside her earns an outright whorish moan from the girl, but does nothing to relax her rump. Though the inflated knob is by no means an impossible girth, the girl’s rarely used asshole simply can’t seem to cash the cheques her stomach is writing.");
	processTime(15);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",cherryAssPoundInflationGOOOO2);
}

public function cherryAssPoundInflationGOOOO2():void
{
	clearOutput();
	showCherry(true);
	author("William");
	output("Rather than push the bulb against her tail hole until she loosens up, you’ve got a better idea. Giving Cherry a warning pat on one of her cheeks, you take hold of the experimental device’s bloated base with both hands and squeeze. The warm seed, pressurized and preserved inside the massive condom, spouts out of the rubber receptacle like a hydrant. Gallons of goo gush into the girl’s gelatinous hindquarters, sending a shocked jolt through her unprepared frame.");
	output("\n\nWith the knot compressed and the pirate stunned, you haul the bubble-tap forward, sliding its base past her spunk-drunk rectum. A backwash of [pc.cumVisc] nut flows out over your gloves as you maneuver the spigot into place, too much cum trying to fill too small a space too quickly. But, as you release your grip and the last inch of the dildo-faucet sinks into Cherry’s ass, the overflow ceases, plugged by the swiftly reinflated knot.");
	output("\n\nThough no longer emptying jizz on full blast, the massive bubble keeps a steady flow pouring into the rahn. The harder her ass squeezes, the more intense the discharge, leading to several minutes of the girl tightening up only to be hit by a geyser of spunk that knocks the opposition right out of her. Panting and twitching under the virile onrush of your fathomless loads, Cherry looks every bit the dutiful cum dump, especially as her midsection swells with the fullness of her anal banquet.");
	output("\n\nLeft to her devices, the rahn’s knotted rump would no doubt suckle at the dildo-tap until your bubble ran dry, but you’d just as soon help her on her way. Moving back behind the monolithic condom, you take hold of the rubbery wrapper with both hands and position your [pc.groin] behind it. Rocking your [pc.hips] slowly at first, you send impact waves through the fluid-filled orb which plap gently across Cherry’s posterior. She clenches at the thrusting contact, pinching the knot and opening the floodgates once more. Your body pressed against the supple condom as it is, you can feel the flowing ejaculate rapidly voiding into the half-sized gel.");
	output("\n\nLatex-bound liquid heat squishes between your fingers and swirls over your palms. The echo of your prior passion gushing across your loins ignites a fresh feeling of excitement inside you. You knead and squash the colossal cum-sack, humping against it as if to drive the spunk into Cherry all the faster. And much to your pleasure, the girl on the receiving end of the thumping, rubber-slapping impacts fills before your eyes.");
	output("\n\nGut ballooned with gallons of [pc.cum], the rahn’s body sinks deeper and deeper into her waterbed. Packing on pounds by the minute, her waist expands until it just about swallows her hips. Cum-fattening girth pours into her gelatin belly, deforming outwards under her weight. Orgasmic tremors ripple through the pirate’s rosey red rump and travel through the swaying condom between the two of you.");
	output("\n\nBy the time your dry-humping reaches a fever pitch, the violet preservative pouch has shrunken to the size of a watermelon. Cherry, on the other hand, has more than doubled in circumference. With a spunk-stuffed stomach that jiggles and wobbles helplessly with your bumping blows, it appears very much as if she herself has taken the place of the cum Bubble you started with. Even her ass looks thicker from the sheer volume of her meal, haunches swollen with vigorous use.");
	output("\n\nUnable to master yourself enough for proper caution around the paralyzing goo girl, you take what little remains of the prophylactic orb and slam your hips into it. Thrust by thrust, the last few gallons spurt into the pirate’s helplessly cumflated body. Full to the absolute limit of her alien elasticity, however, Cherry has nowhere left to store your bounty. Her throat bulges out, straining against her collar. Her cheeks puff, the gluttonous goo laboring to keep your gratuitous seed inside her mouth. Ebony lips puckered, the girl’s pupils contract with inebriated effort, but she stems the tide for only a moment.");
	output("\n\nYour next thrust sends one wave of surplus semen too many into the satiated slime. A gout of jizz spills past her lips in a [pc.cumColor] fountain that splatters against her her rubber bedsheets. You fuck the condom’s load into her again, drawing an alarmed gulp. She swallows as hard as she can but yet another surge of seed bloats the pirate’s cheeks before spurting past her dripping pucker. She tries to speak, but every word is smothered by fresh nut spilling through her throat and across her tongue, so eventually Cherry gives up. Mouth hanging open shamelessly, the rahn unspools her long tongue to limply drape across her chin, like rolling out the red carpet. Each subsequent buffeting push sends more cream spilling out of her, curtains of [pc.cumVisc] goo running down her neck and washing over her breasts like a warm lacquer.");
	output("\n\nWhen the bubble is finally empty, the prototype tap’s base deflates, allowing you to pull the device free. Replace it on her shelf amid pool of your mutual fluids, you turn back to find the zel’rahn girl completely passed out, face-down in the pool of your excess. Swollen past imagining and with your spunk drooling from both ends, you cannot imagine she’ll be digesting all that any time soon. If you like, though, you could stay here till she wakes up.");
	processTime(20);
	pc.lust(30);
	clearMenu();
	addButton(0,"Stay",stayForCummyGoos);
	addButton(1,"Leave",leaveCherryAfterSheKegStandsAHugeLineOfCum);
}

//[Stay]
//advance time by 4 hours
public function stayForCummyGoos():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	output("You amuse yourself by browsing the surveillance setup Cherry installed in the Tap-Hall. She eventually rouses herself from the cum coma, having digested a tremendous amount of your seed in a surprisingly short amount of time. As testament to your virility, however, her belly is still absurdly ample. Practically spherical, her stomach looks a bit like a red version of the condom you fed her!");
	output("\n\n<i>“That was... filling,”</i> she huffs, rubbing her forehead and trying to keep herself from rolling off the bowed waterbed. <i>“A girl could get used to this kind of pampering.”</i>");
	output("\n\n");
	if(pc.isNice()) output("You assure her that it was your pleasure. A gel in need is a friend indeed!");
	else if(pc.isMischievous()) output("You assure her that you’ve got plenty where that came from. And your tap is even more fun to use than the TamaniCorp one.");
	else output("You assure her that she got a promising career as a professional cum dump if the pirating thing doesn’t work out.");

	output("\n\nCherry inspects her cumflated body, giving herself a fluid jiggle. <i>“Well, I’m pretty much ruined for the rest of the day,”</i> she laughs. <i>“All this added mass dilutes my toxin to little more than an exciting tingle. On the plus side, that means you and I can get a little more... intimate.”</i>");
	output("\n\nShe bats her eyes at you and pats her belly. This girl just can’t get enough!");
	processTime(4*60);
	feedCherry(70000);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
//change Cherry’s status to Cumflated for 24 hours, return to Tap-Hall
//when the player leaves Cherry’s Quarters, replace the [Cherry] option from the Tap-Hall for [Molli] for 4 hours.
public function leaveCherryAfterSheKegStandsAHugeLineOfCum():void
{
	feedCherry(70000);
	sendCherryToHerRoom();
	leaveCherrysPlace();
}

//[Blow Bubble]
//mouseover: Use a Bubble Buddy and feed Cherry right from the tap.
//non-taur
public function cherryBlowBubbleScene():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	
	var x:int = pc.biggestCockIndex();
	
	output("The zel’rahn’s liquid black smile is just too inviting to leave untouched. Catching the intent of your lean-in, Cherry inclines toward you, sanguine eyes steadily meeting your gaze. ");
	if(cherryCumflated()) output("<i>“You know, it seems a shame that you make those bubbles all by yourself,”</i> she muses, taking your hand in hers and squeezing your fingertips up against the plump cushion of her lower lip.");
	else output("<i>“You know, my mouth is the least dangerous part of my body,”</i> she remarks mildly, taking one of your arms in her gloved hands and guiding your fingertips to the plump cushion of her lower lip.");
	output(" She caresses your digits with her coal-dark lacquer before reclining back slightly, a come-hither look on her face.");
	output("\n\n<i>“You still have your Bubble Buddy, right?”</i> the gel girl inquires, playfully rolling her thick, glossy pucker over your forefinger and thumb. ");
	if(!checkToyDrawer(BubbleBuddy)) output("<i>“No? Good thing I’ve got plenty to spare,”</i> she laughs, motioning you to grab one from her shelf.");
	else output("You produce the wobbly, latex-like toy from your pack, earning an approving look from the rahn.");
	if(!cherryCumflated()) output(" She makes sure you’ve put on a pair of her waterproof gloves before going any further. <i>“If you’re going to throat-fuck me, I’d like to make sure you’re not going to freeze up part way through,”</i> she purrs.");

	output("\n\nCherry takes the prophylactic onahole from your grasp and gives it an admiring inspection. <i>“This’ll do nicely.”</i> Opening her mouth in a wide yawn, the gel woman lifts the purple cocksheath to her maw like a bulky, cylindrical sandwich. With an amorph’s ease, she slides the rubbery toy into her mouth, her cheeks puffing with the added bulk. Every last inch of the Bubble Buddy vanishes into her gaped jaw, only its violet rim visible behind the glossy expanse of her hefty lips. Plastic pussy firmly fitted into her ever-hungry grin, the space pirate hooks an inviting finger toward you.");
	output("\n\n");
	if(!cherryCumflated()) output("With a protective layer of rubbery fuck-toy stuffed into her gullet, you should be safe to give the crimson girl a different sort of kiss. The kind with a happy ending.");
	else output("Though her natural anesthesia has been diluted by your wildly excessive spunk, you suppose it’s not unusual for Cherry to want to use a Bubble Buddy. Judging by her collection, she probably jumps at any chance to get a fresh bubble inside her.");
	output(" You approach the bedside and let Cherry lean in closer, her eyelids drooping in half-veiled anticipation. She spreads her palms wide on the bed and manages to close her lips enough to form an ebony pucker.");
	output("\n\nWhen the scarlet girl brushes her raven gloss on your [pc.cockHead " + x + "], she seems almost timid. Her touch is soft, a whisper of playful affection that grows warmer as she sucks ever so slightly against your crest. Tracing a path of increasingly lusty kisses across your peak, you can feel the building weight of her endless thirst. The tip of the girl’s ponytail wags in time with your heartbeat, as if mesmerized by the enticing heat pouring off of your body.");
	output("\n\nThe stiffening of your [pc.cock " + x + "] under her ardent touch is all the invitation the rahn needs to deepen the kiss. She cranes forward, lacquered lips slipping across your [pc.cockHead " + x + "], suckling at each inch you slide into the lubricated interior of the Bubble Buddy. Constrained on every side by Cherry’s mouth, the normally supple latex toy has a fresh and not unwelcome tightness. The purple sleeve has all the clenching tension of a virginal pussy, offering just enough resistance to oblige shallow thrusts on your part, drawing a gurgling gag each time from the goo girl.");

	//if cock is over 5" add:
	if(pc.cocks[x].cLength() > 5)
	{
		output("\n\nHaving filled the length of the Bubble Buddy in short order, your [pc.cock " + x + "] has just about reached the back of your host’s mouth as well. Without hesitation, the shaft-stuffed slut bobs forward. Lifting her chin and craning her neck, she straightens out to let your peak push against the thin barrier of the onahole’s terminus. The flexible latex elongates at your intrusion, spreading thin across your [pc.cock " + x + "]. A condom-like second skin stretches over your tip while the girl’s tongue dances across the length of your bulging cumvein. The thinner the toy gets, the more you can feel every suckling muscle of the gel’s the dimpled smirk. She greedily crawls forward, bringing her lips ever closer to your pillar’s foundation.");
	}
	//if cock is over 10”</i> ALSO add:
	if(pc.cocks[x].cLength() >= 10)
	{
		output("\n\nTender from the taut embrace of Cherry’s cock-bloated gullet, you buck instinctually, driving a few inches past the back of her mouth and down into the gel’s throat. Gulping eagerly and shuddering in delight, the rahn luxuriously strokes the bulbous cock-outline your spearing mast makes in her nape. With her mouth-pussy gorged on your thickness, it’s not long before your [pc.cockHead " + x + "] encounters a new barrier. Though the pliant rubber of the stretched cock sheath is little more than a latex wrap around your length, Cherry’s collar has closed off the furthest depths of her esophagus. Though the gelatinous girl gives a few keen attempts at thrusting herself down your plentiful inches, it’s simply no use.");
		output("\n\nRather than admit defeat, however, you reach your " + (!cherryCumflated() ? "gloved ":"") + "hands around the back of her head and interlock your fingers just above her hair band. With a grunt, you thrust into her midnight pucker, dragging her head forward to meet the force of your bucking intrusion. The gelatinous girl’s neck swells around your girth, her cock-fattened trunk mushrooming around the perimeter of her collar. As you hump her face again and again, she takes wet, noisy swallows, her eyes drifting upward to meet yours with an expression of intense, almost infatuated relish.");
	}
	//merge
	processTime(10);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",cherryBlowBubbleScene2,x);
}

public function cherryBlowBubbleScene2(x:int):void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	output("The rahn blushes a deep burgundy as her gullet wraps tightly around your [pc.cock " + x + "]. Concentric rings of clenching, sinewy gel cradle and nurse at your girth, her delicious suction fierce enough to be felt even through the latex toy lodged ing the ruby girl’s peak. Your hardness throbs in the semi-solid embrace of her thirsty throat, sensitive flesh pounding a primal, savage desire from your loins all the way up to your brain.");
	output("\n\nGrabbing her shoulders, you pull the goo onto her ");
	if(!cherryCumflated()) output("massive tits and taut tummy,");
	else output("bloated belly,");
	output(" wrapping one " + (!cherryCumflated() ? "gloved ":"") + "hand under her ponytail. With her head tilted upwards and her esophagus straightened, you find the gel’s mouth even more apt a cocksucking machine. Long, deep strokes take your [pc.cockhead " + x + "] from the moist brim of her jet black lips all the way through the embedded Bubby Buddy and back again. Each impact sends rippling pulses through the jelly girl, her undulating body transmitting the force of your face-fucking into waves on her waterbed.");
	output("\n\nCherry seems to sense the rapidly building climax inside you. Twisting her hips and flipping onto her back, the girl pulls a 180 around your spearing length. Her titantic tits " + (cherryCumflated() ? "and cum-swollen belly ":"") + "wobble and sway from the effort which, along with the bed’s oscillations, give her body a pendulus, swinging motion. The girl’s " + (cherryCumflated() ? "amplified ":"") + "body, borne by the waterbed’s waves, thrusts back against your [pc.cock " + x + "], her fluid physics meeting your rapid, throat-swabbing pace beat for beat. To brace yourself, you put one " + (!cherryCumflated() ? "gloved ":"") + "palm on her forehead and hook the other around her jaw, fingers pressing down on the pistoning penetration ballooning her neck.");
	output("\n\nHot strokes of sweet release belt through your [pc.groin] and tingle at the back of your spine. Breathlessly bucking into Cherry’s " + (!cherryCumflated() ? "already cum-bloated ":"") + "frame, your peak builds with gasping intensity. With rapid, shallow pumps, you ride the culminating orgasmic satisfaction into the rahn’s stuffed face again and again, rocking her hard one minute before slowing to enjoy the coiling embrace of her unseen tongue. The heat inside you flows like liquid passion, primed to gush into the scarlet girl with all the fervent need of a rutting animal.");
	output("\n\nLike a cool breeze on a sweltering day, a thought floats across your lust-addled mind: should you fill the bubble while it’s still inside her gullet or pull back and inflate it on top of her face?");
	processTime(15);
	pc.lust(100);
	clearMenu();
	addButton(0,"In Her",bubbleBuddyInsideCherry,x);
	addButton(1,"On Her",bubbleCummiesOnCherry,x);
}

//[In Her]
public function bubbleBuddyInsideCherry(x:int):void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	var cummies:Number = pc.cumQ();
	// <4,000 mL cum
	if(cummies < 4000)
	{
		output("It’s far too difficult to pull free from the pirate’s throat at this point, so there’s no point in trying. Gripping her head, top and bottom, you slam your abdomen against her " + (cherryCumflated() ? "flushed face":"lust-swollen lips") + " with a cresting delight. The slapping sounds of heavy, wet impacts mix with the gelatinous girl’s moist, gurgling in an obscene, squelching duet. Cherry’s exposed throat, stretched to pale pink, twitches outward with your pumping spasm as [pc.cum] spurts into the slime. Wrapped as tightly around your face-fucking shaft as she is, the convex shape of your bubble-filling load is very nearly visible through her coral skin.");
		output("\n\nWhen the final, fluttering notes of your peak wash across your sweat-slick brow, it’s all you can do to pull yourself back from the pirate’s still-suckling mouth. Backing up, your [pc.cock " + x + "] slides out of the clutching latex toy, almost dragging it out of the inarticulate girl’s mouth. The throat-bulging, bubble-bound load is pulled into the more ample expanse of the rahn’s cherry cheeks. Grabbing hold of the Bubble Buddy and giving it a few twists, you decouple the sheath from the cum bubble and toss the slaver-soaked onahole aside.");
		output("\n\nHead still draped upside down over the edge of the bed, Cherry looks up with a satisfied smirk. Mouth agape, she gives you a first-class view of the squished purple orb you left inside her. The gel’s long, sinuous tongue twists around the latex blob, coiling and squeezing it to savor your lingering heat. Then, with a single gulp, the rahn’s membrane-muscled mouth drags the condom down, purple rubber vanishing into the drool-dripping narrowness of her gullet. A deeply satisfied rumble ripples through her body as the bubble " + (cherryCumflated() ? "is added to her already absurdly distended belly.":"leaves a bulge in the gel’s taut abdomen."));
		output("\n\n<i>“So much more fun to blow bubbles with a buddy, wouldn’t you agree?”</i> Cherry teases, blowing you a kiss as she lifts herself back into a sitting position. <i>“But you’ve got more than that, don’t you?”</i>");
		output("\n\nNo wonder this girl went into piracy: she’s never satisfied!");
		processTime(5);
		pc.orgasm();
		feedCherry(cummies);
		showCherry(true);
		//feed bubble probably
		//return to Cherry’s Quarters menu
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// 4,000-70,000 mL cum
	else if(cummies < 70000)
	{
		output("It’s far too difficult to pull free from the pirate’s throat at this point, so there’s no point in trying. Gripping her head, top and bottom, you slam your abdomen against her " + (cherryCumflated() ? "flushed face":"lust-swollen lips") + " with a cresting delight. The slapping sounds of heavy, wet impacts mix with the gelatinous girl’s moist, gurgling in an obscene, squelching duet. Cherry’s exposed throat, stretched to pale pink, twitches outward with your pumping spasm as [pc.cum] spurts into the slime. Wrapped as tightly around your face-fucking shaft as she is, the convex shape of your bubble-filling load is very nearly visible through her coral skin.");
		output("\n\nWhere others might exhaust themselves on a single discharge, you’ve so much more to give. Leaning way forward to close your " + (!cherryCumflated() ? "gloved ":"") + "palms on the gel’s E-cups, you brace yourself and squeeze her sensitive, jelly tits. As you spurt [pc.cum] past ebony lips, you match the clutching tension of the pirate’s cock-stuffed mouth with your hands, fingers pressing into the supple orbs tight enough to make her hips buck and her ponytail slap the rubber bedding. The girl’s gloved hands grab your wrists and keep the two of you locked in the straddling embrace to the last drop.");
		output("\n\nYour hot seed pumps into Cherry’s ever-expanding throat-bulge while she gulps and swallows at the rubbery reservoir, dragging it ever deeper down her collared nape. Body trembling with each bloating gout, you can feel the TamaniCorp toy tensing around your [pc.cockHead " + x + "]. Pulled by the pirate’s gluttonous gullet, the expanding cum bubble is drawn out into an esophagus-fattening tube. The girl’s expert tongue twists the toy in her mouth around, letting the filled condom yank free with a muted snap. The self-sealing bubble fills the full length of the rahn’s band-tightened throat for a moment before vanishing into her gullet with a noisy gulp. The Bubble Buddy’s freshly emptied peak constricts around your pumping peak just long enough for your next load to gush into the elastic reservoir. Your face-humping spurts balloon the gel’s neck bit by bit, beginning the cycle anew.");
		output("\n\nYou lose track of just how many bubbles disappear down Cherry’s esophagus, or how many jiggling climaxes your kneading fingers wring from the rahn’s remarkably responsive breasts. By the time your pumping thrusts serve only to bloat her cheeks with cockmeat, the two of you are nearly at the verge of exhaustion. Chest rising and falling between your fingers, Cherry reluctantly releases her deathgrip on your latex-sheathed member, letting you pull free. Dragging the onahole with you, your purple-clad length slips out of the girl’s fuck-fattened lips, only then beginning to lose a measure of its hardness.");
		output("\n\nCherry lazily reaches up to grab hold of the drool-dripping Bubble Buddy, cleaning it inside and out with her long, sinuous tongue before returning the toy to you. <i>“A feast suitable for a Pirate Queen,”</i> she brags, rolling onto her front, bed deforming under the engorged bloat of her " + (cherryCumflated() ? "torso-dwarfing cum belly":"bubble-filled gut") + ". <i>“I don’t suppose you’d be up for a little dessert?”</i>");
		//set Cherry to Cumflated for 24 hours if not already, else refresh her status
		//return to Cherry’s Quarters menu
		processTime(5);
		pc.orgasm();
		//Not using actual cummies value because I wanna guarantee cumflation to match text.
		feedCherry(70000);
		showCherry(true);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// >70,000mL cum
	else
	{
		output("It’s far too difficult to pull free from the pirate’s throat at this point, so there’s no point in trying. Gripping her head, top and bottom, you slam your abdomen against her " + (cherryCumflated() ? "flushed face":"lust-swollen lips") + " with a cresting delight. The slapping sounds of heavy, wet impacts mix with the gelatinous girl’s moist, gurgling in an obscene, squelching duet. Cherry’s exposed throat, stretched to pale pink, twitches outward with your pumping spasm as [pc.cum] spurts into the slime. Wrapped as tightly around your face-fucking shaft as she is, the convex shape of your bubble-filling load is very nearly visible through her coral skin.");
		output("\n\nWhere others might exhaust themselves on a single discharge, you’ve so much more to give. Leaning way forward to close your " + (!cherryCumflated() ? "gloved ":"") + "palms on the gel’s E-cups, you brace yourself and squeeze her sensitive, jelly tits. As you spurt [pc.cum] past ebony lips, you match the clutching tension of the pirate’s cock-stuffed mouth with your hands, fingers pressing into the supple orbs tight enough to make her hips buck and her ponytail slap the rubber bedding.");
		output("\n\nYour hot seed pumps into Cherry’s ever-expanding throat-bulge while she gulps and swallows at the rubbery reservoir, dragging it ever deeper down her collared nape. Body trembling with each bloating gout, you can feel the TamaniCorp toy tensing around your [pc.cockHead " + x + "]. Pulled by the pirate’s gluttonous gullet, the expanding cum bubble is drawn out into an esophagus-fattening tube. The girl’s expert tongue twists the toy in her mouth around, letting the filled condom yank free with a muted snap. The self-sealing bubble fills the full length of the rahn’s band-tightened throat for a moment before vanishing into her gullet with a noisy gulp. The Bubble Buddy’s freshly emptied peak constricts around your pumping peak just long enough for your next load to gush into the elastic reservoir. Your face-humping spurts balloon the gel’s neck bit by bit, beginning the cycle anew.");
		output("\n\n" + (cherryCumflated() ? "With her midsection already bloated like a beachball with your seed, it doesn’t take long before":"Long, condom-swallowing gulps punctuate a gushing eternity of climactic release before") + " the jaw-clenching volume of your [pc.cum] proves too much for the rahn. Stomach stretched to its absolute limits, the waterbed creaks ominously under the jelly’s fluid weight. Even her titantic E-cup tits are dwarfed by the sheer mass of her spunk-fattened gut. Beads of pinkish sweat run down a broodmother-sized belly that can’t help but wobble with your every movement.");
		output("\n\nFilled to the brim with [pc.cum], Cherry’s instinctive swallowing serves little purpose but to polish the taut latex around your tender peak with her throat. Unable to fit even one more load into her stomach, the backed-up jizz bubble balloons in the rahn’s mouth, filling her cheeks to shiny apples. Your gelatinous cum dump groans in ecstatic contentment, stuffed with a surplus that would suffocate nearly any other race.");
		output("\n\nThe hip-tingling gouts of [pc.cumVisc] pressure build around your [pc.cock " + x + "], excess seeping up past the Bubble Buddy’s length to drool down onto Cherry’s goo-giddy face. You move back, pulling the rubbery onahole with you to make a little more room for cum to fill her condom-crammed kiss. Eventually, even the pirate’s mouth proves insufficient to the task of containing the last bubble. Your final spouts inflate the supple, purple sac just past the brim of the girl’s lips, plugging her mouth like an impossibly huge ball gag. She tries swallowing a few times - fruitlessly - before contenting herself with the oral plug, sucking and slurping at the face-filling finale in a seed-stuffed languor.");
		output("\n\nShe might be out of it for some time. Will you stick around, or head out and leave the zel’rahn to recover at her own pace?");
		//set Cherry to cumflated for 24 hours, or refresh her status
		processTime(5);
		feedCherry(cummies);
		showCherry(true);
		pc.orgasm();
		//[Stay][Leave]
		addButton(0,"Stay",stayWithCumstuffedCherry);
		addButton(14,"Leave",leaveCherryAfterFeedingABigBub);
	}
}

public function leaveCherryAfterFeedingABigBub():void
{
	sendCherryToHerRoom();
	leaveCherrysPlace();
}
//[Leave]
//return to Tap-Hall
//when the player leaves Cherry’s Quarters, replace the [Cherry] option from the Tap-Hall for [Molli] for 4 hours.

//[Stay]
public function stayWithCumstuffedCherry():void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");
	output("You amuse yourself by browsing the surveillance setup Cherry installed in the Tap-Hall. She eventually rouses herself from the cum coma, having digested a tremendous amount of your seed in a surprisingly short amount of time. As testament to your virility, however, her belly is still absurdly ample. Practically spherical, her stomach looks a bit like a red version of the condom you fed her!");
	output("\n\n<i>“That was... filling,”</i> she huffs, rubbing her forehead and trying to keep herself from rolling off the bowed waterbed. <i>“A girl could get used to this kind of pampering.”</i>");
	output("\n\n");
	if(pc.isNice()) output("You assure her that it was your pleasure. A gel in need is a friend indeed!");
	else if(pc.isMischievous()) output("You assure her that you’ve got plenty where that came from. And your tap is even more fun to use than the TamaniCorp one.");
	else output("You assure her that she got a promising career as a professional cum dump if the pirating thing doesn’t work out.");
	output("\n\nCherry inspects her cumflated body, giving herself a fluid jiggle. <i>“Well, I’m pretty much ruined for the rest of the day,”</i> she laughs. <i>“All this added mass dilutes my toxin to little more than an exciting tingle. On the plus side, that means you and I can get a little more... intimate.”</i>");
	output("\n\nShe bats her eyes at you and pats her belly. This girl just can’t get enough!");
	processTime(4*60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[On Her]
public function bubbleCummiesOnCherry(x:int):void
{
	clearOutput();
	showCherry(true);
	author("Adjatha");

	var cummies:Number = pc.cumQ();

	// <4,000 mL cum
	if(cummies < 4000)
	{
		output("As the first, fluttering spasms of your climax blossom in your [pc.chest], you reach down and seize the lip of the bubble buddy in Cherry’s mouth. Your turgid length and her oral pressure have squeezed the onahole tightly, but the bubbling froth of the girl’s well-violated maw provides ample lubrication. Giving it a tug, the rubbery sheath follows your cock out, the two withdrawing as one from the disappointed gel just in time. As she looks up in confusion, you flop your rubber-wrapped [pc.cockHead " + x + "] across her brow and over her eyes.");
		output("\n\n<i>“I think this is my favorite pick-up line so far,”</i> she pants, tongue slurping across the rubbery toy’s tip.");
		output("\n\nThe rush of your release flows through your engorged meat, over Cherry’s flushed brow, and pours into the Bubble Buddy’s reservoir tip with the [pc.cumVisc] richness of lust-thickened bliss. Even outside of the girl’s mouth, the violet onahole is every bit the pocket pussy it bills itself as, its self-tightening interior clenching at your throbbing mast and suckling on your [pc.cockHead " + x + "]. The toy, tensing at the tip-bloating seed you pump into it, squeezes your [pc.cock " + x + "] with a needy, elastic tension. The rubbery cock sock’s peak deforms outward under your fluid heat, latex ballooning it into a cum-filled bubble.");
		output("\n\nUnable to keep herself back, the rahn stretches her half-foot tongue around the supple, protective rubber of the Bubble Buddy and lassos your girth. Muscular gel tightens around fat inches and pumps up and down your length, jacking off your hardness in an effort squeeze every last drop of seed from your tensed, shuddering bulk. The swelling tip squishes up against Cherry’s face with pudding-like density, deforming around the girl’s features and fill her vision with warm, blobby purple.");
		output("\n\nBy the time your [pc.cumColor] spunk has finished jetting into the purple sheath, Cherry’s tongue has moved from your shaft to the warm orb wobbling on her head. Your orgasm slowing in the final spurts of sweet delight, you have a chance to appreciate the size of the rahn’s latest gift. Larger than you thought yourself capable, the bubble droops across the pirate’s features with the fluid weight of your [pc.cum], teasing the avid cum-drinker with its nearness. She licks across the swollen curve of the amethyst orb, her tongue tightening around the toy’s tip until the pliant sheath splits bubble from buddy, sealing the condom with an elastic snap.");
		output("\n\nWhile you regain your breath and " + (!cherryCumflated() ? "carefully ":"") + "remove the slaver-soaked onahole from your tender cock, Cherry lays, reclined and wearing a dopey grin. With your condom draped over her like a latex replacement for her normal visor, she seems to be enjoying herself immensely. Fingertips dancing across her smooth breasts, the rahn can’t help but chuckle at your last-minute choices.");
		output("\n\n<i>“Figured my face was missing out on the joys of freshly filled bubbles, did you? How thoughtful. But, I have to warn you: my throat is a jealous bitch.”</i> She tugs at her double-banded collar before letting the leather snap back against her slender, ruby neck. <i>“There’s no telling what she’ll do if she finds out you’re cheating on her with the rest of me.”</i>");
		output("\n\nWhile you contemplate competing for the affections of the gel girl’s various fuckable holes, Cherry coils her tongue around the wobbling cum-pouch on top her and drags it past the plump, ebony gates of her lips. With a long, loud gulp, the condom is drawn down her throat and into the amorph’s gullet.");
		output("\n\n<i>“A nice start,”</i> she sighs, licking her lips. Rolling onto her front, the zel’rahn looks up at you with an expression even hungrier than before. <i>“But I could go for seconds.”</i>");
		//[End]
		//return to Cherry’s Quarters menu
		//if already cumflated, refresh cumflation status
		processTime(5);
		feedCherry(cummies);
		showCherry(true);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// 4,000-70,000 mL cum
	else if(cummies < 70000)
	{
		output("As the first, fluttering spasms of your climax blossom in your [pc.chest], you reach down and seize the lip of the bubble buddy in Cherry’s mouth. Your turgid length and her oral pressure have squeezed the onahole tightly, but the bubbling froth of the girl’s well-violated maw provides ample lube. Giving it a tug, the rubbery sheath follows your cock out. Almost. A half foot of thin, straining latex stretches from your onahole-clad cock through the space between you, and into Cherry’s gaping mouth. The unnoticed drool of your copious pre-cum must have left a gooey lump in the the toy’s peak, like ");
		if(pc.hasKnot(x)) output("your own [pc.knot " + x + "]");
		else output("an ausar’s knot");
		output(", the stretched reservoir tip still stuck in the girl by her tight collar!");
		output("\n\nWith a gurgling hack, Cherry’s eyes turn to the elongated rubber connecting your widening urethra to her throat. A moment later, your first true jets of thick spunk sprays into the latex sheath, bloating the thin tunnel with fluid heat. Your rahn fuck-buddy has a first-hand view of your climax as you pump gout after gout of [pc.cum] into the toy’s strained peak. At each of your abdomen-tensing discharges, [pc.cumVisc] waves spray from the tight crest of your [pc.cockHead " + x + "], down the tensed length of the stretched prophylactic, past Cherry’s helplessly flailing tongue, and down her larynx.");
		output("\n\nThe slight bulge at the nape of the gel’s neck grows larger with each passing moment. She tries to dig a finger under the leather bands keeping your inflating loads firmly lodged in her jugular, to no avail. Flushing a dark burgundy, the rahn jerks her head back but only succeeds in adding to the Bubble Buddy’s tension around your [pc.cock " + x + "]. Your strength draining with every liquid rush of your copious cum, you can do little but marvel at the tensile strength of the TamaniCorp toy as it stretches but does not snap, even as the knot in the pirate’s throat grows fist sized and larger.");
		output("\n\nEyes turned upward Cherry seems to realize the futility of trying to dislodge the trunk-swelling weight of your stuck bubble. Turning the tip of her ponytail on her own neck, the alien girl strokes the wobbling mass of your suffocating cum-bulge. Blushing, muddled fascination becomes a trembling, clenching climax as her semi-autonomous tentacle adds its own squeezing tension to the bubble’s girthy invasion. Caught between your relentless gallons and her own wanton urges, the girl chokes herself on your condom-filling jizz with the enthusiasm of a true spunk-slut. Throat throttled inside and out, she gags and wheezes, shuddering in helpless bliss.");
		output("\n\nReaching the full stride of your overflowing orgasm - teeth clenched and fingertips tingling - you spray an uninterrupted geyser of [pc.cum]. Phallus-fattening cream rushes down the length of your [pc.cock " + x + "] and into the rubbery bubble with the sweltering force of a torrential river, bloating the onahole’s knot into an esophagus-stretching latex pillar. The gel girl’s shuddering body tightens around the trachea-filling, fluid phallus, pressing it thinner still until, with a squeaking schlurp, the bloated bulk of the condom jerks free!");
		output("\n\nCherry lets out a hacking exhalation, her windpipe finally unblocked and free to suck down cold air once more. The freshly disgorged bubble hangs heavily from your [pc.cockHead " + x + "], dripping with the gelatinous pirate’s oozing, pinkish slaver. A few more pumps of your weighty bounty is all it takes for the drooping rubber to sag against the curvaceous rahn’s collar. Nut-stuffed and shellacked by glistening saliva, the melon-sized wad sags over the gasping girl’s neck as if laying claim to her throat-pussy.");
		output("\n\nChest rising and falling with eye-popping jiggles, Cherry tongues the well-stretched preservative. She laps at the wobbling reservoir vigorously enough to tickle the tender expanse of your [pc.cockHead " + x + "]. Letting your latex-clad length drape across the gel’s forehead, you finish out your climax by rubbing the hot slime of the pirate’s gullet into her flushed features and over her still-gasping lips.");
		output("\n\nA few twists is all it takes to activate the deceptively high-tech prophylactic’s self-sealing feature, the bubble separating itself from the onahole. Membrane reforming over the breach in seamless latex, Cherry is left with a perfectly preserved meal. Hoisting the spunk-ball off herself, rahn wiggles to her stumpy sitting position.");
		output("\n\n<i>“You really ought to decide if you’re going to cum inside or out a bit sooner,”</i> she scolds, her reprimand somewhat undercut by the drool still trickling down the side of her slightly smiling ebony lips. Holding the hefty cum-pouch in both hands, Cherry gives the massive condom one last lick before setting it aside, presumably for a collar-free meal.");
		output("\n\n<i>“So, what else you got in your tank?”</i>");
		//[End]
		//return to Cherry’s Quarters menu
		feedCherry(cummies);
		showCherry(true);
		processTime(5);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// >70,000mL cum
	else
	{
		output("As the first, fluttering spasms of your climax blossom in your [pc.chest], you reach down and seize the lip of the bubble buddy in Cherry’s mouth. Your turgid length and her oral pressure have squeezed the onahole tightly, but the bubbling froth of the girl’s well-violated maw provides ample lube. Giving it a tug, the rubbery sheath follows your cock out, the two withdrawing as one from the disappointed gel just in time.");
		output("\n\n<i>“Hey, I’m still hun-!”</i> is all Cherry has a chance to get out before your orgasm hits like an oil derrick. Your first load gushes into the Bubble Buddy’s tip like a liquid fist, bloating the latex in a massive blob that slaps against the rahn’s face. She sputters and grabs at the grapefruit-sized orb just as your next pump doubles the reservoir’s size. With each of your heart-pounding, toe-curling gouts of [pc.cum], the inflating bubble in the rahn’s palm fattens. It’s pliant mass bulges around her fingers, tripling its original size as you rock your twitching cockhead in the suckling onahole.");
		output("\n\nThe pirate tries to support your ballooning cum sack with both hands and even enlists her ponytail to the task, but in vain. The gushing gallons racing through your body defy any attempt at restraint. Latex stretched with torrid spunk, the cumflated condom droops around her gloves, sinking down to settle over her face once more, before the sheer, gooey girth swallows her head entirely. Senses engulfed in warm, cum-distended rubber, all the fight goes out of the rahn. The gel abandons her attempts to hold back the doughy, engulfing mass, instead circling her arms around the wildly overflowing, [pc.cumGem]-cream blob in a submissive embrace.");
		output("\n\nThe more you cum, the more it feels like you’ve only just reached your stride. Inhuman volumes of [pc.cumVisc] spunk flood the bloating condom with the profusion of an unstoppered hose. Dragging the lip of the Bubble Buddy up and down the length of you [pc.cock " + x + "], the pocket pussy takes your unchecked lust with latex groans of glutted engorgement.");
		if(pc.balls > 0) output(" Your [pc.balls] slap" + (pc.balls == 1 ? "s":"") + " against your [pc.thigh] with every ceaseless load rushing into the TamaniCorp toy.");
		output("\n\nCherry’s stubby thighs tighten, squeezing her plump pussy between them as she revels in the hot virility of the condom’s oppressive weight. Your loads expand the bubble to cover her shoulders and it’s all the prostrate pirate can do to drag as much of the cushioning bounty onto the bed with her. When the ever-expanding, violet orb pins her arms at her sides, there’s nothing left to keep the cum cache from squishing the gel girl’s hypersensitive E-cups beneath it. The whole massive pouch shudders with the girl’s gelatinous, spunk-smothered climax. You can feel the trembling all the way up to your [pc.knotBallsHilt " + x + "], perspiration beading on your brow and rolling down your [pc.chest] as you sway in peaking rapture.");
		output("\n\nTime stretches as thin as the Bubble Buddy’s ballooned tip, your nut-stuffed latex globe eventually growing as large as the half-sized rahn currently underneath it. The wagging ponytail peaking over the side of the bed your only indication that she’s still there at all!");
		if(cherryCumflated()) 
		{
			output("Even her massive belly has been swallowed by the supple rubber - buried by a meal too vast for even her gluttony");
		}
		output(". Light headed and breathing heavily, you think you’ve nearly reached your end just as the last of Cherry’s waterbed vanishes under your sealed goo.");
		output("\n\nThe only warning you have is a sense of sucking tightness around your [pc.cockHead " + x + "] before the Bubble Buddy’s space-age polymer is overwhelmed and ruptures with a thunderous pop! Gallons upon gallons of passion-heated jizz gush outward in a grenade-like detonation that fills the pirate girl’s room. Thick curtains of [pc.cumColor] spray out in every direction, painting the walls, knocking collector’s items off her shelf, even drenching her computer’s hardlight holoscreen in an opaque, [pc.cumGem] recolor.");
		output("\n\nYou’re very nearly knocked off your [pc.footOrFeet] as much by the back-splash as the draining profusion of your climax. Staggering in gooey shock and momentarily blinded, your hands are shaking by the time it’s over. Wiping the oozing globs of semen from your eyes, you hardly recognize your surroundings. Dripping, [pc.cumVisc] spunk is just everywhere. A lake of thick seed lacquers any surface that it doesn’t outright hide. Spooge fills the hollows of Cherry’s cybernetic legs like twin pools, ebbing waterfalls lazily seeping down the blinking machinery. Hand-sized globs of [pc.cum] are piled in gooey masses while thick ropes of cream drool from the ceiling all around you.");
		output("\n\nAnd in the epicenter of the detonation: a stunned rahn as [pc.cumColor] as her surroundings.");
		output("\n\n<i>“Well,”</i> she notes in an distant, dazed tone, <i>“this makes me glad I waterproofed my room.”</i> All you can make out of the zel’rahn is her mouth, everything else is so coated in your spunk that she drips like a galotian. Without bothering to clear the cum from her eyes, she looks vaguely in your direction. <i>“I’m going to need a minute or two alone, I think.”</i>");
		output("\n\nIt takes some doing, but eventually you clear away enough of the [pc.cumVisc] seed to locate all your gear and make yourself as presentable as you’re likely to get. As you splash towards the door, Cherry calls back for you one more time.");
		output("\n\n<i>“Thanks for popping by. Don’t, uh, tell Molli about this one,”</i> she murmurs, cupping a hand and raising a palm full of your nut to her lips. <i>“I’ll clean it myself.”</i>");
		output("\n\nYou’re not sure if she sounded more determined or grateful, but either way, you doubt this little accident has worn out your welcome.");
		//[End]
		//set player to cum-soaked
		processTime(5);
		pc.applyCumSoaked();
		feedCherry(cummies);
		showCherry(true);
		pc.orgasm();
		//set Cherry to cumflated or refresh her status for 24 hours
		//return PC to Tap-Hall
		sendCherryToHerRoom();
		clearMenu();
		addButton(0,"Next",leaveCherrysPlace);
	}
}