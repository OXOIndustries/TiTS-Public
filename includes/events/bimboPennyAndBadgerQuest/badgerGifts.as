//By that AbeESeedy Guy!
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
	if(pc.longestCockLength() >= 11 && pc.biggestTitSize() >= 8 && pc.bRows() == 1 && pc.cockTotal() == 1 && pc.balls == 2 && pc.totalVaginas() == 1 && ((pc.tailCount == 1 && pc.tailType == GLOBAL.TYPE_BADGER) || pc.hasCockTail() || pc.hasTailgina()) && pc.hasFur() && pc.furColor == "black" && pc.isBiped() && pc.armType == GLOBAL.TYPE_BADGER && pc.faceType == GLOBAL.TYPE_BADGER && pc.femininity >= 75 && pc.lipMod >= 1 && pc.hasPerk("Easy") && pc.hasPerk("Inhuman Desire") && pc.hasPerk("Breed Hungry"))
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
		//IF PC DOES NOT HAVE TWO LEGS
		if(pc.legCount != 2) 
		{
			pc.legCount = 2;
			pc.genitalSpot = 0;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.legType = GLOBAL.TYPE_HUMAN;
		}
	}
	else
	{
		if(pc.legCount != 2) 
		{
			pc.legCount = 2;
			pc.genitalSpot = 0;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.legType = GLOBAL.TYPE_HUMAN;
		}
	}
	//IF PC HAS GOO-SKIN
	if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) 
	{
		pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
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
	if(pc.totalVaginas() > 1 && !pc.isPregnant())
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
		output("Dr Badger saunters over, stroking her gloved hand casually over your head. You lean into it instinctively, eyes closing in bliss at the contact.");
		output("\n\n<i>“Now then pet, I have a job for you.”</i> Her hand sweeps down to scratch under your chin, melting as she holds your face up to look at her. <i>“Doesn’t that sounds nice? A nice little job to prove how good and useful you can be?”</i>");
		output("\n\nIt does sound nice. Everything sounds nice, but being useful and good like that sounds <i>especially</i> nice. Almost as nice as fucking. Maybe if you’re good enough you’ll get to be fucked! You lick your lips happily at the thought, savoring the wetness that is already starting to drip down over your chin.");
		//IF PC HAS LOST THEIR BADGER FORM = 
		if(pcBimboedByBadger())
		{
		 	output("\n\n<i>“But first”</i>, the doctor adds tauntingly, <i>“we’ve got to take care of the unlicensed modifications you’ve made, don’t we? If you’re going out on a big important mission for me, we’ve got to have you looking the part...”</i>");
		 	output("\n\nWith no more warning than that you feel the sharp sting of a needle being pressed into your skin, and then a warm, tingling sensation spreading out inside your flesh. The change that follows comes quickly, especially given how you lean into it, knowing how much it means to the doctor. In moments you’re staring up at her lovingly along your badger snout once again, shivering as she strokes your black and white fur, and with your cock stiffening in anticipation over your dripping wet slit. <b>You are back to being the same badger form as you were after first meeting Dr Badger!</b>");
		 	resetDrBadgerBimboTF();
		}
		output("\n\n<i>“Now then!”</i> she continues, I suppose you’re wondering what a simple little bimbo like you could do to help me? Well, the truth is, there’s a surprising number of people who want to shut me down.”</i>");
		output("\n\nYou can’t help but gasp. Who would want to do something like that?");
		output("\n\nDr Badger acknowledges your shock with a smile, putting one hand delicately on her substantial chest in a gesture of exaggerated innocence. <i>“I know! That some people would want to stop </i>me<i>, the great Doctor Badger, when all </i>I<i> want to do is make people feel every bit as nice and lovely as you do!”</i>");
		output("\n\nAs she speaks she runs her spare hand down the side of your face, her lightly clawed fingers brushing gently along your fur. It feels heavenly. Who could possibly be against this? Whoever they are, you stiffen your lip and promise yourself then and there that you’ll do everything you can do setting them straight.");
		output("\n\n<i>“What can I do?”</i> you ask.");
		output("\n\nDr Badger pulls away, causing you to almost fall over forwards as you unthinkingly lean in to try to follow her. She doesn’t seem to notice your slight stumble however, and instead moves back over towards a desk in the corner, pulling out a battered tablet.");
		output("\n\n<i>“The law might not be </i>particularly<i> strong out here yet,”</i> she says as she flicks through a few menus, <i>“but there’s still enough of a presence to keep me from being as active as I’d like. I gotta keep my head down, not kicking up enough of a fuss for anyone to report me. But, I’ve found that there’s only one police officer stationed on a nearby world that anyone could actually report me to directly. If someone were to take care of them, then any response time the law could muster would be much too slow to be a problem.”</i>");
		output("\n\nShe walks back over, handing you the tablet that now shows an official picture of a fox-like girl in uniform. <i>“Her name is ‘Penny’, apparently. Stationed on a planet called Mhen’ga.”</i>");
		//IF PC HAS ENCOUNTERED PENNY
		if(flags["MET_PENNY"] == undefined) output("\n\nYou know Penny! This will be fun!");
		output("\n\nAfter setting down the tablet, Dr Badger hands over a small... gun... thing. It looks like some kind of energy weapon, but it’s all rounded but pointy, like the kind of future they used to think things would look like in the past.");
		output("\n\n<i>“This is a very special gun”</i>, the doctor explains. <i>“I made it very carefully so it would only work on Penny - I can’t have you going and bimbo-ifying the whole galaxy, can I? After all, that’s </i>my<i> job.”</i>");
		output("\n\nShe pets you once more on the head as you stare thoughtfully at the gun-thing in your hands, and your tail waggles with unthinking glee as you look back up at her grinning face.");
		output("\n\n<i>“Well, run along then pet, and show that mean ol’ cop how good it can feel being one of Dr Badger’s bimbos!”</i>");
		pc.lust(15);
	}
	//IF PC WAS NOT BIMBO-IFIED BY DR BADGER
	else
	{
		output("<i>“A job?”</i> you ask. <i>“Why would I take a job from you?”</i>");
		output("\n\nFor a second, Dr. Badger manages to look hurt, despite all her mad scientist trappings. <i>“Why, for </i>Science<i>, surely! What other reason could you possibly need, aside from assisting the pursuit of...”</i> She pauses, running one clawed hand along the side of her skin-tight bodysuit and slapping herself on her considerable rump. <i>“..the very best kind of knowledge?”</i>");
		output("\n\nYou stare at her in wordlessly, not dignifying that with a response. Eventually, she rolls her eyes.");
		output("\n\n<i>“Fine”</i>, she sighs, <i>“if you really need more mundane incentivization, then I’ll just pay you.”</i>");
		output("\n\nYou stay silent, simply raising an eyebrow as you look around at her ramshackle ‘lab’.");
		output("\n\nShe takes your hint. <i>“I know, it doesn’t look like I can even afford four solid walls, let alone spare enough credits to pay you for your time. But, appearances can be deceiving. Money isn’t my problem, my problem is not being able to spend it because I have to lay low.”</i> She looks up at you with a fierce grin. <i>“But, that’s where </i>you<i> come in.”</i>");
		output("\n\nTurning away for a moment, she digs through a nearby pile of random tech and/or garbage, eventually pulling out a small tablet. Flicking through a few menus, she brings up the image she was searching for and shows it to you, an official-looking mugshot of a fennec fox woman in a galactic police uniform.");
		if(flags["MET_PENNY"] != undefined) output(" It’s Penny. You recognize her easily - she’s pretty unique, after all.");
		output("\n\nDr Badger turns the tablet back to herself, bringing up some additional information. <i>“I’ve been investigating, and it turns out if anyone </i>did<i> want to report my activities, for some reason, then this is the closest U.G.C. Peacekeeper. If the good officer here was somehow no longer a problem, then I’d only have to worry about concerned citizens firing off long-distance messages to HQ, and those are </i>much<i> easier to intercept.”</i>");
		output("\n\n<i>“Wait”</i>, you respond, <i>“are you saying you want me to </i>kill<i> a U.G.C. officer?”</i>");
		output("\n\nOnce again, Dr Badger manages to look shocked, although this time it seems genuine rather than put on. <i>“Oh no, of course not! What a senseless waste that would be! No, I’d just like you to give the lovely officer here some... other priorities. And maybe a nice, obedient disposition, together with a positive opinion of me - oh, and you too, of course.”</i>");
		output("\n\nSeeing your confused expression, she turns around again for a few seconds, turning back to hand you a small, weird-looking pistol. It looks like some ancient raygun, something that would have turned up in the oldest holovids when they were trying to imagine what guns people would use in space. Despite the styling of it, it is quite compact, and would be easy to conceal.");
		output("\n\n<i>“That’s my latest creation”</i>, Dr Badger says as you examine the weapon in your hands, <i>“my Portable Personalised Badger BimboRay. Patent pending”</i>, she adds with a grin. <i>“It’s specifically calibrated to work on this officer...”</i> Her eyes flick back down to the tablet for a second to remind herself of the details. <i>“...Penny, stationed on Mhen’ga. So all you need to do is point this at her and click, and the wonders of Science will do the rest. As for how you should go about it, that’s up to you. But, if my information is correct, you might find her more... amenable to the concept of becoming a big-titted, futa cumslut than you might think. Oh, and before I forget - it’s specially calibrated to work on Penny, so don’t try blasting away at the wildlife, all you’ll do is drain the batteries.”</i>");
		output("\n\nAnd with that, she seems to be done. Turning back to busy herself on some other project buried in a pile of random parts, Dr Badger doesn’t even look up at you as she says with a grin <i>“good luck - and remember to have fun. What’s the point of Science if you don’t have </i>fun<i> with it, hmm?”</i>");
	}
	//[Give player quest item <i>“Bimbo Raygun”</i>, description <i>“This is the weird, old-timey raygun Dr Badger gave you to use on Penny. According to her, it won’t work on anyone else.”</i>]
	output("\n\n<b>Quest item gained: Bimbo Raygun!</b>");
	output("\n\nPenny is on Mhen’ga - you could either use your new toy on her, or perhaps you could tell her about Dr Badger’s plan and see what she has to say?");
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
		output("Penny perks up as you approach. <i>“What’s up [pc.name]?”</i>");
		output("\n\nYou decide the best approach is the best. <i>“Have you ever heard the name ‘Dr Badger’?”</i>");
		output("\n\nFrowning, Penny thinks for a moment. <i>“The name does ring a bell, yeah, I think there was something about someone named that, some report or something...”</i>");
		output("\n\nShe turns to her computer, and does a quick search before answering. <i>“Ah, gotcha! There was a bulletin put out about her a little while ago, some mad scientist-type that we’re supposed to be on the lookout for. I remember thinking that if she was too extreme for Xenogen then she must be </i>really<i> wild. I thought about chasing her down, but there’s no information on where she is now, just that she was reported to be somewhere in the area. Plus, I can’t exactly leave my post to go hunting for some big catch.”</i> She reads a some more, her ears flattening a little involuntarily. <i>“Yeesh, maybe it’s good that I didn’t go after her - it says here the official advice is not to try to bring her in with anything less than a full squad. Apparently the last time someone tried to do it singlehandedly she wiped the floor with them with all sorts of illegal mods and subdermal strength-boosters.”</i>");
		output("\n\nShe stops suddenly as something occurs to her. <i>“Wait, why do you ask? Have you had a run-in with her? Do you know where she is?”</i>");
		output("\n\nYou nod, taking out the Bimbo Raygun Dr Badger gave you and putting it down on Penny’s desk. <i>“Yep. Apparently she’s worried that you could bring the authorities down on her, so she asked me to use this on you. She made it specifically with you in mind, apparently, so it won’t work on anyone else.”</i>");
		output("\n\nPenny’s expression is a mix of confusion and shock - the fact that a renowned and dangerous criminal is targeting her specifically enough to momentarily overcome her tough persona. Eventually she says <i>“why, what does that do?”</i>");
		output("\n\n<i>“She called it a ‘Bimbo Raygun’”</i>, you answer with a shrug. <i>“Having met Dr Badger, I’m pretty sure it does exactly what it sounds like.”</i>");
		output("\n\nThere’s a pause, one that goes on slightly longer than you would have expected. For a second, you could swear you can see a slight blush spreading out over Penny’s fur. Before you can do anything more than register that though, she self-consciously scowls.");
		output("\n\n<i>“Well, uh, thanks for not doing that then [pc.name], obviously. It would make it pretty hard for me to do my job if I was just some sort of, sex-crazed bimbo.”</i>");
		output("\n\nYou get the distinct impression that the idea definitely has <i>some</i> appeal to her, but she’s a bit too committed to her job to go along with it. <i>“So, what should we do now?</i>, you ask.");
		output("\n\nPenny’s eyes were a little unfocused, but your question snaps her out of it. <i>“Well, I guess our first option is doing just what she’s afraid of. I could put a report through the priority channel, and I’m pretty sure HQ could send a big enough team that even someone like Dr Badger wouldn’t be able to get away. Or...”</i>");
		output("\n\nYou raise an eyebrow. <i>“Or?”</i>");
		output("\n\nPenny grins, her claws flexing lightly against the desk. She might have been taken aback before, but clearly now she’s recovered enough for her normal fierce dominance to re-emerge. <i>“Well, normally I’d have left it at that, but if she wanted to make it personal - maybe we should see about turning the tables on her. I could look around and see if I can find anyone who can modify that weapon she gave you, see if we can get it so it will work on </i>her<i> instead.”</i> She licks her lips. <i>“Sound like fun?”</i>");
		//[ZAP PENNY OPTION NOT AVAILABLE]
		flags["NO_ZAP_PENNY"] = 1;
	}
	//IF PC WAS NOT BIMBOIFIED BY DR BADGER AND PENNY IS A CUMSLUT
	else if(pennyIsCumSlut() && !pcBimboedByBadger())
	{
		output("<i>“Hey there [pc.name]”</i>, Penny says, leaning back in her chair while she casually jerks herself off. She’s already naked, and has more than a few splashes of her own cum dotted about her body as it is, but it looks like she’s working on giving herself another full coat. <i>“You... mhmmm... want to get in on this?”</i>");
		output("\n\nFor now, you decline her invitation. <i>“Does the name ‘Dr Badger’ mean anything to you?”</i> you ask.");
		output("\n\nPenny’s ears perk up. <i>“Work stuff, huh? Fine.”</i> With an exaggerated sigh, she shifts forwards to sit at her desk properly, reluctantly releasing her cock to tap at her computer. <i>“You’re lucky I just finished a really good session, otherwise I would </i>not<i> have the focus to deal with this.”</i> She types away for a few seconds, and then pauses, looking down at the sticky strands still connecting her fingers. <i>“And that my terminal still works after all this too”</i>, she adds.");
		output("\n\nYou laugh at her joke, and wait till she’s done typing. <i>“Thought that name rang a bell”</i>, she says eventually. <i>“Big time sex mad scientist, yeah? There was a bulletin put out about her a while ago, and I remember noticing because I thought she could be a useful source of Throbb. But the trail was dead, and I couldn’t leave my post here to go flying off after her just to get myself a nice cock.”</i> She reads on a little, her ears flattening involuntarily. <i>“On second thoughts, it’s probably best I </i>didn’t<i> go after her. Looks like the last time a cop showed up at her door she wiped the floor with them, with all sorts of subdermal strength boosters and illegal combat mods. Glad I went with my other backalley contact instead of seeking her out after all.”</i>");
		output("\n\nShe stops suddenly as something occurs to her. <i>“Wait, why do you ask? Have you had a run-in with her? Do you know where she is?”</i>");
		output("\n\nYou nod, taking out the Bimbo Raygun Dr Badger gave you and putting it down on Penny’s desk. <i>“Yep. Apparently she’s worried that you could bring the authorities down on her, so she asked me to use this on you.  She made it specifically with you in mind, apparently, so it won’t work on anyone else.”</i>");
		output("\n\nThere’s a long pause as Penny stares down at the object on her desk, the tension somewhat undermined by the way her cock noticeably stiffens. <i>“Wh... what does that do?”</i> she says.");
		output("\n\n<i>“She called it a ‘Bimbo Raygun’”</i>, you answer with a shrug. <i>“Having met Dr Badger, I’m pretty sure it does exactly what it sounds like.”</i>");
		output("\n\nPenny trembles. Unthinkingly, her hands drift slowly back towards her shaft. <i>“I, uh, I figured that might be the case. She’s got, uh, quite the rep for that sort of thing.”</i>");
		output("\n\nYou pick the gun up again, toying with it casually as you sit down on the edge of her desk. <i>“So?”</i> you ask simply.");
		output("\n\n<i>“I, uh, what?”</i> Penny stammers. <i>“What do you mean, ‘so’?”</i>");
		output("\n\n<i>“So”</i>, you respond, spinning the gun around to point at her, <i>“what do you say?</i>");
		output("\n\nPenny doesn’t answer, at least not verbally. Instead she gives out a faint moan, a desperate blush spreading out across her face.");
		output("\n\n<i>“What do you say”</i>, you continue, <i>“to going all in? To stopping this halfway measure, and devoting yourself full-time to being a nice little bimbo cumslut?”</i>");
		output("\n\nSuddenly Penny squeaks, her hips thrusting forwards jerkily as her cock starts to cum, thick spurts of jizz arching up onto her face and chest. She folds forwards eagerly, sliding her cock through her lips and squeezing her balls with her spare hand the better to wring herself dry.");
		output("\n\nClearly you’re having an impact, so you decide to keep going. <i>“You like that idea, don’t you?”</i> you tease. <i>“You like the idea of being a big-titted bimbo, with nice full lips just </i>made<i> for wrapping around cocks, and not having any responsibilities but fucking and being fucked...”</i>");
		output("\n\nPenny’s pace picks up even further, so that now she’s moving in a frenzy, one hand frantically jerking herself off while the other presses desperately into her dripping pussy. You can see her cock twitch and bulge as she pumps load after load into her mouth, forcing her to swallow again and again to keep as much of her cum as possible from slipping free from her lips.");
		output("\n\nYou lean in, whispering in her cute, quivering ears. <i>“You know, I bet this will give you an even bigger libido too. Make it so you’ll be able to cum any time, any where, so you can spend every second of every day coating yourself in cum and then lapping it up.”</i>");
		output("\n\n<i>“Fffuuuuck!”</i> Penny gasps, her cock slipping out of her lips as her whole body seemingly locks up. A veritable fountain of cum erupts from her, and it’s all she can do to keep her panting mouth open to let herself taste as much of it as possible as it falls back onto her face. Her hips jerk forwards a few more times, each unthinking thrust accompanied by another spurt of jizz, painting a slowly descending line down her chin to her breasts. All the while you simply look on, innocently observing her reaction as you pose the question.");
		output("\n\nIt takes some time, but eventually Penny regains the power of speech. She’s still a cum-spattered mess, but she manages to pause long enough between long licks at her matted fur to get the words out, at least. <i>“Ffuck [pc.name], you sure know how to pitch something to a girl, don’t you?”</i> She hefts her cock in one hand and raises an eyebrow at you. <i>“Case in point, hm?”</i>");
		output("\n\nYou laugh. Still, the question remains, and eventually Penny returns to it.");
		output("\n\n<i>“I can’t say I’m not tempted. And if there’s one thing I’ve learned it’s that there really isn’t much police work that <i>can’t</i> be solved on this planet by just fucking it, so it’s not like I’d be abandoning my post.”</i> She pauses for a moment as she licks her fingers, savoring the taste of her cum. <i>“Or, well, you said Dr Badger said that that gun only works on me at the moment. Maybe I could check around in my contacts, see if I could find someone smart enough to change it, make it so that it’d work on </i>her<i> instead. Or fuck, maybe we should just be sensible and report her. Maybe libido is high enough as it is.”</i>");
		output("\n\nEver so slowly, her head starts to dip back down, her cock pushing back up through her tits. Even for her this is a lot, so she must be <i>really</i> turned on - you doubt you’ll get much more in the way of reasoned discussion out of her. It looks like she’s left it up to you.");
		pc.lust(8);
	}
	//IF PC WAS BIMBOIFIED BY DR BADGER AND PENNY IS NOT A CUMSLUT
	else if(pcBimboedByBadger() && !pennyIsCumSlut())
	{
		//IF PC DOES NOT HAVE BADGER FORM
		if(!pcHasBadgerForm())
		{
			output("As you walk over to talk to Penny, the thing Dr Badger gave you vibrates in your pocket. You slip your hand inside to check on it, only to feel a sharp little sting. There was like, some sort of needle or something hidden in it that jabbed you? Suddenly, you feel your whole body tremble. You stop, doubling over as <b>your form reshapes rapidly, sliding back easily into the same form the doctor gave you. In seconds it’s done, and once again you’re a perfect bubbly, big-chested and big dicked badger bimbo.</b> Wow, you think, it must be <i>super</i> important to Dr Badger that you look the part when you talk to Penny about this. Oh well! Fortunately she was distracted by something on her screen and didn’t notice your sudden change.”</i>\n\n");
			resetDrBadgerBimboTF();
		}
		output("<i>“Hey there!”</i> you say perkily, trotting over towards Penny and perching casually on the edge of her desk. <i>“What’s up?”</i>");
		output("\n\nPenny looks up at you in confusion. <i>“I was going to ask you the same question [pc.name]”</i>, she says slowly. <i>“I know the planet rush is opening up wild new aliens to encounter and... inherit things from, but if it wasn’t for the genetic ID scanning system installed over the door I don’t think I would have recognized you. You seem...”</i> There’s a short pause while Penny looks you up and down");
		if(penny.hasCock()) output(", and you grin as you hear the quiet sound of Penny’s cock hitting the bottom of the desk");
		output(". <i>“...different. I have to say - it’s a good look for you.”</i>");
		output("\n\n <i>“Thanks!</i>, you answer chirpily. <i>“It feels super good too! Do you like my big tits?”</i> You lean forwards, cupping your breasts and pushing them out towards her, forcing your [pc.upperGarment] to strain as your sizeable chest swells outwards.");
		output("\n\n<i>“Uh, yeah”</i>, Penny coughs, reddening rapidly. <i>“Yeah they’re... they’re pretty great...”</i>");
		output("\n\n<i>“Oh! Also - check this out!”</i> You take Penny by surprise as you spin around, moving to sit on one corner facing towards her, with one leg hanging down on either side. Penny only just manages to move back out of the way of your flailing legs, but before she can say anything about this you interrupt her by pulling down your [pc.underGarmets], letting your thick cock and balls fall freely onto her desk, your slick pussy already starting to make a mess beneath you. <i>“Look at all </i>this<i>!”</i> you say excitedly. <i>“Isn’t it great?”</i>");
		output("\n\nIt takes you a few moments to realize that Penny isn’t saying anything. Looking up, you see she’s just staring straight forwards at you, her eyes wide and a thin line of drool sliding down from her slightly open mouth.");
		output("\n\n<i>“Well, what are you just </i>looking<i> for silly”</i>, you laugh. <i>“You should get in there and see what it’s all like!”</i>");
		output("\n\nWithout waiting for a response you reach out with one of your bluntly clawed hands, wrapping it around the back of her head and pulling her forcefully inwards. She lands heavily against you, her mouth just happening to wind up at the base of your cock, her tongue sliding for just a second along the length of your dripping slit. <i>“Good, huh?”</i>");
		output("\n\nAfter a few seconds the thought occurs to you that Penny has probably had time to have a good look, and when you let her head go she almost slides back down into her seat.");
		output("\n\n<i>“Holy shiiiiiiit”</i>, she says slowly. <i>“[pc.name], I don’t know </i>where<i> you got those gene mods, but you have </i>got<i> to let me know your source.”</i>");
		output("\n\n<i>“Oh! Oh my goodness, yes!”</i> You slap your head, pouting slightly at your mistake. <i>“I totally forgot, that’s like, totally what I’m even here for!”</i>");
		output("\n\nPenny is having trouble doing anything but grin laciv... lashivi... lustfully, but what you just said gets through to her enough to raise an eyebrow at you. <i>“Wait - what are you here for?”</i>");
		output("\n\nYou press one finger to your lips, thinking for a second before you answer. <i>“Oh, it was like, super important. I had to - oh!”</i>");
		output("\n\nAfter only a moment’s searching, you find the gun Dr Badger gave you, pulling it out and pointing it playfully at Penny. <i>“I was supposed to give you a good hard zapping!”</i>");
		output("\n\nPenny tenses up, clearly alarmed. You suddenly realize that if you hadn’t helped her out and earned her trust she might have thought she needed to fight you, but right now she’s giving you the benefit of the doubt. <i>“You were supposed to shoot me?”</i>");
		output("\n\n<i>“Not in a bad way!”</i> you say quickly. <i>“This is a very special gun-thing, specially made to work only on you, given to me by the very special Doctor Badger! She wants me to use it on you to make sure she can...”</i> You stop, once again putting one finger to your lips as you try to remember the rest of what she said. <i>“Uhh... something. Something good! But I super remember that the important thing is that this is going to make you all nice and hot and slutty and bimbo like me, and then we can fuck! And I think Doctor Badger then fucks other people too? I dunno, but the </i>important<i> thing is fucking.”</i>");
		output("\n\nPenny doesn’t say anything for a while, just staring at you and blinking. Did you already use the gun-thing on her? Does she need you to explain it again, but simpler? Before you can start though, she does start talking.");
		output("\n\n<i>“I - I have heard of Dr Badger. There was a bulletin that went out about her. Let me just pull it up...”</i>");
		output("\n\nShe turns back to her computer, tapping away at it and looking some things up. Oh good, this is much better, now you’re just sitting here waiting while she’s like, reading about something or junk. She’s saying some of it out loud too; something about ‘mad scientist’ and ‘surprisingly powerful’ and ‘reporting’ and ‘plan’ and ‘bimbos’ - that last one gets your attention. Maybe Penny’s saying something about if you should zap her or not. You shake your head to focus your eyes again, looking down to see Penny looking up at you expectantly.");
		output("\n\n<i>“Oh, er, could you say that last part again?”</i> you say sheepishly.");
		output("\n\n<i>“Uh, sure”</i>, she answers. <i>“I said, if Dr Badger made this thing just for me, maybe I could find someone to help us modify it, so we could use it on her instead. If... if we want to do that?”</i> She stops speaking and licks her lips distractedly, her cheeks still blushing red. She’s normally so fierce, it’s so cute to see her all flustered like this! She must really like the new you. Which is nice, because you do too. Oh! She asked you a question!");
		output("\n\n<i>“Right! Or, I could use it on you now, and then we could fuck. Like, a lot. A real, real lot.”</i>");
		output("\n\nPenny can’t stop staring at your cock, especially now that it’s starting to stand straight out from your crotch, sticky drops of pre-cum dripping out from the tip. You slide one finger slowly down the side, shivering at the wonderful slick sensation that makes. <i>“You like it? I’m sure this gun-thing could get you one like this too!”</i>");
		output("\n\n<i>“Yeah”</i>, Penny says quickly, looking away and mumbling a little. <i>“Yeah I guess you could zap me with that or whatever I suppose...”</i>");
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
			output("As you walk over to talk to Penny, the thing Dr Badger gave you vibrates in your pocket. You slip your hand inside to check on it, only to feel a sharp little sting. There was like, some sort of needle or something hidden in it that jabbed you? Suddenly, you feel your whole body tremble. You stop, doubling over as your form reshapes rapidly, sliding back easily into the same form the doctor gave you. In seconds it’s done, and <b>once again you’re a perfect bubbly, big-chested and big dicked badger bimbo</b>. Wow, you think, it must be <i>super</i> important to Dr Badger that you look the part when you talk to Penny about this. Oh well! Fortunately she was distracted by sucking the delicious cock you gave her and didn’t notice your sudden change.");
			resetDrBadgerBimboTF();
		}
		output("<i>“Hey there!”</i> you say perkily, trotting over towards Penny and perching casually on the edge of her desk. <i>“What’s up?”</i>");
		output("\n\nPenny doesn’t respond right away. For one, she currently has her mouth full with her own cock, so even if she wanted to talk she like, probably couldn’t. But still, even when you get her attention she doesn’t stop right away - first she looks up at you, and then her eyes go wide, and you can just <i>tell</i> that she totally cums, her dick twitching as she sends another fresh load between her lips.");
		output("\n\n<i>“Like what you see then, lover?”</i> You lean forwards, letting your tits rest on the desk while you brush lightly along the fur of her face.");
		output("\n\nShe looks like she’s going to say something, but then with a giggle you slip your hand around behind her head, pressing her back down against her cock. Her eyes roll back in her head as she goes with it, blissfully sucking herself off once again. Then, it suddenly occurs to you that like, why are you just sitting there and letting her have all the fun? Shifting your grip a little you pull Penny’s head backwards, forcing her mouth reluctantly off her dick. You don’t let it go uncared for for long though, as you quickly replace her mouth with your tits. You let her go to free up both of your hands, using them to press your boobs together and form a better sleeve for her cock, happily starting to move yourself up and down. Penny goes along with this change of plan, although from the way her eyes roll back in her head you’re pretty sure she’d go along with anything right now. It doesn’t take long, soon she tenses up again starts to cum, giving you a nice juicy coating of yummy fresh cum for you to lap up through your nice plump lips. Oh shit, you forgot about your lips! You should have sucked her off, that’s what your lips are <i>for</i>, right? Oh well, there’s plenty of time for that n...");
		output("\n\nLooking back down, you see Penny sitting back heavily in her chair, her eyelids drooping. <i>“Flugh.”</i>, she says slowly. Eventually, after she shakes her head and gets her mouth back under control, she tries again. <i>“Fuuuck [pc.name], holy shit. I don’t know what you’ve gotten into to make you all... like that, but fuck me am I a fan of it. If I hadn’t just busted a nut like, three times before you came in I’d probably still be going, but I think even I need a bit of time to recharge now.”</i>");
		output("\n\nYou pout. <i>“Hmff. I </i>guess<i> that’s okay. Like, I suppose not everyone can be always up for sex forever. Well, not unless you got the treatment that I did, like with the ray-thing I’m supposed to zap you with. Oh, would you mind if I just like, jerked off all over you then?”</i>");
		output("\n\nPenny looks up at you, confused. <i>“Wait, what?”</i>");
		output("\n\n<i>“Well”</i>, you answer, twirling a finger around your thick lips, <i>“if we’re going to like, talk and junk, I figure I could at least jerk off on you while we do that.”</i>");
		output("\n\nPenny rolls her eyes. <i>“Okay, first of all - yes of course you should jerk off on me while we talk. But secondly, what was that about being supposed to zap me with something?”</i>");
		output("\n\nYou’ve already shifted your position before she finished talking, setting up with one knee on her desk and your cock in one hand while your other one cups at your balls. <i>“Oh, right! That was like, super important!”</i>");
		output("\n\nThere’s silence for a few seconds, broken only by the increasingly slick noise of your hand sliding back and forth along the shaft of your long black cock. <i>“Well?”</i> Penny prompts eventually, even as she leans backwards slightly and angles herself to provide you with a better target.");
		output("\n\nYou nod, biting your lip a little to clear your thoughts. <i>“Right! Well, it was a super important mission given to me by the... the person that made me... mhmmm! Made me all nice and... nice </i>slutty<i> bimbo... Doctor... ahm! Doctor BadgAhh!!”</i>");
		output("\n\nYou’re not sure if it’s thinking back to what happened, or even just saying her name, but <i>something</i> about all of that makes you cum, and when you do, you cum like a firehose. Even though Penny’s cock is larger than yours, your output puts her to shame - but that makes sense, right? Her stuff is a happy accident, something you helped shape to make wonderful, but you, and how you are now? You were <i>made</i> for this, made to be a perfect slutty bimbo fucktoy, able to cum again and again and again on command and be productive enough to make sure everyone can have fun. You bite your lip desperately, letting out a cute, high-pitched shriek as your hips buck forwards again and again, and with each thrust a <i>lot</i> of cum spurts out, and most of it lands somewhere on Penny’s body. Her eyes are glazed over, her tail wagging furiously behind her as she spreads herself wide, the better to catch as much of what you’re putting out as possible. Her tongue moves crazily too, zipping around as fast as it can so she can taste as much of your yummy cum as she can fit into her mouth. All of that makes you even <i>more</i> turned on, so you cum even <i>more</i>, which makes Penny enjoy it even more, so you cum more, and so... yeah.");
		output("\n\nThis goes on for a while.");
		output("\n\nEventually you slow down. It’s not that you can’t keep fucking, but you feel like you’ve done what you’re supposed to do here, given that Penny’s pretty much completely coated in sticky white cum now. Oh, but you forgot the zapping again! You wait for a minute or so, only stroking your cock slowly to keep yourself nice and hard (in case Penny decides she needs another coat after all), and eventually she manages to clear enough of herself off that her tongue isn’t 100% busy anymore and she can be bothered talking again.");
		output("\n\n<i>“Dr Badger was it?”</i> she says eventually. <i>“I like her work.”</i>}");
		output("\n\n<i>“Thanks!”</i> you giggle happily. <i>“I think she was worried that you like, wouldn’t or something? So she made this gun-thing that would only work on you, because people could report her to you and then there’d... be like, police and they’d... be bad?”</i> You kinda trail off, half because you can’t quite remember what Doctor Badger had said exactly, and half because you’re distracted how horny you are again. You <i>still</i> haven’t sucked Penny’s cock yet! That doesn’t seem right.");
		output("\n\nShe starts talking again before you can lean in though, so with a huff you decide you should probably leave it for now. <i>“I remember a bulletin going out about her a while ago, actually. Let me just pull it up...”</i>");
		output("\n\nShe turns back to her computer, tapping away at it and looking some things up. Oh good, this is much better, now you’re just sitting here waiting while she’s like, reading about something or junk. She’s saying some of it out loud too; something about ‘mad scientist’ and ‘surprisingly powerful’ and ‘reporting’ and ‘plan’ and ‘bimbos’ - that last one gets your attention. Maybe Penny’s saying something about if you should zap her or not. You shake your head to focus your eyes again, looking down to see Penny looking up at you expectantly.");
		output("\n\n<i>“Oh, er, could you say that last part again?”</i> you say sheepishly.");
		output("\n\n<i>“Uh, sure”</i>, she answers. <i>“I said, if Dr Badger made this thing just for me, maybe I could find someone to help us modify it, so we could use it on her instead. If... if we want to do that?”</i> She may have cleared the cum off her face, but there’s still a big pool of it clinging to the fur between her tits, and you can see her nostrils flaring as she starts slowly drifting forwards towards it.");
		output("\n\n<i>“Right!”</i> you say. <i>“Or, I could use it on you now, and then we could fuck. Like, a lot. A real, real lot.”</i>");
		output("\n\nPenny is staring straight down at the cum on her chest, and can’t help herself from slipping her tongue out and starting to lick it up, shivering with bliss at the taste of it.");
		output("\n\nYou giggle at how cute she looks, all wrapped up in licking up your cum. <i>“You like it? I’m sure this gun-thing could make it so you can cum all the time like I can!”</i>");
		output("\n\nPenny’s eyes go wide, and her ears stand straight up on her head. <i>“Yesth”</i>, she says quickly, slurring a little given how busy her tongue is. <i>“Yesth holy thshit or we could do that yeah.”</i>");
		output("\n\nLooks like she’s leaving the choice up to you. Fun!");
		//[REPORT DR BADGER OPTION NOT AVAILABLE]
		flags["NO_REPORTING_DOC_BADGER"] = 1;
		pc.lust(100);
		pc.orgasm();
		pc.lust(33);
	}
	flags["PENNY_BADGER_WARNED"] = 1;
	clearMenu();
	//Add Text/Buttons
	//[Report Dr Badger][Turn the tables on Dr Badger][Zap Penny after talking to her]
	if(flags["NO_REPORTING_DOC_BADGER"] == 1) addDisabledButton(0,"TurnInBadger","Turn In Doctor Badger","It’s probably better to play it safe, given how dangerous Dr Badger seems to be. Get Penny to report her, and have the professionals sort it out.");
	else addButton(0,"TurnInBadger",turnDoctorBadgerIntoSpacePolice2,undefined,"Turn In Doctor Badger","It’s probably better to play it safe, given how dangerous Dr Badger seems to be. Get Penny to report her, and have the professionals sort it out.");

	addButton(1,"Turn Tables",turnTheTablesOnBadgertwat,undefined,"Turn the Tables on Dr. Badger","That DOES sound like it could be a fun plan. Show Dr Badger just how much of a hero you can be...");

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
		output("\n\nSurprisingly, the beam doesn’t seem to cause an increase in size there. It’s probably for the best - she’s already got far too much to hide away without great effort, anything more and she might have difficulty walking around. Still, that’s not to say there’s no effect - quite the opposite. Her cock visibly <i>throbs</i>, and you can practically hear her balls churn from where you’re standing. The chair skitters out from beneath her as she desperately shifts herself, only stopping from toppling over forwards by catching the edge of the desk with her flailing claws.");
		output("\n\n<i>“Gh-ahhmm! Ahh! Ahhhhhmmmm!”</i> she cries, her whole body twitching and spasming jerkily as a veritable stream of slick pre-cum starts to pour from her cock. You can see her balls pulsing and surging, but... it doesn’t seem like they’re getting any smaller. Just to be sure you turn off the raygun, but although the intensity of Penny’s moans seem to die down as the beam disappears, the slow-bubbling stream of white does not.");
		output("\n\nWith a smile, you make your way around the desk, sitting down right next to her. <i>“Well well”</i>, you say softly, <i>“I </i>am<i> impressed. Dr Badger did her homework well, it seems.”</i>");
		output("\n\nRoused through the haze of lust and sensation, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\nBefore you answer, you reach one hand around behind Penny’s head, gripping it firmly and pulling it forwards, forcing her to look down at herself. Her new tits get in her way somewhat, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now. You were a cumslut before, and a good one, but now - now you’re </i>made<i> for it. Now you’ll </i>always<i> be cumming.”</i> You shift your grip, holding her with one finger at the bottom of her chin to lift her back up to face you, smiling at her as her hips jerk helplessly, sending a brief spurt of cum onto the ground at the thought. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming raygun at her once again. You start with her ass, the beam rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. The task there complete you shift it upwards, letting the soft pink light fall on her face and head. In response you see her lips plump up too, becoming deliciously full and perfect for sucking an endless amount of cocks. Her long low moans are soon interspersed with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with a long luxurious mane of bright blond hair. And with that, it looks like she’s done. Well, physically, at least.");
		output("\n\nSetting the raygun down, you lean in over the panting girl. <i>“So”</i>, you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer, clearly having to work to control her breathing enough to talk. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou frown. Is that... it? When you gave her that cock in the first place she was a mess, and now she just feels good? You’re about to say something, but she beats you to it. Letting go of the desk she falls backwards, her ass cushioning her fall as she lands flat on her back. You think for a second that she might be hurt or in trouble, but when you see the ecstatic look on her face it’s clear that something else is going on.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!</i>, she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
		output("\n\nYou smile, but the ongoing silence soon makes it clear that she’s expecting an answer. <i>“Uh, yeah”</i>, you say, <i>“I convinced you to get it.”</i>");
		output("\n\nPenny pouts. It’s an expression she can pull off pretty well now. <i>“Yeah well duh, but like, have you seen it </i>now<i>?”</i>");
		output("\n\n<i>“I have, yes. That... that was me too.”</i>");
		output("\n\n<i>“Well, thanks!”</i> she answers brightly, clearly missing your bemused tone. <i>“I love it!”</i> The conversation stops as she wraps both hands around her shaft and works at it happily for a few moments, each stroke rewarding her with a burst of thick cum that she catches eagerly in her open mouth. <i>“Oh holy crap, this is, like, </i>amazing<i>! I’m never going to have to not be covered in cum ever again, am I? Please, tell me I’m not!”</i>");
		output("\n\nHer expression as she looks up at you is surprisingly earnest, as though she really does need you to confirm that she’s as much of a bimbo slut as she hopes she is. <i>“No”</i>, you answer confidently, <i>“I’m pretty sure you’re not.”</i>");
		output("\n\nIt’s that, that last moment of confirmation that finally tips Penny over the edge properly. One hand clenches tightly around her cock, while the other spends one wild second flailing urgently until it finds its way around her balls, squeezing them needfully to better milk herself for sweet cum. The resulting orgasm is climactic, a veritable fountain of thick cum pouring out from her cock, arching up over her body and landing on her face and chest. After several seconds of urgent, productive thrusts she shifts to push her cock up through her tits, slickly coating its path the whole way, before eventually she manages to wrap her plump lips around its still-spasming tip. And then she just... doesn’t stop. Her blissful cocksucking goes on for several minutes, and even when you quietly but insistently lift her head back up to talk with her she still keeps cumming quietly, her cock creating an ever-growing pool of whiteness on her dull brown fur. She looks at you attentively while you hold her, but it’s clear that the second you go she’ll go right back to either sucking her cock directly or coating herself with it and then licking up the results.");
		output("\n\n<i>“So, how would you feel about reporting Dr Badger?”</i> you ask her innocently.");
		output("\n\nShe looks almost hurt, the first time since you zapped her that you’ve seen her expression look anything other than blissful. <i>“Why on earth would </i>anyone<i> want to do that? She’s like, magic! Have you </i>seen<i> my cock? It’s cumming </i>forever<i>. You don’t lock up someone who can do something like that!”</i>");
		output("\n\nWell, looks like mission accomplished - Dr Badger doesn’t have anything to worry about here. Penny seems happy too, and you suspect that in a place like this a police officer whose first resort is to fuck any problems into submission will probably do pretty well. You can have fun with this new version of Penny later, but for now you’ve got a payment to collect.");
		processTime(11);
		pc.lust(25);
	}
	//IF PLAYER IS BIMBOIFIED AND PENNY DOES NOT HAVE A DICK
	else if(pcBimboedByBadger() && !penny.hasCock())
	{
		output("<i>“So, yes then?”</i> you ask chirpily. <i>“C’mon, it’s super fun!”</i>");
		output("\n\nPenny looks around for a moment, taking in the empty little office she works in and looking out the window to the rest of the world outside. <i>“You know what?”</i> she says eventually. <i>“Fuck it. I’m pretty sure a sex-mad bimbo would do an even <i>better</i> job of looking after this place anyway. And I’ve worked hard, I deserve to have some fun, right?”</i>");
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
		output("\n\nWith a smile, you make your way around the desk, sitting down right next to her. <i>“Wow!”</i> you say perkily, <i>“Dr Badger did a great job, huh?”</i>");
		output("\n\nThrough the fog of lust and super good feelings, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\nBefore you answer, you reach one hand around behind Penny’s head, pulling her down to look at the interesting bit. Her new tits get in her way somewhat, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now! You get to be cumming like, all the time. That sounds super good, right? It’s what Doctor Badger decided you were supposed to do, so now you’re </i>made<i> for it.”</i> You lift her head back up, smiling happily at her as she joins you in being one of Doctor Badger’s bimbos. She must like the thought of it too, when you told her she was going to cum all the time her hips had starting jerking forward helplessly, sending several spurts of cum onto the ground. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming gun-thing at her again. You start with her ass - every good bimbo needs a good ass - and clearly the beam agrees, rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. The task there complete you shift it upwards, letting the soft pink light fall on her face and head. Her lips plump up, becoming deliciously full and perfect for sucking an endless amount of cocks. She interrupts her own long low moans with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with totally cute long blond hair. And with that, it looks like she’s done. Well, her body, at least.");
		output("\n\nSetting the gun-thing down, you lean in over the panting girl. <i>“So”</i>, you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer. You know how that feels - it’s a lot to deal with, just how much less like, <i>thinking</i> you’re doing. It’s not that you’re brainless, but like, you realize how much doesn’t matter anymore. And that’s like, everything to do with not having sex. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou’re about to say something, but she beats you to it. Letting go of the desk she falls backwards, her ass cushioning her fall as she lands flat on her back. For a second you worry that maybe she’s hurt, but when you see the super happy look on her face it’s clear she’s fine.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!</i>, she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
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
		output("\n\n<i>“Yes! Uhmmnnn! I love it! Oh wow, I... uhmmnn! I am going to suck <i>so</i> much cock!”</i>");
		output("\n\nYou laugh happily. <i>“Yay! Oh there’s something... mhmm... super important!”</i>");
		output("\n\n<i>“Mhmm?”</i>");
		output("\n\nYou stop fucking for a moment and think. What was it? Oh yes! <i>“You’re not going to report Doctor Badger, are you?”</i>");
		output("\n\n<i>“No!”</i> Penny’s answer is loud and clear, and you believe her totally. <i>“Why would I? She did like, magic! She gave me a cock that cums forever! Report her, I want to suck her cock! Wait, she has a cock, right?”</i>");
		output("\n\nGiggling, you say, <i>“she sure does! It looks just like mine!”</i>");
		output("\n\nWhen you say that, Penny looks up around with a gasp, her eyes wide as though she just realized something. <i>“Ohmygoodness - are you Doctor Badger?!”</i>");
		output("\n\n<i>“Wh-”</i>, you start to answer, but then you stop, looking down at your badger hands, fur, and feeling along your badger muzzle. You’re - you’re <i>not</i> Doctor Badger, right? No, that’s totally someone else, there’s no way you’re smart enough to make that gun-thing that did all that wonderful stuff. You don’t have time to say all that to Penny though, because she’s already crawling forward on her knees, looking up at you with love. <i>“Thank you thank you tha-...”</i>");
		output("\n\nHer words cut off as she slides her soft lips around your cock, switching from talking to sucking dick like a pro. You think about correcting her, but her mouth feels <i>really</i> good, and like, well, you did kinda earn this too, right? You came all the way out here. You’ll pass the message along to Doctor Badger anyway. Leaning back, you pat her nicely on the head. <i>“Good girl”</i>, you say softly. <i>“You’re welcome.”</i>");
		output("\n\nYou’re worked up enough that it doesn’t take long, and the sight of Penny reaching one hand down between her own legs to start jerking herself off too is enough to push you over the edge. Penny gulps down your cum eagerly, but eventually you make too much for her to swallow so she slides off your cock, letting your twitching dick coat her back and ass with lovely sticky cream. At the same time she presses herself into the puddle she’s made beneath her, licking loudly at the ground as she tries to get as much cum both on and in her as possible. It’s a look that works <i>super</i> well for her.");
		output("\n\nEventually, after a good few minutes, you’re done. Penny is still happily snuffling about on the floor, but you’re good enough for now to finish up and leave her to it. Mission accomplished! Time to tell Doctor Badger about how you did and what Penny’s like now.");
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
		output("\n\nWith a smile, you make your way around the desk, sitting down right next to her. <i>“Wow!”</i> you say perkily, <i>“Dr Badger did a great job, huh?”</i>");
		output("\n\nThrough the fog of lust and super good feelings, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\nBefore you answer, you reach one hand around behind Penny’s head, pulling her down to look at the interesting bit. Her new tits get in her way somewhat, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now! You get to be cumming like, all the time. She must have known you were a super good little cumslut, but now you’re </i>made<i> for it.”</i> You lift her head back up, smiling happily at her as she joins you in being one of Doctor Badger’s bimbos. She must like the thought of it too, when you told her she was going to cum all the time her hips had starting jerking forward helplessly, sending several spurts of cum onto the ground. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming gun-thing at her. You start with her ass - every good bimbo needs a good ass - and clearly the beam agrees, rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. The task there complete you shift it upwards, letting the soft pink light fall on her face and head. Her lips plump up, becoming deliciously full and perfect for sucking an endless amount of cocks. She interrupts her own long low moans with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with totally cute long blond hair. And with that, it looks like she’s done. Well, her body, at least.");
		output("\n\nSetting the gun-thing down, you lean in over the panting girl. <i>“So”</i>, you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer. You know how that feels - it’s a lot to deal with, just how much less like, <i>thinking</i> you’re doing. It’s not that you’re brainless, but like, you realize how much doesn’t matter anymore. And that’s like, everything to do with not having sex. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou’re about to say something, but she beats you to it. Letting go of the desk she falls backwards, her ass cushioning her fall as she lands flat on her back. For a second you worry that maybe she’s hurt, but when you see the super happy look on her face it’s clear she’s fine.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!</i>, she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
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
		output("\n\n<i>“Yes! Uhmmnnn! I love it! Oh wow I... uhmmnn! I am going to suck <i>so</i> much cock!”</i>");
		output("\n\nYou laugh happily. <i>“Yay! Oh there’s something... mhmm... super important!”</i>");
		output("\n\n<i>“Mhmm?”</i>");
		output("\n\nYou stop fucking for a moment and think. What was it? Oh yes! <i>“You’re not going to report Doctor Badger, are you?”</i>");
		output("\n\n<i>“No!”</i> Penny’s answer is loud and clear, and you believe her totally. <i>“Why would I? She did like, magic! She made my cock magic so I could cum forever! Report her, I want to suck her cock! Wait, she has a cock, right?”</i>");
		output("\n\nGiggling, you say, <i>“she sure does! It looks just like mine!”</i>");
		output("\n\nWhen you say that, Penny looks up with a gasp, her eyes wide as though she just realized something. <i>“Ohmygoodness - are you Doctor Badger?!”</i>");
		output("\n\n<i>“Wh-”</i>, you start to answer, but then you stop, looking down at your badger hands, fur, and feeling along your badger muzzle. You’re - you’re <i>not</i> Doctor Badger, right? No, that’s totally someone else, there’s no way you’re smart enough to make that gun-thing that did all that wonderful stuff. You don’t have time to say all that to Penny though, because she’s already crawling forward on her knees, looking up at you with love. <i>“Thank you thank you tha-...”</i>");
		output("\n\nHer words cut off as she slides her soft lips around your cock, switching from talking to sucking dick like a pro. You think about correcting her, but her mouth feels <i>really</i> good, and like, well, you did kinda earn this too, right? You came all the way out here. You’ll pass the message along to Doctor Badger anyway. Leaning back, you pat her nicely on the head. <i>“Good girl”</i>, you say softly. <i>“You’re welcome.”</i>");
		output("\n\nYou’re worked up enough that it doesn’t take long, and the sight of Penny reaching one hand down between her own legs to start jerking herself off too is enough to push you over the edge. Penny gulps down your cum eagerly, but eventually you make too much for her to swallow so she slides off your cock, letting your twitching dick coat her back and ass with lovely sticky cream. At the same time she presses herself into the puddle she’s made beneath her, licking loudly at the ground as she tries to get as much cum both on and in her as possible. It’s a look that works <i>super</i> well for her.");
		output("\n\nEventually, after a good few minutes, you’re done. Penny is still happily snuffling about on the floor, but you’re good enough for now to finish up and leave her to it. Mission accomplished! Time to tell Doctor Badger about how you did and what Penny’s like now.");
		processTime(27);
		pc.orgasm();
	}
	//Adjust Penny's statblock appropriately?
	pennyBimbofy();
	showPenny();
	flags["BADGER_QUEST"] = 2;
	//Set flag that PC zapped Penny.
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 3");
}

//ZAP PENNY
//[If player has not yet solved Penny’s Zil problem, this option is disabled, with the text:
//She’s too on-guard at the moment to surprise her. Try taking care of her problem first. 
//Also if the player has talked with Penny about zapping her then this option is also disabled, with the text <i>“Now that she knows about this plan, you can’t really surprise her with it anymore”</i>. Otherwise this option should have the text <i>“It would be a real jerk move to just go ahead and zap Penny, but you are getting paid...”</i> if the PC was not bimbo-ified by Dr Badger, and the text <i>“Why wait to talk about this and junk? Being a bimbo is fun, she’ll love it!”</i> if the PC was]");
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
		output("The fox cop looks up as you approach. <i>“Oh, hey [pc.name]”</i>, she says, <i>“what’s up?”</i>");
		output("\n\nYou answer with a shrug, acting casual so as to make sure she doesn’t pick up on anything. <i>“Not much. Traveling the worlds, fighting and fucking crazy aliens, the usual.”</i>");
		output("\n\nPenny laughs, but trails off into a slightly wistful sigh. <i>“Of course. Sounds great, but some of us have reports to write and dumb-shit colonists to babysit...”</i>");
		output("\n\nShe turns back to her terminal, but you interrupt her before she starts typing again. <i>“Actually, I did run across someone interesting while I was gone. Someone with a message for you.”</i>");
		output("\n\nPenny’s ears perk up, although she looks more confused than excited. <i>“Oh? And what was the message?”</i>");
		output("\n\n<i>“This”</i>, you say simply, pulling out the Bimbo Raygun in one smooth motion and pulling the trigger.");
		output("\n\nPenny jumps up far quicker than you would have expected, her chair skittering out behind her even as one of her hands close around her tonfa. But even so the beam from the raygun hits her dead on, a wide circle in the middle of her body lit up by the soft pink glow. She was clearly just about to launch herself at you, but stops as she registers the complete lack of impact or pain.");
		output("\n\n<i>“Some prank [pc.name]”</i>, she snarls. <i>“You’re lucky I didn’t bash your head it before I realized that was just a toy gun.”</i>");
		output("\n\n<i>“Oh, it’s not a toy”</i>, you answer with a smile. Inwardly, you are at least 90% confident it’s not a toy - Dr Badger hardly seeming like the <i>most</i> reliable person - but you decide you’re far in enough now that you might as well go with it. <i>“How do you feel?”</i>");
		output("\n\n<i>“Huh?”</i> Penny stops and thinks for a moment, confused. <i>“Normal, of course. Well, actually, maybe a little bit hot... Maybe I should sit down...”</i>");
		output("\n\nBefore you can stop her she goes to sit down, despite the fact that her chair is no longer beneath her. She doesn’t realize that until too late, and so winds up falling with a heavy <i>“oomph!”</i> on her butt. For your part, you manage to step forward quickly to keep her from being hidden behind her desk, and so keeping the beam of the gun trained on her.");
		output("\n\n<i>“Woah!”</i> Penny says after she’s recovered her breath. <i>“That was dumb. Huh.”</i>");
		output("\n\nYou expect her to get back up, but she doesn’t, instead simply sitting on the ground as though she’s thinking through what exactly happened. Eventually she looks up at you. <i>“That, huh. Whatever that thing you’re using is there, it’s definitely nice and warm.”</i>");
		output("\n\n<i>“Is it?”</i> you answer with mock innocence.");
		output("\n\n<i>“Yeah”</i>, Penny replies, completely missing your tone. <i>“It’s starting to feel pretty... pretty good...”</i>");
		output("\n\nYou lean forward, bringing the gun closer to her and therefore concentrating the beam on her chest. <i>“Is it?”</i>");
		output("\n\nPenny is starting to look flushed, biting her lip and moaning for a second before saying anything more. <i>“Mhmmnn... is that... is that some sort of lust gun or something?”</i>");
		output("\n\nYou shrug. <i>“Or something.”</i>");
		output("\n\n<i>“You uhmm... you could have just asked if you wanted to...”</i> Unconsciously, or perhaps even consciously, Penny’s legs have drifted apart. She’s now sitting on the floor looking up at you, panting a little as her hands roam around increasingly close to her crotch. It’s a good look for her.");
		output("\n\n<i>“Maybe I didn’t want to ask”</i>, you say simply. You speak softly, but with an air of irrefutable authority. <i>“Maybe I wanted to make it so I </i>never<i> had to ask...”</i>");
		output("\n\nPenny is blushing visibly now. <i>“Wh... what do you... what do you mean?”</i>");
		output("\n\n<i>“You can feel it now, can’t you?”</i> You lean in, whispering directly into her ears in a way that makes her whole body tremble. <i>“You can feel that need building inside of you, making you feel all hot and wet and good...”</i>");
		output("\n\n<i>“Yy... I...”</i> Her eyelids flicker as she fights to keep herself from drifting helplessly into it.");
		output("\n\n<i>“It’s okay”</i>, you say, giving her a condescending pat on the head that she can’t help but lean back into a little. <i>“I’m just going to make you a nice bimbo slut, and I’m going to make sure all you can think about is how amazingly good that feels.”</i>");
		output("\n\nAs soon as you say that, Penny’s eyes snap wide open. <i>“Wh- what?!”</i> she stammers. At almost the exact same time however, her hips buck forwards reflexively, and a slick sheen of moisture begins to pool down between her thighs.");
		output("\n\nYou grin. <i>“There we go. I guess some part of you agrees that sounds good after all.”</i> Just then, a thought occurs to you, and you let go of the raygun’s trigger, switching off the beam as you kneel down beside Penny. <i>“Actually, you know what? I can’t just zap you with this gun and turn you into a nice little bimbo slut.”</i>");
		output("\n\nPenny looks genuinely confused for a moment but manages to rally, gritting her teeth and starting to struggle to get to her feet. <i>“No, you c-can’t!”</i>");
		output("\n\nYou grasp her chin, stopping her movement instantly as you pull her head up to look you in the eyes. <i>“No”</i>, you say simply. <i>“You have to </i>beg<i> for it.”</i>");
		output("\n\nShe breaks away from your grasp, but can’t bring herself to make eye contact. She tries to keep her voice firm, but you can hear the hesitance in it as she says <i>“wh- what? Why would I do that?”</i>");
		output("\n\nYou sit back calmly before you answer. There’s no need to try to control her physically after all, you have her in the palm of your hand. <i>“Because you’ve had a taste now, haven’t you? Oh sure, you put on a fierce front, but you know what I think? I think more than anything else, you enjoy losing yourself in sex - that moment when you can just cut loose, let yourself sink down into it and be driven by nothing but your </i>need<i> to fuck and cum.”</i>");
		output("\n\nAt that last word Penny trembles slightly once again, both the blush on her face and the slickness between her legs growing bigger.");
		output("\n\n<i>“I’m right, aren’t I? I thought so. I heard that that was something you just <i>might</i> be interested in.”</i>");
		output("\n\nPenny isn’t trying to talk anymore. Instead her head is hung down slightly, and it looks like she’s concentrating on her breathing. Plus, you’re not sure if it’s just the way she’s sitting of the ray has had some effect already, but you could swear her breasts are straining the inside of her uniform. Gently you reach down and take her head in your hand, lifting her cute little panting muzzle up to face you again. <i>“Here, let me help. I’ll talk you through it, okay?”</i>");
		output("\n\nThere’s the faintest squeak of a moan from Penny in response, which you take as an affirmative.");
		output("\n\n<i>“Okay”</i>, you say softly. <i>“Here’s what’s on offer. I’m going to zap you with this beam thing here, and it’s going to make you a nice little bimbo slut. That means your tits...”</i> You hand shifts as you talk, sliding down to grope at her breasts. Penny leans in helplessly to the sensation. <i>“...are going to get all big and full. So big they’ll never fit into this tight little uniform of yours ever again. Like... this...”</i>");
		output("\n\nWith a few adept movements you undo the buttons of her top, making her tits fall freely out into view - helpfully, it looks like she wasn’t even wearing a bra. <i>“There we go. Doesn’t that feel better?”</i>");
		output("\n\n<i>“Yess...”</i>, Penny breathes, so softly that you wouldn’t have heard it if you weren’t so close to her.");
		output("\n\n<i>“But that’s just the beginning”</i>, you continue. <i>“That’s not the only thing a bimbo like you will get. You’ll also get a nice, plump </i>butt<i>!”</i> You reach down further with your hand and grab her ass, making her jump even as she melts forward into your embrace. <i>“All the better to be constantly filled and fucked, hmm?”</i>");
		output("\n\nThere’s no verbal response, but by now she’s audibly panting with need. You decide it’s time to go in for the kill.");
		output("\n\n<i>“But that’s not all. If you act now, then you’ll receive a very special upgrade.");
		//IF PENNY HAS A COCK
		if(penny.hasCock()) output(" An improvement to your current cock, so you can cum and cum and cum as much as you need.");
		else output(" A nice thick </i>cock<i>, so you can cum and fuck and cum and fuck over and over again, always, as much as you need.");
		output(" And trust me, you are going to need to a </i>lot<i>.”</i>");
		output("\n\n<i>“Fffuck!”</i> Penny gasps, so suddenly it genuinely takes you by surprise. <i>“Fuck yes please okay yes please [pc.name] ffuuuck!”</i>");
		output("\n\n<i>“Good answer”</i>, you say with a smile, raising the raygun one more time and pressing the trigger.");
		output("\n\nThis time she leans into the beam, spreading her legs wide to welcome the changes, and accordingly she doesn’t have long to wait. Almost instantly her breasts start to grow, pressing outwards with every shuddering breath she takes. In moments they’re impressively large, easily big enough that it would take two hands for Penny to hold each one. That said, instead of merely holding her new tits she has a much more important use for her hands, sliding one of them urgently inside her pussy while the other feverishly massages her ");
		//IF PENNY DOES NOT HAVE A COCK =
		if(!penny.hasCock()) output("clit");
		else output("cock");
		output(". Soon that too begins to respond, surging outwards in her grip, her tongue hanging out of her mouth in bliss as she wraps her fingers around the growing mass, balls growing in quickly beneath it. She leans back, while at the same time her hips start to move rhythmically forwards, letting her probing fingers imitate the feeling of a nice cock filling her up as she so desperately needs.");
		output("\n\n<i>“Wow [pc.name]”</i>, she moans, <i>“this feels so fucking good. It’s all like, nice and warm and good and... nice...”</i> She trails off, her head lolling back for a few moments as she concentrates on really just working herself over as much as possible. All the while, the growing cock between her legs is becoming increasingly stiff, stretching up now to reach between her breasts, and the sensation of the slick tip pushing up into her cleavage is enough to make her visibly tremble.");
		output("\n\nGiven that she’s stopped speaking, you decide to pick up the slack. Keeping the beam trained squarely on her, you lean over her. <i>“It feels </i>good<i>, doesn’t it?”</i> you say softly. <i>“Doesn’t it feel </i>right<i>, to really let yourself embrace what a nice little bimbo slut you can be?”</i>");
		output("\n\nShe nods, and as she does you see the hair on her head lighten, changing in seconds to become a lovely, silky blond mane. Her lips plump up too, framing her lolling tongue with a perfect ring of softness. Until now her eyes had been closed in an expression of dream-like bliss, but now they snap open suddenly, locking with yours as she gives you a look of utter submission and satisfaction. <i>“Yes! Yes! YES!”</i> she cries, and with each word her hips buck forward, a veritable fountain of cum erupting from her now-massive cock and churning balls.");
		output("\n\n<i>“Good girl”</i>, you whisper approvingly, using one hand to push her slowly backwards onto the floor, thereby encouraging her to cum over her own body. <i>“Now to really let yourself enjoy your reward...”</i>");
		output("\n\nShe barely needs your encouragement, quickly taking advantage of the opportunity she’s been given to eagerly coat herself with thick white slickness. The stream of cum from her cock arch gracefully upwards and land all over her body, quickly reducing her fur to a thickly matted mess. She revels in the sensation of it, rubbing her body around in the growing puddle on the floor to cover more of herself with it, squeezing her tits together to catch as much of a reservoir as she can between them before leaning down to frenziedly lap it up. And all the while her balls keep churning, the cum still pouring out from her even as the force of the stream abates, until eventually she is left a sopping wet mess, white almost from head to toe even as her cock still drips freely.");
		output("\n\nSetting the raygun down, you lean in over the panting girl. <i>“So”</i>, you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer, clearly having to work to control her breathing enough to talk. Eventually she says, <i>“Like, really good. Wow like, really really good. Holy </i>shit<i> [pc.name]!</i>, she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
		output("\n\nYou smile, but the ongoing silence soon makes it clear that she’s expecting an answer. <i>“Uh, yeah”</i>, you say, <i>“it’s hard to miss.”</i>");
		output("\n\nPenny pouts. It’s an expression she can pull off pretty well now. <i>“Yeah well duh, but have you seen what it can </i>do<i>?”</i>");
		output("\n\n<i>“I have, yes. I was there for all that too.”</i>");
		output("\n\n<i>“Well, thanks!”</i> she answers brightly, clearly missing your bemused tone. <i>“I love it!”</i> The conversation stops as she wraps both hands around her shaft and works at it happily for a few moments, each stroke rewarding her with a burst of thick cum that she catches eagerly in her open mouth. <i>“Oh holy crap, this is, like, </i>amazing<i>! I’m never going to have to not be covered in cum ever again, am I? Please, tell me I’m not!”</i>");
		output("\n\nHer expression as she looks up at you is surprisingly earnest, as though she really does need you to confirm that she’s as much of a bimbo slut as she hopes she is. On closer inspection, it looks like she might have a point - while her productivity might have spiked at more intense moments, it does seem like her cock has been oozing cum ever since you finished zapping her. <i>“No”</i>, you answer confidently, <i>“I’m pretty sure you’re not.”</i>");
		output("\n\nShe gives one last emphatic shudder at that, then curls up in on herself the better to suck her own cock. And from there she just... doesn’t stop. Her blissful slurping goes on for several minutes, and even when you quietly but insistently lift her head back up to talk with her she still keeps cumming quietly, her cock creating an ever-growing pool of whiteness on her dull brown fur. She looks at you attentively while you hold her, but it’s clear that the second you let go she’ll go right back to either sucking her cock directly or coating herself with it and then licking up the results.");
		output("\n\n<i>“So...”</i>, you ask innocently, <i>“if I were to tell you the device I used on you came from a wanted criminal called Dr Badger, how would you feel about that? Would you want to report her to the authorities?”</i>");
		output("\n\nShe looks almost hurt, the first time since you zapped her that you’ve seen her expression look anything other than blissful. <i>“Why on earth would </i>anyone<i> want to do that? She’s like, magic! Have you </i>seen<i> my cock? It’s cumming </i>forever<i>. You don’t lock up someone who can do something like that!”</i>");
		output("\n\nWell, looks like mission accomplished - Dr Badger doesn’t have anything to worry about here. Penny stands up slowly, visibly delighting in her newly revamped form, spinning to take in her bubble butt and exaggerated tits. It’s nice that she’s happy with the results too, and you suspect that in a place like this a police officer whose first resort is to fuck any problems into submission will probably do pretty well. You can have fun with this new version of Penny later, but for now you’ve got a payment to collect.");
		processTime(11);
		pc.lust(25);
	}
	//IF PC WAS NOT BIMBO-IFIED BY DR BADGER AND PENNY IS A CUMSLUT
	else if(!pcBimboedByBadger() && pennyIsCumSlut())
	{
		output("Penny sighs with relief as you walk over, shifting to let her massive cock press up through her breasts. <i>“Thank goodness it’s you [pc.name]”</i>, she says, <i>“I was worried this was going to be some sort of official police business that would get in the way of me getting some quality cocksucking in.”</i>");
		output("\n\nThere’s a pause as you consider what you’re here to do, the silence filled only by the slick noises Penny makes as she presses her cock between her lips. <i>“You know what?”</i> you say with a shrug, <i>I don’t think I need a big discussion to be confident this is going to go well.”</i>");
		output("\n\nYou point the raygun at Penny, and given that her head is down and her attention is elsewhere she doesn’t notice your movement until, with a audible ‘click’, you pull the trigger. You were expecting some bolt of energy, some shining white laser to shoot out and hit her, but instead it’s almost like turning on a flashlight, except the beam it puts out is a suitably bright pink color. It seems... slow, somehow, almost lazy, so it feels kinda like a portable fan you’re holding over someone, except instead of pushing air it’s projecting this slow, thick, pink light. On top of that, given that you’re standing pretty close to her you can clearly see that the cone it’s projecting doesn’t have time to spread out to cover all of her, instead it’s landing in a small circle centered, quite accidentally, right on her chest.");
		output("\n\n<i>“Oh!”</i> she gasps, sliding her cock out of her mouth with a slick slurp, <i>“what is that? It feels... uhnnn...”</i> She trails off, but the fact that she leans back in the chair to provide a better target for the beam completes the thought for her.");
		output("\n\nYou’re happy to go along with her suggestion and keep your aim steady, and it doesn’t take much longer before there’s a reaction as her breasts slowly begin to noticeably swell. Previously they weren’t exactly small, but they weren’t especially large either - at least not compared to some people you’ve encountered - but with each passing second it seems like they’re filling up to another cup size. The sensation is clearly pleasureable too, as Penny confirms as she gives out a quiet earnest moan. She’s sprawled back in her chair, her legs splayed as wide as possible as she relaxes completely into the gentle massaging of the warm pink beam. Well, she’s <i>almost</i> completely relaxed, even though her eyes are closed and her head thrown back in bliss her hands have started moving, one of them sliding down her body to wrap slowly around the heft of her shaft, while the other curls lovingly around her thick balls. By now her tits have attained a quite impressive size - easily as big as some particularly impressive watermelons, looking cutely out of place on her generally trim and toned frame, so given that you apparently have some control over this process you decide to follow her suggestion and shift your focus. You redirect the beam downwards, causing her eyes to shoot open as you target her cock and balls directly.");
		output("\n\nSurprisingly, the beam doesn’t seem to cause an increase in size there. It’s probably for the best - she’s already got far too much to hide without great effort, anything more and she might have difficulty walking around. Still, that’s not to say there’s no effect - quite the opposite. Her cock visibly <i>throbs</i>, and you can practically hear her balls churn from where you’re standing. The chair skitters out from beneath her as she desperately shifts herself, only stopping from toppling over forwards by catching the edge of the desk with her flailing claws.");
		output("\n\n<i>“Gh-ahhmm! Ahh! Ahhhhhmmmm!”</i> she cries, her whole body twitching and spasming jerkily as a veritable stream of slick pre-cum starts to pour from her cock. You can see her balls pulsing and surging, but... it doesn’t seem like they’re getting any smaller. Just to be sure you turn off the raygun, but although the intensity of Penny’s moans seem to die down as the beam disappears, the slow-bubbling stream of white does not.");
		output("\n\nWith a smile, you make your way around the desk, sitting down right next to her. <i>“Well well”</i>, you say softly, <i>“I </i>am<i> impressed. Dr Badger did her homework well, it seems.”</i>");
		output("\n\nRoused through the haze of lust and sensation, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\n<i>“Oh, did I not tell you? That’s the name of your benefactor - the person who gave me this wonderful little device.”</i> Before you continue, you reach one hand around behind Penny’s head, gripping it firmly and pulling it forwards, forcing her to look down at herself. Her new tits get in her way somewhat, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now. You were a cumslut before, and a good one, but now - now you’re </i>made<i> for it. Now you’ll </i>always<i> be cumming.”</i> You shift your grip, holding her with one finger at the bottom of her chin to lift her back up to face you, smiling at her as her hips jerk helplessly, sending a brief spurt of cum onto the ground at the thought. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming raygun at her once again. You start with her ass, the beam rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. The task there complete you shift it upwards, letting the soft pink light fall on her face and head. In response you see her lips plump up too, becoming deliciously full and perfect for sucking an endless amount of cocks. Her long low moans are soon interspersed with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with a long luxurious mane of bright blond hair. And with that, it looks like she’s done. Well, physically, at least.");
		output("\n\nSetting the raygun down, you lean in over the panting girl. <i>“So”</i>, you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer, clearly having to work to control her breathing enough to talk. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou frown. Is that... it? When you gave her that cock in the first place she was a mess, and now she just feels good? You’re about to say something, but she beats you to it. Letting go of the desk she falls backwards, her ass cushioning her fall as she lands flat on her back. You think for a second that she might be hurt or in trouble, but when you see the ecstatic look on her face it’s clear that something else is going on.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!</i>, she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
		output("\n\nYou smile, but the ongoing silence soon makes it clear that she’s expecting an answer. <i>“Uh, yeah”</i>, you say, <i>“I convinced you to get it.”</i>");
		output("\n\nPenny pouts. It’s an expression she can pull off pretty well now. <i>“Yeah well duh, but like, have you seen it </i>now<i>?”</i>");
		output("\n\n<i>“I have, yes. That... that was me too.”</i>");
		output("\n\n<i>“Well, thanks!”</i> she answers brightly, clearly missing your bemused tone. <i>“I love it!”</i> The conversation stops as she wraps both hands around her shaft and works at it happily for a few moments, each stroke rewarding her with a burst of thick cum that she catches eagerly in her open mouth. <i>“Oh holy crap, this is, like, </i>amazing<i>! I’m never going to have to not be covered in cum ever again, am I? Please, tell me I’m not!”</i>");
		output("\n\nHer expression as she looks up at you is surprisingly earnest, as though she really does need you to confirm that she’s as much of a bimbo slut as she hopes she is. <i>“No”</i>, you answer confidently, <i>“I’m pretty sure you’re not.”</i>");
		output("\n\nIt’s that, that last moment of confirmation that finally tips Penny over the edge properly. One hand clenches tightly around her cock, while the other spends one wild second flailing urgently until it finds its way around her balls, squeezing them needfully to better milk herself for sweet cum. The resulting orgasm is climactic, a veritable fountain of thick cum pouring out from her cock, arching up over her body and landing on her face and chest. After several seconds of urgent, productive thrusts she shifts to push her cock up through her tits, slickly coating its path the whole way, before eventually she manages to wrap her plump lips around its still-spasming tip. And then she just... doesn’t stop. Her blissful cocksucking goes on for several minutes, and even when you quietly but insistently lift her head back up to talk with her she still keeps cumming quietly, her cock creating an ever-growing pool of whiteness on her dull brown fur. She looks at you attentively while you hold her, but it’s clear that the second you go she’ll go right back to either sucking her cock directly or coating herself with it and then licking up the results.");
		output("\n\n<i>“So, if someone came in here talking to you, trying to report Dr Badger for being a ‘wanted criminal’”</i>, you ask innocently, complete with air quotes, <i>“how would you feel about that?”</i> you ask her innocently.");
		output("\n\nShe looks almost hurt, the first time since you zapped her that you’ve seen her expression look anything other than blissful. <i>“Why on earth would </i>anyone<i> want to report her? She’s like, magic! Have you </i>seen<i> my cock? It’s cumming </i>forever<i>. You don’t lock up someone who can do something like that!”</i>");
		output("\n\nWell, looks like mission accomplished - Dr Badger doesn’t have anything to worry about here. Penny seems happy too, and you suspect that in a place like this a police officer whose first resort is to fuck any problems into submission will probably do pretty well. You can have fun with this new version of Penny later, but for now you’ve got a payment to collect.");
		processTime(11);
		pc.lust(25);
	}
	//IF PC WAS BIMBO-IFIED BY DR BADGER AND PENNY IS NOT A CUMSLUT
	else if(pcBimboedByBadger() && !pennyIsCumSlut())
	{
		//IF PC DOES NOT HAVE BADGER FORM
		if(!pcHasBadgerForm())
		{
			output("As you walk over to talk to Penny, the thing Dr Badger gave you vibrates in your pocket. You slip your hand inside to check on it, only to feel a sharp little sting. There was like, some sort of needle or something hidden in it that jabbed you? Suddenly, you feel your whole body tremble. You stop, doubling over as your form reshapes rapidly, sliding back easily into the same form the doctor gave you. In seconds it’s done, and once again <b>you’re a perfect bubbly, big-chested and big dicked badger bimbo.</b> Wow, you think, it must be <i>super</i> important to Dr Badger that you look the part when you talk to Penny about this. Oh well! Fortunately she was distracted by something on her screen and didn’t notice your sudden change. ");
		}
		output("<i>“Hey there!”</i> you say perkily, trotting over towards Penny and perching casually on the edge of her desk. <i>“What’s up?”</i>");
		output("\n\nPenny looks up at you in confusion. <i>“I was going to ask you the same question [pc.name]”</i>, she says slowly. <i>“I know the planet rush is opening up wild new aliens to encounter and... inherit things from, but if it wasn’t for the genetic ID scanning system installed over the door I don’t think I would have recognized you. You seem...”</i> There’s a short pause while Penny looks you up and down");
		//IF PENNY HAS A COCK =
		if(penny.hasCock()) output(", and you grin as you hear the quiet sound of Penny’s cock hitting the bottom of the desk");
		output(". <i>“...different. I have to say - it’s a good look for you.”</i>");
		output("\n\n <i>“Thanks!</i>, you answer chirpily. <i>“It feels super good too! Do you like my big tits?”</i> You lean forwards, cupping your breasts and pushing them out towards her, forcing your [pc.upperGarment] to strain as your sizeable chest swells outwards.");
		output("\n\n<i>“Uh, yeah”</i>, Penny coughs, reddening rapidly. <i>“Yeah they’re... they’re pretty great...”</i>");

		output("\n\n<i>“Oh! Also - check this out!”</i> You take Penny by surprise as you spin around, moving to sit on one corner facing towards her, with one leg hanging down on either side. Penny only just manages to move back out of the way of your flailing legs, but before she can say anything about this you interrupt her by pulling down your [pc.underGarmets], letting your thick cock and balls fall freely onto her desk, your slick pussy already starting to make a mess beneath you. <i>“Look at all </i>this<i>!”</i> you say excitedly. <i>“Isn’t it great?”</i>");

		output("\n\nIt takes you a few moments to realize that Penny isn’t saying anything. Looking up, you see she’s just staring straight forwards at you, her eyes wide and a thin line of drool sliding down from her slightly open mouth.");

		output("\n\n<i>“Well, what are you just </i>looking<i> for silly”</i>, you laugh. <i>“You should get in there and see what it’s all like!”</i>");

		output("\n\nWithout waiting for a response you reach out with one of your bluntly clawed hands, wrapping it around the back of her head and pulling her forcefully inwards. She lands heavily against you, her mouth just happening to wind up at the base of your cock, her tongue sliding for just a second along the length of your dripping slit. <i>“Good, huh?”</i>");

		output("\n\nAfter a few seconds the thought occurs to you that Penny has probably had time to have a good look, and when you let her head go she almost slides back down into her seat.");

		output("\n\n<i>“Holy shiiiiiiit”</i>, she says slowly. <i>“[pc.name], I don’t know </i>where<i> you got those gene mods, but you have </i>got<i> to let me know your source.”</i>");
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
		output("\n\nWithout really planning to, you start doing things to make what you’re saying clearer. You grind yourself slowly along the desk, sliding your free hand up and down your cock faster and faster. <i>“It just... it feels really good Pen, I can’t... I can’t stop fucking and touching myself. I don’t want to stop. Why would I want to stop? I want to </i>share<i> this. And I get to share this with you! I get to make you just as nice and... slick, and hard and...”</i>");
		output("\n\nYou bite your lip. You can feel your orgasm coming, and not just because of how you’re jerking yourself off. It’s also because you can see Penny panting in front of her, her tits now just as big as yours, the hair on her head just starting to become blond, her lips starting to get all nice and plump. But more than that, it’s the look in her eyes - you know she’s feeling it too, all those big thoughts and worries and everything getting cleaned out and replaced with just the wonderful need to fuck and be fucked. She’s drooling now, watching you with burning need, as her ass rounds out to give her the perfect set of killer bimbo curves. Your hand tightens on your cock, and you watch as Penny hastily tears off her clothes, revealing her own");
		if(penny.hasCock()) output("cock");
		else output("clit");
		output(" starting to stretch and grow too.");
		output("\n\n<i>“Yes!”</i> she squeaks, her voice already a little higher and more bubbly than before. <i>“Yes, give it to me, let me... let me... fffuuuck!”</i>");
		output("\n\nYou jerk yourself forwards, and with all this stuff going on - the feeling of the desk sliding against your slick pussy, your own hand on your cock, and the sight of Penny giving in and embracing the warm pink fun of the gun-thing that you’re still (barely) keeping pointed at her, it all adds up to one of the biggest orgasms you’ve ever had. Your whole body shakes, but more importantly a, like, <i>fountain</i> of cum shoots out of your cock, and Penny happily leans back to let as much of it land on her as possible. Then she cums too,");
		if(penny.hasCock()) output(" her own cock growing large enough to slide between her tits and splatter wetly against her chin");
		else output(" and with a wild, passionate thrust of her hips her clit finally grows into the big ol’ cock she needs it to be, quickly becoming large enough to slide between her tits and splatter wetly against her chin");
		output(", while two big, churning balls swing heavily beneath it. She leans her head forward, hurriedly wrapping her mouth around her massive cock and sucking at it, clearly really enjoying both the taste and feeling of filling herself with her own cum.");
		output("\n\n<i>“There ya go!”</i> you say happily. <i>“I told you it’d feel good!”</i>");
		output("\n\nShe lets her cock slide out of her mouth, but even as she tries to talk she keeps getting cut off when another burst of thick cum spurts out all over her face. <i>“Yeah! I like, mhmmmm! Yeah it’s.... mmmhmm! It feels good! Like, mhmmm! Really really good! What was... mhmmm what was I worried about?”</i>");
		output("\n\nYou shrug. <i>“I dunno! Something dumb. Something about </i>not<i> fucking all the time. So yeah, something dumb.”</i>");
		output("\n\n<i>“Oh yeah”</i>, she agrees, rolling her head from side to side to make sure as much of it as possible is covered with her cum. <i>“This is like... mhmmm... </i>way<i> better than not fucking all the time.”</i>");
		output("\n\nEventually you finish up, giving Penny’s tits one last blast before your balls are finally emptied, at least for now. But Penny just sorta... keeps going. Her head is rolling around, her hands are twitching against her big thick balls, and all the while her cock just keeps on cumming. It’s died down a bit sure, but there’s still a lot of cum spurting out from her, and she’s <i>super</i> enjoying it.");
		output("\n\nYou walk around Penny to get a better look. She really seems like she’s getting into it! She’s lying back in her chair now, letting the slow, steady flow from her cock just wash blissfully over her. <i>“Wow”</i>, you say. <i>“You sure are having a good time, huh?”</i>");
		output("\n\n<i>“Holy shit [pc.name]”</i>, Penny replies, turning her head to the side, <i>“I think I’m </i>basically<i> going to be cumming like, forever. Is that a thing that can happen? Is that something I can do?”</i>");
		output("\n\nYou put your finger to your lips and think. Penny <i>does</i> look like a perfect bimbo slut now, with nice big tits, and a round, easily grippable bubble butt. Her short mohawk has grown out into a long mane of platinum blond hair, and, of course, her big ol’ cock and balls are still churning and spurting cum, coating more and more of her sticky fur. <i>“Yep!”</i> you answer happily. <i>“You’re going to be a super cum covered bimbo slut for like, all the time.”</i>");
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
		output("\n\n<i>“Wh-”</i>, you start to answer, but then you stop, looking down at your badger hands, fur, and feeling along your badger muzzle. You’re... you’re <i>not</i> Doctor Badger, right? No, that’s totally someone else. There’s no way you’re smart enough to make that gun-thing that did all that wonderful stuff, right? You don’t have time to say all that to Penny though, because she’s already crawling forward on her knees, looking up at you with love. <i>“Thank you thank you tha-...”</i>");
		output("\n\nHer words cut off as she slides her soft lips around your cock, switching from talking to sucking dick like a pro. You think about correcting her, but her mouth feels <i>really</i> good, and like, well, you did kinda earn this too, right? You came all the way out here. You’ll pass the message along to Doctor Badger anyway. Leaning back, you pat her nicely on the head. <i>“Good girl”</i>, you say softly. <i>“You’re welcome.”</i>");
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
		if(pcHasBadgerForm()) output("As you walk over to talk to Penny, the thing Dr Badger gave you vibrates in your pocket. You slip your hand inside to check on it, only to feel a sharp little sting. There was like, some sort of needle or something hidden in it that jabbed you? Suddenly, you feel your whole body tremble. You stop, doubling over as your form reshapes rapidly, sliding back easily into the same form the doctor gave you. In seconds it’s done, and once again you’re a perfect bubbly, big-chested and big dicked badger bimbo. Wow, you think, it must be <i>super</i> important to Dr Badger that you look the part when you talk to Penny about this. Oh well! Fortunately she was distracted and didn’t notice your sudden change.\n\n");
		output("<i>“Hey there!”</i> you say perkily, trotting over towards Penny and perching casually on the edge of her desk. <i>“What’s up?”</i>");
		output("\n\nPenny does a double-take between you and the computer, and then gives a sigh of relief. <i>“Thank goodness it’s you [pc.name]”</i>, she says, <i>“I was worried this was going to be some sort of official police business that would get in the way of me getting some quality cocksucking in. So, uh, what’s with the new form by the way?”</i> She gives you a quick look up and down before continuing. <i>“Don’t get me wrong, it’s a good look for you - but if it wasn’t for the genetic sensor built into the door I’m not sure I would have recognized you.”</i>");
		output("\n\n<i>“Oh!”</i> you answer happily, <i>“let me show you!”</i> Then, without any further thought, you pull out the gun-thing Doctor Badger gave you, point it at Penny and pull the trigger.");
		output("\n\nShe doesn’t do anything at first - maybe she was too surprised or maybe she just trusted you after all you’ve taken her through already, but she doesn’t like, dive out of the way or anything, which is definitely helpful. You kinda expected some big sort of zap or something, but it’s almost like turning on a flashlight, except the beam is a super cool bright pink color. But it’s all like... slow, almost lazy, which seems weird for light. It doesn’t cover all of her either, it’s just like a small circle of pinkness, which with a satisfied giggle you aim right at her chest.");
		output("\n\n<i>“Oh!”</i> she gasps, her cock already starting to harden as it slides up between her tits, <i>“what is that? It feels... uhnnn...”</i> She trails off, but by the way she leans back in the chair to make herself a better target tells you all you need to know.");
		output("\n\nShe’s clearly happy so you keep your aim steady, and it doesn’t take much longer before her breasts slowly begin to grow. Before they weren’t exactly small, but they weren’t especially large either - not as big as yours, definitely - but they quickly begin to catch up. The feeling must be nice too, as Penny confirms when she gives out a happy moan. She’s leaning back back in her chair, her legs as far apart as possible as she relaxes completely into the gentle massaging of the warm pink beam. Well, she’s <i>almost</i> completely relaxed, even though her eyes are closed and her head is thrown back in bliss her hands have started moving, one of them sliding down her body to wrap slowly around her shaft, while the other cups her thick balls lovingly. By now her tits have gotten super big - about as big as yours, even! - and they look cutely out of place on her trim and toned body. You suddenly realize that you must have some control over what’s happening to her, so you figure it’s about time to get to get naughty and shift your focus. You redirect the beam downwards, making her eyes to shoot open as you target her cock and balls directly.");
		output("\n\nSurprisingly, the beam doesn’t seem to make her any bigger there. You pout a little, but you <i>guess</i> that’s probably for the best - she’s already pretty huge there, any bigger and she’d have problems walking to the next person she needed to fuck. I mean, what’s the point of a nice bimbo slut if she can’t come to you? Still, something does definitely happen. Her cock <i>throbs</i>, and you can practically hear her balls churn from where you’re standing. The chair slides out from under her as she desperately shifts herself, only stopping from falling forwards by catching the edge of the desk in front of her with her claws.");
		output("\n\n<i>“Gh-ahhmm! Ahh! Ahhhhhmmmm!”</i> she cries, her whole body twitching as a stream of slick pre-cum starts to pour from her cock. You can see her balls pulsing and surging, but... it doesn’t seem like they’re getting any smaller. Just to be sure you turn off the gun-thing, but even though Penny moans a little quieter as the beam stops, the stream of whiteness pouring out of her keeps right on going.");
		output("\n\nWith a smile, you make your way around the desk, sitting down right next to her. <i>“Wow!”</i> you say perkily, <i>“Dr Badger did a great job, huh?”</i>");
		output("\n\nThrough the fog of lust and super good feelings, Penny manages to open one eye to look at you. <i>“H- uh?”</i>");
		output("\n\nBefore you answer, you reach one hand around behind Penny’s head, pulling her down to look at the interesting bit. Her new tits get in her way a little, but she still has a clear enough view of her cock to see what’s going on.");
		output("\n\n<i>“Don’t you see? This is you now! You get to be cumming like, all the time. She must have known you were a super good little cumslut, but now you’re </i>made<i> for it.”</i> You lift her head back up, smiling happily at her as she joins you in being one of Doctor Badger’s bimbos. She must like the thought of it too, when you told her she was going to cum all the time her hips had starting jerking forward helplessly, sending several splashes of cum onto the ground. <i>“Now let’s finish you off, shall we?”</i>");
		output("\n\nShe cums again at that, but you’re already standing back up, aiming the gun-thing at her. You start with her ass - every good bimbo needs a good ass - and clearly the beam agrees, rounding it out into a juicy bubble butt in seconds, perfect for being gripped and fucked and filled. That done, you shift it upwards, letting the soft pink light fall on her face and head. Her lips plump up and become deliciously full, perfect for sucking an endless amount of cocks. She interrupts her own long low moans with chirpy giggles, and with each happy shake of her head her short red mohawk stretches outwards, changing color as it grows until she’s left with totally cute long blond hair. And with that, it looks like she’s done. Well, her body, at least.");
		output("\n\nSetting the gun-thing down, you lean in over the panting girl. <i>“So”</i>, you ask, <i>“how do you feel?”</i>");
		output("\n\nIt takes her a few moments to answer. You know how that feels - it’s a lot to deal with, just how much less like, <i>thinking</i> you’re doing. It’s not that you’re brainless, but like, you realize how much doesn’t matter anymore. And that’s like, everything to do with not having sex. Eventually she says, <i>“Like, really good. Wow like, really really good.”</i>");
		output("\n\nYou’re about to say something, but she beats you to it. Letting go of the desk she falls backwards, her ass cushioning her fall as she lands flat on her back. For a second you worry that maybe she’s hurt, but when you see the super happy look on her face it’s clear she’s fine.");
		output("\n\n<i>“Holy </i>shit<i> [pc.name]!</i>, she gasps. <i>“Have you </i>seen<i> this cock?”</i>");
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
		output("\n\n<i>“Wh-”</i>, you start to answer, but then you stop, looking down at your badger hands, fur, and feeling along your badger muzzle. You’re - you’re <i>not</i> Doctor Badger, right? No, that’s totally someone else, there’s no way you’re smart enough to make that gun-thing that did all that wonderful stuff. You don’t have time to say all that to Penny though, because she’s already crawling forward on her knees, looking up at you with love. <i>“Thank you thank you tha-...”</i>");
		output("\n\nHer words cut off as she slides her soft lips around your cock, switching from talking to sucking dick like a pro. You think about correcting her, but her mouth feels <i>really</i> good, and like, well, you did kinda earn this too, right? You came all the way out here. You’ll pass the message along to Doctor Badger anyway. Leaning back, you pat her nicely on the head. <i>“Good girl”</i>, you say softly. <i>“You’re welcome.”</i>");
		output("\n\nYou’re worked up enough that it doesn’t take long, and the sight of Penny reaching one hand down between her own legs to start jerking herself off too is enough to push you over the edge. Penny gulps down your cum eagerly, but eventually you make too much for her to swallow so she slides off your cock, letting your twitching dick coat her back and ass with lovely sticky cream. At the same time she presses herself into the puddle she’s made beneath her, licking loudly at the ground as she tries to get as much cum both on and in her as possible. It’s a look that works <i>super</i> well for her.");
		output("\n\nEventually, after a good few minutes, you’re done. Penny is still happily snuffling about on the floor, but you’re good enough for now to finish up and leave her to it. Mission accomplished! Time to tell Doctor Badger about how you did and what Penny’s like now.");
		processTime(27);
		pc.orgasm();
	}
	//[in all cases after Penny is bimbo-ified, force the player outside]
	//Do actual Penny Stat Changes.
	//flag Penny as bimbofied.
	pennyBimbofy(cockEnlarge);
	showPenny();
	flags["BADGER_QUEST"] = 2;
	//Set flag that PC zapped Penny.
	clearMenu();
	//Don't worry about special consensual/not consensual flags - if the convo to tell her about it beforehand happened, it counts as consensual. Duh.
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 3");
}

//REPORT DR BADGER
public function turnDoctorBadgerIntoSpacePolice2():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("Penny exhales as you tell her you’d prefer just to report Dr Badger, her hands unclenching from the edge of the desk. <i>“Yeah, you’re probably right”</i>, she says. <i>“Much as I want to try going toe-to-toe with her after she made it personal, it’s probably best not to go off half-cocked and try to mess with some mad scientist by ourselves.”</i>");
	if(pennyIsCumSlut()) 
	{
		output(" She stops for a second, struggling to get her cock tucked back under the desk and give herself some semblance of respectability. <i>“And, yeah, what she was offering did sound pretty tempting, to just go all out in terms of sex and sluttiness and...”</i>");
		output("\n\nShe trails off, her face going red as you hear the soft ‘thunk’ of her cock hitting the bottom of the desk. You cough politely, and with a quick shake of her head she gets herself back under control.\n\n");
	}
	else output("\n\nShe stops and trails off, blushing indiscretely. After a shake of her head, Penny takes a deep breath and continues. ");
	output("<i>“Yeah, that, basically. What I’ve got going on now is fun, but I can still focus when I really need to. Something tells me that wouldn’t be the case if I go for what she’s offering.”</i>");
	output("\n\nYou nod, setting the raygun down to the side carefully as you watch Penny tap a few commands into her terminal. Eventually she looks up again.");
	output("\n\n<i>“Right, it’s done. I’ve flagged it as high risk, so they’re sending in a squad that could handle - well, let’s just say unless the good doctor can out-punch a squadron of combat ships then they’ll probably be fine. I’ll take that gun thing for evidence too, to make sure we can make the charges stick.”</i> She picks it up delicately, sliding it into an evidence bag and stowing it safely away.");
	output("\n\nAnd that, it seems, is that. Dr Badger should trouble the galaxy no more!");
	processTime(5);
	//[remove Dr Badger from the game as with existing Report function]
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
		output("It’s an interesting choice, but it seems like a smarter idea to <i>not</i> side with the wanted mad scientist. And if you get to show Dr Badger what being a Hero is <i>really</i> about, well, so much the better. <i>“Tell me more about this plan of yours to turn things around on the good doctor...”</i>");
		output("\n\nPenny grins wolfishly. <i>“I was hoping you’d say that”</i>, she says.");
		if(pennyIsCumSlut()) output(" She’s interrupted briefly as her cock hardens dramatically once again, making her shudder with bliss as it pushes up between her breasts. <i>“Well, okay</i>, she adds, <i>“I was </i>mostly<i> hoping you’d say that. The thought of being a 100% cum-focussed bimbo slut has... a definitely appeal, but no, this is a much better plan.”</i>");
		output("\n\nShe types on her terminal for a few moments, frowning at the display as she searches through the information. <i>“Listen, I can’t promise anything, but I know some people who know some people, and I’m sure with all the folks out here for the planet rush there’s got to be someone who knows enough to reconfigure this thing. I’ll put out the call, but it will probably take a while before I hear anything.”</i>");
		output("\n\nNodding at the raygun in your hand, she says. <i>“Leave that with me. I’ll let you know when I’ve found something. And then after that we can have some fun, </i>and<i> show her U.G.C Peacekeepers aren’t something to fuck with.”</i>");
		if(pennyIsCumSlut()) output("\n\nThen, after a brief pause, she adds quietly, <i>“and, uh, </i>after<i> that, maybe we could find a way to make the whole cum-focussed bimbo slut thing work on our terms. If, uh, if you want...”</i>");
		output("\n\nThat seems to be it. For now you just need to sit tight and wait for Penny to get back to you.");
	}
	//IF PLAYER WAS BIMBO-IFIED BY DR BADGER
	else
	{
		output("Dr Badger was preeeettty clear about wanting you to zap Penny. But now Penny is saying this whole other thing, and that <i>also</i> results in people getting zapped, but now the person getting zapped is Dr Badger? Would she get like, an even <i>bigger</i> cock? That does sound nice...");
		output("\n\nEventually you realize that Penny is looking up at you. She must be waiting for you to decide! <i>“Oh, uh, whatever it was that you said. That idea that you came up with? That’s probably good, right? Let’s go with that one.”</i>");
		output("\n\nShe nods slowly. <i>“Oh... kay...”</i> Phew! Problem solved, she doesn’t seem to be wanting you to say anything anymore. Nice work! <i>“I was hoping you’d say that”</i>, Penny says.");
		if(pennyIsCumSlut())
		{
			output(" She’s stops briefly as her cock gets all hard again, making her shudder with bliss as it pushes up between her breasts. <i>“Well, okay</i>, she adds, <i>“I was </i>mostly<i> hoping you’d say that. The thought of being a 100% cum-focussed bimbo slut has... a definitely appeal, but no, this is a much better plan.”</i>");
		}
		output("\n\nShe types on her terminal for a few moments, frowning at the display as she searches through the information. You pout as you wait. Maybe you <i>should</i> have just zapped her - you probably wouldn’t have agreed with her idea if you knew it would end up with all this standing around and not getting fucked. <i>“Listen”</i>, she says eventually, <i>“I can’t promise anything, but I know some people who know some people, and I’m sure with all the folks out here for the planet rush there’s got to be someone who knows enough to reconfigure this thing. I’ll put out the call, but it will probably take a while before I hear anything.”</i>");
		output("\n\nNodding at the raygun in your hand, she says. <i>“Leave that with me. I’ll let you know when I’ve found something. And then after that we can have some fun, </i>and<i> show her U.G.C Peacekeepers aren’t something to fuck with.”</i>");
		if(pennyIsCumSlut()) output(" Then, after a brief pause, she adds quietly, <i>“and, uh, </i>after<i> that, maybe we could find a way to make the whole cum-focussed bimbo slut thing work on our terms. If, uh, if you want...”</i>");
		output("\n\n seems to be it. For now you just need to sit tight and wait for Penny to get back to you. And maybe, while you’re waiting, like, actually get some sex. That would be <i>super</i> nice.");
	}
	output("\n\n<b>Penny has taken posession of the bimbo ray.</b>");
	pc.removeKeyItem("Doctor Badger's Bimbo Raygun - Programmed for use on Penny.");
	flags["BADGER_QUEST"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Post bimbo Penny reactions/repeat greetings (incl reaction from Flahne)
//Approach Text
//[replace text for Approach after Penny has been bimbo’d]
public function approachBimboPenny():void
{
	clearOutput();
	showPenny(true);
	abeAuthor();
	//First Time
	if(flags["SEEN_BIMBO_PENNY"] == undefined)
	{
		output("You head over to Penny’s desk, finding her sitting up straight at her chair, looking surprisingly perky and attentive. <i>“Oh, h-”</i>, a weird look crosses her face briefly, but she recovers and finishes, <i>“hi [pc.name]!”</i>");
		output("\n\n<i>“Hi”</i>, you answer. <i>“How are you doing? You seem... distracted.”</i>");
		output("\n\nPenny giggles. <i>“Okay, you caught me!”</i> She throws her hands up in the air, then leans in close and whispers, as though telling a secret. <i>“I was finding it really hard to like, concentrate, and plus I had to deal with so much cum even </i>I<i> was having trouble drinking it all. But then, well, the problem solved itself!</i>");
		output("\n\nShe waves for you to come over, and, curious, you step around the desk. The first thing you see is that she’s not wearing any clothes from the waist down - although that’s hardly unusual - but then you see a shape down between her legs.");
		output("\n\nIt takes a little while before you figure out what it is, because at first it doesn’t really look like <i>anything</i>, just a big blob of... something. And then you see it - it’s Flahne. She’s on her knees, her face buried in Penny’s crotch, and you can see the fox-girl’s cock going inside her mouth and most of the way down her throat. The reason why you didn’t recognize Flahne at first is because she’s almost completely white, her body bulging a little bit under the massive loads Penny has clearly been feeding her for some time.");
		output("\n\n<i>“Ta-da!</i>, Penny announces happily. <i>“Flahne here has been really helpful in making sure I can still get work done, haven’t you?”</i>");
		output("\n\nFlahne pulls herself back, making Penny shudder as her dripping cock is pulled free to give Flahne room to speak. Finally she turns up to you and shrugs. <i>“It’s a living”</i>, she says simply.");
		output("\n\nPenny giggles again, slapping Flahne lightly. <i>“Oh you tease, acting like it’s all </i>such<i> a big trouble. You know as well as I do that you started drooling the second I told you about all this, and you couldn’t </i>wait<i> to help me out.”</i>");
		output("\n\nShe looks back up at you, pouting just a little bit. <i>“Do you know, I didn’t even have to like, go looking for her or anything? The second you left after we first did this I heard something out the window and she was just like, there. I swear she must be able to like, smell cum or something, and we both know I was putting out a </i>lot<i> of it.”</i>");
		output("\n\nYou both turn back to Flahne, and you think that maybe she blushes slightly, even though it’s hard to tell given her current coloring. She doesn’t say anything though, she just slides herself back onto Penny’s cock, making both of them shudder with pleasure.");
		output("\n\n<i>“So”</i>, Penny says eventually, <i>“what can I do ya for?”</i>");
		flags["SEEN_BIMBO_PENNY"] = 1;
	}
	//Repeat
	else
	{
		//IF PC HAS APPROACHED PENNY AFTER SHE HAS BEEN BIMBO’D BEFORE AND THE TIME IS BETWEEN 0800 AND 1700
		if(hours >= 8 && hours < 17)
		{
			output("Penny is sitting at her desk, doing her best to deal with the police work for the day. She looks pent up, even she’s drinking from a coffee mug that you’re pretty sure is filled with her own cum. Every now and again even that clearly isn’t enough, and she’s forced to lean back in her chair, push her monster cock between her breasts and hungrily suck on it until she gives herself another fresh coating. Her fur is thickly spattered with cum, and there are several other large splashes of it around the office. There’s no one else around for now though, Flahne must be having to work her day job. Penny looks up excitedly as you approach. <i>“Hi [pc.name], am I glad to see you! What can I do for ya?</i>");
		}
		//IF PC HAS APPROACHED PENNY AFTER SHE HAS BEEN BIMBO’D BEFORE AND THE TIME IS BETWEEN 1701 AND 0759
		else output("Penny is leaning back in her chair, happily relaxing as she finally gets to drain herself fully now that Flahne is here. The office looks surprisingly clean too - between the two of them they must have cleaned up once it got a bit quieter on the night shift. Flahne doesn’t say anything to you as you walk over, she’s a bit busy with Penny’s cock in her mouth, after all, but Penny looks up excitedly. <i>“Hey there [pc.name]! What can I do for ya?</i>");
	}
	//Buttons
	//[Talk][Sex Options][Leave]
	bimboPennyMenu();
}

public function bimboPennyMenu():void
{
	clearMenu();
	addButton(0,"Talk",bimboPennyTalk);
	addButton(1,"Sex",bimboPennySex);
	addButton(14,"Leave",mainGameMenu);
}

//TALK
public function bimboPennyTalk():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	//IF PC IS A BIMBO
	//IF PC IS A BIMBO [whether Dr Badger brand or not]
	if(pc.isBimbo() || pcBimboedByBadger())
	{
		output("You walk over, grabbing Penny in a big hug. <i>“Oh my goodness, how much fun are you having?”</i>");
		output("\n\n<i>“Oh man like, </i>so<i> much fun!</i>");
		output("\n\n<i>“And the fucking, right?”</i>");
		output("\n\n<i>“I </i>know<i>, right? Like, I used to like fucking, like, really like it, but now it’s like, whoa. A whole new level of pure fuck. It’s amazing!”</i>");
		output("\n\n<i>“So... uh...”</i>, you stop, putting your finger to your lips for a moment as you try to think of something else to talk about. <i>“How’s like, work going?”</i>");
		output("\n\nPenny giggles. <i>“Fun! At least with Flahne to help me get through the slow parts. Other than that, it’s amazing how many problems you can solve in this town by bending over and taking it like a champ. Or giving it, if you need to, like with those nasty ol’ Zil. My cock has </i>totally<i> helped show them who’s boss.”</i>");
		output("\n\n<i>“Nice!”</i>");
		output("\n\nYou stop to think of something else to say again, and while she waits Penny shudders, cumming quietly under the table.");
		output("\n\n<i>“So...”</i>, she says invitingly, <i>“you want to fuck yet?”</i>");
	}
	//IF PC IS NOT A BIMBO
	else
	{
		output("<i>“So, how do you actually feel?”</i> you ask.");
		output("\n\n<i>“Great!”</i> she answers happily. <i>“I don’t know - maybe some day I’ll want to go back to being super serious go-getter cop lady grr, but for now, this feels like a vacation, you know? Just me, my massive cock, my massive sex drive, and my buckets of cum. I think I’ve earned that, don’t you?”</i>");
		output("\n\nYou can’t argue with that. She definitely seems happy too, even if she’s a bit more... single-minded than she used to be. It seems like everything worked out pretty well after all. <i>“So”</i>, you say, unsure of where exactly to take the conversation after ‘buckets of cum’. <i>“Want to talk about your job? Your life? Your race?”</i>");
		output("\n\nPenny shrugs. <i>“Nah, you know all that by now, right? You must be sick of hearing me talk about being a kid in college who wanted to be a fox girl and secretly wanted to get a dick, and then I worked real hard and got both of those things, right?</i>");
		output("\n\n<i>“Uh, well...”</i>");
		output("\n\n<i>“So yeah, let’s skip all that! What say we go straight to the fun questions? Like - do you want to have sex, and what kind of sex do you wanna have?”</i>");
		output("\n\nWell then.");
	}
	//[Increase PC Lust by 15]
	pc.lust(15);
	processTime(3);
	clearMenu();
	bimboPennySexMenu();
}

