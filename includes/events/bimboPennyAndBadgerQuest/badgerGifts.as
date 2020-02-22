//By that AbeESeedy Guy!


/*==============================
flags["BADGER_QUEST"] - tracks most stuff
 -3 = shot badger with own gun.
 -2 = gun reprogrammed by Dr. Lash for use on Penny.
 -1 = gun handed to penny.
 1 = accepted job and got gun from badger.
 2 = bimbofied penny
 3 = collected payment
 ==============================*/

public function abeAuthor():void
{
	author("Abe E. Seedy");
}

public function pcBimboedByBadger():Boolean
{
	return (flags["DR_BADGER_BIMBOED_PC"] != undefined);
}
public function pennyIsCumSlut():Boolean
{
	return (flags["PENNY_IS_A_CUMSLUT"] != undefined);
}
public function pcHasBadgerForm():Boolean
{
	if(pc.longestCockLength() >= 11 && pc.biggestTitSize() >= 8 && pc.bRows() == 1 && pc.cockTotal() == 1 && pc.balls == 2 && pc.totalVaginas() == 1 && ((pc.tailCount == 1 && pc.tailType == GLOBAL.TYPE_BADGER) || pc.hasCockTail() || pc.hasTailgina()) && pc.hasFur() && pc.furColor == "black" && pc.isBiped() && pc.armType == GLOBAL.TYPE_BADGER && pc.faceType == GLOBAL.TYPE_BADGER && pc.earType == GLOBAL.TYPE_BADGER && pc.femininity >= 75 && pc.lipMod >= 1 && pc.hasPerk("Easy") && pc.hasPerk("Inhuman Desire") && pc.hasPerk("Breed Hungry"))
	{
		return true;
	}
	return false;
}
public function resetDrBadgerBimboTF():void
{
	//IF PC BODYTYPE IS THIN/NOT PLUMP
	if(pc.thickness < 75) 
	{
		pc.thickness = 75;
	}
	//IF PC DOES NOT HAVE TWO LEGS
	if(pc.legCount != 2) 
	{
		pc.legCount = 2;
		pc.genitalSpot = 0;
		pc.legType = GLOBAL.TYPE_HUMAN;
		pc.clearLegFlags();
		pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
	}
	//IF PC HAS GOO-SKIN
	if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) 
	{
		pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
		pc.clearSkinFlags();
	}
	//IF PC DOES NOT HAVE BREASTS
	if(pc.biggestTitSize() < 1)
	{
		pc.breastRows[0].breastRatingRaw = 8 + rand(4);
	}
	//IF PC HAS SMALLER THAN VERY LARGE BREASTS
	if(pc.biggestTitSize() < 8)
	{
		pc.breastRows[0].breastRatingRaw = 8 + rand(4);
	}
	//IF PC HAS MORE THAN ONE SET OF BREASTS
	if(pc.bRows() > 1)
	{
		while(pc.bRows() > 1)
		{
			pc.removeBreastRow(1,1);
		}
	}
	//IF PC DOES NOT HAVE A COCK
	if(!pc.hasCock())
	{
		pc.createCock();
		pc.cocks[0].cLengthRaw = 11;
		pc.cocks[0].cockColor = "black";
	}
	//IF PC HAS A SMALLER THAN VERY LARGE COCK
	else if(pc.biggestCockLength() < 11)
	{
		pc.cocks[0].cLengthRaw = 11;
	}
	//IF PC HAS MORE THAN ONE NON-TAIL COCK
	if(pc.cockTotal() > 1)
	{
		while(pc.cockTotal() > 1)
		{
			pc.removeCock(1,1);
		}
	}
	//IF PC DOES NOT HAVE BALLS
	if(pc.balls == 0)
	{
		pc.balls = 2;
		pc.ballSizeRaw = 4;
		if(pc.cumMultiplierRaw < 60) pc.cumMultiplierRaw = 60;
		if(pc.ballEfficiency < 120) pc.ballEfficiency = 120;
	}
	//IF PC HAS SMALLER THAN LARGE BALLS, OR HAS LESS THAN LARGE CUM PRODUCTION
	if(pc.maxCum() < 500 && pc.balls > 0)
	{
		if(pc.ballSizeRaw < 4) pc.ballSizeRaw = 4;
		if(pc.cumMultiplierRaw < 60) pc.cumMultiplierRaw = 60;
		if(pc.ballEfficiency < 120) pc.ballEfficiency = 120;
	}
	//IF PC HAS MORE THAN ONE SET OF BALLS
	if(pc.balls > 2)
	{
		pc.balls = 2;
		pc.ballSizeRaw += pc.ballSizeRaw/2;
	}
	//IF PC DOES NOT HAVE A VAGINA
	if(!pc.hasVagina())
	{
		pc.createVagina();
		pc.vaginas[0].wetnessRaw = 3;
		pc.vaginas[0].loosenessRaw = 2;
		pc.vaginas[0].bonusCapacity = 20;
		pc.vaginas[0].vaginaColor = "black";
	}
	//IF PC HAS A LESS THAN DEEP VAGINA, OR LESS THAN CONSTANTLY DRIPPING FEMCUM PRODUCTION
	else if(pc.hasVagina())
	{
		if(pc.vaginas[0].bonusCapacity < 20 || pc.vaginas[0].wetnessRaw < 3)
		{
			pc.vaginas[0].bonusCapacity = 20;
			pc.vaginas[0].wetnessRaw = 3;
		}
	}
	//IF PC HAS MORE THAN ONE NON-TAIL VAGINA
	if(pc.totalVaginas() > 1 && !pc.hasWombPregnancy())
	{
		while(pc.totalVaginas() > 1)
		{
			pc.removeVagina(1,1);
		}
	}
	//IF PC HAS NO ASSHOLE
	//IF PC HAS A NON-LUBRICATING ASSHOLE
	if(pc.ass.wetnessRaw < 2)
	{
		pc.ass.wetnessRaw = 2;
	}
	//IF PC HAS A NON-COCK/VAGINA TAIL
	if(!pc.hasCockTail() && !pc.hasTailgina() && pc.tailCount > 0) 
	{
		pc.tailCount = 1;
		pc.tailType = GLOBAL.TYPE_BADGER;
		pc.clearTailFlags();
		pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		pc.addTailFlag(GLOBAL.FLAG_FURRED);
	}
	//IF PC DOES NOT HAVE A TAIL
	if(pc.tailCount == 0)
	{
		pc.tailCount = 1;
		pc.tailType = GLOBAL.TYPE_BADGER;
		pc.clearTailFlags();
		pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		pc.addTailFlag(GLOBAL.FLAG_FURRED);
	}
	//IF PC DOES NOT HAVE FUR
	if(pc.skinType != GLOBAL.SKIN_TYPE_FUR)
	{
		pc.skinType = GLOBAL.SKIN_TYPE_FUR;
		pc.clearSkinFlags();
		pc.addSkinFlag(GLOBAL.FLAG_THICK);
		pc.addSkinFlag(GLOBAL.FLAG_FLUFFY);
		pc.furColor = "black";
	}
	//IF PC HAS NON-BLACK FUR
	if(pc.skinType == GLOBAL.SKIN_TYPE_FUR && pc.furColor != "black")
	{
		pc.furColor = "black";
	}
	if(pc.legType != GLOBAL.TYPE_SUCCUBUS && pc.isBiped())
	{
		pc.legType = GLOBAL.TYPE_SUCCUBUS;
		pc.clearLegFlags();
		pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
		pc.addLegFlag(GLOBAL.FLAG_HEELS);
	}
	if(pc.armType != GLOBAL.TYPE_BADGER)
	{
		pc.armType = GLOBAL.TYPE_BADGER;
		pc.clearArmFlags();
		pc.addArmFlag(GLOBAL.FLAG_FURRED);
	}
	if(pc.faceType != GLOBAL.TYPE_BADGER)
	{
		pc.faceType = GLOBAL.TYPE_BADGER;
		pc.clearFaceFlags();
		pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
	}
	if(pc.earType != GLOBAL.TYPE_BADGER)
	{
		pc.earType = GLOBAL.TYPE_BADGER;
		pc.clearEarFlags();
		pc.addEarFlag(GLOBAL.FLAG_FURRED);
		pc.earLength = 1;
	}
	if(pc.femininity < 75) pc.femininity = 75;
	if(pc.lipMod < 1) pc.lipMod = 1;
	//Give PC “Dumbfuck” perk, set at unlock level 9 (Breed-Hungry: +5 fertility rating and balls fill to halfway much faster than normal)
	//Easy Perk
	if(!pc.hasPerk("Easy")) pc.createPerk("Easy",20,0,0,0,"Gain 20% more lust from combat sources.");
	//Inhuman Desire
	if(!pc.hasPerk("Inhuman Desire")) pc.createPerk("Inhuman Desire",15,0,0,0,"Increases maximum lust by 15.");
	//Breed-Hungry perk
	if(!pc.hasPerk("Breed Hungry")) pc.createPerk("Breed Hungry",15,0,0,0,"Increases speed that semen is created at and the pregnancy speed.");
	if(!pc.hasPerk("Ditz Speech")) pc.createPerk("Ditz Speech",0,0,0,0,"Alters dialogue in certain scenes.");
	//[Reduce PC intelligence by 30 to minimum of 20]
	if(pc.libido() < 30) pc.libido(10);
	if(pc.libido() < 50) pc.libido(10);
	if(pc.libido() < 70) pc.libido(10);
	flags["DR_BADGER_BIMBOED_PC"] = 1;
	//[Add the following as one of the random Tease attack texts: “You shake what Dr. Badger gave you, running your hand happily over your bimbo body to accentuate your slutty appeal to your opponent.”]
}
public function pennyBimbofy(cockEnlarge:Boolean = false):void
{
	flags["PENNY_BADGER_BIMBO"] = 1;
	flags["PENNY_IS_A_CUMSLUT"] = 1;
	flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] = 3;
	penny.breastRows[0].breastRatingRaw += 6;
	penny.hipRatingRaw += 4;
	penny.buttRatingRaw += 4;
	if(!penny.hasCock())
	{
		penny.createCock();
		penny.cocks[0].cLengthRaw = 14;
		if(rand(5) == 0) penny.cocks[0].cType = GLOBAL.TYPE_EQUINE;
		else penny.cocks[0].cType = GLOBAL.TYPE_CANINE;
	}
	else if(cockEnlarge && penny.hasCock()) penny.cocks[0].cLengthRaw += 2 + rand(4);
	if(penny.balls == 0)
	{
		penny.balls = 2;
		penny.ballSizeRaw = 7;
	}
	else penny.ballSizeRaw++;
	penny.ballEfficiency = 9998;
	penny.cumMultiplierRaw = 75;
	penny.vaginas[0].bonusCapacity += 20;
}

//JOB
public function drBadgerJobOffer():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	//IF PC WAS BIMBO-IFIED BY DR BADGER
	if(pcBimboedByBadger())
	{
		output("Dr. Badger saunters over, stroking her gloved hand casually over your head. You lean into it instinctively, eyes closing in bliss at the contact.");
		output("\n\n<i>“Now then pet, I have a job for you.”</i> Her hand sweeps down to scratch under your chin, melting as she holds your face up to look at her. <i>“Doesn’t that sounds nice? A nice little job to prove how good and useful you can be?”</i>");
		output("\n\nIt does sound nice. Everything sounds nice, but being useful and good like that sounds <i>especially</i> nice. Almost as nice as fucking. Maybe if you’re good enough you’ll get to be fucked! You lick your lips happily at the thought, savoring the wetness that is already starting to drip down over your chin.");
		//IF PC HAS LOST THEIR BADGER FORM = 
		if(!pcHasBadgerForm())
		{
		 	output("\n\n<i>“But first,”</i> the doctor adds tauntingly, <i>“we’ve got to take care of the unlicensed modifications you’ve made, don’t we? If you’re going out on a big important mission for me, we’ve got to have you looking the part...”</i>");
		 	output("\n\nWith no more warning than that you feel the sharp sting of a needle being pressed into your skin, and then a warm, tingling sensation spreading out inside your flesh. The change that follows comes quickly, especially given how you lean into it, knowing how much it means to the doctor. In moments you’re staring up at her lovingly along your badger snout once again, shivering as she strokes your black and white fur, and with your cock stiffening in anticipation over your dripping wet slit. <b>You are back to being the same badger form as you were after first meeting Dr. Badger!</b>");
		 	resetDrBadgerBimboTF();
		}
		output("\n\n<i>“Now then!”</i> she continues, I suppose you’re wondering what a simple little bimbo like you could do to help me? Well, the truth is, there’s a surprising number of people who want to shut me down.”</i>");
		output("\n\nYou can’t help but gasp. Who would want to do something like that?");
		output("\n\nDr. Badger acknowledges your shock with a smile, putting one hand delicately on her substantial chest in a gesture of exaggerated innocence. <i>“I know! That some people would want to stop </i>me<i>, the great Doctor Badger, when all </i>I<i> want to do is make people feel every bit as nice and lovely as you do!”</i>");
		output("\n\nAs she speaks she runs her spare hand down the side of your face, her lightly clawed fingers brushing gently along your fur. It feels heavenly. Who could possibly be against this? Whoever they are, you stiffen your lip and promise yourself then and there that you’ll do everything you can do setting them straight.");
		output("\n\n<i>“What can I do?”</i> you ask.");
		output("\n\nDr. Badger pulls away, causing you to almost fall over forwards as you unthinkingly lean in to try to follow her. She doesn’t seem to notice your slight stumble however, and instead moves back over towards a desk in the corner, pulling out a battered tablet.");
		output("\n\n<i>“The law might not be </i>particularly<i> strong out here yet,”</i> she says as she flicks through a few menus, <i>“but there’s still enough of a presence to keep me from being as active as I’d like. I gotta keep my head down, not kicking up enough of a fuss for anyone to report me. But, I’ve found that there’s only one police officer stationed on a nearby world that anyone could actually report me to directly. If someone were to take care of them, then any response time the law could muster would be much too slow to be a problem.”</i>");
		output("\n\nShe walks back over, handing you the tablet that now shows an official picture of a fox-like girl in uniform. <i>“Her name is ‘Penny’, apparently. Stationed on a planet called Mhen’ga.”</i>");
		//IF PC HAS ENCOUNTERED PENNY
		if(pennyIsCrew()) output("\n\nYou wisely avoid mentioning that you have her on your ship right now.");
		else if(flags["MET_PENNY"] != undefined) output("\n\nYou know Penny! This will be fun!");
		output("\n\nAfter setting down the tablet, Dr. Badger hands over a small... gun... thing. It looks like some kind of energy weapon, but it’s all rounded but pointy, like the kind of future they used to think things would look like in the past.");
		output("\n\n<i>“This is a very special gun,”</i> the doctor explains. <i>“I made it very carefully so it would only work on Penny - I can’t have you going and bimbo-ifying the whole galaxy, can I? After all, that’s </i>my<i> job.”</i>");
		output("\n\nShe pets you once more on the head as you stare thoughtfully at the gun-thing in your hands, and your tail waggles with unthinking glee as you look back up at her grinning face.");
		output("\n\n<i>“Well, run along then pet, and show that mean ol’ cop how good it can feel being one of Dr. Badger’s bimbos!”</i>");
		pc.changeLust(15);
	}
	//IF PC WAS NOT BIMBO-IFIED BY DR BADGER
	else
	{
		output("<i>“A job?”</i> you ask. <i>“Why would I take a job from you?”</i>");
		output("\n\nFor a second, Dr. Badger manages to look hurt, despite all her mad scientist trappings. <i>“Why, for </i>Science<i>, surely! What other reason could you possibly need, aside from assisting the pursuit of...”</i> She pauses, running one clawed hand along the side of her skin-tight bodysuit and slapping herself on her considerable rump. <i>“..the very best kind of knowledge?”</i>");
		output("\n\nYou stare at her wordlessly, not dignifying that with a response. Eventually, she rolls her eyes.");
		output("\n\n<i>“Fine,”</i> she sighs, <i>“if you really need more mundane incentivization, then I’ll just pay you.”</i>");
		output("\n\nYou stay silent, simply raising an eyebrow as you look around at her ramshackle ‘lab’.");
		output("\n\nShe takes your hint. <i>“I know, it doesn’t look like I can even afford four solid walls, let alone spare enough credits to pay you for your time. But, appearances can be deceiving. Money isn’t my problem, my problem is not being able to spend it because I have to lay low.”</i> She looks up at you with a fierce grin. <i>“But, that’s where </i>you<i> come in.”</i>");
		output("\n\nTurning away for a moment, she digs through a nearby pile of random tech and/or garbage, eventually pulling out a small tablet. Flicking through a few menus, she brings up the image she was searching for and shows it to you, an official-looking mugshot of a fennec fox woman in a galactic police uniform.");
		if(flags["MET_PENNY"] != undefined) output(" It’s Penny. You recognize her easily - she’s pretty unique, after all.");
		output("\n\nDr. Badger turns the tablet back to herself, bringing up some additional information. <i>“I’ve been investigating, and it turns out if anyone </i>did<i> want to report my activities, for some reason, then this is the closest U.G.C. Peacekeeper. If the good officer here was somehow no longer a problem, then I’d only have to worry about concerned citizens firing off long-distance messages to HQ, and those are </i>much<i> easier to intercept.”</i>");
		output("\n\n<i>“Wait,”</i> you respond, <i>“are you saying you want me to </i>kill<i> a U.G.C. officer?”</i>");
		output("\n\nOnce again, Dr. Badger manages to look shocked, although this time it seems genuine rather than put on. <i>“Oh no, of course not! What a senseless waste that would be! No, I’d just like you to give the lovely officer here some... other priorities. And maybe a nice, obedient disposition, together with a positive opinion of me - oh, and you too, of course.”</i>");
		output("\n\nSeeing your confused expression, she turns around again for a few seconds, turning back to hand you a small, weird-looking pistol. It looks like some ancient raygun, something that would have turned up in the oldest holovids when they were trying to imagine what guns people would use in space. Despite the styling of it, it is quite compact, and would be easy to conceal.");
		output("\n\n<i>“That’s my latest creation,”</i> Dr. Badger says as you examine the weapon in your hands, <i>“my Portable Personalised Badger BimboRay. Patent pending,”</i> she adds with a grin. <i>“It’s specifically calibrated to work on this officer...”</i> Her eyes flick back down to the tablet for a second to remind herself of the details. <i>“...Penny, stationed on Mhen’ga. So all you need to do is point this at her and click, and the wonders of Science will do the rest. As for how you should go about it, that’s up to you. But, if my information is correct, you might find her more... amenable to the concept of becoming a big-titted, futa cumslut than you might think. Oh, and before I forget - it’s specially calibrated to work on Penny, so don’t try blasting away at the wildlife, all you’ll do is drain the batteries.”</i>");
		output("\n\nAnd with that, she seems to be done. Turning back to busy herself on some other project buried in a pile of random parts, Dr. Badger doesn’t even look up at you as she says with a grin <i>“good luck - and remember to have fun. What’s the point of Science if you don’t have </i>fun<i> with it, hmm?”</i>");
	}
	//[Give player quest item <i>“Bimbo Raygun,”</i> description <i>“This is the weird, old-timey raygun Dr. Badger gave you to use on Penny. According to her, it won’t work on anyone else.”</i>]
	output("\n\n<b>Quest item gained: Bimbo Raygun!</b>");
	if(!pennyIsCrew()) output("\n\nPenny is on Mhen’ga - you could either use your new toy on her, or perhaps you could tell her about Dr. Badger’s plan and see what she has to say?");
	else output("\n\nPenny is on your ship - you could either use your new toy on her, or perhaps you could tell her about Dr. Badger’s plan and see what she has to say?");
	pc.createKeyItem("Doctor Badger's Bimbo Raygun - Programmed for use on Penny.",0,0,0,0);
	flags["BADGER_QUEST"] = 1;
	processTime(11);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//TALK TO PENNY ABOUT DR BADGER
