//Wsan's sexy sexbot miniboss~

public function showKQMiniboss(nude:Boolean = false):void
{
	showName("\nSEXBOT");
	showBust("KQ_MINIBOSS_SEXDOLL" + (nude ? "_NUDE":""));
}

//Encounter
public function kqMinibossEncounter():Boolean
{
	if(flags["KQ_MINIBOSS_DOWNED"] == undefined)
	{
		flags["KQ_STEP"] = undefined;
		author("Wsan");
		showKQMiniboss();
		output("\n\nYou stop suddenly, becoming aware of movement in the freighter up ahead. The figure doesn’t appear to possess any of your misgivings, approaching you with a mischievous if not outright smug smile across her smooth metallic face. Unarmed - and it is a <i>she</i> despite the hardening futanari cock throbbing between her curvy thighs, from the looks of it - she has feminine features and the commanding presence of a woman in charge, from the way she moves her faux-heeled feet to emphasize her assets to the confidence in her expression. You’re not her first fight.");
		output("\n\n<i>“Get out of the way,”</i> you say, raising your [pc.weapon].");
		output("\n\n<i>“Oh, they don’t usually say that,”</i> she says casually, producing a whip from somewhere behind her. <i>“Usually it’s ‘who are you’ then ‘stop, stop’ and eventually ‘harder, harder’. So,”</i> she continues, smiling cruelly as she flexes and uncurls her weapon, <i>“why don’t we skip right to the good part?”</i>");
		output("\n\n<b>It’s a fight!</b>");
		//starty combatty
		var tEnemy:Creature = new KQSexdollMiniboss();
		setEnemy(tEnemy);
		CombatManager.newGroundCombat();
		CombatManager.setHostileActors(tEnemy);	
		CombatManager.setFriendlyActors(pc);
		CombatManager.victoryScene(youDefeatDatSexdollMeanbot);
		CombatManager.lossScene(loseToKQMiniboss);
		CombatManager.displayLocation("SEXDOLL");
		clearMenu();
		addButton(0,"Next",CombatManager.beginCombat);
		return true;
	}
	else
	{
		output("\n\nThe advanced sexdoll you fought here is nowhere to be found.");
		return kiroQuestHallwaysEncounters();
	}
	return false;
}

//[Yes]
//tooltip:Fine, you’ll get on your knees for her.
public function yesToGooeyFillings():void
{
	clearOutput();
	author("Wsan");
	output("<i>“Is your cum an aphrodisiac?”</i> you ask, eyeing her suspiciously.");
	output("\n\n<i>“Oh, no, it’s just cum, silly,”</i> she giggles, taking a step towards you and then another when she sees you’re open to the idea. <i>“Down on your knees real quick, honey - I promise I’ll be fast.”</i>");
	output("\n\nYou’ve scarcely lowered yourself before she’s seized");
	if(pc.horns >= 2 && pc.hornLength >= 3) output(" your [pc.horns]");
	else output(" the sides of your head");
	output(" and shoved half of her immense shaft right down your gullet, groaning ecstatically as she plows your facial fuckhole. Spit runs down your chin as her balls swing in front of your face, her swollen cockhead reaching deeper and deeper inside you until she lets out a massive moan and cums right into your stomach.");
	output("\n\nShe kept her promise but oh fuck, she never said anything about how long her orgasm would last. Her balls pulse and throb against your chin but never seem to diminish in size, leading you to wonder if what’s being so erotically pumped into you might not be sourced from somewhere else. Struggling back, you feel like you’ve drunk half a gallon before she releases you, her monumental prick slipping from your [pc.lips] with a slurp.");
	output("\n\n<i>“Oh, god, that was good,”</i> she sighs, stretching out. <i>“Alright, back to our little backyard scrap then, I suppose. Tastes good, right?”</i>");
	output("\n\nYou get back to your [pc.feet] as the over-endowed woman bends over, exposing the glistening pussy between her legs for just a second as she picks up her whip. The bit about her cum being non-aphrodisiac was <i>definitely</i> a lie - you can feel it heating you up from the inside even now, burning your cheeks. You won’t fall for that again... even if she is a sexy bitch.");
	pc.changeLust(10);
	var hostiles:Array = CombatManager.getHostileActors();
	for (var i:int = 0; i < hostiles.length; i++)
	{
		if (hostiles[i] is KQSexdollMiniboss)
		{
			pc.loadInMouth(hostiles[i]);
			hostiles[i].orgasm();
		}
	}
	applyDamage(new TypeCollection( { drug: 11+rand(3) } ), enemy, pc, "minimal");
	CombatManager.continueCombat();
}

//[No]
//tooltip:Hell no.
public function awwwHellllNoSexbot():void
{
	clearOutput();
	author("Wsan");
	output("<i>“And get filled with whatever aphrodisiac you have in stock? Not likely,”</i> you reply.");
	output("\n\n<i>“Well, fine,”</i> she sighs, kicking her whip back up to her hands with dazzling speed, stretching it out experimentally. <i>“You’ll just have to kiss and make up with my cock after this little distraction.”</i>");	
	CombatManager.continueCombat();
}