//SEX OPTIONS
public function bimboPennySex():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("You tell Penny that you’re in the mood for some fun.");
	output("\n\n<i>“Oh thank </i>goodness<i>!”</i> she says with a giggle. <i>“You have no idea how much I was hoping you’d say that. So... what do you want to do?”</i>");
	bimboPennySexMenu();
}

public function bimboPennySexMenu():void
{
	clearMenu();
	//[Fuck her][Get fucked by her][Get oral][Cum bath][Play with Flahne]
	if(pc.hasCock() && pc.cockThatFits(penny.vaginalCapacity(0)) >= 0) addButton(0,"Fuck Her",fuckBimboPenny,undefined,"Fuck Her","Use your cock to fuck the happy little bimbo.");
	else if(pc.hasCock()) addDisabledButton(0,"Fuck Her","Fuck Her","You're too big to fit in her, even after her enhancements.");
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need a penis to fuck her.");

	addButton(1,"Get Fucked",getFuckedByBimboPenny,undefined,"Get Fucked","Take advantage of bimbo Penny’s rather sizeable tool.");
	addButton(2,"Get Oral",getOralFromBimboPenny,undefined,"Get Oral","Have your bimbo slut give you a nice oral servicing");
	if(hours >= 8 && hours < 17) 
	{
		addButton(3,"Cum Bath",givePennyACumBath,undefined,"Cum Bath","Penny sure seems very... productive, maybe you could take advantage of that, if you want?");
		addDisabledButton(4,"Flahne Play","Play With Flahne","Flahne has to be here for this scene, try back later in the day.");
	}
	else 
	{
		addDisabledButton(3,"Cum Bath","Cum Bath","Come back when Flahne isn’t around so Penny has had more time to build up her production");
		addButton(4,"Flahne Play",playWithFlahne,undefined,"Play With Flahne","Flahne’s had a lot of time to absorb Penny’s cum, surely that would make for some interesting flavors and opportunities?");
	}
	addButton(14,"Back",approachBimboPenny);
}