public function warnPennyAboutDoctorBadgersNefariousSchemes():void
{
	clearOutput();
	showPenny();
	abeAuthor();

	//IF PC WAS NOT BIMBOIFIED BY DR BADGER AND PENNY IS NOT CUMSLUT
	if(!pcBimboedByBadger() && !pennyIsCumSlut())
	{
		if(!pennyIsCrew()) output("Penny perks up as you approach. <i>“What’s up [pc.name]?”</i>\n\n");
		output("You decide the direct approach is the best. <i>“Have you ever heard the name ‘Dr. Badger’?”</i>");
		output("\n\nFrowning, Penny thinks for a moment. <i>“The name does ring a bell, yeah, I think there was something about someone named that, some report or something...”</i>");
		output("\n\nShe turns to her computer, and does a quick search before answering. <i>“Ah, gotcha! There was a bulletin put out about her a little while ago, some mad scientist-type that we’re supposed to be on the lookout for. I remember thinking that if she was too extreme for Xenogen then she must be </i>really<i> wild. I thought about chasing her down, but there’s no information on where she is now, just that she was reported to be somewhere in the area." + (pennyIsCrew() ? " Plus, I’m not exactly a police officer anymore.":" Plus, I can’t exactly leave my post to go hunting for some big catch.") + "”</i> She reads some more, her ears flattening a little involuntarily. <i>“Yeesh, maybe it’s good that I didn’t go after her - it says here the official advice is not to try to bring her in with anything less than a full squad. Apparently the last time someone tried to do it singlehandedly she wiped the floor with them with all sorts of illegal mods and subdermal strength-boosters.”</i>");
		output("\n\nShe stops suddenly as something occurs to her. <i>“Wait, why do you ask? Have you had a run-in with her? Do you know where she is?”</i>");
		output("\n\nYou nod, taking out the Bimbo Raygun Dr. Badger gave you and putting it down on Penny’s desk. <i>“Yep. Apparently she’s worried that you could bring the authorities down on her, so she asked me to use this on you. She made it specifically with you in mind, apparently, so it won’t work on anyone else.”</i>");
		output("\n\nPenny’s expression is a mix of confusion and shock - the fact that a renowned and dangerous criminal is targeting her specifically enough to momentarily overcome her tough persona. Eventually she says <i>“Why, what does that do?”</i>");
		output("\n\n<i>“She called it a ‘Bimbo Raygun’,”</i> you answer with a shrug. <i>“Having met Dr. Badger, I’m pretty sure it does exactly what it sounds like.”</i>");
		output("\n\nThere’s a pause, one that goes on slightly longer than you would have expected. For a second, you could swear you can see a slight blush spreading out over Penny’s fur. Before you can do anything more than register that though, she self-consciously scowls.");
		output("\n\n<i>“Well, uh, thanks for not doing that then [pc.name], obviously." + (pennyIsCrew() ? " It would make it hard to get anything done if I was screwing aliens - and you - all day long. Wouldn’t it?":" It would make it pretty hard for me to do my job if I was just some sort of, sex-crazed bimbo.") + "”</i>");
		output("\n\nYou get the distinct impression that the idea definitely has <i>some</i> appeal to her, but she’s a bit too committed to her " + (pennyIsCrew() ? "life on the frontier":"job") + " to go along with it. <i>“So, what should we do now?”</i> you ask.");
		output("\n\nPenny’s eyes were a little unfocused, but your question snaps her out of it. <i>“Well, I guess our first option is doing just what she’s afraid of. I could put a report through " + (pennyIsCrew() ? "to some connections of mine":"the priority channel") + ", and I’m pretty sure HQ could send a big enough team that even someone like Dr. Badger wouldn’t be able to get away. Or...”</i>");
		output("\n\nYou raise an eyebrow. <i>“Or?”</i>");
		output("\n\nPenny grins, her claws flexing lightly against the desk. She might have been taken aback before, but clearly now she’s recovered enough for her normal fierce dominance to re-emerge. <i>“Well, normally I’d have left it at that, but if she wanted to make it personal - maybe we should see about turning the tables on her. I could look around and see if I can find anyone who can modify that weapon she gave you, see if we can get it so it will work on </i>her<i> instead.”</i> She licks her lips. <i>“Sound like fun?”</i>");
		//[ZAP PENNY OPTION NOT AVAILABLE]
		flags["NO_ZAP_PENNY"] = 1;
	}
	//IF PC WAS NOT BIMBOIFIED BY DR BADGER AND PENNY IS A CUMSLUT
	else if(pennyIsCumSlut() && !pcBimboedByBadger())
	{
		if(!pennyIsCrew())
		{
			output("<i>“Hey there [pc.name],”</i> Penny says, leaning back in her chair while she casually jerks herself off. She’s already naked, and has more than a few splashes of her own cum dotted about her body as it is, but it looks like she’s working on giving herself another full coat. <i>“You... mhmmm... want to get in on this?”</i>");
			output("\n\nFor now, you decline her invitation. ");
		}
		output("<i>“Does the name ‘Dr. Badger’ mean anything to you?”</i> you ask.");
		output("\n\nPenny’s ears " + (pennyIsCrew() ? "droop morosely. <i>“Cop stuff, huh?”</i>":"perk up. <i>“Work stuff, huh? Fine.”</i>") + " With an exaggerated sigh, she shifts forwards to sit at her desk properly, reluctantly releasing her cock to tap at her computer. <i>“You’re lucky I just finished a really good session, otherwise I would </i>not<i> have the focus to deal with this.”</i> She types away for a few seconds, and then pauses, looking down at the sticky strands still connecting her fingers. <i>“And that my terminal still works after all this too,”</i> she adds.");
		output("\n\nYou laugh at her joke, and wait until she’s done typing. <i>“Thought that name rang a bell,”</i> she says eventually. <i>“Big time sex mad scientist, yeah? There was a bulletin put out about her a while ago, and I remember noticing because I thought she could be a useful source of Throbb. But the trail was dead, and I couldn’t leave my post " + (pennyIsCrew() ? "back on Mhen’ga":"here") + " to go flying off after her just to get myself a nice cock.”</i> She reads on a little, her ears flattening involuntarily. <i>“On second thoughts, it’s probably best I </i>didn’t<i> go after her. Looks like the last time a cop showed up at her door she wiped the floor with them, with all sorts of subdermal strength boosters and illegal combat mods. Glad I went with my other backalley contact instead of seeking her out after all.”</i>");
		output("\n\nShe stops suddenly as something occurs to her. <i>“Wait, why do you ask? Have you had a run-in with her? Do you know where she is?”</i>");
		output("\n\nYou nod, taking out the Bimbo Raygun Dr. Badger gave you and putting it down on Penny’s desk. <i>“Yep. Apparently she’s worried that you could bring the authorities down on her, so she asked me to use this on you. She made it specifically with you in mind, apparently, so it won’t work on anyone else.”</i>");
		output("\n\nThere’s a long pause as Penny stares down at the object on her desk, the tension somewhat undermined by the way her cock noticeably stiffens. <i>“Wh... what does that do?”</i> she says.");
		output("\n\n<i>“She called it a ‘Bimbo Raygun’,”</i> you answer with a shrug. <i>“Having met Dr. Badger, I’m pretty sure it does exactly what it sounds like.”</i>");
		output("\n\nPenny trembles. Unthinkingly, her hands drift slowly back towards her shaft. <i>“I, uh, I figured that might be the case. She’s got, uh, quite the rep for that sort of thing.”</i>");
		output("\n\nYou pick the gun up again, toying with it casually as you sit down on the edge of her desk. <i>“So?”</i> you ask simply.");
		output("\n\n<i>“I, uh, what?”</i> Penny stammers. <i>“What do you mean, ‘so’?”</i>");
		output("\n\n<i>“So,”</i> you respond, spinning the gun around to point at her, <i>“what do you say?</i>");
		output("\n\nPenny doesn’t answer, at least not verbally. Instead she gives out a faint moan, a desperate blush spreading out across her face.");
		output("\n\n<i>“What do you say,”</i> you continue, <i>“to going all in? To stopping this halfway measure, and devoting yourself full-time to being a nice little bimbo cumslut?”</i>");
		output("\n\nSuddenly Penny squeaks, her hips thrusting forwards jerkily as her cock starts to cum, thick spurts of jizz arching up onto her face and chest. She folds forwards eagerly, sliding her cock through her lips and squeezing her balls with her spare hand the better to wring herself dry.");
		output("\n\nClearly you’re having an impact, so you decide to keep going. <i>“You like that idea, don’t you?”</i> you tease. <i>“You like the idea of being a big-titted bimbo, with nice full lips just </i>made<i> for wrapping around cocks, and not having any responsibilities but fucking and being fucked...”</i>");
		output("\n\nPenny’s pace picks up even further, so that now she’s moving in a frenzy, one hand frantically jerking herself off while the other presses desperately into her dripping pussy. You can see her cock twitch and bulge as she pumps load after load into her mouth, forcing her to swallow again and again to keep as much of her cum as possible from slipping free from her lips.");
		output("\n\nYou lean in, whispering in her cute, quivering ears. <i>“You know, I bet this will give you an even bigger libido too. Make it so you’ll be able to cum any time, any where, so you can spend every second of every day coating yourself in cum and then lapping it up.”</i>");
		output("\n\n<i>“Fffuuuuck!”</i> Penny gasps, her cock slipping out of her lips as her whole body seemingly locks up. A veritable fountain of cum erupts from her, and it’s all she can do to keep her panting mouth open to let herself taste as much of it as possible as it falls back onto her face. Her hips jerk forwards a few more times, each unthinking thrust accompanied by another spurt of jizz, painting a slowly descending line down her chin to her breasts. All the while you simply look on, innocently observing her reaction as you pose the question.");
		output("\n\nIt takes some time, but eventually Penny regains the power of speech. She’s still a cum-spattered mess, but she manages to pause long enough between long licks at her matted fur to get the words out, at least. <i>“Ffuck [pc.name], you sure know how to pitch something to a girl, don’t you?”</i> She hefts her cock in one hand and raises an eyebrow at you. <i>“Case in point, hm?”</i>");
		output("\n\nYou laugh. Still, the question remains, and eventually Penny returns to it.");
		output("\n\n<i>“I can’t say I’m not tempted. " + (pennyIsCrew() ? "And if there’s one thing I learned from you, it’s that sex can solve pretty much every problem.":"And if there’s one thing I’ve learned it’s that there really isn’t much police work that <i>can’t</i> be solved on this planet by just fucking it, so it’s not like I’d be abandoning my post.") + "”</i> She pauses for a moment as she licks her fingers, savoring the taste of her cum. <i>“Or, well, you said Dr. Badger said that that gun only works on me at the moment. Maybe I could check around in my contacts, see if I could find someone smart enough to change it, make it so that it’d work on </i>her<i> instead. Or fuck, maybe we should just be sensible and report her. Maybe her libido is high enough as it is.”</i>");
		output("\n\nEver so slowly, her head starts to dip back down, her cock pushing back up through her tits. Even for her this is a lot, so she must be <i>really</i> turned on - you doubt you’ll get much more in the way of reasoned discussion out of her. It looks like she’s left it up to you.");
		pc.changeLust(8);
	}
	//IF PC WAS BIMBOIFIED BY DR BADGER AND PENNY IS NOT A CUMSLUT
	else if(pcBimboedByBadger() && !pennyIsCumSlut())
	{
		//IF PC DOES NOT HAVE BADGER FORM
		if(!pcHasBadgerForm())
		{
			output("As you walk over to talk to Penny, the thing Dr. Badger gave you vibrates in your pocket. You slip your hand inside to check on it, only to feel a sharp little sting. There was like, some sort of needle or something hidden in it that jabbed you? Suddenly, you feel your whole body tremble. You stop, doubling over as <b>your form reshapes rapidly, sliding back easily into the same form the doctor gave you. In seconds it’s done, and once again you’re a perfect bubbly, big-chested and big dicked badger bimbo.</b> Wow, you think, it must be <i>super</i> important to Dr. Badger that you look the part when you talk to Penny about this. Oh well! Fortunately she was distracted by something on her screen and didn’t notice your sudden change.\n\n");
			resetDrBadgerBimboTF();
		}
		output("<i>“Hey there!”</i> you say perkily, trotting over towards Penny and perching casually on the edge of her " + (pennyIsCrew() ? "bed":"desk") + ". <i>“What’s up?”</i>");
		output("\n\nPenny looks up at you in confusion. <i>“I was going to ask you the same question [pc.name],”</i> she says slowly. <i>“I know the planet rush is opening up wild new aliens to encounter and... inherit things from, but if " + (pennyIsCrew() ? "I didn’t know you so well":"it wasn’t for the genetic ID scanning system installed over the door") + " I don’t think I would have recognized you. You seem...”</i> There’s a short pause while Penny looks you up and down");
		if(penny.hasCock() && !pennyIsCrew()) output(", and you grin as you hear the quiet sound of Penny’s cock hitting the bottom of the desk");
		else if(penny.hasCock()) output(", and you grin as you see Penny’s cock jump to full attention");
		output(". <i>“...different. I have to say - it’s a good look for you.”</i>");
		output("\n\n <i>“Thanks!”</i> you answer chirpily. <i>“It feels super good too! Do you like my big tits?”</i> You lean forwards, cupping your breasts and pushing them out towards her");
		if (pc.isChestExposed()) 
		{
			output(", letting your bare [pc.nipples] perk before Penny’s eyes.");
			if (pc.isLactating()) output(" Beads of [pc.milkNoun] wet your [pc.breasts] as the vixen stares.")
		}
		else output(", forcing your [pc.chestCover] to strain as your sizeable chest swells outwards.");
		output("\n\n<i>“Uh, yeah,”</i> Penny coughs, reddening rapidly. <i>“Yeah they’re... they’re pretty great...”</i>");
		output("\n\n<i>“Oh! Also - check this out!”</i> You take Penny by surprise as you spin around, moving to sit on one corner facing towards her, with one leg hanging down on either side. Penny only just manages to move back out of the way of your flailing legs");
		if(!pc.isCrotchExposed()) output(", but before she can say anything about this you interrupt her by pulling down your [pc.crotchCovers]");
		output(", letting your thick cock and balls fall freely onto her " + (pennyIsCrew() ? "bed":"desk") + ", your slick pussy already starting to make a mess beneath you. <i>“Look at all </i>this<i>!”</i> you say excitedly. <i>“Isn’t it great?”</i>");
		output("\n\nIt takes you a few moments to realize that Penny isn’t saying anything. Looking up, you see she’s just staring straight forwards at you, her eyes wide and a thin line of drool sliding down from her slightly open mouth.");
		output("\n\n<i>“Well, what are you just </i>looking<i> for silly,”</i> you laugh. <i>“You should get in there and see what it’s all like!”</i>");
		output("\n\nWithout waiting for a response you reach out with one of your bluntly clawed hands, wrapping it around the back of her head and pulling her forcefully inwards. She lands heavily against you, her mouth just happening to wind up at the base of your cock, her tongue sliding for just a second along the length of your dripping slit. <i>“Good, huh?”</i>");
		output("\n\nAfter a few seconds the thought occurs to you that Penny has probably had time to have a good look, and when you let her head go she almost slides back down into her seat.");
		output("\n\n<i>“Holy shiiiiiiit,”</i> she says slowly. <i>“[pc.name], I don’t know </i>where<i> you got those gene mods, but you have </i>got<i> to let me know your source.”</i>");
		output("\n\n<i>“Oh! Oh my goodness, yes!”</i> You slap your head, pouting slightly at your mistake. <i>“I totally forgot, that’s like, totally what I’m even here for!”</i>");
		output("\n\nPenny is having trouble doing anything but grin laciv... lashivi... lustfully, but what you just said gets through to her enough to raise an eyebrow at you. <i>“Wait - what are you here for?”</i>");
		output("\n\nYou press one finger to your lips, thinking for a second before you answer. <i>“Oh, it was like, super important. I had to - oh!”</i>");
		output("\n\nAfter only a moment’s searching, you find the gun Dr. Badger gave you, pulling it out and pointing it playfully at Penny. <i>“I was supposed to give you a good hard zapping!”</i>");
		output("\n\nPenny tenses up, clearly alarmed. You suddenly realize that if you hadn’t helped her out and earned her trust she might have thought she needed to fight you, but right now she’s giving you the benefit of the doubt. <i>“You were supposed to shoot me?”</i>");
		output("\n\n<i>“Not in a bad way!”</i> you say quickly. <i>“This is a very special gun-thing, specially made to work only on you, given to me by the very special Doctor Badger! She wants me to use it on you to make sure she can...”</i> You stop, once again putting one finger to your lips as you try to remember the rest of what she said. <i>“Uhh... something. Something good! But I super remember that the important thing is that this is going to make you all nice and hot and slutty and bimbo like me, and then we can fuck! And I think Doctor Badger then fucks other people too? I dunno, but the </i>important<i> thing is fucking.”</i>");
		output("\n\nPenny doesn’t say anything for a while, just staring at you and blinking. Did you already use the gun-thing on her? Does she need you to explain it again, but simpler? Before you can start though, she does start talking.");
		output("\n\n<i>“I - I have heard of Dr. Badger. There was a bulletin that went out about her. Let me just pull it up...”</i>");
		output("\n\nShe turns back to her computer, tapping away at it and looking some things up. Oh good, this is much better, now you’re just sitting here waiting while she’s like, reading about something or junk. She’s saying some of it out loud too; something about ‘mad scientist’ and ‘surprisingly powerful’ and ‘reporting’ and ‘plan’ and ‘bimbos’ - that last one gets your attention. Maybe Penny’s saying something about if you should zap her or not. You shake your head to focus your eyes again, looking down to see Penny looking up at you expectantly.");
		output("\n\n<i>“Oh, er, could you say that last part again?”</i> you say sheepishly.");
		output("\n\n<i>“Uh, sure,”</i> she answers. <i>“I said, if Dr. Badger made this thing just for me, maybe I could find someone to help us modify it, so we could use it on her instead. If... if we want to do that?”</i> She stops speaking and licks her lips distractedly, her cheeks still blushing red. She’s normally so fierce, it’s so cute to see her all flustered like this! She must really like the new you. Which is nice, because you do too. Oh! She asked you a question!");
		output("\n\n<i>“Right! Or, I could use it on you now, and then we could fuck. Like, a lot. A real, real lot.”</i>");
		output("\n\nPenny can’t stop staring at your cock, especially now that it’s starting to stand straight out from your crotch, sticky drops of pre-cum dripping out from the tip. You slide one finger slowly down the side, shivering at the wonderful slick sensation that makes. <i>“You like it? I’m sure this gun-thing could get you one like this too!”</i>");
		output("\n\n<i>“Yeah,”</i> Penny says quickly, looking away and mumbling a little. <i>“Yeah I guess you could zap me with that or whatever I suppose...”</i>");
		output("\n\nLooks like she’s leaving the choice up to you. Fun!");
		//[REPORT DR BADGER OPTION NOT AVAILABLE]
		flags["NO_REPORTING_DOC_BADGER"] = 1;
	}
	//IF PC WAS BIMBOIFIED BY DR BADGER AND PENNY IS A CUMSLUT
	else
	{
		//IF PC DOES NOT HAVE BADGER FORM 
		if(!pcHasBadgerForm())
		{
			output("As you walk over to talk to Penny, the thing Dr. Badger gave you vibrates in your pocket. You slip your hand inside to check on it, only to feel a sharp little sting. There was like, some sort of needle or something hidden in it that jabbed you? Suddenly, you feel your whole body tremble. You stop, doubling over as your form reshapes rapidly, sliding back easily into the same form the doctor gave you. In seconds it’s done, and <b>once again you’re a perfect bubbly, big-chested and big dicked badger bimbo</b>. Wow, you think, it must be <i>super</i> important to Dr. Badger that you look the part when you talk to Penny about this. Oh well! Fortunately she was distracted by sucking the delicious cock you gave her and didn’t notice your sudden change.\n\n");
			resetDrBadgerBimboTF();
		}
		output("<i>“Hey there!”</i> you say perkily, trotting over towards Penny and perching casually on the edge of her " + (pennyIsCrew() ? "bed":"desk") + ". <i>“What’s up?”</i>");
		output("\n\nPenny doesn’t respond right away. For one, she currently has her mouth full with her own cock, so even if she wanted to talk she like, probably couldn’t. But still, even when you get her attention she doesn’t stop right away - first she looks up at you, and then her eyes go wide, and you can just <i>tell</i> that she totally cums, her dick twitching as she sends another fresh load between her lips.");
		output("\n\n<i>“Like what you see then, lover?”</i> You lean forwards, letting your tits rest on the desk while you brush lightly along the fur of her face.");
		output("\n\nShe looks like she’s going to say something, but then with a giggle you slip your hand around behind her head, pressing her back down against her cock. Her eyes roll back in her head as she goes with it, blissfully sucking herself off once again. Then, it suddenly occurs to you that like, why are you just sitting there and letting her have all the fun? Shifting your grip a little you pull Penny’s head backwards, forcing her mouth reluctantly off her dick. You don’t let it go uncared for for long though, as you quickly replace her mouth with your tits. You let her go to free up both of your hands, using them to press your boobs together and form a better sleeve for her cock, happily starting to move yourself up and down. Penny goes along with this change of plan, although from the way her eyes roll back in her head you’re pretty sure she’d go along with anything right now. It doesn’t take long, soon she tenses up again starts to cum, giving you a nice juicy coating of yummy fresh cum for you to lap up through your nice plump lips. Oh shit, you forgot about your lips! You should have sucked her off, that’s what your lips are <i>for</i>, right? Oh well, there’s plenty of time for that n...");
		output("\n\nLooking back down, you see Penny sitting back heavily in her chair, her eyelids drooping. <i>“Flugh.”</i> she says slowly. Eventually, after she shakes her head and gets her mouth back under control, she tries again. <i>“Fuuuck [pc.name], holy shit. I don’t know what you’ve gotten into to make you all... like that, but fuck me am I a fan of it. If I hadn’t just busted a nut like, three times before you came in I’d probably still be going, but I think even I need a bit of time to recharge now.”</i>");
		output("\n\nYou pout. <i>“Hmff. I </i>guess<i> that’s okay. Like, I suppose not everyone can be always up for sex forever. Well, not unless you got the treatment that I did, like with the ray-thing I’m supposed to zap you with. Oh, would you mind if I just like, jerked off all over you then?”</i>");
		output("\n\nPenny looks up at you, confused. <i>“Wait, what?”</i>");
		output("\n\n<i>“Well,”</i> you answer, twirling a finger around your thick lips, <i>“if we’re going to like, talk and junk, I figure I could at least jerk off on you while we do that.”</i>");
		output("\n\nPenny rolls her eyes. <i>“Okay, first of all - yes of course you should jerk off on me while we talk. But secondly, what was that about being supposed to zap me with something?”</i>");
		output("\n\nYou’ve already shifted your position before she finished talking, setting up with " + (!pennyIsCrew() ? "one knee on her desk and ":"") + "your cock in one hand while your other one cups at your balls. <i>“Oh, right! That was like, super important!”</i>");
		output("\n\nThere’s silence for a few seconds, broken only by the increasingly slick noise of your hand sliding back and forth along the shaft of your long black cock. <i>“Well?”</i> Penny prompts eventually, even as she leans backwards slightly and angles herself to provide you with a better target.");
		output("\n\nYou nod, biting your lip a little to clear your thoughts. <i>“Right! Well, it was a super important mission given to me by the... the person that made me... mhmmm! Made me all nice and... nice </i>slutty<i> bimbo... Doctor... ahm! Doctor BadgAhh!!”</i>");
		output("\n\nYou’re not sure if it’s thinking back to what happened, or even just saying her name, but <i>something</i> about all of that makes you cum, and when you do, you cum like a firehose. Even though Penny’s cock is larger than yours, your output puts her to shame - but that makes sense, right? Her stuff is a happy accident, something you helped shape to make wonderful, but you, and how you are now? You were <i>made</i> for this, made to be a perfect slutty bimbo fucktoy, able to cum again and again and again on command and be productive enough to make sure everyone can have fun. You bite your lip desperately, letting out a cute, high-pitched shriek as your hips buck forwards again and again, and with each thrust a <i>lot</i> of cum spurts out, and most of it lands somewhere on Penny’s body. Her eyes are glazed over, her tail wagging furiously behind her as she spreads herself wide, the better to catch as much of what you’re putting out as possible. Her tongue moves crazily too, zipping around as fast as it can so she can taste as much of your yummy cum as she can fit into her mouth. All of that makes you even <i>more</i> turned on, so you cum even <i>more</i>, which makes Penny enjoy it even more, so you cum more, and so... yeah.");
		output("\n\nThis goes on for a while.");
		output("\n\nEventually you slow down. It’s not that you can’t keep fucking, but you feel like you’ve done what you’re supposed to do here, given that Penny’s pretty much completely coated in sticky white cum now. Oh, but you forgot the zapping again! You wait for a minute or so, only stroking your cock slowly to keep yourself nice and hard (in case Penny decides she needs another coat after all), and eventually she manages to clear enough of herself off that her tongue isn’t 100% busy anymore and she can be bothered talking again.");
		output("\n\n<i>“Dr. Badger was it?”</i> she says eventually. <i>“I like her work.”</i>");
		output("\n\n<i>“Thanks!”</i> you giggle happily. <i>“I think she was worried that you like, wouldn’t or something? So she made this gun-thing that would only work on you, because people could report her to you and then there’d... be like, police and they’d... be bad?”</i> You kinda trail off, half because you can’t quite remember what Doctor Badger had said exactly, and half because you’re distracted how horny you are again. You <i>still</i> haven’t sucked Penny’s cock yet! That doesn’t seem right.");
		output("\n\nShe starts talking again before you can lean in though, so with a huff you decide you should probably leave it for now. <i>“I remember a bulletin going out about her a while ago, actually. Let me just pull it up...”</i>");
		output("\n\nShe turns back to her computer, tapping away at it and looking some things up. Oh good, this is much better, now you’re just sitting here waiting while she’s like, reading about something or junk. She’s saying some of it out loud too; something about ‘mad scientist’ and ‘surprisingly powerful’ and ‘reporting’ and ‘plan’ and ‘bimbos’ - that last one gets your attention. Maybe Penny’s saying something about if you should zap her or not. You shake your head to focus your eyes again, looking down to see Penny looking up at you expectantly.");
		output("\n\n<i>“Oh, er, could you say that last part again?”</i> you say sheepishly.");
		output("\n\n<i>“Uh, sure,”</i> she answers. <i>“I said, if Dr. Badger made this thing just for me, maybe I could find someone to help us modify it, so we could use it on her instead. If... if we want to do that?”</i> She may have cleared the cum off her face, but there’s still a big pool of it clinging to the fur between her tits, and you can see her nostrils flaring as she starts slowly drifting forwards towards it.");
		output("\n\n<i>“Right!”</i> you say. <i>“Or, I could use it on you now, and then we could fuck. Like, a lot. A real, real lot.”</i>");
		output("\n\nPenny is staring straight down at the cum on her chest, and can’t help herself from slipping her tongue out and starting to lick it up, shivering with bliss at the taste of it.");
		output("\n\nYou giggle at how cute she looks, all wrapped up in licking up your cum. <i>“You like it? I’m sure this gun-thing could make it so you can cum all the time like I can!”</i>");
		output("\n\nPenny’s eyes go wide, and her ears stand straight up on her head. <i>“Yesth,”</i> she says quickly, slurring a little given how busy her tongue is. <i>“Yesth holy thshit or we could do that yeah.”</i>");
		output("\n\nLooks like she’s leaving the choice up to you. Fun!");
		//[REPORT DR BADGER OPTION NOT AVAILABLE]
		flags["NO_REPORTING_DOC_BADGER"] = 1;
		pc.lust(100);
		pc.orgasm();
		pc.changeLust(33);
	}
	flags["PENNY_BADGER_WARNED"] = 1;
	clearMenu();
	//Add Text/Buttons
	//[Report Dr. Badger][Turn the tables on Dr. Badger][Zap Penny after talking to her]
	if(flags["NO_REPORTING_DOC_BADGER"] != undefined) addDisabledButton(0,"TurnInBadger","Turn In Doctor Badger","You’ve decided not to turn in Doctor Badger.");
	else addButton(0,"TurnInBadger",turnDoctorBadgerIntoSpacePolice2,undefined,"Turn In Doctor Badger","It’s probably better to play it safe, given how dangerous Dr. Badger seems to be. Get Penny to report her, and have the professionals sort it out.");

	addButton(1,"Turn Tables",turnTheTablesOnBadgertwat,undefined,"Turn the Tables on Dr. Badger","That DOES sound like it could be a fun plan. Show Dr. Badger just how much of a hero you can be...");

	if(flags["NO_ZAP_PENNY"] == 1) addDisabledButton(2,"Zap Penny","Zap Penny","Penny is a bit too dedicated to her job to want to just be a sex-obsessed slut ALL the time. Maybe she has some other fantasy you could use to ease her into this though?");
	else addButton(2,"Zap Penny",zapPennyAfterWarningHer,undefined,"Zap Penny","Go ahead and zap Penny with the Bimbo Raygun, now that it seems like she approves.");
}