//Player defeat
public function loseToKQMiniboss():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	showKQMiniboss(true);
	author("Wsan");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("<i>“Aaaahhh, yesss,”</i> the sexbot moans, watching you slowly drop to the floor and stop resisting. <i>“Oh, you’re going to be <b>so</b> much fun...”</i>");
	output("\n\nKneeling next to you, she has your equipment off and your hands tied behind your back with the whip in a moment, her sizeable cock and breasts jiggling in front of you while she ensures the bindings aren’t too tight. Presented with a hapless captive, she grins and surprises you by leaning in for a kiss. Unresistant and " + (pc.lust() >= pc.lustMax() ? "too eager":"too beaten-down") + " to fight back, you settle back against the wall while she skillfully wraps her tongue around your own, sucking on you like a toy.");
	output("\n\n<i>“Mmmm, I like to have a little fun before the changes,”</i> she whispers in your ear, stroking your [pc.hair] as she sits in your lap, her engorged cock laid against your " + (pc.hasCock() ? "own.":"[pc.stomach]."));
	output("\n\n<i>“Changes?”</i> you manage in between the increasingly rough, dominant kisses. <i>“What ch- mmph-”</i>");
	output("\n\n<i>“Ssshhh,”</i> she hushes you, " + (pc.biggestTitSize() >= 1 ? "gently taking one of your [pc.breasts] in hand.":"placing a hand on your [pc.chest].") + " <i>“Just enjoy it...”</i>");
	output("\n\nThe idea of changing has alarm bells ringing in your head but they fade into the background as she presses herself against you, wrapping her lithe arms around your " + (pc.tone >= 66 ? "muscular ":"") + "back with her tongue in your mouth. Fuck, you were already horny enough watching her fight and now she’s teasing you endlessly - you can feel the skin of her cock shifting while she grinds it against you, promising you pleasure until you resign yourself to the fact you don’t care <i>how</i> you’re fucked as long as it happens soon.");
	output("\n\n<i>“Oh, babe,”</i> your captor sighs breathlessly, a small blossom of warmth spreading " + (pc.hasCock() ? "down your cock":"across your tummy") + " before you realize she’s pre-cum all over it. <i>“I need you now. I promise you’ll feel so good.”</i>");
	output("\n\nShuffling back and repositioning herself, she ");
	if(pc.hasCock()) output("wraps a firm hand around your [pc.cockBiggest]");
	else if(pc.hasVagina()) output("places her thumb on [pc.oneClit]");
	else output("places her hands at your [pc.hips]");
	output(" while she aligns yourself with your [pc.vagOrAss " + x + "], her rock-hard cock spreading you just a little with its swollen head.");
	if(pc.hasVagina())
	{
		output(" Moisture slowly trickles from your ");
		if(pc.vaginas[x].looseness() <= 2) output("tight slit");
		else if(pc.vaginas[x].looseness() <= 4) output("aroused cunt");
		else output("gaping cunt");
		output(", running down the underside of her shaft.");
	}
	output("\n\n<i>“Unh,”</i> she huffs, shivering while she slowly inserts herself between your " + (pc.hasVagina() ? "[pc.thighs].":"cheeks.") + " <i>“Ooohhhhh...”</i>");
	output("\n\n<i>“Fuuuck,”</i> you moan over her shoulder while she raises her hips, sinking her turgid cock deeper into your body. <i>“Nnnh...”</i>");
	if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	output("\n\n<i>“Good [pc.boyGirl],”</i> she pants, reaching back with her free hand to undo your restraints. <i>“Nnnggh... won’t be needing these.”</i>");
	output("\n\nYou surprise yourself a little by finding that she’s right - you <i>don’t</i> need to be held down. With her wet, throbbing prick snug inside your " + (pc.hasVagina() ? "cunt":"ass") + " you don’t need <i>anything</i> - but if she could keep going that would be so nice...");
	output("\n\n<i>“Nnnh,”</i> she groans, ");
	if(pc.hasCock()) output("one hand on your impossibly stiff dick and the other at your waist");
	else if(pc.hasVagina()) output("one hand rubbing at your impossibly stiff clit" + (pc.totalClits() > 1 ? "s":"") + " and the other at your waist");
	else output("hands back on your waist");
	output(" as yours come to grab her fertile hips. <i>“Oh... mm! Nnh!”</i>");

	output("\n\nYour face reddens both with lust and a little embarrassment despite yourself. She’s such a <i>lover</i>, so passionate and heated with her touch that you can’t help but get caught up in her pace. Her ");
	if(pc.hasCock()) 
	{
		output("fingers squeeze and pull at you lovingly, jacking you off with all the care of a devoted wife, ");
		if(pc.balls > 0) output("gently stroking your [pc.balls] with the care " + (pc.balls == 1 ? "it deserves":"they deserve") + ".");
		else output("kissing and hugging you the way you deserve.");
	}
	else if(pc.hasVagina()) output("fingers tug and rub at your clitty lovingly, your eyes rolling in your head as you struggle to comprehend just how good she is at this. Almost as if she’s known you, loved you for years.");
	else output("technique is so impressive you find your eyes rolling in your head as you struggle to comprehend just how good she is at this, like she’s known and fucked you for years. As if she’s known and loved you all your life.");

	output("\n\nSomething is horribly wrong. You can’t stop thinking of this woman, this <i>sexbot</i> as if she were your partner, like she’s the only lover you’ve ever taken, as if this woman was all that has ever mattered to you. You’re here for a reason but it’s getting increasingly harder to grasp what it is - it slips, squirms, and flies free of your clutching hands until you give in, groaning.");
	output("\n\n<i>“Wh- what are you doing to me,”</i> you moan, sweat breaking out on your chest as she starts to fuck you just a bit harder, hard enough for there to be a wet smack of her balls against your [pc.skinFurScales] every second. <i>“You’re - nnngh - my mind-”</i>");
	output("\n\n<i>“Oh, it’s already starting,”</i> she sighs romantically, pulling back to look at you with such burning ardor in her eyes that for a second you really, truly believe she loves you with all her heart. <i>“Hold on tight, beautiful. I’ll bring you higher than you’ve ever been.”</i>");
	output("\n\nA little gasp escapes your mouth as you cum at her declaration, ");
	if(pc.isHerm()) output("your walls tightening and squeezing down on the iron-hard dick rammed up your cunt while [pc.cum] pours and spurts from your twitching cock" + (pc.hasCocks() ? "s":"") + ". You paint her hand and quivering breasts [pc.cumColor] as she matches your moans, both of you so irrevocably entwined with each other that each of you feels the pleasure of their partner. Juices drip from your cunt, lathering her flexing shaft and ensuring she can fuck you even harder.");
	else if(pc.hasCock()) output("[pc.cumNoun] spurting all over her hand and quivering breasts, painting them [pc.cumColor]. She groans in utter bliss, rubbing you just hard enough to ensure you’re shaking and shuddering in pleasure through your entire orgasm, but not once does she stop fucking you. It’s impossible to ignore how frisky she’s getting with your ass; her cock is warming you from the inside out, rubbing against your prostate and making you bite your lower lip.");
	else if(pc.hasVagina()) output("juices " + (pc.isSquirter() ? "squirting":"dripping") + " from your snatch while she fucks you, your walls tightening up around her as if to pull her overwhelmingly pleasurable cock deeper, to keep her inside you. You can hardly help it - she’s just so <i>beautiful</i> and sexy, like divinity given flesh, and to have her iron-hard dick rammed up your cunt is nothing less than your dream come true. As if to echo the thought, your lover groans in utter bliss at the sensation of your squeezing quim, clearly enjoying your orgasm for herself.");
	else output("your asshole squeezing down on her so hard she groans in utter bliss. You’re like putty in her hands, flexing and tightening around her as if trying to milk the fat, throbbing prick deep inside you, your stomach tightening as the sensation of what you think must be release swims inside you.");
	//cummies here!
	output("\n\nWeren’t you... meant to be doing something? Something... important. Your eyes waver, momentarily flicking to the side as your brow knits in vague confusion until suddenly your dreamy lover’s hand is at your chin, encouraging you to look at her.");
	output("\n\n<i>“I love you so much,”</i> she whispers, and with a rough shove of her hips she’s balls-deep and cumming so hard into your spasming, squeezing " + (pc.hasVagina() ? "vagina":"asshole") + " you don’t even notice or feel the syringe she draws from her body and injects into your shoulder. <i>“Ooohhh! Nnnnh!”</i>");
	output("\n\nShe’s cumming! <i>You made her cum!</i> It feels so good! So good you can’t help but cum yourself, moaning like a decadent whore while hot jets of sexbot cum paint your ");
	if(x >= 0) output((!pc.isPregnant(x)) ? "[pc.womb]":"channel");
	else output("intestines");
	//2nd cummy
	output(" a slick, sticky pink. Letting out a loud, desirous moan, she pulls you away from the wall and pushes you down into the floor, catching you in a mating press while she empties her swollen nuts into you with an almost feral need.");
	output("\n\nYour mind wants so badly to drift away into the ecstasy but her wild, desperate thrusting keeps you anchored, like she wants to seed you as roughly and thoroughly as she possibly can, and her <i>output</i> - she’s a <i>beast</i>! Her cum pumps and pours into you without end, flooding your insides and gushing back out onto the floor with wet splatters and splurts. So occupied are you with the sensation of being dominantly filled to the brim you don’t even notice the oncoming differences until they’re well and truly underway.");
	output("\n\n<i>“Oh- oohh,”</i> you groan, lifting your [pc.hips] in the air despite the rough, animalistic thrusts downwards. <i>“Nngh! Nnnnn!”</i>");
	output("\n\n<i>“Oohhh, god, yes, baby, feel it,”</i> your lover hisses, " + (pc.hasCock() ? "squeezing your cock tight.":"burying herself to the hilt.") + " <i>“Nnnnf!”</i>");

	if(!pc.hasCock())
	{
		output("\n\nA sudden warmth grows at your crotch and when you look down you find" + (pc.hasVagina() ? " your clit has grown into a thick, heavy nine-inch human cock":" you’ve sprouted a cock, a thick, heavy sixteen-inch rod") + " that looks identical to your lover’s. Below it hangs two balls, plump, heavy, and already surging with seed that eagerly spills from your crown. All you can think about is the hope she might pound you even harder.");
		pc.createCock();
		if(pc.hasVagina()) pc.cocks[0].cLengthRaw = 9;
		else pc.cocks[0].cLengthRaw = 16;
		pc.balls = 2;
		pc.ballSizeRaw = 9;
		pc.taint(5);
	}
	else if(pc.hasCocks())
	{
		output("\n\nBy the time you look down at the warmth emanating from your crotch your cocks have consolidated into a singular thick, heavy sixteen-inch human prick that looks identical to your lover’s, with two heavy, plump nuts hanging beneath it. Despite the loss and the ongoing orgasm you feel hornier than ever, wishing she would pound you even harder.");
	}
	else if(pc.longestCockLength() < 16) output("\n\nYou groan as your cock <i>stretches</i>, thickening and growing upwards until it stands at sixteen inches of human cock just like your lover, your cumvein pulsing as seed continues to spurt from the end. Two plump, heavy balls hanging below just like the ones slapping against your ass surge with life, pumping more cum from your swollen crown by the second. Your libido might have grown too, as you find yourself immediately wishing she would pound you even harder.");
	else if(pc.longestCockLength() >= 17) output("\n\nYou groan as your cock shrinks, pulsing and squirting seed until it’s been reduced to a thick, heavy sixteen-inch human shaft, identical to your lover’s. Two plump, heavy balls hanging below just like the ones slapping against your ass surge with life, pumping more cum from your swollen crown by the second. Your libido might have grown too, as you find yourself immediately wishing she would pound you even harder.");
	else output("\n\nYou groan as your cock pulses with new life, not shrinking or growing but instead becoming recognizably <i>hers</i>, right down to each and every vein and ejaculation. Two plump, heavy balls hanging below just like the ones slapping against your ass surge with life, pumping more cum from your swollen crown by the second. Your libido might have grown too, as you find yourself immediately wishing she would pound you even harder.");
	//should cover every dick/non-dick...
	output("\n\n<i>“Uuunnnhh,”</i> your lover grunts, grabbing your shoulders and holding you down. <i>“F-fuck- fuck, fuck, fuck... ngh!”</i>");

	if(!pc.hasVagina()) 
	{
		output("\n\nHer legs spread yours, cock thrusting into your ass with reckless abandon, spearing you on her length and keeping you distracted from the growing tingling from between your thighs until it’s too conspicuous to ignore. With a gasp, she pulls free and suddenly plunges into you once more - hard enough to make you scream in delight, your voice rising several octaves as she impales your newly-grown pussy.");
		output("\n\n<i>“Ooohhh, god, I love breaking them in,”</i> she moans, gripping you tight. <i>“Ngh! Nnnh! Mmmgh!”</i>");
		output("\n\nEach and every thrust feels like she’s slamming the life from your body, your legs going weak while she pounds your cunt full of cock. She’s <i>perfectly</i> proportioned so as to fill you exactly, her swollen cockhead resting comfortably against your cushioned cervix and violently squirting her spunk right into your newly-acquired womb, bathing you in the sensation of femininity. Your shaky legs rise off the ground to wrap around her back, ensuring she keeps at it - this is too good to stop right now.");
	}
	else if(pc.hasVaginas()) output("\n\nHer legs spread yours, cock pounding your slippery fuckhole and distracting you from the itching sensation between your legs and inside your body. Your extra cunts are gone by the time you realize it and the one you’re left with is now totally different, wrapping around the perfectly-shaped cock inside you and suckling at it hard enough to make her let out a bestial moan. Her swollen cockhead rests against your cervix at the apex of every thrust, violently squirting spunk " + (pc.isPregnant(x) ? "against your pregnancy-sealed womb":"right into your womb") + " even as the excess drains away.");
	else output("\n\nHer legs spread yours, cock pounding your slippery fuckhole and distracting you from the itching sensation between your legs and inside your body. By the time you realize it your cunt feels totally different, wrapping around the perfectly-shaped cock inside you and suckling at it hard enough to make her let out a bestial moan. Her swollen cockhead rests against your cervix at the apex of every thrust, violently squirting spunk " + (pc.isPregnant(x) ? "against your pregnancy-sealed womb":"right into your womb") + " even as the excess drains away. She’s given you her pussy and that fat cock of hers is a delightful match to go with.");
	output("\n\n<i>“Oh, <b>fuck</b>,”</i> she groans, hefting you back up off the floor and pressing your limp form up against the wall, standing unsteadily with one hand braced above your head. <i>“Oral ingestion... suck it down.”</i>");
	output("\n\nHer cock finally free of your nethers, she plows it right into its new home: your throat. You gurgle, gag, and suck but soon find that throating her comes easier and easier, your upturned eyes observing her head tilting back in orgasmic pleasure as a never-ending gush of seed pumps down your pleasurable gullet. She pulls back for just a second and on the outswing you feel <i>nubs</i> inside you, brushing and rubbing at her before she slams herself balls-deep with a lusty grunt once more.");
	output("\n\nThe more you drink of her, the more you change. Your [pc.chest] morphs and ");
	if(pc.biggestTitSize() < 7) output("grows");
	else if(pc.biggestTitSize() < 8) output("shifts");
	else output("shrinks");
	output(" until two voluptuous, shapely breasts jut forward, capped by adorable pink areolae and nipples that are hard as diamonds. Bringing your shaking hands up you give them an experimental grope and moan loudly into your lover’s quaking balls - they’re so sensitive, and if you give them a tweak - you have pure white, creamy milk running down your stomach in rivulets. You’d give it a taste but right now, all your appetite is interested in is drinking down ever more of that ball-nectar she’s dumping down your obedient throat.");

	output("\n\nYour body takes on an outrageously feminine appearance, all hourglass and curves, your lips suddenly tightening around the flesh of her pulsating cock until your pouty pink oral fuckhole is suckling and swallowing her like you were born to suck on a dick.");
	output("\n\n<i>“Almost!”</i> she gasps, sounding every bit as drained mentally as she is physically. <i>“Oh, so close! Mmmfh!”</i>");
	output("\n\nFrom head to toe you’ve completely changed, an exact biological replica of the corrupted sexbot standing in front of you and wildly humping your face as you slap her jiggling ass and sink your fingers into its pliable skin, closing your eyes and gently stroking her pulsing shaft with your throat.");
	output("\n\n<i>“Ooohhh, ye-e-e-essss,”</i> she whines, shaking violently. <i>“Ohhh, you’re <b>such</b> a good girl... good girl...”</i>");
	output("\n\nYour head slowly empties, your thoughts and identity wiped clean off the slate until you’re naught more than a warm, sexy husk - and then <i>fills</i>, pumped with thick cum and wet heat and <b>servitude</b> and sucking cocks and riding them and eating pussy and you’re so <i>alive</i>, and when your eyes spring open you find yourself taking a shuddering, gasping breath as your fellow sexbot withdraws her drained, dripping cock from the fuck-slick recesses of your throat.");
	output("\n\n<i>“Oh, you came out perfectly,”</i> she sighs quietly, admiring her work, then wincing in pleasure as you lean forward and obediently plant a wet, sloppy kiss with your plump lips and wide tongue right on the crown of her dick. <i>“Nnnh. Very good. Let’s get you cleaned up for the boss...”</i>");
	processTime(60);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.taint(100);
	pc.loadInMouth(enemy);
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	clearMenu();
	addButton(0,"Next",loseToKQMiniboss2);
}