//FUCK HER
public function fuckBimboPenny():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("<i>“Ready for some fun?</i>, you ask");
	if(!pc.isCrotchExposed()) output(" as you strip off your [pc.gear],");
	else output(" as you lift your hips,");
	output(" exposing your cock as it quickly gets hard.");

	output("\n\n<i>“For sure!”</i> she answers happily, standing up so quickly that she knocks her chair over, making it fall to the ground with a clatter behind her. She doesn’t seem to be put off by that at all, leaning forward over her desk and wiggling her already naked butt with a happy giggle.");
	if(hours >= 17 || hours < 8) output(" Beneath the desk, Flahne is clearly sad to have Penny taken away from her, but seems to be happy enough to just lie back and digest the cum she’d already received instead of trying to join in.");
	output(" You take up your position behind her, moving her bushy tail to the side to give yourself access and enjoying the way she shivers with pleasure as you do.");
	//IF PC IS A BIMBO = 
	if(pc.isBimbo() && pc.biggestTitSize() >= 5) output("\n\n<i>“Oh holy shit, this is so great”</i>, you gasp, grabbing at her big full booty as you lean forwards over her, your big tits reaching down far enough to brush against the fur of her back. <i>“I didn’t know how much I wanted to share my slutty bimbo-ness and make a nice pet to fuck, but now that I’ve done it... mhmmmm, it’s the </i>best<i>.”</i>");
	else output("\n\n<i>“You </i>are<i> a good girl, aren’t you?”</i> you whisper into her ears, leaning commandingly over her and grabbing at her big full booty. <i>“Making you into a cute, slutty bimbo pet to fuck was <i>definitely</i> the right choice, wasn’t it?”</i>");
	output("\n\nPenny’s first answer is just a happy little moan, pushing back onto your cock ever so slightly but still waiting for you to make the first move. <i>“I know, right?”</i> she says eventually. <i>“It’s like, I can remember that there was a point where I was all shy and unsure about wanting a big ol’ cock, but like, now it all just seems so dumb!”</i> She reaches down, taking her dick in her hands and putting it up on the desk in front of her before starting to eagerly jerk herself off. <i>“I mean, come on! How could I be unsure about </i>this<i>! It’s the best! I get to cum and cum and... fuck and be coated in... cum...”</i>");
	output("\n\nYou realize that she’s just about to get herself off just from her hands and from thinking about how much of a cum slut she’s become, so with a grin you press your cock into her waiting slit before she finishes without you. She cries out in pleasure as you do, her hands quickly moving off her shaft to steady herself against the desk. Taking that as encouragement you settle into a pounding rhythm, pushing her forwards again and again as she eagerly takes your length inside her.");
	pc.cockChange();
	output("\n\n<i>“Yes! Yes! Yes!”</i> she gasps with each thrust, rocking back into you to heighten the sensations. <i>“I... I need... more!”</i>");
	output("\n\nReaching down beneath herself, she once again wraps one of her hands around her thick shaft. You’re fucking her hard, but clearly she wants even more, wants to make sure she takes advantage of every part of the body you’ve given her. Pressing her cock up between her swaying tits she starts losing herself, letting go and eagerly embracing the urges and needs you’ve brought out in her. Her canine muzzle kisses at the tip of her cock every time one of your powerful thrusts pushes it towards her, her long tongue mixing drool with her dripping pre-cum.");
	output("\n\nIt doesn’t take long of this to make her cum, her knees locking forwards against the desk as her hips tremble, her cock spurting again and again all over her face. She’s quickly left with a dripping puddle to happily slather herself with, licking up as much as she can even as more slick whiteness pulses from her churning balls.");
	output("\n\nIt’s a good sight, and you’re not far from cumming yourself, but suddenly notices your body starting to tense up and turns around to look at you, eyes wide. <i>“N- wait!”</i> she gasps urgently. Pulling forwards she drags your cock out of herself, and before you can react she flips over, sliding forwards onto her knees and looking up at you.");
	output("\n\n<i>“Please</i>, she begs, <i>“</i>cum on my face. Don’t make me have to walk around all day waiting for all of your yummy cum to drip from my pussy - let me... let... I need, please...”</i>");
	output("\n\nPenny trails off, too busy drooling and licking her lips now that your stiff cock is right up next to her face. Closing her eyes, she takes one long, deep breath, savoring your scent as it reaches inside her sensitive nose and flips all the right switches in her brain, making her tail wag unthinkingly behind her. Then she opens her eyes again, and when she looks up at you you see that same flash of power and passion she had when you first met her, but now so eagerly and willingly redirected.");
	output("\n\nShe falls on you, a mess of flailing limbs and her wild, drooling tongue. After a few seconds of confusion she manages to come up with a plan, and, raising herself up slightly, she pushes her tits together with her hands and then slides your [pc.biggestCock] between then.");
	output("\n\n<i>“Yessss...”</i>, she moans happily as she quickly settles into a rhythm. <i>“Yes, fuck me... fuck every part of me, just let- let me have- CUM!”</i>");
	output("\n\nOn that last word she thrusts herself forwards powerfully, and it’s more than enough to bring you over the edge. You fall against her, hands gripping at her head as you almost fold over, your body far more focussed on filling her request than on things like ‘standing up’. Penny gets her reward though, your cock pulsing as a blast of your [pc.cum] washes over her. She leans back, freeing you from between her tits to better let you coat as much of her as possible. Her tongue chases down several mouthfuls for her to savor, but for the most part she’s happy to just close her eyes and lie back, enjoying the feeling of your cum landing all over her.");
	output("\n\nShe opens her eyes again when you’re finally done, licking her lips with a smile. <i>“Mmmmm, that feels so right, having my whole body all nice and sticky with your cum and mine. Can I just live like this always? Maybe I should just come with you and be your nice, dripping cumslut assistant that you can have all the aliens you fight fuck when you can’t be bothered fighting them yourself?”</i>");
	output("\n\nYou’re not sure what to make of that, but she giggles before you can respond. <i>“Nah, don’t worry, I’m just kidding. That’d be fun, but there’s all like, reasons why it’s not likely to happen.”</i> She sighs. <i>“Well, I guess for now I’d better make the most of you when you’re around.”</i>");
	output("\n\nShe picks her chair up off the ground and sits down, wiping her clawed fingers slowly along her sticky fur and sucking it clean after every swipe. <i>“Let me know when you’re good to go again!”</i> she says in between mouthfuls.");
	processTime(38);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//GET FUCKED BY HER