//ZAP PENNY AFTER TALKING TO HER
public function zapPennyAfterWarningHer():void
{
	clearOutput();
	showPenny(true);
	abeAuthor();
	//IF PLAYER IS NOT BIMBOIFIED
	if(!pcBimboedByBadger())
	{
		output("You point the raygun at Penny, and in response she whimpers a little with excitement as her cock starts to harden once again. After confirming if she’s sure with a raised eyebrow, a silent question she answers with a short but emphatic nod, you smile, taking just one last moment to savor the anticipation. Then, with a audible ‘click’, you pull the trigger.");
		output("\n\nYou were expecting some bolt of energy, some shining white laser to shoot out and hit her, but instead it’s almost like turning on a flashlight, except the beam it puts out is a suitably bright pink color. It seems... slow, somehow, almost lazy, so it feels kinda like a portable fan you’re holding over someone, except instead of pushing air it’s projecting this slow, thick, pink light. On top of that, given that you’re standing pretty close to her you can clearly see that the cone it’s projecting doesn’t have time to spread out to cover all of her, instead it’s landing in a small circle centered, quite accidentally, right on her chest.");
		output("\n\n<i>“Oh!”</i> she gasps. <i>“That feels... uhnnn...”</i> She trails off, but the fact that she leans back in the chair to provide a better target for the beam completes the thought for her.");
		output("\n\nYou’re happy to go along with her suggestion and keep your aim steady, and it doesn’t take much longer before there’s a reaction as her breasts slowly begin to noticeably swell. Previously they weren’t exactly small, but they weren’t especially large either - at least not compared to some people you’ve encountered - but with each passing second it seems like they’re filling up to another cup size. The sensation is clearly pleasureable too, as Penny confirms as she gives out a quiet earnest moan. She’s sprawled back in her chair, her legs splayed as wide as possible as she relaxes completely into the gentle massaging of the warm pink beam. Well, she’s <i>almost</i> completely relaxed, even though her eyes are closed and her head thrown back in bliss her hands have started moving, one of them sliding down her body to wrap slowly around the heft of her shaft, while the other curls lovingly around her thick balls. By now her tits have attained a quite impressive size - easily as big as some particularly impressive watermelons, looking cutely out of place on her generally trim and toned frame, so given that you apparently have some control over this process you decide to follow her suggestion and shift your focus. You redirect the beam downwards, causing her eyes to shoot open as you target her cock and balls directly.");
		output("\n\nSurprisingly, the beam doesn’t seem to cause an increase in size there. It’s probably for the best - she’s already got far too much to hide away without great effort, anything more and she might have difficulty walking around. Still, that’s not to say there’s no effect - quite the opposite. Her cock visibly <i>throbs</i>, and you can practically hear her balls churn from where you’re standing. The chair skitters out from beneath her as she desperately shifts herself, only stopping from toppling over forwards by catching " + (pennyIsCrew() ? "the edge of the bed":"the edge of the desk") + " with her flailing claws.");
		output("\n\n<i>“Gh-ahhmm! Ahh! Ahhhhhmmmm!”</i> she cries, her whole body twitching and spasming jerkily as a veritable stream of slick pre-cum starts to pour from her cock. You can see her balls pulsing and surging, but... it doesn’t seem like they’re getting any smaller. Just to be sure you turn off the raygun, but although the intensity of Penny’s moans seem to die down as the beam disappears, the slow-bubbling stream of white does not.");
		output("\n\nWith a smile, you make your way around the desk, sitting down right next to her. <i>“Well well,”</i> you say softly, <i>“I </i>am<i> impressed. Dr. Badger did her homework well, it seems.”</i>");
		output("\n\nRoused through the haze of lust and sensation, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\nBefore you answer, you reach one hand around behind Penny’s head, gripping it firmly and pulling it forwards, forcing her to look down at herself. Her new tits get in her way somewhat, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now. You were a cumslut before, and a good one, but now - now you’re </i>made<i> for it. Now you’ll </i>always<i> be cumming.”</i> You shift your grip, holding her with one finger at the bottom of her chin to lift her back up to face you, smiling at her as her hips jerk helplessly, sending a brief spurt of cum onto the ground at the thought. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming raygun at her once again. You start with her ass, the beam rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. The task there complete you shift it upwards, letting the soft pink light fall on her face and head. In response you see her lips plump up too, becoming deliciously full and perfect for sucking an endless amount of cocks. Her long low moans are soon interspersed with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with a long luxurious mane of bright blonde hair. And with that, it looks like she’s done. Well, physically, at least.");
		output("\n\nSetting the raygun down, you lean in over the panting girl. <i>“So,”</i> you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer, clearly having to work to control her breathing enough to talk. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou frown. Is that... it? When you gave her that cock in the first place she was a mess, and now she just feels good? You’re about to say something, but she beats you to it. Letting go of the " + (pennyIsCrew() ? "bed":"desk") + " she falls backwards, her ass cushioning her fall as she lands flat on her back. You think for a second that she might be hurt or in trouble, but when you see the ecstatic look on her face it’s clear that something else is going on.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!”</i> she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
		output("\n\nYou smile, but the ongoing silence soon makes it clear that she’s expecting an answer. <i>“Uh, yeah,”</i> you say, <i>“I convinced you to get it.”</i>");
		output("\n\nPenny pouts. It’s an expression she can pull off pretty well now. <i>“Yeah well duh, but like, have you seen it </i>now<i>?”</i>");
		output("\n\n<i>“I have, yes. That... that was me too.”</i>");
		output("\n\n<i>“Well, thanks!”</i> she answers brightly, clearly missing your bemused tone. <i>“I love it!”</i> The conversation stops as she wraps both hands around her shaft and works at it happily for a few moments, each stroke rewarding her with a burst of thick cum that she catches eagerly in her open mouth. <i>“Oh holy crap, this is, like, </i>amazing<i>! I’m never going to have to not be covered in cum ever again, am I? Please, tell me I’m not!”</i>");
		output("\n\nHer expression as she looks up at you is surprisingly earnest, as though she really does need you to confirm that she’s as much of a bimbo slut as she hopes she is. <i>“No,”</i> you answer confidently, <i>“I’m pretty sure you’re not.”</i>");
		output("\n\nIt’s that, that last moment of confirmation that finally tips Penny over the edge properly. One hand clenches tightly around her cock, while the other spends one wild second flailing urgently until it finds its way around her balls, squeezing them needfully to better milk herself for sweet cum. The resulting orgasm is climactic, a veritable fountain of thick cum pouring out from her cock, arching up over her body and landing on her face and chest. After several seconds of urgent, productive thrusts she shifts to push her cock up through her tits, slickly coating its path the whole way, before eventually she manages to wrap her plump lips around its still-spasming tip. And then she just... doesn’t stop. Her blissful cocksucking goes on for several minutes, and even when you quietly but insistently lift her head back up to talk with her she still keeps cumming quietly, her cock creating an ever-growing pool of whiteness on her dull brown fur. She looks at you attentively while you hold her, but it’s clear that the second you go she’ll go right back to either sucking her cock directly or coating herself with it and then licking up the results.");
		output("\n\n<i>“So, how would you feel about reporting Dr. Badger?”</i> you ask her innocently.");
		output("\n\nShe looks almost hurt, the first time since you zapped her that you’ve seen her expression look anything other than blissful. <i>“Why on earth would </i>anyone<i> want to do that? She’s like, magic! Have you </i>seen<i> my cock? It’s cumming </i>forever<i>. You don’t lock up someone who can do something like that!”</i>");
		output("\n\nWell, looks like mission accomplished - Dr. Badger doesn’t have anything to worry about here.");
		if(!pennyIsCumSlut() && pennyIsCrew()) output(" Of course now that Penny is only good for fucking, she’ll need a job. Maybe she can camwhore while you’re out adventuring?");
		else output(" Penny seems happy too" + (!pennyIsCrew() ? ", and you suspect that in a place like this a police officer whose first resort is to fuck any problems into submission will probably do pretty well.":".") + " You can have fun with this new version of Penny later, but for now you’ve got a payment to collect.");
		processTime(11);
		pc.changeLust(25);
	}
	//IF PLAYER IS BIMBOIFIED AND PENNY DOES NOT HAVE A DICK
	else if(pcBimboedByBadger() && !penny.hasCock())
	{
		output("<i>“So, yes then?”</i> you ask chirpily. <i>“C’mon, it’s super fun!”</i>");
		output("\n\nPenny looks around for a moment, taking in the " + (pennyIsCrew() ? "relatively cramped space of her quarters":"empty little office she works in and looking out the window to the rest of the world outside") + ". <i>“You know what?”</i> she says eventually. <i>“Fuck it." + (pennyIsCrew() ? " You haven’t steered me wrong yet, mate, and I’m pretty sure being a sex-mad fuck-slut is going to be even more fun on the Rush.":" I’m pretty sure a sex-mad bimbo would do an even <i>better</i> job of looking after this place anyway. And I’ve worked hard, I deserve to have some fun, right?") + "”</i>");
		output("\n\n<i>“Totally!”</i> you answer. <i>“And you deserve to have a nice juicy cock too!”</i>");
		output("\n\nPenny blushes, swallowing heavily. <i>“Uh, yeah. Th- that too.”</i>");
		output("\n\nYou point the raygun at Penny, and even though her ears flatten a little in nervousness, she gives one last nod to confirm it. Then, with a loud ‘click’, you pull the trigger.");
		output("\n\nYou were expecting some bolt of energy, some shining white laser to shoot out and hit her, but instead it’s almost like turning on a flashlight, except the beam it puts out is a suitably bright pink color. It seems... slow. Isn’t light supposed to be like, not slow? Well, this light is definitely slow, like you can almost bathe in it rather than just be lit up normally. It doesn’t light up all of her either, just a tight pink circle that you center, with a giggle, right on her chest.");
		output("\n\n<i>“Oh!”</i> she gasps. <i>“That feels... uhnnn...”</i> She trails off, but the fact that she leans back in the chair to provide a better target for the beam makes what she’s thinking clear.");
		output("\n\nYou’re happy to go along with her suggestion and keep your aim steady, and it doesn’t take much longer before there’s a reaction as her breasts slowly begin to grow. Before they weren’t exactly small, but they weren’t especially large either - not as big as yours, definitely - but they quickly begin to catch up. The feeling is clearly pleasureable too, as Penny confirms as she gives out a happy moan. She’s lying well back in her chair, her legs as far apart as possible as she relaxes completely into the gentle massaging of the warm pink beam. Well, she’s <i>almost</i> completely relaxed, even though her eyes are closed and her head thrown back in bliss her hands have started moving, her hands quickly working to take off her clothes, and then once she’s nice and naked they slide down to play happily with her pussy. By now her tits have attained a quite impressive size - about as big as yours now! - looking cutely out of place on her generally trim and toned frame. You suddenly realize that you must have some control over what’s happening to her, so you figure it’s about time to get to work giving her that nice delicious dick you were talking about. You point the beam downwards, causing her eyes to shoot open as you aim at her already dripping slit.");
		output("\n\nThe response there is really fast. It’s like you’re holding one of those really strong magnet things, except instead of... whatever it is magnets pull, it’s pulling at her flesh, especially her cute little clit. Her hips buck as it begins to grow outwards, pulsing and filling, and in a few seconds she’s wrapped one of her hands around it happily.");
		output("\n\n<i>“Yessss!”</i> she slurs, her tongue almost hanging out of her mouth. <i>“Ffuck yeahh, give me th- give me that cock!”</i>");
		output("\n\nGiggling, you lean in closer, hoping to make whatever this all is more powerful. She did ask, after all.");
		output("\n\nPenny can barely say words now, instead she’s just growling and moaning as she slowly begins to move her hand up and down, trembling with pleasure as she starts to jerk herself off properly. <i>“Cc- cock! Cock! Yes! Cock!”</i>");
		output("\n\nShe’s so cute with how <i>super</i> into this cock she is. I mean, you don’t think she’s wrong - your own cock is definitely pretty great - but she hasn’t seen <i>nothing</i> yet. As if on cue you see her shift around in her seat urgently, and then two thick round balls drop out from her body, landing in her other hand which is always massaging them desperately. And then, once her cock has reached, uhhh, well, big - bigger than yours, more than big enough to fit up between her nice juicy tits, and more than big enough to wonderfully fill up your mouth, making you lick your lips in excitement - then her cock <i>throbs</i>, and you can practically hear her balls churn from where you’re standing. The chair slides out from beneath her as she desperately shifts herself, only stopping from falling over forwards by catching the edge of the desk in front of her with her claws.");
		output("\n\n<i>“Gh-ahhmm! Ahh! Ahhhhhmmmm!”</i> she cries, her whole body twitching and jerkily as a big stream of slick pre-cum starts to pour from her cock. You can see her balls pulsing and surging, but... it doesn’t seem like they’re getting any smaller. Just to be sure you turn off the gun-thing, but although Penny’s doesn’t seem to moan quite as loudly once you do that, the thick stream of white doesn’t stop.");
		output("\n\nWith a smile, you make your way around the desk, sitting down right next to her. <i>“Wow!”</i> you say perkily, <i>“Dr. Badger did a great job, huh?”</i>");
		output("\n\nThrough the fog of lust and super good feelings, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\nBefore you answer, you reach one hand around behind Penny’s head, pulling her down to look at the interesting bit. Her new tits get in her way somewhat, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now! You get to be cumming like, all the time. That sounds super good, right? It’s what Doctor Badger decided you were supposed to do, so now you’re </i>made<i> for it.”</i> You lift her head back up, smiling happily at her as she joins you in being one of Doctor Badger’s bimbos. She must like the thought of it too, when you told her she was going to cum all the time her hips had starting jerking forward helplessly, sending several spurts of cum onto the ground. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming gun-thing at her again. You start with her ass - every good bimbo needs a good ass - and clearly the beam agrees, rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. The task there complete you shift it upwards, letting the soft pink light fall on her face and head. Her lips plump up, becoming deliciously full and perfect for sucking an endless amount of cocks. She interrupts her own long low moans with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with totally cute long blonde hair. And with that, it looks like she’s done. Well, her body, at least.");
		output("\n\nSetting the gun-thing down, you lean in over the panting girl. <i>“So,”</i> you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer. You know how that feels - it’s a lot to deal with, just how much less like, <i>thinking</i> you’re doing. It’s not that you’re brainless, but like, you realize how much doesn’t matter anymore. And that’s like, everything to do with not having sex. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou’re about to say something, but she beats you to it. Letting go of the desk she falls backwards, her ass cushioning her fall as she lands flat on her back. For a second you worry that maybe she’s hurt, but when you see the super happy look on her face it’s clear she’s fine.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!”</i> she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
		output("\n\n<i>“I know, right!”</i> you answer excitedly.");
		output("\n\n<i>“Have you seen how much cum I’ve got?!”</i>");
		output("\n\n<i>“I know, right!”</i> you answer excitedly, again.");
		output("\n\n<i>“Well, thanks!”</i> she says happily. <i>“I love it!”</i> The conversation stops for more important things as she wraps both hands around her shaft and works at it for a few moments, each stroke rewarding her with a burst of thick cum that she catches eagerly in her open mouth. <i>“Oh </i>man<i>, this is, like, </i>amazing<i>! I’m never going to have to not be covered in cum ever again, am I? Please, tell me I’m not!”</i>");
		output("\n\n<i>“Nope! You’re going to be a super cum covered bimbo slut for like, all the time.”</i>");
		output("\n\n<i>“Oh holy shiiit, that is like, what I always wanted. Probably? I mean, I really wanted a cock, and like, what else would you do with one other than like, cum everywhere, right?”</i>");
		output("\n\nYou grin. <i>“Oh, I can think of a few things...”</i>");
		output("\n\nBefore she can say anything you’re on top of her, digging your stubby badger claws into her lovely soft tits as you press your cock down towards her dripping wet pussy.");
		output("\n\n<i>“Yes!”</i> she gasps. <i>“Oh yes please fuck me fill me up fuck me fuck me!”</i>");
		output("\n\nYou’re more than happy to agree to her request, sliding your thick cock easily inside her. She’s so <i>wet</i>, and with every thrust you give her you can feel her whole body shudder, another slick burst of cum spraying out from her own cock. <i>“Don’t you love being a super horny bimbo?”</i> you ask.");
		pc.cockChange();
		output("\n\n<i>“Yes! Uhmmnnn! I love it! Oh wow, I... uhmmnn! I am going to suck <i>so</i> much cock!”</i>");
		output("\n\nYou laugh happily. <i>“Yay! Oh there’s something... mhmm... super important!”</i>");
		output("\n\n<i>“Mhmm?”</i>");
		output("\n\nYou stop fucking for a moment and think. What was it? Oh yes! <i>“You’re not going to report Doctor Badger, are you?”</i>");
		output("\n\n<i>“No!”</i> Penny’s answer is loud and clear, and you believe her totally. <i>“Why would I? She did like, magic! She gave me a cock that cums forever! Report her, I want to suck her cock! Wait, she has a cock, right?”</i>");
		output("\n\nGiggling, you say, <i>“she sure does! It looks just like mine!”</i>");
		output("\n\nWhen you say that, Penny looks up around with a gasp, her eyes wide as though she just realized something. <i>“Ohmygoodness - are you Doctor Badger?!”</i>");
		output("\n\n<i>“Wh-,”</i> you start to answer, but then you stop, looking down at your badger hands, fur, and feeling along your badger muzzle. You’re - you’re <i>not</i> Doctor Badger, right? No, that’s totally someone else, there’s no way you’re smart enough to make that gun-thing that did all that wonderful stuff. You don’t have time to say all that to Penny though, because she’s already crawling forward on her knees, looking up at you with love. <i>“Thank you thank you tha-...”</i>");
		output("\n\nHer words cut off as she slides her soft lips around your cock, switching from talking to sucking dick like a pro. You think about correcting her, but her mouth feels <i>really</i> good, and like, well, you did kinda earn this too, right? You came all the way out here. You’ll pass the message along to Doctor Badger anyway. Leaning back, you pat her nicely on the head. <i>“Good girl,”</i> you say softly. <i>“You’re welcome.”</i>");
		output("\n\nYou’re worked up enough that it doesn’t take long, and the sight of Penny reaching one hand down between her own legs to start jerking herself off too is enough to push you over the edge. Penny gulps down your cum eagerly, but eventually you make too much for her to swallow so she slides off your cock, letting your twitching dick coat her back and ass with lovely sticky cream. At the same time she presses herself into the puddle she’s made beneath her, licking loudly at the ground as she tries to get as much cum both on and in her as possible. It’s a look that works <i>super</i> well for her.");
		output("\n\nEventually, after a good few minutes, you’re done. Penny is still happily snuffling about on the floor, but you’re good enough for now to finish up and leave her to it. Mission accomplished! Time to tell Doctor Badger about how you did and what Penny’s like now.");

		if(!pennyIsCumSlut() && pennyIsCrew()) output(" <b>Of course now that Penny is only good for fucking, she’ll need a job. Maybe she can camwhore while you’re out adventuring?</b>");
		processTime(27);
		pc.orgasm();
	}
	//IF PLAYER IS BIMBOIFIED AND PENNY HAS A DICK
	else
	{
		output("<i>“So, yes then?”</i> you ask chirpily. <i>“C’mon, it’s super fun!”</i>");
		output("\n\nPenny tongue is hanging out of her mouth as she pants with lust, so it takes her a little bit to answer. <i>“Fuck yes [pc.name]. I want to be able to cum as much and as hard as possible, again and again and again. Hit me!”</i>");
		output("\n\nYou point the raygun at Penny, and she gives one last nod to confirm it. Then, with a loud ‘click’, you pull the trigger.");
		output("\n\nYou were expecting some bolt of energy, some shining white laser to shoot out and hit her, but instead it’s almost like turning on a flashlight, except the beam it puts out is a suitably bright pink color. It seems... slow. Isn’t light supposed to be like, not slow? Well, this light is definitely slow, like you can almost bathe in it rather than just be lit up normally. It doesn’t light up all of her either, just a tight pink circle that you center, with a deliberate grin, right on her chest.");
		output("\n\n<i>“Oh!”</i> she gasps. <i>“That feels... uhnnn...”</i> She trails off, but the fact that she leans back in the chair to provide a better target for the beam makes what she’s thinking clear.");
		output("\n\nYou’re happy to go along with her suggestion and keep your aim steady, and it doesn’t take much longer before there’s a reaction as her breasts slowly begin to grow. Before they weren’t exactly small, but they weren’t especially large either - not as big as yours, definitely - but they quickly begin to catch up. The feeling must be nice too, as Penny confirms as she gives out a happy moan. She’s leaning back back in her chair, her legs as far apart as possible as she relaxes completely into the gentle massaging of the warm pink beam. Well, she’s <i>almost</i> completely relaxed, even though her eyes are closed and her head is thrown back in bliss her hands have started moving, one of them sliding down her body to wrap slowly around her shaft, while the other cups her thick balls lovingly. By now her tits have gotten super big - about as big as yours, even! - and they look cutely out of place on her trim and toned body. You suddenly realize that you must have some control over what’s happening to her, so you figure it’s about time to get to follow her suggestion and shift your focus. You redirect the beam downwards, causing her eyes to shoot open as you target her cock and balls directly.");
		output("\n\nSurprisingly, the beam doesn’t seem to make her any bigger there. You pout a little, but you <i>guess</i> that’s probably for the best - she’s already pretty huge there, any bigger and she’d have problems walking to the next person she needed to fuck. I mean, what’s the point of a nice bimbo slut if she can’t come to you? Still, something does definitely happen to her there. Her cock <i>throbs</i>, and you can practically hear her balls churn from where you’re standing. The chair slides out from under her as she desperately shifts herself, only stopping from toppling forwards by catching the edge of the desk in front of her with her claws.");
		output("\n\n<i>“Gh-ahhmm! Ahh! Ahhhhhmmmm!”</i> she cries, her whole body twitching and spasming jerkily as a stream of slick pre-cum starts to pour from her cock. You can see her balls pulsing and surging, but... it doesn’t seem like they’re getting any smaller. Just to be sure you turn off the raygun, but although Penny moans a little quieter when the beam disappears, the stream of whiteness pouring out of her keeps right on going.");
		output("\n\nWith a smile, you make your way around the desk, sitting down right next to her. <i>“Wow!”</i> you say perkily, <i>“Dr. Badger did a great job, huh?”</i>");
		output("\n\nThrough the fog of lust and super good feelings, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\nBefore you answer, you reach one hand around behind Penny’s head, pulling her down to look at the interesting bit. Her new tits get in her way somewhat, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now! You get to be cumming like, all the time. She must have known you were a super good little cumslut, but now you’re </i>made<i> for it.”</i> You lift her head back up, smiling happily at her as she joins you in being one of Doctor Badger’s bimbos. She must like the thought of it too, when you told her she was going to cum all the time her hips had starting jerking forward helplessly, sending several spurts of cum onto the ground. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming gun-thing at her. You start with her ass - every good bimbo needs a good ass - and clearly the beam agrees, rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. The task there complete you shift it upwards, letting the soft pink light fall on her face and head. Her lips plump up, becoming deliciously full and perfect for sucking an endless amount of cocks. She interrupts her own long low moans with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with totally cute long blonde hair. And with that, it looks like she’s done. Well, her body, at least.");
		output("\n\nSetting the gun-thing down, you lean in over the panting girl. <i>“So,”</i> you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer. You know how that feels - it’s a lot to deal with, just how much less like, <i>thinking</i> you’re doing. It’s not that you’re brainless, but like, you realize how much doesn’t matter anymore. And that’s like, everything to do with not having sex. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou’re about to say something, but she beats you to it. Letting go of the desk she falls backwards, her ass cushioning her fall as she lands flat on her back. For a second you worry that maybe she’s hurt, but when you see the super happy look on her face it’s clear she’s fine.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!”</i> she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
		output("\n\n<i>“I know, right!”</i> you answer excitedly.");
		output("\n\n<i>“Have you seen how much cum I’ve got?!”</i>");
		output("\n\n<i>“I know, right!”</i> you answer excitedly, again.");
		output("\n\n<i>“Well, thanks!”</i> she says happily. <i>“I love it!”</i> The conversation stops for more important things as she wraps both hands around her shaft and works at it for a few moments, each stroke rewarding her with a burst of thick cum that she catches eagerly in her open mouth. <i>“Oh holy crap [pc.name], I loved cum before, you know that right, but now it’s like - like I actually need it? Like, I feel like I need to have cum on my body and in my mouth as much as I need to like, breathe, except every single time I do it it still feels amazing! I’m never going to have to not be covered in cum ever again, am I? Please, tell me I’m not!”</i>");
		output("\n\n<i>“Nope! You’re going to be a super cum covered bimbo slut for like, all the time.”</i>");
		output("\n\n<i>“Oh holy shiiiit, that is like, what I always wanted. Ever since you told me I wanted that, anyway, and probably before? I mean, I really wanted a cock, and like, what else would you do with one other than like, cum everywhere, right?”</i>");
		output("\n\nYou grin. <i>“Oh, I can think of a few things...”</i>");
		output("\n\nBefore she can say anything you’re on top of her, digging your stubby badger claws into her lovely soft tits as you press your cock down towards her dripping wet pussy.");
		output("\n\n<i>“Yes!”</i> she gasps. <i>“Oh yes please fuck me fill me up fuck me fuck me!”</i>");
		output("\n\nYou’re more than happy to agree to her request, sliding your thick cock easily inside her. She’s so <i>wet</i>, and with every thrust you give her you can feel her whole body shudder, another slick burst of cum spraying out from her own cock. <i>“Don’t you love being a super horny bimbo?”</i> you ask.");
		pc.cockChange();
		output("\n\n<i>“Yes! Uhmmnnn! I love it! Oh wow I... uhmmnn! I am going to suck <i>so</i> much cock!”</i>");
		output("\n\nYou laugh happily. <i>“Yay! Oh there’s something... mhmm... super important!”</i>");
		output("\n\n<i>“Mhmm?”</i>");
		output("\n\nYou stop fucking for a moment and think. What was it? Oh yes! <i>“You’re not going to report Doctor Badger, are you?”</i>");
		output("\n\n<i>“No!”</i> Penny’s answer is loud and clear, and you believe her totally. <i>“Why would I? She did like, magic! She made my cock magic so I could cum forever! Report her, I want to suck her cock! Wait, she has a cock, right?”</i>");
		output("\n\nGiggling, you say, <i>“she sure does! It looks just like mine!”</i>");
		output("\n\nWhen you say that, Penny looks up with a gasp, her eyes wide as though she just realized something. <i>“Ohmygoodness - are you Doctor Badger?!”</i>");
		output("\n\n<i>“Wh-,”</i> you start to answer, but then you stop, looking down at your badger hands, fur, and feeling along your badger muzzle. You’re - you’re <i>not</i> Doctor Badger, right? No, that’s totally someone else, there’s no way you’re smart enough to make that gun-thing that did all that wonderful stuff. You don’t have time to say all that to Penny though, because she’s already crawling forward on her knees, looking up at you with love. <i>“Thank you thank you tha-...”</i>");
		output("\n\nHer words cut off as she slides her soft lips around your cock, switching from talking to sucking dick like a pro. You think about correcting her, but her mouth feels <i>really</i> good, and like, well, you did kinda earn this too, right? You came all the way out here. You’ll pass the message along to Doctor Badger anyway. Leaning back, you pat her nicely on the head. <i>“Good girl,”</i> you say softly. <i>“You’re welcome.”</i>");
		output("\n\nYou’re worked up enough that it doesn’t take long, and the sight of Penny reaching one hand down between her own legs to start jerking herself off too is enough to push you over the edge. Penny gulps down your cum eagerly, but eventually you make too much for her to swallow so she slides off your cock, letting your twitching dick coat her back and ass with lovely sticky cream. At the same time she presses herself into the puddle she’s made beneath her, licking loudly at the ground as she tries to get as much cum both on and in her as possible. It’s a look that works <i>super</i> well for her.");
		output("\n\nEventually, after a good few minutes, you’re done. Penny is still happily snuffling about on the floor, but you’re good enough for now to finish up and leave her to it. Mission accomplished! Time to tell Doctor Badger about how you did and what Penny’s like now.");
		if(!pennyIsCumSlut() && pennyIsCrew()) output(" Of course now that Penny is only good for fucking, she’ll need a job. Maybe she can camwhore while you’re out adventuring?");
		processTime(27);
		pc.orgasm();
	}
	//Adjust Penny's statblock appropriately?
	if(!pennyIsCumSlut() && pennyIsCrew()) 
	{
		pennyBimbofy();
		showPenny();
		flags["BADGER_QUEST"] = 2;
		clearMenu();
		addButton(0,"Next",pennyPostbimboedCamwhoreTalk);
	}
	else
	{
		pennyBimbofy();
		showPenny();
		flags["BADGER_QUEST"] = 2;
		//Set flag that PC zapped Penny.
		clearMenu();
		addButton(0,"Next",moveOutsidePennysOffice);
	}
}

//ZAP PENNY
//[If player has not yet solved Penny’s Zil problem, this option is disabled, with the text:
//She’s too on-guard at the moment to surprise her. Try taking care of her problem first. 
//Also if the player has talked with Penny about zapping her then this option is also disabled, with the text <i>“Now that she knows about this plan, you can’t really surprise her with it anymore”</i>. Otherwise this option should have the text <i>“It would be a real jerk move to just go ahead and zap Penny, but you are getting paid...”</i> if the PC was not bimbo-ified by Dr. Badger, and the text <i>“Why wait to talk about this and junk? Being a bimbo is fun, she’ll love it!”</i> if the PC was]");
public function surpriseZapPennyWithBimboRay():void
{
	clearOutput();
	showPenny(true);
	abeAuthor();
	pc.addHard(20);
	var cockEnlarge:Boolean = false;
	//IF PC WAS NOT BIMBO-IFIED BY DR BADGER AND PENNY IS NOT A CUMSLUT
	if(!pcBimboedByBadger() && !pennyIsCumSlut())
	{
		if(!pennyIsCrew())
		{
			output("The fox cop looks up as you approach. <i>“Oh, hey [pc.name],”</i> she says, <i>“what’s up?”</i>");
			output("\n\nYou answer with a shrug, acting casual so as to make sure she doesn’t pick up on anything. <i>“Not much. Traveling the worlds, fighting and fucking crazy aliens, the usual.”</i>");
			output("\n\nPenny laughs, but trails off into a slightly wistful sigh. <i>“Of course. Sounds great, but some of us have reports to write and dumb-shit colonists to babysit...”</i>");
			output("\n\nShe turns back to her terminal, but you interrupt her before she starts typing again.\n\n");
		}
		output("<i>“Actually, I did run across someone interesting while I was gone. Someone with a message for you.”</i>");
		output("\n\nPenny’s ears perk up, although she looks more confused than excited. <i>“Oh? And what was the message?”</i>");
		output("\n\n<i>“This,”</i> you say simply, pulling out the Bimbo Raygun in one smooth motion and pulling the trigger.");
		output("\n\nPenny jumps up far quicker than you would have expected, her chair skittering out behind her even as one of her hands close around her tonfa. But even so the beam from the raygun hits her dead on, a wide circle in the middle of her body lit up by the soft pink glow. She was clearly just about to launch herself at you, but stops as she registers the complete lack of impact or pain.");
		output("\n\n<i>“Some prank, [pc.name],”</i> she snarls. <i>“You’re lucky I didn’t bash your head it before I realized that was just a toy gun.”</i>");
		output("\n\n<i>“Oh, it’s not a toy,”</i> you answer with a smile. Inwardly, you are at least 90% confident it’s not a toy - Dr. Badger hardly seeming like the <i>most</i> reliable person - but you decide you’re far in enough now that you might as well go with it. <i>“How do you feel?”</i>");
		output("\n\n<i>“Huh?”</i> Penny stops and thinks for a moment, confused. <i>“Normal, of course. Well, actually, maybe a little bit hot... Maybe I should sit down...”</i>");
		output("\n\nBefore you can stop her she goes to sit down, despite the fact that her chair is no longer beneath her. She doesn’t realize that until too late, and so winds up falling with a heavy <i>“oomph!”</i> on her butt. For your part, you manage to step forward quickly to keep " + (!pennyIsCrew() ? "her from being hidden behind her desk, and so keeping ":"") + "the beam of the gun trained on her.");
		output("\n\n<i>“Woah!”</i> Penny says after she’s recovered her breath. <i>“That was dumb. Huh.”</i>");
		output("\n\nYou expect her to get back up, but she doesn’t, instead simply sitting on the ground as though she’s thinking through what exactly happened. Eventually she looks up at you. <i>“That, huh. Whatever that thing you’re using is there, it’s definitely nice and warm.”</i>");
		output("\n\n<i>“Is it?”</i> you answer with mock innocence.");
		output("\n\n<i>“Yeah,”</i> Penny replies, completely missing your tone. <i>“It’s starting to feel pretty... pretty good...”</i>");
		output("\n\nYou lean forward, bringing the gun closer to her and therefore concentrating the beam on her chest. <i>“Is it?”</i>");
		output("\n\nPenny is starting to look flushed, biting her lip and moaning for a second before saying anything more. <i>“Mhmmnn... is that... is that some sort of lust gun or something?”</i>");
		output("\n\nYou shrug. <i>“Or something.”</i>");
		output("\n\n<i>“You uhmm... you could have just asked if you wanted to...”</i> Unconsciously, or perhaps even consciously, Penny’s legs have drifted apart. She’s now sitting on the floor looking up at you, panting a little as her hands roam around increasingly close to her crotch. It’s a good look for her.");
		output("\n\n<i>“Maybe I didn’t want to ask,”</i> you say simply. You speak softly, but with an air of irrefutable authority. <i>“Maybe I wanted to make it so I </i>never<i> had to ask...”</i>");
		output("\n\nPenny is blushing visibly now. <i>“Wh... what do you... what do you mean?”</i>");
		output("\n\n<i>“You can feel it now, can’t you?”</i> You lean in, whispering directly into her ears in a way that makes her whole body tremble. <i>“You can feel that need building inside of you, making you feel all hot and wet and good...”</i>");
		output("\n\n<i>“Yy... I...”</i> Her eyelids flicker as she fights to keep herself from drifting helplessly into it.");
		output("\n\n<i>“It’s okay,”</i> you say, giving her a condescending pat on the head that she can’t help but lean back into a little. <i>“I’m just going to make you a nice bimbo slut, and I’m going to make sure all you can think about is how amazingly good that feels.”</i>");
		output("\n\nAs soon as you say that, Penny’s eyes snap wide open. <i>“Wh- what?!”</i> she stammers. At almost the exact same time however, her hips buck forwards reflexively, and a slick sheen of moisture begins to pool down between her thighs.");
		output("\n\nYou grin. <i>“There we go. I guess some part of you agrees that sounds good after all.”</i> Just then, a thought occurs to you, and you let go of the raygun’s trigger, switching off the beam as you kneel down beside Penny. <i>“Actually, you know what? I can’t just zap you with this gun and turn you into a nice little bimbo slut.”</i>");
		output("\n\nPenny looks genuinely confused for a moment but manages to rally, gritting her teeth and starting to struggle to get to her feet. <i>“No, you c-can’t!”</i>");
		output("\n\nYou grasp her chin, stopping her movement instantly as you pull her head up to look you in the eyes. <i>“No,”</i> you say simply. <i>“You have to </i>beg<i> for it.”</i>");
		output("\n\nShe breaks away from your grasp, but can’t bring herself to make eye contact. She tries to keep her voice firm, but you can hear the hesitance in it as she says <i>“wh- what? Why would I do that?”</i>");
		output("\n\nYou sit back calmly before you answer. There’s no need to try to control her physically after all, you have her in the palm of your hand. <i>“Because you’ve had a taste now, haven’t you? Oh sure, you put on a fierce front, but you know what I think? I think more than anything else, you enjoy losing yourself in sex - that moment when you can just cut loose, let yourself sink down into it and be driven by nothing but your </i>need<i> to fuck and cum.”</i>");
		output("\n\nAt that last word Penny trembles slightly once again, both the blush on her face and the slickness between her legs growing bigger.");
		output("\n\n<i>“I’m right, aren’t I? I thought so. I heard that that was something you just <i>might</i> be interested in.”</i>");
		output("\n\nPenny isn’t trying to talk anymore. Instead her head is hung down slightly, and it looks like she’s concentrating on her breathing. Plus, you’re not sure if it’s just the way she’s sitting or the ray has had some effect already, but you could swear her breasts are straining the inside of her uniform. Gently you reach down and take her head in your hand, lifting her cute little panting muzzle up to face you again. <i>“Here, let me help. I’ll talk you through it, okay?”</i>");
		output("\n\nThere’s the faintest squeak of a moan from Penny in response, which you take as an affirmative.");
		output("\n\n<i>“Okay,”</i> you say softly. <i>“Here’s what’s on offer. I’m going to zap you with this beam thing here, and it’s going to make you a nice little bimbo slut. That means your tits...”</i> You hand shifts as you talk, sliding down to grope at her breasts. Penny leans in helplessly to the sensation. <i>“...are going to get all big and full. So big they’ll never fit into " + (pennyIsCrew() ? "that":"this") + " tight little uniform of yours ever again. Like... this...”</i>");
		output("\n\nWith a few adept movements you undo the buttons of her top, making her tits fall freely out into view - helpfully, it looks like she wasn’t even wearing a bra. <i>“There we go. Doesn’t that feel better?”</i>");
		output("\n\n<i>“Yess...”</i> Penny breathes, so softly that you wouldn’t have heard it if you weren’t so close to her.");
		output("\n\n<i>“But that’s just the beginning,”</i> you continue. <i>“That’s not the only thing a bimbo like you will get. You’ll also get a nice, plump </i>butt<i>!”</i> You reach down further with your hand and grab her ass, making her jump even as she melts forward into your embrace. <i>“All the better to be constantly filled and fucked, hmm?”</i>");
		output("\n\nThere’s no verbal response, but by now she’s audibly panting with need. You decide it’s time to go in for the kill.");
		output("\n\n<i>“But that’s not all. If you act now, then you’ll receive a very special upgrade.");
		//IF PENNY HAS A COCK
		if(penny.hasCock()) output(" An improvement to your current cock, so you can cum and cum and cum as much as you need.");
		else output(" A nice thick </i>cock<i>, so you can cum and fuck and cum and fuck over and over again, always, as much as you need.");
		output(" And trust me, you are going to need to a </i>lot<i>.”</i>");
		output("\n\n<i>“Fffuck!”</i> Penny gasps, so suddenly it genuinely takes you by surprise. <i>“Fuck yes please okay yes please [pc.name] ffuuuck!”</i>");
		output("\n\n<i>“Good answer,”</i> you say with a smile, raising the raygun one more time and pressing the trigger.");
		output("\n\nThis time she leans into the beam, spreading her legs wide to welcome the changes, and accordingly she doesn’t have long to wait. Almost instantly her breasts start to grow, pressing outwards with every shuddering breath she takes. In moments they’re impressively large, easily big enough that it would take two hands for Penny to hold each one. That said, instead of merely holding her new tits she has a much more important use for her hands, sliding one of them urgently inside her pussy while the other feverishly massages her ");
		//IF PENNY DOES NOT HAVE A COCK =
		if(!penny.hasCock()) output("clit");
		else output("cock");
		output(". Soon that too begins to respond, surging outwards in her grip, her tongue hanging out of her mouth in bliss as she wraps her fingers around the growing mass, balls growing in quickly beneath it. She leans back, while at the same time her hips start to move rhythmically forwards, letting her probing fingers imitate the feeling of a nice cock filling her up as she so desperately needs.");
		output("\n\n<i>“Wow [pc.name],”</i> she moans, <i>“this feels so fucking good. It’s all like, nice and warm and good and... nice...”</i> She trails off, her head lolling back for a few moments as she concentrates on really just working herself over as much as possible. All the while, the growing cock between her legs is becoming increasingly stiff, stretching up now to reach between her breasts, and the sensation of the slick tip pushing up into her cleavage is enough to make her visibly tremble.");
		output("\n\nGiven that she’s stopped speaking, you decide to pick up the slack. Keeping the beam trained squarely on her, you lean over her. <i>“It feels </i>good<i>, doesn’t it?”</i> you say softly. <i>“Doesn’t it feel </i>right<i>, to really let yourself embrace what a nice little bimbo slut you can be?”</i>");
		output("\n\nShe nods, and as she does you see the hair on her head lighten, changing in seconds to become a lovely, silky blonde mane. Her lips plump up too, framing her lolling tongue with a perfect ring of softness. Until now her eyes had been closed in an expression of dream-like bliss, but now they snap open suddenly, locking with yours as she gives you a look of utter submission and satisfaction. <i>“Yes! Yes! YES!”</i> she cries, and with each word her hips buck forward, a veritable fountain of cum erupting from her now-massive cock and churning balls.");
		output("\n\n<i>“Good girl,”</i> you whisper approvingly, using one hand to push her slowly backwards onto the floor, thereby encouraging her to cum over her own body. <i>“Now to really let yourself enjoy your reward...”</i>");
		output("\n\nShe barely needs your encouragement, quickly taking advantage of the opportunity she’s been given to eagerly coat herself with thick white slickness. The streams of cum from her cock arch gracefully upwards and land all over her body, quickly reducing her fur to a thickly matted mess. She revels in the sensation of it, rubbing her body around in the growing puddle on the floor to cover more of herself with it, squeezing her tits together to catch as much of a reservoir as she can between them before leaning down to frenziedly lap it up. And all the while her balls keep churning, the cum still pouring out from her even as the force of the stream abates, until eventually she is left a sopping wet mess, white almost from head to toe even as her cock still drips freely.");
		output("\n\nSetting the raygun down, you lean in over the panting girl. <i>“So,”</i> you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer, clearly having to work to control her breathing enough to talk. Eventually she says, <i>“Like, really good. Wow like, really really good. Holy </i>shit<i> [pc.name]!”</i> she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
		output("\n\nYou smile, but the ongoing silence soon makes it clear that she’s expecting an answer. <i>“Uh, yeah,”</i> you say, <i>“it’s hard to miss.”</i>");
		output("\n\nPenny pouts. It’s an expression she can pull off pretty well now. <i>“Yeah well duh, but have you seen what it can </i>do<i>?”</i>");
		output("\n\n<i>“I have, yes. I was there for all that too.”</i>");
		output("\n\n<i>“Well, thanks!”</i> she answers brightly, clearly missing your bemused tone. <i>“I love it!”</i> The conversation stops as she wraps both hands around her shaft and works at it happily for a few moments, each stroke rewarding her with a burst of thick cum that she catches eagerly in her open mouth. <i>“Oh holy crap, this is, like, </i>amazing<i>! I’m never going to have to not be covered in cum ever again, am I? Please, tell me I’m not!”</i>");
		output("\n\nHer expression as she looks up at you is surprisingly earnest, as though she really does need you to confirm that she’s as much of a bimbo slut as she hopes she is. On closer inspection, it looks like she might have a point - while her productivity might have spiked at more intense moments, it does seem like her cock has been oozing cum ever since you finished zapping her. <i>“No,”</i> you answer confidently, <i>“I’m pretty sure you’re not.”</i>");
		output("\n\nShe gives one last emphatic shudder at that, then curls up in on herself the better to suck her own cock. And from there she just... doesn’t stop. Her blissful slurping goes on for several minutes, and even when you quietly but insistently lift her head back up to talk with her she still keeps cumming quietly, her cock creating an ever-growing pool of whiteness on her dull brown fur. She looks at you attentively while you hold her, but it’s clear that the second you let go she’ll go right back to either sucking her cock directly or coating herself with it and then licking up the results.");
		output("\n\n<i>“So...”</i> you ask innocently, <i>“if I were to tell you the device I used on you came from a wanted criminal called Dr. Badger, how would you feel about that? Would you want to report her to the authorities?”</i>");
		output("\n\nShe looks almost hurt, the first time since you zapped her that you’ve seen her expression look anything other than blissful. <i>“Why on earth would </i>anyone<i> want to do that? She’s like, magic! Have you </i>seen<i> my cock? It’s cumming </i>forever<i>. You don’t lock up someone who can do something like that!”</i>");
		output("\n\nWell, looks like mission accomplished - Dr. Badger doesn’t have anything to worry about here. Penny stands up slowly, visibly delighting in her newly revamped form, spinning to take in her bubble butt and exaggerated tits. It’s nice that she’s happy with the results too " + (!pennyIsCrew() ? ", and you suspect that in a place like this a police officer whose first resort is to fuck any problems into submission will probably do pretty well":"") + ". You can have fun with this new version of Penny later, but for now you’ve got a payment to collect.");
		processTime(11);
		pc.changeLust(25);
	}
	//IF PC WAS NOT BIMBO-IFIED BY DR BADGER AND PENNY IS A CUMSLUT
	else if(!pcBimboedByBadger() && pennyIsCumSlut())
	{
		if(!pennyIsCrew())
		{
			output("Penny sighs with relief as you walk over, shifting to let her massive cock press up through her breasts. <i>“Thank goodness it’s you [pc.name],”</i> she says, <i>“I was worried this was going to be some sort of official police business that would get in the way of me getting some quality cocksucking in.”</i>");
			output("\n\nThere’s a pause as you consider what you’re here to do, the silence filled only by the slick noises Penny makes as she presses her cock between her lips. <i>“You know what?”</i> you say with a shrug, <i>I don’t think I need a big discussion to be confident this is going to go well.”</i>\n\n");
		}
		output("You point the raygun at Penny, and given that her head is down and her attention is elsewhere she doesn’t notice your movement until, with a audible ‘click’, you pull the trigger. You were expecting some bolt of energy, some shining white laser to shoot out and hit her, but instead it’s almost like turning on a flashlight, except the beam it puts out is a suitably bright pink color. It seems... slow, somehow, almost lazy, so it feels kinda like a portable fan you’re holding over someone, except instead of pushing air it’s projecting this slow, thick, pink light. On top of that, given that you’re standing pretty close to her you can clearly see that the cone it’s projecting doesn’t have time to spread out to cover all of her, instead it’s landing in a small circle centered, quite accidentally, right on her chest.");
		output("\n\n<i>“Oh!”</i> she gasps, sliding her cock out of her mouth with a slick slurp, <i>“what is that? It feels... uhnnn...”</i> She trails off, but the fact that she leans back in the chair to provide a better target for the beam completes the thought for her.");
		output("\n\nYou’re happy to go along with her suggestion and keep your aim steady, and it doesn’t take much longer before there’s a reaction as her breasts slowly begin to noticeably swell. Previously they weren’t exactly small, but they weren’t especially large either - at least not compared to some people you’ve encountered - but with each passing second it seems like they’re filling up to another cup size. The sensation is clearly pleasureable too, as Penny confirms as she gives out a quiet earnest moan. She’s sprawled back in her chair, her legs splayed as wide as possible as she relaxes completely into the gentle massaging of the warm pink beam. Well, she’s <i>almost</i> completely relaxed, even though her eyes are closed and her head thrown back in bliss her hands have started moving, one of them sliding down her body to wrap slowly around the heft of her shaft, while the other curls lovingly around her thick balls. By now her tits have attained a quite impressive size - easily as big as some particularly impressive watermelons, looking cutely out of place on her generally trim and toned frame, so given that you apparently have some control over this process you decide to follow her suggestion and shift your focus. You redirect the beam downwards, causing her eyes to shoot open as you target her cock and balls directly.");
		output("\n\nSurprisingly, the beam doesn’t seem to cause an increase in size there. It’s probably for the best - she’s already got far too much to hide without great effort, anything more and she might have difficulty walking around. Still, that’s not to say there’s no effect - quite the opposite. Her cock visibly <i>throbs</i>, and you can practically hear her balls churn from where you’re standing. The chair skitters out from beneath her as she desperately shifts herself, only stopping from toppling over forwards by catching the edge of the desk with her flailing claws.");
		output("\n\n<i>“Gh-ahhmm! Ahh! Ahhhhhmmmm!”</i> she cries, her whole body twitching and spasming jerkily as a veritable stream of slick pre-cum starts to pour from her cock. You can see her balls pulsing and surging, but... it doesn’t seem like they’re getting any smaller. Just to be sure you turn off the raygun, but although the intensity of Penny’s moans seem to die down as the beam disappears, the slow-bubbling stream of white does not.");
		output("\n\nWith a smile, you make your way around " + (pennyIsCrew() ? "her room":"the desk") + ", sitting down right next to her. <i>“Well well,”</i> you say softly, <i>“I </i>am<i> impressed. Dr. Badger did her homework well, it seems.”</i>");
		output("\n\nRoused through the haze of lust and sensation, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\n<i>“Oh, did I not tell you? That’s the name of your benefactor - the person who gave me this wonderful little device.”</i> Before you continue, you reach one hand around behind Penny’s head, gripping it firmly and pulling it forwards, forcing her to look down at herself. Her new tits get in her way somewhat, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now. You were a cumslut before, and a good one, but now - now you’re </i>made<i> for it. Now you’ll </i>always<i> be cumming.”</i> You shift your grip, holding her with one finger at the bottom of her chin to lift her back up to face you, smiling at her as her hips jerk helplessly, sending a brief spurt of cum onto the ground at the thought. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming raygun at her once again. You start with her ass, the beam rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. The task there complete you shift it upwards, letting the soft pink light fall on her face and head. In response you see her lips plump up too, becoming deliciously full and perfect for sucking an endless amount of cocks. Her long low moans are soon interspersed with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with a long luxurious mane of bright blonde hair. And with that, it looks like she’s done. Well, physically, at least.");
		output("\n\nSetting the raygun down, you lean in over the panting girl. <i>“So,”</i> you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer, clearly having to work to control her breathing enough to talk. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou frown. Is that... it? When you gave her that cock in the first place she was a mess, and now she just feels good? You’re about to say something, but she beats you to it. " + (pennyIsCrew() ? "S":"Letting go of the desk s") + "he falls backwards, her ass cushioning her fall as she lands flat on her back. You think for a second that she might be hurt or in trouble, but when you see the ecstatic look on her face it’s clear that something else is going on.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!”</i> she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
		output("\n\nYou smile, but the ongoing silence soon makes it clear that she’s expecting an answer. <i>“Uh, yeah,”</i> you say, <i>“I convinced you to get it.”</i>");
		output("\n\nPenny pouts. It’s an expression she can pull off pretty well now. <i>“Yeah well duh, but like, have you seen it </i>now<i>?”</i>");
		output("\n\n<i>“I have, yes. That... that was me too.”</i>");
		output("\n\n<i>“Well, thanks!”</i> she answers brightly, clearly missing your bemused tone. <i>“I love it!”</i> The conversation stops as she wraps both hands around her shaft and works at it happily for a few moments, each stroke rewarding her with a burst of thick cum that she catches eagerly in her open mouth. <i>“Oh holy crap, this is, like, </i>amazing<i>! I’m never going to have to not be covered in cum ever again, am I? Please, tell me I’m not!”</i>");
		output("\n\nHer expression as she looks up at you is surprisingly earnest, as though she really does need you to confirm that she’s as much of a bimbo slut as she hopes she is. <i>“No,”</i> you answer confidently, <i>“I’m pretty sure you’re not.”</i>");
		output("\n\nIt’s that, that last moment of confirmation that finally tips Penny over the edge properly. One hand clenches tightly around her cock, while the other spends one wild second flailing urgently until it finds its way around her balls, squeezing them needfully to better milk herself for sweet cum. The resulting orgasm is climactic, a veritable fountain of thick cum pouring out from her cock, arching up over her body and landing on her face and chest. After several seconds of urgent, productive thrusts she shifts to push her cock up through her tits, slickly coating its path the whole way, before eventually she manages to wrap her plump lips around its still-spasming tip. And then she just... doesn’t stop. Her blissful cocksucking goes on for several minutes, and even when you quietly but insistently lift her head back up to talk with her she still keeps cumming quietly, her cock creating an ever-growing pool of whiteness on her dull brown fur. She looks at you attentively while you hold her, but it’s clear that the second you go she’ll go right back to either sucking her cock directly or coating herself with it and then licking up the results.");
		output("\n\n<i>“So, if someone came in here talking to you, trying to report Dr. Badger for being a ‘wanted criminal’,”</i> you ask innocently, complete with air quotes, <i>“how would you feel about that?”</i> you ask her innocently.");
		output("\n\nShe looks almost hurt, the first time since you zapped her that you’ve seen her expression look anything other than blissful. <i>“Why on earth would </i>anyone<i> want to report her? She’s like, magic! Have you </i>seen<i> my cock? It’s cumming </i>forever<i>. You don’t lock up someone who can do something like that!”</i>");
		output("\n\nWell, looks like mission accomplished - Dr. Badger doesn’t have anything to worry about here. Penny seems happy too" + (pennyIsCrew() ? "":", and you suspect that in a place like this a police officer whose first resort is to fuck any problems into submission will probably do pretty well" ) + ". You can have fun with this new version of Penny later, but for now you’ve got a payment to collect.");
		processTime(11);
		pc.changeLust(25);
	}
	//IF PC WAS BIMBO-IFIED BY DR BADGER AND PENNY IS NOT A CUMSLUT
	else if(pcBimboedByBadger() && !pennyIsCumSlut())
	{
		//IF PC DOES NOT HAVE BADGER FORM
		if(!pcHasBadgerForm())
		{
			output("As you walk over to talk to Penny, the thing Dr. Badger gave you vibrates in your pocket. You slip your hand inside to check on it, only to feel a sharp little sting. There was like, some sort of needle or something hidden in it that jabbed you? Suddenly, you feel your whole body tremble. You stop, doubling over as your form reshapes rapidly, sliding back easily into the same form the doctor gave you. In seconds it’s done, and once again <b>you’re a perfect bubbly, big-chested and big dicked badger bimbo.</b> Wow, you think, it must be <i>super</i> important to Dr. Badger that you look the part when you talk to Penny about this. Oh well! Fortunately she was distracted by something on her screen and didn’t notice your sudden change.\n\n");
			resetDrBadgerBimboTF();
		}
		output("<i>“Hey there!”</i> you say perkily, trotting over towards Penny" + (!pennyIsCrew() ? " and perching casually on the edge of her desk":"") + ". <i>“What’s up?”</i>");
		output("\n\nPenny looks up at you in confusion. <i>“I was going to ask you the same question [pc.name],”</i> she says slowly. <i>“I know the planet rush is opening up wild new aliens to encounter and... inherit things from, but if " + (pennyIsCrew() ? "I didn’t know you so well":"it wasn’t for the genetic ID scanning system installed over the door") + " I don’t think I would have recognized you. You seem...”</i> There’s a short pause while Penny looks you up and down");
		//IF PENNY HAS A COCK =
		if(penny.hasCock() && !pennyIsCrew()) output(", and you grin as you hear the quiet sound of Penny’s cock hitting the bottom of the desk");
		output(". <i>“...different. I have to say - it’s a good look for you.”</i>");
		output("\n\n <i>“Thanks!”</i> you answer chirpily. <i>“It feels super good too! Do you like my big tits?”</i> You lean forwards, cupping your breasts and pushing them out towards her");
		if(!pc.isChestExposed()) output(", forcing your [pc.chestCover] to strain as your sizeable chest swells outwards.");
		else output(", forcing her to take in an up-close and personal of your sizeable chest.");
		output("\n\n<i>“Uh, yeah,”</i> Penny coughs, reddening rapidly. <i>“Yeah they’re... they’re pretty great...”</i>");

		output("\n\n<i>“Oh! Also - check this out!”</i> You take Penny by surprise as you spin around, moving to sit on one corner " + (pennyIsCrew() ? "of her bed":"facing towards her") + " with one leg hanging down on either side. Penny only just manages to move back out of the way of your flailing legs");
		if(!pc.isCrotchExposed()) output(", but before she can say anything about this you interrupt her by pulling down your [pc.crotchCovers]");
		output(", letting your thick cock and balls fall freely onto her desk. Your slick pussy already starting to make a mess beneath you. <i>“Look at all </i>this<i>!”</i> you say excitedly. <i>“Isn’t it great?”</i>");

		output("\n\nIt takes you a few moments to realize that Penny isn’t saying anything. Looking up, you see she’s just staring straight forwards at you, her eyes wide and a thin line of drool sliding down from her slightly open mouth.");

		output("\n\n<i>“Well, what are you just </i>looking<i> for silly,”</i> you laugh. <i>“You should get in there and see what it’s all like!”</i>");

		output("\n\nWithout waiting for a response you reach out with one of your bluntly clawed hands, wrapping it around the back of her head and pulling her forcefully inwards. She lands heavily against you, her mouth just happening to wind up at the base of your cock, her tongue sliding for just a second along the length of your dripping slit. <i>“Good, huh?”</i>");

		output("\n\nAfter a few seconds the thought occurs to you that Penny has probably had time to have a good look, and when you let her head go she almost slides back down into her seat.");

		output("\n\n<i>“Holy shiiiiiiit,”</i> she says slowly. <i>“[pc.name], I don’t know </i>where<i> you got those gene mods, but you have </i>got<i> to let me know your source.”</i>");
		output("\n\n<i>“Oh! Oh my goodness, yes!”</i> You slap your head, pouting slightly at your mistake. <i>“I totally forgot, that’s like, totally what I’m even here for!”</i>");
		output("\n\nPenny is having trouble doing anything but grin laciv... lashivi... lustfully, but after thinking about it for a few seconds what you just said registers enough for Penny to look up at you in confusion. <i>“Wait, what are you here for?”</i>");
		output("\n\n<i>“This!”</i> you answer simply, quickly aiming the gun-thing Doctor Badger gave you at Penny and pulling the trigger.");
		output("\n\nPenny’s response isn’t as big as you were expecting. She pulls back a little in surprise - you guess it <i>does</i> kinda look like you just pulled a gun on her, so that makes sense, even if it’s so wrong it’s silly - but there’s not like, big... ZAP or anything. Instead there’s just this bright pink glow, lighting up most of Penny’s body as you hold the beam over her, while both of you get more and more confused.");
		output("\n\n<i>“Uh, this is the part where you like, grow big tits and stuff, okay?”</i> you say with a pout.");
		output("\n\n<i>“Huh?”</i> Penny answers. <i>“That doesn’t... what do you... huh?”</i> She’s shaking her head slowly, like she’s trying to clear it, but more importantly her tits are NOT getting any bigger. Is something wrong? Are you pulling the trigger wrong? You lean in closer, bringing the gun-thing closer to Penny, and finally that seems to do it. With a quiet gasp you see Penny’s tits begin to grow, pressing outwards more and more and straining at her cute little uniform.");
		output("\n\n<i>“What’s... happening?”</i> she says slowly.");
		output("\n\nYou giggle. <i>“You’re becoming a bimbo, silly!”</i> You lean backwards to give her a better view of your tits, even as hers keep growing. <i>“We’re gonna have to make a few changes to that body of yours so you can be the very best slut you can be!”</i>");
		output("\n\nPenny grits her teeth, still shaking her head slowly. <i>“But what... what if I don’t... want to...”</i>");
		output("\n\n<i>“Oh! Y’know, I never even </i>thought<i> of that!”</i> You put one finger on your plump lips for a moment and think - although your other hand keeps the gun-thing pointed at Penny so the nice pink beam keeps washing over her. <i>“I guess I always just thought that like, this is all such <i>fun</i>. Like, c’mon, you’ve seen this cock, right!”</i> You lean backwards and spread your legs wide again, running one hand all the way up your thick black shaft. <i>“Oh man Pen, you should feel how good this is.");
		if(penny.hasCock()) output(" Well, you’ve got one too, you know how it is. But this is like, </i>way<i> better.");
		output(" It’s like, hard all the time, and my pussy is all nice and wet and I can just like, fuck all the time, y’know?”</i>");
		output("\n\nWithout really planning to, you start doing things to make what you’re saying clearer. You grind yourself slowly along the " + (pennyIsCrew() ? "bed":"desk") + ", sliding your free hand up and down your cock faster and faster. <i>“It just... it feels really good Pen, I can’t... I can’t stop fucking and touching myself. I don’t want to stop. Why would I want to stop? I want to </i>share<i> this. And I get to share this with you! I get to make you just as nice and... slick, and hard and...”</i>");
		output("\n\nYou bite your lip. You can feel your orgasm coming, and not just because of how you’re jerking yourself off. It’s also because you can see Penny panting in front of her, her tits now just as big as yours, the hair on her head just starting to become blonde, her lips starting to get all nice and plump. But more than that, it’s the look in her eyes - you know she’s feeling it too, all those big thoughts and worries and everything getting cleaned out and replaced with just the wonderful need to fuck and be fucked. She’s drooling now, watching you with burning need, as her ass rounds out to give her the perfect set of killer bimbo curves. Your hand tightens on your cock, and you watch as Penny hastily tears off her clothes, revealing her own");
		if(penny.hasCock()) output("cock");
		else output("clit");
		output(" starting to stretch and grow too.");
		output("\n\n<i>“Yes!”</i> she squeaks, her voice already a little higher and more bubbly than before. <i>“Yes, give it to me, let me... let me... fffuuuck!”</i>");
		output("\n\nYou jerk yourself forwards, and with all this stuff going on - the feeling of the desk sliding against your slick pussy, your own hand on your cock, and the sight of Penny giving in and embracing the warm pink fun of the gun-thing that you’re still (barely) keeping pointed at her, it all adds up to one of the biggest orgasms you’ve ever had. Your whole body shakes, but more importantly a, like, <i>fountain</i> of cum shoots out of your cock, and Penny happily leans back to let as much of it land on her as possible. Then she cums too,");
		if(penny.hasCock()) output(" her own cock growing large enough to slide between her tits and splatter wetly against her chin");
		else output(" and with a wild, passionate thrust of her hips her clit finally grows into the big ol’ cock she needs it to be, quickly becoming large enough to slide between her tits and splatter wetly against her chin");
		output(", while two big, churning balls swing heavily beneath it. She leans her head forward, hurriedly wrapping her mouth around her massive cock and sucking at it, clearly really enjoying both the taste and feeling of filling herself with her own cum.");
		output("\n\n<i>“There ya go!”</i> you say happily. <i>“I told you it’d feel good!”</i>");
		output("\n\nShe lets her cock slide out of her mouth, but even as she tries to talk she keeps getting cut off when another burst of thick cum spurts out all over her face. <i>“Yeah! I like, mhmmmm! Yeah it’s... mmmhmm! It feels good! Like, mhmmm! Really really good! What was... mhmmm what was I worried about?”</i>");
		output("\n\nYou shrug. <i>“I dunno! Something dumb. Something about </i>not<i> fucking all the time. So yeah, something dumb.”</i>");
		output("\n\n<i>“Oh yeah,”</i> she agrees, rolling her head from side to side to make sure as much of it as possible is covered with her cum. <i>“This is like... mhmmm... </i>way<i> better than not fucking all the time.”</i>");
		output("\n\nEventually you finish up, giving Penny’s tits one last blast before your balls are finally emptied, at least for now. But Penny just sorta... keeps going. Her head is rolling around, her hands are twitching against her big thick balls, and all the while her cock just keeps on cumming. It’s died down a bit sure, but there’s still a lot of cum spurting out from her, and she’s <i>super</i> enjoying it.");
		output("\n\nYou walk around Penny to get a better look. She really seems like she’s getting into it! She’s lying back in her chair now, letting the slow, steady flow from her cock just wash blissfully over her. <i>“Wow,”</i> you say. <i>“You sure are having a good time, huh?”</i>");
		output("\n\n<i>“Holy shit [pc.name],”</i> Penny replies, turning her head to the side, <i>“I think I’m </i>basically<i> going to be cumming like, forever. Is that a thing that can happen? Is that something I can do?”</i>");
		output("\n\nYou put your finger to your lips and think. Penny <i>does</i> look like a perfect bimbo slut now, with nice big tits, and a round, easily grippable bubble butt. Her short mohawk has grown out into a long mane of platinum blonde hair, and, of course, her big ol’ cock and balls are still churning and spurting cum, coating more and more of her sticky fur. <i>“Yep!”</i> you answer happily. <i>“You’re going to be a super cum covered bimbo slut for like, all the time.”</i>");
		output("\n\n<i>“Oh holy shiiiit, that is like, what I always wanted. Probably? I mean, I really wanted a cock, and like, what else would you do with one other than like, cum everywhere, right?”</i>");
		output("\n\nYou grin, something about how super into being a happy little cum covered slut already working to get you nice and horny again. <i>“Oh, I can think of a few things...”</i>");
		output("\n\nBefore she can say anything you’re on top of her, digging your stubby badger claws into her lovely soft tits and pressing your cock down towards her pussy. She’s already a dripping wet mess, but you do your best to give her a anothing quick coating as you lean down over her.");
		output("\n\n<i>“Yes!”</i> she gasps. <i>“Oh yes please fuck me fill me up fuck me fuck me!”</i>");
		output("\n\nYou’re more than happy to agree to her request, sliding your thick cock easily inside her. She’s so <i>wet</i>, and with every thrust you give her you can feel her whole body shudder, another slick burst of cum spraying out from her own cock. <i>“Don’t you love being a super horny bimbo?”</i> you ask.");
		output("\n\n<i>“Yes! Uhmmnnn! I love it! Oh wow I... uhmmnn! I am going to suck <i>so</i> much cock!”</i>");
		output("\n\nYou laugh happily. <i>“Yay! Oh there’s something... mhmm... super important!”</i>");
		output("\n\n<i>“Mhmm?”</i>");
		output("\n\nYou stop fucking for a moment and think. What was it? Oh yes! <i>“You’re not going to report Doctor Badger, are you?”</i>");
		output("\n\n<i>“No!”</i> Penny’s answer is loud and clear, and you believe her totally. <i>“Why would I? She did like, magic! She gave me a cock that cums forever! Report her, I want to suck her cock! Wait, she has a cock, right?”</i>");
		output("\n\nGiggling, you say, <i>“she sure does! It looks just like mine!”</i>");
		output("\n\nWhen you say that, Penny looks up with a gasp, her eyes wide as though she just realized something. <i>“Ohholycrap - are you Doctor Badger?!”</i>");
		output("\n\n<i>“Wh-,”</i> you start to answer, but then you stop, looking down at your badger hands, fur, and feeling along your badger muzzle. You’re... you’re <i>not</i> Doctor Badger, right? No, that’s totally someone else. There’s no way you’re smart enough to make that gun-thing that did all that wonderful stuff, right? You don’t have time to say all that to Penny though, because she’s already crawling forward on her knees, looking up at you with love. <i>“Thank you thank you tha-...”</i>");
		output("\n\nHer words cut off as she slides her soft lips around your cock, switching from talking to sucking dick like a pro. You think about correcting her, but her mouth feels <i>really</i> good, and like, well, you did kinda earn this too, right? You came all the way out here. You’ll pass the message along to Doctor Badger anyway. Leaning back, you pat her nicely on the head. <i>“Good girl,”</i> you say softly. <i>“You’re welcome.”</i>");
		output("\n\nYou’re worked up enough that it doesn’t take long, and the sight of Penny reaching one hand down between her own legs to start jerking herself off too is enough to push you over the edge once again. Penny gulps down your cum eagerly, but eventually you make too much for her to swallow so she slides off your cock, letting your twitching dick coat her back and ass with lovely sticky cream. At the same time she presses herself into the puddle she’s made beneath her, licking loudly at the ground as she tries to get as much cum both on and in her as possible. It’s a look that works <i>super</i> well for her.");
		output("\n\nEventually, after a good few minutes, you’re done (again). Penny is still happily snuffling about on the floor, but you’re good enough for now to finish up and leave her to it. Mission accomplished! Time to tell Doctor Badger about how you did and what Penny’s like now.");
		processTime(27);
		pc.orgasm();
		pc.orgasm();
		//inflatePennyCock?
		cockEnlarge = true;
	}
	//IF PC WAS BIMBO-IFIED BY DR BADGER AND PENNY IS A CUMSLUT
	else
	{
		//IF PC DOES NOT HAVE BADGER FORM
		if(!pcHasBadgerForm())
		{
			output("As you walk over to talk to Penny, the thing Dr. Badger gave you vibrates in your pocket. You slip your hand inside to check on it, only to feel a sharp little sting. There was like, some sort of needle or something hidden in it that jabbed you? Suddenly, you feel your whole body tremble. You stop, doubling over as your form reshapes rapidly, sliding back easily into the same form the doctor gave you. In seconds it’s done, and once again you’re a perfect bubbly, big-chested and big dicked badger bimbo. Wow, you think, it must be <i>super</i> important to Dr. Badger that you look the part when you talk to Penny about this. Oh well! Fortunately she was distracted and didn’t notice your sudden change.\n\n");
			resetDrBadgerBimboTF();
		}
		output("<i>“Hey there!”</i> you say perkily, trotting over towards Penny" + (!pennyIsCrew() ? " and perching casually on the edge of her desk":"") + ". <i>“What’s up?”</i>");
		output("\n\nPenny does a double-take between you and the computer");
		if(!pennyIsCrew()) output(", and then gives a sigh of relief. <i>“Thank goodness it’s you [pc.name],”</i> she says, <i>“I was worried this was going to be some sort of official police business that would get in the way of me getting some quality cocksucking in. So, uh, what’s with the new form by the way?”</i> She gives you a quick look up and down before continuing. <i>“Don’t get me wrong, it’s a good look for you - but if it wasn’t for the genetic sensor built into the door I’m not sure I would have recognized you.”</i>");
		else output(". <i>“I was worried I might be somebody that would make me stop sucking cock for a change. So, uh, what’s with the new form by the way?”</i> She gives you a quick look up and down before continuing. <i>“Don’t get me wrong, it’s a good look for you - but if I didn’t know you so well I’m not sure I would have recognized you.”</i>");
		output("\n\n<i>“Oh!”</i> you answer happily, <i>“let me show you!”</i> Then, without any further thought, you pull out the gun-thing Doctor Badger gave you, point it at Penny and pull the trigger.");
		output("\n\nShe doesn’t do anything at first - maybe she was too surprised or maybe she just trusted you after all you’ve taken her through already, but she doesn’t like, dive out of the way or anything, which is definitely helpful. You kinda expected some big sort of zap or something, but it’s almost like turning on a flashlight, except the beam is a super cool bright pink color. But it’s all like... slow, almost lazy, which seems weird for light. It doesn’t cover all of her either, it’s just like a small circle of pinkness, which with a satisfied giggle you aim right at her chest.");
		output("\n\n<i>“Oh!”</i> she gasps, her cock already starting to harden as it slides up between her tits, <i>“what is that? It feels... uhnnn...”</i> She trails off, but by the way she leans back in the chair to make herself a better target tells you all you need to know.");
		output("\n\nShe’s clearly happy so you keep your aim steady, and it doesn’t take much longer before her breasts slowly begin to grow. Before they weren’t exactly small, but they weren’t especially large either - not as big as yours, definitely - but they quickly begin to catch up. The feeling must be nice too, as Penny confirms when she gives out a happy moan. She’s leaning back back in her chair, her legs as far apart as possible as she relaxes completely into the gentle massaging of the warm pink beam. Well, she’s <i>almost</i> completely relaxed, even though her eyes are closed and her head is thrown back in bliss her hands have started moving, one of them sliding down her body to wrap slowly around her shaft, while the other cups her thick balls lovingly. By now her tits have gotten super big - about as big as yours, even! - and they look cutely out of place on her trim and toned body. You suddenly realize that you must have some control over what’s happening to her, so you figure it’s about time to get to get naughty and shift your focus. You redirect the beam downwards, making her eyes to shoot open as you target her cock and balls directly.");
		output("\n\nSurprisingly, the beam doesn’t seem to make her any bigger there. You pout a little, but you <i>guess</i> that’s probably for the best - she’s already pretty huge there, any bigger and she’d have problems walking to the next person she needed to fuck. I mean, what’s the point of a nice bimbo slut if she can’t come to you? Still, something does definitely happen. Her cock <i>throbs</i>, and you can practically hear her balls churn from where you’re standing. The chair slides out from under her as she desperately shifts herself, only stopping from falling forwards by catching the edge of the desk in front of her with her claws.");
		output("\n\n<i>“Gh-ahhmm! Ahh! Ahhhhhmmmm!”</i> she cries, her whole body twitching as a stream of slick pre-cum starts to pour from her cock. You can see her balls pulsing and surging, but... it doesn’t seem like they’re getting any smaller. Just to be sure you turn off the gun-thing, but even though Penny moans a little quieter as the beam stops, the stream of whiteness pouring out of her keeps right on going.");
		output("\n\nWith a smile, you make your way around " + (pennyIsCrew() ? "her bed, sitting nice and close":"the desk, sitting down right next to her") + ". <i>“Wow!”</i> you say perkily, <i>“Dr. Badger did a great job, huh?”</i>");
		output("\n\nThrough the fog of lust and super good feelings, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\nBefore you answer, you reach one hand around behind Penny’s head, pulling her down to look at the interesting bit. Her new tits get in her way a little, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now! You get to be cumming like, all the time. She must have known you were a super good little cumslut, but now you’re </i>made<i> for it.”</i> You lift her head back up, smiling happily at her as she joins you in being one of Doctor Badger’s bimbos. She must like the thought of it too, when you told her she was going to cum all the time her hips had starting jerking forward helplessly, sending several splashes of cum onto the ground. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming the gun-thing at her. You start with her ass - every good bimbo needs a good ass - and clearly the beam agrees, rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. That done, you shift it upwards, letting the soft pink light fall on her face and head. Her lips plump up and become deliciously full, perfect for sucking an endless amount of cocks. She interrupts her own long low moans with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with totally cute long blonde hair. And with that, it looks like she’s done. Well, her body, at least.");
		output("\n\nSetting the gun-thing down, you lean in over the panting girl. <i>“So,”</i> you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer. You know how that feels - it’s a lot to deal with, just how much less like, <i>thinking</i> you’re doing. It’s not that you’re brainless, but like, you realize how much doesn’t matter anymore. And that’s like, everything to do with not having sex. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou’re about to say something, but she beats you to it. Letting go of the desk she falls backwards, her ass cushioning her fall as she lands flat on her back. For a second you worry that maybe she’s hurt, but when you see the super happy look on her face it’s clear she’s fine.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!”</i> she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
		output("\n\n<i>“I know, right!”</i> you answer excitedly.");
		output("\n\n<i>“Have you seen how much cum I’ve got?!”</i>");
		output("\n\n<i>“I know, right!”</i> you answer excitedly, again.");
		output("\n\n<i>“Well, thanks!”</i> she says happily. <i>“I love it!”</i> The conversation stops for more important things as she wraps both hands around her shaft and works at it for a few moments, each stroke rewarding her with a burst of thick cum that she catches eagerly in her open mouth. <i>“Oh </i>man<i> [pc.name], I loved cum before, you know that right, but now it’s like - like I actually need it? Like, I feel like I need to have cum on my body and in my mouth as much as I need to like, breathe, except every single time I do it it still feels amazing! I’m never going to have to not be covered in cum ever again, am I? Please, tell me I’m not!”</i>");
		output("\n\n<i>“Nope! You’re going to be a super cum covered bimbo slut for like, all the time.”</i>");
		output("\n\n<i>“Oh holy shiiiit, that is like, what I always wanted. Ever since you told me I wanted that, anyway, and probably before? I mean, I really wanted a cock, and like, what else would you do with one other than like, cum everywhere, right?”</i>");
		output("\n\nYou grin. <i>“Oh, I can think of a few things...”</i>");
		output("\n\nBefore she can say anything you’re on top of her, digging your stubby badger claws into her lovely soft tits as you press your cock down towards her dripping wet pussy.");
		output("\n\n<i>“Yes!”</i> she gasps. <i>“Oh yes please fuck me fill me up fuck me fuck me!”</i>");
		output("\n\nYou’re more than happy to agree to her request, sliding your thick cock easily inside her. She’s so <i>wet</i>, and with every thrust you give her you can feel her whole body shudder, another slick burst of cum spraying out from her own cock. <i>“Don’t you love being a super horny bimbo?”</i> you ask.");
		output("\n\n<i>“Yes! Uhmmnnn! I love it! Oh wow I... uhmmnn! I am going to suck <i>so</i> much cock!”</i>");
		output("\n\nYou laugh happily. <i>“Yay! Oh there’s something... mhmm... super important!”</i>");
		output("\n\n<i>“Mhmm?”</i>");
		output("\n\nYou stop fucking for a moment and think. What was it? Oh yes! <i>“You’re not going to report Doctor Badger, are you?”</i>");
		output("\n\n<i>“No!”</i> Penny’s answer is loud and clear, and you believe her totally. <i>“Why would I? She did like, magic! She made my cock magic so I could cum forever! Report her, I want to suck her cock! Wait, she has a cock, right?”</i>");
		output("\n\nGiggling, you say, <i>“she sure does! It looks just like mine!”</i>");
		output("\n\nWhen you say that, Penny looks up with a gasp, her eyes wide as though she just realized something. <i>“Ohmygoodness - are you Doctor Badger?!”</i>");
		output("\n\n<i>“Wh-,”</i> you start to answer, but then you stop, looking down at your badger hands, fur, and feeling along your badger muzzle. You’re - you’re <i>not</i> Doctor Badger, right? No, that’s totally someone else, there’s no way you’re smart enough to make that gun-thing that did all that wonderful stuff. You don’t have time to say all that to Penny though, because she’s already crawling forward on her knees, looking up at you with love. <i>“Thank you thank you tha-...”</i>");
		output("\n\nHer words cut off as she slides her soft lips around your cock, switching from talking to sucking dick like a pro. You think about correcting her, but her mouth feels <i>really</i> good, and like, well, you did kinda earn this too, right? You came all the way out here. You’ll pass the message along to Doctor Badger anyway. Leaning back, you pat her nicely on the head. <i>“Good girl,”</i> you say softly. <i>“You’re welcome.”</i>");
		output("\n\nYou’re worked up enough that it doesn’t take long, and the sight of Penny reaching one hand down between her own legs to start jerking herself off too is enough to push you over the edge. Penny gulps down your cum eagerly, but eventually you make too much for her to swallow so she slides off your cock, letting your twitching dick coat her back and ass with lovely sticky cream. At the same time she presses herself into the puddle she’s made beneath her, licking loudly at the ground as she tries to get as much cum both on and in her as possible. It’s a look that works <i>super</i> well for her.");
		output("\n\nEventually, after a good few minutes, you’re done. Penny is still happily snuffling about on the floor, but you’re good enough for now to finish up and leave her to it. Mission accomplished! Time to tell Doctor Badger about how you did and what Penny’s like now.");
		processTime(27);
		pc.orgasm();
	}
	//[in all cases after Penny is bimbo-ified, force the player outside]
	//Do actual Penny Stat Changes.
	//flag Penny as bimbofied.
	if(!pennyIsCumSlut() && pennyIsCrew()) 
	{
		pennyBimbofy(cockEnlarge);
		showPenny();
		output(" Of course now that Penny is only good for fucking, she’ll need a job. Maybe she can camwhore while you’re out adventuring?");
		flags["BADGER_QUEST"] = 2;
		clearMenu();
		addButton(0,"Next",pennyPostbimboedCamwhoreTalk);
	}
	else
	{
		pennyBimbofy(cockEnlarge);
		showPenny();
		flags["BADGER_QUEST"] = 2;
		//Set flag that PC zapped Penny.
		clearMenu();
		//Don't worry about special consensual/not consensual flags - if the convo to tell her about it beforehand happened, it counts as consensual. Duh.
		clearMenu();
		addButton(0,"Next",moveOutsidePennysOffice);
	}
}

public function pennyPostbimboedCamwhoreTalk():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	output("<i>“Oh Penny?”</i> You turn back to look at the cum-drenched bimbo-slut. <i>“How do you feel about jerking off on camera?”</i>");
	output("\n\nPenny moans, stroking herself anew, her ass and tail up in the air. Her eyes are glassy and slow to return to you. <i>“Like, for porno?”</i> She licks some of the sticky coating from her lips. <i>“Fuuuck that’s hot... and this dick. Uh, this is a dick for porn.”</i> Gesturing at her rigid, drooling length, she murmurs, awstruck, <i>“And the thought of people jerking off to me... spilling all those loads all over themselves because I look like... like this!”</i> She shudders, and pumping hot gouts of seed into the air.");
	output("\n\n<i>“So if I moved a holocam in here and set it up so everyone could watch you jack off, live on the extranet, you wouldn’t mind?”</i> You squat down next to the fox-girl expectantly.");
	output("\n\n<i>“Mmmph-yes!”</i> Penny screams, biting her lip scooping thick wads of jism onto her hypersensitive chest, smushing in deep into her fur. <i>“Yes, please! Do it! I want to show off. Wanna know how horny I make everyone. How horny I make you! How sexy these big, fat cock-sucking lips are!”</i> She rams herself face-first onto her dick, cheeks bulging with a heavy load. The rest of her answer is insensate gurgles.");
	output("\n\nYou pat Penny’s head and make the necessary orders through your Codex. By the time she finishes sucking down the next couple loads, you’ll have a brand new holocam set up, an account setup on a decent site, and the in-room viewscreen tuned to a combination preview/chat window.");
	output("\n\nAny proceeds can go into paying Penny’s debts." + (pc.isBimbo() ? " Not having to worry about that stuff would like, make her soooo happy!":" You’d hate for some debt collector to come interrupt such a happy girl."));
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);

}

//REPORT DR BADGER
public function turnDoctorBadgerIntoSpacePolice2():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("Penny exhales as you tell her you’d prefer just to report Dr. Badger, her hands unclenching from the edge of the desk. <i>“Yeah, you’re probably right,”</i> she says. <i>“Much as I want to try going toe-to-toe with her after she made it personal, it’s probably best not to go off half-cocked and try to mess with some mad scientist by ourselves." + (pennyIsCrew() ? " Especially since I’m not a peacekeeper anymore.":"") + "”</i>");
	if(!pennyIsCrew())
	{
		if(pennyIsCumSlut()) 
		{
			output(" She stops for a second, struggling to get her cock tucked back under the desk and give herself some semblance of respectability. <i>“And, yeah, what she was offering did sound pretty tempting, to just go all out in terms of sex and sluttiness and...”</i>");
			output("\n\nShe trails off, her face going red as you hear the soft ‘thunk’ of her cock hitting the bottom of the desk. You cough politely, and with a quick shake of her head she gets herself back under control.\n\n");
		}
		else output("\n\nShe stops and trails off, blushing indiscretely. After a shake of her head, Penny takes a deep breath and continues. ");
		output("<i>“Yeah, that, basically. What I’ve got going on now is fun, but I can still focus when I really need to. Something tells me that wouldn’t be the case if I go for what she’s offering.”</i>");
	}
	output("\n\nYou nod, setting the raygun down to the side carefully as you watch Penny tap a few commands into her terminal. Eventually she looks up again.");
	output("\n\n<i>“Right, it’s done. I’ve flagged it as high risk, so " + (pennyIsCrew() ? "once my contact relays it up the ladder, they should send":"they’re sending") + " in a squad that could handle - well, let’s just say unless the good doctor can out-punch a squadron of combat ships then they’ll probably be fine. I’ll " + (pennyIsCrew() ? "pass that gun thing along":"take that gun thing") + " for evidence too, to make sure we can make the charges stick.”</i> She picks it up delicately, sliding it into an evidence bag and stowing it safely away.");
	output("\n\nAnd that, it seems, is that. Dr. Badger should trouble the galaxy no more!");
	processTime(5);
	//[remove Dr. Badger from the game as with existing Report function]
	flags["DR_BADGER_TURNED_IN"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//TURN THE TABLES ON DR BADGER
public function turnTheTablesOnBadgertwat():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	//IF PC WAS NOT BIMBO-IFIED BY DR BADGER
	if(!pcBimboedByBadger())
	{
		output("It’s an interesting choice, but it seems like a smarter idea to <i>not</i> side with the wanted mad scientist. And if you get to show Dr. Badger what being a Hero is <i>really</i> about, well, so much the better. <i>“Tell me more about this plan of yours to turn things around on the good doctor...”</i>");
		output("\n\nPenny grins wolfishly. <i>“I was hoping you’d say that,”</i> she says.");
		if(pennyIsCumSlut()) output(" She’s interrupted briefly as her cock hardens dramatically once again, making her shudder with bliss as it pushes up between her breasts. <i>“Well, okay</i>, she adds, <i>“I was </i>mostly<i> hoping you’d say that. The thought of being a 100% cum-focused bimbo slut " + (pennyIsCrew() ? "- even more than I already am - ":"") + "has... a definitely appeal, but no, this is a much better plan.”</i>");
		output("\n\nShe types on her terminal for a few moments, frowning at the display as she searches through the information. <i>“Listen, I can’t promise anything, but I know some people who know some people, and I’m sure with all the folks out here for the Planet Rush there’s got to be someone who knows enough to reconfigure this thing. I’ll put out the call, but it will probably take a while before I hear anything.”</i>");
		output("\n\nNodding at the raygun in your hand, she says. <i>“Leave that with me. I’ll let you know when I’ve found something. And then after that we can have some fun, </i>and<i> show her U.G.C Peacekeepers" + (pennyIsCrew() ? " - even former ones -":"") + " aren’t something to fuck with.”</i>");
		if(pennyIsCumSlut()) output("\n\nThen, after a brief pause, she adds quietly, <i>“And, uh, </i>after<i> that, " + (pennyIsCrew() ? "I can get back to jerking off on camera...":"maybe we could find a way to make the whole cum-focused bimbo slut thing work on our terms. If, uh, if you want...") + "”</i>");
		output("\n\nThat seems to be it. For now you just need to sit tight and wait for Penny to get back to you.");
	}
	//IF PLAYER WAS BIMBO-IFIED BY DR BADGER
	else
	{
		output("Dr. Badger was preeeettty clear about wanting you to zap Penny. But now Penny is saying this whole other thing, and that <i>also</i> results in people getting zapped, but now the person getting zapped is Dr. Badger? Would she get like, an even <i>bigger</i> cock? That does sound nice...");
		output("\n\nEventually you realize that Penny is looking up at you. She must be waiting for you to decide! <i>“Oh, uh, whatever it was that you said. That idea that you came up with? That’s probably good, right? Let’s go with that one.”</i>");
		output("\n\nShe nods slowly. <i>“Oh... kay...”</i> Phew! Problem solved, she doesn’t seem to be wanting you to say anything anymore. Nice work! <i>“I was hoping you’d say that,”</i> Penny says.");
		if(pennyIsCumSlut())
		{
			output(" She’s stops briefly as her cock gets all hard again, making her shudder with bliss as it pushes up between her breasts. <i>“Well, okay</i>, she adds, <i>“I was </i>mostly<i> hoping you’d say that. The thought of being a 100% cum-focused bimbo slut " + (pennyIsCrew() ? "- even more than I already am - ":"") + "has... a definitely appeal, but no, this is a much better plan.”</i>");
		}
		output("\n\nShe types on her terminal for a few moments, frowning at the display as she searches through the information. You pout as you wait. Maybe you <i>should</i> have just zapped her - you probably wouldn’t have agreed with her idea if you knew it would end up with all this standing around and not getting fucked. <i>“Listen,”</i> she says eventually, <i>“I can’t promise anything, but I know some people who know some people, and I’m sure with all the folks out here for the Planet Rush there’s got to be someone who knows enough to reconfigure this thing. I’ll put out the call, but it will probably take a while before I hear anything.”</i>");
		output("\n\nNodding at the raygun in your hand, she says. <i>“Leave that with me. I’ll let you know when I’ve found something. And then after that we can have some fun, </i>and<i> show her U.G.C Peacekeepers aren’t something to fuck with.”</i>");
		if(pennyIsCumSlut()) output("\n\nThen, after a brief pause, she adds quietly, <i>“And, uh, </i>after<i> that, " + (pennyIsCrew() ? "I can get back to jerking off on camera...":"maybe we could find a way to make the whole cum-focused bimbo slut thing work on our terms. If, uh, if you want...") + "”</i>");
		output("\n\nThat seems to be it. For now you just need to sit tight and wait for Penny to get back to you. And maybe, while you’re waiting, like, actually get some sex. That would be <i>super</i> nice.");
	}
	output("\n\n<b>Penny has taken possession of the bimbo ray.</b>");
	pc.removeKeyItem("Doctor Badger's Bimbo Raygun - Programmed for use on Penny.");
	flags["BADGER_QUEST"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//REWARD
public function rewardFromDoctorBadger():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	//IF PC WAS NOT BIMBO-IFIED BY DR BADGER
	if(!pcBimboedByBadger())
	{
		output("<i>“Yo, Doc,”</i> you say casually, making the large mustelid woman look up as you walk over. <i>“I’ve taken care of that, ‘Penny Problem’ you told me about.”</i>");
		output("\n\nShe grins. <i>“And? How is the patient doing?”</i>");
		output("\n\n<i>“Pretty well,”</i> you answer. <i>“Definitely happy, definitely cumming a lot.”</i> You pause and think for a moment before you continue. <i>“Cumming really, really a lot, actually. More than I would have thought physically possible, really.”</i>");
		output("\n\nIf Dr. Badger is surprised by this, she doesn’t show it. Instead she strikes a pose, a nearby piece of exposed machinery sparking dramatically as she says triumphantly, <i>“Another success for science! Take that, enemies of progress! And fucking! And progress in fucking!”</i>");
		output("\n\nEventually she notices your bemused look, and with a sigh turns off the machine behind her and settling back down. <i>“What? You have to have </i>fun<i>, or what’s the point? I’d hope you did the same with the new and improved Penny, after all.”</i>");
		output("\n\nYou cough discretely, changing the subject. <i>“What I was wanting to ask was - she seemed like she was going to </i>keep<i> cumming. Like, pretty much permanently.”</i>");
		output("\n\nDr. Badger merely nods in response, forcing you to prompt for more with a shrug. <i>“How, exactly, is that something that’s happening? Without her just... dying of dehydration?”</i>");
		output("\n\n<i>“Oh!”</i> she answers with a laugh. <i>“I forgot, you wouldn’t have seen one of my ‘premium edition’ bimbos before. Well, it’s all very complicated - quantum, and all that - but the short version is, there are an infinite number of Penny’s across the multiverse, and the energy from my raygun melded our version with some of them in some very specific ways.”</i>");
		if(pc.intelligence() < 15) output("\n\nThat all goes completely over your head. <i>“Huh?”</i>, you say simply.");
		else output("\n\n<i>“Okay,”</i> you say, <i>“but that doesn’t really answer the question of how she’s able to keep orgasming forever.”</i>");
		output("\n\n<i>“The point is,”</i> Dr. Badger continues, <i>“that our Penny is now, entirely without thinking about it, constantly drawing energy from her alternate versions across the multiverse. So there’s a few thousand alternate universe Penny’s out there who are finding themselves a tiny, tiny amount hungrier every day than they were before, never realizing in the slightest what they’re contributing to.”</i>");
		output("\n\nYou pause for a moment as that sinks in. <i>“Wait, you have the ability to draw power from infinite other </i>universes<i>, and you use it to make people cum a bunch?”</i>");
		output("\n\n<i>“I know, pretty great, right?”</i> Dr. Badger dusts her fist against her chest with a smug grin. <i>“All those small-minded scientists back in the Confederacy were like, ‘we should use this technology for engines or weapons!’ but I always thought - what’s the point of going places or fighting people if you can’t fuck the </i>most<i> when you’re done?”</i>");
		output("\n\nShe stops talking briefly, her eyes drifting down to one of the complicated-looking pistols lying on the workbench next to her. <i>“Not that I didn’t use some of it for weaponry in the end, as the people they sent after me soon found out. But it’s not exactly easy to set up a link like that, which is why I’m not just flying around the galaxy shooting everything with a bimbo beam,”</i> she grins, adding, <i>“yet.”</i>");
		output("\n\nSomething occurs to you. <i>“Wait, if it’s not easy to do, why did you just give me the gun to use on Penny? Couldn’t you have just injected her with something instead?”</i>");
		output("\n\n<i>“Oh, sure,”</i> she concedes, <i>“but even though I needed her out of the way so that I wasn’t going to be at risk of being shut down, I didn’t have anything against her </i>personally<i>. Besides, while calibrating the gun I found that something like 9 out of 10 Pennys in the multiverse have a massive cock, and that’s something I can respect in a woman. So I decided that if I was going to get her out of the way, well, it might as well be from giving her the best possible upgrade.”</i>");
		output("\n\nHuh. That makes... sense? As much as any of this makes sense, anyway. Still, the point remains that you did a job that you were promised a reward for, and the good doctor hasn’t yet paid up. You cough meaningfully. <i>“Well, all’s well that ends well, so now, about my payment...”</i>");
		output("\n\nDr. Badger looks up at you, and for a genuine second you think she’s going to do something stupid and fight you over it or something, but instead she smiles earnestly. <i>“Of course. You did a good job, helped me out and advanced the cause of science in the frontier to no end. Here.”</i>");
		output("\n\n<b>She hands you a credit chit worth 3,000 credits. Nice!</b>");
		output("\n\nAt the same time she takes the bimbo raygun she gave you, presumably so she can either recharge it for next time or break it down again for parts.");
		output("\n\n<i>“I hear that Penny had a side trade going in dealing the drug Throbb too,”</i> she says. Seeing your surprised look, she adds with a shrug, <i>“I’m sure she was probably being secretive about it, but it’s surprising the amount of information you can pick up about someone when you’re scanning through all the multiverse versions of them. Nine out of ten Penny’s can’t be wrong, can they? We aren’t so different, her and I.”</i>");
		output("\n\nYou turn to leave, but as you do Dr. Badger calls out one last time behind you.");
		output("\n\n<i>“Oh, and I’ll let you know if any other work comes up. I’m sure I’ll have some... interesting things you can do in the future.”</i>");
	}
	//IF PC WAS BIMBO-IFIED BY DR BADGER
	else
	{
		output("<i>“Hey there!”</i> you call out happily as you make your way over to Dr. Badger. <i>“I took care of that job thingy you wanted!”</i>");
		output("\n\nShe looks up as you approach.");
		//IF PC HAS LOST THEIR BADGER FORM = 
		if(!pcHasBadgerForm()) 
		{
			output(" When she sees you she rolls her eyes, sighing <i>“Oh dear, it looks like you’ve gone and gotten yourself turned around, haven’t you?”</i>");
			output("\n\nYou stop, confused. <i>“Huh?”</i> By the time you look back up from looking around trying to see what the problem is she’s already like, right there, right up next to you.");
			output("\n\n<i>“There there,”</i> she teases, <i>“I know it can be hard out there in the </i>big bad<i> galaxy to avoid all the nasty aliens that want to turn you into whatever they want, but do </i>try<i> to keep yourself in shape when you’re talking to me, hmm? It is </i>my<i> shape, after all.”</i>");
			output("\n\nWith no more warning than that you feel the sharp sting of a needle being pressed into your skin, and then a warm, tingling sensation spreading out inside your flesh. The change that follows comes quickly, especially given how you lean into it, knowing how much it means to the doctor. In moments you’re staring up at her lovingly along your badger snout once again, shivering as she strokes your black and white fur, and with your cock stiffening in anticipation over your dripping wet slit. <b>You are back to being the same badger form as you were after first meeting Dr. Badger!</b>");
			output("\n\n<i>“Now that that’s taken care of, we can get on with things.”</i>");
			resetDrBadgerBimboTF();
		}
		output(" The Doctor grins in approval at what she sees, then asks, <i>“So, how did it go?”</i>");
		output("\n\n<i>“Oh wow,”</i> you answer eagerly, <i>“like, so good. </i>So<i> good. She like, </i>super<i> enjoyed it. We, uh, both did.”</i>");
		output("\n\n<i>“Good for you!”</i> Dr. Badger says, giving you a nice little pat on the head. <i>“Glad to see you’re enjoying the benefit package I provide.”</i>");
		output("\n\n<i>“Yeah! And did you know that she now like, cums all the time? Like, </i>all<i> the time. It’s amazing!”</i>");
		output("\n\nDr. Badger laughs. You’re not sure why she’s laughing exactly, but that doesn’t stop your tail wagging happily behind you because of it. <i>“Of course she does silly. I gave her the premium package. That way she’s much more likely to not have the time or willpower to get in my way. Plus, I’m nothing if not a </i>benevolent<i> mad scientist.”</i>");
		output("\n\nYou nod, not really getting what she’s saying, but happy to agree anyway. <i>“But won’t she like, run out of cum at some point? I mean, I can cum a <i>lot</i>, but even I have to stop and lie down eventually.”</i>");
		output("\n\nHonestly, you don’t really care about the question, but something tells you that Dr. Badger really wants to talk about how smart she is for solving this problem, and you figure that if she wants to talk about it then who are you to <i>not</i> ask? When she does answer though, it’s a long and detailed thing, filled with important-sounding words like ‘quantum’, ‘multiverse’, and ‘duplicate’. Something about Penny feeding energy off of like, other Penny’s? Sure?");
		output("\n\nWhen Dr. Badger finally stops talking, you nod and smile happily. <i>“Wow! That’s really smart!”</i>");
		output("\n\nShe pats you on the head again, saying nicely <i>“Aww, aren’t you sweet. Now, I think you’re due a reward...”</i>");
		output("\n\nAs quick as you can you fall down to your knees, nuzzling your snout along Dr. Badger’s cock. It’s still covered up in its cute little sleeve thingy, but you’re pleased to see it start to get hard at your attention. Above you, Dr. Badger laughs. <i>“I was actually going to </i>pay<i> you, you know.”</i>");
		output("\n\n<i>“That’s good too,”</i> you say as you rub your muzzle against her crotch, <i>“but like, all this talk about cum, and I just... I really want to suck your cock, and, well, I </i>have<i> been good, haven’t I</i>?”</i>");
		output("\n\nShe nods, and with a thrill you feel her hands sliding downwards to grab the back of your head. <i>“You have been good,”</i> she answers, and then suddenly she’s taken the cover off her cock and the smell just <i>hits</i> you and it’s not like the smell is like, good, but it’s just that it means that she’s close and it’s close and your tongue slides out and you can taste it it’s there you’re being allowed to just sink into it and it feels so, so good...");
		output("\n\nFor a long time she lets you just do what you want, doing nothing more than curling her claws through your hair as you lick all over her cock again and again, completely lost in how good it tastes and how <i>good</i> it is to just be allowed to worship at it. Soon it gets all slick and sticky, from both your spit and Dr. Badger’s pre-cum, and then you just can’t hold yourself back.");
		output("\n\n<i>“Please,”</i> you whimper as loudly as you can from around it, <i>“please, let me suck your cock. Please fuck my mouth, I want to drink your cum a-”</i>");
		output("\n\nBefore you get any further than that she agrees to your request, gripping your head tight as she presses her cock between your nice, plump lips. It’s bliss, it’s perfect, it’s what you’re <i>for</i>, getting fucked and used and taken like this, being allowed to use your lovely bimbo lips to service a nice thick cock, and <i>especially</i> the one of the person that gave your lovely bimbo look in the first place. Your eyes roll back in your head as she fills you up, your badger muzzle seemingly just the right size to fit her wonderful cock. Soon she starts thrusting faster and faster, and you can’t help but move one of your paws down to your own cock to tease yourself in time with her rhythm. You can’t help it, it all feels so good, you <i>need</i> to feel it more, just as you need to have her fill you with cum. Thankfully, she doesn’t make you wait long.");
		output("\n\nWith one last powerful thrust she presses into you, her cock twitching as it spurts blast after blast of hot sticky cum straight down your throat. You can’t really taste it back there, but that’s not the point, the point is how <i>good</i> it feels to have her filling you up like this, to feel that sloshing liquid pour down your throat as you pull her close, to feel it pooling deep down inside you even as your own hips jerk and your own cock starts cumming too.");
		output("\n\nEventually, after a good, long filling, Dr. Badger pulls herself out. You get one final taste of her cum-coated cock as it slides out of your lips, making you lick at it eagerly in order to lap up as much of it as possible. <i>“Good girl,”</i> she says softly, giving you one last pat on the head which makes your tail wiggle happily once again. Suddenly that pat turns into a push, and you’re confused until she adds <i>“now, clean up your mess...”</i>");
		output("\n\nOh! You hadn’t even been thinking about that, but you <i>have</i> left quite a puddle on the floor beneath you. You let yourself be pushed down obediently, lapping up your sticky cum eagerly.");
		output("\n\nWhile you work, Dr. Badger puts the cover back on her cock, then leans down to take something off your belt. <i>“I’ll take back my raygun now that you’re done with it, so I can get it ready for next time. But because you’re being so good, I’ll let you have both the reward you just got <i>and</i> a nice little bit of money. Aren’t you lucky?”</i>");
		output("\n\nYou feel her take the gun-thing off you, and slide a credit chit back in its place. Wow!");
		output("\n\n<i>“By the way, I found out that Penny had a side business selling Throbb, and she’s probably going to be a bit too distracted now to keep that up. We’re not so different, her and I, so if you ever need something to give you an even <i>bigger</i> cock, well, you know who to come to...”</i>");
		output("\n\nEventually you finish up, and with a pat on the butt Dr. Badger lets you know that you’re done here. You start to head out, but as you go she calls out one last thing.");
		output("\n\n<i>“Oh, and I’ll let you know if I have any more work for you. You did such a good job, I’m sure I’ll have some... interesting things for you in the future.”</i>");
		pc.loadInMouth(pc);
		pc.loadInMouth(chars["DRBADGER"]);
	}
	processTime(25);
	pc.credits += 3000;
	pc.removeKeyItem("Doctor Badger's Bimbo Raygun - Programmed for use on Penny.");
	//[Take from player quest item <i>“Bimbo Raygun”</i>. Give player 3,000 credits.]
	//[Add Buy Throbb button when using Dr. Badger as a store]
	flags["BADGER_QUEST"] = 3;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*Project Outline

This is content to finish the hanging option from Dr. Badger's bimbo-ing quest, allowing the player to turn the tables on Dr. Badger and bimbo her instead. To access this content, player must have met Dr. Badger, agreed to take the Bimbo-ing Penny quest from her, then gone to Penny, talked with her, and selected the option to Turn the Tables on Dr. Badger.

From there, this content adds Penny directing the player to Doctor Lash. On visiting him, Dr. Lash will (reluctantly) agree to modify Dr. Badger's bimbo ray gun to target her instead of Penny. Then the player can return to Dr. Badger's lab and shoot her with the gun, resulting in Bimbo Badger. For now Bimbo Badger has some simple sex scene options and nothing else, and will remove her as a vendor. 


Setup

[after player selects Turn the Tables option in quest, wait 24 hours then add the following text, no matter where the player is]
*/

public function pennyBadgerQuestAlert():void
{
	AddLogEvent("<b>A beep draws your attention to your Codex. Penny has sent you a message - it looks like she’s found a way to reprogram the gun that Dr. Badger gave you. You’d better go see her!</b>", "good");
	//[when player returns to Penny after receiving the above, add the below text to Penny's interaction space]
}

//Turn the Tables
public function turnTheTablesOnBadger():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("Penny grins as you walk over. <i>“Ah, [pc.name],”</i> she says, <i>“have I got a nice little surprise for you...”</i>");
	output("\n\nYou raise an eyebrow. <i>“Oh? What is it?”</i>");
	output("\n\n<i>“Well, you know our mutual friend, Dr. Badger?”</i>");
	if(!pcBimboedByBadger()) output("\n\n<i>“You mean the mad scientist who wanted me to turn you into a slutty bimbo pet? Yeah, I’m familiar with her.”</i>");
	else output("\n\n<i>“You mean the super smart doctor who made me all nice an’ bubbly an’ happy an’ horny?”</i>");
	output("\n\nPenny blushes a little at that, but nods. <i>“Well, I found out that she’s got some sort of nemesis");
	if(pc.isBimbo()) output("...”</i> she sees your blank expression and pauses. <i>“Uh, like, someone who is like, the opposite of her? Anyway");
	output(" - there’s another doctor just a few buildings up from her on Novahome that is apparently just as smart as she is, but the two of them do </i>not<i> get along.”</i>");
	if(!pcBimboedByBadger()) 
	{
		output("\n\n<i>“Huh. Seems a little weird that out of all the planets in the planet rush, the two evil scientists wind up right next to each other on the same one, doesn’t it?”</i>");
		output("\n\nPenny shrugs. <i>“Novahome is the most lawless place out of everything this rush has uncovered so far, so it kinda makes sense they’d both wind up there. Although I’m sure they’re not exactly enjoying each other’s company.”</i>");
	}
	else
	{
		output("\n\n<i>“Oh no,”</i> you gasp, <i>“that sounds terrible! Is there anything we can do to help them learn to get along?”</i>");
		output("\n\n<i>“Uh, well,”</i> Penny answers, <i>“I’ve got one idea, yeah.”</i>");
	}
	output("\n\n<i>“So here’s the plan,”</i> Penny continues. <i>“Take that raygun thing to Dr. Lash, and he’ll reconfigure it to work on Dr. Badger instead of... uh... me. I haven’t contacted him myself because he’s </i>also<i> a wanted criminal, so I figured he wouldn’t be too receptive to a " + (pennyIsCrew() ? "former ":"") + "UGC Peacekeeper messaging him, but I talked to some of my contacts and they’re pretty sure he’d agree to it if it means shutting down Dr. Badger.”</i>");
	if(pcBimboedByBadger()) 
	{
		output("\n\nYou’re shocked. <i>“Wait, shutting Dr. Badger down? You don’t mean like, hurting her, right?”</i>");
		output("\n\nPenny sighs. <i>“No... we’ll just be doing to her what she was wanting to do to me, remember? Making her all nice and... fun, like you.”</i>");
		output("\n\n<i>“Oh!”</i> you answer happily. <i>“Okay!”</i>");
	}
	output("\n\n<b>So, that’s the plan then. Take this gun to Dr. Lash on Novahome, and get him to make it work on Dr. Badger. And after that, you can finally see it in action...</b>");
	//[Give player quest item <i>“Bimbo Raygun,”</i> description <i>“This is the weird, old-timey raygun Dr. Badger gave you to use on Penny. According to her, it won’t work on anyone else.”</i>]
	output("\n\n<b>Quest item gained: Bimbo Raygun!</b>");
	pc.createKeyItem("Doctor Badger's Bimbo Raygun - Still programmed for use on Penny.",0,0,0,0);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function raygunStuff():void
{
	clearOutput();
	showDrLash();
	abeAuthor();
	//IF PC IS NOT A BIMBO
	if(!pc.isBimbo())
	{
		output("<i>“So, uh”</i>, you say hesitantly, aware that this will probably not be an enjoyable topic for him, <i>“you know that doctor who’s set up just across from you?”</i>");
		output("\n\n<i>“Doctor!”</i> he answers, and you get the impression he’d have spat that word with distaste if that didn’t seem like too much of a waste of perfectly functional saliva. <i>“Calling someone a ‘doctor’ implies they add something to the universe - that they use their intelligence to improve technology or at least people’s health. And </i>not<i>, as ‘Doctor’ Badger does, actively try to </i>reduce<i> the intelligence of the population, all the while </i>increasing<i> their damnable licentiousness!”</i>");
		output("\n\nThat definitely answers for what he thinks of her, you think. Out loud, you say, <i>“Well, what if I told you I’ve got a way we can take care of her?”</i>");
		output("\n\nDoctor Lash gives a short, sharp rasp of a laugh. <i>“Please. I’ve tried to... encourage her to move on myself in the past, but between her strength implants and the variety of mechanical traps she’s got set up in her... shack, all of our previous encounters have been little better than stalemates.”</i> He leans forwards, the light from his goggles dimming slightly as though he was narrowing his eyes at you. <i>“And what makes you think you could succeed where I failed?”</i>");
		output("\n\nHe’s clearly trying to be intimidating, but you’ve seen worse by now than some six-armed scientist. Standing your ground, you shrug nonchalantly. <i>“Well, she gave me this raygun to use on someone she wanted taken out of the way,”</i> you say, taking out the gun and showing it to him. <i>“And I was thinking - wouldn’t it be a </i>shame<i> if I just happened to zap Dr. Badger herself with it instead?”</i>");
		output("\n\nThere’s a pause as Doctor Lash regards the weapon in your hands, and then suddenly the lights of his goggles go wide. <i>“Of course! It’s so simple, why didn’t I think of it?”</i> He starts speaking quickly, one of his hands cradling his chin while the others gesture wildly. <i>“She’s protected from physical assault, and any sort of electrical incapacitation too no doubt, but she wouldn’t make herself immune to her </i>own<i> technology, or else she couldn’t keep making herself so... ridiculously sexual. So if we turn her own weapon against her, then we’ll be able to... hm.”</i>");
		output("\n\nHe stops. He’d been facing away from you and talking mostly to himself, but now he turns back and fixes you with another curious stare. <i>“Did she say what this weapon did, by any chance?”</i>");
		output("\n\nYou answer with a nod. <i>“She called it the Portable Personalised Badger BimboRay. So, I’m guessing it’s pretty straightforward.”</i>");
		output("\n\n<i>“Hmm, I was afraid of that.”</i> Doctor Lash is silent for a few moments, rubbing his chin and with his brow furrowed in thought. <i>“I wouldn’t expect anything less from someone like her. But the question is - dare I lower myself to that level? Can I bring myself to make someone a hypersexual ‘bimbo’”</i> - he puts air quotes around that word with two of his spare hands, clearly finding it too distasteful to utter without removing himself from it as much as possible - <i>“even if it’s to save many others from the same, or worse?”</i>");
		output("\n\nHe seems genuinely conflicted by this, so you try to help him out. <i>“Uh, yeah? The needs of the many outweigh the needs of the few, right?”</i>");
		output("\n\n<i>“Ah, excellent point!”</i> he responds, nodding slowly. <i>“Some actions, while distasteful, are necessary for the greater progress. And if we confront Dr. Badger now with her own designs, we’ll only be stopping her from inflicting them upon the galaxy at large. Now then!”</i> He looks at you, his mouth twisting upwards in the closest approximation of a smile you’ve seen him adopt. <i>“Let’s take a look at that raygun, shall we?”</i>");
		output("\n\nYou hand it over, and he scuttles back with it deeper into the lab. You expect to be waiting a while, but as it turns out it’s only a few minutes before the doctor returns.");
		output("\n\n<i>“A trivial procedure,”</i> he says smugly, noting your surprise at his speed. <i>“I’ve adjusted its targeting parameters to function on Dr. Badger. It will be less powerful than it would have been on its original target - there were all sorts of quantum entanglements set up for that poor character that I have neither the time nor the inclination to replicate against Dr. Badger - but it will still be more than enough to put a stop to her perverted research and allow me to legitimately advance science in peace.”</i>");
		output("\n\nHe gives the gun back to you. <i>“Now, if you would kindly go over and use it on her, both I and the universe at large would be very much obliged. Oh, one last thing - and I cannot stress this enough - never, ever tell me how you experience the results.”</i> He shudders visibly, apparently picturing it for a moment involuntarily.");
		output("\n\nStowing the weapon away again, you nod. Looks like you’re ready to turn the tables on Dr. Badger!");
	}
	//IF PC IS A BIMBO
	else
	{
		output("<i>“Hey so, like,”</i> you start, putting one finger to your plump lips as you try to think of what you’re supposed to be saying.");
		output("\n\nIn response, it looks like Doctor Lash rolls his glowing goggle eye things. <i>“Oh no,”</i> he sighs. <i>“She’s done it again hasn’t she? Made some other vacant sex toy purely to annoy me as much as possible.”</i> Turning to face you directly, he says loudly and slowly, <i>“NO THANK YOU. PLEASE LEAVE. PLEASE DO NOT GET SEXUAL FLUIDS ON MY EQUIPMENT. THANK YOU.”</i> Then he turns away from you again, muttering to himself, <i>“I swear, one day I’ll find a way to put a stop to her properly so I can end this madness...”</i>");
		output("\n\n<i>“Oh! But that’s, like, that’s what I’m here for! To get your help to... um...”</i> You stop for a moment, your mouth moving as you try to remember what exactly the plan <i>was</i> again. <i>“...help Dr. Badger be like me! With, uh, this!”</i> you add, holding up the ray gun thing.");
		output("\n\nDr. Lash turns around quickly, his glowing eyes staring first at your face and then at the thing in your hand. Then, suddenly, they go wide.");
		output("\n\n<i>“Of course! It’s so simple, why didn’t I think of it?”</i> He starts speaking quickly, one of his hands cradling his chin while the others wave around wildly. <i>“She’s shielded against physical assault, and any sort of electrical incapacitation too no doubt, but she wouldn’t make herself immune to her </i>own<i> technology, or else she couldn’t keep making herself so... ridiculously sexual. So if we turn her own weapon against her, then we’ll be able to... hm.”</i>");
		output("\n\nHe stops. He’d been facing away from you and talking to himself, but now he turns back and fixes you with another curious stare. <i>“Did she say what this weapon did, by any chance?”</i>");
		output("\n\n<i>“Yep!”</i> you answer happily. <i>“She said it’ll turn someone into a nice slutty bimbo, like me!”</i>");
		output("\n\n<i>“Hmm, I was afraid of that.”</i> Doctor Lash is silent for a few moments, rubbing his chin and, like, clearly thinking really hard. <i>“I wouldn’t expect anything less from someone like her. But the question is - dare I lower myself to that level? Can I bring myself to make someone a hypersexual ‘bimbo’”</i> - he puts air quotes around that word with two of his spare hands, for some reason - <i>“even if it’s to save many others from the same, or worse?”</i>");
		output("\n\nHe stops and thinks, for like, a real long time. Is he maybe stuck? Does he need help? <i>“Uh, yes?”</i> you say eventually. <i>“Beats not doing it, right?”</i>");
		output("\n\n<i>“Huh,”</i> he answers. <i>“Out of the mouths of babes, I suppose...”</i>");
		output("\n\nDid he just call you a babe? <i>“Thanks!”</i>");
		output("\n\n<i>“That’s... that wasn’t a compliment,”</i> he says slowly.");
		output("\n\nYou giggle. <i>“It is where I come from!”</i>");
		output("\n\n<i>“Anyway...”</i> he says firmly, wiping his face with his hands, <i>“I’ll do it. Let’s take a look at that raygun, shall we?”</i>");
		output("\n\nYou hand it over, and he goes into the back of the lab. You sit down and stare forwards, zoning out a little as you wait for him, but then all of a sudden he’s back.");
		output("\n\n<i>“A trivial procedure,”</i> he says smugly. <i>“I’ve adjusted its targeting parameters to function on Dr. Badger. It will be less powerful than it would have been on its original target - there were all sorts of quantum entanglements set up for that poor character that I have neither the time nor the inclination to replicate against Dr. Badger - but it will still be more than enough to put a stop to her perverted research and allow me to legitimately advance science in peace.”</i>");
		output("\n\nHe gives the gun back to you. <i>“Now, if you would kindly go over and use it on her, both I and the universe at large would be very much obliged. Oh, one final note - and I cannot stress this enough - never, ever tell me how you experience the results.”</i> He shudders, for some weird reason.");
		output("\n\nYou have <i>no</i> idea what most of the things he just said were, but you know enough to know that now all you need to do is go visit Dr. Badger again and zap her, then you can finally spread the bimbo fun!");
	}
	//[Give player quest item <i>“Reprogrammed Bimbo Raygun,”</i> description <i>“This is the weird, old-timey raygun Dr. Badger gave you to use on Penny. Doctor Lash has reprogrammed it now, so it will work on Dr. Badger instead.”</i>]
	output("\n\n<b>Quest item gained: Reprogrammed Bimbo Raygun!</b>");
	pc.removeKeyItem("Doctor Badger's Bimbo Raygun - Still programmed for use on Penny.");
	pc.createKeyItem("Doctor Badger's Reprogrammed Bimbo Raygun - For use on the Badger!",0,0,0,0);
	
	flags["BADGER_QUEST"] = -2;
	//Reset this shit. Don't need to save it
	flags["BADGER_QUEST_TIMER"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Zap Dr. Badger
//[Add Zap Dr. Badger button to Dr. Badger screen, if player has Repgrogrammed Bimbo Raygun item. Button description = ]
public function bimboZapDrBadger():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	flags["BADGER_QUEST"] = -3;
	//IF PC IS NOT A BIMBO
	if(!pc.isBimbo())
	{
		output("Dr. Badger looks up as you walk over to her. <i>“So then,”</i> she asks, <i>“is it done? Is the good officer happy and obedient rather than a potential obstacle?”</i>");
		output("\n\nYou smile coyly. <i>“Actually, I wanted to clear something up with you first. Remember when you asked if I was a hero?”</i>");
		output("\n\nShe visibly tenses up, her eyes narrowing, but she’s curious enough with where you’re going with this to let you continue. <i>“Yes?”</i>");
		output("\n\n<i>“Well, I thought I’d show you what a hero is </i>really<i> like...”</i>");
		output("\n\nIn one swift movement you pull out the raygun, pointing it squarely at her center mass and pulling the trigger. A bright blue shield flares up instantly in front of her, but the soft pink beam of the raygun seems to go straight through, bathing Dr. Badger’s body in its warm glow.");
		output("\n\nAfter the brief moment of reactive shock, Dr. Badger grins, clearly amused. <i>“Oh dear,”</i> she says mockingly. <i>“Here I was thinking you were coming at me with something </i>serious<i>, something that would be </i>worth<i> me burning out an emergency shield generator to defend against, but instead, what? You thought you’d just try to shoot me with the gun </i>I gave you<i>? The one that I’m pretty sure I told you wouldn’t work on anyone but my target? That is like, </i>not<i> a smart move.”</i>");
		output("\n\nA confused expression crosses her face quickly, but she shakes it off as she advances on you with a threatening grin. <i>“So now I’ve got to show you how I deal with insubord, uh, insub... being... double-crossed...”</i>");
		output("\n\nShe’s right up next to you now, and you’ve kept the warm pink beam from the raygun on her this whole time. <i>“Feeling a little bit off?”</i> you tease. <i>“Thoughts of your elaborate revenge not coming quite so quickly any more? Only just now realizing that you should have made your shield block your own gun if you were going to give it away, when there is a whole universe of people smart enough to reprogram it? That was </i>definitely<i> not a smart move.”</i>");
		output("\n\nGrimacing, she pulls back one fist to prepare a powerful punch, but before she can bring it forward again her already large tits jump outwards by a full cup size, and the unexpected wave of jiggling sensation that provokes drives her to her knees.");
		output("\n\nShe tries to speak, but it takes her a while to get words out as her lips start to expand, quickly becoming big and plump. <i>“Well... shit.”</i> she says eventually. <i>“I guess you... win this round...”</i>");
		output("\n\nYou grab her chin, pulling her muzzle up to look at you directly, keeping the beam aimed at the rest of her body all the while. <i>“Oh, I think I’ve won more than just one round,”</i> you hiss. <i>“I think this particular victory might last for some time...”</i>");
		output("\n\nShe whimpers as she falls backwards into a sitting position, her cock straining upwards, as her hands can’t help but drift down unconsciously towards it. Looks like she’s pretty much at your mercy.");
	}
	//IF PC IS A BIMBO
	else
	{
		output("<i>“Hey there!”</i> you say brightly, waving at Doctor Badger as you make your way towards her. She looks up, smiling as you walk over.");
		output("\n\n<i>“Ah, if it isn’t my favorite assistant. How goes the mission I gave you?”</i>");
		output("\n\nYou stop, putting a finger to your plump lips as you think. <i>“M... mission?”</i>");
		output("\n\nDoctor Badger sighs, but she <i>does</i> sound more amused than annoyed. <i>“Yes, remember? I gave you that very important task to take care of? Using that ray gun on that nasty cop?”</i>");
		output("\n\nYou tap your lips, still thinking. <i>“Uh... ray gun?”</i>");
		output("\n\nDoctor Badger sighs again, a little heavier this time, then points at your waist. <i>“That one, right there. I can see it hanging from your belt, so jus-”</i>");
		output("\n\n<i>“Oh!”</i> you chirp happily, grabbing the gun and holding it up, <i>“you mean this thing?”</i>");
		output("\n\n<i>“I may have overdone it on this one...”</i> she mutters quietly, but before you can do anything more than look confused she speaks again, louder this time. <i>“Yes dear, that’s the one. Now, you just need to take that and go zap th-”</i>");
		output("\n\n<i>“Oh! Like this?”</i> you interrupt again, pulling the trigger and zapping Doctor Badger, making a warm, pink beam cover her entire body.");
		output("\n\nIn response, she puts her head in her hands. <i>“Wow,”</i> she says slowly. <i>“No. Really no. You’ve gone and wasted the charge now, I’ll have to power it back up again before you can use it to like, zap the correct person.”</i>");
		output("\n\nShe stops talking for a little bit, and then looks back up at you. <i>“Any reason you’re still shooting me with it?”</i>");
		output("\n\nYou shrug. <i>“It’s pretty!”</i>");
		output("\n\nShe can’t help but give a short laugh. <i>“Yes, I guess it is. Anyway, that’s enough of that. Give it back and I’ll charge it back up again by... uh... huh.”</i>");
		output("\n\n<i>“What’s the matter?”</i> you ask innocently.");
		output("\n\nIt takes her a little bit to answer. It looks like she’s trying to think of how to say something first, but then she tilts her head to the side like she’s confused. <i>“You’re... uh, you’re still zapping me,”</i> she says eventually.");
		output("\n\n<i>“Yep!”</i> you answer simply.");
		output("\n\n<i>“It feels... feels...”</i> she drops down to her knees suddenly, and it looks like she’s getting really distracted. <i>“Did... did you do something to that gun?”</i> she asks.");
		output("\n\nYou shake your head, but then remember something. <i>“Oh! </i>I<i> didn’t, but that other weird doctor just across from you did. Changed the target of it or... something?”</i> You shrug. <i>“Honestly I don’t know </i>what<i> the heck he was talking about, but he said to come back here and this gun thing seems like it’s cool so I guess this is happening now?”</i>");
		output("\n\nDoctor Badger just stares at you for a long moment. <i>“Wow,”</i> she says eventually. It looks like it’s getting harder for her to say big words like she normally does, because her lips are starting to get all nice and plump - like yours! <i>“Turning my love of bimbos against me... that’s... really smart...”</i>");
		output("\n\nYou giggle. <i>“Is it? I don’t really know what’s happening, but thanks!”</i>");
		output("\n\nThe doctor doesn’t answer, instead just shifting backwards a little bit so she’s sitting down, freeing up her big hard cock to rise up in front of her.");
		output("\n\n<i>“Oh!”</i> you say quickly. <i>“I know </i>this<i>. Now’s the part where we fuck, right?”</i>");
		output("\n\nStill bathed in the lovely warm pink glow from the ray gun, Dr. Badger can only respond with a quiet <i>“mmmMph!”</i> as she desperately chews her lip, her hands drifting down towards her cock. Guess that’s a yes then!");
	}
	processTime(11);
	clearMenu();
	if(pc.isBimbo() || pc.isBro()) addButton(0,"Watch Change",watchBadgerChange,undefined,"Watch Her Change","How could you resist joining in on the fun?");
	else addButton(0,"Watch Change",watchBadgerChange,undefined,"Watch Her Change","Stand back and enjoy your victory by watching Dr. Badger become a slutty bimbo.");
	if(pc.hasCock())
	{
		addButton(1,"Get Blowjob",getABlowjobFromBimboBunsBadger,undefined,"Get Blowjob","Make her suck your cock.");
		addButton(3,"FuckHerAss",fuckDoctorBadgersAss,undefined,"Fuck Her Ass","Take this new bimbo from behind.");
	}
	else
	{
		addDisabledButton(1,"Get Blowjob","Get Blowjob","You need a penis to do this.");
		addDisabledButton(3,"FuckHerAss","FuckHerAss","You need a penis to do this.");
	}
	if(pc.hasVagina()) addButton(2,"Get Licked",getEatenOutByBimboBadger,undefined,"Get Licked","Make her service your pussy orally.");
	else addDisabledButton(2,"Get Licked","Get Licked","You need a vagina for that.");
}

//So, what do you want to do?
//[Watch Her Change][Get Blowjob][Get Eaten Out][Fuck Her Ass]
//[mouseover text for Watch Her Change = Stand back and enjoy your victory by watching Dr. Badger become a slutty bimbo][NOT //AVAILABLE IF PLAYER IS A BIMBO]
//[mouseover text for Get Blowjob = Make her suck your cock][NOT AVAILABLE IF PLAYER HAS NO COCK]
//[mouseover text for Get Eaten Out = Make her service your pussy orally][NOT AVAILABLE IF PLAYER HAS NO PUSSY]
//[mouseover text for Fuck Her Ass = Take this new bimbo from behind][NOT AVAILABLE IF PLAYER HAS NO NON-TAIL COCK]

//Watch Her Change
public function watchBadgerChange():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("<i>“Aww, you’re all worked up, huh?”</i> you tease, stroking her face softly with one hand, while your other keeps the raygun beam pointed squarely at the middle of her chest. <i>“I bet you’re desperate for a bit of relief, aren’t you?”</i>");
	output("\n\nBy this point, Dr. Badger’s lips look almost an inch thick, and she clearly has trouble speaking properly through them. Her whole body is shivering slightly too, her breasts straining at the material of her outfit as the previously black hair on her head slowly starts to gain blonde tips. Eventually she manages to mumble <i>“Y... yes...”</i>");
	output("\n\nYou shift your hand, changing to grip her tightly by the chin. <i>“Well, that’s too bad,”</i> you answer simply. <i>“After what you tried to pull, I’m going to give you </i>exactly<i> what you deserve. I’m going to slowly turn you into a nice, horny bimbo slut, and then not even fuck you.”</i>");
	output("\n\nShe tries to look away as her cheeks blush desperately, but you keep her held tight, her eyes locked with yours. <i>“I’m going to leave you in a dripping puddle of your own need, and there’s nothing you can do about it, is there?”</i>");
	output("\n\nWith a sudden burst of strength she pulls back from you, sliding backwards across the floor of her lab and clambering awkwardly to her knees. You can tell it’s taking a lot of effort from her - behind her puffy lips you can see her teeth gritted together from the exertion, but in response you simply lean back calmly against a nearby bench and make sure she’s still enveloped by the warm pinkness of her bimbo ray.");
	output("\n\n<i>“I... I can... fight it...”</i> she says, climbing slowly to her feet. She looks up at you, and for just a second you see the same fiery threat she had when you first met her, the same suggestion of barely restrained power, but this time you’re undeniably in control.");
	output("\n\n<i>“Oh, I don’t think so,”</i> you answer confidently. <i>“You do good work. You’re a little too sure of yourself, of course, but your inventions definitely seem to work.”</i>");
	output("\n\nHer right hand balls into a fist, and she takes one staggering step towards you, but from the way she stops and pants desperately it’s clear the beam is taking its toll on her resistance.");
	output("\n\n<i>“You can feel it, can’t you?”</i> you tease. <i>“Your breasts straining to grow, to become the luscious, heavy tits they should be...”</i>");
	output("\n\nWith a gasp she falls back to her knees, seemingly weighed down by her expanding chest. Hooking one of her fingers inside her shirt she manages to tear it down the middle, breathing a sigh of relief as her breasts are finally allowed to spill out freely.");
	output("\n\nYou can’t help but raise your eyebrows at the sight. They were already pretty sizeable, but now they look almost the size of watermelons. She has impressively large areolas too - big dark circles around each nipple, although given that you haven’t seen her topless before you can’t be sure if that was always the case or if it’s something new.");
	output("\n\n<i>“Oh </i>my,”</i> you say appreciatively. <i>“Your tits really have gotten big, haven’t they? And doesn’t it feel better to have them out in the open like that?”</i>");
	output("\n\nShe nods unthinkingly, but catches herself halfway through the motion and quickly shakes her head in an attempt to clear it, moving to once again climb back to her feet.");
	output("\n\n<i>“Uh uh uh, none of that.”</i> You waggle a finger in front of her, while at the same time bringing the raygun closer to increase the intensity of the beam. <i>“You’re much better suited to being on all fours, don’t you think?”</i>");
	output("\n\nReflexively she brings her arms up, catching herself against the ground as she falls forwards once again. She’s wound up on all fours just as you commanded, and she <i>knows</i> she’s obeyed even if she didn’t want to, but it looks like she can’t manage to do anything beyond panting desperately as her bust size slowly increases.");
	output("\n\n<i>“There we go. Doesn’t that feel better? Now, roll over.”</i>");
	output("\n\nShe does. There’s no excuse this time, no way she could blame a sudden shift in her balance for how she throws herself onto her back the instant she hears your command. It just happens, and from her expression it looks like she didn’t even realize she was doing it until she’d already obeyed.");
	output("\n\n<i>“Good </i>girl<i>,”</i> you say with a grin, stepping forwards to stand over her. <i>“Now, let’s get a bit more... specific.”</i>");
	output("\n\nYou adjust your aim, pointing the beam of the raygun directly at her crotch. Honestly you’re not entirely sure <i>what’s</i> going to happen - you figure it’s pretty much even odds as to whether it will get rid of her cock and balls or make them even bigger, but within a few seconds you have your answer as to which way she programmed it. Dr. Badger bites her lip as her balls begin to swell, her cock starting to slowly drip with pre-cum as it gets pumped unstoppably full of churning fluid.");
	output("\n\nYou can’t help but laugh a little to yourself. <i>“I guess you like your bimbos well-endowed all round, huh? Well, I can work with that...”</i>");
	output("\n\nIt’s debatable whether Dr. Badger even hears you. It looks like her whole world is focused on her throbbing cock, filling out in every dimension in shuddering, rhythmic pulses. She makes an admirable show of restraint by clutching at the ground, trying desperately to keep her hands from wrapping around her dick and giving in to her overpowering need.");
	output("\n\nIt takes a little work, but you manage to lean right down next to her face while still keeping the beam focused fiercely on her crotch. <i>“You’re still fighting it, aren’t you?”</i> you whisper softly. <i>“But doesn’t it feel so good, the way your cum is just filling you up, making you feel so full and needy, so slick and eager. Don’t you want to feel like that all the time?”</i>");
	output("\n\nShe whimpers, her hands losing their grip and sliding unstoppably down the side of her body.");
	output("\n\n<i>“You need it </i>so badly<i>, don’t you? Look at you, you’re </i>dripping<i>.”</i>");
	output("\n\nHer resolve is just about gone, you can tell. Her left hand starts pawing at her breasts, but from the shudder that runs through her that clearly wasn’t the minor transgression she was hoping it would be. But still her right hand is clenched against her thigh, so tightly you can almost see the white of her knuckles through her black fur.");
	output("\n\nYou lean in closer. <i>“You’re so full, aren’t you? Don’t you need to just let go? Sink down and embrace it, and let yourself cum instead of just dripping with need?”</i>");
	output("\n\nHer hand drifts closer, climbing slowly up towards the base of her shaft.");
	output("\n\n<i>“Drip...”</i> you whisper.");
	output("\n\nHer fingers slide up her cock, wrapping tightly around the tip.");
	output("\n\n<i>“Drip...”</i>");
	output("\n\nShe moves her thumb slowly, shivering with pleasure as she spreads the lubrication of her pre-cum, her hand rapidly becoming slick and ready.");
	output("\n\n<i>“Drip...”</i>");
	output("\n\nWith a sudden, dramatic gasp she gives in, her hand pumping furiously up and down her shaft, her back arching at the overload of sensation that provokes. Her mouth is hanging open, her tongue lolling over her plump lips as she writhes in pleasure. You put the raygun aside, figuring by now its job is done. The fact that she’s no longer being kept in its warm pink glow doesn’t seem to make any difference to Dr. Badger; she’s still working herself over furiously, and her body is still changing as she finally gives in and lets her new bimbo nature assert itself. It’s clear that it’s not going to take her much longer to orgasm, the question is - do you want to let her have her reward? Or would you rather keep her pent up as punishment?");
	processTime(18);
	clearMenu();
	//[Let Her Cum][Don’t Let Her Cum]
	addButton(0,"LetHerCum",letBimboBadgerCum);
	addButton(1,"Don’t",dontLetDoctorBadgerCum);
}

//Let Her Cum
public function letBimboBadgerCum():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("Stroking her gently on the head, you watch as the bleach blonde color seems to follow your fingers, and with a few encouraging sweeps her new bimbo hairstyle is complete. <i>“That’s it girl,”</i> you whisper, <i>“you’re going to cum away all that excessive intelligence, all that fiery trouble-making, until you’re nothing but a nice, obedient, ditzy bimbo slut, aren’t you?”</i>");
	output("\n\nHer response is barely audible, but she can’t help but say the right words. <i>“Y... yes... please...”</i>");
	output("\n\nYou lean down further, gripping her breasts in your hands and encouraging them, making them round outwards into great, heavy tits that she couldn’t possibly conceal even if she wanted to. Then you hiss, <i>“Cum!”</i>");
	output("\n\n<i>“Ahh-ahhmmmmm!”</i> she cries, her hips bucking upwards as her cock surges, a thick jet of cum splattering across the bottom of her tits.");
	output("\n\n<i>“Good girl,”</i> you say encouragingly. <i>“Can you feel it? Can you feel your worthless smarts getting washed away with every orgasm, replaced with perfect, endless lust?”</i>");
	output("\n\nShe answers with another orgasm, a second eager spray coating her chest, but then it’s like a dam breaks and suddenly she can’t <i>stop</i> talking, every sentence interspersed with shuddering climaxes.");
	output("\n\n<i>“Y-YES! I can feel it, it feels so g-GOOD! Uhmm-ah! Please, let me c-CUM it all out, I need to, I need to- ahmm! Make me your... horny bimbo sluT! AhmmMM! Oh, ohh... I don’t need to think, just... cum! Cum!”</i>");
	output("\n\nYou cradle her head softly, looking deep into her eyes and see nothing more than a slutty bimbo need staring back at you. <i>“That’s it girl. You don’t need to think. Just cum...”</i>");
	output("\n\nShe cums as you say the word, but as soon as she recovers she repeats the phrase unthinkingly. <i>“Don’t think... just cum...”</i>");
	output("\n\nYou reposition her slightly, leaving her lying on her back with her hips angled upwards, so that her stiff cock has enough of an angle to reach her face. By this point her tits and stomach are drenched with whiteness, but you figure this new position should provide enough of a feedback loop to really finish things off. She doesn’t resist in the slightest, and when you’re done you stand back and say simply, <i>“You’re a bimbo slut. What are you?”</i>");
	output("\n\nHer response is a yell. <i>“I’M A BIMBO... SLUT! AhmmHHmm!”</i> With that, she has the most dramatic orgasm so far, and just as you’d hoped a thick arc of cum makes it all the way over her tits and lands on her face. She manages to get a significant amount of it in her open mouth, and its taste clearly seems to spur her on further. Settling into a mantra of <i>“Bimbo! Slut! Bimbo! Slut!”</i> she climaxes again and again, truly embracing her new role.");
	output("\n\nSatisfied with the results, you step back and slip quietly out of the shack, deciding you’d rather leave her to it for the moment rather than get messy yourself.");
	processTime(13);
	clearMenu();
	addButton(0,"Next",postBadgerBimboSexSceneShit);
}

//Don’t Let Her Cum
public function dontLetDoctorBadgerCum():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("<i>“Oh no,”</i> you hiss, <i>“you don’t get off that easily.”</i> You reach down and yank her hands away from herself, making her whimper with pent-up need. <i>“After all the stuff you pulled? Threatening me when I first came in? Making out like you’re the baddest bitch in the universe? No no, you’ve met your match, and now it’s time for you to pay the price...”</i>");
	output("\n\nKeeping her hands tightly secured, you force her to her feet. It’s clear that at this point all she can think about is how much she needs to cum, so she can’t even begin to resist you as you roughly pull her upwards. You push her forwards against a nearby bench, leaving her hands forced flat against the surface while her cock trembles agonisingly against the bottom of it.");
	output("\n\n<i>“Now, repeat after me,”</i> you say, <i>“I’m nothing but a bimbo slut.”</i>");
	output("\n\nShe gasps beneath you, trying to wriggle out of your grip, but a quick push from behind reinforces who is in control. <i>“Please, I need to c-cum!”</i> she moans.");
	output("\n\n<i>“I am nothing but a bimbo slut,”</i> you command again.");
	output("\n\nShe tries to grit her teeth against it, but you can tell it’s a losing battle. <i>“I’m... I’m a bimbo slut...”</i>");
	output("\n\nYou tighten your grip. <i>“Again.”</i>");
	output("\n\n<i>“I’m nothing but a bimbo slut!”</i>");
	output("\n\nAs she says those words, you watch the platinum blonde color at the tips of her hair slowly overtake her scalp, leaving her with a perfect bimbo hairdo. Her tits push outwards a little more too, and from the way her knees buckle a little you suspect her surging cock and balls just added some extra mass too. Grinning fiercely, you say one last time, <i>“Again!”</i>");
	output("\n\nAny resistance she had collapses as she finally gives in all the way, letting herself embrace every part of the role you’ve given her. <i>“I’m nothing but a bimbo slut! Please! Please, make me your ditzy bimbo slut!”</i>");
	output("\n\nYou lean in close, snarling in her ear, <i>“There, now <i>that’s</i> how you treat a hero. Was that so hard?”</i>");
	output("\n\n<i>“No! Yes! Please! Uhmmmm!”</i> she babbles, unsure of what you want but desperate to fulfill whatever it could be.");
	output("\n\nLooking around, you manage to find some adhesive tape in a nearby pile of junk. Keeping her pinned by simply keeping her pressed forwards with the weight of your body, you reach over and grab the tape, securing each of her wrists to the table. It’s not a very strong restraint, and she’s probably still powerful enough to break out of them if she can think clearly enough to do so, but it should hold her for at least long enough to make your point.");
	output("\n\n<i>“Now you’re going to stay right here and think about what you did. And when I see you again, you’d better be a nice, happy, obedient bimbo.”</i>");
	output("\n\nHer response is barely coherent, a simple string of crazed agreement. <i>“Yes! I will! I am! Yes please!”</i>");
	output("\n\nSatisfied, you step back and slip quietly out of her shack, content to leave her to her lesson.");
	processTime(11);
	clearMenu();
	addButton(0,"Next",postBadgerBimboSexSceneShit,true);
}

//Get Blowjob
public function getABlowjobFromBimboBunsBadger():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("<i>“I know what will help you through this,”</i> you say as you take off your [pc.gear], letting your quickly hardening cock out into the open. <i>“Time for you to get your first taste of serving others like a good little bimbo, hmm?”</i>");
	output("\n\nShe turns to face your [pc.biggestCock], and her eyes slowly drift closed. At first you’re not sure what’s happening, but then you see her muzzle wrinkle as she breathes in deeply, her mouth sliding into a smile as your scent washes over her.");
	output("\n\n<i>“Oh, you like that do you?”</i> you ask, amused.");
	output("\n\nHer response is distant and quiet. <i>“Yeahhhh,”</i> she says softly. <i>“Smells... good...”</i>");
	if(pc.isBimbo()) output("\n\nYou giggle lightly. <i>“That’s a great start! But c’mon, time for you to actually like, get into it.”</i>");
	else output("\n\nYou smile too. <i>“Oh honey, if you like it now, you’re going to love it when it’s filling you up. Speaking of which...”</i>");
	output("\n\nYou press forward, you cock sliding easily between Dr. Badger’s plump lips. They feel so silky soft, like they were <i>made</i> to suck cock - which, when you think about it, they pretty much were. If it feels good for you though, it’s pretty clear that Dr. Badger is enjoying it even more. Her eyes roll back in her head, and her cute little badger hands move to grab at the base of your shaft, massaging you eagerly.");
	output("\n\n<i>“Ahhhhh, there we go,”</i> you sigh happily. <i>“Doesn’t that feel good? Doesn’t that feel right?”</i>");
	output("\n\nThere’s a small movement as Dr. Badger tries to nod, but she quickly stops as it gets in the way of her properly sucking cock.");
	output("\n\nYou put your hands on the back of her head to encourage her. <i>“Good girl,”</i> you say gently. <i>“That’s it. Just let yourself go, and sink down into your role as a nice, eager bimbo slut...”</i>");
	output("\n\nAt that she starts moving faster, her tongue sliding along the length of your slick shaft, while her soft black nose presses up against your flesh, desperate to take in as much of your scent as possible. You’re not sure if it’s because of what you did or a talent she already had, but she is <i>good</i> at this. Pretty soon you find your hands tightening around the back of her head, your [pc.biggestCock] surging as a wave of cum floods through it.");
	output("\n\nShe swallows it all greedily, and with every hurried gulp you see the bleached blonde color that had just started in at the tips of her hair pulsing outwards, until after a few long, thrusting seconds she’s left with a perfect bimbo hairdo.");
	output("\n\nSatisfied, you push her back lightly and she falls back easily onto her rump, looking up at you adoringly as she licks her lips clean.");
	if(pc.isBimbo()) output(" You giggle again as you wipe your dripping cock off on her face while she pants happily. <i>“Good job! Isn’t sucking cock just the </i>best<i>? It’s like, so great. I’m so glad I get to suck dicks like, all the time, and now you can too! Isn’t that great!”</i>.");
	else output(" You exhale contentedly as you lean backwards, taking a moment to wipe your dripping cock off on her face while she pants happily. <i>“Good girl. It feels good to be a nice, cock-sucking bimbo slut, doesn’t it? And you’re so </i>good<i> at it! I’m going to have to make sure I use you again, and again, and again...”</i>");
	output("\n\nIt takes her a little while to reply, because at first she’s too busy making sure she’s licked up and swallowed all of the cum you left her with. Eventually though she laughs - a light, chirpy giggle that makes her breasts jiggle nicely. <i>“Yeah! That sounds like, </i>super<i> good!”</i>");
	output("\n\nThere’s another brief pause, and then with an <i>“Ooh! Yeah!”</i> she suddenly remembers that <i>she</i> has a cock too. She leans back on her butt and starts jerking herself off happily, her tongue hanging out as she looks forward to another fresh blast of cum.");
	output("\n\nWell, it looks like she’s definitely an eager bimbo now, rather than the mean, mad scientist she was when you first met her. Job done! She’s clearly got a lot of juice left in her tank, but you’re feeling drained enough that you decide to leave her to it for a while, redressing quickly and slipping quietly out of her shack.");
	processTime(31);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",postBadgerBimboSexSceneShit);
}

//Get Eaten Out
public function getEatenOutByBimboBadger():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("<i>“I know what will help you through this,”</i> you say as you take off your [pc.gear], letting your dripping pussy out into the open. <i>“Time for you to get your first taste of serving others like a good little bimbo, hmm?”</i>");
	output("\n\nShe turns to face your [pc.biggestVagina], and her eyes slowly drift closed. At first you’re not sure what’s happening, but then you see her muzzle wrinkle as she breathes in deeply, her mouth sliding into a smile as your scent washes over her.");
	output("\n\n<i>“Oh, you like that do you?”</i> you ask, amused.");
	output("\n\nHer response is distant and quiet. <i>“Yeahhhh,”</i> she says softly. <i>“Smells... good...”</i>");
	if(pc.isBimbo()) output("\n\nYou giggle lightly. <i>“That’s a great start! But c’mon, time for you to actually like, get into it.”</i>");
	//IF PC IS NOT A BIMBO = 
	else output("\n\nYou smile too. <i>“Oh honey, if you like it now, you’re going to love it when your muzzle is pressed all the way inside. Speaking of which...”</i>");
	output("\n\nYou move forward, her plump lips kissing delicately at your folds as you press yourself against her. They feel so silky soft, like they were <i>made</i> to service pussy - which, when you think about it, they pretty much were. If it feels good for you though, it’s pretty clear that Dr. Badger is enjoying it even more. Her eyes roll back in her head, her cute little badger hands moving to grab your waist, giving herself the leverage to push her muzzle hungrily inside you.");
	output("\n\n<i>“Ahhhhh, there we go,”</i> you sigh happily. <i>“Doesn’t that feel good? Doesn’t that feel right?”</i>");
	output("\n\nThere’s a small movement as Dr. Badger tries to nod, but she quickly stops as it gets in the way of her properly eating out your pussy.");
	output("\n\nYou put your hands on the back of her head to encourage her. <i>“Good girl,”</i> you say gently. <i>“That’s it. Just let yourself go, and sink down into your role as a nice, eager bimbo slut...”</i>");
	output("\n\nAt that she starts moving faster, her tongue lapping at your slick folds while her soft black nose presses up against your flesh, desperate to take in as much of your scent as possible. You’re not sure if it’s because of what you did or a talent she already had, but she is <i>good</i> at this. Pretty soon you find your hands tightening around the back of her head, your [pc.biggestVagina] trembling as a wave of femcum surges through it.");
	output("\n\nShe swallows it all greedily, and with every hurried gulp you see the bleached blonde color that had just started in at the tips of her hair pulsing outwards, until after a few long, quivering seconds she’s left with a perfect bimbo hairdo.");
	output("\n\nSatisfied, you push her back lightly and she falls back easily onto her rump, looking up at you adoringly as she licks her lips clean.");
	if(pc.isBimbo()) output(" You giggle again as you wipe your dripping pussy off on her face while she pants happily. <i>“Good job! Isn’t eating someone out just the </i>best<i>? It’s like, so great. I’m so glad I get to have my face pressed into someone’s slit like, all the time, and now you can too! Isn’t that great!”</i>.");
	else output(" You exhale contentedly as you lean backwards, taking a moment to wipe your dripping pussy off on her face while she pants happily. <i>“Good girl. It feels good to be a nice, slit-licking bimbo slut, doesn’t it? And you’re so </i>good<i> at it! I’m going to have to make sure I use you again, and again, and again...”</i>");
	output("\n\nIt takes her a little while to reply, because at first she’s too busy making sure she’s licked up and swallowed all of the cum you left her with. Eventually though she laughs - a light, chirpy giggle that makes her breasts jiggle nicely. <i>“Yeah! That sounds like, </i>super<i> good!”</i>");
	output("\n\nThere’s another brief pause, and then with an <i>“Ooh! Yeah!”</i> she suddenly remembers that she has a cock she can play with too. She leans back on her butt and starts jerking herself off happily, her tongue hanging out as she looks forward to tasting a different flavor of cum.");
	output("\n\nWell, it looks like she’s definitely an eager bimbo now, rather than the mean, mad scientist she was when you first met her. Job done! She’s clearly got a lot of juice left in her tank, but you’re feeling drained enough that you decide to leave her to it for a while, redressing quickly and slipping quietly out of her shack.");
	processTime(31);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",postBadgerBimboSexSceneShit);
}

//Fuck Her Ass
public function fuckDoctorBadgersAss():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	if(pcBimboedByBadger()) output("<i>“Feels good, doesn’t it?”</i> you purr. <i>“Oh! I know what we should do!”</i> You grab her by the shoulders, spin her around and push her forwards, leaving her on all fours facing away from you, her ass raised up in the air. <i>“You fucked me through it like this when I was turning into a nice sexy bimbo, so it’s only fair I do the same for you, right?”</i>");
	//IF PC WAS NOT BIMBO-IFIED BY DR BADGER
	else 
	{
		output("<i>“Looks like you’re just about ready girl,”</i> you purr. <i>“We just have to finish you off, and I think I know exactly how to do it...”</i> You grab her by the shoulders, spin her around and push her forwards, leaving her on all fours, facing away from you with her ass raised up in the air. <i>“I think this position is the most appropriate, don’t you? After all...”</i>");
		output("\n\nYou reach forward, gripping her tightly by the chin and pulling her face back - not enough to hurt, but just enough that she can feel you pressing against her and know exactly who’s in control. <i>“...your ass is mine,”</i> you finish triumphantly.");
	}
	output("\n\nWithout bothering to wait for any sort of response you step up to her, the fact that she never wears anything below the waist meaning you can slide your cock into her ass without hesitation. It feels like she’s already slick somehow - you’re not sure if that’s because of what you’ve done or if that was a feature she already had, but you definitely appreciate it. She’s clearly enjoying herself too, letting out a long low moan as she settles backwards against you.");
	output("\n\n<i>“Good girl,”</i> you whisper. <i>“Doesn’t that feel good?”</i>");
	output("\n\nShe gasps as you press yourself forwards again, then manages to pant out a response. <i>“Y... yes...”</i>");
	output("\n\n<i>“You want this, to be fucked into a nice, bimbo slut, don’t you?”</i>");
	output("\n\n<i>“I...”</i> There’s a pause. She doesn’t stop moving in and out against you, but she can’t bring herself to say the words.");
	output("\n\n");
	if(pc.isBimbo()) output("<i>“Oh, don’t worry!”</i> you reassure her as you keep up your constant thrusting rhythm. <i>“Being a bimbo is the best! You get to... mhmmm... fuck all the time, you get to... ah-ahmmm! Be fucked over and over again. You get to- to! Suck cock, eat pussy, drink c-cum! All the time, every day, over a- ahhM! And over, you get to be treated as the... Slut! That it feels so... good! To... be! Ahhm! Oh, oh, you have to, have to give in, accept it, let yourself be a nice... bimbo! Slut! Please, it’s so... so good! Ahhmmm!”</i>");
	//IF PC IS NOT A BIMBO
	else output("<i>“That’s cute,”</i> you say mockingly, your words punctuated by occasional but powerful thrusts. <i>“You’re trying to fight it, aren’t you? But you can’t fight how it makes you feel, can you? Can’t fight how good it feels to be... bent over and... taken! To be... pushed down onto the ground, to have a cock... fill you up! To have your mouth hang open... your tongue pant wantonly... your big, delicious tits... swaying heavily, so your nipples can’t help but... mhmmm... brush against the floor!”</i> Once again you lean forwards, bending over her to grab her fiercely by the chin. <i>“It feels good to be... used! To be... taken! To be... fucked! Like the... eager! Bimbo! Slut! That you... are!”</i>");
	output("\n\nThat does it. She answers you with a great panting moan, throwing her head back and crying out, <i>“Ahhmm! Fffuck, yes, please! Yes, take me, take me-uhmmmn! Make me a bimbo slut! Please!”</i>");
	output("\n\nYou’re happy to oblige, grabbing her by the shoulders to give yourself leverage, then pistoning your cock into her ass for all you’re worth. She moves against you eagerly, desperate to make your thrusts more powerful and filling, and with that motion it isn’t long before you feel yourself start to tense up. <i>“Here it- here it comes!”</i> you gasp, and before she can respond you throw yourself forwards, burying your cock deep inside her as you finally cum.");
	output("\n\nAt first all you can focus on is the desperate, shuddering pulses of your own climax, but soon you notice something. With every spurt of cum you fill her with, you see the bleached blonde color that had just started in at the tips of her hair sweeping outwards, until after a few long, quivering seconds she’s left with a perfect bimbo hairdo. You feel her tense up too, her own cock unloading and painting a thick puddle onto the ground beneath her.");
	output("\n\nEventually you find yourself starting to wind down. You give her one last shuddering thrust and then slowly pull away, making her quiver again at the sensation of your cock moving back out. As soon as you’re free she falls forwards, blissfully relaxing into the feeling of lying in a pool of her own cum.");
	output("\n\nFor quite a while you both simply pant, her on the ground and you leaning back against a nearby workbench, but then she breaks the silence. <i>“Ffuuuuck,”</i> she breathes quietly. <i>“That was so good!”</i> Her volume rises as she does, picking herself up off the ground and breaking into a big, open grin. <i>“That was like, </i>so<i> super great! It’s like -”</i>");
	output("\n\nShe stops, looking confused for a second before she says, <i>“Holy shit - am I still horny? Do I... ffuuuuck!”</i>");
	output("\n\nWithout any further warning she drops to her knees, jerking herself off as her cock already starts to harden once again. <i>“Wow [pc.name], being a bimbo is </i>awesome<i>! I’m really going to enjoy... uhmmnn! Sucking cock... fucking... being fucked and... and... ahmmnnn!”</i>");
	output("\n\nWell, it looks like she’s definitely an eager bimbo now, rather than the mean, mad scientist she was when you first met her. Job done! She’s clearly got a lot of juice left in her tank, but you’re feeling drained enough that you decide to leave her to it for a while, redressing quickly and slipping quietly out of her shack.");
	processTime(31);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",postBadgerBimboSexSceneShit);
}
//[Regardless of which sex option is chosen, advance game time by 1 hour, then present the following text on a new page]
public function postBadgerBimboSexSceneShit(orgasmDenialed:Boolean = false):void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("By the time you return, it looks like Dr. Badger has ");
	//IF PC DID NOT LET HER CUM
	if(orgasmDenialed) output("freed herself, vented her... ‘enthusiasm’, and ");
	output("calmed down. She’s leaning back against one of the workbenches in the corner of her lab, relaxing her way through what you imagine to be a pretty big afterglow. Looking at her now she seems... not actually that much different from how she was before. At first you think maybe it didn’t work, or she’s snapped out of it or something, but no; her hair is still bleached blonde, her lips are nice and plump, and her breasts are still bulging out proudly through her ripped top. Eventually you realize the reason why she hasn’t changed that much is because she <i>already</i> pretty much had a bimbo body - she’s stepped up a few cup sizes and her cock and balls look a little more weighty, but her overall figure is still the same. Fortunately though, the biggest changes the beam made are clear as soon as she hears you coming, turning to greet you with a big open smile.");
	output("\n\n<i>“Well hey!”</i> she giggles. <i>“I wondered where you’d gotten to!”</i>");
	output("\n\n<i>“Hey there...”</i> you answer cautiously. You’re a little worried about her trying to go all mad scientist on you again, given how she was when you first met, so just to check there won’t be any problems you ask, <i>“So, how are you feeling?”</i>");
	output("\n\nShe thumps her hands down flat against the table in front of her as she eagerly replies. <i>“Oh. Man. Wow [pc.name], this is like, </i>amazing<i>. I mean, I always knew it was good, but like, finally just letting go and going all the way myself? </i>Super<i> fun.”</i>");
	output("\n\nLooks like you don’t have to worry about her trying to fight you or anything, she’s clearly far too happy with how she is now to even be the slightest bit mad.");
	output("\n\nBefore you can say anything though, she adds quickly, <i>“Oh! That’s right!”</i> Looking around for a few moments, she eventually manages to find a tablet. After giving it a few careful taps - her tongue stuck out the side of her mouth as she concentrates - she looks up at you again. <i>“I promised to pay you for zapping someone and you did, so, there you go!”</i>");
	output("\n\nYour codex beeps, and looking down you see an incoming funds transfer. <b>She just sent you 3,000 credits. Nice!</b>");
	pc.credits += 3000;
	output("\n\nThat reminds you though, the gun she gave you is used up now, and you’re pretty sure you don’t know anyone else who would be able to charge it back up. You toss it aside, leaving it behind in one of the many piles of random stuff in the lab. Dr. Badger doesn’t seem to mind, happily blowing you a kiss as you turn to leave. It looks like the mad doctor is out, and the happy bimbo is in");
	if(pc.isBimbo()) output(". Hooray");
	output("!");
	//[Take from player quest item <i>“Bimbo Raygun”</i>. Give player 3,000 credits.]
	processTime(15);
	pc.removeKeyItem("Doctor Badger's Reprogrammed Bimbo Raygun - For use on the Badger!");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Post-Zapped Dr. Badger Revisions
//[replace the Dr. Badger shack space description with the below]
public function bimboBadgerShopStuff():void
{
	output("The inside of the “good” doctor’s shop is much the same as you remember it, complete with giant brain-lasers and devices whose purpose you don’t even want to hazard.");
	//Special Pexigaquest shitz.
	if(flags["PEXIGA_TREATMENT"] == 0)
	{
		if(flags["NYM-FOE"] == undefined)
		{
			output("\n\nDr. Badger is nowhere to be seen. Maybe she’s working on that pexiga treatment? Should you see what she’s come up with or leave it be?");
			//[Get Pexiga][Just Leave]
			addButton(0,"Bring Pexiga",bringBadgerPexibork);
		}
		else
		{
			nymfoeSetup();
		}
	}
	else
	{
		output(" Dr. Badger herself is still here, busy tinkering with the random piles of junk, although she’s now doing so with a much more confused and bubbly expression than she had before you treated her to a dose of her own medicine.");
		output("\n\nDoctor Badger is still wearing the same ripped top she had on earlier, apparently not ever bothering to replace it, so her very large breasts are still just hanging out freely.");
		
		addButton(0,"Dr.Badger",approachDoctorBimboBadger,undefined,"Dr. Badger","Check in with the totally bimbofied badger.");
	}
}

public function approachDoctorBimboBadger():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	//[replace the Dr. Badger interaction text with the below]
	output("The Doctor looks up as you approach. <i>“Hey there [pc.name]!”</i> she says happily. Overall she looks mostly the same as she did when you first met her - a large badger-woman with short black fur everywhere except her white face, although she now has a much cheerier disposition. She brushes lightly at her platinum blonde hair as you look at her, smiling at you eagerly with her nice plump lips. <i>“Oh! Let me show you my latest invention!”</i>");

	//DISPLAY RANDOMLY ONE OF THE FOLLOWING]
	if(rand(4) == 0)
	{
		output("\n\nShe holds up something that looks like some sort of pistol at first glance, until you realize that... ah.");
		output("\n\n<i>“Behold, my dildo-gun!”</i>");
		output("\n\nYep, it really does look like a standard kinetic pistol that she’s clumsily taped some random dildo onto the end of. You’re about to say something, but then she points it forward and yells <i>“Fire in the hole!”</i>");
		output("\n\nYou duck as the slug from the gun launches the dildo forwards, embedding it solidly in the opposite wall while the bullet itself bounces noisily around the shack. Thankfully, neither of you are hit before it clatters off to a stop somewhere.");
		output("\n\n<i>“I’ve still got to work on reloading it though...”</i> she says with a shrug.");
	}
	else if(rand(3) == 0)
	{
		output("\n\nShe holds up something that looks like... well, a metal tube.");
		output("\n\n<i>“Behold, my patented lust-release system!”</i>");
		output("\n\nIt’s just a metal tube. It looks a little like she might have stuffed something in the middle to provide some sort of padding, but before you can see it in detail she lowers it down to give you a demonstration. She tries to slide it around her cock, but it turns out to be significantly too small. <i>“Huh,”</i> she says quietly. <i>“I guess they don’t really sell metal pipes in ‘bimbo cock’ sizes...”</i>");
	}
	else if(rand(2) == 0)
	{
		output("\n\nShe digs around in the back of a workbench, saying as she does so, <i>“I’ve come up with a completely new way to prepare food! First, all you need is a pre-made meal...”</i>");
		output("\n\nShe pulls out a vacuum-packed dinner, the sort you’d expect to see given to military units for them to tear open and eat when in the field. <i>“Now you just open it and...”</i>");
		output("\n\nBy the time you realize where she’s going with this she’s already masturbating, her cock wedged in the top of the packet as she works herself over frenziedly. In moments she tenses up, a thick spurt of cum coating the contents of the meal.");
		output("\n\n<i>“...and done! Ready to enjoy!”</i> she says proudly.");
	}
	else
	{
		output("\n\nHolding up a battered tablet, she proudly opens her Extranet Messenger. <i>“I’ve come up with an all-new app that automatically sends a dick pic to everyone in your contacts list, every day!”</i>");
		output("\n\nShe shows you the screen and, yep, she’s got a whole load of pictures loaded up and ready to go. One thing does confuse you though. <i>“How did you manage to program that?”</i>");
		output("\n\n<i>“Oh! I haven’t actually like, </i>made<i> the app yet. But it’s a great idea, don’t you think?”</i>");
	}
	//[END RANDOM SELECTION]
	//[DISPLAY RANDOMLY ONE OF THE FOLLOWING]
	if(rand(3) == 0) output("\n\n<i>“Uh... needs work,”</i> you say politely.");
	else if(rand(2) == 0) output("\n\n<i>“That’s very nice,”</i> you say encouragingly.");
	else output("\n\n<i>“Okay, I actually kinda like that one,”</i> you say after thinking for a moment.");
	//[END RANDOM SELECTION]
	output("\n\nYou’re pretty sure that her abilities as an inventor have changed substantially. Given that you suspect she earlier made all the illegal drugs and equipment she sold herself, you doubt you’ll be able to buy anything further from her. But hey, that’s not what a bimbo is for anyway, right?");

	processTime(1);
	doctorBimboBadgerMenu();
}
public function doctorBimboBadgerMenu():void
{
	//[replace all previous interaction buttons with the below]
	//[Talk][Sex]
	clearMenu();
	addButton(0,"Talk",talkToDoctorBadger,undefined,"Talk","Try to have a conversation with your newly minted bimbo.");
	if(pc.lust() >= 33) addButton(1,"Sex",sexWithBimboBadger,undefined,"Sex","Have your way with your new bimbo.");
	else addDisabledButton(1,"Sex","Sex","You aren’t turned on enough to have sex right now.");
	
	if(pexigaQuestDocChatsAvailable()) addButton(3,"Pexiga Help",talkToBimboBadgerAboutPexiga,undefined,"Pexiga Help","Ask for help with the Pexiga’s situation.");
	drBadgerFixNymFoeButton(3);
	
	addButton(14,"Leave",mainGameMenu);
}

