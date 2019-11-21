import classes.Characters.RaskvelFemale;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.TypeCollection;
//Hostile Female Raskvel Encounter
//Armed with aphrodisiac dart-gun.
//Crotchless Mechanic's Overalls/Tattered Shirt and Skirt
//Giant wrench shotgun.
//Wants paid off for safety!
//flags 
// FEM_RASKVEL_GOPRESS //1 = next encounter skip fight and go to mating press intro
// FEM_RASKVEL_MATING_PRESS //count of number of times used mating press

public function raskvelFemaleBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "RASKVEL_FEMALE";
	if(nude) sBust += "_NUDE";
	return sBust;
}
public function encounterHostileRaskvelFemale():void
{
	CodexManager.unlockEntry("Raskvel");
	showBust(raskvelFemaleBustDisplay());
	showName("RASKVEL\nFEMALE");
	
	var tEnemy:RaskvelFemale = new RaskvelFemale();
	
	//First Encounter
	if(flags["MET_FEMALE_RASKVEL"] == undefined)
	{
		flags["MET_FEMALE_RASKVEL"] = 1;
		output("\n\nA short figure emerges from behind a piece of wreckage. The creature is perhaps four feet tall at most, couching a gigantic wrench on its shoulder and some kind of gun on its hip. It is dressed in a set of tattered mechanics overalls and little else, and as you look closer, you become aware of its undoubtedly feminine nature.");
		output("\n\nThe crotch of the overalls girding this alien girl were torn away at some point in the past to expose her puffy sex. The outer lips are as swollen as a human woman’s after being hooked to a vacuum pump for an hour, and purplish in hue. Two clits poke out from the bulging feminine genitalia, one in the front, one in the back. Her sex contrasts quite visibly with her " + tEnemy.skinFurScales() + ", standing out in stark relief against the rest of her body, like some kind of erotic target. Her wide hips strain the waist of her garment, transforming her walk into an exaggerated sexual swivel, even though her top half is narrow and lithe, capped with small, pert breasts, B-cups at the most.");
		output("\n\nBeeping, your codex alerts you that this is a hostile female of the raskvel race just like the ones you met when you landed. It issues a quick summary: <i>The Raskvel are a race obsessed with fixing technology and breeding in equal measure. They are generally a very friendly race, but some are more than happy to turn to violence to secure a mate.</i> Looking back up at the approaching creature, you ready yourself.");
		output("\n\nThe raskvel mechanic leans on her wrench as she considers you, her long, floppy ears dangling to her waist. <i>“An off-worlder, huh?”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“That’s too bad. Since you’re trespassing, you’re going to have to pay the hundred " + (isAprilFools() ? "dogecoin" : "credit") + " fee,”</i> the scaly little thing offers before smiling. <i>“If you don’t pay, I’ll find another way to take it out of you.”</i> She looks at your " + pc.rawmfn("crotch before reaching down to pull her alien twat wide open, winking","face before rubbing her palm across her exposed pussy, flicking her tongue out to indicate just how you could pay her","face before rubbing her palm across her exposed pussy, flicking her tongue out to indicate just how you could pay her") + ". <i>“I’d rather just play with you, but we need the money.”</i> She shrugs her little shoulders apologetically and awaits your response.");
		output("\n\nDo you pay the feisty little alien, fight her, or try and get a little something for your credits?");
	}
	else if(flags["RASKVEL_PREG_TIMER"] != undefined && flags["RASKVEL_PREG_TIMER"] <= 0)
	{
		IncrementFlag("MET_FEMALE_RASKVEL");
		catchPostBirthRaskvel();
		return;
	}
	else if (pc.cockThatFits(tEnemy.vaginalCapacity(0)) >= 0 && flags["FEM_RASKVEL_GOPRESS"] == 1)
	{
		IncrementFlag("MET_FEMALE_RASKVEL");
		raskvelFemaleMatingPressIntro();
		return;		
	}
	//Second Encounter
	else
	{
		IncrementFlag("MET_FEMALE_RASKVEL");
		output("\n\nAnother raskvel emerges from behind a piece of forgotten wreckage. This one seems as determined as the first one you met, proudly declaring, <i>“Fork over your credits, off-worlder. I need ‘em!”</i> She hefts her wrench threateningly. It doesn’t look like negotiation is an option.");
	}
	//[FIght] [Pay] ["Pay"]
	clearMenu();
	addButton(0,"Fight",fightFemRask, tEnemy);
	addButton(1,"Pay",payDatRaskCunt);
	addButton(2,"“Pay”",quotePayUnquoteFemRasks, tEnemy);
}

public function fightFemRask(tEnemy:Creature):void
{
	CodexManager.unlockEntry("Raskvel");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(victoryVsRaskvel);
	CombatManager.lossScene(defeatRoutingForFemRasks);
	CombatManager.displayLocation("RASKVEL (F)");
	CombatManager.beginCombat();
}

