//Hostile Female Raskvel Encounter
//Armed with aphrodisiac dart-gun.
//Crotchless Mechanic's Overalls/Tattered Shirt and Skirt
//Giant wrench shotgun.
//Wants paid off for safety!


public function encounterHostileRaskvelFemale():void
{
	CodexManager.unlockEntry("Raskvel");
	userInterface.showBust("RASKVEL_FEMALE");
	userInterface.showName("RASKVEL\nFEMALE");
	//First Encounter
	if(flags["MET_FEMALE_RASKVEL"] == undefined)
	{
		flags["MET_FEMALE_RASKVEL"] = 1;
		output("\n\nEmerging from behind a piece of wreckage, a short figure. The creature is perhaps four feet tall at most, couching a gigantic wrench on its shoulder and some kind of gun on its hip. It is dressed in a set of tattered mechanics overalls and little else, and as you look closer, you become aware of its undoubtedly feminine nature.");
		output("\n\nThe crotch of the overalls girding this alien girl were torn away at some point in the past to expose her puffy sex. The outer lips are as swollen as a human woman's after being hooked to a vacuum pump for an hour, and purplish in hue. Two clits poke out from the bulging feminine genitalia, one in the front, one in the back. Her sex contrasts quite visibly with her " + foes[0].skinFurScales() + ", standing out in stark relief against the rest of her body, like some kind of erotic target. Her wide hips strain the waist of her garment, transforming her walk into an exaggerated sexual swivel, even though her top half is narrow and lithe, capped with small, pert breasts, B-cups at the most.");
		output("\n\nBeeping, your codex alerts you that this is a hostile female of the raskvel race just like the ones you met when you landed. It issues a quick summary: <i>The Raskvel are a race obsessed with fixing technology and breeding in equal measure. They are generally a very friendly race, but some are more than happy to turn to violence to secure a mate.</i> Looking back up at the approaching creature, you ready yourself.");
		output("\n\nThe raskvel mechanic leans on her wrench as she considers you, her long, floppy ears dangling to her waist. \"<i>An off-worlder, huh?</i>\"");
		output("\n\nYou nod.");
		output("\n\n\"<i>That's too bad. Since you're trespassing, you're going to have to pay the hundred credit fee,</i>\" the scaly little thing offers before smiling. \"<i>If you don't pay, I'll find another way to take it out of you.</i>\" She looks at " + pc.rawmfn(" your crotch before reaching down to pull her alien twat wide open, winking.","your face before rubbing her palm across her exposed pussy, flicking her tongue out to indicate just how you could pay her.","your face before rubbing her palm across her exposed pussy, flicking her tongue out to indicate just how you could pay.") + ". \"<i>I'd rather just play with you, but we need the money.</i>\" She shrugs her little shoulders apologetically and awaits your response.");
		output("\n\nDo you pay the fiesty little alien, fight her, or pay her off some other way?");
	}
	//Second Encounter
	else
	{
		output("\n\nAnother raskvel emerges from behind a piece of forgotten wreckage. This one seems as determined as the first one you met, proudly declaring, \"<i>Fork over your credits, off-worlder. I need 'em!</i>\" She hefts her wrench threateningly. It doesn't look like negotiation is an option.");	
	}
	//[FIght] [Pay] ["Pay"]
	clearMenu();
	addButton(0,"Fight",startCombat,"RaskvelFemale");
	addButton(1,"Pay",payDatRaskCunt);
	addButton(2,"\"Pay\"",quotePayUnquoteFemRasks);
}