//Talk
public function talkToDoctorBadger():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	//IF PC IS NOT A BIMBO
	if(!pc.isBimbo())
	{
		output("She was never really a very talkative person before - at least if you don’t count making vague, scientific-sounding threats and grandiose pronouncements - so it occurs to you that you might now finally have a chance to actually find out a bit more about her. <i>“So, uh, hey-”</i>");
		output("\n\n<i>“Hey!”</i> she interrupts, seemingly super psyched to be having this conversation, just as she’s psyched about pretty much everything.");
		output("\n\n<i>“Uh, yeah, hey,”</i> you continue. You struggle for something to lead with, and eventually decide on, <i>“So... how are you doing?”</i>");
		output("\n\nShe giggles, clasping her hands in front of her in a way that presses her boobs out even further. <i>“Great! I always thought being a bimbo would be super fun. I </i>did<i> kinda plan on waiting longer to try it out myself - maybe until after I’d converted like, at least a couple of planets, but hey, tits happen I guess!”</i>");
		output("\n\n<i>“Wait, you planned on becoming a bimbo?”</i>");
		output("\n\nShe pauses, tapping her finger on her lips as she thinks. <i>“Welllll, I was definitely </i>curious<i>. It seemed fun, right? If I was going to make everyone else all slutty and happy I wouldn’t want to be like, left out, would I? I mean, I was still tossing it up, and I </i>probably<i> would have made it a little more temporary, but you went ahead and decided for me so... thanks!”</i>");
		output("\n\nHuh. Well, that answers that, you suppose. Now what? <i>“Where are you from?”</i> you try. <i>“And what race are you, exactly?”</i>");
		output("\n\nThat last question makes her laugh outright. <i>“What, you planning on finding yourself a planet just full of folk like me? Baby, there ain’t </i>no one<i> like ol’ Doctor Badger! I made sure of that a long time ago.”</i>");
		output("\n\nYou’re... not quite sure how to take that, but it doesn’t look like she’s willing to say anything more on the subject. It does raise one other question though. <i>“Do you have anything else I could call you? Calling you a ‘doctor’ now seems kinda... wrong.”</i>");
		output("\n\n<i>“Nope!”</i> she answers happily. <i>“Just Doctor Badger, that’s me!”</i>");
		output("\n\nYou’re honestly not sure if she’s still somehow keeping secrets or just genuinely too dumb to comprehend the problem, but the end result seems to be about the same. With that though you’ve exhausted all the conversation topics you can think of, and so, shrugging, you let her get back to... whatever it is she does around here all day now.");
		processTime(3);
	}
	//IF PC IS A BIMBO
	else
	{
		output("<i>“Hey!”</i> you say, making Dr. Badger smile at the sound of your voice.");
		output("\n\n<i>“Hey!”</i> she answers happily.");
		output("\n\nYou struggle to think of something to say. <i>“So...”</i>");
		output("\n\n<i>“Uhmm...”</i> she says, thinking too.");
		output("\n\nThere is a long silence.");
		output("\n\n<i>“Uh... want to fuck?”</i> you ask eventually.");
		output("\n\n<i>“Oh holy shit yes.”</i>");
		pc.changeLust(20);
		processTime(1);
	}
	doctorBimboBadgerMenu();
	addDisabledButton(0,"Talk","Talk","You won’t be getting much discussion out of this bimbo.");
}