public function payDatRaskCunt():void
{
	clearOutput();
	showBust(raskvelFemaleBustDisplay());
	showName("RASKVEL\nFEMALE");
	output("Not wanting to waste time with her, you transfer the hundred credits to a chit and toss it at her.\n\nThe little junkyard rat catches hold of your chit before making a dramatic bow. <i>“Pleasure doing business with ya!”</i> She vanishes into surrounding wreckage before you can reply.");
	payRaskvel();
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Victory vs Raskvel
public function victoryVsRaskvel():void
{
	showBust(raskvelFemaleBustDisplay());
	showName("DEFEATED: F.\nRASKVEL");
	output("The extortive mechanic ");
	if(enemy.HP() < 1) output("tumbles head over heels, her wrench falling by the wayside. She hits the ground hard, panting and beaten before gasping, <i>“You win. Jerk.”</i> Her sex seems a bit puffier than before, and she’s fallen in a pose that seems almost needlessly provocative. It’s like she’s still trying to tempt you with sex.");
	else output("drops to her knees, the wrench falling by the wayside. She whimpers as her fingers disappear into her sodden box. You can see the moisture glistening on the scales of her legs as she desperately frigs herself, not even caring as she slumps down onto her back.");
	clearMenu();
	var btn:int = 0;
	if(pc.lust() >= 33)
	{
		output("\n\nDo you do something sexual with her?");
		if(pc.hasCock())
		{
			if(pc.cockThatFits(enemy.vaginalCapacity()) >= 0) 
			{
				addButton(btn,"DoggyStyle",raskVelBabeGetsDoggieStyled);
				output(" You could do her doggy style.");
				btn++;
			}
			else 
			{
				addDisabledButton(btn,"DoggyStyle");
				output(" You’re too big to do her doggy style.");
				btn++;
			}
			//Huge Dick Ear Jackoff?
			if(pc.cockVolume(pc.biggestCockIndex()) > enemy.vaginalCapacity())
			{
				addButton(btn,"EarFap",hugeDickEarJackoff);
				output(" You could put those big ears to work on your big dick.");
				btn++;
			}
			else
			{
				addDisabledButton(btn,"EarFap");
				output(" If only you had a member that was too big for her pussy, then you could use her soft ears to rub one out.");
				btn++;
			}
			//Female Raskvel Anal
			//[Punish] – Teach her a lesson about defeat.
			if(pc.cockThatFits(enemy.analCapacity()) >= 0) addButton(btn,"AnalPunish",punishAFemRaskInTheButtWithFrankensteinApplesOrSomething,undefined,"Anal Punishment","Teach her a lesson about defeat.");
			else addDisabledButton(btn, "AnalPunish", "Anal Punishment", "You’re just too big to anally punish her.");
			btn++;
			
			//cock worship
			if (CodexManager.entryViewed("Raskvel")) addButton(btn, "Cock Worship", penisRouter, [raskvelFemaleGetWorshiped, 99999, false, 0], "Cock Worship", "Get the little rask on her knees and servicing your [pc.cockNoun " + rand(pc.cockTotal()) + "]. That way she'll know which " + (pc.isHerm() ? "herm" : "[pc.manWoman]") + " to <b>present her pussy for</b> next time, rather than shaking [pc.himHer] down!");
			else addDisabledButton(btn, "Get Worshiped", "Get Worshiped", " If you want to take advantage of innate raskvel motivations, you'll <b>need to read up on them.</b>");
			btn++;
		}
		else
		{
			output(" Without a dick, you can’t really fuck her, but you’ve still got other options open to you.");
			addDisabledButton(btn,"DoggyStyle");
			btn++;
			addDisabledButton(btn,"EarFap");
			btn++;
			addDisabledButton(btn,"AnalPunish");
			btn++;
			//cock worship
			addDisabledButton(btn, "Get Worshiped", "Get Worshiped", "You <b>need a penis</b> to access this scene. Can't have your virility appreciated without the right organ, no?");
			btn++;
		}
		if(pc.hasVagina())
		{
			output(" Her face looks like it would fit nicely against your [pc.vaginas].");
			addButton(btn,"RideHerFace",faceRidingRaskvelLadies);
			btn++;
		}
		else 
		{
			output(" If you had a pussy, you could ride her face. Sadly, you don’t.");
			addDisabledButton(btn,"RideHerFace");
			btn++;
		}
		//Cuff&Fuck
		cuffNFuckButton(btn, enemy);
		btn++;
	}
	else
	{
		output(" <b>You aren’t turned on enough to engage in coitus with the alien babe.</b>");
		addDisabledButton(btn,"DoggyStyle");
		btn++;
		addDisabledButton(btn,"EarFap");
		btn++;
		addDisabledButton(btn,"RideHerFace");
		btn++;
		addDisabledButton(btn,"AnalPunish");
		btn++;
	}
	output("\n\n");
	addButton(14,"Leave",CombatManager.genericVictory);
}

//Doggie Style
public function raskVelBabeGetsDoggieStyled():void
{
	//Put her on all fours, left her ass up to be supported by your cock, grab hold of those ears for good measure, and play with them.
	clearOutput();
	showBust(raskvelFemaleBustDisplay(true));
	showName("DEFEATED: F.\nRASKVEL");
	var x:int = pc.cockThatFits(enemy.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("As you eye your ");
	if(enemy.HP() < 1) output("defeated");
	else output("defeated");
	output(" foe, your stiffening maleness");
	if(pc.cockTotal() > 1) output("es");
	output(" rise to attention, and you decide that you may as well take care of the lusts she stoked within you in the most biologically appropriate way. You grab the raskvel by one of her sizeable hips and roll her over, seizing her before she can settle into that pose. Her supple ass flexes slightly in your grip, and you can see her second clit jutting out from between her juicy-looking folds as you lift her higher. She whimpers, ");
	if(pc.tallness >= 50) output("her legs lifting up off the ground as you align her with your crotch");
	else output("her legs settling under her as you align her with your crotch. It’s a perfect match, as short as you both are");
	output(".");

	output("\n\nThe scaley slut is so light that you can support her one handed ");
	if(pc.isCrotchGarbed()) output("when you open your [pc.lowerGarments] and ");
	output("align [pc.oneCock] with her slick opening. She ");
	if(enemy.HP() < 1) output("lies there in the dirt, looking back at you with a curiously, slowly brightening expression. One of her hands lifts up, tracing along her upside-down tummy towards her frontal clit.");
	else output("shudders in anticipation, removing her fingers to give you entrance, instead focusing entirely on her frontal clit.");

	output("\n\nSeeing nothing but growing, eager assent on your once-foe, you rock your hips forward to place your [pc.cock " + x + "] against her plush, lube-oozing lips. Your [pc.cockHead " + x + "] spreads those plump vulvae like a curtain of oiled silk, slipping and sliding straight on past into the raskvel’s almost virginally tight canal with the inexorable pressure of a horny " + pc.mf("male","herm") + ". Despite the clutching tightness of her inner walls, the small alien’s pussy becomes more and more comfortable the further you slide into it. Instead of a hellishly tight vice, it molds around your " + pc.cockDescript(x) + " into a warm, slick glove that could have been tailor-made for you.");
	//Lose cockginity!
	pc.cockChange();
	output("\n\n<i>“Mmmmm,”</i> the cute little lizard-woman coos from her place on the ground. She’s drooling a little down her cheek, the one that’s smushed flat against the ground, and her fingers are resolutely playing across her dick-dilated entrance, mopping the dripping juices up with her palm. Sometimes she even clutches at your cock and pulls, trying to drag you further into her. The raskvel’s scaly legs twitch nervelessly as you slide home, deforming her belly in the outline of your [pc.cock " + x + "].");
	if(pc.cocks[x].cLength() > 14) output(" There is no increase in resistance or blockage to stop you. Perhaps the closest thing is a slightly tighter ring that could be her cervix, but there’s been no complaining from the woman below. She takes you until you’re past the halfway mark of her belly.");
	//Huge cocks only
	if(pc.cocks[x].cLength() > 14) 
	{
		output("\n\nThe alien’s other hand comes up to cradle her distended belly, cupping your immense maleness with a hand through her stretched scales. She gives an affectionate squeeze along your urethral bulge that makes you twitch and groan, releasing a tiny squirt of pre-cum inside her to ease the passage. A knowing smile spreads across her face at this, and she pulls her other hand away from her overflowing cunt to stroke you, jacking you off inside her. The sensuous touches are nearly too much for you, and you haven’t even crammed your entire cock in yet! You rock your [pc.hips], lost in the tight snatch, the unsubtle caresses, and the heat of the moment.");
	}
	//Extra cock
	if(pc.cockTotal() > 1)
	{
		output("\n\nYour extra erection");
		if(pc.totalCocks() > 2) output("s slide");
		else output(" slides");
		output(" through her blessedly slick thighs. Her horny, puffed-up pussy is soaking wet with her pussy’s copious secretions. Their unintentional trembling causes her deliciously warm thighs to vibrate your spare dick");
		if(pc.cockTotal() > 2) output("s");
		output(" with pleasant, smooth-scaled caresses. You sigh and push forward further, nestling directly into her intercrural embrace until you start to mix your pre with her plentiful, vaginal moisture.");
	}
	//RESUME!
	output("\n\nGroaning in bliss, you feel your [pc.sheath " + x + "] contact her squishy-soft cunt-lips");
	if(pc.balls > 0) output(", your [pc.balls] slapping heavily against one of her stiff buzzers");
	output(", both of you shuddering in ecstatic relief at the feeling of being fully joined. You hold her like that for a moment to enjoy the simple pleasure. She seems equally pleased, only daring to roll her hips up and down and squeeze you with affectionate, internal muscles. The hot tightness clinging so tightly to your [pc.cock " + x + "] fills you with temporary contentment that is only ebbed away by the growing desire to cum, to climax so tremendously that you fill this petite alien with your [pc.cum].");
	output("\n\nYou pull back slowly, inching your length out with sensuous slowness, both of you shuddering from the pleasant friction along your genitalia. The randy little raskvel whimpers at the slow emptying of her channel, begging, <i>“No... put it... put it back in. P-please!”</i> Her eyes close and her body shudders. <i>“I need... I need more!”</i>");
	output("\n\nYou don’t have the intention of leaving the lizard-woman empty for long, but you do keep pulling back, releasing your girl-glossed fuck-pole from its squeeze-happy prison long enough for it to shine in the open air a moment. Then, you push it back in, far faster than the first insertion. Your [pc.cock " + x + "] slides into the pre-shaped passage with perfect, wet squelches. Dollops of slick cunt-juice squirt out around your penetrating pole, ");
	if(pc.cockTotal() > 1) 
	{
		output("splattering over your other erection");
		if(pc.cockTotal() > 2) output("s");
		output(", ");
	}
	output("shining her thick thighs and your own [pc.legOrLegs] with moisture. Inside the raskvel’s twat, you can feel the little folds as they slide over every ridge and vein of your manhood, all the way until you’re hilted once more. Satisfied groans fill the air around the both of you.");
	output("\n\nAgain, you yank back, going faster now, and plunge yourself back inside the alien’s sloppy cockvice, bouncing off her sweet little ass with quickening thrusts. You can feel her heartbeat hammering against your own through your [pc.cock " + x + "], speeding to match yours until the two organs are pumping blood through genitals in perfect, sexual sync. Her body has completely given in. The once demanding alien has turned into little more than a eager dicksleeve, surrendering herself utterly to you as you take her again and again");
	if(pc.tallness >= 50) output(", legs swaying futilely as your larger body has its way with her");
	output(". Her eyes are rolling back in their sockets as her purplish tongue drools out of her mouth.");
	
	output("\n\nDazedly babbling, the spasming alien begs, <i>“Cum inside! Let me have your eggs.... You’re so strong! Give me strong hatchlings, please!”</i> Her pussy quivers around you. <i>“Give me your cum!”</i>");

	output("\n\nPumping her with strokes equal parts hard, fast, and sure, you smile down on her, rubbing an asscheek affectionately as if to say, <i>“Sure,”</i> as her body jiggles from the quick, rough fuck. That seems to be all she needs. The raskvel’s legs and arms lock, and her pussy clamps down on your [pc.cock " + x + "] with orgasmic contractions, squeezing it from her pumped-up looking entrance all the way towards her womb");
	if(pc.cocks[x].cLength() >= 14) output(", where your [pc.cockHead " + x + "] is lodged");
	output(". Her eyes roll back until the vertically-slit pupils completely vanish, and a curtain of clear girlish goo erupts from her box, washing over your genitalia before puddling on the ground. You don’t slow or stop through all of this. If anything, you pick up the pace, intent on an orgasm of your own.");
	output("\n\nSagging when the bliss washes out of her, the raskvel goes completely limp in your hands. Her clenching pussy relaxes, making your strokes easier, and she mewls pathetically as you stuff her over-sensitive pussy full of your cock. You’re close now, and you redouble your pace, thrusting with such fervor that your [pc.hips] must look like a blur of motion. Your crotch is clapping into hers with loud wet impacts that can undoubtedly be heard for some distance, yet you have a hard time caring. You need to cum, even if the little slut got off first. Taking her in a two handed grip, you give her the dicking her teasing little pussy deserves until you feel the warm twinges that signal your orgasm welling up within you.");
	//Cocktail
	if(pc.hasCockTail()) output("\n\nYou instinctively twitch a second set of muscles and whip your [pc.tail] around lightning fast, spearing it into the raskvel’s empty pucker before she can react. The skin of your [pc.tailCock] is pulled back immediately, exposing the turgid mass to her sensitive anal walls. It fills her ass with thick, twitching cockflesh, immediately pumping out a thick blast of [pc.cumColor] release straight inside her bowels. The raskvel whimpers in distress and lust, her ass spasming wonderfully in a way that feels like she’s trying to squeeze the [pc.cum] straight out of your tool.");
	//RESUME!
	output("\n\nYou slam home one last time, slapping your");
	if(pc.balls > 0) output(" [pc.sack] into her bullet-hard frontal clit and your");
	output(" crotch against her rigid rear button. Blood surges into [pc.eachCock] as orgasm arrives, stretching the raskvel’s sopping-wet cunt with even more thickness, triggering a whole new avalanche of climatic contractions from her well-used mound.");

	var cumQ:Number = pc.cumQ();
	//NON KNOT:
	if(!pc.hasKnot(x))
	{
		output("\n\n[pc.Cum] rolls out of your [pc.cock " + x + "] in a wave. Between your internal muscles’ squeezings and the clutching tightness of the raskvel’s horny box, a veritable deluge releases into the unprotected, thirsty little womb. Your hands firmly hold the lizard-like woman’s hips against your own until you’re done");
		if(cumQ <= 500)
		{}
		else if(cumQ <= 2000) output(", not caring when her belly forms a noticeable cum-paunch.");
		else
		{
			output(", not caring when her belly rounds with your obscene");
			if(pc.virility() > 0) output(" virility");
			else output(" amounts of spunk");
			output(", pumping full of nice, hot");
			if(pc.virility() > 0) output(", fertile");
			output(" seed that is sure to turn that cum-dome into a proper, pregnant belly in no time.");
		}
		output(" Her hands massage her mound as she’s filled, gathering the dripping [pc.cum] into her hands and slathering it all over her ");
		if(cumQ <= 500) output("cock-distorted belly");
		else output("rounding belly");
		output(".");
		if(cumQ >= 10000) output(" When the pressure becomes too much a wave of [pc.cumColor] pours out from between her thighs, pooling on the ground below, she shudders and screeches in inhuman pleasure.");
		output("\n\nAs the passion drains from your body and into the small lizard-girl’s passage, you pull out");
		if(cumQ >= 500) output(", smiling at the gush of [pc.cum] that squirts from her overpressurized uterus");
		output(".");
	}
	//KNOT
	else
	{
		output("\n\nYour knot inflates as she squeezes, stretching her passage around the cunt-blocking bulb until it’s so well sealed that you couldn’t possibly pull out, even if you wanted to. You hold your new, lizard-like bitch in place while your animalistic organ does its work, pumping out shot after shot of [pc.cum] straight into her fertile passage. You don’t know much about interspecies breeding with raskvel, but your body is desperate to try. You can feel the warmth of your [pc.cum] filling her up as you ejaculate, and your knot ensures that not a single drop is wasted.");
		if(cumQ <= 500) {}
		else 
		{
			output(" The thick spurts round the raskvel’s trim tummy into a nicely-filled dome in no time, and her perfectly plugged pussy wrings you tighter in excitement at such treatment.");
			if(cumQ >= 2000)
			{
				output(" She’s less pleased when you continue to cum, filling her with");
				if(pc.virility() > 0) output(" nice, hot, virile");
				else output(" massive amounts of");
				output(" seed until that dome is stretched into a sloshing pregnant belly, her scales and skin shiny from how taut they’ve become. The pressure threatens to push you back out, but the elastic lizard-woman’s body gives just enough to let you enjoy the feeling of completely stuffing her snatch.");
			}
		}
		output("\n\nAs your passion wanes, your dick remains stubbornly knotted inside the small girl’s passage. She’s suspended on your [pc.cock " + x + "] like the breeding bitch she’s become, forced to let your [pc.cum] simmer in her vulnerable womb until your knot decides to deflate, which happens roughly thirty minutes later, after the last of your orgasm trickles its way inside.");
	}
	//EPILOGUE FOR BOTH
	output("\n\nShe slumps onto her side, still trembling, and smiles, rubbing her hands back and forth all over her belly while you ready yourself to resume your journeys.\n\n");
	processTime(30+rand(5));
	enemy.loadInCunt(pc, 0);
	knockUpRaskChance();
	pc.orgasm();
	processTime(5);
	CombatManager.genericVictory();
}

//Huge Dick Ear Jackoff?
public function hugeDickEarJackoff():void
{
	clearOutput();
	showBust(raskvelFemaleBustDisplay(true));
	showName("DEFEATED: F.\nRASKVEL");
	output("The little mechanic is way too small to take you, even with hips as stacked as hers, so you decide on another way to quench the fiery heat she’s stoked within you. She looks up at you ");
	if(enemy.HP() < 1) output("with an anxious expression that shifts into a lusty grin");
	else output("with whore-shaming quantities of lust pooling in her slitted eyes");
	output(" as you ");
	if(!pc.isCrotchGarbed()) output("stroke your burgeoning slab of cock");
	else output("free your immense slab of cockmeat from your [pc.lowerGarments]");
	output(".");
	output("\n\nSeeing her look, you ask, <i>“You like this, do you?”</i>");
	output("\n\nShe nods, licking her lips and spreading her legs to expose her plump, purple pussy. Juices run freely from her gash over her second clit and down her tail, soaking her scales. Those slitted eyes zero in on your [pc.cockHeadBiggest], and the raskvel’s previously lusty expression turns into one of concern. She folds her legs closed and whimpers, <i>“It’s too big! I’m stretchy, but that’ll break me!”</i>");
	output("\n\n<i>“How lucky you are that I don’t intend to stick it inside you then,”</i> you retort as you sit down next to her. You let a hand fall across her softly-scaled chest and begin to tweak and tug at a lavender nipple, admiring how smooth and soft her breasts’ scales are, feeling her nipples noticeably perk as you play. The aroused alien seems buoyed by this, and her salacious grin returns with a moan of pleasure, her face framed by the huge, floppy ears that are apparently typical of her race. You grab on to test. If they’re anything other than smooth, soft, and warm, you’ll have to come up with a better idea, but as soon as you touch the inside, you know this will work.");
	output("\n\nA texture comparable to the softest, plushes velvet slides across your thumb as it plumbs the raskvel’s luxurious listeners. The outside is fairly hard and smooth, covered with a coating of fine scales. They interlock so pefectly that you don’t feel any sharp edges, just slight indentations where they join together. Perfect.");
	output("\n\n<i>“Stop that!”</i> a quiet voice calls, drawing your attention from your inspection. The petite reptile-lady is breathing heavily and shivering at your touches. Her body has flushed darker, and one of her hands has wound between her legs. You stroke the velvety interior once more and watch her carefully, smiling when she bites her lip to stifle a moan. She’s getting off on this! You hold her ear in your other hand and run your fingers down it from top to bottom, smiling when she begins to shimmy and shake, panting out high-pitched whines of exquisite bliss.");
	output("\n\nShifting a bit further, you slide your hips up until you’re seated next to your captive fuckpet, your iron-hard mast towering so high over her that its shadow shades her face. You gather her ears together in your hands and smile down at her, wrapping them one at a time around your cock until you have two warm sleeves positioned at different points, perfect little handholds for you to squeeze and stroke with.");
	output("\n\nThe horny little lizard-girl is already quivering from having her ears used so, and she softly pants, <i>“N-no... don’t be so... so lewd!”</i> The last word is more of a feminine pleasure-squeal than a word. She licks her lips and stuffs three of her four fingers inside herself, groping her small, pert bosom with eager squeezes. Groaning, her eyelids flutter low, and she chews on her lower lip before cooing, <i>“Go on, jack off with my ears. You’ve gotten me this wet already.”</i> She pulls her hand away to show you how sopping-wet her pussy has become, and the squelching sound her emptying snatch makes as her digits departs is music to your ears. Webs of glittering girl-cum hang between her hand and her cooch for a brief moment before she pushes back inside herself, openly schlicking. <i>“Ungh! Please, hurry up!”</i>");
	output("\n\nNearly snickering at her abrupt shift, you squeeze down on your two perfect cocksleeves and begin to pump, reveling in the gentle textures as they tickle along your [pc.cockBiggest], squeezing you nicely as you twitch bigger and harder inside them. Pre-cum wells out of your cumslit almost immediately, trickling down the underside of your cock to collect in the first velvety wrapping. The inside goes slick with the slippery addition, frothing around the edges as you pump up and down. Your fists work faster and faster, sometimes twisting back and forth to add another layer of sensation to the exotic masturbation.");
	output("\n\nAt the same time, the " + enemy.skinTone + "-skinned creature is busy losing herself in the sensations assaulting her delicate psyche. Her inner ears must be wonderfully sensitive from the way she twitches and shakes with each stroke, and by the time your pre is dripping down to the second nearly frictionless cockpump, she’s cumming so hard her eyes are crossed and a six-inch purplish tongue is hanging down past her chin, twitching weakly as she keens through her bliss. She looks completely lost to lust, a sight that spurs you to stroke faster.");
	output("\n\nYour pre-cum is bubbling out so quickly that it’s almost a steady stream, and your [pc.cockBiggest] is swelling with tremendous need. You’re going to blow soon; you can feel it inside you. Not wanting to waste the heavy load, you roll over to straddle the recovering raskvel, pinning her arms to her sides (and her hands inside her). She protests for a second until the feelings radiating down her ears and into her skull overwhelm her verbal capacity, shutting down that portion of her brain with bliss so exquisite that she’s reduced to a babbling, cum-hungry mess. You pump your [pc.cockBiggest] faster and faster");
	if(pc.cockTotal() == 2) output(", completely ignoring your other penis");
	else if(pc.cockTotal() > 2) output(", completely ignoring your other penises");
	output(", hedonistically relishing in using this alien’s odd anatomy as your private masturbation tool.");
	output("\n\nThe heat of the act sets off a series of contractions inside you that make [pc.eachCock] jerk and spasm once, twice... thrice, and then you’re cumming, firing a load of hot [pc.cumNoun] straight into the air above your defeated once-foe. You lean back and angle your [pc.cockBiggest] forward to point away from yourself, keeping the spraying [pc.cumColor] goo firing up in long arcs that should deposit it on your blissed out companion. The tiny lizard-woman doesn’t seem to mind in the slightest, as her mouth gleefully opens to catch as much as she can. Her pussy gushes out under her, soaking everything below in fragrant girlcum, practically fountaining out from below as you paint her face.");
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 70) output(" Huge, hot gobs of the stuff spatter across her face, turning it into a [pc.cumColor] mask in short order.");
	output(" Some of the [pc.cum] drizzles down your length to soak into her ears, and they’re soon messy with your copious gunk.");
	if(cumQ >= 500) output(" You rain down enough for her to swallow mouthful after mouthful all while the pooling sexual release forms a massive puddle below her.");
	if(cumQ >= 5000) output(" If it weren’t for the porous nature of the ground below, you’d like be filling a lake by now, but instead your [pc.cum] is likely draining down into some abandoned subterranean dwelling. Or, perhaps there’s a lucky raskvel living down there, somewhere, about to get the pregnancy of her dreams.");
	output("\n\nAs your orgasm winds down, you unwrap yourself and let the raskvel’s ears fall away while you slide down. Once your spurting [pc.cockHeadBiggest] is low enough, you let loose one last spurt, right into her fist-spread lips, bathing her in the seed she seemed quite anxious for earlier. The raskvel shudders at this and begins to cum once more, nearly blacking out this time.");
	output("\n\nYou smile as [pc.eachCock] slowly starts to sag, losing tumescence as you prepare to move on. The defeated alien girl is scooping your [pc.cum] off her face and into her swollen twat as you leave.\n\n");
	processTime(20+rand(10));
	pc.orgasm();
	CombatManager.genericVictory();
}

//Face Riding
//Ride face and make stick tail up bum.
public function faceRidingRaskvelLadies():void
{
	clearOutput();
	showBust(raskvelFemaleBustDisplay(true));
	showName("DEFEATED: F.\nRASKVEL");
	output("Tossing your equipment aside, you loom over the defeated raskvel, unashamedly letting your eyes play over her perky breasts, wide hips, lengthy tail, and cute, feather-topped head. ");
	if(enemy.HP() < 1) output("She looks on in trepidation, but at the site of your [pc.vaginas] looming overhead, the beginnings of a smile appears on her mouth. ");
	output("Her tongue slips out of her mouth to play across her lips, giving you ");
	if(flags["TIMES_RODE_RASKVEL_FACE"] != undefined) output("another good look at one");
	else
	{
		output("your first good look at it");
	}
	output(". The purplish organ is long, judging by how it stretches and writhes. It’s also far thicker than you would have expected. Instead of being flat, like a human’s, the raskvel’s tongue is so thick that it is almost cylindrical in shape, tapered to a blunt point at its tip.");
	if(flags["TIMES_RODE_RASKVEL_FACE"] == undefined) output(" This is going to be more enjoyable than you thought.");
	else output(" This is going to be as enjoyable as you remember.");
	output("\n\nYou step over the prone slut, dropping your [pc.butt] down on her chest, squishing her tiny teats into your cheeks as you settle in. Her heavy pants wash across your [pc.vaginas] in warm waves, making you tingle with tickles of pleasure that are even now condensing into slippery, internal moisture. You settle in and scootch up to put [pc.oneVagina] up against her face, feeling the warmth of her saliva rub against your sensitive labia and rapidly-emerging clit.");
	output("\n\nYou command, <i>“Lick.”</i>");
	output("\n\nShe does. That thick oral organ plays across your exterior folds for a moment, slathering them in even more hot alien spit, mixing with your secretions as they begin to leak out of you.");
	if(pc.vaginaTotal() > 1) output(" The raskvel takes time to touch on each of your [pc.vaginas], giving all of them an equal share in tongue-love. One after another, she bounces between them until they’re all shining with a veneer of oral affection.");
	else output(" She slathers all over until you’re shining with a veneer of oral affection.");
	output(" Encouraged by this, you grab hold of her big, floppy ears and grind your [pc.hips] against her face, smearing her with your juices");
	if(pc.hasClit()) output(", shuddering when her nose bumps [pc.oneClit]");
	output(".");
	output("\n\nThe raskvel tries to say something, but all she accomplishes is sending lovely vibrations through your feminine tinderbox, stoking the flames of passion higher and higher. After a particularly pleasant, face-creaming twinge of excitement, you back off enough to let the pussy-painted girl talk.");
	output("\n\n<i>“Please be gentle with my ears,”</i> she begs, <i>“They’re sensitive.”</i>");
	output("\n\nThese things? You idly run your thumb along the inner lining of her long, flat ears. Her body shakes, and her pussy practically blooms, turning a deeper, darker purple while the lips open to reveal an entrance. A wicked idea strikes you then. A sexually stimulated partner will lick better than a bored one, after all. You begin to rhythmically caress her inner ear, watching the fluids leak down her legs and tail. She whimpers and trembles, lost in lust, panting out cute little no’s while her body says yes. Once she’s practically gushing juices, you grab hold of her thick tail and bend it double, plunging straight into her sodden box. The little slut’s pussy clamps down so tightly that you don’t think she could pull her tail out if she wanted to.");
	output("\n\n<i>“No... no...”</i> she pants.");
	output("\n\nYou stop touching her ears and grab her tail, stopping her from thrusting it in any further. Her protests stop immediately, and instead she gives a high-pitched mewl of distress.");
	output("\n\nThe raskvel cries, <i>“No-no-no... don’t stop!”</i> Her cheeks flush with color. <i>“Give me more, please. I want... need more.”</i>");
	output("\n\nNodding to her, you release her tail and resume your rubbing of her ears, watching the twitches of pleasure shudder through her muscles. <i>“This is the reward for being honest,”</i> you coo as you press [pc.oneVagina] back into her face");
	if(pc.balls > 0) output(", letting your [pc.sack] cover the rest of her head, forcing her to breathe in your musky aroma");
	output(". She sniffs at your sex for a moment before her tongue lashes out, whiplike, burying itself between your folds with the vigor of a soldier’s spear-thrust. Your channel goes from empty steaming box to stuffed quim in no time flat, and it couldn’t be happier about it.");
	output("\n\nThe raskvel’s tail begins to pump in an out of her vagina as she works. You’re surprised to see it disappear past the halfway point, where it’s something like six inches wide, into the petite creature. Her wide hips seem to have more uses than simple seduction, if the immense insertion is anything to go by. The faster her tail goes, the faster her tongue works, and she’s soon fucking your " + pc.vaginaDescript(x) + " with wanton abandon");
	if(pc.hasClit()) output(", piercing your lips one moment, slapping your [pc.clit] the next, and slathering your vulva with licks before going back inside");
	output(". The joining of cleft to mouth is so wet with spit and girlcum that sticky, bubbly strands connect the two of you at all times, even when your hips shake and pull away from the pleasure.");
	output("\n\n<i>“Atta girl,”</i> you coo as you let your body do as it will. Your [pc.hips] jerk in tiny little convulsions of pleasure against the cute raskvel’s face, slathering her from nose to neck in girlish goo. Meanwhile, you continue to play with her ears. You actually have one in each hand, teasing the edges, stroking the insides, and sometimes even pinching at them. Whenever you pinch, you can feel her thrust her tail inside herself hard enough to send a jolt through her whole body.");
	output("\n\nThe air is rife with the scent of aroused femininity, so thick that every cock in a four mile radius is likely erecting in tribute. Ecstasy is rising through your trembling honeypot");
	if(pc.totalVaginas() > 1) output("s");
	output(", and you’re helpless to resist it for long. You affectionately pet the feather “hair” that the raskvel has atop your head as you lewdly proclaim, <i>“I’m going to cum all over your face, baby. Get ready.”</i>");
	output("\n\nThe fuck-hungry alien doesn’t answer at first. Then, you feel something cold and mechanical against your butt-cheek. Is that....");
	output("\n\nKa-chunk! Ka-chunk! Ka-chunk! Three needles embed themselves into your [pc.butt] rapid-fire. Ooohhh, you are so going to... going to.... Mmmm, your puss");
	if(pc.vaginaTotal() > 1) output("ies are");
	else output("y is");
	output(" so fucking wet! You arch your back and cry in ecstasy as aphrodisiacs swarm through your bloodstream, making you twitch in spasm of complete, lusty bliss. You don’t register the gun being removed, but you hear it fire another couple of times into something. It doesn’t matter much to you, because your mind is utterly focused on your [pc.vaginas]. Everything is so hot and wet and pleasant that you could just melt out through your quivering flesh onto the alien’s purple, pussy-seducing tongue.");
	output("\n\nJuices ");
	if(pc.wetness() <= 1) output("stain her tongue");
	else if(pc.wetness() <= 2) output("fill her mouth");
	else if(pc.wetness() <= 3) output("bulge her cheeks");
	else output("splatter across her entire face");
	output(" as you climax with pussy-quaking intensity. You let out a keening wail");
	if(pc.cockTotal() > 0) output(" as [pc.eachCock] explodes, firing forgotten ropes of [pc.cum] into the junk");
	output(". Meanwhile, the raskvel screams into your twat, vibrating it with such pleasure that you nearly black out.");
	if(pc.vaginaTotal() > 1)
	{
		output(" Your unused puss");
		if(pc.vaginaTotal() == 2) output("y is");
		else output("ies are");
		if(pc.wetness() <= 1) output("leaking");
		else if(pc.wetness() <= 3) output("dripping");
		else if(pc.wetness() <= 4) output("squirting");
		else output("spraying");
		output(" [pc.girlCum] on her chest and shoulders, marking her with a lusty stamp of sexual approval.");
	}
	output(" You sag back, eventually falling off her face as your climax has its way with you. Soft coos of pleasure slip through your [pc.lips], matched by the slight alien babe beside you. Both of you just suffered mind-meltingly strong orgasms, and it takes a little while to recover.");
	output("\n\nLuckily, you’re able to master your excitement first and gather your things while the raskvel is still twitching through her aftershocks. You yank the needles out of your ass as you prepare to leave. The clever little bitch has a matching set in her own.\n\n");
	processTime(25 + rand(5));
	IncrementFlag("TIMES_RODE_RASKVEL_FACE");
	pc.orgasm();
	CombatManager.genericVictory();
}

//"Pay"
public function quotePayUnquoteFemRasks(tEnemy:Creature):void
{
	clearOutput();
	showBust(raskvelFemaleBustDisplay(true));
	showName("RASKVEL\nFEMALE");
	output("Well, you can always pay another way and hope she goes easy on your wallet....");
	
	setEnemy(tEnemy);
	
	//Dick Req
	if(pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity()) >= 0) raskvelGirlsSitsIfTheyFits();
	else if(pc.hasCock()) hugeDicksGetForceWorshippedByFemRaskvel();
	//Tail-pegging
	//Nondix
	if (!pc.hasCock()) getRaskVelTailPegged();
	
	setEnemy(null);
}


//Loss vs Raskvel Scenes
public function defeatRoutingForFemRasks():void
{
	var choices:Array = [];
	
	//Face-Sitting Footjobs
	//Dick Req
	if (pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity()) >= 0)
	{
		choices.push( { func: raskvelGirlsSitsIfTheyFits, arg: true } );
	}
	//Tail-pegging
	//Nondix
	if(!pc.hasCock())
	{
		choices.push( { func: getRaskVelTailPegged, arg: true } );
	}
	//Huge Dicks Get Dosed With Aphrodisiac While Being Forcefully Worshipped
	if(pc.hasCock() && pc.biggestCockVolume() > enemy.vaginalCapacity())
	{
		choices.push( { func: hugeDicksGetForceWorshippedByFemRaskvel, arg: true } );
	}
	//Get Pegged while Double Penetrating Her
	if
	(	pc.cockTotal() > 1
	&&	pc.cockThatFits(enemy.vaginalCapacity()) >= 0
	&&	pc.cockThatFits2(enemy.vaginalCapacity()) >= 0
	)
	{
		choices.push( { func: getPeggedWhileDoublePenetrate, arg: undefined } );
	}
	
	if (choices.length > 0)
	{
		var select:int = rand(choices.length);
		if(choices[select].arg == undefined) choices[select].func();
		else choices[select].func(choices[select].arg);
	}
	else
	{
		// Catch-all for un-accounted body types etc etc.
		// This was the only thing I could think of when I stumbled over some bug report, so fuck it.
		raskyNotInterestedInYerWeirdShit();
	}
}

