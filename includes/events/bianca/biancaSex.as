// BIANCA_REASON_REJECTED
public const BIANCA_REJECTION_STD:int = 1;
public const BIANCA_REJECTION_GOO:int = 2;
public const BIANCA_REJECTION_TAUR:int = 2;// same as goo on purpose!
public const BIANCA_REJECTION_NEUTER:int = 4;// skipping 3 in case GOO and TAUR get split in the future

public function biancaSexed(scene:String = ""):void
{
	IncrementFlag("BIANCA_SEXED");
	if (scene)
	{
		IncrementFlag("BIANCA_SEXED_" + scene);
		if (InCollection(scene, "FACE", "TITS")) IncrementFlag("BIANCA_SEXED_BLOW");
	}
}

public function biancaSexings():void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(5+rand(5));

	if (pc.hasSSTD())
	{
		// pc Has SSTD (never sexed Bianca - you don't get sex!)
		if (flags["BIANCA_SEXED"] == undefined)
		{
			output("The longer you stare at Bianca the blurrier your crossing sight gets. It becomes more obvious how horny you are, how horny she makes you. It comes as a sudden shock when she turns to face you. Her glowing visage startles you into a slow gasp, and then she’s leaning in on you, pressing a hand to your head. <i>“[pc.name]?”</i>");
			output("\n\nA pounding headache at your temple recedes like a wave at her coming, moving to places yet unreached. <i>“Something’s wrong...”</i> she whispers, straddling you. A light slap to the cheek shakes you from an overwhelming lassitude, lifting a thousand-pound press off your lungs and your brain. When your brain clicks back on there’s a glowing hoop around your wrist that vies for your attention the way her large boobs do.");
			output("\n\n<i>“Ah, that explains it. No wonder you looked so bothered. I thought you were aroused, but I was only half-right,”</i> Bianca smiles. <i>“You’ve contracted a sexually transmitted disease, [pc.name]... and were I in your place, I’d seek treatment right away. Fortunately, I have the medicine on me right now!”</i>");
			output("\n\nBianca pulls out a few colored pills and a flask of water. <i>“However, I’m afraid this comes at a cost. It is the only thing I cannot offer for free on the regular. I insist you take it. The <b>" + (pc.sstdTotal() > 1 ? "250" : "350") + " credit cost</b> is nothing compared to your health.”</i>");
			output("\n\nWell this has certainly killed the mood...");
		}
		// pc Has SSTD (after sexing Bianca once)
		else
		{
			output("In your attempt to ask Bianca to relieve your sexual stress, a sharp headache stabs you in the brain from the left side of your temple. Your gasp and obvious agony is, to a trained physician, a light in the darkest of nights, trivial to pick up on and comprehend. It’s no surprise then, that she’s straddling and feeling you up. Absentmindedly you ask if she’s willing to help with your aching need, but that only gets you a smirk.");
			output("\n\nBefore you know it she’s brought up her codex and your wrist is in a glowing hoop, scanning your bloodstream for infections. <i>“A-ha, [pc.name]... an STD of all things!”</i> she giggles. Should she really be laughing about this? <i>“Young men and women are so active these days. Far more than at any point in human history. It’s funny to me, in a way. But what you might not find amusing, [pc.name], is that you’ll have to... pay if you want to play!”</i>");
			output("\n\nW-What? Why would she even say such a thing..?");
			output("\n\n<i>“There’s nothing to be ashamed of, [pc.name].”</i>");
			output("\n\n<i>“Who said anything about-”</i>");
			output("\n\nAll you get is a wide, gleaming grin. She knows what you want. And she’s making it clear the only way you’re going to get it is if you accept the three pills in her hand. <i>“" + (pc.sstdTotal() > 1 ? "250 credits, as your condition is poor" : "350 credits") + ",”</i> she says. <i>“Please take them. Money is no object for your health, least of all mine.”</i>");
		}

		if (pc.credits < (pc.sstdTotal() > 1 ? 250 : 350)) addDisabledButton(0, "Get Cured", "Get Cured", "You cannot afford the medication.");
		else addButton(0, "Get Cured", getBiancasSexualHealing, undefined, "Get Cured", "Alright. It’s worth it.");
		addButton(1, "No Thanks", tellBiancaYouLikeBeingADiseaseBag, undefined, "No Thanks", "No.");
	}
	else if (pc.isTaur() || pc.isGoo())
	{
		// First Time - Incompatible Body
		if (flags["BIANCA_SEXED"] == undefined)
		{
			output("For a second you feel <i>hot</i> and bothered. It’s Bianca. Of course it’s her. The scent of a fertile woman nearby when you’re this aroused is pumping libido and sexual readiness through your body. Accumulating sweat beads around your reddened cheeks, and once Bianca turns to note your thick nasal breathing, she’s already trying to visually and physically diagnose you. <i>“Is... something wrong, [pc.name]?”</i> she murmurs, touching all over your shape. <i>“It seems...”</i>");
			output("\n\nThat’s when you tell her what you’re feeling, coincidentally at the moment she finds your genitals thrumming with arousal.");
			output("\n\n<i>“Ahh... that would explain it,”</i> she grins, then frowns. <i>“You know... I would be glad to see to that.”</i>");
			output("\n\nYou perk up, altogether too many thoughts running through your mind at the possibility of-");
			output("\n\n<i>“But... your body...”</i> she turns away regretfully. <i>“I could not connect to you, as you are. My preferences are too deep seated and strong,”</i> she whispers almost, letting you down as politely as possible. <i>“I can only be myself when I can entangle with another person, when I can feel them against me, staring me in the eye, on an equal footing. {Your gelatinous form would prevent me from enabling myself, and you by extension. / Your leithan shape is too much for me, it would keep me from you in more ways than one.} Please understand...”</i>");
			output("\n\nWhile it’s terribly unfortunate, you do, and let the matter be.");
			if (!pc.isGoo()) output(" Were you to change, however...");
		}
		// Repeat Time - Got an incompatible body (goo and taur)
		else
		{
			output("<i>“You changed yourself,”</i> Bianca blinks. <i>“Your body is... different. And because of that...”</i> she strokes your");
			if (pc.isGoo()) output(" gelatinous");
			output(" shoulder. <i>“I’m afraid that I cannot muster up my libido for you.”</i>");
			output("\n\nOh.");
			output("\n\n<i>“I like it when we can entangle. What you are now... that’s not something that I can invest myself in. Emotionally, physically... I want what we have. I’m sorry if that sounds upsetting, but, [pc.name]... it is who I am.”</i>");
			output("\n\nWelp. Nothing for it then. If you want to have fun with the doctor again, you’ll have to change back to what you were before!");
		}

		biancaSpendTimeMenu(true);
		flags["BIANCA_REASON_REJECTED"] = BIANCA_REJECTION_TAUR;
	}
	else if (flags["BIANCA_SEXED"] == undefined)
	{
		// First Time - got a compatible body from not having one
		if (flags["BIANCA_REASON_REJECTED"] == BIANCA_REJECTION_TAUR)
		{
			output("Picking up where you left off last time, you point out rather aptly that you’re no longer in a shape that would disinterest her. Bianca blinks, only just now realizing what you’ve done, realizing the power of genetic modification has opened up a rather adulterous and blissful experience for the two of you. <i>“That’s... I would never have expected that kind of desire from you, [pc.name]. I hope you realize, however, that if you wish for my help, we won’t be doing anything very extreme...”</i>");
			output("\n\nYou understand quite well. Your body is demonstrating its readiness for anything... and then she’s feeling over you, becoming intimate with your genitalia. Already you’re discovering for yourself just what kind of libido she has sealed away that your newly compatible form has unlocked.");
			output("\n\n<i>“No penetration,”</i> she pokes your chest, <i>“my hands and mouth only... if you still want it. But at this point, [pc.name],”</i> she licks her lips, letting out an uncharacteristic snicker, <i>“...you don’t really have a choice. But I’ll let you choose what you want from me, hehe.”</i>");

			biancaSexMenu();
		}
		// First Time
		else
		{
			output("Warmth spreads throughout your body like a blanket being pulled slowly over you. Heat begins at your cheeks and ends at your groin; your heart rate spikes when you glance at your vulpine companion, every womanly detail the focus of your sharpening senses. What you’re feeling is primal desire, and it’s an urge unimpeded by her readily-apparent matrimony.");
			output("\n\n<i>Dr. Ketria is a married woman.</i> The thought rises up like a weed only to be whacked by hormones. The gold ring on her finger shines with a dim insistency, ever a chest-clenching reminder. This close, you can notice the pheromonal charge in her sweat. It’s a sublime fragrance that you want more of, and when that’s not enough, you want the <b>source.</b>");
			output("\n\nThe sagacious fox spots the sweeping crimson shade curtaining your [pc.face] and the subtle changes in your breathing thereafter. Her nostrils flare for the faint scents emerging from your " + (pc.isCrotchExposed() ? "crotch" : "[pc.crotchCoverUnder]") + ". You’re a horny [pc.raceShort] lusting after someone’s wife, and the airborne evidence of it is abundant.");
			output("\n\nBianca places her hand to your cheeks and then your forehead. <i>“Are you feeling sick, [pc.name]?”</i>");
			output("\n\nYou answer in the negative.");
			// pc Neuter
			if (!pc.hasGenitals())
			{
				output("\n\nMildly frustrated, Bianca decides to get to the bottom of your mischief. Quite literally as it turns out, by shoving a hand into you crotch and squeezing the flat surface. At no other point has she looked so shocked by something you’ve presented her with. Or, rather, failed to present her with.");
				output("\n\n<i>“Y-You don’t have... genitalia, [pc.name]?”</i> she asks shakily, pulling away. <i>“But you looked... well, my apologies.”</i>");
				output("\n\nWait hang on, that’s what you were gonna ask!");
				output("\n\n<i>“Ehe, [pc.name],”</i> she smiles sheepishly. <i>“There’s nothing I can do for you. I am a woman, and I am limited in how I can see to the needs of others. I also have my own personal hang-up on this matter. If you have nothing for me, then I cannot connect to you. I will speak no more, for it would be impolite to continue.”</i> She sighs, shrugging her shoulders. <i>“But... should you ever gain back what you’ve lost... then I could see myself making an exception for you...”</i>");

				biancaSpendTimeMenu(true);
				flags["BIANCA_REASON_REJECTED"] = BIANCA_REJECTION_NEUTER;
			}
			// pc Has Genitals
			else
			{
				output("\n\nThe doctor’s looking mildly frustrated now; you laugh, looking nervously to your [pc.legOrLegs]. It’s a slow process of connect-the-dots for Bianca; vertically slit eyes narrow at your");
				if (pc.isNice()) output(" shy smile");
				else if (pc.isMisch()) output(" silly grin");
				else output(" thin smirk");
				output(" before glancing to the origins of your musky odor.");
				if (pc.isHerm()) output(" A veritable cocktail of powerful pheromones wafts up, saturating your ozone with the cloying smell of need. Reacting to her attention, your heartbeats add inches to your [pc.cocks], " + (pc.isCrotchExposed() ? "[pc.CumColor] pre-seed develops at the top, tilting and trickling down your exposed " + (pc.hasCocks() ? "undersides." : "underside.") : "stretching your clothes outward in blatant, darkening arousal."));
				else if (pc.hasVagina()) output(" Bianca’s nostrils are tickled into wrinkling when the [pc.girlCumFlavor] aroma of your [pc.pussy] rises to meet her. " + (pc.isCrotchExposed() ? "Juice pools on the ground " + (pc.hasLegs() ? "between your [pc.legs]." : "in front of your groin.") : "Arousal stains your [pc.crotchCover]."));
				else output(" Reacting to her shimmery gaze, your heartbeats add inch after inch to your swelling [pc.cocksLight]. " + (pc.isCrotchExposed() ? "[pc.CumColor] prejizz bubbles out of your " + (pc.hasCocks() ? "cumslits" : "cumslit") + " until a large dollop forms and sags down the " + (pc.hasCocks() ? "shafts." : "shaft.") : (pc.hasCocks() ? "They tent" : "It tents") + " painfully against your [pc.crotchCover], darkening the peak with arousal."));
				output("\n\n<i>“Ah, that’s it.");
				if (flags["BIANCA_REASON_REJECTED"] == BIANCA_REJECTION_NEUTER) output(" You’ve grown something!");
				output("”</i> Bianca kneels next to you, long hair curving to the breeze. Like this, her large stature envelopes your field of view, and there’s something intensely arousing about her grand <b>presence</b> occupying your space. It feels like you’re the most important thing to her. <i>“You’re in desperate need of relief, mm?”</i>");
				output("\n\nYou nod. It’s all you can do with raw <i>want</i> plaguing your mind.");
				output("\n\nAfter a long pause, Bianca bluntly replies, <i>“I can help you with that.”</i> ");
				output("\n\nBut she’s married!");
				output("\n\n<i>“True, but doctor-patient confidentiality is sacrum,”</i> she purrs, taking on a sultrier voice. <i>“I don’t plan on disrobing and mounting you - no penetration!”</i> She soft-jabs a finger to your chest, tails brushing in the motion. <i>“If you’d like me to take care of you, then you’ll have to accept my fingers or my mouth.”</i> Bianca glances your crotch, ");
				if(pc.hasCock()) output("taking your [pc.cocksLight] in hand");
				else output("pressing two fingers to " + (pc.hasVaginas() ? "a":"your") + " slit");
				output(". The way she works all but ensures you can’t turn back. You fall under the light of her eyes again, heart catching in your throat.");
				output("\n\n<i>“If you dirty my clothes without permission,”</i> she whispers, leaning close enough to your lips that the heat of her next words fires every nerve cluster, <i>“you will <b>regret</b> it. One more thing...”</i> She slinks over to your [pc.ear], practically breathing into it, <i>“you won’t be leaving until <b>I</b> am satisfied, too.”</i>");
				output("\n\nIs... is this all really okay?");
				output("\n\nBianca flashes you a wolfish grin, <i>“You tell me, [pc.name].”</i> ");

				biancaSexMenu();
			}
		}
	}
	else
	{
		// Repeat Time - Lost genitals, became neuter or something
		if (!pc.hasGenitals())
		{
			output("The words leave your mouth automatically - you want Bianca to relieve you. She smiles, grinning that sensual grin while her hands fall to your waist.");
			output("\n\nThe grin falls from her face next.");
			output("\n\n<i>“W-Where’s your...? Ahh, but there was something here and it’s gone now...”</i>");
			output("\n\nAnd so, the mood also falls away. She doesn’t look very pleased with this discovery. Something tells you that no matter what you say or offer, she is definitely not interested in sex without any means of reproduction.");
			output("\n\n<i>“I-I’m sorry, [pc.name],”</i> she scratches her head. <i>“But that would be no fun at all... forgive me.”</i>");
			output("\n\nWelp.");

			biancaSpendTimeMenu(true);
			flags["BIANCA_REASON_REJECTED"] = BIANCA_REJECTION_NEUTER;
		}
		else
		{
			// Repeat Time - Grew genitals (from no genitals)
			if (flags["BIANCA_REASON_REJECTED"] == BIANCA_REJECTION_NEUTER)
			{
				output("After last time, Bianca thinks you don’t have anything for her to play with. That’s why she’s surprised when you gently take her hand and lay it on your crotch, " + (pc.hasCock() ? "letting her feel up your [pc.cocksLight]" : "pushing into the crease of your [pc.pussyNoun]") + ". Fires start in her eyes and she goes into teasing you with heedless abandon, already putting your sexual equipment through its paces.");
				output("\n\n<i>“You grew something for me?”</i> she smiles. <i>“How exciting! I can’t wait to show you what you were missing out on! Don’t you dare think about going anywhere else, [pc.name]... because I’m not going to allow it. Not after you were so brazen!”</i>");
				output("\n\nHo boy!");
			}
			// Repeat Time - Got a compatible body back
			else if (flags["BIANCA_REASON_REJECTED"] == BIANCA_REJECTION_TAUR)
			{
				output("<i>“Hmm... I see you’ve had your fun with mods, [pc.name],”</i> Bianca straddles you, impressing the immense weight of her stacked rack on your form. <i>“I was hoping you would. The uncanny way you make me feel so... <b>ready</b> is something I was missing.”</i> Foxen fingers travel all across your body, finally ending at your pelvis. The teasing begins, dragging groans of soft bliss from your wheezing gut. <i>“You’re not leaving until I’ve had my satisfaction. I hope you understand.”</i>");
				output("\n\nYou do, oh stars, you do!");
			}
			// Repeat Time
			else
			{
				output("You purse your lips and ask Bianca if she can relieve your stress again");
				if (biancaFamiliarity() < 50) output(", the illicit rush of propositioning a married woman blazing through your veins");
				output(".");
				output("\n\nExcitement dawns in her speckled eyes. Before you know it, she’s caressing your");
				if (pc.isHerm()) output(" hermhood");
				else if (pc.hasCock()) output(" [pc.cocks]");
				else output(" [pc.pussies]");
				output(" with vulpine grace, easily building you up to full arousal. The brilliant and statuesque fox is everywhere, implacable and utterly self-assured. She strokes merrily, sussing out what you’ve got for her to work with, easing your muscles so that all the blood in your body can flow to where it matters.");
				if (flags["BIANCA_KNOWS_PC_DICK"] == 0 && pc.hasCock()) output("<i>“Ooh! You grew something wonderful, [pc.name]? I can’t wait to try it out! I wonder if I get to be the first to play with it?”</i>");
				if (pc.hasCock())
				{
					if (pc.isCrotchExposed()) output(" Your [pc.cocksLight] " + (pc.hasCocks() ? "rise" : "rises") + " eagerly for her, happy as can be when her " + (pc.hasCocks() ? "hands fly" : " flies") + " up and down the meaty, veiny " + (pc.hasCocks() ? "shafts." : "shaft."));
					else output(" Your [pc.cocksLight] strain against the confines of your clothing, every begging throb a cry for help.");
				}
				else
				{
					if (pc.isCrotchExposed()) output(" Your [pc.pussies] " + (pc.hasVaginas() ? "plump" : "plumps") + " at the slightest sapphic touches, parting slightly to allow for a steady trickle of [pc.girlCumNoun]. You’d bend over for anyone in this state.");
					else output(" She presses your clothing into your [pc.pussies] hard enough to dampen your gear with [pc.girlCumNoun]-scented excitement.");
				}
				// familiarity <=50
				if (biancaFamiliarity() < 50)
				{
					output("\n\n<i>“Are you sure about that, [pc.name]?”</i> the fox asks, voice barely above a whisper. <i>“There’s no turning back now, and I expect the best out of my partners.”</i> ");
					output("\n\nHer explorations have you moaning in a mix of blue pain and prickling pleasure. Bianca takes that as a signal to rub against you a little more forcefully, a faint and possibly sadistic smile cresting her light lips. ");
					output("\n\nThere’s no backing out of this. She’s gotten you <i>ready</i> from only a few firm gropes. Her fuzzy ears are wide open, waiting for the request gurgling in the back of your throat.");
				}
				// familiarity >=51:
				else
				{
					output("\n\nBianca looks you up and down, lips spread for mischievous laughter. <i>“I wonder what you’re going to ask today, [pc.name]. Just say whatever comes to mind, whatever seems natural, and I’ll find the right cure.”</i>");
					output("\n\nIt’s a small matter for her to antagonize you with squeezing gropes, forcing you to groan in a sweet, fox-pleasing blend of purple pleasure. Your");
					if (pc.isHerm()) output(" hermhood is");
					else if (pc.hasVagina()) output(" womanhood is");
					else if (pc.hasCocks()) output(" manhoods are");
					else output(" manhood is");
					output(" soaked in pheromones, and your mouth, twisting above it, growls with equal hunger.");
					output("\n\nYou know what she allows out here, but what will work best to satisfy her fathomless desires, too?");
				}
			}

			biancaSexMenu();
		}
	}
}

public function getBiancasSexualHealing():void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(5+rand(3));

	output("You don’t even get a chance to reach for your money before Bianca thrusts the medicine past your lips and offers the flask of water. Once the pills are sliding down to your gut you get a moment to wonder just why she’s being so forceful. The great results of biomedical advances surprises you the next second, purging your system of harmful elements. Your SSTD is cured, and Bianca is pleased.");
	// never Sexed Bianca
	if (flags["BIANCA_SEXED"] == undefined)
	{
		output("\n\nPerhaps too much, judging by the way she hums to your side. Did... did she ever realize what was on your mind, though?");
		output("\n\n<i>“Hmm?”</i> she tilts her head, ear swiveling. <i>“Is there something amiss?”</i>");
		output("\n\nAh well... there’s <i>always</i> next time......");
	}
	// sexed Bianca
	else
	{
		output("\n\n<i>“Now... how about we pick up where we left off?”</i> she purrs, scooting back. <i>“I haven’t forgotten how well you tease, [pc.name]...”</i>");
		output("\n\nOh boy.");
	}

	biancaSexMenu();
}

public function tellBiancaYouLikeBeingADiseaseBag():void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	processTime(1+rand(2));

	output("Gently pushing her off, you answer that you’re not going to take the medicine, and she gives you the strangest leer before shrugging her shoulders. <i>“Ah.... [pc.name], to be young like that. If you’ve been infected, then it’s going to remain and possibly mutate. You will not outlast this disease. I implore you to seek treatment as soon as possible, okay?”</i>");
	output("\n\nThat’s all fine and dandy... but you’re no less horny. No way you’ll be able to prompt her for some relief like this.");

	biancaSpendTimeMenu(true);
	flags["BIANCA_REASON_REJECTED"] = BIANCA_REJECTION_STD;
}

public function biancaSexMenu():void
{
	if (pc.hasCock()) addButton(0, "Handjob", letBiancaHandleTheSituation, undefined, "Handjob", "Ask Bianca to take the ‘hands on’ approach.");
	else addDisabledButton(0, "Handjob", "Handjob", "<b>You need a penis</b> for Dr. Ketria to get hands on with.");

	if (flags["BIANCA_SEXED_HAND"] == undefined || biancaFamiliarity() < 35) addDisabledButton(1, "Blowjob", "Blowjob", "You’ll have to get her more comfortable with you before you can ask this.");
	else if (!pc.hasCock()) addDisabledButton(1, "Blowjob", "Blowjob", "<b>You need a penis</b> for the doctor to take your temperature.");
	else
	{
		var badDicks:Array = new Array();
		for (var x:int = 0; x < pc.cocks.length; x++) if (pc.cLength(x) > 20 || pc.cThickness(x) > 3.5) badDicks.push(x);
		if (badDicks.length < pc.cocks.length) addButton(1, "Blowjob", penisRouter, [biancaBJ, pc.biggestCockVolume()+1, false, 0, badDicks], "Blowjob", "Tell Bianca you’re feeling a bit feverish.");
		else addDisabledButton(1, "Blowjob", "Blowjob", "Bianca will expect an oral creampie, and she’s not going to get it from a dick she can’t even fit her jaw around. <b>Decrease your girth!</b>");
	}

	var ballMilkSceneName:String = (flags["BIANCA_SEXED_BLUE"] == undefined ? "Get ‘Milked’" : "Ball Milking");
	if (biancaFamiliarity() < 40) addDisabledButton(2, ballMilkSceneName, ballMilkSceneName, "You’ll have to get her more comfortable with you before you can ask this.");
	else if (!pc.hasCock() || pc.balls < 1) addDisabledButton(2, ballMilkSceneName, ballMilkSceneName, "<b>You need to have a penis and external testicles</b> for this scene.");
	else if (!pc.hasStatusEffect("Blue Balls")) addDisabledButton(2, ballMilkSceneName, ballMilkSceneName, "You need to be very backed up for this. <b>Being blue-balled is no joke.</b>");
	else addButton(2, ballMilkSceneName, biancaMilkingFunctionNameThing, undefined ,ballMilkSceneName, "Bianca should know how to treat a case of [pc.cumNoun] congestion, right?");

	if (pc.hasVagina()) addButton(5, "Get Fingered", vaginaRouter, [biancaGetsHerFingersOnThePC, 0, 0, 0, 0, false], "Get Fingered", "Ask Bianca for an exploratory procedure.");
	else addDisabledButton(5, "Get Fingered", "Get Fingered", "You <b>need a vagina</b> for Bianca to explore.");

	if (flags["BIANCA_SEXED_FRIG"] == undefined || biancaFamiliarity() < 35) addDisabledButton(6, "Get Licked", "Get Licked", "You’ll have to get her more comfortable with you before you can ask this.");
	else if (!pc.hasVagina()) addDisabledButton(6, "Get Licked", "Get Licked", "You can’t ask someone to lick <b>a pussy you don’t have!</b>");
	else addButton(6, "Get Licked", vaginaRouter, [biancaLicks, 0, 0, 0, 0, false], "Get Licked", "Bianca’s given enough physicals. Time to <i>really</i> get her to work!");

	var boobMilkSceneName:String = (flags["BIANCA_SEXED_MILK"] == undefined ? "Get Milked" : "Boob Milking");
	if (!pc.hasBreasts()) addDisabledButton(7, boobMilkSceneName, boobMilkSceneName, "You will never see this unless you <b>get some boobs!</b>");
	else if (!pc.isLactating()) addDisabledButton(7, boobMilkSceneName, boobMilkSceneName, "You <b>need to be lactating and be rather full</b> to do this.");
	else if (pc.breastRows.some(function(boobie:Object, index:int, array:Array):Boolean{return boobie.nippleType != GLOBAL.NIPPLE_TYPE_INVERTED && boobie.nippleType != GLOBAL.NIPPLE_TYPE_NORMAL})) addDisabledButton(7, boobMilkSceneName, boobMilkSceneName, "You must <b>have normal or inverted nipples and be lactating</b> for this scene.");
	else if (biancaFamiliarity() < 40) addDisabledButton(7, boobMilkSceneName, boobMilkSceneName, "You’ll have to get her more comfortable with you before you can ask this.");
	else addButton(7, boobMilkSceneName, milkyBoobsForBianca, undefined, boobMilkSceneName, "Your boobs are so full of [pc.milkNoun] that they’re <i>sloshing.</i> Good thing there’s a tired and hungry doctor to help you with that, right?");

	if (flags["BIANCA_SEXED"] < 5 || biancaFamiliarity() < 49) addDisabledButton(10, "???", "???", "You’ll have to get her more comfortable with you before you can ask this.");
	else addButton(10, "Eat Her Out", biancaNomNomNom, undefined, "Eat Her Out", (flags["BIANCA_SEXED_LICK_HER"] == undefined ? "Bianca’s always there for you. Maybe it’s time to give back?" : "Turn the tables and tease Bianca for a change."));

	// Hide with [ ??? ] until familiarity reached.
	// Requires Penis, Familiarity >=50, Must have done [Handjob] twice, [Blowjob] once
	if (flags["BIANCA_SEXED_HAND"] < 2 || flags["BIANCA_SEXED_BLOW"] < 1 || biancaFamiliarity() < 49) addDisabledButton(11, "???", "???", "You’ll have to get her more comfortable with you before you can ask this. Get her used to your cock!");
	else if (!pc.hasCock()) addDisabledButton(11, "Thigh Sex", "Thigh Sex", "Sticking a penis between Bianca’s legs would be a legendary feat... <b>considering you don’t have one.</b>");
	// Has variant for PC in Rut
	else if (pc.inRut()) addButton(11, "Thigh Sex", rutBiancasThighs, undefined, "Thigh Sex", "Ask Bianca if you can put her biggest asset to the test. <b><i>Emphasis on ass.</i></b>");
	// Use penis router if Not In Rut
	else addButton(11, "Thigh Sex", penisRouter, [fookinBiancasLegs, pc.biggestCockVolume()+1, false, 0], "Thigh Sex", "Ask Bianca if you can put her biggest asset to the test. <b><i>Emphasis on ass.</i></b>");

	flags["BIANCA_REASON_REJECTED"] = undefined; // if we're here she didn't reject you, after all
	// set bianca cock knowledge flag
	if (pc.hasCock()) flags["BIANCA_KNOWS_PC_DICK"] = 1;
	else if (flags["BIANCA_KNOWS_PC_DICK"] == undefined) flags["BIANCA_KNOWS_PC_DICK"] = 0;
}

public function letBiancaHandleTheSituation():void
{
	clearMenu();
	clearOutput();
	// sceneName: HANDIWORK
	// load bust 'bianca_work'; she does not undress in this scene
	showBust("BIANCA_WORK");
	showName("\nHANDIWORK");
	author("William");
	processTime(5+rand(5));

	output("If this kind of foreplay were taking place in public, Bianca would land herself smack dab on the cover of every magazine as a sex-starved slut. Imaginations aside, you are just <i>in love</i> with the way she pokes and rubs your [pc.cocks]. Leaned back against a");
	switch (getPlanetName().toLowerCase())
	{
		case "mhen'ga": output(" rock"); break;
		case "tarkus": output(" solid surface"); break;
		case "myrellion": output(" wall"); break;
		default: output(" wall"); break;
	}
	output(", breathy and lust-amplified moans come easy. Her fingers stroke your");
	if (!pc.isCrotchExposed()) output(" clothed");
	if (pc.hasCocks()) output(" boners");
	else output(" boner");
	output(" with an imbued practice only attainable from a lifetime of lovemaking.");
	if (flags["BIANCA_SEXED_HAND"] == undefined)
	{
		output("\n\nYou haven’t even given an answer yet and you could blow at any moment! Between shuddering gasps and dirt-scraping clenches, you tell her to use her hands, that you <i>want</i> that more than anything else right now.");
		output("\n\n<i>“I was wondering when you’d ask, [pc.name],");
	}
	else
	{
		if (rand(2) == 0) output("\n\nYou thought you’d be in more control than the first time, but she learned everything about your [pc.cocksLight]. You do, however, stumble over fewer words when you manage to growl out how much you’d love for her to give you a handjob.");
		else output("\n\nDr. Ketria’s only focused on your [pc.cocksLight], but she’s reaching everywhere through " + (pc.hasCocks() ? "them" : "it") + ". Your entire body curls to her masterful technique, puffing out tangled-up words. In the hands of someone so experienced in handling dick, you almost can’t respond. Fortunately, your request for a handjob <i>eventually</i> registers.");
		output("\n\n<i>“Very well, [pc.name], let’s get started,");
	}
	output("”</i> Bianca coos, her voice sparking a warm tingle that blossoms out from your torso. She straddles your sitting form, leaning in for a hot, fruit-flavored kiss while setting herself down atop your [pc.legOrLegs]. Huge, flared hips prevent you from budging even an inch.");
	
	output("\n\nGraceful foxen hands jack <i>hard</i> around [pc.eachCockHead], always flourishing at the end of their tip-ringing squeezes. Rubs of toying pleasure make their way down your cum-vein, strings of thick stuff clinging to your crest" + (pc.hasCocks() ? "s":"") + ". Full, savory lips that taste of peach and faint, strawberry lipstick overpower yours, making way for a glossy pink tongue. Every second that passes in sensual" + (biancaFamiliarity() < 50 ? ", taboo":"") + " closeness reinforces Bianca’s intrinsic nature as a lover, not a skank who’ll pump you and dump you.");
	output("\n\nThe doctor’s not fooling around: she’s stroking your cheek and [pc.hairNoun] with a " + (!pc.isCrotchExposed() ? "sweat-glazed hand":"sex-glazed hand") + ". Her sprawling, jutting bosom gently pushes into your [pc.chestNoun], setting off cute gasps from the lewd smushing. You think it’s your heart beating so dangerous a rhythm, but it’s her percussive symphony on top that plunges you into a void where the only senses that you get on by are touch and taste, bound in harmony by supernatural empathy.");
	output("\n\nPitching her coat to the side, Bianca’s large, fluffy tails stretch out and swish through the air in bending S-shapes. They must be generating a charge of some kind, because her handiwork has gotten firmer and stronger");
	if (!pc.isCrotchExposed()) output(", visibly aggravated by the obstructing layer of your [pc.crotchCover]. She shucks your kit until your masculinit" + (pc.hasCocks() ? "ies spring" : "y springs") + " out in full, proud tumescence");
	output(".");

	output("\n\nA sort of sovereignty exudes from Bianca when she looks down to your [pc.belly], analyzing you from stomach to sternum. Her expression is solid, determined. There’s this sensual self-security in her that makes you quiver with anxious pleasure");
	if(!pc.isChestExposed()) output(", particularly as she pulls apart your top to " + (pc.biggestTitSize() >= 4 ? "let your [pc.breasts] spill out":"reveal your [pc.chestNoun]"));
	output(".");
	output("\n\nYour foxy paramour’s alluring exterior morphs into one of excitement and control. Those two forces are glued together by what’s stuck in the considerable canyon of her luscious thighs.");

	addButton(0, "Next", furtherBiancaHandies);
}

public function furtherBiancaHandies():void
{
	clearMenu();
	clearOutput();
	// sceneName: HANDIWORK
	// load bust 'bianca_work'; she does not undress in this scene
	showBust("BIANCA_WORK");
	showName("\nHANDIWORK");
	author("William");
	processTime(5+rand(5));

	var bigCock:int = pc.biggestCockIndex();
	var tentacle:Boolean = pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_TENTACLE;

	// pc biggest Cock Size <6
	if (pc.biggestCockLength() < 6) output("<i>“Hehe, this is the perfect amount for someone to enjoy every bit of,”</i> Bianca says, fully gloving your [pc.cockType " + bigCock + "] shaft in her hand from tip-to-base, staining her palm with bubbling pre. <i>“I can do so much with this... and,”</i> she swivels nimbly around the neck, <i>“you’re going to love how sensitive a cock this size <b>really</b> is.”</i>");
	// pc biggest Cock Size <12
	else if (pc.biggestCockLength() < 12)
	{
		output("<i>“You’re well endowed, [pc.name],”</i> Bianca whispers, tilting her head. Your [pc.cockType " + bigCock + "] prong wears her fingers like an overcoat - the [pc.cockHead " + bigCock + "] sticks out at the top of her knit fingers, oozing fat wads of stiffness-buffing prejizz. She jerks your pole to and fro, releasing and grabbing it in drumming motions,");
		if (flags["BIANCA_SEXED_HAND"] == undefined) output(" admiring its bestial length");
		else output(" rediscovering how much fun it is to take hold of a cock this big and warm");
		output(". <i>“I love watching your face when I touch it here... or there... you could very easily leave a <b>lasting impression</b> in someone with this.");
		if (flags["BIANCA_SEXED_HAND"] == undefined) output(" I think the creases in my palms are showing the effects of that.");
		output("”</i>");
	}
	// pc biggest Cock Size <20
	else if (pc.biggestCockLength() < 20 || tentacle)
	{
		output("<i>“" + (silly ? "Ara ara" : "My my") + ", [pc.name], all of this for me? For anyone you bed?”</i> Bianca giggles, leaning back with your [pc.cockType " + bigCock + "] pillar reaching all the way to " + (pc.biggestCockLength() < 16 ? "her breasts" : "her mouth") + ", throbbing demandingly, bubbly balls of [pc.cumGem]-[pc.cumColor] erupting from the [pc.cockHeads]. Now with not just her hands, but her wrists and forearms, she hugs your dick closer, breathing across its neck, nuzzling her cheek to your turgid bone. <i>“I wonder how many you’ve taken with this... how many satisfied partners you might have stretched...”</i> A predator’s grin takes it place on her lips. <i>“I bet none of them have made or will make you feel as good as I can.”</i>");
		output("\n\nIs she feeling challenged?");
	}
	// pc biggest Cock Size >21 (hyper) (not for tentacles)
	else
	{
		output("\n\nYour [pc.cockType " + bigCock + "] dick was burgeoning before, but now with her steering your fuckstick, and with the eager touch of feminine contact, your well-formed bulk is swelling to the heavens. It keeps growing... and growing; it’s a totem pole that casts a shadow over you like a sundial, and it reaches well up past her head. A stripper could <i>perform</i> with your taut tool. <i>“Only an ausar... no, only a laquine or a leithan could hope to accommodate this!”</i> she exclaims, moving in closer to nuzzle your immobilizing dong, lapping at the sheening slime with [pc.cockHead " + bigCock + "]-vibrating moans. <i>“I’ll bet your release is something to <b>envy.</b>”</i>");
		output("\n\nNot only does she sound challenged by it, she sounds <i>hungry.</i>");
	}
	// pc Rut
	if (pc.inRut())
	{
		output("\n\n<i>Smooch.</i> Bianca pecks your cock in what starts off as a chaste, sexless gesture. Her silky hair brushes over the shaft of your distending girth like a cool breeze, contrasting with more wet, slurpy kisses to your sizzling firmness. <i>“Mmhff, it’s been... so long...”</i> ");
		output("\n\nThose words rumbled out like the roar in a lioness’ throat. Clearly your spot of rut must be affecting her in a few <i>very</i> good ways if the drool leaking out the corners of her cock-drunk mouth is any indication. Since she’s so distracted, you push it closer to her face just a little, encouraging her to do more.");
		output("\n\nSadly, she regains control.");
	}
	// Merge
	output("\n\nFoxen fluff swerves around to caress your cheek and your [pc.hairNoun], delivering little love-taps to your sides, [pc.belly], and [pc.thighs]. It’s been only a few minutes, but you can’t believe how <i>hard</i> and <i>hot</i> you’ve gotten. Stimulated from all over, faint hums and purrs overtake your thoughts. Bianca’s devouring your mind with her sweet presence, her tender touches, and her ravenous atmosphere. Her influence spreads like oil on water; the sensation is so acute! It’s easy to slip back into a realm of pinkish hues, " + (pc.balls > 0 ? "feeling tight like a spring in your [pc.ballsNoun]" : "on the cusp of explosive orgasm") + "...");
	output("\n\n<i>“Urggh!”</i>");
	output("\n\nImpending orgasm dimmed your face for a moment, only to be banished like a shadow under light when Bianca " + (!tentacle && pc.biggestCockLength() >= 20 ? "clamped down on your aching dong like an industrial press" : "exerted a deathly grip on your [pc.base " + bigCock + "]") + ". You look up, wincing and whimpering, to be greeted by a bright, ominous smile. <i>“I don’t want my clothes dirty, [pc.name],”</i> she says, eyes closed. <i>“This position is really comfortable too... I’ll be here a while.”</i>");
	// pc Cock Virgin
	if (pc.cockVirgin) output("\n\nThe fact that you’re a virgin isn’t lost to Bianca. <i>“The pleasure washing through your groin, through your face... " + (flags["BIANCA_SEXED"] == undefined ? "this is an inexperienced cock, isn’t it?" : "are you saving yourself for someone special?") + " That’s adorable!”</i> Embarrassment blooms across your face. <i>“There’s absolutely nothing for you to be upset about. Really, [pc.name]! When you find someone you can love, I’ll prepare you for them. Everyone starts somewhere. Think of my mmmm... hehe... <b>training</b> as a little blessing.”</i>");
	output("\n\nYour deeply denied groans elicit a sharp giggle from the suddenly sinister fox as her waist swivels back and forth, grinding the front of her crotch into your tremulous [pc.knotBallsHilt " + bigCock + "] with boob-jiggling delight. She exhales an opaque fog, middle and ring finger rehearsing the first of many surging cumshots on your dick -- this motion is repeated until spittle froths at your lips. Every breath you take <i>stings.</i>");
	output("\n\n<i>“I’m very good at what I do, [pc.name].”</i> She opens her eyes, delighting in your struggling. You squirm and lurch aggressively in the aftermath of your tectonic rejection, quaking [pc.cocksLight] imprisoned between her palms trembling towards stillness. Now her tails reveal their true purpose: to torment you, to wick away the bliss. The gold-and-white appendages break you into a puzzle for the domineering doctor to piece back together.");
	output("\n\n<i>“Treating the wounded is only one of my specialties.”</i> Bianca lifts up, wrapping her arms like a shawl around your [pc.cocksLight], then falls, cradling " + (!pc.hasCocks() ? "it":"them") + " close, refusing " + (!pc.hasCocks() ? "it":"them") + " to produce even a single droplet of lube. She lets go at just the moment you feel an overstuffed discomfort, and even then, it’s a slow seepage that offers little relief. <i>“" + (flags["BIANCA_SEXED_HAND"] == undefined ? "Taming a beast is another." : "But you already knew that.") + "”</i>");
	output("\n\nGone is the decorum in her violet eyes, and now, gone are her glasses: she yanks them off and shakes out her long hair. Amorous animosity shines full-bore on you with the power-limiter removed. What you see in the sexy doctor’s glimmering gaze is the look of a... not quite a domme, but something close. She handles you with overpowering authority, much like a beastmaster would an unruly kit, watching your sexual self-destruction with twinkling merriment.");
	clearMenu();
	addButton(0,"Next",furtherBiancaHandies2);
}

public function furtherBiancaHandies2():void
{
	clearMenu();
	clearOutput();
	// sceneName: HANDIWORK
	// load bust 'bianca_work'; she does not undress in this scene
	showBust("BIANCA_WORK");
	showName("\nHANDIWORK");
	author("William");
	processTime(10+rand(5));

	var bigCock:int = pc.biggestCockIndex();
	var tentacle:Boolean = pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_TENTACLE;

	output("You writhe, thrusting upward, [pc.tongue] spooling out of your mouth like a ribbon unraveled - you’re helplessly realizing her strength" + ((!tentacle && pc.cocks[bigCock].cLength() >= 20) ? " even though the burdensome weight of your heaven-piercing schlong is enough to keep you in this shameful position":"") + ". Your predicament is something Bianca’s too pleased to explain while you cope with six-and-a-half feet of matronliness chaining you between plump, clutching restraints.");
	output("\n\n<i>“Being denied an orgasm isn’t always pleasant, even if it is your kink. Your muscles tend to seize up. It throws your thoughts into chaos. It makes you... rather defenseless.”</i> Her mouth hangs open at the last hissed syllable while she pets your [pc.cocksLight] to maintain hardness. The doctor’s libido visibly magnifies proportionally to how broken down you feel. She continues in a musically wicked tone, <i>“That’s the way I want you right now, [pc.name],”</i> Bianca husks. <i>“I want you to <b>want release</b> more than you want anything else. It is what it is... in order to treat you, I have to use elaborate and sophisticated methods.”</i>");
	output("\n\nWere she not on top of you, you’d have lost your motivation. Masturbating would be fruitless, and even if you came it’d do nothing to suppress the sensory anarchy. Bianca being there doesn’t make it much better, either. She’s riding you through the contractions and convulsions until you’re back at square one");
	if (silly) output(" on the level, ready to swear right here right now before the devil");
	output(". <i>“Hehe, now you’re all mine, [pc.name]! Let’s get back to it, I almost couldn’t wait!”</i>");
	// size Hyper (not for tentacles)
	if (!tentacle && pc.biggestCockLength() >= 20)
	{
		output("\n\nYou buck against Bianca’s pressure. There’s so much slippery penile presence for her to weigh down on. The taste of your juicy, glorified breeding organ makes her eyes roll halfway back. The fox is riding it like a carnival attraction, every part of her body slapping down on the oiled shaft. Her lust-puffed mons can be felt through the tightness of her pants, enamored by the proximity of a beastly boner. She knows how to court a cock, but it’s clear she’s given up on finesse in the face of this unwieldy fuck-club you’re bearing, because she’s tonguing your cumslit like the bulged-out phallic pussy it is.");
		output("\n\nShe’s deliriously aroused by it, smiling coyly the whole time. It awakens a feral sort of <b>yearning</b> in her. Your dick would never fit inside her, and that upsets her. It whips her unsated body into a frenzy. She’s too polite to moan or scream, but her indiscrete hunger writes its screeds upon your veiny beast until it’s glistening in the agitated arousal of a supremely horny fox-woman.");
		output("\n\nThe worst feeling comes when she stuffs a finger in the hole and clogs the pipe, see-sawing back and forth. The momentum of your massive dong nearly throws her loose. The look on her face while she vents your slavering pressure, feasting on the buffet of cock-slime that flows, is the sluttiest you’ve ever seen. She’s careful to avoid dirtying her clothes, but the sheer amount of musk you attach to her won’t be masked entirely by perfume, and that’s a thought your [pc.cockType " + bigCock + "] serpentine is happy to fix in your mind.");
	}
	output("\n\nHer pre-lubed hands are back to pumping your aching mast faster and faster. Flaw-free fingers expertly map the ridges and wrinkles in your virile muscle, smoothing them out with single, soft strokes. What should be delightfully pleasurable is only making you spasm from the waist down, scrabbling at the ground until your next cock-pleasing thumbing.");
	output("\n\nBianca’s heavy breaths get hotter and more frequent; sweat jumps from her bangs in large beads, disembarking for your abdomen. You try to look away and cum, but you’re inexorably drawn back to be disciplined. Clutched in her scissoring thighs you’re strained, being trained. Once, you tried to grab a tail, but you never had a chance. She can sit on you forever: it’s up to her to get you off now. ");
	output("The expanding puddle of prejizz boiling from your hand-fucked length" + (pc.hasCocks() ? "s":"") + " is proof that your [pc.cocksLight] belong" + (!pc.hasCocks() ? "s":"") + " to her, and that she is fully responsible for your body’s functions.");
	output("\n\nFortunately... it starts to feel a lot better. Sure, you don’t have any say in this and you’re more like her test subject, but getting blue-balled");
	if (pc.hasStatusEffect("Blue Balls")) output(" even worse than you already are");
	output(" was kinda worth it! Only she could use her hands like fans, pawing at your flexing, [pc.cumNoun]-slathered " + (pc.hasCocks() ? "pricks" : "prick") + ", each successive touch wetter and easier. Curving palms cup " + (pc.hasCocks() ? "one" : "your") + " shaft in a semi-circular way and starts at the bottom, sliding up on a channel of lube, whipping droplets of [pc.cumGem] gunk into the air and onto her face when it slaps off the peak. It’s immediately followed by the other hand, and so forth. Her vigorous teasing stimulates a ceaseless flow of drooling pre-cum which smears her to the elbow in a fancy [pc.cumColor] sleeve.");
	// pc Cock Tentacles (requires two or more)
	if (pc.tentacleCockCount() > 1)
	{
		output("\n\nYour arboreal cocks are thin, wriggly, slimy, and sometimes have a mind of their own. The tendrils Bianca’s not jacking tend to weave upwards to her face, only to be gripped by their necks and added into a bushel.");
		if (pc.tentacleCockCount() > 2) output(" It takes a little extra, comical wrangling to bunch the ornery strings together.");
		output(" <i>“Really, [pc.name]. The transformatives that offer this style of reproduction are dangerous for use. But, even so,”</i> she giggles, <i>“did you think I wouldn’t resist sucking on it?");
		if (silly) output(" Do I seem like a hapless hentai heroine?");
		output(" These things would turn me into a puppet all for their pleasure, yours secondary.”</i> ");
		output("\n\nThat sounds fucking hot, to be honest.");
	}
	else
	{
		// pc Cock Canine
		if (pc.cocks[bigCock].cType == GLOBAL.TYPE_CANINE) output("\n\nBianca sniffs with innate fascination, sliming her palm in your [pc.cockColor " + bigCock + "] rocket’s output. Her tongue emerges slowly, aimed at the center of the puddled pre on your pointed puppy-cock, licking all the way to her fingers. <i>“An ausar’s- a <b>canine</b> cock is so beastly... so animalistic, isn’t it? Perfect for an alpha mate. Watching the knot swell up is the best part; the second is that raw scent. Feeling it throb on top of an orgasm is... oh, I certainly won’t ever tire of that sensation.”</i> Her wrists harden and her hands squeeze tight on your doggie-dong, fingertips pressing into the vein-rich bulb at its base. <i>“You’ll breed my hand thoroughly, won’t you, [pc.name]?”</i>");
		// pc Cock Equine
		else if (pc.cocks[bigCock].cType == GLOBAL.TYPE_EQUINE) 
		{
			output("\n\nSlinking back, Bianca’s tongue falls slack from her mouth. She drags it across the largest part of your horsecock, wedging her nostrils into your equine endowment’s medial ring");
			//hasBalls:
			if(pc.balls > 0) output(" and then the crease between your sheath and nutsack");
			output(". <i>“These cocks... these proud, bestial, <b>primal</b> cocks... their smell always comes so close to getting me. If only, [pc.name]...”</i> Bianca simpers, kissing your sheath imploringly, wiggling a finger into that hypersensitive locale, <i>“...if only you knew how much I want to <b>submit</b> to this musk. Maybe next time you’ll get to see that?”</i> She takes another whiff of your stallion girth in open desire, teasing the flare into billowing. <i>“Feeling this between my hands is just as good as feeling it inside me. I’m holding something so valuable it radiates its wonderful glory...”</i>");
		}
		// pc Cock Feline
		else if (pc.cocks[bigCock].cType == GLOBAL.TYPE_FELINE) output("\n\n<i>“It’s funny,”</i> Bianca says, practically scrubbing her hands with your nodule-laden shaft, <i>“there are so many people who dislike a kaithrit’s... I mean, a feline penis. I’ve never understood the disdain. Perhaps it’s just the way it looks?”</i> She pinches one of the barbs after another hand-pumping, and you cry out in pleasure. <i>“These all have nerve-endings... and they pleasure a clitoris hands-free! The tip is smooth and slightly pointed, making entrance and handling easier.”</i> She demonstrates the fact by wheeling her fingers against your penile protrusions, flicking at them all by her fingertips. <i>“All cocks have their unique benefits, but no cock has a downside.”</i>");
		// pc Cock Suula
		else if (pc.cocks[bigCock].cType == GLOBAL.TYPE_SIREN) output("\n\n<i>“Hehe, a suula’s cock, hmm, [pc.name]? Are you the mischievous, surprising type?”</i> She grips one of the tendrils ringing the head of your alien cock, grinning before bedding them all in her palm. <i>“Suula venom isn’t dangerous...”</i> A stab to her skin coaxes a telling growl from her stomach. Even a few ounces of raw chemical libido is enough to elevate her animalistic urges. <i>“...But it is highly potent,”</i> she furls. <i>“My hands are going to be numb for a while. Just imagine what I would look and even feel like if I took this in my mouth... or between my legs?”</i> That idea, and the effect of the venom bleeding back on you, is almost enough to get you to bust then and there.");
		// pc Cock Human (or Unspecified)
		else
		{
			output("\n\n<i>“I really like what you have, [pc.name]. I’ve already found the biggest veins,”</i> she says, punctuating her point with another squeeze and tracing rub to a swollen duct. <i>“That feeling? What you’re feeling when I do this?”</i> Your head arches back on her pulmonary command, though you’re not sure if it’s out of stubbornness or pleasure. <i>“That’s when you’re at your very hardest.");
			if (pc.cocks[bigCock].cType == GLOBAL.TYPE_HUMAN) output(" Human cocks are looked down upon as generic in the galaxy, but, if you don’t mind me saying... that is a fact-free opinion. Our species has the most sensitive heads; the glans is more nerve-rich than any other race’s,<i>“ she grins, proving what she says by coaxing a squeak from your lips, two-fingers rounding your egg-shaped crown. ”</i>You’ll know <b>just</b> how sensitive when I’m done.");
			output("”</i>");
		}
		// Multicock (does not trigger if the Tentacles cock ref was used)
		if (pc.hasCocks())
		{
			output("\n\n<i>“Mmhh, you’re really giving me a test, too. You’re the only person I’ve seen with " + (pc.cocks.length == 2 ? "an extra cock" : "extra cocks") + ",”</i> she remarks, jacking " + (pc.cocks.length == 2 ? "them both" : "two") + " in rapid, orgasm-snaring patterns. With a naughtiness not often expressed she presses them together, grinding your [pc.cockHeads] against one another until the nerves explode in a starburst of lung-crushing joy. You bark out like a dog, heaving hard... and then she denies you a climax primed to split between them. <i>“I’m never going to " + (flags["BIANCA_SEXED_HAND"] == undefined ? "forget" : "get tired of") + " that sound!”</i>");
			output("\n\nT-That’s so mean...!");
		}
	}
	// Balls
	if (pc.balls > 0)
	{
		output("\n\nThe frisky fox scoots back, glancing past your conquered " + (pc.hasCocks() ? "poles" : "pole") + " to your [pc.sack]. <i>“All this time, and I’ve not been giving this any attention. Let’s change that, [pc.name]!”</i> she gleefully declares, eyeing your lust-fattened pouch with unrestrained gluttony.");
		output("\n\nDr. Ketria pushes your " + (pc.hasCocks() ? "penises" : "penis") + " down by the [pc.knotOrSheath " + bigCock + "] and hefts your");
		if (pc.scrotumType() == GLOBAL.SKIN_TYPE_FUR || pc.hasFur()) output(" fuzzy");
		else if (pc.scrotumType() == GLOBAL.SKIN_TYPE_SKIN || pc.hasScales()) output(" scaly");
		else output(" doughy");
		output(" nutsack, glistening with ballsweat, moaning softly after " + (pc.balls == 1 ? "the single testicle" : "one heavy ball") + " on her palm pulses and bounces with pure joy, ready to offer up its bubbling, sloshing contents. [pc.CumColor] ropes squirt out from [pc.eachCockHead] when her curious fingers sink into the supremely soft pouch, arcing parabolically into the dirt. <i>“Ooh... hehe, a " + (pc.isHerm() ? "hermaphrodite" : pc.mf("man", "girl")) + "’s proof of virility is very important. It deserves ample attention...”</i> she kneads the roiling contents thirstily, <i>“...<b>it deserves respect.</b>”</i>");
		if (pc.ballSize() < 8)
		{
			output("\n\nYour trembling [pc.ballsNoun] fill" + (pc.balls == 1 ? "s":"") + " her hand perfectly");
			if (pc.ballSize() >= 6) 
			{
				if(pc.balls > 1) output(", their extra-large sizes spilling between the gaps of her wily fingers");
				else output(", its extra-large size spilling between the gaps of her wily fingers");
			}
			output(". With both hands she can easily cup " + (pc.balls == 1 ? "it":"them") + " in her dainty hands.");
		}
		else if(pc.ballSize() < 16) 
		{
			output("\n\nYour massive sack is too much for Bianca to possessively cup, even with both hands. When she tries to take possession of your slippery " + (pc.balls > 1 ? "jewels, they spill" : "jewel, it spills") + " through the gaps of her fingers and envelope" + (pc.balls == 1 ? "s":"") + " her digits in copious nutflesh. Unclaimed seed splashes in her worshipful grip, actively brewing up a more filling load with each ecstatic contraction.");
		}
		output(" When she’s paid desperate homage to your cum-swollen orb" + (pc.balls > 1 ? "s":"") + ", she brings her hands up to her nose, inhaling giddily, licking up the musky liquid maleness clinging to them and achieving an instant contact high. <i>“Ahhhamazing...! Your cum will taste so good! I can tell... just from this smell...”</i>");
	}
	// Knot
	if (pc.hasKnot(bigCock)) output("\n\nWhen Bianca’s not edging you, she’s emphatically devoted to your [pc.knots]. If your " + (pc.isHerm() ? "herm" : "man") + "-hood was her family, then it’s not hard to see who the favored member is. The more she plays with " + (pc.totalKnots() > 1 ? "them" : "it") + ", the more unstable " + (pc.totalKnots() > 1 ? "they become" : "it becomes") + ", growing until " + (pc.totalKnots() > 1 ? "they look" : "it looks") + " like balloons ready to burst. <i>“Knots are my favorite. My absolute favorite, [pc.name]!”</i> she rubs insistently, abandoning your handjob for to indulge in her selfish fetish. <i>“When I squeeze " + (pc.totalKnots() > 1 ? "these" : "this") + " again, you’ll cum.”</i> You moan, believing every word. <i>“You may not think it possible, but this is so sensitive right now that you’re going howl like a wolf when I want you to! It’s going to be the best! Thank you for giving me this opportunity" + (flags["BIANCA_SEXED_HAND"] == undefined ? "" : " again") + "!”</i>");
	// Merge
	output("\n\nEuphoric circles are twirled below your [pc.cockHeads]. Coherent thought is a thing of the past - your world condenses down to a singular emotion: <i>feels good please let me cum!</i> You’re a fluttering and easily-hit target for the matchless experience of a fervent, lusty woman. It’s possible your brain is beginning to shut down. This ‘treatment’ only makes you realize how much of your life could be a mantra on repeat: <i>more, more, more!</i> If Bianca felt like blue-balling you for a long game, she could");
	if (pc.isNice()) output(" make you beg and whine");
	else if (pc.isMisch()) output(" make you cry");
	else output(" be the only one to make you beg");
	output(" for anything just by looking at you wrong.");
	output("\n\n<i>“Good [pc.boyGirl].”</i>");
	output("\n\nKnee-high rivers of [pc.cumVisc] precum burst forth; you’re incapable of focusing. Lakes of off-[pc.cumColor] spooge pool at your navel and drip down your sides; you can’t hold onto your being. Those two simple words <i>shape</i> you into the form she wishes, one that’s gushing out intensifying flumes.");
	output("\n\nIn front of Bianca, a monument of female power, you sound whorish and desperate. Bolts of pleasure race up your spine while the doctor slaps your hands away from your crotch. <i>“Want to cum?”</i> she giggles in her cutesy, mocking voice. <i>“You can’t; not yet.”</i>");
	output("\n\nT-T-This is a crime! Ugh, that’s not fair! You reach back again and she bats you away, falling forward ass-up to lock you in another kiss, using your head and neck as support for an oral encore. Her hands are gliding effortlessly on endless effluvia, moving with a thrilling blur. Her muscle control is unerringly precise, and she keeps her grip where none else might, making you so very aware of just how much she loves to play with your burning-hot dick.");
	output("\n\nA deep whine builds in the back of your throat, pleasantly vibrating the milf-flavored tongue tying yours. A familiar, assiduous movement can be felt under all her weight, and on some level you realize she’s allowing you to walk the very edge of bliss, swirling you around the precipice in preparation for the finale. Bianca is a handjob genius primed to squeeze out every last drop of semen.");
	output("\n\nLace-like fingers accelerate their slide across every inch of your meaty " + (pc.hasCocks() ? "swells" : "swell") + ". She stirs the liquid maelstrom churning below your [pc.skinFurScalesNoun], crackling and bubbling with abused pressure, ready to erupt at a moment’s notice. Your mewls are muffled by her mouth; your");
	if (pc.hasKnees()) output(" [pc.knees] bend and your");
	output(" lower body jerks upward through her linked hands like an onahole.");
	if (pc.hasVagina()) output(" A sneaky trespass onto your overheated vaginal folds is all your puffed-out pussy needs to twitch, ready to join its manly counterpart" + (pc.hasCocks() ? "s":"") + " in orgasm.");
	output("\n\nThe fox spreads her legs wide and stands as far as she can when a cortical-scrubbing orgasm shuts down everything all non-reproductive systems. Wracked by postponed breeding desire, your screaming voice drowns in her slavering maw. She breaks the kiss");
	if (pc.hasKnot(bigCock)) output(" and squeezes your [pc.knots] to simulate the effect of rutting a fertile cunt, fooling your baby-making urges into committing for a grander release");
	output(" -- a hollow gasp later, you howl hoarsely to the sky and anything nearby that your ejaculation is to be <i>envied.</i> Sperm-packed relief stuffs your fat girth as your cum-tanks pump out all the edged pleasure.");
	if (pc.hasCockFlag(GLOBAL.FLAG_FLARED, bigCock)) output(" Your flare blossoms outward, a seal plugging nothing in yet opening for extra stimulation.");
	output("\n\n<i>“Cum for me. Let it all out, [pc.name].”</i>");
	// pc cum volume Low, <2500mL
	if (pc.cumQ() < 2500)
	{
		output("\n\n[pc.Cum] bursts from your lust-sore [pc.cockHeads], their ropy trajectories carrying them only a few inches from your [pc.footOrFeet]. Bianca’s hand pumps in rhythm with your spurting");
		if (pc.balls > 0) output(", your [pc.sack] clenching against her skin when she hits the bottom");
		output(", easing out your repressed passions. You pound your left fist into the ground, feeling her dancing tongue carry you through the red-hot beginnings into a cool, purplish ending. Your [pc.hips] shallowly jerk out the rest of your seed-filled loads into a [pc.cumVisc] [pc.cumGem] puddle that dribbles down your shaft, spunking her hand until your worries recede into the sparkling horizon of her violet eyes.");
		output("\n\n<i>“Well done,”</i> Bianca titters, dappled in [pc.cumColor] jizz, tending your tortured [pc.cockNoun " + bigCock + "] as it deflates. <i>“You managed to hold on wonderfully, [pc.name].”</i>");
	}
	// pc cum volume High, <6500mL
	else if (pc.cumQ() < 6500)
	{
		output("\n\nYour [pc.cocks] bulge with the onrush of [pc.cum], warm, thick, rising to great apexes before falling to the ground. What should be a release of tension is painful due to your position. In a red-colored world you’re jerkily working your [pc.hips], spunking Bianca’s hands for dear life. [pc.CumVisc] missiles of steaming, erotic relief smash against the terrain, splattering into soil-lacquering puddles. Your doctor’s taking very good care of you, matching the flexes of her wrists to the [pc.cumColor] eruptions");
		if (pc.balls > 0) output(", fondling your [pc.sack] to drain your reservoir of every last drop");
		output(". Shivering in gooey climax, you defy her body weight and thrust upward when your muscles clench, taking a deep gasp mid-load before smearing your goo into her forearms.");
		output("\n\nHer tantalizing tongue is there too, guiding you to the purple-hued paradise beyond the lancing scorch of long-abated orgasm. You’re slamming so hard that she has to move forward to avoid getting soaked in spooge, and your [pc.cockHeads] bust a sloppier nut with the friction of her pants at the nadir of their most orgasmic ascents. With your inner heat spent, your orgasm reduces to a relaxing dribble that trickles down your shaft, eased by jacking hands firm as tightened fists.");
		output("\n\nThe location of your affair has become a [pc.cumNoun]-scented glade.");
		output("\n\n<i>“Wonderful, [pc.name]. That was incredible...”</i> Bianca murmurs, her violet eyes the horizon at the end of your tryst.");
	}
	// pc cum volume Hyper, >=12000mL
	else
	{
		output("\n\nBianca pins you down when the raging sluice of masculine release bursts like a geyser, distending your penile " + (pc.hasCocks() ? "vents" : "vent") + " with a capacity of [pc.cum] too much for any race’s biology to reasonably handle. First you had to deal with the burn of delayed orgasm, but now there’s a lack of control in how you get off that has you thrashing in her calming grip, gushing like an out of control cum-stud, being milked like some farmyard animal.");
		output("\n\nYou’re slamming your [pc.hips] upward with all you’ve got, and Bianca has no choice but to fall to one side to avoid the great fountaining gouts of [pc.cumGem] seed. Fat columns of [pc.cumVisc], gurgling thickness launch into the air as rapidly and forcefully as your plumbing can eject them. [pc.CumNoun] is raining down on this location or buffeting the terrain at hypersexual velocity, eddying like party streamers through the local atmosphere. Urethral-bulging volume flows in unbroken streams like a hose, and Bianca’s there too, kissing you through the worst of it, guiding you from a red-hot beginning to a shivering, lovely orgasm");
		if (pc.balls > 0) output(", fondling your [pc.sack] to aid your once-repressed expressions");
		output(".");
		output("\n\nUnable to breathe, you still manage to open your eyes: your [pc.cocks] are still pulsing spasmodically and throbbing out vast quantities of superheated excess, stopping at nothing as they violate the planet with waves of incredible virility. You’ve stopped pumping your [pc.knotBallsHilt " + bigCock + "] into her palm, but she’s milking your tanks of every drop true to her word, easing the passage of all subsequent shots. Gallons of [pc.cumColor] spunk flood the world around you, but fortunately, her clothing is okay! ");
		output("\n\nWhile the last loads splash into puddles easily mistaken for playful galotians, the emptiness that follows is at once liberating and... stifling.");
		output("\n\n<i>“Oooh... that was <b>very impressive,</b> [pc.name]!”</i>");
	}
	pc.orgasm();
	processTime(20);
	addButton(0, "Next", somethingSomethingBiancaHandjobPun);
}

public function somethingSomethingBiancaHandjobPun():void
{
	clearMenu();
	clearOutput();
	// sceneName: HANDIWORK
	// load bust 'bianca_work'; she does not undress in this scene
	showBust("BIANCA_WORK");
	showName("\nHANDIWORK");
	author("William");
	// sceneTag: processTime 13-29\rand minutes.
	processTime(13+rand(18));

	output("You relax in the earthen warmth that comes after male orgasm, Bianca lying at your side inches from your head, massaging your softening [pc.cocksLight]. She turns her head to bring a [pc.cumNoun]-soaked finger to her lips, making sure you get a good view of her licking and swallowing the [pc.cumFlavor] issue. <i>“");
	switch (pc.cumType)
	{
		case GLOBAL.FLUID_TYPE_MILK:
		case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
		case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
			output("Carrying a picnic in your pants, hmmm, [pc.name]? The taste of milk is quite refreshing after such a long day..."); break;
		case GLOBAL.FLUID_TYPE_SUGAR:
			output("Mm, sweeter than the most sugary candies. You know just how to make a woman’s mouth water, [pc.name]..."); break;
		case GLOBAL.FLUID_TYPE_FRUIT_CUM: output("A taste like ripe fruit... how appropriate, for a sweet [pc.boyGirl] like you."); break;
		case GLOBAL.FLUID_TYPE_HONEY: output("What a sweet, honeyed taste... I think I’d like more in the future..."); break;
		default: output("A young and healthy taste, hehe..."); break;
	}
	output("”</i>");
	output("\n\nShe pats your face. <i>“Feeling better? In my professional opinion, you look like you needed that.”</i>");
	output("\n\n<i>“Ch’yeah...”</i> you groan, still exhausted.");
	if (flags["BIANCA_SEXED_HAND"] == undefined)
	{
		if (pc.isNice()) output(" <i>“D-Did you need to be so rough, though?”</i>");
		else if (pc.isMisch()) output(" <i>“A little warning would have been nice at the start...”</i>");
		else output(" <i>“Didn’t expect you to be so vicious.”</i>");
		output("\n\n<i>“I’m sorry if it was discomforting,”</i> she replies sincerely, then reapplies her lewd smile with a wink. <i>“It’s what I do to tease my husband, and I’ve gotten a... <b>bit good</b> at it.”</i>");
		output("\n\nA bit huh? That’s a good joke.");
	}
	else
	{
		if (pc.isNice()) output(" <i>“I think I’ll be able to hold on a bit better next time.”</i>");
		else if (pc.isMisch()) output(" <i>“D-Damn... you know how to keep someone guessing.”</i>");
		else output(" <i>“You better... try harder next time.”</i>");
		output("\n\n<i>“Oh, good! I don’t want to cause you any pain, but my methods are perfect for <b>insatiable lovers...</b>”</i> she says, voice smoother as silk.");
		output("\n\nIf you were feeling <i>truly</i> insatiable, she’d be given a run for her money!");
	}
	output("\n\nBianca plants an airy kiss on your neck before leaning down to lick your [pc.cocksLight] clean");
	if (pc.balls > 0) output(", washing your [pc.ballsNoun] afterward");
	output(". <i>“It would be very rude of me to leave you dirty, so hold still. I’ll suck it all off.”</i> She treats the taste of your sperm like a reward well-earned. Once finished, she sits shoulder-to-shoulder with you. <i>“That felt good for me, too,”</i> she comments, hand still between her legs...");
	output("\n\nAirborne estrus excites you before you even see the faintly wet dark splotch at her crotch, but your sore neck prevents you from looking too closely. Just because you can’t confirm it doesn’t mean you’re not going to go on with your day knowing you ruined her panties. And all she did was give you a handjob!");
	// familiarity <=50
	if (biancaFamiliarity() < 50)
	{
		output("\n\n<i>“Well, [pc.name],”</i> Bianca says, standing some time later and collecting her things. <i>“I’m sorry, but I can’t stay. Please take care of yourself, okay?”</i> You nod and she waves, running into the unknown.");
		output("\n\nDeciding to lean back for a power nap");
		if (!pc.isNude()) output(", not caring that you’re doing so commando-style");
		output(", you drift off into wobbly-eyed unconsciousness.");
	}
	// familiarity >=51
	else output("\n\n<i>“Maybe next time you can help me in return...”</i> She stares at you with every hint of provocation. You tell her you just might before heaving one last sigh, subconsciously intent on a power nap to ride out your gratified exhaustion. The last thing you feel is something draping over you.");

	pc.orgasm();

	addButton(0, "Next", biancaIsDoneHandlingUrJunk);
}

public function biancaIsDoneHandlingUrJunk():void
{
	clearMenu();
	clearOutput();
	author("William");
	// sceneTag: processTime 5-10\rand minutes.
	processTime(5+rand(6));

	// familiarity <=50
	if (biancaFamiliarity() < 50) output("You awaken minutes later to find yourself exposed to the elements" + (pc.isNude() ? "like always" : ", hastily reining in your chilly goods and getting dressed") + ". You feel fiercely powerful when you stand, thinking it’ll be a good idea to ask Doctor Ketria about <i>more</i> treatments in the future...");
	// familiarity >=51:
	else
	{
		showBianca("WORK");
		output("You awaken a few minutes later to find yourself draped in Bianca’s sky-blue coat. She’s been keeping watch over you. The second you open your eyes, she steals a needy kiss, showering you in lively affection. <i>“Good day, [pc.name],”</i> she says, petting behind your [pc.ear].");
		output("\n\nYou smile");
		if (!pc.isNude()) output(", fixing your gear and");
		output(" standing up quickly. Before parting you exchange simple pleasantries and goodbyes, heading off on separate paths.");
	}

	biancaSexed("HAND");
	// sceneTag: PC gets healed as if resting - restore all parameters by 5-10%, rand.

	addButton(0, "Next", biancaEncounterEnd); // Dump PC back to the game.
}

public function biancaBJ(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work'; she will not undress in most cases.
	showBianca("WORK");
	author("William");
	processTime(13+rand(18));

	// First time
	if (flags["BIANCA_SEXED_BLOW"] == undefined)
	{
		output("Overcoming the base temptation of Bianca’s hand would be an impossible task if not for what else was on offer. The teasing is lovely - in fact it’s... it’s brutish! It isn’t clumsy, and it’s <i>deadly precise.</i> Expertly cultivated arousal adds a shimmer to everything you see. Dr. Ketria’s gotten you ready for the main course, though: an oral performance! Summoning all your willpower you sit up straight, looking unsteadily into her eyes.");
		output("\n\n<i>“You said I’d have to settle for your fingers or...”</i> you pause, shuddering in pleasant lust, <i>“...<b>your mouth.</b>”</i>");
		output("\n\n<i>“Mmh,”</i> Bianca moans, bending towards you. <i>“I did.”</i> She hasn’t stopped groping but once. Sighing beatifically, she helps you grow several inches every second. <i>“So it’s up to you to show me how badly you want it, [pc.name],”</i> she says in a smoky voice. <i>“Before I can start, my lips need to be wet. Make sure to get me ready, if you can...”</i> she turns her head and smiles invitingly, <i>“...unless you want a handjob instead?”</i>");
	}
	// Repeat time 1 (cycle thru then repeat)
	else if (flags["BIANCA_SEXED_BLOW"] == 1 || rand(2) == 0)
	{
		output("The only thing lovelier than Bianca’s teasing are her tails, which weave around to your loins for a series of love taps that compliment her");
		if (!pc.isCrotchExposed()) output(" bulge");
		output(" worship. Your [pc.lipColor] lips stretch into a grin when your sight locks to the doctor’s pale-cherry mouth, slightly parted and powerfully erotic.");
		output("\n\n<i>“Will you use your mouth again?”</i> you ask pointedly, blushing like mad. <i>“I think it’s the only way I can be cured.”</i>");
		output("\n\n<i>“Hehe,”</i> Bianca laughs. <i>“You may be right, [pc.name],”</i> she says, making her lips the center of your attention. <i>“But first things first,”</i> her delectable, berry-red lips mouth slowly, <i>“...you’re going to have to help me prepare. I have no assisting nurses, <b>as you can see...</b>”</i>");
	}
	// Repeat time 2
	else
	{
		output("You’re starting to get used to Bianca’s groinal palpations for once. While she prepares your body and mind for a wonderful time, you narrow your eyes to her strawberry-flavored lips, fascinated by the salival curtain glazing their silky textures. <i>“So... blowjob?”</i> you ask aloud, giggling in a low voice like you broke a library’s courtesy rules.");
		output("\n\n<i>“You’re so cute when your direct!”</i> Bianca squeals, leaning forward with the happiest smile. <i>“However... we can’t jump straight into something like that. You have some work to do yourself, [pc.name]!”</i> she proclaims, stroking your cheek in a motherly fashion. <i>“Show me how much you really want <b>that...</b> how much you want my lips spread across <b>it...</b>”</i>");
	}
	output("\n\nYou flush from head to [pc.foot], swallowing the lump she put in your throat. Being the object of a capable woman’s affections is so unbelievably hot that you scarcely believe you’re getting to experience it");
	if (flags["BIANCA_SEXED_BLOW"] != undefined) output(" again");
	output(". She explores your [pc.skinFurScales] with one tantalizing hand, stirring your need with pinpoint, feather-light caresses. The glowing purple eyes behind her glasses’ lenses furrow. Her tongue flitters out to lap at her lips, gradually glossing their plush surfaces with slick temptation.");
	if (pc.isNice()) output("\n\nInhaling deeply, you hold the breath and reach up to her face like a gentle[pc.manWoman], slowly removing her glasses and putting them off to the side.");
	else if (pc.isMisch()) output("\n\nExhaling through your nose, you reach up and stroke Bianca’s cheek, casually pulling her glasses off in the same motion.");
	else output("\n\nWith a predator’s speed you reach up and yank Bianca’s glasses off, tossing them to the side.");
	output("\n\nAnd then, you take her bait.");
	output("\n\nPent-up desire rushing out, you grab Bianca’s head and pull her into a kiss as forceful and deep as she will allow. Your [pc.tongue] thrusts into her saccharine wetness, grappling with hers" + (pc.hasLongTongue() ? ", but your superior length affords you no advantage in making out with someone twice your age":"") + ".");
	output(" Gracious is the fox, for she doesn’t forget to coax your [pc.cocks]; exquisitely fluffy tails pick up the slack in teasing the rest of you. Before you know it, she’s ignited your passion into a wildfire of " + (flags["BIANCA_CONFRONTED"] != 1 ? "adulterous" : "ravenous") + " bliss, swapping spit and affection.");
	// pc Aphro Spit/Myr Venom
	if (pc.hasPerk("Myr Venom") || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		output("\n\nYou mix a trace amount of your alien venom into the oral flume. The results are immediately apparent: Bianca’s cheeks glow as red as scarlet nightshade, hollowing down to press an immensely arousing and throaty growl into your maw. <i>“[pc.name], thash... don’t do thaf too mush!”</i> she mewls, strength waning noticeably.");
		output("\n\nConsidering how potent your lust-laced pleasure-spit is, you didn’t plan on it. The result is better than you expected, though. That <i>sound</i> she just made was... mnf...");
	}
	output("\n\nThe kiss turns sloppy and quickly breaks, your once-cooperative rhythm falling apart into needful writhing. You both sharply gasp on separation, light quivers running through your necks, panting just inches away from each other’s faces" + (flags["BIANCA_CONFRONTED"] != 1 ? " like you can’t believe you’re really doing this." : "."));
	output("\n\n<i>Bianca is incredibly gorgeous.</i> You eye-hump her so hard that she seems to sweat on ocular command. She blushes from face to neck, the velvet-red curtain extending to her breast. Beads of layered sweat trickle down over elemental stains. Her hair is grimy and glassy from long hours in the field, and yet... that’s what makes her so carnally <i>attractive.</i> Few people can wear fatigue so well that it enhances their natural charm, strengthens their erotic traits.");
	output("\n\nShe grips your [pc.cocksLight] even harder and you avail yourself of her heavenly chest, sinking your [pc.hands] into a wonderland of fabric-compressed boob, fitting one around a fat nipple. Drool dribbles down your conjoined chins when your lips smack together again. Dampened hair brushes your cheek when she nuzzles your [pc.face]. Her teat swells in your palm until it’s as erect as you are, and you pluck it. You pull on it so hard that she cries out in absolute enjoyment, thrusting her chest out for more.");
	// pc Is In Rut or Has A Pheromone Perk (i.e Musky Pheromones)
	if (pc.inRut() || pc.hasPheromones()) output("\n\nHer fingers bore into you like meathooks, and she dives straight for your collarbone, licking up your neck and stealing a stripe of [pc.raceShort]-flavored sweat. <i>“Nnnggh... [pc.name]!!”</i> she growls, elongating every letter of your name in one searing breath. She lays another fat lick up your exterior trachea, huffing libidinous breaths around your upper chest. <i>“This taste... your flavor, your scent! You’re an animal in your prime, a beast! Your... Your... Your <b>essence</b> is that of someone who tames [pc.hisHer] mates by raw presence.”</i> She looks up into your [pc.eyes], gasping, <i>“I am no different!”</i>");
	output("\n\nHead spinning, you " + (pc.isCrotchExposed() ? "reach down and grab your [pc.dicks], hand sliding to a furious blur. You’re desperate to cum just once to control your rampaging libido, but Bianca stops you." : "struggle with your [pc.crotchCover], trying to rip it off and rustle up your [pc.cocksLight], but Bianca stops you."));

	// PC lust maximizes
	pc.maxOutLust();

	addButton(0, "Next", biancaBJTwo, cockIdx);
}

public function biancaBJTwo(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	// sceneTag: processTime by 8-16\rand minutes
	processTime(8+rand(9));

	output("<i>“No, let me... I need this, [pc.name]...!”</i> she hisses. <i>“Forgive me for asking, but stand up just a little!”</i> You do so, somehow conjuring the strength needed to press your back to");
	switch (getPlanetName().toLowerCase())
	{
		case "mhen'ga": output(" the tree"); break;
		case "tarkus": output(" the rock"); break;
		case "myrellion": output(" the wall"); break;
		default: output(" the wall"); break;
	}
	if (pc.hasKnees()) output(" and bend your [pc.knees].");
	else output(" and slide up on your [pc.leg].");
	if (pc.isCrotchExposed())
	{
		output(" Knelt " + (pc.hasLegs() ? "between your [pc.legsNoun]" : "in front of you") + ", Bianca touches her nose to your throbbing hard [pc.cocksLight], inhaling deeply of your musk");
		if (pc.hasVagina()) output(" and potent feminine scent");
		output(" until her ears flatten to her scalp in blatant submission.");
	}
	else
	{
		output(" Knelt " + (pc.isBiped() ? "between your [pc.legsNoun]" : "in front of you") + ", Bianca frees your [pc.cocks] in record time");
		if (pc.balls > 0)
		{
			output(", your");
			if (pc.scrotumType() == GLOBAL.SKIN_TYPE_FUR) output(" fuzzy");
			else if (pc.scrotumType() == GLOBAL.SKIN_TYPE_SCALES) output(" scaly");
			else output(" doughy");
			output(", drenched nutsack spilling out underneath");
		}
		output(". Deep breaths of concentrated musk");
		if (pc.hasVagina()) output(" and female scent");
		output(" flatten the doctor’s vulpine ears to her scalp in blatant submission.");
	}
	output("\n\n[pc.FootOrFeet] firmly planted, your sight blurs when you sniff the air. A dizzying aroma permeates the area, succulently ripe with Bianca’s signature too - her perfume rises on an estrus wind, mixing sweet propriety with agitated lust into a whorish blend. Freely-dribbling pre-cum dapples your " + (pc.hasCocks() ? "shafts" : "shaft") + "; inner contractions squirt out thin [pc.cumColor] ropes that plaster the fox-woman’s face and the enormous mounds of her breasts.");
	output("\n\nThere’s a certain physical element to seeing a woman supplicate to your [pc.cocksLight], licking her lips and smiling hungrily as your aroma runs through her system. Bianca is nose deep in your goods, hands pressed to your [pc.hips], nestled close to your stiffening firmness; her tongue rolls out an inch away from your [pc.cockHeads] and a meaty taste of raw, bare dick. Pride bubbles up inside watching her inspect and visually worship what you’ve got, calming your hammering urges to stuff her then and there.");
	// pc Chosen Cock Size <6
	if (pc.cLength(cockIdx) < 6) output("\n\n<i>“The smaller a cock, [pc.name], the more sensitive it arguably is,”</i> she smiles soulfully, sniffing again. A quick movement and she’s wearing your [pc.cockType " + cockIdx + "] girth across her face. The stem extends from her nose to her forehead, lacquering her cuntenance in cummy slime. <i>“I’ll be able to enjoy every bit of this,”</i> she blinks, <i>“I bet I could wrap it up with my tongue! I don’t want you to hold back, okay? I want you to enjoy this. I won’t allow you to leave until you’ve given me every drop.”</i>");
	// pc Chosen Cock Size <12
	else if (pc.cLength(cockIdx) < 12) output("\n\nBianca smiles, positioning herself so that your fat girth is laid on the bridge of her nose, extending from her chin to the white tips of her swiveling foxen ears. A glassy expression forms on her face as she struggles to hold back her tongue from starting early, so tantalizingly close to flicking at the underside of your glans. <i>“[pc.name]... this is such a wonderful size. It’s heavy and thick, just like the heat.”</i> Her vocals pleasantly warm your urethra, expressing thicker dribbles of spoo into her hair. You’re half tempted to reach for your codex and immortalize the scenario, because holy fuck does the sight make you want to bust the messiest nut possible. <i>“There’s nothing that makes me feel more content than <b>this...</b>”</i> she says. <i>“I want you to enjoy this as much as possible. I’m going to show you, little by little, just what I can do to make sure your penis gives up every last drop.”</i>");
	// pc Chosen Cock Size <20
	else output("\n\n<i>“Mmff,”</i> Bianca groans sluttily, nuzzling into your bestial dick with each cheek. She positions herself in a way that lays your fat cock on the bridge of her nose, the tip ending parallel to her white eartips. Concealed in the precipitous shadow of your [pc.cockShape " + cockIdx + "] shaft she is a bleary, cock-drunk whore. Her tongue’s unable to resist a quick taste of the underglans, flashing out to lap at that juicy terrain. <i>“I... " + (flags["BIANCA_SEXED_BLOW"] == undefined ? "I don’t know if I can fit it all in my mouth... but I’ll make an effort for you, [pc.name]..." : "I’ll take it all the way to my belly if I have to, [pc.name], just for you...") + "”</i> She sniffs again, giving a cocksure grin when it pulses at the declaration, reverently cupping the [pc.dickSkin " + cockIdx + "] not overlapping her increasingly lacquered face. <i>“Don’t disappoint me with this. I want <b>everything.</b> I want to feel you throbbing inside my mouth, pushing my cheeks apart... spreading my neck. You’ll do that for me, won’t you?”</i>");

	output("\n\nHer fluttering eyelashes send a thrill up your [pc.belly] and coax out another [pc.cumVisc] spurt. Her tongue springs out to curl around your [pc.cockHead " + cockIdx + "], agitating it moments before moist lips brush and press against it. Bianca’s hot, ready-to-serve lips spread over the bulk of your cock to bring your swollen burden inside. Slobber dribbles down your meaty length, transforming it into a sweet, candied treat as it mixes prettily with the [pc.cumColor] sheen it wears. Hugging hands jack the bottom of your mast while a masterful tongue laps at your cumslit, bathing her palate with fresh offerings.");
	output("\n\nDrowning in sensation, you didn’t realize that you weren’t fully stiff. Hot breaths tickle you from hard to <i>hardest.</i> Bianca’s [pc.cockHead " + cockIdx + "]-filled swallows provoke you to twitch heavily on the bed of her tongue. For now, she’s content to savor the buffet of [pc.cumFlavor] pre trickling into her gut, fill her lungs with your pussy-puffing scent; gleefully, she explores your [pc.cockNoun " + cockIdx + "], learning the lay of your oiled limb." + (pc.hasKnot(cockIdx) ? " Your bare, goo-slathered knot receives the brunt of her adoration, swelling to her squeezing encouragements.":""));
	// imagePack: embed octomush Bianca Fellatio pics here. 9999
	// pc Cock Canine
	if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_CANINE)
	{
		output("\n\n");
		showImage("Bianca_Canine_BJ");
		output("<i>“Do you think it’ll go inside when it inflates?”</i> Bianca asks, though you’re not sure what she means until you feel her hands on it. <i>“This is the best part of an ausar’s cock. The shaft has a woodsy, primal smell underlying its sexual musk.”</i> She licks your tip, nostrils flaring in excitement. <i>“That meaty scent sets me off.”</i> She kisses along the length of your shaft. <i>“If you caught me at a bad time, [pc.name]... I would bend over for this without a second thought.”</i> The fox intakes the scent of your [pc.cockColor " + cockIdx + "] rocket, sighing dreamily until a cock-addicted giggle interrupts it. Dr. Ketria’s squirming around in obvious, smoldering lust. <i>“Watching a cock get hard makes me happy... but a knot is that and more. <b>Your knot</b> will batter into my lips... are you going to treat my belly like a womb?”</i>");
		output("\n\nThe words coming out of her mouth are enough to make your [pc.thighs] tremble.");
	}
	// pc Cock Equine
	else if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_EQUINE)
	{
		output("\n\n");
		showImage("Bianca_Equine_BJ");
		output("Bianca whines and falls weakly into a bow-legged mess underneath your scintillating equine endowment. Nose utterly wrinkled, her lips quiver trying to mouth words she speaks through her tracing fingers. <i>“This musk... this wonderfully rich musk... you spoil me, [pc.name]. This proud, bestial cock makes me feel so insignificant-”</i> She shoots up, kissing your medial ring with a happy cry. <i>“No! Not insignificant, but important. This will flare inside <b>me,</b>”</i> she moans, ringing your flat tip, <i>“this is big, hot, and hard because it wants <b>me,</b>”</i> she wedges her nostrils between two flared veins, taking another whiff of your [pc.cockColor " + cockIdx + "] horsemeat, then at the fat loop of your medial ring. <i>“I can’t wait to feel this inside me... I may even taste it in my dreams...”</i>");
		output("\n\nHer sheer reverence for your dick is enough to make your thighs tremble.");
	}
	// pc Cock Feline
	else if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_FELINE)
	{
		output("\n\n");
		showImage("Bianca_Feline_BJ");
		output("<i>“I can’t wait to feel these in my throat");
		if (flags["BIANCA_SEXED_BLOW"] == undefined) output(" again");
		output(",”</i> Bianca says in brazenly slutty fashion, ogling the fleshy nodules bristling along your [pc.cockColor " + cockIdx + "] cockflesh. <i>“Kaithrits can satisfy the clit hands-free with these. But, [pc.name],”</i> she purrs, jacking the entirety of your feline length, <i>“you’re going to brush and <b>rake</b> my throat while you stretch it. How does that make you feel?”</i> Your dick answers for you, throbbing out a stripe of spooge that paints her cheek. <i>“The smell is dry and relaxing... and it will enter easily with this smooth, pointed head.”</i>");
	}
	// pc Cock Suula
	else if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_SIREN)
	{
		output("\n\n");
		showImage("Bianca_Suula_BJ");
		output("Bianca hums like a disciplinary school teacher, pinching one of your venom-imbued tendrils. <i>“Suula venom has a potent effect, and not even the wielder is immune to it. When you put this in my throat, they’ll treat it like a pussy. What is it going to feel like");
		if (flags["BIANCA_SEXED_BLOW"] == undefined) output(" this time");
		output("...”</i> She huffs downwind your thrumming girth, causing the stingers at your crown and base to flutter in mesmerizing motions, billowing in her gratified expression. <i>“I can’t wait, [pc.name].”</i> She winks. <i>“Make sure you give me everything.”</i>");
	}
	// pc Cock Human (or Unspecified)
	else
	{
		output("\n\n");
		showImage("Bianca_Human_BJ");
		output("<i>“Watching your cock get hard is so flattering, [pc.name].”</i>");
		output("\n\nShe’s just saying that to be nice.");
		output("\n\n<i>“But I’m not!”</i> the fox-milf retorts, staring incredulously, licking all around the dome. <i>“These veins are thick and healthy, and you’re so warm! It’s weight is <b>there</b> in my wrists every time your heart beats, I can feel it. Just a few licks and touches is all it takes for you to want to breed. It makes me happy,”</i> she says, groaning into your bone with need. <i>“Well, [pc.name]?”</i> Tilting her head, she kisses your cumslit. <i>“Do you want to breed my mouth?”</i>");
	}
	output("\n\nMidway through another agonizingly pleasurable stroke, Bianca’s tongue is trailing down one side of your [pc.cockNoun " + cockIdx + "] to the [pc.knotOrSheath " + cockIdx + "], then sweeping back from the other, decorating your girth in long strings of cummy saliva." + (pc.hasSheath(cockIdx) ? " She doesn’t spend too long licking at your sheath, but you identify an obscene adoration when your cock-pocket crinkles around her nose.":"") + " The doctor sounds desperate and thirsty; intensely aroused, she looks up the whole time she dutifully slurps, drinking in your gratified expressions with gulps of sticky slaver.");
	output("\n\nWhat amazes you is how her face is almost never detached from you, her fuck-drunk eyes aglow with intense phallic veneration. Bianca’s impish, coiling muscle ardently weaves about your rod, nurturing every vein into more efficient production, rubbing the spunk-tunnel in ways that maximize the flow of pre. It’s a tongue with clear intent and years of practice, it’s an organic cock-milker that could reduce you to a flaccid, spent pile if it were kicked into overdrive. For now, it blankets your mind with servile, submissive laps to [pc.dickSkin " + cockIdx + "].");
	output("\n\nWatching her ears flick at your cum-vein is pleasantly distracting. You’re filled with desire to reach out and pet them, to feel her the same way she feels the wholeness of your masculinity. " + (flags["BIANCA_SEXED_BLOW"] == undefined ? "It comes as a shock when you place a [pc.hand] on her head that she doesn’t recoil or push you away, but giggles out a pleasured note. That moment of surprise gives way to erotic fulfillment; she swivels her ears to better help you pet behind them; long strands of silky hair flow between your fingers like a river of gold. For as serious as she is, she can’t hide how much she wants to be praised." : "There’s no better time to start getting involved in your treatment plan. You grasp her head, fingers automatically scritching behind her triangular ears which flex to expose the most vulnerable parts of her scalp. Giddy moans filter out, lured by hair-tousling praise. It’s still too difficult to believe that someone of Bianca’s self-esteem is so willing to debase herself for cock."));
	output("\n\nYour doctor’s care goes from lapping caresses to open-mouthed debauchery");
	if (pc.hasCocks()) output(", tightening her hands into lube-coaxing fists around your spare " + (pc.cocks.length > 2 ? "phalluses" : "phallus"));
	output(". Skin-searing exhalations grow you another inch when your staff pulses against her expressive lips. It contracts again under an onslaught of boiling hot kisses");
	if (pc.hasKnot(cockIdx)) output(" focused on your [pc.knot " + cockIdx + "]");
	output(", and repeats -- " + (flags["BIANCA_SEXED_BLOW"] == undefined ? "she already knows how to lick the way you like" : "she licks everywhere in the way you like most") + ". Her cum hungry body is shivering out of nearness to spitting itself on what it most cherishes: a swollen cock so erect you feel like your entire life has been packed into it.");
	if (pc.balls > 0)
	{
		output("\n\n<i>“I want " + (pc.balls > 1 ? "these" : "this") + ",”</i> she coos, gliding down your rod until her keen nose sinks into your [pc.sack]. Short, high-pitched whimpers and squeals vibrate through your heated [pc.ballsNoun] seconds before her tongue lashes out for your slippery " + (pc.balls > 1 ? "orbs" : "orb") + ". Guided by your [pc.hands], her head bobs up and down, dragging her nut-polisher across the juicy exterior of your fluctuant sperm-sack. From churning underside to bulgy topside she mops your exquisitely soft " + (pc.balls > 1 ? "surfaces" : "surface") + " of the musk-laced ballsweat clinging to " + (pc.balls > 1 ? "them" : "it") + " until your ‘nad" + (pc.balls > 1 ? "s glisten" : " is glistening") + " irresistibly.");
		output("\n\nYou can’t suppress your urge to hump her face, half-obscuring your vulpine ball-slut in cum-plump ball" + (pc.scrotumType() == GLOBAL.SKIN_TYPE_FUR ? "fuzz" : "skin"));
		if (pc.hasVagina()) output(" drenched in residual amounts of girl-cum");
		output(".");
		if (pc.scrotumType() == GLOBAL.SKIN_TYPE_FUR) output(" Once she’s washed your sagging scrotum of the accrued tang, she sucks the rest of the pheromonal soup from your fur where it collects at the bottom, making no effort to hide the lurid squelches of suckling lips against matted testicle.");
		else output(" Once she’s polished your sagging scrotum of the accrued tang, she shifts lower to the taut underside to suck the rest of the pheromonal soup where it’s collected enough to drip, making sure you can no effort to hide the lurid squelches of suckling lips against broad testicle.");
		output("\n\nAnd then she’s kneading them firmly and gently, bringing the slaver-glazed " + (pc.balls > 1 ? "spheres" : "sphere") + " to a dangerous and precarious wobble. Thin flumes of precum flow uninterrupted for the duration of exhaustive worship. There’s no pinch of pain, only luxuriously smooth rubs and fondles and sucks and nibbles that fill your tanks with more seed. She fills her nose with days worth of [pc.raceShort]-scented pheromones, taking such care of your tingling spunk-tanks that they jiggle and jostle in her sensuous hands on the verge of " + (pc.balls > 1 ? "their" : "its") + " first contraction.");
		// pc Bigger Balls (>=14 inches) (add-on)
		if (pc.ballSize() >= 14)
		{
			output("\n\n<i>“[pc.name]... why- h-how " + (pc.balls > 1 ? "are" : "is") + " yours so big... and so good...”</i> she moans soporifically. The fox-slut’s muffled cry almost didn’t make it past the tremendous amount of virile mass swinging down there, intoxicating her with the scent, flavor, and texture of bouncing [pc.ballsNoun].");
			output("\n\nYour [pc.hips] lurch right and left, and your weighty [pc.ballsNoun] sway with orgasm-worthy inertia, dominating Bianca’s mind with fantasies of how backed up " + (pc.balls > 1 ? "they" : "it") + " must be, how much seed is sloshing just out of reach... and how it’s all going to end up inside her. Her senses of smell, sight, and touch must be melting down, subsumed by the trembling sheerness of your [pc.skinFurScalesColor]-hued " + (pc.balls > 1 ? "moons" : "globe") + ". She strains her jaw to open wide around " + (pc.balls > 1 ? "just one" : "your") + " capacious, clenching " + (pc.balls > 1 ? "nuts" : "nut") + ". It’s futile, but it earns her another hump -- being acted on in such a depraved manner completes her circuit and grants her a shudderingly pleasant orgasm.");
			output("\n\nBianca settles for burrowing her face in the center crevice of your majestic bulgehood");
			if(pc.ballDiameter() >= 12) output(" - it could easily smother her whole head if you pitched forward - ");
			else output(", ");
			output(" framing herself in your hyperproductive glory for almost an entire minute. She’s shaking the whole time, unable to believe that you have such a bounty of churning nutflesh to love and adore, all this <i>you</i> to submerge herself in, to take in. You feel the tip of her nose in the juicy, foggy heath between [pc.knotOrSheath " + cockIdx + "] and nutsack, huffing deeply, flooding her lungs with the rawest of your genital odor. When she does pull away (very reluctantly), she doesn’t do so without giving " + (pc.balls > 1 ? "each ball":"your ball") + " a vacuuming kiss or three.");
			output("\n\nIt’s utterly endearing that she finds her affections lacking, looking frustrated by how little she seems to accomplish. That’s just how it is. So little time and so little tongue won’t. Before she starts feeling bad, you bring her back to your eclipsing vale and encourage another minute of stress relief. The medic puts her thirsty tongue to the task of testicular polish, bathing her fruit-red lips in the supreme musk of your girthy swell until she can see her reflection on " + (pc.balls > 1 ? "your":"one") + " well-loved protrusion.");
		}
	}
	var biancaLeads:Boolean = false
	// rand1: bianca Lead-in (always on first time, then randomize on repeat blowjobs)
	if (flags["BIANCA_SEXED_BLOW"] == undefined || (flags["BIANCA_SEXED_BLOW"] > 1 && rand(2) == 0))
	{
		output("\n\n<i>“It’s time.”</i>");
		output("\n\nBianca kisses her nose to your pre-gushing tip, tucking her thumbs under your [pc.knotOrSheath " + cockIdx + "]. Her mouth opens tantalizingly, slowly... a hip-jerk away from sheathing your [pc.cockShape " + cockIdx + "] meat between her satiny pleasure-pillows. The few inches of her tongue coil around your [pc.cockHead " + cockIdx + "] with a taut grip wet from eager service");
		if (pc.hasCockFlag(GLOBAL.FLAG_FORESKINNED, cockIdx)) output(", peeling your foreskin back with barely contained excitement");
		output(". Neck craning upwards, she guides you in deeper than before, exhaling on her downward descent. Your crown slides past her red lips at the same moment you howl in bliss and throw your head back so fast that you slam into the " + (getPlanetName().toLowerCase() == "mhen'ga" ? "tree." : "wall."));
		output("\n\nPain dulls in her lush interior; anxiety and stress evaporate in the steamy embrace of her large, squeezing maw. Bianca’s swirling tongue stirs the previous foreplay and your patience into an exquisite fusion of pure sexual relief. Moist oral compression draws out runnels of [pc.cumVisc] goo from your tender cock; the doctor stuffs her cheeks with the [pc.cockHead " + cockIdx + "], wriggling her knob-polisher on the underside of your confidently-tended girth. The inevitable cascade of orgasm isn’t far behind, manifesting as a low, prickling pressure in your gut.");
		output("\n\nA sudden and decidedly unfriendly squeeze around your [pc.base " + cockIdx + "] knocks you for a loop and jerks you to the entrance of her throat. A giggle vibrates through your buried bone when you look down, face twisted from a moment of denial.");
		output("\n\n<b><i>She just edged you.</i></b>");
		output("\n\nThe mischievous fox tethers your moist [pc.cockHead " + cockIdx + "] in her mouth and straightens out. Gliding back and forth, she teases you with the prospect of sinking your rigid stiffness into her throat proper. It’s slow going, quite relaxing really. Her expert skill and visceral stimulation causes you to lean back in enjoyment. Maybe what happened before was an accident. Yeah. For a fateful second you stop caring about going any further, she’s going to get you-");
		output("\n\n<i>Squeeze!</i>");
		output("\n\n<b>Fuck!!</b> You jolt upright after the combat medic crushes your all-important vein, kicking you down the basement stairs. Bianca garbles out another dick-flavored laugh - the absolute nerve! A sly wink and she slows; the reduction in speed and the leaden manner she operates only serves to enrage your libido and tighten your grip on her ear. Upon your aggressive reaction she pacifies you with the sights and sounds of smiling sucks, mopping your peak in all the right places.");
		output("\n\nThe most brazen denial comes next");
		if (pc.balls > 0) output(", this time with a light pinch to your [pc.ballsNoun],");
		output(" and you yelp in genuine pain.");
		if (flags["BIANCA_SEXED_BLOW"] != undefined) output(" Knowing that she does this to awaken your dominant side doesn’t give you the means to prepare for it!");
		output(" This final straw pulls you further from orgasm and rational response --");
		if (pc.isNice()) output(" <i>your well of patience dries up, and in an almost savage fashion you surge forward.</i>");
		else if (pc.isMisch()) output(" <i>she’s taken this too far! You shove back and your hips dive down.</i>");
		else output(" <i>a brutal tease requires a brutal response, and you slam your hips forward.</i>");
		output("\n\nIt takes a hot second for your brain to register what you’ve done and where you are. A submissively-toned mewl rises up to your [pc.ears] when you look down, clutching your doctor’s head and only one thrust away from plugging her more-than-ready throat. She blinks, long and slow, crawling forward for balance and reaching up to brace herself on your [pc.thighs].");
		output("\n\n<i>This</i> is what the vulpine whore wanted out of you. In fact, from the curving of her mouth, she’s <i>trying</i> to keep you there!");
		output("\n\nNow that you’ve assumed your rightful role, this is your chance to <i>use her.</i> But, you could get her to apologize in a different way...");
		biancaLeads = true;
	}
	// rand2: PC Lead-in
	// one
	else
	{
		if (flags["BIANCA_SEXED_BLOW"] == 1 || (flags["BIANCA_SEXED_BLOW"] > 2 && rand(2) == 0))
		{
			output("\n\nBianca shuffles down, staring up. Her mouth is an ocean of cock-slime and spit undulating below the currents of her mad panting, and it’s flowing down her chin, her neck, dripping wantonly in large wads that puddle between her thighs. Before you can ask why she stopped, she says, <i>“[pc.name]... I-I have a small request...”</i> Your [pc.ears] are open. <i>“I want you to use me. Your taste, your scent, I’ve... I’ve lost my control, shameful as it is to admit...”</i>");
			if (flags["BIANCA_SEXED_BLOW"] == 1) output("\n\nYour cock throbs so hard that it bounces up a few inches. How can you say no to that?");
			else output("\n\nYou’re not judging her in the slightest. In her boots, you’d probably be no different.");
			
			output("\n\nRelishing the opportunity, you [pc.walk] forward, bidding Bianca to sit up straight. She opens her mouth wide, extending her tongue in twitch-provoking obedience: <i>“Ahhh.”</i> You feel as hard as a fucking boulder, standing there with your [pc.cockHead " + cockIdx + "] hovering just above the bedding-like texture of her oral dais, staring into the lubricious hole ready to be fucked. It’s not just the smut-saturated air, it’s her shining serenity in the midst of complete depravity. You could do anything, tell her to do anything, and she would do it." + (flags["BIANCA_SEXED_BLOW"] == 1 ? " Right?":""));
			output("\n\nBianca’s distant, glassy with absolute receptivity. It would be very rude not to show her your gratitude, and her devotion cannot be repaid with mere words.");
			if (pc.isNice())
			{
				output("\n\nYou sheepishly heft your [pc.cock " + cockIdx + "] and set the [pc.cockHead " + cockIdx + "] gently on her warm plateau. <i>“Lick it,”</i> you blush nervously, like you’re asking too much. You hold it there, and the fox laps circuits around the glans on your slow, forward slide through the inviting loop of her cherry mouth");
				if (pc.hasCockFlag(GLOBAL.FLAG_FORESKINNED, cockIdx)) output(", drawing your foreskin back");
				output(". You stroke the rim of her ear in an arching motion, sheathing your beefy member in the comfort of the fox-doctor’s lips. You pause at the entrance to her throat, thanking her profusely with non-verbal gestures.");
			}
			else if (pc.isMisch())
			{
				output("\n\nYou lift your [pc.cock " + cockIdx + "] with a goofy smirk, rubbing your [pc.cockHead " + cockIdx + "] all around her face, rearing back to slap it softly against her full cheek. You hump a little higher, resting [pc.cockLength " + cockIdx + "] inches of [pc.dickSkin " + cockIdx + "] between her ears");
				if (pc.balls > 0) output(" and slapping your [pc.ballsNoun] to her nose");
				output(". <i>“I know you like that,”</i> you grin. Holding tight to her head, you pull back and sheathe your meat between her plush, cushiony lips,");
				if (pc.hasCockFlag(GLOBAL.FLAG_FORESKINNED, cockIdx)) output(" peeling your foreskin back and");
				output(" stopping just before her throat.");
			}
			else
			{
				output("\n\nIf she’s asking, you’re not holding back. You step forward, [pc.cock " + cockIdx + "] in hand, and plant it upon her face. In between shallow humps you brusquely tell her to <i>“Lick.”</i> Bianca does so without question");
				if (pc.balls > 0) output(", even with your sticky [pc.ballsNoun] slapping noisily into her nose");
				output(". You pull back and cock slap both cheeks, then shove yourself inside, commanding her to <i>“Suck.”</i> Her lips");
				if (pc.hasCockFlag(GLOBAL.FLAG_FORESKINNED, cockIdx)) output(" draw back your foreskin and");
				output(" seal around your dick while you wait at the entrance to her throat.");
			}
		}
		// two
		else
		{
			output("\n\nYour heart skips a beat when Bianca suddenly pulls back quickly, perhaps... impatiently. She smiles and groans out a blissful note. <i>“I’m ready, [pc.name]. Please use me.”</i> She opens her mouth, rolling out her tongue invitingly. <i>“Ahhh.”</i>");
			output("\n\nReining in your libido takes a champion’s endurance. Once your body’s in check, a thought crosses your mind. Bianca’s a woman to whom others are a series of buttons to be pressed until they’re agitated, ready to take out their lusts on her. Another moan echoes up from her belly while you stand there, coating her tongue in dick-drool.");
			if (flags["BIANCA_SEXED_BLOW"] == 2) output(" Wonder if she’d like a taste of her own medicine?");
			else output(" Time to see if she can hold back when <i>you</i> tease her!");
			output("\n\n<i>“[pc.name]?”</i> she asks confusedly, keeping still. She tries to bob forward, but you grab hold of her head and keep it several inches from your [pc.cockHead " + cockIdx + "]. Her ears fold and her tails go limp, expecting your dominant side to emerge.");
			output("\n\nIt doesn’t. Not yet, anyway.");
			output("\n\nInstead, you do what she’s not expecting. You knead your [pc.dickSkin " + cockIdx + "] across her cheeks, smearing your lubed length from brow to chin. Her lips suckle at your broadness but never get the chance to wrap around it. Detecting a slight quiver in her arms and then her legs, you up your pace, humping her face until your " + (pc.balls > 0 ? "[pc.ballsNounIsAre]" : "[pc.base " + cockIdx + "] is") + " resting square on her conflicted mouth. She licks slavishly at the [pc.knotOrSheath " + cockIdx + "] as it grinds past, but then you pull away, ordering her to stop.");
			output("\n\n<i>“H-Huh..?”</i>");
			output("\n\nAgain, you provide no answer, intent on mercilessly teasing the foxy mom. <i>“I wa...”</i> Her voice stops when you lurch back, pinning her in place. Her slitted eyes dart from your leaking [pc.cockHead] to your [pc.eyes]; they race back, they glance to your belly they’re full of wonder and internal upheaval. You’re really doing this, keeping her from what she wants most when she <b>needs it most!</b>");
			output("\n\nTrembling breaths preclude a shocked gasp and whatever dignity the vulpine medic had left fades. <i>“I want to suck your cock, [pc.name]... why are y-you...”</i>");
			if (pc.isNice()) output("\n\n<i>“Say that again,”</i> you simper.");
			else if (pc.isMisch()) output("\n\n<i>“Say that again a bit clearer,”</i> you smile kittenishly.");
			else output("\n\n<i>“Beg correctly,”</i> you snicker.");
			output("\n\n<i>“A-Ah...!”</i> Bianca swallows, sweating with realization. The ruby-red hue on her face darkens. <i>“Please let me suck your cock, [pc.name]. I want you to stretch my throat and cum in my stomach. That is my sincerest wish.”</i> Her tongue whips in your direction, a micro-centimeter away from its target. <i>“Use me as you wish, " + (pc.balls > 0 && rand(2) == 0 ? "drain your balls into me" : "fill me with your seed") + ".”</i> Her mouth opens again and this time you step forward, sinking your lacquered girth inside her office.");
			output("\n\n<i>“Ahhh...”</i>");
		}
		output("\n\nThe crooning fox grips to your waist and bobs her head, thoroughly put in her place. Her O-shaped cockpillows move with you, vein-shaped depressions forming all over the succulent flesh. Getting a blowjob is good (in fact it’s one of life’s greatest pleasures");
		if (silly) output(" - especially considering it’s one of the writer’s poorly concealed fetishes");
		output(") but occupying this position is why this one is special.");
		output("\n\nThere’s something so graphically magnificent about being able to thrust in and out of Bianca on your own strength that you can’t help but thwack her face with zeal. She’s happy to stay there on her knees, moaning like a whore in heat so that her voice can massage your thick mast on its journey. All traces of the doctor’s professionalism and etiquette have been vanquished by an overwhelming need for dick.");
		output("\n\nYou <i>have</i> to stop yourself for a second and check if you’re dreaming, if the woman below you is really allowing this and you’re not about to wake up in bed a [pc.cumNoun]-soaked mess.");
		output("\n\nIt’s real. The earfuzz you scratch is real. The hair you tousle is real. The enthusiastic eyes staring down the bridge of your [pc.cockShape " + cockIdx + "] rod");
		if (pc.hasCocks()) output(" and reflexively shutting when your other dick bobs into her face");
		output(" are real. <b>The channel of taut, slavering muscle constricting around your cock is real.</b>");
		output("\n\nIt takes all your effort not to cum on the spot, and for the time being, you just want to savor her mouth, revel in the acute delight pumping through your limbs. You’re sure she wants to relish the sweat and [pc.cumFlavor] slime trickling down into her belly.");
		output("\n\nThe eye-crossing tingle of total authority presses on your... well, rear. A hidden force urges you on, impelling you to move faster. You do so, " + (pc.isAss() ? "not caring for her comfort" : "respectful of how much she can handle") + ". Bianca gazes into your [pc.sheathOrKnot " + cockIdx + "] with hopeful, glinting eyes, seemingly anxious for you to drive all the way in until she’s mashed into your pubic mound.");
		output("\n\nYou don’t realize how much faster you start getting, soon exhausting every avenue of foxen suckhole. <i>Why are you holding back?</i> Are you inherently worried about her? The <i>possibility</i> before you is something you think heavily on, distracting yourself from how you’ve flattened out her tongue and given her a slight pooch from all the sex-soup poured into her gut.");
		output("\n\nNow you’re panting, riding on your [pc.hips], still not sure whether to take the plunge and spear her. She’s not inexperienced, you know that better than anyone, but she’s too good of a person to just treat like some disposable, public use fuck fest. You’re banging on her tonsil, clutching her head, falling into a rutting haze; you grit your teeth so hard that your lips pull back to reveal your pearly whites and you’re jackhammering back and forth and-");
		output("\n\nAbruptly you stop.");
		output("\n\nYou register, albeit hazily, her upward gaze, and her lips quirked in a smile around your [pc.cockNoun " + cockIdx + "]. You try to pull back, but she <i>holds</i> you there, a cock-scented laugh escaping her lungs.");
		output("\n\n<i>That’s</i> what she wanted.");
		output("\n\nBianca’s matching your pace; you’re in control. If you wanted to make her throat <i>yours</i> then you’d just have to pick up the pace before the spark is gone.");
		output("\n\nUnless you wanted something more sensual?");
	}

	addButton(0, "Facefuck", doinBiancaInTheMouth, [cockIdx, biancaLeads], "Facefuck", "You’re in charge. Use Bianca’s mouth like it belongs to you.");
	addButton(1, "Titfuck", doinBiancaInTheTits, cockIdx, "Titfuck", (flags["BIANCA_SEXED_TITS"] == undefined ? "You’re in charge. Tell Bianca to do something else to get you off..." : "Ask Bianca to give you a titfuck."));
}

public function doinBiancaInTheMouth(args:Array):void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	// processTime 7-15\rand minutes
	processTime(7+rand(9));

	var cockIdx:int = args[0];

	// from Bianca Lead-In
	if (args[1])
	{
		if (pc.isNice()) output("Although Bianca <i>wants</i> you to feel this way, you’re loathe to admit that her provocations have conquered your patient nature. The only way to quench the insidious heat between your hips and her lips is to grab hold of her head and give her creamy throat the deepest of deep dickings.");
		else if (pc.isMisch()) output("Bianca’s goal was to inflame your passions and she succeeded spectacularly. You’re clutching her head, ping-ponging back and forth how you’re going to fuck the mischievous whore’s throat. <i>Slow or gentle?</i> You’ll find out after you’ve fed her every inch.");
		else output("Bianca has agitated your lusts, and on a personal level she agitates you with her behavior. You slap your cock to her face to vent some of the blue anguish, the harmless impact producing a surprisingly sharp and scandalous sound. Pumping into her with an indignant glare and groan of effort, you make ready to deepthroat her cock-hungry throat the way it deserves.");
	}
	// from PC Lead-In
	else
	{
		if (pc.isNice()) output("You firm your hands around Bianca’s head, [pc.fingers] brimming with energy just beneath the bases of her ears. You both want this, and the lust-heat simmering in your lungs fuels the fire chipping away at your inhibitions. You give her a light smile and put weight on your [pc.hips], flattening her spit-spouts on your methodical push into her sopping throat.");
		else if (pc.isMisch()) output("You draw your [pc.hips] back and firm your [pc.hands] to Bianca’s head, nodding and giving her a sly wink. Once you’re aligned, you sigh long and hotly, letting gravity guide you into a flume of wet, plush muscle.");
		else output("You plant your [pc.footOrFeet] and roughly grip Bianca’s head, hooking her mouth open, drawing your [pc.hips] back, and thrusting in without warning. Your red-hot rod is only going to be quenched when it’s done stretching her throat out and cumming for her stomach.");
	}
	output("\n\n<i>“Mng.”</i> Her gag reflex rises to the surface, responding to the intruding mass. A thick sense of delight fights off that tension; the lewd doctor’s eyes blink as she tries to cope with the dizzying taste of sweaty, meaty dick filling her permissive trachea, thrumming against her overwritten taste buds. It’s a sensation she’s overjoyed to experience, doing so with the enthusiasm of a born spunk-slut - her cheeks are already sucking in. The first few inches are suckled past her uvula and into her swallowing gullet, already stretching her narrow windpipe - she doesn’t resist. Bianca is keen to have you test the tightness of her throat.");
	// cock <6
	if (pc.cLength(cockIdx) < 6)
	{
		output("\n\nIt’s not long before you’re burrowed inside [pc.knotBallsHilt " + cockIdx + "]-deep, bulging her neck with the [pc.cockHead " + cockIdx + "] and wishing you had more to shove inside. Fleshy, pleasure-plumped membranes massage your modest mass from crown to root, hot slaver leaking down your [pc.skinFurScalesNoun]. Nose mashed snug and firm into your pelvis, she’s where she belongs.");
		output("\n\nBianca has no difficulty handling your size, moving her head and shoulders to the left and the right in a mobius pattern. Your buried bone is a perfect match for her jaw, which closes all around it in search of places to decorate in sultry bravado. For a small moment you think curiously on the extent of her capacity for insertion, but that’s a question for another time.");
		output("\n\nHer voice gargles up around the thick [pc.cumVisc] flow cascading into her belly while you slide your pliant fuckstick out and back in with greater speed and confidence. Her cheeks puff out with what she can’t swallow, and out spills the [pc.cumColor] river. While your deepthroat begins molding her depths, a vivid memory of this scenario is already being formed.");
	}
	// cock <12
	else if (pc.cLength(cockIdx) < 12)
	{
		output("\n\nThreading your girthy pillar inside Bianca’s mouth is a damn fine pleasure. It’s the movement that will pave the way through her esophagus for a proper facefucking. You hit a little resistance at her opening, but after one inhalation, the fleshy membranes lie down and you’re socketing your bowing dick deeper into the physician’s clingy wet neck. You note you’re already bulging the front of her shudderingly pleased throat with plenty unsheathed length to spare for her as-yet unseen capacity for cock.");
		output("\n\nAnother faint gag flits out from her O-loop lips; biology arrests your plumbing [pc.cockHead " + cockIdx + "] halfway to her spoo-saturated gullet. The fox-milf’s body tenses as if to halt your advance... but she corrects the problem, making sure your breeding mass gets the compliance it deserves. A pat on your [pc.butts] shocks you into a [pc.knotBallsHilt " + cockIdx + "]-deep lunge, bucking the entirety of your reproductive bulk into her stubborn throat.");
		output("\n\nYou’re spurting more and more pre-cum on the backstroke, retreat effortless in comparison to the invasion. It lets you savor the sensations of your skin sliding across her lips again. With her head trapped between your [pc.thighs], her hollowing jaw only has one direction to squeeze. Bianca’s flushed expression and cock-stuffed cheeks are a feast for your eyes. Her braced jaw is filled to the breaking point by your slick, flexing stick and all the unswallowed slime it has to smear her taste buds with.");
	}
	// cock <20
	else
	{
		if (flags["BIANCA_SEXED_FACE"] == undefined) output("\n\nFor one last time, you pause. She can handle herself... but can she handle <i>you?</i> There’s only one way to find out.");
		else output("\n\nJust because Bianca is a fantastic, natural cocksucker doesn’t mean you don’t feel a twinge of concern for cramming your beastly boner inside. A playful slap to the [pc.butts] gets you going, though.");
		output("\n\nYour [pc.cockHead " + cockIdx + "] conquers her membranous gate, overcoming it with firm, building pressure until it ‘pops’ past the obstacle. She gurgles, jaw already sorely straining for your gushing monolith. Her hold reflexively tightens when you go halfway, disorganized humping only one lapse in willpower away. Bianca’s throat distends for the mammoth vigor squeezing into it, bloating to house your glorious mass.");
		output("\n\nAn outline forms just under her jaw, widening further down to the shelf of her breast. You don’t know how far you’ve gone, only that a couple inches are still unsheathed with a need for service. You’re not sure which firmness is stronger: the fox-woman’s aching walls clamping down on your pole or the maddening need to cum swelling in your loins. What strikes you is how she hasn’t gagged. Her breath is held perfectly... serenely... affording you all the time you need to clear a path to her belly.");
		output("\n\nAll the spurting goo glossing your path gives your shaft an easier time, but the heaving contraction of having her stomach so easily violated causes her to clench down so hard that");
		if (pc.cLength(cockIdx) < 15) output(" the last [pc.cockColor " + cockIdx + "] inches are sucked inside");
		else if (pc.cLength(cockIdx) < 18) output(" the rest of your [pc.cockColor " + cockIdx + "] flesh is sucked inside down to the entrance of her stomach");
		else output(" that you batter the entrance of her stomach. You’ve reached her limit");
		output(". You pull back and pound back inside again, cock-juice and throat slime making your throat-stuffing traversals seem miraculous.");
		output("\n\nIt’s by no miracle, but by the resolve of an accommodating throat-slut.");
	}
	output("\n\nYou throb passionately inside her, letting out a tremulous " + (pc.cLength(cockIdx) < 12 ? "sigh of contentment" : "gasp of victory") + ". You can’t help but marvel at her composure");
	if (pc.hasKnot(cockIdx)) output(" and how your knot stretches her lips to their limit");
	else if (pc.hasSheath(cockIdx)) output("and how your sheath crinkles around her lips and vents the tastiest pheromones into her nose");
	output(".");
	if (pc.balls > 0) output(" Your [pc.cumNoun]-heavy [pc.ballsNoun] rub against her chin, providing another layer of wobbly feedback.");
	output(" You wait there long enough for her to adapt, become accustomed to the shape of her conqueror, transforming any lingering distraction into an unrelenting sensory assault. The friction on your shaft just from moving her head the tiniest bit is enough to cry out over.");


	output("\n\nA subtle, winning smile is all it takes for her to send you back to work. Your [pc.hips] haul with feral abandon, slamming your [pc.cock " + cockIdx + "] " + (pc.cocks[cockIdx].cLength() > 15 ? "to her belly":"to the hilt") + " on every wet drive. Fucking her pole-polishing mouth quickly becomes second nature, as does flattening her uvula and batting her tonsils. At the apex of your thrusts, when every nut-stained inch of throat is compressing on your phallus, her eyes bulge a little.");
	if (pc.cLength(cockIdx) >= 20) output(" Bianca suckles your urethral slit when you rear all the way back, triggering a series of spasms that lock your lower body in place.");
	else if (pc.cLength(cockIdx) >= 12) output(" Your dick is too big for her to get a proper taste or to suck at the slit, but that’s where her hands come in, rubbing at your [pc.knotBallsHilt " + cockIdx + "] so that greater torrents of [pc.cumVisc] stuff make it to her belly.");
	// pc Suula or Stinger-Flagged Cock
	if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_SIREN || pc.hasCockFlag(GLOBAL.FLAG_STINGER_TIPPED, cockIdx) || pc.hasCockFlag(GLOBAL.FLAG_STINGER_BASED, cockIdx))
	{
		output("\n\nYour phallic tendrils are innately spurred by their vulnerable surroundings. They, at first, caress Bianca’s sensitive clusters... before reacting as their nature dictates. The venom-bearing attachments to your [pc.cockNoun] lash the spasming innards, inflicting microseconds of pain that are dulled by the suffusion of a thought-obliterating chemical.");
		output("\n\nAn acute squeal pierces the air. It was a sound only Bianca could make. A full-body rattle wracks her to the core. Somehow, you feel wetter than before. A tropical storm of saliva forms in her mouth and she’s clawing at your waist, tears streaming from her eyes. She’s not in pain or distress...");
		if (flags["BIANCA_TASTED_STINGER"] == undefined)
		{
			output(" she’s simply having her first taste of alien ecstasy.");
			flags["BIANCA_TASTED_STINGER"] = 1;
		}
		else output(" she’s simply reacclimating to alien ecstasy.");
	}
	output("\n\nSexual effluvia flies away on every facially-cushioned impact, leaving small dark spots of arousing reminder on her coat. There’s no gentleness in the way your [pc.cocksLight] " + (pc.hasCocks() ? "claim" : "claims") + " her throat");
	if (pc.hasCocks()) output(" and face");
	output(", only the fire she started in your loins. The submissive clinician does nothing to interrupt your pace while you swab her neck, though she is vigilant enough to shift her head when your rhythm falters, ensuring your trajectory is as straight as an arrow.");
	output("\n\nHer hands busy themselves with an exploration of your [pc.butts], groping your backside. A finger teases your backdoor, lightly rimming the " + (pc.hasPlumpAsshole() ? "donut-shaped ":"") + "pucker of your ass. When you feel a trespass coming on you put a stop to it, clapping into her trained throat and positioning yourself to loom a little higher. There will be none of that. Far be it from her to be disheartened, however. It’s clear that she’s happy to be swept up in the riptides of your uninhibited desire, spending her precious oxygen to give you an earful of blissful, suffocated groaning.");
	output("\n\nShe slurps and sucks noisily, quivering in anticipation. Her tongue likes to remind you it exists by dancing across the bloated undergirth that pins it, unwilling to let you glide back in without a taste. Bianca’s half-hooded eyes awaken when you start dragging her entire body with your increasingly merciless thrusts. In a trance, you pound her unrelentingly, fully intent to hammer home until she’s molded into your thoughtless foxen cum-dump.");
	output("\n\nBianca already looks the part too - her cheeks are a reservoir of overflowing precum she refuses to spit out. Hot slaver bubbles out from her flaring nostrils on the upper space of your lofty rod" + (pc.balls > 0 && pc.ballDiameter() >= 4 ? ", and she’s always fed a little more when your ballsack tastes swampy heat on her skin":"") + ". Her endurance is seemingly unaffected by the virile bulk plunging into her guthole, violently riding her slippery esophagus. If anything, it just makes her work to keep it in, subtly curving your direction into her humid depths so that it’s a little more parallel and a little less asphyxiating. In the midst of your throat-thumping pumps, her golden tails wrap around your [pc.legOrLegs] in a fluffy, supportive hug, some of the floof matted down by the syrupy excess of your scandalous " + (flags["BIANCA_CONFRONTED"] != 1 ? "affair":"rendezvous") + ".");
	output("\n\nAt that exact moment is where you can see something magical: her intelligence backing off from undoing any coarse tendency. In body, spirit, and mind... she’s enjoying this, she’s assumed the temporary role of an unthinking cocksleeve. Pulses of rippling pleasure shake her to the core on every lip-squishing impact.");
	output("\n\nShort of breath, you hilt yourself and grind the fox-socket’s head against your crotch. Rubbery lips undulate at the root of your [pc.cock " + cockIdx + "], foamy ejaculate seeping out whenever she tilts down. You growl out her name, panting like a dog; once you catch your second wind, you’re a manic facefucker if there ever was one, giving it to her hard, spreading her around your unyielding prong in every way possible. Your crotch melts away on an ocean of white-hot liquid lust; you’re not sure who’s lost at sea while you carry her body head-first up and down your jackhammer. Numb everywhere, all you can do is hold tight and <i>thrust.</i>");
	output("\n\nTremors and convulsions run through Bianca’s frame. When you look down, her hands are squirming on autopilot between her thighs, giving you a pretty good idea of what’s happened. She goes senseless in your [pc.hands], leaving her, and your desires, a matter of self-satisfaction. Moans of asphyxiated bliss ripple through your [pc.cockNoun " + cockIdx + "], and the nose-tickling waft of feminine orgasm finally reaches you.");
	if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_EQUINE) output(" The flaring peak of your horsecock spreads like an umbrella with inverted purpose, ready to keep spunk down instead of out.");
	output("\n\nWith organic purpose you grind Bianca’s scent-drowned head into your groin, vision darkening. You’re exhausted, flailing in the savage onslaught of intense, pleasurable flashes of fading color. Dr. Ketria meets you thwack-for-thwack, unrecognizable in her obedient state. Her massive boobs flop around like crazy, slapping against your [pc.knees] while her ears droop. You feel like a sprinter who’s pushed [pc.himHer]self to the daily limit, willing your body to take those final steps before you keel over. An unmistakable tightness builds at the bottom of your frenzied state that erupts when you lodge your girth into berry-red cock-cushions ready for their reward" + ((pc.cocks[cockIdx].cLength() < 18 && pc.hasKnot(cockIdx)) ? ", knotting the twat-throated fox’s face as easily as you would a pussy":"") + ", rewarding her inner slut with your precious seed.");
	var cum:Number = pc.cumQ();
	// pc Cum Low (<2500mL)
	if (cum < 2500)
	{
		output("\n\nPussy-tight esophageal walls contract all around your dick, pushing on your libido from an infinite number of directions. Your [pc.dickSkin " + cockIdx + "] is soothed and tugged, [pc.cum] pumping rhythmic spurts into the doctor’s waiting stomach. Sperm-filled cream throbs out in large wads, trickling and seeping in between. Gravity handles the delivery, allowing her body to focus on coaxing out your [pc.cumVisc] reservoir in submissive, eager gulps, her moans a tranquilizing ambience to a body-curling orgasm that’s rapidly being shunted into the woman who’s earned it.");
		if (pc.hasCocks()) output(" While your oral creampie had to be split [pc.cockCount] ways, fortunately, most of it made it down where it belongs. Hopefully she has something to clean the spooge from her hair, though.");
	}
	// pc Cum High (<10000mL)
	else if (cum < 10000)
	{
		output("\n\nWaist-fattening pressure erupts into vice-like walls; ropes of [pc.cum] fire into Bianca’s belly while her body clenches all around the vein pumping it into her. Her body jostles and jiggles from the impact of [pc.cumVisc] sperm barreling into her stretching gullet. None of your protein is wasted, gushing into her plush curves, adding extra layers of thickness to her already impressive body. You rear back and slap in again, indulging in the indescribable feeling of cumming in a sexy woman’s [pc.cumNoun]-fattened stomach while she gurgles for more. When you look down, she’s grown a nice, plump belly to house your needful nut.");
		if (pc.hasCocks()) output(" Although your oral creampie was divided among [pc.cockCount " + cockIdx + "] dicks, you’ve emptied your reserve where it most matters. Still, you hope she’ll have some kind of hair wash for all that [pc.cumColor] sperm slopping around her ears...");
	}
	// pc Cum Hyper (>10001mL)");
	else
	{
		output("\n\nAn orgasmic tide of [pc.cum] surges through your dick before you can even ask yourself if Bianca is a voracious enough whore to handle it all. <i>She is,</i> you comfort yourself; she thrashes about below you when the first pillar of needful spooge crashes into her stomach, yowling and gasping and gagging while you hump her face in the throes of torrential bliss. She jolts, jiggles, jostles, but holds on, keeping her eyes open while endlessly thick waves of [pc.cumVisc] sperminess buffet her gut, yowls of ecstasy scratching your [pc.ears]. Now she looks the part of a proper mother, growing a gravid cum-belly that puts her by distant estimate in the early stages of pregnancy. Every detonation is positively volcanic, and soon, your fountaining [pc.cumColor] output has nowhere to go but up through a liquid funnel being siphoned into her belly.");
		output("\n\nBut you’re not keen on pulling out, not just yet. Just a little more. You can feel her pliable curves groaning outwards in real time, expanding in depraved manner to shelter this magnificent amount of [pc.cumGem] nut. There comes a cry of genuine anguish, and you finally relent. An ocean of backed-up slime comes rushing out of her mouth. She coughs only twice, careful not to waste too much of her treat. When she’s calmed down, you push your still hard and juicy tip back inside to finish up, plumping her mindlessly slurping cheeks out with your rapidly cooling excitement.");
		if (pc.hasCocks()) output("Most of the load split to your other dicks set out to form puddly settlements all around, forming a nice ring of debauchery. The trickles left behind sloughed into her hair like shampoo. Hopefully she has something for that!");
	}

	// PC orgasms, lust reduces to 0
	pc.orgasm();

	addButton(0, "Next", biancasThroatfulOfCum, cum);
}

public function biancasThroatfulOfCum(cum:Number):void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	// processTime 3-6\rand minutes
	processTime(3+rand(4));

	// Low and High Cum
	if (cum < 10000) output("You breathe out a long and very satisfied sigh, you pull your [pc.cockNoun] from her cum-hungry maw, pausing at the middle of her mouth to puff it out with the last of your leavings. She sucks the tip for good measure. When you emerge with a pleasing wet pop, strings of mixed goop connect you to her lips. Inside her well-fucked mouth is a pool of [pc.cumColor] [pc.cumNoun] that she presents to you.");
	// Hyper cum
	else output("It takes almost another minute before your orgasm genuinely ends, and Dr. Ketria was more than happy to drink it all. A few errant flumes of spoo paint her face in cummy joy when you pull away to admire your work.");
	output("\n\nBianca’s lips close and purse, and then there’s an unmissable gulp. You can see the bulge of your heavy load traveling down her throat. She opens her mouth with an ‘ahhh’ and sticks her tongue out, showing that there’s nothing left in a rod-readying display of depravity. You pet her ears and finally step back before your blood starts flowing again, crumpling to the ground like an autumn leaf.");
	if (flags["BIANCA_SEXED_FACE"] == undefined) output("\n\n<i>“I’m really glad you took the lead, [pc.name],”</i> the fox coos.");
	else output("\n\n<i>“Hehe, you really know how to take charge, [pc.name]! That was amazing, and I loved it!”</i> the fox congratulates.");
	output("\n\n<i>“I loved your taste, too. Thanks for letting me have it,”</i> she says with a broad smile. <i>“And thank you for the meal as well.”</i> She pats her belly appreciatively" + (cum < 2500 ? "." : ", which wobbles obligingly with vast liquid weight. Hey, you didn’t cum on her clothes, so that’s fine!"));
	if (pc.isNice()) output("\n\n<i>“Sorry if I got carried away,”</i> you say, <i>“I hope you’re not upset.”</i>");
	else if (pc.isMisch()) output("\n\n<i>“Uh... sorry if I was too rough. You’ve got a way of making me wanna go all in, though,”</i> you smirk.");
	else output("\n\n<i>“Hope that didn’t hurt too much.”</i>");
	output("\n\nBianca giggles, patting you on the head. <i>“Not at all. I always try to encourage others to stand on their own.”</i> She tilts her head and breaks into a laugh. <i>“Not always in sex, mind you!”</i> She massages you further while you join her in post-coital pleasantry. She sits up next to you, a complete mess sure, but she knows how to look after you.");
	output("\n\n<i>“I’m very happy to see your assertive side, [pc.name]. I don’t mind who leads, as long as you felt good. Did you?”</i> She gives a very certain look, biting her lip. <i>“I did...”</i>");
	output("\n\n<i>“More than good!”</i> you declare, and she hugs you");
	if (cum >= 2500) output(", though the crunch on her gut forces up a [pc.cumNoun]-scented burp. She apologizes in ordinary fashion, covering her mouth embarrassedly");
	output(".");
	// familiarity <=50
	if (biancaFamiliarity() < 50)
	{
		output("\n\n" + (pc.isNude() ? "Once she’s done seeing to you, she stands up and cleans herself off, spraying perfume and wiping down with many wet napkins." : "After helping you get dressed, she stands up and cleans herself off, applying perfume and copious amounts of wet napkins.") + "<i>“I’m going to get going, [pc.name].");
		if (cum >= 2500) output(" Of course... with this generous donation weighing me down, <b>I’ll have to take a break for an hour or two</b>.");
		output("”</i> She nods and waves, putting her glasses on. <i>“Take care of yourself.”</i> She turns to go, then looks over her shoulder. <i>“Let me know if I can help next time.”</i>");
		output("\n\nFor sure. You, for your part, sit around another minute before making yourself scarce.");
	}
	// familiarity >=51
	else
	{
		output("\n\n");
		if (!pc.isNude()) output("Bianca helps you get dressed after pampering you extra hard. ");
		output("Once she’s satisfied with your level of care, she collects her glasses and wipes down with plenty of wet naps and a heavy helping of perfume. She looks good as new!");
		if (cum >= 2500) output(" Well... you know, aside from the big, sloshing belly.");
		output(" <i>“Well, [pc.name]... I do have to go. I’m sorry I can’t stay longer, but you know how to reach me. Let me know if you need anything and I’ll be happy to help. Especially if it means you’ll be repaying the favor...”</i> she purrs.");
		if (cum >= 2500) output(" <i>“But first... I’ll need to take a break for an hour or two while my mmm... ‘treat’ digests.”</i>");
		output("\n\nOne wink later, she’s sauntered off into the unknown trailed by her little drone. You know <i>you’re</i> looking forward to next time.");
	}

	biancaSexed("FACE");
	// Bianca is disabled for 2 hours if Cum High/Hyper.
	if (cum >= 2500)
	{
		pc.createStatusEffect("Bianca Gone");
		pc.setStatusMinutes("Bianca Gone", 2*60);
	}

	addButton(0, "Next", biancaEncounterEnd);
}

public function doinBiancaInTheTits(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	// processTime 9-20\rand minutes
	processTime(9+rand(12));

	output("Looking into Bianca’s moist, glimmering eyes is almost hypnotizing. " + (flags["BIANCA_SEXED_TITS"] == undefined ? "It’s at once calming, soothing, and exhilarating. After looking past them, something else catches your attention: her big, heavy boobs. How wonderful it’d be to have those plush cushions wrapped around you..." : "You shake your head, looking down to her sumptuous breasts - all thoughts of fucking her face spill through the cushiony crevasse of her wobbling melons. Your doctor gives the best titfucks!"));
	output("\n\nYou have to drag her head up and off your [pc.cockType " + cockIdx + "] meat to get her attention. Cords of throat-slime drip from the tip onto her clothed bust. <i>“[pc.name]?”</i> Bianca asks, looking disappointed. <i>“" + (flags["BIANCA_SEXED_TITS"] == undefined ? "Did I do something wrong?" : "Is something the matter?") + "”</i>");
	// first
	if (flags["BIANCA_SEXED_TITS"] == undefined)
	{
		if (pc.isNice()) output("\n\n<i>“Oh, no, I was just thinking of something else. I think I’d much prefer it if you gave me a titfuck, too,”</i> you simper.");
		else if (pc.isMisch()) output("\n\n<i>“No, you’re fine. But, y’know... I think I’d like something else,”</i> you tap your chin with a grin. <i>“How about a titfuck?”</i>");
		else output("\n\n<i>“Not at all. I want you to use your tits,”</i> you smirk.");
		output("\n\nBlinking twice, she brightens at the request. <i>“Ah, of course; I can do that! But remember,”</i> she wags a finger, <i>“you still have to cum inside!”</i>");
	}
	// repeat
	else
	{
		if (pc.isNice()) output("\n\n<i>“I’m okay... but I think I’d feel a lot better if you used your boobs, too!”</i> you beam.");
		else if (pc.isMisch()) output("\n\n<i>“Yes, in fact. Your boobs aren’t wrapped around my dick. Why don’t we fix that?”</i> you chuckle.");
		else output("\n\n<i>“Mhm,”</i> you hum. <i>“Give me a titfuck, or I won’t let you suck it.”</i>");
		output("\n\n<i>“Oh- sure, [pc.name]!”</i> she declares.");
	}
	output("\n\nBianca wastes no time seeing to your request, unsleeving herself from her coat and throwing it to the side. In a criss-cross arm pattern she hooks into the lower hem of her shirt, flicking her eyes meaningfully to her constricted cleavage. Your eyebrows rise in tandem with the folding fringe of her black top. The first thing revealed is her sweat-smeared abdomen, taut with the results of active cardio.");
	output("\n\nShe’s neither quick nor slow about the way she undresses - the doctor’s lewd finesse sustains your " + (pc.hasCocks() ? "erections" : "erection") + " hands-free. Tasteful pauses spike your heart rate at the firm, round underside of her depressurizing boobs. Her bound bosom fights back against the compression of her shirt, slowly swelling to their true proportions. All it takes is a yank and the first hints of lingerie spill through the opening, almost impossible to notice because of matching colors.");
	output("\n\nUntil you see the sultry pink.");
	output("\n\nAfter a long sigh and a final, liberating pull, Bianca’s soft, squeezable breasts flop out for their curtain call. A lacy, black and pink bra holds back the tide admirably, but it doesn’t stop them from smushing together and swaying in gravid bovine manner. She rocks her shoulders and instantly captivates you with her big and bouncy boobies, the plump, teacup nipples bulging against the silken cups. Her areolae are wide enough that the upper portions of their swollen discs can’t be concealed - honestly, they have their own cup size separate from the greater mass.");
	if (pc.tallness < 60) output(" With how small you are compared to her, these colossal blimps eclipse your world. If she were to use them more assertively, you’d <i>forget</i> the world!");
	output("\n\nHugging them together, the doctor hefts her chest for your inspection, fingers vanishing into her considerable endowments. ");
	// First Time
	if (flags["BIANCA_SEXED_TITS"] == undefined)
	{
		output("\n\n<i>“Do you like them?”</i> she asks innocuously, and you nod unthinkingly, feasting your eyes on her tranquilizing pillow-tops and the epic ripples fanning through them. " + (silly ? "<i>“I’m an F-cup; F! for fox!”</i> she giggles." : "<i>“I’m an F-cup,”</i> she follows up.") + " On her, those squishy mounds are more like H’s" + (silly ? " high, maybe private" : ", maybe") + " I’s! They sit at the <i>perfect</i> height on her chest, and <i>they don’t sag.</i> Latent boob-loving fetishes could be awoken across the galaxy if these pert beauties were shaken on prime-time hour.");
		if (silly) output("\n\nYou reckon, at F-cup, they weigh about the same as 40 pancakes.");
		output("\n\nFucking her face is an afterthought being jackhammered into the ground by your percussive heartbeats. Were you really thinking of that, and not thinking of <i>these</i>? Your ecstatic [pc.cocksLightIsAre] <i>pumping</i> out " + (pc.hasCocks() ? "steady streams" : "a steady stream") + " of precum, throbbing unstably, all because you have one very important question on your mind:");
		output("\n\nWill she let you touch them?");
		output("\n\nBianca smiles, nodding. <i>“As much as you want, [pc.name].”</i>");
	}
	// Repeat Time
	else
	{
		output("\n\nVirginal desire grips your heart and punches against your chest, cardiac concussion not far off. Facefucking loses all its luster when you make her tits the front, center, and back of your fluttering mind. The pleasure you feel just from watching large and small ripples fan endlessly across her anxiety-eliminating field fires off all the right kind of electrical signals to your titty-overwhelmed neurons.");
		output("\n\n<i>“I’m happy you like my boobs that much,”</i> Bianca simpers, biting her lower lip and rolling them in one full cycle. <i>“Knowing that others like them makes their burden worth the occasional strain.”</i> You gasp and let out the small whine lodged in your throat as they lift up and bulge towards you. <i>“Wanna touch ‘em?”</i> she growls sexily, overwhelming you with maternal heave and matronly jiggle. <i>“Come on, [pc.name]. Before you lose your motivation!”</i>");
		output("\n\nWith all pleasure.");
	}
	output("\n\n" + (pc.tallness < 60 ? "You step up" : "You sink to her level") + ", eagerly stretching out your [pc.hands] for her tits, starting on the ground floor. They’re <b>heavy</b> and incredibly dense. The motherly force pushing on your palms is incredible, made all the sweeter by the encouraging smile on her face. Shaking them is the first natural instinct you have, followed by squeezing them together then pulling apart. Bianca’s snug bra crinkles around its shapely burden, not a single powerful seam in danger of snapping in their line of duty. Holding up these worlds" + (flags["BIANCA_SEXED_TITS"] == undefined ? ", as you’re finding out, is a task for the strongest in the galaxy." : " is a task anyone would gladly submit to for the rest of their life."));
	if (silly) output(" Atlas, eat your heart out!");
	output("\n\nMoans of mirthful encouragement flow from Bianca’s lips. If she’s that sensitive just from being touched through her bra, you can’t wait to get it off. Your fingers begin their ascent, paving like a happy " + (pc.catDog("a", "b") == "a" ? "kitten" : "kaithrit") + " on their way to her bloated teats. They’re so hard and so big that they tentpole the garment’s midnight material. Gulping, you pinch down on them between thumb and index finger, looping them in the gulfs of your first knuckles, plucking and stroking.");
	output("\n\nThat’s when she cries out just like before.");
	output("\n\nWhile Bianca watches you roam the vale of her champagne-hued boobs in doe-eyed affection, you can’t calm your aggressive urges to take this further. Her sincere willingness is a backdrop that lures you under the jet-black cups of her heavy-duty bra. Finding the brim is easy, as is fish-hooking it and lifting. The fox-milf gasps a steamy, excited breath, the tension on her pliant boobies beginning to relieve, drooping like elongated teardrops.");
	output("\n\nSeeing her full jugs pop free and <i>breathe</i> is a jaw-dropping sight. With you handling and appreciating their substantial weight, Bianca’s able to give her shoulders a break from their surplus encumbrance. Once the whiplash wears off, you resume your fond groping, thumbing, and stroking, exploring her bountiful expanse in mindless rapture.");
	output("\n\nThe doctor’s nipples are fat, crimson pebbles that look primed and ready to dribble- no, <i>stream</i> milk. Gleaming, lust-bloated peaks beg to be captured in the mouth, to activate their lover’s innate desire to feed. You pinch the throbbing buds and clap the woman’s blessed breasts together, nearly busting a nut into her chesty canyon when they shake. When one of them points your way you lunge at it, wrapping your [pc.lipColor] lips around the cap of her superlative swell and <b>suck.</b>");
	output("\n\n<i>“Nnmmm,”</i> Bianca winces, <i>“I’m sorry... but no milk will come out.”</i> A reassuring pat to your head turns into a series of passionate rubs. There may be no cream, but your [pc.tongue] still swirls gently around her tit, massaging the pain you caused away. The fox’s maternal instincts activate and she wraps her arms around your neck, eliciting more squishy, serpentine relish. Your left hand massages the underside of her stately manor while the other busies itself with an eastern expedition.");
	output("\n\nPulling away isn’t an option, not when every knead and tweak provokes a squirm and twitch from the pleasured physician. Her boobs are so unbelievably yielding that your fingers vanish from view when you squeeze hard enough, and small pockets of slobber form and break, webbing her mammaries in oral appreciation. There aren’t enough good things you can say about these sweater puppies, so you decide to silence yourself -- by pushing your [pc.face] into the toasty, narrow band of her smothering tit-sleeve.");
	output("\n\nAn immense satisfaction rolls over you when you look up, submerged in her creamy channel like a playful pet. You’re holding them against your cheeks, muffling your [pc.ears] in a mom’s pride. Her twin spheres suppress every stress, massaging your slowly swiveling head in curvaceous padding. Sound comes from one direction: up. When you turn to face it, Bianca is staring down, radiating consent, shuddering and breathing in ragged ecstasy.");
	output("\n\n<i>“Don’t f-forget, your " + (pc.hasCocks() ? "cocks still need" : "cock still needs") + " to cum,”</i> she dotes.");
	output("\n\nEmerging from her drool-slick mounds, you arch back out of frustration. You’re not upset with her, just sad that you had to let go...");
	output("\n\n<i>“Let me take care of this,”</i> she murmurs, moving her breathtaking rack into position. Your arousal peaks; [pc.cocksLight] twitching");
	if (pc.balls > 0 && pc.ballSize() > 4) output(" and ballsack throbbing");
	output(", your whole body jitters. Bianca sees to your anguish while you " + (pc.tallness < 78 ? "stand and present" : "expose more of your lubricated pole") + ". You gasp and gush in utter happiness when she sets her cinched tit-slit to your [pc.cockHeads], pushing your " + (pc.hasCocks() ? "members" : "member") + " down with the heel of her hand and a groan of effort.");
	output("\n\n");
	if (pc.hasCocks()) output("Just before Bianca wraps you up, she grabs " + (pc.cocks.length > 2 ? "an" : "your") + " extra dick and holds it firmly to your first, poised to give " + (pc.cocks.length == 2 ? "your dual endowments" : "at least two of your penises") + " an unforgettable experience. ");
	output("The myriad pressures you feel when she swaddles your [pc.cocks] is incredible, and the physical contact of your [pc.cockType " + cockIdx + "] rod on her teats instills in her the same impatience you feel. Sensual slowness heightens your voice another octave, rising higher with each inch engulfed by her cock-warming jiggle. Smile broadening, she presses her buxom chest inward and lets it swell outward, pulling you into a depthless sea of opulent boob, deep enough for you to feel her pounding heartbeat through your [pc.dickSkin " + cockIdx + "].");
	// cock Size <11
	if (pc.biggestCockLength() < 11) output("\n\n<i>“There!”</i> Bianca coos, fully trapping your " + (pc.hasCocks() ? "two cocks" : "cock") + " in her mammaries’ embrace, blush spreading from her face to her copious breastflesh. " + (pc.biggestCockLength() > 8 ? "The [pc.cockHeadsIsAre] barely visible from the top, and that’s only because she allows " + (pc.hasCocks() ? "them." : "it.") : "It’s not long before you bottom out, completely and wholly submerged in the fox’s cradle.") + " <i>“All gone, [pc.name]”</i> she simpers, ears and tails flickering playfully. <i>“Here we go.”</i>");
	// cock Size <20
	else output("\n\n<i>“Ooh,”</i> Bianca coos, tremendous regard for your [pc.cocksLight] in her eyes. " + (pc.hasCocks() ? "They" : "It") + " jut out of her quality cleavage, pulsing in ready engorgement, leaking runnels of [pc.cumColor] precum all over the place. " + (pc.hasCocks() ? "The [pc.cockHeads] easily close" : "The [pc.cockHead] easily closes") + " the distance to her mouth on your involuntary thrust, whereupon she kisses the gushing slit and slurps the first [pc.cumGem] " + (pc.hasCocks() ? "dollops that form" : "dollop that forms") + ", casting you a knowing glance. <i>“Here we go... I’ll squeeze out all your cum, [pc.name].”</i>");
	output("\n\nBianca’s upwards massage is unspeakably comforting. Her nipples (and, indeed, her breasts) are glowing in the sunlight, glistening brighter as you spurt more prejizz into the cock-compressing channel. Her shapely tits sway and jiggle and mold and bounce, generating a glorious friction that " + (pc.hasCocks() ? "[pc.cocksLight] bask in" : "your [pc.cockNoun] basks in") + ". Downward slides are already producing audible squelches of moisture that drown out your mixed moans.");
	output("\n\nPre-cum leaks and sags from your [pc.cocksLight] in greater and greater amounts, rolling down your " + (pc.hasCocks() ? "undersides" : "underside") + " and adding to the slickness of her makeshift onahole. Every subsequent drop is sped along by all the [pc.cumVisc] stuff that came before. It smears her mammoth mammaries until they’re soaking wet, gliding against your " + (pc.isHerm() ? "herm" : pc.mf("man", "girl")) + "-hood in sync with your subconscious thrusts. When your hips batter her crushing crevice, you’re spattered in the viscous, accumulating goop until you’re dripping just as whorishly.");
	if (flags["BIANCA_SEXED_TITS"] == undefined) output("\n\n<i>“It’s been a long time since I’ve done this,”</i> Bianca smirks, <i>“I hope it’s to your liking.”</i>");
	else output("\n\n<i>“I hope I’m getting better at this. Seeing you feel good is more than enough for me.”</i>");
	output("\n\nYou assure her that she’s doing a good job, shifting your double-handed grip to pet behind her ears. <i>“Hehe,”</i> she laughs, bobbing her head, " + (pc.biggestCockLength() < 11 ? "licking at the lake of pre formed at the top of her cleavage" : "kissing your oozing spunk-slit") + ". <i>“Let it all out whenever you’re ready, okay?”</i>");
	output("\n\nThe doctor’s prodigious bust practically vibrates from the hard dicking you start to give it, each tit-flopping impact destabilizing her grip. Your blood pressure is crazy high, and the only prescription " + (silly ? "is more cowbell- errr, it’s to fuck ‘em even harder!" : "is to screw her jugs faster.") + " That’s what your [pc.hips] devote themselves to, thrusting through pockets of slime");
	if (pc.biggestCockLength() >= 11)
	{
		output(" and straight into her mouth");
		if (pc.cocks.length > 2) output(", your " + (pc.cocks.length == 3 ? "third cock" : "untouched cocks") + " bopping her nose");
	}
	output(" on superhuman vigor. During one particularly savage insertion, you slam into her chest [pc.knotBallsHilt " + cockIdx + "]-deep");
	if (pc.hasCocks()) output(", prying apart her mounds and nearly loosening one of your dicks. Bianca reacts quickly, banding an arm over her tits to keep your twin fucksticks inside");
	output(".");
	output("\n\n<i>“Harder,”</i> Bianca moans up to you. <i>“Use me; cum for me!”</i>");
	output("\n\nBouncing, glossed breasts deform around your smothered " + (pc.hasCocks() ? "poles" : "pole") + ". Bianca’s bosomy twat firms tighter around your " + (pc.hasCocks() ? "lengths" : "length") + ", undulating like an ocean swirling with an angered god’s wrath. A sense of wanton enjoyment inundates your system, stealing control for an even more selfish thrust");
	if (pc.biggestCockLength() < 12) output(" that takes you all the way through her cleavage");
	else if (pc.biggestCockLength() < 16) output(" that takes you all the way into her mouth");
	else output(" that penetrates all the way to her adam’s apple");
	output(". Frenetic energy pumps you through an elysian valley, short-circuiting your brain cells to make this drizzling ferocity possible. Bubbly bursts of prespunk crackle through your loins, opaque lances of bliss spurting and striping a risqué parent’s face.");
	// pc Suula Cock
	if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_SIREN || pc.hasCockFlag(GLOBAL.FLAG_STINGER_TIPPED) || pc.hasCockFlag(GLOBAL.FLAG_STINGER_BASED)) output("\n\nAlien chemicals split Bianca’s sensual seam on the next headlong rush. The aphrodisiac stingers carried by your over-excited dick dump their payloads into the amorous vixen’s chest, turning her light skin to a bright, horny red that makes you feel like you’re railing the molten core of the planet supporting your vicious titfucking.");
	output("\n\nBianca pivots her face down, spreading her thirsty lips into a delirious puckered O-shape " + (pc.biggestCockLength() < 11 ? "to catch any delectable pre" : "to catch your [pc.cockHead " + cockIdx + "] when you slide all the way up, polishing it with slavish licks and imploring sucks") + ". You feverishly thrash against her chest for all its worth, somehow in more control than she is. Saliva hangs from mouth and pours over the expanse of her lubricated flesh, puddling in her cleavage and splattering up on your rapid climb to orgasm. Even when the spit runs dry, there’s always plenty of [pc.cumVisc] spoo to trickle out in its place.");
	output("\n\nOrgasm’s a stone’s throw away; stiff and eager as you’ll get, there’s no time to languish in her warmth, not when you’re this close to spunking her and her banging tits. On your final stride to a [pc.cumColor] ending, you watch Bianca’s eyes roll back from all the friction, ending her oral stimulation. You missed her creaming her panties, but you can’t be blamed, not when you’re imbued with the physiological need to rut her mammoth chest and leave your viscous mark on these slutty fertility advertisements.");
	output("\n\nFragrant feminine bliss tickles your nose, and what was once a titty-fuck evolves to a titty-<b>mauling.</b> Pressure builds in the back of your waist and your vision goes white, lost but not alone in the never-ending horizon of milfy tit.");
	if (pc.hasKnot(cockIdx) || pc.hasKnot(pc.biggestCockIndex())) output(" Your " + (pc.hasKnot(cockIdx) && pc.biggestCockIndex() != cockIdx && pc.hasKnot(pc.biggestCockIndex()) ? "[pc.knots] angrily swell" : "[pc.knot " + (pc.hasKnot(cockIdx) ? cockIdx : pc.biggestCockIndex()) + "] angrily swells") + " at her underboob, making ready to breed unbreedable territory.");
	if (pc.balls > 0) output(" Your [pc.ballsNoun] churn and tighten against her underboob, ready to stain the doctor’s throat and chest with freshly brewed [pc.cumNoun].");
	output("\n\n<i>“[pc.name]... [pc.name]...”</i> Bianca finds her voice just in time to cry out, <i>“I w-w-w-ant to taste it - cum in my mouth!”</i> before being reduced to a moaning mess.");
	if (pc.biggestCockLength() < 11) output("\n\nYou wrench yourself from her cleavage and impale her throat, cum surging through your boner.");
	else output("\n\nYou thrust all the way up to her lips and down her throat, spunk already spouting up from inside.");
	var cum:Number = pc.cumQ();
	// pc Cum Low, <3000mL
	if (cum < 3000)
	{
		output("\n\nBianca’s uvula and tonsil readily flatten and spread for your urgent intrusion, obediently accepting all the fat wads of [pc.cum] surging out into");
		if (pc.hasCocks()) output(" and over");
		output(" her. Heated release spurts into a downspout of trembling, fervor-flushed walls, shepherding your orgasm into the needy fox-slut’s gullet. A reassuring hand finds its way to your " + (pc.hasKnot(cockIdx) || pc.hasSheath(cockIdx) ? "[pc.knotOrSheath " + cockIdx + "]" : "[pc.ballsNoun]") + " and gives a gentle squeeze, spurring all your eager swimmers to cross the threshold and settle into her belly. Spooge-garbled moans rumble against your [pc.cockNoun " + cockIdx + "], helping vent the rest of your liquid passion into your tightly-held caretaker’s cummy furrow, sating her estrus need for semen.");
		output("\n\nWhen your [pc.cumVisc] orgasm is nearly spent you pull out from her orally-drenched maw and aim your final loads onto her fecund breast, clearly marking her as yours. So you like to imagine, anyway. If she doesn’t wipe it away, the odorous fluids will evaporate quick enough. You’re just happy to rest your [pc.cockHead " + cockIdx + "] to her nipple and paint this venusian beauty in hot seed.");
	}
	// pc Cum High <15,000mL
	else
	{
		output("\n\nTorrential rods of [pc.cum] fire into Bianca’s throat, past a jaw slackened in zealous, phallic obedience. It’s the perfect kind of entryway, the type only a naturally gifted cumslut can open. [pc.CumVisc] climax cascades down her bulging neck, immediately plumping her belly with fresh, bubbly virility. Her esophagus bulges outward with visible outlines of oral creampie, and the hungry gulps she makes add to the volume of your subsequent shots. All that emerges from the doctor’s throat is spunk-heavy gurgle that tells you how happy she is to be the one to receive your seed. Her lips and cheeks hollow to add more volume to the pumping gushes of [pc.cumNoun] flooding her innards with gusto. Your hips move in shallow strokes, slapping your [pc.knotBallsHilt " + cockIdx + "] to her chin until she gags and sputters from [pc.cumFlavor] fullness.");
		output("\n\nAn errant [pc.hand] strokes across the back of her head. Your [pc.hips] rock to her spunk-gulping tempo, liters of slick, slimy seed pumping and drooling into her fathomless furrow, quenching her estrus need with excess sperm and a liquid-inflated gut. You can feel it pushing into your [pc.leg], and the sensation only drives you to pull back and slam some more nut in there. After all, one cannot spell nutrition without it.");
		output("\n\nIn your lust-drunk haze you finally pull out and aim the dregs of you receding orgasm on her face. [pc.CumColor] splash against her cheeks, on her lips, and then, your favorite, her breasts, spattering fair skin in a [pc.cumGem] lacquer that marks her clearly as yours -- so you’d like to imagine anyway, it makes it easier to cum. You hope she won’t be in any hurry to wash the frosting of jizz on her heaving boobs. By the time you’re finished, you’ve caked her mountains in a blanket of warm seed. Her weapons-grade tits were made for nothing less than wearing titanic amounts of spermy appreciation. <i>They were meant to be fucked. They’re meant to be caked in steaming-hot [pc.cumNoun]!</i>");
		// pc Cum Hyper (additional) >15,001
		if (cum >= 15000)
		{
			output("\n\nYou thought your orgasm was over" + (silly ? ", but it was me, DIO!" : ".") + " It’s not, if the thickly-scented puddle broadening at your [pc.footOrFeet] has anything to say about it. Looking up, you note that Bianca’s mouth is open for business again, so you fire off a few loads into her hair and on her ears before serving up a gushing dessert as thank you for such an amazing titfuck");
			if (pc.balls > 0 && pc.ballSize() > 4) output(", your brimming ballsack rubbing and pulsing warmly against her chin");
			output(". You can tell that she’s more than pleased with your output, finding only reasons to embrace her nature as a protein junkie, absentmindedly servicing the [pc.cocksLight] pouring out a load big enough to swell her with multiple sets of twins.");
			if (pc.hasCocks()) output(" The " + (pc.cocks.length > 2 ? "shafts" : "shaft") + " outside throb the rest across her face. With all this meat on her, she looks like she’s receiving jizz from a deity of dick.");
		}
	}

	// PC cums, reduce lust to 0.
	pc.orgasm();

	addButton(0, "Next", theFoxyTitfuckIsOver, cum);
}

public function theFoxyTitfuckIsOver(cum:Number):void
{
	clearMenu();
	clearOutput();
	showBianca("WORK");
	author("William");
	// processTime 2-4\rand minutes
	processTime(2+rand(3));

	output("Sated and satisfied, you step back and admire Bianca’s [pc.cumNoun]-soaked and quaking form. After a go like that, you’re fully spent. Before you fall to the ground, you smear the last of your dribbled spunk onto her lips.");
	output("\n\n<i>“Ahh,”</i> she sputters, looking down to her boobs. Your intoxicating semen scent rises up to meet her.");
	if (cum >= 3000) output(" She wipes her face, sending thick globs of jism through the air.");
	output(" You wonder if she’s in a twilight dream.");
	output("\n\n<i>“So, how was it?”</i> she asks pointedly, glancing at you with pride, though there’s something in her tone that sounds hopeful and in need of validation. ");
	output("\n\nYou don’t give an answer right away, not while she’s distracted with cleaning off the evidence of your clandestine affair.");
	if (cum >= 3000) output(" She goes through an entire roll of wet naps and half a bottle of perfume by the time she looks presentable again.");
	output(" Once she’s fixed her bra back on and rolled down her shirt, you reply, " + (flags["BIANCA_SEXED_TITS"] == undefined ? "<i>“We need to do that more often,”</i> you grin." : "<i>“You know what my answer is,”</i> you laugh. <i>“We should really schedule appointments at this rate.”</i>"));
	output("\n\n<i>“I’m glad!”</i> she sings, throwing on her coat and donning her glasses. <i>“Sorry if this upsets you,”</i> she spritzes one more dousing of perfume on her head, <i>“but I can’t smell like a busy captain’s bedroom, now can I?”</i>");
	output("\n\nNo, she can’t. ");
	if (biancaFamiliarity() >= 50) output("\n\nAt least, you instantly suggest, <i>not out here.</i> Her reaction makes your heart flutter. <i>“I’ll be waiting for that. Just let me know, [pc.name].”</i>");
	output("\n\nBianca kisses you on the cheek before turning with her drone hovering overhead. <i>“I’ll be going now. Let me know if I can help you again.”</i> She waves, disappearing into the unknown.");
	output("\n\nWhen you’ve ridden the last waves and tingles of fading orgasm, you stand and do the same.");

	// Trips the flag \\SEEN BIANCA'S NAKED CHEST
	flags["BIANCA_SEEN_TITS"] = 1;
	biancaSexed("TITS");

	addButton(0, "Next", biancaEncounterEnd); // Dump PC back to the game.
}

public function biancaMilkingFunctionNameThing():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// sceneTag: processTime 3-5\rand minutes
	processTime(3+rand(3));

	var cockIdx:int = rand(pc.cocks.length);

	// First
	if (flags["BIANCA_SEXED_BLUE"] == undefined)
	{
		output("Bianca’s ministrations are not merciful. Her fingers know every ridge and vein on your pliant [pc.cocksLight], thumbing and humping your with a flick of the wrist and jerk of the elbow. She doesn’t even need to look at your unsubtly aching fuckstick to know how to arouse it, control it. Her visage is painted with pride, hints of smug affection slipping through the laugh-creased cracks.");
		output("\n\nUntil she touches your [pc.ballsNoun]. <i>“Urnnkkgh!”</i> you wheeze, and she stops. That wasn’t pleasure... that was <b>pain</b> to a drooping, sagging place much too sensitive. She stops and stares apologetically, looking to your pulsing boner");
		if (!pc.isCrotchExposed()) output(", carefully extracting it from behind your clothes");
		output(".");
	}
	// Repeat
	else
	{
		output("<i>“H-Hey, before-”</i> you start, but then... she touches your [pc.balls]. <i>“Ackkmm!!”</i>");
		output("\n\nYour wheezing puts an end to the foreplay and Bianca looks at you nervously. Yep, you’re blue-balled again, pretty badly, and she just touched that too-sensitive organ of yours. The doctor stares at you intently, putting this together much faster than the first time. Before she says anything, she glances to your crotch");
		if (!pc.isNude()) output(" and carefully works your clothes out of the way");
		output(".");
	}
	output("\n\nA bright red flush paints your [pc.dickSkin " + cockIdx + "] from crest to groin. The first [pc.cumGem] drop of pre forms like a precious [pc.cumColor] pearl at the top of your rod before trickling down, more chasing it out when the added wetness redoubles your pleasure. You’re a writhing and fluttering thing, every brush against your [pc.cumNoun]-" + (pc.balls > 1 ? "generators" : "generator") + " no different than a touch to your [pc.cocks] -- it’s twinge-inducing, mind-numbing. Your [pc.ballsNoun] have become full-fledged sex-organs in their own right. You’re seeing stars from how <i>fucking sensitive</i> " + (pc.balls == 1 ? "it is" : "they are") + ", slowly learning to anticipate with equal amounts dread and excitement the next hit to your fractured nerves.");
	output("\n\nWhen the doctor’s gaze falls to your groin, she begins a visual prognosis. Your [pc.sack] is <i>big.</i>");
	if (pc.balls > 0)
	{
		if (pc.ballSize() < 6) output(" Much bigger than you’ve ever seen, in fact. Have you really gone so long that you’ve swelled up to this state of densely packed turgidity?");
		else if (pc.ballSize() < 12) output(" It feels like your heartbeats are pumping more into it the longer she stares. It’s <i>huge,</i> twitching heavily with billions of impatient swimmers. The tension is like a low bass beat against your ballsflesh.");
		else if (pc.ballSize() < 18) output(" Your [pc.ballsNounIsAre] have swollen up so tremendously that the rest of your reproductive system picks up the slack. If you were to stand, your sack would be hanging so low it could collect gum on the floor. You’d be immobilized by the strain and helpless to " + (silly ? "save yourself from getting bad ended." : "avoid the nefarious whims of others."));
		else if (pc.ballSize() < 24) output(" It’s the densest thing for miles, overflowing with cream and so pent-up that it looks like it’s been lightly sunburned. What you feel groaning from inside is the oceanic weight of a gorillion sperm cells, anxious to get pumped into or onto something.");
		else
		{
			output(" Your sack is a big enough to use a waterbed, though you seriously hope nobody tries to do so");
			if (pc.race() == "kui-tan") output(" - you’re not a kui-tan!");
			output(" If you’re this close to cumming and spurting like a barnyard beast, then you don’t want to imagine what’s going to happen when someone annihilates your capacity for cognizant thought by");
			if (silly) output(" slapping your [pc.ballsNoun] and remarking how " + (pc.balls == 1 ? "this bad boy" : "these bad boys") + " can fit so much [pc.cumNoun] in " + (pc.balls == 1 ? "it." : "‘em."));
			else output(" sinking a hand into it.");
			output(" The [pc.skinFurScalesNoun] protecting your tension-lengthened package has tinted slightly from the amount of raw engorgement, and it seems to only worsen as the moments tick by.");
		}
	}
	output("\n\nIt doesn’t take a genius to see that you’ve got a seriously bad case of blue-balls.");
	if (flags["BIANCA_SEXED_BLUE"] == undefined)
	{
		output("\n\n<i>“Goodness me, [pc.name]...”</i> Bianca palms her face nervously, sympathy and concern overwriting her previous desire. <i>“Your refractory period must either be very short... or you’ve really gone so long without relief. Hmm...”</i>");
		if (pc.isNice()) output("\n\n<i>“I umm, I simply waited a little too long,”</i> you murmur, looking coy. <i>“I was so busy I didn’t have time to... you know, deal with it. Can you help me?”</i>");
		else if (pc.isMisch()) output("\n\n<i>“Well, I only went so long without it because I was waiting for you to come by and help,”</i> you wink. It kinda hurts to do that, too.");
		else output("\n\n<i>“I don’t have an excuse,”</i> you sigh. <i>“You’ll still help, won’t you?”</i>");
	}
	else
	{
		output("\n\n<i>“[pc.name]... why would you let yourself get this bad?”</i> Bianca smiles shyly, cupping a cheek. <i>“You can’t go about your days with this. This is unacceptable.”</i> She leans closer, purring, <i>“Good thing you have a personal doctor, no?”</i>");
		if (pc.isNice()) output("\n\n<i>“Y-Yes, I’m grateful. Please take care of this!”</i> you cry out, another flash of pleasure whipping you in the face.");
		else if (pc.isMisch()) output("\n\n<i>“If walking through fire meant I’d get your hands on me, I’d do it!”</i> you laugh, until another flash of pleasure slaps you in the face for your audacity to joke when your [pc.ballsNoun] need to be drained.");
		else output("\n\n<i>“It is, so... can you do something- about- it?”</i> you grimace, trying to keep up your stoic attitude when a spiked whip of pleasure knocks you upside the head.");
	}
	output("\n\n<i>“[pc.name],”</i> she taps your nose, <i>“you needn’t ask.”</i> She inhales and breathes out through her nose. <i>“Well, just playing with it won’t get all that cum out. I will be honest,”</i> she smirks, <i>“your condition is unstable. If I just tried to rub or suck it, you’d be in more pain than you need. Now, I don’t have the kind of medicine for doing this cleanly, but I think I can we can work it out on our own.”</i>");
	output("\n\nThe wolfish medic eyes you mischievously.");
	if (flags["BIANCA_SEXED_BLUE"] == undefined)
	{
		output(" For some reason, you don’t like that <b>excited</b> look she’s giving you...");
		output("\n\n<i>“I’m going to have to be... <b>thorough,</b>”</i> her voice comes out breathily.");
		output("\n\n...Well, if she must...!");
	}
	else
	{
		output(" As effective as her method may be, you’re not sure it’s a good thing how excited she gets about applying it...");
		output("\n\n<i>“We’re going to have to go to a dark place to find the light,”</i> she bites her lip.");
	}
	output("\n\n<i>“First,”</i> she purrs, <i>“you must stand up.”</i> She pulls off her coat and glasses, setting them in a neat pile while you whimper to your [pc.footOrFeet]. <i>“And now...”</i> Out of sight, a sanitary glove snaps onto a conspiratorial hand. <i>“We can begin your treatment.”</i>");

	// Raise PC lust to maximum
	pc.maxOutLust();
	addButton(0, "Next", biancaMilkPartTwo, cockIdx);
}

public function biancaMilkPartTwo(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// processTime by 6-11\rand minutes
	processTime(6+rand(6));

	output("Prepped and ready with a pair of synthetic, disposable gloves equipped, Bianca shuffles closer until she’s wrapped around your waist like a rehabilitation therapist");
	if (!pc.isCrotchExposed()) output(", completing the removal of your gear to fully expose your problem area");
	output(". Her head is pressed up to your left glute, tickling your [pc.skinFurScalesNoun] with the twitching of her fuzzy ear -- her tails also contribute, weaving around your [pc.footOrFeet] and offering their rich, fluffy support.");
	output("\n\nAn index finger curls around your tender meat, beginning a physical diagnosis. Unsteady, thickly colored conduits of [pc.cumColor] preseed stream through your dilated urethral spillway like a crack in a dam. Venting all this liquid pressure provides no amount of pleasure, and even the lightest stroke of a deliberately slow finger is unpleasant - it burns. It burns in your sack and in your brain both.");
	output("\n\nYou let out a ragged groan, wriggling in your doctor’s grasp. Bianca allows you to settle before beginning, palming your [pc.butts] and tentatively encroaching on your glossy groin. Feathery foxen fingertips land on your [pc.sackTexture] sack, tracing to from the top of your brimming [pc.ballsNoun] to the bottom, gradually applying more of their slender lengths to the examination, hushing and soothing with an authentic motherly tone.");
	output("\n\nBianca has an understanding of what she’s doing, seeing to it methodically and cautiously. Despite her meticulous and cautious approach, you can sort of feel the touches in your prostate. Thick gobs of spooge pass, pulsing or dribbling out in orgasmic amounts. If not for the sheen of slime you’d be <i>dry</i> as well as raw, and that could possibly be the absolute worst thing for anyone to deal with.");
	output("\n\nThe sunshine in her voice spreads through your lust-sore genitals. You moan for Bianca, enjoying anything and everything she does. The cum-coaxing medic kneads your tortured manhood" + (pc.hasCocks() ? "s":"") + " in her silken grasp. You’re watching her the whole time, doing your best to stay aloft, to keep your eyes from rolling back as steady squirts of phall" + (!pc.hasCocks() ? "us":"i") + "-bloating ribbons pump out of your [pc.cockHeads].");
	output("\n\nOn her ascent, she gathers up a puddle of [pc.cumVisc] leakage in her palm and sweeps her gloved flesh across your [pc.cockNoun " + cockIdx + "] in the first moment of real pleasure since you broached the subject. It feels like more than just her hand is part of the process, teasing away all the discomfort in your body until you release a blissful sigh. <i>“Feeling a little better now, [pc.name]?”</i> she asks maternally, and you nod too eagerly, her healing hands remedying your singed nerves into a workable coolness. <i>“Good; now, this isn’t going to be a painless procedure, but I’ll be here with you through every second of it. Do you understand?”</i>");
	output("\n\nYou reply in the affirmative, feeling a twist of her wrist at the tip of your girth. The pain bends you into a groaning crunch, but it frees you from the loop of constant yet untameable arousal.");
	output("\n\n<i>“I’m sorry,”</i> she giggles, stroking the swollen veins on your " + (pc.hasCocks() ? "dicks" : "dick") + " with the heel of her " + (pc.hasCocks() ? "palms" : "palm") + ". <i>“I must sound so serious. I was ready to make your " + (pc.hasCocks() ? "cocks" : "cock") + " mine, but if you’re this backed up that wouldn’t be fair.”</i> Bianca’s elegant hand posture tugs at your turgid " + (pc.hasCocks() ? "lengths" : "length") + " one second before loving " + (pc.hasCocks() ? "them" : "it") + " the next. She’s wrapping your [pc.cocksLight] in a protective shell, drawing layer upon layer of warmth over " + (pc.hasCocks() ? "them" : "it") + ", coaxing increasingly lusty purrs and quivers. <i>“If I’d gone at you like I wanted, then I would have hurt you, and I would never have forgiven myself.”</i>");
	output("\n\nHer right hand caresses your ‘" + (pc.balls == 1 ? "nad" : "nads") + " with a firm tenderness, learning from the initial rubdown what kind of stress limit your body developed. As it turns out, her delicate handjob has upped your tolerance. Rubs turn to fondles, and fondles turn to very light squeezes; color returns to your unsatisfied sack as fat, solid ropes of prejism <i>throb out</i> from your aching [pc.cockHeads]. You look up to the sky, enjoying the strangest kind of elation.");
	output("\n\nVenting all that pressure produces the most amazing relief. Bianca popped the cork, bringing pain yes, but more than enough pleasure to drown it out. A bathtub could be filled to the brim with your oozing discharge. Cockjuice soaks your [pc.legOrLegs] in a sparkling [pc.cumGem] layer; long, cummy strings trail with her fingers or tether your cumslit between the soil and the crease of your sack like a perverse web.");
	output("\n\nYou’re standing on a cloud or walking on water, the weirdest sort of comfort unknotting all the stiffness inside. Invisible hands stroke your cheek, your head, your [pc.ears], your abdomen... even her tails caress you in topographical pattern. Precise movements upon your testicular heath alight your nerves slowly, gently");
	if (silly) output(" - this is how a life is taken");
	output(". Right now, you feel like the most <i>loved</i> [pc.raceShort] in the universe, inhaling deeply, exhaling out...in and out... in... and out...");
	output("\n\n<i>“Can you tell me how you feel now?”</i> Bianca’s voice breaks you out of your reverie. This entire situation seems so familiar. <i>“[pc.name]?”</i> she asks again. It occurs to you that this is the complete opposite of how she prefers to get you in the mood!");
	if (pc.isNice()) output("\n\n<i>“Better, much better...”</i> you coo happily.");
	else if (pc.isMisch()) output("\n\n<i>“A l-lot b-better. W-whatever you’re doing isss... is working!”</i> you say, stammering over every word.");
	else output("\n\n<i>“Very good. Don’t stop,”</i> you murmur.");
	output("\n\n<i>“Hehe, much less pain now, right?”</i> She plants her open palm to your sack, gently palpating down the side. <i>“Should I taste it? It smells amazing; I wonder how <b>aged</b> it must be!”</i> Regardless of your input, the wanting fox takes a dollop on her finger and into her suckling lips, bathing her taste buds in [pc.cumFlavor] thickness. <i>“Ah!”</i> Bianca gulps, quaking against your body. Tremors of pleasure worm their way into your [pc.legOrLegs] from her own rattling form, feeding vibrations of horniness directly into your nervous system. <i>“Dear me... I shouldn’t have done that...”</i>");
	output("\n\nShe captures your attention, jacking you off a bit faster, lechery embedded on her blushing face. <i>“I’m afraid I’ve become impatient, [pc.name]... I want to taste your cum sooner rather than later.”</i>");

	addButton(0, "Next", biancaFinishingMilkshot, cockIdx);
}

public function biancaFinishingMilkshot(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// processTime by 10-20\rand minutes
	processTime(10+rand(11));

	output("<i>“Wha-”</i> you start, only to be cut off by a tight-fisted grip to your [pc.knotOrSheath " + cockIdx + "]. <i>“Nnggmmm!”</i> you groan, fingers spreading and curling in plateauing bliss. There’s a squeeze and a deeply uncomfortable fullness that passes when Bianca releases, jacking your [pc.cocks] faster... and faster, pointing your [pc.cockHeads] up. The fire in your veins intensifies; your phallus twitches in open air, shaft-coating volumes of erotic juice fountaining out around your center" + (pc.hasCocks() ? "pieces" : "piece") + "; she pulls back, letting the spasming [pc.cockHeads] launch salvo after salvo of liquid lacquer.");
	output("\n\nSpit dribbles down your slack jaw; the foxy physician softly speaks from below. <i>“I want you to think about some things for me. Can you do that?”</i> You nod, a gurgled response slipping off your tongue like an ignorant customer on a wet floor. <i>“I want you to... <b>think about me naked,</b>”</i> she hums, <i>“...I want you to look at your big, delicious " + (pc.hasCocks() ? "cocks" : "cock") + " and think of " + (pc.hasCocks() ? "them" : "it") + " pointed at my face.”</i> The images come rushing through your head <i>very</i> easily. In your state, you’re glad to try anything just to get off. <i>“Imagine me kneeling in front of you with my hands open below my chin, ready to catch all your <b>thick</b>... <b>tasty</b>... <b>sperm,</b>”</i> she continues, ball-fondling hands demonstrating more worship than professionalism, <i>“...and think about me being <b>showered</b> in all of your desire, every single drop masking me from the world....”</i>");
	output("\n\nYour scrotum flexes in anxious need, bouncing upwards to smash a bigger hole in your reservoir, accelerating its lurid draining. Her words dig deep into your mind, drawing upon the sexual easel you might have called a brain a few minutes ago. Your entire body relaxes and tenses in rhythmic motion, all because you’re thinking about dumping your [pc.cumNoun] on a genial doctor, maybe plumping her belly with it. Bending her over and breeding every orifice available is the stroking buzz at the front <i>and</i> back of your mind. A wellness blossoms out from your gut -- more relief. Lewd fantasies of glazing the wobbly-eared fox in voluminous jizz clenches your muscles. Phantom jerking sensations cling to your [pc.cocksLight], the memories of her hands so strong you can mentally masturbate with them.");
	output("\n\nNow you’re no longer sure if she’s responsible for even a fraction of your sensual anarchy.");
	output("\n\n<i>“Can you see me right there? With my mouth, wet and sticky from your <b>savagery!</b>”</i> She giggles. <i>“Can you see that silly fox waiting for her reward? Or, rather...”</i> ");
	if (pc.balls > 0)
	{
		if (pc.ballSize() < 6) output(" She cups and kneads your [pc.ballsNoun] in one hand");
		else if (pc.ballSize() < 12) output(" She double-palms the circumference of your [pc.ballsNoun] lovingly");
		else if (pc.ballSize() < 18) output(" She sinks her hands into the squishy bounty of your nutsack, losing her fingers down to the knuckles");
		else if (pc.ballSize() < 24) output(" Bianca licks at your oversized ballsack, sniffing and hugging the gratuitous and squishy cum-factory");
		else output(" She nuzzles her cheek into the west hemisphere of your " + (pc.balls > 1 ? "left nut" : "single gonad") + ", licking and sniffing at your oversized spunk-" + (pc.balls > 1 ? "tanks" : "tank"));
	}
	output(", <i>“...Her <b>punishment?</b>”</i> Your [pc.arms] flail out; your teeth grit so hard that every tooth is on display. Hell, it’s impossible not to whimper at this point.");
	output("\n\nA heavy gasp claws through your curled lips while Bianca rocks you back and forth, holding you steady on your subconscious desire to fuck the projected simulacrum of her milfy figure. With how blurry your sight’s become, you <i>do</i> see her there, slutty mouth wide open, and you’re thrusting past her spit-speckled lips with enough force to lock her ethereal jaw around your sopping fuckstick.");
	output("\n\nBianca knows exactly what she’s working with: the galaxy’s most tremendously swollen " + (pc.balls > 1 ? "nuts" : "nut") + ", jiggling and jostling with unparalleled virility stowed inside " + (pc.balls == 1 ? "its capacious circumference" : "their capacious circumferences") + ". Fingers vanish into your fleshy encumbrance, churning with bestial motivations, swirling and gurgling at the apex of overdue ecstasy. Where her fingertips prod or press, creating large craters in your obese [pc.ballsNoun], other areas of your torrid wellspring bulge out until the indents of individual sperm cells are faintly visible on the boundary, gurgling inside... bubbling like magma at the caldera, ready to erupt on cataclysmic scales.");
	output("\n\nFrom an impossible number of directions your packed-up ballsack is lovingly tortured. One finger slides down your backpouch, two others glide down the front. A whole hand strokes the broadside of " + (pc.balls == 1 ? "your" : "a") + " slathered testicle. The warmth blooming through your mightily throbbing maleness sends it into another overproductive spasm. The legendary fondling of your weighty spheres sets off a chain reaction of muscular contractions, corking and uncorking your [pc.cocksLight] - the flow obstructs for a moment, before a slurry of [pc.cumColor] porridge bursts at the urging of a kegel twitch. Just about everywhere around is now completely soaked in spilt spunk, pooling around you until the doctor is knee-deep in a circle of gooey [pc.cumGem].");
	output("\n\nAt some point you lose your grip on the difference between fantasy and reality, so great is your need to achieve climax, so divine is the weight you’ve been carrying. Coherent thought departs with a passing curiosity for how you’ve gotten to be in this position. What can only be described as a fizzle of staticky energy radiates out from your undulating crotch; another thick spurt of goo fires off, landing with an oddly detailed splatter. The apparition’s color changes to match the spermy discharge, and, gods, <i>it’s moaning just like her!</i>");
	output("\n\n<i>“I’m a naughty woman, [pc.name]. Can you see how bad I’ve been? And it’s within your power to teach me my place, to cum so hard that I’ll get hooked on your smell, your virility. I’ll learn my lesson, and I’ll act like I didn’t just so you can put me in my place again.”</i> Her tongue affectionately lashes at the side of your [pc.thigh], swabbing down to your hotly pulsing " + (pc.isHerm() ? "herm" : pc.mf("man", "girl")) + "-hood. You can see that and more. You can see her belly filling with your cum... yes... she’s yours! The image in front of you grows ever-more detailed with each whispered promise! You <i>need</i> to fuck her! She’s responsible for this, she’s teased you to such a state!");
	output("\n\nIt’s indescribably erotic what she’s doing to you. Fucking the manifest design of her lecherous description, drizzling pre all over it- no, <i>her,</i> hugging your swollen tenderness between her red-hot lips. You’re hanging in there, suspended in her embrace, helplessly pounding your engorged cock into something that’s not even real... and loving it. You’re so sensitive that the brush of wind to your [pc.skinFurScalesNoun] drives you to insensate distraction, only reinforcing the realness of something decidedly <b>un</b>real.");
	output("\n\nAnd there’s... there’s more! More pairs of deft hands wrapping their curving, digging, interlocking fingers to your [pc.cocksLight] like a cloudy fleshlight with a happy ending at its misty terminus. Bianca’s voice cuts through it all, compelling you onward. <i>“When you take me home, you’ll empty the rest of your hot...”</i> she lightly slaps your sack, an ocean of ripples fnas through your soft, quaking ‘" + (pc.balls > 1 ? "nads" : "nad") + ". <i>“...yummy...”</i> a slap on your [pc.butts], <i>“...cum!”</i>");
	output("\n\nSomehow you’ve been led into breeding a literal ghost and you’re totally cool with it.");
	if (flags["LAQUINE_LASS_TRYSTS"] != undefined || flags["LAQUINE_GENT_BONED"] != undefined)
	{
		output(" Not the first time it’s happened either, which is probably why you’re so open to the idea of leaving this world for a smuttier one - maybe this one will have laquines in it, too?");
		if (silly) output(" The writer sincerely hopes for that, as bunnies rule everything around him.");
	}
	output(" Faint stripes of ejaculate rain down on Bianca’s head, and her knelt phantasm turns around, exposing a pregnable pussy that is definitely the stuff of your depraved dreams. Now when you hammer forward, you do so with euphoric aplomb; you do so without a wayward tremble, with the unfettered joy of fucking a");
	if (flags["BIANCA_CONFRONTED"] != 1) output(" married,");
	output(" willing woman presented like a dog in fresh heat, intent on plowing her blessedly fertile body until it’s heavy with seed <i>and</i> child.");
	output("\n\nAn unholy tightness assails you, alerting your mind to a wet, dense intrusion. Your liberated urethra dilates for impending release under the doctor’s vigilant guidance, orgasmic fluid swelling just below. Detonation is seconds away, but... something else is prodding at you, deep inside. A confused and amorous babble wicks up from your lungs and you identify the source: there’s something inside you, and when it presses on a wall, an acute sensation is poked into your violated core.");
	output("\n\nFor a brief second you tear your sight off the doctor’s doppelgangers " + (flags["BIANCA_SEXED_BLUE"] == undefined ? "and find out exactly why she’s wearing gloves" : "and discover her real plan") + ": she’s jabbed two fingers into your [pc.asshole], spelunking in a dark cavern. There’s no way you’ll figure out <i>when</i> that happened, but " + (pc.hasPerk("Buttslut") || pc.isFemboy() ? "it’s probably the best thing she could be doing for you. You almost wish she had a vibrator on hand to shove in there on the highest setting! You’re her anal whore now, so" : "you decide it’s for the best. All you want to do is cum,") + " you violently pump forward...");
	output("\n\n...and on your retreat, those fingers are slammed into the swollen mass of your masculinity hidden there, smashing your cum-button from every angle and kickstarting your so-far agonized libido. Uncontrollable convulsions begin at your prostate and spread throughout your body");
	if (pc.hasWings()) output("; your wings unfurl and spread triumphantly");
	output(". Clamping down on those roughly pegging fingers feels too good. Bianca pushes forward, drawing shapes only she can know and whispering words only she can hear. The incredible internal stimulation is the fuse needed by your external joy, all the steady oozing turning to ruthlessly-milked pumps.");
	if (pc.hasVagina()) output(" Your [pc.pussiesIsAre] cumming too, but the effect is distant, only an extra bass-beat layer to your very male orgasm.");
	var cum:Number = pc.cumQ();
	// pc Cum Low (<10,000mL)
	if (cum < 10000)
	{
		output("\n\nThe most tender cock in the universe - yours - is cumming. It’s at once the release you’ve been craving and an exhilarating process. The warmth of your [pc.cum] rushing out is almost overshadowed by the chill of cumming outside a hole and into the ground. All you know is that you’re standing there, propped up by a generous force, pressing forwards and backwards to express all that backed-up sperm. You can’t keep your eyes open while the raging ropes of [pc.cumVisc] spunk spray out at wildly different intervals - sometimes a salvo fires off, sometimes it’s just one torrential pillar of the stuff. And you definitely don’t feel the hands on your [pc.cocksLight] easing the process" + (pc.hasCocks() ? " of an ejaculation shunting through [pc.cockCount] dicks." : "."));
		output("\n\nGasping again, you open your eyes to see Bianca in front of you - and yes, it’s the real Bianca. She’s squat under your spouting rod, catching your [pc.cumFlavor] jism when it jets out. In fact, the tip is aimed at her mouth, so there’s no way she’s missing out on her favorite meal. Delicate ball and [pc.knotOrSheath " + cockIdx + "] massages ensure not a drop of [pc.cumGem] nut is wasted or left behind, reducing your nutsack to little more than a dried up fig when you’ve spent every congested cell. Thankfully, she doesn’t take it much further than you can handle. Just knowing your fantasy came to life, that you painted her with a few steaming lines of [pc.cumNoun]... that’s enough.");
		output("\n\nSweet dreams are made of this.");
	}
	// pc Cum High (<20,000mL)
	else
	{
		output("\n\nThe tightness in your [pc.ballsNoun] is <i>there.</i> [pc.Cum] blasts out in thick, solid, sperm-packed ropes. Your climax is a mind-splitting affair, tearing your middle apart and returning the color to your overwhelmingly labored ballsack. Your [pc.ballsNoun] pulse and bounce and jump and <i>clench</i> with unfathomable joy, gouts of [pc.cumVisc] nut surging out in skyward trajectories, spurting to the hump of your pumping hips. You can’t feel the hands that are gloved around your obscene, churning fullness, assisting the flood of jetting jizz. The fluid pressure you’re");
		if (pc.hasCocks()) output(" shunting through [pc.cockCount] rods and");
		output(" spunking the planet with is enviable, and you do it all with the plaintive whine carefully cultivated by the lack of sexual satiety that brought you here.");
		output("\n\nYour eyes finally open, revealing... Bianca! And it’s the real one this time... and she’s there, right in front of you, knelt down with her mouth wide open catching globs and splashes of festooning jizz each greater in volume than the average man’s cumshot. Her tongue is rolled out to catch whatever leaks off her upper lip; the sight only drives you to a more manic pace, humping forward so hard that your [pc.cockHeads] rebound off her head and tease out more of your magnificent [pc.cumNoun] reserve! Her glasses take on the role of cum-shields, protecting her dazed eyes from lancing spears of goo. Plentiful salvos of sperm surge into the world on riptides of thought-obliterating rapture, fattening your veins on the way to ultimate absolution.");
		// pc Cum Hyper (add-on to High) (<30,000mL)
		if (cum >= 30000)
		{
			output("\n\nIt’s unbelievable how much you’re cumming. Other people could cum to <i>how hard you’re busting</i> and how fucking <b>glorious</b> it is. Between your legs swings a [pc.sack] that draws (and sometimes <b>launches</b>) close against your crotch, climaxing tectonically with an unrelaxing tautness. Bianca’s insistent " + (pc.hasCocks() ? "handjobs" : "handjob") + " ensure that she’s a [pc.cumColor]-smattered slut who looks like she just stepped out of an overfull bath sloshing with [pc.cumVisc] jizz, reveling in your fecund emissions. Not only have you tainted the local area with your goo, you’ve gotten it into her hair, onto her ears, all over her face... and on her exposed tits! She’s pulled her shirt up and yanked off her black bra, hefting her immense, jiggling rack for " + indefiniteArticle(pc.fluidFlavor(pc.cumType)) + " frosting.");
			output("\n\nNothing would make you happier than to aim your [pc.dicks] down to do it... but your [pc.hands] are stuck on the thing at your back keeping you upright. Should you try to move them, then volley after volley of urethral-fattening climax would likely land on you, not their intended targets. Regardless of your lack of freedom in this matter, it’s down to your cum-" + (pc.hasCocks() ? "cannons" : "cannon") + " to mark the fox-slut on " + (pc.hasCocks() ? "their" : "its") + " own, and right now, the bass-like throbs and pulses of your trembling member" + (pc.hasCocks() ? "s are" : " is") + " eddying your subsequent hyper-endowed loads off to wastedness!");
			if (cum < 40000) output(" If only you had a little more, you could cocoon her in all your passion, properly reward her for a job well done...!");
			// pc Cum OMEGA (add-on to Hyper) (>=40,000mL)
			else
			{
				output("\n\nBut for someone like you, with enough cum to fuel a starship or feed a galotian colony, that’s no biggie. It’s been two minutes straight of abusively titanic release, and yet Bianca, the one who brewed this transcendent lather, is undulating in the hedonism of your torrential bounty, ebbing and flowing in a giddy daze for [pc.cumVisc] anointment. Your spunk-turret of a [pc.cockNoun " + cockIdx + "] ensures that mesmerized Bianca is made a gravid mess with generous liquid pressure. [pc.CumGem] columns of divinely-hued fulness fire off, erupting from your pain-numbed [pc.cockHeads] in oscillating sways of doctor-coating volume. Fanfirs would be ballooned by your tremendous testicular production. Every single aching and firing and flashing and bursting nerve in your juicy, pliable body is still being massaged by the inhuman coaxings of your own pornographic imaginings, enabling continued planet-cracking blasts of fresh nutting. Something tells you that by the end of this you’re going to be unconscious, or fade fast into it. For now, you waste a little oxygen to out a little laugh, enjoying the rut-like contractions of your [pc.ballsNoun] and the dramatic end to your case of very blue balls.");
				output("\n\n...Until Bianca, cocooned in " + (pc.isHerm() ? "herm-" : "") + "lotion, rockets forward to take " + (pc.hasCocks() ? "a" : "your") + " messily smattered dick into her mouth, sucking the rest of your belly-bloating ejaculate right from your bliss-tender flesh. On her knees worshiping your [pc.cockType " + cockIdx + "] dick, delighting noisiliy in its [pc.cumFlavor] taste... fuck, what more could you ask for!? With all the air in your lungs you loose a continent-rumbling shriek, pounding your clenched fists into the thing supporting you, through squinted eyes watching keenly her gut expand to house a hot and finely-aged burden.");
			}
		}
	}

	// PC cums! Reduce lust to 0!
	pc.orgasm();

	addButton(0, "Next", biancaMilkingEnd, cum);
}

public function biancaMilkingEnd(cum:Number):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// processTime 4-9\rand minutes
	processTime(4+rand(6));

	output("It comes");
	if (silly) output(" - ha ha! Pun intended! -");
	output(" as absolutely no surprise that you stumble backwards and fall on your butt with all the dignity of an old tree disconnecting from its roots, abandoned by the nourishing rays of sunlight. Your boneless body plants to something solid, heaving hard and in desperate need of your lungs to work again.");
	output("\n\n<i>“Can you open your eyes?”</i>");
	output("\n\nThe mannerly voice breaks through your stupor. Etiquette, allure, propriety, refinement, poise... decorum... it’s Bianca’s. Misfiring electrical signals cause twitches and sudden jerks in every limb as feeling returns. Your eyelids feel as though they’ve been superglued shut, only able to scrunch up harder and keep you in a post-coital landscape of shifting colors.");
	output("\n\nEventually, however, you manage to get your head on straight again, aching all over and mentally hobbling.");
	// low Cum
	if (cum < 20000)
	{
		output("\n\nBianca’s wagging tails give you a much needed hit of oxytocin, and there’s a bit of... pride, you’d guess, from seeing her face dirtied with [pc.cumNoun]. [pc.CumColor] droplets of the stuff leak from her chin and drizzle from her lips. The smile says it all. Happy that you’ve seen her debased, Bianca sets about licking it all off, making a show of hedonistic cum-sluttery for your benefit.");
		output("\n\nAnd, really, hers too.");
	}
	// high Cum
	// Can trip flag \\SEEN BIANCA'S NAKED CHEST if High (or higher) cum!!
	else
	{
		output("\n\nBianca’s tails would be wagging, but they’re weighed down under strands of [pc.cumNoun] that dribble and drip from most of her body. Parts of her clothes are ruined... but that’s not your fault. She pulls her glasses off, tonguing all the sperm off the lenses and finishing the job with a sleeve-wipe. [pc.CumColor] beads of gooey spunk trickle down near her lips only to get lapped up in a flash.");
		output("\n\nIn a hedonistic display of rampant cum-sluttery, Bianca makes a show out of cleaning herself for your benefit... and hers too. She loves the stuff, and the challenge of looking presentable again is right up her alley. The splatters of [pc.cumVisc] seed on her broad chest gladdens you for some reason.");
		// hyper Cum (add-on to high)
		if (cum >= 30000)
		{
			output("\n\nThe little hovering drone that flutters after her is helping with the process, dispensing wet napkins, paper towels, and a new bra in record time. Just what does she have stored in that thing?");
			if (silly) output(" She has an inventory just like you, the player. Duh!");
			output(" Regardless, her level of depravity in privacy certainly puts shame to the galaxy’s bimbos...");
		}
		// omega Cum (add-on to hyper)
		else output("\n\nOnce she’s finished wiping down, the scent of your musk doesn’t leave her easy, not even with an entire bottle of perfume. In addition, she’s not going to burn off that belly in a timely fashion. She seems okay with that though, patting the pregnant-looking distension longingly.");

		flags["BIANCA_SEEN_TITS"] = 1;
	}
	if (flags["BIANCA_SEXED_BLUE"] == undefined) output("\n\n<i>“You know, I’ve never had to do that before. I’ve treated only two people - kui-tans, as you may expect - for epididymal hypertension. So... was it okay? At first I thought about pressing on your prostate... but then I got horny... hehe... so I wanted you to think about cumming all over me, and then I hated seeing it all go to waste.”</i> She giggles. <i>“One taste and I wanted so much more!”</i>");
	else output("\n\n<i>“Don’t take this as a tacit endorsement of unhealthy behavior... but allow me to suggest that you come see me right away if you’re feeling so <b>tense,</b> [pc.name].”</i> Her glowing eyes shine brighter. <i>“Your taste makes me so happy... and the touch of it to my skin... I know I must sound rather strange, but I will have you know that I am very self-secure in my wants.”</i>");
	output((!pc.isCrotchExposed() ? "\n\nShe comes over, helping you redress.":"\n\nShe comes to sit beside you.") + " <i>“You look tired.”</i>");
	output("\n\nFront-runner in the understatement awards, that.");
	output("\n\n<i>“Let me stay here with you for a while.”</i> She plops down and wraps an arm around your lethargic form, pushing your bicep into her cleavage. <i>“If you wish to make a pillow out of me, I won’t complain.”</i> She grins girlishly. <i>“That was a lot of fun for me. I’ll have to change my panties before I work my booth today.”</i>");
	output("\n\nYou and she both laugh. As it turns out, you don’t pass out. Easy not to when you have a companion so openly interested in your health and well-being. For a handful of minutes she verbally nurses you back to your feet, showing her motherly side in each physical act the whole time. Bianca bids goodbye after you’ve regained self-sufficiency. Still, you’re not sure if you’ll ever forget the libidinous things she whispered into your [pc.ears].");

	biancaSexed("BLUE");

	addButton(0, "Next", biancaEncounterEnd);
}

public function biancaGetsHerFingersOnThePC(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// processTime 9-16\rand minutes
	processTime(9+rand(8));

	output("Bianca’s teasing is getting to you");
	if (pc.hasCock()) output(", and it’s reaching the " + (pc.hasVaginas() ? "places" : "place") + " behind your [pc.cocksLight]");
	output(". Your [pc.pussiesIsAre] tingling with unbridled need brought on by the aggressive doctor’s lustful fingers. She shifts closer, swaddling your vision in quivering boobflesh, hellbent on prying an answer out of you even if she has to pry your labial lips apart to do it.");
	output("\n\nYour " + (pc.totalClits() > 1 ? "[pc.clits] feel like live-wires" : "[pc.clit " + vagIdx + "] feels like a live-wire") + " snapping angrily to any titillating proximity. One such jagging bite forces you to gasp out the words she was waiting to hear,");
	if (pc.isAmazon(false)) output(" <i>“C’mon, doc, that all you got? I bet you can’t make me cum all over myself with just your fingers!”</i>");
	else if (pc.isNice()) output(" <i>“Ah! My " + (pc.hasVaginas() ? "pussies" : "pussy") + "; please, more of that! I’d love that!”</i>");
	else if (pc.isMisch()) output(" <i>“Nngh... just play with my " + (pc.hasVaginas() ? "pussies" : "pussy") + " already! Use your fingers and make me cum all over myself!”</i>");
	else output(" <i>“S-Stop teasing and just fingerfuck me!”</i>");
	output("\n\nThe sultry fox leans a few inches away from your [pc.lipColor] lips. <i>“" + (pc.isAmazon(false) ? "I’d love to take your challenge, [pc.name]!" : "Be careful what you wish for, [pc.name].") + "”</i> At that, she glances to your crotch");
	if (!pc.isNude()) output(" and peels your clothing off with a first responder’s quickness");
	output(".");
	if (pc.hasCock()) output(" <i>“It’s a shame you don’t want me to use " + (pc.hasCocks() ? "these" : "this") + ",”</i> she strokes your [pc.cocksLight], seemingly disappointed that you’re asking her to play with that small, hidden place below. <i>“But don’t worry, " + (pc.hasCocks() ? "they" : "it") + "’ll get to cum too.”</i>");
	output("\n\nBianca leans closer to your [pc.pussy " + vagIdx + "],");
	if (pc.wetness(vagIdx) < 2) output(" admiring how wet it’s gotten from a little tête-à-tête. <i>“This is just the beginning,”</i> she winks.");
	else if (pc.wetness(vagIdx) < 3) output(" eyes brightening when they mirror the slick syrupy shine glazing your femininity. <i>“It smells lovely,”</i> she grins. <i>“Let’s see how wet we can really make it.”</i>");
	else if (pc.wetness(vagIdx) < 4) output(" licking her lips when she sees the rivers of [pc.girlCumNoun]-scented juice streaming down and puddling at your [pc.thighs]. <i>“You’re a very wet [pc.boyGirl]. I bet you’ll coat my entire arm when I make you squeal.”</i>");
	else output(" cooing at the sodden webbing of [pc.girlCumNoun]-scented juice puddling past your [pc.thighs]. <i>“Oh my, just how wet are you, [pc.name]? That’s impressive! It’ll be fun to watch you orgasm,”</i> she smiles. <i>“It must be inconvenient when you’re just trying to get by in a day...”</i>");
	output(" The fluffy-tailed minx plants a finger to the bottom of your");
	if (pc.vaginas[vagIdx].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) output(" obscenely pumped");
	else if (pc.hasPlumpPussy(vagIdx)) output(" plump");
	output(" slit, tracing the " + (pc.isHoleTight(vagIdx) ? "tight" : (pc.looseness(vagIdx) < 4 ? "slightly loose" : "pliably loose")) + " entrance up to the clit-topped summit in a delicate brush; her finger bounces off your button and swoops back in to open the gates of your increasingly lusty delta. <i>“Mmmh, you’re getting hotter...”</i>");
	output("\n\nHer rigorous inspection of your moistening twat winds an embarrassed thrill around your spine. A simple tug would crush you, leave at the whims of her lusty manipulations. Not only are you blushing harder, your heartbeats have subtly thickened to the point that her nearness excites your [pc.vaginaColor " + vagIdx + "] pussy into");
	if (pc.wetness(vagIdx) < 2) output(" drizzling");
	else if (pc.wetness(vagIdx) < 3) output(" sprinkling");
	else output(" lightly squirting");
	output(" a batch of [pc.girlCumFlavor] nectar. It seems when she’s at a modest place between your thighs, it winks and whispers... and when she’s an inch away, it gushes and cries out. At any moment she could push into your blindingly warm depths and disappear into rippling, writhing bliss.");
	output("\n\nA too-pleased giggle flutters out while she rolls up her sleeves.");
	output("\n\nAnother realization dawns on you that enhances the moment: it’s not just the anticipation that’s got you braced for sapphic contact, it’s the undeniable truth that if anyone knows how to treat a pussy well, <i>it’s her.</i> Bianca is a woman in the prime of her life and has the matron-matured body that speaks volumes of what sexual wisdom she’s garnered.");

	// Canine, Vulpine, Korgonne
	if (InCollection(pc.vaginas[vagIdx].type, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_KORGONNE)) output("\n\n<i>“Ahh, that’s-!”</i> Bianca coos, swirling her middle and index fingers around your [pc.vaginaColor " + vagIdx + "] gash, provoking your animal-mound into swelling up. <i>“Oh-ho, your vagina’s a little needier than others, [pc.name]!”</i> she chirps. <i>“This plumps up because your body’s getting ready to take a knot. I can’t imagine how much better that would feel for you compared to me!”</i> She visibly swoons, delicately cupping the tender" + (pc.vaginas[vagIdx].hasFlag(GLOBAL.FLAG_HYPER_PUMPED) ? " and gratuitously outsized" : "") + " flesh of your cunt until her fingers sink in and her knuckles are glowing in [pc.girlCumColor] arousal. <i>“" + (flags["BIANCA_SEXED_FRIG"] == undefined ? "Maybe I could fit my whole hand inside..." : "I’m going to try and go deeper this time...") + "”</i>");
	// Feline
	else if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_FELINE)
	{
		output("\n\n<i>“A kaithrit’s vagina,”</i> Bianca grins, <i>“it’s featureless and modest" + (pc.hasPlumpPussy(vagIdx) ? "... well, it would be, but you’ve been playing with a pussy pump haven’t you?" : ", but inside?") + "”</i> She slides two fingers");
		if (pc.hasPlumpPussy(vagIdx)) output("past your chubby folds and");
		output(" into your honey-mitten by a few inches, prompting your body to close down around the intruders with cock-milking, vice-like strength. <i>“Tight... <b>very</b> tight. It’s going to make me work harder for your pleasure, just like a lioness would her mate.”</i> You swallow, gazing at the cords of [pc.girlCumColor] juice connecting her to your desirous snatch. <i>“Fortunately for you, [pc.name], I know exactly how to overcome such obstacles.”</i>");
	}
	// Equine
	else if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_EQUINE) output("\n\n<i>“Mnf...”</i> Bianca drops down, inhaling right from the source of your musky lubricant. Addled, she rubs a finger across the [pc.vaginaColor " + vagIdx + "] lips of your swollen marecunt, a light sweat building on her brow. <i>“These vaginas, they emit the same kind of pheromones that their natural mates do. That musk is powerful, [pc.name]... and I love it.”</i> She sniffs again, thumbing your plush entrance into spurting more of its [pc.girlCumFlavor] nectar onto her knuckles. <i>“But you asked for my fingers, so a proper tasting it will have to wait for the right time.”</i>");
	// Gryvain
	else if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_GRYVAIN) output("\n\n<i>“A gryvain’s vagina!”</i> Bianca giddily exclaims, planting a hand to your [pc.girlCumVisc] [pc.vaginaColor " + vagIdx + "] dragon-hole. <i>“Hee hee, [pc.name], you are in for a world of pleasure,”</i> she eyes you salaciously. <i>“The rings of muscle inside your pussy all have the sensitivity of a clitoris.”</i> The index and middle finger of her right hand slide through your egg-laying channel, encroaching upon the first of those concentric muscle formations. <i>“The voices you’re going to make when I get to them...”</i> A slimy, beady cord of slime bridges the gap from your lust-puffed mound to her adventurous fingers. ..." + (flags["BIANCA_SEXED_FRIG"] == undefined ? "You spoil me, truly!" : "I really should record them!") + "”</i>");
	// Suula
	else if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_SIREN)
	{
		output("\n\n<i>“Hehehe... A suula’s vagina...”</i> Bianca tentatively trespasses on radius of your springy alien pussy, just out of a venomous tentacle’s reach. <i>“These tendrils will clutch to my finger like a cock, pulling me into a bed of libido-spiking aphrodisiacs. I wonder which of us will reach orgasm first?”</i> she giggles, stroking the side of your vulva and pulling away fast before she’s stung, drawing up a small batch of [pc.girlCumFlavor] lube for sampling. <i>“Your taste is so, so fertile... I can’t wait to see how your body reacts to me.”</i>");
		output("\n\nNor can you hers.");
	}
	// pc Human or Unspecified Pussy
	else
	{
		output("\n\n<i>“It’s so pretty and... wanting.”</i> Bianca turns her giddily dilated eyes to yours. <i>“" + (flags["BIANCA_SEXED_FRIG"] == undefined ? "I’m not going to spoil anything, [pc.name]. I can’t wait to show you what I can do with this!" : "I bet you can’t wait to feel me inside again.") + "”</i> She cups your mound until it sheens her palm in [pc.girlCumColor] slickness, oiling her talented fingers in [pc.girlCumVisc] passion.");
		if (pc.hasPlumpPussy(vagIdx)) output(" It seems to surprise her just how much [pc.vaginaColor " + vagIdx + "] girlflesh there is to play with. There’s so much taut, plush skin for her to sink her fingers into, and it has the same delirious effect as a touch anywhere else. Curious pokes to thick, rubbery girlflesh turn to cattle-prodding presses that swing your hips forward for more.");
		output(" <i>“Let’s enjoy this for as long as possible.”</i>");
	}

	// Multi-pussy (add-on to whichever fires)
	if (pc.hasVaginas()) output("\n\nThe doctor’s head tilts and she grins. <i>“" + (pc.vaginas.legnth == 2 ? "Two" : "Three") + "? Have you been playing with expensive mods, [pc.name]? I wonder...”</i> She spreads her fingers out in a V-shape to stroke " + (pc.vaginas.length == 2 ? "both" : "every") + " fleshy crease, slime oozing down the opened clefts of your quivering quims. <i>“I’ll admit, more than one vagina is unusual to me. It’s like having multiple wives or lovers, too much for most to split their attentions on. But, more relevantly...”</i> she purrs, <i>“you having more than one person will... hee hee... make teasing you the easiest task I’ll ever undertake.”</i>");

	// pc Amazon
	if (pc.isAmazon(false))
	{
		output("\n\nBianca tries to yank you forward, but you reflexively catch her grip, yanking her forward onto you. <i>Her reflexes,</i> however, carry her left hand straight into your [pc.pussyNoun " + vagIdx + "], the force of which lays you out horizontal. Propping yourself up on your elbows, you rise up to her lips for a chaste kiss. The fox’s weight falls entirely on your [pc.leg], pinning you down by your [pc.thigh] and docking your [pc.chestNoun] with hers. <i>“Nice catch,”</i> she says, digging into your cunt with unrestrained aggression.");
		output("\n\n<i>“You too,”</i> you throatily moan. Her energetic fingers are drawing loops of pleasure at the front of your dewy honeypot, establishing a foundation from which she can leap further into your breed-hungry tunnel. Although you possess an intimidating amazonian form, she’s not put off by it at all. You’re not only impressed that she matched and subdued you in that moment, but glad. Why be upset? It’s rare to meet someone who can give it to you as good as you’d give it to them.");
		output("\n\nWhen you try to push her up, she forces you back down and slams her knuckle against your squishy, squelching lips. The pleasure of tightening around her nerve-seeking grip throws your head back in a sweaty, pleasured groan, giving her the opportunity to " + (pc.isChestExposed() ? "grab a tit" : "yank your top off and fit her free hand to your tit") + " and start kneading. <i>“Mmmm,”</i> you huff, grabbing the back of her head and guiding her lips to your [pc.nipplesNoun]. She licks and suckles at your teat");
		if (pc.isLactating()) output(", squealing joyously when a sprinkle of [pc.milkNoun] splashes her palate");
		output(".");
		output("\n\nNow that you’ve given her a little reward, you let her go with a scritch behind the vulpine ear. If Bianca were your bed warmer every night, being the bottom wouldn’t be so bad at all!");
		// pc Heat
		if (pc.inHeat())
		{
			output("\n\nBianca leans closer to your body, inhaling your thick, queenly scent. <i>“There’s something here... something stronger than you.”</i> She licks at your [pc.chestNoun] and sniffs again, totally captivated by curiosity. <i>“Ah! You’re in heat, [pc.name]! That’s wonderful. I’m surprised you’re in control of your needs, but maybe it’s just because I’m not equipped to satisfy it?”</i>");
			output("\n\nYou bellow out a hearty laugh, encouraging her to get a little rougher. A pinch, a tweak, and a hard tug to your [pc.clit " + vagIdx + "] satisfy that request. <i>“You’re not a pushover, but I do recommend you try to avoid reckless sex. I bet... I bet you’d jump on the first laquine you see? Maybe an ausar... maybe even a leithan. You could topple them all and ride them into their own beds.”</i>");
			output("\n\nHer words have the ring of truth, but right now, you’re definitely focused on her and not going out and humping the contents of someone’s balls into your womb. Yeah, it sounds like a good time and all, but the things Bianca can do to you, and <i>is doing right now?</i> They’re powerful enough to drown out those deep, physiological urges in electrifying flourishes and pussy-buzzing techniques.");
			output("\n\nA quick kiss on the lips is all she needs to continue.");
		}
		output("\n\nPressure mounts at your dewy juncture when Bianca’s hand glides in and out. Deep reaching harvests of fresh [pc.girlCumNoun] stir your loins into a heated frenzy. Your [pc.hips] thrust indulgently, spearing your juicy slit on the doctor’s fingers. She only allots you two humps before sealing a [pc.nipple] between her lips and sucking on it hard enough to force a gasp. The doctor’s pace ramps up from forceful to commanding, pistoning into you like an automatic love-machine, her fingers making up the dildo pounding into you up to halfway.");
		output("\n\nSensing your need for roughness, the fox begins to nibble at your teat, groping and rolling your breast. Your eyes fill with respect and adoration for her sexual ability, and how with the passage of time, her pretenses pull back along with her gentleness. She focuses on what you both need: the connection of two women whom both possess a vast, unquenchable libido. It comes as a great delight to see that she has an insatiable and ravenous side. ");
		output("\n\nVoid! How rare it must be to coax that out of her.");
		output("\n\nFor someone like you, though, she needs it. Any less and you’d grind your pussy against her face until your scent sank into her pores. Her mouth is wide and panting, hot breaths washing over your wobbling mammarian hills. Chuckling, you pull her head into your cleavage, learning quickly that you can’t do anything to her without a positive reaction. Bianca lunges forward and grinds her knee to the apex of your slit, and that gets you cum then and there, tightening down on her mit and slathering it in a fusillade of deep biological urges.");
		output("\n\nYour companion looks up with curved brow and prideful glare in her eyes. <i>“How many will it take?”</i> she asks.");
		output("\n\n<i>“As many as I want,”</i> you say, giggling back. ");
		output("\n\nYou may not have age on your side, but your climaxes don’t drain your energy. They only <i>amplify it.</i>");
	}
	// pc Not Amazon
	else
	{
		output("\n\nCatching you off guard with a gleeful display of dominance, Bianca yanks you forward and maneuvers behind your defenseless form. Without delay, she pulls you into her lap and wraps her legs around your waist, pinning your [pc.legOrLegs] under her thighs. Before you can react, she fits one hand to your [pc.chestNoun] and the other to your groin");
		if (pc.hasCock()) output(", ignoring your [pc.cocksLight] with ample regret");
		output(", resting her head on your shoulder. In the time it takes for your brain to catch up with what just happened, " + (pc.isChestExposed() ? "she snags a [pc.nippleNoun] between her fingers." : "she uncovers your breast and captures a [pc.nippleNoun] in the gap of her fingers."));
		output("\n\n<i>“There we go,”</i> she giggles into your [pc.ear], rocking up and down to purposefully grind her boobs into your back. Her heels plant into the ground and spread");
		if (pc.hasLegs()) output(", forcing your legs wider");
		output(", exposing your glistening [pc.pussyNoun " + vagIdx + "] to the world. You squirm against Bianca for all the good that does, not taking long at all to realize you’re at her mercy and unable to move. More than that, every movement just wedges her fingers deeper into the pheromonal nexus at the front of your crotch.");
		output("\n\nYou’re not allowed the slightest moment of respite like this.");
		if (pc.hasTail()) output(" Even your [pc.tailsIsAre] limpeted, unable to do more than weakly hug her waist.");
		output(" When your [pc.hips] buck and gyrate uncontrollably, it’s a dance that’s only felt inside. The tiny hairs on your body shoot up when Bianca’s head closes the gap, groping your [pc.chestNoun] and nibbling at your [pc.ear]");
		if (!pc.hasEmoteEars()) output(", licking at the lobe from behind before dragging her tongue down your neckline");
		output(". <i>“You’re so cute like this, [pc.name].”</i>");
		output("\n\nWhen she pierces your smooth tunnel, she does it quickly and unceremoniously. In spite of her suddenness she doesn’t travel far, contenting herself with feeling around the gate to your canal in slow, blissful motions. A ring-shaped foundation of pleasure is drawn into your tight, wet hole, a jumping ground for greater pleasures. Softness leads to a little roughness, and back again. It grasps at your breathing in an attempt to match it to her movements, and soon enough, those nerve-hooking crooks are controlling the curls of your [pc.fingers]");
		if (pc.isBiped()) output(" and [pc.toes]");
		output(".");
		output("\n\nSurprising, relentless flicks to your [pc.clit " + vagIdx + "] follow soon after, beginning another pattern of disorienting revelry. Two fingers pinch your thickening [pc.vaginaColor " + vagIdx + "] gumball, sawing back and forth in the same kind of driven motion pumping past the lips of your spread pussy. <i>“Good [pc.boyGirl],”</i> Bianca giggles again, playfully kissing your [pc.hairNoun], nibbling at your [pc.skinFurScales].");
		// pc Heat
		if (pc.inHeat())
		{
			output("\n\nA sharp and ecstatic intake of air interrupts your slide into immodest euphoria. <i>“So that’s...”</i> Bianca brings her head closer, affectionately rubbing her cheek into yours. <i>“You’re in heat, [pc.name]... that’s quite adorable,”</i> she coos, licking breathy hums into your sweaty neck. The reminder of your body’s desperate breeding urges makes you feel that much more vulnerable. And horny.");
			output("\n\n<i>“At your age that can’t have happened much. Or maybe you’re doing it on purpose?”</i> She laughs again, enthused by your lurid state. <i>“Between you and me, I recommend you try to avoid reckless sex. You don’t want the first laquine you see to weigh you down with a full litter, do you?”</i> ");
			output("\n\nT-There’s no way she’s saying that flippantly...!");
			output("\n\n<i>“Laquines are virile, when that awful sterility plague isn’t damaging their biology. They can have litters of up to eight healthy bunnies. I think in your state... you’d be rather weighed down. That would be no good for the inheritor of Steele Tech, would it?”</i>");
			output("\n\nA sheepish mewl buzzes in the back of your mouth when Dr. Ketria tweaks your clit and pinches it in an elegant flourish. That same hand daringly tugs at your [pc.nipplesNoun], mauling your [pc.chestNoun]. <i>“Right here...”</i> She runs a circuit around your labia, a sudden tonal twist igniting your flashing nervous system. <i>“...You’re just a cute [pc.boyGirl] for me to play with. Don’t worry about children. Just focus on us... how good I’m going to make you feel...”</i>");
		}
		output("\n\nThe need within amplifies, and you moan. Her fingers rub your glistening secretions into your [pc.skinFurScalesNoun] like one would fine lotion. Bianca’s digits are plunging in one after the other, deep enough to twist and shake you, but not deep enough for true pleasure. Prickling tingles and low vibrations ripple out through your slick and easily teased surface, the penetration of her pinky finger punching through a pocket of feminine honey, little splatters arcing out. Her thumb has naught to do but knead and press, though with how tense this has made you... it’s not having the desired effect.");
		output("\n\nBianca murmurs into your ear, <i>“Steady your breathing, [pc.name], hold it...”</i>");
		output("\n\nArresting your staggered huffs, you suck it all back in, a placid coolness washing over your [pc.skinFurScalesNoun]. <i>“Let it out now.”</i> You do so, automatically sinking further into a luxurious bed of milfy boobflesh. <i>“There there, good [pc.boyGirl],”</i> she smiles in your immediate periphery, <i>“I have you. Relax. You’re going to feel very good... mm, it’s almost a shame there’s nobody here who can truly take care of you.”</i>");
		if (flags["BIANCA_SEXED_FRIG"] == undefined) output("\n\nW-What does she mean?\n\n<i>“Oh");
		else output("\n\nWhat? Oh- Wait, you remember now...\n\n<i>“Hehe");
		output("...”</i> Her thumb deflects off your [pc.clit " + vagIdx + "] before stroking along the surface of it, dancing on that bundle of hypersensitive nerves. <i>“" + (flags["BIANCA_SEXED_FRIG"] == undefined ? "You’ll understand soon enough." : "You’ll feel that again, just let it happen.") + "”</i>");
		output("\n\nYou now know what it really means to be someone’s fuckdoll, to be lovingly toyed with until you’re yowling and dripping. It’s not just your [pc.pussyNoun " + vagIdx + "] that’s taking the brunt of a fervent fingerfucking, but your [pc.nipplesNoun] too. Pinches and tweaks to your erect buds, upper and lower, have you heaving and whining. Bianca’s motions are subtle and accurate, not a hint of inconsistency. She hasn’t even gone all the way into your overflowing pot and she <i>knows</i> you. She <i>knows</i> how to find your loudest voice, and nothing but the highest volumes satisfy her.");
		output("\n\nIn wavy, raw motions she strokes the top of your pussy from half-deep to the entrance, at first slowly then rapidly. Her presence can be seen on your lower abdomen in pointed imprints. Then she’s switching lanes, triangulating your impending orgasm. Nothing you do in this vulnerable position offers up a feeling of control, solidifying the notion that your being here is secondary to your silken cunt’s enjoyment. Void! ");
		output("\n\nCumming is the next natural step; simmering vibrations beat through your [pc.pussiesLight] and Bianca doesn’t let up, stroking your aching walls through mind-bending release until her whole hand is glazed in spectacular output. Your supple folds refuse to let her go, wanting to keep her mired inside. They relent, remaining open and parted. Your [pc.ears] twitch and you let out a wheeze, your sore lungs and glistening labia the only required proof of her talent.");
		output("\n\n<i>“That was one of many, [pc.name]. I’ll let you catch your breath just this once.”</i>");
	}

	// PC lust maximizes
	pc.maxOutLust();

	addButton(0, "Next", biancaContinuesTheFingering, vagIdx);
}

public function biancaContinuesTheFingering(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// processTime 9-17\rand minutes
	processTime(9+rand(9));

	output("Bianca lets you shudder warmly in her grasp, knowing what makes you tick now that you’ve been brought to your first orgasm. Errant caresses and strokes jerk your sensitive limbs around -- you’re her puppet now, and she’s playing with the many strings that compose you. Your [pc.tongue] shamelessly hangs out, and it’s as much an effort to keep your eyes open as it is not to lose control.");
	output("\n\nThe doctor’s [pc.girlCumNoun]-coated meddlers are brought to her lips, which open eagerly to taste your [pc.girlCumFlavor] goo. Her throat audibly gulps down the fruits of her sapphic harvest. She derives considerable happiness from your orgasm; her brazen act deepens your blush and turns you right back on.");
	// pc Vaginal Virgin
	if (pc.vaginalVirgin)
	{
		output("\n\n<i>“[pc.name]... you taste...”</i> The fox’s long fingers spread and corkscrew, drawing out another [pc.girlCumGem] puddle of girlmusk that she devours. <i>“...Phenomenal!”</i> she cries, rubbing your [pc.pussyNoun " + vagIdx + "] a little harder until her palm is sliding over its");
		if (pc.hasPlumpPussy(vagIdx)) output(" puffy");
		output(" shape in echoing ‘licks’. Her fingers dive back into your drizzling femininity on a mission. This time she’s not acting for your pleasure, but exploring for something. It doesn’t take the pussy-loving vixen long to find the proof of your purity.");
		output("\n\nBianca shrieks in delight, giggling even. <i>“You’re a virgin, [pc.name]? That’s wonderful!”</i> she squeals, thrusting four fingers into your [pc.vaginaColor " + vagIdx + "] glove.");
		output("\n\n<i>“There’s a garden through this gate.”</i> There’s a brush to your hymen - the mere act of your maidenhead being touched throws switches everywhere in your body, locking you down in the seething expectation of being broken in. <i>“I wonder who’ll get to pick the first flower?”</i> Bianca whispers in your [pc.ear], exquisitely silky voice cutting through your wrung, thrashing moans. <i>“Maybe... you’d like me to do it?”</i> she says in an unfittingly girlish voice that teases you to the core. <i>“I could,”</i> her consonants sharpen, <i>“teach you so much...”</i>");
		output("\n\nYour face is so deeply red now that you look like you’ve fallen prey to a Rainbotox prank.");
		output("\n\n<i>“No, I won’t do that,”</i> she titters. <i>“I’m glad enough that you’re letting me do this.”</i> Bianca resumes her fingering with elegant regard, huffing on your shoulder. Her words don’t do justice to the glorious sensation that must have just washed through her. The knowledge that you trust her with such a valuable and unspoiled place makes her feel as warm as afternoon sunshine. <i>“You deserve to have a proper first time with someone,”</i> she continues. <i>“For now, you’re just a [pc.boyGirl] at the mercy of a woman.”</i>");
	}
	// pc Not Virgin
	else
	{
		output("\n\n<i>“Hmmm,”</i> she rolls the ooze around her palate, squeezing her lips together. <i>“Delicious!");
		switch (pc.girlCumType)
		{
			default: output(" A little tangy, but smooth as cream, and when you swallow it... ooh!"); break;
			case GLOBAL.FLUID_TYPE_HONEY: output(" Mmm, honey... just like the zil. This taste is decadent and rich, fitting for someone as pretty as you!"); break;
			case GLOBAL.FLUID_TYPE_SUGAR: output(" This taste is a bit strong... but when I swallow, there’s this little, tingly coolness it leaves behind. Why all the sugar, [pc.name]? You’re sweet enough as is."); break;
			case GLOBAL.FLUID_TYPE_FRUIT_CUM: output(" Just like the fruits and berries found in a forest - it’s great! I’m surprised... but maybe I shouldn’t be. Someone like you would have access to things others don’t even know exist."); break;
		}
		output("”</i>");
	}
	output("\n\nPassionate caresses at your [pc.thighs] renew your lust; they writhe with delight. Your [pc.pussiesIsAre] savaged by ardorous fingers that grind against the borders of your tunnel, delaying the intense drives you crave. Devoid of conscious thought you breathe out and spread your legs wider in an attempt to persuade them back in. A twinge of penetrative expectance jabs you, but it’s just her hand swimming through the slit. When she rings " + (pc.hasVaginas() ? "a" : "your") + " [pc.vaginaColor " + vagIdx + "] buzzer, you’re left a melted, helplessly bucking wreck.");
	// pc Looseness <2
	if (pc.looseness() < 2)
	{
		output("\n\n<i>“Doesn’t it feel so nice to be stretched like this? To be so tight that someone else has to work to please you?”</i> The fox-woman’s question is rhetorical. Also, you can’t answer it right now, except maybe by cinching down on the tip of her needling intruder so hard it changes color. <i>“I bet with how tight you are, you could lock someone inside you until they were drained of every,”</i> she flicks your bean, <i>“...last,”</i> she pinches your");
		if (pc.hasPlumpPussy(vagIdx)) output(" puffy");
		output(" pussylips together, <i>“...drop.”</i>");
	}
	// pc Looseness >3
	else output("\n\n<i>“Hehe, you’re no stranger to adversity... your body opens wide to every encouragement, every temptation. It’s easy to get addicted to being stretched to this extent, you know.”</i> Bianca fish hooks her row of fingers into your pussy brushing towards your loose slit until you convulse and contract. <i>“But there’s still that tightness... tightness meant for the well-endowed to enjoy. I wonder what kind of faces they make when they realize how accommodating you are?”</i>");
	// pc Breasts
	if (pc.hasBreasts())
	{
		output("\n\nFirm gropes to your [pc.breasts] remind you that Bianca is looking out for your pleasure from every angle, not just what’s tucked away in your pelvis. She squeezes " + (pc.totalBreasts() == 2 ? "one fondly, then the other" : "them all fondly") + ". Her hand fans across your [pc.nipples] until they fully harden");
		if (pc.breastRows.some(function(titties:Object, index:int, array:Array):Boolean{return titties.nippleType == GLOBAL.NIPPLE_TYPE_INVERTED;})) output(", popping out of their [pc.nippleColor] homes ready to play");
		output(". There’s nothing abusive about the way she licks and laps, tenderly sampling the bosomy bounty on offer. At first you wince from the yanks on your teats... but then they glow white-hot and visibly vibrate, becoming shining beacons of temptation.");
		// pc Lactating (add-on)
		if (pc.isLactating()) output("\n\nThin ribbons of [pc.milkColor] [pc.milkNoun] launch upwards and land messily on your boobs, more droplets beading and trickling in curved lines down your sloshing sugarmounds. <i>“Lactating is so much fun, isn’t it? What is better than sharing that warmth with those special to you?”</i> She locks her lips around a [pc.nippleNoun] and suckles gently from the tap. Her cheeks hollow, her throat swallows, and she repeats a moment longer before switching to " + (pc.totalBreasts() == 2 ? "the other" : "another") + " boob. <i>“I’m glad you’re here to share it with me. It’s been a long, long time since I’ve gotten to... help... with something like this. Maybe when you’re feeling very full you can let me get more hands-on?”</i>");
	}
	output("\n\nBianca gathers moisture from your streaming cunt, driving you to insanity with slowly mounting pressure. Lewd things are whispered into your addled brain. <i>“Imagine how many people could slide their cocks inside you right now. They wouldn’t even have to be aroused, your womb would greet them in one... single... lunge...”</i> she breathes, forcing more of her weight on you, and-");
	output("\n\nAnother orgasm. You cry out; she husks into your ear, <i>“" + (flags["BIANCA_SEXED_FRIG"] == undefined ? "Do you want to know a secret, [pc.name]?":"I’m glad I’m not so rusty at this, [pc.name].") + "”</i> You’re burning up in her atmosphere, being forced to think about being taken as a lover. She leads your orchestra, conducting every lewd motion. <i>“" + (flags["BIANCA_SEXED_FRIG"] == undefined ? "I haven’t truly begun." : "You can’t wait for me to start, right?") + " When I do, you’re going to think about a few things...”</i> She plants her thumb to your clit and gradually presses down on the sex-glossed");
	if (pc.clitLength < .5) output(" nugget");
	else if (pc.clitLength < 1) output(" gumball");
	output(" rod");
	output(". <i>“You’ll be thinking about being taken by someone, or maybe many people...”</i> When the sensation becomes too much she glides off your buzzer. <i>“...And you’re going to be thinking them making you theirs, maybe even breeding you...”</i>");
	output("\n\nYour [pc.pussiesLightIsAre] so hot that " + (pc.hasVaginas() ? "they cum":"it cums") + " at the barest touches, trapped in a hellish loop of constant and easily triggered orgasm. No word adequately describes how trivial it is to turn you into a sodden slut just by playing across your clitoral hood. Numerous hyper-erotic fantasies play out in your eyes on each tug to your throbbing bud.");
	if(pc.balls > 0) output(" Your [pc.ballsNoun] churn" + (pc.balls == 1 ? "s":"") + " with a heavy load on top of her busy knuckles, demanding service that will never come. Your feminine side is getting all of the attention this time, something your skyward-facing [pc.cocksLight] don’t exactly approve of.");
	else if(pc.hasCock()) output(" Needy pulses of [pc.dickSkin] above Bianca’s busy hand beg for service that will never come. Your [pc.cocksLightIsAre] not happy about this arrangement where only your feminine side gets the attention.");
	// pc Big Clit
	if (pc.clitLength >= 4) output("\n\nThe tugs turns into full-on handjobs. Bianca encircles your ladylike fuckpole with her thumb and index finger, forming a band of magnificent pleasure. A filthy feeling of bliss comes, and in your state you can only approve of it. <i>“Hehe, a clit should never get this big. You’re making this even easier for me. It’s evident you’re the kind of [pc.boyGirl] who wants to be played with.”</i> Just when you thought it couldn’t get better, she vibrates her rod-rubbers in similar fashion to high-quality vibrators, overpowering you with your strongest femgasm yet.");
	// pc Multi Vagina
	if (pc.hasVaginas())
	{
		output("\n\nThe pebbly, hardened " + (pc.vaginas.length > 2 ? "clits on your extra pussies" : (pc.vaginas[1-vagIdx].clits > 1 ? "clits" : "clit") + " on your other vagina") + ", long awaiting her signal, ignite conflagrations of juicy, ricocheting clenches through your unsated " + (pc.vaginas.length > 2 ? "holes" : "hole") + " once they’re touched. Ambrosial lubricant drools, drips, and seeps from your " + (pc.vaginas.length > 2 ? "assorted honeypots" : "extra honeypot") + " in streams of varying translucence. " + (pc.vaginas.length > 2 ? "Three" : "Two") + " gates are attacked in tang-smearing manners, being penetrated all at once to trigger a reality-bending " + (pc.vaginas.length > 2 ? "triple" : "double") + "-orgasm in you. Coronas of sexual energy flicker at the corners of your eyes, flashes of intense pleasure not meant to be experienced by a single person eat away at your cognizance.");
	}
	output("\n\nNothing could prepare you for the head-spinning moment when Bianca shoves her fingers in further than before. Your body arches upward, burying her deeper, but not deep enough to introduce her to your womb. The motion nearly sucks her hand into your pussy, and it’s only now you’re able to grasp just how right she is. Shoving something larger inside yourself, a dildo, maybe even a dick, sounds like the best idea! In fact, this entire, gratuitous session seems to have been tailor-made to prep you for mind-blowing sex!");
	if (flags["BIANCA_SEXED_FRIG"] == undefined) output("\n\nIs that it? Is this how she would get herself ready!?");
	else output("\n\nYou spare a questionably crucial thought to wonder if this is the same thing she does to herself when she needs stress relief.");
	output("\n\nThis feeling scouring through you in the aftermath of many a body-rocking release is one not of utter satisfaction. No, it’s an amplified craving that drags you further into something you don’t know if you should admit. It feels amazing, no doubt... but it also leaves you feeling lonely. Bianca’s disembodied voice is there, encouraging your fall into abject lust. ");
	output("\n\nYou feel an unbidden <i>desire</i> for lovemaking, for someone to take you in their arms and make you feel <i>wanted.</i> If anyone were to see you so vulnerable now, you doubt you could stop yourself from begging them to take you and treat you in a way Bianca can’t.");
	output("\n\nTurns out, what she was saying earlier... it’s true. You’re thinking of that and more. Any penetration would drive you over the edge into a fuck-mad state where the only thing you could think of is servicing a stud teeming with virility and bearing their children. A suitable father would definitely incline your mind and body, softened and pliable as they are now, to forget about the Steele Tech inheritance and only concern themselves with starting a family. Lost in this delirium, you don’t notice the many climaxes you’re enduring. You’re just a vibrator in [pc.raceShort] form.");
	// Randomize the following blurbs, or cycle through them. Whichever. The NPCs must fuck the PC's pussy (except Syri, because she moves from Mhen'ga) for these to appear.
	var imaginations:Array = new Array();
	// pc Fucked By Fantasies (just something ambiguous)
	imaginations.push("\n\nThere are hands everywhere. It’s not just Bianca rendering you limp with repeated crimes against [pc.pussyNoun " + vagIdx + "], but... more of her. Your coherency is so badly damaged by vigorous pussy-pleasing that all you’re doing is spasming and lurching to a fox milf’s fingers. You don’t just feel fingers pistoning in and out of your juicy cunt. You don’t just feel your [pc.girlCumNoun]-spurting glands on a permanent activation loop. What you feel is an omnipresent force of pleasure locking you into an endless series of contractions. Muscle control has become a foreign concept, so obscure that it may as well have never been real. Lips press loving kisses to every inch of your [pc.skinFurScales]. Hands that never let go rub and coax your body from limpness, if just to see you rattle again. Compassionate hums fill your [pc.ears] like the lube-squelching thrusts of a very busy wrist.");
	// pc Fucked By Syri (must be friend/lover)
	if (flags["SYRI_WINBET_VAG"] != undefined && syriFriendsWithBenefits()) imaginations.push("\n\nYour eyes cross to a cunt-breaking punch. When you look over, Bianca is gone, and between your place is an amalgam of... a woman... with long hair, a long coat... and jackal-like ears... Syri! Of course you’re thinking about her! Fuck, she’s plowing you so hard that she’s straining you open with her swollen knot. Her face comes into clarity; the confident, brusque ausar’s brow is set and determined on breeding you, fucking you into your place. Thrilling strums tap along your spine when it occurs to you that you’re such a bitch for her dick that she’s got you wondering when her knot’s going to stay!\n\nEach successive hump of phantom pup degrades your grip on reality. Full, sticky balls clap into your taint while a meaty dog cock slams into your cunt. Your mind registers this as her spurting out a firehose of pre-jizz, You need to cum so much. You feel so full when her dick comes within distance of your womb, twitching until you happily gurgle. The muscly girl’s hips are thrusting with a blur. On some level you know it’s not her... it’s Bianca’s fingers...\n\nBut the idea that it’s Syri about to seed you with her litter is what you hold on to, and it pushes your peaked pleasure into unknowable heights.");
	// pc Fucked By Shekka (w/ Horsecock, so she'd be on crew)
	if (flags["SHEKKA_TRIED_2_BREED_U"] != undefined) imaginations.push("\n\nPlaintive cries burst from your throat, forcing you to look down to the reason for your outburst. At your groin, clutching your [pc.hips], is a long-eared girl, short with a large dick... it’s Shekka! The scarlet-scaled raskvel is humping away at you like the rabbit she resembles, cramming your cum-socket of a pussy with every inch of meaty horsecock. Huge, brimming balls clap an intense rhythm into the nadir of your gash, letting you know just how full your imagination of her perfect breeding state is.\n\nShe doesn’t look at you, and she doesn’t need to. All you want to see her doing is driving that fine, bitch-breaking monument to medical science into your womb and unloading. The raskvel she-stud could knock up entire villages with just a few drops. As it is, you’re thinking deeply about being her brood-bitch, hoping that you get to bear the most of her litters.\n\nYes, you know it’s not her... deep down you know... but Bianca’s left you in too pliable a state to care. When you cum, you’re going to remember vividly how well Shekka filled you before, and then go back and re-experience the joy of being her cum-dump.");
	// pc Fucked By Kiro
	if (flags["KIRO_FUCKED_PC"] != undefined) imaginations.push("\n\nTimed perfectly with Bianca’s fingers, an oddly familiar and specific cock slaps against your cunt. A blunted head folds backward before popping into your ready pussy, gliding forward on a raging river of [pc.girlCumNoun] until it batters your cervix into submission. Heavy cum-tanks smash into your [pc.butts], and when you look up, there’s a familiar furry babe... tawny... it’s Kiro! Ah, yes, who else could breed you properly? Kiro’s always got so much cum thanks to her kui-tan heritage. The smile on her lips is all you need to see, because you can <i>feel</i> on an instinctive level her equine staff drilling her savior until she’s heavy with seed.\n\nThe tanuki babe doesn’t even need to hold you, just pumping her hips backwards and forwards. In the back of your mind you know it’s not her, it’s Bianca whispering into your ear. But she’s not here. Your conjuration of the freebooting futanari is, and you’re mentally screaming your love for this wonderful dicking to the heavens. Every time she burrows into the hilt, you cum. Sometimes you cum twice, once on her push, and again on the backstroke.\n\nMaybe you’ll tell Kiro about this when she’s plugging your womb up for real. She’ll probably cum even harder!");
	// pc Fucked By Kase (must be on crew)
	if (flags["KASE_FUCKED_PCVAG"] != undefined) imaginations.push("\n\nBrush-strokes similar to fingers alert you to something out of place. When you look to your groin expecting a fox’s fingers, you see only a two-tailed boy... with short hair... Kase! That explains it; his bristling cat-cock is brushing your walls in a way only it is equipped to do. The nubs grind against every reachable nerve and wiggle into action on contact with your quivering clitty. He displays no timidness in fucking you, boldly plowing your [pc.pussyNoun " + vagIdx + "] with a masculinity that, well, you can only imagine is latent in him.\n\nIf you could reach out and take his hand while he achieves manliness, you would. If you could scream his name, your mouth would do so. But for the time being, all you can do is bask in the fantasy of being bred by the shy kaithrit turned masterful partner. Yes, it’s not him... but you dearly wish it was. When you cum, you’re going to do so clinging to the idea that he’s pumping your womb full of seed, siring a litter of kittens with you. Maybe you’ll go find him when you’re done here just to get a bellyful of cream all the same...");
	// pc Fucked By Ardia (must have taken several loads internally)
	if (flags["ARDIA_CUMSHOTS_SWALLOWED"] > 3) imaginations.push("\n\nBianca said you would be thinking of cock, of someone breeding you... who else is there to think of but " + (addictedToArdia() ? "your alpha" : "the dzaan") + " Ardia? And... wow, when you look down, you can see something resembling her coming into focus. Taut, massive balls strike in slow <i>plap-plap-plap</i> motions against your taint. The [ardia.cock] of your plush, umber mistress hauls back and forth in an effort to give you your reward for unquestioning devotion. There’s more to it than that - there’s the rush of being filled with heavenly, life-affirming cum.\n\nHer fucking you is the natural order of things. While she humps you with the intent to breed and assert, to maintain your status as the loving, dedicated beta you are, you’re just thinking of other ways she can do it. Your doctor was so incredibly right about this! Getting fingerfucked on its own is nothing compared to this! When you’re done, you doubt you’ll be totally satisfied. You’ll want to go nuzzle into your mistress’ balls until she deigns to dump her sperm down your throat, maybe fuck you right into your ship’s chair\n\nHopefully you’ll wake up with her cock in your mouth when you go to bed next time...");
	// pc Fucked By Leila (comment out until she's implemented)9999
	if (false) imaginations.push("\n\nA lurid echo bounces off every mental wall you’ve erected. You look down to see... something fucking you. Something approximating humanoid that your mind pieces together, starting with long ears, a slick suit, and a sweaty, orange face. Leila... and she’s gripped tight to your thighs, gritting her lapine incisors and pumping a [leila.cock] into your [pc.pussyNoun " + vagIdx + "] with all her lapine might. On her short muzzle is the first smile you ever saw her wear. When her cobalt eyes open, they lock to yours full of want and desire.\n\nYou look back pleadingly, encouraging the leporine phantasm to fuck you from climax to climax. Her furry, girthy, packed balls slap into your taint and grind so hard that you can feel the pre-cum squirting against your cervix. Well, it’s not, but she fucked you so well that your pussy has burned the memory into its muscles. It knows how to behave when stuffed full of meaty laquine dick. Her lovemaking is equal parts wild and sensuous, and there’s just something indescribably erotic about being the object of a laquine’s affects... even if she is just a ghost.\n\nWhen you’re done, you’ll go and have another round with her. You want that feeling now, more than ever. She aches to cum inside nearly as much as you ache for her breed you, infertile though she may be. You want to be engorged with her enormous cum-load, spattered and bloated with herm-bunny goo. The rutting rabbit’s image solidifies in your mind, and you occupy its thoughts...");
	output(RandomInCollection(imaginations));
	output("\n\nWith one final assault written into your velveteen wetness, all remaining air is pushed out in a painful cry silenced by a woman’s kiss. Every sense in your body is erased except one, the most important one: the sensation of your [pc.pussiesLight], " + (!pc.hasVaginas() ? "the one that’s turned":"the ones that have turned into") + " the planet’s newest waterfall" + (pc.hasVaginas() ? "s":"") + ", tightening so hard that the walls rub one another. A hollowness begins at your gut and throws off your perceptions into a slow-moving blur. Your eyes cross in pleasure, and the tension in the air and around you surges upwards, dragging you towards heaven.");
	// pc Squirter (wetness >=4)
	if (pc.isSquirter())
	{
		output("\n\nFeminine ejaculation hammers on the forefront of your mind, wiping the slate clean. Your [pc.hips] lurch back and jerk forward, firing off squirts of [pc.girlCum] at the doctor’s urging. [pc.GirlCumVisc] [pc.girlCumColor] missiles of powerful relief erupt from your [pc.pussiesLight], splitting against unslotted fingers before splattering into the ground." + (pc.canMilkSquirt() ? " Streamers of [pc.milk] launch upward in curvy lines during the spasms, your boobies adding to the debauchery squirt by delicious squirt.":""));
		if(pc.hasCock()) output(" They’re closely followed by goopy wads of [pc.cum] that Bianca’s very eager to catch, wearing your [pc.cumGem] seed like a spermy bracelet.");
		output("\n\nStress and anxiety fade away while you wallow in the muscle-locking seizings of copious emission. Soon your body will have no choice but to give up and collapse, and no amount of resolution will prevent that. Nobody could blame you for how loud you moan, how hard you cum. They’d all want the same thing you’re feeling now. You can’t unseal your eyes. Not that you’d want to, because the visual overload and colorful panoramas see to it that your orgasm is felt in emotions and images, not with words, not with abstract thought. It just <i>is,</i> and nothing’s going to change just how <b>fucking hot that is.</b>");
		output("\n\nThe sound of gushing fluid tapers down to slow oozing. Pretty soon you slide into unconsciousness -- a comforting denouement to an indescribable affair.");
	}
	// pc Not Squirter (wetness <3)
	else
	{
		output("\n\nForceful ejaculations squelch and creak around your loving doctor’s socketed fingers. Muscular contractions create small dents in your [pc.skinFurScales]; screams of delight herald fragrant, bubbly release. [pc.GirlCum] sprinkles out of your [pc.pussiesLight] for the first two ‘shots’; fireworks and other spasming ballistics pop off at the forefront of your mind. The twitches of relief and excitement fulfilled, triggered by the muscle-locking aftershocks, prompt another explosive burst. The trickles leaking out of you are nothing compared to how it feels to be satisfied.");
		if (pc.isLactating()) output(" Arcs of [pc.milk] shoot upward on a final tit-tweak, raining down on Bianca’s hair; divots of the stuff flow into her waiting lips from your [pc.chestNoun].");
		if (pc.hasCock()) output(" At the same time, your [pc.cocksLight] give in to overwhelming bliss, gladly unloading several shots of [pc.cumNoun] to the gentle stroke of her hands.");
		output("\n\nCuriously, the colors absorbing your vision are speckled the same way as Bianca’s glowing purple eyes, and while this uniquely exquisite delight fades into benign, pleasurable quivers, you lose the last of your energy and drift off to a needed nap in the cradling arms of a diligent mother.");
	}

	// PC Cumz! Reduce lust to 0.
	pc.orgasm();

	addButton(0, "Next", biancaIsDoneFingeringFORNOW);
}

public function biancaIsDoneFingeringFORNOW():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// processTime 9-17\rand minutes
	processTime(9+rand(9));

	output("<i>Inhale.</i> Your mouth opens and draws in fresh, clean air. Your nose takes in the next. Your eyes are still closed, but that’s weird... because your eyelashes are moving. A soft laugh goes through your [pc.ear], and the ‘blindfold’ comes off.");
	output("\n\nBlinking a few times, you stay stock still, looking down and around, then finally up. Bianca is looking over -- she had her hand over your eyes, and that hand is now");
	if (pc.earType == GLOBAL.TYPE_SYLVAN) output(" rubbing the tips of your elfin ears");
	else if (pc.hasEmoteEars()) output(" scritching behind your [pc.ears]");
	else output(" petting your [pc.hairNoun]");
	output(". <i>“Good day, [pc.name]. Do you feel better?”</i>");
	output("\n\nBleary as you are, you don’t mistake the shimmering violet gaze overhead. You smile, telling her that you feel ready to seize the day!");
	if (pc.isNice()) output(" <i>“Better than ever, doctor.”</i>");
	else if (pc.isMisch()) output(" <i>“You bet, doc.”</i>");
	else output(" <i>“How could I not?”</i>");
	output("\n\nShe opens her arms and lets you sit up, where you finally realize you’d been resting peacefully against her large, warm breast, wearing her coat like a blanket.");
	output("\n\n<i>“You’re a good [pc.boyGirl]. I hope you’ll let me do this again sometime, if you need any relief,”</i> she says, helping you stand. You surprise her with a tight, affirming hug");
	if (biancaFamiliarity() >= 50) output(", kissing her with all the leftover passion you can conjure");
	output(".");
	output("\n\n<i>“I’m glad you’re so honest with me!”</i> she laughs. " + (biancaFamiliarity() < 50 ? "<i>“Please let me know if I can do this for you again. I had plenty of fun, too,”</i> she purrs." : "<i>“I thought I was being too pushy before, kissing you so much.”</i> Her eyes curve sultrily. <i>“Being able to connect with you like this is everything I could ever want.”</i>"));
	output("\n\nBy the time you’re both ready to go, she waves at you on her trod into thick and thin. The smile on her lips fills you with joy. <i>“Until next time, okay?”</i>");
	output("\n\nFor sure.");

	biancaSexed("FRIG");

	addButton(0, "Next", biancaEncounterEnd);
}

public function biancaLicks(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// processTime 3-7\rand minutes
	processTime(3+rand(5));

	// First Time
	if (flags["BIANCA_SEXED_LICK"] == undefined)
	{
		output("Dr. Ketria is way too good at teasing you. She has one eye on your face and the other on your crotch, and you’re going through all kinds of excited expressions at a breakneck speed. It’s both amazing and disturbing how quickly she can learn everything about you in such little time. If you don’t say something soon, you’ll have to accept her hands -- which wouldn’t be so bad! She’s a talented and experienced woman, but sometimes you just gotta stand up for yourself.");
		output("\n\n<i>“Hey, stop!”</i> you shout, and Bianca recoils in bewilderment. ");
		output("\n\nFinally, you have a chance to think!");
		output("\n\n<i>“I-I’m... is something wrong?”</i> she asks, her eyebrows arch soulfully. <i>“Did I do something wrong?”</i>");
		output("\n\nA second, a grunt, and a heave later, you stand up against the " + (getPlanetName().toLowerCase() == "mhen'ga" ? "tree" : "wall") + " and pat your crotch.");
		if (pc.isNice()) output(" <i>“I’d like you to use your mouth instead, Bianca.”</i> You smile coyly. <i>“My pussy won’t be satisfied without your tongue...”</i>");
		else if (pc.isMisch()) output(" <i>“Of course you’re doing something wrong!”</i> you chuckle good-naturedly. <i>“You’re not using your mouth; fingers won’t cut it this time.”</i>");
		else output(" <i>“You’re doing fine,”</i> you grin, <i>“but you’re not doing enough. Put your lips on my pussy and eat me out.”</i>");
		output("\n\nWorry turns to eagerness in a flash. <i>“Oh! Of course, I can do that! I hope you know what you’re getting yourself into,”</i> she beams.");
	}
	// Repeat
	else
	{
		output("\n\nIt’s much too easy to lean back and let Bianca do all the work. Her precision is unmatched. The only thing that could match her vast sexual experience is a robot programmed with years of kama-sutra technique. Her natural talents are complemented by her medical proficiency. There’s not one erogenous zone on your body that she doesn’t know about, and some of them <i>you</i> didn’t know about. That said, you’re not here to get teased.");
		output("\n\nYou want her lips on your pussy NOW!");
		output("\n\nCatching her off guard, you stagger to your feet and grip her head, dragging her nose-first into your crotch. She gasps, but offers up not an ounce of resistance. In fact, the faint squeal you heard was one of shocked excitement.");
		if (pc.isNice()) output(" <i>“No more teasing,”</i> you simper, petting behind her ear, <i>“just eat me out already. You know you want to.”</i>");
		else if (pc.isMisch()) output(" <i>“Alright doc, you’ve given me enough physicals,”</i> you declare. <i>“Time for you to put those lips to my lips, if you know what I mean.”</i>");
		else output(" <i>“No games today. Just suck my clit and get your tongue in there.”</i>");
		output("\n\n<i>“Ooh...”</i> Bianca hums when you let her lean back. <i>“How can I say no to urging like that?”</i> A beatific smile widens her face. <i>“I love seeing this side of you, [pc.name].”</i>");
	}
	// Crotch Exposed
	if (pc.isCrotchExposed()) output("\n\nBianca slinks forward, centering herself at your groin to nuzzle at your abdomen, letting out a blissful, stuttery sigh when her nose touches to your " + (pc.hasCock() ? "[pc.cocksLight]. You’re sure that if you didn’t just grab her head and refocus her on your [pc.pussies], she would have gotten worked up too much by your [pc.cockType] mast’s musk to do as you asked. Her job is to kiss your cunt, and that’s exactly what you’re going to get out of this." : "pheromonally-drenched loins, drinking in the sight of your aroused mounds with her eyes."));
	// Crotch Not Exposed
	else
	{
		output("\n\nBefore anything else, Bianca slinks forward, centering herself at your groin and nuzzling against your crotch. Meanwhile, her hands busy themselves with pulling down your pesky coverings, baring your");
		if (pc.hasCock()) output(" [pc.cocksLight] and");
		output(" [pc.pussies] for inspection");
		if (pc.balls > 0 && pc.ballSize() >= 4) output(", barely hiding a delighted squeal when your bulging nutsack flops out");
		output(".");
		if (pc.hasCock())
		{
			output(" She gives a shy smile, letting out a stuttered, blissful sigh when she gazes at your hardened " + (pc.hasCocks() ? "manhoods" : "manhood") + ". Desire for dick glows in her violet eyes. Right now, all she need concern herself with is");
			if (pc.balls > 0 && pc.ballSize() >= 4) output(" lifting your [pc.ballsNoun]");
			output(" and getting to work. It’s not like your other sex will be totally ignored!");
		}
	}

	// Maximize PC Lust
	pc.maxOutLust();

	addButton(0, "Next", biancasAFoxAndShesLickingAHole, vagIdx);
}

public function biancasAFoxAndShesLickingAHole(vagIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// processTime 7-19\rand minutes.
	processTime(7+rand(13));

	output("[pc.PussiesLightIsAre] already coated in the beginnings of arousal, glistening attractively. Bianca gives a calming smile, drawing her hand across the sparkling surface, blinking excitedly when a fresh droplet of [pc.girlCumNoun] forms and drips from your slit. Stern, moan-coaxing squeezes to your flower’s petals produce more of that sweet, oozing nectar; hollow, anxious tingles begin at your crotch, the stepping stones her fingers hop along towards euphoria.");
	if (pc.wetness() < 2) output(" A steady trickle of [pc.girlCumVisc] [pc.girlCumColor] juice drizzles into her palm, creating a small puddle that reflects the light in her eyes. <i>“A normal amount - just the <b>right</b> amount,”</i> she grins.");
	else if (pc.wetness() < 3) output(" Thin arcs of [pc.girlCumVisc] [pc.girlCumColor] lubricant drool into her hand, puddling enough to spill through the gaps between her fingers. <i>“I can’t wait to see if we can get you even wetter than this. Just think of what will happen when I touch it properly!”</i> she cocks an eyebrow at you.");
	else if (pc.wetness() < 4)
	{
		output(" Rivers of [pc.girlCumVisc] girlmusk pour into her palm and puddle prettily. The near unbroken stream of arousal soon sees it overflowing and raining onto the ground like a heavenly fountain. <i>“Hehe, I bet you’ll squirt. I bet you’re a messy enough [pc.boyGirl] to splash my face");
		if (flags["BIANCA_LICKSQUIRTED"] != undefined) output(" again");
		output("!”</i> she laughs.");
	}
	else
	{
		output(" Webs of [pc.girlCumVisc] feminine slickness cascade down your inner thighs as well as pour in long, uninterrupted cords straight into her palm. You’re a sopping wet mess, something which the fox’s shining eyes definitely approve of. <i>“Your orgasms are going to be dirty. I’m lucky to be part of them!”</i> she gleefully exclaims. <i>“");
		if (pc.hasCock()) output("You’ll cum here as hard as your " + (pc.hasCocks() ? "cocks do" : "cock does"));
		else output("You’ll cum just as hard as a man or a hermaphrodite");
		output(".”</i>");
	}
	output("\n\nA touch of warm, wriggly flesh flips your world for a split second. First you felt her nose collide with your [pc.clit " + vagIdx + "], and then her four-inch tongue pressing flatly to your dewy twat. Wordless elation bubbles up inside, muscles quivering for the grasping tongue lapping at your flesh like a savory ice-cream cone");
	if (pc.balls > 0) output(", boldly slurping at the tangy bottom of your [pc.ballsNoun]");
	output(".");
	output("\n\nWhat was gentle now becomes an all-out attack. Bianca’s growly face tilts and scoops against your nethers, burying her thick, dripping tongue into all exterior nooks and crannies. You gasp as you watch, unprepared for her overwhelming oral onslaught. That lovely tongue encircles your clit, pulling it into the pinch of silky-soft curling lips that love to suckle, swirling around it while a devastating headache blinds you with the intensity of it. It’s incredible. You can’t stop it. You can’t adapt to it. It’s just with her mouth and-");
	output("\n\n-The pleasure instantly reaches a toe-curling plateau and you inevitably let go a [pc.girlCumVisc] reward at the suctioning demands of her vacuuming throat. Slurring out silent expletives and considerable praise, your hands dive for the suckling fox’s head to get a hold of her, lest you become putty for her pussy-pleasers. Her breaths come out hot, steamy clouds, splitting apart on your mons and hanging in the ozone around your sweaty [pc.vaginaColor " + vagIdx + "] pussy.\n\n");
	// imagePack: embed octomush Bianca Cunnilingus pics here.
	showImage("bianca_octomush_cunnilingus");
	// Canine, Vulpine, Korgonne
	if (InCollection(pc.vaginas[vagIdx].type, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_KORGONNE)) output("<i>“Hmmm... yours is...”</i> Bianca lets out a puff of air on your reddening, swelling patches of sensitive skin, smooching your rolling, plump fields up and down. <i>“How feral! This is the vagina of an animal. The way it plumps, readying itself to be bred eagerly, vigorously... savagely! Hehe, I wonder...”</i> Bianca looks up expectantly, <i>“...how much of my face will you be able to fit in there? My nose, my lips...”</i> The doctor shudders in pure joy. <i>“This is going to be so much fun!”</i>");
	// Feline
	else if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_FELINE) output("<i>“No matter how much of a wet mess I turn you into, this pretty kitty will...”</i> Bianca’s voice trails off; she lunges in for a kiss to the top of your feminine field, dragging her tongue down to your [pc.clit " + vagIdx + "] and it’s hood. <i>“This will stretch my tongue just as much as my lips. These vaginas are very tight, even with frequent sex. I hope you cum a lot,”</i> she glances up, <i>“you’re going to look so cute once I overcome this little trial.”</i>");
	// Equine
	else if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_EQUINE) output("<i>“Mmmhh... this is so...”</i> Bianca’s eyes go cloudy from your succulent girlmusk. She falls forward and crams her nose into your fat, rubbery marepussy, and her tongue falls out of her mouth in an obscenely arousing manner. <i>“I get to have this to myself? It smells so good... just like its matching cock.”</i> " + (pc.cockTotal(GLOBAL.TYPE_EQUINE) > 0 ? "She looks up to your equine endowment and plants a kiss on the medial ring, inhaling every scintillating scent she can." : "She can’t resist the scintillating flavor lacquering your clit, nor pushing her face into your deep, capacious folds.") + " <i>“You really do spoil me, [pc.name]. I’m going to remember this smell in my dreams...”</i> she slurs, scooping her face into your equine nethers, inhaling with a smile. <i>“Think about one thing while we’re together... I’m going to be marked by this. I’m going to smell like this. And right now I can’t think of anything else I’d like more.”</i>");
	// Gryvain
	else if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_GRYVAIN) output("<i>“Oh! This will be fun!”</i> Bianca declares seconds before she kisses your draconic hole and easily slides her tongue past the welcoming folds of your heavily lubricated pussy, dripping [pc.girlCumColor] fluid from its pulsating gates. <i>“I’m sorry I don’t have a longer tongue, but I think I’ll reach one of the muscular rings inside. And when I do...”</i> She laps at her lips, unable to contain the drool dribbling down her face. <i>“You’re going to make the best noises!”</i>");
	// Suula
	else if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_SIREN) output("Bianca smirks at you like a naughty schoolgirl, glancing at you as if to say <i>“Really?”</i>\n\nPursing her lips, she tilts her head out of your alien pussy’s range. Tentacles weave through the air a few centimeters out of your slit, flexing restlessly, waiting to grab something and pull it into a lewd, slutty hole. <i>“" + (flags["BIANCA_APHROLICKSIAC"] == undefined ? "I’m a little nervous, actually. I’ve never had suula venom on my tongue, on my face. But I’ll think of it like a challenge, [pc.name]. Make sure you hold me tight, because I get the feeling this is going to be in my favor.”</i> She winks impishly." : "<i>“Last time was wonderful. Now that I know what to expect, [pc.name]... hehe, the odds are going to be stacked against you. If you feel the need to fall then fear not...”</i> She grins predatorily. <i>“...My tongue will catch you.”</i>"));
	// pc Human or Unspecified Pussy
	else output("<i>“Hee hee; you’re so cute down here, [pc.name]!”</i> she giggles, quite possibly pleasure-drunk. <i>“This heat is amazing... it’s the beginning of genuine arousal. If only there was someone here you trusted with it. So... are you going to give me a chance to breathe when you smash my nose into it? Are you going to try and drown me?”</i> She chews her lip, growling out a husky note just before kissing your clit, then both of the slopes concealing the interior. <i>“Make sure you hold on tight, because I’m not stopping until you do.”</i>");
	// Multi-pussy (add-on to whichever fires)
	if (pc.hasVaginas()) output("\n\nThe doctor’s eyes roll to " + (pc.vaginas.length == 2 ? "the other pussy" : "your other pussies") + ", lost in thought. Theories and formulas flash before her eyes and she seems unable to comprehend that you have " + (pc.vaginas.length == 2 ? "two" : "three") + " cunts to play with. They’re " + (pc.vaginas.length == 2 ? "both" : "all") + " going to squeeze and clench around her face until she’s soaked in orgasm, and the thought of that, by your estimation, looks to be the hottest thing ever. <i>“Thank you for this feast,”</i> Bianca says, stroking your slick array of drooling twats, <i>“but I hope you’re ready for the sensation to come.”</i>");
	output("\n\nIt begins in the blink of an eye: your entrance gives around Bianca’s fleshy pink tongue, but it is not given what’s on offer. That glorious, inquisitive muscle swims upwards through your sopping gash micro-centimeters away from penetration - until it hits your [pc.clit " + vagIdx + "]. Slow, slimy, squelching swirls to your stiffened girl-boner recall the exhaustive bliss from moments ago, stopping just before it smashes your brain again. It throbs and vibrates bare in the air, a [pc.vaginaColor " + vagIdx + "]");
	if (pc.clitLength < 1) output(" nugget");
	else if (pc.clitLength < 4) output(" gumball");
	output(" rod");
	output(" of vulnerable nerves for a cunt-kissing fox.");
	// pc Big Clit
	if (pc.clitLength >= 4) output("\n\nYour [pc.clitsIsAre] are worked over like she would her own. At least, you think that Bianca could do the same if she were as flexible as a kaithrit. Speaking of flexibility, with a veritable ladyboner to work with, you’re able to receive the vulpine milf’s brand of clitoral fellatio, every caress of her lips around the oversized button weaving sensual tendrils of exquisite delight into your loins. Your head nearly rips in half when she sucks on the oversized fuckbuzzer, drawing sweat and honey into her throat and your sudden, indulgent screams into her twitchy ears.");
	// Fully Pumped Pussy
	if (pc.vaginas[vagIdx].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) output("\n\nBianca looks up to you, desire chained behind her glasses, before diving into your hyper-engorged mound of pussy. She’ll never know if it was by transformatives or sex toys that your exterior has gotten so chubby and swollen, but all she cares about is burying her face in the warm womanhood you’ve provided. Her tongue hangs out in total submission to your obscene surface, her fingers having no luck in gripping to the slippery, latex-like surface of your pheromonal mountains. Your pussy isn’t a flower or a fruit to be savored, it’s a melon begging to be split open by something hard and firm, or pierced by something soft and precise.");
	// Slightly Pumped Pussy (or Equine Vagina)
	else if (pc.hasPlumpPussy(vagIdx) || pc.vaginas[vagIdx].type == GLOBAL.TYPE_EQUINE) output("\n\nWresting control away, your loving doctor presses her thumbs to your chubby cuntlips, her mind totally dominated by the sheer amount of fat, lust-suffused pussy available to her. It’s not big enough to obscure her face but it’s engorged enough that it’s rubbery and slippery. Her grip is easily defeated by your plush honeypot, but it does allow her fingers to settle into small divots and depressions along its perfect radius, pressing and rubbing all types of shapes into pulsating hills of taut, almost rubbery [pc.skin].");
	// Balls
	if (pc.balls > 0)
	{
		output("\n\n<i>“Nnmmf,”</i> Bianca moans, taking possession of your [pc.sack] and smearing her slavish devotion to the underpouch of your hot, pulsing [pc.ballsNoun]. The taste of your nutmusk and ballsweat is greatly improved by residual amounts of [pc.girlCumFlavor] girljuice, mixing a cocktail the worshipful fox <i>wants</i> more of on a physiological level. It takes some urging to remind her your [pc.pussiesLight] need that level of care the most. Her response is to kiss the clenching contents of your " + pc.sackTexture("fleshy") + (pc.balls > 1 ? " orbs" : " orb") + ", leaving behind a faint mark of lipstick.");
		output("\n\nIt’s going to look silly, but she’ll have to be satisfied wearing " + (pc.balls > 1 ? "them" : "it") + " like a hat that provides real time feedback! If it’s any consolation, you manage to blurt, she’ll know how good of a job she’s doing when she feels them throb and churn. This is as much a treat for her as it is for you!");
	}
	output("\n\nHolding tight, you grip Bianca’s hair hard enough to hurt. Turns out a little pain is the kind of provocation she needs to work harder for her rewards, and give them you do, scratching behind her ears and throwing out praise after praise for her labia-polishing efforts. Her honey-warm voice lilts, bathing your nethers in sweet affection. You pinch one ear, guiding her down the furrow of your happily-dribbling pussy, pushing her with enough force that her nose ‘pops’ into your tunnel. Out of pure selfish want you grind the doctor’s head into your hole, locking her into your oozing delta for almost a full minute. ");
	// has Suula or Stinger-flagged Pussy
	if (pc.vaginas[vagIdx].type == GLOBAL.TYPE_SIREN || pc.hasVaginaFlag(GLOBAL.FLAG_STINGER_TIPPED, vagIdx) || pc.hasVaginaFlag(GLOBAL.FLAG_STINGER_BASED, vagIdx))
	{
		output("\n\nSensing that it’s their time to shine, the [pc.vaginaColor " + vagIdx + "] tendrils and cilia embedded within your quivering quim let loose. Bianca’s face, lips, and tongue are struck by the enthusiastic feelers, offloading their sensual payload. Heavy doses of tingling numbness are forced into her skin by a bed of chemical-laden tentacles. She doesn’t scream, but she does go limp, looking quite blessed by the tickling heat pumping against her face. You almost want to sit on her now, but you settle for stroking her cheek, letting her enjoy that very unique liminality of her head becoming a sex-organ.");
		flags["BIANCA_APHROLICKSIAC"] = 1;
	}
	output("\n\nBianca comes away with the sheerest bliss smeared across her face, reeking of female orgasm. <i>“Is that all?”</i> she huffs, asking genuinely, tugging her fogged-up glasses off and lobbing them to the side. <i>“You’re going to have to get rougher if you want to take my reins!”</i> Your doctor gives a playful growl. <i>“How about just a little more build-up? I’ll get you so agitated all you’ll want to do is trap me in your thighs until you pass out from cumming so much!”</i>");
	output("\n\nAt her words there’s a very real <b>tic</b> in your eye, a twitch that furls your brow and compels you to slide your thumbs into her ears and your fingers through the river of golden hair. The intrusion into Bianca’s inner ear-floof provokes an ear-shattering screech, distracting her from being rammed nose-first into your wanton sex, suffocating her on the estrus heat radiating from your feminine furnace. <i>“Lick it,”</i> you smirk.");
	output("\n\nBianca’s golden hair mats, shrunken down by copious bliss; gold-furred tails weave around to hug your [pc.legsNoun]. You’re not so sure she’s powerless to stop you from treating her like a glorified sextoy, but she’s not in any hurry to stop you from getting your lady-rocks off at her expense. All that floats up");
	if (pc.balls > 0) output(" around your cum-sack");
	output(" are the faint mewls of a horny and tireless medic, right now cramming your pussy with all the tongue she can extend, leaving the rest of your pleasure to the whims of her nerve-stroking groans and slow thigh massages.");
	output("\n\nYour thoughts are shattered in that moment of deep connection. Despite being an ordinary human tongue, Bianca’s found ways to make it work harder than it has any right to. It has no qualms about stretching itself to the aching point, until it burns as hot and bright as the ambrosia-soaked walls it drags over. Her tongue-tip is as agile as a piano player’s fingers, delivering musical taps and strikes that drive you to pleasure-seize, get even hotter. Drooling a curtain of spit and girl-jizz, she steals away your world, skillfully playing your torrid instrument.");
	output("\n\nDoesn’t take a genius to see that she has no intention of leaving until her performance is complete.");
	output("\n\nStepping forward, you scissor the pussy-obsessive fox in your [pc.thighs], clutching possessively. Now a permanent extension of your groin, she can perform to the best of her cunnilingual abilities. Swaddled like this, there’s nothing she can see that isn’t your [pc.pussiesLight]");
	if (pc.balls > 0)
	{
		output(" - and, sometimes, even that’s false. Your [pc.ballsNoun] " + (pc.balls == 1 ? "becomes her new eyepiece" : "become her new goggles") + ", blocking out " + getPlanetName() + " under their bare, virile weight");
		output("; there’s no air that her flared nostrils can breathe that isn’t filled with the young, healthy pheromones of her [pc.raceShort] [pc.master]. You press her forward all the harder, allowing her to explore new inches of unserviced pussy - she twirls and coils in your perverted playground all the same.");
	}
	output("\n\nA throaty purr of some kind is muffled " + (pc.balls > 0 ? "by your [pc.ballsNoun]" : "by your slit") + "; a full-body vibration wracks her until you’re paralyzed by the residual aftershock. <b>She just came.</b> <i>Bianca just creamed herself!</i> Awakened underneath all her mannerly behavior is just a slut that longs for contact, for love, for control... who are you to deny her that? She was kind enough to get you into this state, to prepare you for the sole purpose of making her feel this way.");
	output("\n\nYou have a <i>purpose</i> now.");
	output("\n\nAnd the first step towards achieving it is by shoving more cunt-drunk doctor inside. Still slurping and suckling, the thirsty medic dances across [pc.vaginaColor " + vagIdx + "] walls with heedless abandon, her wild side fully unlocked and unwilling to cede ‘defeat’. It takes you more than a few seconds to register that she’s dropped one hand from your thigh to pry open your twat, hooking fingers into the labia and clawing her way up as deep as the natural order will accommodate. Her soft nails stroke recklessly at your walls alongside her flailing tongue, committing crimes against your cunt, imprinting their shapes within your shuddering swamp.");
	output("\n\nThe ends justify the means by spinning you around the edge of ecstasy. Orgasms that range from tremulous, delightful shivers to rumbling earthquakes stick it to your mind in every possible way that you’re swirling on the lofty precipice of powerful release. Bianca’s sawing in two different places at once, channeling exuberant pleasure and roughness into your joy-inundated system. The ambidextrous fox then lowers her other hand, digging into implacably tight pants to tend a monstrous libido, gulping audibly all the refreshment she’s harvested from you.");
	output("\n\nOnce she does, everything changes. There’s this moment of unity, where your pace and hers match up and you moan with saliva-splattering happiness. You’re leaking and dripping everywhere. You’re a hot fucking mess, and she is too. Your [pc.pussies] greet" + (!pc.hasVaginas() ? "s":"") + " the reinvigorated doctor’s injections of wildly wagging maw-flesh. Bianca’s radiant eyes narrow and widen to the masturbating strokes of pronounced boobflesh and gushing milf-cunt, fucking herself while you fuck yourself with her. A rich burst of dual orgasm strikes the two of you, again and again...");
	// Cock
	if (pc.hasCock()) output("\n\nLeaving your [pc.cocks] alone is no longer an option for Bianca. The hand used to maul pussy finds its way upward. The twitches in your pre-cum lathered " + (pc.hasCocks() ? "dongs" : "dong") + " grow into powerful, excited throbs, bouncing so hard that her hand is nearly thrown off. Her manipulations prove to be exactly what they need, starting up a flow of [pc.cumColor] pre that will lead to a hair-washing cumshot!");
	output("\n\nBianca’s sensational tongue-fucking makes you squawk around her. The rattles of her own endless, unabating orgasms feed into your torso. Precision lunges batter a steady, powerful rhythm into your [pc.vaginaColor " + vagIdx + "] while meltingly sweet lips slide along <i>your</i> lips, never straying too far as to unpack your box. The spectacular thrusting of her ardently talented tongue never loses perfect cadence, pushing deep, so deeply that your eyes are now rolling back to its command. Grunting like a beast you mash her face into your groin, so very near to collapsing atop her. You take and you give, mutually reveling in miles-high euphoria. ");
	output("\n\nAnother scream, another orgasmic tremor; the doctor’s final orgasm knocks you right into yours. A gurgle slides up her throat around all the streams of quenching girlcum. You can hear the squelches in slow-motion swabbings; the full sweeps sharpen all your senses before detonation. Fortunately, you don’t need to act, your body is locking down to satisfy the primal urges. Your senses are redimensioned, reorganized; you hump Bianca’s face for all it’s worth, discharging a fox-coating climax that has all the mildness of a tropical storm.");
	// pc Squirter (wetness >=4)
	if (pc.isSquirter())
	{
		output("\n\nEjaculation is sudden and it’s impossible to keep your balance. Before the first shot of [pc.girlCum] is done splattering Bianca’s throat, you fall forward and crash to the ground on top of her. She scrambles to grasp your [pc.thighs], holding them tight for each successive squirt of muscle-locking relief. Percussive throbs and ghostly pulses wrack your fervid interior until you’re a whimpering pile of messy pussy. [pc.GirlCumColor] missiles of juice have nowhere to go but her mouth, and in this position she is given no choice but to make her thoroughly fucked throat take every last emitted drop. When the inevitable happens, it drools down all over her face, all while you pant and grind on top of her to ease out this deliciously prolonged release.");
		if (pc.hasCock()) output("\n\n[pc.Cum] launches upward from your fox-mounted [pc.cocksLight], raining down onto the shaft and, of course, her pretty, cum-stained face. She’s absolutely drenched in a mixed [pc.girlCumColor] and [pc.cumColor] lather, your [pc.cumNoun] acting as conditioner for the [pc.girlCumNoun] shampoo webbing up her hair and ears.");
		output("\n\nRubbing against Bianca’s face is an experience you’re keen on repeating, especially if it feels this good once more. Sensational overload like what you’re feeling now could only be reproduced on dangerous VR dives. Maybe this is comparable to one. Your hard-shut eyes and throbbing ears leave you ride out the rest of this mind-splitting bliss on sinfully sweet touch. It’s an intense feeling enhanced by the purest satisfaction of emptying your loads on a willing woman’s face.");
	}
	// pc Not Squirter (wetness <3)
	else
	{
		output("\n\nBianca’s face feels the descent of your [pc.girlCum] shower. Starbursts of violet-hued light go off behind your eyes, muscular contractions forcing out ejaculations of aromatic juices. Bianca is there, struggling to catch it all. Her entire face turns into a slip ‘n slide that your crotch can’t help but squeak and tweak against. Thick, [pc.girlCumVisc] droplets leak from her chin and submerge her teeth and palate in sprinkles of girly euphoria. The real effect isn’t what’s trickling from your melted sex, but the inner squeezes all over, the contractions, the ghostly throbs and pulses of rosy-cheek, grinning climax.");
		if (pc.hasCock()) output("\n\nYour [pc.cocksLight] unload, but not nearly as much as your [pc.pussiesLight]; [pc.cum] spurts up and rains down, reducing quickly to a dribble that lathers in her hair and cascades down like shampoo. If your pussygasm was any stronger, you wouldn’t have been able to keep your balance.");
		output("\n\nHappiness overwhelms you, and the thrill of taking the lead with a woman like Bianca is one that fades quietly into the background. Light quivers and far-reaching jolts twist you free of the doctor’s tail-assisted clutches.");
	}

	// PC cummms! Reduce lust to 0.
	pc.orgasm();

	addButton(0, "Next", biancaHasFinishedHerMeal);
}

public function biancaHasFinishedHerMeal():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', she does not undress
	showBianca("WORK");
	author("William");
	// processTime 7-19\rand minutes.
	processTime(7+rand(13));

	// pc Squirter
	if (pc.isSquirter())
	{
		output("Sitting on Bianca’s face like this is all you can do. Your body won’t allow you to move after so fierce an orgasm, but she doesn’t mind. Even though she’s a mess of girlspunk she busies herself with cleaning your nethers, softly rubbing your [pc.skinFurScalesNoun].");
		if (pc.hasCock())
		{
			output(" You manage to lean back a bit, letting her get a taste of your [pc.cocksLight], which you push down with the heel of your hand to put them in licking distance.");
			if (pc.balls > 0) output(" Once she’s polished your " + (pc.hasCocks() ? "rods" : "rod") + ", she gladly slurps and licks your [pc.ballsNoun] until your sack is glistening!");
		}
		output("\n\nNow that you can resist the urges of gravity again, you slide off your spunk-lacquered doctor and sit your tired ass down for a needed break.");
		flags["BIANCA_LICKSQUIRTED"] = 1;
	}
	// pc Not Squirter
	else
	{
		output("Bianca shuffles back and sinks lower to the ground, spreading her legs into a pretzel shape. She inhales deeply through her nose, wiping a bare arm over her eyes. She looks up to you with a pleased, content smile, and you know that part of it’s thanks to the enjoyment she derived from this. Her face is a mess of ambrosial juices, smeared in a [pc.girlCumGem] lacquer.");
		if (pc.hasCock())
		{
			output(" While she could never hope to completely wash your [pc.pussiesLight], she is eager to clean off your [pc.cocksLight] until they shine.");
			if (pc.balls > 0) output(" She then indulges in your ballsack, using her face as a makeshift brush.");
		}
		output("\n\nStumbling back and sitting your tired ass down takes precedence.");
	}
	output("\n\n<i>“[pc.name],”</i> she calls, looking at you with glimmering eyes, <i>“I don’t want you to feel like you’re being too rough. That was what I needed. Show me more of that sometime... if it pleases you.”</i>");
	if (pc.isNice()) output("\n\n<i>“I’ll keep that in mind,”</i> you reply.");
	else if (pc.isMisch()) output("\n\n<i>“No problem. Feels great having a great doctor-slash-pussylicker on call!”</i> you slyly grin.");
	else output("\n\n<i>“Noted,”</i> you smirk.");
	output("\n\nDr. Ketria stands and stretches out. Her drone flutters down to dispense wet napkins and a whole hand towel that she uses to look presentable again. A few perfume spritzes later, she looks... not perfect, a little sweaty maybe, but like the wandering physician you’ve always known. Smells like that fanciful woman, too. She gives you a cutesy nod, wiping her glasses’ lens.");
	// familiarity <=50
	if (biancaFamiliarity() < 50)
	{
		output("\n\n<i>“Take me with that side of yours again someday, [pc.name], and don’t feel bad about it. I care about you, and if using me in that way will support you even slightly,”</i> she pats her chest proudly, <i>“I will be... I will be there for you,”</i> she blushes, likely having nearly said something much more concerning.");
		output("\n\nTurning with a wave, she bids farewell, heading off for parts unknown. Hopefully you’ll see her again soon.");
		output("\n\nNothing left to do now but get going.");
	}
	// familiarity >=51
	else
	{
		output("\n\nBianca walks forward and sits next to you, planting a kiss on your cheek and resting her head on your shoulder. <i>“You complete me in a way I haven’t felt in such a long time. I will be honest, I would much prefer to play with a cock... but your assertiveness more than makes up for it.”</i> she looks up to you with a deep blush. <i>“I-If... um, if you need to cum all over me again, just let me know!”</i>");
		output("\n\nShe shields her face out of embarrassment for her words, prompting you to howl in laughter.");
		output("\n\nThe next few minutes pass by in quiet togetherness. Eventually, you both go your separate ways, promising to meet again as you witter away in opposite directions. ‘Course, with her, she’d prefer to get together ASAP if that slap on the [pc.butts] was any indication...");
	}

	biancaSexed("LICK");

	addButton(0, "Next", biancaEncounterEnd);
}

public function milkyBoobsForBianca():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', will undress later
	showBianca("WORK");
	author("William");
	// processTime 4-8\rand minutes
	processTime(4+rand(5));

	var boobIdx:int = pc.biggestTitRow();

	// First Time
	if (flags["BIANCA_SEXED_MILK"] == undefined)
	{
		output((flags["BIANCA_CONFRONTED"] != 1 ? "Mrs." : "Ms.") + " Ketria’s teasing is exacerbating a pre-existing issue that you can’t quite place. Between you and her this is just the unspoken-of game that gets you both in the mood, and yet... something’s in the way. Aches and strains, like those that come from oversleep or a bad diet, permeate your upper torso. Little sob-like sounds are all she gets from stimulating you. A flash of purple and red obscures your vision for a moment -- a yelp finally escapes your lips.");
		output("\n\nBianca crawls up over you and presses a hand to your forehead as soon as you display an obvious symptom. <i>“[pc.name], are you sick?”</i> she asks. <i>“Talk to me!”</i>");
		output("\n\nIn her haste, she happens to knock your [pc.breasts " + boobIdx + "] with her elbow, and that’s when it all becomes clear. And, incidentally, very wet. Eyelashes fluttering, [pc.milk] squirts from your [pc.nipplesNoun " + boobIdx + "]");
		if (!pc.isChestExposed()) output(" into your [pc.chestCover]");
		output(". The heat of the liquid and of your overflowing reserve combine forces, spreading a toasty yet sopping blanket over your cream-gorged chest. It’s stunningly pleasurable, and leaves you sweating as the effects bloom beyond their [pc.milkColor] tendrils.");
		output("\n\nYour [pc.breasts " + boobIdx + "] are sore and wobbling. How long have you gone without milking the girls? Gradual bits of realization filter through the small holes in your mind. How long has your subconscious been bearing the oceanic burden? How many days has it held back the unforgiving tides of unpasteurized, organic nourishment? The orgasmic relief of squirting off some of the [pc.milkVisc] is so powerful that your pelvis is throbbing now. What you want- no, what you <i>need</i> to ask Bianca to do is now abundantly clear: these udders need to be milked. They’ve done their job containing the lactic sea admirably, but they can’t hold on any longer.");
		output("\n\nInterestingly, after all this time, your doctor still hasn’t caught on!");
		if (pc.isNice()) output("\n\n<i>“Hey, so... my boobs are really full! Can you milk me? Mmmmaybe I can nurse you?”</i> You smile plainly, raising your chest, already beginning to blush at the idea.");
		else if (pc.isMisch()) output("\n\n<i>“Looks like I’ve gone too long not taking care of myself,”</i> you chuckle, hefting your chest for her. <i>“I need to milk these real bad... wanna help me with that, instead?”</i>");
		else output("\n\n<i>“Looks like my body has other ideas,”</i> you run a hand over your milky chest. <i>“Too much milk...”</i>");
		output("\n\n<i>“Milk!”</i> Bianca laughs, disquiet fading. <i>“That was it? Hee hee, [pc.name]...”</i> She prods your chest, quickly discovering how sensitive it is. <i>“I have so many fun stories; did you know I was a wet nurse at one point? Look at you... carrying so much milk at your age!”</i> She squeezes one fondly. <i>“Of course I’ll help with that. For the first time, <b>I</b> get to be fed! Try not to enjoy yourself too much, hm?”</i>");
		output("\n\nNo promises!");
	}
	// Repeat Time
	else
	{
		output("Placing a [pc.hand] on Bianca’s, you shake your head, instead guiding it to squeeze around one boob. The grinning fox hums when your [pc.milkVisc] bounty bursts out " + (pc.isChestExposed() ? "into her palm, leaking through the gaps" : "against your [pc.chestCover], darkening your top") + ". It clicks in her mind then and there: you don’t need " + (pc.hasCock() ? "a handjob" : "your pussy touched") + ", you need to be milked. Agreeing with your assessment, your subconscious retracts itself, and all the fluid weight of a lactic ocean comes crashing down on your mind and body.");
		output("\n\n<i>“That’s what you want this time, [pc.name]? To feed me?”</i> trills Bianca, her wide eyes glancing up and down, up and down. <i>“I’m jealous! Having your milk drained whether by lips or by hands... it’s more relaxing than leaning back in a cozy chair...”</i> a flutter of pleasure twirls through you, <i>“more fulfilling than rich dessert...”</i>");
		output("\n\nShe leans down to rest her cheek on your mammarian shelf, basking in the warmth and glory of treat-filled titty");
		if (!pc.isChestExposed()) output(" in spite of them being covered up");
		output(". You’d be hard pressed to find anyone who <i>wouldn’t</i> have tremendous respect for your heavy, sloshing bosom, who wouldn’t want to capture one of your [pc.nipples " + boobIdx + "] and suckle out your cup-boosting burden... or press on them from either side and bulge them out until you’re leaking and squirting like a lactic pornstar fountaining for the enjoyment of lecherous millions.");
		output("\n\nJust thinking about [pc.milk] hosing out of your poor, sensitive [pc.nipplesNoun " + boobIdx + "] in thick streams is more arousing than anything else your addled brain can concoct right now, and it’s an open secret that your groin hears, throbbing for possibility of sexual delight. Your tits have filled to the bursting point - you’ve been leaking a little, that you’ve noticed. These distended, overflowing milk-tanks desperately need a hug. They want for nothing more than to be relieved of their bulging burdens.");
		output("\n\nThe smiling, tail-wagging fox looks up to you, quietly asking, <i>“Can I?”</i>");
		if (pc.isNice()) output("\n\nYou stroke her cheek in the lovely space just below her ear. <i>“All yours, Bianca.”</i>");
		else if (pc.isMisch()) output("\n\n<i>“Make sure you get it all,”</i> you scritch behind her vulpine ear.");
		else output("\n\n<i>“Oh yes,”</i> you stroke her ear. <i>“Don’t waste too much of it.”</i>");
	}
	// pc Chest Not Exposed
	if (!pc.isChestExposed()) output("\n\nThe presence of clothing unavoidably costs you precious seconds of tit worship. The doctor unwraps your [pc.breasts " + boobIdx + "] with lightning speed, coming close to damaging your kit! You don’t worry about that, though, not when your now-exposed sugary handfuls are this backed up, not when the slightest movement unearths angry, steaming fissures throughout your midsection.");
	output("\n\nAll the lustful medic manages to do is throw off her coat in preparation, eagerly diving into your [pc.breasts " + boobIdx + "]. Her hands roam over your body with little shame and even less restraint. [pc.MilkColor] pearls of saturation appear at the peaks of your");
	if (pc.hasPartFur("chest")) output(" furry");
	output(" casks, bubbling forth from the bovine wellspring. [pc.MilkVisc], leaking droplets roll down your [pc.chestNoun " + boobIdx + "] in tit-smearing curves before succumbing to the insistence of gravity. Bianca sets one of your sumptuous swells down slowly to avoid straining you, wiping her finger across your [pc.nipples]");
	if (pc.breastRows[boobIdx].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) output(", coaxing them out of isolation");
	output(".");
	var boobieSize:Number = pc.breastRows[boobIdx].breastRating();
	// pc Breast Rating <3 (A to C)
	if (boobieSize < 4)
	{
		output("\n\nYour thoughts scatter when she suddenly cups the entirety of your modest bosom in her palms, biting her lip and pressing them together so that only the [pc.nipplesNoun " + boobIdx + "] are exposed. Thin arcs of [pc.milkNoun] launch out amidst the next rush of endorphins. <i>“Never let anyone tell you having a small chest is inferior, [pc.name].”</i> She bats her eyes meaningfully. <i>“There are now so many cosmetic mods to expand or shrink them that how one bears their breast is no different than how one wears their hair.”</i> She chuckles, plucking at your tender buds with her thumbs until more than liquid weight is tingling in your chest. <i>“There’s benefits to both large and small,”</i> she husks, her vulpine nature taking over, alternating tugs on your amply proportioned boobs.");
		output("\n\n<i>“The real benefit here?”</i> She glances up in dramatic fashion, facade cracking into a smile before she even finishes her sentence, <i>“They’re cute!”</i>");
	}
	// pc Breast Rating <10 (D to big-EE)
	else if (boobieSize < 11)
	{
		output("\n\nYour eyes drift shut and your [pc.lipsChaste] part into a large, [pc.lipColor] ‘O’ of well-sugared pleasure. Bianca takes your heavy panting as a sign to get rougher, holding " + (pc.totalBreasts() == 2 ? "both" : "two") + " of your boobies in her hands and lightly swinging them in opposite directions before clapping them together and rapidly shifting to squeeze them. [pc.MilkVisc] jets of [pc.milkNoun] launch out, the vibrations feeding into your core setting off a permanent dribble. <i>“These are large and beautiful... and they fit you well, [pc.name]. Do you want to know what people think when they see these from a distance?”</i> You answer with a squeak, unable to form words with your cushy mammaries shaking and jiggling so. <i>“They see you as the young, " + (pc.isFemboy() ? "cute, virile boy" : pc.mf("handsome, virile man", "beautiful, fertile girl")) + " you are.”</i> She releases your shapely bosom and grapples with your [pc.nipplesNoun " + boobIdx + "], thumbing them until your chest tingles and sparks with pleasure.");
		output("\n\n<i>“Actually...”</i> Her firm grip tightens, squeezing until pleasure is ghosting over the rest of your quivering body. <i>“...That’s just what I think.”</i>");
	}
	// pc Breast Rating <18 (F to big GG)
	else if (boobieSize < 19)
	{
		output("\n\n<i>“Wow...”</i> Bianca swoons, <i>“" + (boobieSize == 11 ? "you’re just as big as me" : "you’re bigger than me") + ", [pc.name]...”</i> A dangerous grin plays across her face moments before she manhandles your oh-so squeezable breasts in skilled, warm hands. You can see fiery indulgence burning her eyes when she sinks her hands to where your underside meets torso, hefting your fervor-flushed bosom in her palms and drawing back in one long, expansive rub that encourages your body to freely dribble [pc.milk].");
		output("\n\nThis heedless fondling continues for what feels like an eternity; at the bottom, at the top, all around, she plays with your chest like it’s her own! They’re so sensitive that even the slight coolness of her fingernails withdrawing skyward is there, soon joining the rest of your chest in melting sweetness. <i>“Have you invited anyone to your breast yet?”</i> Bianca inquires sincerely, though with how your [pc.lipsChaste] have opened into a lovely [pc.lipColor] ‘O’, you can’t answer with more than a hoarse breaths and small squirts of [pc.milkColor] cream.");
		output("\n\n<i>“Having them so big is a burden, I won’t lie, but there’s plenty of benefit to it. Welcoming a lover into them, cushioning their head in your bosom...”</i> Bianca claps your hand-overflowing boobs together. The ripples that shake your chesty peaks are straight out of the raunchiest pornos. Any more and she might inspire a disaster movie. <i>“Having all this to play with... my, I’m so used to others chasing after mine that I forgot how much fun it is to be on their side!”</i>");
	}
	// pc Breast Rating >=19 (H and up)
	else
	{
		output("\n\n<i>“Mmmm... these are very large, [pc.name]...”</i> Bianca growls fondly, having to use both arms to lift and hug your superlative chest -- there’s just too much boob to control! The size of your great mountains dwarfs hers in comparison. <i>“And you give the best hugs! Have you let anyone else do that? There’s no reason to have these large...”</i> she squeezes one of your milk tanks, <i>“...sprawling,”</i> she cups the other, <i>“...boobs,”</i> she presses them together until they smush and huge, erupting [pc.milkVisc] streamers of [pc.milkNoun] jet out. You groan like a wounded animal at her scandalous touches, which even now sink into your bosomy blimps until they vanish in your smutty vale of [pc.skinColor] titflesh. When she starts digging her nails into your areolae and plucking at your [pc.nipplesNoun " + boobIdx + "], you immediately cry out, [pc.lipsChaste] locked in a perpetual, begging ‘O’.");
		output("\n\n<i>“Hehe... I won’t lie, and I mean no offense, but these seem a little out of place for someone your age. Still, if you’ve gotten around just fine up ‘til now, why change them? Especially when you can sit back and let others fawn over them... play with them... I bet where you go, everyone falls to their knees in anguish!”</i>");
	}

	// Maximize PC lust
	pc.maxOutLust();

	addButton(0, "Next", biancaMilksThePCTheWayIMilkTheseFunctionNames, boobIdx);
}

public function biancaMilksThePCTheWayIMilkTheseFunctionNames(boobIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' unless we get shirt lifted up
	showBianca("NUDE");
	author("William");
	// processTime 6-14\rand minutes.
	processTime(6+rand(9));

	output("Bianca straddles your [pc.leg], fitting one arm around your lower back and the other on a boob, " + (pc.breastRows[boobIdx].breastRating() < 11 ? "leaning closer to one [pc.nipple " + boobIdx + "]" : "hefting it and the [pc.nipple " + boobIdx + "] closer") + ". She inhales and slaps into the ultrasensitive bud. Your eyes nearly roll back when her tongue swirls around the pebbly base on an endless loop, her vocal vibrations unsealing the floodgates so that your [pc.milkFlavor] cream can paint her cheeks and throat. A pleasant coo slips out of your smiling face, producing the same sweet sound as her own honeyed voice.");
	output("\n\nTentative suckles give way to full, needy, audible gulps. The doctor’s tails are wrapped around her side, out of the way of errant lactic splurts. The exhalations from her nostrils comes out in a gentle rhythm, the satisfying warmth eliminating microseconds of prickling pressure relief. By the time you open your eyes, her cheeks are puffed out, yet not a drop of [pc.milkNoun] dribbles out. Wincing, she swallows the batch all at once, giggling when you reach a hand up to pet her.");
	output("\n\nHer plush lips unseal from your [pc.nippleNoun " + boobIdx + "], taking with them another mouthful of the ambrosial treat. By now you’re light-headed;");
	if (pc.isHerm()) output(" cock and pussy juice puddle at your crotch");
	else if (pc.hasVagina()) output(" pussy juice puddles in your nether regions, leaking down your [pc.thighs]");
	else output(" [pc.cumColor] prenut dribbles down your [pc.cocksLight] and clings to your inner thighs");
	output(". For a few seconds she samples the flavor, swishing it around between her cheeks before swallowing it.");
	// Strawberry/Chocolate Milk
	if (InCollection(pc.milkType, GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK)) output("\n\n<i>“Ha-!”</i> Bianca titters, having a real hard time not laughing with [pc.milkColor]-flecked lips. Her tone is a mix of surprise and youthful fascination. <i>“That milk is flavored... " + (pc.milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK ? "chocolate" : "strawberries") + "! If we ever had a picnic-”</i> She stops herself, shaking joyously. <i>“That would be so much fun! Sure, it might be a lewd gathering, but that smooth taste, gracious...”</i> Her tongue wipes across her titty-tasters in a serpentine motion. <i>“I may need to fill my flask with it!”</i>");
	// Vanae Milk
	else if (InCollection(pc.milkType, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK)) output("\n\n<i>“Ufff...”</i> Bianca’s face darkens to a hotter color, tinting to a vivid scarlet shade. When her milk-suckers open... no, <i>blossom,</i> she shudders from the sheer sensitivity of gasping. <i>“That flavor! Your milk contains an aphrodisiac!”</i> The fox stares accusingly, but the playful glint in her eye lets you know she’s not upset. In fact, she’s already adjusted! <i>“But back to what matters, you naughty [pc.boyGirl]...”</i> she smirks, <i>“that may be the best flavor of milk I’ve ever tasted. I hope you realize I want all of that now... much more than I did before.”</i>");
	// Honey
	else if (pc.milkType == GLOBAL.FLUID_TYPE_HONEY) output("\n\n<i>“Honey is sweet, but yours is so much more!”</i> Bianca cups her cheeks, twisting to the left and right from a sugary overload. <i>“It’s so strong that it’s almost too hard to swallow; it has a way of sticking to my tongue and throat.”</i> She looks straight into your eye, smacking her lush lips together. <i>“That speaks volumes of how healthy it is. I’m quite partial to regular milk, but this is a rich, delicious gift I’m not going to forget... and that I’m going to enjoy for as long as is possible.”</i>");
	// Milksap
	else if (pc.milkType == GLOBAL.FLUID_TYPE_MILKSAP) output("\n\n<i>“I can’t tell what this is,”</i> Bianca murmurs, looking at you expectantly. <i>“But it has a taste like... how shall I put it... like something botanical in nature, and yet...”</i> She quickly steals another taste, smacking her [pc.milkColor]-smattered lips together. The [pc.milkGem] curtain of gooey bounty coats her titty-suckers like sweet, organic makeup. <i>“The aftertaste is phenomenal! It’s thin and creamy, going down easy. Really... this may be the most interesting thing I’ve ever tasted. And from your breasts no less...”</i>");
	// Blueberry Yogurt
	else if (pc.milkType == GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT) output("\n\nBianca’s eyes widen in shock. <i>“This isn’t milk!”</i> she exclaims, watching a thick, blue wad fall from your breast. She catches and swallows it, getting a second taste. <i>“Tastes like blueberries, thick like... yogurt? Goodness me, [pc.name]... and your breasts are full of this yummy meal?”</i> She grins almost cruelly at you. <i>“Get ready, because I don’t just want it all. I <b>need</b> it all.”</i>");
	// Nectar
	else if (pc.milkType == GLOBAL.FLUID_TYPE_NECTAR) output("\n\nGasping, Bianca pats her chest and blinks several times, your revitalizing nectar having its intended effect. <i>“That’s... that’s... how did you get this? This is no normal milk or cream... this is a rejuvenating nectar!”</i> She dives back in to suckle so strong that it hurts, but it’s the good kind of hurt. <i>“Forgive me... but that flavor is beyond anything I’ve ever had. [pc.name], I don’t think I can hold back now!”</i>");
	// pc Milk or Unspecified Flavor
	else output("\n\n<i>“Mmm... delicious. This is the flavor of a suitable wet nurse. There’s the right amount of warmth and richness of taste in your milk, [pc.name],”</i> she purrs, twirling a finger on your areolae. Her lips are painted [pc.milkColor] with a future mother’s reward. <i>“If you ever have children, they’ll be well fed, and by the amount you’re carrying... hehe... you’ll be able to care for a large family. You may even get to share plenty with your lover!”</i>");
	output("\n\nShe rubs your [pc.breasts " + boobIdx + "] until blissful contentment is all you know. There’s mutual delight in the way you stroke the back of her head, scratching that wonderful bit of skin where her ears meet scalp. This little reward goes a long way, encouraging the thankful fox to work harder... and harder, particularly when you ruffle her hair and push her into your tit. Sometimes she opens her mouth for you to see the [pc.milkNoun] squirting inside, closing and swallowing seconds before it spills.");
	output("\n\nThe irony of your opposing roles is not lost to you: you’re breastfeeding a woman twice your age, someone who, if she had any milk, would gladly share her matronly bounty with you. Feelings of maternity bubble up around your brain, stress-relieving ecstasy firing from your synapses in tandem. This delicate moment is exactly what you needed regardless of who it was with. You don’t even notice the slobber drooling down your lips, all you’re concerned with is the sensual, dizzying whirl of her tongue around your molten tap.");
	// pc Multi-nipples~
	if (pc.nipplesPerBreast > 1)
	{
		output("\n\nDue to your impulsive output, [pc.milkNoun] starts dribbling from the other nipples, leaking onto Bianca’s nose and even into her hair! With a pop and an ‘ahh’, she releases the first nipple on your breast and decides to retaliate, dragging her [pc.milkNoun]-lacquered tongue back and forth over your soft, forgiving boob[pc.skinFurScalesNoun]. You twitch and shudder at once, the rough back-and-forth lapping making it next to impossible to think. The shaking causes an obscene");
		if (pc.nipplesPerBreast == 2) output(" double");
		else if (pc.nipplesPerBreast == 3) output(" triple");
		else output(" quadruple");
		output(" spurt, your boobs fighting back against the lustful fox. Her next response is to grab your mound and strain her jaw wide to catch the " + num2Text(pc.nipplesPerBreast) + " spouts of [pc.milkNoun], wiggling her ass in the right ways.");
	}
	output("\n\nRaising her hand to " + (pc.totalBreasts() == 2 ? "your other" : "another") + " tit, Bianca grasps the weighty jug, whispering affections and praises as your grateful body seems to gush out enthusiastic offerings from a seemingly infinite reservoir. All it takes is a flex of the wrist and clench of the hand to vent it of intense, [pc.milkVisc] pressure, redoubling the tepid pleasure in the rest of your loopy body. Your [pc.nipples] are burning with raw, unfiltered sensation, and yet, the deluge up to this point has only been the beginning, a prelude to the messy snack-stop you’re on your way to becoming.");
	output("\n\nSimply breastfeeding her isn’t enough, you need Bianca to get dirtier and harder! You try to make that simple request, but all that comes is an indecipherable slur. Fortunately, she can see the intent in your glazed-over eyes. The doctor shifts back and rests her head in the center of your cleavage, looking up your yet-undrenched channel, letting go of your [pc.breasts " + boobIdx + "] to grab at something. <i>“I have to get my fun, too!”</i>");
	output("\n\nWhatever she’s up to... you trust her judgment. Actually, you’re doing more than that when you notice her compression shirt coming up, freeing her fabric-bound tits from confinement. Huge, capsizing melons flop out, held back by a world-class lacy bra, black and pink in color! With the flick of a finger to the front hasp, her full, heavenly swells regain their true form; gravity-distorting tides of womanly flesh spills out, docking to your own. Her fat, teacup-nipples are already hard, and when they kiss yours, a virginal thrill buzzes across the back of your mind.");
	// pc Crotch Not Exposed
	if (!pc.isCrotchExposed())
	{
		output("\n\nJust when you thought she was about to restart, she pries frees your crotch");
		if (pc.isHerm()) output(", allowing your [pc.cocks] to burst forth into proud tumescence, followed by the ripe scent of your [pc.pussiesLight].");
		else if (pc.hasVagina()) output(" opening the way to your [pc.pussies] and allowing your fragrant girlmusk to permeate your conjoined ozones.");
		else output(" giving your [pc.cocks] the chance to rocket out, fully erect and happily beading prejizz.");
	}
	output("\n\nLest you begin to calm down, Bianca glides forward, burrowing greedily into your [pc.fullChest]. Her chest grinds against your chest, her crotch to your crotch, her abdomen to your [pc.belly] - she bucks and twists about disjointedly. The sudden intensity and the firm, manhandling squeezes on " + (pc.breastsPerRow(boobIdx) == 2 ? "both":"every") + " saturated boob" + (pc.breastsPerRow(boobIdx) > 2 ? "":"s") + " leads you to spurting the largest columns of [pc.milkNoun] yet. With your abused titties snugly nestled into her body, the [pc.milkVisc] juice can only obey the rules of nature by splattering across the broadness of a vulpine milf.");
	output("\n\nIn the seams of your connected cushions, rivulets of hot and bothering [pc.milkNoun] form, bathing your boobies in their own bounty. Bianca kneads and fondles you into nerveless euphoria. Jet after [pc.milkColor] jet erupts in brilliant, volcanic proportions, heightening your lusts to otherworldly levels. They’re perfectly suited to feeding hungry men and women, but their real purpose is without a doubt to be prized goods in the hands of those who will milk them. Being an earmarked dairy [pc.boyGirl] doesn’t sound half bad when all you have to do is throw your head back and moan, drifting from one lactic orgasm to the next.");
	output("\n\n<i>“Ah, yes!”</i> she half-moans. <i>“Just let it all out for me, [pc.name]. Who cares if we get wet and dirty, it’s worth it, right?”</i> Damn, she’s getting into it! Sandwiched between boobs, achingly erect nipples flick and bob against each other, turning into full-fledged sex organs of their own. <i>“Just think about me,”</i> she urges, <i>“just think of pumping everything out!”</i>");
	output("\n\nBianca knows how to do that with her hands. She knows what bloated cells to squeeze down on to express the largest volumes. She knows what sounds to make to make you squeal with unbridled desire. She knows how to answer your requests without you needing to say them -- a yank there, a pinch here, she deliberately seeks out the best methods to paint the two of you in a [pc.milkGem] lacquer, hands drifting methodically and patiently from [pc.nipple " + boobIdx + "] to [pc.nippleNoun " + boobIdx + "].");
	output("\n\nFinally, your [pc.hands] join hers, focusing on the back halfs while she strums them from the front. You’re a malfunctioning milk machine that a confused customer is struggling to control, making all the wrong moves and getting hosed down in the process. Well, there’s nothing confused about her elegant motions. Everything going on is designed to carry you away on the overflowing volume of [pc.milkNoun] streaming out. You’ve gotten so slippery that gripping your sopping-wet swells is a hopeless endeavor... but hey, when tits flop around like crazy? That’s consolation.");
	output("\n\nSpit hangs from your jaw in long, wobbling strings. Lust seethes just below every pore. Everything has gotten so wet and messy that the impacts of your body to hers produce lurid, squelching echoes, and it’s a sound intoxicating enough for masturbatory aids. Bianca’s been moaning whorishly, having the time of her life letting loose, seeing how much pleasure she can wring from your [pc.breasts " + boobIdx + "]. Her tails blur with the speed of their happy swishing while you open fire on all batteries.");
	// Herm
	if (pc.isHerm()) output("\n\nTrying to keep up with her coaxing grasps, " + (pc.isCrotchExposed() ? "you finally realize why she mounted you" : "you finally realize why she unveiled your crotch") + ": your [pc.cockHeads] are grinding into her navel, smearing her gleaming belly with pre, throbbing on the edge of male orgasm. The aggression sparks a reaction in your [pc.pussiesLight], though more than one orgasm has taken place down there. Copious lactic spillage has led to waves of the stuff pooling in the creases of your body, rising out on the next inertial tide to mix in with the rest of your musky lubricants.");
	// Puss only
	else if (pc.hasVagina()) output("\n\nYou smell something stronger than [pc.milkNoun] -- your own [pc.girlCum]. Estrus heat rises from your conjoined crotches, only now making you realize why Bianca had " + (pc.isCrotchExposed() ? "decided to mount you" : "bothered to undress you") + ". Although her own pants are still on, her debasing movements are still enough to send your body into convulsions, driving arousal straight into your [pc.pussiesLight] with the savage, fervid bucking of her child-bearing hips. The air becomes thick with the scents of horny women, the aroma rising from combined puddles of [pc.girlCumNoun] and breast-[pc.milkNoun].");
	// Cock only
	else output("\n\nHave your [pc.cocks] been sliding against her abdomen this whole time? It only just occurs to you that your [pc.cockHeads] have been grinding into the milfy fox’s midsection, smearing [pc.cumColor] precum all over her. The registry of your throbbing pleasure momentarily trumps the pleasure in your sizzlingly hot chest, nearly making you cum right then and there.");
	output("\n\n<i>“Aaah... Ach!”</i>");
	output("\n\nOrgasm costs Bianca her balance, and she falls headfirst into your canyon of cleavage, straight into a [pc.milkVisc] pocket. The sloughed liquid, now overpowered, bursts out in all vacant directions, staining her glasses and launching into your nose. Full-throated groans vibrate against your hammering heart, and barbaric graspings to your [pc.breastsNoun " + boobIdx + "] give you a thorough seeing to. The foxy mom’s big hard cum, and the extremely vigorous shift of her body, triggers a tit-based climax that makes your packed breasts jiggle energetically in the midst of resonant sexual cascade.");
	// pc Hermgasm
	if (pc.isHerm()) output("\n\nIn the back of your gut you can feel the inevitable rise of orgasm. One by one, through your dual-sexed orifices and through every [pc.nippleNoun " + boobIdx + "], climax bulges out of you in simmering gouts of streaming spoo and [pc.milk]. Pooling deposits of every sexual effluvia mix on your sweatily grinding bodies until you’re practically sinking into the cocktail of blobbing DNA. The full pressure kicks in a few heartbeats later, blinding you until you’re a sputtering and half-conscious wreck of pumping liquid. By the end of it, you’re totally drained, and damn near unrecognizable.");
	// pc Pussygasm
	else if (pc.hasVagina()) output("\n\nYour [pc.hips] launch into a manic, desirous frenzy, humping against Bianca’s so hard that [pc.girlCum] " + (pc.isSquirter() ? "squirts" : "drizzles") + " in fervent amounts. Her pants are thoroughly soaked from both ends by sapphic indulgence. [pc.Milk] fires off in simmering gouts, endlessly spurting. To your simultaneous fear and awe, the full pressure kicks in a few moments after it starts. You helplessly flutter, little more than a liquid-spouting [pc.raceShort] that soon becomes unrecognizable in a cocoon of [pc.milkGem] lactation.");
	// pc Cockgasm
	else output("\n\nRibbons of [pc.cum] fill the gap between your sweaty bodies, launching up through a morass of endlessly spurting [pc.milk]. Bianca pushes even harder on your gut, trapping your [pc.cockHeads] against your matched abdomens. With nowhere to go, your [pc.cumVisc] jizz develops into a spherical blob that feels like the center of a frying pan, spilling out across your bodies before mixing into the fresh puddles of [pc.milkNoun]. Somehow, your tits were not, in fact, firing at full strength. The real pressure kicks in now, and your rigid, stiff nipples turn into [pc.milkVisc] cannons that soon have you glazed in a [pc.milkGem] sheen.");

	// PC cums, reduce lust to zero.
	pc.orgasm();
	// Breastmilk gets drained!
	pc.milked(100);
	// Apply 'Milk Bathed' affect to PC
	pc.applyMilkBathed();
	// Apply 'Cum Soaked' and 'Pussy Drenched' for respective 'gasms.
	if (pc.hasCock()) pc.applyCumSoaked();
	if (pc.hasVagina()) pc.applyPussyDrenched();

	addButton(0, "Next", howAppropriateBiancaYouLeakLikeACow);
}

public function howAppropriateBiancaYouLeakLikeACow():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' unless we get shirt lifted up
	showBianca("NUDE");
	author("William");
	// processTime 6-14\rand minutes.
	processTime(6+rand(9));

	output("You awaken abruptly, not sure how long you were out, instantly becoming aware of something on your chest. It’s ticklish, warm, and yet kind of cold... that’s where you know you’re empty, and how badly you need whatever’s tending you back there.");
	output("\n\n<i>“Eek!”</i> Bianca recoils when you dart up, shaking your head. That power nap really helped!");
	output("\n\nLooking down, you see yourself... cleaned up! There’s a single wad of [pc.milkNoun] on your considerably diminished boob, though, which Bianca quickly laps up, wiping her lips with a smile. <i>“Good day, [pc.name],”</i> she smiles beatifically. <i>“You were only asleep for three minutes, so I had to work fast,”</i> she looks down, patting her well-rounded gut. <i>“The meal was wonderful. I think you deserve a tip...”</i>");
	output("\n\nGrabbing her by the head, you pull her in for a chaste kiss, peppering her from lip to ear until she reddens with renewed lust.");
	// familiarity <=50
	if (biancaFamiliarity() < 50)
	{
		output("\n\n<i>“I’m afraid that I still have to go. I wish I could stay a little longer, but my duty calls. I had fun! Hopefully you’ll think of me when you ‘happen’ to forget your milking needs?”</i> She raises her eyebrows suggestively.");
		output("\n\nYour answer is a resounding ‘absolutely’. It doesn’t take you long to get ready to go either, and by the time you are, she’s already scrubbed down with some absorbent towels and fixed her clothing, cleaning the lenses of her glasses before waving goodbye.");
		output("\n\nBefore you fully part, she promises to see you again.");
	}
	// familiarity >=51
	else
	{
		output("\n\n<i>“I think... sooner or later...”</i> Bianca gropes one of her own breasts, <i>“...I should return the favor. Hopefully I’ll get to share more of myself with you in time, but not while I’m at work.”</i> She crawls closer, deploying an absorbent towel to make herself presentable.");
		output("\n\nYou suggest that you could pick up some lactaid for her, but she doesn’t answer you at all, aside from a playful, teasing smirk.");
		output("\n\nMeanwhile, you spend a few more minutes in each other’s company, parting after a deep, almost too-arousing kiss. Bianca sprays down with perfume and promises to meet you later, making it clear she’d love to repay the favor.");
		output("\n\nYou can think of a few things in the meantime. For now, it’s back to the trail...");
	}

	// Trips Flag \\SEEN BIANCA'S NAKED CHEST
	flags["BIANCA_SEEN_TITS"] = 1;
	// Remove the cum/milk effects
	pc.shower();

	addButton(0, "Next", biancaEncounterEnd);
}

public function biancaNomNomNom():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work', will undress later
	showBianca("WORK");
	author("William");
	// processTime 5-8\rand minutes
	processTime(5+rand(4));

	if (pc.inRut() || pc.hasPheromones())
	{
		if (flags["BIANCA_SEXED_LICK_HER"] == undefined)
		{
			output("It’s rare for Bianca to be inconsistent. Something’s distracting her, and it’s done a good enough job that she can’t sit still. She can’t focus on her careful, lily-soft coaxings. The precise talent you’ve known has plainly vanished without comment, and in its place is impulsive gratification more appropriate for the cheapest body in a brothel than a composed and fiery lover. A gasp of genuine glee slips off her tongue; she looks at you, cheeks a scarlet shade, a scent of scintillating estrus rising off her.");
		}
		// Repeat Time (pc in Rut or Has Pheromones)
		else
		{
			output("Bianca’s motions aren’t consistent. Technique is gradually assimilated into wantonness. Pure animalism overtakes her. She’s not just pawing at your groin, but your whole body. Groaning in need, the vulpine medic gives up accuracy and teasing for blatant whorishness, breathing rapidly and heavily. Your doctor gives up on her oh-so kind treatment for bestial indulgence, sniffing close to your erogenous zones - she gives up control, and instead of goading you into anything, she pleases you simply by acting like a slut broadcasting an aroma of ovulation.");
		}
		// pc Rut (overrides pheromones)
		if (pc.inRut())
		{
			output("\n\n<i>“[pc.name]!”</i> she cries through her spit-flooded mouth, gripping your [pc.cocks]. The ache of restrained breeding desire is a dropkick to the face compared to the slow shove of a fertile woman’s broadcast pheromones. In a head-swimming haze of critical reproductive lust you grab the fox-woman’s hands and drag her to her feet, slamming your groin into hers and crushing her back in a bear hug. Precum spurts out");
			if (pc.isCrotchExposed()) output(" into your boner-binding clothing in tune with every hump.");
			else output(" onto her shirt in tune with every hump that slaps your [pc.ballsNoun] into her seething pussy.");
			output("\n\nIt’s a wanton and shameless thing that, for a moment, she surrenders to. The armor of civility and propriety cracks. Heavy shards fall away, peeling like the layers of a plantain, revealing the cooing, craving woman underneath, bound to the rules of nature.");
			if (biancaFamiliarity() < 50) output("\n\n<i>“W-Wait... no this isn’t-”</i> she stammers, cutting through your haze.");
			else output("\n\n<i>“Anything, [pc.name]! For you! Anything!”</i> she groans, cutting through your haze.");
			output("\n\nYou stop yourself, gripping her shoulders tight, gazing into her ghostly-violet eyes past two lust-fogged lenses. Her voice brought a moment of clarity... an idea in the midst of gushing breeding urges. To punish this slutty fox for her mischief, for all her teasing... yes, there’s only one way to make it happen, and " + (biancaFamiliarity() < 50 ? "and you don’t need your dick to do it!" : "and it’s not by thrusting your dick inside her. You’ll bust a much bigger nut when she comes begging for the real deal later."));
		}
		// pc Pheromones
		else
		{
			output("\n\n<i>“I’m going to cum... I-I-I’m this... [pc.name], your scent just makes me...”</i> She stops teasing you. <i>“I can’t tell if it’s my animal side... or if I’m just that vulnerable but I can’t do this!”</i> Her voice comes cracked and unsteady. <i>“I need and want you! The strain is intolerable, I can’t concentrate! Please,”</i> she finishes, opening her arms invitingly, <i>“take me!”</i>");
			output("\n\nSitting up with a knowing smile, you take her by the wrists and stand her up, already knowing what to do. You would be remiss if you didn’t return the teasing, planting one [pc.hand] on a fertility-fattened boob and sticking the other between her legs. Bianca squeals and buckles at the knee, crumpling onto you for support. It was hot and slippery when you touched it, but when she orgasmed... it felt like your [pc.hand] was in the wrong place when a sink’s hot water knob was turned all the way.");
			output("\n\nBianca’s so wet, so sensitive. Every touch brings delightful little clenches that spurts and drips of femme-cum leak from her. The more undiluted musk she breathes in right from a certain [pc.raceShort]’s pores, the ‘worse’ it gets. The statuesque fox-woman is reduced to a faintly shuddering whore. Her nostrils flare to their absolute limits, drawing the maximum amount of your ultrasexual aroma in. It permeates every blood cell and clouds her judgment, and every idle motion that occurs to her sends ripples through her fertile body, her fat ass, and her big, melon-shaped tits. No longer civilized, no longer even polite, she grinds and humps against you, droning and whimpering in pheromone-induced bliss. ");
			output("\n\nYou could push her down right now and have your way with her, but there’s a better way, a way that " + (biancaFamiliarity() < 50 ? "doesn’t involve you breaking your promise and taking advantage of her." : "will leave her much more vulnerable to a proper fucking later."));
			output("\n\nBeing rough is the only way you’re going to accomplish it, too. She likes it rough anyway.");
		}
		// Merge
		// imagePack: embed octomush Bianca Bent Over pic here
		output("\n\n");
		showImage("bianca_octomush_bentOver");
		output("You grip her shoulders so hard that your [pc.fingers] lock into her skin, spinning her around and pinioning her against the nearest");
		switch (getPlanetName().toLowerCase())
		{
			case "mhen'ga" : output(" tree"); break;
			case "tarkus": output(" rock"); break;
			case "myrellion": output(" wall"); break;
			default: output(" wall"); break;
		}
		output(". Orgasm strikes the overwhelmingly aroused fox like lightning. She shivers to your bestial show and claws at the surface in front of her, your insistent grinding doing nothing to hold her down. She’s too strong and too horny to be held back.");
		if (pc.inRut()) output(" Just like you.");
		output("\n\nGrappling with her waist, you pull on her like a drawer until she’s bent into an appealing L-shape. The wobbles of her bubble-butt through her pants are practically rebellious, declaring that it will never be hidden away no matter how firmly clutched the oppressive fabric is. Bianca’s ass is much more reminiscent of a seat cushion like this, both girthy cheeks pressing out without a single wrinkle; both globes are perfectly spherical, unleashing huge amounts of dominant decisions into your senses. ");
		output("\n\nNeedless to say, having this position over her conjures up every hormonal thrill imaginable.");
		output("\n\n<i>“C-Come on... pull it all down.”</i> Like a " + (biancaLover() ? "triple" : "double") + "-ended scarf, Bianca’s tails weave around you in a pattern reminiscent of a hug, exposing the entirety of her blanched vista with an over-the-shoulder wink. The clink of an unbuckling belt reaches your twitchy ear. <i>“I’m just a horny fox who deserves to be put in her place. You’ll love what you see, I promise...”</i> ");
		output("\n\n<i>Seeing is believing,</i> they say, but what you’re <i>feeling</i> between her legs is enough. Liquid splotches are invisible against clothes so dark... but they’re soaked. The cum-sponged threads have absorbed all they’re willing to take. You lift the slut-doctor’s coat, stroking the bases of her tails approvingly before fish-hooking the hem of her pants and yanking so hard you nearly go tumbling with her.");
		output("\n\nThe first thing that happens is your face is pounded by a sledgehammer of fertile milfscent. It’s a dense cloud of eye-blearing need half-turned to vapor upon exposure to your connected ozone. Her black and pink panties, struggling to contain an ocean of burgeoning buttocks, look ready to tear clean off. A flood of femme-cum has reduced the lacy lingerie to a mess of leaking juice seeping through the microscopic gaps between the threads. Bianca seizes on the moment of your marvelling to hum a soft hymn that matches the up and down sway of her thumpable rump. The smoothest pillow in the galaxy is undulating against your pelvis and stomach with the most debauched undulations imaginable.");
		output("\n\nA glow of genuine gratification on her face pushes you to finish the job. Wiggling one finger into the hip-string of her underwear, you pull it down over the sweaty hills of her perspiring vale, folding the material into a fragrant corkscrew and wringing more liquid out of it. The cleft of her vanilla mountains comes into full view, followed by the detachment of silky-soft panties from ripe milf-twat.");
		output("\n\nThick cords of femslime follow her undergarment down to the border of her inner thigh, gradually coalescing and writhing for her reactive spasms. Gooey streams pour into a stitch-stressing depression below, puddling with the rest of Bianca’s abject shamelessness. The realization, or rather, the reminder that <b>your musk had rendered her into this state</b> comes close to giving you a heart attack.");
		output("\n\nOverwhelming eroticism feeds back into your mind, drawing lecherous fantasies directly upon your canvas. First her ass, then her pussy; her smell... her womanhood is completely exposed to you. It’s vulnerable... and as if to encourage you, her tails are stroking your [pc.hairNoun], fluttering down your [pc.arms], spooling around your abdomen and ‘scratching’ at your [pc.skinFurScales]. Drool waterfalls from your lips down your chin. Being this close to her plump cunt is suffocating. The sheer amount of heat radiating from its luscious exterior could be carved.");
		output("\n\nHer aft orbs, too, are universe-class. Beads of sweat trickle down her big round spheres. The twin moons ripple majestically, begging to be stroked, maybe licked, definitely spanked. Each hemisphere is nearly as large as your head, and should the gap be closed, they will definitely outsize it, be able to cover it completely with plenty of forgiving skin to bulge down your cheeks. Pornstars everywhere are so fucking jealous of this caretaker’s wide, cushiony ass that they cry themselves to sleep over how imperfect theirs are compared to it.");
		output("\n\nThey don’t even know it, either. They’d quit their jobs out of shame on the spot. The best part? <i>It’s all for you.</i>");
		output("\n\nYou sniff again, much too fascinated by the aroma of a woman you feel is in your control, and raise your hands for the first sampling of this butt bounty...");
		output("\n\n...Only to be knocked backwards! She leaned forwards and bucked in your direction, knocking you to the ground! In that same motion, a tail moves to block her vagina, adding insult to injury.");
		output("\n\n<i>“Hee hee,”</i> Bianca giggles, <i>“you were taking too long, [pc.name]!”</i> You stand up, " + (pc.hasCock() ? "well-aware of your violently twitching [pc.cocksLight]" : "a feeling of denial suffusing your [pc.pussiesLight]") + ". <i>“Forgive me,”</i> she grins with a courtesan’s cultivated enthusiasm, <i>“but I want you to come at me with all you’ve got.”</i>");
		output("\n\nThe more things change, the more they stay the same...");
		output("\n\nWiggling her butt, she chews her lower lip. <i>“Just...”</i> she husks, <i>“you’re good at what you do, and I love what you’re capable of! Now,”</i> she bends forward a little more, virtually imprinting those rolling hinterlands on the front of your brain, <i>“look at me... " + (biancaFamiliarity() < 50 ? "look how unforgivable I am, getting this aroused for a [pc.boyGirl] like you!" : "look at how wet I am because of you... only you can deal with this. It’s all yours, whatever you want to do!") + "”</i>");
		output("\n\nThe cunt-blocking tail sweeps away, one side drenched in its owner’s juices. You rise up in the blink of an eye, eyes firmly locked on her dramatically soaked red slit, steaming from contact with cooler air now. It shines with molten bliss in the light. You take one step only to stop, watching Bianca slide a finger through the plush crease. <i>“Enjoy me, [pc.name], make me cry your name!”</i> she says. <i>“" + (biancaFamiliarity() < 50 ? "I bet I won’t be able to stand when you’re through..." : "When you’re done teasing me, we’ll meet later tonight... and you can show me just how good a <b>mate</b> you really are.") + "”</i>");
	}
	else
	{
		// First Time (no rut/pheromones)
		if (flags["BIANCA_SEXED_LICK_HER"] == undefined)
		{
			output("You’ve learned how to take Bianca’s teasing in stride. She’s so good at it, always carrying you to the edge of orgasm and back solely through her skills as a devoted wife and lover. It’s almost impossible to think.");
			output("\n\nThe operative word is <i>almost.</i> You don’t need much time to think about what you want to do to her, what you want to <i>learn</i> about her. She knows everything about you, but in contrast there’s painfully little that you know about <i>her.</i> Bianca, in all her magnanimity, never expects anything out of you. She experiences pleasure when you do, cums when you’re happy. You’re not sure where it all comes from, but this reflection puts a fine point on her philanthropic nature.");
			output("\n\nIt’s time for something else... time for you to get a taste of her.");
			output("\n\nReaching forward, you grab her hand and rise slowly, expelling the lust-heat boiling in your lungs. Bianca’s face lightens, losing desire to worry. <i>“[pc.name]?”</i> she murmurs, ears twitching.");
			if (pc.isNice()) output("\n\n<i>“You like when I’m direct, right?”</i> you ask plainly, very quickly receiving a nod. <i>“Then do me a favor... take my place and show me your pussy.”</i>");
			else if (pc.isMisch()) output("\n\n<i>“Alright doc, one question... you like it rough, don’t ‘ya?”</i> Your question darkens her face. She visibly <i>enjoys</i> affirming what you already know. <i>“Good,”</i> you continue, <i>“because it’s time you get it that way... turn around and show me your pussy.”</i>");
			else output("\n\n<i>“Think you can keep agitating me like that?”</i> you growl into her neck, and she lets out a pleasant-sounding coo. <i>“It’s about time you see what I can do for a change. See that " + (getPlanetName().toLowerCase() == "mhen'ga" ? "tree" : "rock") + "? Pull down your pants, put your hands on it, and point your ass at me.”</i>");
			output("\n\nHawkish eyes stare back, your boldness building an approving rumble behind her oval lips. <i>“I’m... I’m surprised you asked!”</i> She kisses you on the nose, pivoting at the heel, touching her tails to your sides in the motion. <i>“Don’t look away now, or I might get upset...”</i>");
			output("\n\nOh, there’s no need to worry about <i>that...</i>");
		}
		// Repeat (no rut/pheromones)
		else
		{
			output("At the point of no return you grab Bianca’s hand and roll over on top of her, leaning down to the nape of her neck - this feral act of dominance smashes the buttons of your unstable lusts. Coaxingly shifting against one another, your combined ozone heats up until you’re both on the verge of suffocating, rapidly falling towards a feverish rut. The doctor below you is at your mercy; her gilded tresses spread out in a wide halo; heaving boobs lift and lower to depthless panting.");
			output("\n\n<i>“You’re beautiful,”</i> you sigh, reining in your restless libido before you " + (biancaFamiliarity() < 50 ? "before you break the rule of no penetration." : "before you forget your intentions."));
			output("\n\nThe medic titters shakily at the compliment, reaching for your [pc.thighs]. You grab her journeying hands and lean back, pulling her up to her feet and spinning her around.");
			if (pc.isNice()) output(" <i>“I’m going to suck your pussy until you can’t stand anymore,”</i> you whisper into her ear.");
			else if (pc.isMisch()) output(" <i>“I’m going to lick your pussy, and you’re going to scream my name,”</i> you purr a growly notice into her ear.");
			else output(" <i>“Just stick your ass out at me, and let me do the work this time,”</i> you say, squeezing a tit for good measure. <i>“I want to hear you howling my name while I’m eating your cunt.”</i>");
			output("\n\nAcutely aware of your coarse, filthy desire, Bianca turns and leans forward, pressing her lips to yours in a sexless, direct fashion. When she pulls back, her tails brush you from head to [pc.foot], wafting her simmering, strawberry arousal into your nose and throat. <i>“Don’t look away. I want your eyes on me the whole time, [pc.name],”</i> she smiles, tongue slipping out. <i>“Last time was... mmnf...”</i>");
			output("\n\nIf she doesn’t hurry up, you’re going to do the deed yourself!\n\n");
		}
		// Merge, FIRST TIME AND REPEAT TIME (w/o RUT/PHEROMONES)
		// imagePack: embed octomush Bianca Bent Over pic here
		showImage("bianca_octomush_bentOver");
		output("Bianca walks within an inch of where you once sat, bowing at the waist to push her butt towards you. The slight wobbles snatch your breath away. Swaddled in criminally tight pants, her blessed, burgeoning buns withstand the cruel compression. Both halves of her vast, soft, round ass push out in rebellious fashion, slowly sawing at the stitches of her military-grade fatigues. Seeing her begin to liberate her ponderous tush from its prison produces every thrill your brain chemicals can concoct.");
		output("\n\nThe horny physician lifts the hem of her coat until it rests on the small of her back, revealing the downy-furred bases of her fluffy tails. The white-tipped fur drags your sight away for a few seconds in their showy outstretching - like a blooming flower - simultaneously holding her uniform up and exposing her alluring bottom to you. She wiggles her fertile hills to the left and right, cocking her rump at the nadir of east and west to jiggle the fat on it, humming a rhythm that follows the hypnotic sway of a galaxy-class moneymaker high and low.");
		output("\n\nBoth of the fox’s hands disappear at her crotch, the clicks and clacks of an unbuckling belt reaching your [pc.ears]. Bianca, facing you over her shoulder, wears the half-lidded expression of a talented courtesan, enthusiastic without a hint of jaded mundanity. You’re not even standing that close and you can <i>smell</i> her from here. The pheromonal tendrils spear your nostrils and gently parted lips, making you salivate uncontrollably; her tails slather your senses in exceptionally fragrant pussy, promising a dream come true with each sensual spin of rich fluff.");
		output("\n\nOne hand wanders to the backside of her curvy mass; one thumb digs into her pantline, tugging in the opposite directions of her thighs, wriggling them down. She inhales, yanking impatiently on the form-fitting grip of her obdurate clothing, folding the material as the top of her broad crack comes into view. Your fingers bend and curl; she huffs in equal parts strain and relief as the fabric crosses the first supple hump. Black lingerie comes into view, the barest bands of pink lace not far behind.");
		output("\n\n<i>“Mmh, wearing them so tight makes it so much more fun to take off...”</i> Bianca says in a lilting tone. <i>“I’m very wet, [pc.name]. You’re watching so intently that I think my panties are already ruined... it’s gonna make this harder, ehehe...”</i> ");
		output("\n\n" + (flags["BIANCA_SEXED_LICK_HER"] == undefined ? "Whether or not that’s true, it doesn’t fail to enrapture you." : "Knowing her, they were ruined the second she agreed to this.") + " Her scent can be wholly described in a single word: <b>ripe.</b> It’s cloying - it’s sweet, and far reaching. It’s a nymph sitting on your shoulders, pampering your senses with scintillating strawberry promise, fresh and perfect.");
		output("\n\n");
		if (flags["BIANCA_SEEN_PUSSY"] == undefined) output("What will it look like? The color, the shape, the pliability... and the inside? To lay eyes, for the first time, on her most sacred place is a dream come true. ");
		if (pc.isHerm()) output((pc.isCrotchExposed() ? "Your" : "Jutting against their decency layer, your") + " [pc.cocksLight] rocket forward, leaking male lube above your [pc.pussiesLight], " + (pc.hasVaginas() ? "themselves" : "itself") + " producing a slow, prickling tingle.");
		else if (pc.hasVagina()) output(" Deepheat builds between your [pc.thighs], a slow, gooey stream of femlube trickling out" + (pc.isCrotchExposed() ? "": " into your decency barrier"));
		else output("Between your [pc.thighs]" + (pc.isCrotchExposed() ? "" : " and behind your decency barrier") + ", your [pc.cocksLight] sniff out the most ready mate for miles. Blood flows through your iron-hard " + (pc.hasCocks() ? "boners" : "boner") + ", ready to enjoy this sexual adventure.");
		output("\n\nShe grunts like a wounded animal, exerting more effort to pull her pants down the sweat-slickened surfaces of her twin moons. <i><b>Moons...</b></i> that’s the only way your brain can describe her peach-shaped bubble-butt. Each girthy cheek is nearly the size of your head, and both plump halves together easily outsize it. The ripples fanning through her moist, oversized hindquarters flatten any ongoing thoughts in your brain as if she’d sat that glorious rump upon it. It’s glossy with perspiration, the fattest points colored cherry-red by <i>need.</i> You can tell she loves your reactions to its full glory, watching your eyes for those brief flashes of visual ecstasy.");
		output("\n\n<i>“Some stare at my chest. More stare at my butt - I see it all. In fact, I’ve gotten so good at <b>knowing</b> it that I can <b>feel</b> their eyes on this,”</i> she strokes an ivory-hued hemisphere, crinkling the silky fabric of her black and pink panties. Those are straining to hold back the cushiony tide, too. <i>“" + (biancaFamiliarity() < 50 ? "You’re the only other person I can trust with it, [pc.name]." : "I wouldn’t mind if you had other ideas, [pc.name]... please enjoy it as much as you’d like.") + "”</i>");
		output("\n\nBefore Bianca’s finished her sentence, she’s straightened up to lower her hand to the wettest part of her undergarment, which contributes so very little in the fight against her rolling hinterlands. Just one crook of a finger later... and in an agonizingly slow manner she reveals her pussy, finishing by bending forward again and spreading one curtain of buttflesh to display it...");
		output("\n\n...and then her tail swoops into block your line of sight!");
		if (pc.hasCock()) output(" Your [pc.cocksLight] angrily twitch at the sudden denial, and your mouth grimaces, <i>“Tch!”</i>");
		output("\n\n<i>“I couldn’t resist...”</i> she giggles mockingly, pressing her tail into the cleft of her pheromonally-charged nexus. You snort and stomp forward to seize the wide milf, an apologetic remark coming, <i>“Wait, [pc.name].”</i> She pauses for words, a lusty smirk writ upon her face. <i>“Please... look at...”</i> Bianca moans, but the withdrawal of her tail turns it to a raspy, meaty husk, coming away with gap-bridging cords of feminine soak. <i>“" + (biancaFamiliarity() < 50 ? "...Look long and hard at my unforgivable state." : "Look at it... ready to be made yours again.") + "”</i>");
		output("\n\nThe pussy-blocking tail comes away, one side laminated in a pearlescent sheen of its owner’s juices, stopping you in your tracks. <i>“I’m a dirty, filthy creature.”</i> The moment you register that luscious, deep red pussy, you inhale from a mixture of awe and");
		if (biancaFamiliarity() < 50) output(" adulterous");
		output(" appetite. Her ruby pocket is <i>streaming wet,</i> steaming from contact with cooler air. Thick strings of femme-cum trickle and pour from her mound, excess excitement slipping down her divine thighs. <i>“Right now, I’m not a doctor. I’m a woman.”</i> A single finger rakes through the blushing slit, collecting a syrupy glob, smearing it into her palm with the thumb. When her soaked hand glistens in the light her fingers spread out, enticing you with the venerable puss on offer.");
		output("\n\n<i>“Have your way with me, [pc.name],”</i> she says in that <i>perfect tone,</i> <i>“enjoy me, " + (flags["BIANCA_SEXED_LICK_HER"] == undefined ? "show me your skill as a lover!" : "give me your all just like last time!") + "”</i>");
	}

	// PC lust maximizes
	pc.maxOutLust();

	addButton(0, "Next", lickingAtAFoxDoctor);
}

public function lickingAtAFoxDoctor():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' unless we get a shirt lifted bust
	showBianca("NUDE");
	author("William");
	// processTime 9-17\rand minutes
	processTime(9+rand(9));

	output("[pc.Moving] forward, it’s hard not to");
	if (!pc.isNude()) output(" tear your clothes off");
	output(" and fuck her.");
	if (pc.isHerm()) output(" Her position is one of the most procreative there is, second only to being pressed into the ground being drilled with dick. You could even grind your [pc.pussiesLight] into hers" + (pc.balls > 0 ? " while your nutsack massages her clit." : "."));
	else if (pc.hasVagina()) output(" You could just pull her down and grind your [pc.pussies] into hers until you both pass out from orgiastic exhaustion.");
	else output(" Outside of a mating press or a prone boning, Bianca’s position is the most procreative there is, well-suited to taking your [pc.cock] all the way.");
	output("\n\nYou");
	if (pc.libido() < 33) output(" gingerly sink your fingers into her malleable, silky-soft skin");
	else if (pc.libido() < 66) output(" eagerly grip both of her hind globes, squeezing and rubbing her yielding skin");
	else output(" hungrily grip and fondle her doughy derriere, [pc.hands] sinking into her depthless flesh");
	output(". Massaging her beckoning buttocks riles a chained beast inside you, and it launches itself with a rutting monster’s strength in the direction of a receptive woman. The fettered hound proves victorious over its restraints - your degraded willpower.");
	if (pc.isCrotchExposed()) output(" Quenching your need is done by slamming your crotch into the fox’s so hard " + (pc.hasCock() ? "your [pc.cockHead] nearly penetrates and unloads." : "[pc.oneClit] slaps to hers dead-on, rattling you with a mini-orgasm."));
	else output(" Against your intentions you dig out your " + (pc.hasCock() ? "[pc.cocksLight]" : "[pc.pussiesLight]") + " and slam your crotch into the fox’s, " + (pc.hasCock() ? "[pc.cockHead] deflecting off her fat pussylips." : "[pc.oneClit] deflecting off her own."));
	if (biancaFamiliarity() < 50) output("\n\nBianca’s trust you in is well placed. She may have squeaked at your aggression, but she didn’t utter any protest, <i>knowing</i> you would hold on well enough not to go that far. The feeling that you vindicate her subdues the raging want to split her open with raw, animalistic desire.");
	else output("\n\nIt disappoints her, you can tell, when you don’t lose yourself to the eager, unrestrained desire to fuck her. Bianca’s pussy is fountaining your " + (pc.hasCock() ? "shaft" : "groin") + " in the juices of an extremely needy woman... but you’re here to <i>taste.</i> It subdues your volcanic urges to <i>know</i> that getting her off like this will leave her wanting <b>much</b> more later. For now, this is about her.");
	output("\n\nMolding her plentiful expanse to your whims is a virginal delight. You squeeze and rub, obsessing over the tactility of your");
	if (flags["BIANCA_SEXED_LICK_HER"] == undefined) output(" new");
	output(" favorite pillow, losing an [pc.arm] in the valley of her posterior fissure. Smiling comes easily. Against her asshole and the entirety of her pussy, you glide your forearm up and down, fingers teasing at the sodden hole of her puffy vulva. Every stroke earns a pleasured twitch, a high-pitched moan, and another dash of wetness to your connected loins. Humping against her, you firm a hand to one cheek and raise it, open-palmed, before cracking it against her ass.");
	output("\n\nBianca’s nerves react masochistically to the impromptu tanning, her whole body tensing in stunningly pleasurable pain. An orgasmic moan looses from her agape lips, and from her soaked pussy foams a thick, flowing tidal wave that gushes uncontrollably. She liked that.");
	output("\n\nAnd even better?");
	output("\n\n<i>She came.</i> ");
	output("\n\n<i>“More!”</i> she cries deliriously, nectar spilling between her maternity-fattened thighs.");
	output("\n\nWho are you to deny her? Once again, you wind back and smack her so hard that your wrist burns, tattooing her eastern horizons with a bright red mark and sending buttquakes through the opposite landscape. The very air <b>snaps</b> from the shock of your strike. After the next imprinting blow, your fingers begin to ache, and from there on, your whole arm goes numb, pounding into the experienced milf’s inexhaustible flanks a tingling, lingering effect that’ll flare up whenever she sits down.");
	output("\n\nBy now, her legs are connected by a cascade of fresh, webbed cream");
	if (pc.hasCock()) output(", your [pc.cumColor] prejizz somewhere in the DNA potpourri");
	output(". Her back arches hard and her tails slump - her pussy spills out another load so close to a real squirt. Her gleeful panting expression sears itself onto your soul, barely held together among the vibrations from a well-punished ass. <i>“" + (biancaFamiliarity() < 50 ? "[pc.name], I w-want your tongue in me, I won’t be able to hold on if you tease me for so long..." : "P-Please, I need you in me, somehow, someway... I can’t hold on if all you do is tease!") + " I want us to cum together!”</i>");
	output("\n\nThe irony of Bianca’s request is not lost to you on your descent. You have to spread her ass just to find her girthy box. Knitting your [pc.hands] around her waist is " + (pc.tallness < 64 ? "is hard to do, considering there’s so much woman and not so much [pc.name], but you do settle into a lovely if awkward position":"is an easy enough task, even with the amount of lush thigh there is to grope on the way") + ". Perfectly aligned with her saturated delta, you lean forward, pressing your [pc.lipsChaste] to the center of her slit, planting a long, wet kiss against it while framing yourself in her enormous butt. Moisture leaps to your [pc.face]" + (pc.hasFaceFlag(GLOBAL.FLAG_FURRED) ? ", absorbing into your [pc.furColor] coat":", becoming the first layers of a sticky mask you’ll be wearing at the end") + ".");
	output("\n\nElephantine hips squirm on autopilot, struggling against the gradual savoring of your [pc.tongue]. Your unshakable grip ensures that your mouth stays firmly planted on the hypnotically large slopes of her deliciously aroused flesh, keeping her sensitive sex set in place for fat, adoring, dog-like licks from north to south. Her clit is larger than the average woman’s, a solid gumball of flexing nerves that you take extra care to bathe in tireless affection.");
	output("\n\nYour oral muscle stretches to the width of her pussy, leaving no divine drop unsuckled. Bianca’s muff is <i>huge.</i> The vulva is capable of suckling all on its own, fit tight around a large, sprinkling seam of blissful goodness. They’re utterly slathered in pleasure-juice, and that sweaty lather transfers to your visage as you mold her blushing exterior with your jaw and cheekbones. Slight little mindless humps rub hole up and down your brow, demanding greater affection that is given in spate.");
	if (biancaFamiliarity() < 50) output("\n\nIt’s a filthy, infernal act you play out, licking the pussy of a married woman, tending to a place that’s born children not your own. This belongs to someone else, and yet here she is, offering it to you. You wonder why, you can’t help it. She’s loyal to a fault, loving and caring. Does this not bother her on some level? Or does it feel that good that she merely puts it out of mind? If that’s the case, then you can too. Her husband isn’t around to take care of her. You are.");
	output("\n\n You gurgle out a half-giggle that vibrates her mound exquisitely. Instead of writhing aimlessly, her waist moves subtly to match the directions of your eager lapping. The crimson crease is so bloated, so gorged... so obscenely puffed out that even if you could not smell or touch, the sight alone inspires pussy-obsessive gluttony. Smashing your face into this curvaceous mother’s smoldering snatch becomes a physiological need as implacable as the ones for food, water, and air once you’ve rinsed your taste buds in slick, flavorful cream. A mother’s desire swaddles your taste buds in a delectable wine that requires seconds to minutes of savoring before it can be ingested.");
	if (flags["BIANCA_SEXED_LICK_HER"] == undefined) output("\n\n<i>“To your liking, I take it?”</i> she asks, hissing in pleasure.");
	else output("\n\n<i>“I know that touch!”</i> she hisses, sighing in delight, <i>“Ahh... I can’t believe I get to feel this again and again! [pc.name], you’re too kind to me... please, more! I love it! You’re so good at that!!”</i>");
	output("\n\nYour head is wrapped in a velvet vice, sandwiched in the swampy morass of her posterior vale, slurping up the fresh taste of a woman who’s gone much too long without being pampered. Fox tails cross around your back. If they were any stronger they’d be constricting like a snake, but their impatient request is a simple one: <i>deeper. <b>Harder.</b></i> ");
	output("\n\nEasy enough. After all, the only way to go is forward into thick, mature cunt.");
	output("\n\nThe texture of her pussy is smooth, glittery, and almost satiny. Her mons resolves into a glistening wonderland of ideal vaginal shape, complete with a faintly fruity taste garnished by salty sweat. Bianca’s juices have absolutely no bitterness, " + (flags["BIANCA_SEXED_LICK_HER"] == undefined ? "surprisingly" : "a continual and pleasing surprise") + ". Quaffing her ambrosial lust is even easier, and is in fact preferable to holding it all in at this point. Gulping contractions shepherd a neck-stretching load of sweat and femcum mix down your throat and into your waiting gullet. Throughout its journey, her intense, rosy warmth had spread to the corners of your body, riding on the electric wires connecting your nerve clusters to one another.");
	output("\n\nIncredibly, <i>it gets better</i> once it settles in your core. The aftertaste is amazing! It’s what makes this special, bringing you so close to " + (pc.hasCock() ? "busting in your clothes until you balloon up in [pc.cumNoun]" : "drenching" + (pc.isCrotchExposed() ? "" : " yourself and") + " the ground in [pc.girlCumNoun]") + ". There’s some kind of relaxing ‘coolness’ - you can’t think of any other way to describe it - that lingers between your cheeks... and it makes you want more.");
	output("\n\nThus it’s no surprise the very next thing you do is take that first step, piercing her thrashing silky slit and opening up a mythological pathway for your cunt-thirsty tongue to burrow into. The interior of her pussy is deep red, just like the rest of her pretty bits. A tail strokes the back of your neck in encouragement. <i>“A-All at once, [pc.name]! Go as deep as you can in one go! Make me scream!”</i>");
	output("\n\nThat was the plan from the beginning.");
	// LoOoooNG Tongue!
	if (pc.hasLongTongue()) output("\n\nYour [pc.tongue] was built by evolution to dig deep into every wet hole it came across, and Bianca’s pussy is no different. Of course, before you’ve even reached what you think is halfway, she clamps down and cums all over your invading muscle. She screeches in a most unladylike manner, polishing the ins and outs of your cranium in terrifically gushing wetness, searing you until there’s no feeling left in your elastic extension. An orgasmic hue of purples and reds and pinks eats away at your world - not that there’s much of a world when you’re face-deep in vulpine box, harvesting every scrumptious drop of precipitation all the way to the cervix.");
	// Normal Tongue
	else output("\n\nYour [pc.tongue] doesn’t go far, but it doesn’t need to. Just the act of prying apart the physician’s chubby folds drove her to scream and clench down on your small, invading muscle. The vice is so tight that you lose feeling in your lips, and some kind of colorful hue eats away the world from behind your retinas - not that there is much of a world when you’re face-deep in convulsing quim. Her walls have you bound up so tight that you both buck against each other: your captive face is secured between her ear-muffling ass cheeks where it belongs, enjoying the fox-slut’s pussy and its endless buffet of rewards. Bianca, too, by the unladylike screeching above, is beside herself!");
	output("\n\nA sincerely sublime sense of satisfaction washes over your heart after hearing her cry out so loud. " + (flags["BIANCA_SEXED_LICK_HER"] == undefined ? "This is the first time she’s been able to be treated, to be loved back. It’s almost enough to bring a tear of happiness to your eye!" : "You feel a genuine pleasure just to be on your knees, snuggled deep into this landmark to all things feminine and motherly, showing her that she can feel good too."));
	output("\n\nBy the time she calms down long enough, you seize the opportunity to map out the contours of a vagina spread by vigorous fucking and repeat childbirth. " + (biancaFamiliarity() < 50 ? "It belongs to someone else. She has a husband. Yet here you are, munching this swollen muff, turning this lewd housewife into a health delivery expert." : "Idly you wonder how fertile it must still be. Having given birth to three children, been fucked and knotted on a repeat basis... there’s so much to explore every time!") + " Profuse liquid excitement rains out onto your [pc.lips]; you suckle and suckle, guiding the fox-mom to her next orgasm. Glittering cunt and even brightly glowing ass both yield for your explorations. For one moment you pull back and inhale, spreading Bianca’s cheeks until her asshole winks at you, charging your cunnilingual engines to ramming speed.");
	output("\n\n<i>“Ahhh!!!”</i> she cries. <i>“Is... is it really... Eek!”</i>");
	output("\n\nHer vaginal tightness is intense, and at some point you realize you’re not licking her out, she’s sucking <i>your tongue.</i> You slap against the centers of her hefty, malleable bubble-butt, freeing up enough space for your rowing organ to spin a full circuit in the shudderingly sweet bind of a licensed <i>and</i> certified baby-maker. The fox-milf’s legs give out just a bit more in your drive to reach the furthest depths of her thrice-sown field, a wave of lubricating heat washing over you and down your neck.");
	output("\n\nSpanking and suckling away, you spare one of your last thoughts: you really love eating pussy. Fuck, dining on cunt is fucking amazing. Moreso, having the privilege of drowning in " + (flags["BIANCA_CONFRONTED"] != 1 ? "a married woman’s" : "Bianca’s") + " honeypot is, to you, a badge of honor. Who else could she trust with this important job? Who else could make her pant so madly? Whose face would she hump, obscure in a glade of feverish, torrenting climax?");
	output("\n\nYou’re unable to see a single ray of light now that the shadowy underside of her tails are in the way. In darkness, you find your own path. Orgasm-amplified warmth gallops across your box-packing tongue, oiling it well enough to finally plunge through tensed depths that refuse to part for anything except a girthy cock.");
	if (pc.hasLongTongue()) output(" The moment you hit her cervix, though, you loose a victorious giggle. Femme-cum fireworks across your dizzied dome, lacquering your horizon in the entrusting sheen of a professional doctor’s prodigious libido.");
	output("\n\nBreathing becomes difficult again, but you don’t want to pull out. Not just yet. She’s on the very slippery edge of carnal release. You elongate her quivering spasms by dancing over her clit again, finally digging an arm into this crushing canyon to pinch it.");
	if (pc.isCrotchExposed()) output(" Your " + (pc.hasCock() ? "[pc.cocks]" : "[pc.pussies]") + " are throbbing numb and angrily, on the verge of blowing should her next wild climax approach.");
	else output(" You lower your other hand to fidget with your gear long enough to allow your " + (pc.hasCock() ? "[pc.cocks] to fully spill out." : "your [pc.pussies] to taste air."));
	output(" If you put your mind to it, you’ll get her to cum right here. Just slap her ass a little harder, maybe pull her tail... maybe push her further?");
	output("\n\nOr... you could pull her down, sit her on your face and have her baptize you in the primal pit of her clutching thighs...");

	addButton(0, "All In", ifThisWasRooICouldMakeSuchMemeFunctions, undefined, "All In", "No holding back, just <i>eat that pussy.</i>");
	addButton(1, "Pull Her Down", downTheFoxGoesOntoPCTongue, undefined, "Pull Her Down", "What could be better than having that big, wonderful ass sitting on you?");
}

public function ifThisWasRooICouldMakeSuchMemeFunctions():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' unless we get a shirt lifted bust
	showBianca("NUDE");
	author("William");
	// processTime 8-16\rand minutes
	processTime(8+rand(9));

	output("Determined to break Bianca’s willpower, you tighten your fists around her waist (which only depresses your limbs further into her skin) and scoot forward, trapping yourself in a blast furnace with only a tiny oval aperture for ventilation at the front. While it exists, it’s not going to do much with her scent clogging the airway. Her coat falls back down over your head, muting the universe; you can scarcely breathe, and what air you can intake is <i>rich with cunt.</i>");
	output("\n\nBianca’s output is perfect for breeding. Her cum doesn’t bead and drizzle, it flows in pen-width rivers, down her and down you. Magnificently engorged lips puff out a full inch, smothering your nose and mouth. Nothing matters more than satisfying this pussy, worshiping it on autopilot now that your brain has begun adapting to an airless situation. Stuck deep in your chest, right next to your anxiously beating heart, is a risky proposition. Hopefully she won’t be too upset that you’re risking your health a tad, struggling against the limits of biology and your own endurance to <b>make love to her.</b>");
	output("\n\nStrange episodes of hallucination brought on by oxygen deprivation assault you. Bianca’s femme-cum suddenly tastes like ice-cream. Awareness drops to the point all you can make out (and make out with) are the tongue-scissoring folds of an organic cock-milker (or, in this case, tongue-grabber) squeezing violently on its attacker for cum (that isn’t coming). Despite these things, you’re calm as can be, nibbling on the lurid protrusions of glazed, sapphic skin. There’s an audible smack when you kiss them now. They feel rubbery, like latex. No wait, <b>your lips</b> feel like latex.");
	output("\n\nNo-no-no, they’re sparking like sex-organs now! Now there’s a reward. Getting drunk on her utopian signature, thrumming in molten bliss... hell, that’s more than reward. <i>It’s the honor of privilege.</i> Once your wheezing brain realizes it can’t go another minute like this, you plant your hands to Bianca’s buttocks and shove her forward, simultaneously freeing yourself of her copious backside and restoring your vim with a healthy rush of pheromone-ridden oxygen.");
	output("\n\nIt’s like waking up from a lucid dream. Unpleasant. Miserable. You want to go back. You were having so much fun, where you were in control... where there was no stress. Fortunately, all you need to do to re-enter that mystical creature comfort is fly forward, enmesh yourself in the doctor’s daunting derriere, spread her cheeks and rest your head back on the pillow, close your eyes... <b>and let your tongue go back to work.</b>");
	output("\n\nYou make it back there. You’re home again" + (silly ? " with a view to a kill." : "."));
	output("\n\nShe’s saying something, maybe a lot of things, but you can’t hear it. Her unrestrained moans are burbling out with unswallowed saliva. What’s going on out there is in the real world.");
	output("\n\nThat’s not the world you live in. The world you want to be in is right here, " + (pc.hasMuzzle() ? "muzzle" : "nose") + "-deep in Bianca’s torrid pussy... a luscious, wet paradise you’ve been entrusted. It’s a place only you are allowed to enter" + (flags["BIANCA_CONFRONTED"] != 1 ? " in lieu of her husband" : ", only you. It’s up to you to give your all") + ". You’ve taken your last breath. You can relax when the job is done, when she’s a violently quivering wreck of fluff and discarded inhibition, when you’re drenched in rosy stain. The only downside to being in someone’s downside is you can’t see the faces they make, can’t hear their encouragements...");
	output("\n\nBut you don’t need to worry about that. You have five senses for a reason, and when some are inactive, the rest are stronger for it. Your senses of taste, smell, and touch are utterly suffused with the tight, juicy pussy that nearly squirts on every orgasm you gift it with. Highly flavored fields of milfpuss stretch out before you, contracting, grinding hard against each other around your organ, then pulling away to let you guide them to another lush denouement.");
	output("\n\nYou wish you were doing this anywhere else. You wish this was in space, with a vista of beautiful suns all around, maybe a resort world outside the window. If only you were somewhere comfortable not on this rush, living a comfortable life. This is not the right place for fucking this pussy... but alas, it will have to do.");
	output("\n\nDr. Ketria’s decadent flavor, should you ever taste similar outside this situation, will bring back colorful memories of your time spent being her spirited pussylicker. The smell... the smell is something only she possesses. Hers is the unique smell of a woman who spends her days tirelessly working for the sake of others, full of life and warmth, resonating to decades of sharing body heat. Hers is the scent of a woman who has borne several children into this generation. Hers is the aroma that greets a lover home, home... sweet, tasteful home.");
	output("\n\nYou will never forget the expansive, plush texture of Bianca’s vagina. It’s addictive. The more you lick, the more you <i>have</i> to lick, to slide up and down clusters of insatiable nerves while her pleasure saliva streams down your chin. All of a sudden your head is squeezed on by her thighs, tilting you into an exotic cunt-kissing angle. Is she almost there? Or <i>is</i> she there? Your comfort and need to cum have been purely secondary in this affair. Maybe even tertiary, but you can’t think that deeply.");
	output("\n\nA beat ripples through your head. Her thighs are vibrating like a hot tub whirlpool, soothing you to the edge of unconsciousness <i>by just how right this all is.</i> " + (hours < 12 ? "Morning" : "Afternoon") + " sunlight spears through the gaps when her limpeting tails fall away. Dulcet moans break through to your [pc.ears] at last, and they’re as incoherent as you expected - almost like sobs and whines.");
	output("\n\nShe can’t fall anywhere, smushed up against the " + (getPlanetName().toLowerCase() == "mhen'ga" ? "tree" : "wall") + " like so. With what little strength you have left, you nestle as deeply as the laws of physics will allow and <b>lick.</b> Bianca needs to cum. Your [pc.tongue] knows exactly where to go unassisted by sight. It wanders her shifting maze, intimately familiar with its weakest areas. Dangling, light-refracting lobules of juice go ‘plat-plat’ when they smash into a puddle the soil refuses to absorb.");
	output("\n\nBianca squeals piercingly, gripping you with all the limberness and jiggle her body is capable of. While her white-hot arousal begins to erupt, you content yourself in the knowledge that you’ve united both halves of her velvet ass around yourself, brought her to a creamy release and a shuddering, delirious babble. It’s something that amazes you, too. ");
	output("\n\n<b>She squirts.</b> It’s just a little, and it’s only once, but when her whole body locked in your hands you <b>felt</b> it coming. You felt it form between the cherry-red walls of feminine muscle. You <i>felt</i> it the moment it fired.");
	output("\n\nThat’s why you opened your mouth to catch it like the good [pc.raceShort] [pc.boyGirl] you are. And you wouldn’t be much of a lover if you didn’t extend the overly-sensitive fox’s heavy, wet, obscene, squelching climax for as long as possible. Suckles to her labia, licks to her clit, even one greedy pinch... the puppetmaster is now one herself. The depth of that thought, however, is best left for the theologians to delve, for <i>you</i> have a syrupy deluge delving into your throat. The fierce <b>writhe</b> against your head is enough to get your abdomen to slam upwards, prompting your tender, lust-cresting genitalia to unload.");
	// Herm and Cockgasm
	if (pc.hasCock())
	{
		output("\n\nA completely unassisted gush of breeding instinct surges up your [pc.cocksLight], erupting from your twitching [pc.cockHeads] in several thick spurts of [pc.cumGem] seed, rich in color and detail. [pc.Cum] gets everywhere in the limited space available. Without proper stimulation, it’s not an orgasm that lasts long, and you’re pretty sure you just hit her shirt with some of it. The rest of it either throbs out into a steaming puddle below, then dribbles down the side of your " + (pc.hasCocks() ? "pulsing shafts" : "shaft") + (pc.balls > 0 ? ", coating your [pc.ballsNoun] in quickly cooling sperm." : "."));
		if (pc.cumQ() >= 30000) output(" Out of nowhere your anvil is struck by Bianca’s hammer, renewing the simmering urge. Unburdening spasms pump out a few more gut-grazing lines of [pc.cumNoun].");
		if (pc.hasVagina())
		{
			output("\n\nYour masculine side may be stealing the show but that doesn’t mean your [pc.pussiesLight] have been inattentive. Emissions of [pc.cumVisc] jism sent enough aftershocks down to bring your feminine arousal to a boil. A crash of bliss blows your horny, dual-sexed mind away in the impact, [pc.girlCum]");
			if (pc.isSquirter()) output(" squirting into a pretty [pc.girlCumColor] puddle.");
			else output(" spilling forth from your [pc.vaginaColor] " + (pc.hasVaginas() ? "slits." : "slit."));
		}
	}
	// Pussygasm
	else
	{
		output("\n\nFrom your spasming [pc.vaginaColor] " + (pc.hasVaginas() ? "twats" : "twat") + " comes a submissive wave of fresh, [pc.girlCumVisc] bliss. Beads of [pc.girlCumNoun] dribble out in the first wave, followed by the stomach-clenching impact. Your [pc.belly] heaves and your flower blooms.");
		if (pc.isSquirter()) output(" Your mass quakes, your [pc.nipplesNoun] are diamond hard; the little jostles only enable a rocketing orgasm. The squirts of [pc.girlCumNoun] blasting from your groin are a reward. They speak volumes of accomplishment and a job well done. Bianca cums, and you get to cum. Everything is right.");
		else output(" Lewd slaps of flesh lead to another thing, and your balance flushes right out your [pc.ear] with cognizant thought. A steadily flowing wave of girlish bliss washes over your unloved mound, staining your thighs and joining Bianca’s outflow.");
	}

	// PC cums, reduce lust to 0
	pc.orgasm();
	// Apply 'Pussy Drenched' to the PC.
	pc.applyPussyDrenched();

	addButton(0, "Next", doneEatingFoxMilfForNow, true); // go to [Finished]
}

public function downTheFoxGoesOntoPCTongue():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' unless we get a shirt lifted bust
	showBianca("NUDE");
	author("William");
	// processTime 8-16\rand minutes
	processTime(8+rand(9));

	// imagePack: embed future Bianca facesitting pic here9999

	output("Unlacing your hands you grip Bianca’s waist, lift your nose from the furrow, breathe, and yank back. In a gradual motion you rainbow through the air, falling from your knees to your back in a painless shift.");
	output("\n\n<i>“Ah!”</i> she yelps cutely, scrabbling at the " + (getPlanetName().toLowerCase() == "mhen'ga" ? "tree" : "wall") + " before stumbling back with you - in the seconds before impact, there’s a <b>very</b> deep sense of satisfaction that her ass has nowhere to go but on and around your face" + (pc.hasWings() ? "; you spread your [pc.wings] before they bend inappropriately":"") + ". The shock of stopping a moon from colliding with its planet is totally absorbed by your head in an act of celestial chivalry. Both of Bianca’s aft quarters have firmly slammed your skull into the ground, cratering your cheeks under their superlative and intensely arousing burden.");
	output("\n\nNow you know what being a pancake is like!");
	output("\n\nMore importantly, you refocus on the task at hand: the deep red crescent now set like a crown jewel on your [pc.face], awkwardly fitted somewhere around your [pc.lips]. In the tumble back you didn’t spare any thought to how artless this frisson might have been, but it all worked out. Bianca’s big, suckable clit is resting on your chin, just under your lower lip. Her asshole’s somewhere north of your brow, and it’d be trivial to reach a finger there. But for your oral cunt-cushions? They’ve assumed their role as her vaginal seat, in perfect mons-wrapping position to suckle and lick. Your tongue has full access to everything it needs.");
	output("\n\nAll that <i>you</i> need to do is lick.");
	output("\n\n<i>“[pc.name]..!?”</i> Bianca gasps, shuddering above. She’s knelt down atop you, thighs and calves to either side of your face, her needful arches rubbing a massive ass all over. The only world you know is a sticky, mature cunt full of thirst quenching (and provoking) juices. <i>“Is- Ahhh...”</i> she groans, leaning forward. You take the opportunity to tattoo her right buttock with a finger-numbing slap, rubbing a blissful, pronounced circle into it afterward. <i>“" + (flags["BIANCA_SEXED_LICK_SIT"] == undefined ? "I-I didn’t think of this position... it’s... of course you love my butt that much! But for this mmmmm.... mmmischief... you won’t be coming out of there until I’m satis... ah... satisfied...”</i>" : "I-I... I’m glad... mmmmhh... you like my butt so much, but- ah! - you realize you’re not going to come out of there until you’re done, right? D-don’t worry... that you like my ass so much... hehe... that makes me hornier...") + "”</i>");
	output("\n\nYour tortured bone structure adapts to the crushing weight of a marvelously proportioned milf in record time. There’s no reason to feel pain when there’s a vagina this wet to service, when this fecund edifice of inhumanly venerable plushness is sat atop you, fat butt clenching and squirming across your forehead. In between long, fat licks of satin-soft pussy and wringing tugs to her throbbing lady-boner, you quickly discover your new limitations. You can’t turn your head more than an inch; Bianca’s blimps swallow your sight completely, and what fertile flesh isn’t swaddling your view spills down the sides of your face like melted butter.");
	output("\n\nThanks to this angle, incidentally, your tongue can reach deeper" + (pc.hasLongTongue() ? ", prodding at the entrance to her thrice-activated womb." : " - halfway when unfurled!") + " Somehow the pussy-pleasing organ has mapped her maze on its own, having become a pleasure-seeking tracker of matchless intuition. You wield it on autopilot, focusing on shunting all the power and strength it needs to continue traversing her idyllic hole, wantonly harvesting it for all its grossly incandescent moisture. You’re not sure you’ve ever wanted to high-five your tongue, but for now you whisper it a brief, mental praise as another maw-saturating rush of fem-gasm stuffs your cheeks.");
	// long tongue fuck
	if (pc.hasLongTongue())
	{
		output("\n\nPacking Bianca’s pussy with your tongue is a simple matter. You’ve got enough oral muscle to please multiple partners! You slide across fluid-oozing glands and flatten nerves that expect dick and get the next best thing. You drum at gates previously conquered, surprised to reach even further than before -- her womb has opened to you, and with her vagina so densely stuffed with [pc.tongue], claiming it is a natural next step.");
		if (biancaFamiliarity() < 50) output(" Perhaps it’s going too far, but she doesn’t seem to mind. You’re not <i>actually</i> fucking her or anything. Right?");
	}
	output("\n\nYour arms begin to tremble again from the lack of oxygen but they endure like brave, wounded soldiers, palming circles into the medic’s bubbly butt, working into another worshipful frenzy - you even manage to crack her with another spank! Hot slaver rains down your face, Bianca’s ever-twitching cunt reacting to your exultant rump-thumping, depositing obscene amounts of lurid passion through your exposed orifices. Sheens of gleaming saturation coat your cranial interior and exterior, gradually spreading out until you’re the centerpiece of a shimmering fountain. Fortunately, her wide, wobbling asscheeks keep your eyes shielded, but they do nothing to keep your nostrils clean. It’s a miracle you don’t choke!");
	output("\n\nThis is even better than sex. It took a little while to get used to having your freedoms restricted in sensuous posterior bondage, but when you did your tongue and lips began working harder. Bianca’s getting used to it too, taking to her newly-acquired dominance in ways that please you on multiple layers of reality. " + (silly ? "Bianca’s binaculars" : "Those huge, epically dense cheeks") + " bless you with their movements, keeping everything pitch black and full of her overpoweringly erotic scent. Her aroma is legendary, spurring your body like a drug to into more servile actions.");
	output("\n\nYou pump and you groan and you purr and you cry, every expression muffled by the wide open red interior of your personal doctor. Bianca’s tickling heat blesses you, consecrates you in an eddying vortex that makes you feel the heat of submission and peaking arousal everywhere.");
	output("\n\nDrops of torrid, dewy goodness trickle down every side of your [pc.face]");
	if (pc.hasFur()) output("; your [pc.furColor] coat of fur has sponged up all it can");
	output(". There’s a sort of painful twinge in the back of your head, growing into a buzz that has you groaning into that blushing box. Your brain detaches from non-essential bodily functions to continue its cunnilingual duty. The comfort and joy you derive from pleasuring " + (flags["BIANCA_CONFRONTED"] != 1 ? "a married woman’s" : "Bianca’s") + " twat overrides self-preservation. Being enmeshed in the doctor’s derriere, arms going limp, running your tongue and lip over her clit in worshipful service, you realize just how close you are to heaven... perhaps in a sense too literal for most people.");
	output("\n\nSensing this, Bianca lifts up just a bit, allowing a breath of fresh air to run through your lungs. For an inveigling moment her beautifully soaked flower shines in what little light there is, clinging wires of lady-spunk connecting her nethers to her devoted pussy-slut. <i>“Back to work, [pc.name],”</i> she sighs ex cathedra, sitting her massive mountains back on your face <b>much more firmly than before.</b> And just to make sure you’re lodged securely in her taint, her legs pin your wrists while her hips wriggle you to the natural ceiling. Once settled, she pats the side of your head in gentle encouragement. <i>“Lick my pussy, [pc.name]. Make me cum.”</i>");
	output("\n\nYet, mere seconds after her moment of control, she goes right back to bucking and writhing when you split her labial lips apart and thrust your [pc.tongue] towards its core. Red-hot walls flex and squeeze all around the fleshy stem, tightening up hard enough for your face to lose all feeling. Any possible muscle movement you can make, you make it. Awkward suckles to her lips, rocking your head, moaning into her seeping honeypot...");
	output("\n\nEffervescent curtains of femme-cum collect into shimmering puddles in the tiny divots on your face. It’s reaching up to your firmly shut eyes, pooling over the shut lids. The deluge of pheromones and being totally marked summons the sinfullest of pleasures. he motherly fox is as much a treat for you as you are for her. Nothing makes you happier than to prove yourself a dutiful stress-relief nurse and to be brain-deep in so amazing a cunt.");
	output("\n\n<i>“Yes! [pc.name]! Lick, right there!”</i> she screams, bouncing, pounding forty-some years of pregnancy-borne encumbrance into your head. If you weren’t so drunk on cunt, you’d feel yourself sinking into the ground. <i>“I’m so close... it’s so hot! You’re a gifted [pc.boyGirl], you really are! Please endure it just a little... mmm... mmmmm... a little longer... [pc.name]... [pc.name]...”</i>");
	output("\n\nMaybe this was what you wanted from the start, being sat on by this exalted ass. Maybe you didn’t even know it. What you do know is that you are comfortable in your place, and that very small and <b>very</b> warm place is being " + indefiniteArticle(pc.raceShort()) + "-shaped pussy-licking seat for a wonderful woman.");
	output("\n\nSomething lewd occurs that thrusts your lower half up into the air and your muff-diving muscle into a neglected channel of nerves - an aching croak bubbles up through your drenched throat.");
	if (pc.hasCock()) output(" A hand has wrapped around " + (pc.hasCocks() ? "a" : "your") + " [pc.cock] with a titanium grip. It tugs on your member so hard that you feel like someone is absconding with your manhood! It’s Bianca, returning the favor, allowing you to cum!");
	else output(" Two fingers have penetrated " + (pc.hasVaginas() ? "a" : "your") + " [pc.pussy], and it’s already spurting its back-up love over its guests. A party is thrown in your [pc.vaginaColor] cunt right away, with those two fingers feverishly pawing at everything in reach.");
	output("\n\nFrantic, organic pressure erupts into your [pc.skinFurScales] and a piercingly loud squeal of purest delight punctures the libertine utopia, bidding you to thrust again. The mind-melting fever dream of her pussy becomes a reality, the slit dilating to express a bolt of erotic lightning into your mouth. It’s the hottest of her juices yet, followed by at least one more. Bianca’s not so wet to be a squirter... but wow... <i>you made her do that!</i>");
	output("\n\nYour groin is absorbed into a hollow sphere as your tongue rasps Bianca through her orgasm, prolonging your anointment as long as possible with kisses, whispers, licks, more licks, so many licks, it does everything it was born to do it does what is requiredofitanditdoesitwellllll-");
	// Herm or Cockgasm
	if (pc.hasCock())
	{
		output("\n\n[pc.Cum] races to the small, dilated entrance at your bliss-tender [pc.cockHeads], rocketing vivaciously into existence. Thousands of swimmers you can’t even see are spurting skyward, splashing into your legs, the ground, maybe into Bianca - she is still stroking you through it. [pc.CumVisc] seed gushes out, taking all your tension and worries with it, streamers of [pc.cumColor] fountaining through a helpful hand. [pc.CumNoun] spills from you to the doctor’s indulgent relish, and you’re all too happy to spurt until your [pc.ballsNounIsAre] drained of rewarding orgasm.");
		if (pc.balls > 0) output(" Your nutsack draws close to your body every time a ropy sperm-rocket funnels out into curving celebration.");
		if (pc.hasVagina()) output("\n\nInterestingly, your [pc.pussies] are able to get in on the action. Whether or not Bianca had a hand in it");
		if (pc.isCrotchExposed()) output(" or in " + (pc.hasVaginas() ? "them" : "it"));
		output(" is a question you can’t answer. [pc.GirlCum] flows from your unattended entrances until your mass quakes. The aftershocks of emission up the pressure, your body releasing");
		if (pc.isSquirter()) output(" [pc.girlCumFlavor] rods of that break against " + (pc.balls > 0 ? "your [pc.ballsNoun]." : "the ground."));
		else output(" tsunami-like waves of boiling [pc.girlCumNoun].");
	}
	// PussyGasm
	else output("\n\nEuphorically buzzing pussyflesh tingles then throbs, Bianca’s clit-teasings unlocking an equally feminine answer to her own. Droplets of [pc.girlCum] leak out just before the wave of bliss crashes against your loins, spilling into the world. Muscles clench and [pc.oneClit] is squeezed; " + (pc.isSquirter() ? "From head to toe you vibrate, adding just that bit more to Bianca’s pleasure; a squirting missile of fragrant [pc.girlCumNoun] rockets from your groin, one after the other. You wish that Bianca had this kind of output..." : "Balance and motor control oozes out of your honeyed " + (pc.hasVaginas() ? "slits" : "slit") + " as pink expanses of color shine in your darkness."));

	flags["BIANCA_SEXED_LICK_SIT"] = 1;

	// PC cums, reduce lust to 0
	pc.orgasm();
	// Apply 'Pussy Drenched' to the PC.
	pc.applyPussyDrenched();

	addButton(0, "Next", doneEatingFoxMilfForNow, false); // go to [Finished]
}

public function doneEatingFoxMilfForNow(fromAllIn:Boolean):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' unless we get a shirt lifted bust
	showBianca("NUDE");
	author("William");
	// processTime 2-5\rand minutes
	processTime(2+rand(4));

	// from [All In]
	if (fromAllIn)
	{
		output("Pulling away from Bianca’s butt is hard physically and harder emotionally. You fall backwards going ninety-percent prone, somewhat propped up by your elbows, gasping for air. The overhead sunlight purges your bleariness over a few visually searing seconds while the planet’s atmosphere provides the necessary chemicals you need to survive. By the time you start registering your orgasm and hers, calming down from your affair, you also realize the full-body bath of femme-cum you’ve taken. You are completely soaked.");
		output("\n\nAs for Bianca, she’s fallen to her knees, a madly panting pile of supremely gratified pussy. She pivots and crumples back-first to the");
		switch (getPlanetName().toLowerCase())
		{
			case "mhen'ga": output(" tree"); break;
			case "myrellion": output(" wall"); break;
			default: output(" surface"); break;
		}
		output(". Her glasses have loosened and slipped halfway down her face, fogged up by incessant breathing. A tiny smile stretches along her face when she sees you plastered in her juices. With a woozy groan she pushes up and crawls over to clean");
		if (pc.hasCock())
		{
			output(" your [pc.cocksLight] of all the [pc.cumNoun] striping your " + (pc.hasCocks() ? "shafts" : "shaft") + ", slurping your softening meat");
			if (pc.balls > 0) output(" and your [pc.ballsNoun]");
			output(" . It takes her only a second to have your sensitive " + (pc.hasCocks() ? "dicks" : "dick") + " shining.");
		}
		else output(" your groin of [pc.girlCumFlavor] arousal, careful to avoid turning you on again.");
	}
	// from [Pull Her Down]
	else
	{
		output("Bianca takes her time calming down, tensing and squeaking when you lazily lick at her backside, thoughtlessly horny. You can feel her internal conflict: she wants to stand and see to you, but she enjoys the position too much to do so. Wringing her libido like a rag, she rubs her ass all over your head until she’s worked her juices into your [pc.skinFurScalesNoun]. When she deigns to lift her ass from your [pc.face], it makes you feel like a hole has been ripped through your soul, or that there was always a hole and her battleship of a butt was plugging it. In short, you’ve got things to do in this life, no matter how reluctantly you agree with them.");
		output("\n\nAt least you can bask in the warm afterglow of being marked so thoroughly, lapping indolently at the fragrant mask you wear.");
		output("\n\nThe fox moves off to the side, crawling forward to clean");
		if (pc.hasCock()) output(" your [pc.cocksLight], audibly savoring the [pc.cumFlavor] jizz clinging to your softening " + (pc.hasCocks() ? "rods" : "rod"));
		else output(" your nethers of any remaining juices, being careful not to arouse you again");
		output(". She straddles you and crawls over your [pc.chestNoun], slumping bonelessly with a big ‘ol smile. Still panting woozily, she then slides off to the side, eyeing your totally ruined face with a hint of wicked glee.");
	}
	// merge
	output("\n\n<i>“" + (flags["BIANCA_SEXED_LICK_HER"] == undefined ? "Did you have fun, [pc.name]?" : "I’m going to start getting some interesting feelings if you keep doing that to me.") + "”</i> She giggles adorably. <i>“You really know how to please a woman. And let me tell you,”</i> she leans closer, lips almost touching yours; she whispers, <i>“I am not an easy person to satisfy.”</i> Pulling back, she winks, fixing her glasses. <i>“Thank you for that. I mean it. You were wonderful, and... hehe, I think I’ll like to have you face-deep in my butt " + (flags["BIANCA_SEXED_LICK_HER"] == undefined ? "a lot more" : "again") + ". The things you make me feel... I don’t want to lose them. They’re special to me, and you are too.”</i>");
	output("\n\nShe pecks you on the nose");
	if (biancaFamiliarity() >= 50) output(" and then smooches you on the lips");
	output(". You both make the slow, painful journey back to your feet and normalcy, exchanging laughs and jokes at how robotic and crab-like it ends up being. For her and for you, Bianca produces a roll of absorbent towels her handy little drone hauls about. Once you’ve both wiped down and fixed your clothes, you’re back where you started with a well-dressed woman standing patiently before you.");
	if (biancaFamiliarity() < 50) output("\n\n<i>“Don’t go missing now, I’m going to want you doing that again sooner or later. Masturbation is... quite inferior,”</i> she titters, hand over her lips.”</i>");
	else output("\n\n<i>“Don’t you dare get hurt. I’m going to need at least two more of those before I stop thinking about pinning you to the ground for a day...”</i> she grins like a venomous predator. <i>“Maybe I should surprise you in bed one day? I know where you live, after all...”</i>");
	output("\n\nAfter your goodbyes are said");
	if (biancaFamiliarity() >= 50) output(" and your hugs are traded");
	output(", you head your separate ways.");
	output("\n\n...You’re going to be tasting her pussy in your dreams for sure.");

	// remove 'pussy drenched' effect
	pc.shower();

	flags["BIANCA_SEEN_PUSSY"] = 1;
	biancaSexed("LICK_HER");

	addButton(0, "Next", biancaEncounterEnd);
}

public function fookinBiancasLegs(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work' until the sex.
	showBianca("WORK");
	author("William");
	processTime(2+rand(4));

	// First time doing the scene (if No Rut)
	if (flags["BIANCA_SEXED_LEGS"] == undefined)
	{
		output("This position you’re in has become acutely familiar. No, more than that, it’s a routine. As much a routine as brushing your teeth, taking a shower... you sitting here with your [pc.cocks]");
		if (pc.isCrotchExposed()) output(" throbbing in the air, unflappably erect for the doctor who tends " + (pc.hasCocks() ? "them" : "it") + " in a pace too slow to provide pleasure");
		else output(" bulging powerfully against your [pc.crotchCovers], disassembling the material that contains " + (pc.hasCocks() ? "them" : "it") + " out of desperate, throbbing want for real contact");
		output(". Sometimes you’re not sure if it’s just her being near you or her unerringly accurate stimulations that get you to blush from nose to groin.");
		output("\n\nThere’s something else you’re not sure of today: what to ask her. Having any agency in your thoughts is rare when you’ve got a fox prepping you for ‘treatment’. Her handiwork is impressive, and her cock-sucking skills can put the galaxy’s most depraved to shame. When your eyes settle on Bianca’s crotch, or rather her wide, nubile hips, you get an idea. The rules of your clandestine affair replay in your head, but you’re pretty sure that ‘no penetration’ doesn’t apply to a valley of thigh-flesh.");
		output("\n\nBeckoning the bewildered vixen up with you, she stands, understandably confused.");
		if (pc.isNice()) output("\n\n<i>“I have something else in mind,”</i> you murmur, staring at her crotch. <i>“No penetration, but what about your thighs?”</i> The color on your face darkens. <i>“You don’t have to if-”</i>");
		else if (pc.isMisch()) output("\n\n<i>“Something else is on my mind- er, actually two things,”</i> you chuckle. <i>“I remember your rules and all but your thighs are-”</i>");
		else output("\n\n<i>“Let’s try something else today. Not your hand or your mouth,”</i> you glance at her crotch, <i>“your thighs will-”</i>");
		output("\n\n<i>“Ooh!”</i> Bianca interjects, smiling gamely. <i>“That sounds fine to me. Between my thighs, hmm?”</i> She cups your groin and wraps her tails around you. <i>“How could I say no to feeling this thrusting against me with all its strength!”</i> she giggles. Leaning close to your [pc.ear], she whispers, <i>“Fun fact, no one’s ever wanted to take me like that...”</i>");
		output("\n\nPutting a hand on your shoulder she pushes away like a graceful dancer. <i>“Now I should get ready...”</i>");
	}
	// Repeat time (pc No Rut)
	else
	{
		output("You stop Bianca, putting your [pc.hand] on hers, shaking your head. Sure, you need service; you’ve got a " + (pc.hasCocks() ? "pair of erections" : "an erection") + " beading the first shaft-soaking droplets");
		if (!pc.isCrotchExposed()) output(" and stretching the aggravating confines of your [pc.crotchCoverUnder]");
		output(", but her fingers and her mouth won’t be adequate for this. Not after your previous time spent in her cushiony thighs replayed in your mind like a hyper-def porno on a battleship-sized screen.");
		output("\n\nGuiding her upwards, you declare your desire,");
		if (pc.isNice()) output(" <i>“I’d like to use your thighs again, if that’s okay.”</i>");
		else if (pc.isMisch()) output(" <i>“Why don’t you pull those pants down and let me at those thighs. I need the expansive care today. Intensive, I mean.”</i>");
		else output(" <i>“Do me a favor... just let me fuck your thighs.”</i>");
		output("\n\n<i>“Oh, that!”</i> Bianca answers giddily, stroking her breasts. <i>“<b>This</b> is why we are here. I get to hold you close while you fuck my thighs with all you’ve got. I hope you’ve not been with anyone else today, [pc.name], because...”</i> she leans in to whisper into your [pc.ear], <i>“...there’s nothing I like more than feeling a cock shoot itself dry because of me...”</i>");
		output("\n\nShe taps you on the shoulder and hops back a few inches. <i>“Watch closely,”</i> she says, <i>“I want you to be so hard that you cry out when I bundle you in my blanket.”</i>");
	}
	output("\n\nBianca presses a thumb to the lock of her belt, both front ends swinging free to wobble above her thighs. Gripping one side of her coat, she pulls her right arm through the sleeve, following suit with the other, before tossing it to the side with a theatrical flick of the wrist - her glasses follow next, landing unharmed on the crumpled uniform. An easy smirk brightens her face when she fits two sets of fingers on her curve-clenching legwear. She lifts one leg and wiggles, spinning in a slow, sensual whirl to drag her black pants down the humps of blessed proportion, fighting against her mouthwatering hipline the whole time.");
	output("\n\nThe golden-tailed fox turns her back to you, completing the circuit. A steamy gasp billows from her lips when she lifts up on her heels and yanks down hard enough that you <i>feel</i> the effort.");
	output("\n\nHer peach-shaped bubble-butt springs out, both ass-cheeks free of their fabric compressor. Black-and-pink lingerie strains extra hard against an ocean of hindflesh so vast that it can’t be fully contained by anything less than industrial strength underwear. Her ass extends outwards when she bends at the waist, giving you a chance to see the way her supple rump creates a cock-watering figure. The brush of air is enough to send ripples through her creamy, spherical buttocks, each one adding inches to your burgeoning " + (pc.hasCocks() ? "tumescences" : "tumescence") + ". It’s the sharp slap she delivers to her opulent tush, however, that maximizes your arousal.");
	output("\n\nThere’s nary a gap between her extravagant thighs either, and they’re just as thick as her ass, maybe even bigger. Your heartbeats form trachea-clogging lumps that paralyze you on her grinning approach. You can’t look away from the darkening spot spreading at the center of Bianca’s mons-hugging panties. Bulging against the velvet is a large, needy clit rubbed by the silk when she puts one foot in front of the other, generating more frictious excitement. Sashaying over, the wet spot grows darker, wider... and when she’s only a foot away, a single drop leaks down the smothering inner-skin of her gapless flanks.");
	output("\n\nSudden, looming closeness shakes you from your daze.");
	if (pc.tallness < 60) output(" Reality worms its way back into your brain, forcing your retinas to send needed information. Everything is strangely dark, hot, and muted... until you realize that you’re staring into Bianca’s abdomen. You glance down, catching the strawberry wind of her estrus heat; glancing up, you spot the towering fox gazing mischievously at you from above her jiggly bosom.");
	else if (pc.tallness < 72) output(" Reality comes barreling back in to inform your brain that your body is now eye-level with Bianca’s jiggly bosom. Inhaling the perfume-scented estrus heat billowing out, you look up to meet the doctor’s mischievously blushing gaze, a single bead of sweat trickling down your forehead.");
	else if (pc.tallness < 80) output(" At the sensation of touch, your head jolts and shakes left and right like a cat’s. When you open your eyes, Bianca is looking up at you, her marshmallow-soft mammaries smushing into your [pc.chestNoun]. Seeing the mischievous glare on her face urges your body to produce a single drop of [pc.hairNoun]-lining sweat.");
	else output(" Bianca’s head is level with your [pc.chestNoun], and while she presses her body into your [pc.skinFurScalesNoun] she looks up adoringly, twirling a finger along your collarbone.");
	output("\n\nAnother step is taken, and she backs you into the " + (getPlanetName().toLowerCase() == "mhen'ga" ? "tree" : "wall") + " where you once sat - another lumbering stomp, and she overwhelms you with the colossal burden of her chest");
	if (pc.tallness < 60) output(" resting her boobs on your head and");
	output(" pinning you between titillation and hardness. Her hand drops to your crotch,");
	if (pc.isCrotchExposed()) output(" wrapping tight around " + (pc.hasCocks() ? "a" : "your") + " [pc.cock " + cockIdx + "] and stroking it");
	output(" digging out your [pc.cocks] and stroking " + (pc.hasCocks() ? "one" : "it"));
	output(" until the rod is soaked in sizzling [pc.cumColor] pre.");
	// pc Cock Size <7
	if (pc.cLength(cockIdx) < 7) output("\n\n<i>“Hmhm...”</i> Bianca purrs, inspecting your modest girth like a penile connoisseur. <i>“You’re going to be suffocating in there, [pc.name]. It’s going to feel tighter than a pussy... even an anal pocket.”</i> Squeeze between thumb and index finger, your debilitatingly erect meat throbs mightily. Further abuses force other fox-pleasing reactions. <i>“That face you just made? That’s nothing compared to what you’ll make when I have you. It’s going to feel so good when you cum. There’s nowhere it can go, it’ll just... form a pocket... maybe explode outward,”</i> she whispers softly between her whorish caressing, <i>“...it’ll be like you just bred me.”</i>");
	// pc Cock Size <14
	else if (pc.cLength(cockIdx) < 14) output("\n\n<i>“Ooohh...”</i> Bianca moans, a little worship injected into her tone. <i>“I’m going to feel this hard, hot cock for sure... maybe it’ll go all the way through! And... mmm... your shaft is thick enough that it’s going to rub against me in so many ways... I can’t wait to feel it!”</i> Bianca feather-strokes your mast from root to peak, swabbing a finger across your cumslit. <i>“When I’m in this mood all I can think of is dick, and yours is my favorite right now, [pc.name]. I want you to cum so hard I feel it in my womb, I want to feel my eggs release!”</i>");
	// pc Cock Size <20
	else if (pc.cLength(cockIdx) < 21) output("\n\n<i>“My...!”</i> Bianca marvels at the size of your [pc.cock " + cockIdx + "] in breathless awe. <i>“This is... it’s like a saddle, it just keeps growing and growing! It’ll make it to the other side, no doubt!”</i> She adds her second hand to the phallic rowing, worshiping your prodigious girth with the desperation of a dicknotized slut. <i>“You could lift me up with this. Oh...”</i> She licks her fingers of your [pc.cumColor] heat. <i>“...I’m going to feel this through my entire body. You know, [pc.name]... I have to wonder why yours is so big. I love it, but... did you grow this in the hopes you’d meet a friendly doctor to stick it between?”</i>\n\nYou chuckle, quipping that these things tend to happen.");
	// pc Cock Size >21 (hyper)
	else output("\n\n<i>“[pc.name]... your cock is... hehe... this would never fit inside me, you know!”</i> Bianca steps to the side, allowing your package to balloon unimpeded. It’s a giant, veiny, quivering beast throbbing out hefty wads of [pc.cumColor] spooge. It craves the touch of an equally ravenous woman. <i>“I’m going to sit on this and ride you. It’s so large that it will hold me up, even bounce me. I’m going to... have to hold tight,”</i> she giggles, kissing you on the cheek.");

	// Maximize PC lust
	pc.maxOutLust();

	addButton(0, "Next", thiiiiiiiiiiiiiiiiighsAndAlsoBianca, cockIdx);
}

public function thiiiiiiiiiiiiiiiiighsAndAlsoBianca(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' until shirt lifted comes.
	showBianca("NUDE");
	author("William");
	// processTime 7-16\rand minutes
	processTime(7+rand(10));

	output("In the fire of the moment, Bianca tugs her compression shirt up with an effortful grunt, sighing dazedly when her hefty F-cups spill out centimeters from your nose. The effects of it can be seen in the tranquilizing wobbles of her bra-taut boobies. If your brain wasn’t utterly dominated by visual immersion into a foxy mother’s pride, it is now that your eyes hone in on a few trickles of sweat. Runnels of clear perspiration add a glow of arousal to the boundless fields of sublime boobflesh. You can’t resist grabbing one, squeezing one rotund nipple through the fabric, sinking into sweet utopia.");
	output("\n\nYou sigh. There’s really nowhere else you’d rather be than being pampered by such a beautiful woman.");
	output("\n\nBianca plants her hands on your head");
	if (pc.hasEmoteEars()) output(" scratching gently behind your [pc.ears]");
	output(". You don’t resist when her fingers firm to your skull and guide your [pc.face] to the halcyon seam of her lowlands. <i>“Shhh,”</i> she hushes and soothes, <i>“just close your eyes. There, there, [pc.name],”</i> Bianca pats your head endearingly. <i>“Good [pc.boyGirl]... just let me take care of this part.”</i> Her cleavage welcomes your face, though not all the way. With her bra up, you only end up halfway submerged in the upper shelf. <i>“I want you to <b>feel</b> me, so I’ll tell you when you can start, okay?”</i>");
	output("\n\nNestling an inch deeper into her lush hills, you nod, the nuzzles of your cheek intensifying the already suffocating warmth and empathy radiating here. Next, she takes your wrists and guides them around her waist; <i>“You may touch whatever you like,”</i> she giggles, <i>“but you will probably want to close your hands.”</i> Now in fucking distance, the [pc.cockHeads] of your [pc.cocksLightIsAre] rubbing into her belly, shellacking her abdominal acres with preseed.");
	output("\n\nIn a somewhat awkward manner, she struts backwards, spreading her legs. Your " + (pc.hasCocks() ? "cocks glide down her stomach, one batting" : "cock glides down her stomach and bats") + " into her outlined clit. Practically supine in her grip, " + (biancaFamiliarity() < 50 ? "you think briefly on the situation. Bianca always has you in her magical sight. This is as close to fucking her as you’re going to get." : "you can’t wait to feel your foxy lover’s silky soft pussy against your [pc.cockNoun " + cockIdx + "] again."));
	output("\n\nAt the press of a thigh against yours, a twinge of erotic tension fires through your lower body. She’s going to love you with <i>more</i> of herself. You swallow; the second of her trunk-thick-thighs infringes on yours, adding a heart-melting frisson to the swooningly hot coupling. You bite your [pc.lipColor] lip, [pc.cocksLight] sputtering like " + (pc.hasCocks() ? "garden hoses" : "a garden hose") + ". " + (flags["BIANCA_SEXED_LEGS"] == undefined ? "This uniquely sensual joy can only once be sublimely savored. In a way, you’re glad she’s not letting you see when it actually starts. You’re left to get on by feeling, and only feeling... just the way she wants.":"You’re rock hard and so warm that you’d think you were lying facedown on a beach towel. Waiting for her to swallow you up in her legs is an agonizing moment."));
	output("\n\nNarrowing pressure alerts you to the moment you’ve been waiting for. Your conjoined bodies gently rock as an inexpressibly dense warmth wraps around both, no, <b>all</b> sides of your [pc.cocksLight]. You gasp and sigh with every air of bliss, impatiently rocking your hips to the stimulation. Pleasure seeps out from Bianca in the form of a throaty hiss that tickles your [pc.hairNoun]. In a fever trance you clutch to her love handles and pull her forward, locking your bellies together and thrusting the entirety of your urgent " + (pc.hasCocks() ? "erections" : "erection") + " through the swelteringly-hot slit of her child-bearing nexus.\n\n");
	// imagePack: embed octomush Bianca Thigh Sex pic here
	showImage("bianca_octomush_thighSex");
	// biggest Cock Size <11
	if (pc.biggestCockLength() < 12)
	{
		output("Bianca wiggles into your drooling hardon, squirming each of her legs around it in opposing up-and-down patterns. You don’t emerge on the other side of her canyon");
		if (pc.biggestCockLength() < 9) output(", though you do feel the weight of her ass cheeks on your [pc.cockHead " + pc.biggestCockIndex() + "]");
		output(". <i>“I’ve got you tucked away, [pc.name],”</i> she declares giddily, stroking your cheek. <i>“Your cock is all mine. Now, show me how you feel about that. Now is the time... your time.”</i>");
	}
	// biggest Cock Size >12
	else output("Bianca’s thighs squirm around your clamped, drooling girth tight enough that her flexing muscles are getting in on the worship. The veins of your hot, bare dong pulse upwards against the shaft, communicating in their own way with her still clothed pussy. <i>“All the way through... I can feel it just under my butt. I love this, [pc.name]...”</i> she purrs, stroking your hair. <i>“Show me how much of a bull you are. Make me cum all over your monstrous cock! Now is the time,”</i> she kisses you on the cheek, <i>“your time.”</i>");
	output("\n\nDragging your [pc.cocksLight] through her slick curvature blankets your brain in pure rutting need. You’re sandwiched helplessly between a " + (getPlanetName().toLowerCase() == "mhen'ga" ? "tree" : "wall") + " and the fervid, panting doctor’s haunches, trapped dick-deep in an undulating tide of fertile flesh and plumping pussy. The texture is indescribably soft -- there are things that are certainly softer in this universe, but they’d be artificial. <b>They would be fucking fake.</b> Nothing would be as naturally <i>smooth</i> and <i>inviting</i> as Bianca’s heated thighs.");
	output("\n\nThe inaugural thrusts into her squeezing shallows are blissfully difficult. You fight against the heavenly friction");
	if (pc.cocks.length > 2) output(" your " + (pc.cocks.length == 3 ? "third cock" : "spare cocks") + " slapping into her flat belly");
	output(". It takes every fiber of your being not to cum your brains out when freshly-spurted femlube fuses with cock-slime, lubing up her channel so you can screw it even harder. Liquid squelches and ‘plaps’ of [pc.raceShort] against fox-milf invariably lead to squeals and lung-deflating cries of total pleasure.");
	output("\n\n<i>“D-Does it feel good? I’m- Ah!”</i> Bianca vibrates around your burning length, crushing you in the incredible depths of her legs. The impact of your [pc.knotBallsHilt] to her crotch chisels away at your self-control, adding an extra star to your fading vision.");
	if (pc.hasSheath(cockIdx)) output(" Your cock-sheath crinkles up around the hood of her obscured pussy, enveloping her button in the musky pocket.");
	if (pc.hasKnot(cockIdx)) output(" She flinches and rumbles when your inflated knot plies the curves of her wet, soft sex, grinding against her vulva in a vivid reminder of what it’s like to birth children.");
	if (pc.balls > 0) output(" Your cum-bloated musk-oven churns up a greater load when it swings inertially into her upper knee. The " + (pc.balls == 1 ? "teste inside clenches and lifts" : "testes inside clench and lift") + " up closer to your groin, <i>“I-I-I trust you with this, [pc.name].”</i> Another slap of nutflesh to vulpine cunt, and she’s singing praises.");
	output("\n\nYou slow your inflamed pace for only a second, gently pumping in and out of her slimy cavern. She dips a hand to her crotch and into her black and pink panties, shifting them aside so that the defenselessly swollen lips of her moist muff can rub against your shaft. Premature ejaculation hits: a single rope of [pc.cumNoun] throbs out from your trembling [pc.cockHead " + cockIdx + "]. <i>“It’ll feel better. I need to feel your cock there, [pc.name]...”</i> Her lady-button thumbs against your veins on each blinding plunge through her seething tunnel.");
	output("\n\nCherry-red lips pepper your face in wet kisses. Like a cyclone, Bianca twists her legs around your thigh-thumping " + (pc.hasCocks() ? "fucksticks" : "fuckstick") + " to simulate the cum-milking efficacy of her spurting cunt, aggravating a once-easy journey like a cruel gamemaster. Your breeding bulk sinks so far into her ham thickness that it could very well have gone on its final expedition. Rescued by your [pc.hips], it’s sent back in for more, thrusts timed with throbs that send your [pc.cockHead] a few inches into the lower fissure of her plump butt.");
	output("\n\nDancing. That’s what you’re doing: dancing. It’s not gentle, and it’s certainly not a traditional technique. But sex can sometimes be a lot like dancing, right? Her hands are secure around the back of your neck, holding tight while yours gallop across her body like dinner guests vying for their favorite dishes on a buffet table. Reaching for the thong-devouring globes of her galaxy-tilting ass cheeks, you palm at the fattest parts of her sumptuous aft orbs, gripping down enough for her to moan and for your hands to disappear into the voluptuous, organic ocean. You can’t tell if you’re preparing pastry dough or luxuriating in a mother’s pillowy derriere.");
	output("\n\nBianca gradually takes possession of your senses, holding them in lost-and-found. The more you let go, the more your dam bursts, the harder you fuck her. A steady, beating rhythm of sweet release fountains from her ruby twat, splashing your spelunking stiffness with inescapable liquid pressure. Sawing in and out of her comforting warmth couldn’t be easier, though the temptation to take her, to push her down and <i>mate her</i> is strong. The edges of your [pc.cockHead] have become intimate with the dilated entrance to her feminine nadir, squishing lewdly against glazed vulva, redoubling your foxen lust.");
	// Canine
	if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_CANINE) output("\n\n<i>“Yes! Rut me like an animal! Smash your knot into my pussy, let it breed me vicariously!”</i> Bianca howls inarticulately. You slap her across the ass and slam into her hard enough to half-slip the cum-lacquered knot past her folds. The fox’s eyes widen in shock and she explodes all over the polished breeding bulb, quaking in your grasp. <i>“M-More! More! Morrrreee!! Go that deep every time, [pc.name]!”</i> Unwilling to deny the horny mom what she wants, you rear back and repeat, practicing a new, savage rhythm sure to drive her mad!");
	// Feline
	else if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_FELINE) output("\n\n<i>“Mmmuuhh... Mmhh, that’s the best...! That’s the- Hie!”</i> Bianca’s grip breaks and she falls into you, the clit-massaging nubs on your cock driving her inner muscles to spasm and splash your bump-lined dong with another crotch-shaking orgasm. <i>“Yes! Yes! Faster, faster, [pc.name]! You can’t go slow!”</i> she coos in joy. Her hands shift to the " + (getPlanetName().toLowerCase() == "mhen'ga" ? "tree" : "wall") + " behind you for support, giving you more space to vigorously fuck the pillowy canyon of her pussy and thighs. Your teeming dick is like a deluxe sex toy thanks to all the soft barbs lining the shaft, enjoying the fruits of her oozing lubricant.");
	// Equine
	else if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_EQUINE) output("\n\nNearing orgasm, the fleshy flare of your stallion girth fattens and spreads outward in anticipation of sealing cum. The umbrella of widening flesh bends in and out on the entrance and exit to her celestial nethers. <i>“You’re flaring! Y-You’re going to cum, [pc.name]... ah... I wish... I wish I could...”</i> You pull back and slam into her again, a small spurt of ejaculate squirting out. You know how badly she wants to be bred, but this is what you agreed upon. She’s the mare mounted on your studly stallion, and she’s going to get to cum like one very soon. <i>“Yeeeessss... cummmm...”</i> Bianca moans. <i>“[pc.name]... cummm!”</i>");
	// Suula or Stinger-flagged Cock
	else if (pc.cocks[cockIdx].cType == GLOBAL.TYPE_SIREN || pc.hasCockFlag(GLOBAL.FLAG_STINGER_TIPPED) || pc.hasCockFlag(GLOBAL.FLAG_STINGER_BASED)) output("\n\nAdjusted to the sodden depths, the anemone stingers at the crest and root of your [pc.cockNoun] drive into Bianca’s folds and inject whatever bit of skin they can reach with a muscle-relaxing and libido-spiking cocktail of pure chemical mischief. The drug injection is crude and indelicate, but neither of you care... least of all you when she screams so loudly that your head shakes and the planet trembles. The [pc.cockColor] tendrils certainly implanted their liquid ardor into her fuckbox. <i>“Nooo... I’m going to be horny all day with...”</i> Her moan comes out so throaty that it’s almost like her voice was modulate. <i>“You have to keep fucking me, [pc.name], you have to make me cum hard enough I can’t stand! That venom is... ahh....!!”</i>");
	// pc Cock Human (or Unspecified)
	else output("\n\n<i>“Mm, mmaahh...”</i> Bianca hums indolently, writhing into the heavy rod parting her cowgirl-shaming hips. <i>“When it throbs I... I can feel it up to my womb... and... it’s a... ahh... mm...”</i> You deliver another stinging slap to her jumbo-sized rear, her pussy lacquering your staff in a desperate plea. <i>“I cannnnnmm, feel how hard it is from my vuh...”</i> Another [pc.knotBallsHilt]-deep thrust silences her, pounding her voice into broken, pornographic exclamations.");
	output("\n\nBianca’s entire body is walloped by the tectonic impact of your unmoderated fervor. Her ass is an impossibly addictive target for the kneads and squeezes that you lavish it with, stimulating your thick " + (pc.hasCocks() ? "masts" : "mast") + " towards the explosive climax. Hot exhalations flow from your lungs across the top of your doctor’s chest, and in a fit of animalistic desire, you slip a hand into the lingerie and yank it off. The hasp snaps open, and her pendulous boobs spill out, surrounding you in acres of succulent softness.");
	output("\n\nShe responds by seizing your [pc.lipsChaste] in a full, nibbly kiss. Your [pc.tongue] is subjugated by the " + (pc.hasLongTongue() ? "smaller, much more experienced muscle" : "more experienced muscle") + ". Tracing letters into your cheeks, it proffers only tiny moments to breathe, elevating you to a feral speed.");
	output("\n\nSurfing the fox’s waves, the prickling, gravid reminder that you need to cum swells up in your loins.");
	if (pc.balls > 0) output(" Your [pc.cumNoun] boils until it bubbles. Your girthy [pc.ballsNoun] " + (pc.balls > 1 ? "shift" : "shifts") + " into overdrive. Billions of swimmers are ready to embark on their voyage as soon as your ecstasy peaks.");
	output(" Full-bodied shudders wrack the milf-doctor, ending her contributions by turning her into little more than a person-shaped vibrator. You take a series of rapid strokes through her curvesome frame until your engorged shaft" + (pc.hasCocks() ? "s":"") + " throb at the beckoning of your heartbeat.");
	output("\n\nThe hollow moment precluding orgasm strikes, and in one breathless stride, you slide back, igniting your virility. The first eager prize of [pc.cum] surges through your distended " + (pc.hasCocks() ? "veins" : "vein") + ", parting her cock-molded vale with streams of onrushing spunk. When you thrust forward, fondling her, unburdened by restraint and inhibition, you cum ‘inside’ the fox-slut’s suffocating thighs, the rhythmic ejaculations teasing her pussy with a [pc.cumVisc], pulsing prize that it cannot claim. Bitter but not ingracious, her cunt squirts scalding passion on your meat.");
	var cum:Number = pc.cumQ();
	// pc Cum Low (<4000mL)
	if (cum < 4000)
	{
		output("\n\nYou forget everything when you let loose in a lust-drunk haze. " + (pc.cLength(cockIdx) < 12 ? "You can’t all the way through Bianca’s thighs, they’re simply too big for your [pc.cocksLight]. It leaves you wondering where your [pc.cumFlavor] creampie is going to end up. [pc.CumVisc] gouts spurt into her fathomless undercrotch, filling a reservoir of [pc.cumColor] seed that pries its way out, large goopy wads running down her legs." : "Just as Bianca cums, so do you. [pc.Cum] spills forth from your aching [pc.cockHeads], spurting into the air and landing in the ground. Again and again you fire off your load, held tight to the doctor, until you can’t resist plastering the compressed compartment.") + " Sliding in and out, you smear her legs in [pc.cumGem] slickness, pumping and humping your seed into the endless divots found on her malleable body.");
		if (pc.balls > 0) output(" A single handle wraps around your [pc.ballsNoun] to squeeze out the rest of your treasure with feather-light rubs.");
		output("\n\nEverything between her legs and your groin is soaked in copious jizz. Squeezing her ass, your " + (pc.hasCocks() ? "masts dribble" : "mast dribbles") + " out the rest of your load in slow, shallow strokes. Orgasm is prolonged in the vibrating interior of her cinching thigh-slit - you groan in the blissful ache of having your " + (pc.hasCocks() ? "manhoods" : "manhood") + " massaged in such a manner. Sated and satisfied, you rest your head upon her breast again, letting her carry you to the ground in quiet deference.");
	}
	// pc Cum High (<14000mL)
	else
	{
		if (pc.cLength(cockIdx) < 12) output("\n\nYour tender flesh is at once soothed in the warmth of Bianca’s cavernous thighs and scorched by billowing sperm. Because your [pc.cockHead] doesn’t emerge on the other side, the [pc.Cum] spurting out in the endless loops of thighflesh pools and bursts from the seam of her clamped hams. For a brief second you wonder if it bursts upwards into her pussy, perhaps graces her ovaries with what they must be needing most. Instead of holding your ground futilely, you pull back and thump her thighs, intent on getting as much of your seed onto her as you can.");
		else output("\n\nEuphoric exhilaration of passing huge gobs of [pc.cumGem] seed in the vice-like squeezing of a milfy fox’s thighs bounces off every inch of your brain. Your moans are muffled by the motherly slut’s mammaries, and while you pretend to stuff her with load after load of [pc.cum], you realize you don’t want your seed wasted. You want it on her, too.");
		output(" Building back to shallow strokes, you whimper like a puppy in her arms, firming yourself to her breast and pumping your hips in and out, uncaring of where you spray your [pc.cumVisc] jizz, only interested in staining her lower body with [pc.cumNoun].");
		output("\n\nHer tummy takes the impact of [pc.cumFlavor] spoo indulgently, every bend of her torso seemingly done to help the old and new webbings reach more of her. Your [pc.cocksLight] are throbbing on either side in complete ecstasy");
		if (pc.hasCocks()) output(", " + (pc.cocks.length == 2 ? "your second cock" : "an extra cock") + " fountaining a seed-glutted pillar of spoo into the underside of her tits");
		output(". Wobbling, your climax-dazed body gives up on the humping and begins to fall, but Bianca refuses you the comfort of unconsciousness, jacking your limitless reservoir out.");
		// pc Cum Hyper (>=14001mL) (add-on to High)
		if (cum >= 14000)
		{
			output("\n\nTurns out that being pinned between a milf and a hard place is just what the doctor ordered. Endless ejaculate bursts with all the magnitude of a geyser, crashing so hard into Bianca’s assets that it splatters back on you - something tells you that when you’ve moved on to rest, she’ll have licked it all off when you wake up.");
			if (silly) output(" What you’re blasting off is deserving of the title ‘violent semen inferno’.");
			output(" High-rise tides of seed buffet her within and without, lacquering her womanhood, her stomach, and most of her thighs in [pc.cumGem] layers. Meeting a woman like Bianca, a cum-slut at heart, and enjoying that nut-obsessed nature seems almost like a fantasy now. It’s not, and that’s what makes her a truly fantastic partner.");
			output("\n\nYour oceanic discharge comes to a close, and so does the curtain on your brain. You pass out with the knowledge that fucking her thighs is an experience you can’t wait to relive.");
		}
	}

	// PC Cums, reduce lust to 0
	pc.orgasm();

	addButton(0, "Next", finishedWithBiancasLegs);
}

public function finishedWithBiancasLegs():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' until shirt lifted comes.
	showBianca("NUDE");
	author("William");
	// processTime 7-16\rand minutes
	processTime(7+rand(10));

	output("The world returns to you just like that. Light, color, details, all the things that make up visual registry. Then comes feeling, breathing. Pain, the buzzing of arousal. Where are you... ah, yes. Where else would you be than cradled in " + (biancaLover() ? "three" : "two") + " golden tails. Snowy white tips brush painter’s strokes along your [pc.face]. Her doctor’s coat is draped over your body, " + (biancaLover() ? "three" : "two") + " tails covering the rest of it.");
	output("\n\n<i>“Good day, [pc.name],”</i> she recites.");
	output("\n\nYou tilt your head up to see her staring down... with flecks of cum smeared on her lips. Even when she licks over them, they remain, if a little faded. <i>“I... took the liberty of ensuring your presentability among others.”</i>");
	output("\n\nWhew. You think about standing up now, but the mirth of relaxing in her fluffy cradle is overwhelming. Throughout your ‘recovery’, as you quipped to her, you spend the time chatting the minutes away. Midway into conversation you forget you’re even lying there. For all you know, you could still be dreaming. Alas, it’s the pinch to your cheek that rouses you from laziness");
	if (!pc.isNude()) output(" and back into your gear");
	output(".");
	output("\n\nBianca finishes cleaning off with a wet napkin, spraying down with perfume -- she applies extra around her crotch for reasons that will only be immediately obvious to you. She’d accepted plenty of fresh, sticky loads that you can still sort of smell the leftovers of your spunk on her. Only a shower can finish that job!");
	output("\n\n<i>“I have to go, you understand,”</i> she caresses your cheek, kissing you on the lips long enough for it to be construed as more than a friendly gesture. <i>“But we will see each other again. Next time is something I’m very much looking forward to...”</i>");
	output("\n\nHow matter of fact!");
	if (biancaFamiliarity() >= 50) output(" You slap her on the butt, telling her that you’ll be needing much more when that time comes. Tilting her head, eyes furrowed behind her glasses, she simply says, <i>“I hope you’re up to it.”</i>");
	output("\n\nAfter rubbing your cheek, she departs into the unknown.");
	if (biancaFamiliarity() >= 50) output(" Oh yeah... you’ll be up for it.");

	addButton(0, "Next", biancaEncounterEnd); // Dump PC back in the game
}

public function rutBiancasThighs():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_work' until the sex.
	showBianca("WORK");
	author("William");
	// processTime 2-5\rand minutes
	processTime(8+rand(9));

	// First time doing the scene (if Rut)
	if (flags["BIANCA_SEXED_LEGS"] == undefined)
	{
		output("Bianca stops abruptly enough that you swear you hear a record scratch. After a second of silence, she inhales through her nose so hard that her face wrinkles. A line of spittle drools from her mouth, thickening when she turns her incredulous gaze to you. <i>“[pc.name]... this smell is... ah...”</i>");
		output("\n\nShe turns that over-aroused and suspicious gaze to your crotch, eyeing " + (pc.isCrotchExposed() ? "your [pc.cocks] in their unlocked breeding mode. Thick, heartbeat-powered pulses push out heavy, sagging globs of [pc.cumColor] prenut" : "the immense bulge hidden behind your clothing. Tidal waves of pre swell against the glorified condom, turning the peak of your phallic summit the darkest of shades") + ". Every blood duct stands out, spongy as the overwhelmingly engorged " + (pc.hasCocks() ? "cumveins." : "cumvein."));
		output("\n\nWhat’s getting to Bianca isn’t the rawest expression of breeding desire, it’s the <i>scent.</i> Maybe her foxen mods have given her a keener sense of smell to go with her animalistic bent. Regardless, her composure falls away when she sniffs again, groaning and squealing in half-sobs. <i>“Y-Y-You’re in rut! You’re... just an animal in heat!”</i> she squeaks, doing it again, again. <i>“I d-d-did not notice it until... mmm, this is... I shouldn’t be thinking this, but I want it so badly. So, [pc.name]... how about something new this time? I bet all you’re thinking of right now is seeding my womb like a thoughtless beast.”</i>");
		output("\n\nShe’s right; you nod, barely in control of yourself.");
		output("\n\nThe breathless fox crawls over your body, gripping your [pc.cockNoun], provoking it to swell excitedly against her palm, spreading her fingers with its titanium rigor. Her tails stroke your body absently, tensing and vibrating. <i>“You just want to breed me. You want to stake your claim on me.”</i> Her husky, sultry voice is full of cock-lust. <i>“How many kids could a single sperm cell of yours give me? Would you give me a new son, a daughter, maybe twins? Would you cultivate me to start your family..!?”</i> She grins and smashes her lips into your [pc.face], peppering supremely wet and warm kisses across your [pc.skinFurScales]. Every word she says is tearing away your semblance of humanity, summoning the mindless rapture of becoming an unthinking scion of reproduction.");
		if (biancaFamiliarity() < 50) output("\n\n<i>“You can’t do that.”</i>");
		else output("\n\n<i>“Not out here, and not like this.”</i>");
		output("\n\nThose words are a kick to the gut");
		if (pc.balls > 0) output(", maybe even the nuts");
		output(". <i>“But you’re going to come very close to it. Quite literally,”</i> she laughs, grabbing you by the hands and pulling you up. <i>“I’m going to give you a great opportunity, [pc.name]. But you will listen to me, understand?”</i>");
	}
	// Repeat time (pc Rut)
	else
	{
		output("<i>“This... you’re <b>that</b> way... hee hee,”</i> Bianca shudders, coming to a stop with a gluttonous glint in her violet eye. Before you can offer up any suggestion or insight she " + (pc.isCrotchExposed() ? "smashes her nose into your [pc.cockHeads]" : "falls nose-first into your immense crotch-bulge") + ", sucking the rut-infused air right from the source. <i>“Yes! Have you any idea how amazing this smell is!? Anyone who tells you that this is a terrible scent is a liar, [pc.name].”</i> Laying her head on your groin, she looks up to your eyes");
		if (pc.isCrotchExposed()) output(" around your girthy mass");
		output(". <i>“That would be a factless expression of jealousy. Now... I want you between my thighs again. Does that sound good?”</i>");
		output("\n\nYou nod, swallowing, growing harder with each passing moment. Your heartbeat pumps your titanium " + (pc.hasCocks() ? "boners" : "boner") + " against her nuzzling cheek");
		if (pc.isCrotchExposed()) output(", spurting [pc.cumColor] prejism up and into her hair");
		output(". Bianca flashes a lusty grin, skin beading with glistening wetness. Her sex drive is an unstoppable force of nature all on its own, as you’re finding out. The knowledge that your own ramped up libido has driven her into a scarcely contained frenzy is flattering - you love that she can always match your desire so well!");
		output("\n\n<i>“Good... because, and call me crazy...”</i> she stands, boobs jiggling, dragging you to your [pc.footOrFeet] and head-first into her boobs, <i>“...but I think having my thighs bred like that is just as good as if I were to allow you to sire children from me. Just keep that thought in mind,”</i> she husks, grinding against you until you’re at full mast. <i>“I want you to think about splitting me apart, I want you to think about training my vagina to please only you. " + (biancaFamiliarity() >= 50 ? "If you keep this up, that day may come sooner than you think. But for now, t" : "T") + "his is what I want.”</i>");
		output("\n\nGrinning widely, she clutches your [pc.hips]. <i>“I’m a beast tamer, [pc.name]. My husband was the perfect opportunity for me to train myself. I’m going to drain you of everything until you collapse whimpering.”</i>");
		output("\n\nThere’s a flash of shimmery purple behind her glasses’ lens. <i>“And then I’m going to do it again.”</i>");
	}
	output("\n\nThere’s no telling what you’re capable of like this, itching to slake your body’s boundless lust in the valance of her impossibly plush thighs or the enticing acres of her pheromone mitten. At Bianca’s <i>command</i> you stay still. Her enticing, mesmerizing form captivates you, occupies your every thought. Synapses only fire off pillar-engorging urges of breeding and mating like horny bunnies. Mating with her <i>is just so right and natural.</i> Unfortunately, it’s not quite the order of business here, no matter how badly your body wants it.");
	output("\n\nSquatting down, the fox-slut " + (pc.isChestExposed() ? "gazing" : "rips away your clothing in short order, freeing and gazing") + " at your twitching [pc.cockHeads]. She’s swaddled in a faceful of powerful musk that threatens to impregnate her from scent alone. Her licks are soft and teasing, growing increasingly lusty until she suckles outright from the [pc.cumVisc] terminus.");
	output("\n\n<i>“It’s... iiiiittt’s.... aghhh...”</i> The belly-rumbling groan she gives is so profound that it sounds like the last breath in a dying man’s throat. It’s an overcharged, husky, sexy tone that gorges your already strained [pc.cocksLight] with phallus-fattening emissions of [pc.cumColor] precum. She opens wide to catch the tasty offering, establishing a feedback loop that soon has her face lacquered in sticky lube. <i>“It’s been so long... so long...”</i>");
	output("\n\n<i>You want</i> her so fucking badly. <i>You want</i> to peel away her clothes, expose those big titties, liberate her fertile cunt and bury yourself in its subterranean depths. <i>You want</i> to pack her fuckbox like the frenzied [pc.raceShort] you are until your rut ends and signals the beginnings of her pregnancy. [pc.Hands] balled into fists, you buck instinctually, slapping your bloated " + (pc.hasCocks() ? "rods" : "rod") + " off her cheek");
	if (pc.balls > 0 && pc.ballSize() > 4) output(" and clapping your [pc.ballsNoun] into her chin");
	output(". For a transient, cock-drunk second, Bianca shudders in delight and lays worshipful kisses upon your [pc.cockType] length.");
	output("\n\n<i>“I can’t waste any time with you, then,”</i> she says, launching up and seizing you by the head. <i>“This is hard for me, too, [pc.name]. Nothing makes me happier that you’re this way, that you look at me full of savage desire.”</i> Her thumbs dig painfully into your red-hot cheeks. <i>“But we must not become true animals just for the sake of it. I’m helping you this time, remember that. If you listen to me... you get to cum. Your orgasm will be the envy of your peers and countless industries. I want you to satisfy us with this bestial aggression. Do as I say for a moment longer. What you’re about to experience is going to be a taste of what it truly means to <b>want.</b>”</i>");
	output("\n\nAchingly tender from the broken promise of oral service, all the veins on your " + (pc.hasCocks() ? "hardons" : "hardon") + " stiffen outward, leaving you in a dry and painfully thick state. Watching Bianca step back from you is an agonizing prospect on top of your priapistic case of rut-boner. Growling and shaking and whimpering, no amount of raging lubricant soothes the burn of being left alone, even if it is for such a short period of time.");
	output("\n\nKeeping your half-closed eyes on Bianca is non-trivial, as is not jacking off and giving into wanton selfishness. In the most impatient and petulant manner, she tears her coverings away - the knowledge that she is in a state similar to your own lends you an enduring motivation. What she does next to your sex-crazed brain is what a gunshot near the ear would... she throws off her white coat and rips off her pants and, turning her back to you, <b>lifts her sweat-lacquered ass like a submissive dog,</b> willing her " + (biancaLover() ? "three" : "two") + " tails out of the way to lay bare a majestic vista.");
	output("\n\n<i>Holy. Shit.</i> A void - a black hole - a vacuum of air - whatever! Something inside tears open, sucking out self-control, reason, worries, thoughts... an endless silence exists like the unknowable beginnings of the universe. With all your faculties vanishing into an internal ether, the overriding need for breed assumes control of your hippocampus, spreading the all-encompassing instinct to fuck and breed, subsuming your every addled movement. Evolution, hormones, nature... these constant elements of life all coalesce into the microcosm that is you right here, right now, and they’re all saying, no, chanting.... NO! They’re <b>DEMANDING</b> THAT YOU OBEY THEIR PRIMORDIAL DIRECTIVE!");
	output("\n\nHer ass is... what can you even say? It’s huge. You could sink your face into her butt never to return. Rescue parties would suffer- <i>enjoy</i> a similar fate, wandering a never-ending landscape. To the shock of the galaxy at large, her straining panties manage not to snap on every stitch-rending tremble of twin-summit mount Everest. The picture perfect peach proportion pulls your soul into horizons unknown. Boundlessly wide curves of mouthwatering hips and thighs tell you that no other human could so naturally be this suited to bearing children. ");
	output("\n\nWhatever God’s out there should save you, because you’ve been given the worst temptation at the worst possible time - a lifetime of damnation would be worth it to make that ass <i>yours.</i> It’s so strong that you feel your heart battering your chest like a prisoner attempting brute-force escape, buffeting against every rib in the cage.");
	output("\n\nStaring at Bianca on the edge of mental collapse, your eyes cross blearily at the glint of feminine fluids pooling and dripping through her black-and-pink underwear. How in however many Hells are you expected to maintain control? Wait, you promised to. That’s why you will. She trusts you not to do anything untoward!");
	output("\n\nBent at the waist, the fox-wife beckons to you, no hint of reticence in her long-awaited call. <i>“Here you go, [pc.name],”</i> she pats her scopeless vista, stroking the cheek-depressing hand down to her drooling cunt and non-existent thigh-gap. The thin, crystalline landscape is what truly compels you. <i>“Put your " + (pc.hasCocks() ? "cocks" : "cock") + " here,”</i> she stretches her stance, <i>“and let it all go.”</i>");

	// PC lust maximizes
	pc.maxOutLust();

	addButton(0, "Next", rutTheFoxDoItNow);
}

public function rutTheFoxDoItNow():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' unless we get shirt lifted
	showBianca("NUDE");
	author("William");
	// processTime 9-22\rand minutes
	processTime(9+rand(14));

	var cockIdx:int = rand(pc.cocks.length);

	output("Succumbing to the writhing within, you’re shivering violently as you fight the desire to stick it in. On your way over you’re assaulted by involuntary spasms and thrusts. Balancing yourself is no longer possible... not without her. There’s only one way to handle this, and that’s to go all in all at once. One quick to-the-hilt thrust, hard as you can, fierce enough to swell your [pc.knotBallsHilt " + cockIdx + "]. You can’t swallow fast enough to avoid drooling like a rabid dog, but you’re nearly there; it’s time.");
	output("\n\nYou complete your march, allow your [pc.cocks] to hover an inch from contact. Just penetrating her overheated ozone was almost enough to wreck you. Gulping hard and shaking your head, you breathe heavily in through and out your nose, readying yourself to clutch the doctor’s waistline in a death grip that won’t relent until you’ve drained yourself in the sleeve. When all your cum is gone, your brain will suffice for the final orgasm.");
	output("\n\nIn this savory ceremony your entire body quivers uncontrollably, the tension inside like a taut bowstring held stretched for too long. You couldn’t be readier to grab the fox in a needy hug and take this important plunge. Hyperfocused on her curvesome, rocking derriere, you finally do it -- your [pc.fingers] dig into her hips and you thrust your [pc.cocks] into her thighs like a racehorse barreling out of the starting gate.\n\n");
	// imagePack: embed octomush Bianca Thigh Sex pic here
	showImage("bianca_octomush_thighSex");
	output("Clapping into Bianca’s waist, you howl in a mix of sweet agony and sinful pleasure, breaths turning to half-gasps and hyperventilations that’d get you mistaken for choking. In the haze of thought-depriving pleasure you smush yourself against the doctor’s spine, contouring to her frame and planting your hands at her tummy, struggling to cope with clenching tension of meaty, inescapable haunches.");
	output("\n\nHer hands touch to yours and grip to your knuckles in support; she urges you on. Her voice, the words indecipherable, <i>begs</i> you to hump her as hard as you can. A submissive storm of femme-cum pours atop your [pc.cockType " + cockIdx + "] shaft, enabling you from the start to fuck her with superhuman vigor. The scent of it drives you further into your rutting frenzy and further away from a sensible reality.");
	output("\n\nHauling ferociously in and out of her thigh-pussy smears her sex and stomach with [pc.cumVisc] slime, creating a frictiously blissful pathway. Her broad booty is put through its proper paces too, graciously accepting the impacts of your lust-thickened firmness. Premature gouts of [pc.cumNoun] squirt out, often times into her depraved hand. ")
	if(pc.cLength(cockIdx) < 12) output("Sadly, with your size, you aren’t able to emerge on the other side of her matronly thighs. Your ecstatic jackhammering instead impregnates her legs with [pc.cumColor] spooge. Pockets of the stuff form that subsequent thrusts burst like water balloons, the messy liquid arcing out front and back.");
	else output("It takes you longer than you’d care to admit to realize Bianca’s palm is caressing your [pc.cockHeads] on " + (pc.hasCocks() ? "their":"its") + " emergence beyond her crushing vale. The narrow terminus of her hand awaits the peak of your stride, simulating the feeling of battering against the natural limits of a partner’s biology. A jet of [pc.cumColor] seed impregnates her grip, and the lewd suckling you hear near her mouth is something you don’t miss.");
	output("\n\nAmidst the malevolence of your biological clock, the pleasure you derive from driving into the cushiony crevasse of Bianca’s thighs is truly out of this world. They’re so fucking <i>soft,</i> softer than marshmallows, softer than alien silk, and you’ve got this soaked sleeve all to yourself howisthissoSOFT!?");
	output("\n\nYou’re so close to orgasm, but you’re not worried about blowing early - there’s no such thing as a refractory period when there’s bitches to knock up. The intense pressure of her pillowy expanse threatens to knock you off balance and take you both to the ground. To defeat that particular crisis, you bite down on her, eliciting a yelp - a surprised cry, for you’re chewing more clothing than skin anyway.");
	// Multicock
	if (pc.hasCocks())
	{
		output("\n\nIn a fleeting moment of clarity you realize that you can do more for yourself in this position -- her ass is yours to play with as much as you want, and you have more than one turgid dick for just that purpose. It’s about to go on its own special journey. You " + (pc.cocks.length == 2 ? "move your twin cock" : "separate one of your extra cocks from the rest") + " and brace it at the base of her posterior cleavage, pushing the shaft inside with the heel of your [pc.hand]. Her planet-sized cheeks part for your invading girth, bulging apart and slowly sinking back over to submerge your breeding meat.");
		output("\n\nThe otherworldly pressure of her thighs and doughy rump at once reaches a toe-curling plateau. Her backside bulges with the presence of your polished knob jiggling dangerously around your rapid-thrusting prick, each [pc.knotBallsHilt " + cockIdx + "]-deep thrust setting off joyful gasps from the permissive physician.");
	}
	output("\n\nYou’re sliding out and plowing back inside so fast that neither of you can feel anything but full. Thick lines of ejaculate smear everywhere without actually disconnecting from your bulging " + (pc.hasCocks() ? "urethras" : "urethra") + ", making it possible to legally label you a spermy hydrant. Your [pc.cocksLight] split her sprawling estate, intent on filling their side with a family. If " + (pc.hasCocks() ? "one of your musky members" : "your musky member") + " would just happen to <b>slip</b> inside of her lady-garden, it could happen, it could happen so-");
	output("\n\nNo! No, no! " + (biancaFamiliarity() ? "You promised not to penetrate her." : "That’s not what you’re here for, this is no way to do that!"));
	output("\n\nFeet planted to the ground, Bianca winds her tails around you back like a cloak. Your embrace tightens harder in response, so much so that your muscles protest a very real soreness. With reckless abandon you knead her legs against your diamond-hard [pc.cocksLight]. Muffled vocals come from her, but you can’t make them out.");
	output("\n\nTurns out she was bracing herself. Why, you’re not sure yet, because all you grok is the gradual realization that her ass is a divine cushion sent from another reality to relieve every <i>fucking</i> fuckstinct from your mind, and you plan to enjoy it as long as possible. To your delight, she subtly moves into a more fuckable position. Your thrusts-per-minute ramp up " + (pc.race() == "laquine" ? "by double digits - nobody should expect any less from a laquine!" : "laquine-tier, and may the smut gods have mercy on any bunny broodmom who sees you now.") + " Pounding against the rolling hinterlands of Bianca’s valley fills you with pride and virginal delight. The cheeks clap, and if there was any snow to be found at their peaks, you’d trigger an avalanche. As it is, your crotch sets off one epic buttquake after the other.");
	output("\n\nAlways looking for ways to keep you guessing or to match your output, Bianca does something that changes this scenario entirely. You feel both of her hands slip from yours on a crucial quest. The nature of their task isn’t immediately clear - you haven’t been able to see for a while now, and all you’re getting on by is sound and touch. Yet what you <i>feel</i> alerts your mind to the unthinkable.");
	output("\n\nShe just parted her panties, and now her pussy is rubbing against " + (pc.hasCocks() ? "the [pc.cock " + cockIdx + "] nearest to her vulva." : "your [pc.cock " + cockIdx + "]."));
	output("\n\nCold air infuses your every vein in that gasping discovery, and now you’re moaning so loud that your passionate cries could wake the dead from internment. You shriek and whimper Bianca’s name like a lost child their mother, the additional stimulation of a bitch’s hole leading to an inhuman strain that you simply cannot cope with. It’s an endless paradox: you must fuck, but you can’t fuck; reason is absent, but you adhere to your devotion. ");
	output("\n\nSomehow, for as fast as you’re humping her, you get even faster, buffeting her like the spin of a minigun (and even firing off thin ropes of [pc.cumNoun] to complete the image) in the shortest and quickest of luscious strokes. Maybe it’s the bulging clit rubbing your shaft like a nubb pussy, or the fingertips caressing [pc.eachCockHead]. Her robing tails pull you tighter into her accepting body, making sure you never think of leaving.");
	// Balls
	if (pc.balls > 0)
	{
		output("\n\nBecause you’re rowing through Bianca’s soupy depths on hyperdrive, your [pc.ballsIsAre] are trapped in a vibrating loop of motion. They can’t swing forward and they can’t swing back, they just jostle in perfect harmony with the laws of physics. You achieve a zen so incredible that the invisible hands of nature itself are teasing your rut-swollen sack into producing the greatest load it can, ignorant to the fact your [pc.cumNoun] reservoir is being blessed in preparation for a mind-freeing anointment.");
		output("\n\nYour loving fox can feel it. Maybe she can smell it. There’s so much boiling inside your " + pc.mf("kingly", "queenly") + (pc.balls > 1 ? " nuts" : " nut") + " that the weight drags you closer and closer to the ground. Your [pc.sackTexture] ballsack sags and quivers and clenches and contracts in an untouched pocket of space it has to itself. Deep down you’ll always remember this moment, floating on a cummy ocean while your brain rocks on the gentle waves of Bianca’s musk. Anxious energy flows through their engorged measurements, your internal plumbing making ready to deposit a meadow-seeding payload.");
		output("\n\nUnfortunately, you remind yourself again, it’s not <i>that</i> kind of meadow...");
	}
	output("\n\nScreams of lung-collapsing volume terrify the planet and the local fauna close enough to hear your desperate coitus. The feel of her honeypot oozing directly against your [pc.dickSkin " + cockIdx + "] is... it’s...");
	output("\n\nAll of a sudden, you slam into her and nearly throw her free. Despite the wordless ruthlessness you’ve fucked her up to this point, she relaxes into your hold, and you can hear (for once) her words: <i>“Everything, [pc.name]! Cum for me! Cum!”</i>");
	output("\n\nBianca’s crushing, wobbling haunches are too much for your bliss-sore [pc.cocksLight]. All sensations in your body compact into a single, shunting urgency that begins at your navel, dives into your groin, and ignites your virility in a single, U-shaped maneuver; Bianca’s orgasm comes a second ahead of yours, and her one and only squirt plasters your manhood in slavish adoration.");
	if (pc.hasKnot(cockIdx)) output(" Your swollen breeding bulb breaches her buttocks in a faux siring attempt.");
	if (pc.balls > 0) output(" Pressure-narrowing ducts pull on your [pc.ballsNoun], ascending " + (pc.balls == 1 ? "it" : "them") + " closer to your crotch to power the impressive ejaculation coming.");
	output(" Painful, strained orgasm wipes your brain of all coherency.");
	var cum:Number = pc.cumQ();
	// pc Cum Low (<5000mL)
	if (cum < 5000)
	{
		output("\n\nThe fox bucks back against your [pc.hips] when she feels the first vein-swelling batch of [pc.cum] ride your delicate line and burst out " + (pc.cLength(cockIdx) < 12 ? "between her legs" : "into the open") + ". Irrepressible excitement creampies her thighs on your shallow, disorganized strokes. Raging breeding urges blast in streams greater than most race’s unmodded orgasms, drawing [pc.cumColor] lines through the air. With heavy, panting motions you smear Bianca’s pussy in your output");
		if (pc.hasCocks()) output(", spooging her lower back in divided [pc.cumGem] treasure");
		output(". Liquid warmth spills forth until, mercifully, it ends, and you’re dryly humping the sexy slut’s smothering legs.");
	}
	// pc Cum High (<12000mL)
	else
	{
		output("\n\nThe initial spurt of [pc.cum] from your rut-sore [pc.cockHead " + cockIdx + "] is a jism javelin that breaks through Bianca’s crushing depths and splatters the local flora, followed by another, another... and that’s when the surge multiplies. Irrepressible heat flows in cock-straining amounts, Bianca riding your orgasm like a horse-mounted jockey. She bucks on your spilling bronco, smearing her inner thighs, the lips of her cunt, and just about everything in a foot-wide radius in your cummy output. Spermy smears of [pc.cumColor] seed splatter up and down");
		if (pc.hasCocks()) output(" and across her spine from your derriere-holstered schlong");
		output(". Orgasmic gouts of urethra-inflating spooge saturate the slut-doctor’s form in liquid warmth.");
		// pc Cum Hyper (add-on to High) (<20000mL)
		if (cum < 20000)
		{
			output("\n\nYour [pc.cumVisc] violation is far from over. Despite the pool of [pc.cumGem] goo forming in the divot of her back, you stiffen with renewed strength");
			if (pc.balls > 0) output(", your [pc.sack] lurches");
			output(", tensing against her again and fountaining your ardorous rut all over the place. Torrential spouts launch skyward and rain down upon her like bolts of holy lightning. Fuzzy ears, golden hair, white-tipped tails, everything that is Bianca is stained with incredible amounts of spunk. Fresh ropes of the stuff lance out when you pull back, breaking apart against her butt cheeks, marking earmarking her ass as your cum-dump.");
		}
		// pc Cum OMEGA! (add-on to Hyper) (>=20001mL)
		else
		{
			output("\n\n[pc.Cum] flows freely when you most need it. In a thoughtless and unseeing haze you push Bianca to the ground until she’s on all fours, hosing her down uncaringly in your relentless [pc.cumGem] gallons, cocooning her in the bestial lust you’ve been imbued with. You can only imagine what she’d look like if you had pumped all of this into her, if you had given her ovaries the chance to gluttonously feast on this milf-making buffet of prostate-fatiguing eruption. Anybody who comes upon this now would only see a cummy mound resembling a person, a rubbery cream-covered sex-toy.");
			output("\n\nTruth is often stranger than fiction.");
		}
	}
	output("\n\n<i>“My, my...”</i> Bianca huffs after your voice finally settles. Once the last jet of cum has rent your sore, swollen cockslit, you stumble backwards through her tails, already slipping into a scorchingly painful state of unconsciousness.");
	output("\n\n<i>“[pc.name]!”</i> Bianca cries, barely catching you by the wrist. Just before you pass out, your vision is filled with speckled violet worry.");

	// PC cums, reduce lust to zero.
	pc.orgasm();
	// PC becomes 'Very Sore'!
	soreChange(10);

	addButton(0, "Next", biancaRutOver);
}

public function biancaRutOver():void
{
	clearMenu();
	clearOutput();
	// load bust 'bianca_nude' unless we get shirt lifted
	showBianca("NUDE");
	author("William");
	// processTime 120 minutes
	processTime(120);

	output("Your dreams are... very fluffy. A sea of golden-white tails bed you in their infinitely fuzzy embrace, carrying you on gentle tides of soothing contentment. Luckily for you. The last thing you felt was an unbelievable pain just before you found yourself in Floofy Elysium. The golden sun looking down on you from a cloudless blue sky brightens until everything goes white. Everyone has to wake up sometime...");
	output("\n\n<i>“[pc.name]... shhh... don’t move too quickly,”</i> you hear.");
	output("\n\nYou’ve awoken an indeterminate time later, immediately feeling hollow. Sure, you feel refreshed having had a power nap, but the drained, painful soreness in your muscles is the most keenly felt reminder of your");
	if (flags["BIANCA_CONFRONTED"] != 1) output(" adulterous");
	output(" activities. Cobwebs snap as your sight adjusts to the overhead sun... er, head of your tender doctor.");
	output("\n\nHead in her lap, you now realize... you can’t move. A canteen of water is brought to your lips, the stannically tinted sloshing of liquid inside a pleasant sound. Cold liquid is nursed to you in gradual amounts, blessedly rejuvenating your muscles in fluid relief. Geez, you can still smell everything, too...");
	output("\n\n<i>“How long was I out?”</i> you ask.");
	output("\n\n<i>“Two hours, give or take,”</i> Bianca whispers, stroking your reddened cheek.");
	if (pc.isNice()) output("\n\n<i>“I’m sorry, Bianca!”</i> you stammer, nearly shouting in embarrassment.");
	else if (pc.isMisch()) output("\n\n<i>“Sorry to hold you up so long,”</i> you frown.");
	else output("\n\n<i>“Didn’t mean to take up your entire day like that,”</i> you sigh.");
	output(" She merely giggles.");
	output("\n\n<i>“It was fun for me. All told, that was very impressive, [pc.name]. I almost worry for anyone sharing a bed with you,”</i> she quips, leaning down. <i>“Because... they probably won’t know how to handle your fallout.”</i>");
	if (biancaFamiliarity() >= 50) output("\n\nYou ask her if she thinks she could. Her only response is to wish you luck. Curious!");
	output("\n\nYou chuckle a little bit, but the pain in your chest puts a stop to strenuous vocalization. In a few minutes you’re able to at least sit up, heaving a sigh and rubbing your joints. Fuck, everything is sore! And your crotch is... how can’t you remember anything now? Bianca engages in some pro-bono physical rehab, helping you stand with some acute balance issues that eventually fade. Your [pc.legOrLegs], no, your entire lower half just feels <i>sore,</i> like it refuses to accept any signal from your brain.");
	output("\n\n<i>“Hehe... looks like you need something for that. Here, this painkiller will take the edge off, but you should get some sleep as soon as possible, [pc.name].”</i> Bianca hands you her canteen and a pill that you don’t even bother inspecting. You can trust her fully. <i>“I’ve got to go, but we will see each other again. I promise. Take care of yourself,”</i> she gives a cute wink, wandering off in a random direction.");
	output("\n\nOne exhale later, you finally feel ready to walk. You gather yourself and move on from this semen-tainted loam.");

	// Reduce 'Very Sore' to 'Sore'.
	soreChange(-5);
	biancaSexed("LEGS");

	addButton(0, "Next", biancaEncounterEnd); // Dump PC back to the game
}