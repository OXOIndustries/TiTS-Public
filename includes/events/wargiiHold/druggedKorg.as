//Dosed up Korgonne girl
public function dosedKorgEncounter():void
{
	showBust("KORG_DOSED");
	showName("DRUGGED\nKORGONNE");
	author("Wsan");
	output("\n\nIn the midst of the hold, you come across a korgonne girl laid out on her back, desperately panting and whining while her hand works between her thick thighs to no avail. Moaning in utter frustration, she raises her head and spots you.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Help! Alien help!":"Help! Help me, alien!") + "”</i> she cries out, brow creased in concern. <i>“Aah...!”</i>");
	clearMenu();
	addButton(0,"Help",helpDruggedKorgonne,undefined,"Help","Selflessly aid the korgonne with her very obvious sexual need.");
	addButton(14,"Leave",youDontHaveTimeForKorgiiNonsense);
}

//[Help]
//tooltip:Selflessly aid the korgonne with her very obvious sexual need.
//note: Will not work for neuters.
public function helpDruggedKorgonne():void
{
	clearOutput();
	showBust("KORG_DOSED");
	showName("DRUGGED\nKORGONNE");
	if(!pc.hasStatusEffect("FDruggedKorgTimer"))
	{
		pc.createStatusEffect("FDruggedKorgTimer");
		pc.setStatusMinutes("FDruggedKorgTimer",75);
	}
	author("Wsan");
	showImage("KorgDosed");
	output("As you approach, she rolls up into a sitting position and stretches her arms out towards you, eyes wide and needy. She looks perfectly uninjured but the smell of desire rises off her like a fine mist, the thick scent of sexual pheromones wrapping around your brain as if it were a velvet blanket.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Stupid </i>catdog<i> jab me with needle":"The stupid milodan jabbed me with a needle") + ",”</i> she moans as you give her a comforting hug, which she seems to appreciate a lot, wrapping her fluffy arms around your back for a tight embrace. <i>“" + (!korgiTranslate() ? "Please... alien help":"Please... can you help") + "?”</i>");
	output("\n\nIt seems like a milodan jabbed her with an aphrodisiac. Luckily, you know exactly how to take care of this.");
	processTime(3);
	clearMenu();
	if(pc.hasHardLightEquipped() || (pc.hasCock() && pc.cockThatFits(800) >= 0)) addButton(0,"DickDown",cockSelect,[dickThatKorgDownMan,800,true,0],"DickDown","Fuck the wound-up girl hard enough to satisfy her.");
	else if(pc.hasCock()) addDisabledButton(0,"DickDown","DickDown","You’re too big for her pussy.");
	else addDisabledButton(0,"DickDown","DickDown","You need to be wearing a hardlight strap-on or have a penis for this.");
	if(pc.hasCock())
	{
		if(pc.biggestCockVolume() >= 800) addButton(1,"HyperDick",cockSelect,[hyperdiiiiick,900000000000,true,0],"Hyper Dick","Use your massive cock to satisfy her.");
		else addDisabledButton(1,"HyperDick","Hyper Dick","Your cock needs to be absurdly large for this.");
	}
	else addDisabledButton(1,"HyperDick","Hyper Dick","You need a really big dick for this.");
	if(pc.hasGenitals()) addButton(2,"69",sixtyNineKorg,undefined,"69","Help out the korgonne girl with your tongue while she tends to you.");
	else addDisabledButton(2,"69","69","You need genitals to 69.");
	addButton(14,"Leave",youDontHaveTimeForKorgiiNonsense);
}