//Sex
public function sexWithBimboBadger():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("Dr. Badger giggles, turning around and wiggling her rump invitingly. <i>“You want to fuck? Great! What do you want to do to me?”</i>");
	//[Get Blowjob][Get Eaten Out][Fuck Her Ass][Bimbo Sex]
	clearMenu();
	if(pc.hasCock()) addButton(0,"Get Blowjob",getABlowJobFromBimboBadgerRepeat,undefined,"Get Blowjob","Make her get on her knees and suck you off like a good little bimbo.");
	else addDisabledButton(0,"Get Blowjob","Get Blowjob","You need a dick to get a blowjob.");
	if(pc.hasVagina()) addButton(1,"Get Licked",getEatenOutByBimboBadgerRepeat,undefined,"Get Licked","Have a nice, long session with her muzzle buried in your pussy");
	else addDisabledButton(1,"Get Licked","Get Licked","You need a vagina to get licked out.");
	if(pc.hasCock()) addButton(2,"FuckHerAss",fuckBimboBadgersAssRepeated,undefined,"Fuck Her Ass","Fuck this bimbo hard from behind.");
	else addDisabledButton(2,"FuckHerAss","Fuck Her Ass","You need a penis to fuck her ass.");

	if(pc.isBimbo() && pc.hasCock() && pc.hasVagina()) addButton(3,"Bimbo Sex",doctorBadgerBimboSex,undefined,"Bimbo Sex","Like, totally have the most sex!");
	else addDisabledButton(3,"Bimbo Sex","Bimbo Sex","You need to be a hermaphrodite bimbo like the Doctor.");

	addButton(14,"Back",approachDoctorBimboBadger);
	
	//[mouseover text for Get Blowjob = ][NOT AVAILABLE IF PLAYER HAS NO COCK]
	//[mouseover text for Get Eaten Out = ][NOT AVAILABLE IF PLAYER HAS NO PUSSY OR IF PLAYER HAS A TAUR BODY]
	//[mouseover text for Fuck Her Ass = ][NOT AVAILABLE IF PLAYER HAS NO NON-TAIL COCK]
	//[mouseover text for Bimbo Sex = ][PLAYER MUST BE A BIMBO AND MUST HAVE A COCK AND PUSSY]
}