public function raskyNotInterestedInYerWeirdShit():void
{
	showBust(raskvelFemaleBustDisplay());
	showName("LOST VS: F.\nRASKVEL");
	author("Gedan");
	
	output("<i>“Yeaaah! Showed you didn’t I!”</i> she exclaims over top of your crumpled frame, ");
	if (pc.HP() <= 0) output(" utterly beaten and unable to fight back against the raskvel.");
	else output(" utterly lost to your arousal at the hands of the raskvel.");
	
	output("\n\nShe rummages around with your [pc.gear] searching for a suitable tribute now that she’s victorious.");
	if (pc.credits >= 1)
	{
		output(" <i>“Score! I knew you were holdin’ out on me.");
		if (silly) output(" Silly fuckers, always gotta try to ice skate uphill,");
		else output(" Let this be a lesson for the next time!");
		output("”</i> she warns as she tosses a slightly-lighter credit chit onto your chest.");
		payRaskvel();
	}
	else
	{
		output("<i>Oh. Oh man, do I feel like a jerk now- you really didn’t have anything to pay me,”</i> she sheepishly admits, having discovered your total lack of credits. <i>“I, err- let that be a warning to you! Yeah! You better have something for me if we ever cross paths again, ya got it?”</i>.");
		output("\n\nSeemingly satisfied having chastised you for being a broke-ass space-bum she takes off in a flash, leaving you to");
		if (pc.HP() <= 0) output(" recover from your beating");
		else output(" cool yourself off");
		output(" some before you grab your [pc.gear] and set yourself back on your [pc.feet] ready to carry on.");
	}
	output("\n\n");
	
	processTime(3+rand(7));
	CombatManager.genericLoss();
}