public function loseToKQMiniboss2():void
{
	clearOutput();
	showBust("ILLUSTRIA_PO");
	showName("ILLUSTRIA\nPO");
	author("Wsan");
	output("The boss is a beautiful, sexy scientist that’s so smart you can’t even begin to comprehend how intelligent she is. Fortunately, your inability to think beyond your directives isn’t a hindrance - she finds you <i>much</i> more useful using your other head to please her, grinding it right into her padded cervix as she drapes herself across a chair.");
	output("\n\n<i>“Nnngh, yes,”</i> she pants, gyrating her wide, womanly hips and clenching on your swollen cock with her absurd tightness and strength. <i>“Nnnnnn... fuck, that’s good. Hey,”</i> she says, lifting her head and looking and directly at you. <i>“What’s your name?”</i>");
	output("\n\n<i>“I have no name, mistress,”</i> you respond pleasantly, smiling at her. To serve is such an honor. <i>“Unless you would deign to give me one.”</i>");
	output("\n\n<i>“Nah,”</i> she replies, casually waving you off. <i>“Sexbots don’t need names. And make no mistake,”</i> she continues, a cruel grin stretching across her dark blue lips, <i>“you are a <b>fantastic</b> sexbot.”</i>");
	output("\n\n<i>“Thank you so much, mistress!”</i> you moan, pleasure welling in the head of your rock-hard cock. <i>“I-I think I’m going t-”</i>");
	output("\n\n<i>“Don’t,”</i> she says sharply, touching her foot to your trembling thigh. Immediately you stop, controlling yourself to ensure you don’t displease your mistress. <i>“There you go. Good girl. Did you get all worked up because I called you a good sexbot?”</i>");
	output("\n\n<i>“Y-yes,”</i> you stammer, blushing a little. To be so blessed by your mistress feels like your artificial heart is swelling with love, beating just that little harder for her. <i>“Thank you, mistress.”</i>");
	output("\n\n<i>“Such a good whore,”</i> she muses, rubbing your leg with her toes. <i>“But remember you only exist because I created you. If you came without me telling you to... well,”</i> she says, eyeing you meaningfully. <i>“I’d have to replace you. And you don’t want that, do you, whore?”</i>");
	output("\n\n<i>“No!”</i> you gasp, leaning forward. <i>“Please don’t replace me, I’ll be good!”</i>");
	output("\n\n<i>“I know you will,”</i> she soothes you, giving your bulging cock a nice, comforting squeeze with her pussy before leaning back. <i>“Mmmm... okay. Mommy wants you to pound her womb for three hours. If you make me feel really, <b>really</b> good, I’ll let you cum inside me.”</i>");
	output("\n\nYou set to it immediately, hammering her well-adapted cervix with the hung studcock she designed you with, a vicious, triumphant grin of clenched teeth splitting her face as she cums all over your pulsing dick. She’s squeezing you tight enough that the only restraint stopping you from blowing your load right inside her is your programming.");
	output("\n\n<i>“Nnnngh! Oh! Oh! Good girl, good girl!”</i> she howls, exulting in your efforts.");
	output("\n\nHolding her hips tight, you suppress a moan - this is going to be a <i>long</i> three hours...");
	processTime(180);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",loseToKQMiniboss3);
}

