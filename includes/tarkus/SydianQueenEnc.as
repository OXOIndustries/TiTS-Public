//SYDIAN_QUEEN_STAGE==5 disables encounter
public function sydianQueenIntroRedux():void
{	
	clearOutput();
	clearMenu();
	author("Nonesuch");
	showBust("SYDIAN_QUEEN","RASK_TRAP","RASK_TRAP","RASK_TRAP");
	showName("SYDIAN\nQUEEN");
	
	output("Once again you find yourself in the bizarre forest of gigantic rust pillars, relics of some grand industrial past slowly crumbling away in the breeze. You already know what to expect around here, and so remain relatively calm when you hear a plasma pistol being cocked behind you. The ball-swollen raskvel femboys that emerge out of the debris around you are still armed to the teeth, but they’re relaxed. They smirk at you and whisper in each other’s floppy ears until their orange, hourglass-figured leader sweeps grandly into view, feathers swishing.");
	
	//Never sexed or Sexed only once
	if((flags["SYDIAN_QUEEN_STAGE"]==undefined || flags["SYDIAN_QUEEN_STAGE"]==1))
	{
		if (flags["SYDIAN_QUEEN_LUBBIN"] != undefined||flags["RASKVEL_HAREM_SPITROAST"] != undefined)output("\n\n<i>“You again?”</i> the Sydian Queen asks coolly, sceptre tapping in her hand. <i>“What possible reason would you have to try my patience by trespassing in our territory once more? Especially without your giant fish friend this time.”</i> She smirks, eyeing you up. <i>“Perhaps you come because you enjoyed serving me, hmm? You were certainly an enjoyable treat last time.”</i> The sceptre taps a slow rhythm against the armored curve of her hip. <i>“I would allow you back in my court... for a little while. What say you?”</i>");
		else output("\n\n<i>“You again?”</i> the Sydian Queen asks coolly, sceptre tapping in her hand. <i>“What possible reason would you have to try my patience by trespassing in our territory once more? Especially without your giant fish friend this time.”</i> She clicks her tongue, eyeing you up. <i>“Perhaps you’re here because you wish to serve, hmm? You would make an acceptable treat for my harem...”</i> There is a sharp intake of breath around her, and the persistent whispering gets even more excited. <i>“...or perhaps even for me.”</i> She smiles thinly. The sceptre taps a slow rhythm against the armored curve of her hip. <i>“What say you?”</i>");
		
		processTime(3);
		if(flags["SYDIAN_QUEEN_STAGE"] == undefined)flags["SYDIAN_QUEEN_STAGE"] = 1;
		
		//Buttons
		if (flags["SYDIAN_QUEEN_LUBBIN"] == undefined&&flags["RASKVEL_HAREM_SPITROAST"] == undefined) addButton(0,"Yes",sydianQueenChoice,0,"No","Agree to serve her. It sounds like it could be fun.");
		else addButton(0,"Yes",sydianQueenChoice,0,"Yes","Agree to serve her. You know it will be fun.");
		addButton(1,"No",sydianQueenChoice,1,"No","Politely turn her down for now.");
		addButton(2,"Never",sydianQueenChoice,2,"Never","Absolutely refuse to serve her.");
	}
	//Said no during first stage
	else if(flags["SYDIAN_QUEEN_STAGE"] == 4)
	{
		output("\n\n<i>“Again I find you trespassing, stranger from the sky,”</i> the Sydian Queen observes. There’s not even a flicker of humor on her face. <i>“This time, there shall be no coy refusals, no mischievous flicks of the skirt. You either leave and never come back, on pain of death, or... you serve one of my consort. If you do that, I shall consider your honor evened.”</i>");
		output("\n\nThere’s an immediate uptick in furious, excited whispering amongst the girly raskvel surrounding you.");

		addButton(0,"Serve",sydianQueenChoice,3,"Serve","You suspect this will involve your mouth.");
		addButton(1,"Never",sydianQueenChoice,2,"Never","Absolutely refuse to serve her.");
	}
	else if(flags["SYDIAN_QUEEN_STAGE"] == 2)	
	{	
		output("\n\n<i>“Ah. My good servant from the sky,”</i> the Sydian Queen says with a buzzing lilt. She smiles at you with munificent pleasure. <i>“Have you come to present yourself as a treat? My court does enjoy your little visits so.”</i>");
		output("\n\nThe raskvel bois await your response with baited breath.");
		
		addButton(0,"Yes",sydianQueenChoice,5,"Serve","Serve your queen.");
		addButton(1,"No",sydianQueenChoice,4,"No","Eh, not right now.");
	}
	else if(flags["SYDIAN_QUEEN_STAGE"] == 3)	
	{
		output("<i>“My most favored servant,”</i> the Sydian Queen says with a lovely, beaming smile when she catches sight of you, touching her armored breastplate. Stricken by a sudden impulse, you genuflect in front of her, directing your gaze to her immaculate, armored feet. Hell yeah it’s corny, but it also feels inescapably right, honoring your queen, particularly when it draws a buzzing purr of pleasure out of her.");
		output("\n\n<i>“It is a treat to have you, and have you as a treat we shall,”</i> she pronounces, lust thickening her brisk tones. <i>“Come, servant. I desire to see your youthful, fertile flesh in action again.”</i>");

		if(pc.hasPerk("Peace of Mind"))
		{
			output("\n\nYou live to serve and give pleasure, and it never crosses your peaceful mind to do anything other. You happily follow the Sydian’s swishing tail.");
			addButton(0,"Next",sydianQueenSexyTimes);
		}
		else
		{
			if (pc.WQ() < 40)output("\n\nIt’s your instinct now to immediately obey, and it’s a struggle not to do so.");
			else output("\n\nIt’s a test of your iron fortitude not to immediately obey. Is... is there perhaps some danger here you’re not seeing?");
			addButton(0,"Smash",sydianQueenSexyTimes,undefined,"Smash","Serve your queen.");
			addButton(1,"Not Today",sydianQueenChoice,7,"Not Today","Danger, Will Robinson!");
		}
	}
	
	sydianQueenCooldownMinutes(90);
}