//[DickDown]
//tooltip:Fuck the wound-up girl hard enough to satisfy her.
//invalid:Requires a penis.
public function dickThatKorgDownMan(x:int):void
{
	clearOutput();
	showName("DRUGGED\nKORGONNE");
	showBust("KORG_DOSED");
	author("Wsan");
	output("<i>“Alright,”</i> you say, separating from the hug and grinning" + (x >= 0 && !pc.isCrotchExposed() ? " as you remove your [pc.crotchCovers]":"") + ". <i>“Lay back and spread those legs, cutie.”</i>");
	output("\n\n");
	showImage("KorgDosedDicked");
	output("<i>“Yes yes yes yes,”</i> she pants, flopping onto her back and putting her furred legs in the air before slowly laying them to the sides. <i>“" + (korgiTranslate() ? "Hurry! Take me!":"Alien hurry! Take!") + "”</i>");
	output("\n\nIt’s not as though you were in any doubt but damn, she is <i>ready</i>. Between her powerful thighs is one extremely wet, hot pink slit that’s just barely open. Her lips are inflamed with ardor, each of them red and slightly swollen in need, pressing together as she clenches her vaginal muscles, translucent nectar dribbling from between them. The korgonne watches you expectantly, hands on her legs holding them apart for you.");
	output("\n\nNo sense in disappointing her. You thrust your [pc.cockOrHardlight " + x + "] right into her dripping cunt and slide all the way ");
	var cSize:Number = 9;
	if(x >= 0) cSize = pc.cocks[x].cLength();
	if(cSize <= 14) output("to the hilt");
	else output("to her womb");
	output(", exciting the big-breasted girl to the point of letting out a delighted scream. She immediately kicks you in the back with her heels, desperately pulling you closer in her fervor. The poor girl is so happy to have you inside her she doesn’t even realize she’s making it harder for you to thrust, but it doesn’t seem like she cares.");
	if(x >= 0) pc.cockChange();
	output("\n\nBabbling incoherently, she throws her head back the moment you draw back and shove yourself back inside, cumming with a gasp and a series of violent contractions. Her back arches further and further as she writhes until you have to grab her by the hips to keep her in place, her entire upper body coming off the ground in her ecstasy. You can feel her walls spasming and pulling at your erect dick while she orgasms, her mouth opening and closing in a combination of shock and bliss. She really needs this.");
	output("\n\nAs you soon learn, you might have needed this too - a break in the fighting, and this lusty korgonne is a hell of a partner to spend it with. She cums again and again, each one forcing her breath from her throat in an adorable moaning growl and making her fuzzy tummy tense up with the effort of it all. You come to learn every little detail about how to make her eyes cross with the pleasure of sex, her legs shaking as they slip down your back, her grip failing.");
	output("\n\n<i>“YesyesyesYES!”</i> she screams, her hands grasping at your " + (pc.tone > 60 ? "muscular ":"") + "arms as you fuck her with a measured pace, ");
	if(cSize < 14) output((pc.balls > 0 ? "your [pc.balls] slapping against her curvy ass.":"wet slaps coming from each union of your hips."));
	else output((pc.balls > 0 ? "your [pc.balls] swinging with every pounding.":"your dick throbbing in pleasure."));
	output(" Her slit pulls at you with ever-increasing vigor and gratefulness, as if seeking to draw you deeper inside her, begging you to seed her.");
	output("\n\nBy now, you’re only too keen to oblige. Amidst all the sensuous wails and pleasures of the flesh, you’ve lost track of time. Long since having lost count of how many savage, tit-mauling orgasms you’ve put her through, the only thing you can think about now is how she feels around your " + (x < 0 ? "strapon":"oversensitive cock") + ". Each movement brings with it new sensations, ones that all but urge you to cum deep inside her.");
	output("\n\n<i>“Gonna... cum,”</i> you grunt, grabbing her hands and interlocking your fingers with hers on a whim.");
	output("\n\n<i>“Yes! Yes! Cum! Inside, inside!”</i> she pleads, looking up at you with a mixture of eagerness and delight. <i>“Want to feel it!”</i>");
	output("\n\n" + (x < 0 ? "Though she won’t be feeling any seed, she’ll definitely feel this. ":"") + "Groaning, you shove yourself as deep as you can get and feel your control finally slipping away from you when you begin to cum, your [pc.hips] shaking with the effort. Your [pc.ass] bucks upwards as you begin to grind against her, pushing her hands into the ground and rolling into her while you both moan in ecstatic glee. Her grip on you tightens and relaxes multiple times a second" + (x >= 0 ? " while your [pc.cum] pours into her fertile womb":"") + ", your eyes locked with hers until she closes them and cranes her neck upwards to lick your cheek, shifting to kissing you on your [pc.lipsChaste].");
	if(x < 0) output("\n\n<i>“Alien... strange,”</i> she moans quietly, her head falling back on the ground. <i>“No cum, but so... so tired... th-ks...”</i>");
	else output("<i>“So... good feeling...”</i> she moans quietly, her head falling back on the ground. <i>“Full and warm... th-kyu...”</i>");

	output("\n\nHer voice fades to a mumble as she just about falls asleep, then suddenly springs up from the ground with her eyes wide.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Almost forgot! Here! Alien take thing. Heal good!":"Oh! I almost forgot. Here, take this. It’ll heal your injuries.") + "”</i> she says, grabbing a poultice from what appears to be a part of her scattered belongings strewn about the area. <i>“" + (!korgiTranslate() ? "Feel better. Okay, sleep now.":"Feel better, okay? I... sleep now.") + "”</i>");
	output("\n\nWith that she literally passes out before she’s even hit the ground with a soft <i>whump</i>, tongue poking out from her muzzle. You put what little of her clothes you can find over her. Leaving the korgonne girl in the relative safety behind you, you move on.\n\n");
	processTime(35);
	pc.orgasm();
	var poultice:HealingPoultice = new HealingPoultice();
	poultice.quantity = 2;
	quickLoot(poultice);
}