//Get Blowjob
public function getABlowJobFromBimboBadgerRepeat():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("Deciding that words will just get in the way, you click your fingers to get her attention, then point to the ground. She quickly gets the idea, kneeling in front of you as you remove your [pc.gear] and put it to one side. Still without speaking you grab her firmly by the back of the head, pulling her forwards as her mouth wraps around your [pc.biggestCock].");
	output("\n\n<i>“Ffuuuuck yesss,”</i> you pant, unable to keep your own mouth closed any longer as her wonderfully soft lips slide along your sensitive flesh. <i>“Daaamn, you are good at this...”</i>");
	output("\n\nSuddenly she pulls back, looking up at you for a second to giggle and say, <i>“Well, yeah! I mean, how could I not be? You went and made me so nice and slutty and eager and... horny...”</i> Even through her thick fur you see her cheeks flush a little red - it looks like talking about how you made her into a bimbo is somehow managing to turn her on even <i>more</i>. Well, you’re more than happy to encourage <i>that</i> response.");
	output("\n\n<i>“Shhhh,”</i> you whisper, pulling her forward without complaint to slide your cock back between her lips. <i>“There’s better things for you to use your mouth on than talking, isn’t there?”</i>");
	output("\n\nShe nods weakly, too distracted by her purpose to want to move her head up or down much. Instead she focuses on using her tongue, licking slowly along the base of your shaft and doing all she can to spread the slickness dripping from your tip.");
	output("\n\n<i>“Good girl...”</i> you whisper to her once again, curling your fingers through her thick blonde hair. <i>“You love sucking cock, don’t you? Like any good bimbo should.”</i>");
	output("\n\nThis time she doesn’t even try to nod, but you can tell by the way a shiver of excitement runs through her that she agrees.");
	output("\n\nEncouraged, you decide to go further. <i>“You live to suck cock, don’t you?”</i>");
	output("\n\nShe starts to speed up her back and forth motions, but all of a sudden you hold her still, pulling her back and turning her to look you in the eye. A thin string of drool hangs from the corner of her mouth as she stares at you helplessly. <i>“No,”</i> you hiss. <i>“I want you to </i>say<i> it</i>.”</i>");
	output("\n\n<i>“I live to suck cock,”</i> she answers instantly, her voice quickly melting into a pleading whine. <i>“Please, let me suck yours...”</i>");
	output("\n\nYou keep her held still. <i>“Why?”</i> you ask simply.");
	output("\n\nIt takes her a moment to come up with a response. <i>“B... because I need it!”</i> she gasps eventually. <i>“I need your cock to fill me up, to feel </i>so<i> good inside my nice plump lips, to have your slick delicious cum pour down my throat and make me feel so warm and full... Please! I... need...”</i>");
	output("\n\nHer tongue strains out of her mouth as she trails off, desperately reaching out towards you in the hope of so much as brushing against your tip and earning even the smallest taste of your cum.");
	output("\n\nWell, with a response like that, how can you say no? Loosening your grip you let her fall forwards, swallowing your cock in one swift movement all the way to the hilt. With her pent-up, desperate enthusiasm, it doesn’t take her long to make you orgasm. As soon as your hips begin to twitch she wraps her hands fiercely around your hips, locking her lips to your flesh and making sure she catches every bit of your slick seed inside her mouth. You certainly do your part to reward her efforts, pumping load after load of cum down her throat as she moans in blissful delight at being so perfectly used.");
	output("\n\nEventually you’re done, pulling back away from her slowly. She’s clearly sad to have your cock taken out of her mouth and does all she can with her tongue to encourage you to let her keep servicing you, but she doesn’t go so far as to try to actually stop you. When you finally pull free she shifts backwards, rolling back on her sizeable butt to lean up against a bench behind her. Her own cock is by now pointing stiffly up between her tits, and as she licks the last of your cum from her lips her hands can’t help but drift down towards it.");
	output("\n\nShe looks up at you, her eyes filled with a mixture of lust and worship. <i>“Did I please you?”</i> she mumbles slowly. <i>“Did you enjoy using me? Am I a good bimbo?”</i>");
	output("\n\nYou reach down and take her by the chin, smiling as you stroke her face softly. <i>“You did great girl,”</i> you whisper. <i>“You’re a very good bimbo indeed.”</i>");
	output("\n\nAs soon as you say that her hand clenches around her cock, an arch of thick cum spurting upwards to land between her breasts. She leans forwards into it, lapping at her cum eagerly even as she orgasms again and again. <i>“Thank you, thank you, thank you,”</i> she pants breathlessly, <i>“thank you for making me such a nice slutty pet for you to use!”</i>");
	output("\n\n<i>“You’re welcome,”</i> you say simply, leaving her to her own quiet reward as you stand and leave.");
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Eaten Out
public function getEatenOutByBimboBadgerRepeat():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("<i>“You know,”</i> you say as you walk towards Dr. Badger, casually shedding your [pc.gear] and sitting naked on a nearby chair, <i>“I think it’s time I got some good, long-term use out of my new bimbo here...”</i>");
	output("\n\nYou spread your legs, exposing your [pc.biggestVagina] to her and watching as her she licks her lips hungrily.");
	output("\n\n<i>“Well?”</i> you ask impatiently. <i>“I’m waiting!”</i>");
	output("\n\nShe jumps forward quickly, trailing apologies as she throws herself to her knees in front of you. <i>“Oh sorry! Please, forgive me I was mmpphh...”</i>");
	output("\n\nRather than let her babble her silly words at you, you simply grab her by the back of the head and pull forwards, pressing her muzzle down to your crotch so that her cute plump lips are brushing up against your folds. <i>“Theeere we go,”</i> you say with a satisfied sigh. <i>“Much better, don’t you think?”</i>");
	output("\n\nShe doesn’t spare the energy to nod, instead focusing on servicing you as best she can. Her lips massage your flesh with a slow and steady rhythm, while her tongue darts out to lick encouragingly at your slickness at a perfect pleasurable pace. You murmur quietly, <i>“Good girl...”</i> stretching out contentedly as you simply lie back and enjoy it.");
	output("\n\nSlowly, you feel yourself relax. It’s like being in a spa, except instead of soaking in warm water you’re having your pussy seen to by a truly talented bimbo of your own creation. But still, you feel that same blissful sensation, your limbs all sagging downwards as they give up every ounce of their tension.");
	output("\n\nYou’re honestly not sure how much time passes. Dr. Badger seems to have understood instinctively exactly what you were after and never speeds up her pace, sticking to ‘pleasurable and relaxing’ rather than ‘orgasm overdrive’. Eventually though - well, a massage is nice, but it’s time for the happy ending.");
	output("\n\nShifting your hands down to grip her behind her ears, you start scratching softly at her fur. <i>“Good girl,”</i> you whisper, <i>“but now it’s time to kick it up a notch, don’t you?”</i>");
	output("\n\nAlmost as soon as you say those words she doubles her efforts, pressing her muzzle deep into your slit so that her nose is rubbing at your sensitive flesh with every movement of her head, while at the same time her tongue is lapping furiously at your slick folds. You push forwards too, filling yourself with her muzzle and encouraging her to work you over ever more furiously. <i>“You’re mine,”</i> you pant, <i>“you’re mine and I’m going to use you to... get myself off again and again and cum and... mhmmm... coat your face and make you... make you... ahmmm-ah!”</i>");
	output("\n\nYour hips buck wildly, and Dr. Badger works furiously to lick up the wave that pours out of you as you finally cum, but with a build up like that you’re dripping with more than enough slickness to thickly coat the fur all over her face. With a long, slow sigh you lean back again, drifting hazily through the afterglow as your pet bimbo does her level best to clean the both of you off, slowly drifting back to servicing you once again with her lips and tongue.");
	output("\n\n<i>“Good girl...”</i> you mumble as you surrender to the relaxing bliss. <i>“Good girl...”</i>");
	output("\n\nThis whole cycle repeats itself at least three times before you finally finish up, pushing the feebly protesting Dr. Badger away as you put your [pc.gear] back on. As good as your new eager servant is, you can’t spend all your time just getting your pussy licked. Leaving her to it as she shifts to cleaning herself up, you stand up and set off to resume your adventures.");
	processTime(33);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fuck Her Ass