/*public function sydianButtons():void
{
	clearOutput();
	clearMenu();
	addButton(0,"Yes",sydianQueenChoice,5,"Serve","Serve your queen.");
	addButton(1,"No",sydianQueenChoice,4,"No","Eh, not right now.");
}	*/
public function sydianQueenCooldownMinutes(nMins:int = 90):void
{
	pc.createStatusEffect("Sydian Queen Cooldown", 0, 0, 0, 0, true, "", "", false, 0);
	pc.setStatusMinutes("Sydian Queen Cooldown", nMins);
}
public function sydianQueenChoice(sceneChoice:int):void
{
	clearOutput();
	clearMenu();
	author("Nonesuch");
	showBust("SYDIAN_QUEEN","RASK_TRAP","RASK_TRAP","RASK_TRAP");
	showName("SYDIAN\nQUEEN");

	//Stage 1 Yes
	if (sceneChoice==0)
	{
		if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.hasPerk("Peace of Mind")) output("You giggle and bounce a little to signal your assent.");
		else output("You grin your assent.");
		output(" Yeah, you’ll happily... serve.");
		output("\n\n<i>“Excellent!”</i> replies the Sydian breezily. She waves her sceptre with practiced grandness. <i>“To the pleasure barrow, my consort!”</i>");
		
		processTime(1);
		if(flags["SYDIAN_QUEEN_SEXCOUNT"]==undefined) flags["SYDIAN_QUEEN_SEXCOUNT"]= 0;
		
		addButton(0, "Next", sydianQueenSexyTimes);
	}
	//Stage 1 No
	if (sceneChoice==1)
	{
		output("Politeness comes naturally to a refusal when you’re surrounded by armed goons, however adorable they may be.");
		output("\n\n<i>“Do you believe that by merely watching your tone with me you can come and go from my lands as you wish, alien?”</i> replies the sydian with an imperious laugh. She wags her sceptre. <i>“Go, for now. Next time I find you blithely trespassing, though - you shall have to prove your fealty to me. Or face the consequences.”</i>");
		output("\n\nYou head back out of the rust spires, back of your neck crawling at the thought of those plasma pistols trained on you. Maybe next time it would be wise to do what she wants, or never come back again.");
		
		processTime(1);
		flags["SYDIAN_QUEEN_STAGE"]=4;
		flags["SYDIAN_QUEEN_SEXCOUNT"]= 0;
		
		addButton(0,"Leave",mainGameMenu);
	}
	//Stage 1 Never
	if (sceneChoice==2)
	{
		output("<i>“Then never let your shadow fall upon this land again!”</i> thunders the sydian. In a split second, all of the raskvel’s plasma weapons are up and pointed at you. <i>“I shall have you slain immediately if you do so, rather than tortured to death, for I am a beneficent queen! Now be off with you!”</i>");
		output("\n\nYou back off as slowly and calmly as you can. You make a mental note to give the giant rust pillars a very wide berth in future.");
		
		processTime(1);
		flags["SYDIAN_QUEEN_STAGE"]=5;
		
		addButton(0,"Leave",mainGameMenu);
	}
	//Stage 4 No then Yes
	if (sceneChoice==3)
	{	
		var shrooms:ItemSlotClass = new SpunkShroom(); shrooms.quantity = 2 + rand(3);
		if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.hasPerk("Peace of Mind")) 
		{
			output("The conversation has frankly been a bit of a blur for you ever since you caught sight of the raskvel bois’ heavily swollen sacks, crying out for some caring someone to relieve it of all its delicious pressure. The fact that it’s in aid of allowing everyone present to leave happy is just the cherry on top."); 
			output("\n\n<i>“Come on then, sugar,”</i> you smile brightly, licking your [pc.lips] and [pc.moving] forward. <i>“Let me show you how my people say hello!”</i>");
		}
		else 
		{	
			output("If it’ll get them to stop waving their pistols at you whenever you come here... fine. Whatever.");
			output("<i>“Ok,”</i> you sigh, [pc.moving] forward. <i>“Let’s get this over with.”</i>");
		}
		
		output("\n\n<i>“Azaphel,”</i> the cockroach matriarch says, with a brisk tap of her sceptre, <i>“my most loyal servant. You may go relieve yourself in the interloper’s mouth. They are not forgiven unless it is wonderful for you.”</i>");
		output("\n\nAzaphel is almost trembling with excitement, eyes fixed on you, his cute little mouth slightly ajar as you ");
		if(pc.isBiped()) output("kneel");
		else output("get down");
		output(" in front of his tenting loin cloth. ");
		if(pc.tallness <= 5*12+5) output("Fortunately you’re of a similar stature - you’re definitely better suited to doing this than Azra.");
		else if(pc.tallness <= 7*12) output("It’s difficult cramping yourself up to get at the diminutive alien’s cock - but he’s excited enough to get up onto his splayed toes, anything to get closer to the heavenly relief of your mouth.");
		else output("It’s practically impossible for a being of your size to get at the diminutive alien’s cock, humiliating. You have to lie down on one side, and even then he has to get up onto his splayed toes to be level with your mouth.");
		output("\n\nHe rips off his cloth with a fluttering, impatient groan, revealing a gleaming, six inch purple erection straining out of its sheath. It’s a hefty dick on a boy bitch his size, but it’s like a splinter compared to the balls it’s flanked by; bulging testicles that practically drag on the ground, rising and falling impatiently in their over-stretched sack. You feel a little flair of sympathy for the raskvel and his fellows - those, paired with their natural libido, must make day-to-day life pretty unbearable.");
		output("\n\nYou give him an encouraging grin and wrap your hand around the base of his shaft, giving the smooth, hard flesh a couple of brisk tugs before spreading your lips over the musky, pointed tip, suckling on it. The shudder and woozy, rapturous moan this alone draws out of him is pretty special. His hands find your shoulders, and his grip tightens as you advance your [pc.lips] further down his shaft, filling your mouth with the ");
		if(!pc.isBimbo() && pc.libido() < 75) output("shamefully");
		else output("transcendentally");
		output("arousing taste and texture of cock.");
		output("\n\n<i>“Thank you so much, my Queen!”</i> he cries out as you begin to find rhythm, bobbing your head up and down his shaft. You let out a muffled huff. Who here is sucking his dick, again?");
		output("\n\n<i>“You are welcome, my trusted servant,”</i> comes the cool reply. You hear muttering and the frustrated shuffle of feet, followed by a hefty slap and gasp of pain. <i>“Silence! If you wanted relief then you should have proven yourself worthy, as Azaphel has.”</i>");
		if(pc.isBimbo() || pc.hasPerk("Dumb4Cum") || pc.hasPerk("Peace of Mind")) 
		{
			output("\n\nWell, if she’s too aloof to get on her knees and hollow her cheeks around some delicious cock that’s definitely her loss. You’re getting a wonderful, soft buzz that intensifies the feeling of Azaphel’s meat sliding between your lips, heat glowing between your [pc.thighs] that strengthens with every drop of pre you coax out of him with long, hungry drags of your mouth and tongue.");
			output("\n\nYou let the raskvel boi know how much you enjoy servicing him with smacks of your lips and pleased, muffled hums, and you moan as you cause him to abandon all restraint, grab your head with feverish hands and fuck your mouth with athletic, juddering thrusts of his muscle-packed hips. The pointed end rams down your throat with each hard push, but you’re well-trained enough to take this without fuss, even enjoy the little bursts of stars behind your eyelids and the way your whole world becomes nothing but the wonderful hardness and taste of cock each time your windpipe is closed.");
		}
		else
		{
			output("\n\nOh, brother. You set your teeth against Brave Sir Azaphel’s dick - a little warning not to milk it too much - and then withdraw to energetically thrust your mouth up and down his cock, hollowing your cheeks around it stringently, eager to get him off as quickly as possible.");
			output("\n\nThe raskvel boi is evidently not one to look a gift suck in the mouth, and is quiet aside from his deepening, ragged breath as you blow him hard and fast, filling the hollow with slurps and smacks of your [pc.lips]. Eventually though, the pent-up trap can’t contain his excitement, and he grabs your head with feverish hands and gives back with athletic, juddering thrusts of his muscle-packed hips. You gag slightly as the pointed, pre-beading end sticks into your throat, but fortunately the thing is shaped so it’s much easier to take than it ordinarily would. You control yourself and let him face-fuck you, concentrating on keeping your mouth pliant and open for him, trying to ignore his giant balls slapping against your chin.");
		}
		output("\n\nWith a fluttering moan Azaphel mires himself into your mouth as deep as he can, his hands tighten on your [pc.hair], his giant testicles rise and tense, a fluttering moan is forced past his open lips, and a sudden cascade of cum warms your throat and gut. He’s forced back a bit by the sheer force of it, so that the next salty load swells your cheeks and squirts out around the seal of his girth and your lips... and then suddenly he’s pulled out entirely, his drooling, railing-like prick still sternly erect but no longer flexing. You blink. Was that it? With bollocks the size of his, you were expecting receipt of a meal and a half.");
		output("\n\n<i>“Can...”</i> he gasps in his fluttering, androgynous voice. <i>“Can I not... ?”</i>");
		output("\n\n<i>“No,”</i> the tall sydian replies coolly. <i>“You know the code: One orgasm per deed. Be gracious to your Majesty, and then get back in line.”</i>");
		output("\n\n<i>“Thank you, my Queen...”</i> he jogs his cute butt back into formation around her, rearranging his loincloth as he goes.");
		output("\n\n<i>“You have proven your fealty to me");
		if (flags["SYDIAN_QUEEN_LUBBIN"]!= undefined||flags["RASKVEL_HAREM_SPITROAST"]!= undefined)output(" once again");
		output(", stranger,”</i> the sydian returns to you with a broad, proud smile. <i>“You are in my favor.”</i>");
		//output("\n\nSomething warm and rubbery is being pushed into your hand. The raskvel boi is retreating back to his position by the time you look down at the "+ shrooms.quantity +" spunkshrooms you are now holding.");
		output("\n\n<i>“Obedient servants get treats,”</i> the sydian says, with a swish of her feathers. <i>“And it is now treat time.”</i> She eyes you coyly. <i>“Are you coming? You would make an acceptable treat.”</i>");
		//output("\n\n");
		
		processTime(7);
		flags["SYDIAN_QUEEN_STAGE"]=1;
		
		//itemScreen = sydianButtons;
		//lootScreen = sydianButtons;
		//useItemFunction = sydianButtons;
		//itemCollect(shrooms);
	
		addButton(0,"Yes",sydianQueenChoice,5,"Serve","Serve your queen.");
		addButton(1,"No",sydianQueenChoice,4,"No","Eh, not right now.");
	}
	//Stage 4 No more lubbin
	if (sceneChoice==4)
	{
		output("<i>“Very well,”</i> she sighs, turning away and waving her consort out in front of her. <i>“But be warned - my patience is not limitless.”</i>");
		addButton(0,"Leave",mainGameMenu);
	}
	//Stage 4 Yes I want it
	if (sceneChoice==5)
	{
		output("<i>“Excellent!”</i> replies the Sydian breezily. She waves her sceptre with practiced grandness. <i>“To the pleasure barrow, my consort!”</i>");
		addButton(0,"Next",sydianQueenSexyTimes);
	}
	//Stage 2 Nah no Queen4Me
	if (sceneChoice==6)
	{
		output("<i>“Do you seek to tease me, servant?”</i> the Sydian Queen queries, with a cool raise of her eyebrow. <i>“Not wise.”</i> She dismisses you with a wave of her sceptre. <i>“Go, then. But be in a more amenable state of mind, should you trouble me again.”</i>");
		output("\n\nShe flounces off, raskvel harem in tow.");
	 
		addButton(0,"Leave",mainGameMenu);
	
		flags["SYDIAN_QUEEN_STAGE"]=1;
		flags["SYDIAN_QUEEN_SEXCOUNT"]= 0;
	}
	//Stage 2 Yes Queen4me
	if (sceneChoice==6)
	{
	
		output("You wouldn’t be here for any other reason. You happily grin your assent. The raskvel give a small, high-pitched cheer.");
		output("\n\n<i>“Excellent,”</i> the sydian says huskily. <i>“Come, then, servants - the pleasure barrow awaits.”</i>");
		addButton(0,"Next",sydianQueenSexyTimes);
	}
	//Stage 3 
	if (sceneChoice==7)
	{
		output("You feel a dragging, resentful reluctance turning her down, but you think it wise not to go off chasing feathery and/or reptilian tail right now.");
		output("\n\n<i>“A refusal?”</i> Drooped feathers, pouted lips, frustrated tap of the sceptre: The Queen can really do disappointment. <i>“Perhaps you are not my most favored servant, as I imagined. Ah well... “</i> Her beetle-black gaze rolls over her raskvel consort. <i>“...there are plenty others who can vie for that honor. Go, then. And think on what you are missing out on well.”</i>");
		output("\n\nYour body <i>is</i> thinking about it, and makes you feel miserable as you watch that seductive menace sashay away. But perhaps you made the sensible decision.");
		flags["SYDIAN_QUEEN_STAGE"]=2;
		flags["SYDIAN_QUEEN_SEXCOUNT"]= 0;
		processTime(1);
		addButton(0,"Leave",mainGameMenu);
	}
}
	
	
	