//Face-Sitting Footjobs
public function raskvelGirlsSitsIfTheyFits(combat:Boolean = false):void
{
	showBust(raskvelFemaleBustDisplay(true));
	if(combat) showName("LOST VS: F.\nRASKVEL");
	else showName("RASKVEL\nFEMALE");
	//By Savin
	author("Savin");
	// Combat Loss: Have a Dick
	if(combat)
	{
		output("You slump to the ground, ");
		if(pc.HP() < 1) output("utterly beaten and unable to continue the fight");
		else output("far too aroused to fight; all your mind can think about is sex, and its irresistible need to get off");
		output(". Before you can try and move, to escape the little reptile-girl you were so sure you could handle, you feel tiny, leathery feet pressing down on you, pinning your limp body to the ground. You try to move, to pull yourself free of the domineering slut’s grip. She holds you fast, though, your body too ");
		if(pc.HP() < 1) output("battered ");
		else output("aroused ");
		output("to resist her.");
		output("\n\n<i>“Tsk, could have just paid the fee...”</i> she sighs, tossing her wrench-gun aside.");
	}
	// Pay the Fee & Have a Cock
	else
	{
		clearOutput();
		output("Well, let’s be honest. You don’t want to fight the little scaly slut, and the way she moves those hips and flaunts her pussy... you couldn’t resist that if you tried. You pull out a credit chit and toss it her way, and the tiny raskvel girl snatches it eagerly, stumbling to catch it. She looks awfully surprised when you decide to pay up, but the look of glee on her face is priceless. She must really need the cash!");
		output("\n\nBut just as you’re starting to warm up to the girl, her look of glee turns into one of lust, and she’s on you in a moment, tossing her wrench aside and pushing you down onto the ground. You decide to go along with it, letting her man-handle you onto your back, pinning you down with one of her warm, leathery soles.");
		// Combine
		//charge money
		payRaskvel();
	}
	output("\n\nThe raskvel leans down, her great big ears flopping onto your face as she pokes around at your gear, slowly stripping it off of your piece by piece. As she does so, she simply says, <i>“They’re sensitive,”</i> but the command is clear and present. You reach up and grab the wide, rounded ends of her floppy ears, rolling the thin, svelte flesh between your fingers. Your captor barely stifles a little gasp, suddenly struggling to pull your [pc.lowerGarments] off as you tease her. <i>“N-not so rough,”</i> she snaps, giving you a harsh slap on the thigh. You wince, but the way her scales flush a darker " + enemy.skinTone + " tells you you’re on the right track. You work your way up from the rims, your fingertips brushing and teasing across the interior, marvelling at the softness and warmth of them. In response, her body shudders, breath quickening as the raskvel tosses the last of your kit aside. You’ve nearly worked your way to the bases, starting to roll the floppy ears in your hands by the time she’s done, and she quickly pushes you back onto your back.");
	output("\n\n<i>“D-don’t even try to make me cum that easy!”</i> she snaps, righting herself. You get a clear glimpse at her shamelessly displayed cunt, and smile to yourself as tiny beads of lubricant dribble down, sliding down her thighs to dribble onto your exposed [pc.cockBiggest]. Your member stiffens in response, and the raskvel’s quick to grab it, squeezing your prick between her tiny, but surprisingly deft, fingers. She gives the rod a few languid strokes as she looks you over, her other fingers idly circling her cunt, flicking across her two alien clits.");
	output("\n\n<i>“Now... what should I do with a trespasser like you?”</i> she teases, putting a finger to her chin in a mock pose of thought. Your eyes are glued to her twat, hovering so close to your own hardening [pc.cockBiggest] that you can feel the heat blossoming from her dripping sex. She sees what you’re thinking all too clearly and giggles, sticking her long purple tongue out at you. <i>“Oh, no, you did </i>not<i> fly a bajillion lightyears all the way out to </i>my<i> planet just to stick your dick in an alien pussy, did you? Well, you’re mine now, so I’m going to show you how my people play!”</i>");
	output("\n\nShe says that with a certain primal hunger, eyes glinting as she scoots forward, knees pressing into the pits of your arms; her cunt hovers barely an inch from your chin, so aroused from the ear-wank that she’s practically pouring her lube out onto your neck. A slight shift of her hips brings it right to your face, the lower clit pressing into your lip. It’s a simple thing to suck it up, planting a kiss at its swollen head and sucking gently. The raskvel’s reaction is priceless, she barely stiffles a little whimper as you suckle her clit, biting her lip as her skin flushes darker. She starts to try and rebuke you, fist balling for another swat, but you cut her off with a sharper suck, your tongue darting into her puffy sex to lap at the free-flowing juices. She gives a whine of pleasure, breath catching as your [pc.tongue] probes into her sodden sex.");
	output("\n\nBut she soon regains her sense of dominance, and your [pc.cockBiggest] twitches as something hot and soft thumps into its rigid length. You look around the scaly girl’s big hips just in time to see her long, leathery tail slipping around your [pc.cockBiggest], and give a yelp of alarm as the surprisingly powerful muscles squeeze hard at your base, choking off any hope of cumming until she says so. Licking her lips, the raskvel plants her hands beside your head, using them for support as one of her legs slips back across your prone form, one of her four big digits tracing from stem to stern along the length of your cock. You shudder as the warm, soft, underside of her toes press along your bound, sensitive cockflesh, stroking you with surprising gentleness. Two of her toes wrap around you, squeezing your prick and tugging it with quick, furtive motions, moving on an off-rhythm with your own clit-sucking.");
	output("\n\nThe raskvel girl’s breathing becomes more and more erratic, chest heaving as you lick and suck, shifting from one clit to the other, letting your fingers dig into her huge hips to hold her steady as your eat her musky box, basking in the heat and slick wetness of her quivering cunt. She moans and whines, her foot-fucking becoming more and more jerky as your [pc.tongue] works her over, rolling around her walls between nibbling and licking her clits. Your [pc.cockBiggest] twitches in response to her footjob, basking in the soft soles of her alien feet, but the tight squeeze her tail’s putting on you keeps you from doing much more than leaking the faintest trickle of pre. You groan as the orgasm builds up inside you, impotently welling up inside your [pc.balls] as the raskvel’s hips start to buck and grind, dragging her honeypot across your face as she nears her own climax.");
	output("\n\nYou know just how to finish her off. You reach up behind the whimpering raskvel to the huge floppy ears dragging across your belly, tumbling across your [pc.chest] with every buck of her hips. You snatch the rounded ends of her ears, squeezing them roughly before tracing your fingers up the sensitive underside. With a sharp, gleeful cry, you suddenly find your face drenched in fem-spunk, the raskvel’s pussy squeezing down hard on your tongue as she cums, finally pushed over the edge by your relentless oral assault and the merciless teasing of her all-too-sensitive ears.");
	output("\n\nYou sputter and laugh, lapping up the oncoming flood of raskvel lube and cum as she cries her pleasure, grinding hard on your chin as she rides out her orgasm on your outstretched tongue, humping away with wild and vocal abandom, crying and moaning and screaming as her twat quivers and squeezes, trying to milk your [pc.tongue] like a cock, eager for seed that won’t come. As if on cue, the girl’s foot squeezes hard on your cock, jerking and spasming as she cums, and the foot-fueled orgasm practically overflows over her tail’s binding grasp. But not quite. You whine helplessly as her tail holds fast, keeping your orgasm pent up in your cum-swollen cock.");
	output("\n\nFinally sated, the small scaly girl flops back onto your belly, her foot releasing your prick, leaving just her tail holding you back from release. <i>“Mmm, I think you’ve earned the right to pass. For now,”</i> the raskvel says with a thin grin, barely able to prop herself up to face you. <i>“You offworlders sure do know how to pay a toll, dont’cha?”</i>");
	output("\n\nYou mumble an affirmative, helplessly bucking your hips in her tail’s grip. She gasps in surprise as if she’d forgotten about your trapped pecker, but quickly recovers as she hops up, dropping right back to the pose she’d had at the beginning, her slick snatch hovering over your [pc.cockBiggest]. Then, with a grin and a wink, she drops down onto it, taking your prick up to the hilt in one cum-slick motion. <i>“It’s all about the foreplay, offworlder,”</i> she giggles, and then the tail’s gone from your cock, leaving you blessedly free and ready to pop.");
	output("\n\nYour voice echoes to the heavens as your [pc.cockBiggest] bursts inside her, exploding in a hail of cum that splatters her womb with such force that slimy trails rebound back out, drooling back down your dick as she grinds on your prick, her pussy clenching hard on your [pc.cockBiggest] to keep every drop she can take, her muscles spasming to wring more and more out of your already pent up prick. Your member eagerly obliges, spurting and spurting until ");
	if(pc.balls == 1) output("your ball feels utterly emptied");
	else if(pc.balls > 1) output("your balls feel utterly emptied");
	else output("her belly looks positively bulging");
	output(".");
	pc.cockChange(true,false);
	output("\n\nYou collapse, panting hard as the raskvel whore drains the cum from your cock, taking her fill of your orgasmic offering to fill her alien womb. When she’s done, you’re left with ");
	if(pc.balls == 1) output("an aching ball");
	else if(pc.balls > 1) output("aching balls");
	else output("an aching cock");
	output(" and an utter satisfaction that has you drowsily watching the alien cum-slut pops off of your [pc.cockBiggest], a hand on her belly as she grabs her wrench and, blowing you a kiss, prances off. Credits and a belly full of cum seem like more than enough to sate these randy locals.");
	//If Silly:
	if(silly) output("\n\nMan this planet rocks.");
	else output("\n\nWhat a wonderful world.");
	output("\n\nWith a contented sigh, you gather your gear and, rubbing your sore, utterly emptied [pc.cockBiggest], you get ready to resume your exploration, eager to meet another of these sultry sluts.");

	processTime(20+rand(10));
	enemy.loadInCunt(pc, 0);
	knockUpRaskChance();
	pc.orgasm();
	pc.girlCumInMouth(enemy);
	if(combat)
	{
		//end combat
		output("\n\n");
		payRaskvel();
		CombatManager.genericLoss();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Tail-pegging
public function getRaskVelTailPegged(combat:Boolean = false):void
{
	//By Savin
	author("Savin");
	showBust(raskvelFemaleBustDisplay(true));
	if(combat) showName("LOST VS: F.\nRASKVEL");
	else showName("RASKVEL\nFEMALE");
	// Combat Loss: Don't Have a Dick
	if(combat)
	{
		output("You fall to your [pc.knees], too ");
		if(pc.HP() < 1) output("badly beaten ");
		else output("aroused ");
		output("to resist the slutty scaly’s advances. She grins as you succumb, sharp teeth flashing brightly as she drops the bulging head of her wrench to the ground, leaning on it as you collapse.");
		output("\n\n<i>“Tsk, coulda just paid the fee,”</i> she scolds, her voice playful as one of her hands deftly hooks into her clothes, neatly stripping herself bare with a flourish. <i>“Now that we had to do it the hard way, I guess I’ll just have to take a little... extra.”</i>");
	}
	// Pay the Fee: Don't Have a Dick
	else
	{
		clearOutput();
		output("Well, let’s be honest. You don’t want to fight the little scaly slut, and the way she moves those hips and flaunts her pussy... you couldn’t resist that if you tried. You pull out a credit chit and toss it her way, and the tiny raskvel girl snatches it eagerly, stumbling to catch it. She looks awfully surprised when you decide to pay up, but the look of glee on her face is priceless. She must really need the cash!");
		output("\n\nShe recomposes herself a moment later, leaning back against her wrench planted in the ground. <i>“Mmm, now wasn’t that easy?”</i> she teases, licking her lips, eying you, <i>“Just for that, I guess I’ll throw in something for you in return. You might not have a dick for baby-making, but I bet I can get your money’s worth.”</i>");
		//deduct credits!
		payRaskvel();
	}
	// Combine:
	output("\n\nYou follow her gaze as she hungrily takes in your body, eyes trailing from your [pc.legOrLegs] to your [pc.hips]; she makes a little twirling motion with her finger, and you slowly turn around, getting onto all ");
	if(pc.legCount == 2) output("fours");
	else output(num2Text(pc.legCount + 2));
	output(" and giving the little raskvel a perfect view of your [pc.butt]. A moment later, you feel a pair of small hands groping you, squeezing your ass appreciatively as she coos in delight.");
	//If small hips:
	if(pc.hipRating() < 10) output(" <i>“Not much for a rask, but... it’ll do, I guess,”</i>");
	else if(pc.hipRating() < 20) output(" <i>“Mmm, a " + pc.mf("boy","girl") + " with big ol’ hips... you off worlders know how to build ‘em just like us!”</i>");
	else output(" <i>“Daaaamn, those hips. I can’t wait to sink my fingers into these babies,”</i>");
	output(" the raskvel grins, giving you a sharp swat on the behind that makes your flesh jiggle. You feel her deft hands playing across your [pc.skinFurScales], slowly peeling your [pc.gear] off, tossing them carelessly aside before giving your bared ass a little squeeze and a spank as she circles around you, fingers brushing along your side until you shiver in anticipation of what’s to come.");
	output("\n\nThe little raskven spends nearly a minute winding her way around your body, caressing and teasing your [pc.skinFurScales], reaching around to squeeze a [pc.nipple]");
	if(pc.biggestTitSize() >= 1) output(" and cup a breast");
	output(" before finally standing before you, a pair of fingers stretching her bi-clitted cunt wide, the stretchy sex already beading with anxious lubricant, awaiting a cock that’ll never come. <i>“Alright, if you wanna get off too, you better get me started,”</i> she commands, presenting her pussy to your face, so close that her clits practically bump your chin and nose. It doesn’t take anything more than that to get you working; the scent alone wafting from her snatch, the potent aroma of sex and desire, is enough to lure your tongue out to drag from clit to clit, lapping at the sweet secretions of her womanhood. The raskvel’s entire body seems to quake at that first touch, her hands grabbing your " + (pc.hasHair() ? "hair" : "head") + " to steady herself as your [pc.tongue] probes ahead, lapping up a bead of feminine slime before pushing past her feminine folds. She accomodates you easily; a twat made to take cocks and lay eggs isn’t able to come down hard enough to stop your delving oral organ, only gently squeeze and massage it, slathering you in lube.");
	output("\n\nThe raskvel slut moans and groans, her " + enemy.skinTone + " scales darkening as you eat her out, hips slowly starting to grind against your face, bucking and squealing as your tongue goes deeper and deeper, her fingers " + (pc.hasHair() ? "digging through your hair" : "gliding across your head") + ". You take that as a sign of her enjoyment, licking harder, reaching deeper until she’s practically cumming around your tongue, her fem-slime pouring out to pool between your hands. Just as she’s on the verge, hips quaking and cunt spasming, the raskvel pushes herself off you, breathing hard, her tiny tits heaving as her knees quake.");
	output("\n\n<i>“T-that’s enough!”</i> she gasps, putting a hand to her chest, as if to calm her hammering heart. <i>“I’m not gonna cum before you. No way!”</i>");
	output("\n\nSo haughty all of a sudden! Well, on your hands");
	if(pc.hasKnees() || pc.isNaga()) output(" and [pc.knees]");
	output(", you can’t do much to stop her as the little raskvel gives you a rough shove, rolling you onto your back. You’re quickly greeted with a new view of the little slut’s drooling cunt as she straddles your shoulders, looking down into your eyes. You reach out to lick her again, but she grabs your tongue in between her fingers, tsking. Instead, she looks back over her shoulder, and you can feel something slithering across your belly, warm and soft and agile. Her tail brushes against your thigh, making you shudder instinctively. The tiny tip wraps around ");
	if(pc.legCount > 1) output("one of");
	output(" your [pc.legOrLegs], slithering down and down until you feel a sudden, sharp pressure against the tight-clenched ring of your [pc.asshole]. You stifle a gasp as she gives just the slightest push... and your muscles can do nothing to hold her back. The raskvel giggles maniacally as you writhe beneath her; her tail slithers in inch by inch, growing from her tiny tip to an inch wide, with more to go. You groan and moan and arch your back, breath coming hard as you’re utterly violated by the soft but powerful alien appendage. Her sinuous tendril is unstoppable, unrelenting no matter how hard your [pc.asshole] squeezes and wrings it. The raskvel pushes onward, thrusting up your ass until your stomach’s practically bulging.");


	pc.buttChange(100,true,true,false);
	output("\n\nWhen she’s confident you can’t take another inch, the cheeky raskvel doesn’t start to thrust or hump or anything that a cock-wielding creature would. No, she’s got something more insidious up her sleeves. She merely grins down at you, commanding you to lick again. You barely hear her over your own moans, your mind lust-addled and desperate for the release of the mounting urge brought on by your anal penetration. Desperately you move to obey, your [pc.tongue] lapping out to her quivering quim, probing past her loose lips....");
	output("\n\nAs soon as you do, she starts to wag her tail.");
	output("\n\nYour mouth locks open in a mewling cry as the raskvel slut’s tail starts to thrash and squirm, moving around inside you like a serpent, its movements undulating and wild. Your voice breaks, crying your pleasure as you nearly cum from the first moments of her sexual assault. But then she stops, holding deathly still.");
	output("\n\n<i>“Lick,”</i> she commands, her tail motionless inside you. Your hips wriggle, desperate for the overwhelming pleasure of her tail-fucking. <i>“LICK!”</i>");
	output("\n\nYou whine and comply, grabbing her big hips and diving in, suckling from one of her clits like a teat. In response, she coos and moans, cupping one of ");
	if(pc.biggestTitSize() >= 1) output("your [pc.chest] for support");
	else output("her small teats, squeezing a nipple");
	output(" as she starts to move her tail, letting it grind and slide and writhe inside you, and with that you cum, and cum hard. You scream, back arching as she slams her tail into you again and again, hammering a mind-shattering orgasm from you, your own cries masking hers as your tongue drives her over the edge with you, spattering your face with alien fem-cum.");
	output("\n\nBy the time you come back to your senses, the raskvel slut’s rolled off of you, clutching her clothes to her cum-smeared body, chest heaving. <i>“You off-worlders... I gotta get my toll from you more often, " + pc.mf("handsome","beautiful") + ",”</i> she winks, staggering to her feet. You meekly nod, feeling horribly, wonderfully loose after the mammoth tail-pegging you just received. The raskvel saunters off with a wink and a blown kiss, leaving you to collect your kit and leave the scene, [pc.legOrLegs] wobbling as you waddle off.");
	processTime(40+rand(20));
	pc.girlCumInMouth(enemy);
	pc.orgasm();
	//Incombat
	if(combat)
	{
		output("\n\n");
		payRaskvel();
		CombatManager.genericLoss();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Huge Dicks Get Dosed With Aphrodisiac While Being Forcefully Worshipped
public function hugeDicksGetForceWorshippedByFemRaskvel(fromCombat:Boolean = false):void
{
	showBust(raskvelFemaleBustDisplay(true));
	if(fromCombat) showName("LOST VS: F.\nRASKVEL");
	else showName("RASKVEL\nFEMALE");
	//HP loss
	if(pc.HP() < 1)
	{
		output("Collapsing on your back, you pant for breath as you try to recover. You can’t believe you were beaten by such a diminutive creature, let alone one with such simple goals. Even now, she’s striding over to you with a confident look on her scaley face. She comes to a stop a step away and scolds, <i>“You should’ve just paid the toll, now I’m going to take it out of your hide.”</i> She pulls the pistol off her hip. <i>“First let’s get you ready.”</i>");
		if(pc.tallness >= 60) output("\n\nYou’re pushed, pulled, and tugged for some time before the tiny girl is able to roll you");
		else if(pc.tallness >= 40) output("\n\nYou’re rolled over by the diminutive creature with some difficulty");
		else output("\n\nYou’re easily rolled by the diminutive creature");
		output(" as she strips you of your gear, leaving you naked and face down.");
		output("\n\n<i>“A little performance anxiety?”</i> the raskvel comments on your pained, unaroused state. <i>“Let me fix that.”</i> She presses a button on her pistol and presses it against your neck, pulling the trigger before you can even try to pull away. There is the snap-hiss of the device launching its projectile and a burst of pain.");
		output("\n\nYour whole body twitches from the hit, but almost immediately, the hurt from your injuries begins to fade. You yank the dart out of your neck to look at the empty container as your hurts vanish. She healed you? Before you can take advantage of your reinvigorated state, the gun is pressed against your ass. Three shots go off in rapid succession, drumming into you with such speed that they blur together into one big pinch of pain. If you were sleeping, you’d have awoken. Instead, the only waking up is your sex drive. Your heart thuds heavily in your chest as the chemicals wind their way through you, redirecting the blood from your brain to your groin in cock-filling, passionate pumps.");
		output("\n\nYou groan, <i>“Wha?”</i> as your [pc.cocks]");
		if(pc.cockTotal() == 1) output("surges");
		else output("surge");
		output(" up to ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" full size in seconds. It looms over the both of you as your hands stretch towards it, determined to bring you off as fast as possible. You aren’t just horny. You’re beyond horny. You need to cum as surely as you need to eat, drink, and sleep.");
	}
	//Lust loss
	else
	{
		output("You sink down onto your back, [pc.eachCock] erecting to its full, tumescent weight as it towers over your prone form. The ");
		if(pc.cockTotal() > 1) output("slabs of meat engorge");
		else output("slab of meat engorges");
		output(" so powerfully that ");
		if(pc.cockTotal() == 1) output("it ");
		else output("they ");
		if(pc.isCrotchGarbed()) {
			output("actually force");
			if(pc.cockTotal() == 1) output("s");
			output(" your [pc.lowerGarments] open");
		}
		else 
		{
			output("surprise");
			if(pc.cockTotal() == 1) output("s");
			output(" you with the quickness of ");
			if(pc.cockTotal() == 1) output("its ");
			else output("their ");
			output("growth");
			output(". With an immediacy born of desperation, you grab hold of your immense shaft in both hands and begin to desperately jack off, looking towards the smug little raskvel with pleading eyes.");
		}
	}
	//MERGE
	output("\n\nOpening wider and wider, the raskvel’s eyes grow large as she gazes upon your swollen mass. She whispers, almost worshipfully, <i>“It’s so... so big....”</i> Just when she looks about to ask if she can touch it, she shakes her head and steadies herself, standing a little taller and prouder. <i>“This isn’t your cock anymore, [pc.raceBoyGirlShort]. It’s mine.”</i> She places a palm on your urethral bulge, feeling it jump at the touch. <i>“My gigantic, cum-spewing... mmmm.... I wish I could ride you,”</i> she says, more to your tool than to you. She leans against it, hugging it in her lithe arms and nuzzling a smooth, scaled cheek against it. <i>“So perfect,”</i> she breaths against you.");
	output("\n\nThe exhalation causes you to groan with ever-increasing need, and your [pc.cockBiggest] thrums at her touches, responding far more strongly to her touches than your own fevered stroking. Her scaled feet kick your arms away, and she steps onto your wrists to pin them in place. Surprisingly her feet feel like super-soft, warm leather, and there’s enough give to keep the pose from paining you. You grunt and lift your hips to smear your [pc.cockBiggest] against her cheek, hedonistically wallowing in whatever sensation you can achieve. You’re bubbling up a nice dollop of pre-cum now, and some of it smears across the raskvel’s cheek.");
	output("\n\nGathering your early release on the underside of a claw-tip, she slurps it into her mouth for an experimental taste. She rolls it around her mouth before swallowing, wondering out loud, <i>“Is this what aliens taste like?”</i> She regards your [pc.cockBiggest] warily before licking her lips. <i>“Good,”</i> she remarks with a saucy smile, more to your penis than to you, <i>“I bet it’ll give me nice, round eggs, won’t it.”</i> She slobbers kisses against your [pc.cockHeadBiggest], sucking down the pre-cum as it emerges from desperately twitching shaft. <i>“Good " + pc.mf("boy","girl") + ",”</i> emerges from her throat in a warbling purr.");
	output("\n\nYou groan, muscles clenching wildly and out of time with each other, reveling in the feeling of exquisite hardness and yet heedlessly hoping she’ll give you release. You’re so distracted by your state that you fail to notice the cock worship momentarily slow. Three darts thump into the meat of your arm, but you barely feel them. They are but tiny pinpricks compared to a raging tsunami of pleasure and need that has enveloped your [pc.cockBiggest]. You pant as artificial heat overwhelms you. Pre-cum rolls out of your tip in long wet ribbons to be collected by the raskvel’s greedy, slurping tongue.");
	output("\n\n<i>“That’s better,”</i> the short, wide-hipped lizard-woman coos. ");
	if(pc.balls > 1) output("She steps off your wrist to gingerly squeeze one of your [pc.balls] with her supple foot. You can feel your ardor distilling down there, condensing into liquid love just waiting to be squeezed out, sloshing around under the tender affections of her sole. After a few such squeezes, she returns to stending on your wrist. ");
	output("She snuggles up against your cock grinding her vulvae against it so hard that her lips spread to either side of your urethra, the heated point of her noticeable clitty digging into you as she grinds.");
	output("\n\nThe raskvel presses her lips to your swollen cockhead and kisses it slow, plunging six inches of her tongue straight into your dripping slit. She sucks it back and swallows, sighing as she grabs an item off her belt. <i>“Some off-worlders went around giving out these things,”</i> she says, holding a condom. <i>“Said it was supposed to prevent disease or whatever, but how are we supposed to get pregnant that way?”</i> She gives your cock a worshipful lick and a hum in between sentences. <i>“I thought of a better use for it. When I find a big, virile stud who’s too big to fit inside me, I just wrap them up in this tight little package and let it collect all their jism.”</i> Both she and your cock shiver in anticipation. <i>“Then afterward, I can put the open end inside me and squeeze your dna-stuff into my womb. I’ll be sure to have lots of strong, wonderful eggs after that!”</i>");
	output("\n\nTearing open the sealed package with sharp teeth, the cum-harvesting creature sadly glances back at your [pc.cockBiggest]. <i>“I’m not going to get to taste anymore.”</i> Then she shrugs, already cheerful again. <i>“I’ll have all the cum I can handle, though!”</i> Her feminine slickness drips down the bottom half of your shaft all the way down to your ");
	if(pc.balls > 0) output("[pc.balls]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else output("taint");
	output(". Tightness wraps around your [pc.cockHeadBiggest] as she works, and you pump out another few droplets of pent-up lust into the tip as soon as it’s put in place. Your whole body is twitching with need at this point, and the touches, strokes, and tight condom are enough to keep you riding on the edge but unable to cum.");
	//Randomly choose one of the following bring to orgasm variants prioritizing PC endowment versions.
	var choices:Array = new Array();
	var select:int = 0;
	if(pc.hasCockTail()) choices[choices.length] = 1;
	if(pc.hasTailCunt()) choices[choices.length] = 2;
	select = choices[rand(choices.length)];

	//Self tailpeg
	if(select == 1)
	{
		output("\n\n<i>“What’s this?”</i> the raskvel asks as she notices your [pc.tails] thrashing. Your [pc.tailCock] has started to expose itself, humping against the ground to peel back its coverings. <i>“Is that another cock?”</i>");
		output("\n\nYou nod, biting your lip to keep from releasing an altogether too submissive whine. Giggling gleefully, she reaches down to grab it and pops it in her mouth. She sucks on it playfully, sure to keep it away from her teeth while her tongue slithers and slides along your sensitive tailskin. That organ is leaking as freely as the first after a few moments.");
		output("\n\nThen, the saucy little alien yanks it out of her mouth, regarding your wiggling organ for a moment before smiling cruely. <i>I think the big one will give me plenty, so why don’t I use this one to squeeze out a little more?”</i> She reaches down, bending to press your [pc.tailCock] to your [pc.asshole]. Wet as it is, she’s able to slide it in as easily as if it belonged there.");
		pc.buttChange(pc.tailCockVolume(),true,true,false);
		output(" Your prostate spasms at the sudden contact, and violently contractions spasm through your middle as building warmth seems to grow from within you. You dazedly announce, <i>“I... I’m cumming!”</i>");
	}
	//Tail docking
	else if(select == 2)
	{
		output("\n\n<i>“What’s this?”</i> the raskvel asks as she notices your [pc.tail] thrashing. The tip is leaking copious amounts of lubrication all over the ground as the flush, pussy-like lips part in excitement. <i>“Is that... a tail... tail-pussy?”</i>");
		output("\n\nYou nod, biting your lip to keep from releasing an altogether too submissive whine. Giggling gleefully, she reaches down to grab it and lifts it up high, sticking a finger into its folds experimentally. Your [pc.tailCunt] sucks her finger right on in, massaging it as if it could squeeze sustenance from the proferred digit.");
		output("\n\nSquealing with girlish glee, the raskvel yells, <i>“By the gear gods, I want one of these! I bet it feels sooooo good, doesn’t it?”</i>");
		output("\n\nYou moan.");
		output("\n\n<i>“I thought so.”</i> the horny girl lowers your [pc.tail] as she lifts her own. With one in each hand, she presses them together, sliding her narrow tip past the lips and deeper within. Her rearmost appendage is swiftly grabbed by your internal muscles and held deeper, pulled in until it’s almost painfully stretching your entrance. The additional penetrative pleasure is all it takes to push your mind past the brink, and hot flashes begin to wrack your middle, culminating in a bloom of pleased warmth. You dazedly announce, <i>“I... I’m cumming!”</i>");
	}
	//Get tailprobed
	else
	{
		output("\n\n<i>“I know just how to make you give up all that nice cock-cream,”</i> the raskvel announces with a little too much pride in her voice. She worshipfully plants another kiss upon your half-sheathed [pc.cockNounBiggest]. As she draws back, her tail slides up between your penis and her lithe form, wiggling sensually. <i>“I’m going to milk you like I do the boys back home.”</i>");
		output("\n\nYou open your mouth, but before you can say anything, she silences you by running her hand from your [pc.cockHeadBiggest] to your [pc.sheathBiggest], caressing the sensitive flesh and feeling around ");
		if(pc.hasKnot(pc.biggestCockIndex())) output("the supple interior of your sheath");
		else output("the taut base");
		output(". You can do naught but moan and bubble pre, arching your back in a way that gives her the perfect target for her sinfully smooth tail. It dives down into your [pc.asshole] with nary a word, slipping past your cheeks and deep into that darkest hole easily at first and then with greater difficulty as it widens, forcing you to spread agonizingly wide around.");
		pc.buttChange(80,true,true,false);
		output(" The further it in goes, the harder your [pc.cockBiggest] gets, until it begins to feel a bit like an inflatable toy that’s taken a bit too much pressure and is about to pop. At last, her tail curls up to press upon a hard knot inside you, and your muscles convulse, squeezing your lust into a hot warmth that’s spreading towards your cock at record speed. You dazedly announce, <i>“I... I’m cumming!”</i>");
	}
	//Orgasm!
	output("\n\nThe tip of that too-tight, latex-like enclosure already stuck out a bit, sort of like an uninflated balloon. Now, it stretches out in a titanic line nearly three feet above your pulsating prick. Again and again, lances of white-hot [pc.cumNoun] fire out of your [pc.cockBiggest], distorting the transparent enclosure into a rapidly-filling balloon of liquid passion.");
	var cumQ:Number = pc.cumQ();
	if(cumQ <= 10) output(" You fill it with a few drops.");
	else if(cumQ <= 75) output(" You fill it up to roughly the size of a small apple before finishing with a dopey, satisfied smile.");
	else if(cumQ <= 250) output(" You fill it up to roughly the size of a cantaloupe before finishing with a dopey, satisfied smile.");
	else if(cumQ <= 1200) output(" You fill it up to roughly the size of cantaloupe before firing some more, stretching the bubble out to the size of a basketball. It sloshes ponderously as it’s pulled down by gravity.");
	else if(cumQ <= 3000) output(" You fill it up to roughly the size of a basketball and yet somehow keep going, pouring more and more spunk into that taut enclosure until it’s the size of a watermelon and the pressure is forcing streams of your [pc.cum] back out the bottom.");
	else output(" You fill it up to roughly the size of a watermelon before the sloshing, liquid weight yanks the bulbous [pc.cumNoun]-tank down under its own gravity and keep going until it swells up to the size of a beachball. It sloshes ponderously back and forth with each fresh jet, the pressure so great that streamers of cum are shooting out the bottom of the condom even as you fill the top.");
	if(cumQ >= 10000) output(" In spite of your torrential climax, the condom seems to be as big as it will go, and each new blast just exits out around the seam at the bottom.");
	output("\n\n<i>“No more?”</i> the raskvel coos as she gently pats your twitching maleness. <i>“Just a few more drops for your toll, please.”</i> Her tail squirms inside you, squeezing out one last, huge spray of [pc.cum]. <i>“There we go.”</i> She withdraws from your anus while planting a chaste kiss upon your spent phallus");
	if(pc.cockTotal() > 1) {
		output(", carefully not to slip in the seed your other, unnattended boner");
		if(pc.cockTotal() > 2) output("s");
		output(" shot");
		output(".");
	}
	output("\n\nThe huge spunk-bubble is twisted off just past the top of your penis, and the whole mess is pulled away. The cool feeling of evaporating sexual juices causes [pc.eachCock] to shrivel faster while recover. Unfortunately, the raskvel has time to rummage through your equipment and tie off her prize before she goes. She even waves goodbye, saying, <i>“Thanks for the good time, love. Be a dear and come back later if you want to see how your juice took.");
	if(pc.virility() <= 0) output(".. if you’re a virile one, that is.");
	output("”</i>");
	processTime(30+rand(10));
	enemy.loadInCunt(pc, 0);
	knockUpRaskChance();
	pc.orgasm();
	output("\n\n");
	payRaskvel();
	if (fromCombat)
	{
		CombatManager.genericLoss();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Get Pegged while Double Penetrating Her
//Double peg raskvel!
public function getPeggedWhileDoublePenetrate():void
{	
	showBust(raskvelFemaleBustDisplay(true));
	showName("LOST VS: F.\nRASKVEL");
	var x:int = pc.cockThatFits(enemy.vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = pc.cockThatFits2(enemy.vaginalCapacity());
	if(y < 0) y = pc.smallestCockIndex2();
	//HP: 
	if(pc.HP() < 1)
	{
		output("Sinking down on your side, defeated, you look up at your petite subjugator with defiance in your eyes. Your token resistance did little to dissuade the alien woman from her goals. Indeed, she seems more determined than ever to wring her fine from you one way or another. You watch her warily as she closes the intervening distance");
		if(!pc.isNude()) output(", easily stripping your [pc.gear] from your body to leave you completely exposed");
		else output(", eying your prone, exposed body");
		output(", eventually locking her eyes on the ");
		if(pc.cockTotal() == 2) output("twin");
		else output("grouped");
		output(" masts that ");
		if(pc.lust() < 33) output("hang limply from your loins");
		else if(pc.lust() < 66) output("stick out somewhat stiffly from your loins");
		else output("jut out, hard and proud");
		output(". She licks her lips with a debauched glimmer in her eyes and a knowing smile.");
		output("\n\n<i>“Oh, quit it, you. You came on my planet and lost to me. You should be thankful that all I want are a few credits and a little fun. On some world’s you’d be turned into a slave or mulched into fertilizer,”</i> the victorious lady says flatly. <i>“I think you’ll find paying my fine to be more than worth your while, if you’ll just relax a little, you big stiffy.”</i> She idly caresses [pc.oneCock] with a toe. <i>“Yess, big and stiff...”</i>");
		output("\n\nAn undesired blush works across your [pc.skin]");
		if(pc.skinType == GLOBAL.SKIN_TYPE_FUR || pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output(", hidden as it is by [pc.skinFurScales],");
		output(" as your [pc.cocks] react to the slight creature’s toe-touches");
		if(pc.lust() > 66) output(", twitching hard enough to press against the bottoms of her feet.");
		else output(", filling and engorging so fast that their girthy shapes press against the bottoms of her feet.");
		output(" Her leathery skin is suprisingly supple down there, like the finest, softest leather money can buy, conforming wonderfully to your closest member. She squeezes her toes down, introducing a number of delicate wrinkles to the cock-filling foot-job. In no time flat, she’s taken your body from tired and injured to a sexual rut.");
	}
	//Lust:
	else
	{
		output("No longer resisting, you shed your [pc.gear] and collapse, grabbing a dick in each hand and pumping, stroking yourself with such eagerness that all previous thoughts of resistance are blasted out of your mind by raw, sexual ache. The raskvel, looking surprisingly imposing from your position on the ground, licks her lips and croons, <i>“That’s a good " + pc.mf("boy","girl") + ".... I knew you’d come around with enough encouragement.”</i> She daintily presses a foot down onto [pc.oneCock], stroking it up and down with the supple skin and occasionally squeezing it with her toes. You groan out loud and stop jacking off long enough to swivel towards her, presenting your multiple dicks to the victorious female, hoping she will continue to lavish such attentions upon your needy crotch.");
	}
	//Both continue
	output("\n\nThe raskvel smiles as you lose yourself in both the delicate folds between her toes and her prominent arches, rubbing [pc.eachCock] down with eager strokes, sometimes pushing down with just enough force that your [pc.cock " + y + "] becomes squished between your [pc.belly] and her dexterous soles. You shudder in enjoyment");
	if(pc.cumQ() >= 300) output(" and begin to leak dribbles of pre-cum from your tips, dribbles that are soon gathered on her foot to turn your dicks into a slippery mess");
	else output(", barely noticing when she upends a bottle over your crotch to douse your masculine bundle in slippery lubricants.");
	output(" She pumps your slick members nice and slow, working you into an eager mess.");

	output("\n\n<i>“Now that’s more like it,”</i> the scaled seductress croons as she reluctantly pulls her foot away. A glimmering web of translucent fluid appears and breaks apart just as quickly, snapping just before the alien steps away, dropping her gear to the ground in a heap. <i>“You didn’t think I was going to have you waste yourself on my feet, did you?”</i>");
	output("\n\nYou respond by plaintively lifting your hips afterward, and when that doesn’t work, you start to rise up after her, positively needing to bury ");
	if(pc.cockTotal() == 2) output("both ");
	else output("at least two ");
	output("of your dicks in her passages, particularly the purple interior of her soaking-wet cunt. She doesn’t allow that to come about. No, her foot, still stained with moisture and cock-scent, slams down on your chest");
	if(pc.biggestTitSize() >= 1) output(", right between your [pc.fullChest]");
	output(", pinning you you flat on the ground. She follows up before you can react, vaulting onto your [pc.hips] so that your [pc.cocks] are pinned behind her smooth-scaled bottom, one threading so perfectly between her cheeks that you nearly blow your load all over her lovely crack.");
	output("\n\nSmirking and flexing her cheeks, she squeezes that [pc.cock " + y + "] with teasing compressions of her surprisingly large bottom, rolling her hips from side to side to grind her purplish pussy over your [pc.skinFurScales]. You can feel both her clits dragging along, leaving a trail of potent femslime behind them, staining you with the tiny creature’s unmistakably girlish aroma. She giggles, high pitched and tittering, before admitting, <i>“I was kind of hoping you wouldn’t pay, ya know? Not with this much dick banging along here.”</i> She lifts herself up, letting that ass-dragging prick slip its tip against her clenching pucker. <i>“Be sure and let me know if you’re ever in the market for a wife...”</i> She twists a " + pc.cockDescript(x) + " past the ass-obsessed penis so that its [pc.cockHead " + x + "] nestles in between her violet lips, nestled deep in that juicy entrance without quite going inside. She whimpers. <i>“...or a harem girl.”</i>");
	output("\n\nYour start to answer, but before you can breathe a single word, her muscular thighs give a final quiver and turn to jello. Her body, slight as it is, is entirely supported on your [pc.cocks] for an agonizing moment. Her pussy gives up almost immediately, greedily spreading around your [pc.cock " + x + "] and swallowing the first few inches, canting the hungry slut forward so that she has to catch herself on your [pc.chest]. She groans in excitement and pinches playfully at your nipples, and then her rosebud relaxes enough to accept your [pc.cock " + y + "], the tight ring dragging along your secondary length with blissful pressure. You exhale so loudly that it sounds almost like a moan and lift your own [pc.hips] to accelerate the diminutive slut’s dick-descent.");
	pc.cockChange(true,false);
	output("\n\n<i>“Rowdy little, " + pc.mf("stud","she-stud") + ", aren’t ya,”</i> the double-stuffed raskvel cooes in between lurid moans. Her eyelashes flutter as she sinks deeper onto your paired shafts, convulsing and squeezing them with her internal muscles so tightly that you can feel yourself through her thin, inner walls. The two hard bumps that are her prominent clitties press rigidly against your lengths as she moves, both felt on your cunt-stuffing phallus and part of one against your ream-ready dick. You convulse slightly under the onslaught of sensation, faced with twice the pleasure any unmodded human would ever be able to experience and still somehow holding on. In spite of your shudders, the little dominatrix continues her journey towards your crotch, dripping wetness with such ferocity that the excess coats both your dicks.");
	output("\n\nSmooth-scaled butt-cheeks collide with your well-glossed loins as she finishes taking both your poles ");
	if(pc.hasKnot(x) && pc.hasKnot(y)) output("to their knots");
	else if(pc.hasSheath(x) && pc.hasSheath(x)) output("to their sheaths");
	else output("in their entirety");
	output(". The raskvel is panting atop you, a victorious grin plastered across her wanton expression as she leers down at you, ");
	if(pc.cockVolume(x) >= 100 && pc.cockVolume(y) >= 100) output("victoriously cupping the abdomen-distended bulges with her hand.");
	else output("victoriously shifting her curvy thighs in short little circles to remind you just who’s come out on top");
	output(". <i>“Mmm, a girl could get used to this kind of treatment,”</i> she lustily growls as she bends down to wrap a slender arm around your shoulders. <i>“Two big strong dicks at her beck and call? She’d have to know just how to use them.”</i> She ");
	if(pc.tallness <= 48) output("bites your [pc.lip]");
	else if(pc.tallness <= 60) output("nibbles on your [pc.nipple]");
	else output("kisses your [pc.belly]");
	output(". <i>“Luckily this girl knows exactly how to tame beasts like these.”</i>");

	output("\n\nThe petite scale-slut wraps both arms around your neck, arches her back up, and begins to thrust. Her juicy snatch glides a good four or five inches up your length, caressing you with the unusually puffy, sensitive labia that surround her passion-inflamed pussy. The clenching ring of her pucker tortures your " + pc.cockDescript(y) + " in an entirely different, much tighter way, squeezing down so tightly that it almost pains you. She holds there and begins to undulate her hips, rocking one side up and the other down, twisting your members through her tunnels, giving them an internal massage they’re unlikely to ever forget. The lewd schlicks and squishes are an irresistable, clarion call to your subconscious, a veritable siren’s call to orgasm that digs at your subconscious, commanding you to flood her cunt with spunk.");
	output("\n\nBefore you can give her the creaming she deserves, the gleeful little fuckdoll’s eyes roll back, and a torrent of fragrant femslime erupts from her twitching box, showering your groin with more of her lewd enjoyment. She whimpers, her mouth agape, and digs her fingertips into your back. You watch in awe as a fully six-inch long tongue rolls out of her mouth, and she quickly begins to kiss you with it, sliding it up the side of your jaw before she forces it into your mouth and begins to french you with alien abandon. Abruptly, she slams her fertile thighs back against your own, pinning you down and grinding her snatch and ass as hard against you as her body will allow.");
	output("\n\n[pc.EachCock] bloats anxiously, and you briefly struggle to control the climactic contractions of your abdominal muscles as they start you on the path to an explosive release. At the same time, the raskvel is already coming back down, locking eyes with you and intentionally contracting and squeezing her muscles to massage your members. She breathily pants, <i>“Give it to me, give me all that cum.”</i> She shivers and croons in ecstasy, starting a second orgasm of her own even as your body is quaking towards its own release. <i>“Give me your babies, off-worlder!”</i>");
	output("\n\nOn command, the " + pc.cockDescript(x) + " you’ve got ");
	if(pc.cocks[x].cLength() <= 14) output("hilted inside her");
	else output("rammed against whatever her species has for a cervix");
	output(" throbs and explodes, shooting lightning bolts of passion up your spine and [pc.cumColor] ");
	var cumQ:Number = pc.cumQ();
	if(cumQ <= 8) output("drops");
	else if(cumQ <= 50) output("ropes");
	else if(cumQ <= 250) output("wads");
	else if(cumQ <= 500) output("splashes");
	else if(cumQ <= 2000) output("torrents");
	else output("floods");
	output(" straight into the alien’s well-prepared womb. Her ass bounces off you as she begins to fuck you once more, restarting your orgasm before it even gets a chance to trail off. Her stretched anus gets a similar stuffing as you glaze the walls of her colon with [pc.cumColor].");
	if(cumQ >= 2000) 
	{
		output(" You shoot so much that there’s a gooey blob rolling out around each of your members as you fill her");
		if(cumQ >= 4000) output(", but those pale in comparison to the belly-bloating volume that’s stuck inside");
		output(".");
		if(cumQ >= 10000) output(" The raskvel quickly grows cum-gravid and insensate, lacking the strength to shake her body with the added weight and far too pleased to form cogent thoughts.");
	}

	output("\n\nThe now-familiar tongue worms its way into your mouth for another kiss, and you happily swap spit with the alien’s organ as the two of you come down together.");
	if(pc.hasKnot(x) || pc.hasKnot(y))
	{
		output(" She tries to pull off after a while, but your knot");
		if(pc.hasKnot(x) && pc.hasKnot(y)) output("s hold");
		else output(" holds");
		output(" her firmly in place. The alien shrugs and makes out with you until your genitalia decides to release her a little later.");
	}
	else output(" She pulls off not long after.");
	output(" Then, she dresses");
	if(cumQ >= 2000) output(" as best she can, given how thoroughly you filled her");
	output(" and bends down for one last kiss. There’s a snap of pain on your neck, and then you’re unconscious.");
	processTime(30+rand(10));
	enemy.loadInCunt(pc, 0);
	knockUpRaskChance();
	pc.orgasm();
	processTime(200+rand(50));
	//Pass time and lose some cash!
	payRaskvel();
	output("\n\n");
	CombatManager.genericLoss();
}

public function payRaskvel():void
{
	if(pc.credits - 100 < 0) pc.credits = 0;
	else pc.credits -= 100;
}

//Catch Raskvel Birthing Post Sex
public function catchPostBirthRaskvel():void
{
	showName("PREGNANT\nRASKVEL");
	showBust(raskvelFemaleBustDisplay(true));
	output("\n\nQuiet moans catch your ear, emanating from somewhere close by. Your attention piqued, you quietly look around for the source of the sounds. The source of the mewling sounds of pleasure obviously wants to remain hidden, but you find her all the same. There’s no hiding your surprise as you see a familiar-looking raskvel there, her legs spread akimbo, mouth open and panting. Her tail is twitching feebly next to her, and her eyes are half-closed. She’s not even cognizant of your arrival.");
	output("\n\nThe feminine alien is clearly riding some kind of orgasmic high, but incredibly, neither of her hands are at the sodden junction of her thighs. Instead, they’re both perched upon the gravid dome of her belly, rubbing at it with slavish devotion, worshipfully stroking her own smooth-scaled skin on automatic impulse. Her greedy, purple slit isn’t like you remember it either. It’s bigger, puffier, so swollen and engorged that you can’t help but wonder if it would feel any different than the last time you were inside it.");
	output("\n\n<i>“Ohhh, yes! Gonna have such big, strong eggs!\”</i> Her outburst catches you off guard, and you nearly stumble onto her, but catch yourself at the last minute. <i>“Mmmm... big... swollen... offworlder eggs!\”</i> The raskvel’s hips shudder violently, twisting back and forth.");
	output("\n\nWait a second... she couldn’t be... with.... Could she? You watch in fascination as one of your trysts comes to bear fruit, noting that an avalanche of girl-honey is pouring out of the shortstack’s double-clittied cunt. Her swollen lips part slightly to reveal a round alabaster surface. A solid, gleaming egg is forcing its way out of the slut’s steaming sex, spreading the soaked cunt so wide that you fear it will tear her in half. The raskvel doesn’t seem to feel an ounce of pain. In fact, she’s bucking her hips, her legs thrashing. Her hands haven’t left her belly, but the way they’re twitching, you’re surprised she’s able to hold them there at all.");
	output("\n\n");
	if(pc.hasCock() && pc.hasVagina()) output("A sudden surge of pressure in your loins wars with the increasingly sensuous wetness a hairsbreadth below. Either way, you bet the raskvel mother would put her delicious-looking tongue to work on your body. What do you do?");
	else if(pc.hasCock()) output("A welcome pressure in your loins asserts that she’d probably love something to suck on right now. Do you keep watching, or put the mother-to-be’s mouth to work?");
	else if(pc.hasVagina()) output("A growing slickness in your loins asserts that she’d probably love something to keep her mouth busy while she births. Do you want to put the mother-to-be’s mouth to work?");
	clearMenu();
	addButton(0,"Watch",watchDatRaskvelEggLayyyy,undefined,"Watch","Watch her lay the eggs, then go on your way.");
	if(pc.hasVagina()) addButton(1,"Get Licked",giveHerSumthinToLickSloot,undefined,"Get Licked","Offer her your pussy. She’d probably be into it.");
	if(pc.hasCock()) addButton(2,"Get Sucked",giveRaskvelSomeDongToSuckle,undefined,"Get Sucked","Offer her your cock. She’d probably be into sharing some pleasure with her babies’ daddy" + pc.mf("","-mommy") + ".");
}

//Give Her Something to Suck On
public function giveRaskvelSomeDongToSuckle():void
{
	clearOutput();
	showName("PREGNANT\nRASKVEL");
	showBust(raskvelFemaleBustDisplay(true));
	output("You make sure to make plenty of noise as you walk up to her");
	if(pc.isCrotchGarbed()) 
	{
		output(", opening your [pc.lowerGarments] as you go. Your [pc.cocks] flop out, free to rapidly engorge at the sight of your alien children’s slut of a mother");
		if(pc.cockTotal() > 1) output(", the biggest points as stiffly at her as a hound on the hunt");
		else output(", stroking your [pc.cocks] as you go");
	}
	output(".");
	if(!pc.isCrotchGarbed())
	{
		output(" It wouldn’t do to frighten the poor thing, so you give her the most soothing sight you can possibly conjure up - your ");
		if(pc.cockTotal() > 1) output("biggest dick");
		else output("[pc.cock]");
		output(" in your slowly stroking hand, fully erect and jutting in her direction.");
	}
	output("\n\nBlinking rapidly, the egg-blessed mother raskvel marshals her wits. <i>“...You... you came back...”</i> She shivers, spreading her legs wider to allow the egg to push forward until it’s nearly halfway out. <i>“Mmm... give me some of that,”</i> she coos, pointing at your dick and opening her maw. <i>“Can’t leave any c-cum for the other girls, can we?”</i> Visibly quaking, her body arches and violently expels the egg in a wash of feminine lubricant.");
	output("\n\nOnce her pupils come out from behind her eyelids, she purrs, <i>“Come here, egg-daddy.”</i>");
	output("\n\nYou smirk and sidle up to her with your [pc.cockBiggest] in hand. Juices pour from her supremely engorged pussy-lips in a steady flow, and her clits are so puffy they’re almost as thick around as little thumbs. Angled inward, they’re perfectly positioned to rub against the surface of the next egg to make an appearance. It’s a supremely erotic sight, but then again, so too is her widespread maw and flexible tongue. Her mischievous muscle flicks out to caress the underside of your [pc.cockHeadBiggest] then retreats to lacquer her lips in a thin veneer of spit.");
	output("\n\nThat taste is more than enough to get you to shove yourself up against her proffered palate. Thankfully, she keeps her shining lips tight enough around your intruding length to protect you from her teeth, and her tongue is rolled out across the bottom of her mouth like a hybrid of a slip n’ slide and a red carpet. Sucking deeply, the raskvel pulls you deep into her throat by vacuum force alone, using her fleshy purple tongue to stroke along the bottom and sides while her tightly-sealed lips provide an ‘o’-ring of too-pleasant friction.");
	output("\n\nYou hear her next egg splatter into the cummy mud beneath her, but you feel it more in the blissful purrs of pleasure that thrum through her throat. The raskvel’s eyelids droop low, fluttering in ecstasy. You can see flashes of her arms below you, stroking over the gravid expanse of her belly, encouraging more of her fertilized presents to make the journey to her squirting gates. She keeps sucking throughout, rhythmically bobbing her head and up and down your length, occasionally pausing to let out eggs and accompanying hums of delight.");
	output("\n\nLetting your own eyes drift closed, you focus on enjoying the sensations, listening for the wet ‘plops’ the eggs make as they land in the soaked, sandy soil. Sometimes you’ll take a peek at the miniature broodmother and admire the way she ardently sucks your cock while her wide-flared hips part around an oversized egg. The longer this goes on, the more vigorously she sucks you and the faster you hear the eggs fall.");
	output("\n\nYou can’t hold out anymore, not when you’re getting your [pc.cockBiggest] sucked this vigorously by your knocked-up alien slut. Grabbing hold of her long ears, you guide her in a few quick back-and-forth strokes to push you over the edge, and judging by her muffled squeals, her as well.");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 150) output(" She swallows your load without protest, though her eyes are rolled back in her head from the act of passing a gigantic egg at the same time.");
	else 
	{
		output(" She tries to swallow your load, but there’s so much [pc.cum] that ");
		if(cumQ < 500) output("it leaks");
		else if(cumQ < 1000) output("thick streams leak");
		else output("it hoses");
		output(" from the corners of her mouth");
		if(cumQ >= 2000)
		{
			output(", soaking the front half of her body in a reminder of your excessive");
			if(pc.virility() > 0) output(" virility");
			else output(" productivity");
		}
		output(".");
	}
	//Knot
	if(pc.hasKnot(pc.biggestCockIndex())) output("\n\nYou have to struggle to work your still-bloated knot out of her mouth. When you do get it out, it’s with a loud ‘pop.’ The raskvel shivers and releases her final egg into the sands, barely noticing as your still-cumming cock paints the bridge of her nose.");
	//No knot
	else output("\n\nYou pull out and hear a loud ‘pop.’ At first, you assumed she had still been sucking, even after you came, but when you pull back, you can see a huge, gleaming egg nestled against her supremely aroused netherlips.");
	output("\n\nYou stretch in total satisfaction and ready yourself to leave.");
	output("\n\n<i>“Wait,”</i> the raskvel calls, still laying bow-legged in the sands. <i>“You want one of your kids? Could you... show her the stars?”</i> She tries to sit up, but the mere act of attempting to close her legs causes her puffy purple slit to spray a fountain of orgasmic honey. <i>“Oooh... uh... if it’s... not too much trouble.”</i>");
	//[Take One] [Dont]
	processTime(19);
	pc.orgasm();
	clearMenu();
	addButton(0,"Take One",takeOneEggSloot);
	addButton(1,"Don’t",dontTakeARaskEgg);
}

//Give Her Something to Lick
public function giveHerSumthinToLickSloot():void
{
	clearOutput();
	var x:int = rand(pc.totalVaginas());
	showName("PREGNANT\nRASKVEL");
	showBust(raskvelFemaleBustDisplay(true));
	output("Making sure to make plenty of noise as you approach, ");
	if(!pc.isCrotchGarbed()) 
	{
		output("you ");
		if(pc.hasCock())
		{
			output("lift your [pc.cocks]");
			if(pc.balls > 0) output(" and [pc.balls]");
			output(" out of the way and ");
		}
		output("pat your mons, drawing the licentious reptile’s stare right where you want it.");
	}
	else 
	{
		output("you open your [pc.lowerGarments] to bare your [pc.vaginas], patting your hand on ");
		if(pc.totalVaginas() == 1) output("it");
		else output("one");
		output(" to guide the licentious reptile’s stare exactly where you want it.");
	}
	output("\n\n<i>“Y-you!”</i> the raskvel squeaks. <i>“You came back! I-I... I... mmm...”</i> She rocks back and forth, still rubbing her belly as the egg gradually spreads her straining hips. She shudders once, oozing yet more lubricant from her purple pussy, and shakes her head, trying to regain her composure. <i>“I never thought I’d see you again.”</i>");
	output("\n\nStill advancing and openly rubbing on [pc.oneVagina], you answer, <i>“I didn’t think I’d see you either.”</i> Moisture wicks its way onto your fingertips. <i>“And I definitely didn’t expect it to be this hot...”</i>");
	output("\n\nA pink glow radiates through the rask girl’s scaly cheeks, and she moans, <i>“I knoooow,”</i> as the egg slips from her slit, bathed in her gushing fluids. Her eyes cross from the sensation, and when she manages to look back up at you, her gaze is fixed on your [pc.vagina " + x + "]. <i>“Get over here. I wanna lick ya.”</i>");
	output("\n\nPerfect. You thrust your hips forward and present yourself for a good licking");
	if(pc.hasCock())
	{
		output(", flopping your ");
		if(pc.balls > 0) output("[pc.sack] and ");
		output("[pc.cocks] across her feathery hair. It tickles at your hardness, and you’ve got to admit, she looks damn good draped in dick");
	}
	output(".");
	output("\n\n<i>“");
	if(pc.totalVaginas() > 1) output("There’s so many...”</i> Her voice sounds almost breathless with wonderment. <i>“I think... I think I’ve got to get these for myself someday.");
	else if(pc.totalClits() > 2) output("Wow, you’ve got so many clits! I bet it feels fabulous when you lay, huh?");
	else if(pc.totalClits() == 2) output("It looks just like one of ours...");
	else if(pc.totalClits() > 0) output("Aww, you only have one clit? No wonder you offworlders hardly lay any eggs!");
	else output("Wha-? You have no clits! You offworlders sure are strange--how do you even lay any eggs without one?!");
	output("”</i> Her tongue stops wasting time on words and slithers out, snake-like toward your ");
	if(pc.wetness(x) < 3) output("dewy");
	else output("dripping");
	output(" mound. The first contact is electric, enough for you to lurch forward and plant your cunt against her face, nether-lips to lips. Resting one hand on the back of her head, you stroke down her sensitive ears, encouraging her muscular organ to plunge deeper, further inside you.");
	output("\n\nThe gravid slut’s lips");
	if(pc.hasClit()) output(" brush [pc.oneClit], gently sucking on it");
	else output(" kiss your labia");
	output(" while her tongue slithers deeper, caressing your innermost folds. At the same time, she moans, and, though the vibrations are muffled, it’s obvious that she’s creaming herself to eating you out and laying another member of your brood. You can actually hear the egg slopping out of her inflamed cunt and into the sex-scented mud below.");
	output("\n\nAgain and again, you hear the sound of her pussy slurping around another outsized orb as it passes one egg after another. She whimpers into your pussy but never stops her feverish licking, greedily devouring the [pc.girlCum] your [pc.vagina " + x + "] so freely offers her.");
	if(pc.hasClit()) output(" You can feel your internal muscles fluttering, fed by the pleasure sparking through your [pc.clits] like electricity through a live wire.");
	output("\n\nYou and the raskvel maiden both moan at the same time");
	if(pc.hasCock()) output(", and before you know what you’re doing, you wrap her ear around your [pc.cocks] and jerk them, milking your way to a cunt-shattering, dick-draining orgasm");
	else output(", and before you can really register what’s going on, her moan turns into a scream, vibrating your pussy into a cunt-shattering orgasm");
	output(". The near prehensile purple tongue inside you thrashes wildly, slathering your walls in raskvel spit and stirring you into an ecstatic frenzy. Shuddering against one another, neither of you notices the eggs slapping into the mud one after another.");
	output("\n\nYou fall over, dragging her with you as you go, humping, squirting, and spasming until you’ve left the raskvel’s face a slimy mess. Her tonguing is artless and distracted at this point, but it’s enough to keep your climax rolling for what feels like ages. It’s only when she feebly pushes against you that you finally pull away, allowing her to breathe.");
	output("\n\n<i>“F-fuck... you wanna... wanna take one of the eggs? Show ‘em the stars and stuff?”</i> The panting raskvel");
	if(pc.hasCock()) output(" wipes some of your [pc.cum] off of her ear and ");
	output("sighs contentedly. <i>“Our kids could see the stars, ya know?”</i>");
	output("\n\nDo you take one of the eggs?");
	//[Take One] [Dont]
	processTime(19);
	pc.orgasm();
	clearMenu();
	addButton(0,"Take One",takeOneEggSloot);
	addButton(1,"Don’t",dontTakeARaskEgg);
}

//Take One Egg
public function takeOneEggSloot():void
{
	clearOutput();
	showName("PREGNANT\nRASKVEL");
	showBust(raskvelFemaleBustDisplay(true));
	output("Nodding, you put a call in for a drone to come pick up the egg. That nursery your father set up must have a transport ship set to follow you around, because a speedy little robot shows up in minutes. After a quick scan, it confirms that it’s your offspring. You place the egg in its padded chamber and send it off, back to Tavros station.");
	output("\n\nThe mother is already passed out, and you note with a grin that her legs are still spread wide-open. At least her elastic cunt seems no worse for the wear - it’s closed as if she’d never been pregnant.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	
	addChildRaskvel();
	StatTracking.track("pregnancy/raskvel sired/day care");
	StatTracking.track("pregnancy/raskvel sired/total",flags["RASKVEL_EGG_COUNT"]);
	StatTracking.track("pregnancy/total sired",flags["RASKVEL_EGG_COUNT"]);
	StatTracking.track("pregnancy/total day care");
	
	flags["RASKVEL_EGG_COUNT"] = undefined;
	flags["RASKVEL_PREG_TIMER"] = undefined;
}
public function addChildRaskvel(numChild:int = 1):void
{
	// The eggs will hatch within a month, each containing a young Raskvel if fertilized.
	// The offspring are inquisitive, knowledge-hungry creatures that soak up information like sponges and mature enough to work and talk within a month or two.
	// Full adulthood and sexual maturity do not come for at least two years.
	ChildManager.addChild(
		Child.NewChild(
			GLOBAL.TYPE_RASKVEL,
			6.0,
			numChild,
			50, 50, 0, 0
		)
	);
}

//Don’t Take An Egg
public function dontTakeARaskEgg():void
{
	clearOutput();
	showName("PREGNANT\nRASKVEL");
	showBust(raskvelFemaleBustDisplay(true));
	output("You shake your head and turn to go on your way. The mother doesn’t protest any further, in fact, she’s already snoring as you leave - and still spread-eagled in the sands.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	StatTracking.track("pregnancy/raskvel sired/total",flags["RASKVEL_EGG_COUNT"]);
	StatTracking.track("pregnancy/total sired",flags["RASKVEL_EGG_COUNT"]);
	flags["RASKVEL_EGG_COUNT"] = undefined;
	flags["RASKVEL_PREG_TIMER"] = undefined;
}

//Watch as Normal
public function watchDatRaskvelEggLayyyy():void
{
	clearOutput();
	showName("PREGNANT\nRASKVEL");
	showBust(raskvelFemaleBustDisplay(true));
	output("The evolutionary reason for the raskvels’ exceedingly large hips makes itself known when an immense, one foot wide egg is halfway out. No normal woman could pass such a mass so easily or enjoyably, but the diminutive tart is doing so with gusto. She’s screaming out her moans now, her eyes rolled back until only the whites are visible, a long tongue drooling down the side of her face. She’s rutting out the egg an inch at a time, squirting juices every which way. Then, the ovoid mass falls out, still connected to its mother by strings of thick lubricant.");
	output("\n\n<i>“Fffffffuck yesssss!\”</i> the raskvel hisses before losing her voice to less cogent utterances of bliss. She cradles her ");
	if(flags["RASKVEL_EGG_COUNT"] >= 8) output("slightly ");
	output("diminished belly with a needy look on her face. <i>“More... more!\”</i> Her lips look even more swollen now, ludicrously engorged and flushed brilliantly purple. They shine invitingly, lacquered with liquid love and begging to be stretched once more. Luckily, they have not long to wait.");
	pc.lust(10+rand(5));
	//Few eggs
	if(flags["RASKVEL_EGG_COUNT"] <= 3) 
	{
		output("\n\nAnother white orb peeks from between the elastic alien’s folds, greeted by an octave jump in its mother’s exaltations of pleasure. She babbles happily, and her hands finally leave her diminishing belly to play with her tumescent clits, rubbing and gently tugging them in opposite directions, spreading herself even wider to ease the passage of her shell-bound young. She’s still cumming, still delirious with lust and quaking in place.");
		output("\n\nThe newcomer plops wetly into the muddied sand alongside its brother, kicking up a small wave of fragrant fluid. The raskvel’s pussy doesn’t even gape, snapping back to its old dimensions in a heartbeat, but another rounded ivory curve pulls it right back open. Her once-stuffed belly has already lost a great deal of mass, and if you had to guess, the egg sliding down her passage is the last of her litter. Fascinated and ");
		if(pc.lust() < 50) output("a little");
		else if(pc.lust() < 75) output("more than a little");
		else output("incredibly");
		output(" aroused, you watch her give a body-shuddering, juice-squirting climax, her hips lifting slightly on impulses beyond conscious control.");
		output("\n\nRolling out on a torrent of feminine slime, the egg comes to rest with the others, and the raskvel collapses on the other side, naked, legs splayed, and gently rubbing her tummy as she dozes off.");
		flags["RASKVEL_EGG_COUNT"] = 3;
	}
	//Medium Eggs
	else if(flags["RASKVEL_EGG_COUNT"] <= 7)
	{
		output("\n\nAnother white orb peeks from between the elastic alien’s folds, greeted by a wild spasm from its mother’s thighs and insensate babbling. The raskvel’s fingers finally cease their tracing of her gravid belly and sink down to the heavily engorged lips, yanking them open, spreading them so wide that the egg’s passage seems almost easy. She cums with surprising violence, screaming and moaning, but another egg has already found its way to her distended gateway, sliding out after its sister with an accompanying splash of girl-cum.");
		output("\n\nThe sticky mud beneath her cushions the rolling orbs as they exit the gravid rask’s quavering sex, cupping one egg after another. Her pussy doesn’t seem to mind passing the oversized ovoids in the slightest. Once her hands lose their grip on her sodden folds, it almost snaps closed... only to be forced open by the passage of another, still-larger egg.");
		output("\n\nThis time, the alien loses it completely. She collapses flat on her back when the pleasure of birthing robs her of her strength, cooing gently while her eyelids flutter closed. One of her hands manages to rub her scaly belly while the other finds a petite, pierced nipple to pull and tug upon. Her body’s on autopilot now, awash in the pleasures of motherhood, wriggling and writhing in supine bliss. She showers the swell of her too-large egg with more feminine honey as it passes, making its surface gleam and shine.");
		output("\n\nThe birthing-addict’s body isn’t done there. Smaller eggs come out of her faster now, one after another, landing next to their big sister with gentle splashes in the musky lake of their mother’s love. High-pitched whimpers and sighs of supreme relief accompany them. You can only imagine what the little alien must be feeling. Even unconscious, she’s grinning like an idiot and molesting her body.");
		output("\n\nOnly after a mound of " + num2Text(flags["RASKVEL_EGG_COUNT"]) + " eggs have piled up in front of her does the raskvel’s belly finally return to its formerly flat appearance. With a final, happy coo, she presses her fist past her top clit and into her passage, falling into a fitful rest that must be full of erotically-charged dreams.");
	}
	//High eggs
	else
	{
		output("\n\nAnother white orb peeks from between the alien’s outstretched lips only to reveal the cum-polished surface of another behind it, trying to crowd past the first. The raskvel whimpers, but a glance at her face shows you it’s in pleasure rather than pain. She’s biting a lip with a too-sharp canine, and her eyes have fluttered closed. Her fingers twitch like they want to journey south, want to grab her lips and pull them wide open and let the eggs spill out in an unending stream of reproductive bliss, but she’s too far out of it to do anything but flop back and quiver.");
		output("\n\nThe topmost egg abruptly pops out, launching a few inches in the air and rolling a foot or more through the estrus-slicked mud, followed shortly after by another... and another. The insensate raskvel giggles mindlessly and rubs her too-big belly, letting out sharp moans to accompany the launch of each new orb. You note that her clits are hugely engorged and angled inward. You wouldn’t have thought they could get so big without some kind of pump, but here they are, at least an inch long and quivering against the surface of every passing egg.");
		output("\n\nNo wonder she’s drooling all over herself and practically unconscious from pleasure. Her body is designed to get off on this!");
		output("\n\nYou watch in awe as egg after egg joins a growing pile in front of her, giving up on counting them after the tenth shining ovoid comes to rest in the red-tinted mud. The raskvel isn’t even making an attempt at consciousness anymore. Her eyes are closed and fluttering as if deep in a dream, and her fingers are weakly twitching against her rapidly-diminishing belly, stroking the still-taut scales with the unconditional love of a mother, or a total addict. It’s hard to tell which with these shortstacks, but your money is on the latter.");
		output("\n\nEven a prodigious birther like a raskvel has her limits, and as the minutes and eggs tick by, her endurance begins to flag. There are barely any eggs left by this point, but they’re expelled in slow motion, the gleaming surfaces slowly pushing out to lie with their sisters. Her belly goes flat a moment before the last egg appears between her thighs, but the sticky reptile doesn’t even have the energy to expel it. Instead, it sits there between her twitching thighs, ensuring that her slumber will be filled with the incredible sensation of her dual clits rubbing against an egg’s smooth surface.");
		output("\n\nAs she starts to snore, you can’t help but wonder if you were somehow responsible for all that.");
	}
	processTime(19);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	StatTracking.track("pregnancy/raskvel sired/total",flags["RASKVEL_EGG_COUNT"]);
	StatTracking.track("pregnancy/total sired",flags["RASKVEL_EGG_COUNT"]);
	flags["RASKVEL_EGG_COUNT"] = undefined;
	flags["RASKVEL_PREG_TIMER"] = undefined;
}

//Female Raskvel Anal
//FrankenApple
 //Female raskvel victory scene. PC dominates the rask girls’ ass. Available only on a combat victory. Needs a dick. Not for taurs. Somewhat evil in nature, therefore should increase PC’s personality score. I couldn’t find any pointers towards female raskvel anal capacity so I don’t know the maximum allowed penis volume.
 //[Punish] – Teach her a lesson about defeat.

 public function punishAFemRaskInTheButtWithFrankensteinApplesOrSomething():void
 {
 	clearOutput();
 	showBust(raskvelFemaleBustDisplay(true));
 	showName("FEMALE\nRASKVEL");
 	author("FrankenApple");
 	output("You quickly scan your surroundings, and sure as rust, you find a hunk of broken machinery lying in the shade. You haul your horny prize over your shoulder and move on to the spot you saw a moment ago. Unceremoniously, you plop the little raskvel onto the piece of junk. A puff of rusty dust rises around her and gets carried away by the wind.");
 	output("\n\n<i>“What’s going on?”</i> she asks with a clear hint of confusion in her voice. Without replying, you ");
 	if(!pc.isCrotchExposed()) output("take off your [pc.clothes], ");
 	output("place down your equipment and sit down next to her, letting your [pc.cocks] ");
 	if(pc.balls > 0) output("and [pc.balls] ");
 	output("dangle in front of the horny reptilian. It looks like curiosity and lust have taken the better of her as she locks eyes with your package, not even trying to run away at this point.");
 	var x:int = pc.cockThatFits(enemy.analCapacity());
	if(x < 0) x = pc.smallestCockIndex();

 	output("\n\n<i>“Are you just going to stare?”</i> You raise your voice. That’s all the encouragement she needs to jump at your [pc.cock " + x + "] and eagerly rub it with her tiny hands. Her strokes rapidly become longer along with your rising cock until you reach full hardness. <i>“Come on, prepare it.”</i>");

	output("\n\nShe replies with a simple, submissive <i>“Yes.”</i> Lolling her lengthy tongue out, she first dribbles some saliva onto your [pc.cockHead " + x + "]. Swishing her oversized ears over her shoulders to get them out of the way, she starts lightly sucking on your [pc.cock " + x + "]. This feels kinda nice...");
	output("\n\nToo bad ‘nice’ isn’t in your dictionary.");
	output("\n\nYou take an authoritative hold of a handful of the raskvel’s plumage and begin steadily forcing her deeper upon your [pc.cockNounComplex]. She is somewhat aware of what you’re doing, and tries to put up a meek resistance, but she is powerless in this situation. It doesn’t take long until you have pushed past her gullet, enjoying the delicious convulsions of her abused throat. You decide to stop there, since you want to blow your load elsewhere.");
	output("\n\nYou let go of her head and nudge her towards your lap. There, you seat the raskvel girl so your slobbery [pc.cockNounSimple " + x + "] is rubbing against the expansive crack of her behind.");
	output("\n\n<i>“Please, I want your strong baby maker deep in my pussy, kissing my womb,”</i> she begs you. That’s a tempting proposition, however it would defeat the purpose of this little punishment session.");
	output("\n\n<i>“You think you deserve it after embarrassing yourself by losing like that?”</i> you chide. She doesn’t reply, looking down in shame. <i>“I thought so. Up the pooper it is then.”</i> You sigh and lift her feeble body by her disproportionately large hips. Her eyes widen in shock as she realizes what that means for her. For a split second it looks like she wants to protest, but it’s too late for that.");
	output("\n\nYou align her dark blue pucker with your [pc.cockHead " + x + "] and firmly press her down. Your [pc.cockNounSimple " + x + "] glides past the entrance with ease thanks to the earlier lubrication, her colon expanding to accommodate your encroaching girth. You look at your bite-size lover’s face only to be met with a sour-looking pout. She must be pretty pissed off about not getting it in her pussy. Regardless, you resume lowering her onto your girth until, eventually, you bottom out. <i>“How does it feel, taking the whole thing?”</i>");
	output("\n\nShe doesn’t reply, instead trying to pull off a smug grimace in spite of any discomfort. You lightly gyrate her hips in circles on your girth to coax out a reply. It proves to be very effective as she starts moaning in a flash. She finally understands that there is no point in fighting it and rests her body against yours, mushing her face in your [pc.chest]. With that out of the way, you begin bouncing her up and down at a brisk pace, eliciting more of her frustrated, lustful moans. It doesn’t feel nearly as tight as you’d expect it to be... Good thing there is a way to fix that.");
	output("\n\nWithout a warning, you grab the raskvel’s ears and tug them, causing her asshole to clamp down with amazing force – much better!");
	output("\n\nHer protests have completely caved in by now – she bounces on your [pc.cock " + x + "] with newfound vigour, all by herself. You can feel an orgasm approaching rapidly. Now is a good time to go all out. Still holding onto her ears, you slide down their lengths, press them firmly together, and begin rubbing the undersides together like a couple of rags. The onslaught of pleasure coming from her ears is too much, and her humping kicks into overdrive, sending you over the edge in turn.");
	var cumQ:Number = pc.cumQ();
	if(pc.hasKnot(x)) 
	{
		output("\n\nYour knot mistakenly locks, leaving the little, thoroughly fucked buttslut stuck on top of your [pc.cock " + x + "] while you unload the content of your [pc.balls] inside her.");
		//lotsa cummies:
		if(cumQ >= 2000) output(" Her belly visibly swells under the gut straining pressure of your [pc.cum].");
		output(" You might as well use the opportunity to lie back and have a short rest. The knot stays inflated for a good thirty minutes. That would have been a somewhat peaceful break for you if not for her constant incoherent babbling and blissful drooling.");
	}
	else
	{
		output("\n\nYour member spasms, pumping seed deep into her colon.");
		if(cumQ >= 2000) output(" Her belly visibly swells under the gut straining pressure of your [pc.cum].");
	}
	output("\n\nFeeling positively spent, you pull the raskvel girl off and lie her down next to you. While recollecting your stuff ");
	if(!pc.isCrotchExposed()) output("and re-dressing");
	output(" you think you hear her squeak about you being the worst or something, but you can’t really make out anything. Giving her a last goodbye spank, you depart. Maybe she will think twice next time before attacking someone.\n\n");
	//+1 Hard Personality Point
	pc.addHard(1);
	if(pc.hasKnot(x)) processTime(45);
	else processTime(15);
	pc.orgasm();
	CombatManager.genericVictory();
}
 public function raskvelFemaleGetWorshiped(kok:int=0):void
 {
 	clearOutput();
 	showBust(raskvelFemaleBustDisplay(false));
 	showName("FEMALE\nRASKVEL");
 	author("William");

	if (enemy.HP() < 1)
	{
		output("Folding your [pc.arms] indignantly, you gaze at the defeated tollkeeper. The cobalt-scaled raskvel’s post-battle heaving jiggles her thick frame in all the right ways, taking your frustrations at nearly being mugged and carrying them on lapping, squishy waves. Yeah, you could flip her over and rail her until she’s burdened with young... but that’s just what this scavenging lizard expects. Instead, you’ve got a better idea, one that’ll teach her a good lesson.");
		if (pc.isCrotchExposed()) output(" You get her attention by patting your [pc.cocks], running a hand down " + (pc.cockTotal() > 1 ? "one" : "the") + " shaft.");
		else output(" Getting down to business, you run a hand over your bulge to get her attention and free up your [pc.cocks], letting " + (pc.cockTotal() > 1 ? "them" : "it") + " dangle in the air.");
	}
	else
	{
		output("The lurid squelching of unrestrained female masturbation washes over your racing thoughts, putting pause to abstract thinking and giving rise to emotional impulse. Any annoyance you had at being the lizard bandit’s mark dips into a distilled ocean of schlicking juices to be masked by a fog of girlmusk. Watching the cobalt kobold arch back and see to her sopping-wet cunt drags your body heat to your [pc.cocks]");
		if (pc.isCrotchExposed()) output(" swelling you to half - mast.");
		else output(", swelling the bulge in your crotch.");
		output(" She badly wants you to fuck her, but that’d be too easy. Instead, you’ve got a good idea on how to teach her a lesson, and all it takes to get her attention is the promise of a deep dicking.");
	}
	
	if (pc.isBimbo()) output("\n\n<i>“C’mere sweetie, I’ve got a real nice treat for ‘ya!”</i> you sing, wiggling your hips and clapping your hands. <i>“We can forget about all that pointless fighting once you start apologizing!”</i>");
	else if (pc.isBro()) output("\n\nRolling your shoulders, you point her to the spot below your [pc.cocksLight]. <i>“Get over here. Now,”</i> you glare adamantly. <i>“Maybe I’ll get you off, too.”</i>");
	else if (pc.isNice()) output("\n\n<i>“Seeing as how I’m the victor, you should show me the proper respect, no?”</i> you smirk. <i>“I’ll fuck you, if you want it <b>that</b> badly.”</i>");
	else if (pc.isMischievous()) output("\n\n<i>“You should know how this goes, right?”</i> you grin slyly. <i>“Come here and show me how badly you need this... and I’ll think about taking care of you, too.”</i>");
	else output("\n\n<i>“That’s what you should have been doing the moment you saw me, bitch,”</i> you scowl. <i>“Come over here and make it up to me, and I’ll consider returning the favor.”</i>");
	
	output("\n\n<i>“Oooh...”</i> the blue-gray runt coos. She gets on all fours and crawls over with a sort of manic liveliness, dexterous tail dragging across the ground before working up to an eager wag. Present and accounted for, the bun-like slut is knelt down in the shadow of your manhood" + (pc.cockTotal() > 1 ? "s" : "") + ", dick-dilated eyes staring up full of hopes and dreams. Floppy ears twitch in delight at every witnessed throb; a dark spot of saturated soil spreads in the gulf of her plump thighs, and the accruing sweat lends the soft-scaled shortstack an attractive, glistening sheen. <i>“Ummm... c-can I have that?”</i> she finally asks due to your inaction, licking her lips when a [pc.cumColor] pearl of pre forms at " + (pc.cockTotal() > 1 ? "one of " : "") + "your [pc.cockHeads]. <i>“Please? Will you fuck me with that? I’m so horny! I really want your dick, alien!”</i>");
	
	if (pc.isBimbo()) output("\n\n<i>“Nuh-uh! Start wagging that tongue instead of that tail, cutie-pie!”</i>");
	else if (pc.isBro()) output("\n\nYou silence her with a wet cockslap. <i>“Lick it, then I’ll think about it.”</i>");
	else if (pc.isNice() || pc.isMischievous()) output("\n\nStepping forward, you direct " + (pc.cockTotal() > 1 ? "the" : "a") + " [pc.cockHead " + kok + "] to her drooling lips. <i>“Like I said, you’ve got to prove how much you want it.”</i>");
	else output("\n\nYou silence her with a wet cockslap. <i>“Lick it, then I’ll think about it.”</i>");
	
	if (!pc.hasBalls())
	{
		output("\n\n<i>“But you don’t have any balls! How can you cum?”</i> she cries in a fleeting moment of lucidity, recognizing a very crucial part of your maleness is missing. <i>“I won’t get anything!”</i>");
		output("\n\nYou assure her that she’ll get something out of this, all she has to do is trust in " + (silly ? "hentai logic" : "space-magic") + "!");
	}
	processTime(3);
	clearMenu();
	addButton(0, "Next", raskvelFemaleGetWorshipedNext, kok);
}
 public function raskvelFemaleGetWorshipedNext(kok:int=0):void
 {
 	clearOutput();
 	showBust(raskvelFemaleBustDisplay(true));
 	showName("FEMALE\nRASKVEL");
 	author("William");
	
	output("Rocking back and forth, the trembling raskvel’s thighs squirm on autopilot, agitating both of her fat clits.");
	if (pc.tallness >= 84) output(" Your titanic stature forces her to stand up in order to properly appreciate your [pc.cockNoun " + kok + "]. Two tiny hands begin by wrapping around the length, signaling the start of her dick-pleasing service.");
	else output(" She begins by reaching up to grab your [pc.cockNoun " + kok + "] in both tiny hands, starting her dick - pleasing ministrations in earnest.");
	output(" A low whine builds in the back of the grease-lizard’s throat, snuffed out the second she deploys her long, purple tongue to flick at your [pc.cockHead " + kok + "]. Thick bubbles of pre-cum dribble out to her aggressive lashings, saturating her wriggling muscle in fluid passion, eliciting a peep of delight from you.");

	output("\n\nThe most parched lips in the Tarkus wastes are suckling heedlessly from your urethra, puffing out slurping cheeks into spooge-filled bubbles. Eager gulps transfer the [pc.cumVisc] meal to the glutton’s belly, any and all excess dribbling down her chin. Being nose-to-meat with your virile firmness energizes her [pc.cockHead " + kok + "]-to-[pc.knotOrSheath " + kok + "] jacking, giving you just enough time to wonder how her hands are so delicate in spite of a blatantly hard lot. Her back straightens and her muscles tighten, gray cheeks blooming with arousal, flushing a deep, lovely lapis.");
	output("\n\nThe accumulating slickness on your juicy pole has her fingers vigorously gliding up and down the precipitous length head-deep in her sputtering maw. <i>“Too fast,”</i> you grunt, grasping one sensitive ear in your palm. <i>“Slow it down-”</i> You drag the slack-lipped rascal off your [pc.cockHead " + kok + "] just as another oral onslaught sets it to vibrating. Unsheathed and sizzlingly hot, it throbs out a solid rope of precum across her needy features. <i>“You’re going to please me properly - all of me - before you get my cum.”</i>");
	output("\n\nNow that she’s gotten a taste of cock, she’s calmed down enough to realize that you’re expecting some quality crotch worship. The prospect of learning about an alien’s dick this close and this in depth is a realization flashing brightly in her eyes like shooting stars. Her mouth parts again, this time puckering to the underside brim of your crown, kissing and coaxing. A sensual cacophony starts from there, throwing your focus into disarray as a fondly growled puff massages your filling spunk-tube - yours fills the pheromone-scented air with satisfaction.");
	output("\n\nInquisitive tinkerer’s fingers trace the largest veins atop your girth, stimulating optimal blood flow to your [pc.cockType " + kok + "] biology. Outsized ducts submerge into your titanium mass at their inspection, emerging only when the sweeping digits have passed. Her tongue slithers a serpentine path around your peak, tugging and stroking at the most sensitive spots she can find, squeezing at the neck with sublime gentleness.");
	if (pc.isBimbo()) output(" When the scaled bun peers up around your [pc.cockNoun " + kok + "] she finds a genuinely caring face devoid of condescension, rewarding her with compliments and headpats.");
	else if (pc.isBro()) output(" She tries her hardest to stay focused on your [pc.cockNoun " + kok + "], fearing the slightest changes in your dominant countenance. As you loom over her, guiding her suppliant head in one hand, you let her know she’s doing well with a light, breathy groan.");
	else if (pc.isNice()) output(" When the scaled bun peers up around your [pc.cockNoun " + kok + "] she finds a genuinely caring face devoid of condescension, rewarding her with compliments and headpats.");
	else if (pc.isMischievous()) output(" Peering shyly around your [pc.cockNoun " + kok + "], the quivering bun seems relaxed by what she sees: you looking down with a sly, satisfied grin, ushering her back into your pheromone-drenched " + (pc.isHerm() ? "hermhood" : "maleness") + ".");
	else output(" She tries her hardest to stay focused on your [pc.cockNoun " + kok + "], fearing the slightest changes in your dominant countenance. As you loom over her, guiding her suppliant head in one hand, you let her know she’s doing well with a light, breathy groan.");

	output("\n\n<i>“It’s umm... it’s really tasty,”</i> she says smilingly, palming your phallic flanks. Her flaring nostrils are only a centimeter or two away from planting down on your [pc.dickSkin " + kok + "]. <i>“And it smells really good. You’re gonna fuck me with this if I do a good job right? If I suck it?”</i> You answer by presenting more genitalia for the horny minx to lavish. Fixing her eyes on your prick, she declares, <i>“W-well I’ll take it all, just watch me, offworlder! Then you’ll breed me!”</i>");

	if (pc.cockTotal() > 1)	output("\n\nObviously accustomed to partners packing only one penis, your former foe overcomes her single-mindedness with your first dick to see to " + (pc.cockTotal() > 2 ? "another of your members" : "the other") + ", gripping it tight enough that you feel her thumb block the flow of spoo. <i>“Do all aliens have more than one? Does your kind have more than one pussy?”</i> Child-like glee brightens her fretful face as she sees to your many needs with intrinsic infatuation. <i>“That’s gotta be it, right? What if I got more pussies, then I could lay even more eggs for you!”</i> While her tongue licks and laps at her original target, she frees both hands to proffer a " + (pc.cockTotal() > 2 ? "multi-pronged handjob across your bushel of fuckmeat" : "double-grip handjob to the other") + ", enthusiastically servicing your fonts of virility.");

	output("\n\nPre and spit both dribble from your [pc.cockHeads], making a slippery mess of the panting kobold’s face. She doesn’t care that her eyes are webbed up in thickening " + (pc.isHerm() ? "herm" : "") + "goo, though. The petite girl <b>can’t</b>, not when her innate enjoyment of supplicating to dick is on full display, lending her an obscene visage. Squirts of jetting girlcum noisily plaster the ground behind her legs, but like a champion slut she maintains her balance, slavishly sucking and slurping at a " + (pc.cockTotal() > 1 ? "pair of cocks that only get harder and hotter" : "cock that only gets harder and hotter") + ".");
	output("\n\nThe slow shift from desperate blowjob to practiced pole-polishing has been a total delight to watch. Where her strokes go, her kissing lips follow. Every part of your worshiped [pc.cockNoun " + kok + "] is idolized and consecrated with blissful single-mindedness. When her tongue finishes a circuit of your girth, it starts all over again, lacquering your rod in desirous devotion. She wants to suck it. The <b>thirst</b> is visible on every inch of wildly affectionate muzzle.");
	output("\n\nShe wants that as badly as she wants to spread her legs and have her egg-laying hips split apart and her womb baptized in a shower of [pc.cumNoun].");
	if (pc.hasKnot(kok))
	{
		output("\n\n<i>“I’ve seen this before!”</i> she says, moving her tongue and hands down to your cock-girding knot. <i>“They keep cum inside when breeding!”</i> The flat of her oral organ plays across the veined surface of your bitch-breaking bulb like a calling curtain, imploring it to contract and grow just another inch wider. Plush lips inch closer, laying spit-soaked kisses on its orifice-plugging diameter. <i>“You’re gonna use that on me, right?”</i> Her tail wags to the left. <i>“I’ll bear all the kids you want! We can start a village!”</i> It wags to the right. <i>“I’m gonna get it, riiiiight?”</i> she asks, grinning devilishly when she squeezes it.");
		output("\n\n<i>Maybe</i> you think, enduring another needful arch.");
	}
	if (pc.hasSheath(kok)) output("\n\nCock-sheaths weren’t made to be teased, which is why when you register an intrusion on yours, it ignites a conflagration of pleasure that binds your spine in an electric rope of high-voltage pleasure. The tip of her tongue and ends of her thumbs are prying apart the walls of your genitalia covering, trespassing an interior never meant by nature to be traversed. <i>“See? I can make you feel good! You wanna stick it in now, right!?”</i> A maddening, reflexive action demands you pull away before you lose control; miraculously, you restrain your crackling libido, learning to love the sensation of being fondled in a rather depraved place.");

	if (pc.hasBalls())
	{
		output("\n\nUnsurprisingly, the overaroused raskvel’s adventure leads her to your [pc.sack]. Her eyes close and she bites her bottom lip, narcotic proximity to your spunk-generator" + (pc.balls > 1 ? "s" : "") + " seizing her up in reflexive ecstasy. She’s working so hard for something she wants so bad that when she reaches out to grab " + (pc.balls > 1 ? "one ball" : "your ball") + " she creams herself, squirting messily on flooded terrain. Mewls flutter through her mouth as she abandons your [pc.cocksLight] to fondle your bouncing [pc.ballsNoun], the orb" + (pc.balls > 1 ? "s" : "") + " fat and heavy with [pc.cumVisc] [pc.cumNoun]. Trembling palms handle the seed-laden contents indulgently and with absolute reverence. Being a looter by nature, she understands the value in " + (pc.balls > 1 ? "these weighty jewels" : "this weighty jewel") + ".");
		output("\n\nStrokes and squeezes bid your testicle" + (pc.balls > 1 ? "s" : "") + " to brew up a thicker load to reward the homage paid. Gentle caresses from the backside to the underpouch, then to the left and right wrap your churning mass in what feels like sparking cables. A small nose wedges itself into the juicy crease between your testicles and [pc.base " + kok + "] - deep breaths of sense-muffling ballmusk emblazon your scent into the rask’s mind forever. When her tongue touches down is when the wires go live, sending wave after wave of vibrating current through the layers of your vulnerable ballsflesh. You’re swirling on the edge of cummy bliss, athrill that you’ve found yourself such a dedicated nut-slut. Lustful massages weigh you down with an incredible load, dragging you closer to sloppy release.");
		if (pc.ballSize() >= 14)
		{
			output("\n\n<i>“They’re so big! They’re sooo big! How much is in there?”</i> she marvels, fingers vanishing into your seed-taut squish. <i>“I could rub them forever, and they’ll keep swelling up right?”</i> More or less. Even with both hands (and arms) she can’t handle your sprawling, sperm-thickened sack, but that’s just what makes them <b>so damn interesting.</b> She can <b>hug your [pc.balls].</b> She can sniff and lick and touch and tug and nibble- hell, she can fucking <i>juggle</i> " + (pc.balls > 1 ? "them" : "it") + "! It’s a plentiful expanse, a wellspring that could give life to a productive village all on its own, and all she has to do is love it. She doesn’t have to think, only warm herself in your reproductive vortex, respect the glory you carry, and hope to receive even a single drop.");
			output("\n\nAnd that hope right now is manifest in the cum-hungry zeal performing a full-body massage to your [pc.sack].");
		}
	}
	output("\n\nBefore you know it, she’s sucking your cock again. You only had a brief moment in time to enjoy the sweet, slow process of your [pc.cockHead " + kok + "] pushing past her full lips. Seven inches of thick tongue are coiling around your [pc.cockType " + kok + "] girth, pulling you further in to a wet, swallowing channel of slime and submission. She presses you hard to her cheeks, bloating her reptilian features with the shape of your saliva-slick skin. Your [pc.cockHead " + kok + "] encroaches on the narrow entrance to her throat, holding in place long enough for her pinioned organ to savor your taste.");
	output("\n\nThe raskvel’s eyes are transfixed on you, as if waiting for permission to be lanced.");
	if (pc.cocks[kok].cLength() >= 14) output(" There’s an almost hesitant look she’s giving, like she’s not sure if she can handle your mammoth meat. Past that emotion burns her hope. She wants cum, and she doesn’t care if it requires a little stretching to get it!");
	else if (pc.cocks[kok].cLength() >= 7) output(" Judging by the defiant look she’s giving, she doesn’t care that you’re already bracing her jaw with that slick stick. She just wants cum!");
	else output(" Judging by the proud look she’s giving, she can’t wait to do it.");
	
	output("\n\nOnce again you offer no answer, simply grabbing her ears and driving inside. Her gag reflex puts up token resistance before being flattened by the all-consuming need to deepthroat that put you in this position. The edge of your [pc.cockNoun " + kok + "]’s crown juts against her neck, clogging her windpipe like a too-tight cockring. Esophageal walls widen under duress; the raskvel’s head grinds in either direction, taut clenchings arresting your progress at random intervals, all while the scrappy mechanic’s fervor spills ceaselessly into the dead rock below.");
	output("\n\nPushing in, pulling out, pushing in; the frequency of your facefucking increases. Urges you can no longer restrain take hold, and she feels your descent through her entire head. <i>“You feel that?”</i> you ask. <i>“I know where you want this,”</i> you groan, mashing your pelvis to her face in long, throat-lubing thrusts. Her body shudders hard like the wrought slabs of metal littering this planet. <i>“Next time I find you-!”</i> you growl" + (pc.balls > 0 ? ", thrusting so hard that your [pc.ballsNoun] taste her sopping-wet face" : "") + ", <i>“...You’re gonna sit down... and spread your legs.”</i>");
	
	if (pc.cockCanSting(kok)) output("\n\nTo add to your argument, the chemical-bearing tendrils lacing your prick vent their payloads of libido-overloading fuck-venom. Her sensitivity rockets high into the atmosphere at a speed capable of obliterating an orbiting gabilani vessel. Her slitted eyes bulge outwards too, in that moment, before receding back out of overwhelming shock.");
	
	output("\n\nShe’s nodding vigorously, indecipherable gurgles of peaking ardor whistling out of the gaps in her strained fuck-pillows. <i>“You’ll spread your legs for me,”</i> you continue, <i>“show me your pussy... and let me decide... Nnnggh...”</i> Pre pumps in phallus-fattening quantities, pouring down her simmering throat. Her neck bulges outwards, and her small stomach expands inch by [pc.cumVisc] inch. <i>“...You’re gonna let me decide if I’m gonna make your dream of becoming a broodmother come true.”</i>");
	output("\n\nWhen you glide over her uvula again, another gushing puddle of femme-cum surges from her unused snatch. Her vertically slit eyes contract into fucked-silly bands of saturated happiness, and a string of seemingly impossible climaxes takes her for a roller-coaster ride - destination: who the fuck knows where. Something vaguely resembling a ‘yes’ and a cough comes up, but all you needed to see was her eyes rolling back to know that this little contract has been signed.");
	output("\n\nWith natural, rutting purpose, you ratify the deal by slamming forward in smooth rhythm Every [pc.knotBallsHilt " + kok + "]-deep, lip-squishing impact pounds your initials into her brain. Wordless pleasure answers your every follow-up question until there’s a frothy mix of hot slaver coating her and you in. When next this little bandit next sees you, she’ll make herself ready, beg for you to pump her full. She’s had all the time in the world to see your reasoning. Maybe after you’re done teaching her the finer points of negotiation she’ll see the pointlessness in hassling strangers for money.");
	output("\n\nThough, honestly, you doubt that very much. For now, she’s getting plenty of practice in sucking you clean on the backstrokes.");
	output("\n\nThe raskvel’s cheeks have almost completely sucked inwards, and her lips stretch forward in a whorish display that leaves no question as to her willingness to be your cumdump. Her tongue weaves across your urethral swell while every pre-smeared muscle clenches around your squeal-vibrated cockmeat" + (pc.cocks[kok].hasFlag(GLOBAL.FLAG_FLARED) ? ", triggering the expansion of your spunk-corking flare" : "") + ". The last of her breaths fade against your bloated dick, the length sliding effortlessly into her moist innards. A final groan of suffocated bliss and of needs unmet passes upwards, triggering your orgasm" + (pc.hasKnot(kok) ? " just moments before your knot succeeds in plugging her face like the exotic twat it is" : "") + ".");

	if (pc.cumQ() >= 5000)
	{
		output("\n\nThe rigor in your [pc.cocksLight] attains new heights and degrees of stiffness when [pc.cum] pumps through your fountaining cumspout. Seed-filled spooge surges past the rask-slut’s frenzied heart and into her heretofore dehydrated belly, filling it gravid with copious nut. Shallow strokes carry you in and out while you grip tight to her ears with all your might. The outline of your geysering pillar against her neck is unmistakable, inflating and contracting a few inches with each cock’s worth of rich sperm finding its way through on thick, neck-flooding streams of cascading goo. It’s not very long before the [pc.cumGem]-stuffed kobold’s innards are completely disjointed and drenched by load after load after sweet, [pc.cumFlavor] load works its way through her, looking for new places to inhabit. Spurting streams of the stuff flare out of her nostrils while the rest vacates from her crowded maw in angry liquid backblasts.");
		if (pc.cockTotal() > 1) output("\n\nWhile her body deals with the orgasmic fallout, it feels the launch of jetting [pc.cumNoun] from above and around. Your spare [pc.cocksLightIsAre] let fly zone-tainting wads of slick cream, braiding her in [pc.cumColor] muck. It’ll make all the other rask jealous, that’s for sure!");
		if (pc.cumQ() >= 10000)
		{
			output("\n\nUnable to halt your endless, demanding flow, the lop-bandit’s slender frame has been drowned in cum. [pc.CumColor] columns of [pc.cumNoun] join her cooling girlish lusts as your seed has literally nowhere to go but out her ass. Frothy jism pours out of her, and for a second you’re seriously concerned it might come trickling out of her ears." + (CodexManager.entryViewed("Rodenians") ? " Fortunately, raskvels have nothing in common with rodenians. At least, you’re pretty sure this one doesn’t." : ""));
			output("\n\nYou yourself are reduced to a crab-walking mess just trying to cope with the mountain-capping gush of baby-batter only now beginning to recede.");
		}
	}
	else output("\n\nThe explosive downward spurt of heated passion triggers a clinging, clutching effect that defies rational understanding. You know it’s impossible, but her undulating frame is pulling you further down, closer to her belly and, by extension, her womb. She’s not getting that fertilization she very much needs - yet - but this will do. The [pc.cum] racing past her O-ring lips, through spit-flooded cheeks, balloons her throat with the passage of seed-filled cream. Thick sperm surges into her cock-stuffed gullet, finding a home in the short-stack’s outstretching tummy." + (pc.balls > 0 ? " Your [pc.ballsNoun] rhythmically contract against her chin, feeding her an additional layer of churning-warm feedback." : "") + " A universal look of contentment flashes across her face, coming and going like the [pc.cumVisc] deluge into her belly." + (pc.cockTotal() > 1 ? " Rich yet thin arcs of [pc.cumNoun] shoot into her feathery hair and over it, drooling their way down the back of her neck and the backs of her ears." : ""));

	output("\n\nFresh, cooling [pc.cumNoun] streams out of almost all the raskvel’s open orifices. When you pull free with a wet, gratifying pop, she collapses to the ground with your words burned into her mind. She’s gotten a taste. Now all she has to do when she sees you again is get down and present, and maybe you’ll deign to show her cunt this kind work. You almost have to admire the way you’re leaving her... and feel at least <i>some</i> sympathy for the denial coursing through her veins.");
	output("\n\nFor now though it’s back to the trail. The insensate raskvel is lost in the raw, wonderful sensations of being " + (pc.cumQ() >= 5000 ? "cumflated" : "filled") + ", and will likely be resting there indolently for some time.");
	
	flags["FEM_RASKVEL_GOPRESS"] = 1;
	processTime(7 + rand(9));
	enemy.loadInMouth(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}
 public function raskvelFemaleMatingPressIntro():void
 {
 	clearOutput();
 	showBust(raskvelFemaleBustDisplay(true));
 	showName("FEMALE\nRASKVEL");
 	author("William");
		
	var tEnemy:RaskvelFemale = new RaskvelFemale();
	setEnemy(tEnemy);
	flags["FEM_RASKVEL_GOPRESS"] = 0;
	
	output("Clamors of rapidly shifting metal alert you to something happening just behind. You <i>smell</i> her before you see her: the raskvel you filled from before. She hasn’t even bothered to wash the [pc.cumColor] cum off, or her own stickiness. <i>“Hey! Pleeeeaase fuck me now, I’ve earned it!”</i>");
	output("\n\nWide, hungry eyes hump you (your crotch, really) like she’s spotted the juiciest piece of meat on Tarkus. She doesn’t do anything else but throw her raggedy clothes off, plop down, and lie back, pulling her heavy thighs apart to reveal the absolutely and amazingly soaked vulva. Dark cobalt lips are wide, drooling and <i>spitting</i> out burning ropes of steamy girl-saliva.");
	output("\n\nThe short-stack’s body, like most raskvel, is designed for vigorous breeding - the slopes of her savory, musky pussy are fat, swollen, a little rubbery at a peek, and proportionately girthy with her outsized hips.");
	output("\n\n<i>“I want it! Please fuck me, offworlder! I’m gonna go crazy if you don’t! This pussy is all yours, so stuff it full of cum!”</i> cries the heat-addled lizard-bun. Quavering breaths follow, overlapping the jingle of trembling ears and the heaving of wobbling boobies. <i>“Pleeeeaaaaseeee...”</i> she huffs - out gushes another torrent of instant lubrication. <i>“You promised!”</i>");
	
	processTime(2);
	clearMenu();
	if (pc.inRut())
	{	
		output("\n\nWhether or not you promised you can’t exactly care. That wet, willing presentation of hers lays bare the egg-laying womb ready to gulp down wave after wave of seed. The thought of turning down a damn fine lay cannot be found anywhere in your rut-addled mind. Hot, brutal growls assail her splayed ears while you walk forward, intent on laying claim to the slutty lizard begging to be bred into a glorious, babbling mess. Tiny hands paw naughtily at her flooding pussy, reacting jauntily to the pheromones of an active mate; every molecule of your biological broadcast is charged with baby-making intent.");
		output("\n\nIt’s time to fuck!");
		addButton(0, "Next", penisRouter, [raskvelFemaleMatingPress, enemy.vaginalCapacity(0), false, 0]);	
	}
	else
	{
		output("\n\nYour exact words were a little different: you told her you’d consider it. Still, your [pc.cocksIsAre] being persuaded rather easily by her willing presentation, burgeoning to full, precum-leaking mast. Every vein on your [pc.cocksLight] fills to capacity, making you ready to breed. The wafting scent of her aromatic cunt and the two beacons north and south of her agitated cuntlips pulse anxiously. Muscles flex in her legs and tummy, every part of her acutely sensitive to even light brushes of wind. You could hilt her in one stroke...");
		output("\n\nThis is undeniably a step up from being so rudely accosted before!");	
		addButton(0, "Fuck Her", penisRouter, [raskvelFemaleMatingPress, enemy.vaginalCapacity(0), false, 0],"Fuck Her","Mating Press the raskvel. She'll love it!");	
		addButton(1, "Leave", raskvelFemaleMatingPressLeave,undefined,"Leave","Nah, you're too busy.");				
	}	
}
 public function raskvelFemaleMatingPressLeave():void
 {
 	clearOutput();
 	showBust(raskvelFemaleBustDisplay(true));
 	showName("FEMALE\nRASKVEL");
 	author("William");
	
	output("It almost hurts to physically turn someone that ready away, but you <i>diiiiiid</i> imply clearly it wasn’t a guarantee. Pivoting on the spot, you wave her off.");
	output("\n\n<i>“W-W-W-Whaaat?!”</i> she screams. <i>“You fucker! I had to get around a bunch of fucking sydians to find you again, I was looking for you! I wanted you! Why a-are you- fuck you! Fuck you!”</i>");
	output("\n\nPlaintive declarations fade into whimpery moans of recovering denial. She’ll be frigging herself for the rest of the day, most like.");
	output("\n\nBy the end, she’ll probably forget about all this.");
	
	setEnemy(null);
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
 }
 public function raskvelFemaleMatingPress(kok:int=0):void
 {
 	clearOutput();
 	showBust(raskvelFemaleBustDisplay(true));
 	showName("FEMALE\nRASKVEL");
 	author("William");
	
	output("<i>“Yes! Yeeees! It’s so hot and I’m right here! Take meee!”</i> she says, tongue falling from her mouth like a wet, unwound ribbon. The tip languidly swirls one bulky nipple while you practically fall on top of her, " + (pc.isTaur() ? "planting your [pc.cock " + kok + "] square on her moist body" : "hiking up both her legs and planting two squirming feet to either side of her head") + ". Her minimal height gives her a chance to lash at your [pc.cockHead " + kok + "], providing another layer of slipperiness to carry your fuckstick to its destination.");
	output("\n\nYou slide back slowly in a drawn-out movement, letting her deeply flushed exterior revel in the heated caress of [pc.dickSkin " + kok + "]. <i>“I wanted it so badly!”</i> she says, staring up jovially. <i>“I stayed away from everyone I saw just so I could find you again! Your cum tasted so good...”</i>");
	output("\n\nAt the nadir of her plush, puffy pussy, you bathe your rod in all the liquid flow splitting into two streams around your girth. The feel of her darkly colored womanhood is matched by the caress of her lust-saturated scales, every part of her struggling to win your dominant affections. The opposing textures of supremely soft vaginal flesh and reptilian scales is heavenly, nearly bringing you to an orgasm in her shaft-buffing delta.");
	output("\n\nFully creamed, and already squirting your own [pc.cumVisc] issue into the mix, you rear back, watching with delight as your lizard-slut’s eyes roll back before you’ve even penetrated her. The knot in your loins tightens at the moment you push forward, unable to rise to her level of sheer excitement when you bury yourself inside her surprisingly elastic cunny. The intrusion has her cumming out whatever’s left of her brain that wasn’t used just bringing her horny ass straight to you.");
	output("\n\nThe bun-eared kobold pleasure seizes, thrashing on the spot, squirting all over your loins and your prick. Not even halfway and you feel like you’re dripping - in fact, your progress is all but halted by the narrowing tension of her azure innards. All the fat on her body jiggles while her plump sex swallows your [pc.cockType " + kok + "] length inch by [pc.cockColor " + kok + "], delicious inch. You’re fine with letting her do it: she’s just getting to know each of them intimately. When you start flattening her nerves she’s going to be screaming your name until her voice box shatters.");
	
	if (pc.cocks[kok].cLength() >= 7)
	{
		output("\n\nHot orgasmic spurts throw more fuel onto your fire before you’ve bottomed out. Just from sampling your goods she’s gone into a frenzied series of climaxes that deepens her vaginal blush and jets climax after climax onto your cock and abdomen. The eminent bulge of your [pc.cockHead " + kok + "] is visible against her tummy, dragging over a ceiling-bed of flashing-red nerves on its way to knocking on the gagging door to her activated womb. Every clenching quake inside milks out solid ropes of pre that squirt into her very core, soon spilling out in lurid rivers with the rest of her surrender-made-fluid.");
		if (pc.cocks[kok].cLength() >= 14) output("\n\nIt’s stunningly delightful that her seemingly frail and insignificant body is able to house as dick of your size. You aren’t going to be able to knot her, but you are going to make her a cum-drunk bitch at the end of this!");
	}
	else output("\n\nA soft clap of [pc.skinFurScales] to sweat-oiled scales signals the success of your [pc.knotBallsHilt " + kok + "]-deep thrust. The outline of your [pc.cockHead " + kok + "] is visible on her belly, pressing out against her navel. Shuddering and squirting, she throws her arms " + (pc.isTaur() ? "back and forth" : "around the back of your neck") + ", clenching climax spurting more fuel on the wildfire spreading at your conjoined crotches.");

	output("\n\nBliss echoes across Tarkus’ horizons at a volume only attainable by those whose needs are critically dire - heavy needs that are currently being seen to in the way they absolutely must be. Sandwiched between the soil and a [pc.raceShort], the bun-lizard girl’s reactions are nothing short of spectacular. Orgasm explodes out of her ecstatically spasming form as you saw in and out, pinioned under your protective and controlling weight. You thrust recklessly and heedlessly, knowing deep-down that whatever strain there may be on either of you, it’s a distant footnote to  the heavenly coaxing inside.");
	output("\n\nCorrugated acres of deep, ravenous raskvel cunt work overtime to pleasure your invading mast. Inconsistent rhythms of suckling, horny muscles contract with mind-blowing tremors. Your brain can’t keep up with sensory overload of spearing her sopping slit from pumped-out entrance to dilated cervix. The two of you sink a few centimeters into the ground on every bone-burying thrust. Aching vaginal nerves mercilessly tease your [pc.cockNoun " + kok + "], lavishing it with what feels like a lifetime of unloved affection.");
	output("\n\nEvery time you pull out, leaving her a little empty, she arches upwards to make sure you always have a little more inserted than the last time. She squeals in anguish at the apex of your backstrokes, so badly wanting to experience the next ear-wiggling orgasm brought on by being packed full of dick all over again. Loving licks play across your " + (pc.isTaur() ? "body" : "neck") + " when you go deep, begging you to stay pressed together for just a little bit longer.");

	if (pc.cockCanSting(kok)) output("\n\nThe involuntary application of your phallic tendril’s sex-enhancing qualities raises the local ardor to volcanic proportions. It’s a wonder how the little scavenger-lizard has any voice left to use when the sensitivity reaches mind-wiping levels. Only one thing’s certain right now, and that’s this sweaty slut is the happiest in the star system. Nobody else at this very moment, perhaps anyway, is undergoing a zen-like euphoria at being <b>so assertively claimed.</b>");
	if (pc.hasBalls()) output("\n\nWhile the upper half of your pelvis (and, by proxy, your upper girth) teases the first of her bloated buttons, your heavy, spunk-burdened nutsack is teasing the hell out of her southern light. [pc.BallsIsAre] swinging with nearly violent momentum into her bottom-mounted clitoris, and she reacts in the only way so pleased a little obedient slut can: by cumming harder, and harder... and harder. You groan with joy, feeling your already great, womb-plugging load of [pc.cumNoun] fattening, mentally prolonging the pleasure that comes with your virile [pc.ballsNoun] churning like a maelstrom on the verge of touching down on fertile fields yet to be fully despoiled.");
	if (pc.cockTotal() > 2) output("\n\nIn this position there’s only room for one cock, but it doesn’t mean your others aren’t expressing their innate enjoyment. Fat wads of bubbling prejizz are spurting and slapping and shooting and spraying in a spree reminiscent of a wild west showdown. They surf on the waves of her endlessly rippling flesh, flying high and crouching low. In " + (pc.cockTotal() > 2 ? "their own way, they’re" : "its own way, it’s") + " fucking her. It’s unorthodox, but she knows she’s going to get it inside and out, and that makes her the happiest protein junkie.");
	else if (pc.cockTotal() > 1) output("\n\nIn this position there’s only room for one cock, but it doesn’t mean your other isn't expressing its innate enjoyment. Fat wads of bubbling prejizz are spurting and slapping and shooting and spraying in a spree reminiscent of a wild west showdown. It surfs on the waves of her endlessly rippling flesh, flying high and crouching low. In " + (pc.cockTotal() > 2 ? "their own way, they’re" : "its own way, it’s") + " fucking her. It’s unorthodox, but she knows she’s going to get it inside and out, and that makes her the happiest protein junkie.");
	
	output("\n\nWeak, softened, and intoxicated, the weak raskvel sings your praises a dozen strokes now, a dozen strokes later; your smooth pumping pace accelerates to raging wantonness. You’re light-headed and dizzy, but doing far better than her. A velvety, fuzzy ache fills your ears when her continually squeezing, sloppy sluthole tightens normally and then madly. She’s by far the most suitable cocksheath you’ll ever meet. It’s hard to believe diplomacy is even a problem in this day and age when, at the end of the day, everyone wants what you’ve got right now.");
	output("\n\nSexual stench is high in your nostrils. Coarse sounds best found in highly rated pornos are your entire world now. Ejaculatory tremors keep her simmering, soaked depths firm and <b>alive.</b> You’re carried away by your own savageness, not caring that you’re putting pause to your quest just to buck and bounce on top of this tiny lizard, driving your peaking intensity into her wetness. You’re just enjoying the silky feel of pussy sheathing your indomitable dick, fucking her with unmatched ardor.");
	output("\n\nThe allure of cumming inside, of planting your seed in every egg, proves to be too much. You put the ‘press’ in mating press, growling like a beast while you piledrive her provocative pussy. The scour of your veiny dickflesh against her fecund carries hits every one of your buttons in sequence. Hard thrusts of rutting hindquarters ram your [pc.cockNoun] into the alluring raskvel’s cunt, on the very edge of warming it with a thick load of sizzling-hot seed.");
	output("\n\nNails rake your [pc.skinFurScalesNoun] and a firestorm of girlish arousal conflagrates your body. Your orgasm is there, just below your surface" + (pc.cocks[kok].hasFlag(GLOBAL.FLAG_FLARED) ? "; you can feel it when the flare of your beastly cock billows out into full, circular tumescence" : "") + ". A percussive beat of reproductive urge pounds a final note; suffocating tightness envelopes you from [pc.cockNoun] to brain. Bliss flows in vein-bloating amounts, surging through your hypersensitive urethra and straight into the wet, willing bitch locked to your desires.");
	if (pc.cocks[kok].cLength() < 14 && pc.hasKnot(kok)) output(" A single thrust more and your [pc.knot " + kok + "] wears her pussy like a wedding band, tying the knot, as it were, and ensuring maximum hatchling potential.");
	
	if (pc.cumQ() >= 5000)
	{
		output("\n\nCurling in bred bliss, the lizard-rabbit screams her soul out when the first lancing wad of [pc.cumVisc] spunk reams her womb like milk into an empty bucket. All her body is good for is taking load after thick, slimy load of [pc.cumNoun]. With a white knuckled grip you jerk back and slam forward again, pulling on her in just the right way to remind her who’s in charge, who her alpha " + (pc.isHerm() ? "herm" : "male") + " is. You’ve rutted her into a drooling, babbling mess while she can do naught but enjoy your weight on her. Fervid walls suckle in torrent after torrential spout of fountaining egg-fertilizer. Liquid weight dumps into the raskvel, bloating her thirsty, oversaturated core into a sloshing balloon. Your virile reservoir knows no end, emptying itself directly into her waiting womb <b>raw</b> and <b>hot.</b>");
		output("\n\nMaybe hers isn’t a pristine womb, but it is one that’s well and thoroughly marked by <i>you.</i> And nothing could make you happier. Well, except for crying out and cumming harder, seeding the kobold-bitch into a senseless wreck good only for bearing children now. You doubt the hormones will last that long, but damn if it doesn’t make the act all the better." + (pc.cockTotal() > 1 ? " [pc.CumGem] lassos festoon the rest of your private short-stack cumdump in [pc.cumColor] smears of goop. It accumulates to the point that it leaks from every muscle and slope on her sordid little body." : ""));
		if (pc.cumQ() >= 10000) output("\n\nNothing could have prepared this hapless lizard for a " + (pc.isHerm() ? "she-" : "") + "stud like you. Even when a cock’s worth of cum has crammed her womb and cunt full, when it no longer has anywhere to go but out, you deign to withdraw. She can’t complain, not when she’s so full she’ll be bedridden (or close to it) for days. When you grab her thighs and lock them together around your shaft, globs of oozing excess pour of her snatch while the rest of your hypersexual magnanimity erupts onto the ravaged runt, splattering her in a kobold-coating volume of spunk. Now nobody’s going to touch her. For all the other natives will know, and any would-be rushers trying to have their way with aliens... she’s used goods" + (pc.virility() > 0 ? ", and maybe... a broodmother in waiting" : "") + ".");
	}
	else output("\n\nThe extreme rush of overflowing spunk caps off your fertilizing orgy. [pc.Cum] races through your spunk-vein, plastering unquenchable walls in fecund heat. Heated release pushes past mindless contractions and into a womb more than ready to receive its due rewards. Teeming crackles of electrical urgency arc through your loins, pulsating like the visible glow of a rare lightning strike when another rope fires off. Feverish walls suckle you and your [pc.cumVisc] loads deeper, making sure as many swimmers get their opportunity to fill the lapis girl’s bred body to the brim with eggs made ready to hatch the healthiest possible children. A little round swell in her tummy will be indicative of her successful mating." + (pc.cockTotal() > 1 ? " Sympathetic squirts of a divided creampie spray out over her, striping her body in [pc.cumGem] lines." : ""));

	if (pc.cocks[kok].cLength() < 14 && pc.hasKnot(kok))
	{
		output("\n\nSealed inside, your orgasm will continue for a while longer. Ribbons and thin arcs of spoo launch out of the plugged hole, breaking on contact with your [pc.thighs]. Organic, cock-milking innards usher out load after [pc.cumVisc] load, promising a delightful stay until your bitch-breaking bulb deflates and frees you from your propagative responsibility. Sadly, the pregnable rask is in no condition for a chat or anything. Oh well!");
		processTime(5);	
	}
	processTime(9 + rand(11));
	clearMenu();
	addButton(0, "Next", raskvelFemaleMatingPressEnd, kok);
 }

 public function raskvelFemaleMatingPressEnd(kok:int=0):void
 {
 	clearOutput();
 	showBust(raskvelFemaleBustDisplay(true));
 	showName("FEMALE\nRASKVEL");
 	author("William");
	
	output("Pulling away from your sloppy lay is the most exhausting part of this. Satiated and calm, you glance at the clenching and unclenching form of the inflated scavenger and think about how you met her... what led you here. Man, what a story, and perhaps not the only time this might happen. Ignorant to anything outside of her well-fucked body, she’ll be a sperm-soaked landmark here for a good while. [pc.CumColor] curtains drain from her pussy, sadly wasteful... but you put enough in there to make the job mean something.");
	output("\n\nFor now, you’ve spent enough time and energy on this scrappy, would-be mechanic. Breathing slow and steady, you stand and get back to your adventure, a little more spritely than before.");
	
	IncrementFlag("FEM_RASKVEL_MATING_PRESS");
	enemy.loadInCunt(pc, 0);
	knockUpRaskChance(true);
	pc.orgasm();
	setEnemy(null);	
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
 }
public function knockUpRaskChance(heatSex:Boolean=false):void
{
	if(pc.virility() <= 0) return;
	//If one's already preggos, no go
	if(flags["RASKVEL_PREG_TIMER"] == undefined)
	{
		var bonusChance:int = 0;
		var cumQ:Number = pc.cumQ();
		if(cumQ >= 50) bonusChance += 5;
		if(cumQ >= 150) bonusChance += 5;
		if(cumQ >= 500) bonusChance += 10;
		if(cumQ >= 1000) bonusChance += 10;
		if(cumQ >= 4000) bonusChance += 10;
		if(cumQ >= 10000) bonusChance += 20;
		// Multiply the chances based on virility
		bonusChance = Math.round(bonusChance * pc.virility());
		//Roll the dice - base 10% pregrate
		if(rand(100) + 1 <= 10 + bonusChance || heatSex)
		{
			var bonusEggs:int = Math.round(rand(Math.floor(cumQ/500)+2) * pc.virility());
			if(bonusEggs > 12) bonusEggs = 12;
			//Succeed! Induce Preggoz
			flags["RASKVEL_EGG_COUNT"] = 3 + bonusEggs;
			//Five days till eggpop!
			flags["RASKVEL_PREG_TIMER"] = 5;
			pc.clearRut();
		}
	}
}