public function getFuckedByBimboPenny():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("Smiling, you make your way over to Penny’s desk, saying, <i>“I think it’s time to put that cock of yours to use...”</i>");
	output("\n\nPenny giggles happily in response, springing up from her chair and running over to you. <i>“You bet!</i>, she says simply. <i>“That sounds good to me!”</i>");
	if(hours >= 17 || hours < 8) output(" Beneath the desk, Flahne is clearly sad to have Penny taken away from her, but seems to be happy enough to just lie back and digest the cum she’d already received instead of trying to join in.");

	output("\n\nYou shed your [pc.gear], leaning forwards and giving Penny a nice view. <i>“Well then, what are you waiting for?”</i>");

	output("\n\nPenny is caught off-guard for a moment, clearly expecting a little more teasing or foreplay, but she’s more than happy to roll with it if you just want something quick and dirty. <i>“Oh! Sorry!”</i> she says, but before you can tell her you were only kidding she grabs you firmly from behind, lining her thick cock up with your [pc.vagOrAss " + x + "]. <i>“You want me to like, go all at it then?”</i>");

	if(pc.isBimbo()) output("\n\n<i>“Psh, yuh. Why else would I have made you into a nice slutty bimbo like me if I didn’t want you to super fuck me a bunch?”</i>");
	else output("\n\n<i>“Uh, yeah, of course. Why else would I have made you a super horny bimbo slut with a nice big cock if I didn’t want you to fuck me with it?”</i>");
	output(", you answer, wiggling your rump to drive the point home and hopefully give her all the encouragement she could need.");
	output("\n\nIt works. Penny doesn’t even bother answering with words, instead just spearing herself into you, filling you up all nice and tight. She’s big, slick and hard, and you know for a <i>fact</i> that she’s ready and willing any time you want her to be. Settling quickly into a powerful rhythm, she’s soon fucking you like a pro, her clawed hands gripping you tightly as she puts every muscle in her body to work.");
	if(x >= 0) pc.cuntChange(x,penny.cockVolume(0));
	else pc.buttChange(penny.cockVolume(0));
	output("\n\n<i>“Mhmmm, that’s good girl”</i>, you sigh happily. <i>“You’re good at this, aren’t you?”</i>");
	output("\n\n<i>“Yes, yes, yes”</i>, she pants, each word in time with her thrusts.");
	output("\n\nYou lean back into it, savoring the feeling of her thick cock pushing so deep inside you. <i>“That’s what you’re for, isn’t it girl? Being always ready to fuck, whenever I want...”</i>");
	output("\n\n<i>“Yes... yes... yes...”</i>. She’s having trouble concentrating enough to speak, only managing to get words out once every few thrusts, and the rest of the time her longue tongue simply hangs needfully from her muzzle.");
	output("\n\n<i>“This is what you are now; an eager, bimbo slut,");
	if(pc.isBimbo()) output(" just like me,");
	output(" and doesn’t it feel good?”</i>");

	output("\n\nHer answer is mostly just a long, low growl. <i>“YYyess... yhrrrrssss... grhhhhh... yesss”</i>");
	output("\n\n<i>“You’re my little fuckpet, aren’t you? My cum addict slut, always dripping, always ready, always-”</i>");
	output("\n\nYou’re not sure what it was, but something you said pushes Penny over the edge. Whatever restraint she had breaks, and suddenly she’s just fucking you like a wild creature. There’s no rhythm, no technique, just a wild, unstoppable need to have as much of herself in as much of you as possible, over and over and over again. Her claws dig into you almost enough to draw blood, she leans down over you enough to start licking madly at your back with her long tongue, and you can <i>feel</i> her balls trembling as she builds up unstoppably. Smiling, you let her have her way with you for a few moments, until eventually you push back against her and say a single, commanding word:");
	output("\n\n<i>“CUM!”</i>");
	output("\n\n<i>“Gh-ahhhrhhhh!”</i> Penny answers, her whole body tensing up as she obeys your command. You feel her cock thicken inside you, her shaft pulsing as wave after wave of her cum surges through her. Her warm, wet slickness floods your [pc.vagOrAss " + x + "], blissful satisfaction pooling out inside you. You close your eyes and smile, content to lock your hips to hers and enjoy her trembling, eager tribute.");
	output("\n\nIt takes some time before she’s finally done, and then with a sigh you pull yourself away. She whines as you slowly release her slick member, but that quickly turns into a shocked gasp as she sees substantial slick mess that comes pouring out of you as she withdraws.");
	output("\n\n<i>“I- mhm!”</i> she whimpers, but before she can form a complete sentence she simply drops to her knees, overcome by her urges. <i>“Need!”</i> she adds in another quick gasp, then she presses her muzzle to the floor and begins to lap at her leftover cum.");
	output("\n\n<i>“Awww”</i>, you tease, scritching her lightly behind her ears, <i>“you just couldn’t hold yourself back, could you girl?”</i>");
	output("\n\nShe answers with a pout, or at least as much of one as she can manage with her face down in a puddle of her own cum. <i>“It’s </i>cum”</i>, she whines, as though that were all the answer that was needed, and, thinking about it, that probably is.");
	output("\n\n<i>“I know girl. Can’t let that go to waste now, can you?”</i>");
	output("\n\nShe shakes her head, but doesn’t bother to answer any more than that. It looks like she’ll be busy cleaning up for some time, so you collect your things and get ready to resume your adventures.");
	processTime(37);
	pc.orgasm();
	if(x >= 0) pc.loadInCunt(penny,x);
	else pc.loadInAss(penny);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//GET ORAL
