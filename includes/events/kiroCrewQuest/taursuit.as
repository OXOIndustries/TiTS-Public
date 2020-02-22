//Taursuit enemy for Kiroquest brought to you by the letter: Wsan.
public function showTaursuit():void
{
	showName("CENTAUR\nSUIT");
	showBust("TAURSUIT");
}
public function taursuitsBonusFunz():void
{
	author("Wsan");
	showTaursuit();
	output("\n\nYou approach a hallway when you hear an extremely out of place sound in the relative silence of the freighter");
	if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES)) output(" - one you happen to know quite well yourself");
	output(". The sound of hooved feet, clacking metallically from around the corner. The rhythm is steady and plodding, like a machine, and you’re already braced for a fight when the ‘opponent’ trundles around the corner.");

	output("\n\nIt’s... half a centaur. There’s no other way to describe it. The creature has four hollow hooved legs, a front and a back half, and absolutely nothing above them. It looks a little bit like a tauric exosuit, but it seems to be moving well enough on its own. If nothing else, it possesses autonomy.");

	if(!(pc.legType == GLOBAL.TYPE_EQUINE && pc.hasLegFlag(GLOBAL.FLAG_HOOVES) && pc.legCount == 4))
	{
		output("\n\nIt stops at the junction of the hallway and you imagine in your mind’s eye a deer sniffing the air, considering its options. It begins turning, wobbling unsteadily, and you raise your [pc.rangedWeapon] as it orients itself towards you. Instead of charging, though, it takes a halting step forward towards you. Then another, and another. You’re not wholly certain of its intentions, but given that it exists on this accursed ship, it’s <i>probably</i> hostile in some form or another.");
		//[Fight!] [Pet?]
		clearMenu();
		//set up all the combat jizz here.
		
		clearMenu();
		addButton(0,"Fight",startTaursuitFite,undefined,"Fight","There’s no way this thing isn’t out to harm you somehow!");
		addButton(1,"Pet",petTheTaursuit,undefined,"Pet","Maybe you could try petting the thing...");
	}
	else
	{
		output("\n\nIt halts when it ‘sees’ you, orienting itself towards you - and then prostrating itself in the oddest fashion, <i>bowing</i> to you by dipping its front legs down! It continues this odd little ritual as it approaches, stopping every five feet to bow until it’s standing in front of you. Something tells you it’s completely harmless, and you reach out to touch it.");
		output("\n\nThe peculiar little artificial beast leans into your fingers, affectionately rubbing itself up and down like a furred housepet might, and slinks around your forelegs, brushing its side against you. It circles around you a few times while you watch nonplussed, feeling it softly bump its ‘head’ against your legs. Eventually, it departs and clops off down a corridor, apparently satisfied with the meeting.");
		output("\n\nHow odd.");
		processTime(2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	IncrementFlag("KQ_MET_TAURSUIT");
}
public function startTaursuitFite():void
{
	var tEnemy:Creature = new Taursuit();
	setEnemy(tEnemy);
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(youBeatUpATaursuit);
	CombatManager.lossScene(loseDatCumbat);
	CombatManager.displayLocation("TAURSUIT");
	CombatManager.beginCombat();
}

//[Pet?]
//tooltip:Maybe you could try petting the thing...
public function petTheTaursuit():void
{
	clearOutput();
	showTaursuit();
	author("Wsan");
	output("You gingerly extend a hand towards the creature and it takes one more step forward, extending its front just enough to give you the overwhelming sensation that there’s an invisible neck craning downwards to sniff at you. After a second it seems to accept you, leaning forward to ‘nuzzle’ at your hand. Rubbing its smooth, metallic chest against your fingers, you suddenly become aware of the secret lying inside it - it’s full of little grasping tentacles!");
	output("\n\nThey grope at your hand, stroking your arm like little cilia. It seems to want to draw you in deeper...");
	processTime(2);
	clearMenu();
	addButton(0,"Resist",resistTheTaursuit,undefined,"Resist","Pull your arm back. No way you’re letting this happen!");
	addButton(1,"Submit",submitToTheTaursuit,undefined,"Submit","Let yourself be guided into the taursuit.");
}

//[Resist]
//tooltip:Pull your arm back. No way you’re letting this happen!
public function resistTheTaursuit():void
{
	clearOutput();
	showTaursuit();
	author("Wsan");
	output("You pull your arm back from the taursuit’s grasp, drawing its apparent ire! It seems like it <i>really</i> wanted you to join it, and now it’s angry!\n\n<b>It’s a fight!</b>");
	processTime(1);
	clearMenu();
	addButton(0,"Fight",startTaursuitFite,undefined,"Fight","There’s no way this thing isn’t out to harm you somehow!");
}

//[Submit]
//tooltip:Let yourself be guided into the taursuit.
public function submitToTheTaursuit():void
{
	clearOutput();
	showTaursuit();
	author("Wsan");
	if(pc.isTaur()) output("Well, you’re already tauric as it is... it’s not going to be hard or uncomfortable to fit. In fact, it already seems to be exactly your size.");
	else output("It doesn’t seem like it’ll be too uncomfortable to fit inside. In fact, as you gingerly step into the slots for its hindlegs, you note it seems to fit you quite well already.");
	output(" The suit draws a little more taut as you sink deeper, its insides sticking to yours by way of suction.");
	if(!pc.isTaur()) output(" Already your [pc.legOrLegs] " + (pc.legCount > 1 ? "have":"has") + " been wrapped in the shimmering metallic “skin” of the suit, leaving you to contemplate leaning forward and plunging your hands into the foreleg slots.");
	else output(" Already your [pc.legOrLegs] " + (pc.legCount > 1 ? "have":"has") + " been wrapped in the shimmering metallic “skin” of the suit and you’re left contemplating fully committing to the experience.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",getTFedByTheTaursuit);
}

//TF scene
//No willpower check but no bad end either.
public function getTFedByTheTaursuit():void
{
	clearOutput();
	showTaursuit();
	author("Wsan");
	if(pc.isTaur()) 
	{
		output("Fuck it, there’s no backing out now. You lean forward and let the suit slowly wrap around you, capturing you within its sticky grasp and pressing against you. Your forelegs sink deeper into the container, an errant murmur slipping from your [pc.lipsChaste] as the bottom surface of the suit rises to meet your underside. It lovingly wraps around");
		if(pc.isHerm()) output(" your [pc.cocks]" + (pc.balls > 0 ? ", [pc.balls]":"") + " and your [pc.pussies], tightly enclosing you within its ‘skin’ and squeezing you gently.");
		else if(pc.hasCock() && !pc.hasCocks())
		{
			output(" your [pc.cock]" + (pc.balls > 0 ? " and [pc.balls], tightly enclosing you within its ‘skin’ and squeezing you gently.":", tightly enclosing you within its ‘skin’ and squeezing you gently."));
		}
		else if(pc.hasCocks())
		{
			output(" your [pc.cocks]" + (pc.balls > 0 ? " and [pc.balls], tightly enclosing you within its ‘skin’ and squeezing you gently.":", tightly enclosing you within its ‘skin’ and squeezing you gently."));
		}
		else if(pc.hasVagina() && !pc.hasVaginas()) output(" your [pc.pussy], squeezing your lips tight as they’re enclosed within its ‘skin’.");
		else if(pc.hasVaginas()) output(" your [pc.pussies], squeezing your sets of lips tight as they’re enclosed within its ‘skin’.");
		else output(" your smooth underside, applying itself like a pleasant, warm paste across your [pc.skinFurScales].");

		output("\n\nIt feels like the suit is <i>stroking</i> you, its strange tentacles rubbing you down while it continues its path upwards. You moan quietly when it encloses your [pc.ass], pressing in on your [pc.asshole] with the same ardor with which it coils around your [pc.thighs]. Stars, it certainly knows how to treat you - you feel like you’re being caressed by a lover, welcomed home, and given passionate kisses all along your shivering underbelly for good measure.");
		output("\n\nThe further it gets up your body, the more intense it all seems. By the time it reaches your");
		if(pc.biggestTitSize() >= 1) output("[pc.breasts]");
		else output("[pc.chest]");
		output(", the biosuit is undulating across every" + (pc.hasGenitals() ? " inch of your nethers":" last inch of your asshole") + " in a manner suggesting that it wants you to cum, and cum hard. When the advance of the meshing material reaches your [pc.nipples] you can stand it no longer - with a moan much louder than you intended,");
		if(pc.isHerm()) output(" you begin to let out what feels like every drop of [pc.cum] in your " + (pc.balls > 1 ? "pulsing balls":"body") + " from the end of your flexing cock" + (pc.hasCocks() ? "s":"") + ". Your puss" + (!pc.hasVaginas() ? "y":"ies") + " squirt, drip and dribble femcum into the suit to match and you’d swear up and down the suit begins to suck on your [pc.clits] during the carnal act, encouraging you further.");
		else if(pc.hasCock() && !pc.hasCocks()) output(" you begin to let out what feels like every drop of [pc.cum] in your " + (pc.balls > 1 ? "pulsing balls":"body") + " from your [pc.cockHead], and you’d swear up and down the suit starts jacking you off harder.");
		else if(pc.hasCocks()) output(" you begin to let out what feels like every drop of [pc.cum] in your " + (pc.balls > 1 ? "pulsing balls":"body") + " from the ends of your flexing cocks, and you’d swear up and down the suit starts jacking you off harder.");
		else if(pc.hasVagina() && !pc.hasVaginas()) output(" you squirt, drip and dribble femcum into the suit, and you’d swear up and down the suit begins to suck on your [pc.clit] during.");
		else if(pc.hasVaginas()) output(" you squirt, drip and dribble femcum into the suit, and you’d swear up and down the suit begins to suck on your [pc.clits] during.");
		else output(" you suffer a confusing orgasm reminiscent of trying to punch someone in a nightmare, your [pc.hips] jerking back and forth and doing nothing but holding the pleasure in.");
		output(" By the time you’ve finished cumming, red-faced and sweaty, the suit has reached your neck and you start to feel it... <i>changing</i> you.");
	}
	else
	{
		output("Fuck it, there’s no backing out now. You lean forward and let the suit slowly wrap around your arms, capturing you within its sticky grasp and pressing against you. Your limbs sink deeper into the container, an errant murmur slipping from your [pc.lipsChaste] as the bottom surface of the suit rises to meet your underside. It lovingly wraps around");
		if(pc.isHerm()) output(" your [pc.cocks]" + (pc.balls > 0 ? ", [pc.balls]":"") + " and your [pc.pussies], tightly enclosing you within its ‘skin’ and squeezing you gently.");
		else if(pc.hasCock() && !pc.hasCocks()) output(" your [pc.cock]" + (pc.balls > 0 ? " and [pc.balls], tightly enclosing you within its ‘skin’ and squeezing you gently.":", tightly enclosing you within its ‘skin’ and squeezing you gently."));
		else if(pc.hasCocks()) output(" your [pc.cocks]" + (pc.balls > 0 ? " and [pc.balls], tightly enclosing you within its ‘skin’ and squeezing you gently.":", tightly enclosing you within its ‘skin’ and squeezing you gently."));
		else if(pc.hasVaginas() && !pc.hasVaginas()) output(" your [pc.pussy], squeezing your lips tight as they’re enclosed within its ‘skin’.");
		else if(pc.hasVaginas()) output(" your [pc.pussies], squeezing your sets of lips tight as they’re enclosed within its ‘skin’.");
		else output(" your smooth underside, applying itself like a pleasant, warm paste across your [pc.skinFurScales].");

		output("\n\nIt feels like the suit is <i>stroking</i> you, its strange tentacles rubbing you down while it continues its path upwards. You moan quietly when it encloses your [pc.ass], pressing in on your [pc.asshole] with the same ardor with which it coils around your [pc.thighs]. Stars, it certainly knows how to treat you - you feel like you’re being caressed by a lover, welcomed home, and given passionate kisses all along your [pc.stomach] for good measure.");

		output("\n\nThe further it gets up your body, the more intense it all seems. By the time it reaches your [pc.fullChest], the biosuit is undulating across every" + (pc.hasGenitals() ? " inch of your nethers":" last inch of your asshole") + " in a manner suggesting that it wants you to cum, and cum hard. When the advance of the meshing material reaches your [pc.nipples] you can stand it no longer - with a moan much louder than you intended,");

		if(pc.isHerm()) output(" you begin to let out what feels like every drop of [pc.cum] in your " + (pc.balls > 1 ? "pulsing balls":"body") + " from the end of your flexing cock" + (pc.hasCocks() ? "s":"") + ". Your puss" + (!pc.hasVaginas() ? "y":"ies") + " squirt, drip and dribble femcum into the suit to match and you’d swear up and down the suit begins to suck on your [pc.clits] during the carnal act, encouraging you further.");
		else if(pc.hasCocks()) output(" you begin to let out what feels like every drop of [pc.cum] in your " + (pc.balls > 1 ? "pulsing balls":"body") + " from the ends of your flexing cocks, and you’d swear up and down the suit starts jacking you off harder.");	
		else if(pc.hasCock()) output(" you begin to let out what feels like every drop of [pc.cum] in your " + (pc.balls > 1 ? "pulsing balls":"body") + " from your [pc.cockHead], and you’d swear up and down the suit starts jacking you off harder.");
		else if(pc.hasVaginas()) output(" you squirt, drip and dribble femcum into the suit, and you’d swear up and down the suit begins to suck on your [pc.clits] during.");
		else if(pc.hasVagina()) output(" you squirt, drip and dribble femcum into the suit, and you’d swear up and down the suit begins to suck on your [pc.clit] during.");
		else output(" you suffer a confusing orgasm reminiscent of trying to punch someone in a nightmare, your [pc.hips] jerking back and forth and doing nothing but holding the pleasure in.");
		output(" By the time you’ve finished cumming, red-faced and sweaty, the suit has reached your neck and you start to feel it... <i>changing</i> you.");
	}
	//end taur variant here
	if(pc.legType == GLOBAL.TYPE_LIZAN && pc.legCount == 6) output("\n\nYou gasp in shock as the suit suddenly tightens around your midlegs, drawing taut and constricting you even further until can’t even feel them. In fact... it feels like they’re gone altogether! The suit moves to your other pairs of legs, tightening once more but this time, it’s matched by");
	else output("\n\nThe suit suddenly tightens around your [pc.legOrLegs], drawing taut and intensifying the");
	output(" rhythmic stroking of its tentacles, almost as if it were repainting you from the ground up. Panting, you can feel it making adjustments bit by bit, like you’re something to be turned over and inspected and remade.");
	output("\n\nThen the sensation shifts further back and you groan in utter bliss, feeling the renewed attention across your " + (pc.hasGenitals() ? "sensitive genitals.":"sensitized underside."));
	if(!pc.hasVagina() && pc.hasCocks()) 
	{
		output(" Your cocks are tied up in ribbons of biomaterial and stretched out until the sensation of them suddenly disappears and you jolt, realizing all of their sensitivity was transferred back to the original article - oh, stars, that’s <i>good</i>! Gasping for breath, you hardly resist the massive orgasm brewing somewhere in your nethers.");
		if(pc.cocks[pc.biggestCockIndex()].cType != GLOBAL.TYPE_EQUINE) 
		{
			output("\n\nA groan erupts from your throat as you realize it’s not done with you - not even close. Your largest cock, apparently the one your newest friend has seen fit to let you keep, suddenly throbs and <i>widens</i>, flaring at the tip as pre-seed drips and spurts down its crown. You can feel a ring of flesh forming somewhere closer to the base, which itself is changing to a less sensitive and thicker texture. It feels like a horse’s, and you’re <i>still</i> pushed right up against the tantalizing precipice of cumming...");
		}
		output("\n\nThe [pc.skinFurScales] below your asshole suddenly caves inwards and you cry out in alarm then once more in rapturous, slutty pleasure as the tendrils of the suit slide into your slippery new pussy, gripping its lips and pulling until they thicken and inflate. They’re puffed up until they’re so big and sensitive they rub together at the slightest movement and each one causes you to bite your lip, leaving you wondering how you’ll ever fulfill this now-rampant lust.");
	}
	//pc has no vagina, one non-equine cock:
	else if(!pc.hasVagina() && pc.hasCock() && pc.cocks[0].cType != GLOBAL.TYPE_EQUINE)
	{
		output(" A groan erupts from your throat as you realize it’s shifted its attentions back to your hind half. Your cock suddenly throbs and <i>widens</i>, flaring at the tip as pre-seed drips and spurts down its crown. You can feel a ring of flesh forming somewhere closer to the base, which itself is changing to a less sensitive and thicker texture. It feels like a horse’s, and you’re being pushed right up against the tantalizing precipice of cumming the longer the changes go on...");
		output("\n\nThe [pc.skinFurScales] below your asshole suddenly caves inwards and you cry out in alarm then once more in rapturous, slutty pleasure as the tendrils of the suit slide into your slippery new pussy, gripping its lips and pulling until they thicken and inflate. They’re puffed up until they’re so big and sensitive they rub together at the slightest movement and each one causes you to bite your lip, leaving you wondering how you’ll ever fulfill this now-rampant lust.");
	}
	//pc has multiple vaginas, no cock:
	else if(pc.hasVaginas() && !pc.hasCock())
	{
		output(" A groan erupts from your throat as you realize it’s shifted its attentions back to your hind half. Your pussies suddenly tighten up and clench impossibly hard, instantly sending you to the brink of imminent orgasm while you grit your teeth and grunt, but then they tighten even further and suddenly their sensation is <i>gone</i>, like they’ve vanished completely. Your momentary dismay is replaced by sudden, eye-rolling bliss when you realize all of their sensitivity was transferred back into the main article, [pc.girlCum] dripping steadily from between its lips while the suit rubs you right between them.");
		if(pc.vaginas[0].type != GLOBAL.TYPE_EQUINE)
		{
			output("\n\nRemaining pussy not equine:A groan erupts from your throat as you realize it’s not done with you - not even close. You feel the suit grip your pussy lips and lightly pull and to your surprise, you feel them not stretch but <i>inflate</i>, expanding until having them rub together is not only a blissfully pleasant experience but an inevitability, one that’s sure to keep you on the edge.");
			if(pc.vaginas[0].looseness() > 1) output(" Then the suit pulls inwards and you let out a grunt as you feel yourself inexplicably tighten up, as if you’re about to cum, and it takes you a few seconds to realize the change is permanent.");
			if(!pc.vaginas[0].hymen) output(" Strangely enough, it feels like you’re a virgin again... in fact, maybe you are!");
		}
		output("\n\nThe [pc.skinFurScales] below your asshole suddenly caves inwards and you cry out in alarm then once more in rapturous, slutty pleasure as the tendrils of the suit slide into your slippery new pussy, gripping its lips and pulling until they thicken and inflate. They’re puffed up until they’re so big and sensitive they rub together at the slightest movement and each one causes you to bite your lip, leaving you wondering how you’ll ever fulfill this now-rampant lust.");
	}
	//pc has one vagina, no cock:
	else if(!pc.hasCock() && pc.hasVagina())
	{
		if(!pc.vaginas[0].type != GLOBAL.TYPE_EQUINE) 
		{
			output(" A groan erupts from your throat as you realize it’s not done with you - not even close. You feel the suit grip your pussy lips and lightly pull and to your surprise, you feel them not stretch but <i>inflate</i>, expanding until having them rub together is not only a blissfully pleasant experience but an inevitability, one that’s sure to keep you on the edge.");
			if(pc.vaginas[0].looseness() > 1) output(" Then the suit pulls inwards and you let out a grunt as you feel yourself inexplicably tighten up, as if you’re about to cum, and it takes you a few seconds to realize the change is permanent.");
			if(!pc.vaginas[0].hymen) output(" Strangely enough, it feels like you’re a virgin again... in fact, maybe you are!");
		}
		else
		{
			output(" A groan erupts from your throat as you realize it’s not done with you - not even close. You feel the suit pull your pussylips inwards and you let out a grunt as you feel yourself inexplicably tighten up, as if you’re about to cum, and it takes you a few seconds to realize the change is permanent.");
			if(!pc.vaginas[0].hymen) output(" Strangely enough, it feels like you’re a virgin again... in fact, maybe you are!");
		}
	}
	//pc herm:
	if(pc.isHerm())
	{
		if(pc.hasCocks()) 
		{
			output(" Your cocks are tied up in ribbons of biomaterial and stretched out until the sensation of them suddenly disappears and you jolt, realizing all of their sensitivity was transferred back to the original article - oh, stars, that’s <i>good</i>! Gasping for breath, you hardly resist the massive orgasm brewing somewhere in your nethers.");
			if(pc.cocks[pc.biggestCockIndex()].cType != GLOBAL.TYPE_EQUINE) 
			{
				output("\n\nA groan erupts from your throat as you realize it’s not done with you - not even close. Your largest cock, apparently the one your newest friend has seen fit to let you keep, suddenly throbs and <i>widens</i>, flaring at the tip as pre-seed drips and spurts down its crown. You can feel a ring of flesh forming somewhere closer to the base, which itself is changing to a less sensitive and thicker texture. It feels like a horse’s, and you’re <i>still</i> pushed right up against the tantalizing precipice of cumming...");
			}
		}
		else if(pc.hasCock() && pc.cocks[0].cType != GLOBAL.TYPE_EQUINE)
		{
			output(" A groan erupts from your throat as you realize it’s shifted its attentions back to your hind half. Your cock suddenly throbs and <i>widens</i>, flaring at the tip as pre-seed drips and spurts down its crown. You can feel a ring of flesh forming somewhere closer to the base, which itself is changing to a less sensitive and thicker texture. It feels like a horse’s, and you’re being pushed right up against the tantalizing precipice of cumming the longer the changes go on...");
		}
		if(pc.hasVaginas())
		{
			output("\n\nYou moan when you realize the suit is <i>still</i> making changes to you, this time just north of where it last focused. Your pussies suddenly tighten up and clench impossibly hard, instantly sending you to the brink of imminent orgasm while you grit your teeth and grunt, but then they tighten even further and suddenly their sensation is <i>gone</i>, like they’ve vanished completely. Your momentary dismay is replaced by sudden, eye-rolling bliss when you realize all of their sensitivity was transferred back into the main article, [pc.girlCum] dripping steadily from between its lips while the suit comfortingly rubs you right between them.");
		}
		if(pc.hasVagina())
		{
			if(pc.vaginas[0].type != GLOBAL.TYPE_EQUINE)
			{
				output("\n\nA groan erupts from your throat as you realize it’s not done with you - not even close. You feel the suit grip your pussy lips and lightly pull and to your surprise, you feel them not stretch but <i>inflate</i>, expanding until having them rub together is not only a blissfully pleasant experience but an inevitability, one that’s sure to keep you on the edge.");
				if(pc.vaginas[0].looseness() > 1) output(" Then the suit pulls inwards and you let out a grunt as you feel yourself inexplicably tighten up, as if you’re about to cum, and it takes you a few seconds to realize the change is permanent.");
				if(!pc.vaginas[0].hymen) output(" Strangely enough, it feels like you’re a virgin again... in fact, maybe you are!");
			}
			else
			{
				output("\n\nA groan erupts from your throat as you realize it’s not done with you - not even close. You feel the suit pull your pussylips inwards and you let out a grunt as you feel yourself inexplicably tighten up, as if you’re about to cum, and it takes you a few seconds to realize the change is permanent.");
				if(!pc.vaginas[0].hymen) output(" Strangely enough, it feels like you’re a virgin again... in fact, maybe you are!");
			}
		}
	}
	else
	{
		output(" A groan erupts from your throat as you realize it’s doing something to you - a protrusion rapidly sprouts from between your hindlegs, throbbing and hardening until there’s no doubt about what’s back there - an enormous cock, long and thick enough that you’d be hanging between your legs were it not currently being masturbated by the suit around you. Panting and moaning, you’re brought right to the edge of orgasm and stopped short as the suit’s influence creeps upwards once more, pressing down beneath your asshole.");
		output("\n\nYour [pc.skinFurScales] suddenly cave inwards and you cry out in alarm then once more in rapturous, slutty pleasure as the tendrils of the suit slide into your slippery new pussy, gripping its lips and pulling until they thicken and inflate. They’re puffed up until they’re so big and sensitive they rub together at the slightest movement and each one causes you to bite your lip, leaving you wondering how you’ll ever fulfill this now-rampant lust.");
	}
	output("\n\nIt takes some time to become aware of your");
	if(pc.balls > 0) output(" ball" + (pc.balls > 1 ? "s":"") + " again");
	else output(" new balls");
	output(" but once you are, it’s almost all you can think about - how <i>full</i> and <i>swollen</i> they are with thick seed. Stars, you can’t even move; the suit is holding you rigid and upright, as if it <b>wants</b> you to be pent-up and increasingly edgy about the way it’s stroking your impressive set of genitalia to non-completion.");
	output("\n\nIt presses into your skin, holding taut until it almost begins to hurt - and suddenly, you realize it’s hurting on the <i>outside</i>. The suit’s skin is becoming yours, and changing while it does so! The metallic exterior shifts and shimmers, crinkling and creasing and reshaping itself over and over until it becomes [pc.furColor]-furred skin, overlaying itself over your previous skin and drawing tighter until it’s been completely replaced! You barely have time to look back at yourself before the suit suddenly encroaches further, reaching up for your chin and covering your face in an instant.");
	output("\n\nYou panic as the suit slips into your mouth, your breathing halting, but less than a second passes before the skin tears and wraps around your top and bottom lips. By the time your breathing returns to normal you notice your lips themselves have been changed - they’re noticeably softer");
	if(pc.femininity < 80) output(" and plumper, more feminine and appealing.");
	else output(" and pleasant to the touch of your [pc.tongue].");
	output(" You can’t help but think they’d be perfectly suited to wrapping around the head of a big, fat cock.");
	output("\n\nStars, you’re still so <i>fucking</i> horny! Trying to move your hindquarters in protest, you find - as the membrane of the suit draws taut against your upper face - they can move! Barely. You grind out an <i>inch</i> of progress, receiving a little shock of pleasure that travels up your sensitive flared head and into your underside. Oh... that feels amazing. You’re going to try even harder...");

	taursuitBaseTFs();
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",moreTaursuitTFFun);
}

public function taursuitBaseTFs():void
{
	//removes mimbranes
	removeMimbranes();
	//Remove “Genital Slit” and “Uniball”
	pc.removeStatusEffect("Genital Slit");
	pc.removeStatusEffect("Uniball");
	//Remove any testicles
	pc.balls = 0;
	//Change legs to four equine legs
	//Legs become digitigrade, furred, hooved
	pc.clearLegFlags();
	pc.legCount = 4;
	pc.legType = GLOBAL.TYPE_EQUINE;
	pc.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_HOOVES, GLOBAL.FLAG_FURRED];
	//Genital location changes to hind legs
	pc.genitalSpot = 2;
	//Grow/Change all tails into one long equine tail
	pc.tailCount = 1;
	pc.tailType = GLOBAL.TYPE_EQUINE;
	pc.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLOPPY];
	//Taint increases by 10
	pc.taint(10);
	//Tallness less than 78 inches - Tallness increases to 78 inches
	if(pc.tallness < 78) pc.tallness = 78;
	//Libido less than 80 - Libido increases to 80
	if(pc.libidoRaw < 80) pc.libidoRaw = 80;
	//Libido greater than 80 - Libido increases by 10
	else pc.libido(10);
	
	var i:int = 0;
	//Trim excess cocks.
	if(pc.hasCocks())
	{
		for(i = (pc.cockTotal() - 1); i > 0; i--)
		{
			if(i > 0)
			{
				pc.removeCock(i, 1);
				pc.cocks[0].cLengthRaw += 2;
			}
		}
	}
	if(!pc.hasCock())
	{
		pc.createCock();
	}
	//Grow one 28-inch equine penis
	if(pc.cocks[0].cLengthRaw < 28) pc.cocks[0].cLengthRaw = 28;
	//Penis becomes flared, blunt and sheathed
	pc.shiftCock(0, GLOBAL.TYPE_EQUINE);
	//Penis color changes to pink
	pc.cocks[0].cockColor = "pink";
	//Grow two 16-inch balls
	pc.balls = 2;
	pc.ballSizeRaw = 51;
	//Grow one equine vagina
	if(pc.hasVaginas())
	{
		for(i = (pc.totalVaginas() - 1); i > 0; i--)
		{
			if(i > 0)
			{
				pc.removeVagina(i, 1);
			}
		}
	}
	if(!pc.hasVagina()) pc.createVagina();
	//pc.vaginas[0].type = GLOBAL.TYPE_EQUINE;
	pc.shiftVagina(0, GLOBAL.TYPE_EQUINE);
	//Vagina color changes to black
	pc.vaginas[0].vaginaColor = "black";
	//Vagina will have one 1-inch clit
	pc.clitLength = 1;
	//Vagina wetness becomes 4
	if(pc.vaginas[0].wetnessRaw < 4) pc.vaginas[0].wetnessRaw = 4;
	//Vagina looseness becomes 1
	if(pc.vaginas[0].loosenessRaw > 1) pc.vaginas[0].loosenessRaw = 1;
	//Vagina bonus capacity becomes 50
	if(pc.vaginas[0].bonusCapacity < 50) pc.vaginas[0].bonusCapacity = 50;
	else pc.vaginas[0].bonusCapacity += 25;
	//Gives squirter perk ???
	//Applies one Anusoft to asshole
	pc.inflateAsshole();
	
	//Increases hair length by 6 inches.
	pc.hairLength += 6;
	//Increases Taint by 5-10?
	pc.taint(10);
	
	IncrementFlag("KQ_TAURSUIT_TF");
}