public function sydianQueenSexyTimes():void
{	
	showBust("SYDIAN_QUEEN","RASK_TRAP","RASK_TRAP","RASK_TRAP");
	
	clearOutput();
	clearMenu();
	author("Nonesuch");
	
	//First Time Sex Intro
	if(flags["SYDIAN_QUEEN_SEXCOUNT"]==undefined)
	{
		output("You follow sydian’s swishing, feathery tail as it leads you further into the rusting pillars.");
		output("\n\n<i>“Are you wondering how I became a Queen, stranger?”</i> the tan creature asks. Even heavily clad in her armor it’s obvious she has a nice figure, slim and muscular but with hourglass swells that make the mouth water. She’s taken you to a steep hollow created by the bulwark of a half-buried spaceship, the heavily plated metal craning over a depression furnished with a large number of pillows and a spiky, welded together chair that obviously fancies itself as a throne. The sydian shoos her small charges down into it as she continues to speak.");
		output("\n\n<i>“I knew I was destined for greatness, but my people do not recognise such things in females. So I had to find another way of building a realm. These raskvel are all outcasts too - effeminate males are the lowest ranking of their kind. But they obey me with total loyalty and fearlessness, thanks to my discovery of the spunkshroom, which makes them far more potent and lively than any male that used to be cruel to them.”</i>");
		output("\n\nShe sinks back into her throne, and with a wriggle of her muscles and a grateful sigh she begins to peel her armor back, revealing the soft, smooth orange skin beneath. Tiny flakes of rust hang in the still air down here. You emit little puffs of bronze dust as her fine, firm breasts and protuberant nipples slide into view.");
		output("\n\n<i>“Soon I shall have an army of them at my command,”</i> husks the sydian, feathers waving and prideful desire inflaming her face, compound eyes unfocused as she mauls her own boob, fingers sinking deep into the softness there as she pulls at the nipple. She recrosses her legs, and you catch a glimpse of her pussy, as soft, pale and plump as her armor is hard, tanned and severe. <i>“But - for now - I have them, and you. And it’s treat time. So what shall we do with you?”</i>");
		
		processTime(4);
	}
	//Stage 3 Sex Intro	
	else if (flags["SYDIAN_QUEEN_STAGE"]==3)
	{
		output("You already know where to go, and in a lusty, anticipative daze, you [pc.move] with the raskvel femboys in formation back to the Sydian Queen’s rusty hollow. The great curve of the spaceship over your head feels almost like home; the blissful, sexy memories you’ve collected in this place have you eyeing the cushions and scrap decorations fondly.");
		output("\n\nYou all watch fervently as the insectile monarch scrapes her austere armor back, exposing her soft, luscious innards to her roving fingers. She gazes at you particularly as she pinches and touches herself, her compound eyes acquisitive and avaricious; you are suddenly aware that you are amongst savage aliens many miles from anywhere, and nobody knows where you are. It’s a thought that gives you a deep, undeniable thrill.");
		output("\n\n<i>“My lovely servants,”</i> she pronounces with a hovering buzz in her throat, hand on her plentiful breast. <i>“Mine for now and ever. How shall we amuse ourselves today?”</i>");
		
		processTime(2);
	}
	//Stage 1-2 Sex Intro
	else 
	{
		output("You follow the sydian’s swishing tail, leading you to the huge, craning wreck of the spaceship, underneath which she has created her dusky, rust-speckled, softly furnished ‘court’.");
		output("\n\nThe pent-up raskvel femboys watch breathlessly as she sinks back into her throne of scrap, and with a wriggle of her muscles and a grateful sigh she begins to peel her armor back, revealing the soft, smooth orange skin beneath. Tiny flakes of rust hang in the still air down here. You emit little puffs of bronze dust as her fine, firm breasts and protuberant nipples slide into view.");
		output("\n\n<i>“Now then, my loyal, frisky servants,”</i> she husks, feathers waving and prideful desire inflaming her face, compound eyes unfocused as she mauls her own boob, fingers sinking deep into the softness there as she pulls at the nipple. She recrosses her legs, and you catch a glimpse of her pussy, as soft, pale and plump as her armor is hard, tanned and severe. <i>“How shall you amuse me today?”</i>");
		
		processTime(2);
	}
	
	if(pc.hasCock() && pc.cockThatFits(550) >= 0) addButton(0,"Lay Her",penisRouter,[fuckTheSydianQueenRedux,550,false,0],"Lay Her","Dick the sydian. You may require some femboy fucking to get to her.");
	else if(pc.hasCock()) addDisabledButton(0,"Lay Her","Lay Her","Your dick is way to big to for her to willingly accept.");
	else addDisabledButton(0,"Lay Her","Lay Her","You can’t put your dick inside her if you don’t have one.");
	addButton(1,"Spit Roasted",spitRoastRaskvelTimesRedux,undefined,"Spit Roasted","Get fucked by the raskvel.");
	
	flags["SYDIAN_QUEEN_SEXCOUNT"] += 1;
}		
//Spit Roast
//Tooltip: Get fucked by the raskvel.
public function spitRoastRaskvelTimesRedux():void
{
	clearOutput();
	showName("\nORGY");
	author("Nonesuch");
	showBust("RASK_TRAP_NUDE", "RASK_TRAP_NUDE", "RASK_TRAP_NUDE", "RASK_TRAP_NUDE");
	
	if (flags["RASKVEL_HAREM_SPITROAST"] == undefined) flags["RASKVEL_HAREM_SPITROAST"] = 1;
	else flags["RASKVEL_HAREM_SPITROAST"] += 1;
	
	output("You signal your intentions by sidling into the nearest pink-skinned big-balled reptile [pc.butt] first, stroking his sensitive ears. He coos with delight and looks ");
	if(pc.tallness >= 60) output("up ");
	output("at you with barely contained lust, hands instinctively wrapping around your [pc.thigh].");

	output("\n\n<i>“Yes... excellent. You’ll put on a show for me. Azaphel - here,”</i> the Queen orders, pointing at her feet. <i>“The rest of you - tuck in. No bounds - you’ve been good today.”</i>");
	output("\n\nHot, smooth paws grasp you and pull you down into a sitting position, three pert, pent-up raskvel eager to experience as much of your alluring alien flesh as lizardly possible. You laugh and then gasp as one slides his hand over your [pc.chest], touching a [pc.nipple], hesitant at first but then with enthusiasm when you push yourself into him, coaxing him to stroke and maul your ");
	if(pc.biggestTitSize() >= 1) output("lovely soft boobs");
	else output("muscular pecs");
	output(". Another sinks his fingers into your [pc.vagOrAss], ");
	if(pc.hasVagina())
	{
		output("testing your depths and swirling you until you’re ");
		if(!pc.isSquirter()) output("beading");
		else output("gushing");
		output(" heady [pc.girlCum] down his digits. He licks them clean with obvious delight and then ");
		if(pc.totalVaginas() == 1) output("moves on to your [pc.anus], working it loose with insistent loops and then sinking them in to your sensitive back tunnel, another hole he very evidently intends to plunder.");
		else output("sticks them into your [pc.vagina 1], eager to feel the texture of every one of your breeding holes.");
	}
	else output("quite loose, and he’s stroking your sensitive back tunnel deep. You tense up with delight at the thought of having one of these scaly love bunnies rammed up there. AT LEAST one.");
	output("\n\nAll three have their gleaming purple cocks craning out of their pouches, their stuffed, oversized balls rising and falling in barely contained anticipation, and they rub their hot, smooth hardness against you from all sides with energetic bops, happy enough to feel your [pc.skinFurScales] against their erections. Their musk and eagerness is heady in the still air of the hollow, elevating your own arousal, and you lie back into them, grasping two pricks and giving them both teasing yanks, " + pc.mf("giggling","laughing") + " at the twin, girly groans this induces.");
	output("\n\n<i>“Ohh, are all aliens like you?”</i> one croons, long ears shuddering with delight. <i>“We need to build a rocket...”</i>");

	output("\n\n<i>“Can we keep this one, my Queen?”</i> pipes up another, fervently pumping his length between the cheeks of your [pc.ass], oiling it with a near constant flow of pre. <i>“We’ll take good care of [pc.him], I swear!”</i>");

	if(flags["SYDIAN_QUEEN_STAGE"]==1)	
	{	
		output("\n\n<<i>“No,”</i> the sydian replies sternly. <i>“You have no idea what [pc.he] even eats. Aside from dick, evidently.”</i>");
		output("\n\nThe raskvel bois await your response with baited breath.");
	}
	else if(flags["SYDIAN_QUEEN_STAGE"]==2)	
	{
	
		output("\n\n<i>“Perhaps,”</i> the sydian replies thoughtfully. <i>“[pc.he] is certainly proving useful. And entertaining.”</i>");
	}
	else
	{
		output("\n\n<i>“I’m beginning to think that might be wise,”</i> the sydian replies lowly. <i>“That fertile body... those powerful hips... yes. We should take possession of such an eager asset, before somebody else does.”</i>");
	}
	
	output("\n\nAzaphel has his hands wrapped around her armored thighs, head deep between them. His tail flails and there’s a muffled whimper when she smacks her sceptre about his pert backside. “My clitoris is not a piece of gristle, you clod! No teeth, just tongue. Thaaat’s more like it. The rest of you, stop lolling around. I demand action!”");
	output("\n\nA slutty, voyeuristic thrill thrums through you at the thought of putting on a show for the proud, pompous, self-styled queen. You allow her bitch-boi harem to roll you over onto your hands and [pc.knees], opening your [pc.thighs] so that the one behind you ");
	if(!pc.hasCock()) output("can continue to finger you, finding your [pc.clit] and rubbing it so fast it’s like a vibrator’s being applied to it.");
	else output("can grip your [pc.cock] and jerk it until it’s straining hard against your [pc.belly].");
	output(" You gaze up at the raskvel in front of you saucily and swirl your [pc.tongue] around the pointed head of his cock, retreating inside your mouth to savor his salty taste before reapplying it around the crown with relish. Meanwhile your hand cups his massive ball-sack and gives it a squeeze, delighting at the way it throbs beneath your touch - packed, liquid density. The trappy raskvel is far too worked up to take that kind of teasing for more than a few seconds; he grips your head and thrusts his stout erection past your [pc.lips], its shape and smoothness enabling him to holster himself in your wet, sucking maw with ease.");
	output("\n\nYou tense up and reactively grab his slim, girly hips when one of his peers grabs your [pc.hips] and slots his own pointed reptilian cum-faucet into your [pc.vagOrAss], the pointed head encountering zero difficulty opening your ");
	if(pc.hasVagina()) output("slickened entrance");
	else output("loosened asshole");
	output(" and packing thick, hot meat into your fuck tunnel. If you didn’t know these little snack-boys were wound up tighter than a spring and live at about ten times the pace you do, you definitely receive plenty of evidence for it now. They judder into you from both ends like jackhammers, thighs tensing in order to drive their cocks into your sensitive holes twice per second, a constant stream of pre drooling from the tips lubricating your mouth and [pc.vagOrAss], breathy gasps and groans of gratification the accompaniment to the dirty ‘slap-slap-slap’ of their gigantic balls against your chin and [pc.thighs].");

	if(pc.hasVagina()) pc.cuntChange(0,chars["RASKVEL_MALE"].cockVolume(0));
	pc.buttChange(chars["RASKVEL_MALE"].cockVolume(0));

	output("\n\nAll thought is driven from your mind except the ecstatic feeling of hard, hot dick pushing deep into the most sensitive parts of your ");
	if(pc.hasVagina()) output("snatch");
	else output("colon");
	output(" and it’s all you can do to keep hold of the raskvel face-fucking you and suck him down. So you aren’t thinking about what the third femboy is doing until ");
	var capacity:Number = pc.analCapacity();
	if(pc.hasVagina()) capacity = pc.vaginalCapacity(0);
	var route:String = "";
	//Large capacity on orifice in use:
	//Double stuff chosen hole.
	if(capacity >= 600) 
	{
		route = "doublestuff";
		output("he practically fights the one tailgating you, shoving and growling like a rabid chipmunk until the first is forced to stop, withdraw and slap him back. You detach from the cock in front of you to tut at them in disappointment.");
		output("\n\n<i>“C’mon you two,”</i> you say huskily, flaring your [pc.ass] and waggling it at them. Your whorish, well-broken-in ");
		if(pc.hasVagina()) output("cunt");
		else output("ass-pussy");
		output(" beckons, a more generous hole than they have ever known, or ever will. <i>“Why are you fighting? There’s plenty of room for everyone.”</i>");
		output("\n\n<i>“Yeah...”</i> breathes one, his teeth loosening from the other’s shoulder, hypnotised. He grips your hips and easily inserts himself deep inside your [pc.vagOrAss] again; you shiver as you feel the other clamber on top of him, and then shrill with joy, eyes rolling, as with assertive thrusts, he fucks his way inside as well, stretching and packing your tunnel out with hot dick. Your open mouth is filled by the raskvel in front, unable to simply stand by and watch anymore, and in moments all three are sawing themselves into your tender, over-stimulated holes.");
		if(pc.hasVagina()) pc.cuntChange(0,chars["RASKVEL_MALE"].cockVolume(0)*2);
		else pc.buttChange(chars["RASKVEL_MALE"].cockVolume(0)*2);
	}
	//Pussy DP + BJ
	//2 or more pussies: 
	else if(pc.totalVaginas() > 1) 
	{
		route = "pussies DP";
		output("you feel someone determinedly scrabble his way in underneath you, gripping your sides and [pc.chest] as he hooks his short legs around your [pc.thighs], hot, desperately eager erection bumping clumsily against [pc.eachVagina]. You emit a muffled laugh around your cock muffler and slap at its owner to stop and withdraw. Your downstairs is absolutely equipped for parties, why not get one started!");
		output("\n\n<i>“Aliens are amaaaazing,”</i> groans the one underneath, watching in awe as you carefully swivel your [pc.vagina] down onto his bright purple filly-pleaser, before flaring your [pc.ass] to enable the other access to your [pc.vagina 1]. A moan of purest, sluttiest delight is forced out of your mouth as he grips you and drives himself back in, putting delightful pressure through your walls against the dick you just sat yourself down on, and [pc.eachVagina] ");
		if(!pc.isSquirter()) output("drool");
		else output("gush");
		output(" [pc.femcum] in response to the two of them thrashing into you almost at right angles to each other. Your open mouth is filled by the raskvel in front, unable to simply stand by and watch anymore, and in moments all three are sawing themselves into your tender, over-stimulated holes.");
		pc.cuntChange(1,chars["RASKVEL_MALE"].cockVolume(0));
	}
	//1 pussy, not massive capacity:
	//Vag + Ass + BJ
	else if(pc.hasVagina())
	{
		route = "normal DP";
		output("you feel someone determinedly scrabble his way in underneath you, gripping your sides and [pc.chest] as he hooks his short legs around your [pc.thighs], hot, desperately eager erection bumping clumsily against your [pc.clit]. You emit a muffled laugh around your cock muffler and slap at its owner to stop and withdraw. There’s a simple solution here - you have the same number of holes as fuckbois present, after all.");
		output("\n\n<i>“Aliens are amaaaazing,”</i> groans the one underneath, watching in awe as you carefully swivel your [pc.vagina] down onto his bright purple prick, before flaring your [pc.ass] to enable the other access to your [pc.anus]. A moan of purest, sluttiest delight is forced out of your mouth as he grips you and works his way in, his pointed tool perfect for opening your ass-pussy up and incrementally filling it with hard, fervid flesh, putting delightful pressure through your walls against the dick you just sat yourself down on. Your open mouth is filled by the raskvel in front, unable to simply stand by and watch anymore, and in moments all three are sawing themselves into your tender, over-stimulated holes.");
		pc.buttChange(chars["RASKVEL_MALE"].cockVolume(0));
	}
	//Anal + blowie + HJ
	else 
	{
		route = "anal+HJ";
		output("he practically starts fighting the one you’re blowing, shoving and growling like a rabid chipmunk, desperately trying to present his own bright purple erection to your [pc.lips] instead. You laugh, and touch them both soothingly.");
		output("\n\n<i>“C’mon you two,”</i> you say huskily. <i>“There’s no need for that. I’m sure I can look after both of you...”</i>");
		output("\n\nA few moments later the two have their eyes unfocused and their pretty mouths hanging upon, their thighs practically jerking automatically, as you hollow your cheeks around the cock of one whilst vigorously tug at the other. As soon as you adjudge one is nearing the edge by the tones of his groans, you withdraw and sink your mouth down the sizzling, tasty knob of the other. All the while, gratifying pleasure courses up your body from the femboy behind you driving his dick into your [pc.ass] unabated.");
	}
	//merge
	processTime(10);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",raskOrgyPart2Redux,route);
}