public function getOralFromBimboPenny():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	if(pc.isBimbo()) 
	{
		output("<i>“I think, like, I </i>super<i> want to try out those nice plump lips of yours”</i>, you say happily, ");
		if(!pc.isTaur()) output("sitting down on the edge of her desk");
		else output("resting against the edge of her desk");
		output(" and leaning in close.");
	}
	else
	{
		output("<i>“I think it’s time to put those bimbo lips of yours to use servicing me”</i>, you say in a sultry whisper, ");
		if(!pc.isTaur()) output("sitting down on");
		else output("leaning against");
		output(" the edge of her desk.");
	}
	output("\n\n<i>“Oh yeah?”</i> Penny giggles, <i>“they’re pretty great, aren’t they?”</i>");
	output("\n\nInstead of answering you just grab her by the head, pulling her in as you ");
	if(!pc.isTaur()) output("bring your legs up, spinning around on the desk and sweeping aside her terminal until you’re straddling her and her head is level with your crotch.");
	else output("clambering awkwardly onto the desk and positioning yourself to make sure your crotch is right in front of her face.");

	output("\n\nPenny doesn’t need any more encouragement than that. She falls forward eagerly, ");
	//IF PC HAS A COCK = 
	if(pc.hasCock()) 
	{
		output("sliding her lips down the length of your [pc.biggestCock]. Her eyes roll up in her head in bliss - clearly, this is exactly what she loves to do.");
		if(pc.isBimbo()) output(" And why wouldn’t she? Sucking cock feels like, <i>so</i> great, why wouldn’t she love doing it?");
		output(" It feels pretty great on your side too, she is <i>good</i> at this. Her lips are so soft and plump that they feel like they’re designed to wrap perfectly around any and all cocks (and, knowing Dr Badger, they probably are). Her tongue works your [pc.biggestCockhead] lovingly, scooping up your [pc.cumColor] pre-cum and shivering in pleasure every time she swallows a fresh batch.");
	}
	//IF PC DOES NOT HAVE A COCK BUT HAS A VAGINA = 
	else if(pc.hasVagina())
	{
		output("sliding her tongue tongue happily inside your [pc.biggestVagina]. She coos happily as you pull her close, licking at your insides while her plump lips brush against your [pc.oneClitPerVagina]. Her eyes roll up in her head in bliss - clearly, this is exactly what she loves to do.");
		if(pc.isBimbo()) output(" And why wouldn’t she? Eating out a pussy feels like, <i>so</i> great, why wouldn’t she love doing it?");
		output(" It feels pretty great on your side too, she is <i>good</i> at this. Her lips are so soft and plump that they feel just perfect against your clit, and she’s so skilled at moving her tongue inside you that it feels like it was designed for it (and, knowing Dr Badger, it probably was). She presses herself close, making sure none of your [pc.girlCum] escapes and shivering in pleasure every time she swallows a fresh batch.");
	}
	//IF PC DOES NOT HAVE A COCK OR A VAGINA = 
	else
	{
		output("and you spin around again in anticipation, leaning forward so she can eat out your ass. She takes to it happily, her plump lips kissing at your soft flesh while her tongue sweeps eagerly along your rim. Her eyes roll up in her head in bliss - clearly, this is exactly what she loves to do.");
		if(pc.isBimbo()) output(" And why wouldn’t she? Eating someone out feels like, <i>so</i> great, why wouldn’t she love doing it?");
		output(" It feels pretty great on your side too, she is <i>good</i> at this. It’s like she was designed for it (and, knowing Dr Badger, she probably was).");
	}
	output(" Despite all the ways ");
	if(!pc.isBimbo()) output("she’s changed physically");
	else output("her body has changed");
	output(", the hottest thing about might be the fact that she so clearly <i>needs</i> this. You don’t think she even eats or drinks anything else any more, she’s just a perfect, needy, eager cumslut, all day, every day.");
	output("\n\nYou did that. ");
	if(!pc.isBimbo()) output("You took this fierce, dedicated policewoman, and fucked her and changed her until she had a big, dripping cock, until her tits were so large they can barely fit in her uniform when she can be bothered to wear it, until all she wants to do is lie back on the ground and cover herself with cum again and again so that she can get to lick it all up. And she’s so happy with the results that she’ll eagerly service you in whatever way you ask every time you ask because it’s the only way she can think of to say thank you. Although, to be fair, that’s also how she says ‘hello’ now.");
	output("\n\nYou corrupted her. You fixed her. You made her yours. And she’ll beg you to use her every bit as much as you could possibly want to, because you made her need it too. You can see why Dr Badger went full mad scientist over this.");
	//IF PC IS A BIMBO
	if(pc.isBimbo()) 
	{
		output(" You took this stuffy, angry cop and showed her how <i>good</i> it feels to be a slut. You showed her that her tits should be big, and always out and ready to receive the fresh blast of cum that’s your reward for being a good bimbo. You showed her how good it is to have her very own cock, so she can always have her lips wrapped around one and fresh cum to drink, even when she’s by herself. You showed her that it doesn’t matter if she constantly has to fall to all fours, even when she’s trying to get work done or trying to go somewhere or talk to someone or something, because she’s just hit with that <i>need</i> and she has to at <i>least</i> jerk herself off, making a nice fresh puddle of cum for her to push her muzzle into and lap up - that’s fine, that’s what she <i>should</i> be doing, because she’s a nice eager bimbo cumslut, and what could be more important than that?");
		output("\n\nYou showed her how good being a bimbo is. You spread your gift to her. Maybe you can spread it more. Maybe you’ll spread it to everyone. Maybe you can make everyone a nice, happy, slutty bimbo, just like you and Penny, make this whole sector big tits, swinging cocks and dripping cum. And you right at the front of all of it, fucking and being fucked, spreading the bimbo gospel to every new recruit you fill with your cum.");
		output("\n\nWow, you think suddenly, so <i>that’s</i> what Dr Badger is all about. She really <i>is</i> smart.");
	}
	output("\n\nWith all of that going through your head, and with Penny doing such good work on you, it isn’t long before you finally orgasm. You grab her close, ");
	if(pc.hasCock())
	{
		output("pumping blast after blast of [pc.cum] down her throat.");
	}
	else if(pc.hasVagina()) output("pressing her muzzle as deep into yourself as possible before coating her tongue with a wave of your [pc.girlCum].");
	else output("shuddering with bliss as she sends you tumbling into eager, trembling climax.");
	//IF PC HAS MULTIPLE COCKS
	if(pc.cockTotal() > 1)
	{
		output(" Your unnattended cock");
		if(pc.cockTotal() > 2) output("s also fire");
		else output("also fires off");
		output(" off, sending long slick waves of [pc.cumColor] cum sliding down her fur.");
	}
	output(" She cums too, so blissfully happy to have successfully been of service, her thick cock spurting again and again down beneath the desk");
	if(hours >= 17 || hours < 8) output(" - straight into Flahne’s welcoming mouth");
	output(".");
	output("\n\nEventually you push Penny back, and she licks her lips happily to savor the last of your flavor as you pull apart.");
	if(hours >= 8 && hours < 17) 
	{
		output(" She smiles at you, but a blush starts to rise in her cheeks, followed by an increasingly distracted look. Before you can ask her what’s wrong she blurts out <i>“sorry, I-!”</i> and dives down at of view.");
		output("\n\nYou’re confused for a second, but then you hear the sound of her snuffling frenziedly beneath her desk, clearly tracking down all the cum she just spent and licking it up. Eventually she rises back up, the tip of her muzzle stubbornly painted white even as her tongue wraps around her nose again and again to try and clean it all off.");
		output("\n\n<i>“Sorry”</i>, she says softly once she’s finally free to talk again. <i>“I just couldn’t like, sit here while I knew there was such a delicious treat just waiting for me.”</i> She nuzzles up close, snuggling up against your body lovingly. <i>“Plus, it always just tastes better when it’s from something I did with you.”</i>");
	}
	output("\n\n<i>“Thanks [pc.name]!”</i> she says perkily, straightening back up as you get off her desk, <i>“I </i>super<i> needed that.”</i>. She bites her lip, pouting a little bit as she adds. <i>“Let- let me know if you want to do anything else, please? I could always go for another round...”</i>");
	processTime(33);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//CUM BATH
