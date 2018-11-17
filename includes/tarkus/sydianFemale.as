import classes.StorageClass;
public function showSydianFemale():void
{
	showName("FIGHT:\nSYDIAN FEMALE");
	showBust("SYDIAN_FEMALE");
	author("Zeikfried");
}

public function encounterFemaleSydian():void
{
	showSydianFemale();
	var tEnemy:SydianFemale = new SydianFemale();

	if (flags["MET SYDIAN FEMALE"] == undefined)
	{
		flags["MET SYDIAN FEMALE"] = 1;

		output("\n\nHisses and scratches follow you at a distance as you pick your way through the junk, but nothing is moving when you look except your dust. The noises return when you try to press on... there’s <i>something</i> out here. Unable to find it in the irregular garbagescape, you become paranoid....");
		
		output("\n\n");
		if (pc.isBimbo()) output("<i>“Like, this isn’t fair!”</i>");
		else if (pc.isBro()) output("<i>“You wanna go?!”</i>");
		else if (pc.isNice()) output("<i>“Who’s there?”</i>");
		else output("<i>“Show yourself!”</i>");
		output(" you cry out.");
		
		output("\n\nA face pokes up from behind a pile, waving two fuzzy antennae. Despite a fetching brush of " + tEnemy.hairColor + " hair, the multi-faceted "+ tEnemy.eyeColor +" eyes and segmented covering give the creature an insectoid, alien appearance. The impression doesn’t go away when it skitters over the pile like a cockroach - though the slim waist and wide hips hint strongly that this is");
		if (flags["MET_MALE_SYDIAN"] != undefined) output(" a female sydian.");
		else output(" the female of whatever it is.");
		
		output("\n\nYour codex beeps out a " + (CodexManager.hasViewedEntry("Sydians") ? "confirmation" : "warning") +": sydian. <i>“Enzymes in the body covering catalyze rapid oxidization of most metals. Skin contact causes mild arousal in 99.8% of reported cases. Females are capable of greater enzyme production than males. Engagement at a distance is recommended.”</i> The strange woman smiles.");
		
		output("\n\n<i>“It speaks,”</i> she says. <i>“But does it have the sense to give me what I want?”</i> She pushes herself upright and you glimpse a flash of orange. Instead of taking a hostile stance, she waggles her hips, lashing her long, brushed tail. <i>“I don’t mind persuading, if you’re wavering.”</i>");
		
		output("\n\nThe sandy sizzle and visible corruption under her clawed feet suggest that resistance is in your financial interest!");
	}
	else
	{
		flags["MET SYDIAN FEMALE"]++;

		output("\n\nA hiss and scuttle follows you again. You pick up a hefty chunk of metal and throw it hard at the sound; it impacts with an echoing");
		if (rand(pc.aim() + pc.reflexes()) > rand(tEnemy.aim() + tEnemy.reflexes()))
		{
			output(" ‘thwack’");
			tEnemy.shieldsRaw -= rand(5) + 1;
		}
		else output(" ‘clank’");
		output(". A female sydian reveals herself, bemused.");

		output("\n\n<i>“How rude,”</i> the woman says. She skitters toward you, and you prepare for the fight!");
	}
	
	CodexManager.unlockEntry("Sydians");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(sydianFemalePCVictory);
	CombatManager.lossScene(sydianFemalePCLoss);
	CombatManager.displayLocation("SYDIAN (F)");
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function sydianFemalePCLoss():void
{
	clearOutput();
	showSydianFemale();

	if (enemy.hasStatusEffect("Unarmored"))
	{
		output("\n\nThe woman watches you collapse");
		if (pc.HP() <= 0) output(" into a beaten pile");
		else output(" into a lusty stupor");
		output(". She wavers for a moment, covering her ruined body art with her hands and perhaps considering retaliation. Suddenly she turns and bolts, leaving hissing tracks across the wastes. You lie there disabled for some time before realizing she isn’t coming back to take advantage.\n\n");
		//penalties but no shield debuff

		processTime(5);

		clearMenu();
		CombatManager.genericLoss();
		return;
	}

	//loss intro, HP loss:
	if (pc.HP() <= 0)
	{
		output("You");
		if (pc.hasStatusEffect("Tripped")) output(" spread eagle");
		else output(" buckle");
		output(" as the woman watches, satisfied...");
	}
	else
	{
		output("You");
		if (pc.hasStatusEffect("Tripped")) output(" curl up");
		else output(" collapse");
		output(" and begin touching yourself as the alien watches you, pleased by her prowess...");
	}

	if (pc.hasVagina() && pc.hasCock())
	{
		if (pc.femininity >= 50)
		{
			if (rand(5) > 0) sydianFemalePCLossHasCock();
			else sydianFemalePCLossHasVagina();
		}
		else
		{
			if (rand(8) > 0) sydianFemalePCLossHasCock();
			else sydianFemalePCLossHasVagina();
		}
	}
	else if (pc.hasCock())
	{
		sydianFemalePCLossHasCock();
	}
	else
	{
		sydianFemalePCLossHasVagina(); // Works for N too
	}
}

public function sydianFemalePCLossHasVagina():void
{
	output("\n\nThe slaty sydian looks down her nose, scanning your body.");
	
	output("\n\n<i>“What have we here but an inferior female?”</i> she says");
	if (!pc.hasVagina())
	{
		output(", ignoring your");
		if (pc.hasCock()) output(" [pc.cocksLight]");
		else output(" bare crotch");
	}
	output(". <i>“I wonder what made such a weakling think she was welcome in my territory.”</i>");
	
	output("\n\n");
	if (pc.isBimbo()) output("Ugh, like you could care when there’s so much yummy sex out there for the having. <i>“I was on my way to a bangin’ party,”</i> you lie.");
	else if (pc.isNice() || pc.isBro()) output("<i>“I didn’t mean to intrude,”</i> you apologize. <i>“I was only passing through.”</i>");
	else output("<i>“I heard this was where the bad bitches hang, so here I am.”</i> You smile.");
	
	output("\n\nThe woman");
	if (pc.isBimbo() || pc.isBro() || pc.isNice()) output(" snorts");
	else output(" laughs");
	output(" and squats, not even bothering to conceal her bright orange pussy. She runs a finger along your body, probing everything and");
	if (!(pc.shield is EmptySlot) && !pc.hasStatusEffect("Rusted Emitters")) output(" smiling at your discomfort when your shield system pops and sparks.");
	else output(" smiling as her touch infects your body with chemical lust.");
	if (pc.isPregnant() && pc.bellyRating() >= 15)
	{
		output(" A hand comes to rest on your swollen [pc.belly].");
	
		output("\n\n<i>“Looks like you’ve been taken by a male already,”</i> she muses, rubbing heat into it. <i>“Was he powerful? Or did you succumb to the first servant boy who looked at you with lust in his eyes?”</i>");
	}
	output(" Without warning, she shoves her palm");
	if (pc.hasLowerGarment()) output(" into your [pc.lowerUndergarment]");
	else output(" into your crotch");
	output(", cupping");
	if (pc.hasVagina()) output(" [pc.oneVagina]");
	else output(" your bare groin");
	output(".");
	
	output("\n\nYou squirm as your body heats to her touch. The alien woman watches, unconcerned");
	if (pc.hasCock()) output(" despite your swelling [pc.cocksLight]");
	output(" as fuck-lust turns your vision pink. You sigh as her hand slides away.");
	
	output("\n\n<i>“Were I male, I could");
	if (!pc.hasVagina() || (pc.isPregnant() && pc.bellyRating() >= 15)) output(" have fun with your slutty hole,”</i>");
	else output(" put a strong baby in you,”</i>");
	output(" she says, examining the moisture on her hand. You look down, sure that you couldn’t be so lubricated from such poor foreplay, but your hot sex shines wetly. Another trickle works free as the sydian thrusts her tail through her thighs.");
	
	output("\n\nShe rubs your fluid into the fuzzy tip, fingering it like a cock. <i>“I’d slide right into you and take my pleasure...”</i> she coos. A fluffy brush jabs your [pc.vagOrAss], enflaming you with chemicals. The concentration of enzyme on her tail spikes fuck-lust straight into your brainstem, and your eyes roll as you begin to grind your hips.");
	
	output("\n\nYour cruel captor leans closer. <i>“I could swirl your insides about until you were blind with tears of ecstasy, drooling from both ends and ready to receive my seed.”</i> She taps at your [pc.nipple].");
	if (pc.biggestTitSize() <= 1) output(" <i>“I could watch your bust grow to a respectable size with milk.”</i>");
	else if (pc.isLactating()) output(" <i>“I could help ease the pressure of these perverted breasts.”</i>");
	else if (pc.biggestTitSize() <= 5) output(" <i>“I could watch these fat breasts swell with milk for our child.”</i>");
	else output(" <i>“I could caress these ridiculous mounds until you came from the stimulation and squirted milk.”</i>");
	
	output("\n\nYour blood hammers at your temples when the alien’s branched tail tickles your crotch with a sadistic, sinuous wave");
	if (pc.hasCock()) output(". Precum covers its surface, deposited there in long ropes by your [pc.cocks], and your");
	else output(", and your");
	output(" hands grasp at her plated hips, trying to pull her deeper inside. For one brief moment you make eye contact, and despair washes over you.");
	
	output("\n\n<i>“Too bad,”</i> says the woman. <i>“I have no use for you.”</i> Her tail jerks free, leaving you empty and burning with enzyme, and she shoves you to the ground. The sydian struts away with hips swaying in mockery.");
	
	output("\n\n<i>“W-wait...”</i> you croak. She glances from the corner of her eye, flicks her tail dismissively, and saunters off.");
	if (!(pc.shield is EmptySlot) && !pc.hasStatusEffect("Rusted Emitters")) 
	{
		output(" On top of being horny enough to fuck an icicle, you remember with grief that your shield isn’t going to work right until you get repairs.");
		applyRustBroStatus();
	}
	output("\n\n");

	processTime(30+rand(15));
	pc.orgasm();

	CombatManager.genericLoss();
}

public function sydianFemalePCLossHasCock():void
{
	output("\n\nThe sydian smiles, eyeing your");
	if (!pc.isCrotchExposed()) output(" crotch");
	else output(" [pc.crotch]");
	output(". She struts over.");
	
	output("\n\n<i>“");
	if (pc.tallness < (12 * 7)) output("Big");
	else output("Little");
	output(" boy");
	output(", what are you doing in my hunting grounds?”</i> she asks sweetly, probing your face with her antennae.");
	if (!pc.hasStatusEffect("Rusted Emitters") && !(pc.shield is EmptySlot)) output(" <b>Her adroit fingers pick over your gear, and you hear a faint popping from your shield system. Fuck. </b>");
	output(" <i>“Did you come here to be hunted?”</i>");
	
	output("\n\nYou swallow hard as the kiss of sydian enzyme spreads through your [pc.skin].");
	if (pc.isBimbo() || pc.isBro()) output(" <i>“I’m just out here, alone and vulnerable... me and my big, stiff [pc.cocksLight],”</i> you say, thrusting your vulgar pelvis. The woman is taken aback by your brazen sexuality for a moment.");
	else if (pc.isNice()) output(" <i>“Well, ah... I was looking, I mean, I was hoping to find...”</i> you stammer, cut off when the woman runs her thumb over your lips.");
	else output(" <i>“I heard you liked big dicks... well, I’m the biggest dick there is,”</i> you quip. She laughs once and cups your face in her hands, looking into your eyes.");
	
	var c:int = pc.cockThatFits(enemy.vaginalCapacity());

	output("\n\n<i>“Silly,”</i> she murmurs");
	if (!pc.isCrotchExposed()) output(", slipping [pc.oneCock] free of your [pc.lowerGarments]");
	output(", <i>“I’m going to enjoy you.”</i>");
	if (enemy.lust() < 33 || c < 0)
	{
		//low monster lust/all cocks too big outcome
		output(" As you stare into her opaque, "+enemy.eyeColor+" pools, a niggling voice warns you that ‘enjoy’ might not mean what you hope....");

		output("\n\nThe sydian’s hand wraps around your [pc.cock], spreading aphrodisiac. She pulls her palm away, sliding just her long fingers along the shaft from base to tip. A dollop of precum answers the chemical heat.");
		
		output("\n\n<i>“You’re getting off from just my hand,”</i> she chides. <i>“How do you hope to serve a woman?”</i>");
		
		output("\n\n");
		if (pc.isBimbo() || pc.isBro()) output("<i>“It’s okay,”</i> you grunt. <i>“I can come lots.”</i>");
		else if (pc.isNice() && rival.isFeminine()) output("<i>“With a subpoena,”</i> you grunt, suddenly thinking of your cousin.");
		else if (pc.isNice() && !rival.isFeminine()) output("<i>“I can use my hands...”</i> you hazard.");
		else output("<i>“On the dance floor,”</i> you snap.");
		output(" The alien smiles as your hips begin to pump, fucking through her pre-slicked grip. Her fingers close in, making a tight ring for your [pc.cockNounComplex].");
		
		output("\n\n<i>“Mmm,”</i> she hums, staring intently. The woman allows you to penetrate her hand as hard as you like, helping you out by tickling the [pc.sheath] of your cock with her tail and spreading her lust-drug.");
		if (pc.balls > 0) output(" Her second hand caresses and strokes your [pc.scrotum], heating your balls with chemical love until they promise a huge load.");
		else if (pc.hasVagina() && pc.balls == 0) output(" A finger of her other hand slides into [pc.oneVagina]; the bloom of warmth that consumes your labia makes you hornier still.");
		output(" The handjob-turned-handfuck is so good that you feel seconds from orgasm, pumping away at her drugged palm. You grasp her wrist, trying to hold her steady, but this seems to irk her. Before you can finish, she pulls free and shoves you over, leaving a smear of your precum on your");
		if (pc.isTaur()) output(" flank");
		else if (pc.isNude()) output(" collar");
		else output("outermost upper body garment.");
		
		output("\n\n<i>“I like the sight of you on the ground,”</i> the woman gibes. Your [pc.cock] sticks up straight, and she curls her tail to caress it with her fluffy, aphrodisiac brush. <i>“It suits you.”</i>");
		
		output("\n\nThe extra-large dose hardens your [pc.cockNounSimple] to the point of pain, and you can only whine and pump the air as it tickles and torments without presenting anything to thrust against. She meets your eyes, and you try to communicate your need for release. A perverted distortion of your wish gets through; she places her foot on your shaft, bending it against your [pc.belly].");
		
		output("\n\n<i>“You’re a weak boy,”</i> she mocks, stroking the underside with her arch. <i>“Be careful, or the world will grind you underfoot.”</i> She slides your tool between her two large toes, resuming the masturbation with the bare minimum of effort. You can still feel orgasm coming, but with a humiliated whimper instead of a roar.");
		
		output("\n\n");
		if (pc.isBimbo() || pc.isBro()) output("<i>“C’mon,”</i> you wheedle, <i>“I want to shoot my cum in your pussy.”</i>");
		else if (!pc.isAss()) output("<i>“Aren’t you going to put it in?”</i> you ask, straining to control.");
		else output("<i>“Fuck,”</i> you groan. <i>“Hurry and get on my cock.”</i>");
		
		output("\n\n<i>“Why, you silly...”</i> the woman laughs. She leans down. <i>“I don’t let weaklings come inside me.”</i> Grinding her heel into your [pc.cockHead], she sets off your climax. Your [pc.cockNounSimple]");
		if (pc.cumQ() <= 150) output(" drools pathetically onto your stomach.");
		else if (pc.cumQ() <= 1500) output(" shoots several strokes of [pc.cum] onto your chest and stomach.");
		else output(" explodes onto your stomach, [pc.chest], and face, covering you in [pc.cum].");
		if (pc.cocks.length > 1 && !pc.isCrotchExposed())
		{
			output(" Your other");
			if (pc.cocks.length == 2) output(" penis squirts");
			else output(" penises squirt");
			output(" impotently under your [pc.lowerGarment], filling your clothing with spunk.");
		}
		output(" The cruel sydian laughs as your tool twitches and throbs beneath her heel and pins you there until your unsatisfying orgasm ends. While you stare into the sky");
		if (!(pc.shield is EmptySlot)) output(", half-remembering a need to fix your shield");
		output(", you lose consciousness and she escapes.");

		processTime(30+rand(15));
		pc.orgasm();
		enemy.orgasm();
	}
	else
	{
		output("\n\nThe sydian lowers herself onto you, running her hands");
		if (pc.skinType == GLOBAL.SKIN_TYPE_FUR) output(" through your [pc.skinFurScales]");
		else output(" over your [pc.belly]");
		output(".");
		if (pc.isPregnant() && pc.bellyRating() >= 15) output(" The enzyme on her hands relaxes and heats your pregnancy-stretched abdomen, and you sigh.");
		else output(" The aphrodisiac enzyme bleeds through to your nerves, and you sigh as your skin heats up.");
		
		output("\n\n<i>“Normally I wouldn’t let a weakling come inside me,”</i> she says, breathing heavily. It sounds like an excuse... and when she exposes her glittering vagina and begins to rub against [pc.oneCock], you know. <i>“But... one little exception can’t hurt.”</i>");
		
		output("\n\n");
		if (pc.isBimbo() || pc.isBro())
		{
			output("The reasoning is lost on you - all that matters is getting inside the slut’s");
			if (pc.isBimbo()) output(" yummy");
			output(" cunt and shooting lots of");
			if (pc.isBimbo()) output(" little spermies");
			else output(" jizz");
			output(".");
		}
		else if (pc.isAss()) output("You grind back, hoping to <i>make</i> it hurt.");
		else output("You don’t argue, focused on the dangerous heat at the tip of your cock.");
		output(" The woman parts her labia with two big fingers, beckoning you in. With a sloppy thrust, you spear her on your [pc.cockNounComplex "+c+"].");
		
		pc.cockChange();
		
		output("\n\n<i>“Ahhh,”</i> she moans, delighted. <i>“So good!”</i> Her hands push against the base of your dick, smearing enzyme into your [pc.legFurScales]; the lust-fuel ignites your engine, and you begin to pump your partner. Abruptly,");
		if (pc.isTaur()) output(" she throws her leg over your ass, squeezing your crotch between armored thighs.");
		else output(" she leans forward like a toppling stack of magazines, shoving her palms into your shoulders and slamming you to the ground.");
		
		output("\n\n<i>“What do you think you’re doing, weakling?”</i> she spits, eyes glinting like");
		if (enemy.eyeColor == "black") output(" black pearls");
		else output(" emeralds");
		output(". <i>“Don’t presume to fuck me like a proper male would!”</i> Her cunt constricts like a vise until the pressure on your dick aches.");
		
		output("\n\n");
		if (pc.isAss()) output("You glare back, but stop moving");
		else output("You apologize,");
		output(" and she sits up again. The sydian resumes swiveling her hips, stirring her pussy in pursuit of her own pleasure. Her fingertips scratch at");
		if (pc.isNude()) output(" your [pc.skinFurScales], leaving angry scores that throb with pain and pleasure,");
		else if (pc.hasUpperGarment()) output(" your [pc.upperUndergarment], leaving angry scores that throb with pain and pleasure,");
		else if (pc.hasArmor()) output(" your [pc.armor], producing a faint hiss,");
		output(" and she thrusts her chest out, enjoying your utter abjection. Her cunt is once again relaxed and swallows your dick right down to the [pc.knot "+c+"], slick with lubrication. It gets hotter and hotter as her gyrations become less elegant, until she’s hammering your pelvis and you’re both riding the edge of climax.");
		
		output("\n\n<i>“Come!”</i> the woman demands, slapping your ass with her tail. Fuddled with sex and chemistry, your [pc.cockNounSimple "+c+"] unloads,");
		if (pc.cumQ() <= 150) output(" producing a few embarrassing squirts that represent all you’re capable of.");
		else if (pc.cumQ() <= 1500) output(" firing five strokes of [pc.cum] that coat her walls and ride gravity back down to touch your [pc.cockHead "+c+"].");
		else
		{
			output(" unleashing a wave of [pc.cum] that lifts her several centimeters. The woman is gobsmacked at the monstrous load");
			if (pc.hasKnot()) output(", and your [pc.knot "+c+"] swells to plug the hole, causing the unforgiving pressure to split her body armor with a hideous noise. Fragments of dust shower down from the fissure");
			output(".");
		} 
		output(" Her cunt suctions sperm up in an orgasm of its own, clenching and milking your prick as she moans in sweet release.");
		
		output("\n\nSpent, the sydian climbs off of you");
		if (pc.cumQ() > 1500) output(", ignoring the cataract of semen that falls from her");
		output(". <i>“Not a bad dick,”</i> she muses. <i>“If you were stronger, I might take you as a mate.”</i> The woman leans in for a final whisper. <i>“So... get stronger.”</i>");
		
		output("\n\nAs you slip into a doze, you think that");
		if (!(pc.shield is EmptySlot)) output(" fixing your gear at Novahome, training,");
		else output(" training");
		output(" and coming back could be a very good idea.");

		processTime(30+rand(15));
		enemy.loadInCunt(pc, 0);
		pc.orgasm();
		enemy.orgasm();
	}
	output("\n\n");
	
	if (!(pc.shield is EmptySlot) && !pc.hasStatusEffect("Rusted Emitters"))
	{
		applyRustBroStatus();
	}
	CombatManager.genericLoss();
}

public function sydianFemalePCVictory():void
{
	clearOutput();
	showSydianFemale();

	//shared intro
	if (enemy.HP() <= 0)
	{
		if (!enemy.hasStatusEffect("Unarmored")) output("The sydian coughs and collapses, unable to fight further and unable to flee.");
		else output("Despite the beating, the sydian still tries to cover her exposed skin with her arms and legs from her new position on the ground.");
	}
	else
	{
		if (!enemy.hasStatusEffect("Unarmored")) output("Falling to her knees, the sydian frigs her cunt and thrusts her chest toward you brazenly. The flash in her eyes almost dares you to take advantage.");
		else output("The sydian eyes you from her new position on the ground, half-covering and half-caressing her skin through the ruins of her covering. Intense lust and fear are evident in her face.");
	}
	
	clearMenu();

	if (pc.lust() < 33)
	{
		output("\n\nYou’re not aroused enough to take advantage of her, though.");

		addDisabledButton(0, "Fuck Her");
		addDisabledButton(1, "Get Licked");
		addDisabledButton(2, "Give Throbb");
		addDisabledButton(3, "Call Others");
		addDisabledButton(4, "Gentle Fuck");
	}
	else
	{
		output(" You could use her to get off");
		if (enemy.hasStatusEffect("Unarmored"))
		{
			output(", though it might be fun to surprise her by being gentle, or to turn her over to her people in her humiliated state.");
		}
		else
		{
			output(" or just leave her here.");
			if (pc.hasItemByClass(Throbb)) output(" There’s an item you’re carrying that might adjust her bad attitude, too.");
		}

		if (!pc.hasCock() && !pc.hasTailCock()) addDisabledButton(0, "Fuck Her", "Fuck Her", "You don’t have a wiener!");
		else
		{
			var bTailcock:Boolean = (pc.hasTailCock() && pc.tailCockVolume() <= enemy.vaginalCapacity());
			if (pc.cockThatFits(enemy.vaginalCapacity()) < 0 && !bTailcock) addDisabledButton(0, "Fuck Her", "Fuck Her", "Your wiener is too big! It’s a jumbo wiener!");
			else if (pc.thinnestCockThickness() > 4 && !enemy.hasStatusEffect("Unarmored") && !bTailcock) addDisabledButton(0, "Fuck Her", "Fuck Her", "You could fit your wiener inside if her body armor weren’t in the way...");
			else addButton(0, "Fuck Her", femSydianFuck, undefined, "Fuck Her", "Stick your wiener in it.");
		}

		addButton(1, "Get Licked", femSydianEatsButtholes, undefined, "Get Licked", "Make her service your " + (pc.hasVagina() ? "vagina" : "asshole"));

		if (!pc.hasItemByClass(Throbb)) addDisabledButton(2, "Give Throbb", "Give Throbb", "You’re not carrying any Throbb.");
		else if (enemy.hasStatusEffect("Unarmored")) addDisabledButton(2, "Give Throbb", "Give Throbb", "The broken-armored sydian’s too nervous for you to get a clean stick with the needle.");
		else addButton(2, "Give Throbb", femSydianGiveThrob, undefined, "Give Throbb", "Jab the cocky bitch with a dose of Throbb and watch her break down and beg.");

		if (!enemy.hasStatusEffect("Unarmored")) addDisabledButton(3, "CallOthers", "Call Others", "She’s too emotionally and physically intact for other sydians to consider her an easy target.");
		else addButton(3, "CallOthers", femSydianCallOthers, undefined, "Call Others", "Get some help to humiliate the girl. Depending on who shows up, you might land a three-way or have to hide from a brutal male.");

		if (!enemy.hasStatusEffect("Unarmored")) addDisabledButton(4, "Gentle Fuck", "Gentle Fuck", "She’s not vulnerable enough to regard kindness as anything but a weakness.");
		else if (enemy.lust() < 33) addDisabledButton(4, "Gentle Fuck", "Gentle Fuck", "She’s not turned on enough to play along with you.");
		else if (pc.hasVagina() || (pc.hasCock() && pc.cockThatFits(enemy.vaginalCapacity()) != -1)) addButton(4, "Gentle Fuck", femSydianGentleFuck, undefined, "Gentle Fuck", "Show the sydian that sex can be more than a power play.");
		else addDisabledButton(4, "Gentle Fuck", "Gentle Fuck", "Your genitals are incompatible with the poor girl!");
	}
	addButton(14, "Leave", leaveHerAfterWin);
}

public function leaveHerAfterWin():void
{
	clearOutput();
	CombatManager.genericVictory();
}

public function femSydianGentleFuck():void
{
	clearOutput();
	showSydianFemale();

	if (pc.isBimbo())
	{
		output("Watching this cutie rub her orange pussy and perky tits would be soo hot if she were moaning like a slut instead of cowering. ”</i>Ooh, how come you’re so nervous?”</i> you ask, frustrated. <i>“You should just stick it all out there, like me.”</i> You display your body with a twirl.");
		
		output("\n\n<i>“No,”</i> the sydian says, flatly.");
		
		output("\n\n<i>“But why-y-y?”</i> you whine. <i>“The more you show off your bod, the more attention you can get... and the more sexy times, too.”</i>");
		
		output("\n\nThe bug-girl huffs. <i>“I don’t want attention... I like being covered up.”</i>");
		
		output("\n\n<i>“But you like sex?”</i> you challenge. She looks embarrassed and doesn’t answer.");
	}
	else if (pc.isBro())
	{
		output("(bro)Your blood hammers imagining the girl’s arousal, but the way she’s covering her breasts and rubbing her pussy in secret is no good. <i>“Hey,”</i> you call out, <i>“show me your tits!”</i>");
		
		output("\n\nThe sydian balls up even more. <i>“No!”</i>");
		
		output("\n\nYou groan. <i>“Come on, why not? You’re really cute!”</i> Thinking a moment, you hit her with your best flirt. <i>“I’d love to get with you... know what I mean?”</i>");
		
		output("\n\nThe bug-girl glares at you. <i>“You broke my covering! I hate being without it!”</i>");
	}
	else if (!pc.isAss())
	{
		output("You’d be the");
		if (pc.isMischievous() || pc.exhibitionism() >= 66) output(" first");
		else output(" last");
		output(" person to encourage public masturbation,");
		if (pc.isMischievous() || pc.exhibitionism() >= 66) output(" but");
		else output(" and");
		output(" the cute bug-girl’s sex show is ruined by her skittish manner. It’s not like there’s a public around anyway. <i>“Hey,”</i> you call, <i>“why are you frightened? I’m not going to do anything.”</i>");
		
		output("\n\nHer glare is sullen. <i>“So?”</i>");
		
		output("\n\nYou shrug and gesticulate, not sure how to proceed. <i>“‘So?’ You were pretty confident when we met! What’s wrong now?”</i>");
		
		output("\n\nThe bug-girl looks at her dusty breasts, squished under a forearm. <i>“You... you broke it. It’s your fault.”</i>");
		
		output("\n\nYou stare for a moment before you realize she means her body paint.");
		if (pc.isNice()) output(" <i>“Well, ah. Sorry. But you did attack me.”</i>");
		else output(" <i>“You should thank me - your insides are much sexier.”</i>");
		output(" You pause. <i>“You have a good body. Is showing off so bad?”</i>");
		
		output("\n\n<i>“I don’t </i>like it<i>!”</i> she snaps.");
	}
	else
	{
		output("The sydian’s masturbation would almost be worth");
		if (pc.hasCock()) output(" jerking");
		else output(" schlicking");
		output(" to if she would stop covering her cute tits and wet slit. <i>“Come on!”</i> you bark. <i>“You can do it! Rub rub rub-a-dub!”</i>");
		
		output("\n\n<i>“W-what?”</i>");
		
		output("\n\n<i>“Your pussy’s not going to run away because you work it too hard... what’s wrong with you?”</i> you ask, trying to keep her off-balance.");
		
		output("\n\n<i>“I, uh... I’m not... really comfortable.”</i> She stops, and you glare until she squirms. <i>“I don’t like being uncovered.”</i>");
		
		output("\n\n<i>“Why the fuck not? You have a pretty hot body.”</i>");
		
		output("\n\nThe sydian’s eyes plead with you to stop talking. <i>“I haven’t...”</i>");
		
		output("\n\n<i>“Had sex?”</i> you prompt. She blushes.");
		
		output("\n\n<i>“No! I mean... I haven’t had good experiences.”</i>");
	}

	output("\n\nThat says it all. Blessed with insight, you slip your hand over hers and help caress her breast. She flinches, but doesn’t resist. <i>“I see,”</i> you whisper, directing the air at her neck. The bug-girl shivers, and her nipple pokes into your fingers.");
	
	output("\n\n<i>“Wh-at are you doing?”</i> she asks, breath hitching.");
	
	output("\n\n<i>“Just having some fun,”</i> you answer, clearing debris from her soft skin. <i>“Should I continue?”</i>");
	
	output("\n\nShe seems to short-circuit. Probably she’s never been <i>invited</i> to have sex before. You pause, holding her hand and rubbing the palm with your thumb, waiting for her to reboot. She stares at the ground, considering rejecting you but unsure if she wants you to go.");

	if (rand(10 * MathUtil.LinearInterpolate(1, 2, enemy.lustMax() / enemy.lust())) == 0)
	{
		//lady says no - small chance
		//def. count this as a nice action
		output("\n\n<i>“No,”</i> she says, setting her jaw.");

		output("\n\nYou sigh.");
		if (pc.isBimbo()) output(" <i>“I was gonna make you feel so gooood, though,”</i> you pout.");
		else if (pc.isNice()) output(" <i>“Then I’ll respect your wishes,”</i> you declare.");
		else output(" <i>“Pah. You’re making a mistake, but whatever.”</i>");
		output(" You release her hand and she blinks stupidly when you bid her goodbye. <i>“We probably won’t meet again.”</i>");

		output("\n\nShe watches you agree not to have sex with unabashed wonder, right up until you’re too far to make out her face anymore.\n\n");
		//end, raise lust some, pass small time

		processTime(7+rand(3));
		pc.lust(10);
		pc.addNice(2);

		clearMenu();
		addButton(0, "Next", CombatManager.genericVictory);
		
		return;
	}
	else
	{
		//lady says yes - large chance
		output("\n\n<i>“Um... okay,”</i> she says, raising her "+enemy.eyeColor+" eyes to yours. Grinning, you stop to set aside your [pc.gear] and resume by kissing her. She seems to like it. <i>“Do that again.”</i>");
		
		output("\n\nYou kiss again, using your [pc.tongue].");
		if (pc.hasLongTongue()) output(" She laughs into your mouth as you tickle her with your abnormal oral muscle.");
		output(" Your hand slips from hers to brush away what’s left of her pulverized body paint. <i>“Hey...”</i> she protests.");
		
		output("\n\n<i>“You have");
		if (pc.isBimbo() || pc.isBro()) output(" pretty");
		else output(" beautiful");
		output(" skin,”</i> you interrupt, sliding your lips to her collarbone. The sydian relaxes, allowing you to uncover more; she even helps when you look away, dusting her breasts and throat. You catch her in the act and she pauses, then brazenly thrusts out her chest, which you grope.");
		
		output("\n\n<i>“Touch me like that... down here,”</i> murmurs the girl, sliding your hand between her thighs. She holds it there for a moment, then caresses your face. The twin heats of aphrodisiac and her sex linger on your [pc.skin], spurring you to slip the first of several fingers into her. Watching her shift and squirm,");
		if (pc.hasCock())
		{
			output(" your [pc.cocks] protest");
			if (pc.cocks.length == 1) output("s");
			output(" the neglect, throbbing and twitching. She notices, and wraps her hand around");
			if (pc.cocks.length == 1) output(" it");
			else output(" one");
			output(", filling it with chemical arousal.");
		}
		else
		{
			output(" your own [pc.vaginas] clamor");
			if (pc.vaginas.length == 1) output("s");
			output(" for affection, drooling [pc.girlCumFlavor] juices. She notices, and slides a thick finger into [pc.oneVagina], spreading chemical lust.");
		}
		
		output("\n\n<i>“That’s good,”</i> the girl sighs. You shiver as her enzymes work, forcing the same feeling in you.");
		if (pc.hasCock()) output(" Her hand sits on your cock, waiting for a signal that her pussy-focused brain never sends until you thrust gently; the woman bites her lip, chagrined, and begins to masturbate you.");
		else output(" Her fingers are adroit despite being in an alien - judging by her skill at tickling nerves and finding your clit, she plays with herself often.");
		output(" Your climax runs at you with long strides, pursued by sydian enzymes and closing fast; you mention it to your eager lover.");

		//male ending - favored if available
		if (pc.hasCock())
		{
			output("\n\nHer eyes twinkle, then become sad as she realizes that your time will come to an end. <i>“Finish inside,”</i> she whispers, leaning forward to show you the breasts you like. <i>“Be my male... at least for a little while longer.”</i>");
			
			output("\n\n");
			if (!pc.isTaur()) output("She climbs into your lap and spreads her pussy. It");
			else output("She spreads her pussy and it");
			output(" quivers visibly, puddling on your [pc.leg]. Your [pc.cockNounSimple] aches and drools, ready to burst; the urgency in her eyes tells you that she feels it, too. You line up and slide into her - as soon as you penetrate, she cums.");
			
			pc.cockChange();
			
			output("\n\n<i>“Yes! Yess!”</i> she moans, wrapping her arms and legs around you. Her cunt hugs you like a rubber tuxedo, wringing with a desperate hope for virile sperm. You climax,");
			if (pc.cumQ() <= 150) output(" leaving behind a tiny memento of your oddly-romantic wasteland encounter.");
			else if (pc.cumQ() <= 1500) output(" basting her pussy with sheets of [pc.cum] to cement your unusual union.");
			else output(" exploding with fireworks of jizz to celebrate her conversion to your way of love. So much [pc.cum] bubbles from your slit that her eyes well up.");
			output(" You");
			if (pc.cumQ() <= 1500) output(" quickly");
			else output(" slowly");
			output(" expend yourself and fall onto her.");
			
			output("\n\nShe lets you play with her sated body for a while before pushing you off. <i>“I wonder if our species can have children together,”</i> the sydian muses. You look at her and she blinks innocently, then kisses you with inexpert lips. The woman extricates herself and leaves, seeming wistful.");
			
			output("\n\nYou think it might be a good idea to visit here again, once in a while.");

			processTime(30+rand(15));
			enemy.loadInCunt(pc, 0);
			pc.orgasm();
			enemy.orgasm();
		}
		else
		{
			output("\n\n<i>“Come with me,”</i> she breathes, helping you frig her sopping hole faster. Her other hand plunges into you, tickling your [pc.vaginaNoun] with both thick fingers and spreading pleasure that shifts like a sand dune as your lubrication carries the enzyme along. You may have underestimated just how into you the sydian is - she shrieks and her cunt clamps down, sucking and squeezing your fingers. <i>“Cuh-cumming!”</i> the girl moans.");
			
			output("\n\nYour own orgasm arrives with a bang,");
			if (pc.isSquirter()) output(" and your [pc.vagina] gushes such [pc.girlCum] over her hand that she looks down to check if you’re a boy.");
			else output(" and your [pc.vagina] sucks so hard that you could swear it had decided on ferrying her enzymes right to your ovaries and hoping for a miracle.");
			output(" She spasms for a good while longer than you do.");
			
			output("\n\n<i>“That </i>was<i> fun,”</i> she agrees, after her body relaxes. <i>“Are there... more friendly women like you out there?”</i>");
			
			output("\n\nYou kiss her.");
			if (pc.isBimbo() || pc.isBro() || pc.isMischievous())
			{
				output(" <i>“Totally");
				if (!pc.isBro()) output(", honey");
				output(".”</i>");
			}
			else output(" <i>“Sure. Think about a journey sometime.”</i>");
			output(" She looks pleased, watching and considering as you collect your things and leave.");

			processTime(30+rand(15));
			enemy.orgasm();
			pc.orgasm();
		}
	}
	
	output("\n\n");
	CombatManager.genericVictory();
}

// 9999 This will probably need a lot of tweaking to ensure things remain consistent between all of the supported genital configurations.
public function femSydianCallOthers():void
{
	clearOutput();
	showSydianFemale();

	if (pc.isBimbo() || pc.isBro())
	{
		if (pc.isBimbo()) output("<i>“Ooh, nice tits, honey,”</i>");
		else output("<i>“Killer tits,”</i>");
		output(" you flirt, raising your outstretched fingers to your chest in a crude imitation. The woman covers her chest, revealing the tip of her orange pussy. You");
		if (pc.isAss()) output(" point and laugh");
		else output(" stare");
		output(" at her crotch, and she stuffs her hand between her thighs, trying to conceal every bit of flesh you’ve exposed.");
	}
	else if (pc.isNice())
	{
		output("<i>“Sorry about that,”</i> you apologize. The bug-girl only covers herself, hiding her tantalizing, cream-colored breasts and sultry orange sex under her dingy arms. <i>“You know,”</i> you offer, <i>“you don’t need to be so ashamed of your body. You could maybe... show it off a little....”</i> Your request falls flat - she only bunches up tighter.");
	}
	else
	{
		output("<i>“Hello,”</i> you leer, watching the alien’s liberated breasts rise and fall. <i>“Look what you’ve been hiding.”</i> Flakes of pulverized armor fall away as she covers herself with an arm. When you glance lower, at the thin orange line between her legs, she shifts to cover the gap in her thighs, dislodging more dust. You amuse yourself, making her brush away the crumbling remnants just by eye-fucking her.");
	}

	output("\n\n<i>“Stop staring,”</i> she snaps. The sydian won’t give you a decent eyeful of her good bits, and you’re daydreaming of someone else to keep her hands busy when you realize - that’s a real possibility. The girl eyes your distant, thoughtful expression.");

	output("\n\n");
	if (pc.isNice()) output("You sigh at what you’re about to do. ");
	output("<i>“Sure. Wait just a moment,”</i> you say.");
	if (pc.hasRangedWeapon() && !pc.hasBowWeaponEquipped()) output(" You pull your [pc.rangedWeapon] and fire a few shots into the air.");
	else output(" You slip your fingers into your mouth and whistle as loudly as you can, several times.");
	output(" <i>“That should get us some company.”</i>");

	var isFemale:Boolean = (pc.hasCock() || pc.hasTailCock() || pc.hasNippleCocks) && rand(2) == 0;

	var emf:Function = function(m:String, f:String):String { return (isFemale ? f : m); }

	output("\n\nThe woman looks mortified. After a minute, a clatter of quick-rusting metal junk fanfares another sydian:");
	if (isFemale) output(" a smug, shapely female.");
	else output(" a huge, rapacious-looking male.");
	output(" You conceal yourself while the newcomer takes in the situation; as " + emf("he", "she") +" draws closer, horror breaks over the defeated girl.");

	//female sydian branch opening - req. PC has cock/tailcock/nipcock
	if (isFemale)
	{
		showBust(enemy.bustDisplay, enemy.bustDisplay);
		output("\n\n<i>“Poor thing,”</i> the newcomer coos in mock sympathy. <i>“Did a powerful male do this to you?”</i> She places her foot on the defeated woman’s crotch, grinding her heel into the vagina.");
		if (enemy.hairColor == "orange") output(" The girl underfoot squeals as enzymes infiltrate her sex.");
		else output(" The girl underfoot tries to back away, but the new arrival grabs her hair.");

		if (pc.isBimbo() || pc.isBro())
		{
			output("\n\n<i>“With a big, juicy cock,”</i> you announce, revealing yourself");
			if (pc.hasTailCock()) output(" and poking your tail through your hand just as its alien phallus slides free");
			else if (pc.hasNippleCocks())
			{
				output(" and teasing your areolae to stimulate your [pc.nippleCocks] to");
				if (!pc.isChestExposed()) output(" form tell-tale bulges in your [pc.upperGarment]");
				else output(" emerge, drooling");
			}
			output(". The two women look at you, one with surprise and the other with fear.");
		}
		else if (pc.isNice())
		{
			output("\n\n<i>“It was me, actually,”</i> you announce, stepping out of cover. Both women look at you; the newcomer’s eyes drift down to your");
			if (pc.isCrotchExposed()) output(" [pc.crotch]");
			else output(" groin");
			output(", and she");
			if (pc.hasTailCock() || pc.hasNippleCocks()) output(" frowns");
			else output(" smiles");
			output(".");
			if (pc.hasTailCock()) output(" Her frown changes to a smile as your [pc.tailCock] slithers free.");
			else if (pc.hasNippleCocks())
			{
				output(" Her frown changes to");
				if (pc.isChestExposed()) output(" a smile as your [pc.nippleCocks] escape their fleshy sheathes");
				else output(" a quizzical expression as your [pc.upperGarment] bulges with [pc.nippleCocks]");
			}
			output(".");
		}
		else
		{
			output("\n\n<i>“You could say that,”</i> you assert. All eyes dart to you as you step out of cover");
			if (pc.hasCock()) output(", flaunting your crotch bulge");
			else if (pc.hasTailCock()) output(" sliding your [pc.tailCock] from its sheath");
			else if (pc.hasNippleCocks())
			{
				output(" extruding your [pc.nippleCocks]");
				if (!pc.isChestExposed()) output(" and making "+num2Text(pc.totalNipples())+" bulges in your [pc.upperGarment]");
			}
			output(".");
		}

		output("\n\n<i>“Oh, very good,”</i> the new woman says, clasping her hands together. <i>“You’re still here.”</i>");
		
		output("\n\nDespite her tone, you keep your [pc.weapon] ready.");
		if (pc.hasArmor()) output(" It’s difficult to remove your [pc.armor] one-handed, and the");
		else output(" The");
		output(" new arrival wastes no time plying you with flattery.");
		
		output("\n\n<i>“I do so love a strong male...”</i> she coos.");

		var multicock:Boolean = pc.hasNippleCocks() || pc.cocks.length > 1 || (pc.hasCock() && pc.hasTailCock());

		output("\n\n");
		if (pc.isBimbo() || pc.isBro() || pc.isNice())
		{
			if (pc.isBimbo() || pc.isNice()) output("<i>“Thanks... I guess,”</i>");
			else output("<i>“You’re in luck then,”</i>");
			output(" you reply. The newcomer pulls the other girl by the wrist, taking up a worshipful position");
			if (pc.tallness <= 55) output(" beside");
			else output(" beneath");
			output(" your cock");
			if (multicock) output("s");
			output(".");
		}
		else
		{
			output("You");
			if (pc.isAss() && pc.hasWeapon()) output(" wave your weapon, then");
			output(" gesture at the two women and at your phallus");
			if (multicock) output("es");
			output(", communicating all you need to. The newcomer seems to be aroused by your lack of tact; she grabs the damaged girl by her hand and drags her to you.");
		}
		output(" Reverently, she caressess");
		if (pc.hasCock()) output(" [pc.oneCock]");
		else if (pc.hasTailCock()) output(" [pc.oneTailCock]");
		else
		{
			if (pc.totalNipples() > 1) output(" one");
			output(" [pc.nippleCock]");
		}
		output("; the heat of her enzyme works in, bringing you to throbbing, ready stiffness.");

		output("\n\nUp to now the defeated girl has been an unwilling attendee-cum-hostage, but after your eyes dart to her a few times, the intact sydian takes notice.");

		output("\n\n<i>“Come on and play,”</i> she cajoles. Her hand,");
		if (pc.hasCock() || pc.hasTailCock()) output(" [pc.cumVisc]");
		else output(" [pc.milkVisc]");
		output(" with your precum, slides from your crown to the shy girl’s stomach, brushing away dust and smearing the pale flesh with a mixture of male lubrication and enzyme that");
		if (enemy.hairColor == "orange") output(" sends the fire-haired girl into a fuck frenzy");
		else output(" makes her sigh with arousal");
		output(".");
		if (((pc.hasCock() || pc.hasTailCock()) && pc.cumType != GLOBAL.FLUID_TYPE_CUM) || (pc.hasNippleCocks() && pc.milkType != GLOBAL.FLUID_TYPE_MILK))
		{
			output(" The cock-loving bitch in charge amuses herself by using your");
			if (pc.hasCock() || pc.hasTailCock()) output(" [pc.cumColor]");
			else output(" [pc.milkColor]");
			output(" pre to re-paint the traditional lines of sydian body art, stroking your dribbling dick whenever her ‘brush’ runs dry, until her poor plaything is re-attired in a lewd suit of jizz armor.");
		}
		output(" The exposed woman’s alabaster breasts and silky, trembling stomach rise and fall to the touch of perverse, enzyme-laden deposits.");

		if (pc.isBimbo()) output("\n\n<i>“Oooh, gonna shoot my yummy cum,”</i> you cry,");
		else output("\n\n<i>“I’m... gonna come,”</i> you admit,");
		output(" taken with the spectacle. Eager to finish, you thrust through the armored sydian’s hand.");

		if (!multicock)
		{
			//female sydian branch ending 1 - solo cocks/tailcocks come inside one
			output("\n\n<i>“Ohh, don’t waste it,”</i> says the late arrival. <i>“Wouldn’t you like to seed one of us?”</i> She spreads her labia and the broken girl, drugged out of her mind with enzyme and the stink of cum, copies her pose. Seconds from blowing, you make a quick decision and push the latter onto her back.");
			
			output("\n\n<i>“Lucky girl,”</i> muses her co-captor. The damaged sydian’s mouth opens and her tongue half-spills out when you shove your");
			if (pc.hasCock()) output(" [pc.cockNounComplex]");
			else output(" [pc.tailCock]");
			output(" into her slippery orange pussy.");
			
			if (pc.hasCock()) pc.cockChange();
			
			output("\n\n<i>“Cum!”</i> she moans, delirious. Your ejaculation");
			if (pc.cumQ() <= 150) output(" flicks a few meagre squirts of [pc.cum inside, and for a second you’re grateful the ball-busting bitch nearby can’t see.");
			else if (pc.cumQ() <= 1500) output(" unloads several strokes of [pc.cum] into the bug-girl, and her hands reach for your face as the feeling floods her.");
			else output(" ambushes the poor thing with such a wave of [pc.cum] that she arches her back from the pressure. Without her armor, her stomach swells from the load.");
			output(" When the aftershocks cease, you pop free of her");
			if (pc.cumQ() > 1500) output(" and a gush of [pc.cumColor] follows");
			output(". The armored sydian is the first to speak.");
			
			output("\n\n<i>“I’m envious... I’d love to meet you sometime,”</i> she flirts. She stands, still blooming bright orange, and walks away rubbing her thighs together. The broken girl watches while you collect your gear. Though she says nothing, her dopey grin tells you she feels the same way.");
		}
		else
		{
			//female sydian branch ending 2 - multiple nipple/tail/cocks or mix’n’match come inside both
			output("\n\n<i>“Wait!”</i> begs the late arrival, pulling her palm away. <i>“I want your strong sperm!”</i> She slides her labia apart in invitation, and the broken girl, mind-fucked by aphrodisiac and the smell of pre-cum, mimics her. You grunt acknowledgement, rolling onto your back and trying to hold it in.");
			
			output("\n\nOne eager and one obedient, the two stand over your");
			if (pc.hasNippleCocks()) output(" [pc.chest]");
			else if (pc.hasCock())
			{
				output(" [pc.crotch]");
				if (pc.hasTailCock()) output(" and [pc.tail]");
			}
			output(". The heat radiating from their cunts makes it hard not to shoot in the air and hope for the best, but you manage to wait while they lower themselves onto your");
			if (pc.hasNippleCocks()) output(" [pc.nippleCocks]");
			else if (pc.cocks.length > 1) output(" [pc.cocksLight]");
			else if (pc.hasTailCock() && pc.tailCount > 1) output(" [pc.tailCocks]");
			else output(" phallic menagerie");
			output(".");
			
			if (!pc.hasNippleCocks() && pc.hasCock()) pc.cockChange();
			
			output("\n\n<i>“Now!”</i> cries the lucid one.");
			
			output("\n\nYou don’t even hear the cue, already lost in the wet haze of pussy. Your");
			if (pc.hasCock() || pc.hasTailCock()) output(" [pc.cum]");
			else output(" [pc.milk]");
			output(" spurts from you,");
			if (((pc.hasCock() || pc.hasTailCock()) && pc.cumQ() <= 150) || (pc.hasNippleCocks() && pc.lactationQ() <= 150)) output(" dotting");
			else output(" splattering");
			output(" their vaginas.");
			if (((pc.hasCock() || pc.hasTailCock()) && pc.cumQ() <= 150) || (pc.hasNippleCocks() && pc.lactationQ() <= 150)) output(" The ejaculation lasts barely a second, leaving mere flecks in the sydians’ thirsty tunnels.");
			else if (((pc.hasCock() || pc.hasTailCock()) && pc.cumQ() <= 1500) || (pc.hasNippleCocks() && pc.lactationQ() <= 1500)) output(" Strokes of jizz climb your cocks like fat earthworms, stimulated ever upward by the enzyme mixed with their pussy juice.");
			else if (((pc.hasCock() || pc.hasTailCock()) && pc.cumQ() > 1500) || (pc.hasNippleCocks() && pc.lactationQ() > 1500)) output(" So productive are you that the broken one’s stomach expands, distending while she grins stupidly and holds it. The other looks uncomfortable as her intact armor resists, pushing the flood back out.");
			
			output("\n\nYour lovers sit atop you while you cool down. The armored woman kisses you on the cheek, gets up, and leads her dopey-looking counterpart away, both rubbing their bellies in satisfaction.");

			if (pc.hasNippleCocks()) pc.milked();
		}

		processTime(30+rand(15));
		enemy.loadInCunt(pc, 0);
		pc.orgasm();
	}
	else
	{
		showBust(enemy.bustDisplay, "SYDIAN_MALE");

		//male sydian branch opening - randomly assigned to any sex
		output("\n\nYou decide not to pop out when you perceive the size of the male; he’s at least seven feet tall and");
		if (flags["MET_FLAHNE"] != undefined) output(" broader than Flahne’s definition of ‘work ethic’.");
		else output(" stouter than a radioactive beer.");
		output(" He");
		if (enemy.hairColor == "orange") output(" bounds up, energized by the girl’s brilliant orange hair.");
		else output(" saunters over, gaining energy as it drains from the girl.");
		
		output("\n\n<i>“Hello, little thing,”</i> he booms. The broken sydian on the ground curls into a ball, trying to cover her stomach. The male picks her up by the wrists, paying not the least attention to her resistance. His hand is almost the size of her thigh, and when her ruined bodywork is exposed, his smile broadens.");
		
		output("\n\n<i>“You’re in a very vulnerable position,”</i> the male rumbles.");
		if (!pc.isAss()) output(" The cruelty in his tone sends cold shivers though you,");
		else output(" You tremble with anticipation at the gigantic newcomer’s tone,");
		output(" and the woman’s "+enemy.eyeColor+" eyes widen as his big mitt swipes the cracked veneer from her breasts.");
		
		output("\n\n");
		if (enemy.hairColor == "orange") output("The fire-headed girl shudders and whines as her destroyed covering is replaced with a bloom of enzyme; her knees clap together and she thrusts her chest forward, betrayed by her body’s lust for a sydian’s touch.");
		else output("The girl’s pale skin quivers under his touch, and she sighs when her struggles fail to free her from the huge hand.");
		output(" The display brings great satisfaction to the male, and his orange, fluffy prick emerges from his crotch.");
		if (pc.hasCock()) output(" Your own [pc.cocksLight] clamor" + (pc.cocks.length == 1 ? "s" : "") + " as well, swelling with blood while you watch the bug-girl get manhandled.");
		else if (pc.hasVagina()) output(" Your [pc.vagina] demands attention as you watch his bushy cock rub against the bug-girl’s labia, and you wish you were receiving the same treatment.");
		if (!pc.isNice() && !pc.isTaur() && (pc.hasCock() || pc.hasVagina()))
		{
			output(" You");
			if (!pc.isCrotchExposed()) output(" lower your [pc.lowerGarments] and");
			output(" slide your hand into your crotch.");
		}
		
		output("\n\nThe big male pushes her leg to the side, revealing her fully-bloomed pussy. Grunting, he practically drops her onto his dick. The girl arches her back in panic as gravity forces him in with more speed than she was ready for. She wraps her arms around him and tries to climb up, to take his tool more slowly, but his meaty hands are already at her hips, giving her no choice but to accommodate the entire length.");
		
		output("\n\n<i>“Good dick, isn’t it?”</i> he needles, thrusting just a little to make her shiver and sweat. She switches to pushing away from his chest, attempting to lessen the impact when he slams in with full force. Encouraged by her readiness or simply not caring, he shifts his grip to her waist and begins to fuck.");
		
		output("\n\n<i>“Ahhh!”</i> cries the girl, scratching at her partner’s armored chest. His strokes are already so intense that her petite breasts bounce wildly. Pitters and patters of lubrication drop from the woman’s crotch, pulled out by the brush-like covering of the brute’s titan tool.");
		if (!pc.isNice() && !pc.isTaur())
		{
			if (pc.hasCock()) output(" The soft sounds of your own dripping precum accompany them.");
			else if (pc.hasVagina()) output(" Your [pc.vaginas] do their best imitation, producing lube for an imaginary cock and drooling on your fingers.");
		}
		
		output("\n\n<i>“You’re so tight,”</i> the male growls. <i>“I’m going to cum soon.”</i> The girl’s head slumps, enervated, and her");
		if (enemy.hairColor == "orange") output(" flame-colored");
		output(" hair waves in the air from the force of his lovemaking. He gropes her with one hand, squeezing a yielding breast, and his thrusts are so vigorous that you can hear the ‘schlick’ sounds of wet sex from feet away.");

		output("\n\n<i>“No...”</i> she grunts, covering his big paw, <i>“...don’t.”</i> She tries to pull him from her vulnerable breast, but he only knocks her hand away.");
		
		output("\n\n<i>“Don’t you want the seed of a powerful male?”</i> he teases, passing an antenna through his fist. Coated with a thick sheen of enzyme, he caresses her stomach almost lovingly.");
		if (enemy.hairColor == "orange") output(" The girl’s skin flushes when the new dose hits; her cunt must have tightened up, because her lover clenches his teeth and pushes as deeply into her as he can.");
		else output(" Her body relaxes as the aphrodisiac ambushes her, and that’s all the male requires to hilt his cock.");
		output(" Her jaw drops when she realizes what’s about to happen.");
		
		output("\n\nThe male roars as he ejaculates, digging his thumbs into the debased woman’s soft stomach. She screams in pleasure and frustration as his seed pours in, spilling right into her womb.");
		if (!pc.isNice() && !pc.isTaur())
		{
			if (pc.hasCock())
			{
				output(" Your own [pc.cum] spurts free at the sight,");
				if (pc.cumQ() <= 150) output(" climbing from your unproductive [pc.balls] to dribble and drool over your hand.");
				else if (pc.cumQ() <= 1500) output(" splattering the oily ground.");
				else output(" erupting in a worrying wave that you hope attracts no attention.");
			}
			else if (pc.hasVagina())
			{
				output(" Your [pc.vagina] climaxes in sympathy");
				if (pc.isSquirter()) output(", coating your hand and the dry ground with a thick spray of [pc.girlCum].");
				else output(" , milking your hand.");
			}
			
			pc.orgasm();
		}
		
		output("\n\nThe burly sydian’s pumps weaken as his orgasm trails off, and he releases his hold on his partner. She slips off his cock and lands on her ass while his aftershocking tool swings free. He grabs it and works out the last blobs of cum, dropping them on her alabaster stomach. Pleased with his efforts, he turns and strides off, leaving the bug-girl spread eagle with silvery jizz oozing from her savaged hole. Too exhausted to talk, she stares at you, still concealed in your hiding spot, accusing you with her eyes.");
		
		output("\n\n");
		if (pc.isTaur() || (!pc.hasCock() && !pc.hasVagina()) || !pc.isAss()) output("You flush with embarrassment and move away, leaving her to get pregnant in peace.");
		else
		{
			output(" You shiver and move closer, still stroking yourself, until she’s looking straight up at you. With contempt, you flick");
			if (pc.hasCock()) output(" one last [pc.cumVisc] aftershock of your own");
			else output(" a glob of [pc.girlCumColor] froth from your pussy");
			output(" into the woman’s face, then turn and leave.");
		}

		processTime(30+rand(15));
		if (!pc.isAss() || pc.isTaur() || (!pc.hasCock() && !pc.hasVagina()))
		{
			pc.lust(20+rand(5));
		}
		else
		{
			pc.orgasm();
		}
	}
	output("\n\n");
	CombatManager.genericVictory();
}

public function femSydianGiveThrob():void
{
	clearOutput();
	showSydianFemale();

	output("Concealing the drug, you bring yourself to the sydian’s level. She");
	if (enemy.HP() <= 0) output(" smiles at the abjection");
	else output(" withdraws her hand from her glistening quim");
	output(" and motions you even lower. You kneel and place your palms to the ground, humoring and flattering the alien, and she rewards you by reclining on one elbow to display her sleek body. At the same time, she touches your shoulder, beckoning you closer.");
	
	output("\n\n<i>“Do you like this?”</i> she asks. You nod and allow her to pull you close, face-to-breastplate. <i>“Show me how much...”</i>");
	
	output("\n\nTaking the suggestion, you touch one of the breast cups. She rests her hand atop yours and you squeeze the firm plate, feeling the sydian’s real flesh quiver underneath. A faint heartbeat thumps at your palm. She raises your chin to meet her gaze; her pupils glitter with pride and affection.");

	output("\n\n<i>“Your sense of beauty is very fine");
	if (pc.isFeminine()) output(", especially for a female");
	output(",”</i> the sydian sighs. Her neck trembles when you press your lips close; she swallows hard, and closes her fingers over yours.");
	
	output("\n\n<i>“Mmmyess,”</i> you hum, drawing out your sibilants. Unobserved, the syringe moves into position while you nip her skin with your lips and she shivers. <i>“You’re almost perfect.”</i>");
	
	output("\n\nThe sydian’s larynx bobs under your nose. <i>“Almost...? I’m a work of art,”</i> she clucks. She tilts back to thrust her chest into view again and tries to push your head down as punishment - unfortunately for her, just the distraction you needed.");
	
	output("\n\n<i>“");
	if (pc.isBimbo()) output("Totally");
	else output("Indeed");
	output(".”</i> You punctuate by jabbing the needle under her pelvic plate and squeezing the plunger; she sits up in shock, and as the chemicals begin their redecorative rampage, her eyes widen.");

	output("\n\n<i>“Ugh,”</i> she grunts, swatting the syringe away. It shatters into a starburst of glass. <i>“What was that?”</i>");
	
	output("\n\n");
	if (pc.isBimbo() || (pc.isBro() && !pc.hasCock()))
	{
		output("<i>“Just");
		if (pc.isBimbo()) output(", like,");
		output(" adding the best bit,”</i> you");
		if (pc.isBimbo()) output(" giggle");
		else output("laugh");
		output(".");
	}
	else if (pc.isNice()) output("<i>“Completing the picture,”</i> you soothe, kissing her plated collarbone.");
	else output("<i>“Vandalism,”</i> you mumble, biting her playfully.");
	output(" Two fingers in her");
	if (enemy.lust() >= enemy.lustMax()) output(" sopping");
	output(" pussy distract her again - teasing the rim, you feel the surging temperature that heralds sudden growth. She squirms in your hands, unable to recover her composure in your intense stare.");
	
	output("\n\n<i>“Nnnn...”</i> she groans, <i>“...it’s hot!”</i> Even her neck begins to burn with racing blood, pulsing against your lips. You slide your fingers in deeper and kiss the woman’s inflamed skin, watching her measured, dominating persona crumble away.");

	output("\n\nThe sydian’s hips begin to tremble as pressure mounts. <i>“What the fuck did you do?”</i> she shrieks, pulling away from your fingers. Her pelvis pounds the air, hammering and writhing, and tears well up in her eyes. The sydian’s crotch-plate smokes like an unlubricated sex droid as she rakes it with her fingers, producing puffs of dried mud. With huge effort she pries the thin covering up, snapping it in half with a ceramic noise and hurling it away in a fit. With it gone, you can see her true skin.");
	
	output("\n\nThe location of the stick is a throbbing, reddish-orange welt, raised high on a pale delta; her fingers continue to scrape so furiously that you’re obliged to grab her wrists just to stop her drawing blood. Body heat seeps into your palms as she twists and jerks, trying to pull away, and her breaths hitch in short gasps. <i>“Ah... ah... ah... my body....”</i>");
	
	output("\n\nWith her hands restrained, the growth stalls until you touch your own finger to the tip. The teary sydian jerks and two inches of suppressed growth slide free. Inches blossom from the mound, while the alien woman writhes in incomprehensible, foreign pleasure that will become very familiar before you’re finished with her. A slit opens as the orange growth tops half a foot, bubbling with proto-cum. Ministering to the new flesh, you tease her cock out to eight hefty inches, and little nodules with the beginnings of soft bristles develop along the crown. Her male lubrication increases to a rivulet, and streams over your hand.");

	output("\n\n<i>“What’s... happening?”</i> the sydian gasps, drawn so tight that she’s unable to breathe. The base of her new penis is still swollen and hot, promising more change. You release the slimy crown and rub the base - something is shifting under the skin. A weight drops into your palm, then another, descending until your hand is full of two heavy, sperm-stocked balls. <i>“It’s... nnn...”</i>");
	
	output("\n\nNo sooner has it filled than her new scrotum tightens up again, twitching to deliver sperm. Whining, the new herm loses her rigid tension in a prolonged spasm, and a blob of silvery cum erupts from her cock to lance the air and fall back onto the spurting tool. She sobs and moans through her coronation orgasm, bewildered by new sensations as jizz puddles in her crotch.");
	
	output("\n\nThe girl stares mutely at the veiny, orange prick dribbling globs of virgin cum, hands hovering nearby but afraid to touch. You give her some time to find her own courage but, when she’s still paralyzed after a minute, sweep up her hand in your own and guide it to the shaft. She shivers as you wrap her fingers, and yours, around it, squishing hot cum between them.");

	enemy.cocks.push(new CockClass());
	var ec:CockClass = enemy.cocks[0];
	ec.cLengthRaw = 6;
	ec.cThicknessRatioRaw = 1.5;

	//vag-anal branch - mandatory for F/U, preferred (80-85%) if H or if M and player has selected female gender pronouns or has all cocks too large
	//preg chance for vag PC

	if (!pc.hasCock() || (rand(100) <= 85 && pc.hasStatusEffect("Force Fem Gender")) || pc.cockThatFits(enemy.vaginalCapacity()) < 0)
	{
		var v:int = pc.cuntThatFits(enemy.cockVolume(0, true));
		if (v < 0) pc.biggestVaginaIndex();

		output("\n\n<i>“What is this? My beautiful body...”</i> the sydian whimpers, in a tiny voice.");
		
		output("\n\n");
		if (pc.isBimbo() || pc.isBro())
		{
			output("<i>“Like, you should try putting it in a hot little");
			if (pc.hasVagina()) output(" pussy");
			else output(" ass");
			output(" before you judge,”</i> you flirt,");
		}
		else
		{
			output("“<i>Nice, isn’t it? It’s even better if you put it in");
			if (pc.isFeminine()) output(" a woman");
			else output(" someone");
			output(",”</i> you respond,");
		}

		output(" dragging her cum-slicked hand to the tip and thumbing the crown. She sits up, and her flagging prick surges.");
		if (pc.isBimbo()) output(" <i>“When you shove it deep and shoot your little spermies, it’s the best,”</i>");
		else if (pc.isBro() || pc.isAss()) output(" <i>“Jamming it in and blowing a huge load... fucking nice,”</i>");
		else output(" <i>“Making love and finishing inside your partner is incredible,”</i>");
		output(" you");
		if (pc.hasCock()) output(" continue.");
		else output(" guess, trying to cajole her.");

		output("\n\n<i>“Yes...”</i> she says, face alight. <i>“I want to try... you have to let me inside! Please, I want to feel it!”</i>");
		
		output("\n\n<i>“");
		if (pc.isBimbo() || pc.isBro()) output("You gotta, like, be more");
		else output("Be");
		output(" romantic,”</i> you chide. <i>“Tell me how");
		if (pc.isFeminine()) output(" cute");
		else output(" good");
		output(" I look.”</i>");
		
		output("\n\nThe sydian leans forward");
		if (!pc.isTaur()) output(" and moves atop you");
		output(", reversing your positions. <i>“You do! Incredibly... you’re the most beautiful thing! Please, I beg of you.”</i>");
		
		output("\n\nThe woman’s horny honesty sends a tingle through you");
		if (!pc.isTaur())
		{
			output(" - or perhaps it’s the hot, cum-and-chemical-laden hand she’s slipped into your");
			if (pc.hasLowerGarment()) output(" [pc.lowerUndergarment]");
			else output(" lap");
		}
		output(". Her breaths come so heavy they fog the air, and her eyes search yours for permission. A new trickle of lubrication beads atop her crown, unnecessary and almost unnoticeable among the silver, slick semen. Amused by her total inversion, you nod");
		if (!pc.isNude()) output(" and begin to strip your [pc.gear]");
		output(". The sydian’s open mouth turns to a smile and she");
		if (pc.isTaur()) output(" circles to your backside, tracing your flank with one thick, slippery finger.");
		else if (pc.hasLowerGarment() || pc.hasArmor()) output(" assists you with the clumsy movements of a too-eager virgin. When she’s exposed your bottom, she forgets the rest and automatically guides her cock into position.");
		else if (pc.isNude()) output(" immediately positions herself to spear you on her new tool.");
		
		output("\n\n");
		if (pc.hasLegs() && !pc.isTaur() && pc.hasVagina())
		{
			output("You spread your thighs to expose her desire’s object, and watch her eyes become glazy and her cock hard as iron. ");
		}
		output("Her glans bumps your");
		if (pc.hasVagina()) output(" labia");
		else output(" asshole");
		output(", leaving behind a kiss of cum; the sydian’s shoulders tremble from your heat, and her expression of utter concentration is adorable. One push and her cock slides into you, carrying half its last load in with it.");
		if ((pc.hasVagina() && pc.vaginas[v].looseness() <= 1) || pc.ass.looseness() <= 1) output(" Even slicked by copious cum, she has to fight to hilt her dick in your [pc.vagOrAss "+v+"]. The girl groans as tight flesh wrings her hard cock, and stops to recover so she doesn’t blow.");
		else if ((pc.hasVagina() && pc.vaginas[v].looseness() <= 3) || pc.ass.looseness() <= 3) output(" Her cock fits perfectly in your [pc.vagOrAss "+v+"], and the sydian pauses to savor her first penetration.");
		else
		{
			output(" Your [pc.vagOrAss "+v+"] is so well-used that she overestimates her force and bumps into your");
			if (pc.isTaur()) output(" rump");
			else output(" chest");
			output(". She meets your eyes and colors, embarrassed but loving the sensations.");
		}
		output(" The spent jizz soaking into her crotch splats against your");
		if (pc.hasVagina()) output(" pussy");
		else output(" butt");
		output(" with a wet smack, smearing you with warmth, and the rest on her penis remains inside, licked off by your");
		if (pc.hasVagina())
		{
			output(" greedy, quavering quim.");
			pc.cuntChange(v, enemy.cockVolume(0, true), true, true);
		}
		else
		{
			output(" clenching, seizing asshole.");
			pc.buttChange(enemy.cockVolume(0, true), true, true);
		}
		
		output("\n\nWhen the virgin has had enough of reverence, she begins to thrust. Her first pushes are sloppy and free-form, like bad art, until she latches onto your [pc.hips]. Aphrodisiac wicks into your [pc.legFurScales] and when the sydian sees you react, she smiles again. She pulls on one antenna, gathering enzyme for you and leaving a little streak of silver cum behind on the bristles. Your breath catches when the laden hand comes to rest on");
		if (pc.hasVagina()) output(" your [pc.clit]");
		else output(" the small of your back");
		output(", shooting heat up your spine, and hers follows when your [pc.vagOrAss "+v+"] clamps down from the arousal. Your hips jerk by themselves, pushing back against her cum-lubricated fuck while she shivers and tries to stretch the session. It barely works, and her cute moans go higher and higher as she picks up unintentional speed. Your [pc.vagOrAss "+v+"] burns with need for release, and her aphrodisiac touch dances along your body, tensing the muscles and bringing you to climax.");
		
		output("\n\n<i>“Oh... yess...”</i> she moans, sawing into you like a senseless rutting beast. The sydian grunts, and something hot touches a deep place in your");
		if (pc.hasVagina()) output(" vagina");
		else output(" rectum");
		output(". Her orgasm is on, and the second stroke dumps into you, a hot tongue of sperm");
		if (pc.hasVagina()) output(" pressing for entrance to your womb");
		output(". You shudder as three and four baste your insides, picturing the slivery slime spilling from her. The sydian’s eyes roll and her head lolls on her neck, and watching her enjoy you as hot semen pours in sets off your own pleasure. The poor girl practically melts when your climaxing");
		if (pc.hasVagina()) output(" cunt");
		else output(" hole");
		output(" attacks her sensitive cock, falling on top of you while the last strokes meander out.");
		//female orgasm, reduce lust, put sydian load x2 in PC’s cunt

		processTime(30+rand(15));

		for (var i:int = 0; i < 2; i++)
		{
			pc.loadInCunt(enemy, v);
			enemy.orgasm();
			pc.orgasm();
		}
	}
	else
	{
		var c:int = pc.cockThatFits(enemy.vaginalCapacity());
		if (c < 0) c = pc.smallestCockIndex();

		output("\n\nThe girl moans and cum slops down her sensitized cock, the baby-making batter pressed into a makeshift hot lube by your grip; two aftershocks bubble from her twitching slit as her unwilling dick tries to go soft. The sydian shakes and sighs. <i>“Stop... it’s too much...”</i>");
		
		output("\n\nWearing a sick grin, you prepare to show her all-new definitions of ‘too much’.");
		if (!pc.isCrotchExposed() && !pc.isTaur())
		{
			output(" Your free hand works into your");
			if (pc.hasArmor()) output(" [pc.armor]");
			else output(" [pc.lowerGarments]");
			output(" and unleashes your [pc.cockNounComplex "+c+"]");
		}
		else output(" Your [pc.cockNounComplex "+c+"] throbs at you");
		output(", painfully erect from watching the girl’s growth and first, tear-streaked climax. The sydian, still limp from her ejaculation, only watches - but when you spread her thighs, she bites her lip in recognition. Her pussy, half-draped in the strings of silver smut that drip down her crotch, quivers...");
		
		output("\n\n");
		if (pc.isNice() || pc.isTaur())
		{
			output("You pause in position, with your [pc.cockHead "+c+"] close enough to whisper to her cunt, and look into her eyes. She says and does nothing for ten seconds, and then gives the most minute nod, consenting to the onrush of pleasure. With");
			if (!pc.isTaur()) output(" one hand still stroking her throbbing cock to male ecstasy");
			else
			{
				output(" a careful thrust to avoid squeezing her balls, you impale her womanhood on");
				if (pc.cocks[c].cLength() > 10) output(" ten");
				else output(" " + num2Text(pc.cocks[c].cLength()));
				output(" inches of your pleasure tool.");
			}
		}
		else output("Your imagination spins to a perverted scenario, and the sydian looks concerned when you stop to gather her spent load. Her eyes widen to saucers when you coat your cock with her cum, making sure it’s slathered with fertile sydian sperm, and she chews her lip in resignation as your silver-smeared crown nudges at her labia. With evil relish, you thrust forward and deliver her own semen to her pussy, giving it a head-start on your building, churning jizz-wave.");
		
		pc.cockChange();
		
		output("\n\nShe swears in a strange language as you hilt in her slick, orange vagina, and her elbows dance in the dirt from the back-shaking pleasure");
		if (!pc.isTaur()) output(" you force on her virgin dick. With only one hand free to grip, y");
		else output(". Y");
		output("ou’re obliged to start slowly, sinking your [pc.cockNounSimple "+c+"] into the hot sex in time with the slippery");
		if (pc.isTaur()) output(" flops");
		else output(" strokes");
		output(" of her penis, but as the fuck warms up, her flagging tool finally gives up on giving up and gets hard again. The sydian girl’s hand tightens as the pleasure returns, and within a few more thrusts, she’s jerking off");
		if (!pc.isTaur()) output(" faster than you can guide her. You let go and enjoy");
		else output(" with gusto. Blocked by your own bulky body, you can only imagine");
		output(" the spectacle of the girl abandoning herself to hermaphro-heaven.");
		
		output("\n\nHer pussy seems to ratchet tighter with every stroke up her cock, until your own prick is fit to burst all over her insides. You exercise titanic restraint, trying to fuck her well enough that she’ll never forget the "+ pc.mf("man", "woman") +" who gave her her first dual orgasm. Judging by the way she writhes like a snake with a pinned tail, she isn’t far off.");
		
		output("\n\n<i>“N-no...”</i> she moans, <i>“...cumming soon! Don’t stop!”</i> Her hand is a gray blur on her angry, swollen cock, stroking so hard that pre-cum is flung off the end without the chance to lubricate a damn thing.");
		if (!pc.isTaur()) output(" As you watch, one of the globlets hits her in the face");
		else output(" Many of the globlets spatter on your belly");
		output("; she pays no mind and continues jerking, tickling her urethra with a thumbtip like an experienced masturbator. Your own climax hits you, and you hilt deep in pussy to deliver your seed. The sydian notices, and you can feel her balls tighten with the base of your penis as the anticipation pushes her over her limit. Her pussy begins to quake just as the [pc.cum] climbs your shaft.");
		
		output("\n\n");
		if (pc.cumQ() <= 150) output("Your scanty load squirts out with no more energy than a handful of confetti thrown by a bored coworker at an office party. Her own ejaculation makes a better showing, and");
		else if (pc.cumQ() <= 1500) output("Your load escapes in several satisfying squirts; the girl flinches as each one touches her pussy. Her prick tries to match you like a synchronized spurting team, and");
		else output("Your load, more like a loaf, stretches your urethra in great gobs, dumping into the poor girl. Her pussy is filled in the first squirt, but cum keeps coming until her plugged hole resembles a cataract of [pc.cumColor] slime. Her own dick, red with shame and friction,");
		output(" paints three lines of silvery spunk on her stomach and breastplate as her pussy drinks greedily from your genetic tap.");
		
		output("\n\nThe girl and her new master shudder, releasing days and days of tension from her muscles along with the semen of her immense orgasm. Her hand comes to rest at the base of her cock, and you");
		if (!pc.isTaur()) output(" tickle her balls");
		else output(" scrape your belly on her frenulum");
		output(" to bring her back to reality. She laughs");
		if (!pc.isTaur()) output(", and her silvery cum catches the light as her chest shakes");
		output(".");
		
		if (!pc.isNice() && !pc.isTaur())
		{
			output("\n\nWatching her second load cooling on her belly stirs your recent memory. The sydian recognizes the naughty glint in your eye. <i>“Don’t do it...”</i>");
		
			output("\n\nYou ignore her entreaties and lean down, collecting every drop of her second load and dripping it into your mouth. The sydian covers her eyes with her sticky hands, embarrassed, as you lift her ass up, spread her labia, and drool the salty, metallic cum into her wide-open pussyhole. <i>“Waste not, want not,”</i> you say, jiggling her hips to give the egg-hunting sperm a sporting chance.");
		}

		processTime(30+rand(15));
		enemy.loadInCunt(pc, 0);
		pc.orgasm();
		enemy.orgasm();
		//pc.loadInMouth(enemy);
	}

	output("\n\nShe rests quietly with you for a long time before speaking. <i>“That was so strange,”</i> she says. <i>“Um...”</i>");
	
	output("\n\nYou pull apart from her with a wet, sucking sound");
	if (pc.isAss()) output(", not really interested in what comes after ‘um’");
	output(".");
	if (!pc.isAss()) output(" <i>“Yeah?”</i>");
	
	output("\n\nThe sydian thinks for a moment. <i>“Nevermind...”</i> she eventually says. You look into her eyes; she’s uneasy. <i>“It’s fine. I’ll figure something out.”</i> She leans forward and kisses you a final time, then bids you goodbye.");
	
	output("\n\nYou watch her satisfied hip-sway as she goes, thinking it might be a good idea to stock up on Throbb.\n\n");
	
	pc.destroyItemByClass(Throbb, 1);
	
	CombatManager.genericVictory();
}

public function femSydianEatsButtholes():void
{
	clearOutput();
	showSydianFemale();

	if (pc.hasCock())
	{
		output("Despite her debasement, the woman eyes your [pc.cocksLight] with interest once your [pc.gear] is out of the way. Her thighs even spread, exposing her orange-hued slit, but clamp shut again when you");
		if (pc.isTaur()) output(" turn about, displaying your [pc.vagOrAss] instead");
		else if (pc.balls > 0) output(" heft your [pc.balls] out of the way to display your [pc.vagOrAss]");
		else
		{
			output(" brush");
			if (pc.cocks.length == 1) output(" it");
			else output(" them");
			output(" upward, nearly touching your navel as you show off your [pc.vagOrAss]");
		}
		output(".");

		output("\n\n<i>“Hold on, you picked the wrong bit,”</i> she");
		if (!enemy.hasStatusEffect("Unarmored")) output(" teases. <i>“The hole is for boys to play with; girls get the penis.”</i>");
		else output(" panics. <i>“I’m not a male... I can’t give you babies.”</i>");
	}
	else if (pc.isSquirter())
	{
		if (!pc.isNude()) output("You undress, and s");
		else output("S");
		output("he stares dumbly at your denuded form when you");
		if (pc.isTaur() || (!pc.hasCock() && !pc.hasVagina())) output(" turn and thrust your [pc.vagOrAss] toward her");
		else output(" slip your fingers into your [pc.vagOrAss] and begin to jill off");
		output(", sprinkling her with the obscene flecks of your ever-drooling lubrication.");
		
		output("\n\n<i>“Do you expect me to do something with that?”</i> she sputters, holding up a hand to fend off your spray.");
		if (!enemy.hasStatusEffect("Unarmored")) output(" <i>“You do understand the difference between men and women, right?”</i>");
		else output(" <i>“I can’t please you... I’m a female.”</i>");
	}
	else
	{
		output("Your [pc.gear] drops into a pile as you prepare to take advantage of the woman. She perks up as you");
		if (pc.isTaur()) output(" display");
		else output(" stroke");
		output(" your [pc.vagOrAss], curiosity piqued.");

		if (pc.hasVagina() && !pc.hasCock())
		{
			output("\n\n<i>“It looks like mine,”</i> she giggles, raising a finger. [pc.OneClitoris] trembles at her chemically-enhanced touch.");
			if (pc.vaginas[0].type != GLOBAL.TYPE_HUMAN && pc.vaginas[0].type != GLOBAL.TYPE_SYDIAN) output(" <i>“Kind of...”</i>");
			else if (pc.vaginas[0].vaginaColor != "orange") output(" <i>“Wrong color...”</i>");
		}
	}

	output("\n\n<i>“Lick");
	if (pc.isBimbo()) output(" my hot hole,”</i>");
	else if (pc.isNice()) output(", please,”</i>");
	else output(",”</i>");
	output(" you insist. <i>“And use your fingers.”</i>");

	output("\n\nThe sydian looks surprised, as if the thought had never occurred to her. She");
	if (pc.isTaur()) output(" curls under you");
	else output(" scoots up to your crotch");
	output(" and begins to caress your entrance. The enzymes in her hands heat your skin, making your");
	if (pc.hasKnees()) output(" knees weak");
	else output(" back quiver");
	output(" with the promise of a really good orgasm. A wet object slides into you, and the chemical passion intensifies - she must have coated the inside of her mouth in the stuff!");
	
	output("\n\n");
	if (!enemy.hasStatusEffect("Unarmored")) output("<i>“You like that?”</i> she asks, breath hot on your sex.");
	else output("<i>“Is this good?”</i> she asks, meek wisps of breath tickling your sex.");
	output(" You implore her to continue, and her smile breaks briefly before parting to reveal that evil tongue again. A gasp escapes from you as she slides it back in. Her");
	if (pc.isTaur()) output(" tail brushes");
	else output(" antennae brush");
	output(" against your [pc.belly], and without thinking you grab and rub");
	if (pc.isTaur()) output(" it");
	else output(" them");
	output(" against your [pc.nipples]. She sighs, and her free hand darts between her thighs.");
	
	if (pc.isAss())
	{
		output("\n\nHer enzymes are heavenly, but her technique doesn’t warrant any pride at all. <i>“Without your chemicals, you’d never please a man,”</i> you berate. The sydian keeps going, but looks up with smoldering eyes that fill you with cruel supremacy. You pull her");
		if (pc.isTaur()) output(" tail");
		else output(" antenna");
		output(" until she winces and bark, <i>“Stop playing with yourself - you haven’t earned it.”</i>");
	
		output("\n\nShe removes her hand from her crotch, exposing a fully-bloomed pussy that twitches from sudden neglect. You glare at her, and she realizes she needs to say something. <i>“Yes... my superior,”</i> she mumbles.");
	}

	output(" Her other hand continues to caress, leaving greasy-feeling strokes of heat all around your hole.");
	if (pc.hasVagina())
	{
		output(" [pc.EachVagina]");
		if (pc.vaginas.length > 1) output(" burns with aphrodisiacs - what she lacks in talent, she makes up in thoroughness, fingering every hole she finds.");
		else output(" throbs without stopping, heated by the enzyme smeared on your [pc.clitoris].");

		if (pc.isSquirter())
		{
			output("Your [pc.girlCum] drips down your lover’s chin and");
			if (!enemy.hasStatusEffect("Unarmored")) output(" over the clefts in her body armor to tickle her cunt, clearly turning her on.");
			else output(" mingles with the dusty remnants of her covering, turning to a clumpy mess that sticks to her breasts.");
		}
	}
	else output(" Your [pc.asshole] is covered in oily love by the secret ass freak. ");
	

	output("\n\n<i>“Unghh,”</i> you moan, driven close to climax by the irresistible enzyme. A few licks locate sweet spots as the alien picks up technique and speed - she knows enough to");
	if (pc.hasVagina())
	{
		output(" envelop your [pc.clitoris] in her tongue’s hot folds often, working the [pc.cuntColor]");
		if (pc.clitLength < 2) output(" nub");
		else output(" rod");
		output(" with her oily muscle.");
	}
	else output(" keep her tongue circling to continually apply more enzyme.");
	if (!pc.isTaur()) output(" You grab her head in your hands, mashing her face into your hole every time she does something right and hoping she’ll take the hints.");
	output(" Her");
	if (pc.isTaur()) output(" tail twitches");
	else output(" antennae twitch");
	output(" against your chest, finding");
	if (pc.hasNippleCocks()) output(" the tips of your [pc.nippleCocks]");
	else if (pc.hasFuckableNipples())
	{
		if (pc.isTaur()) output(" its");
		else output(" their");
		output(" way into your [pc.nipples]");
	}
	else
	{
		output(" your");
		if (!pc.hasFlatNipples()) output(" erect");
		output(" [pc.nipples]");
	}
	if (pc.hasNippleCocks() || pc.isLactating())
	{
		output(" and stimulating a trickle of [pc.milk] that falls");
		if (pc.isTaur()) output(" onto her stomach");
		else output(" into her hair");
	}
	output(".");

	output("\n\n<i>“Come for me");
	if (pc.isAss()) output(", my superior");
	output(",”</i> the woman hums, mouthing the words into your [pc.vagOrAss]. She looks up, then pulls at her antenna, gathering a huge dose of enzyme. You can feel the heat radiating from her fingers before she even touches you, and when she slides them in, your [pc.leg] buckles in a tiny earthquake.");
	
	output("\n\nYou twitch and shake, clenching with fits of climax. Swells of joy are pushed through your sex by aphrodisiac radiating from her fingertips, shooting through your limbs until you tingle all over.");
	if (pc.isSquirter())
	{
		output(" Your [pc.girlCum], already glistening on your lover’s face, fills her mouth in a spurt and sputter.");
		if (!pc.isTaur()) output(" Stuck to your opening by your unyielding arms, she swallows and swallows, drinking from you as liquid love streams down her chin.");
	}
	
	output("\n\nWhen your climax releases you, you slump into a pile");
	if (pc.isTaur()) output(" and the poor woman just barely skitters out from under");
	output(". The sydian looks over your satisfied shape. <i>“Must try that...”</i> she mumbles");
	if (pc.hasVagina()) output(", licking your [pc.girlCumFlavor] fluids from her lips");
	output(". She sits until you wave her away, then leaves you to re-equip with a wistful glance.\n\n");

	processTime(30+rand(15));
	pc.orgasm();
	CombatManager.genericVictory();
}

public function femSydianFuck():void
{
	clearOutput();
	showSydianFemale();

	var cockIdx:int = (enemy.hasStatusEffect("Unarmored") ? pc.cockThatFits(4, "thickness") : pc.cockThatFits(enemy.vaginalCapacity()));
	var asTailcock:Boolean = false; // This is going to require further science, urgh
	if(cockIdx < 0) {
		if(pc.hasTailCock()) asTailcock = true;
		cockIdx = pc.smallestCockIndex();
	}

	output("You push her shoulders to the ground, eyeing the "+ (enemy.hasStatusEffect("Unarmored") ? "crumbling chips that remain of her destroyed bodywork" : "detailed plating of her breasts and stomach") +". The sydian clucks at you.");
	
	if (!enemy.hasStatusEffect("Unarmored")) output("\n\n<i>“What’s wrong, never seen a pretty girl before?”</i>");
	else output("\n\n<i>“What? Are you going to stare forever?”</i>");
	
	output("\n\nShe "+ (enemy.hasStatusEffect("Unarmored") ? "covers her chest" : "displays openly") +" while you set aside your [pc.gear], glaring the whole time. Paying little mind, you push her legs apart");
	if (pc.isTaur()) output(" with yours");
	output(". The show of naked force is turning her on despite her attitude; her pussy blooms slightly, a tiny window of orange.");
	if (asTailcock) output(" Your [pc.tailCock] slides free, drooling in anticipation.");
	
	output("\n\n");
	if (pc.isTaur())
	{
		output("You squat down until level with the sydian woman, rubbing");
		if (!asTailcock) output(" your [pc.cockHead "+cockIdx+"]");
		else output(" the lewd, slimy crown of your tail-cock");
		output(" against her vulva.");
	}
	else if (pc.legCount <= 1 || pc.isNaga())
	{
		output("You fall onto the woman, kissing her breast greedily, and your [pc.leg] wraps around one hard, armored leg, tingling wherever you touch the exoskeleton. Your");
		if (!asTailcock) output(" [pc.cockHead "+cockIdx+"]");
		else output(" perverted, sexual tail");
		output(" presses on her slit, and the woman’s sneer disappears.");
	}
	else
	{
		output("You lower yourself and lift her ass with your hands");
		// (bare hands), savoring the tingle of pleasure on your palms
		output(". Lining your");
		if (!asTailcock) output(" [pc.cock "+cockIdx+"]");
		else output(" [pc.tail]");
		output(" up, you nudge the woman’s vulva.");
	}
	output(" She looks away coyly, and the bloom of warmth you feel when her pussy opens wider suggests that she’s enjoying your touch while she awaits your next move.");
	
	output("\n\n");
	if (!enemy.hasStatusEffect("Unarmored")) output("<i>“Well... hurry up!”</i> she barks.");
	else output("<i>“Ah... dangerous,”</i> she whimpers, trembling at the touch of your breath.");
	output(" Her thighs spread even further, encouraging your dominant, seemingly-uncaring demeanor.");
	if (!enemy.hasStatusEffect("Unarmored")) output(" <i>“Is this is your first time with a female or something?”</i>");
	else output(" <i>“What’s wrong? Are you nervous?”</i> she asks, cautiously.");
	
	output("\n\n");
	if (pc.isNice()) output("<i>“No... well, that’s...”</i> you mumble, before trailing off.");
	else if (pc.isMischievous()) output("<i>“Like I’d admit it,”</i> you sass, grinning.");
	else output("<i>“Find out, slut,”</i> you command.");
	output(" The sydian’s reply is transformed into a grunt as you thrust forward, impaling her pussy on your");
	if (asTailcock) output(" tailcock.");
	else output(" cock."); // (greater of cock length or 24) inches.

	//Cockcchange check (whatever the fuck this is)
	if (!asTailcock) pc.cockChange();

	output("\n\n<i>“Nnnn,”</i> she groans, <i>“");
	if (!asTailcock && pc.cocks[cockIdx].cLength() < 6)
	{
		if (!enemy.hasStatusEffect("Unarmored")) output("It’s so tiny... Come on, little dick, fuck");
		else output("It’s so small... but it’s so hot. Fill");
	}
	else if ((asTailcock && pc.tailCockVolume() >= enemy.vaginalCapacity()) || (!asTailcock && (pc.cocks[cockIdx].cLength() > 56 || pc.cockVolume(cockIdx) >= enemy.vaginalCapacity()))) output("So full... fuck");
	else output("Fuck");
	output(" me!”</i> Her hands wrap around you, depositing flares of chemical that agitate your blood.");
	if (!pc.isTaur())
	{
		output(" You grope her breast,");
		if (enemy.hasStatusEffect("Unarmored")) output(" rubbing her exposed nipple through ruined body paint,");
		else output(" squeezing until the body paint cracks,");
		output(" and watch her head roll from the pleasure.");
	}
	output(" Your shaft responds by stiffening even more, and the sydian’s eyes implore you not to tease. Unwilling to wait, you begin to pump.");
	
	output("\n\n<i>“That’s it, powerful male!”</i> she moans, <i>“More!”</i> You oblige and increase your pace, thrusting until the sydian’s pussy becomes frothy with beaded lubrication.");
	if (!pc.isTaur()) output(" Her legs wrap around your back, drawing two thick rays of pleasure on your [pc.ass].");
	output(" A hand slinks between you to tweak her clitoris, and the plates on her back click as she arches and writhes in ecstasy. Without warning, the same hand dives into your groin,");
	if (pc.balls > 0) output(" caressing your [pc.sack] with hot, slippery fingers");
	else if (!asTailcock && pc.hasKnot(cockIdx)) output(" gripping the [pc.knot "+cockIdx+"]");
	output(" and turning it into a ball of chemical lust. You hit your limit suddenly, and the sydian’s pussy twitches when she feels the first stroke of [pc.cum].");
	
	output("\n\n<i>“Yes... do it inside! I want strong children!”</i> she exclaims, slamming her hips into you.");
	if (pc.cumQ() <= 1500)
	{
		output(" She wrings you, clings to you, until you shoot every last string.");
		if (pc.cumQ() <= 7) output(" With how little your [pc.balls] produce, you doubt very much that she’ll get her wish.");
	}
	else
	{
		output(" The sydian grunts in surprise as your load fills her to capacity and begins to back-flow.");
		if (!asTailcock && pc.hasKnot(cockIdx))
		{
			output(" Her enthusiasm turns to discomfort when your knot prevents a single drop from spilling out.");
			if (enemy.hasStatusEffect("Unarmored")) output(" Without an escape, the seed distends her womb, rounding her belly until it can grow no larger.");
			else output(" Without an escape, the seed strains at her womb; as the pressure mounts, a terrible cacophony of tiny cracking sounds fills the air and her body paint fractures, freeing her belly to expand.");
		}
		else
		{
			output(" Despite writhing, grasping and squeezing her thighs around you, she has no way to keep it all inside, and it drools over her ass and onto the ground.");
		}
	}
	output(" You rest atop the woman for a few minutes,");
	if (!pc.isTaur()) output(" enjoying the ticklish feeling as she cradles your head,");
	output(" and then pull out. The sydian surprises you with a kiss");
	if (pc.cumQ() > 150) output(", and you think you see gratitude in her eyes");
	output(".");
	
	output("\n\n<i>“My powerful male,”</i> she mumbles again, intoxicated by your presence.");
	if (pc.isNice()) output(" Taken slightly aback,");
	else output(" Brimming with confidence,");
	output(" you collect your stuff and leave her there, stroking her belly.\n\n");
	
	//end; reduce lust, pass time
	processTime(30+rand(15))
	enemy.loadInCunt(pc, 0);
	pc.orgasm();
	CombatManager.genericVictory();
}


public function sydianPregnancyEnds():void
{
	clearOutput();
	author("Zeikfried");
	showBust("");
	showName("\nBIRTHING!");

	var se:StorageClass = pc.getStatusEffect("Sydian Pregnancy Ends");
	var numChildren:int = se.value1;
	var bRatingContrib:int = se.value2;
	var pregSlot:int = se.value3;
	var babym:Boolean = (se.value4 == 1);
	
	output("Pain in your gut bends you over and fluid spills");
	if (!pc.isCrotchExposed()) output(" into your [pc.lowerGarment]");
	else if (InShipInterior()) output(" onto the deck");
	else output(" onto the ground");
	output(". Oh god, the baby is coming...");

	//on ship with auto-medbay (commented until one is available)
	if (InShipInterior() && 9999 == 0)
	{
		output("\n\nYou head for the automatic medbay, clutching your trembling stomach. Contractions intensify quickly -- by the time the system finishes its evaluation and moves into action, you’re");
		if (!pc.isNude()) output(" disrobed but");
		output(" no longer able to speak between breaths.");
	}
	//on ship without automatic medbay
	else if (InShipInterior())
	{
		output("\n\nYou grab the nearest medkit and head for your bed, determined to deliver the baby safely. After setting aside your gear, you lie down and begin to breathe in preparation for your labors.");
	}
	//in public place
	else if (InPublicSpace())
	{
		output("\n\nA passer-by comes over to check on you, and begins to panic when you explain the situation. You default to giving short, simple orders, and your new deputy calms down. Together, you make it to a place where you can get medical aid.");
	}
	else if (InRoomWithFlag(GLOBAL.JUNGLE))
	{
		output("\n\nGroaning at the timing, you shed your [pc.gear] and seat yourself among the inhospitable and non-hospital-able terrain. The wish that you’d stayed somewhere indoors and safe hums through your thoughts like a mosquito, but there’s no help for it -- you’ll have to deliver the baby on your own.");
	}

	output("\n\nSpasms wrack your pregnant body for the next hour as it works the baby free. During the frenzy you operate mostly on biological autopilot, but glimpse a few details of your new little miracle. The baby drops " + (rand(10) == 0 ? " head" : " feet") + "-first, noodling its way out");
	if (pc.vaginas[pregSlot].looseness() >= 4) output(" easily");
	else output(" in a protracted battle with your tight vagina");
	output(", and the placenta follows.");

	output("\n\nYour new bundle launches into a throaty cry when the air hits its skin. As the pain fades and the endorphin haze clears from your eyes, the noise brings you home to yourself; you gather the squirming baby into your arms and dab the gore away. It’s a " + (babym ? "boy" : "girl") + "! A fuzz of");
	if (rand(10) == 0) output(" green");
	else if (rand(10) == 0) output(" reddish-orange");
	else output(" brown ");
	output(" hair coats");
	if (babym) output(" his");
	output(" her");
	output(" pate and chubby pink hands grasp for yours. Your new baby is a picture-perfect human child.");
	// (comment out if methods to know father are added) 
	output(" That raises an interesting question. Which human did you sleep with to make such a beautiful");
	if (babym) output(" boy");
	else output(" girl");
	output("?");
	
	if(numChildren > 1)
	{
		output("\n\nThe birthing doesn’t stop there. After a brief moment, you take a few huffs as another movement applies pressure to your womb and your vision hazes again. Your [pc.vagina " + pregSlot + "] spreads and a new head crowns. With some effort, you gently push with your lower muscles, aiding the child out to finally join its " + (babym ? "brother" : "sister") + ".");
		if(numChildren > 2) output(" The process continues until you have a total of " + num2Text(numChildren) + " children born.");
		output(" You take a good look at your beautiful babies while the fuzzy fog fades from your senses.");
	}

	output("\n\n" + (numChildren == 1 ? "A soft touch" : "Soft touches") + " on your hand bring" + (numChildren == 1 ? "s" : "") + " you out of your reverie -- your bab" + (numChildren == 1 ? "y seems" : "ies seem") + " to know there’s more work to do. Sighing, you clean up and cut the cord" + (numChildren == 1 ? "" : "s") + ", then prepare to send " + (numChildren == 1 ? (babym ? "him":"her") : "the newborns") + " off. While the shuttle is in transit, you spend some time playing, letting your little one" + (numChildren == 1 ? "" : "s") + " squeeze your fingers and giggle while you meditate on " + (numChildren == 1 ? ("a name that suits" + (babym ? "him":"her")) : "names that suit them") + ". You even hold up the shuttle, ignoring the drone’s automated requests until you can’t wait any longer. With a pang in your heart, you bundle your child" + (numChildren == 1 ? "" : "ren") + " into the climate-controlled device and watch it return to the shuttle.");
	
	processTime(49 + (13 * numChildren));
	
	pc.removeStatusEffect("Sydian Pregnancy Ends");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