public function raskOrgyPart2Redux(route:String):void
{
	clearOutput();
	showName("\nORGY");
	author("Nonesuch");
	showBust("SYDIAN_QUEEN_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE");
	output("The sensation of getting thoroughly gangbanged like this is overwhelming, and you are quickly forced to an orgasm which grips your entire body, ");
	if(pc.hasVagina()) output("[pc.eachVagina] seizing up repeatedly and coating the raskvel’s groin in [pc.girlCum]");
	if(pc.isHerm()) output(" and ");
	if(pc.hasCock()) output("[pc.eachCock] tensing up and blowing lines of [pc.cum] all over the cushions you’re knelt on");
	output(", and you writhe in delight around the cocks you’re pinioned upon.");

	output("\n\nThe Sydian Queen’s mouth is open, delight tautening her features as she watches. No sharp words emanate from that armored throat now - just high, rasping breaths. She’s got her powerful thighs wrapped around Azaphel’s head, trapping his face deep between them, and her sceptre’s end is engaged in clumsily pawing at her breast.");

	output("\n\nYour attention is brought abruptly back to your own knitting when, with a whispery groan, ");
	if(route == "normal DP" || route == "pussies DP" || route == "doublestuff") output("one of ");
	output("the raskvel behind you squeezes your [pc.thighs] hard, hilts himself in your [pc.vagOrAss] and implants a ");
	if(pc.hasVagina()) output("womb");
	else output("gut");
	output("-swelling load of hot cum into you. Void below, was that a single ejaculation?! The way your belly has been swollen out by that heavy liquid weight, it’s as if he’s made you three months pregnant in the space of three seconds. The reptilian femboy has barely slowed down; he’s still hammering himself athletically into your cum-stuffed ");
	if(pc.hasVagina()) output("snatch");
	else output("asshole");
	output(", spattering it everywhere, digging into your tenderized walls in a way that makes you utter gasps around the erect cock you’re tending to with your mouth.");
	//Supah loose or DP
	if(route == "normal DP" || route == "pussies DP" || route == "doublestuff")
	{
		output(" It’s made all the more intense that the raskvel ");
		if(route == "doublestuff") 
		{
			output("also embedded in your ");
			if(pc.hasVagina()) output("twat");
			else output("ass");
		}
		else
		{
			output("embedded in your ");
			if(pc.totalVaginas() > 1) output("other twat");
			else output("ass");
			output(" hasn’t slowed down at all. Evidently the more judicious of the two, he’s still thrusting his piping hot meat into you with excited claps of his muscle-curved thighs.");
		}
	}
	output("\n\n<i>“Must! Breed! Must! Breed! Got to... get it... all out!”</i> he groans, lost in an exhilarated frenzy. Any attempt to express your own feelings about this are lost when the raskvel in front tightens up fiercely and then flumes a similarly huge gush of salty, musky seed into your mouth, bloating out your cheeks and making you cough a fair bit up your nose. ");
	if(route == "normal DP" || route == "pussies DP" || route == "doublestuff") 
	{
		output("This one is considerate enough for you to wait for you to recover yourself, but his ardour is every bit as unassuaged as the one fucking your cum-gorged ");
		if(!pc.hasVagina() || route == "normal DP") output("back passage");
		else output("pussy");
		output("; once you’ve taken a deep breath he firmly grips your head and spears his dripping, still-very-much-erect penis back into your mouth, groaning with deepest satisfaction when your [pc.lips] touch his scaly sheath.");
	}
	else output(" He pulls back with a gratified sigh, although his balls are still the size of grapefruits and he hasn’t lost his erection even slightly; the other is patient enough to wait for you to swallow and take a deep breath before firmly gripping your head and spearing his own dick into your mouth, pantingly eager to reach his own release.");

	output("\n\n<i>“Yeeesss, that’s it my lovely boys, my ever-so-loyal sluts,”</i> crows the sydian, head-feathers twitching as she thrusts her lower body into Azaphel’s face. <i>“Get it all out of you! Enjoy the alien to your honest hearts’ content! You deserve it for being so good, don’t you? Yes you do.”</i> She opens her thighs for a moment; you can hear the raskvel femboy’s gasp for air from where you are. Then her legs are around him again, thrusting him back into her sopping pussy. <i>“You may continue. I have barely started.”</i>");

	output("\n\nYou are barely sensate as one of the raskvel rocks you backwards onto his lap, groaning with joy as he sits you down on his sex, penetrating your [pc.anus] right down to the base; another clasps himself around your front, his hot lips finding a [pc.nipple] and ");
	if(!pc.hasFuckableNipples()) output("nibbling");
	else output("tonguing");
	output(" it hungrily ");
	if(pc.isLactating()) output("until [pc.milk] begins to dribble into his mouth ");
	output("as he ");
	if(pc.hasVagina()) output("sinks his cock back into your thoroughly gaped cunt");
	else output("frots himself against your [pc.cock] energetically");
	output(", all the while the one behind pounds your [pc.ass] with urgent jerks of his rabbit-like hips, whipping intense sensation right into your core.");

	output("\n\nThe other simply sits, stroking himself as he watches, waiting to take his turn as soon as one of his fellows cums again. And again. And again. They have royal permission to use you to drain every last drop they have in their terribly denied ball-sacks, and that’s exactly what they do. The relentless stimulation, the taste of sweat and sex and the beat of insatiable lizard dick against your ");
	if(pc.hasCock()) output("prostate ");
	if(pc.isHerm()) output("and ");
	if(pc.hasVagina()) output("pussy walls ");
	output("causes you to break down into a quivering, spaced-out sub-state, happy to take the relentless fucking in every aching, leaking hole in every position the raskvel can think of, cooing as cum is spurted over your face, your [pc.chest] and across your [pc.skinFurScales], mind blown away by orgasm after orgasm.");
	var x:int = 0;
	processTime(30);
	pc.orgasm();
	pc.orgasm();
	
	clearMenu();
	addButton(0,"Next",raskOrgyPart3Redux,route);
}