public function givePennyACumBath():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("Looking down at Penny, so cute and pent-up, gives you an idea. <i>“Come with me”</i>, you say simply, grabbing her by the arm and pulling her away from her desk.");
	output("\n\nShe looks confused, but follows along obediently, only stopping for a second to flick a button that sets turns on an <i>“Out”</i> sign outside and locks the front door. Then with a light-hearted giggle she happily lets you pull her away. To her surprise, you lead her not to a bed, but to a large, empty bath.");
	output("\n\n<i>“Oh! Do you want to like... fuck in the bath? Or take a bath together?”</i>");
	if(pc.isBimbo()) output("\n\n<i>“Both!”</i>");
	else output("<i>“Something like that...”</i>");
	output(", you answer, leaning down to turn off the drain in the bath and then turning towards her. She’s already naked from the waist down - ");
	if(pc.isBimbo()) output("because why wouldn’t she be?");
	else output("putting a desk between her and anyone else coming in to see her being about as much as she can manage for modesty");
	output(" - so it’s a simple matter for you to grab her cock and start sliding your hand back and forth along the length of it.");
	output("\n\n<i>“A-ahmm! Oh " + pc.mf("Mister","Miss") + " Steele!”</i> she gasps, trembling as her eager balls can’t help but give off a quick spurt of cum. <i>“That’s... ah! Oh... ohhhhhh...”</i>");
	output("\n\nYou settle into a steady rhythm, smiling at the way she can’t help but bite her lip as you wring more and more cum out of her cock, aiming it all into the bath.");
	if(pc.isBimbo()) output("\n\n<i>“You’ve got like, </i>so<i> much cum”</i>, you say while you work happily, <i>“it’s like - I couldn’t let it go to waste! So I thought, how could I get the absolute </i>most<i> cum to play with all at once? And then, ta-da! Cum bath! Am I a genius or what?</i>");
	else output("<i>“I was just thinking...”</i>, you tease her softly, even as you keep working her over unstoppably, <i>“I made it so you make all this cum, so should I get to enjoy it all too? So, here we are...”</i>");
	output("\n\nHer hands grip at the edge of the bath, and you can see know that she knows what’s going on she’s clearly getting into it. <i>“Ohhh! Yes, [pc.name], use me... uhnnn! Use me like your - uhrnmmm! - nice little cum slut!”</i>");
	output("\n\n<i>“That’s right girl”</i>, you say, <i>“you’re made to be used for cum, aren’t you?”</i>");
	output("\n\n<i>“Yes! Yes! Yes!</i>, she pants desperately, each short happy bark accompanied by another thick blast of cum into the tub. <i>“Yesss I’m your... little! Fox! Cum! Slut!”</i>");
	output("\n\nYou lean back, and the second you move your hands she takes their place, wrapping one of her paws around her slick shaft and pumping away while her other one slips into her pussy to try and make sure she wrings out every bit of pleasure she is capable of.");
	output("\n\nHer efforts have paid off, and by now even though it hasn’t been that long the bath is already around a quarter full. Of course, that’s not <i>nearly</i> enough. Stroking her hair softly, you lean in and whisper right in her cute fluffy ears, <i>“that’s right girl. Doesn’t it feel so </i>good<i> to let yourself be what you should be?”</i>");
	output("\n\nBy now Penny can barely talk. Her tongue is hanging out of her muzzle, and something between a low growl and a needy whine is rising in her throat, but it’s all mixed together with a constant, panting chant of just <i>“cum! Cum! Cum! Cum!”</i>");
	output("\n\nYou let this go on for a few moments, stroking her tenderly as she works herself over and fills up the tub. Despite the pretty constant stream of cum pouring out of her, her expression makes it look like she’s edging - clearly enjoying herself, but just on the edge of something so much more.");
	output("\n\nLooking down, you see the bath is now about half full. <i>“What are you for?</i>, you ask her simply.");
	output("\n\n<i>“Cum! Cum! Cum!”</i> she answers instantly.");
	output("\n\n<i>“And what do you </i>need<i>?”</i>");
	output("\n\nShe’s barely able to respond. Thick strands of drool run down from her lips, and her eyes are wide as she stares with naked desire at the pool in front of her. <i>“C-cum! Cu-uummm! CUM!”</i>");
	output("\n\nMoving around behind her, you give her fluffy tail a quick swipe, smiling as you see that even now that still stops her in her tracks. Taking advantage of her brief pause, you put one hand squarely on her back and say, <i>“then go get it”</i>. Then you push.");
	output("\n\nShe falls forwards eagerly, bringing up her arms enough to break her fall but not enough to keep her from sliding beneath the surface of all her wonderful cum. As soon as she hits the bottom of the bath she flips over, lying on her back so that she can keep jerking herself off, her cock still standing stiffly out above her. She barely needs to touch it to bring herself to a final, climactic orgasm, clearly just the feel and the scent of being so completely soaked in her own liquid slickness is enough to make her cum like some sort of perverted fountain. She quickly adds so much more that she’s soon in danger of ");
	if(pc.isBimbo()) output("going like, underwater, but with cum");
	else output("submerging herself completely");
	output(", but she just manages to keep up by hurriedly lapping up as much cum as she can.");
	output("\n\nIt takes a while, but eventually her needful thrusts and arching jets of white cum die down enough that she can stop focussing her tongue on licking up as much cum as possible, at least for long enough to say quickly <i>“care to join me then, [pc.name]?”</i>");
	processTime(33);
	//Add Buttons
	//[Yes][No]
	clearMenu();
	addButton(0,"Yes",cumBathWithYourCumSlut);
	addButton(1,"No",dontJoinPennyForACumBath);
}