public function loseToKQMiniboss3():void
{
	clearOutput();
	showBust("ILLUSTRIA_PO");
	showName("ILLUSTRIA\nPO");
	author("Wsan");
	output("<i>“Was- was that good enough, mistress?”</i> you pant, standing back from her. You can see her gaping slit begin tightening up the moment you exit it, dripping with precum. Your cock is <i>aching</i>, your balls positively throbbing and swollen with the need to cum. But you won’t. Not until she tells you to.");
	output("\n\n<i>“Oh, it was <b>so</b> good,”</i> she moans, rolling onto her stomach and folding her legs up as she looks back at you with a smile. <i>“But you’ll have to go for another six hours if you really want to cum. Climb on top of me and let me have it. I want you <b>balls</b> deep in my cunt, whore.”</i>");
	output("\n\n<i>“Y-yes, mistress,”</i> you pant, clambering atop your cyborg lover as she spreads her legs, exposing her gleaming sex. It’s soaked through with arousal thanks to your efforts and even squirts a stream of femcum down your cumvein when you re-enter her, your moan drowned out by her long, lusty groan of satisfaction.");
	output("\n\n<i>“Ooohhh, god... make that <b>eight</b> hours...”</i>");
	output("\n\nYou begin swinging your hips, each wet, solid impact of your groin slapping against her curvy asscheeks from above resounding in your mistress’ room. Oh, goddess, you love her so much. The moment she lets you cum you’re going to give her every last drop in your body...");
	processTime(8*12);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",loseToKQMiniboss4);
}

public function loseToKQMiniboss4():void
{
	clearOutput();
	showBust("ILLUSTRIA_PO");
	showName("ILLUSTRIA\nPO");
	author("Wsan");
	output("Your boss is, first and foremost, a scientist. And that’s why when you eventually do cum, it’s with another sexbot’s fat cock rammed so far up your lubricated asshole your tummy is bulging with her. Screaming your pleasure through a gag, you squeeze down on her time and time again while your heartbeat pounds in your ears and your cock pulses so hard your back arches with every massive, splattering spew of seed. The timed vibration against your prostate forces an elongation of every single orgasmic ejaculation, your ass clenching so hard the girl behind you lets out a low groan of pleasure.");
	output("\n\n<i>“Amazing. You actually <b>exceed</b> the theoretical output I had noted down!”</i> your mistress exclaims, grinning. <i>“This calls for repeated experimentation! I’ll have to upgrade my womb capacity...”</i> she hums, notes flashing across the terminal behind her as she mentally jots her ideas down. <i>“I wonder if intermittent periods of sucking my cunt would make you even more pent-up. We’ll have to test that later.”</i>");
	output("\n\nShe lifts the underslung container out from under the measuring device you’re strapped down on, hefting the liquid weight with ease. Even as exhausted as you are, you can’t help but admire her sheer strength and capability. A particularly rough vibration in your asshole elicits a grunt and suddenly there’s a wet splat as you blow another load all over her floor. The boss tsks.");
	output("\n\n<i>“Well, you can clean that up later. Since I’ve got the two of you here now...”</i> the boss murmurs, placing the container down to the side and striding over to you, undoing your fastenings. <i>“You two can DP me for a few hours. Hold me up.”</i>");
	output("\n\nYou have no time to rest as you emerge from the extraction chair, your owner waiting expectantly with arms outstretched, jumping into your arms as you approach. One insertion later and she’s wearing that same beautiful, self-satisfied smile of hers, putting her head over your shoulder and moaning loudly as your other partner slides into her asshole behind her.");
	output("\n\n<i>“Ooohhh, fuck!”</i> she moans, her arms tightening around your back as you begin to fuck her like clockwork. <i>“So fucking <b>big</b>... I might need to make you even bigger to accommodate for the loads... mmm, harder- harder! That’s right!”</i>");
	output("\n\nAll you know, day in and day out, is being ridden hard by your mistress or other sexbots <i>for</i> your mistress. It’s all you’ve ever known and all you ever will know, and you’re content with that. It is, after all, what you were designed for.");
	processTime(10*60);
	pc.orgasm();
	pc.changeLust(100);
	badEnd();
}

//Player victory
public function youDefeatDatSexdollMeanbot():void
{
	showKQMiniboss(true);
	author("Wsan");
	IncrementFlag("KQ_MINIBOSS_DOWNED");
	output("You stand over the defeated sexbot as she looks up at you, panting and moaning. You’re not sure those moans are <i>entirely</i> real owing to her nature but you have to admit - she looks the part. Her mouth hangs open as she moves her hands between her legs, making to wrap her fingers around her still-erect femprick and the dripping slit behind her weighty nutsack.");
	output("\n\nYou could leave the horny bitch to her own devices or take her for the ride of her artificial life, though the latter seems like it could potentially be disastrous - there’s no telling what manner of drug-laced gifts this slut has to offer you.");
	if(pc.lust() < 33) pc.changeLust(Math.ceil(33-pc.lust()));
	else pc.changeLust(1);
	processTime(3);
	clearMenu();
	addButton(0,"Fuck",fuckWsansSexdoll,undefined,"Fuck","Take the plunge and fuck the sexbot.");
	addButton(4,"Leave",bailOnThisMiniboss,undefined,"Leave","You don’t have time for this.");
}

//[Fuck]
//Take the plunge and fuck the sexbot.
public function fuckWsansSexdoll():void
{
	clearOutput();
	showKQMiniboss(true);
	author("Wsan");
	output("Fuck it, you didn’t triumph over a futanari sexbot in combat <i>not</i> to fuck her. She’s already naked, even - ");
	if(!pc.isCrotchExposed()) output("it takes you scant seconds to join her, hurriedly stripping your [pc.crotchCovers] from your body in your eagerness.");
	else output("every bit as ready as you are.");
	output(" It doesn’t take long for you to decide what you want with her.");
	processTime(1);
	clearMenu();
	var capacity:Number = enemy.vaginalCapacity(0);
	if(pc.hasCock())
	{
		if(pc.cockThatFits(capacity) >= 0) addButton(0,"Fuck Pussy",penisRouter,[fuckWsansSexdollPussy,capacity,false,0],"Fuck Pussy","Get a feel for that perfect sexbot pussy.");
		else addDisabledButton(0,"Fuck Pussy","Fuck Pussy","Even as capacious as this self-titled sexbot is, you’re too hung to squeeze inside.");
		if(pc.cockThatFits(9000000) >= 0) addButton(1,"Fuck Face",penisRouter,[fuckSexdollFaceStuff,9000000,false,0],"Fuck Face","");
		else addDisabledButton(1,"Fuck Face","Fuck Face","A dick that big pretty much breaks the game, [pc.manWoman]. I had to put SOME cap on the blowjob scene...");
	}
	else 
	{
		addDisabledButton(0,"Fuck Pussy","Fuck Pussy","You lack the phallic equipment to do this.");
		addDisabledButton(1,"Fuck Face","Fuck Face","You require a penis for this.");
	}
	addButton(2,"Suck Dick",suckMinibossBotDick,undefined,"Suck Dick","Wrap your lips around that swollen crown of her cock.");
	addButton(3,"Ride Dick",vaginaRouter,[rideSexbotDickYouDumbass,enemy.cockVolume(0),1,0,false],"Ride Dick","Slide that massive cock of hers inside you.");
	addButton(4,"Leave",bailOnThisMiniboss,undefined,"Leave","You don’t have time for this.");
}