public function raskOrgyPart3Redux(route:String):void
{
	clearOutput();
	showBust("SYDIAN_QUEEN_NUDE","RASK_TRAP_NUDE","RASK_TRAP_NUDE");
	showName("AFTER\nORGY");
	author("Nonesuch");
	output("You’re not sure how much time passes, down there in the still, glittering air, before ");
	if(pc.hasFuckableNipples()) 
	{
		output("you’re lying on your front, holding your [pc.chest] so a pink raskvel can hammer his length into your ");
		if(!pc.hasLipples()) output("[pc.nippleCunts]");
		else output("[pc.nipples]");
		output(", dilating the sensitive insides with delightful pressure. You moan as your chest seizes up in boob-gasm, ");
		if(pc.isLactating()) output("[pc.milk]");
		else output("[pc.girlCum]");
		output(" spurting out around the reptilian cock, ");
		output("and sigh as the flexing causes him to catapult into a gasping orgasm as well, packing your fuckable tit out with yet more hot, oozing cum.");
	}
	else if(pc.biggestTitSize() >= 4) output("you’re lying on your front, holding your [pc.chest] together so that a pink raskvel can hammer his length between your sweat-slicked cleavage, pleasure twinging through you as his adept little fingers fondle your [pc.nipples]. You sigh, eyes closed and utterly blissed out, as he moans and shoots another hot, sticky load of cum onto your face.");
	
	else output("you’re lying on your side, holding your arm against your chest so that a pink raskvel can hammer his length between them, rubbing himself against your flat [pc.skinFurScales] to another tingling high. You sigh, eyes closed and utterly blissed out, as he moans and shoots another hot, sticky load of cum onto your face.");

	output("\n\nAt last, the rabbit-reptile flops down onto the cushions, flaccid and bollocks almost normal-sized, eyes unfocused and mouth turned up into a dopey grin, joining his similarly appeased, dozing fellows. You are left lying on your side, exhausted and covered from head to tail in cum, every hole stretched open and thoroughly used");
	if(pc.hasCock()) output(", [pc.eachCock] tingling and throbbingly empty itself.");

	output("\n\n<i>“Mmm,”</i> whispers the Sydian Queen, drinking you in, tongue trailing down a long, thin finger. Azaphel dozes at her feet. Your head thunks into the sweet softness of a wool-stuffed pillow. You’re not able to support it any longer. Your [pc.eyes] close, the insect woman’s words droning through your exhausted mind. <i>“What a pleasing treat time that was. Perhaps we should keep you? ");
	if(!pc.hasVagina()) output("My future court shall always call for entertainment. ");
	else output("I will have need of a healthy, eager breeder like you, if I am to swell the ranks of my raskvel army. ");
	if(flags["SYDIAN_QUEEN_STAGE"] == 3 && flags["RASKVEL_HAREM_SPITROAST"] >= 4 && pc.hasVagina())	
	{ 
		output("Yes... I think the time has come.”</i>"); 
		addButton(0,"Next",raskOrgyBadEnd,0);
	}
	else
	{
		output("Ah... but no. Not quite yet, anyway. This is a bird that still wishes to fly.”");
	
		processTime(3*60);

		//Having each rask jizz 5 rasks worth of jizz at once in an attempt to actually fill up the PC's cunt.
		for(x = 0; x < 5; x++) { pc.loadInMouth(chars["RASKVEL_MALE"]); }
		if(route == "anal+HJ")
		{
			for(x = 0; x < 5; x++) { pc.loadInAss(chars["RASKVEL_MALE"]); }
		}
		else if(route == "normal DP")
		{
			for(x = 0; x < 5; x++)
			{ 
				pc.loadInAss(chars["RASKVEL_MALE"]);
				pc.loadInCunt(chars["RASKVEL_MALE"],0);
			}
		}
		else if(route == "pussies DP")
		{
			for(x = 0; x < 5; x++)
			{ 
				pc.loadInCunt(chars["RASKVEL_MALE"],0);
				pc.loadInCunt(chars["RASKVEL_MALE"],1);
			}
		}
		else if(route == "doublestuff")
		{
			if(pc.hasVagina())
			{
				for(x = 0; x < 5; x++)
				{ 
					pc.loadInCunt(chars["RASKVEL_MALE"],0);
					pc.loadInCunt(chars["RASKVEL_MALE"],0);
				}
			}
			else
			{
				for(x = 0; x < 5; x++)
				{ 
					pc.loadInAss(chars["RASKVEL_MALE"]);
					pc.loadInAss(chars["RASKVEL_MALE"]);
				}
			}
		}
		pc.applyCumSoaked();
		clearMenu();
		addButton(0,"Next",raskOrgyPart4Redux);
	}
}

public function raskOrgyPart4Redux():void
{
	clearOutput();
	showName("WAKE\nOF SHAME");
	author("Nonesuch");
	
	var shrooms:ItemSlotClass = new SpunkShroom();shrooms.quantity = 3 + rand(3);
	output("You wake up with a start. You’re outside on the surface of Tarkus again, in the shadow of a rust spire. Your [pc.gear] has been piled roughly on top of you, and you seem to be have been given a rough towelling - although you still absolutely reek of cum. You stagger yourself upright and drag your stuff on. Oh <i>man</i> are you sore!");
	output("\n\nIt’s only after you’re fully dressed again that you notice the other pile of "+ shrooms.quantity +" spunkshrooms, laid neatly next to you. Payment for services rendered? A come-again favor from an enamored queen? They’re obviously for you... whatever the exact intent of them is. You pick them up and carry on with whatever it was you were doing before you got so delightfully waylaid.");
	output("\n\n");
	processTime(20);
	clearMenu();
	
	quickLoot(shrooms);
	
	if (flags["SYDIAN_QUEEN_SEXCOUNT"] == 2) flags["SYDIAN_QUEEN_STAGE"] = 2;
	if (flags["SYDIAN_QUEEN_SEXCOUNT"] >= 3) flags["SYDIAN_QUEEN_STAGE"]=3;
	
	sydianQueenCooldownMinutes(90);
}

//Lay Her
//Needs a not absurdly sized dick
//Tooltip: Dick the sydian. You may require some femboy fucking to get to her.
//550 max volume
//11" is max for hilting :3