//YES
public function cumBathWithYourCumSlut():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("You strip down and slide into the bath happily, and Penny moves around to the side to give you room. Pretty quickly she’s on top of you, letting you sink down into the warm, slick cum she’s so thoughtfully provided, while she straddles you with a grin.");
	output("\n\nYou think she’s about to say something, but instead she just leans forwards, licking her long wet tongue all the way along your chest. You’re not sure if it’s for your benefit or if it’s just because now you’re coated with the cum that she craves, and maybe she isn’t either, but it still results in a definitely good time. She giggles as you grab her around the waist, but she’s so focussed you decide to just leave it at that. Just you and her, enjoying this nice warm bath, while she so eagerly and dedicatedly slides her tongue over every single part of you. It’s surprisingly relaxing.");
	output("\n\nYou only realize you drifted off after you wake up. Penny’s asleep too, all curled up and cute on top of you. Eventually you realize - you don’t feel that wet anymore. You were expecting to feel at least sticky still, but... it really does seem like she managed to get all of it. Damn. She is definitely good at what she does, thanks to you.");
	output("\n\nIt’s almost a shame to wake her, but you have places to be and new worlds to discover. She gives you one last kiss as you get up, her tongue still slick with the last of the cum, and then settles back down at her desk with a sigh as you get ready to leave.");
	processTime(75);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//NO