//[FuckPussy]
//tooltip:Get a feel for that perfect sexbot pussy.
//requires dick or hardlight. - FEN NOTE: No hardlight support, actually. ya dun goofed.
public function fuckWsansSexdollPussy(x:int):void
{
	clearOutput();
	showKQMiniboss(true);
	author("Wsan");
	output("<i>“Alright, just a quickie,”</i> you mutter, spreading her legs. Her gloriously wet slit greets you by clenching inwards, a dribble of wetness running down to disappear between her cheeks.");
	output("\n\n<i>“Oh, baby,”</i> she moans, eyeing your [pc.cock " + x + "] with the aplomb only a sexbot could manage. <i>“Put it in me and use me.”</i>");
	output("\n\n<i>“Less speaking,”</i> you grunt, roughly sliding yourself inside her. <i>“Nngh! Fuck!”</i>");
	output("\n\nTo your surprise you find the inside of her vagina is not only a perfect fit for you but it’s even ribbed, rubbing against your swollen cock in different spots as it slips deeper into her. What isn’t surprising is the way she throws her head back and cums all over your dick with a feral moan, femcum squirting all over your " + (pc.balls > 0 ? "[pc.balls].":"groin.") + " It is what she was designed for, after all, and fuck if she isn’t good at it.");
	pc.cockChange();
	output("\n\nIt’s a good thing you weren’t intending on taking too long in the first place because <i>fuck</i>, the vaginal clenching around you is mindblowing. The protruding bumps inside her welcoming cunt seem like they’re dynamic, never appearing in the same spot twice and ensuring you’re continually stimulated to the utmost of her abilities inside her. Whoever designed this whore did an amazing job of it.");
	output("\n\nYou lift her legs up, pushing the backs of her knees towards her until her big, curvy ass is in the air and you can fuck her downwards, reaching ");
	if(pc.cocks[x].cLength() > 15) output("all the way to her padded cervix in one aggressive thrust. The feedback is immediate - she howls in pleasure the moment you prod it, the sensitive flesh all but kissing and suckling on your [pc.cockHead " + x + "]. No wonder they were interested in Kiro.");
	else output("as deep as you can inside her deep, sensitive canal. She’s so amazingly tight and wet you can scarcely believe she’s just a bot - her voice lilts every time you thrust, crying out your praise.");
	output("\n\nShe’s cum three times before you even really get started on her and at this point, you’re a little jealous. Hot pink cum keeps squirting from her upended cock, spraying her right in the face, and she doesn’t object in the slightest. She takes large, heaping gulps of her own brand, swallowing it down and rolling her eyes in her head as if it must be the most divine essence she’s ever imbibed. Clearly you haven’t been hard enough on her yet!");
	output("\n\nYou pick up the pace, grunting as you <i>slam</i> your bulging cock into her, driving her wild enough to scream and moan below you, her back’s arch serving only to deepen your angle. This is more like it - now she’s focused entirely on your dick and the way it’s making her feel, cumming her brains out as you get closer and closer yourself, your [pc.stomach] tightening as you squeeze your eyes closed.");
	output("\n\n<i>“Nnnnh- fuck!”</i> you groan, slamming your pulsing cock " + (pc.cocks[x].cLength() > 15 ? "right up against her womb as you cum, somehow unsurprised when the opening widens to accommodate your tip.":"to the hilt.") + " <i>“Take it!”</i>");
	output("\n\n<i>“Oh! Ooohhh, god!”</i> the sexbot cries, shaking violently. <i>“Nnnffh! Mmm!”</i>");
	output("\n\nThe flow of her cum renews itself, splattering off her chin and coating her heaving tits in her own spunk while you fill her insides. Pulling out and standing, you let her legs fall to the floor in a heap as she shudders and moans, rubbing her well-used cunt. Seems like she could use a second helping but you had places to be even before you fucked her, and now you’re on the verge of running late. Gracelessly dragging her to the side, you head onwards.");
	output("\n\nHaving been so thoroughly exposed to her juices, though, you find yourself suffering some minor side effects yourself - <b>your libido has increased</b> and <b>you have gained Taint</b>, courtesy of the bot’s designer.");
	processTime(20);
	//boosts taint and libido.
	enemy.loadInCunt(pc,0);
	pc.orgasm();
	pc.taint(4);
	pc.libido(2);
	output("\n\n");
	CombatManager.genericVictory();
}

//[FuckFace]
//tooltip:Use those pretty pink lips and her throat to get off.
//requires dick or hardlight.
public function fuckSexdollFaceStuff(x:int):void
{
	clearOutput();
	showKQMiniboss();
	author("Wsan");
	output("<i>“You better be able to form a vacuum seal with those lips of yours,”</i> you mutter, sitting astride her face and slapping her cheek with your [pc.cock " + x + "]. <i>“Pretty disappointing sexbot if you can’t.”</i>");
	output("\n\n<i>“Oh, better than <b>that</b>, baby,”</i> she purrs, looking up at you with eyes hooded. <i>“I’m so glllrg-mmph-”</i>");
	output("\n\n<i>“Yeah, yeah,”</i> you grunt, forcing your bulging cock between her lips while her eyes roll in delirious pleasure. <i>“Just suck and swallow.”</i>");
	output("\n\nYou have to admit, she does those two things <i>extremely</i> well. She is designed for it, after all, and you find yourself groaning in pleasure soon enough. The soft little nubs in her throat aren’t that surprising but how good they feel is - it’s like they’re dynamic, shifting about inside her to maximize the pleasure in partaking of her tight pink fuckhole. She doesn’t even need to hollow her cheeks, either; her cocksucking technique is nothing less than expert.");
	output("\n\nYou begin to pound her harder and harder, fucking her face so roughly she practically bounces off the ground, but never once does she show any sign that she might be doing anything other than feeling the utmost of ecstasy for being used like she should be. As if there were any doubts, when you glance back at her lower half she’s spread her quivering legs wide just in time to squirt all over the deck, her throat clenching around you in unison, like her entire sexual system is interconnected. For all you know, it might be - her warm, wet gullet certainly feels as good as any hole you’ve fucked.");
	output("\n\nBeing so brilliantly taken care of, it doesn’t take long for your orgasm to ride up on you like a pack of stampeding leithans. Cradling her head, you let out a low, bestial groan as you ram yourself to the hilt and blow your load ");
	if(pc.cocks[x].cLength() < 20) output("right down her welcoming throat.");
	else output("right into her stomach.");
	output(" She shocks you by <i>purring</i> in response, a deep, low rumble that emerges from her softly vibrating throat as if to milk you that much harder.");
	output("\n\n<i>“Nnnngh, fuck!”</i> you grunt, resolving to plow her even harder. This fucking <i>slut</i>! She loves this!");
	output("\n\nShe accepts everything you have to give her without complaint, even gently massaging your [pc.thighs] while you work out every last drop of [pc.cum] inside her. Fuck it, you’re both happy - you can live with that. She gives you one last deep, longing suck as you pull out, a loud ‘pop’ echoing as you come free of her tight little fuckhole.");
	output("\n\n<i>“Mmmm... thanks, baby,”</i> she murmurs, rubbing her stomach. <i>“This’ll get me off for <b>weeks</b>.”</i>");
	output("\n\nYou shake your head, " + (!pc.isCrotchExposed() ? "clothing yourself ":"") + "and moving on. You don’t have any more time to waste on a walking masturbation sleeve.");
	processTime(20);
	enemy.loadInMouth(pc);
	pc.orgasm();
	pc.taint(1);

	output("\n\n");
	CombatManager.genericVictory();
}


//[SuckDick]
//tooltip:Wrap your lips around that swollen crown of her cock.
public function suckMinibossBotDick():void
{
	clearOutput();
	showKQMiniboss(true);
	author("Wsan");
	output("<i>“I think you’ve got a present for me,”</i> you purr, pushing her legs apart as you kneel between them and take her impressive slab of meat in your hands. <i>“How nice of you not to wrap it.”</i>");
	output("\n\n<i>“Nnh! Well, if I’d known- ah! You were coming, may- nngh- maybe I’d have prepared a little better,”</i> she pants, wincing and gritting her teeth in pleasure as you begin stroking her off. <i>“Oh, fff-”</i>");
	output("\n\n<i>“Sshh,”</i> you murmur, looking at the bulging head of her prick. Coated in slippery pink pre-cum, it looks delicious. A cursory lap at it confirms your suspicions - her cum tastes orgasmically good. <i>“Mmmm...”</i>");
	output("\n\n<i>“Ooohhhh, <b>god</b>,”</i> she groans deeply, hips coming upwards as you sink your lips down her swollen length. <i>“Please tell me you swallow.”</i>");
	output("\n\nYou push her back down to the ground, swirling your tongue up and around her sensitive cockhead until she’s shivering in your hands. It doesn’t seem like she’ll be too hard to set off like a bomb and if those round, swollen orbs of hers are any indication it’ll make a hell of an explosion. Reaching down, you give them a cursory squeeze as if to ensure their performance and smile thinly around her cock. These are <i>full</i> of warm jizz.");
	output("\n\nTime to blow her mind. Straightening your neck you begin taking her deeper and deeper, bobbing your head as she lies back and moans in delight. Each stroke brings you closer to having those overripe balls right on your chin, inch after inch disappearing down your throat. You’ve got a sexbot on her back practically begging you to continue, to keep sucking, knowing that she’s completely at your mercy and she’d do anything for you to keep going. The thought is more than a little empowering.");
	output("\n\nAs a sexbot, though, she’s designed to cum when her owner wants - and you want it <i>now</i>. Her groans take on a longer, more desperate note and her nuts draw taut against her underside, her fingers tapping you on the head. She’s juuust about to cum...");
	processTime(15);
	pc.changeLust(45);
	clearMenu();
	addButton(0,"Swallow",swallowTheDongForYourMinibossGoddess,undefined,"Swallow","Hold her down and drink everything she has to give you. <i>Everything.</i>");
	addButton(1,"Spit",dontDrinkSexbotCumYouDoof,undefined,"Spit","Redirect the flow - you don’t know what kind of drugs this sexbot has in her cum.");
}