public function fuckTheSydianQueenRedux(x:int):void
{
	clearOutput();
	showName("SYDIAN\nQUEEN");
	author("Nonesuch");
	showBust("SYDIAN_QUEEN_NUDE", "RASK_TRAP_NUDE", "RASK_TRAP_NUDE", "RASK_TRAP_NUDE");
	
	if (flags["SYDIAN_QUEEN_LUBBIN"] == undefined) flags["SYDIAN_QUEEN_LUBBIN"] = 1;
	else flags["SYDIAN_QUEEN_LUBBIN"] += 1;

	output("The tall, armored demagogue can hardly have shaken that tail in front of you, flashed that orange bejazzle, and expected you to settle for anything less than first prize here. You return her gaze with all the unabashed smolder you can muster, ");
	if(!pc.isCrotchExposed())
	{
		output("shaking off your [pc.crotchCovers] and allowing your semi-erect [pc.cockNounSimple " + x + "] to flop out.");
	}
	else if(pc.hasSheath()) output("letting your [pc.cockNounSimple " + x + "] slide out of your [pc.sheath " + x + "] gratifyingly.");
	else output("let your equipment fall to one side, deliberately swinging your semi-erect [pc.cockNounSimple " + x + "] as you do so.");
	
	if(flags["SYDIAN_QUEEN_STAGE"]==1)	
	{	
		output("\n\n<i>“Brave intent,”</i> hisses the Sydian Queen, black eyes hopscotching up and down your naked body. <i>“You fancy yourself prime enough to make a treat of <i>me</i>, do you?”</i>");
	}
	else if(flags["SYDIAN_QUEEN_STAGE"]==2)	
	{
		output("\n\n<i>“Ah, of course,”</i> smiles the Queen, devouring you with her avid, pupil-less eyes. <i>“I should not have expected anything else from my most cavalier servant.”</i>");
	}
	else
	{
		output("\n\n<i>“Hmm,”</i> purrs your Queen, devouring you with her avid, pupil-less eyes. <i>“Perhaps you fancy yourself my King? Perhaps by displaying your boldness and energy enough, you hope to place yourself next to me. It’s not an entirely distasteful idea...”</i>");
	}
	
	output(" Her tone is one of arch amusement, but there’s plenty of fire in that tan, oval face, and her long feathers ripple and quiver. Her thin tongue extends out of her mouth, dabs along a finger. <i>“");
	if(!pc.hasVagina() && pc.mf("","f") == "f") output("I favor watching youthful girly boys tussle with one another for my pleasure, personally. And why should I favor you above my own, loyal catamites?”</i> She waves airily at the pink raskvel, who are watching this exchange with baited breath. <i>“I think you are going to have to prove your virility, if you fancy your chances with me.”</i>");
	else output("How fetchingly bold. But I have a cupboard full of willing toys, as you can clearly see.”</i> She waves airily at the pink raskvel, who are watching this exchange with baited breath. <i>“I think you are going to have to prove you can go the distance, if you fancy your chances with me.”</i>");

	output("\n\nThe trash tramp’s interminable teasing - married to the shift of her loosened plates over the softness of her inner body - has provoked you");
	if(pc.balls > 0) output(", heavy heat swelling your [pc.balls]");
	output(". Hell yeah, you’ll prove yourself. You’ll prove yourself all night.");
	if(flags["SYDIAN_QUEEN_STAGE"]==3)	output("You’ll prove yourself forever.");

	output("\n\nAzaphel the raskvel can presumably see some of what you’re thinking on your face, given the apprehension written upon his own pretty features, but he doesn’t do anything but shiver and gasp slightly as you grab ahold of him, stroke his fat, scaly tail and long, sensitive ears as you pressure him down onto his hands and knees.");
	//If PC blew him:
	if(flags["AZRA_RASK_PC_SUCKED"] != undefined)
	{
		output("\n\n<i>“What goes around comes around, you lil bastard,”</i> you whisper in one of those long, rabbit-like flaps as you lift his tail to reveal his curvy backside, rounded and padded in a manner that cries out for a good, hard buttfucking.");
	}
	else output("\n\nYou lift his tail to reveal his curvy backside, rounded and padded in a manner that cries out for a good, hard buttfucking.");
	output(" You slap your [pc.cock " + x + "] into the warm crevice, rubbing some delightful friction into it as you lean over and nibble on an ear, delighting at the high moan and raise of the tail this draws out of the small, effeminate reptile.");
	output("\n\n<i>“Sessalai! Here!”</i> raps the sydian, pointing at her chitinous feet. She’s watching you molest her servant with a bitten lip, anticipation writ large on her face - and the erect nipple she’s got squeezed between her knuckles, pulling and twisting the sensitive nub as she drinks you in. Your [pc.eyes] are on those, the delightful action of her fingers, as you draw your diamond-cutter of an erection back over the pink pad of Azaphel’s anus until the [pc.cockHead " + x + "] is positioned against it, and then press it home, groaning at the delicious, warm tightness that envelopes you as you open him up.");
	pc.cockChange();
	output("\n\nThe raskvel moans and then wails, claws sinking into the dusty cushions you’re on, as you inexorably sink more and more of your [pc.cockNounSimple " + x + "] into his tail-hole, wriggling around you, but it’s obvious he’s no novice to this; his warm flesh keeps loosening around your girth to accommodate you ");
	if(pc.cocks[x].cLength() <= 11)
	{
		output("until your ");
		if(pc.balls > 1) output("[pc.balls]");
		else output("[pc.thighs]");
		output(" are lightly touching his supple bum cheeks.");
	}
	else output("despite your prestigious size.");

	output("\n\n<i>“Yeeeesss,”</i> hisses the Sydian Queen, black eyes alive with delight as she watches you saw back and forth into the prostate raskvel, gradually but relentlessly building up a rhythm which makes a glow of intense pleasure work its way right up your [pc.cock " + x + "] and up into your groin. She’s got Sessalai’s head pressed between her open thighs, long ears and tail twitching as he obediently eats her. <i>“This is what I lack! " + pc.mf("An alpha male",("A " + (pc.isHerm() ? "hermaphrodite" : "shemale") + " taskmaster"), true) + " to keep my servants in check and give them regular milkings!”</i>");
	output("\n\n<i>“No, my queen! I can be that for you, see!”</i> The third raskvel has got the fourth pinned beneath him; he’s giddily flapping his curvy thighs into his fellow’s behind, whose eyes are crossed. A gurgling, helpless moan and a gushing sound draws your attention back to your own bottom. A thick cum is oozing from Azaphel’s bright purple cock, forced out from his sheath by the unstoppable bludgeoning of your own fuck-pole on what is evidently an outsized and very sensitive prostate.");
	output("\n\n<i>“That’s sweet of you, Meffilin,”</i> coos the sydian to the upstart raskvel, crossing her long legs around her designated muff-servicer, muscles shifting and tightening in her thighs. <i>“But you’ve never made one of my other guards cum like a girl in seconds, have you?”</i>");

	output("\n\nYou smirk and pound ");
	if(pc.cocks[x].cLength() > 11) output("into ");
	else output("your [pc.hips] into ");
	output("Azaphel’s upraised backside even harder, drawing a wail out of him and a giant gush of cum all over the cushions beneath, his swollen balls deflating with every returning thrust of your [pc.cock " + x + "] into his tight, clenching asshole, keeping your eyes fixed on his self-styled queen the entire time. The hot lust coursing up your shaft ");
	if(pc.balls > 0) output("and tightening up your [pc.balls] ");
	output("is giddying, the desire to unload yourself and bloat this femboy with your seed growing - but she demanded someone who could go the distance, and that’s exactly what you’re proving.");

	output("\n\nWith a shivering cry, the fourth raskvel orgasms, unable to keep fucking his peer without losing himself to intense excitement, shooting back out in a rocket trail of backed-up cum. You, however, don’t stop buggering poor Azaphel, reaching deep into his delicious tightness, until he’s lying quivering in a lake of his own cum, his balls shrunk down to grape size. And when you slowly withdraw out of his thoroughly gaped hole, relishing the warm texture sliding up it, your [pc.cock " + x + "] is still rock-hard, dripping pre. The sydian has been arching her back, mouth open and feathers fluttering as she watches this act of anal destruction, and when she sees this she roughly pushes Sessalai to one side and opens her arms to you, her orange pussy unfurled and tongue-polished, gleaming and ready.");

	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",fuckTheSydianQueen2Redux,x);
}
public function fuckTheSydianQueen2Redux(x:int):void
{
	clearOutput();
	showName("SYDIAN\nQUEEN");
	author("Nonesuch");
	showBust("SYDIAN_QUEEN_NUDE");
	output("Pulse thudding in your temple, you [pc.move] across and mount her on her reconstructed throne, the smooth, unyielding back-plates against your arms contrasting to the suppleness of her breasts pooling into your [pc.chest]. It takes barely a second to line your [pc.cockHead " + x + "] up with her puffy, split tangerine of a cunt. Sliding into her is like slipping into a silky, sultry dream.");
	output("\n\n<i>“Yeeeessss,”</i> she hisses in delight, tightening her thin, armored fingers around your shoulders as you dip your [pc.cock " + x + "] into her spongy, sopping tunnel. You find her limit and slowly withdraw, and she tightens her athletic thighs around your waist, reaching down to snatch at your [pc.ass], impatient for the returning thrust. <i>“You! Servants! Rut each other for my pleasure! You have permission to cum as much as you waaaafnnnn.”</i> She trails off in an euphoric croon as you give it her, groaning yourself as you immerse your dick from ");
	if(pc.cocks[x].cLength() <= 11) output("[pc.cockHead " + x + "] to [pc.sheath " + x + "]");
	else output("[pc.cockHead " + x + "] to halfway down the massive shaft");
	output(" in simmering, orange delight. She gestures over your shoulder distractedly. <i>“I demand a soundtrack of boy fuckings! Uff! ThequeenhasspokenYES!”</i>");

	output("\n\nYour [pc.lips] descend to her nipples, so protuberant and swollen from the merciless mauling they were receiving from their owner, and you are rewarded with another gleeful hiss when you roll one hungrily between your teeth, flicking at it with your [pc.tongue]. She claps her thighs against you roughly, rocking the throne beneath you, urging you on, until you’ve got them hiked up at the knees and are thrusting your fuck-pole into her wet depths with everything you’ve got, sweat glossing your [pc.skinFurScales] and her own, soft inner flesh, sheer pleasure tightening up your muscles.");
	output("\n\n<i>“Breed me,”</i> she snarls in your [pc.ear], arm hooked around your neck. <i>“Give me children born of alien stamina and honor, so I may have a dynasty that SHAKES this dying world!”</i>");
	output("\n\nCertainly, you’re shaking something for her. You reach into her deep and orgasm in an unstoppable torrent, your [pc.cock " + x + "] twitching and then disgorging [pc.cum] in ecstatic blasts. ");
	if(pc.hasKnot(x)) output("A breeding is what she wants, and a breeding is what she’s going to get. She whines and then huffs as you push your [pc.knot " + x + "] in, swelling up and stretching her plump entrance closed with your hard, bulging meat. ");
	output("The tall, proud sydian makes guttural noises of purest gratification as you cum into her, her lush walls rippling around your flexing shaft, the lithe muscles in her bare legs and tummy molding into your [pc.skinFurScales].");

	output("\n\n<i>“Mmm... but you’re not done yet, are you?”</i> the harsh-voiced, mesmerizingly-bodied autarch whispers, when finally your thrusts begin to slow down. <i>“No... my youthful, star-born mate, [pc.heShe] still craves to serve [pc.hisHer] queen, does [pc.heShe] not?”</i> She shifts around your cock, still mired deep within her cum-packed fuck-sleeve. You exhale raggedly. Yeah. You could probably go again. You’re the all-conquering champion, after all.");
	output("\n\n<i>“Yeeeeesssss. You relax. Let the queen do as she may with her prize,”</i> coos the sydian, shifting around you");
	if(pc.hasKnot(x)) output(", patiently waiting for your [pc.knot " + x + "] to deflate first");
	output(", until your [pc.butt] is on the fur-lined seat of the throne and her dense, tan-skinned weight is on top of you. She strokes your chin, cackles a bit when her movements dislodge a gooey load of [pc.cumColor] spooge out of her swollen, orange snatch and down your [pc.thighs], and then slowly but surely swivels herself around. You groan at the delectable sensation of her tunnel twisting around your shaft, still hard, still up her...");

	output("\n\n<i>“You like that, don’t you [pc.boyGirl]?”</i> she says archly, gazing at you over her shoulder, her big, round butt now in your lap. You sneeze, reactively twitching as her tail brushes over your face, and you feel a giddy rush as the feather dust disappears into your nostrils, heat rising to your [pc.skin]. <i>“Isn’t your queen benevolent to allow you to marvel at every inch of her illustrious form as you breed her? Do you not see how strong and beautiful your daughters shall be? Is she not the primest sydian you have ever laid your eyes on?”</i> She wriggles her ass at you, feathers flicking, squirming around your [pc.cock " + x + "]. Renewed lust surges through your veins. You grab her by the waist, holding her still so that you can thrust upwards into her cum-caked pussy, registering a ‘splorch’ and a delighted, husky squeal.");
	output("\n\nIt takes your fuck-addled senses a bit to catch up, but you realize that letting you see her bum was not exactly the reason why the sydian wanted to face this way. Her raskvel consort are doing exactly as they were ordered, unleashing their bottled up libidos on one another in a desperation-tinged orgy. The one who had a go at challenging you is now on his hands and knees wedged between two others, joy on their hot-cheeked, youthful faces as they relieve their straining ballsacks into his mouth and curvy butt in heavy spurts again and again. Then the fourth rolls into Sessalai from behind, struggling with him whilst urgently frotting his shiny purple lizard dick against his, half-fighting, half-fucking. They’re constantly changing position, rabbity impulses and rapacious libidos spilling out over the cushioned hollow, girly gasps, squelches and the leathery slap of scales on scales echoing against the surrounding rock and metal.");
	output("\n\nThe sydian watches this feverish display of femboy decadence with triumphant lust, flexing her powerful hindquarters to ride you with increasingly violent jolts, her tail rearing back and forth, constantly swishing you in the face. You take one hand off her waist to slap her brawny ass, trying to get her to stop, but if anything this spurs her on; your [pc.cock " + x + "] is jerked backwards and forwards in her oozing tunnel, kneaded by her churning movements as she growls and hisses with wordless delight, orgasming to the debauchery she’s centred herself in.");
	output("\n\nYou do your best to keep the wolf from the door, and you do spend long minutes determinedly thrusting into her writhing, sopping hotness, giving as good as you get; but with her pheromones high in your veins and sex assaulting your every sense, you can’t last forever. You grip her thigh with one hand, enclose a squishy boob with the other - push yourself ");
	if(pc.cocks[x].cLength() <= 11) output("up to the [pc.sheath " + x + "]");
	else output("almost up to the [pc.sheath " + x + "]");
	output(" - and flume another heavy load of [pc.cum] into her breeding bay, wonderful, juicy pulses that have your [pc.thighs] pumping up into hers on auto-pilot. You don’t stop until your ");
	if(pc.balls > 1) output("[pc.balls]");
	else output("[pc.cock " + x + "]");
	output(" are achingly, gratifyingly empty, and you can do nothing but flop back against the throne’s back, utterly spent.");

	output("\n\n<i>“Done already?”</i> The sydian’s words come to you through a mist of exhausted bliss. You exhale slowly as she rises up, allowing your dick to flop out her extremely well-seeded hole. The giddy, ecstatic strains of raskvel at play continue unabated. <i>“");
	if (flags["SYDIAN_QUEEN_STAGE"] != 3 && flags["SYDIAN_QUEEN_LUBBIN"] < 4)
	{
		output("Oh well - perhaps you’re not king material after all.");
		if(flags["SYDIAN_QUEEN_STAGE"]!=1)output(" Not yet, anyway. Perhaps, eventually... but y");
		else(" But y");
	}
	else output("Y");
	output("ou have given me what I desired, and put on a good show, valiant, virile stranger - and I can finish up with my servants. Be at ease, and rest.”</i>");
	output("\n\nYou’re more than happy to obey that, slumped in the cozy, albeit sticky, furs of the throne. Your last sight of the tall, regal insect woman is her stalking down towards the four raskvel, feathers swishing, leaving a trail of [pc.cum] behind her...");

	processTime(60);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	
	if (flags["SYDIAN_QUEEN_STAGE"] == 3 && flags["SYDIAN_QUEEN_LUBBIN"] >= 4)addButton(0, "Next", sydianQueenBadEnd,0);
	else addButton(0,"Next",fuckTheSydianQueen3Redux);
}
public function fuckTheSydianQueen3Redux():void
{
	clearOutput();
	author("Nonesuch");
	var shrooms:ItemSlotClass = new SpunkShroom(); shrooms.quantity = 3 + rand(3);
	showName("WAKE\nOF SHAME");

	output("You wake up with a start. You’re outside on the surface of Tarkus again, in the shadow of a rust spire. Your [pc.gear] has been piled roughly on top of you, and you seem to be have been given a rough towelling - although you still absolutely reek of sex. You stagger yourself upright and drag your stuff on. You groan as an almighty throb emanating from your groin gives you another reminder of your utter wantonness.");
	output("\n\nIt’s only after you’re fully dressed again that you notice the other pile of "+ shrooms.quantity +" spunkshrooms, laid neatly next to you. Payment for services rendered? A come-again favor from an enamored queen? They’re obviously for you... whatever the exact intent of them is. You pick them up and carry on with whatever it was you were doing before you got so delightfully waylaid.");
	processTime(60);
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	output("\n\n");
	quickLoot(shrooms);
	
	if (flags["SYDIAN_QUEEN_SEXCOUNT"] == 2) flags["SYDIAN_QUEEN_STAGE"]=2;
	if (flags["SYDIAN_QUEEN_SEXCOUNT"] >= 3) flags["SYDIAN_QUEEN_STAGE"]=3;
	
	//Needs a 3 hour cooldown
	sydianQueenCooldownMinutes(90);
	
}
public function raskOrgyBadEnd(sceneChoice:int):void
{
	clearOutput();
	author("Nonesuch");
	showName("IN THE\nWAR ROOM");
	clearMenu();
	
	if (sceneChoice==0)
	{
		output("You wake up slowly and groggily, many hours later. Your subconscious clocks that things are different this time long before you’re fully aware of it: you are used to the warm, polluted air of Tarkus moving across your [pc.skinFurScales] waking you up after these little fuckfests. You’re still inside, it’s gloomy and... there’s something around your neck? You raise your head.");
		output("\n\nYou’re still beneath the great arc of the crashed spaceship, the bronze-glittering barrow of the Sydian Queen. Your [pc.gear] is nowhere to be seen, and you notice with a shock that even your codex is missing. You try to get up, and are immediately forced back down to the ground by a harsh tug to the back of your neck. Your fingers go up, touching the thick metal collar around your neck, the chunky chain that leads from it to the wall.");
		output("\n\n<i>“You’re awake! Wonderful.”</i> The orange-plated matriarch herself stands over you, sceptre in hand, smiling with that implacable, imperious grace of hers. Two raskvel bois flank her; they gaze at you with a kind of nervous, frisky lust. <i>“I’ve decided that I can’t have such a valuable servant as yourself running around outside. This is a desperate world, star-child: Somebody else would have captured a succulent, fertile, obedient treat like you eventually. Somebody nowhere near as regal and munificent as me.”</i>");
		output("\n\nFright bubbling up inside you, you open your mouth to beg, demand, scream that she let you go... but the words come out in an uncertain stutter. You’ve gotten so used to just doing whatever the sexy, tinpot tyrant wants that you cannot summon the authority.");
		output("\n\n<i>“What’s the matter?”</i> queries the Queen, angling her head to one side. <i>“Isn’t this what you wanted? You are serving your Queen, are you not? And serve you shall. I need a healthy breeder, you see. The raskvel cannot give me a child, but I am told you sky-treats make for excellent incubators.”</i> She taps her sceptre thoughtfully, considering you and her two pretty boys. They are waiting on her word practically on tiptoe, their ball pouches bulging. <i>“Oh, go on then, Azaphel and Sessalai. You haven’t really proven yourself worthy today, but we should give [pc.him] a pleasant introduction to [pc.his] new life, shouldn’t we?”</i>");
		output("\n\nA minute later you’ve got your [pc.hips] wide open, taking thick, juddering raskvel cock in your [pc.vagina] whilst the other supports you from behind, his own hot dick pressuring into your [pc.ass], two pairs of scaly hips thudding into you from either side to a chorus of enthusiastic groans and coos. Void, you can’t deny how good it feels... maybe if you just go along with this for now, a chance to escape will present itself eventually?... you orgasm to the twin sensations with a shuddering cry.");
		
		processTime(5 * 61);
		
		pc.changeLust(150);
		addButton(0,"Next",raskOrgyBadEnd,1);
	}

	if (sceneChoice==1)
	{
		pc.willpower(-50);
		pc.libido(100);
		
		output("You stroke the taut, bloated curve of your belly, huffing as concertina-like pressure assails your womb, [pc.femcum] dripping freely from your [pc.vagina]... but, nope. It’s not yet time. You return your attention to your Mistress’s armored boot, stroking it happily as she continues her consul with the sydian emissaries.");
		output("\n\nThe four male warriors keep shooting looks at you, which is understandable: you are Queen Sh’ziad’s most valuable asset, and are decorated as such. The chain that connects your collar to her throne glitters with malachite.");
		if(pc.hasHair()) output("Your [pc.hair] is piled high and tiered with masterfully crafted silicon; y");
		else output("Y");
		output("our [pc.ears] and nose are pierced with the eerie, enchanting silver of a sexbot’s entrails, your [pc.anus] held open by a buttplug topped by the largest diamond you’ve ever seen. You are naked aside from that of course, for all to see the curves of unearthly fertility that has gifted Sh’ziad the Merciless her army of loyal raskvel; the tiny, calligraphy tattoos down your bare back tallying the exact number of eggs that you have borne.");
		output("\n\nYour mind drifts peacefully and sensually back over the last few months, happy to linger over the vast amounts of sex you’ve had, the number of delicious reptilian cocks you’ve taken in every wet, tender, hole, the heaps of raskvel boys you’ve left spent and happily dozing. The more you do, the more you want; even now, gravid as you are, your pussy aches for a hard, dripping filling. That’s the effect of all the motherhusk you embibe, sprinkled into your every morning bowl of warm, goopy cum.");
		output("\n\nIt was difficult to accept at first that your quest for your father’s treasure was over and that you had become a breeding slave on a ruined planet, of course. The orgies you were in the middle of every day slowly changed how your mind worked, though, melting away anxieties and regrets, reordering your priorities towards serving and blissful submission. Part of that was the taint which worked its way into you as you imbibed more and more alien fluids, spent more and more time within the atmosphere of Tarkus.");
		output("\n\n");
		if (pc.biggestTitSize() < 27)
		{
			output("Your [pc.boobs] swelled outwards precipitously as your body came to understand its new role as a broodmother, wonderful, tender, heavy, swaying things perpetually filled with and often leaking [pc.milk]. ");
			for(var b:int = 0; b < pc.breastRows.length; b++)
			{
				if(pc.breastRows[b].breastRatingRaw <= 20) pc.breastRows[b].breastRatingRaw = 27;
				else pc.breastRows[b].breastRatingRaw += 7;
			}
		}
		output("Your nanobots reacted to the poor fare on this world by morphing your gastrointestinal system to extract almost all the nutrients you need from cum, and soon enough it’s all you really wanted. Whether sucked directly from a delightful, pent-up quivering reptile boy, lapped up from an overflowing puppy bowl, or simply licked off of your [pc.skinFurScales] after a massive bukkake, you don’t really care as long as you get to savor that wonderful, thick, musky sperm sliding down your throat, making you feel both satisfied and incredibly horny.");
		if(pc.totalVaginas() <3)
		{
			output(" You sprouted an additional pussy between your [pc.hips], fully functional and hungry to be used.");
			pc.createVagina();
			pc.setNewVaginaValues(pc.vaginas.length - 1);
		}
		output(" That array of wet, fertile holes of yours is what really alerted the Queen to your potential. You were fed as much motherhusk as her boi scouts could find, and you were soon pumping out healthy egg after egg after egg.");
		if(pc.hasCock()) output(" The Queen even allows you time with her new girl servants occasionally, squealing as they ride your [pc.cock] with their wet, double-clitted cunts, but she mostly keeps that type of treat for her most favored bois.");
		output(" Her army swelled, and under her shrewd, merciless direction, took over a great portion of the surrounding lands. The pleasure barrow has changed, become a genuine underground palace festooned with curious, glittering artifacts, with raskvel servants darting in and out and all around. Thanks, in large part, to you.");
		output("\n\nSo valuable did you become, that other sydians tried to steal you away! They almost succeeded, too. Hence your collar and chain, kept by your Mistress’s feet mostly where she can keep an eye on you... and so she can occasionally use you as a pussy munch, thanking her for this wonderful new life she’s bestowed upon you with one searching lap of your [pc.tongue] in her over-ripe tangerine sex after another. As for her enemies - well, this is what they do now. They come and pay their respects. They bargain and bring tribute. They have learned that resistance is futile.");
		output("\n\n<i>“We shall consider your offer,”</i> Sh’ziad decrees, dismissing the emissaries with an imperious wave. You’re not paying attention; the waves of sensation are back, even more intense this time. You groan as your cervix dilates, dense weight swells down your pussy, and you orgasm tremendously as you bear the football-shaped egg, coming loose from your lips in a small explosion of juices. Void, it never stops feeling mindblowingly good.");
		output("\n\n<i>“Ah, another addition to my glorious queendom?”</i> Your Mistress gazes proudly down at you, pulling you in closer so she can stroke you underneath your chin. A raskvel nurse darts in and retrieves your newborn, hauling it away to the incubators. <i>“My immaculate egg-giver,”</i> the statuesque sydian purrs down to you. <i>“How far we have come together. How far we have still yet to go.”</i>");
		output("\n\nYou bake in the wonderful twin sensation of exhausted birth and receiving your Mistress’s adoration, until she lets you go and claps briskly.");
		output("\n\n<i>“My egg-giver has given [pc.his] last for this cycle,”</i> she proclaims. <i>“Take [pc.him] to the laying pit, clean [pc.him] up, oil and feed and pamper [pc.him]. Then I shall pick the males who have the honor of beginning the new cycle, enjoying [pc.his] company uninterrupted for a day and moon.”</i>");
		output("\n\nA few hours later you are wedged between two raskvel boys, who use their thick, scaly hips to urgently thrust their smooth, pointed cocks into your mouth and [pc.vagina], all the while you fondle two others and allow another to rut his hot length between the slick, pillowy goodness of your oiled-up tits. There’s another mark on your back, and you’re energetically pumping your gleaming [pc.ass] backwards in search of many more. This is your whole life now, down here in the velvety darkness, orgasming again and again to the wonderful feeling of hard reptile dick swelling your pussy and throat, and it is the purest bliss.");
		
		pc.changeLust(150);
		processTime(723 * 24 * 62);
		
		badEnd("THE END.");
	}
}
public function sydianQueenBadEnd(sceneChoice:int):void
{
	clearOutput();
	author("Nonesuch");
	showName("A LIFE OF\nEGG BEARING");
	showBust("SYDIAN_QUEEN","RASK_TRAP","RASK_TRAP","RASK_TRAP");
	clearMenu();
	
	var randoKid:int = rand(2);
	if (sceneChoice==0)
	{
		output("You wake up slowly and groggily, many hours later. Your subconscious clocks that things are different this time long before you’re fully aware of it: you are used to the warm, polluted air of Tarkus moving across your [pc.skinFurScales] waking you up after these little fuckfests. You’re still inside, it’s gloomy and... you’re slumped in some sort of chair?");
		output("\n\nYou’re still beneath the great arc of the crashed spaceship, the bronze-glittering barrow of the Sydian Queen. Your [pc.gear] is nowhere to be seen, and you notice with a shock that even your codex is missing. You try to get up, and immediately a chitinous hand calmly presses your wrist back down to the armrest.");
		output("\n\n<i>“You’re awake! Wonderful,”</i> The orange-plated matriarch herself is sat next to you in her throne, sceptre in hand, smiling at you with that implacable, imperious grace of hers. Her throne, set right next to your throne, now that you’ve had a chance to look at what you’re sitting on. Battered, recovered bronze and scrap metal, shaped into an imposing, regal, trash seat. Cold understanding seeps downwards as this all begins to process.");
		output("\n\n<i>“I’ve decided that it doesn’t do for such an important servant as yourself to run around outside,”</i> the queen pronounces. She gestures breezily at the gaggle of raskvel femboys, who are running around the cavernous depression clutching weapons and equipment, balls practically bouncing along the floor. <i>“I need you here, commanding our subjects. Training them, with your star-borne knowledge. Ass-fucking them, when they get uppity. You are my task-master, my king, and you have great responsibility.”</i>");
		output("\n\nThis is all getting out of hand... you open your mouth to demand, persuade, explain that you don’t intend to hang around here... but the words come out in an uncertain stutter. You’ve gotten so used to just doing whatever the sexy, tinpot tyrant wants that you cannot summon the authority. She smiles winningly, and slides from her chair over into yours. Her armor is a slithering whisper as it parts.");
		output("\n\n<i>“Shh. Don’t worry your " + pc.mf("handsome", "pretty") + " head about anything - I know what I’m doing. And besides,”</i> she whispers, taking your hand and placing it on her pliant inner thigh, <i>“What you need to concentrate on is getting me with child. The raskvel can’t do it, but you? Raskvel and gabilani alike swear that sky-treats make for excellent studs. You, my strong, virile king, you’ll give me my dynasty, won’t you? You’ll stay, and raise your princes and princesses to inherit an empire.”</i>");
		output("\n\nYour [pc.cock] has sprung into burning erection like a loyal pet in response to her words, and you are unresisting as you enter her flush, silken hole, her hips meeting yours and moving slowly on top of you, whispering little groans and words of encouragement into your ear, her sizable breasts pillowed against your [pc.chest]. When you cum, one spasm after another shaking your body as you expend yourself deep inside the sydian, it’s as if some of your thoughts go with it, lost in all that wonderful, sodden give.");
		output("\n\nWhen you come down, you find yourself slightly more relaxed about the situation. Alright, so you’ll hang around a bit, slay some wicked orange puss, order some girly boys around. It’s a pretty sweet deal, and as soon as you’re not feeling it anymore, you’ll just slip out one night, right? You grin up at your queen, and she smiles back, laying a maternal kiss on your brow.");
		output("\n\n<i>“I’m glad you understand,”</i> she husks, smooth, clawed hands sliding up and down your back. <i>“My good, strong king. Now... why don’t you go whip those raskvel into shape?”</i>");
		output("\n\nA little while later, a raskvel boi presents you with a steaming platter of a sort of muddy curry-like dish, garnished with spunkshrooms. It’s actually quite tasty.");
		
		addButton(0,"Next",sydianQueenBadEnd,1);
	}

//Willpower -80%, Lust +80%
	if (sceneChoice==1)
	{	
		pc.willpower(pc.willpower() / 5, true);
		pc.libido(100);
		output("It’s many months later. As is normally the case these days, you’re hard at work in the War Room. You clap your [pc.hips] into the supple rump of the squealing raskvel femboy you’ve got bent over the table, finally driving your [pc.cock] into his delightfully tight back passage as far as you can before unloading great, thick gushes of [pc.cum] with one heavy, groaning throb after another; coaxed on by the wet suction and soft, liquid movements wrapped around your great testicles.");
		output("\n\nNow that the deep, swimming lust that clouds your mind has dissipated, you can think clearly again - at least for a while. You dismiss your raskvel aide, and allow the female sydian under the desk to unfasten from your balls. She looks up at you with a touching mixture of adoration and fear, lips varnished with saliva and ball-sweat. This one is a slave, the once-haughty eldest daughter of a chieftain that dared to defy you. It took a little while to accommodate her to her new role in life, but you’ve gotten experienced at instilling obedience amongst Tarkus’s natives. You dismiss her too with a fondle of the feathers and a slap on the ass, leaving you alone with your thoughts.");
		output("\n\nThings happened rapidly after you chose to stay in the pleasure barrow that first time. Too rapidly, really, for your lust-steeped mind to properly process. Freed from the arduous task of looking after her femboy retinue, the Sydian Queen set about recruiting new servants and setting them to conquer the surrounding territory with a ruthless rapacity. You stayed, and trained, and fucked, and instructed, and then fucked some more. Slowly the raskvel became less of a barely obedient rabble and more of a tightly bonded, fearless company of warriors, who looked up to you as their Fuckmaster General.");
		output("\n\nWhenever the thought intruded that you should really slip away from all this, get back to your ship and your quest, somehow Sh’ziad was always there - cooing in your ear, sliding her hand down your shoulder, flicking her feathers at you come-hither and leading you into your newly appointed bedroom, where you’d sink into that orange bliss between her legs and forget about anything for hours. The longer it went on, the harder it was to recall who you once were. Part of that was the taint, working its way into you as you imbibed more alien fluids, more alien food and spent more time in Tarkus’s atmosphere. Your mind reshaped itself, molding itself around the new priorities of your life.");
		if (pc.balls==0)output("\n\nYou sprouted a pair of balls, as your nanobots sensed your new role as a stud. They swelled up over the weeks and months, eventually becoming mighty basketball-sized edifices, the pressure and impatient heat they sent pulsing upwards into you making it harder to think about anything but your libido and how to satiate it.");
		else if (pc.ballDiameter() < 9) output("\n\nYour [pc.balls] swelled up, your nanobots sensing your new role as a stud, eventually becoming mighty basketball-sized edifices, the pressure and impatient heat they sent pulsing upwards into you making it harder to think about anything but your libido and how to satiate it.");
		if (pc.biggestCockLength()< 13) output("Your [pc.cockBiggest] grew outwards at the same time, inch after inch of glorious dick-meat sprouting into being, becoming the thick, veiny, swinging, drooling club of a member befitting a savage king.");
		output("\n\nBy the time Queen Sh’ziad no longer wished to conquer and destroy - for reasons of her midriff growing round and taut, her boobs swelling with milk, her nipples spreading - she had a willing replacement at the head of her small, hardened army in you. You led them on rampages across the continent of Arbetz, seizing loot and bringing villages of raskvel" + (flags["LAPLOVE"] == undefined ? " and sydians":", lapinara and sydians") + " under your vassalage. The pleasure barrow swiftly expanded into a full-blown underground palace, thronged with servants, warriors and slaves, festooned with the glittering spoils of war. The very mention of your name makes Novahome itself tremble.");
		output("\n\nThe baby your Queen bore was human - orange, squalling and bizarrely human - but she loved ");
		if (randoKid==0)output("him");
		else output("her");
		output(" all the more for that, certain that you had imbued her womb with the magic of the stars. Little ");
		if (randoKid==0)output("emperor");
		else output("empress");
		output(" to be, in ");
		if (randoKid==0) output("his");
		else output("her");
		output(" scrap metal crib, looked after by a dozen adoring miniature femboy nurses.");
		output("\n\nThe door opening to the War Room brings you out of your thoughts. It’s the Queen herself, Sh’ziad the Merciless, sashaying in with a teasing smile, avid black eyes fixed on you. Her hand passes over her belly plate, already beginning to stretch over your second child.");
		output("\n\n<i>“You’re looking gloomy, my king,”</i> she proclaims, sweeping around your chair to place her clawed hands on your shoulders. <i>“What is troubling you?”</i>");
		output("\n\n<i>“Just... the past,”</i> you grunt. It’s already becoming hard to remember. Your [pc.groin] throbs, your balls already busily refilling themselves, almost reacting to the presence of their true owner. <i>“What I... used to be... </i>“");
		output("\n\n<i>“You know not to think about that,”</i> she tuts, massaging you in that particular way she has. <i>“Come to the bedroom. Embrace your Queen, make her feel fine. Afterwards we’ll have some slaves attend to us. Oil, fruit, whips... you’ll like that, won’t you?”</i>");
		output("\n\nYou know she’s manipulating you, she’s being doing that from the off, but... you don’t care. You can’t care. A few minutes later you’re in bed deep between her thighs, and with every delicious thrust of your thick breeder cock into her simmering heat, every buzzing, delighted moan you draw out of your pregnant, lusty queen, a few more of your worries and memories slip away. Forgetting is the sheerest bliss.");
		pc.lust(80);
		badEnd("THE END.");
	}
}