public function payDatRaskCunt():void
{
	clearOutput();
	userInterface.showBust("RASKVEL_FEMALE");
	userInterface.showName("RASKVEL\nFEMALE");
	output("Not wanting to waste time with her, you transfer the hundred credits to a chit and toss it at her.\n\nThe little junkyard rat catches hold of your chit before making a dramatic bow. <i>\"Pleasure doing business with ya!\"</i> She vanishes into surrounding wreckage before you can reply.");
	payRaskvel();
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Combat
public function raskvelChickAI():void
{
	userInterface.showBust("RASKVEL_FEMALE");
	userInterface.showName("RASKVEL\nFEMALE");
	if(foes[0].hasStatusEffect("Disarmed"))
	{
		raskvelPunch();
	}
	else if(foes[0].hasStatusEffect("Wrench Charge")) 
	{
		enemyWrenchAttack();
	}
	else
	{
		if(rand(4) == 0 && pc.hasCock()) raskvelGirlsTeasingCockwielders();
		else if(rand(3) == 0) enemyWrenchAttack();
		else if(rand(2) == 0) enemyAphrodisiacDarts();
		else raskvelFemShotgun();
	}
}

public function raskvelPunch():void
{
	output("Unmoved by being disarmed, the petite raskvel balls her fists and charges you.");
	if(rangedCombatMiss(foes[0], pc))
	{
		output("\nYou slide to the side of her clumsy swings.");
	}
	else
	{
		var damage:int = foes[0].physique()/2;
		//Randomize +/- 15%
		var randomizer:Number = (rand(31)+ 85)/100;
		damage *= randomizer;
		genericDamageApply(damage,foes[0],pc,GLOBAL.KINETIC);
	}
	processCombat();
}

//Combat Attacks
//Aphrodisiac darts!
public function enemyAphrodisiacDarts():void
{
	var damage:int = 0;
	var hit:Boolean = true;
	//Hacky-ass solution for male raskvel. Will need tweaked if a proper mob ever uses the attack
	if(foes[0] is RaskvelMale) output("<i>“Boo! Raaaaar!”</i> shouts the big raskvel, waving his arms at you. At the same time, one of the others pulls an injector gun from his belt and fires three needles at you near soundlessly.")
	else output(foes[0].capitalA + foes[0].short + " pulls a gun off her hip, levels it, and pulls the trigger. The only reports are a trio of near-silent hisses as three injectors fly through the air toward you.");
	//Blocked
	if(pc.shields() > 0) 
	{
		output("\nThe needles break apart uselessly on contact with your defenses.");
		hit = false;
	}
	//Miss (can't be completely dodged)
	else if(rangedCombatMiss(foes[0], pc)) 
	{
		output("\nYou manage to avoid most of the projectiles, but one still impacts your arm, stinging you with a pinprick of pain. You yank it out, but it's payload is already spent, injected inside you.");
		damage = 3 + rand(3);
		pc.lustDamage(damage);
	}
	//Medium hit
	else if(rangedCombatMiss(foes[0],pc))
	{
		output("\nTwo needles slam into your body, imparting bursts of searing pain when they penetrate your flesh. You yank them out in irritation, but whatever they contained is inside you now.");
		damage = 7 + rand(3);
		pc.lustDamage(damage);
	}
	//Full Hit
	else
	{
		output("\nAll three needles hit you before you can react.");
		damage = 11 + rand(3);
		pc.lustDamage(damage);
	}
	//Reactions
	if(hit)
	{
		if(pc.lust() < 33) output("\nAn unwelcome heat suffuses your body as the chemicals do their work.");
		else if(pc.lust() < 45) output("\nYour heart beats faster as you look at your foe's body. Her outfit seems a bit more revealing, and her movements seem more sexually enticing than ever before.");
		else if(pc.lust() < 55) 
		{
			if(pc.hasCock()) output("\n[pc.EachCock] pulsates as it fills with burgeoning tumescence. You find yourself wondering what it would be like to slip into her puffy, double-clitted box.");
			else if(pc.hasVagina()) output("\n[pc.EachVagina] grows sensitive and moist as you ponder the merits of fucking this fetching little lizard-woman.");
			else output("\nYour [pc.nipples] harden as you idly consider forcing her to lick you while suckling on her twin clits.");
		}
		else if(pc.lust() < 65) output("\nYou groan out loud as the aphrodisiacs surges through your bloodstream, rousing you into a " + pc.rawmf("rut","heat") + " that you have have a hard time suppressing.");
		else if(pc.lust() < 75) output("\n" + pc.mf("Grunting","Whimpering") + " in anticipation of what is to come, you ball your hands into fists as you try to endure the rising need as it spreads through your body. It feels like your brain is oozing down into your crotch, fixating utterly on sex. You want to fuck right now. You NEED to fuck soon.");
		else if(pc.lust() < 85) output("\nYou stagger as the lust hits you, stirring your already aroused body to new heights of need. Your [pc.legs] tremble, and the desperate, animal need to copulate thrums through your quivering muscles, filling them with an artificial desire.");
		else if(pc.lust() < 95) 
		{
			output("\nThe payload has its way with your aroused body as it rushes through your veins. It acts quickly, like other intravenious drugs, turning you on with each beat of your heart.");
			if(pc.hasCock() || pc.hasVagina()) output(" Your genitals drip with need as y");
			else output("Y");
			output("ou idly consider throwing the fight for a quick fuck.");
		}
		else output("\nYou whimper as the drugs pour through your body and melt your resistance into a bubbling puddle of distilled fuck. Your body is hot, feverish even, and you lose the will to resist as the absolute need to tend to your state asserts itself.");
	}
	if(pc.lust() < pc.lustMax() && foes[0] is RaskvelMale)
	{
		if(seductionChance()) return;
	}
	processCombat();
}

//Wrenched
public function enemyWrenchAttack():void
{
	//Charged attack!
	if(!foes[0].hasStatusEffect("Wrench Charge"))
	{
		output(foes[0].capitalA + foes[0].short + " hefts her wrench up over her head, readying a powerful downward stroke. If you act quickly, you can interrupt her!");
		foes[0].createStatusEffect("Wrench Charge",foes[0].HP(),0,0,0);
	}
	//Already charged, lets do this!
	else
	{
		//Interrupted
		if(foes[0].statusEffectv1("Wrench Charge") > foes[0].HP()) output(foes[0].capitalA + foes[0].short + " staggers, dropping her heavy weapon down from its striking posture. She looks less than pleased by this development!");
		//Miss
		else if(combatMiss(foes[0],pc))
		{
			output(foes[0].capitalA + foes[0].short + " brings her weapon down in a vicious two-handed strike but fails to connect!");
		}
		//Hit
		else
		{
			//[foes[0].short][capital]
			output(foes[0].capitalA + foes[0].short + " slams down her wrench in a heavy blow. It connects solidly, and your head is ringing from the brutal hit.");
			//{Stun chance}
			if (!pc.hasStatusEffect("Stunned") && pc.physique() + rand(20) + 1 < 40)
			{
				output("<b> The hit was hard enough to stun you!</b>");
				pc.createStatusEffect("Stunned",1,0,0,0,false,"Stun","You are stunned and cannot move until you recover!",true,0);
			}
			var damage:int = foes[0].meleeWeapon.damage + foes[0].physique()/2;
			//OVER CHAAAAAARGE
			damage *= 2;
			//Randomize +/- 15%
			var randomizer:Number = (rand(31)+ 85)/100;
			damage *= randomizer;
			genericDamageApply(damage,foes[0],pc);
		}
		foes[0].removeStatusEffect("Wrench Charge");
	}
	processCombat();
}

//Shotgunned
public function raskvelFemShotgun():void
{
	output(foes[0].capitalA + foes[0].short + " presses a button on the side of her wrench, and you hear a shell slide home. A moment later she points it your way and pulls the trigger. Ka-BLAM! The report is loud enough to echo for miles.");
	//Miss
	if(rangedCombatMiss(foes[0],pc)) output(" The pellets fly wide.");
	//Hit
	else
	{
		output("\nYou are struck by the projectiles!");
		var damage:int = foes[0].damage(false) + foes[0].aim()/2;
		//OVER CHAAAAAARGE
		//Randomize +/- 15%
		var randomizer:Number = (rand(31)+ 85)/100;
		damage *= randomizer;
		genericDamageApply(damage,foes[0],pc);
	}
	processCombat();
}

//Tease (only vs males)
public function raskvelGirlsTeasingCockwielders():void
{
	if(rand(4) == 0) 
	{
		output("The short female swivels to show you her rump, shaking it up and down to show off her puffed-up pussy and second clit from behind. She shakes and wobbles, bouncing her cheeks enticingly for your enjoyment while asking, \"<i>Come over here and give me some eggs, and we can forget all about this.</i>\"");
		pc.lustDamage(7+rand(3));
	}
	//#2
	else if(rand(3) == 0)
	{
		output("Pulling down her top to expose her nipples, " + foes[0].a + foes[0].short + " asks, \"<i>Still want to fight? You could always pay me in sperm, you know.</i>\"");
		pc.lustDamage(6+rand(7));
	}
	//#3
	else if(rand(2) == 0) 
	{
		output("The raskvel playfully scampers up and pivots, resting her butt against your crotch. She squeezes her surprisingly powerfully thighs to make her cushy little asscheeks wobble back and forth against");
		if(!pc.isCrotchGarbed()) output(" [pc.oneCock]");
		else output(" [pc.oneCock] through your [pc.lowerGarments]");
		output(". \"<i>Come play, we can forget about the money.</i>\"");
		pc.lustDamage(10+rand(4));
	}
	//#4
	else
	{
		output("Dropping her wrench, the little creature launches herself towards you, legs akimbo.");
		//Miss
		if(combatMiss(foes[0],pc)) output(" You step aside, forcing her to land hard and circle back to her weapon with a frown.");
		//Hit
		else
		{
			output(" Her trajectory carries her square into your face. The lizard-girl's hot cunt squishes up against your [pc.face] as her legs circle behind your neck, and she languidly grinds herself on your face while running her hands ");
			if(pc.hasHair()) output("through your [pc.hair]");
			else output("over your head");
			output(". She detaches before you can think to get her off of you, leaving you with the taste of her femininity on your lips and the thought sex on your mind.");
			pc.lustDamage(15+rand(6));
		}
	}
	processCombat();
}

//Victory vs Raskvel
public function victoryVsRaskvel():void
{
	userInterface.showBust("RASKVEL_FEMALE");
	userInterface.showName("DEFEATED: F.\nRASKVEL");
	output("The extortive mechanic ");
	if(foes[0].HP() < 1) output("tumbles head over heels, her wrench falling by the wayside. She hits the ground hard, panting and beaten before gasping, \"<i>You win. Jerk.</i>\" Her sex seems a bit puffier than before, and she's fallen in a pose that seems almost needlessly provocative. It's like she's still trying to tempt you with sex.");
	else output("drops to her knees, the wrench falling by the wayside. She whimpers as her fingers disappear into her sodden box. You can see the moisture glistening on the scales of her legs as she desperately frigs herself, not even caring as she slumps down onto her back.");
	clearMenu();
	if(pc.lust() >= 33)
	{
		output("\n\nDo you do something sexual with her?");
		if(pc.hasCock())
		{
			if(pc.cockThatFits(foes[0].vaginalCapacity()) >= 0) 
			{
				addButton(0,"DoggyStyle",raskVelBabeGetsDoggieStyled);
				output(" You could do her doggy style.");
			}
			else 
			{
				addDisabledButton(0,"DoggyStyle");
				output(" You're too big to do her doggy style.");
			}
			//Huge Dick Ear Jackoff?
			if(pc.cockVolume(pc.biggestCockIndex()) > foes[0].vaginalCapacity())
			{
				addButton(1,"EarFap",hugeDickEarJackoff);
				output(" You could put those big ears to work on your big dick.");
			}
			else
			{
				addDisabledButton(1,"EarFap");
				output(" If only you had a member that was too big for her pussy, then you could use her soft ears to rub one out.");
			}
		}
		else
		{
			output(" Without a dick, you can't really fuck her, but you've still got other options open to you.");
			addDisabledButton(0,"DoggyStyle");
			addDisabledButton(1,"EarFap");
		}
		if(pc.hasVagina())
		{
			output(" Her face looks like it would fit nicely against your [pc.vaginas].");
			addButton(2,"RideHerFace",faceRidingRaskvelLadies);
		}
		else {
			output(" If you had a pussy, you could ride her face. Sadly, you don't.");
			addDisabledButton(2,"RideHerFace");
		}
	}
	else
	{
		output(" <b>You aren't turned on enough to engage in coitus with the alien babe.</b>");
		addDisabledButton(0,"DoggyStyle");
		addDisabledButton(1,"EarFap");
		addDisabledButton(2,"RideHerFace");
	}
	output("\n\n");
	addButton(14,"Leave",genericVictory);	
}

//Doggie Style
public function raskVelBabeGetsDoggieStyled():void
{
	//Put her on all fours, left her ass up to be supported by your cock, grab hold of those ears for good measure, and play with them.
	clearOutput();
	userInterface.showBust("RASKVEL_FEMALE_NUDE");
	userInterface.showName("DEFEATED: F.\nRASKVEL");
	var x:int = pc.cockThatFits(foes[0].vaginalCapacity());
	output("As you eye your ");
	if(foes[0].HP() < 1) output("defeated");
	else output("defeated");
	output(" foe, your stiffening maleness");
	if(pc.cockTotal() > 1) output("es");
	output(" rise to attention, and you decide that you may as well take care of the lusts she stoked within you in the most biologically appropriate way. You grab the raskvel by one of her sizeable hips and roll her over, seizing her before she can settle into that pose. Her supple ass flexes slightly in your grip, and you can see second clit jutting out from between her juicy-looking folds as you lift her higher. She whimpers, ");
	if(pc.tallness >= 50) output("her legs lifting up off the ground as you align her with your crotch");
	else output("her legs settling under her as you align her with your crotch. It's a perfect match, as short as you both are");
	output(".");

	output("\n\nThe scaley slut is so light that you can support her one handed ");
	if(pc.isCrotchGarbed()) output("when you open your [pc.lowerGarments] and ");
	output("align [pc.oneCock] with her slick opening. She ");
	if(foes[0].HP() < 1) output("lies there in the dirt, looking back at you with a curiously, slowly brightening expression. One of her hands lifts up, tracing along her upside-down tummy towards her frontal clit.");
	else output("shudders in anticipation, removing her fingers to give you entrance, instead focusing entirely on her frontal clit.");

	output("\n\nSeeing nothing but growing, eager assent on your once-foe, you rock your hips forward to place your [pc.cock " + x + "] against her plush, lube-oozing lips. Your [pc.cockHead " + x + "] spreads those plump vulvae like a curtain of oiled silk, slipping and sliding straight on past into the raskvel's almost virginally tight canal with the inexorable pressure of a horny " + pc.mf("male","herm") + ". Despite the clutching tightness of her inner walls, the small alien's pussy becomes more and more comfortable the further you slide into it. Instead of a hellishly tight vice, it moulds around your " + pc.cockDescript(x) + " into a warm, slick glove that could have been tailor-made for you.");
	//Lose cockginity!
	pc.cockChange();
	output("\n\n\"<i>Mmmmm,</i>\" the cute little lizard-woman coos from her place on the ground. She's drooling a little down her cheek, the one that's smushed flat against the ground, and her fingers are resolutely playing across her dick-dilated entrance, mopping the dripping juices up with her palm. Sometimes she even clutches at your cock and pulls, trying to drag you further into her. The raskvel's scaly legs twitch nervelessly as you slide home, deforming her belly in the outline of your [pc.cock " + x + "].");
	if(pc.cocks[x].cLength() > 14) output(" There is no increase in resistance or blockage to stop you. Perhaps the closest thing is slightly tighter ring that could be her cervix, but there's been no complaining from the woman below. She takes you until you're past her the halfway mark of her belly.");
	//Huge cocks only
	if(pc.cocks[x].cLength() > 14) 
	{
		output("\n\nThe alien's other hand comes up to cradle her distended belly, cupping your immense maleness with a hand through her stretched scales. She gives an affectionate squeeze along your urethral bulge that makes you twitch and groan, releasing a tiny squirt of pre-cum inside her to ease the passage. A knowing smile spreads across her face at this, and she pulls her other hand away from her overflowing cunt to stroke you, jacking you off inside her. The sensuous touches are nearly too much for you, and you haven't even crammed your entire cock in yet! You rock your [pc.hips], lost in the tight snatch, the unsubtle caresses, and the heat of the moment.");
	}
	//Extra cock
	if(pc.cockTotal() > 1)
	{
		output("\n\nYour extra erection");
		if(pc.totalCocks() > 2) output("s slide");
		else output(" slides");
		output(" through her blessedly slick thighs. Her horny, puffed-up pussy is soaking wet with her pussy's copious secretions. Their unintentional trembling causes her deliciously warm thighs to vibrate your spare dick");
		if(pc.cockTotal() > 2) output("s");
		output(" with pleasant, smooth-scaled caresses. You sigh and push forward further, nestling directly into her intercrural embrace until you start to mix your pre with her plentiful, vaginal moisture.");
	}
	//RESUME!
	output("\n\nGroaning in bliss, you feel your [pc.sheath " + x + "] contact her squishy-soft cunt-lips");
	if(pc.balls > 0) output(", your [pc.balls] slapping heavily against one of her stiff buzzers");
	output(", both of you shuddering in ecstatic relief at the feeling of being fully joined. You hold her like that for a moment to enjoy the simple pleasure. She seems equally pleased, only daring to roll her hips up and down and squeeze you with affectionate, internal muscles. The hot tightness clinging so tightly to your [pc.cock " + x + "] fills you with temporary contentment that is only ebbed away by the growing desire to cum, to climax so tremendously that you fill this petite alien with your [pc.cum].");
	output("\n\nYou pull back slowly, inching your length out with sensuous slowness, both of you shuddering from the pleasant friction along your genitalia. The randy little raskvel whimpers at the slow emptying of her channel, begging, \"<i>No... put it... put it back in. P-please!</i>\" Her eyes close and her body shudders. \"<i>I need... I need more!</i>\"");
	output("\n\nYou don't have intention of leaving the lizard-woman empty for long, but you do keep pulling back, releasing your girl-glossed fuck-pole from it's squeeze-happy prison long enough for it to shine in the open air a moment. Then, you push it back in, far faster than the first insertion. Your [pc.cock " + x + "] slides into the pre-shaped passage with perfect, wet squelches. Dollops of slick cunt-juice squirt out around your penetrating pole, ");
	if(pc.cockTotal() > 1) 
	{
		output("splattering over your other erection");
		if(pc.cockTotal() > 2) output("s");
		output(", ");
	}
	output("shining her thick thighs and your own [pc.legOrLegs] with moisture. Inside the raskvel's twat, you can feel the little folds as they slide over every ridge and vein of your manhood, all the way until you're hilted once more. Satisfied groans fill the air around the both of you.");
	output("\n\nAgain, you yank back, going faster now, and plunge yourself back inside the alien's sloppy cockvice, bouncing off her sweet little ass with quickening thrusts. You can feel her heartbeat hammering against your own through your [pc.cock " + x + "], speeding to match yours until the two organs are pumping blood through genitals in perfect, sexual sync. Her body has completely given in. The once demanding alien has turned into little more than a eager dicksleeve, surrending herself utterly to you as you take her again and again");
	if(pc.tallness >= 50) output(", legs swaying futilely as your larger body has its way with her");
	output(". Her eyes are rolling back in their sockets as her purplish tongue drools out of her mouth.");
	
	output("\n\nDazedly babbling, the spasming alien begs, \"<i>Cum inside! Let me have your eggs.... You're so strong! Give me strong hatchlings, please!</i>\" Her pussy quivers around you. \"<i>Give me your cum!</i>\"");

	output("\n\nPumping her with strokes equal parts hard, fast, and sure, you smile down on her, rubbing an asscheek affectionately as if to say, \"<i>Sure,</i>\" as her body jiggles from the quick, rough fuck. That seems to be all she needs. The raskvel's legs and arms lock, and her pussy clamps down on your [pc.cock " + x + "] with orgasmic contractions, squeezing it from her pumped-up looking entrance all the way towards her womb");
	if(pc.cocks[x].cLength() >= 14) output(", where your [pc.cockHead " + x + "] is lodged");
	output(". Her eyes roll back until the vertically-slit pupils completely vanish, and a curtain of clear girlish goo erupts from her box, washing over your genitalia before puddling on the ground. You don't slow or stop through all of this. If anything, you pick up the pace, intent on an orgasm of your own.");
	output("\n\nSagging when the bliss washes out of her, the raskvel goes completely limp in your hands. Her clenching pussy relaxes, making your strokes easier, and she mewls pathetically as you stuff her over-sensitive pussy full of your cock. You're close now, and you redouble your pace, thrusting with such fervor that your [pc.hips] must look like a blur of motion. Your crotch is clapping into hers with loud wet impacts that can undoubtedly be heard for some distance, yet you have a hard time caring. You need to cum, even if the little slut got off first. Taking her in a two handed grip, you give her the dicking her teasing little pussy deserves until you feel the warm twinges that signal your orgasm welling up within you.");
	//Cocktail
	if(pc.hasCockTail()) output("\n\nYou instinctively twitch a second set of muscles and whip your [pc.tail] around lightning fast, spearing it into the raskvel's empty pucker before she can react. The skin of your [pc.tailCock] is pulled back immediately, exposing the turgid mass to her sensitive anal walls. It fills her ass with thick, twitching cockflesh, immediately pumping out a thick blast of [pc.cumColor] release straight inside her bowels. The raskvel whimpers in distress and lust, her ass spasming wonderfully in a way that feels like she's trying to squeeze the [pc.cum] straight out of your tool.");
	//RESUME!
	output("\n\nYou slam home one last time, slapping your ");
	if(pc.balls > 0) output("[pc.sack] into her bullet-hard frontal clit and your ");
	output("crotch against her rigid frontal button. Blood surges into [pc.eachCock] as orgasm arrives, stretching the raskvel's sopping-wet cunt with even more thickness, triggering a whole new avalanche of climatic contractions from her well-used mound.");

	//NON KNOT:
	if(!pc.hasKnot(x))
	{
		output("\n\n[pc.Cum] rolls out of your [pc.cock " + x + "] in a wave. Between your internal muscles' squeezings and the clutching tightness of the raskvel's horny box, a veritable deluge releases into the unprotected, thirsty little womb. Your hands firmly hold the lizard-like woman's hips against your own until you're done");
		if(pc.cumQ() <= 500)
		{}
		else if(pc.cumQ() <= 2000) output(", not caring when her belly forms a noticeable cum-paunch.");
		else output(", not caring when her belly rounds with your obscene virility, pumping full of nice, hot, fertile seed that is sure to turn that cum-dome into a proper, pregnant belly in no time.");
		output(" Her hands massage her mound as she's filled, gathering the dripping [pc.cum] into her hands and slathering it all over her ");
		if(pc.cumQ() <= 500) output("cock-distorted belly");
		else output("rounding belly");
		output(".");
		if(pc.cumQ() >= 10000) output(" When the pressure becomes too much a wave of [pc.cumColor] pours out from between her thighs, pooling on the ground below, she shudders and screeches in inhuman pleasure.");
		output("\n\nAs the passion drains from your body and into the small lizard-girl's passage, you pull out");
		if(pc.cumQ() >= 500) output(", smiling at the gush of [pc.cum] that squirts from her overpressurized uterus");
		output(".");
	}
	//KNOT
	else
	{
		output("\n\nYour knot inflates as she squeezes, stretching her passage around the cunt-blocking bulb until its so well sealed that you couldn't possibly pull out, even if you wanted to. You hold your new, lizard-like bitch in place while your animalistic organ does its work, pumping out shot after shot of [pc.cum] straight into her fertile passage. You don't know much about interspecies breeding with raskvel, but your body is desperate to try. You can feel the warmth of your [pc.cum] filling her up as you ejaculate, and your knot ensures that not a single drop is wasted.");
		if(pc.cumQ() <= 500) {}
		else 
		{
			output(" The thick spurts round the raskvel's trim tummy into a nicely-filled dome in no time, and her perfectly plugged pussy wrings you tighter in excitement at such treatment.");
			if(pc.cumQ() >= 2000) output("  She's less pleased when you continue to cum, filling her with nice, hot, virile seed until that dome is stretched into a sloshing pregnant belly, her scales and skin shiny from how taut they've become. The pressure threatens to push you back out, but elastic lizard-woman's body gives just enough to let you enjoy the feeling of completely stuffing her snatch.");
		}
		output("\n\nAs your passion wanes, your dick remains stubbornly knotted inside the small girl's passage. She's suspended on your [pc.cock " + x + "] like the breeding bitch she's become, forced to let your [pc.cum] simmer in her vulnerable womb until your knot decides to deflate, which happens roughly thirty minutes later, after the last of your orgasm trickles its way inside.");
	}
	//EPILOGUE FOR BOTH
	output("\n\nShe slumps onto her side, still trembling, and smiles, rubbing her hands back and forth all over her belly while you ready yourself to resume your journeys.\n\n");
	processTime(30+rand(5));
	pc.orgasm();
	processTime(5);
	genericVictory();
}

//Huge Dick Ear Jackoff?
public function hugeDickEarJackoff():void
{
	clearOutput();
	userInterface.showBust("RASKVEL_FEMALE_NUDE");
	userInterface.showName("DEFEATED: F.\nRASKVEL");
	output("The little mechanic is way to small to take you, even with hips as stacked as hers, so you decide on another way to quench the fiery heat she's stoked within you. She looks up at you ");
	if(foes[0].HP() < 1) output("with an anxious expression that shifts into a lusty grin");
	else output("with whore-shaming quantities of lust pooling in her slitted eyes");
	output(" as you ");
	if(!pc.isCrotchGarbed()) output("stroke your burgeoning slab of cock");
	else output("free your immense slab of cockmeat from your [pc.lowerGarments]");
	output(".");
	output("\n\nSeeing her look, you ask, \"<i>You like this, do you?</i>\"");
	output("\n\nShe nods, licking her lips and spreading her legs to expose her plump, purple pussy. Juices run freely from her gash over her second clit and down her tail, soaking her scales. Those slitted eyes zero in on your [pc.cockHeadBiggest], and the raskvel's previously lusty expression turns concerns. She folds her legs closed and whimpers, \"<i>It's too big! I'm stretchy, but that'll break me!</i>\"");
	output("\n\n\"<i>How lucky you are that I don't intend to stick it inside you then,</i>\" you retort as you sit down next to her. You let a hand fall across her softly-scaled chest and begin to tweak and tug at a lavender nipple, admiring how smooth and soft her breasts' scales are, feeling her nipples noticeably perk as you play. The aroused alien seems buoyed by this, and her salacious grin returns with a moan of pleasure, her face framed by the huge, floppy ears that are apparently typical of her race. You grab on to test. If they're anything other than smooth, soft, and warm, you'll have to come up with a better idea, but as soon as you touch the inside, you know this will work.");
	output("\n\nA texture comparable to the softest, plushes velvet slides across your thumb as it plumbs the raskvel's luxurious listeners. The outside is fairly hard and smooth, covered with a coating of fine scales. They interlock so pefectly that you don't feel any sharp edges, just slight indentations where they join together. Perfect.");
	output("\n\n\"<i>Stop that!</i>\" a quiet voice calls, drawing your attention from your inspection. The petite reptile-lady is breathing heavily and shivering at your touches. Her body has flushed darker, and one of her hands has wound between her legs. You stroke the velvety interior once more and watch her carefully, smiling when she bites her lip to stifle a moan. She's getting off on this! You hold her ear in your other hand and run your fingers down it from top to bottom, smiling when she begins to shimmy and shake, panting out high-pitched whines of exquisite bliss.");
	output("\n\nShifting a bit further, you slide your hips up until you're seated next to your captive fuckpet, your iron-hard mast towering so high over her that it's shadow shades her face. You gather her ears together in your hands and smile down at her, wrapping them one at a time around your cock until you have two warm sleeves positioned at different points, perfect little handholds for you to squeeze and stroke with.");
	output("\n\nThe horny little lizard-girl is already quivering from having her ears used so, and she softly pants, \"<i>N-no... don't be so... so lewd!</i>\" The last word is more of a feminine pleasure-squeal than a word. She licks her lips and stuffs three of her four fingers inside herself, groping her small, pert bosom with eager squeezes. Groaning, her eyelids flutter low, and she chews on her lower lip before cooing, \"<i>Go on, jack off with my ears. You've gotten me this wet already.</i>\" She pulls her hand away to show you how sopping-wet her pussy has become, and the squelching sound her emptying snatch makes as her digits departs is music to your ears. Webs of glittering girl-cum hang between her hand and her cooch for a brief moment before she pushes back inside herself, openly schlicking. \"<i>Ungh! Please, hurry up!</i>\"");
	output("\n\nNearly snickering at her abrupt shift, you squeeze down on your two perfect cocksleeves and begin to pump, reveling in the gentle textures as they tickle along your [pc.cockBiggest], squeezing you nicely as you twitch bigger and harder inside them. Pre-cum wells out of your cumslit almost immediately, trickling down the underside of your cock to collect in the first velvety wrapping. The inside goes slick with the slippery addition, frothing around the edges as you pump up and down. Your fists work faster and faster, sometimes twisting back and forth to add another layer of sensation to the exotic masturbation.");
	output("\n\nAt the same time, the " + foes[0].skinTone + "-skinned creature is busy losing herself in the sensations assaulting her delicate psyche. Her inner ears must be wonderfully sensitive from the way she twitches and shakes with each stroke, and by the time your pre is dripping down to the second nearly frictionless cockpump, she's cumming so hard her eyes are crossed and a six-inch purplish tongue is hanging down past her chin, twitching weakly as she keens through her bliss. She looks completely lost to lust, a sight that spurs you to stroke faster.");
	output("\n\nYour pre-cum is bubbling out so quickly that it's almost a steady stream, and your [pc.cockBiggest] is swelling with tremendous need. You're going to blow soon; you can feel it inside you. Not wanting to waste the heavy load, you roll over to straddle the recovering raskvel, pinning her arms to her sides (and her hands inside her). She protests for a second until the feelings radiating down her ears and into her skull overwhelm her verbal capacity, shutting down that portion of her brain with bliss so exquisite that she's reduced to a babbling, cum-hungry mess. You pump your [pc.cockBiggest] faster and faster");
	if(pc.cockTotal() == 2) output(", completely ignoring your other penis");
	else if(pc.cockTotal() > 2) output(", completely ignoring your other penises");
	output(", hedonistically relishing in using this alien's odd anatomy as your private masturbation tool.");
	output("\n\nThe heat of the act sets off a series of contractions inside you that make [pc.eachCock] jerk and spasm once, twice... thrice, and then you're cumming, firing a load of hot [pc.cumNoun] straight into the air above your defeated once-foe. You lean back and angle your [pc.cockBiggest] forward to point away from yourself, keeping the spraying [pc.cumColor] goo firing up in long arcs that should deposit it on your blissed out companion. The tiny lizard-woman doesn't seem to mind in the slightest, as her mouth gleefully opens to catch as much as she can. Her pussy gushes out under her, soaking everything below in fragrant girlcum, practically fountaining out from below as you paint her face.");
	if(pc.cumQ() >= 70) output(" Huge, hot gobs of the stuff spatter across her face, turning it into a [pc.cumColor] mask in short order.");
	output(" Some of the [pc.cum] drizzles down your length to soak into her ears, and they're soon messy with your copious gunk.");
	if(pc.cumQ() >= 500) output(" You rain down enough for her to swallow mouthful after mouthful all while the pooling sexual release forms a massive puddle below her.");
	if(pc.cumQ() >= 5000) output(" If it weren't for the porous nature of the ground below, you'd like be filling a lake by now, but instead your [pc.cum] is likely draining down into some abandoned subterranean dwelling. Or, perhaps there's a lucky raskvel living down there, somewhere, about to get the pregnancy of her dreams.");
	output("\n\nAs your orgasm winds down, you unwrap yourself and let the raskvel's ears fall away while you slide down. Once your spurting [pc.cockHeadBiggest] is low enough, you let loose one last spurt, right into her fist-spread lips, bathing her in the seed she seemed quite anxious for earlier. The raskvel shudders at this and begins to cum once more, nearly blacking out this time.");
	output("\n\nYou smile as [pc.eachCock] slowly starts to sag, losing tumescence as you prepare to move on. The defeated alien girl is scooping your [pc.cum] off her face and into her swollen twat as you leave.\n\n");
	processTime(20+rand(10));
	pc.orgasm();
	genericVictory();
}

//Face Riding
//Ride face and make stick tail up bum.
public function faceRidingRaskvelLadies():void
{
	clearOutput();
	userInterface.showBust("RASKVEL_FEMALE_NUDE");
	userInterface.showName("DEFEATED: F.\nRASKVEL");
	output("Tossing your equipment aside, you loom over the defeated raskvel, unashamedly letting your eyes play over her perky breasts, wide hips, lengthy tail, and cute, feather-topped head. ");
	if(foes[0].HP() < 1) output("She looks on in trepidation, but at the site of your [pc.vaginas] looming overhead, the beginnings of a smile appears on her mouth. ");
	output("Her tongue slips out of her mouth to play across her lips, giving you ");
	if(flags["TIMES_RODE_RASKVEL_FACE"] != undefined) output("another good look at one");
	else
	{
		output("your first good look at it");
	}
	output(". The purplish organ is long, judging by how it stretches and writhes. It's also far thicker than you would have expected. Instead of being flat, like a human's, the raskvel's tongue is so thick that it is almost cylindrical in shape, tapered to a blunt point at its tip.");
	if(flags["TIMES_RODE_RASKVEL_FACE"] == undefined) output(" This is going to be more enjoyable than you thought.");
	else output(" This is going to be as enjoyable as you remember.");
	output("\n\nYou step over the prone slut, dropping your [pc.butt] down on her chest, squishing her tiny teats into your cheeks as you settle in. Her heavy pants wash across your [pc.vaginas] in warm waves, making you tingle with tickles of pleasure that are even now condensing into slippery, internal moisture. You settle in and scootch up to put [pc.oneVagina] up against her face, feeling the warmth of her saliva rub against your sensitive labia and rapidly-emerging clit.");
	output("\n\nYou command, \"<i>Lick.</i>\"");
	output("\n\nShe does. That thick oral organ plays across your exterior folds for a moment, slathering them in even more hot alien spit, mixing with your secretions as they begin to leak out of you.");
	if(pc.vaginaTotal() > 1) output(" The raskvel takes time to touch on each of your [pc.vaginas], giving all of them an equal share in tongue-love. One after another, she bounces between them until they're all shining with a veneer of oral affection.");
	else output(" She slathers all over until you're shining with a veneer of oral affection.");
	output(" Encouraged by this, you grab hold of her big, floppy ears and grind your [pc.hips] against her face, smearing her with your juices, shuddering when her nose bumps [pc.oneClit].");
	output("\n\nThe raskvel tries to say something, but all she accomplishes is sending lovely vibrations through your femine tinderbox, stoking the flames of passion higher and higher. After a particularly pleasant, face-creaming twinge of excitement, you back off enough to let the pussy-painted girl talk.");
	output("\n\n\"<i>Please be gentle with my ears,</i>\" she begs, \"<i>They're sensitive.</i>\"");
	output("\n\nThese things? You idly run your thumb along the inner lining of her long, flat ears. Her body shakes, and her pussy practically blooms, turning a deeper, darker purple while the lips open to reveal an entrance. A wicked idea strikes you then. A sexually stimulated partner will lick better than a bored one, after all. You begin to rhythmically caress her inner ear, watching the fluids leak down her legs and tail. She whimpers and trembles, lost in lost, panting out cute little no's while her body says yes. Once she's practically gushing juices, you grab hold of her thick tail and bend it double, plunging straight into her sodden box. The little slut's pussy clamps down so tightly that you don't think she could pull her tail out if she wanted to.");
	output("\n\n\"<i>No... no...</i>\" she pants.");
	output("\n\nYou stop touching her ears and grab her tail, stopping her from thrusting it in any further. Her protests stop immediately, and instead she gives a high-pitched mewl of distress.");
	output("\n\nThe raskvel cries, \"<i>No-no-no... don't stop!</i>\" Her cheeks flush with color. \"<i>Give me more, please. I want... need more.</i>\"");
	output("\n\nNodding to her, you release her tail and resume your rubbing of her ears, watching the twitches of pleasure shudder through her muscles. \"<i>This is the reward for being honest,</i>\" you coo as you press [pc.oneVagina] back into her face");
	if(pc.balls > 0) output(", letting your [pc.sack] cover the rest of her head, forcing her to breathe in your musky aroma");
	output(". She sniffs at your sex for a moment before her tongue lashes out, whiplike, burying itself between your folds with the vigor of a soldier's spear-thrust. Your channel goes from empty steaming box to stuffed quim in no time flat, and it couldn't be happier about it.");
	output("\n\nThe raskvel's tail begins to pump in an out of her vagina as she works. You're surprised to see it disappear past the halfway point, where it's something like six inches wide, into the petite creature. Her wide hips seem to have more uses than simple seduction, if the immense insertion is anything to go by. The faster her tail goes, the faster her tongue works, and she's soon fucking your " + pc.vaginaDescript(x) + " with wanton abandon, piercing your lips one moment, slapping your [pc.clit] the next, and slathering your vulva with licks before going back inside. The joining of cleft to mouth is so wet with spit and girlcum that sticky, bubbly strands connect the two of you at all times, even when your hips shake and pull away from the pleasure.");
	output("\n\n\"<i>Atta girl,</i>\" you coo as you let your body do as it will. Your [pc.hips] jerk in tiny little convulsions of pleasure against the cute raskvel's face, slathering her from nose to neck in girlish goo. Meanwhile, you continue to play with her ears. You actually have one in each hand, teasing the edges, stroking the insides, and sometimes even pinching at them. Whenever you pinch, you can feel her thrust her tail inside herself hard enough to send a jolt through her whole body.");
	output("\n\nThe air is rife with the scent of aroused femininity, so thick that every cock in a four mile radius is likely erecting in tribute. Ecstasy is rising through your trembling honeypot");
	if(pc.totalVaginas() > 1) output("s");
	output(", and you're helpless to resist it for long. You affectionately pet the feather \"hair\" that the raskvel has atop your head as you lewdly proclaim, \"<i>I'm going to cum all over your face, baby. Get ready.</i>\"");
	output("\n\nThe fuck-hungry alien doesn't answer at first. Then, you feel something cold and mechanical against your butt-cheek. Is that....");
	output("\n\nKa-chunk! Ka-chunk! Ka-chunk! Three needles embed themselves into you [pc.butt] rapid-fire. Ooohhh, you are so going to... going to.... Mmmm, your puss");
	if(pc.vaginaTotal() > 1) output("ies are");
	else output("y is");
	output(" so fucking wet! You arch your back and cry in ecstasy as aphrodisiacs swarm through your bloodstream, making twitch in spasm of complete, lusty bliss. You don't register the gun being removed, but you hear it fire another couple of times into something. It doesn't matter much to you, because your mind is utterly focused on your [pc.vaginas]. Everything is so hot and wet and pleasant that you could just melt out through your quivering flesh onto the alien's purple, pussy-seducing tongue.");
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
	output("\n\nLuckily, you're able to master your excitement first and gather your things while the raskvel is still twitching through her aftershocks. You yank the needles out of your ass as you prepare to leave. The clever little bitch has a matching set in her own.\n\n");
	processTime(25+rand(5));
	pc.orgasm();
	genericVictory();
}

//"Pay"
public function quotePayUnquoteFemRasks():void
{
	clearOutput();
	userInterface.showBust("RASKVEL_FEMALE_NUDE");
	userInterface.showName("RASKVEL\nFEMALE");
	output("Well, you can always pay another way and hope she goes easy on your wallet....");
	foes = new Array();
	chars["RASKVEL_FEMALE"].prepForCombat();
	trace("CHECKIN FER DICKFIT: " + pc.cockVolume(0) + " HOLEFIT: " + foes[0].vaginalCapacity() + " E SHORT: " + foes[0].short);
	//Dick Req
	if(pc.hasCock() && pc.cockThatFits(foes[0].vaginalCapacity()) >= 0) raskvelGirlsSitsIfTheyFits();
	else if(pc.hasCock()) hugeDicksGetForceWorshippedByFemRaskvel();
	//Tail-pegging
	//Nondix
	if(!pc.hasCock()) getRaskVelTailPegged();
}


//Loss vs Raskvel Scenes
public function defeatRoutingForFemRasks():void
{
	var choices:Array = new Array();
	var args:Array = new Array();
	
	//Face-Sitting Footjobs
	//Dick Req
	if(pc.hasCock() && pc.cockThatFits(foes[0].vaginalCapacity()) >= 0) {
		choices[choices.length] = raskvelGirlsSitsIfTheyFits;
		args[args.length] = true;
	}
	//Tail-pegging
	//Nondix
	if(!pc.hasCock())
	{
		choices[choices.length] = getRaskVelTailPegged;
		args[args.length] = true;
	}
	//Huge Dicks Get Dosed With Aphrodisiac While Being Forcefully Worshipped
	if(pc.hasCock() && pc.biggestCockVolume() > foes[0].vaginalCapacity())
	{
		choices[choices.length] = hugeDicksGetForceWorshippedByFemRaskvel;
		args[args.length] = undefined;
	}
	//Get Pegged while Double Penetrating Her
	if(pc.cockTotal() > 1 && pc.cockThatFits(foes[0].vaginalCapacity()) >= 0 && pc.cockThatFits2(foes[0].vaginalCapacity()))
	{
		choices[choices.length] = getPeggedWhileDoublePenetrate;
		args[args.length] = undefined;	
	}
	var select:int = rand(choices.length);
	if(args[select] == undefined) choices[select]();
	else choices[select](args[select]);
}

//Face-Sitting Footjobs
public function raskvelGirlsSitsIfTheyFits(combat:Boolean = false):void
{
	userInterface.showBust("RASKVEL_FEMALE_NUDE");
	userInterface.showName("LOST VS: F.\nRASKVEL");
	//By Savin
	author("Savin");
	//{Combat Loss: Have a Dick}
	if(combat)
	{
		output("You slump to the ground, ");
		if(pc.HP() < 1) output("utterly beaten and unable to continue the fight");
		else output("far too aroused to fight; all your mind can think about is sex, and its irresistible need to get off");
		output(". Before you can try and move, to escape the little reptile-girl you were so sure you could handle, you feel tiny, leathery feet pressing down on you, pinning your limp body to the ground. You try to move, to pull yourself free of the domineering slut's grip. She holds you fast, though, your body too ");
		if(pc.HP() < 1) output("battered ");
		else output("aroused ");
		output("to resist her.");
		output("\n\n<i>\"Tsk, could have just paid the fee...\"</i> she sighs, tossing her wrench-gun aside.");
	}
	//{Pay the Fee & Have a Cock}
	else
	{
		clearOutput();
		output("Well, let's be honest. You don't want to fight the little scaly slut, and the way she moves those hips and flaunts her pussy... you couldn't resist that if you tried. You pull out a credit chit and toss it her way, and the tiny raskvel girl snatches it eagerly, stumbling to catch it. She looks awfully surprised when you decide to pay up, but the look of glee on her face is priceless. She must really need the cash!");
		output("\n\nBut just as you're starting to warm up to the girl, her look of glee turns into one of lust, and she's on you in a moment, tossing her wrench aside and pushing you down onto the ground. You decide to go along with it, letting her man-handle you onto your back, pinning you down with one of her warm, leathery soles.");
		//{Combine}
		//charge money
		payRaskvel();
	}
	output("\n\nThe raskvel leans down, her great big ears flopping onto your face as she pokes around at your gear, slowly stripping it off of your piece by piece. As she does so, she simply says, <i>\"They're sensitive,\"</i> but the command is clear and present. You reach up and grab the wide, rounded ends of her floppy ears, rolling the thin, svelte flesh between your fingers. Your captor barely stifles a little gasp, suddenly struggling to pull your [pc.lowerGarments] off as you tease her. <i>\"N-not so rough,\"</i> she snaps, giving you a harsh slap on the thigh. You wince, but the way her scales flush a darker " + foes[0].skinTone + " tells you you're on the right track. You work your way up from the rims, your fingertips brushing and teasing across the interior, marvelling at the softness and warmth of them. In response, her body shudders, breath quickening as the raskvel tosses the last of your kit aside. You've nearly worked your way to the bases, starting to roll the floppy ears in your hands by the time she's done, and she quickly pushes you back onto your back.");
	output("\n\n<i>\"D-don't even try to make me cum that easy!\"</i> she snaps, righting herself. You get a clear glimpse at her shamelessly displayed cunt, and smile to yourself as tiny beads of lubricant dribble down, sliding down her thighs to dribble onto your exposed [pc.cockBiggest]. Your member stiffens in response, and the raskvel's quick to grab it, squeezing your prick between her tiny, but surprisingly deft, fingers. She gives the rod a few languid strokes as she looks you over, her other fingers idly circling her cunt, flicking across her two alien clits.");
	output("\n\n<i>\"Now... what should I do with a trespasser like you?\"</i> she teases, putting a finger to her chin in a mock pose of thought. Your eyes are glued to her twat, hovering so close to your own hardening [pc.cockBiggest] that you can feel the heat blossoming from her dripping sex. She sees what you're thinking all too clearly and giggles, sticking her long purple tongue out at you. <i>\"Oh, no, you did </i>not<i> fly a bajillion lightyears all the way out to </i>my<i> planet just to stick your dick in an alien pussy, did you? Well, you're mine now, so I'm going to show you how my people play!\"</i>");
	output("\n\nShe says that with a certain primal hunger, eyes glinting as she scoots forward, knees pressing into the pits of your arms; her cunt hovers barely an inch from your chin, so aroused from the ear-wank that she's practically pouring her lube out onto your neck. A slight shift of her hips brings it right to your face, the lower clit pressing into your lip. It's a simple thing to suck it up, planting a kiss at its swollen head and sucking gently. The raskvel's reaction is priceless, she barely stiffles a little whimper as you suckle her clit, biting her lip as her skin flushes darker. She starts to try and rebuke you, fist balling for another swat, but you cut her off with a sharper suck, your tongue darting into her puffy sex to lap at the free-flowing juices. She gives a whine of pleasure, breath catching as your [pc.tongue] probes into her sodden sex.");
	output("\n\nBut she soon regains her sense of dominance, and your [pc.cockBiggest] twitches as something hot and soft thumps into its rigid length. You look around the scaly girl's big hips just in time to see her long, leathery tail slipping around your [pc.cockBiggest], and give a yelp of alarm as the surprisingly powerful muscles squeeze hard at your base, choking off any hope of cumming until she says so. Licking her lips, the raskvel plants her hands beside your head, using them for support as one of her legs slips back across your prone form, one of her four big digits tracing from stem to stern along the length of your cock. You shudder as the warm, soft, underside of her toes press along your bound, sensitive cockflesh, stroking you with surprising gentleness. Two of her toes wrap around you, squeezing your prick and tugging it with quick, furtive motions, moving on an off-rhythm with your own clit-sucking.");
	output("\n\nThe raskvel girl's breathing becomes more and more erratic, chest heaving as you lick and suck, shifting from one clit to the other, letting your fingers dig into her huge hips to hold her steady as your eat her musky box, basking in the heat and slick wetness of her quivering cunt. She moans and whines, her foot-fucking becoming more and more jerky as your [pc.tongue] works her over, rolling around her walls between nibbling and licking her clits. Your [pc.cockBiggest] twitches in response to her footjob, basking in the soft soles of her alien feet, but the tight squeeze her tail's putting on your keeps you from doing much more than leaking the faintest trickle of pre. You groan as the orgasm builds up inside you, impotently welling up inside your [pc.balls] as the raskvel's hips start to buck and grind, dragging her honeypot across your face as she nears her own climax.");
	output("\n\nYou know just how to finish her off. You reach up behind the whimpering raskvel to the huge floppy ears dragging across your belly, tumbling across your [pc.chest] with every buck of her hips. You snatch the rounded ends of her ears squeezing them roughly before tracing your fingers up the sensitive underside. With a sharp, gleeful cry, you suddenly find your face drenched in fem-spunk, the raskvel's pussy squeezing down hard on your tongue as she cums, finally pushed over the edge by your relentless oral assault and the merciless teasing of her all-too-sensitive ears.");
	output("\n\nYou sputter and laugh, lapping up the oncoming flood of raskvel lube and cum as she cries her pleasure, grinding hard on your chin as she rides out her orgasm on your outstretched tongue, humping away with wild and vocal abandom, crying and moaning and screaming as her twat quivers and squeezes, trying to milk your [pc.tongue] like a cock, eager for seed that won't come. As if on cue, the girl's foot squeezes hard on your cock, jerking and spasming as she cums, and the foot-fueled orgasm practically overflows over her tail's binding grasp. But not quite. You whine helplessly as her tail holds fast, keeping your orgasm pent up in your cum-swollen cock.");
	output("\n\nFinally sated, the small scaly girl flops back onto your belly, her foot releasing your prick, leaving just her tail holding you back from release. <i>\"Mmm, I think you've earned the right to pass. For now,\"</i> the raskvel says with a thin grin, barely able to prop herself up to face you. <i>\"You offworlders sure do know how to pay a toll, dont'cha?\"</i>");
	output("\n\nYou mumble an affirmative, helplessly bucking your hips in her tail's grip. She gasps in surprise as if she'd forgotten about your trapped pecker, but quickly recovers as she hops up, dropping right back to the pose she'd had at the beginning, her slick snatch hovering over your [pc.cockBiggest]. Then, with a grin and a wink, she drops down onto it, taking your prick up to the hilt in one cum-slick motion. <i>\"It's all about the foreplay, offworlder,\"</i> she giggles, and then the tail's gone from your cock, leaving you blessedly free and ready to pop.");
	output("\n\nYour voice echoes to the heavens as your [pc.cockBiggest] bursts inside her, exploding in a hail of cum that splatters her womb with such force that slimy trails rebound back out, drooling back down your dick as she grinds on your prick, her pussy clenching hard on your [pc.cockBiggest] to keep every drop she can take, her muscles spasming to wring more and more out of your already pent up prick. Your member eagerly obliges, spurting and spurting until ");
	if(pc.balls == 1) output("your ball feels utterly emptied");
	else if(pc.balls > 1) output("your balls feel utterly emptied");
	else output("her belly looks positively bulging");
	output(".");
	pc.cockChange(true,false);
	output("\n\nYou collapse, panting hard as the raskvel whore drains the cum from your cock, taking her fill of your orgasmic offering to fill her alien womb. When she's done, you're left with ");
	if(pc.balls == 1) output("an aching ball");
	else if(pc.balls > 1) output("aching balls");
	else output("an aching cock");
	output(" and an utter satisfaction that has you drowsily watching the alien cum-slut pops off of your [pc.cockBiggest], a hand on her belly as she grabs her wrench and, blowing you a kiss, prances off. Credits and a belly full of cum seem like more than enough to sate these randy locals.");
	//If Silly:
	if(silly) output("\n\nMan this planet rocks.");
	else output("\n\nWhat a wonderful world.");
	output("\n\nWith a contented sigh, you gather your gear and, rubbing your sore, utterly emptied [pc.cockBiggest], you get ready to resume your exploration, eager to meet another of these sultry sluts.");

	processTime(20+rand(10));
	pc.orgasm();
	pc.girlCumInMouth(chars["RASKVEL_FEMALE"]);
	if(combat)
	{
		//end combat
		output("\n\n");
		payRaskvel();
		genericLoss();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Tail-pegging
public function getRaskVelTailPegged(combat:Boolean = false):void
{
	//By Savin
	author("Savin");
	userInterface.showBust("RASKVEL_FEMALE_NUDE");
	userInterface.showName("LOST VS: F.\nRASKVEL");
	//{Combat Loss: Don't Have a Dick}
	if(combat)
	{
		output("\n\nYou fall to your [pc.knees], too ");
		if(pc.HP() < 1) output("badly beaten ");
		else output("aroused ");
		output("to resist the slutty scaly's advances. She grins as you succumb, sharp teeth flashing brightly as she drops the bulging head of her wrench to the ground, leaning on it as you collapse.");
		output("\n\n<i>\"Tsk, coulda just paid the fee,\"</i>  she scolds, her voice playful as one of her hands deftly hooks into her clothes, neatly stripping herself bare with a flourish. <i>\"Now that we had to do it the hard way, I guess I'll just have to take a little... extra.\"</i>");
	}
	//{Pay the Fee: Don't Have a Dick}
	else
	{
		clearOutput();
		output("Well, let's be honest. You don't want to fight the little scaly slut, and the way she moves those hips and flaunts her pussy... you couldn't resist that if you tried. You pull out a credit chit and toss it her way, and the tiny raskvel girl snatches it eagerly, stumbling to catch it. She looks awfully surprised when you decide to pay up, but the look of glee on her face is priceless. She must really need the cash!");
		output("\n\nShe recomposes herself a moment later, leaning back against her wrench planted in the ground. <i>\"Mmm, now wasn't that easy?\"</i> she teases, licking her lips, eying you, <i>\"Just for that, I guess I'll throw in something for you in return. You might not have a dick for baby-making, but I bet I can get your money's worth.\"</i>");
		//deduct credits!
		payRaskvel();
	}
	//{Combine:}
	output("\n\nYou follow her gaze as she hungrily takes in your body, eyes trailing from your [pc.legOrLegs] to your [pc.hips]; she makes a little twirling motion with her finger, and you slowly turn around, getting onto all ");
	if(pc.legCount == 2) output("fours");
	else output(num2Text(pc.legCount + 2));
	output(" and giving the little raskvel a perfect view of your [pc.butt]. A moment later, you feel a pair of small hands groping you, squeezing your ass appreciatively as she coos in delight.");
	//If small hips:
	if(pc.hipRating() < 10) output(" <i>\"Not much for a rask, but... it'll do, I guess,\"</i>");
	else if(pc.hipRating() < 20) output(" <i>\"Mmm, a " + pc.mf("boy","girl") + " with big ol' hips... you off worlders know how to build 'em just like us!\"</i>");
	else output(" <i>\"Daaaamn, those hips. I can't wait to sink my fingers into these babies,\"</i>");
	output(" the raskvel grins, giving you a sharp swat on the behind that makes your flesh jiggle. You feel her deft handsplaying across your [pc.skinFurScales], slowly peeling your [pc.gear] off, tossing them carelessly aside before giving your bared ass a little squeeze and a spank as she circles around you, fingers brushing along your side until you shiver in anticipation of what's to come.");
	output("\n\nThe little raskven spends nearly a minute winding her way around your body, caressing and teasing your [pc.skinFurScales], reaching around to squeeze a [pc.nipple]");
	if(pc.biggestTitSize() >= 1) output(" and cup a breast");
	output(" before finally standing before you, a pair of fingers stretching her bi-clitted cunt wide, the stretchy sex already beading with anxious lubricant, awaiting a cock that'll never come. <i>\"Alright, if you wanna get off too, you better get me started,\"</i> she commands, presenting her pussy to your face, so close that her clits practically bump your chin and nose. It doesn't take anything more than that to get you working; the scent alone wafting from her snatch, the potent aroma of sex and desire, is enough to lure your tongue out to drag from clit to clit, lapping at the sweet secretions of her womanhood. The raskvel's entire body seems to quake at that first touch, her hands grabbing your hair to steady herself as your [pc.tongue] probes ahead, lapping up a bead of feminine slime before pushing past her feminine folds. She accomodates you easily; a twat made to take cocks and lay eggs isn't able to come down hard enough to stop your delving oral organ, only gently squeeze and massage it, slathering you in lube.");
	output("\n\nThe raskvel slut moans and groans, her " + foes[0].skinTone + " scales darkening as you eat her out, hips slowly starting to grind against your face, bucking and squealing as your tongue goes deeper and deeper, her fingers digging through your hair. You take that as a sign of her enjoyment, licking harder, reaching deeper until she's practically cumming around your tongue, her fem-slime pouring out to poll between your hands. Just as she's on the verge, hips quaking and cunt spasming, the raskvel pushes herself off you, breathing hard, her tiny tits heaving as her knees quake.");
	output("\n\n<i>\"T-that's enough!\"</i> she gasps, putting a hand to her chest, as if to calm her hammering heart. <i>\"I'm not gonna cum before you. No way!\"</i>");
	output("\n\nSo haughty all of a sudden! Well, on your hands");
	if(pc.hasKnees() || pc.isNaga()) output(" and [pc.knees]");
	output(", you can't do much to stop her as the little raskvel gives you a rough shove, rolling you onto your back. You're quickly greeted with a new view of the little slut's drooling cunt as she straddles your shoulders, looking down into your eyes. You reach out to lick her again, but she grabs your tongue inbetween her fingers, tsking. Instead, she looks back over her shoulder, and you can feel something slithering across your belly, warm and soft and agile. Her tail brushes against your thigh, making you shudder instinctively. The tiny tip wraps around ");
	if(pc.legCount > 1) output("one of");
	output(" your [pc.legOrLegs], slithering down and down until you feel a sudden, sharp pressure against the tight-clenched ring of your [pc.asshole]. Your stifle a gasp as she gives just the slightest push... and your muscles can do nothing to hold her back. The raskvel giggles maniacally as you writhe beneath her; her tail slithers in inch by inch, growing from tiny tip to an inch wide, with more to go. You groan and moan and arch your back, breath coming hard as you're utterly violated by the soft by powerful alien appendage. Her sinuous tendril is unstoppable, unrelenting no matter how hard your [pc.asshole] squeezes and wrings it, the raskvel pushes onward, thrusting up your ass until your stomach's practically bulging.");


	pc.buttChange(100,true,true,false);
	output("\n\nWhen she's confident you can't take another inch, the cheeky raskvel doesn't start to thrust or hump or anything that a cock-wielding creature would. No, she's got something more insidious up her sleeves. She merely grins down at you, commanding you to lick again. You barely hear her over your own moans, your mind lust-addled and desperate for the release of the mounting urge brought on by your anal penetration. Desperately you move to obey, your [pc.tongue] lapping out to her quivering quim, probing past her loose lips....");
	output("\n\nAs soon as you do, she starts to wag her tail.");
	output("\n\nYour mouth locks open in a mewling cry as the raskvel slut's tail starts to thrash and squirm, moving around inside you like a serpent, its movements undulating and wild. Your voice breaks, crying your pleasure as you nearly cum from the first moments of her sexual assault. But then she stops, holding deathly still.");
	output("\n\n<i>\"Lick,\"</i> she commands, her tail motionless inside you. Your hips wriggle, desperate for the overwhelming pleasure of her tail-fucking. <i>\"LICK!\"</i>");
	output("\n\nYou whine and comply, grabbing her big hips and diving in, suckling from one of her cllits like a teat. In response, she coos and moans, cupping one of ");
	if(pc.biggestTitSize() >= 1) output("your [pc.chest] for support");
	else output("her small teats, squeezing a nipple");
	output(" as she starts to move her tail, letting it grind and slide and writhe inside you, and with that you cum, and cum hard. You scream, back arching as she slams her tail into you again and again, hammering a mind-shattering orgasm from you, your own cries masking hers as your tongue drives her over the edge with you, spattering your face with alien fem-cum.");
	output("\n\nBy the time you come back to your senses, the raskvel slut's rolled off of you, clutching her clothes to her cum-smeared body, chest heaving. <i>\"You off-worlders... I gotta get my toll from you more often, " + pc.mf("handsome","beautiful") + ",\"</i> she winks, staggering to her feet. You meekly nod, feeling horribly, wonderfully loose after the mammoth tail-pegging you just recieved. The raskvel saunters off with a wink and a blown kiss, leaving you to collect your kit and leave the scene, [pc.legOrLegs] wobbling as you waddle off.");
	processTime(40+rand(20));
	pc.girlCumInMouth(chars["RASKVEL_FEMALE"]);
	pc.orgasm();
	//Incombat
	if(combat)
	{
		output("\n\n");
		payRaskvel();
		genericLoss();
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Huge Dicks Get Dosed With Aphrodisiac While Being Forcefully Worshipped
public function hugeDicksGetForceWorshippedByFemRaskvel():void
{
	userInterface.showBust("RASKVEL_FEMALE_NUDE");
	userInterface.showName("LOST VS: F.\nRASKVEL");
	//HP loss
	if(pc.HP() < 1)
	{
		output("\n\nCollapsing on your back, you pant for breath as you try to recover. You can't believe you were beaten by such a diminutive creature, let alone one with such simple goals. Even now, she's striding over to you with a confident look on her scaley face. She comes to a stop a step away and scolds, <i>\"You should've just paid the toll, now I'm going to take it out of your hide.\"</i> She pulls the pistol off her hip. <i>\"First lets get you ready.\"</i>");
		if(pc.tallness >= 60) output("\n\nYou're pushed, pulled, and tugged for some time before the tiny girl is able to roll you");
		else if(pc.tallness >= 40) output("\n\nYou're rolled over by the diminutive creature with some difficulty");
		else output("\n\nYou're easily rolled by the diminutive creature");
		output(" as she strips you of your gear, leaving you naked and face down.");
		output("\n\n<i>\"A little performance anxiety?\"</i> the raskvel comments on your pained, unaroused state. <i>\"Let me fix that.\"</i> She presses a button on her pistol and presses it against your neck, pulling the trigger before you can even try to pull away. There is the snap-hiss of device launching its projectile and a burst of pain.");
		output("\n\nYour whole body twitches from the hit, but almost immediately, the hurt from your injuries begins to fade. You yank the dart out of your neck to look at the empty container as your hurts vanish. She healed you? Before you can take advantage of your reinvigorated state, the gun is pressed against your ass. Three shots go off in rapid succession, drumming into you with such speed that they blur together into one big pinch of pain. If you were sleeping, you'd have awoken. Instead, the only waking up is your sex drive. Your heart thuds heavily in your chest as the chemicals wind their way through you, redirecting the blood from your brain to your groin in cock-filling, passionate pumps.");
		output("\n\nYou groan, <i>\"Wha?\"</i> as your [pc.cocks]");
		if(pc.cockTotal() == 1) output("surges");
		else output("surge");
		output(" up to ");
		if(pc.cockTotal() == 1) output("its");
		else output("their");
		output(" full size in seconds. It looms over the both of you as your hands stretch towards it, determined to bring you off as fast as possible. You aren't just horny. You're beyond horny. You need to cum as surely as you need to eat, drink, and sleep.");
	}
	//Lust loss
	else
	{
		output("\n\nYou sink down onto your back, [pc.eachCock] erecting to its full, tumescent weight as it towers over your prone form. The ");
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
			output("surpsise");
			if(pc.cockTotal() == 1) output("s");
			output(" you with the quickness of ");
			if(pc.cockTotal() == 1) output("its ");
			else output("their ");
			output("growth");
			output(". With an immediacy born of desperation, you grab hold of your immense shaft in both hands and begin to desperately jack off, looking towards the smug little raskvel with pleading eyes.");
		}
	}
	//MERGE
	output("\n\nOpening wider and wider, the raskvel's eyes grow large as she gazes upon your swollen mass. She whispers, almost worshipfully, <i>\"It's so... so big....\"</i> Just when she looks about to ask if she can touch it, she shakes her head and steadies herself, standing a little taller and prouder. <i>\"This isn't your cock anymore, [pc.race]. It's mine.\"</i> She places a palm on your urethral bulge, feeling it jump at the touch. <i>\"My gigantic, cum-spewing... mmmm.... I wish I could ride you,\"</i> she says, more to your tool than to you. She leans against it, hugging it in her lithe arms and nuzzling a smooth, scaled cheek against it. <i>\"So perfect,\"</i> she breaths against you.");
	output("\n\nThe exhalation causes you to groan with ever-increasing need, and your [pc.cockBiggest] thrums at her touches, responding far more strongly to her touches than your own fevered stroking. Her scaled feet kick your arms away, and she steps onto your wrists to pin them in place. Surprisingly her feet feel like super-soft, warm leather, and there's enough give to keep the pose from paining you. You grunt and lift your hips to smear your [pc.cockBiggest] against her cheek, hedonistically wallowing in whatever sensation you can achieve. You're bubbling up a nice dollop of pre-cum now, and some of it smears across the raskvel's cheek.");
	output("\n\nGathering your early release on the underside of a claw-tip, she slurps it into her mouth for an experimental taste. She rolls it around her mouth before swallowing, wondering out loud, <i>\"Is this what aliens taste like?\"</i> She regards your [pc.cockBiggest] warily before licking her lips. <i>\"Good,\"</i> she remarks with a saucy smile, more to your penis than to you, <i>\"I bet it'll give me nice, round eggs, won't it.\"</i> She slobbers kisses against your [pc.cockHeadBiggest], sucking down the pre-cum as it emerges from desperately twitching shaft. \"<i>Good " + pc.mf("boy","girl") + ",\"</i> emerges from her throat in a warbling purr.");
	output("\n\nYou groan, muscles clenching wildly and out of time with each other, reveling in the feeling of exquisite hardness and yet heedlessly hoping she'll give you release. You're so distracted by your state that you fail to notice the cock worship momentarily slow. Three darts thump into the meat of your arm, but you barely feel them. They are but tiny pinpricks compared to a raging tsunami of pleasure and need that has enveloped your [pc.cockBiggest]. You pant as artificial heat overwhelms you. Pre-cum rolls out of your tip in long wet ribbons to be collected by the raskvel's greedy, slurping tongue.");
	output("\n\n\"<i>That's better,</i>\" the short, wide-hipped lizard-woman coos. ");
	if(pc.balls > 1) output("She steps off your wrist to gingerly squeeze one of your [pc.balls] with her supple foot. You can feel your ardor distilling down there, condensing into liquid love just waiting to be squeezed out, sloshing around under the tender affections of her sole. After a few such squeezes, she returns to stending on your wrist. ");
	output("She snuggles up against your cock grinding her vulvae against it so hard that her lips spread to either side of your urethra, the heated point of her noticeable clitty digging into you as she grinds.");
	output("\n\nThe raskvel presses her lips to your swollen cockhead and kisses it slow, plunging six inches of her tongue straight into your dripping slit. She sucks it back and swallows, sighing as she grabs an item off her belt. <i>\"Some off-worlders went around giving out these things,\"</i> she says, holding a condom. <i>\"Said it was supposed to prevent disease or whatever, but how are we supposed to get pregnant that way?\"</i> She gives your cock a worshipful lick and a hum in between sentences. <i>\"I thought of a better use for it. When I find a big, virile stud who's too big to fit inside me, I just wrap them up in this tight little package and let it collect all their jism.\"</i> Both she and your cock shiver in anticipation. <i>\"Then afterward, I can put the open end inside me and squeeze your dna-stuff into my womb. I'll be sure to have lots of strong, wonderful eggs after that!\"</i>");
	output("\n\nTearing open the sealed package with sharp teeth, the cum-harvesting creature sadly glances back at your [pc.cockBiggest]. <i>\"I'm not going to get to taste anymore.\"</i> Then she shrugs, already cheerful again. <i>\"I'll have all the cum I can handle, though!\"</i> Her feminine slickness drips down the bottom half of your shaft all the way down to your ");
	if(pc.balls > 0) output("[pc.balls]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else output("taint");
	output(". Tightness wraps around your [pc.cockHeadBiggest] as she works, and you pump out another few droplets of pent-up lust into the tip as soon as it's put in place. You're whole body is twitching with need at this point, and the touches, strokes, and tight condom are enough to keep you riding on the edge but unable to cum.");
	//Randomly choose one of the following bring to orgasm variants prioritizing PC endowment versions.
	var choices:Array = new Array();
	var select:int = 0;
	if(pc.hasCockTail()) choices[choices.length] = 1;
	if(pc.hasTailCunt()) choices[choices.length] = 2;
	select = choices[rand(choices.length)];

	//Self tailpeg
	if(select == 1)
	{
		output("\n\n<i>\"What's this?\"</i> the raskvel asks as she notices your [pc.tails] thrashing. Your [pc.tailCock] has started to expose itself, humping against the ground to peel back its coverings. <i>\"Is that another cock?\"</i>");
		output("\n\nYou nod, biting your lip to keep from releasing an altogether too submissive whine. Giggling gleefully, she reaches down to grab it and pops it in her mouth. She sucks on it playfully, sure to keep it away from her teeth while her tongue slithers and slides along your sensitive tailskin. That organ is leaking as freely as the first after a few moments.");
		output("\n\nThen, the saucy little alien yanks it out of her mouth, regarding your wiggling organ for a moment before smiling cruely. <i>I think the big one will give me plenty, so why don't I use this one to squeeze out a little more?\"</i> She reaches down, bending to press your [pc.tailCock] to your [pc.asshole]. Wet as it is, she's able to slide it in as easily as if it belonged there.");
		pc.buttChange(pc.tailCockVolume(),true,true,false);
		output(" Your prostate spasms at the sudden contact, and violently contractions spasm through your middle as building warmth seems to grow from within you. You dazedly announce, <i>\"I... I'm cumming!\"</i>");
	}
	//Tail docking
	else if(select == 2)
	{
		output("\n\n\"<i>What's this?</i>\" the raskvel asks as she notices your [pc.tail] thrashing. The tip is leaking copious amounts of lubrication all over the ground as the flush, pussy-like lips part in excitement. <i>\"<i>Is that... a tail... tail-pussy?\"</i>");
		output("\n\nYou nod, biting your lip to keep from releasing an altogether too submissive whine. Giggling gleefully, she reaches down to grab it and lifts it up high, sticking a finger into its folds experimentally. Your [pc.tailCunt] sucks her finger right on in, massaging it as if it could squeeze sustenance fromt he proferred digit.");
		output("\n\nSquealing with girlish glee, the raskvel yells, <i>\"By the gear gods, I want one of these! I bet it feels sooooo good, doesn't it?\"</i>");
		output("\n\nYou moan.");
		output("\n\n<i>\"I thought so.\"</i> the horny girl lowers your [pc.tail] as she lifts her own. With one in each hand, she presses them together, sliding her narrow tip past the lips and deeper within. Her rearmost appendage is swiftly grabbed by your internal muscles and held deeper, pulled in until it's almost painfully stretching your entrance. The additional penetrative pleasure is all it takes to push your mind past the brink, and hot flashes begin to wrack your middle, culminating in a bloom of pleased warmth. You dazedly announce, <i>\"I... I'm cumming!\"</i>");
	}
	//Get tailprobed
	else
	{
		output("\n\n<i>\"I know just how to make you give up all that nice cock-cream,\"</i> the raskvel announces with a little too much pride in her voice. She worshipfully plants another kiss upon your half-sheathed [pc.cockNounBiggest]. As she draws back, her tail slides up between your penis and her lithe form, wiggling sensually. <i>\"I'm going to milk you like I do the boys back home.\"</i>");
		output("\n\nYou open your mouth, but before you can say anything, she silences you by running her hand from your [pc.cockHeadBiggest] to your [pc.sheathBiggest], caressing the sensitive flesh and feeling around ");
		if(pc.hasKnot(pc.biggestCockIndex())) output("the supple interior of your sheath");
		else output("the taut base");
		output(". You can do naught but moan bubble pre, arching your back in a way that gives her the perfect target for her sinfully smooth tail. It dives down into your [pc.asshole] with nary a word of word, slipping past your cheeks and deep into that darkest hole easily at first and then with greater difficulty as it widens, forcing you to spread agonizingly wide around.");
		pc.buttChange(80,true,true,false);
		output(" The further it in goes, the harder your [pc.cockBiggest] gets, until it begins to feel a bit like an inflatable toy that's taken a bit too pressure and is about to pop. At last, her tail curls up to press upon a hard knot inside you, and your muscles convulsing, squeezing your lust into a hot warmth that's spreading towards your cock at record speed. You dazedly announce, <i>\"I... I'm cumming!\"</i>");
	}
	//Orgasm!
	output("\n\nThe tip of that too-tight, latex-like enclosure already stuck out a bit, sort of like an uninflated balloon. Now, it stretches out in a titanic line nearly three feet above your pulsating prick. Again and again, lances of white-hot [pc.cumNoun] fire out of your [pc.cockBiggest], distorting the transparent enclosure into a rapidly-filling balloon of liquid passion.");
	if(pc.cumQ() <= 10) output("You fill it with a few drops.");
	else if(pc.cumQ() <= 75) output(" You fill it up to roughly the size of a small apple before finishing with a dopey, satisfied smile.");
	else if(pc.cumQ() <= 250) output(" You fill it up to roughly the size of a canteloupe before finishing with a dopey, satisfied smile.");
	else if(pc.cumQ() <= 1200) output(" You fill it up to roughly the size of canteloupe before firing some more, stretching the bubble out to the size of basketball. It sloshes ponderously as its pulled down by gravity.");
	else if(pc.cumQ() <= 3000) output(" You fill it up to roughly the size of a basketball and yet somehow keep going, pouring more and more spunk into that taut enclosure until it's the size of a watermelon and the pressure is forcing streams of your [pc.cum] back out the bottom.");
	else output(" You fill it up to roughly the size of a watermelon before the sloshing, liquid weight yanks the bulbous [pc.cumNoun]-tank down under its own gravity and keep going until it swells up to the size of a beachball. It sloshes ponderously back and forth with each fresh jet, the pressure so great that streamers of cum are shooting out the bottom of the condom even as you fill the top.");
	if(pc.cumQ() >= 10000) output(" In spite of your torrential climax, the condom seems to be as big as it will go, and each new blast just exits out around the seam at the bottom.");
	output("\n\n<i>\"No more?\"</i> the raskvel coos as she gently pats your twitching maleness. <i>\"Just a few more drops for your toll, please.\"</i> Her tail squirms inside you, squeezing out one last, huge spray of [pc.cum]. <i>\"There we go.\"</i> She withdraws from your anus while planting a chaste kiss upon your spent phallus");
	if(pc.cockTotal() > 1) {
		output(", carefully not to slip in the seed your other, unnattended boner");
		if(pc.cockTotal() > 2) output("s");
		output(" shot");
		output(".");
	}
	output("\n\nThe huge spunk-bubble is twisted off just past the top of your penis, and the whole mess is pulled away. The cool feeling of evaporating sexual juices causes [pc.eachCock] to shrivel faster while recover. Unfortunately, the raskvel has time to rummage through your equipment and tie off her prize before she goes. She even waves goodbye, saying, <i>\"Thanks for the good time, love. Be a dear and come back later if you want to see how your juice took.\"</i>");
	processTime(30+rand(10));
	pc.orgasm();
	output("\n\n");
	payRaskvel();
	genericLoss();
}

//Get Pegged while Double Penetrating Her
//Double peg raskvel!
public function getPeggedWhileDoublePenetrate():void
{	
	userInterface.showBust("RASKVEL_FEMALE_NUDE");
	userInterface.showName("LOST VS: F.\nRASKVEL");
	var x:int = pc.cockThatFits(foes[0].vaginalCapacity());
	var y:int = pc.cockThatFits2(foes[0].vaginalCapacity());
	//HP: 
	if(pc.HP() < 1)
	{
		output("\n\nSinking down on your side, defeated, you look up at your petite subjugator with defiance in your eyes. Your token resistance did little to dissuade the alien woman from her goals. Indeed, she seems more determined than ever to wring her fine from you one way or another. You watch her warily as she closes the intervening distance");
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
		output("\n\n<i>\"Oh, quit it, you. You came on my planet and lost to me. You should be thankful that all I want are a few credits and a little fun. On some world's you'd be turned into a slave or mulched into fertilizer,\"</i>  the victorious lady says flatly. <i>\"I think you'll find paying my fine to be more than worth your while, if you'll just relax a little, you big stiffy.\"</i>  She idly caresses [pc.oneCock] with a toe. <i>\"Yess, big and stiff...\"</i>");
		output("\n\nAn undesired blush works across your [pc.skin]");
		if(pc.skinType == GLOBAL.SKIN_TYPE_FUR || pc.skinType == GLOBAL.SKIN_TYPE_SCALES) output(", hidden as it is by [pc.skinFurScales],");
		output(" as your [pc.cocks] react to the slight creature's toe-touches");
		if(pc.lust() > 66) output(", twitching hard enough to press against the bottoms of her feet.");
		else output(", filling and engorging so fast that their girthy shapes press against the bottoms of her feet.");
		output(" Her leathery skin is suprisingly supple down there, like the finest, softest leather money can buy, conforming wonderfully to your closest member. She squeezes her toes down, introducing a number of delicate wrinkles to the cock-filling foot-job. In no time flat, she's taken your body from tired and injured to a sexual rut.");
	}
	//Lust:
	else
	{
		output("\n\nNo longer resisting, you shed your [pc.gear] and collapse, grabbing a dick in each hand and pumping, stroking yourself with such eagerness that all previous thoughts of resistance are blasted out of your mind by raw, sexual ache. The raskvel, looking surprisingly imposing from your position on the ground, licks her lips and croons, <i>\"That's a good " + pc.mf("boy","girl") + ".... I knew you'd come around with enough encouragement.\"</i> She daintily presses a foot down onto [pc.oneCock], stroking it up and down with the supple skin and occasionally squeezing it with her toes. You groan out loud and stop jacking off long enough to swivel towards her, presenting your multiple dicks to the victorious female, hoping she will continue to lavish such attentions upon your needy crotch.");
	}
	//Both continue
	output("\n\nThe raskvel smiles as you lose yourself in both the delicate folds between her toes and her prominent arches, rubbing [pc.eachCock] down with eager strokes, sometimes pushing down with just enough force that your [pc.cock " + y + "] becomes squished between your [pc.belly] and her dexterous soles. You shudder in enjoyment");
	if(pc.cumQ() >= 300) output(" and begin to leak dribbles of pre-cum from your tips, dribbles that are soon gathered on her foot to turn your dicks into a slippery mess");
	else output(", barely noticing when she upends a bottle over your crotch to douse your masculine bundle in slippery lubricants.");
	output(" She pumps your slick members nice and slow, working you into an eager mess.");

	output("\n\n<i>\"Now that's more like it,\"</i>  the scaled seductress croons as she reluctantly pulls her foot away. A glimmering web of translucent fluid appears and breaks apart just as quickly, snapping just before the alien steps away, dropping her gear to the ground in a heap. <i>\"You didn't think I was going to have you waste yourself on my feet, did you?\"</i>");
	output("\n\nYou respond by plaintively lifting your hips afterward, and when that doesn't work, you start to rise up after her, positively needing to bury ");
	if(pc.cockTotal() == 2) output("both ");
	else output("at least two ");
	output("of your dicks in her passages, particularly the purple interior of her soaking-wet cunt. She doesn't allow that to come about. No, her foot, still stained with moisture and cock-scent, slams down on your chest");
	if(pc.biggestTitSize() >= 1) output(", right between your [pc.fullChest]");
	output(", pinning you you flat on the ground. She follows up before you can react, vaulting onto your [pc.hips] so that your [pc.cocks] are pinned behind her smooth-scaled bottom, one threading so perfectly between her cheeks that you nearly blow your load all over her lovely crack.");
	output("\n\nSmirking and flexing her cheeks, she squeezes that [pc.cock " + y + "] with teasing compressions of her surprisingly large bottom, rolling her hips from side to side to grind her purplish pussy over your [pc.skinFurScales]. You can feel both her clits dragging along, leaving a trail of potent femslime behind them, staining you with the tiny creature's unmistakably girlish aroma. She giggles, high pitched and tittering, before admitting, <i>\"I was kind of hoping you wouldn't pay, ya know? Not with this much dick banging along here.\"</i>  She lifts herself up, letting that ass-dragging prick slip its tip against her clenching pucker. <i>\"Be sure and let me know if you're ever in the market for a wife...\"</i>  She twists a " + pc.cockDescript(x) + " past the ass-obsessed penis so that its [pc.cockHead " + x + "] nestles in between her violet lips, nestled deep in that juicy entrance without quite going inside. She whimpers. <i>\"...or a harem girl.\"</i>");
	output("\n\nYour start to answer, but before you can breathe a single word, her muscular thighs give a final quiver and turn to jello. Her body, slight as it is, is entirely supported on your [pc.cocks] for an agonizing moment. Her pussy gives up almost immediately, greedily spreading around your [pc.cock " + x + "] and swallowing the first few inches, canting the hungry slut forward so that she has to catch herself on your [pc.chest]. She groans in excitement and pinches playfully at your nipples, and then her rosebud relaxes enough to accept your [pc.cock " + y + "], the tight ring dragging along your secondary length with blissful pressure. You exhale so loudly that it sounds almost like a moan and lift your own [pc.hips] to accelerate the diminutive slut's dick-descent.");
	pc.cockChange(true,false);
	output("\n\n<i>\"Rowdy little, " + pc.mf("stud","she-stud") + ", aren't ya,\"</i> the double-stuffed raskvel cooes in between lurid moans. Her eyelashes flutter as she sinks deeper onto your paired shafts, convulsing and squeezing them with her internal muscles so tightly that you can feel yourself through her thin, inner walls. The two hard bumps that are her prominent clitties press rigidly against your lengths as she moves, both felt on your cunt-stuffing phallus and part of one against your ream-ready dick. You convulse slightly under the onslaught of sensation, faced with twice the pleasure any unmodded human would ever be able to experience and still somehow holding on. In spite of your shudders, the little dominatrix continues her journey towards your crotch, dripping wetness with such ferocity that the excess coats both your dicks.");
	output("\n\nSmooth-scaled butt-cheeks collide with your well-glossed loins as she finishes taking both your poles ");
	if(pc.hasKnot(x) && pc.hasKnot(y)) output("to their knots");
	else if(pc.hasSheath(x) && pc.hasSheath(x)) output("to their sheaths");
	else output("in their entirety");
	output(". The raskvel is panting atop you, a victorious grin plastered across her wanton expression as she leers down at you, ");
	if(pc.cockVolume(x) >= 100 && pc.cockVolume(y) >= 100) output("victoriously cupping the abdomen-distended bulges with her hand.");
	else output("victoriously shifting her curvy thighs in short little circles to remind you just who's come out on top");
	output(". <i>\"Mmm, a girl could get used to this kind of treatment,\"</i>  she lustily growls as she bends down wrap a slender arm around your shoulders. <i>\"Two big strong dicks at her beck and call? She'd have to know just how to use them.\"</i>  She ");
	if(pc.tallness <= 48) output("bites your [pc.lip]");
	else if(pc.tallness <= 60) output("nibbles on your [pc.nipple]");
	else output("kisses your [pc.belly]");
	output(". <i>\"Luckily this girl knows exactly how to tame beasts like these.\"</i>");

	output("\n\nThe petite scale-slut wraps both arms around your neck, arches her back up, and begins to thrust. Her juicy snatch glides a good four or five inches upMy sm your length, caressing you with the unusually puffy, sensitive labia that surround her passion-inflamed pussy. The clenching ring of her pucker tortures your " + pc.cockDescript(y) + " in an entirely different, much tighter way, squeezing down so tightly that it almost pains you. She holds there and begins to undulate her hips, rocking one side up and the other down, twisting your members through her tunnels, giving them an internal massage they're unlikely to ever forget. The lewd schlicks and squishes are an irresistable, clarion call to your subconscious, a veritable siren's call to orgasm that digs at your subconscious, commanding you to flood her cunt with spunk.");
	output("\n\nBefore you can give her the creaming she deserves, the gleeful little fuckdoll's eyes roll back, and a torrent of fragrant femslime erupts from her twitching box, showering your groin with more of her lewd enjoyment. She whimpers, mouth-agape, and digs her fingertips into your back. You watch in awe as a fully six-inch long tongue rolls out of her mouth, and she quickly begins to kiss you with it, sliding it up the side of your jaw before she forces it into your mouth and begins to french you with alien abandon. Abruptly, she slams her fertile thighs back against your own, pinning you down and grinding her snatch and ass as hard against you as her body will allow.");
	output("\n\n[pc.EachCock] bloats anxiously, and you briefly struggle to control the climactic contractions of your abdominal muscles as they start you on the path to an explosive release. At the same time, the raskvel is already coming back down, locking eyes with you and intentionally contracting and squeezing her muscles to massage your members. She breathily pants, <i>\"Give it to me, give me all that cum.\"</i>  She shivers and croons in ecstasy, starting a second orgasm of her own even as your body is quaking towards its own release. <i>\"Give me your babies, off-worlder!\"</i>");
	output("\n\nOn command, the " + pc.cockDescript(x) + " you've got ");
	if(pc.cocks[x].cLength() <= 14) output("hilted inside her");
	else output("rammed against whatever her species has for a cervix");
	output(" throbs and explodes, shooting lightning bolts of passion up your spine and [pc.cumColor] ");
	if(pc.cumQ() <= 8) output("drops");
	else if(pc.cumQ() <= 50) output("ropes");
	else if(pc.cumQ() <= 250) output("wads");
	else if(pc.cumQ() <= 500) output("splashes");
	else if(pc.cumQ() <= 2000) output("torrents");
	else output("floods");
	output(" straight into the alien's well-prepared womb. Her ass bounces off you as she begins to fuck you once more, restarting your orgasm before it even gets a chance to trail off. Her stretched anus gets a similar stuffing as you glaze the walls of her colon with [pc.cumColor].");
	if(pc.cumQ() >= 2000) 
	{
		output(" You shoot so much that there's a gooey blobs rolling out around each of your members as you fill her");
		if(pc.cumQ() >= 4000) output(", but those pale in comparison to the belly-bloating volume that's stuck inside");
		output(".");
		if(pc.cumQ() >= 10000) output(" The raskvel quickly grows cum-gravid and insensate, lacking the strength to shake her body with the added weight and far too pleased to form cogent thoughts.");
	}

	output("\n\nThe now-familiar tongue worms its way into your mouth for another kiss, and you happily swap spit with the alien's organ as the two of you come down together.");
	if(pc.hasKnot(x) || pc.hasKnot(y))
	{
		output(" She tries to pull off after a while, but your knot");
		if(pc.hasKnot(x) && pc.hasKnot(y)) output("s hold");
		else output(" holds");
		output(" her firmly in place. The alien shrugs and makes out with you until your genitalia decides to release her a little later.");
	}
	else output(" She pulls off not long after.");
	output(" Then, she dresses");
	if(pc.cumQ() >= 2000) output(" as best she can, given how thoroughly you filled her");
	output(" and bends down for one last kiss. There's a snap of pain on your neck, and then you're unconscious.");
	processTime(30+rand(10));
	pc.orgasm();
	processTime(200+rand(50));
	//Pass time and lose some cash!
	payRaskvel();
	output("\n\n");
	genericLoss();
}

public function payRaskvel():void
{
	if(pc.credits - 100 < 0) pc.credits = 0;
	else pc.credits -= 100;
}