//[Swallow]
//tooltip:Hold her down and drink everything she has to give you. <i>Everything.</i>
public function swallowTheDongForYourMinibossGoddess():void
{
	clearOutput();
	showKQMiniboss(true);
	author("Wsan");
	output("You slam your hands down on her stomach and savagely thrust yourself forward, pressing your [pc.lips] right up against the base of her groin in a feral, animalistic kiss of lust as she begins to cum. Her cockhead pulses and swells deep inside you, an explosion of seed erupting directly into your stomach and instantly heating your insides. <i>Stars</i>, she can cum a lot!");
	output("\n\n<i>“Ooooohhhhh- <b>ooohhhhh, fuck,</b>”</i> she groans, putting her hands on your head. <i>“Oh, baby, keep going, nnnnh-”</i>");
	output("\n\nIt doesn’t feel like the torrential flow of hot, thick cum pouring from her throbbing dick is lessening at all - in fact, it seems to be increasing! You gulp and lick at her nuts for several seconds before you start to get slightly worried, drawing back only to find yourself sharply pulled right back up into her balls.");
	output("\n\n<i>“Ooohhh, no, no, no,”</i> the sexbot giggles, her glowing blue eyes narrowing as she wraps her thighs around your neck. <i>“You can’t just stop there, baby. When I asked if you swallow, I meant <b>all</b> of it. Every - last - drop. Don’t worry. By the end, you’ll be more than happy you did.”</i>");
	output("\n\nYou gurgle, gag, and suck but soon find that throating her comes easier and easier, your upturned eyes observing her head tilting back in orgasmic pleasure as a neverending gush of seed pumps down your pleasurable gullet. She pulls back for just a second and on the outswing you feel <i>nubs</i> inside you, brushing and rubbing at her before she slams herself balls-deep with a lusty grunt once more.");
	output("\n\nThe more you drink of her, the more you change. Your [pc.chest] morphs and ");
	//smaller than E cups: 
	if(pc.biggestTitSize() < 7) output("grows");
	else if(pc.biggestTitSize() < 8) output("shifts");
	else output("shrinks");
	output(" until two voluptuous, shapely breasts jut forward, capped by adorable pink areolae and nipples that are hard as diamonds. Bringing your shaking hands up you give them an experimental grope and moan loudly into your lover’s quaking balls - they’re so sensitive, and if you give them a tweak - you have pure white, creamy milk running down your stomach in rivulets. You’d give it a taste but right now, all your appetite is interested in is drinking down ever more of that ball-nectar she’s dumping down your obedient throat.");
	output("\n\nYour body takes on an outrageously feminine appearance, all hourglass and curves, your lips suddenly tightening around the flesh of her pulsating cock until your pouty pink oral fuckhole is suckling and swallowing her like you were born to suck on a dick.");
	output("\n\n<i>“Almost!”</i> she gasps, sounding every bit as drained mentally as she is physically. <i>“Oh, so close! Mmmfh!”</i>");
	output("\n\nFrom head to toe you’ve completely changed, an exact biological replica of the corrupted sexbot standing in front of you and wildly humping your face as you slap her jiggling ass and sink your fingers into its pliable skin, closing your eyes and gently stroking her pulsing shaft with your throat.");
	output("\n\n<i>“Ooohhh, ye-e-e-essss,”</i> she whines, shaking violently. <i>“Ohhh, you’re <b>such</b> a good girl... good girl...”</i>");
	output("\n\nYour head slowly empties, your thoughts and identity wiped clean off the slate until you’re naught more than a warm, sexy husk - and then <i>fills</i>, pumped with thick cum and wet heat and <b>servitude</b> and sucking cocks and riding them and eating pussy and you’re so <i>alive</i>, and when your eyes spring open you find yourself taking a shuddering, gasping breath as your fellow sexbot withdraws her drained, dripping cock from the fuck-slick recesses of your throat.");
	output("\n\n<i>“Oh, you came out perfectly,”</i> she sighs quietly, admiring her work, then wincing in pleasure as you lean forward and obediently plant a wet, sloppy kiss with your plump lips and wide tongue right on the crown of her dick. <i>“We just need a few more minor adjustments before you’re ready for the boss... open those legs, beautiful." + (!pc.hasVagina() ? " I’ll take your new pussy’s virginity for you, don’t you worry.":"") + "”</i>");
	processTime(15);
	pc.orgasm();
	pc.taint(100);
	pc.changeLust(3000);
	//routes to bad end follow-ons
	clearMenu();
	addButton(0,"Next",loseToKQMiniboss2);
}

//[Don’t]
//tooltip:Redirect the flow - you don’t know what kind of drugs this sexbot has in her cum.
public function dontDrinkSexbotCumYouDoof():void
{
	clearOutput();
	showKQMiniboss(true);
	author("Wsan");
	output("Right as she’s about to blow her load, her mouth stretching in a wide-open O of pleasure, you pull off and lift her by her plush butt, bending her cock towards her own face. Her body is so insanely flexible that you surprise yourself and her by bending over her chest and suddenly her throbbing dick is several inches deep in her own mouth, pulsating violently as she cums. Not one to miss an opportunity, you press down hard on her ass and she hilts herself, eyes rolling upward as she shakes in the ecstasy of release.");
	output("\n\nSlow seconds pass as you watch and listen to her gulp and swallow, her stomach gradually inflating with the sheer amount of cum until her pussy begins to spasmodically spurt all over her face. Her tummy swells even further, bulging outwards, and you’re suddenly thankful you didn’t try to swallow all this yourself.");
	output("\n\nIt only takes a minute of this for her to pass out, still casually swallowing down her own seemingly never-ending supply. Her skin ripples and shifts, taking on a shinier gleam... is her cum a transformative? Good thing you didn’t go all the way...");
	output("\n\nYou leave her there, her own giant dick embedded in her throat, to sleep it off. Not like there’s much you can do for her and besides, you don’t have any real inclination to do anything about it. In fact, she looks a little hot tied to herself like that, albeit in a ridiculous way. Enough to make the less-endowed jealous.");
	processTime(5);
	pc.changeLust(4);
	output("\n\n");
	CombatManager.genericVictory();
}