//[HyperDick]
//tooltip:Use your massive cock to satisfy her.
//invalid <48 inches:Your cock needs to be absurdly large for this.
//invalid no dick:Requires a penis.
public function hyperdiiiiick(x:int = 0):void
{
	clearOutput();
	showName("DRUGGED\nKORGONNE");
	showBust("KORG_DOSED");
	author("Wsan");
	output("<i>“Okay,”</i> you say, grinning" + (!pc.isCrotchExposed() ? " as you remove your [pc.crotchCovers]":"") + ". <i>“Try not to be </i>too<i> shocked.”</i>");

	output("\n\n" + (silly ? "<i>“Wwwwwoooow! Dat’s a lotta cock!”</i> she cries, clapping her hands to her little muzzle.":"<i>“Oh! Oh!”</i> she cries excitedly, planting her hands on your [pc.cockHead " + x + "].") + " <i>“" + (!korgiTranslate() ? "Alien so big and strong":"You’re so big and strong") + "!”</i>");
	output("\n\nYour [pc.cock " + x + "] lies before her, stiffly erect and hard as a rock. A cocky grin finds its way onto your face as the korgonne, overcome with lust and curiosity, rubs and paws at your massive cock. Titanic as it is, it’s clear she’s never seen anything like this in her life. Leaning forward, you pop the question.");
	output("\n\n<i>“So... want to try taking this inside you?”</i> you ask.");

	output("\n\n<i>“Yes!”</i> she responds immediately, head snapping up to meet your eyes but her hands continuing their idle exploration of your gigantic dick. <i>“Yesyesyes!”</i>");

	output("\n\nWith that she throws herself back on the ground and spreads her powerful legs as far as she can, giving you a nice eyeful of her beautifully wet and pink slit. You’ll have to remember how pristine and beautiful it is for later, because when you’re done with her she won’t be the same for a <i>while</i>. No need for foreplay, either - this is the ideal setup, given she’s already dripping with desire and arousal, giving you the ‘fuck me’ eyes over her fat breasts.");
	output("\n\nYou’re not one to keep a lady waiting. Carefully aligning your sizeable cockhead with her hot, eager cunt, you give just the slightest push and grin as you watch her arch her back, grabbing at her own nipples and moaning. This is gonna be new territory for her all the way.");
	output("\n\n<i>“Hooohhhh!”</i> she moans, lower back thumping against the ground as she ineffectually humps your dickhead. <i>“So big and thick! " + (!korgiTranslate() ? "Like! Love!":"I love it!") + "”</i>");
	output("\n\nYour expectations are exceeded when, with a surprised grunt and a tensing of your stomach, her needy vagina finally acquiesces and slips around your ");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED)) output("tapered tip");
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output("blunted flare");
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) output("nubby tip");
	else output("swollen tip");
	output(" with a wet <i>slrrch</i>. Femcum immediately squirts from her quivering cunt, her weakened walls desperately squeezing down on you with the rhythm of a massager. She <i>groans</i>, sounding for all the world like you’ve been fucking for a week.");
	pc.cockChange();
	output("\n\n<i>“-der,”</i> she moans, slowly and shakily raising her furred legs into the air while you lean in to catch what she’s saying. <i>“Harder... more...”</i>");
	output("\n\nYou <i>like</i> this shortstack hottie. After biting off more than she can chew and actually taking it in, she wants <i>more</i> of you. Luckily for her, more is exactly what you’ve got to give. The overwhelmingly large bump between her hips shifts as you raise your hips and roughly fuck into her, her feet shooting into the air and coming down to either side of your cock as she cries out in despairing ecstasy.");
	output("\n\n<i>“Oh! Oh, so good!”</i> she whines, her paws drawing closer to your cock until her soles touch the sides. <i>“" + (!korgiTranslate() ? "Give alien rub-rub as reward...":"Let me give you rubdown as a reward...") + "”</i>");
	output("\n\nTrue to her word, she begins to slowly rub you with her feet even as the shape of your dick bulges beneath her furred skin, distorting the shape of her body while you begin to fuck her in earnest. She might be small but fuck, she’s well-built to handle you - every inch of her is tight, warm, and just stretchy enough to feel like she’s wrapped around your member with love. It doesn’t seem like it’ll be hard for you to assuage her heat.");
	output("\n\nYou hold her and fuck her like that, with each of you working the other until sweat drips from your bodies and begins to pool beneath her arching back, her orgasms clustering closer and closer together as her breath catches in her throat. Tongue hanging from her muzzle, she throws her head back and lets out a strained, growling moan as her vaginal walls ripple around your pulsing cock, pulling you deeper whether by purpose or coincidence. Fresh femcum squirts down your cumvein anew, mixing with the sweat of your joining.");
	output("\n\n<i>“Cum,”</i> she moans half-incoherently, head twisting from side to side. <i>“Oh! Oh! Oh! Cum! Cum!”</i>");
	output("\n\nHer legs spread to the side once more as she plants herself firmly, bracing herself against the ground as you begin to pound her with your colossal cock, slamming into her body and wringing out yet more orgasms from deep within her broken-in pussy. You can feel orgasm rising within you with each thrust, subdued at first but surprising you with just how fast it builds, your own desire to soak this slutty beauty’s womb with your seed sending you into a frenzy.");
	output("\n\n<i>“Nnnnggh- fuck!”</i> you grunt, grabbing her wide, bountiful hips and thrusting yourself so deep you can <i>feel</i> her insides subserviently shift for you. <i>“Take it!”</i>");
	output("\n\n<i>“Yes! Yes!”</i> she cries out, looking down at her misshapen stomach. <i>“Fuck! Fuck! Yes!”</i>");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 5000) output("\n\nEnormous, gooey ropes of [pc.cum] spurt from your spasming prick as her clenching cunt welcomes it all, your cockhead brushing right up against her womb and filling it with your seed. She cries out in orgasm again and again, panting and moaning with the sustained effort of it all until at last, you free her from the bliss of servitude and slowly pull out.");
	else if(cumQ < 10000) output("\n\nAn enormous spurt of [pc.cum] splatters her womb as your spasming cock brushes against her cervix, forcibly ejaculating all over her innermost walls, drenching her in your seed. She groans as multiple orgasms wash over her all at once, rebounding and intensifying until she loses her voice and naught comes from her mouth but strained, wordless gasps of rapture. You pull out and note her stomach still bulges, but now with your virility instead of your cock.");
	else if(cumQ < 20000) output("\n\nHer womb is pumped full of [pc.cum] in an instant, her voice rising several octaves before breaking as she writhes in ecstasy below you, eyes wide. Orgasm after orgasm washes over her all at once, spurring her on while you dump so many loads inside her that you leave her stomach bulging out with your well-spent seed. By the time you pull out and lazily spurt spunk all over her shaking tits, the korgonne girl looks like she’s ready to give birth to several of your children right on the spot.");
	else if(cumQ < 40000) 
	{
		output("\n\nThe very first shot pumps her womb beyond capacity as she screams in orgasmic relief, quickly followed by a second gush inflating her to such an absurd degree her stomach balloons past her heaving tits. They’re pushed to the side as it rises and rises, her hands groping at her sheer-stretched skin until you grunt and pull out, rubbing yourself on her quivering form and drenching her from top to bottom in your essence.");
		output("\n\nShe’s still cumming even now, her brain being knocked about by multiple orgasms while her body catches up to the fact you’re not even fucking her. It takes several seconds before she stops howling in abject pleasure, her stomach very, <i>very</i> slowly receding. You’ve really done a number on her, though she did blatantly ask for it.");
	}
	else
	{
		output("\n\nAn excess of [pc.cum] noisily shoots back down your shaking shaft but far, far more of it pours into her womb and drenches her innermost walls in [pc.cumColor] seed. She howls in ecstasy, throwing her head back as her weakened pussy quivers and spasms around you while you dump load after load into her canal, her stomach rising with each and every pump of your behemoth cock.");
		output("\n\nThe semen inside her sloshes and gurgles as she swells with the sheer amount of it, her voluptuous titties falling to the side as her tummy protrudes so far she looks as though she might be about to give birth to full-grown leithans. You stay inside her, holding her down and mercilessly pumping her full as she cums over and over until she slowly begins to slip off your cock, her body bloated with your thick spunk. You don’t even pull out - she slides off on her own, crying out in pleasure.");
	}
	output("\n\nHer ridiculously-stretched cunt gapes after your exit, flexing and winking while semen ");
	if(cumQ < 5000) output("drools");
	else if(cumQ < 20000) output("pours");
	else output("gushes");
	output(" from deeper inside. The term <i>“well-used”</i> comes to mind immediately, though you suspect this girl in particular will recover like a champion.");
	output("\n\n<i>“So... good feeling...”</i> she moans quietly, her head falling back on the ground. <i>“Full and warm... th-kyu...”</i>");
	output("\n\nHer voice fades to a mumble as she just about falls asleep, then suddenly springs up from the ground with her eyes wide.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Almost forgot! Here! Alien take thing. Heal good!":"Oh! I almost forgot. Here, take this. It’ll heal your injuries.") + "”</i> she says, grabbing a poultice from what appears to be a part of her scattered belongings strewn about the area. <i>“" + (!korgiTranslate() ? "Feel better. Okay, sleep now.":"Feel better, okay? I... sleep now.") + "”</i>");
	output("\n\nWith that she literally passes out before she’s even hit the ground with a soft <i>whump</i>, tongue poking out from her muzzle. You put what little of her clothes you can find over her. Leaving the korgonne girl in the relative safety behind you, you move on.\n\n");
	processTime(35);
	pc.orgasm();
	var poultice:HealingPoultice = new HealingPoultice();
	poultice.quantity = 2;
	quickLoot(poultice);
}