public function fuckBimboBadgersAssRepeated():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("You pull Dr. Badger close, making her give out a cute little squeak as you take her by surprise. <i>“I went through quite a bit of effort to be able to get this ass on demand...”</i> you hiss, pushing her forwards and bending her over a nearby bench. <i>“So I think it’s time for me to take advantage of that...”</i>");
	output("\n\nYanking your [pc.gear] out of the way, you line your [pc.biggestCock] up with her deliciously soft rump. There’s something about this that just seems right - you get the impression that the old Dr. Badger was something of an ass girl herself. Well, now she can be <i>your</i> ass girl.");
	output("\n\nYou press forwards, and she’s already slick and ready for you. It’s a neat trick, probably something to do with the bimbo-making process, but the important part is that it means you’re able to slide your cock deep inside her in one long slow thrust, with Dr. Badger’s only responses being desperate, eager gasps of approval.");
	output("\n\n<i>“Fffuck yes...”</i> you snarl, breathing heavily into her ear as you lean forwards over her. <i>“You’re an eager </i>slut<i>, aren’t you?”</i>");
	output("\n\nShe cries out wordlessly in reply, taking a few moments to be able form even short fragments of sentences between your powerful thrusts. <i>“Yes! Yes, please! Take me! Make me... yours! Make me your... eager bimbo sl... slut!”</i>");
	output("\n\nYour hands reach forwards, fondling her tits as her nipples become stiff with arousal. <i>“I’m going to... going to fill you up,”</i> you pant, <i>“going to paint your ass with my cum and mark you as mine inside and out. Maybe I’ll make your tits even bigger... fill them up too so no one could ever see you as anything other than a sex object, naked and dripping and always, always eager...”</i>");
	output("\n\n<i>“Ahh-ahhmmm!”</i> she moans, her hips jerking forward as she orgasms helplessly, her cock spraying cum thickly along the underside of the bench you’ve pinned her to. <i>“Yes! Please! I’m a dumb, useless bimbo slut! No good for - ahmmm! Anything but fucking and being fucked and- ahmmmnnn!”</i>");
	output("\n\nShe feels so good, so warm and tight, her whole body tensing and releasing as she cums furiously, completely overwhelmed by the thought of how much of a big, eager bimbo slut she is now, and how good it feels to give in to it completely. You can’t help but feel excited by it too. After all, you did it to her - it’s because of you that she’s a dumb, desperate, horny slut now; always dripping and always lusting after your cock, or anything else you tell her she wants. She’s yours; vacant mind, bimbo body and untroubled soul, and now all you have to do is claim her as much as you want.");
	output("\n\nYour teeth grit together, your fingers digging into her sides as you pull her as close as possible. When your orgasm finally arrives it’s dramatic - wave after wave of cum pumping into her as your hips thrust against her ass again and again. All the while she’s moaning loudly, what words she can manage to form begging you desperately for more, pleading with you to take her harder and fill her completely, in between trailing off as she shudders through her own repeated orgasms.");
	output("\n\nEventually you’re both utterly spent. You recover first, sliding yourself backwards and freeing your cock from Dr. Badger’s butt, making her tremble with one last wave of pleasure as you finally withdraw. She’s all but asleep after that, resting on her pillowy breasts with her tongue hanging limply out of her mouth, while beneath the bench her slowly softening cock drips into the considerable puddle on the floor.");
	output("\n\nFortunately, all that is a problem for her to deal with. You leave the cleaning up to her, quickly putting your [pc.gear] back on and heading out of the shack.");
	processTime(33);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bimbo Sex