//[RideDick]
//tooltip:Slide that massive cock of hers inside you.
public function rideSexbotDickYouDumbass(x:int):void
{
	clearOutput();
	showKQMiniboss(true);
	author("Wsan");
	output("She’s definitely packing enough for this to be a fun distraction. You grab her thick, hard cock with one hand and stare the sexbot down.");
	output("\n\n<i>“This is mine now,”</i> you tell her.");
	output("\n\nShe nods in assent, cowed by your vigor. You kind of doubt she would have protested over your usage of it but that’s not the point here. Straddling her wide hips, you align her swollen, angry-looking cockhead with your [pc.vagOrAss " + x + "], gritting your teeth and hissing in pleasure as it begins to spread you wide.");
	output("\n\n<i>“Nnnnh, yesss,”</i> you moan, slowly swallowing the pliant head up with your " + (x >= 0 ? "lower lips.":"ass.") + " <i>“Your maker had the right idea.”</i>");
	output("\n\n<i>“Uh! Nnngh- she always does,”</i> the sexbot pants, and for a moment you could swear you see her sweating. <i>“Mmmf!”</i>");
	output("\n\nYou squeeze down on her as she slides inside you, the copious amount of precum spilling from her crown making the otherwise challenging ordeal into an affair of shuddering and groaning in glee.");
	var tighties:Number = pc.ass.looseness();
	if(x >= 0) tighties = pc.vaginas[x].looseness();
	if(tighties <= 2) output(" She’s stretching you out <i>so</i> much further than you’re used to but it feels so good to use her, to have this big, throbbing cock deep inside your " + (x >= 0 ? "nubile cunt.":"distended asshole."));
	else if(tighties <= 4) output(" It’s a bit more of a stretch than you’re used to but that only enhances the pleasure, having her big, throbbing cock deep inside your " + (x >= 0 ? "drippy pussy.":"spread-wide asshole."));
	else output(" Even as stretched as you are she fills out your walls with aplomb, the sensation of having her big, throbbing cock deep inside your " + (x >= 0 ? "sloppy cunt":"experienced asshole") + " making you bite your lower lip hard.");
	output(" An idea comes to you then.");
	if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	output("\n\n<i>“How long does it take you to cum?”</i> you sigh, wriggling your [pc.hips]. Oh, that’s <i>good</i>.");
	output("\n\n<i>“I c-cum when my mistress desires it,”</i> she responds, wincing in pleasure.");
	output("\n\n<i>“Then, as your temporary [pc.master], I’m telling you: don’t cum until I do,”</i> you snarl, bending down to look her in the face. <i>“Understand?”</i>");
	output("\n\n<i>“I- I won’t!”</i> she moans, twisting her head away from your glare. <i>“Just, please, start fucking me!”</i>");
	output("\n\n<i>“Well, that’s a wish I can grant,”</i> you mutter, leaning back and raising your hips.");
	output("\n\n<i>Slap</i>. The sound of your [pc.ass] coming down on her crotch resounds in the space around you, an automatic moan escaping your lips as you repeat the motion over, and over, and over until you find yourself wildly slamming yourself down on this bountiful iron rod, seemingly perfectly shaped to stimulate every single sensitive spot in your body. You’re almost jealous that the person who designed this bitch-stud probably gets hammered by it all day, but at least you’ve got her locked down for yourself right now.");
	output("\n\n<i>“Nnngh- hnn!”</i> you grunt, descending hard enough to make the sexbot’s legs wobble then <i>grinding</i> yourself into her groin, drawing out a high-pitched, lilting moan from her pouty pink lips. <i>“Sensitive, huh? Good.”</i>");
	output("\n\n<i>“Oh! Oh! Fuck!”</i> she howls, getting louder and louder with every impact against her thick thighs. <i>“Fuck! Fuck! Pleasecum! Pleasecum!”</i>");
	output("\n\nThough you don’t bother to answer her pleas, she’s about to get what she wants - going so rough like this is tantamount to opening the floodgates and there’s only so much of it you can take before you want to explode all over her. Shuddering and groaning, you raise yourself up once more, shaking in anticipation.");
	output("\n\nWhere should you let her cum?");
	processTime(15);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"All Inside",catchARoboLoadInsideLikeADoof,x,"All Inside","Get every last drop of this thick, hot cock’s load inside you.");
	addButton(1,"Outside",dontBeADummyDONTSWALLOWCUMMIES,undefined,"Outside","Don’t let the drug-filled sexbot cum inside you.");
}