public function moreTaursuitTFFun():void
{
	clearOutput();
	showTaursuit();
	author("Wsan");
	//tooltip:Strain against your restraints!
	output("<i>“Oh, god, fuck!”</i> you moan out loud, feeling your [pc.hips] start to smoothen out the motion of thrusting. <i>“Nnnnf!”</i>");
	output("\n\nIt feels like you’re thrusting into a tight orifice <i>perfectly</i> suited to your enormous studcock, wrapping around you and stroking you with every in and outstroke. Pushed so close to the edge by the suit’s intimate ministrations, you cum immediately and explosively. Your powerful tauric hips bucking hard, you violently orgasm into the suit while it sucks and strokes you. Lifting your head and exulting, you cry out while your flare blossoms and sends gushes of thick equine seed through the skin of the suit.");
	output("\n\nMoments later you cum with your [pc.pussy] too, your hindquarters shaking violently as femcum spurts from between your thick, winking lips and drips down your quivering hindlegs, pooling between your hooves. The sensation sets you back on edge and suddenly you’re cumming with your [pc.cock] again, doubling over and groaning. The thrusting motion makes your pussylips rub together and brush your [pc.clit] and you find yourself in the enviable position of being unable to stop cumming with either set of genitalia, leaning against a wall and moaning like a whore.");
	output("\n\nWith each orgasm you feel the suit draw tighter but you can’t stop, stuck cumming into your entwined lover with choking cries of ecstasy. You get the distinct feeling that the suit is still changing you somehow, each orgasm somehow providing it with <i>fuel</i> to further alter you, though you don’t understand what it is until you finally glance downwards, panting.");
	
	var i:int = 0;
	var hasTits:Boolean = (pc.biggestTitSize() >= 1);
	
	if(hasTits) output(" Your breasts are growing larger by the moment, swelling outwards with added mass until they’re so heavy it feels like they’ve increased by at least a couple of cup sizes.");
	else output(" You’re growing breasts! They swell and swell with every passing second, the added flesh pushing your nipples forward until they’re jutting right out and your breasts are shaking with the force of your thrusts.");

	//No breasts - Give DD cup tits
	//Had breasts - Give 2 cup sizes
	for(i = 0; i < pc.bRows(); i++)
	{
		if(pc.breastRows[i].breastRatingRaw < 0) pc.breastRows[i].breastRatingRaw = 0;
		if(!hasTits) pc.breastRows[i].breastRatingRaw += 5;
		else pc.breastRows[i].breastRatingRaw += 2;
	}
	output("\n\nThe longer it goes on the more you get used to it until you’re humping the suit like a rabid beast, panting and moaning as the skin stretches around your fat, throbbing prick and cum spurts from both your cock and your cunt. It all comes to a head when, with a strained, desperate gasp, you shove your hips forward and realize your fat dick is no longer contained. The suit is gone, leaving you with nothing but your new form. A flood of thick spunk gushes across the floor of the freighter as you wilfully empty your [pc.balls], groaning in joy.");
	output("\n\nWhen at last you sigh in contentment and look down to inspect yourself, you’re stopped by the odd sensation of your hair brushing against your bare back - was it always this long? Reaching back, you realize you now have long hair, tied into a ponytail somehow. The suit seems to have done its final job up here; you can feel that your face’s structure has changed");

	if(pc.femininity > 90) output(" slightly, too.");
	else output(", too, to make you more feminine.");
	//Femininity less than 90 - Increase femininity to 90
	if(pc.femininity < 90) pc.femininity = 90;
	pc.fixFemininity();
	output("\n\nYou take a step forward and listen to the clinking of your [pc.feet] against the ground - it’s a nice sound, rhythmic and loud. You’ve only gone a few feet when you suddenly realize - <i>where’s your gear?</i>");
	output("\n\nYou spin back around and there, scarcely more than a plastic sheet at this point, is the ‘expended’ taursuit. It’s certainly not autonomous any more. Contained within it are your belongings, thankfully dry and unharmed. You’re not entirely certain how that works but then again, you’re not certain how <i>anything</i> on this ship works - you’re not going to question it.");
	output("\n\nRe-equipping your gear and checking through your inventory, you carry on, newly inspired and confident in your new form. You give a silent thank-you to the taursuit’s remains and remind yourself - you’ll have to check out a mirror later.");
	processTime(60);
	for(i = 0; i < 15; i++) { pc.orgasm(); }
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Defeat scene/Bad end
//based on willpower. Can resist it and only become physically changed if high enough.
public function loseDatCumbat():void
{
	author("Wsan");
	output("You stumble and try to stand against the wall, sliding down and coming to a rest with a thump. Gazing upwards you see the taursuit advancing towards you, hooves clacking on the metallic floor as it draws near and brushes up against your body.");
	output("\n\n<i>“Oh, stars,”</i> you groan in despair as writhing, grasping tentacles begin to rise from its dark interior and pull on your limbs. <i>“Fuck...!”</i>");
	output("\n\nThe last thing you feel before you black out is the sensation of your lower half changing radically. Your dreams are of metamorphosis, of colors swirling and shifting until they’re naught but a streaky blur across a distant landscape of stars and craters. When you awaken, everything has changed.");
	processTime(60);
	clearMenu();
	addButton(0,"Next",lostCombatTFStuff);
}

public function lostCombatTFStuff():void
{
	clearOutput();
	showTaursuit();
	author("Wsan");
	//If you have high enough willpower, takes you to New Body Continuation
	taursuitBaseTFs();
	//No breasts - Give DD cup tits
	if(pc.biggestTitSize() < 1) pc.breastRows[0].breastRatingRaw = 5;
	//Had breasts - Give 2 cup sizes
	else pc.breastRows[0].breastRatingRaw += 2;
	for(var i:int = 0; i < pc.bRows(); i++)
	{
		if(i > 0) pc.breastRows[0].breastRatingRaw += 2;
	}
	if(pc.femininity < 90) pc.femininity = 90;
	pc.fixFemininity();
	//If you suck, go to the bad end

	//New Body Continuation
	if(pc.willpower()/2 + rand(20) + 1 >= 20 + pc.taint()/3)
	{
		output("You’re walking down the hallway to present yourself to your mistress when, suddenly, something feels <i>wrong</i>. Shaking your head, you try to clear the errant sensation from your head but that only makes it worse, and then you’re gripping your head and shuddering while you topple sideways, your tauric body slamming against the wall as you try to keep it all together. <i>THIS IS ALL WRONG!</i>");
		output("\n\nSlowly, gradually, you relax your grip on your head and run through your fractured memories. You are... you are... [pc.name]. That’s right. Your name is [pc.name] Steele, and you were meant to find the probes. Your father’s probes. You came here because... because of a pirate. Someone you once knew. Ki... ki-something. Kiro. Her name was Kiro... and you came here to rescue her. Then you ran into some monster or something, and-");
		output("\n\nYou grab your head again and groan, a thud of pain echoing outwards from your skull. That’s right. It grabbed you, and now...");
		output("\n\nSlowly rising to your feet, you look down, then around at the walls. There’s a panel that’s just reflective enough for you to see yourself in. Standing in front of it, you close your eyes and reopen them, gazing at the person looking back at you.");
		output("\n\nYou’re a voluptuous femme centaur, with the sleek, [pc.furColor]-furred body of a horse and your humanoid half protruding from where the animal’s head would be. Your [pc.breasts] are beautifully shaped, your waist narrow, and your [pc.hips] wide. Touching a hand lightly to your face, you brush your fingertips against a high-boned cheek and stare at yourself in the mirrored metal. Did you... always look like this? Of all the memories rushing unbidden into your mind, the ones about your appearance are the hardest to summon.");
		output("\n\nEven your lips are lush and pouty. You press your finger into the bottom lip experimentally and surprise yourself with how <i>soft</i> it is, like sinking into a wonderful pillow. Pulling back, you eye yourself from a new angle: what is this body <i>for</i>? Because it <i>looks</i> like... like it’s built for sex.");
		output("\n\nYou hold your gaze for a second longer before you let out a soft moan, looking down at a - familiar? Unfamiliar? - sensation at your rear. Something is <i>growing</i>-");
		output("\n\n<i>“Ooohhhh, gooddd,”</i> you groan, putting your hands out against the wall and panting. Glancing lower, you spot what’s happening. <i>“Oh, fuck...”</i>");
		output("\n\nYour [pc.cock] stands erect and proud, dripping with thick, sticky equine spunk. It’s enormous, like it was made to be thrust into a body of a similar configuration and penetrate all the way to a womb so it can be seeded. Just imagining such a scene sets you ashiver, and it’s then that you notice it: a quivering wetness at your rear.");
		output("\n\nThough it’s a little hard to twist back and check yourself out, you manage it. With your big butt facing the reflective metal, you check yourself out. You have a puffy equine asshole beneath your [pc.tail] that looks as if it would grip a fat cock like your own like a vice and below that, a [pc.pussy]. It’s dripping now and the translucent femcum is dripping down your fat, hanging balls, each one no doubt filled to the brim with enormous quantities of semen. That’s <i>more</i> than reinforced by the miniature ejaculations spurting from the end of the veiny, pulsating horsecock that starts between your hindlegs and ends somewhere north of your tauric half’s middle.");
		output("\n\nYou’re so horny now that you don’t even bother looking at the rest of the details - you can check them later. Right now all you want is to <i>fuck</i> or <i>get</i> fucked and from what you can remember, Kiro would be more than happy to deliver - repeatedly and thoroughly - on either of those. Now you <b>really</b> need to find her..!");
		output("\n\nFirst, though, you need to retrace your footsteps. Hoof-falls ringing out on the metal floor, you find what you were looking for - your codex, and the rest of your equipment. Re-equipping your gear with some difficulty and adjustment, you inspect yourself as best you can and turn back to your mission. Stars! You swear to yourself right then and there you’re going to crack Kiro’s hips like a walnut after you rescue her and get her to safety.");
		output("\n\nYou walk on, leaving behind a lewd trail of droplets of salty pre-seed and female arousal.");
		output("\n\n");
		pc.changeLust(55);
		CombatManager.genericVictory();
	}
	else
	{
		showPo(true);
		output("More than once you have a moment where not everything seems quite right, but the longer you walk down this hallway towards your new mistress, the clack of your hooves and the swing of your voluptuous breasts keeping you company, the more correct and ordered everything seems. A smile appears on your pretty face, both your [pc.nipples] and your [pc.cock] hardening as you walk on. Everything is going to be just perfect.");
		output("\n\nYou walk ever deeper into the recesses of the freighter, automatically avoiding its perils and mishaps until you start passing them - women like you. Perfect in form from the top down, with beautiful, feminine faces, massive bared breasts, and huge, throbbing erect cocks. Though you have to note, with a tingle of pride, <i>none</i> of them are like you. Your body is larger, sexier, and far more capable of supporting your enormous, rear-mounted penis and the two gigantic balls hanging beneath it. You’re the biggest girl here no matter how you cut it.");
		output("\n\nYour tongue darts out to wet your puffy lips as you enter your mistress’ inner sanctum, walking slowly to where she lies draped across a couch, eyeing a data slate. She looks up at the sound of your hooves, her gaze raking you up and down.");
		output("\n\n<i>“Oh? One of the new models,”</i> she says, considering you with naked lust. <i>“Perfect. I haven’t had the chance to test you yet. Follow me.”</i>");
		output("\n\nYou walk past futa fuckbots pounding each other, licking each other cunts and cocks and gulping down copious amounts of seed, but nothing captivates your attentions quite like the way your mistress’ tight, firm asscheeks do. She’s so sexy and perfect you’re not sure what to do with yourself. Turning to you, she leans in and eyes your face.");
		output("\n\n<i>“Since you’re new, I’ll let you know now. <b>This</b>,”</i> she says coolly, reaching down and grabbing the extremely swollen and flared head of your cock, <i>“doesn’t cum until I say so. Do you understand?”</i>");
		output("\n\n<i>“Yes!”</i> you gush, nodding eagerly. <i>“Yes, mistress. I won’t cum.”</i>");
		output("\n\n<i>“Good,”</i> she purrs, grinning smugly at you. <i>“The last thing I need is a toy that doesn’t follow orders. Now,”</i> she continues, climbing onto a very comfortable-looking mounting platform and spreading her beautiful legs, giving you an eyeful of her lube-dripping cunt. You almost cum on the spot at the sight, reflexively jerking your [pc.hips] before you remember she told you not to.");
		output("\n\n<i>“Suck my cunt until I squirt in your mouth,”</i> she tells you.");
		output("\n\nScarcely have the words left her perfect lips than you’ve bent to the task, seizing her plump synthetic asscheeks and pressing your face right into her flawless pussy. She murmurs in approval, attending to a data slate in front of her. Stars, she tastes like fucking heaven - you can’t imagine anything better than greedily slurping up her juices, running your tongue up and down her cunt and lovingly sucking on her pussylips for more.");
		output("\n\nWhen she does cum, she gently squeezes her thighs together and <i>sighs</i>, and you’d swear it’s the most erotic sound you’ve ever heard in your short life, closely followed by the sound of her squirting across your [pc.tongue]. Your eyes roll up into your head as you taste it, like life-giving ambrosia, her cum spurting neatly down your throat and leaving you feeling like your gullet is lined with sweet, smooth honey.");
		output("\n\nBy the time you lift your dizzy head, you’re thoroughly entranced. You know only that you’ve been instructed to mount and pound her with your fat, throbbing cock - and <b>not</b> to cum, under any circumstances.");
		output("\n\n<i>“Mmmgh, oh, fuck, you are <b>big</b>,”</i> your mistress moans happily, scribbling notes. <i>“Preliminary findings - I think I’m going to upgrade the rest of the slaves to your specs and elevate yours further. Let’s test your endurance - ngh! Fuck my cunt for six hours, as hard as you can, without cumming.”</i>");
		output("\n\nYou step forward and begin pounding her tight, juicy slit so hard your balls slap against the back of her thighs, panting wildly as you resist the dangerous desire to cum your brains out deep inside her. You would never, ever want to disappoint your mistress, and so you endeavor to give her as many gasping, cunt-clenching orgasms as you can. They come easily, one after another, your mistress’ juices spilling all over your angrily pulsing cock while you ride her into the platform.");
		output("\n\n<i>“O-o-o-o-h, <b>yes</b>!”</i> she hisses, haphazardly placing the dataslate down and clenching her fists. <i>“Harder, slut! We’re t-testing your limits, here! Ugh!”</i>");
		output("\n\nYour wide, muscular equine hips are a blur as loud, wet slaps like the report of a kinetic weapon ring out in your mistress’ room, her orgasmic cries of pleasure mingling with your loud, desperate panting as you strain and strain to keep yourself from cumming. Your staggeringly thick flare throbs and expands inside her, threatening to ejaculate right into her cushioned womb at any second, but you win over your instincts - for her. The thought that you might let your beloved down keeps you from doing anything more than dribbling precum even as your heavy balls tighten against your underside, insisting, <i>demanding</i> that you cum inside her.");
		output("\n\nYou don’t. You power on through your animal instincts, lowering yourself to the level of an automaton, created solely to satisfy the intense sexual hunger of your mistress, slamming your giant horsecock all the way to her padded cervix and rocking her body with blissful orgasm after orgasm while you stave off your own. Her ecstatic cries ring in your ears while her squishing cunt grips and strokes you, almost taunting your inability to explode inside her while she enjoys the thrill of cumming over, and over, and over again.");
		output("\n\nSweat pours down your tauric body while you obediently pound the fuck out of her, swinging your hips down to meet her jiggling ass. It gets easier, you find. The longer you ram yourself into her tight little slit the more comfortable you are with suppressing your own urges for the sake of hers, and soon the impulse to let yourself go has faded into the background of your mistress’ pleasure. You’re smiling happily now, listening to her groan in rapture while you service her, knowing you’re serving your purpose.");
		output("\n\nWhen at last she tells you to stop you dismount with your cock drooling and twitching, having not cum a single time in six hours, but you’re happier than you could ever be had you cum inside her. Just looking at her now, panting harshly and writing notes, is enough to satisfy you. This is what true love feels like, you realize.");
		output("\n\n<i>“Mmmm... good work, slut,”</i> she says casually, nodding back at you. <i>“Feel like cumming yet?”</i> She glances down, at your rigid, throbbing cock, and at your half-blossoming flare as it drips precum all over the ground. <i>“Never mind. Hmmm... your balls are enormous - I wonder just how much bigger they can get before you reach maximum capacity. Then we can measure load size...”</i>");
		output("\n\nYour ears perk up at that, though you say nothing. If your mistress wants to let you cum, that’s her decision and hers alone. She continues writing and beckons over a second woman, whose cock immediately springs upright and begins to throb as she stands in front of her mistress. You smile. You can relate.");
		output("\n\n<i>“You,”</i> your mistress says, pointing at her, <i>“take your cock and jam it in her ass.”</i> She jabs her thumb at you. <i>“Fuck her prostate until she’s crying, and don’t stop until I tell you to.”</i>");
		output("\n\n<i>“Yes, mistress,”</i> she sighs happily, putting her fingers around the base of her cock.");
		output("\n\nYou spread your legs and lower your ass for her, presenting your puffy equine asshole for her to fuck, and grunt as she shoves herself to the hilt in one go. Oh, fuck - so this is what it feels like to be on the receiving end! Her balls slap against your sensitive, dripping cunt again and again as you bite down on your lip, trying not to cum or cry out or do <i>anything</i> until your mistress tells you to. She walks up in front of you and bends over, taking your [pc.balls] in hand and rubbing them with interest.");
		output("\n\n<i>“Hmm. Three hours should be enough, but make it four just to be safe,”</i> she muses. <i>“Make sure you rub against her prostate as hard as you can, slut. And you,”</i> she says, spanking your ass hard enough to make you let out a high-pitched squeal, <i>“don’t cum and I’ll give you a reward.”</i>");
		output("\n\nFour hours... just four hours of having this she-stud gripping your hindquarters and pounding the living fuck out of your clenching asshole, grinding her cumvein into your oversized prostate and making your prick sputter translucent precum all over the floor. Just four hours of this until you can get a reward...");
		processTime(65);
		pc.changeLust(3000);//She loves you 3000!
		clearMenu();
		addButton(0,"Next",toZeBadEndTaurButt);
	}
}

public function toZeBadEndTaurButt():void
{
	clearOutput();
	showTaursuit();
	author("Wsan");
	output("You collapse, panting and whining, your asshole gaped and winking as your partner withdraws her stiff cock from your rear. It’s <i>not</i> hard to tell she was created from the ground up to have sex, just like you - it took everything you had not to cum your brains out. Your balls ache with the need for release as your mistress idly rubs one of the spunk-filled orbs between her fingers, humming to herself.");
	output("\n\n<i>“Very good,”</i> she murmurs, gently squeezing your nuts. You let out a heavenly little moan in response. <i>“Alright,”</i> she says, standing and walking over to a new platform. This one appears to have an orifice for penetration in its center, as well as an attached tank. <i>“Come here. You’re going to fuck this and blow the biggest load you can. What will make you cum the hardest, slut?”</i>");
	output("\n\nVisions of her swim through your hazy mind. <i>“You, mistress.”</i>");
	output("\n\nShe smirks. <i>“Good answer. Up.”</i>");
	output("\n\nYou mount the machine and gingerly slide your cockhead into its confines, moaning quietly. It’s nice and tight, almost as good as <i>hers</i>, but still you hesitate.");
	output("\n\n<i>“You need some encouragement,”</i> your mistress decides, raising an additional platform behind the milker and hopping on top of it, taking a seat with her legs hanging off the edge. Her pussy is just about eye-level. <i>“I’ll let you cum while you suck my pussy. Special testing procedure.”</i>");
	output("\n\n<i>“Yes, mistress! Thank you, mistress!”</i> you gush, diving forward and pressing your tongue into the lips of her cunt. Your hips begin to buck while you drink as deeply of her as you can, your eyes rolling upwards in submissive pleasure as that");
	output("\n\n<i>“That’s right,”</i> she murmurs, hand on the back of your head. <i>“Try not to think about how much harder cumming once is going to make resisting cumming twice, Steele.”</i>");
	output("\n\nYou don’t hear her. Every single one of your senses is honed to the finest point and focused entirely on her wonderful, dripping cunt, the way she so graciously squirts femcum into your mouth when you earn it by circling her engorged clit with your tongue, and how it feels coating your throat as you greedily swallow it down. Your entire lower body tenses, relaxes, then tenses again as your mental inhibitions come loose and your much-needed orgasm rises from the very depths of your nethers to overcome your mind.");
	output("\n\nYou say nothing as gallons of thick, creamy ejaculate <i>spew</i> from the end of your throbbing cock into the milker, your wide, fertile hips jerking as you pound away at the machine the way only a horny stallion can. Your mistress coos in approval as she watches the gurgling machine fill one tank to the absolute limit, switching it over to several reserve tanks before resuming her casual grinding of her vagina against your lips.");
	output("\n\nYour stiffened cock ebbs and swells, the bloated head flaring so wide you become stuck in the milker and can only jerk yourself off with half a foot of leeway, pumping an increasingly bountiful excess of sperm into her tanks. Cumming while kissing the mistress’ beautiful cunt - it’s all you could have dreamed of. Load after load gushes into the tanks, milked from your pulsating cumvein almost as fast as you can produce it. By the time you’ve drained yourself dry and once more indulged in the sensation of your mistress squirting in your mouth, you’re slumped on her thighs and panting.");
	output("\n\n<i>“So <b>productive</b>,”</i> the doctor murmurs dreamily, stroking the tank. <i>“I’m going to have to remodel my womb just to accommodate you... and you’re going to need some special treatment.”</i>");
	output("\n\nShe slowly extricates herself from your grip while you exit the milker, assuming a standing position behind her as she crosses her legs and seats herself at a nearby console.");
	output("\n\n<i>“Let’s see,”</i> she says, drawing her data slate out. <i>“Perpetual vibrator against your prostate... drug-induced enlargement procedures... hmm. I wonder if having your pussy fucked increases your output at all... worth investigating a potential link there... need to remodel the tanks to handle the maximal load...”</i>");
	output("\n\nYou stay silent as you lovingly watch your mistress tap away at the slate, making adjustments and crossing things out as she decides your pathway for you. You’re sure, no matter what she picks out for you, you’ll be overjoyed to assist her. In the end, that’s all that really matters - doing everything and anything she might desire of you.");
	badEnd();
}

//Victory scene
public function youBeatUpATaursuit():void
{
	showTaursuit();
	author("Wsan");
	output("The taursuit crumples to the floor in a pathetic heap, folding in on itself like a crumpling tin can. You give it a nudge with your [pc.foot] - yeah, it’s definitely inactive. It looks like a dilapidated coat. You’d almost feel sorry for it were it not clearly some kind of autonomous weapon designed to take in intruders and change them in potentially horrific fashion.");
	output("\n\nAs it is, you decide to just leave it alone. Maybe it will wobble back to life on its own later, but you’ll be sure not to be around by then. Besides, it’s learned its lesson.\n\n");
	processTime(3);
	CombatManager.genericVictory();
}