public function doctorBadgerBimboSex():void
{
	clearOutput();
	showDrBadger();
	abeAuthor();
	output("You head over towards Dr. Badger, wrapping her up in her nice big hug and booping your noses together with a giggle. <i>“Hey so,”</i> you say afterwards, <i>“two smokin’ hot bimbo babes like us getting together... we should be able to have the best sex ever, right?”</i>");
	output("\n\nDr. Badger nods. <i>“Oh yeah, for sure. Like, the </i>best.”</i>");
	output("\n\nYou stop and think for a moment, trying to come up with something to actually do. <i>“Uh...”</i>");
	output("\n\nDr. Badger looks like she’s thinking too. <i>“Umm...”</i>");
	output("\n\n<i>“You... want to suck each other’s cocks and then just cum all over each other?”</i> you say eventually.");
	output("\n\nHer face lights up. <i>“Perfect!”</i>");
	output("\n\nIn no time at all you’re both completely naked in a pile on the floor, her delicious cock sliding into your mouth while her plump lips wrap around your own slick shaft. She’s really going for it too - licking and tasting and rubbing and teasing for all that she’s worth, really showing what a great bimbo she can be! She used to be some mean scary scientist and now here she is, panting and moaning between your legs like an eager slut just because you showed her how good it can feel to just be something to be used for sex, to be ready and willing to fuck always, and to spread that joy to as many people as possible.\n\nMaybe you can make more people feel like this. Maybe you can spread the joy of being a bimbo; fucking and sucking and licking and serving, and with every blast of cum spreading the bimbo urges to a new and willing person. Maybe the two of you could head out together, finding new people to spread the word to, one of you holding them down and whispering the sweet nothings their head will be filled with into their ears, while the other one cums all over them again and again. Their hair becoming blonde as the slickness soaks in, their bodies rounding outwards with nice, full tits, plump lips and a soft, round ass. Maybe they’d have a nice, juicy cock for you to suck on too, maybe they’d have a deliciously dripping pussy for you to fill, maybe they’d have both. There’d be more than enough of everything anyway, once you spread your bimbo bliss across the stars.");
	output("\n\nIt isn’t until you feel your body start to tense up that you suddenly come back to where you are right now. After a fantasy like that you know you’re already close, and it’s all you can do to hold Dr. Badger close as your hips push forwards again and again, pumping wave after wave of thick cum deeply down her throat. She swallows it all happily, only pulling off your cock in order to chase down the last few splashes that dripped down her chin. As she does though you free yourself too, sliding off her cock as she grunts in disappointment before giving her a desperate, needy look.");
	output("\n\n<i>“Please,”</i> you whine, <i>“I need you to fuck me like, </i>right now<i>.”</i>");
	output("\n\nShe doesn’t waste a second, spinning around and straddling you with a giggle, then thrusting quickly into your super wet pussy. She lies down forwards, her tits brushing against yours as she grips your hands in her own.");
	output("\n\n<i>“Fuck, yes!”</i> you pant. <i>“Yes, yes yes yes! Fuck me, fuck me, I... amhhh! Ahhh! Please! Please! Please!”</i>");
	output("\n\nYou’re babbling, saying dumber things than normal, but Dr. Badger looks like she couldn’t even speak if she wanted to. She’s snarling, her lips pulling back from her muzzle as she bares her teeth with every powerful thrust, and then a few seconds later she’s panting wildly with her tongue hanging freely out of her mouth. She looks out of control, like she’s completely lost in how much she absolutely <i>needs</i> to fuck you as hard as possible, and from the way her thick cock is pressing into you you’re pretty sure she’s giving it everything she’s got.");
	output("\n\nFinally she snaps, throwing her head back into a gasping cry as her balls surge and her cock spurts wave after wave of thick cum deep inside you. You can’t help but cum again at the sensation of it, your pussy trembling as a tide of slickness pours down your thighs, while your own cock sends out another layer of liquid to coat the both of you.");
	output("\n\nYou lay there for some time, slowly twitching out the last of your orgasms as you both glide down through your afterglow. Eventually though it seems like you’ve both spent as much as you’re able to right now. Then, with eager grins, you get to work licking each other clean, savoring the taste of cum on your tongue as you share it in sweet, salty kisses.");
	output("\n\nIt takes a while, but eventually you’re decent enough again to put your [pc.gear] back on and get back to your big, important space... stuff. <i>“So... same again soon?”</i> you say over your shoulder as you leave.");
	output("\n\n<i>“Oh, you betcha,”</i> Dr. Badger answers with a giggle.");
	processTime(24);
	pc.orgasm();
	pc.orgasm();
	var x:int = rand(pc.totalVaginas());
	pc.loadInCunt(chars["DRBADGER"],x);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