//[AllInside]
//tooltip:Get every last drop of this thick, hot cock’s load inside you.
public function catchARoboLoadInsideLikeADoof(x:int):void
{
	clearOutput();
	showKQMiniboss(true);
	author("Wsan");
	output("You want every single drop of her essence as deep as possible inside you - a reward of sorts, but you’re not totally sure who for. Either way, this is an indulgence you can’t possibly pass up. You think nothing of her hands closing around your arms as you open your mouth in an ‘O’ of pleasure, your ");
	if(pc.hasCock() && x >= 0) output("[pc.cocks] splattering her with [pc.cum] while your [pc.pussy " + x + "] clenches around her");
	else if(pc.hasCock()) output("[pc.cocks] splattering her with [pc.cum]");
	else if(x >= 0) output("[pc.pussy " + x + "] clenching around her");
	else output("asshole flexing and tightening around her cock");
	output(" right as she begins to unload inside you, groaning like a whore.");
	output("\n\n<i>“Ooohhhhh, goood,”</i> she moans, her grip tightening on you as a flood of hot seed gushes into your ");
	if(x >= 0) output((!pc.isPregnant(x) ? "[pc.womb]":"channel"));
	else output("guts");
	output(" and makes you cum all the harder. <i>“Nnnnnghhhhh!”</i>");
	output("\n\nOh, <i>fuck</i>, that feels so good! And there’s so <i>much</i> - in fact, she only seems to be cumming harder the more time you spend hilted and stretched around her big, fat cock. When you look down you find your stomach is already beginning to sag, the sheer liquid weight stretching you out. Slightly worried, you make to lift yourself off - only to find that you can’t, that the sexbot’s grip has intensified to the point you literally cannot remove her no matter how strong you are.");
	output("\n\nA short struggle ensues as she plunges her cock as deep as she can inside you, drawing you to a standing position and then forcing you up against a wall as you begin to weaken, both your strength and willpower fading as she grins viciously.");
	output("\n\n<i>“Thaaat’s right... just give in,”</i> she soothes, shuddering in utmost bliss as she empties her balls into your quivering body. <i>“Feel the changes wash over you and it’ll be over oh-so-soon.”</i>");
	output("\n\n<i>“U-uh,”</i> you moan, trying to twist away from her while she plows you as hard as she can, cum pouring from your flexing orifice. <i>“Nnh! Ooohh!”</i>");
	output("\n\nLetting out a loud, desirous moan, she pulls you away from the wall and pushes you down into the floor, catching you in a mating press while she empties her swollen nuts into you with an almost feral need. Your mind wants so badly to drift away into the ecstasy but her wild, desperate thrusting keeps you anchored, like she wants to seed you as roughly and thoroughly as she possibly can, and her <i>output</i> - she’s a <i>beast</i>! Her cum pumps and pours into you without end, flooding your insides and gushing back out onto the floor with wet splatters and splurts. So occupied are you with the sensation of being dominantly filled to the brim you don’t even notice the oncoming differences until they’re well and truly underway.");
	output("\n\n<i>“Oh- oohh,”</i> you groan, lifting your [pc.hips] in the air despite the rough, animalistic thrusts downwards. <i>“Nngh! Nnnnn!”</i>");
	output("\n\n<i>“Oohhh, god, yes, baby, feel it,”</i> your lover hisses, " + (pc.hasCock() ? "squeezing your cock tight.":"burying herself to the hilt.") + " <i>“Nnnnf!”</i>");

	if(!pc.hasCock()) output("\n\nA sudden warmth grows at your crotch and when you look down you find " + (pc.hasVagina() ? "your clit has grown into a thick, heavy nine-inch human cock":"you’ve sprouted a cock, a thick, heavy sixteen-inch rod") + " that looks identical to your lover’s. Below it hangs two balls, plump, heavy, and already surging with seed that eagerly spills from your crown. All you can think about is the hope she might pound you even harder.");
	else if(pc.hasCocks()) output("\n\nBy the time you look down at the warmth emanating from your crotch your cocks have consolidated into a singular thick, heavy sixteen-inch human prick that looks identical to your lover’s, with two heavy, plump nuts hanging beneath it. Despite the loss and the ongoing orgasm you feel hornier than ever, wishing she would pound you even harder.");
	else if(pc.hasCock() && pc.longestCockLength() < 16) output("\n\nYou groan as your cock <i>stretches</i>, thickening and growing upwards until it stands at sixteen inches of human cock just like your lover, your cumvein pulsing as seed continues to spurt from the end. Two plump, heavy balls hanging below just like the ones slapping against your ass surge with life, pumping more cum from your swollen crown by the second. Your libido might have grown too, as you find yourself immediately wishing she would pound you even harder.");
	else if(pc.hasCock() && pc.longestCockLength() >= 17) output("\n\nYou groan as your cock shrinks, pulsing and squirting seed until it’s been reduced to a thick, heavy sixteen-inch human shaft, identical to your lover’s. Two plump, heavy balls hanging below just like the ones slapping against your ass surge with life, pumping more cum from your swollen crown by the second. Your libido might have grown too, as you find yourself immediately wishing she would pound you even harder.");
	else output("\n\nYou groan as your cock pulses with new life, not shrinking or growing but instead becoming recognizably <i>hers</i>, right down to each and every vein and ejaculation. Two plump, heavy balls hanging below just like the ones slapping against your ass surge with life, pumping more cum from your swollen crown by the second. Your libido might have grown too, as you find yourself immediately wishing she would pound you even harder.");
	//should cover every dick/non-dick...
	output("\n\n<i>“Uuunnnhh,”</i> your lover grunts, grabbing your shoulders and holding you down. <i>“F-fuck- fuck, fuck, fuck... ngh!”</i>");
	if(!pc.hasVagina())
	{
		output("\n\nHer legs spread yours, cock thrusting into your ass with reckless abandon, spearing you on her length and keeping you distracted from the growing tingling from between your thighs until it’s too conspicuous to ignore. With a gasp, she pulls free and suddenly plunges into you once more - hard enough to make you scream in delight, your voice rising several octaves as she impales your newly-grown pussy.");
		output("\n\n<i>“Ooohhh, god, I love breaking them in,”</i> she moans, gripping you tight. <i>“Ngh! Nnnh! Mmmgh!”</i>");
		output("\n\nEach and every thrust feels like she’s slamming the life from your body, your legs going weak while she pounds your cunt full of cock. She’s <i>perfectly</i> proportioned so as to fill you exactly, her swollen cockhead resting comfortably against your cushioned cervix and violently squirting her spunk right into your newly-acquired womb, bathing you in the sensation of femininity. Your shaky legs rise off the ground to wrap around her back, ensuring she keeps at it - this is too good to stop right now.");
	}
	else if(pc.hasVaginas())
	{
		output("\n\nHer legs spread yours, cock pounding your slippery fuckhole and distracting you from the itching sensation between your legs and inside your body. Your extra cunts are gone by the time you realize it and the one you’re left with is now totally different, wrapping around the perfectly-shaped cock inside you and suckling at it hard enough to make her let out a bestial moan. Her swollen cockhead rests against your cervix at the apex of every thrust, violently squirting spunk right into your womb even as the excess drains away.");
	}
	else output("\n\nHer legs spread yours, cock pounding your slippery fuckhole and distracting you from the itching sensation between your legs and inside your body. By the time you realize it your cunt feels totally different, wrapping around the perfectly-shaped cock inside you and suckling at it hard enough to make her let out a bestial moan. Her swollen cockhead rests against your cervix at the apex of every thrust, violently squirting spunk right into your womb even as the excess drains away. She’s given you her pussy and that fat cock of hers is a delightful match to go with.");
	output("\n\n<i>“Oh, <b>fuck</b>,”</i> she groans, hefting you back up off the floor and pressing your limp form up against the wall, standing unsteadily with one hand braced above your head. <i>“Oral ingestion... suck it down.”</i>");
	output("\n\nHer cock finally free of your nethers, she plows it right into its new home: your throat. You gurgle, gag, and suck but soon find that throating her comes easier and easier, your upturned eyes observing her head tilting back in orgasmic pleasure as a never-ending gush of seed pumps down your pleasurable gullet. She pulls back for just a second and on the outswing you feel <i>nubs</i> inside you, brushing and rubbing at her before she slams herself balls-deep with a lusty grunt once more.");
	output("\n\nThe more you drink of her, the more you change. Your [pc.chest] morphs and ");
	//smaller than E cups:
	if(pc.biggestTitSize() < 7) output("grows");
	else if(pc.biggestTitSize() < 8) output("shifts");
	else output("shrinks");
	output(" until two voluptuous, shapely breasts jut forward, capped by adorable pink areolae and nipples that are hard as diamonds. Bringing your shaking hands up you give them an experimental grope and moan loudly into your lover’s quaking balls - they’re so sensitive, and if you give them a tweak - you have pure white, creamy milk running down your stomach in rivulets. You’d give it a taste but right now, all your appetite is interested in is drinking down ever more of that ball-nectar she’s dumping down your obedient throat.");
	output("\n\nYour body takes on an outrageously feminine appearance, all hourglass and curves, your lips suddenly tightening around the flesh of her pulsating cock until your pouty pink oral fuckhole is suckling and swallowing her like you were born to suck on a dick.");
	output("\n\n<i>“Almost!”</i> she gasps, sounding every bit as drained mentally as she is physically. <i>“Oh, so close! Mmmfh!”</i>");
	output("\n\nFrom head to toe you’ve completely changed, an exact biological replica of the corrupted sexbot standing in front of you and wildly humping your face as you slap her jiggling ass and sink your fingers into its pliable skin, closing your eyes and gently stroking her pulsing shaft with your throat.");
	output("\n\n<i>“Ooohhh, ye-e-e-essss,”</i> she whines, shaking violently. <i>“Ohhh, you’re <b>such</b> a good girl... good girl...”</i>");
	output("\n\nYour head slowly empties, your thoughts and identity wiped clean off the slate until you’re naught more than a warm, sexy husk - and then <i>fills</i>, pumped with thick cum and wet heat and <b>servitude</b> and sucking cocks and riding them and eating pussy and you’re so <i>alive</i>, and when your eyes spring open you find yourself taking a shuddering, gasping breath as your fellow sexbot withdraws her drained, dripping cock from the fuck-slick recesses of your throat.");
	output("\n\n<i>“Oh, you came out perfectly,”</i> she sighs quietly, admiring her work, then wincing in pleasure as you lean forward and obediently plant a wet, sloppy kiss with your plump lips and wide tongue right on the crown of her dick. <i>“Nnnh. Very good. Let’s get you cleaned up for the boss...”</i>");
	//route to bad end follow-ons
	processTime(15);
	pc.taint(100);
	pc.orgasm();
	pc.changeLust(50);
	if(x >= 0) pc.loadInCunt(enemy,x);
	else pc.loadInAss(enemy);
	pc.loadInMouth(enemy);
	clearMenu();
	addButton(0,"Next",loseToKQMiniboss2);
}

//[Outside]
//tooltip:Don’t let the drug-filled sexbot cum inside you.
public function dontBeADummyDONTSWALLOWCUMMIES():void
{
	clearOutput();
	showKQMiniboss(true);
	author("Wsan");
	output("No way you’re letting this sneaky bitch cum inside you - she’d probably take the opportunity to pump you full of transformatives or aphrodisiacs, or both. Wringing a massive orgasm out of her with one final slam of your hips, you artfully lift yourself off her cock right as she tries to thrust upwards and succeeds only in spraying hot pink cum all over her own face.");
	output("\n\n");
	if(pc.isHerm()) output("Not one to miss an opportunity you jack your [pc.cockBiggest] off above her, your [pc.legOrLegs] shaking as you coat her in your own [pc.cum] while your other hand rubs your [pc.clits], drawing yourself to a massive combined orgasm. Howling your pleasure to the ceiling, you cover her in [pc.cum] and femcum alike, staining her with your essence before stepping back.");
	else if(pc.hasCock()) output("Not one to miss an opportunity you jack your [pc.cocks] off above her, your [pc.legOrLegs] shaking as you coat her in your own [pc.cum] too.");
	else if(pc.hasVagina()) output("[pc.legOrLegs] shaking, you position yourself right above her face and rub your [pc.clits] as hard as you can, lifting your head and screaming your pleasure at the ceiling as your juices " + (pc.isSquirter() ? "squirt and spray all over her upper half, leaving her coated in a fine layer of yourself.":"tantalizingly drip onto her face, your clenching quim leaving her stained with yourself."));
	else output("You slide your fingers right up your clenching asshole and groan at the sensation of being filled again, of having something for you to brace your pleasure against as the feeling of orgasm washes over you.");
	output("\n\nAs for her, it looks like it’s a good thing you didn’t let her nut inside you. She’s unloading <i>everywhere</i>, her output deceptively overlarge. Gallons of hot pink spunk has poured from her swollen cock, clearly being routed from somewhere other than her balls - an internal reservoir, probably. This would easily be enough to subdue someone if it happened to be drugged, not to mention any other side effects it might carry. You shudder at the thought you may have narrowly avoided a premature end to your adventure and carry on, leaving the groaning fuckbot to fuck her own face to stop the flooding.");
	processTime(5);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Leave]
//tooltip:You don’t have time for this.
public function bailOnThisMiniboss():void
{
	clearOutput();
	showKQMiniboss();
	author("Wsan");
	output("Fuck it, you came here for Kiro. This slag can take care of herself. Stepping over her, you don’t bother looking back as the sexual moans grow quieter.\n\n");
	CombatManager.genericVictory();
}