//[69]
//tooltip:Help out the korgonne girl with your tongue while she tends to you.
public function sixtyNineKorg():void
{
	clearOutput();
	showName("DRUGGED\nKORGONNE");
	showBust("KORG_DOSED");
	author("Wsan");
	output("<i>“Alright,”</i> you say soothingly, pushing her down on the ground with a gentle hand. <i>“How about we both have some fun here?”</i>");
	output("\n\n<i>“Yes!”</i> she cries excitedly, wriggling underneath you as you reposition yourself above her. ");
	if(!pc.isCrotchExposed()) output("She tugs your [pc.crotchCovers] off in a second. ");
	if(pc.isHerm()) output("<i>“" + (!korgiTranslate() ? "Alien has both! Jealous...":"You have both?! I’m jealous.") + "”</i>");
	else if(pc.hasCock()) 
	{
		if(!korgiTranslate()) output("<i>“Oh! Alien " + (pc.biggestCockLength() > 11 ? "<b>big</b> ":"") + "cock!”</i>");
		else output("<i>“Oh! What " + (pc.biggestCockLength() > 11 ? "a <b>big</b> ":"an exotic") + " cock!”</i>");
	}
	else if(pc.hasVagina()) output("<i>“Oh! Pretty pussy...”</i>");

	output("\n\n");
	if(pc.isHerm()) output("Though you aren’t hard just yet, the korgonne girl below you quickly changes that. She sucks your [pc.cockHeadBiggest] like her life depends on it, head bobbing as she slurps and licks at you, her warm tongue bathing your " + (pc.balls > 0 ? "[pc.balls]":"shaft") + " every time it darts from her mouth. Your [pc.pussy] gets some much-needed attention too, two fingers stroking gently at your lips before she rubs your [pc.clits]. You’re stiff and groaning within a few seconds of her starting in on you.");	
	else if(pc.hasCock()) output("Though you aren’t hard just yet, the korgonne girl below you quickly changes that. She sucks your [pc.cockHeadBiggest] like her life depends on it, head bobbing as she slurps and licks at you, her warm tongue bathing your" + (pc.balls > 0 ? " [pc.balls]":" shaft") + " every time it darts from her mouth. She has you stiff as a fucking rock within a few seconds of starting in on you, murmuring approvingly around your throbbing length.");
	else if(pc.hasVagina()) output("It’s immediately obvious that this is <i>not</i> the first time the korgonne girl below you has had a partner with a pussy. She lightly sucks at your lips before parting your folds with her tongue, rubbing the tip along the inside of your entrance before pulling back and lapping at [pc.oneClit]. You hadn’t even realized you were holding your breath until it comes out in a low groan of satisfaction.");
	output("\n\n<i>Damn</i>, she is eager to please - you’re already falling behind here. Leaning down to attend to her, you clamp your hands around her thick inner thighs and pull them apart, revealing her pretty blue sex. She’s evidently <i>very</i> happy to have found you if the way her sodden slit squeezes, drips and clenches under the heat of your breath is any indication, her little clit pulsing almost imperceptibly in time with your exhales.");
	output("\n\nPutting your lips to hers, you softly lick her swollen labia only to be surprised when she suddenly tightens her grip on your waist, her plump ass rising off the ground and shaking as she squirts all over. This poor girl is so pent up you have to feel sorry for her but on the bright side, she’s going to feel amazing when you force all these orgasms out of her. Ducking back in, you set about doing just that.");
	output("\n\nIt’s hard to ignore the way she’s ");
	if(pc.isHerm()) output("blowing and fingering");
	else if(pc.hasCock()) output("blowing");
	else output("tonguing");
	output(" you with such attentiveness but you do your utmost best, each squirt of translucent femcum from her spasming cunt like a reward for your endurance. Soon she’s lewdly moaning into your groin while you fervently service her, ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("your [pc.tongue] snaking between her warm, quivering walls and stimulating her in ways she’s never known.");
	else if(pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) output("your [pc.tongue] licking her with a control and precision she’s never experienced.");
	else output("your [pc.tongue] lapping at her with all the depraved excitement of being stuck here with her.");
	output("\n\nYou’re not sure you’ve ever had such a <i>responsive</i> partner. She shudders violently with every lick, cumming uncontrollably while you taste her nectar-spurting honeypot. Her groans get lower and lower until she’s growling in her throat, but not for even a second does she halt her wet, sloppy work. She’s making almost as much of a mess of you as you are of her and at this point, you can hardly resist the rough ministrations of her tongue.");
	output("\n\n<i>“F-f-f-fuck,”</i> you grunt against her pussy, juice drooling down your chin. <i>“Cumming!”</i>");

	if(pc.isHerm()) 
	{
		output("\n\nYour throbbing, pulsing cock unloads in her");
		if(pc.biggestCockLength() < 6) output(" warm mouth");
		else if(pc.biggestCockLength() < 14) output(" tight little throat");
		else output(" unprepared stomach");
		output(" even as she roughly fingerfucks your [pc.pussy] to a violent, clenching orgasm that traps her little fingers inside while you let out a sated, bestial groan. The sensation of this korgonne girl bringing you to simultaneous orgasm has you humping and grinding at her face while she wrestles to keep control of you, keeping you firmly planted in her mouth and blowing your load while she greedily gulps it all down, slipping an encouraging finger into your [pc.asshole] and gently stroking your prostate just to drive you that little bit further.");
	}
	else if(pc.hasCock())
	{
		output("\n\nYour throbbing, pulsing cock unloads in her");
		if(pc.biggestCockLength() < 6) output(" warm mouth," + (pc.cumQ() > 500 ? " filling her cheeks to bulging with seed before she can swallow it down.":" pasting the insides of her cheeks with seed."));
		else if(pc.biggestCockLength() < 14) output(" tight little throat, her weak swallows imploring you to pump her full of [pc.cum]. You find yourself obliging her over and over with mounting groans of pleasure, the korgonne girl greedily drinking you down in your entirety.");
		else output(" unprepared stomach, your massive cock pumping her full of [pc.cum] as she gulps and swallows each and every load down your thrumming shaft. <i>Fuck</i>, she’s so good at this!");
	}
	else output("\n\nYou can’t stop yourself from " + (pc.isSquirter() ? "squirting":"cumming") + " all over her face, a low, shuddering groan escaping your lips as you involuntarily flex and clench around her roving tongue, femjuices spurting and dribbling across her sweaty cheeks. Sinking your fingertips into her ass, you raise your head and let out a deep, bestial moan of lust as she drinks of you, every bit as greedy as you yourself. Oh, stars, if you had the time to spend with her...");
	output("\n\nBy the time you’re done, you’re <i>done</i>. You separate from her with a great gasp, rolling over onto your back and panting, your [pc.chest] heaving with the effort. Aftershocks of pleasure still run through you, forcing you to arch your back until you find yourself sitting once more. Alongside you lies the korgonne, spreadeagled and looking about ready to drift off to sleep, finally satisfied.");
	output("\n\n<i>“So... good feeling...”</i> she moans quietly, her head falling back on the ground. <i>“So warm... th-kyu...”</i>");
	output("\n\nHer voice fades to a mumble as she just about falls asleep, then suddenly springs up from the ground with her eyes wide.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Almost forgot! Here! Alien take thing. Heal good!":"Oh! I almost forgot. Here, take this. It’ll heal your injuries.") + "”</i> she says, grabbing a poultice from what appears to be a part of her scattered belongings strewn about the area. <i>“" + (!korgiTranslate() ? "Feel better. Okay, sleep now.":"Feel better, okay? I... sleep now.") + "”</i>");
	output("\n\nWith that she literally passes out before she’s even hit the ground with a soft <i>whump</i>, tongue poking out from her muzzle. You put what little of her clothes you can find over her. Leaving the korgonne girl in the relative safety behind you, you move on.\n\n");
	processTime(35);
	pc.orgasm();
	var poultice:HealingPoultice = new HealingPoultice();
	poultice.quantity = 2;
	quickLoot(poultice);
}

//[Pass]
//tooltip:You don’t have time for this.
public function youDontHaveTimeForKorgiiNonsense():void
{
	clearOutput();
	showName("DRUGGED\nKORGONNE");
	showBust("KORG_DOSED");
	author("Wsan");
	output("Ignoring her, you move on and look further to where more combat might await. Her plaintive cries fade into the distance behind you.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}