public function dontJoinPennyForACumBath():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("Penny does her best to make it look inviting, but you decide to leave her to it. You have places to be and new worlds to discover, and it’s <i>probably</i> not the best idea to try and do all that while dripping with sex fluids. You make your excuses, and while she looks disappointed, she’s too excited by being covered in cum to be sad for long. You slip outside, followed by some very eager and happy noises as Penny gets back to having fun.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//PLAY WITH FLAHNE
public function playWithFlahne():void
{
	clearOutput();
	showPenny();
	abeAuthor();
	output("Looking down under Penny’s desk, you see Flahne sitting back happily, sucking on Penny’s cock as it sends a slow, constant stream of whiteness down her throat.");
	output("\n\n<i>“Having fun, are you?”</i> you ask innocently.");
	output("\n\nFlahne takes a moment to reply, having to slowly pull herself away from Penny’s cock first. <i>“Y... yeah”</i>, she mumbles. She seems... not quite drunk, but sort of like, blissed out - like she’s so deep in the pleasure of what she’s doing that she’s having trouble focussing on anything else. <i>“Iss good.”</i>");
	output("\n\nBefore you can say anything further, Penny interrupts with a giggle. She’s snuck one of her paws down to her cock and quickly rocks her hips forwards, and a sudden blast of cum catches Flahne full in the face. <i>“Oops!”</i> Penny teases, <i>“silly me!”</i>");
	output("\n\nFlahne doesn’t bother to even act upset, instead just leaning back with a smile and licking up the cum that coats her slick flesh. Even after she clears most of it up her face still seems slightly whiter than before - clearly, Penny is giving her body too much to absorb normally.");
	output("\n\nThinking about that gives you an idea. <i>“Hey, come up here for a minute”</i>, you tell her, leaning down to help pull her up. Penny pouts as her favorite toy is taken away, but doesn’t stop you from picking Flahne up and leaning her against the desk so she’s steady enough to stand. Then, while she’s smiling blissfully at you and waiting whatever comes next, you lean in, wrapping her up in a passionate kiss.");
	output("\n\nShe responds immediately, her tongue sliding inside your mouth as the two of you press together tightly. Eventually you pull back, licking your lips as you consider things briefly.");
	output("\n\n<i>“Yep”</i>, you announce after a few seconds, <i>“tastes like cum.”</i>");
	output("\n\nPenny looks shocked, her ears standing straight up from her head in surprise. <i>“What?</i>, she gasps, but before you can answer she lunges forwards, grabbing Flahne out of your arms and pulling her down into her lap. Flahne purses her lips, clearly expecting another kiss, but Penny has something else in mind, and starts simply licking her, sending her long canine tongue sliding all the way along Flahne’s goopy white flesh from the bottom of her chin to the top of her head.");
	output("\n\n<i>“You’re right!”</i> Penny says between licks, <i>“she’s like cum but like... different? Like, less wet... but more sweet?”</i>");
	output("\n\nThat sounds about right. Somewhere between all the sweetness Flahne loves and the natural texture of her body, kissing her tasted like if someone had for some reason made an icecream out of cum.");
	output("\n\nClearly it’s a flavor that Penny is enjoying, given that she’s now furiously licking over every part of Flahne’s dripping white body that she can reach, while holding her so tightly that her claws are sinking ever so slightly into the goopy flesh of her butt. Fortunately Flahne seems to be enjoying it, leaning in happily and relaxing under the attention of Penny’s eager tongue. She doesn’t seem to be being hurt by any of it either - Penny’s claws clearly aren’t enough to cause the goo girl any problems, and no matter how hard she licks Penny is only tasting Flahne’s wet skin rather than actually consuming her at all.");
	output("\n\nYou stand back and let them enjoy themselves for a few moments, happy to have taught both of them a new trick, but soon you decide that you want to do more than just watch. Reaching out you grab Flahne, pulling her up with enough force that eventually Penny gets the point and lets her go. You don’t pull her away entirely though, instead just raising her up enough that she’s standing bent over just in front of Penny’s legs, then spinning her around so she’s facing towards you. Then, leaning around Flahne to make eye contact with Penny, you say <i>“let’s give her a nice fresh filling then, shall we?”</i>");
	output("\n\nPenny looks confused for a moment, but soon her cock rises back up into her view, and looking between that and Flahne’s dripping wet pussy you’re putting on display in front of her is enough to kick her mind into gear. <i>“Oh!”</i> she answers with a happy giggle, then reaches forwards and takes Flahne from your arms, guiding her down lovingly onto her cock.");
	output("\n\nShe takes the entire length with little more than a blissful shudder, the smile wide on her face as Penny fills her utterly. Penny also seems to be enjoying herself, her giggle dying off into a low growl as she starts rocking her hips powerfully back forth, making Flahne gasp at the intense pleasure. Taking that as your cue you lean in, wrapping Flahne up in another passionate kiss even as Penny pistons into her from below.");
	output("\n\nYou can feel Penny’s movements through Flahne’s body, and pretty soon you can even feel the growing, urgent pulse as Penny once again starts to fill her goopy body up with cum. You hold Flahne tight, riding with her over every bump and thrust of the climax she’s surfing, but all the while savoring the sweet but salty taste clinging to every drop of her body. And then, suddenly, there’s some tipping point, Flahne’s whole body tenses up, and then there’s just - release.");
	output("\n\nYou don’t know if it’s because Flahne’s saliva has been so soaked with cum, or even if somehow her body is fluid enough to allow Penny to simply shoot her load straight up through her if she’s already so full, but whatever the reason you suddenly find your own mouth flooding with thick, creamy cum. Flahne’s tongue is sliding thickly between your lips, almost the same texture and definitely the same taste, swiping slickly around inside you as the stream of cum pours down your throat. It tastes amazing, but more than that, it feels so wonderfully perverted; the fact that this sweet little goo girl has been fucked so hard - by the girl that <i>you</i> turned into an eager, big-cocked bimbo - that now it’s like she’s almost made of cum, and absolutely loving every second of it. You made Penny the perfect cumslut, and then you made her so potent that she converted someone else into a dripping monument to sex without even realizing it. And now, as the three of you hold each other tight, you’re all able to let go and enjoy what that truly means, Penny’s over-productive balls pumping an endless stream of cum straight into Flahne’s eager pussy, while in turn a flood of her freshly-sweetened cum floods into your mouth.");
	output("\n\nIt’s you that breaks contact first. Penny and Flahne both seem completely willing to keep going, but before long your pesky need to breathe forces you to pull away. Flahne still seems lost in bliss as you part, thick strands of cum still connecting the two of you until you stand back up fully, but Penny has by now recovered herself enough that she’s watching your contended expression with a happy grin of her own - even though she’s still fucking Flahne steadily all the while.");
	output("\n\n<i>“Wow [pc.name]”</i>, she says eventually, <i>“you have like, the </i>best<i> ideas.”</i>");
	output("\n\nYou smile in response as you stand back up and put yourself back together, leaving Flahne to sink slowly back down beneath the table as Penny settles back down to her earlier position.");
	output("\n\nWinking as you turn and leave, you say simply, <i>“have fun!”</i>");

	processTime(25);
	pc.lust(10);
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
		output("<i>“Yo, Doc”</i>, you say casually, making the large mustelid woman look up as you walk over. <i>“I’ve taken care of that, ‘Penny Problem’ you told me about.”</i>");
		output("\n\nShe grins. <i>“And? How is the patient doing?”</i>");
		output("\n\n<i>“Pretty well”</i>, you answer. <i>“Definitely happy, definitely cumming a lot.”</i> You pause and think for a moment before you continue. <i>“Cumming really, really a lot, actually. More than I would have thought physically possible, really.”</i>");
		output("\n\nIf Dr Badger is surprised by this, she doesn’t show it. Instead she strikes a pose, a nearby piece of exposed machinery sparking dramatically as she says triumphantly, <i>“Another success for science! Take that, enemies of progress! And fucking! And progress in fucking!”</i>");
		output("\n\nEventually she notices your bemused look, and with a sigh turns off the machine behind her and settling back down. <i>“What? You have to have </i>fun<i>, or what’s the point? I’d hope you did the same with the new and improved Penny, after all.”</i>");
		output("\n\nYou cough discretely, changing the subject. <i>“What I was wanting to ask was - she seemed like she was going to </i>keep<i> cumming. Like, pretty much permanently.”</i>");
		output("\n\nDr Badger merely nods in response, forcing you to prompt for more with a shrug. <i>“How, exactly, is that something that’s happening? Without her just... dying of dehydration?”</i>");
		output("\n\n<i>“Oh!”</i> she answers with a laugh. <i>“I forgot, you wouldn’t have seen one of my ‘premium edition’ bimbos before. Well, it’s all very complicated - quantum, and all that - but the short version is, there are an infinite number of Penny’s across the multiverse, and the energy from my raygun melded our version with some of them in some very specific ways.”</i>");
		if(pc.intelligence() < 15) output("\n\nThat all goes completely over your head. <i>“Huh?</i>, you say simply.”</i>");
		else output("\n\n<i>“Okay”</i>, you say, <i>“but that doesn’t really answer the question of how she’s able to keep orgasming forever.”</i>");
		output("\n\n<i>“The point is”</i>, Dr Badger continues, <i>“that our Penny is now, entirely without thinking about it, constantly drawing energy from her alternate versions across the multiverse. So there’s a few thousand alternate universe Penny’s out there who are finding themselves a tiny, tiny amount hungrier every day than they were before, never realizing in the slightest what they’re contributing to.”</i>");
		output("\n\nYou pause for a moment as that sinks in. <i>“Wait, you have the ability to draw power from infinite other </i>universes<i>, and you use it to make people cum a bunch?”</i>");
		output("\n\n<i>“I know, pretty great, right?”</i> Dr Badger dusts her fist against her chest with a smug grin. <i>“All those small-minded scientists back in the Confederacy were like, ‘we should use this technology for engines or weapons!’, but I always thought - what’s the point of going places or fighting people if you can’t fuck the </i>most<i> when you’re done?”</i>");
		output("\n\nShe stops talking briefly, her eyes drifting down to one of the complicated-looking pistols lying on the workbench next to her. <i>“Not that I didn’t use some of it for weaponry in the end, as the people they sent after me soon found out. But it’s not exactly easy to set up a link like that, which is why I’m not just flying around the galaxy shooting everything with a bimbo beam.”</i> She grins, adding, <i>“yet.”</i>");
		output("\n\nSomething occurs to you. <i>“Wait, if it’s not easy to do, why did you just give me the gun to use on Penny? Couldn’t you have just injected her with something instead?”</i>");
		output("\n\n<i>“Oh, sure”</i>, she concedes, <i>“but even though I needed her out of the way so that I wasn’t going to be at risk of being shut down, I didn’t have anything against her </i>personally<i>. Besides, while calibrating the gun I found that something like 9 out of 10 Pennys in the multiverse have a massive cock, and that’s something I can respect in a woman. So I decided that if I was going to get her out of the way, well, it might as well be from giving her the best possible upgrade.”</i>");
		output("\n\nHuh. That makes... sense? As much as any of this makes sense, anyway. Still, the point remains that you did a job that you were promised a reward for, and the good doctor hasn’t yet paid up. You cough meaningfully. <i>“Well, all’s well that ends well, so now, about my payment...”</i>");
		output("\n\nDr Badger looks up at you, and for a genuine second you think she’s going to do something stupid and fight you over it or something, but instead she smiles earnestly. <i>“Of course. You did a good job, helped me out and advanced the cause of science in the frontier to no end. Here.”</i>");
		output("\n\n<b>She hands you a credit chit worth 3,000 credits. Nice!</b>");
		output("\n\nAt the same time she takes the bimbo raygun she gave you, presumably so she can either recharge it for next time or break it down again for parts.");
		output("\n\n<i>“I hear that Penny had a side trade going in dealing the drug Throbb too,”</i> she says. Seeing your surprised look, she adds with a shrug, <i>“I’m sure she was probably being secretive about it, but it’s surprising the amount of information you can pick up about someone when you’re scanning through all the multiverse versions of them. Nine out of ten Penny’s can’t be wrong, can they? We aren't so different, her and I.”</i>");
		output("\n\nYou turn to leave, but as you do Dr Badger calls out one last time behind you.");
		output("\n\n<i>“Oh, and I’ll let you know if any other work comes up. I’m sure I’ll have some... interesting things you can do in the future.</i>}");
	}
	//IF PC WAS BIMBO-IFIED BY DR BADGER
	else
	{
		output("<i>“Hey there!”</i> you call out happily as you make your way over to Dr Badger. <i>“I took care of that job thingy you wanted!”</i>");
		output("\n\nShe looks up as you approach.");
		//IF PC HAS LOST THEIR BADGER FORM = 
		if(!pcHasBadgerForm()) 
		{
			output(" When she sees you she rolls her eyes, sighing <i>“Oh dear, it looks like you’ve gone and gotten yourself turned around, haven’t you?”</i>");
			output("\n\nYou stop, confused. <i>“Huh?”</i> By the time you look back up from looking around trying to see what the problem is she’s already like, right there, right up next to you.");
			output("\n\n<i>“There there”</i>, she teases, <i>“I know it can be hard out there in the </i>big bad<i> galaxy to avoid all the nasty aliens that want to turn you into whatever they want, but do </i>try<i> to keep yourself in shape when you’re talking to me, hmm? It is </i>my<i> shape, after all.”</i>");
			output("\n\nWith no more warning than that you feel the sharp sting of a needle being pressed into your skin, and then a warm, tingling sensation spreading out inside your flesh. The change that follows comes quickly, especially given how you lean into it, knowing how much it means to the doctor. In moments you’re staring up at her lovingly along your badger snout once again, shivering as she strokes your black and white fur, and with your cock stiffening in anticipation over your dripping wet slit. <b>You are back to being the same badger form as you were after first meeting Dr Badger!</b>");
			output("\n\n<i>“Now that that’s taken care of, we can get on with things.”</i>");
			resetDrBadgerBimboTF();
		}
		output(" The Doctor grins in approval at what she sees, then asks, <i>“So, how did it go?”</i>");
		output("\n\n<i>“Oh wow”</i>, you answer eagerly, <i>“like, so good. </i>So<i> good. She like, </i>super<i> enjoyed it. We, uh, both did.”</i>");
		output("\n\n<i>“Good for you!</i>, Dr Badger says, giving you a nice little pat on the head. <i>“Glad to see you’re enjoying the benefit package I provide.”</i>");
		output("\n\n<i>“Yeah! And did you know that she now like, cums all the time? Like, </i>all<i> the time. It’s amazing!”</i>");
		output("\n\nDr Badger laughs. You’re not sure why she’s laughing exactly, but that doesn’t stop your tail wagging happily behind you because of it. <i>“Of course she does silly. I gave her the premium package. That way she’s much more likely to not have the time or willpower to get in my way. Plus, I’m nothing if not a </i>benevolent<i> mad scientist.”</i>");
		output("\n\nYou nod, not really getting what she’s saying, but happy to agree anyway. <i>“But won’t she like, run out of cum at some point? I mean, I can cum a <i>lot</i>, but even I have to stop and lie down eventually.”</i>");
		output("\n\nHonestly, you don’t really care about the question, but something tells you that Dr Badger really wants to talk about how smart she is for solving this problem, and you figure that if she wants to talk about it then who are you to <i>not</i> ask? When she does answer though, it’s a long and detailed thing, filled with important-sounding words like ‘quantum’, ‘multiverse’, and ‘duplicate’. Something about Penny feeding energy off of like, other Penny’s? Sure?");
		output("\n\nWhen Dr Badger finally stops talking, you nod and smile happily. <i>“Wow! That’s really smart!”</i>");
		output("\n\nShe pats you on the head again, saying nicely <i>“Aww, aren’t you sweet. Now, I think you’re due a reward...”</i>");
		output("\n\nAs quick as you can you fall down to your knees, nuzzling your snout along Dr Badger’s cock. It’s still covered up in its cute little sleeve thingy, but you’re pleased to see it start to get hard at your attention. Above you, Dr Badger laughs. <i>“I was actually going to </i>pay<i> you, you know.”</i>");
		output("\n\n<i>“That’s good too”</i>, you say as you rub your muzzle against her crotch, <i>“but like, all this talk about cum, and I just... I really want to suck your cock, and, well, I </i>have<i> been good, haven’t I</i>?”</i>");
		output("\n\nShe nods, and with a thrill you feel her hands sliding downwards to grab the back of your head. <i>“You have been good”</i>, she answers, and then suddenly she’s taken the cover off her cock and the smell just <i>hits</i> you and it’s not like the smell is like, good, but it’s just that it means that she’s close and it’s close and your tongue slides out and you can taste it it’s there you’re being allowed to just sink into it and it feels so, so good...");
		output("\n\nFor a long time she lets you just do what you want, doing nothing more than curling her claws through your hair as you lick all over her cock again and again, completely lost in how good it tastes and how <i>good</i> it is to just be allowed to worship at it. Soon it gets all slick and sticky, from both your spit and Dr Badger’s pre-cum, and then you just can’t hold yourself back.");
		output("\n\n<i>“Please”</i>, you whimper as loudly as you can from around it, <i>“please, let me suck your cock. Please fuck my mouth, I want to drink your cum a-”</i>");
		output("\n\nBefore you get any further than that she agrees to your request, gripping your head tight as she presses her cock between your nice, plump lips. It’s bliss, it’s perfect, it’s what you’re <i>for</i>, getting fucked and used and taken like this, being allowed to use your lovely bimbo lips to service a nice thick cock, and <i>especially</i> the one of the person that gave your lovely bimbo look in the first place. Your eyes roll back in your head as she fills you up, your badger muzzle seemingly just the right size to fit her wonderful cock. Soon she starts thrusting faster and faster, and you can’t help but move one of your paws down to your own cock to tease yourself in time with her rhythm. You can’t help it, it all feels so good, you <i>need</i> to feel it more, just as you need to have her fill you with cum. Thankfully, she doesn’t make you wait long.");
		output("\n\nWith one last powerful thrust she presses into you, her cock twitching as it spurts blast after blast of hot sticky cum straight down your throat. You can’t really taste it back there, but that’s not the point, the point is how <i>good</i> it feels to have her filling you up like this, to feel that sloshing liquid pour down your throat as you pull her close, to feel it pooling deep down inside you even as your own hips jerk and your own cock starts cumming too.");
		output("\n\nEventually, after a good, long filling, Dr Badger pulls herself out. You get one final taste of her cum-coated cock as it slides out of your lips, making you lick at it eagerly in order to lap up as much of it as possible. <i>“Good girl”</i>, she says softly, giving you one last pat on the head which makes your tail wiggle happily once again. Suddenly that pat turns into a push, and you’re confused until she adds <i>“now, clean up your mess...”</i>");
		output("\n\nOh! You hadn’t even been thinking about that, but you <i>have</i> left quite a puddle on the floor beneath you. You let yourself be pushed down obediently, lapping up your sticky cum eagerly.");
		output("\n\nWhile you work, Dr Badger puts the cover back on her cock, then leans down to take something off your belt. <i>“I’ll take back my raygun now that you’re done with it, so I can get it ready for next time. But because you’re being so good, I’ll let you have both the reward you just got <i>and</i> a nice little bit of money. Aren’t you lucky?”</i>");
		output("\n\nYou feel her take the gun-thing off you, and slide a credit chit back in its place. Wow!");
		output("\n\n<i>“By the way, I found out that Penny had a side business selling Throbb, and she’s probably going to be a bit too distracted now to keep that up. We're not so different, her and I, so if you ever need something to give you an even <i>bigger</i> cock, well, you know who to come to...”</i>");
		output("\n\nEventually you finish up, and with a pat on the butt Dr Badger lets you know that you’re done here. You start to head out, but as you go she calls out one last thing.");
		output("\n\n<i>“Oh, and I’ll let you know if I have any more work for you. You did such a good job, I’m sure I’ll have some... interesting things for you in the future.</i>");
		pc.loadInMouth(pc);
		pc.loadInMouth(chars["DRBADGER"]);
	}
	processTime(25);
	pc.credits += 3000;
	pc.removeKeyItem("Doctor Badger's Bimbo Raygun - Programmed for use on Penny.");
	//[Take from player quest item <i>“Bimbo Raygun”</i>. Give player 3,000 credits.]
	//[Add Buy Throbb button when using Dr Badger as a store]		
	flags["BADGER_QUEST"] = 3;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

